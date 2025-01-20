@interface BackdropView
+ (Class)layerClass;
- (_TtC20SystemUIAnimationKit12BackdropView)initWithCoder:(id)a3;
- (_TtC20SystemUIAnimationKit12BackdropView)initWithFrame:(CGRect)a3;
@end

@implementation BackdropView

+ (Class)layerClass
{
  sub_25E73494C();
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC20SystemUIAnimationKit12BackdropView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for BackdropView();
  return -[BackdropView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC20SystemUIAnimationKit12BackdropView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for BackdropView();
  return [(BackdropView *)&v5 initWithCoder:a3];
}

@end