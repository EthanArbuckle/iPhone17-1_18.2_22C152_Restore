@interface CHDivingDetailMapTableViewCell
- (CHDivingDetailMapTableViewCell)initWithCoder:(id)a3;
- (CHDivingDetailMapTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)configureWithDive:(id)a3 row:(int64_t)a4 dataCalculator:(id)a5;
@end

@implementation CHDivingDetailMapTableViewCell

- (CHDivingDetailMapTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (CHDivingDetailMapTableViewCell *)sub_100713D64(a3, (uint64_t)a4, v6);
}

- (void)configureWithDive:(id)a3 row:(int64_t)a4 dataCalculator:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = self;
  sub_100713F74(v8, a4, v9);
}

- (CHDivingDetailMapTableViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100715ED8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHDivingDetailMapTableViewCell_titleLabel1));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHDivingDetailMapTableViewCell_titleLabel2));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHDivingDetailMapTableViewCell_valueLabel1));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHDivingDetailMapTableViewCell_valueLabel2));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHDivingDetailMapTableViewCell_separatorView));

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHDivingDetailMapTableViewCell_dataCalculator));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___CHDivingDetailMapTableViewCell_depthChartView);
}

@end