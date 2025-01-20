@interface TVButtonImageContentView
- (_TtC9SeymourUI24TVButtonImageContentView)initWithCoder:(id)a3;
- (_TtC9SeymourUI24TVButtonImageContentView)initWithFrame:(CGRect)a3;
@end

@implementation TVButtonImageContentView

- (_TtC9SeymourUI24TVButtonImageContentView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_239F5D86C();
}

- (_TtC9SeymourUI24TVButtonImageContentView)initWithFrame:(CGRect)a3
{
  result = (_TtC9SeymourUI24TVButtonImageContentView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI24TVButtonImageContentView_focusedTintColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI24TVButtonImageContentView_unfocusedTintColor));
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI24TVButtonImageContentView_imageView);
}

@end