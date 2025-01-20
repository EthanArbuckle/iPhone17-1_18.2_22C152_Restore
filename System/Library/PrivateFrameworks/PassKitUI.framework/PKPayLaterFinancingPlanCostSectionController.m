@interface PKPayLaterFinancingPlanCostSectionController
- (Class)headerViewClassForSectionIdentifier:(id)a3;
- (PKPayLaterFinancingPlan)financingPlan;
- (PKPayLaterFinancingPlanCostSectionController)initWithFinancingPlan:(id)a3 payLaterAccount:(id)a4 delegate:(id)a5;
- (id)contextMenuForPayLaterItem:(id)a3;
- (id)footerContentForSectionIdentifier:(id)a3;
- (id)identifiers;
- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4;
- (void)_configureCostSummarySection:(id)a3;
- (void)_configureIssuerBrandSection:(id)a3;
- (void)_configureLoanAgreementSection:(id)a3;
- (void)configureHeaderView:(id)a3 forSectionIdentifier:(id)a4;
- (void)setFinancingPlan:(id)a3;
@end

@implementation PKPayLaterFinancingPlanCostSectionController

- (PKPayLaterFinancingPlanCostSectionController)initWithFinancingPlan:(id)a3 payLaterAccount:(id)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  v23.receiver = self;
  v23.super_class = (Class)PKPayLaterFinancingPlanCostSectionController;
  v11 = [(PKPayLaterSectionController *)&v23 initWithPayLaterAccount:v10 dynamicContentPage:0 viewControllerDelegate:a5];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_financingPlan, a3);
    v13 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    transactionDateFormatter = v12->_transactionDateFormatter;
    v12->_transactionDateFormatter = v13;

    v15 = v12->_transactionDateFormatter;
    v16 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
    [(NSDateFormatter *)v15 setCalendar:v16];

    [(NSDateFormatter *)v12->_transactionDateFormatter setDateStyle:1];
    [(NSDateFormatter *)v12->_transactionDateFormatter setTimeStyle:1];
    v17 = [MEMORY[0x1E4F84898] sharedInstance];
    v18 = [v10 associatedPassUniqueID];
    v19 = [v17 passWithUniqueID:v18];
    uint64_t v20 = [v19 paymentPass];
    payLaterPass = v12->_payLaterPass;
    v12->_payLaterPass = (PKPaymentPass *)v20;
  }
  return v12;
}

- (id)identifiers
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 addObject:@"kCostSummarySection"];
  [(PKPayLaterFinancingPlan *)self->_financingPlan productType];
  [v3 addObject:@"kLoanAgreementSection"];
  [v3 addObject:@"kIssuerLogoSection"];
  v4 = (void *)[v3 copy];

  return v4;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4FB1358]);
  v7 = (__CFString *)v5;
  v8 = v7;
  if (v7 == @"kCostSummarySection") {
    goto LABEL_4;
  }
  if (!v7) {
    goto LABEL_5;
  }
  int v9 = [@"kCostSummarySection" isEqualToString:v7];

  if (v9)
  {
LABEL_4:
    [(PKPayLaterFinancingPlanCostSectionController *)self _configureCostSummarySection:v6];
  }
  else
  {
    v11 = v8;
    if (v11 == @"kLoanAgreementSection"
      || (v12 = v11, int v13 = [@"kLoanAgreementSection" isEqualToString:v11], v12, v13))
    {
      [(PKPayLaterFinancingPlanCostSectionController *)self _configureLoanAgreementSection:v6];
    }
    else
    {
      v14 = v12;
      if (v14 == @"kIssuerLogoSection"
        || (v15 = v14, int v16 = [@"kIssuerLogoSection" isEqualToString:v14], v15, v16))
      {
        [(PKPayLaterFinancingPlanCostSectionController *)self _configureIssuerBrandSection:v6];
      }
    }
  }
LABEL_5:

  return v6;
}

- (Class)headerViewClassForSectionIdentifier:(id)a3
{
  id v3 = (__CFString *)a3;
  v4 = v3;
  if (v3 == @"kCostSummarySection"
    || v3 && (int v5 = [@"kCostSummarySection" isEqualToString:v3], v4, v5))
  {
    id v6 = objc_opt_class();
  }
  else
  {
    id v6 = 0;
  }

  return (Class)v6;
}

