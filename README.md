# ManualResume

A Swift package that provides a flexible way to manage manual pause and resume in asynchronous Swift code using tags. `ManualResume` allows for pausing execution until a condition is met or an operation is canceled. This is particularly useful in scenarios where asynchronous tasks need to be coordinated based on certain events or states.

**This Swift Package was entirely created on ChatGPT, including this README(except for this note).**

Here is the [full chat](https://chat.openai.com/share/4fad6533-20ce-463b-a1a6-cf0cf7ff2a0a)

## Features

- Pause and resume asynchronous execution using tags.
- Support for throwing continuations, allowing cancellation of tasks.
- Thread-safe implementation using Swift's concurrency model.

## Installation

### Swift Package Manager

You can add `ManualResume` to your project via Swift Package Manager. Add the following to your `Package.swift` file:

```swift
    dependencies: [
        .package(url: "https://github.com/mrtksn/ManualResume.git", from: "1.0.0")
    ]
```
## Usage

### Basic Usage
Import ManualResume in your Swift file.

```swift
    import ManualResume
```

Use **ManualResume.shared.isReady(_:)** to pause execution, and **ManualResume.shared.resume(_:)** to resume it:

```swift
    Task {
        await ManualResume.shared.isReady("loadingData")
        // This code will execute after 'resume("loadingData")' is called.
        print("Data loading resumed")
    }
    
    // Resume the execution
    ManualResume.shared.resume("loadingData")
```

### Cancellation
Use **ManualResume.shared.cancel(_:)** to cancel a task:

```swift
    Task {
        do {
            try await ManualResume.shared.isReady("loadingData")
            print("Data loading resumed")
        } catch {
            print("Data loading was cancelled")
        }
    }
    
    // Cancel the execution
    ManualResume.shared.cancel("loadingData")
```

## License
**ManualResume** is released under the MIT License. See the LICENSE file for more details.
