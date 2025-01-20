@interface DebugFormatHistoryMeasurementCell
- (_TtC8NewsFeed33DebugFormatHistoryMeasurementCell)initWithCoder:(id)a3;
- (_TtC8NewsFeed33DebugFormatHistoryMeasurementCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)layoutSubviews;
@end

@implementation DebugFormatHistoryMeasurementCell

- (_TtC8NewsFeed33DebugFormatHistoryMeasurementCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)sub_1C151E62C();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtC8NewsFeed33DebugFormatHistoryMeasurementCell *)sub_1C1235880(a3, (uint64_t)a4, v6);
}

- (_TtC8NewsFeed33DebugFormatHistoryMeasurementCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C1235DB0();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1C1235AAC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed33DebugFormatHistoryMeasurementCell_titleLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8NewsFeed33DebugFormatHistoryMeasurementCell_barView);
}

@end