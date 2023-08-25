library splitview_pxq;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum SplitViewDirection { horizontal, vertical }

class SplitViewPXQ extends StatefulWidget {
  final SplitViewDirection direction;
  final List<double> size;
  final List<Widget> children;
  final double spliterSize;
  final bool spliterOverlapSplitView;
  final Widget spliter;

  const SplitViewPXQ({
    Key? key,
    required this.direction,
    required this.size,
    required this.children,
    required this.spliterSize,
    required this.spliterOverlapSplitView,
    required this.spliter,
  }) : super(key: key);

  @override
  State<SplitViewPXQ> createState() => _SplitViewPXQState();
}

class _SplitViewPXQState extends State<SplitViewPXQ> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    double offset = 0;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    for(var i = 0; i < (widget.children.length - widget.size.length); i++){
      widget.size.add(0);
    }

    offset = 0;
    for (var i = 0; i < widget.children.length; i++) {
      var element = widget.children[i];

      if (widget.direction == SplitViewDirection.horizontal) {
        if(i == widget.children.length - 1){
          children.add(Positioned(
            //key: UniqueKey(),
              top: 0,
              left: offset,
              width: width - offset,
              height: height,
              child: element));
          widget.size[i] = width - offset;
        } else {
          children.add(Positioned(
            //key: UniqueKey(),
              top: 0,
              left: offset,
              width: widget.size[i],
              height: height,
              child: element));
        }
        offset += widget.size[i] + (widget.spliterOverlapSplitView ? 0 : widget.spliterSize);
      } else if(widget.direction == SplitViewDirection.vertical){
        if(i == widget.children.length - 1){
          children.add(Positioned(
            //key: UniqueKey(),
              top: offset,
              left: 0,
              width: width,
              height: height - offset,
              child: element));
          widget.size[i] = height - offset;
        } else {
          children.add(Positioned(
            //key: UniqueKey(),
              top: offset,
              left: 0,
              width: width,
              height: widget.size[i],
              child: element));
        }
        offset += widget.size[i] + (widget.spliterOverlapSplitView ? 0 : widget.spliterSize);
      }
    }

    offset = 0;
    for (var i = 0; i < widget.children.length - 1; i++) {
      offset += widget.size[i];
      if (widget.direction == SplitViewDirection.horizontal) {
        children.add(Positioned(
            //key: UniqueKey(),
            top: 0,
            left: offset,
            width: widget.spliterSize,
            height: height,
            child: GestureDetector(
              onPanUpdate: (detail) {
                var preSize = widget.size[i];
                var nextSize = widget.size[i + 1];
                if(((preSize + detail.delta.dx) >= widget.spliterSize + 10) && ((nextSize - detail.delta.dx) >= widget.spliterSize + 10)){
                  setState(() {
                    widget.size[i] = preSize + detail.delta.dx;
                    widget.size[i + 1] = nextSize - detail.delta.dx;
                  });
                }
              },
              child: widget.spliter,
            )));
      } else {
        children.add(Positioned(
            //key: UniqueKey(),
            top: offset,
            left: 0,
            width: width,
            height: widget.spliterSize,
            child: GestureDetector(
              onPanUpdate: (detail) {
                var preSize = widget.size[i];
                var nextSize = widget.size[i + 1];
                if(((preSize + detail.delta.dy) >= widget.spliterSize + 10) && ((nextSize - detail.delta.dy) >= widget.spliterSize + 10)){
                  setState(() {
                    widget.size[i] = preSize + detail.delta.dy;
                    widget.size[i + 1] = nextSize - detail.delta.dy;
                  });
                }
              },
              child: widget.spliter,
            )));
      }
      offset += widget.spliterOverlapSplitView ? 0 : widget.spliterSize;
    }

    var stack = Stack(
      children: children,
    );

    return stack;
  }
}
