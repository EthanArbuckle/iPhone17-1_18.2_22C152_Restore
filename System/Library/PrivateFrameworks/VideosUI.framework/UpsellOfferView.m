@interface UpsellOfferView
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (CGSize)vui_sizeThatFits:(CGSize)a3;
- (_TtC8VideosUI15UpsellOfferView)initWithCoder:(id)a3;
- (_TtC8VideosUI15UpsellOfferView)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)handleGroupWatchActivityStateDidChange:(id)a3;
@end

@implementation UpsellOfferView

- (void)dealloc
{
  v2 = self;
  sub_1E30C71B8();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI15UpsellOfferView_coverArtImageView));

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI15UpsellOfferView_contextImageView));

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI15UpsellOfferView_descriptionLabel));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI15UpsellOfferView_backgroundImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI15UpsellOfferView_storedGradientLayer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI15UpsellOfferView_storedGradientView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI15UpsellOfferView_contentLogoView));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8VideosUI15UpsellOfferView_contentTextLabel);
}

- (void)handleGroupWatchActivityStateDidChange:(id)a3
{
  uint64_t v4 = sub_1E3875C38();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E3875BE8();
  v8 = self;
  sub_1E30C80CC();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (CGSize)vui_sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v5 = self;
  sub_1E30C82CC(width, height);

  double v6 = OUTLINED_FUNCTION_28_4();
  result.double height = v7;
  result.double width = v6;
  return result;
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height = a3.height;
  double width = a3.width;
  double v7 = self;
  sub_1E30C94FC(a4, width, height);

  double v8 = OUTLINED_FUNCTION_28_4();
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (_TtC8VideosUI15UpsellOfferView)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI15UpsellOfferView *)sub_1E30C9558();
}

- (_TtC8VideosUI15UpsellOfferView)initWithCoder:(id)a3
{
  return (_TtC8VideosUI15UpsellOfferView *)sub_1E30C96A8(a3);
}

@end