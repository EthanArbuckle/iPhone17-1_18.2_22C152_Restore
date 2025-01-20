@interface SeparatorView
- (_TtC7Measure13SeparatorView)initWithCoder:(id)a3;
- (_TtC7Measure13SeparatorView)initWithFrame:(CGRect)a3;
@end

@implementation SeparatorView

- (_TtC7Measure13SeparatorView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure13SeparatorView_targetAlpha) = (Class)0x3FF0000000000000;
  v11.receiver = self;
  v11.super_class = ObjectType;
  v9 = -[SeparatorView initWithFrame:](&v11, "initWithFrame:", x, y, width, height);
  sub_10005C0CC();

  return v9;
}

- (_TtC7Measure13SeparatorView)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure13SeparatorView_targetAlpha) = (Class)0x3FF0000000000000;
  v11.receiver = self;
  v11.super_class = ObjectType;
  id v6 = a3;
  v7 = [(SeparatorView *)&v11 initWithCoder:v6];
  v8 = v7;
  if (v7)
  {
    v9 = v7;
    sub_10005C0CC();
  }
  return v8;
}

@end