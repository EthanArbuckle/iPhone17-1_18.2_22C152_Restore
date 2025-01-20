@interface PKDashboardRewardsBalanceCell
- (_TtC9PassKitUI29PKDashboardRewardsBalanceCell)initWithCoder:(id)a3;
- (_TtC9PassKitUI29PKDashboardRewardsBalanceCell)initWithFrame:(CGRect)a3;
- (void)configureWithRewardsBalanceItem:(id)a3;
@end

@implementation PKDashboardRewardsBalanceCell

- (void)configureWithRewardsBalanceItem:(id)a3
{
  double v4 = *MEMORY[0x1E4FB12A8];
  double v5 = *(double *)(MEMORY[0x1E4FB12A8] + 8);
  double v6 = *(double *)(MEMORY[0x1E4FB12A8] + 16);
  double v7 = *(double *)(MEMORY[0x1E4FB12A8] + 24);
  id v8 = a3;
  v12 = self;
  -[PKDashboardRewardsBalanceCell setDirectionalLayoutMargins:](v12, sel_setDirectionalLayoutMargins_, v4, v5, v6, v7);
  uint64_t v9 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  *(void *)(v10 + 24) = v8;
  id v11 = v8;
  sub_1A03B5258();
  [(PKDashboardRewardsBalanceCell *)v12 setNeedsUpdateConfiguration];
}

- (_TtC9PassKitUI29PKDashboardRewardsBalanceCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for PKDashboardRewardsBalanceCell();
  return -[PKDashboardCollectionViewCell initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC9PassKitUI29PKDashboardRewardsBalanceCell)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PKDashboardRewardsBalanceCell();
  return [(PKDashboardRewardsBalanceCell *)&v5 initWithCoder:a3];
}

@end