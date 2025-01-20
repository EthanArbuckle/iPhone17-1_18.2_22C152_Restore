@interface RecommendationBannerView
- (_TtC16MusicApplicationP33_0F58D309CAC2DB05AEBCAFE562C241DB24RecommendationBannerView)initWithCoder:(id)a3;
- (_TtC16MusicApplicationP33_0F58D309CAC2DB05AEBCAFE562C241DB24RecommendationBannerView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation RecommendationBannerView

- (_TtC16MusicApplicationP33_0F58D309CAC2DB05AEBCAFE562C241DB24RecommendationBannerView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplicationP33_0F58D309CAC2DB05AEBCAFE562C241DB24RecommendationBannerView *)sub_456118(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplicationP33_0F58D309CAC2DB05AEBCAFE562C241DB24RecommendationBannerView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_45AC5C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_4570D4();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_4577FC((uint64_t)a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplicationP33_0F58D309CAC2DB05AEBCAFE562C241DB24RecommendationBannerView_lockupImageArtworkCatalog));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplicationP33_0F58D309CAC2DB05AEBCAFE562C241DB24RecommendationBannerView_artworkPlaceholder);
  v4 = *(void **)&self->headlineText[OBJC_IVAR____TtC16MusicApplicationP33_0F58D309CAC2DB05AEBCAFE562C241DB24RecommendationBannerView_artworkPlaceholder];
  id v5 = *(void **)&self->headlineText[OBJC_IVAR____TtC16MusicApplicationP33_0F58D309CAC2DB05AEBCAFE562C241DB24RecommendationBannerView_artworkPlaceholder
                                   + 8];

  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC16MusicApplicationP33_0F58D309CAC2DB05AEBCAFE562C241DB24RecommendationBannerView_closeButtonHandler));
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC16MusicApplicationP33_0F58D309CAC2DB05AEBCAFE562C241DB24RecommendationBannerView_didSelectHandler));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplicationP33_0F58D309CAC2DB05AEBCAFE562C241DB24RecommendationBannerView_textStackView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplicationP33_0F58D309CAC2DB05AEBCAFE562C241DB24RecommendationBannerView_badgeView));
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplicationP33_0F58D309CAC2DB05AEBCAFE562C241DB24RecommendationBannerView_containerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplicationP33_0F58D309CAC2DB05AEBCAFE562C241DB24RecommendationBannerView_shadowBackdropView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplicationP33_0F58D309CAC2DB05AEBCAFE562C241DB24RecommendationBannerView____lazy_storage___appleMusicImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplicationP33_0F58D309CAC2DB05AEBCAFE562C241DB24RecommendationBannerView____lazy_storage___closeButton));
  swift_release();
  v6 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplicationP33_0F58D309CAC2DB05AEBCAFE562C241DB24RecommendationBannerView____lazy_storage___measurementTextStackView);
}

@end