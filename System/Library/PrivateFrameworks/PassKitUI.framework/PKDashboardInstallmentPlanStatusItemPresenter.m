@interface PKDashboardInstallmentPlanStatusItemPresenter
- (BOOL)_showStatusForItem:(id)a3;
- (BOOL)canSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (Class)itemClass;
- (PKDashboardInstallmentPlanStatusItemPresenter)init;
- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (id)collectionViewCellClasses;
- (void)_configureProgressCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 forIndexPath:(id)a6;
- (void)_configureTotalFinancedCell:(id)a3 forItem:(id)a4 inCollection:(id)a5 forIndexPath:(id)a6;
- (void)didSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5 navigationController:(id)a6 canPresent:(id)a7;
- (void)updateCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 atIndexPath:(id)a6;
@end

@implementation PKDashboardInstallmentPlanStatusItemPresenter

- (PKDashboardInstallmentPlanStatusItemPresenter)init
{
  v13.receiver = self;
  v13.super_class = (Class)PKDashboardInstallmentPlanStatusItemPresenter;
  v2 = [(PKDashboardInstallmentPlanStatusItemPresenter *)&v13 init];
  if (v2)
  {
    v3 = [PKInstallmentPlanProgressCollectionViewCell alloc];
    double v4 = *MEMORY[0x1E4F1DB28];
    double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v8 = -[PKInstallmentPlanProgressCollectionViewCell initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], v5, v6, v7);
    sampleProgressCell = v2->_sampleProgressCell;
    v2->_sampleProgressCell = (PKInstallmentPlanProgressCollectionViewCell *)v8;

    v10 = -[PKInstallmentPlanTotalFinancedCollectionViewCell initWithFrame:]([PKInstallmentPlanTotalFinancedCollectionViewCell alloc], "initWithFrame:", v4, v5, v6, v7);
    sampleTotalFinancedCell = v2->_sampleTotalFinancedCell;
    v2->_sampleTotalFinancedCell = v10;
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
  v4[0] = @"InstallmentPlanStatusItemCellReuseIdentifier";
  v4[1] = @"InstallmentPlanTotalFinancedCellReuseIdentifier";
  v5[0] = objc_opt_class();
  v5[1] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:2];

  return v2;
}

- (BOOL)canSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  return !-[PKDashboardInstallmentPlanStatusItemPresenter _showStatusForItem:](self, "_showStatusForItem:", a3, a4, a5);
}

- (void)didSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5 navigationController:(id)a6 canPresent:(id)a7
{
  id v27 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  v15 = v14;
  if (!v14 || (*((unsigned int (**)(id))v14 + 2))(v14))
  {
    id v16 = v27;
    v25 = [PKInstallmentPlanDetailsViewController alloc];
    v17 = [v16 account];
    v18 = [v16 installmentPlan];
    v19 = [MEMORY[0x1E4F84270] sharedInstance];
    v20 = [v16 accountUserCollection];
    [v16 familyMemberCollection];
    v26 = v13;
    v22 = id v21 = v11;
    v23 = [v16 transactionSourceCollection];

    v24 = [(PKInstallmentPlanDetailsViewController *)v25 initWithAccount:v17 installmentPlan:v18 accountService:v19 accountUserCollection:v20 familyMemberCollection:v22 transactionSourceCollection:v23];
    id v11 = v21;
    id v13 = v26;

    [v26 pushViewController:v24 animated:1];
  }
}

- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  if ([(PKDashboardInstallmentPlanStatusItemPresenter *)self _showStatusForItem:v8])
  {
    id v11 = [v10 dequeueReusableCellWithReuseIdentifier:@"InstallmentPlanStatusItemCellReuseIdentifier" forIndexPath:v9];
    [(PKDashboardInstallmentPlanStatusItemPresenter *)self _configureProgressCell:v11 forItem:v8 inCollectionView:v10 forIndexPath:v9];
  }
  else
  {
    id v11 = [v10 dequeueReusableCellWithReuseIdentifier:@"InstallmentPlanTotalFinancedCellReuseIdentifier" forIndexPath:v9];
    [(PKDashboardInstallmentPlanStatusItemPresenter *)self _configureTotalFinancedCell:v11 forItem:v8 inCollection:v10 forIndexPath:v9];
  }

  return v11;
}

- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  if ([(PKDashboardInstallmentPlanStatusItemPresenter *)self _showStatusForItem:v8])
  {
    p_sampleProgressCell = (void **)&self->_sampleProgressCell;
    [(PKDashboardInstallmentPlanStatusItemPresenter *)self _configureProgressCell:self->_sampleProgressCell forItem:v8 inCollectionView:v10 forIndexPath:v9];
  }
  else
  {
    p_sampleProgressCell = (void **)&self->_sampleTotalFinancedCell;
    [(PKDashboardInstallmentPlanStatusItemPresenter *)self _configureTotalFinancedCell:self->_sampleTotalFinancedCell forItem:v8 inCollection:v10 forIndexPath:v9];
  }

  id v12 = *p_sampleProgressCell;
  [v10 bounds];
  double v14 = v13;

  objc_msgSend(v12, "sizeThatFits:", v14, 1.79769313e308);
  double v16 = v15;
  double v18 = v17;

  double v19 = v16;
  double v20 = v18;
  result.height = v20;
  result.width = v19;
  return result;
}

