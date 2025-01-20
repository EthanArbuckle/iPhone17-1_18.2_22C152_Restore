@interface MaterialSearchTextField
- (_TtC5Music23MaterialSearchTextField)initWithCoder:(id)a3;
- (_TtC5Music23MaterialSearchTextField)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation MaterialSearchTextField

- (void)layoutSubviews
{
  v2 = self;
  sub_1003A3F3C();
}

- (_TtC5Music23MaterialSearchTextField)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v9 = (char *)self + OBJC_IVAR____TtC5Music23MaterialSearchTextField_blurEffectStyle;
  *(void *)v9 = 0;
  v9[8] = 1;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC5Music23MaterialSearchTextField____lazy_storage___blurEffectView) = 0;
  v11.receiver = self;
  v11.super_class = ObjectType;
  return -[MaterialSearchTextField initWithFrame:](&v11, "initWithFrame:", x, y, width, height);
}

- (_TtC5Music23MaterialSearchTextField)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  v6 = (char *)self + OBJC_IVAR____TtC5Music23MaterialSearchTextField_blurEffectStyle;
  *(void *)v6 = 0;
  v6[8] = 1;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC5Music23MaterialSearchTextField____lazy_storage___blurEffectView) = 0;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return [(MaterialSearchTextField *)&v8 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music23MaterialSearchTextField____lazy_storage___blurEffectView));
}

@end