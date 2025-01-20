@interface PKDashboardBankConnectPresenter
- (BOOL)canSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (Class)itemClass;
- (PKDashboardBankConnectPresenter)init;
- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (id)collectionViewCellClasses;
- (int64_t)cellStyle;
- (void)_updateCreditView:(id)a3 withItem:(id)a4;
- (void)_updateDebitView:(id)a3 withItem:(id)a4;
- (void)didSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5 navigationController:(id)a6 canPresent:(id)a7;
- (void)setCellStyle:(int64_t)a3;
- (void)traitCollectionDidChangeFromTrait:(id)a3 toTrait:(id)a4 inCollectionView:(id)a5;
- (void)updateCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 atIndexPath:(id)a6;
@end

@implementation PKDashboardBankConnectPresenter

- (PKDashboardBankConnectPresenter)init
{
  v13.receiver = self;
  v13.super_class = (Class)PKDashboardBankConnectPresenter;
  v2 = [(PKDashboardBankConnectPresenter *)&v13 init];
  if (v2)
  {
    v3 = [_TtC9PassKitUI31PKDashboardBankConnectDebitCell alloc];
    double v4 = *MEMORY[0x1E4F1DB28];
    double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v8 = -[PKDashboardBankConnectDebitCell initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], v5, v6, v7);
    sampleBankConnectDebitView = v2->_sampleBankConnectDebitView;
    v2->_sampleBankConnectDebitView = (_TtC9PassKitUI31PKDashboardBankConnectDebitCell *)v8;

    v10 = -[PKDashboardBankConnectCreditCell initWithFrame:]([_TtC9PassKitUI32PKDashboardBankConnectCreditCell alloc], "initWithFrame:", v4, v5, v6, v7);
    sampleBankConnectCreditView = v2->_sampleBankConnectCreditView;
    v2->_sampleBankConnectCreditView = v10;
  }
  return v2;
}

- (Class)itemClass
{
  return (Class)objc_opt_class();
}

- (id)collectionViewCellClasses
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"debitCellReuseIdentifier";
  v4[1] = @"creditCellReuseIdentifier";
  v5[0] = objc_opt_class();
  v5[1] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:2];

  return v2;
}

- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v8;
  uint64_t v12 = [v11 accountType];
  if (v12 == 1)
  {
    id v8 = [v9 dequeueReusableCellWithReuseIdentifier:@"creditCellReuseIdentifier" forIndexPath:v10];
    [(PKDashboardBankConnectPresenter *)self _updateCreditView:v8 withItem:v11];
  }
  else
  {
    if (v12) {
      goto LABEL_6;
    }
    id v8 = [v9 dequeueReusableCellWithReuseIdentifier:@"debitCellReuseIdentifier" forIndexPath:v10];
    [(PKDashboardBankConnectPresenter *)self _updateDebitView:v8 withItem:v11];
  }
  [(id)objc_opt_class() defaultHorizontalInset];
  double v14 = v13;
  [(id)objc_opt_class() defaultHorizontalInset];
  objc_msgSend(v9, "pkui_readableContentBoundsWithMargins:", 0.0, v14, 0.0, v15);
  objc_msgSend(v8, "setHorizontalInset:");
LABEL_6:

  return v8;
}

- (void)updateCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 atIndexPath:(id)a6
{
  id v10 = a3;
  id v8 = a4;
  uint64_t v9 = [v8 accountType];
  if (v9 != 1)
  {
    if (v9) {
      goto LABEL_5;
    }
    [(PKDashboardBankConnectPresenter *)self _updateDebitView:v10 withItem:v8];
  }
  [(PKDashboardBankConnectPresenter *)self _updateCreditView:v10 withItem:v8];
LABEL_5:
}

- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = v9;
  uint64_t v12 = [v11 accountType];
  if (v12 == 1)
  {
    p_sampleBankConnectCreditView = (id *)&self->_sampleBankConnectCreditView;
    [(PKDashboardBankConnectPresenter *)self _updateCreditView:self->_sampleBankConnectCreditView withItem:v11];
    goto LABEL_5;
  }
  if (!v12)
  {
    p_sampleBankConnectCreditView = (id *)&self->_sampleBankConnectDebitView;
    [(PKDashboardBankConnectPresenter *)self _updateDebitView:self->_sampleBankConnectDebitView withItem:v11];
LABEL_5:
    [(id)objc_opt_class() defaultHorizontalInset];
    double v15 = v14;
    objc_msgSend(v10, "pkui_readableContentBoundsWithMargins:", 0.0, v15, 0.0, v15);
    objc_msgSend(*p_sampleBankConnectCreditView, "setHorizontalInset:");
    [v10 bounds];
    double v5 = v16 + v15 * -2.0;
    objc_msgSend(*p_sampleBankConnectCreditView, "sizeThatFits:", v5, 3.40282347e38);
    double v6 = v17;
  }

  double v18 = v5;
  double v19 = v6;
  result.height = v19;
  result.width = v18;
  return result;
}

- (BOOL)canSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  return 1;
}

- (void)didSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5 navigationController:(id)a6 canPresent:(id)a7
{
  id v8 = a6;
  id v11 = +[BankConnectBalanceDetailsViewControllerProvider makeViewControllerWithBankConnectItem:a3];
  id v9 = [v8 navigationBar];
  [v9 setPrefersLargeTitles:1];

  id v10 = [v11 navigationItem];
  [v10 setLargeTitleDisplayMode:1];

  [v8 pushViewController:v11 animated:1];
}

- (void)_updateDebitView:(id)a3 withItem:(id)a4
{
}

- (void)_updateCreditView:(id)a3 withItem:(id)a4
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
      id v9 = [v7 preferredContentSizeCategory];

      NSComparisonResult v10 = UIContentSizeCategoryCompareToCategory(v8, v9);
      if (v10)
      {
        id v11 = [_TtC9PassKitUI31PKDashboardBankConnectDebitCell alloc];
        double v12 = *MEMORY[0x1E4F1DB28];
        double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
        double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
        double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
        double v16 = -[PKDashboardBankConnectDebitCell initWithFrame:](v11, "initWithFrame:", *MEMORY[0x1E4F1DB28], v13, v14, v15);
        sampleBankConnectDebitView = self->_sampleBankConnectDebitView;
        self->_sampleBankConnectDebitView = v16;

        double v18 = -[PKDashboardBankConnectCreditCell initWithFrame:]([_TtC9PassKitUI32PKDashboardBankConnectCreditCell alloc], "initWithFrame:", v12, v13, v14, v15);
        sampleBankConnectCreditView = self->_sampleBankConnectCreditView;
        self->_sampleBankConnectCreditView = v18;
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
  objc_storeStrong((id *)&self->_sampleBankConnectCreditView, 0);

  objc_storeStrong((id *)&self->_sampleBankConnectDebitView, 0);
}

@end