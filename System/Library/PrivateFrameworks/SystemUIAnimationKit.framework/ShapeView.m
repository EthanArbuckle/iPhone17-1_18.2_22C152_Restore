@interface ShapeView
+ (Class)layerClass;
- (_TtC20SystemUIAnimationKit9ShapeView)initWithCoder:(id)a3;
- (_TtC20SystemUIAnimationKit9ShapeView)initWithFrame:(CGRect)a3;
@end

@implementation ShapeView

+ (Class)layerClass
{
  sub_25E7317B4();
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC20SystemUIAnimationKit9ShapeView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ShapeView();
  return -[ShapeView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC20SystemUIAnimationKit9ShapeView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ShapeView();
  return [(ShapeView *)&v5 initWithCoder:a3];
}

@end