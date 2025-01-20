@interface TVButtonTextContentView
- (_TtC9SeymourUI23TVButtonTextContentView)initWithCoder:(id)a3;
- (_TtC9SeymourUI23TVButtonTextContentView)initWithFrame:(CGRect)a3;
@end

@implementation TVButtonTextContentView

- (_TtC9SeymourUI23TVButtonTextContentView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A212DD4();
}

- (_TtC9SeymourUI23TVButtonTextContentView)initWithFrame:(CGRect)a3
{
  result = (_TtC9SeymourUI23TVButtonTextContentView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23TVButtonTextContentView_focusedTextColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23TVButtonTextContentView_unfocusedTextColor));
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI23TVButtonTextContentView_titleLabel);
}

@end