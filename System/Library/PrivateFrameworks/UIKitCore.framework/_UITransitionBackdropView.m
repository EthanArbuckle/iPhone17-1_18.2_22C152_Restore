@interface _UITransitionBackdropView
+ (Class)layerClass;
- (_TtC5UIKitP33_F084B5C1489DDF8EC47531A7840D5DBB25_UITransitionBackdropView)initWithCoder:(id)a3;
- (_TtC5UIKitP33_F084B5C1489DDF8EC47531A7840D5DBB25_UITransitionBackdropView)initWithFrame:(CGRect)a3;
@end

@implementation _UITransitionBackdropView

+ (Class)layerClass
{
  sub_1853B985C(0, &qword_1E8FB5698);
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC5UIKitP33_F084B5C1489DDF8EC47531A7840D5DBB25_UITransitionBackdropView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for _UITransitionBackdropView();
  return -[UIView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC5UIKitP33_F084B5C1489DDF8EC47531A7840D5DBB25_UITransitionBackdropView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for _UITransitionBackdropView();
  return [(UIView *)&v5 initWithCoder:a3];
}

@end