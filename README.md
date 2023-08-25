# Splitter view plugin

A split view in dart.

## Usage
To use this plugin, add splitview_pxq as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).

## Example
See /example/lib/main.dart

```dart
SplitViewPXQ(
  spliter: Container(color: Colors.pink,), // touchable separator
  direction: SplitViewDirection.horizontal, // children split view direction
  spliterSize: 20, // size of separator
  spliterOverlapSplitView: true, // separator will be overlap on next child
  size: [200, 200, 0], //size of children, last size will be never used
  children:[
    Container(color: Colors.orangeAccent,),
    Container(color: Colors.yellow,),
  ],
),
```