- (id)footerContentForSectionIdentifier:(id)a3
{
  v4 = (__CFString *)a3;
  int v5 = v4;
  if (v4 == @"kCostSummarySection"
    || v4 && (int v6 = [@"kCostSummarySection" isEqualToString:v4], v5, v6))
  {
    [(PKPayLaterFinancingPlan *)self->_financingPlan productType];
  }

  return 0;
}

- (void)configureHeaderView:(id)a3 forSectionIdentifier:(id)a4
{
  id v18 = a3;
  int v6 = (__CFString *)a4;
  v7 = v6;
  if (v6 == @"kCostSummarySection"
    || v6 && (int v8 = [@"kCostSummarySection" isEqualToString:v6], v7, v8))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v9 = [v18 headerView];
      id v10 = [(PKPayLaterFinancingPlan *)self->_financingPlan planSummary];
      v11 = [v10 totalAmount];
      v12 = [v11 formattedStringValue];
      [v9 setAmountText:v12];

      int v13 = PKLocalizedCocoonString(&cfstr_ApplePayLater.isa);
      [v9 setSubtitleText:v13];

      transactionDateFormatter = self->_transactionDateFormatter;
      v15 = [(PKPayLaterFinancingPlan *)self->_financingPlan planSummary];
      int v16 = [v15 transactionDate];
      v17 = [(NSDateFormatter *)transactionDateFormatter stringFromDate:v16];
      [v9 setSecondarySubtitleText:v17];
    }
  }
}

- (id)contextMenuForPayLaterItem:(id)a3
{
  if (self->_loanIdentifierRow == a3)
  {
    v4 = [(PKPayLaterFinancingPlan *)self->_financingPlan displayableLoanIdentifier];
    int v5 = v4;
    if (v4)
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __75__PKPayLaterFinancingPlanCostSectionController_contextMenuForPayLaterItem___block_invoke;
      aBlock[3] = &unk_1E59D5228;
      id v9 = v4;
      int v6 = _Block_copy(aBlock);
      id v3 = [MEMORY[0x1E4FB1678] configurationWithIdentifier:0 previewProvider:0 actionProvider:v6];
    }
    else
    {
      id v3 = 0;
    }
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

id __75__PKPayLaterFinancingPlanCostSectionController_contextMenuForPayLaterItem___block_invoke(uint64_t a1)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4FB13F0];
  id v3 = PKLocalizedString(&cfstr_MenuActionCopy.isa);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __75__PKPayLaterFinancingPlanCostSectionController_contextMenuForPayLaterItem___block_invoke_2;
  v9[3] = &unk_1E59D5200;
  id v10 = *(id *)(a1 + 32);
  v4 = [v2 actionWithTitle:v3 image:0 identifier:0 handler:v9];

  int v5 = (void *)MEMORY[0x1E4FB1970];
  v11[0] = v4;
  int v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  v7 = [v5 menuWithTitle:&stru_1EF1B5B50 children:v6];

  return v7;
}

void __75__PKPayLaterFinancingPlanCostSectionController_contextMenuForPayLaterItem___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4FB1A78] generalPasteboard];
  [v2 setString:*(void *)(a1 + 32)];
}

