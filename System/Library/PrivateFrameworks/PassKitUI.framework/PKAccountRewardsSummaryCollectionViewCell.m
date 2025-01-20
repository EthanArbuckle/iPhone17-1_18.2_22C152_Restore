@interface PKAccountRewardsSummaryCollectionViewCell
- (PKAccountRewardsSummaryCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)configureWithRewardsTierSummary:(id)a3;
@end

@implementation PKAccountRewardsSummaryCollectionViewCell

- (void)configureWithRewardsTierSummary:(id)a3
{
  double v4 = *MEMORY[0x1E4FB12A8];
  double v5 = *(double *)(MEMORY[0x1E4FB12A8] + 8);
  double v6 = *(double *)(MEMORY[0x1E4FB12A8] + 16);
  double v7 = *(double *)(MEMORY[0x1E4FB12A8] + 24);
  id v8 = a3;
  v12 = self;
  -[PKAccountRewardsSummaryCollectionViewCell setDirectionalLayoutMargins:](v12, sel_setDirectionalLayoutMargins_, v4, v5, v6, v7);
  uint64_t v9 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  *(void *)(v10 + 24) = v8;
  id v11 = v8;
  sub_1A03B5258();
  [(PKAccountRewardsSummaryCollectionViewCell *)v12 setNeedsUpdateConfiguration];
}

- (PKAccountRewardsSummaryCollectionViewCell)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PKAccountRewardsSummaryCollectionViewCell;
  v3 = -[PKAccountRewardsSummaryCollectionViewCell initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3)
  {
    double v5 = [(PKAccountRewardsSummaryCollectionViewCell *)v3 layer];
    [v5 setCornerRadius:10.0];

    double v6 = [MEMORY[0x1E4FB1618] secondarySystemGroupedBackgroundColor];
    [(PKAccountRewardsSummaryCollectionViewCell *)v4 setBackgroundColor:v6];

    [(PKAccountRewardsSummaryCollectionViewCell *)v4 setAccessibilityIdentifier:*MEMORY[0x1E4F85A78]];
  }
  return v4;
}

@end