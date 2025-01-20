@interface IconButton
- (_TtC9SeymourUI10IconButton)initWithCoder:(id)a3;
- (_TtC9SeymourUI10IconButton)initWithFrame:(CGRect)a3;
- (void)updateConfiguration;
@end

@implementation IconButton

- (_TtC9SeymourUI10IconButton)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI10IconButton *)sub_23A7DEA88(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI10IconButton)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC9SeymourUI10IconButton_image) = 0;
  id v4 = a3;

  result = (_TtC9SeymourUI10IconButton *)sub_23A800DD8();
  __break(1u);
  return result;
}

- (void)updateConfiguration
{
  v2 = self;
  sub_23A7DEDAC();
}

- (void).cxx_destruct
{
}

@end