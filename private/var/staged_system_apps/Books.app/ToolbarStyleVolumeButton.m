@interface ToolbarStyleVolumeButton
- (_TtC5Books24ToolbarStyleVolumeButton)initWithFrame:(CGRect)a3;
@end

@implementation ToolbarStyleVolumeButton

- (_TtC5Books24ToolbarStyleVolumeButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  return -[ToolbarStyleButtonBase initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

@end