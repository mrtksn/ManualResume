// The Swift Programming Language
// https://docs.swift.org/swift-book

//
//  ManualResume.swift
//  QuitKit
//
//  Created by Mertol on 30/01/2024.
//

import Foundation

public enum ManualResumeError: Error {
    case cancelled
}

public class ManualResume {
    public static let shared = ManualResume()
    private init() {}

    private var continuations: [String: [CheckedContinuation<Void, Error>]] = [:]
    private let lock = NSLock()

    public func isReady(_ tag: String) async throws {
        try await withCheckedThrowingContinuation { continuation in
            lock.lock()
            continuations[tag, default: []].append(continuation)
            lock.unlock()
        }
    }

    public func resume(_ tag: String) {
        resumeContinuations(tag: tag, with: nil)
    }

    public func cancel(_ tag: String) {
        resumeContinuations(tag: tag, with: ManualResumeError.cancelled)
    }

    private func resumeContinuations(tag: String, with error: Error?) {
        lock.lock()
        let tagContinuations = continuations.removeValue(forKey: tag) ?? []
        lock.unlock()

        for continuation in tagContinuations {
            if let error = error {
                continuation.resume(throwing: error)
            } else {
                continuation.resume()
            }
        }
    }
}