- (void)_configureCostSummarySection:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v57 = objc_alloc_init(v4);
  int v6 = [(PKPayLaterFinancingPlan *)self->_financingPlan planSummary];
  unint64_t v7 = [(PKPayLaterFinancingPlan *)self->_financingPlan state] - 1;
  if (v7 <= 7 && ((0xBFu >> v7) & 1) != 0)
  {
    uint64_t v8 = PKLocalizedCocoonString(&off_1E59DA778[v7]->isa);
    if (v8)
    {
      id v9 = (void *)v8;
      id v10 = [(PKPayLaterFinancingPlan *)self->_financingPlan merchant];
      v11 = [v10 displayNamePurchase];

      v12 = [[PKPayLaterTitleDetailValueRow alloc] initWithTitle:v9 detail:v11 value:0 accessory:0 selectionHandler:0];
      int v13 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
      [(PKPayLaterTitleDetailValueRow *)v12 setDetailColor:v13];

      [v57 safelyAddObject:v12];
    }
  }
  v14 = [PKPayLaterTitleDetailRow alloc];
  v15 = PKLocalizedCocoonString(&cfstr_LoanId.isa);
  int v16 = [(PKPayLaterFinancingPlan *)self->_financingPlan displayableLoanIdentifier];
  v17 = [(PKPayLaterTitleDetailRow *)v14 initWithTitle:v15 detail:v16 selectionHandler:0];
  loanIdentifierRow = self->_loanIdentifierRow;
  self->_loanIdentifierRow = v17;

  [v57 safelyAddObject:self->_loanIdentifierRow];
  if ([(PKPayLaterFinancingPlan *)self->_financingPlan productType] == 1)
  {
    uint64_t v19 = PKLocalizedCocoonString(&cfstr_BnplType.isa);
    if (v19)
    {
      uint64_t v20 = (void *)v19;
      v21 = [PKPayLaterTitleDetailRow alloc];
      v22 = PKLocalizedCocoonString(&cfstr_Type_0.isa);
      objc_super v23 = [(PKPayLaterTitleDetailRow *)v21 initWithTitle:v22 detail:v20 selectionHandler:0];

      [v57 safelyAddObject:v23];
    }
  }
  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([(PKPayLaterFinancingPlan *)self->_financingPlan productType] == 1)
  {
    v25 = [v6 initialAmount];
    if (v25)
    {
      v26 = [PKMultiKeyValueCellKeyValueSource alloc];
      v27 = PKLocalizedCocoonString(&cfstr_InitialCost.isa);
      v28 = [v25 formattedStringValue];
      v29 = [(PKMultiKeyValueCellKeyValueSource *)v26 initWithTitle:v27 subtitle:v28];

      v30 = [MEMORY[0x1E4FB1618] labelColor];
      [(PKMultiKeyValueCellKeyValueSource *)v29 setSubtitleTextColor:v30];

      [v24 addObject:v29];
    }
    v31 = [v6 totalAdjustments];
    v32 = v31;
    if (v31)
    {
      v33 = [v31 formattedStringValue];
      v34 = [v32 amount];
      int v35 = objc_msgSend(v34, "pk_isPositiveNumber");

      if (v35)
      {
        uint64_t v36 = PKLocalizedPaymentString(&cfstr_AmountFormatRe.isa, &stru_1EF1B4C70.isa, v33);

        v33 = (void *)v36;
      }
      v37 = [PKMultiKeyValueCellKeyValueSource alloc];
      v38 = PKLocalizedCocoonString(&cfstr_RefundsAndAdju.isa);
      v39 = [(PKMultiKeyValueCellKeyValueSource *)v37 initWithTitle:v38 subtitle:v33];

      v40 = [MEMORY[0x1E4FB1618] labelColor];
      [(PKMultiKeyValueCellKeyValueSource *)v39 setSubtitleTextColor:v40];

      [v24 addObject:v39];
    }
    v41 = [PKMultiKeyValueCellKeyValueSource alloc];
    v42 = PKLocalizedCocoonString(&cfstr_InterestAndFee.isa);
    v43 = [v6 totalInterest];
    v44 = [v43 formattedStringValue];
    v45 = [(PKMultiKeyValueCellKeyValueSource *)v41 initWithTitle:v42 subtitle:v44];

    v46 = [MEMORY[0x1E4FB1618] labelColor];
    [(PKMultiKeyValueCellKeyValueSource *)v45 setSubtitleTextColor:v46];

    [v24 addObject:v45];
  }
  v47 = [PKMultiKeyValueCellKeyValueSource alloc];
  v48 = PKLocalizedCocoonString(&cfstr_TotalCost.isa);
  v49 = [v6 totalAmount];
  v50 = [v49 formattedStringValue];
  v51 = [(PKMultiKeyValueCellKeyValueSource *)v47 initWithTitle:v48 subtitle:v50];

  [(PKMultiKeyValueCellKeyValueSource *)v51 setBold:1];
  v52 = [MEMORY[0x1E4FB1618] labelColor];
  [(PKMultiKeyValueCellKeyValueSource *)v51 setSubtitleTextColor:v52];

  [v24 addObject:v51];
  v53 = [PKMultiKeyValueRow alloc];
  v54 = (void *)[v24 copy];
  id v55 = [(PKMultiKeyValueRow *)v53 initKeyValueSources:v54];

  [v57 addObject:v55];
  v56 = (void *)[v57 copy];
  [v5 appendItems:v56];
}

