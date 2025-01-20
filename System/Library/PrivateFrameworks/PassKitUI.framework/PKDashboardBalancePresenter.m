@interface PKDashboardBalancePresenter
- (BOOL)canSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (Class)itemClass;
- (PKDashboardBalancePresenter)init;
- (id)_identifierForItem:(id)a3;
- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (id)collectionViewCellClasses;
- (int64_t)cellStyle;
- (void)_updateBalanceView:(id)a3 withItem:(id)a4;
- (void)setCellStyle:(int64_t)a3;
- (void)traitCollectionDidChangeFromTrait:(id)a3 toTrait:(id)a4 inCollectionView:(id)a5;
@end

@implementation PKDashboardBalancePresenter

- (PKDashboardBalancePresenter)init
{
  v7.receiver = self;
  v7.super_class = (Class)PKDashboardBalancePresenter;
  v2 = [(PKDashboardBalancePresenter *)&v7 init];
  if (v2)
  {
    v3 = [PKDashboardBalanceView alloc];
    uint64_t v4 = -[PKDashboardBalanceView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    sampleBalanceView = v2->_sampleBalanceView;
    v2->_sampleBalanceView = (PKDashboardBalanceView *)v4;
  }
  return v2;
}

- (Class)itemClass
{
  return (Class)objc_opt_class();
}

- (id)collectionViewCellClasses
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = @"PKDashboardBalancePresenterIdentifier";
  v5[0] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (id)_identifierForItem:(id)a3
{
  return @"PKDashboardBalancePresenterIdentifier";
}

- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  v8 = (UICollectionView *)a4;
  id v9 = a5;
  id v10 = a3;
  v11 = [(PKDashboardBalancePresenter *)self _identifierForItem:v10];
  v12 = [(UICollectionView *)v8 dequeueReusableCellWithReuseIdentifier:v11 forIndexPath:v9];

  collectionView = self->_collectionView;
  self->_collectionView = v8;
  v14 = v8;

  [(PKDashboardBalancePresenter *)self _updateBalanceView:v12 withItem:v10];
  [(id)objc_opt_class() defaultHorizontalInset];
  double v16 = v15;
  [(id)objc_opt_class() defaultHorizontalInset];
  -[UICollectionView pkui_readableContentBoundsWithMargins:](v14, "pkui_readableContentBoundsWithMargins:", 0.0, v16, 0.0, v17);
  double v19 = v18;

  [v12 setHorizontalInset:v19];

  return v12;
}

- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  sampleBalanceView = self->_sampleBalanceView;
  id v8 = a4;
  [(PKDashboardBalancePresenter *)self _updateBalanceView:sampleBalanceView withItem:a3];
  [(id)objc_opt_class() defaultHorizontalInset];
  double v10 = v9;
  [(id)objc_opt_class() defaultHorizontalInset];
  objc_msgSend(v8, "pkui_readableContentBoundsWithMargins:", 0.0, v10, 0.0, v11);
  -[PKDashboardCollectionViewCell setHorizontalInset:](self->_sampleBalanceView, "setHorizontalInset:");
  v12 = self->_sampleBalanceView;
  [v8 bounds];
  double v14 = v13;

  -[PKDashboardBalanceView sizeThatFits:](v12, "sizeThatFits:", v14, 3.40282347e38);
  result.height = v16;
  result.width = v15;
  return result;
}

- (BOOL)canSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  return 0;
}

- (void)_updateBalanceView:(id)a3 withItem:(id)a4
{
  id v14 = a3;
  id v5 = a4;
  v6 = [v5 title];
  if (v6)
  {
    [v14 setTitle:v6];
  }
  else
  {
    objc_super v7 = PKLocalizedPaymentString(&cfstr_DashboardModul.isa);
    [v14 setTitle:v7];
  }
  id v8 = [v5 titleColor];
  [v14 setTitleColor:v8];

  double v9 = [v5 balance];
  [v14 setBalance:v9];

  double v10 = [v5 availableCredit];
  [v14 setAvailableCredit:v10];

  double v11 = [v5 topUpTitle];
  [v14 setTopUpTitle:v11];

  v12 = [v5 topUpAction];
  [v14 setTopUpAction:v12];

  uint64_t v13 = [v5 topUpEnabled];
  [v14 setTopUpEnabled:v13];
}

- (void)traitCollectionDidChangeFromTrait:(id)a3 toTrait:(id)a4 inCollectionView:(id)a5
{
  if (a3)
  {
    if (a4)
    {
      id v7 = a4;
      id v8 = [a3 preferredContentSizeCategory];
      double v9 = [v7 preferredContentSizeCategory];

      NSComparisonResult v10 = UIContentSizeCategoryCompareToCategory(v8, v9);
      if (v10)
      {
        double v11 = [PKDashboardBalanceView alloc];
        v12 = -[PKDashboardBalanceView initWithFrame:](v11, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        sampleBalanceView = self->_sampleBalanceView;
        self->_sampleBalanceView = v12;
      }
    }
  }
}

- (int64_t)cellStyle
{
  return self->_cellStyle;
}

- (void)setCellStyle:(int64_t)a3
{
  self->_cellStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionView, 0);

  objc_storeStrong((id *)&self->_sampleBalanceView, 0);
}

@end