@interface TrendPairTableViewCell
- (_TtC10FitnessApp19TrendListMetricView)leadingView;
- (_TtC10FitnessApp19TrendListMetricView)trailingView;
- (_TtC10FitnessApp22TrendPairTableViewCell)initWithCoder:(id)a3;
- (_TtC10FitnessApp22TrendPairTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)prepareForReuse;
- (void)selectionButtonTappedWithSender:(id)a3;
@end

@implementation TrendPairTableViewCell

- (_TtC10FitnessApp19TrendListMetricView)leadingView
{
  return (_TtC10FitnessApp19TrendListMetricView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                          + OBJC_IVAR____TtC10FitnessApp22TrendPairTableViewCell_leadingView));
}

- (_TtC10FitnessApp19TrendListMetricView)trailingView
{
  return (_TtC10FitnessApp19TrendListMetricView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                          + OBJC_IVAR____TtC10FitnessApp22TrendPairTableViewCell_trailingView));
}

- (_TtC10FitnessApp22TrendPairTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC10FitnessApp22TrendPairTableViewCell *)sub_100608E74(a3, (uint64_t)a4, v6);
}

- (void)selectionButtonTappedWithSender:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1006093C8();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_10060A144();
}

- (_TtC10FitnessApp22TrendPairTableViewCell)initWithCoder:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp22TrendPairTableViewCell_leadingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp22TrendPairTableViewCell_trailingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp22TrendPairTableViewCell_paddingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp22TrendPairTableViewCell_leadingButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp22TrendPairTableViewCell_trailingButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp22TrendPairTableViewCell_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp22TrendPairTableViewCell_selectionStackView));
  swift_release();
  sub_10008DB18((uint64_t)self + OBJC_IVAR____TtC10FitnessApp22TrendPairTableViewCell_leadingMetric, &qword_10095BFB0);
  sub_10008DB18((uint64_t)self + OBJC_IVAR____TtC10FitnessApp22TrendPairTableViewCell_trailingMetric, &qword_10095BFB0);
}

@end