- (void)updateCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 atIndexPath:(id)a6
{
  id v13 = a4;
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  if ([(PKDashboardInstallmentPlanStatusItemPresenter *)self _showStatusForItem:v13]) {
    [(PKDashboardInstallmentPlanStatusItemPresenter *)self _configureProgressCell:v12 forItem:v13 inCollectionView:v11 forIndexPath:v10];
  }
  else {
    [(PKDashboardInstallmentPlanStatusItemPresenter *)self _configureTotalFinancedCell:v12 forItem:v13 inCollection:v11 forIndexPath:v10];
  }
}

- (void)_configureTotalFinancedCell:(id)a3 forItem:(id)a4 inCollection:(id)a5 forIndexPath:(id)a6
{
  id v24 = a3;
  double v7 = [a4 installmentPlan];
  id v8 = [v7 currencyCode];
  id v9 = [v7 totalAmount];
  id v10 = PKLocalizedBeekmanString(&cfstr_TotalFinanced.isa);
  [v24 setTitle:v10];

  id v11 = PKCurrencyAmountMake();
  [v24 setAmount:v11];

  id v12 = [v7 nextPaymentDue];
  id v13 = v12;
  if (v12)
  {
    double v14 = [v12 amountDue];
    double v15 = [v13 currencyCode];
    double v16 = PKCurrencyAmountCreate(v14, v15);

    double v17 = [v13 statementDate];
    double v18 = v17;
    if (v17)
    {
      id v19 = v17;
    }
    else
    {
      id v19 = [v13 dueDate];
    }
    id v21 = v19;

    v22 = PKMediumDateString();
    v23 = [v16 formattedStringValue];
    double v20 = PKLocalizedBeekmanString(&cfstr_NextPaymentDue.isa, &stru_1EF1B5770.isa, v22, v23);
  }
  else
  {
    double v20 = 0;
  }
  [v24 setSubtitleText:v20];
}

- (void)_configureProgressCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 forIndexPath:(id)a6
{
  id v39 = a3;
  double v7 = [a4 installmentPlan];
  id v8 = [v7 currencyCode];
  id v9 = [v7 summary];
  id v10 = [v9 paymentsToDateAmount];
  id v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = [MEMORY[0x1E4F28C28] zero];
  }
  id v13 = v12;

  double v14 = [v7 totalAmount];
  uint64_t v15 = [v7 isComplete];
  [v39 setComplete:v15];
  if (v15)
  {
    double v16 = PKLocalizedBeekmanString(&cfstr_InstallmentSta_0.isa);
    [v39 setLeadingTitle:v16];

    [v39 setTrailingTitle:0];
    [v39 setLeadingAmount:0];
    [v39 setTrailingAmount:0];
    double v17 = [v7 nextPaymentDue];
    id v18 = (id)PKLocalizedBeekmanString(&cfstr_FinalPaymentRe.isa);
  }
  else
  {
    if (v8)
    {
      if (v13 && v14)
      {
        id v19 = [(NSDecimalNumber *)v13 decimalNumberByDividingBy:v14];
        [v19 floatValue];
        double v21 = v20;

        v22 = PKCurrencyAmountCreate(v13, v8);
      }
      else
      {
        id v24 = [MEMORY[0x1E4F28C28] zero];
        v22 = PKCurrencyAmountCreate(v24, v8);

        double v21 = 0.0;
      }
      v23 = [v7 remainingAmount];

      if (v23)
      {
        v25 = [v7 remainingAmount];
        v23 = PKCurrencyAmountCreate(v25, v8);
      }
    }
    else
    {
      v22 = 0;
      v23 = 0;
      double v21 = 0.0;
    }
    [v39 setProgressAmount:v21];
    v26 = PKLocalizedBeekmanString(&cfstr_TotalPaid.isa);
    [v39 setLeadingTitle:v26];

    [v39 setLeadingAmount:v22];
    id v27 = PKLocalizedBeekmanString(&cfstr_TotalRemaining.isa);
    [v39 setTrailingTitle:v27];

    [v39 setTrailingAmount:v23];
    v28 = [v7 nextPaymentDue];
    double v17 = v28;
    if (v28)
    {
      v29 = [v28 amountDue];
      v30 = [v17 currencyCode];
      v31 = PKCurrencyAmountCreate(v29, v30);

      v32 = [v17 statementDate];
      v33 = v32;
      if (v32)
      {
        id v34 = v32;
      }
      else
      {
        id v34 = [v17 dueDate];
      }
      v36 = v34;

      v37 = PKMediumDateString();
      v38 = [v31 formattedStringValue];
      v35 = PKLocalizedBeekmanString(&cfstr_NextPaymentDue.isa, &stru_1EF1B5770.isa, v37, v38);

      goto LABEL_20;
    }
  }
  v35 = 0;
LABEL_20:
  [v39 setSubtitleText:v35];
}

- (BOOL)_showStatusForItem:(id)a3
{
  v3 = [a3 account];
  BOOL v4 = [v3 accessLevel] == 1;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sampleTotalFinancedCell, 0);

  objc_storeStrong((id *)&self->_sampleProgressCell, 0);
}

@end