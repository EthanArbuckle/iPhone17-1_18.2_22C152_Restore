@interface FMBatteryView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC6FindMy13FMBatteryView)init;
- (_TtC6FindMy13FMBatteryView)initWithCoder:(id)a3;
- (_TtC6FindMy13FMBatteryView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation FMBatteryView

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy13FMBatteryView_levelView);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10002A128();
}

- (_TtC6FindMy13FMBatteryView)init
{
  return (_TtC6FindMy13FMBatteryView *)sub_1000418AC();
}

- (_TtC6FindMy13FMBatteryView)initWithFrame:(CGRect)a3
{
  sub_100041A90(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (CGSize)intrinsicContentSize
{
  [(FMBatteryView *)self bounds];
  double v3 = v2;
  double v4 = UIViewNoIntrinsicMetric;
  result.height = v3;
  result.width = v4;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(FMBatteryView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  result.height = v6;
  result.width = v4;
  return result;
}

- (_TtC6FindMy13FMBatteryView)initWithCoder:(id)a3
{
  sub_100430CFC(a3);
  return result;
}

@end