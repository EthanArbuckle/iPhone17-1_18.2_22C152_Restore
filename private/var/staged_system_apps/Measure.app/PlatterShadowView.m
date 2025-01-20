@interface PlatterShadowView
- (_TtC7Measure17PlatterShadowView)initWithCoder:(id)a3;
- (_TtC7Measure17PlatterShadowView)initWithFrame:(CGRect)a3;
@end

@implementation PlatterShadowView

- (_TtC7Measure17PlatterShadowView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType();
  v7 = -[PlatterShadowView initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
  sub_1000A31B4();

  return v7;
}

- (_TtC7Measure17PlatterShadowView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(PlatterShadowView *)&v5 initWithCoder:a3];
}

@end