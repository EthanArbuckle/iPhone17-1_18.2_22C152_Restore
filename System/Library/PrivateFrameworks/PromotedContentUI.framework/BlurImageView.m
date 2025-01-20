@interface BlurImageView
- (_TtC17PromotedContentUI13BlurImageView)initWithCoder:(id)a3;
- (_TtC17PromotedContentUI13BlurImageView)initWithFrame:(CGRect)a3;
@end

@implementation BlurImageView

- (_TtC17PromotedContentUI13BlurImageView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC17PromotedContentUI13BlurImageView_image) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC17PromotedContentUI13BlurImageView____lazy_storage___visualEffectView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC17PromotedContentUI13BlurImageView____lazy_storage___blurImageView) = 0;
  id v4 = a3;

  result = (_TtC17PromotedContentUI13BlurImageView *)sub_1B5DBB2C8();
  __break(1u);
  return result;
}

- (_TtC17PromotedContentUI13BlurImageView)initWithFrame:(CGRect)a3
{
  result = (_TtC17PromotedContentUI13BlurImageView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17PromotedContentUI13BlurImageView____lazy_storage___visualEffectView));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC17PromotedContentUI13BlurImageView____lazy_storage___blurImageView);
}

@end