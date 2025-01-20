@interface SearchUIHeroButtonsCardSectionView
+ (BOOL)supportsRecyclingForCardSection:(id)a3;
- (id)setupContentView;
- (void)updateWithRowModel:(id)a3;
@end

@implementation SearchUIHeroButtonsCardSectionView

+ (BOOL)supportsRecyclingForCardSection:(id)a3
{
  return 1;
}

- (id)setupContentView
{
  v3 = objc_opt_new();
  [v3 setCountMoreButtonTowardsMaxCount:0];
  [v3 setFlipsToVerticalAxisForAccessibilityContentSizes:1];
  v4 = [(SearchUICardSectionView *)self rowModel];
  if ([v4 sectionType] == 3) {
    uint64_t v5 = 6;
  }
  else {
    uint64_t v5 = 1;
  }
  [v3 setDistribution:v5];

  [MEMORY[0x1E4FAE1A0] defaultLayoutMargins];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  if (TLKSnippetModernizationEnabled()) {
    double v14 = v11;
  }
  else {
    double v14 = v11 + -8.0;
  }
  objc_msgSend(v3, "setLayoutMargins:", v7, v9, v14, v13);
  [v3 setLayoutMarginsRelativeArrangement:1];
  return v3;
}

- (void)updateWithRowModel:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SearchUIHeroButtonsCardSectionView;
  id v4 = a3;
  [(SearchUICardSectionView *)&v11 updateWithRowModel:v4];
  uint64_t v5 = [(SearchUICardSectionView *)self section];
  double v6 = [v5 buttons];
  [v6 count];

  double v7 = [(SearchUICardSectionView *)self contentView];
  double v8 = [(SearchUICardSectionView *)self section];
  double v9 = [v8 buttons];
  double v10 = [(SearchUICardSectionView *)self feedbackDelegate];
  [v7 updateWithButtonItems:v9 maxButtonItems:2 buttonItemViewType:2 rowModel:v4 feedbackDelegate:v10];
}

@end