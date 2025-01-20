@interface DynamicHeightImageView
- (_TtC9SeymourUI22DynamicHeightImageView)init;
- (_TtC9SeymourUI22DynamicHeightImageView)initWithCoder:(id)a3;
- (_TtC9SeymourUI22DynamicHeightImageView)initWithFrame:(CGRect)a3;
- (_TtC9SeymourUI22DynamicHeightImageView)initWithImage:(id)a3;
- (_TtC9SeymourUI22DynamicHeightImageView)initWithImage:(id)a3 highlightedImage:(id)a4;
- (void)layoutSubviews;
@end

@implementation DynamicHeightImageView

- (_TtC9SeymourUI22DynamicHeightImageView)init
{
  return -[DynamicHeightImageView initWithFrame:](self, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
}

- (_TtC9SeymourUI22DynamicHeightImageView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI22DynamicHeightImageView *)sub_23A79097C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI22DynamicHeightImageView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC9SeymourUI22DynamicHeightImageView_imageViewHeightConstraint) = 0;
  id v4 = a3;

  result = (_TtC9SeymourUI22DynamicHeightImageView *)sub_23A800DD8();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_23A790B14();
}

- (_TtC9SeymourUI22DynamicHeightImageView)initWithImage:(id)a3
{
  id v3 = a3;
  result = (_TtC9SeymourUI22DynamicHeightImageView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9SeymourUI22DynamicHeightImageView)initWithImage:(id)a3 highlightedImage:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  result = (_TtC9SeymourUI22DynamicHeightImageView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22DynamicHeightImageView_imageViewHeightConstraint));
}

@end