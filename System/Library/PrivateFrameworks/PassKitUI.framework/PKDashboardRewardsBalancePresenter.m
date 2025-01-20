@interface PKDashboardRewardsBalancePresenter
- (BOOL)canSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (Class)itemClass;
- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (id)collectionViewCellClasses;
- (void)didSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5 navigationController:(id)a6 canPresent:(id)a7;
- (void)traitCollectionDidChangeFromTrait:(id)a3 toTrait:(id)a4 inCollectionView:(id)a5;
- (void)updateCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 atIndexPath:(id)a6;
@end

@implementation PKDashboardRewardsBalancePresenter

- (Class)itemClass
{
  return (Class)objc_opt_class();
}

- (id)collectionViewCellClasses
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v4 = @"paymentRewardsBalanceCellReuseIdentifier";
  v5[0] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v7 = a3;
  v8 = [a4 dequeueReusableCellWithReuseIdentifier:@"paymentRewardsBalanceCellReuseIdentifier" forIndexPath:a5];
  [v8 configureWithRewardsBalanceItem:v7];

  return v8;
}

- (BOOL)canSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  return 1;
}

- (void)didSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5 navigationController:(id)a6 canPresent:(id)a7
{
  id v8 = a6;
  id v11 = +[PKDashboardRewardsBalanceDetailsViewHosting makeViewControllerWithRewardsBalanceItem:a3];
  v9 = [v8 navigationBar];
  [v9 setPrefersLargeTitles:1];

  v10 = [v11 navigationItem];
  [v10 setLargeTitleDisplayMode:1];

  [v8 pushViewController:v11 animated:1];
}

- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  sampleCell = self->_sampleCell;
  if (!sampleCell)
  {
    v10 = [_TtC9PassKitUI29PKDashboardRewardsBalanceCell alloc];
    id v11 = -[PKDashboardRewardsBalanceCell initWithFrame:](v10, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v12 = self->_sampleCell;
    self->_sampleCell = v11;

    sampleCell = self->_sampleCell;
  }
  [(PKDashboardRewardsBalanceCell *)sampleCell configureWithRewardsBalanceItem:v7];
  [v8 bounds];
  double v14 = v13;
  +[PKDashboardCollectionViewCell defaultHorizontalInset];
  double v16 = v14 + v15 * -2.0;
  -[PKDashboardRewardsBalanceCell sizeThatFits:](self->_sampleCell, "sizeThatFits:", v16, 1.79769313e308);
  double v18 = v17;
  [(PKDashboardCollectionViewCell *)self->_sampleCell prepareForReuse];

  double v19 = v16;
  double v20 = v18;
  result.height = v20;
  result.width = v19;
  return result;
}

- (void)updateCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 atIndexPath:(id)a6
{
}

- (void)traitCollectionDidChangeFromTrait:(id)a3 toTrait:(id)a4 inCollectionView:(id)a5
{
  if (a3)
  {
    if (a4)
    {
      id v7 = a4;
      id v8 = [a3 preferredContentSizeCategory];
      v9 = [v7 preferredContentSizeCategory];

      NSComparisonResult v10 = UIContentSizeCategoryCompareToCategory(v8, v9);
      if (v10)
      {
        sampleCell = self->_sampleCell;
        self->_sampleCell = 0;
      }
    }
  }
}

- (void).cxx_destruct
{
}

@end