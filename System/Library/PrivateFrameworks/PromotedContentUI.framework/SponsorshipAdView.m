@interface SponsorshipAdView
@end

@implementation SponsorshipAdView

- (void).cxx_destruct
{
  sub_1B5D2E4A0((uint64_t)self + OBJC_IVAR____TtC17PromotedContentUI17SponsorshipAdView_lightLogoURL);
  sub_1B5D2E4A0((uint64_t)self + OBJC_IVAR____TtC17PromotedContentUI17SponsorshipAdView_darkLogoURL);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17PromotedContentUI17SponsorshipAdView_headlineLabel));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC17PromotedContentUI17SponsorshipAdView_logoImageView);
}

@end