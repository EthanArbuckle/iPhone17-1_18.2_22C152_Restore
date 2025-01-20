@interface TrendingDownTableViewCell
- (UILabel)detailLabel;
- (_TtC10FitnessApp19TrendListMetricView)view;
- (_TtC10FitnessApp25TrendingDownTableViewCell)initWithCoder:(id)a3;
- (_TtC10FitnessApp25TrendingDownTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)selectionButtonTappedWithSender:(id)a3;
@end

@implementation TrendingDownTableViewCell

- (_TtC10FitnessApp19TrendListMetricView)view
{
  return (_TtC10FitnessApp19TrendListMetricView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                          + OBJC_IVAR____TtC10FitnessApp25TrendingDownTableViewCell_view));
}

- (UILabel)detailLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR____TtC10FitnessApp25TrendingDownTableViewCell_detailLabel));
}

- (_TtC10FitnessApp25TrendingDownTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtC10FitnessApp25TrendingDownTableViewCell *)sub_1002ADD60(a3, (uint64_t)a4, v6);
}

- (void)selectionButtonTappedWithSender:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1002AF11C();
}

- (_TtC10FitnessApp25TrendingDownTableViewCell)initWithCoder:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25TrendingDownTableViewCell_insetContentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25TrendingDownTableViewCell_view));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25TrendingDownTableViewCell_detailLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25TrendingDownTableViewCell_button));
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC10FitnessApp25TrendingDownTableViewCell_metric;

  sub_1002AF0BC((uint64_t)v3);
}

@end