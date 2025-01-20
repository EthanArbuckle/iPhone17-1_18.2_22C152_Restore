@interface BottomPlayerViewController.RouteButtonWorkaround
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (_TtCC5Music26BottomPlayerViewController21RouteButtonWorkaround)initWithCoder:(id)a3;
- (_TtCC5Music26BottomPlayerViewController21RouteButtonWorkaround)initWithFrame:(CGRect)a3;
@end

@implementation BottomPlayerViewController.RouteButtonWorkaround

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  return swift_dynamicCastObjCClass() == 0;
}

- (_TtCC5Music26BottomPlayerViewController21RouteButtonWorkaround)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for BottomPlayerViewController.RouteButtonWorkaround();
  return -[BottomPlayerViewController.RouteButtonWorkaround initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtCC5Music26BottomPlayerViewController21RouteButtonWorkaround)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for BottomPlayerViewController.RouteButtonWorkaround();
  return [(BottomPlayerViewController.RouteButtonWorkaround *)&v5 initWithCoder:a3];
}

@end