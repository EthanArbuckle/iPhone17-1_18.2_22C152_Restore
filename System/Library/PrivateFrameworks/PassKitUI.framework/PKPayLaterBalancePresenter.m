@interface PKPayLaterBalancePresenter
- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (Class)itemClass;
- (PKPayLaterBalancePresenter)init;
- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (id)collectionViewCellClasses;
- (void)_configureCell:(id)a3 item:(id)a4 collectionView:(id)a5;
- (void)_configureView:(id)a3 item:(id)a4;
- (void)traitCollectionDidChangeFromTrait:(id)a3 toTrait:(id)a4 inCollectionView:(id)a5;
@end

@implementation PKPayLaterBalancePresenter

- (PKPayLaterBalancePresenter)init
{
  v9.receiver = self;
  v9.super_class = (Class)PKPayLaterBalancePresenter;
  v2 = [(PKPayLaterBalancePresenter *)&v9 init];
  if (v2)
  {
    v3 = [PKDashboardContentHostCollectionViewCell alloc];
    uint64_t v4 = -[PKDashboardContentHostCollectionViewCell initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    sampleCell = v2->_sampleCell;
    v2->_sampleCell = (PKDashboardContentHostCollectionViewCell *)v4;

    v6 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E4F28EE0]);
    numberFormatter = v2->_numberFormatter;
    v2->_numberFormatter = v6;

    [(NSNumberFormatter *)v2->_numberFormatter setNumberStyle:1];
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
  uint64_t v4 = @"kPayLaterAccountCellIdentifier";
  v5[0] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = [v8 dequeueReusableCellWithReuseIdentifier:@"kPayLaterAccountCellIdentifier" forIndexPath:a5];
  [(PKPayLaterBalancePresenter *)self _configureCell:v10 item:v9 collectionView:v8];

  return v10;
}

- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  sampleCell = self->_sampleCell;
  id v8 = a4;
  [(PKPayLaterBalancePresenter *)self _configureCell:sampleCell item:a3 collectionView:v8];
  id v9 = self->_sampleCell;
  [v8 bounds];
  double v11 = v10;

  +[PKDashboardCollectionViewCell defaultHorizontalInset];
  double v13 = v11 + v12 * -2.0;

  -[PKDashboardContentHostCollectionViewCell sizeThatFits:](v9, "sizeThatFits:", v13, 3.40282347e38);
  result.height = v15;
  result.width = v14;
  return result;
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
        double v11 = [PKDashboardContentHostCollectionViewCell alloc];
        double v12 = -[PKDashboardContentHostCollectionViewCell initWithFrame:](v11, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        sampleCell = self->_sampleCell;
        self->_sampleCell = v12;
      }
    }
  }
}

- (void)_configureCell:(id)a3 item:(id)a4 collectionView:(id)a5
{
  id v14 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v7;
      id v9 = v14;
      NSComparisonResult v10 = [v9 hostedContentView];
      double v11 = v10;
      if (v10) {
        double v12 = v10;
      }
      else {
        double v12 = objc_alloc_init(PKFusedDoubleCellView);
      }
      double v13 = v12;

      [(PKPayLaterBalancePresenter *)self _configureView:v13 item:v8];
      [v9 setHostedContentView:v13];
    }
  }
}

- (void)_configureView:(id)a3 item:(id)a4
{
  id v32 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [v6 payLaterAccount];
    id v8 = [v6 dueNext30Days];
    id v9 = [v7 payLaterDetails];
    NSComparisonResult v10 = [v9 currentBalance];

    double v11 = [v6 totalPending];
    if (!v8)
    {
      double v12 = [v7 payLaterDetails];
      double v13 = [v12 currencyCode];

      if (v13)
      {
        id v14 = [MEMORY[0x1E4F28C28] zero];
        id v8 = PKCurrencyAmountMake();
      }
      else
      {
        id v8 = 0;
      }
    }
    id v15 = v32;
    [v15 beginUpdates];
    v16 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB2950], 0, 0x8000, 0);
    [v15 setTitleFont:v16];

    v17 = PKLocalizedCocoonString(&cfstr_TotalDue.isa);
    [v15 setLeftTitle:v17];

    v18 = [v10 formattedStringValue];
    [v15 setLeftDetail:v18];

    v19 = [MEMORY[0x1E4FB1618] labelColor];
    [v15 setLeftDetailColor:v19];

    v20 = [v11 amount];
    v21 = 0;
    if (objc_msgSend(v20, "pk_isPositiveNumber"))
    {
      [v11 formattedStringValue];
      v22 = v11;
      v23 = self;
      v24 = v7;
      v26 = v25 = v10;
      v21 = PKLocalizedCocoonString(&cfstr_InstallmentPen_1.isa, &stru_1EF1B4C70.isa, v26);

      NSComparisonResult v10 = v25;
      id v7 = v24;
      self = v23;
      double v11 = v22;
    }

    [v15 setLeftSubDetail:v21];
    v27 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [v15 setLeftSubDetailColor:v27];

    v28 = [(NSNumberFormatter *)self->_numberFormatter stringFromNumber:&unk_1EF2B9150];
    v29 = PKLocalizedCocoonString(&cfstr_Next30Days.isa, &stru_1EF1B4C70.isa, v28);
    [v15 setRightTitle:v29];

    v30 = [v8 formattedStringValue];
    [v15 setRightDetail:v30];

    v31 = [MEMORY[0x1E4FB1618] labelColor];
    [v15 setRightDetailColor:v31];

    [v15 setRightSubDetail:0];
    [v15 endUpdates:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numberFormatter, 0);

  objc_storeStrong((id *)&self->_sampleCell, 0);
}

@end