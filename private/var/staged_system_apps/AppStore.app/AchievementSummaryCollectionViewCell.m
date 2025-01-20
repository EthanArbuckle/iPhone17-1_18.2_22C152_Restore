@interface AchievementSummaryCollectionViewCell
- (_TtC8AppStore36AchievementSummaryCollectionViewCell)initWithCoder:(id)a3;
- (_TtC8AppStore36AchievementSummaryCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)configureBackgroundColor;
- (void)layoutSubviews;
@end

@implementation AchievementSummaryCollectionViewCell

- (_TtC8AppStore36AchievementSummaryCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore36AchievementSummaryCollectionViewCell *)sub_1003ABA84(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore36AchievementSummaryCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1003ACC2C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1003AC5E4();
}

- (void)configureBackgroundColor
{
  v2 = self;
  sub_1003AC4E4();
}

- (void).cxx_destruct
{
  sub_1000A1D30((uint64_t)self + OBJC_IVAR____TtC8AppStore36AchievementSummaryCollectionViewCell_itemLayoutContext);
  id v3 = (char *)self + OBJC_IVAR____TtC8AppStore36AchievementSummaryCollectionViewCell_metrics;
  uint64_t v4 = type metadata accessor for AchievementSummaryLayout.Metrics();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore36AchievementSummaryCollectionViewCell_shadowView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore36AchievementSummaryCollectionViewCell_containerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore36AchievementSummaryCollectionViewCell_achievementGroupView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore36AchievementSummaryCollectionViewCell_numberCompletedLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore36AchievementSummaryCollectionViewCell_outOfTotalLabel));
  v5 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC8AppStore36AchievementSummaryCollectionViewCell_completedLabel);
}

@end