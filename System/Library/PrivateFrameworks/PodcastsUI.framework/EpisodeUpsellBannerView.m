@interface EpisodeUpsellBannerView
- (_TtC10PodcastsUI23EpisodeUpsellBannerView)initWithCoder:(id)a3;
- (_TtC10PodcastsUI23EpisodeUpsellBannerView)initWithFrame:(CGRect)a3;
- (id)accessibilitySubtitleLabel;
- (void)cellTapped;
- (void)closeButtonTapped;
- (void)didHover:(id)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation EpisodeUpsellBannerView

- (void)cellTapped
{
}

- (void)closeButtonTapped
{
}

- (_TtC10PodcastsUI23EpisodeUpsellBannerView)initWithCoder:(id)a3
{
  id v3 = a3;
  _s10PodcastsUI23EpisodeUpsellBannerViewC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for EpisodeUpsellBannerView();
  v2 = (char *)v9.receiver;
  [(EpisodeUpsellBannerView *)&v9 layoutSubviews];
  id v3 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC10PodcastsUI23EpisodeUpsellBannerView_artworkContainerView], sel_layer);
  sub_1E3C982E8(v6);
  uint64_t v4 = v7;
  uint64_t v5 = v8;
  __swift_project_boxed_opaque_existential_1(v6, v7);
  (*(void (**)(uint64_t, uint64_t))(v5 + 40))(v4, v5);
  objc_msgSend(v3, sel_setCornerRadius_);

  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1E3C9A430(a3);
}

- (void)didHover:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1E3C9A880(v4);
}

- (id)accessibilitySubtitleLabel
{
  v2 = self;
  id v3 = sub_1E3C975B4();

  return v3;
}

- (_TtC10PodcastsUI23EpisodeUpsellBannerView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  sub_1E3C1A3C4(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC10PodcastsUI23EpisodeUpsellBannerView_tapBannerBlock));
  sub_1E3C1A3C4(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC10PodcastsUI23EpisodeUpsellBannerView_tapCloseButtonBlock));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10PodcastsUI23EpisodeUpsellBannerView_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10PodcastsUI23EpisodeUpsellBannerView_artworkContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10PodcastsUI23EpisodeUpsellBannerView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10PodcastsUI23EpisodeUpsellBannerView____lazy_storage___subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10PodcastsUI23EpisodeUpsellBannerView____lazy_storage___dismissButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10PodcastsUI23EpisodeUpsellBannerView____lazy_storage___tapBannerGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10PodcastsUI23EpisodeUpsellBannerView____lazy_storage___textLayout));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10PodcastsUI23EpisodeUpsellBannerView____lazy_storage___titleLabelCenterYConstraint));
  sub_1E3C9BBC4(*(id *)((char *)&self->super.super.super.super.isa
                      + OBJC_IVAR____TtC10PodcastsUI23EpisodeUpsellBannerView____lazy_storage___subtitleTopAnchorConstraint));
  sub_1E3C9BBC4(*(id *)((char *)&self->super.super.super.super.isa
                      + OBJC_IVAR____TtC10PodcastsUI23EpisodeUpsellBannerView____lazy_storage___subtitleBottomConstraint));
  sub_1E3C9BBC4(*(id *)((char *)&self->super.super.super.super.isa
                      + OBJC_IVAR____TtC10PodcastsUI23EpisodeUpsellBannerView____lazy_storage___titleTopConstraint));
  sub_1E3C9BBE4((uint64_t)self + OBJC_IVAR____TtC10PodcastsUI23EpisodeUpsellBannerView____lazy_storage___config);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10PodcastsUI23EpisodeUpsellBannerView_hoverRecognizer));

  swift_release();
}

@end