- (void)_configureLoanAgreementSection:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  objc_initWeak(&location, self);
  int v6 = [PKPayLaterButtonRow alloc];
  unint64_t v7 = PKLocalizedCocoonString(&cfstr_ViewLoanAgreem.isa);
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __79__PKPayLaterFinancingPlanCostSectionController__configureLoanAgreementSection___block_invoke;
  int v13 = &unk_1E59CA7F8;
  objc_copyWeak(&v14, &location);
  uint64_t v8 = [(PKPayLaterButtonRow *)v6 initWithTitle:v7 selectionHandler:&v10];
  loanAgreementButton = self->_loanAgreementButton;
  self->_loanAgreementButton = v8;

  objc_msgSend(v5, "addObject:", self->_loanAgreementButton, v10, v11, v12, v13);
  [v4 appendItems:v5];
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __79__PKPayLaterFinancingPlanCostSectionController__configureLoanAgreementSection___block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained[17] termsDetails];
    id v5 = [v4 installmentAgreementIdentifier];

    if (v5)
    {
      int v6 = [PKAccountTermsAndConditionsController alloc];
      unint64_t v7 = [v3 payLaterAccount];
      uint64_t v8 = [MEMORY[0x1E4F84D50] sharedService];
      uint64_t v9 = [(PKAccountTermsAndConditionsController *)v6 initWithAccount:v7 webService:v8 context:0 termsIdentifier:v5];
      id v10 = v3[16];
      v3[16] = (id)v9;

      [v3[13] setShowSpinner:1];
      uint64_t v11 = [v3 dynamicCollectionDelegate];
      [v11 reloadItem:v3[13] animated:1];

      id v12 = v3[16];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __79__PKPayLaterFinancingPlanCostSectionController__configureLoanAgreementSection___block_invoke_2;
      v16[3] = &unk_1E59CB9C8;
      objc_copyWeak(&v17, v1);
      [v12 termsViewControllerWithCompletion:v16];
      objc_destroyWeak(&v17);
    }
    else
    {
      int v13 = PKAccountDisplayableError();
      id v14 = PKAlertForDisplayableErrorWithHandlers(v13, 0, 0, 0);

      if (v14)
      {
        v15 = [v3 dynamicCollectionDelegate];
        [v15 presentViewController:v14 animated:1 completion:0];
      }
    }
  }
}

void __79__PKPayLaterFinancingPlanCostSectionController__configureLoanAgreementSection___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v5)
    {
      id v7 = PKAlertForDisplayableErrorWithHandlers(v5, 0, 0, 0);
      uint64_t v8 = [WeakRetained dynamicCollectionDelegate];
      [v8 presentViewController:v7 animated:1 completion:0];
    }
    else
    {
      if (!v10)
      {
LABEL_7:
        [WeakRetained[13] setShowSpinner:0];
        uint64_t v9 = [WeakRetained dynamicCollectionDelegate];
        [v9 reloadItem:WeakRetained[13] animated:1];

        goto LABEL_8;
      }
      id v7 = [WeakRetained dynamicCollectionDelegate];
      [v7 presentViewController:v10 animated:1 completion:0];
    }

    goto LABEL_7;
  }
LABEL_8:
}

- (void)_configureIssuerBrandSection:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v4 = a3;
  id v8 = objc_alloc_init(v3);
  id v5 = PKUIImageNamed(@"PayLater_MasterCard_Logo");
  int v6 = [[PKPayLaterImageRow alloc] initWithImage:v5];
  -[PKPayLaterImageRow setContentEdgeInsets:](v6, "setContentEdgeInsets:", 0.0, 12.0, 0.0, 0.0);
  [v8 safelyAddObject:v6];
  id v7 = (void *)[v8 copy];
  [v4 appendItems:v7];
}

- (PKPayLaterFinancingPlan)financingPlan
{
  return self->_financingPlan;
}

- (void)setFinancingPlan:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_financingPlan, 0);
  objc_storeStrong((id *)&self->_termsController, 0);
  objc_storeStrong((id *)&self->_loanIdentifierRow, 0);
  objc_storeStrong((id *)&self->_payLaterPass, 0);
  objc_storeStrong((id *)&self->_loanAgreementButton, 0);

  objc_storeStrong((id *)&self->_transactionDateFormatter, 0);
}

@end