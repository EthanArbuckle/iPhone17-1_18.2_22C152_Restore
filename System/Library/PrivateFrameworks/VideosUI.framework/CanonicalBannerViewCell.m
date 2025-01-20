@interface CanonicalBannerViewCell
- (CGSize)intrinsicContentSize;
- (NSArray)accessibilityButtonViews;
- (UIView)accessibilityContentSubtitleView;
- (UIView)accessibilityDescriptionTextView;
- (VUIImageView)accessibilityAvailabilityImageView;
- (VUIImageView)accessibilityTitleImageView;
- (VUILabel)accessibilityAvailabilityTextView;
- (VUILabel)accessibilityContentTitleView;
- (VUILabel)accessibilityDisclaimerTextView;
- (VUILabel)accessibilityEpisodeInfoTextView;
- (VUILabel)accessibilityPromoTextView;
- (VUIMediaTagsView)accessibilityTagsView;
- (_TtC8VideosUI16RolesSummaryView)accessibilityRolesSummaryView;
- (_TtC8VideosUI23CanonicalBannerViewCell)initWithCoder:(id)a3;
- (_TtC8VideosUI23CanonicalBannerViewCell)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)handleGroupWatchActivityStateUpdatedNotification:(id)a3;
- (void)handleSyndicationInfoUpdatedNotification:(id)a3;
- (void)onSystemTraitCollectionDidChange:(id)a3;
- (void)rentalExpirationLabelNeedsRelayout:(id)a3;
- (void)vui_cellWillBeDisplayed;
- (void)vui_prepareForReuse;
@end

@implementation CanonicalBannerViewCell

- (_TtC8VideosUI23CanonicalBannerViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI23CanonicalBannerViewCell *)sub_1E3420498();
}

- (void)dealloc
{
  v2 = self;
  sub_1E3420860();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI23CanonicalBannerViewCell_titleImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI23CanonicalBannerViewCell_contentTitleView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI23CanonicalBannerViewCell_contentSubtitleView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI23CanonicalBannerViewCell_episodeInfoTextView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI23CanonicalBannerViewCell_promoTextView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI23CanonicalBannerViewCell_coverArtImageView));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI23CanonicalBannerViewCell_availabilityTextView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI23CanonicalBannerViewCell_availabilityImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI23CanonicalBannerViewCell_disclaimerTextView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI23CanonicalBannerViewCell_descriptionTextView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI23CanonicalBannerViewCell_rolesSummaryView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI23CanonicalBannerViewCell_tagsView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI23CanonicalBannerViewCell_infoTagsView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI23CanonicalBannerViewCell_uberBackgroundView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI23CanonicalBannerViewCell_descComputationLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI23CanonicalBannerViewCell_tagsComputationLabel));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI23CanonicalBannerViewCell____lazy_storage___pillSeparatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI23CanonicalBannerViewCell_attributionView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI23CanonicalBannerViewCell_transitionBackgroundView));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC8VideosUI23CanonicalBannerViewCell____lazy_storage___separatorView);
}

- (_TtC8VideosUI23CanonicalBannerViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E3420AD0();
}

- (void)vui_prepareForReuse
{
  v2 = self;
  sub_1E3420CA8();
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  sub_1E3420DC4();
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)vui_cellWillBeDisplayed
{
  v2 = self;
  sub_1E3424070();
}

- (VUIImageView)accessibilityTitleImageView
{
  v2 = self;
  double v3 = (void *)sub_1E34242D4();

  return (VUIImageView *)v3;
}

- (VUILabel)accessibilityContentTitleView
{
  v2 = self;
  double v3 = (void *)sub_1E3424354();

  return (VUILabel *)v3;
}

- (UIView)accessibilityContentSubtitleView
{
  v2 = self;
  double v3 = (void *)sub_1E34243D4();

  return (UIView *)v3;
}

- (VUILabel)accessibilityEpisodeInfoTextView
{
  v2 = self;
  double v3 = (void *)sub_1E3424454();

  return (VUILabel *)v3;
}

- (VUILabel)accessibilityPromoTextView
{
  v2 = self;
  double v3 = (void *)sub_1E34244D4();

  return (VUILabel *)v3;
}

- (NSArray)accessibilityButtonViews
{
  v2 = self;
  uint64_t v3 = sub_1E3424590();

  if (v3)
  {
    sub_1E2BE915C(0, (unint64_t *)&qword_1EBF8E7F0);
    double v4 = (void *)sub_1E387CC88();
    swift_bridgeObjectRelease();
  }
  else
  {
    double v4 = 0;
  }
  return (NSArray *)v4;
}

- (VUILabel)accessibilityAvailabilityTextView
{
  v2 = self;
  uint64_t v3 = (void *)sub_1E3424610();

  return (VUILabel *)v3;
}

- (VUIImageView)accessibilityAvailabilityImageView
{
  v2 = self;
  uint64_t v3 = (void *)sub_1E3424690();

  return (VUIImageView *)v3;
}

- (VUILabel)accessibilityDisclaimerTextView
{
  v2 = self;
  uint64_t v3 = (void *)sub_1E3424710();

  return (VUILabel *)v3;
}

- (UIView)accessibilityDescriptionTextView
{
  v2 = self;
  uint64_t v3 = (void *)sub_1E3424790();

  return (UIView *)v3;
}

- (_TtC8VideosUI16RolesSummaryView)accessibilityRolesSummaryView
{
  v2 = self;
  uint64_t v3 = (void *)sub_1E3424810();

  return (_TtC8VideosUI16RolesSummaryView *)v3;
}

- (VUIMediaTagsView)accessibilityTagsView
{
  v2 = self;
  uint64_t v3 = (void *)sub_1E3424890();

  return (VUIMediaTagsView *)v3;
}

- (void)rentalExpirationLabelNeedsRelayout:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_1E34248CC();
}

- (void)onSystemTraitCollectionDidChange:(id)a3
{
}

- (void)handleSyndicationInfoUpdatedNotification:(id)a3
{
  uint64_t v4 = sub_1E3875C38();
  OUTLINED_FUNCTION_0_4();
  uint64_t v6 = v5;
  MEMORY[0x1F4188790](v7);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E3875BE8();
  v10 = self;
  sub_1E3426A0C();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v4);
}

- (void)handleGroupWatchActivityStateUpdatedNotification:(id)a3
{
}

@end