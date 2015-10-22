# L.swift

Command line tool to get strong typed, autocompleted localized strings in Swift, inspired by [R.swift](https://github.com/mac-cain13/R.swift).

## Usage
After installing L.swift into your project you can use the L-struct to access localized strings. If the struct is outdated just build and L.swift will correct any missing/changed/added resources.

L.swift supports comma-separated keys.

|Key|L.swift|
|:---:|:---:|
|`"One"`|`L.one (return NSLocalizedString("One", comment: "")`|
|`"One.Two"`|`L.One.two (return NSLocalizedString("L.One.Two", comment: "")`|
|`"One.Two.Three"`|`L.One.Two.three (return NSLocalizedString("L.One.Two.Three", comment: "")`|

## Installation

### CocoaPods
1. Add `pod 'L.swift'` to your Podfile and run `pod install`
2. In XCode: Click on your project in the file list, choose your target under `TARGETS`, click the `Build Phases` tab and add a `New Run Script Phase` by clicking the little plus icon in the top left
3. Drag the new `Run Script` phase above the `Compile Sources` phase and below `Check Pods Manifest.lock`, expand it and paste the following script: ``"$PODS_ROOT/L.swift/lswift" "$SRCROOT"`
4. Build your project, in Finder you will now see a L.generated.swift in the $SRCROOT-folder, drag the L.generated.swift files into your project and uncheck Copy items if needed

## Credit
L.swift is owned and maintained by RECRUIT LIFESTYLE CO., LTD.

L.swift was originally created by [Yuki Nagai](https://github.com/uny).

## License

```
The MIT License (MIT)

Copyright (c) 2015 RECRUIT LIFESTYLE CO., LTD.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
```
