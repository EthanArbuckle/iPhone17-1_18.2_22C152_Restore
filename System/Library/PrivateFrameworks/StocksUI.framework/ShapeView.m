@interface ShapeView
+ (Class)layerClass;
- (_TtC8StocksUI9ShapeView)initWithCoder:(id)a3;
- (_TtC8StocksUI9ShapeView)initWithFrame:(CGRect)a3;
@end

@implementation ShapeView

+ (Class)layerClass
{
  sub_20A6AE774();

  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC8StocksUI9ShapeView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v13.receiver = self;
  v13.super_class = (Class)swift_getObjectType();
  v7 = -[ShapeView initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  id v8 = [(ShapeView *)v7 layer];
  id v9 = objc_msgSend(self, sel_mainScreen);
  objc_msgSend(v9, sel_scale);
  double v11 = v10;

  objc_msgSend(v8, sel_setContentsScale_, v11);
  return v7;
}

- (_TtC8StocksUI9ShapeView)initWithCoder:(id)a3
{
  result = (_TtC8StocksUI9ShapeView *)sub_20A8CF520();
  __break(1u);
  return result;
}

@end