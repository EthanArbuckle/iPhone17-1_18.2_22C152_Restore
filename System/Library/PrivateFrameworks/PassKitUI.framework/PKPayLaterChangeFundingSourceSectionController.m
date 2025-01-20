@interface PKPayLaterChangeFundingSourceSectionController
- (BOOL)_shouldShowAddPaymentMethodSection;
- (BOOL)_shouldShowAutoPaymentAgreementSection;
- (BOOL)_shouldShowNextPaymentSection;
- (CGSize)_passImageSize;
- (PKAccountWebServiceFinancingPlanPaymentIntentResponse)intentDetails;
- (PKPayLaterChangeFundingSourceSectionController)initWithFinancingPlan:(id)a3 payLaterPass:(id)a4 paymentIntentController:(id)a5 intentDetails:(id)a6 dynamicContentPage:(id)a7 delegate:(id)a8;
- (PKPayLaterFinancingPlan)financingPlan;
- (PKPayLaterPaymentIntentController)paymentIntentController;
- (id)_paymentSourceRowForBankFundingSource:(id)a3;
- (id)_paymentSourceRowForPassFundingSource:(id)a3;
- (id)_rowForPaymentSource:(id)a3;
- (id)_snapshotForPass:(id)a3 completion:(id)a4;
- (id)_unavailablePaymentSourceRowForFundingSource:(id)a3;
- (id)footerContentForSectionIdentifier:(id)a3;
- (id)headerAttributedStringForIdentifier:(id)a3;
- (id)identifiers;
- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4;
- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4;
- (void)_configureAddPaymentMethodSection:(id)a3;
- (void)_configureAutoPaymentAgreementSection:(id)a3;
- (void)_configureAutoPaymentNextPaymentSection:(id)a3;
- (void)_configureAutoPaymentSection:(id)a3;
- (void)_configureFundingSourceSection:(id)a3;
- (void)_handleAutoPaySwitchEnabled:(BOOL)a3;
- (void)_presentAutoPayOverdueAlertWithCompletion:(id)a3;
- (void)_presentMakePaymentWithCompletion:(id)a3;
- (void)_presentProvisioningFlowFromRow:(id)a3;
- (void)_showButtonSpinnerForRow:(id)a3 showSpinner:(BOOL)a4;
- (void)_updateCachedValues;
- (void)paymentSetupDidFinish:(id)a3;
- (void)setFinancingPlan:(id)a3;
- (void)setIntentDetails:(id)a3;
- (void)setPaymentIntentController:(id)a3;
@end

@implementation PKPayLaterChangeFundingSourceSectionController

- (PKPayLaterChangeFundingSourceSectionController)initWithFinancingPlan:(id)a3 payLaterPass:(id)a4 paymentIntentController:(id)a5 intentDetails:(id)a6 dynamicContentPage:(id)a7 delegate:(id)a8
{
  id v34 = a3;
  id v33 = a4;
  id v15 = a5;
  id v32 = a6;
  id v16 = a8;
  id v17 = a7;
  v18 = [v15 payLaterAccount];
  v35.receiver = self;
  v35.super_class = (Class)PKPayLaterChangeFundingSourceSectionController;
  v19 = [(PKPayLaterSectionController *)&v35 initWithPayLaterAccount:v18 dynamicContentPage:v17 viewControllerDelegate:v16];

  if (v19)
  {
    objc_storeStrong((id *)&v19->_financingPlan, a3);
    v20 = [(PKPayLaterFinancingPlan *)v19->_financingPlan fundingSource];
    v19->_autoPayment = [v20 autoPayment];

    objc_storeStrong((id *)&v19->_intentDetails, a6);
    objc_storeStrong((id *)&v19->_payLaterPass, a4);
    objc_storeStrong((id *)&v19->_paymentIntentController, a5);
    uint64_t v21 = [v15 peerPaymentAccount];
    peerPaymentAccount = v19->_peerPaymentAccount;
    v19->_peerPaymentAccount = (PKPeerPaymentAccount *)v21;

    objc_storeWeak((id *)&v19->_delegate, v16);
    v23 = objc_alloc_init(PKPassSnapshotter);
    snapshotter = v19->_snapshotter;
    v19->_snapshotter = v23;

    v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    paymentSourceRows = v19->_paymentSourceRows;
    v19->_paymentSourceRows = v25;

    v27 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    dateFormatter = v19->_dateFormatter;
    v19->_dateFormatter = v27;

    v29 = v19->_dateFormatter;
    v30 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
    [(NSDateFormatter *)v29 setCalendar:v30];

    [(NSDateFormatter *)v19->_dateFormatter setDateStyle:1];
    [(PKPayLaterChangeFundingSourceSectionController *)v19 _updateCachedValues];
  }

  return v19;
}

- (id)footerContentForSectionIdentifier:(id)a3
{
  v29[2] = *MEMORY[0x1E4F143B8];
  v4 = (__CFString *)a3;
  v5 = v4;
  if (v4 == @"kAutoPaymentSection") {
    goto LABEL_4;
  }
  if (v4)
  {
    int v6 = [@"kAutoPaymentSection" isEqualToString:v4];

    if (v6)
    {
LABEL_4:
      id v7 = objc_alloc_init(MEMORY[0x1E4F84488]);
      v8 = PKLocalizedCocoonString(&cfstr_ChangeFundingS.isa);
      [v7 setFooterText:v8];

      goto LABEL_18;
    }
    v9 = v5;
    if (v9 == @"kAutoPaymentNextPaymentSection") {
      goto LABEL_14;
    }
    v10 = v9;
    char v11 = [@"kAutoPaymentNextPaymentSection" isEqualToString:v9];

    if (v11) {
      goto LABEL_14;
    }
    v12 = v10;
    if (v12 == @"kAutoPaymentAgreementSection"
      || (int v13 = [@"kAutoPaymentAgreementSection" isEqualToString:v12], v12, v13))
    {
      if (![(PKPayLaterChangeFundingSourceSectionController *)self _shouldShowNextPaymentSection])goto LABEL_14; {
    }
      }
    v14 = v12;
    if (v14 == @"kAddPaymentMethodSection"
      || (id v15 = v14,
          int v16 = [@"kAddPaymentMethodSection" isEqualToString:v14],
          v15,
          v16))
    {
      if (![(PKPayLaterChangeFundingSourceSectionController *)self _shouldShowAutoPaymentAgreementSection])
      {
LABEL_14:
        id v7 = objc_alloc_init(MEMORY[0x1E4F84488]);
        id v17 = PKLocalizedCocoonString(&cfstr_ApplePayLaterA.isa);
        v18 = PKLocalizedCocoonString(&cfstr_LoanAgreementB.isa);
        uint64_t v19 = PKLocalizedCocoonString(&cfstr_NextPaymentFoo.isa, &cfstr_12.isa, v17, v18);
        [v7 setFooterText:v19];
        id v20 = objc_alloc_init(MEMORY[0x1E4F84490]);
        [v20 setLinkText:v17];
        uint64_t v21 = [(PKPaymentPass *)self->_payLaterPass localizedValueForFieldKey:*MEMORY[0x1E4F87A80]];
        v28 = (void *)v19;
        if (v21)
        {
          v22 = [MEMORY[0x1E4F1CB10] URLWithString:v21];
        }
        else
        {
          v22 = 0;
        }
        [v20 setLinkURL:v22];
        id v23 = objc_alloc_init(MEMORY[0x1E4F84490]);
        [v23 setLinkText:v18];
        v24 = [(PKPayLaterFinancingPlan *)self->_financingPlan termsDetails];
        v25 = [v24 installmentAgreementIdentifier];
        [v23 setTermsIdentifier:v25];

        v29[0] = v20;
        v29[1] = v23;
        v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
        [v7 setLinks:v26];

        goto LABEL_18;
      }
    }
  }
  id v7 = 0;
LABEL_18:

  return v7;
}

- (id)headerAttributedStringForIdentifier:(id)a3
{
  v20[2] = *MEMORY[0x1E4F143B8];
  v3 = (__CFString *)a3;
  v4 = v3;
  if (v3 == @"kFundingSourceSection") {
    goto LABEL_4;
  }
  if (!v3) {
    goto LABEL_10;
  }
  char v5 = [@"kFundingSourceSection" isEqualToString:v3];

  if (v5)
  {
LABEL_4:
    int v6 = @"PAYMENT_METHOD_HEADER";
  }
  else
  {
    id v15 = v4;
    if (v15 != @"kAutoPaymentNextPaymentSection")
    {
      int v16 = v15;
      int v17 = [@"kAutoPaymentNextPaymentSection" isEqualToString:v15];

      if (!v17) {
        goto LABEL_10;
      }
    }
    int v6 = @"NEXT_PAYMENT_HEADER";
  }
  uint64_t v7 = PKLocalizedCocoonString(&v6->isa);
  if (v7)
  {
    v8 = (void *)v7;
    id v9 = objc_alloc(MEMORY[0x1E4F28B18]);
    v10 = [v8 uppercaseString];
    v19[0] = *MEMORY[0x1E4FB06F8];
    char v11 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB28F0], (void *)*MEMORY[0x1E4FB27D0], 0, 0);
    v20[0] = v11;
    v19[1] = *MEMORY[0x1E4FB0700];
    v12 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    v20[1] = v12;
    int v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
    v14 = (void *)[v9 initWithString:v10 attributes:v13];

    goto LABEL_11;
  }
LABEL_10:
  v14 = 0;
LABEL_11:

  return v14;
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  id v6 = a4;
  v24.receiver = self;
  v24.super_class = (Class)PKPayLaterChangeFundingSourceSectionController;
  uint64_t v7 = [(PKPayLaterSectionController *)&v24 layoutWithLayoutEnvironment:a3 sectionIdentifier:v6];
  [v7 contentInsets];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  int v16 = (__CFString *)v6;
  int v17 = v16;
  double v18 = 16.0;
  if (v16 != @"kAutoPaymentSection")
  {
    if (v16)
    {
      char v19 = [@"kAutoPaymentSection" isEqualToString:v16];

      if ((v19 & 1) == 0)
      {
        id v20 = v17;
        if (v20 == @"kAutoPaymentAgreementSection"
          || (uint64_t v21 = v20,
              int v22 = [@"kAutoPaymentAgreementSection" isEqualToString:v20],
              v21,
              double v18 = v9,
              v22))
        {
          double v18 = v9 + 30.0;
        }
      }
    }
    else
    {
      double v18 = v9;
    }
  }
  objc_msgSend(v7, "setContentInsets:", v18, v11, v13, v15);

  return v7;
}

- (id)identifiers
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 addObject:@"kAutoPaymentSection"];
  [v3 addObject:@"kFundingSourceSection"];
  if ([(PKPayLaterChangeFundingSourceSectionController *)self _shouldShowAddPaymentMethodSection])
  {
    [v3 addObject:@"kAddPaymentMethodSection"];
  }
  if ([(PKPayLaterChangeFundingSourceSectionController *)self _shouldShowAutoPaymentAgreementSection])
  {
    [v3 addObject:@"kAutoPaymentAgreementSection"];
    if ([(PKPayLaterChangeFundingSourceSectionController *)self _shouldShowNextPaymentSection])
    {
      [v3 addObject:@"kAutoPaymentNextPaymentSection"];
    }
  }
  v4 = (void *)[v3 copy];

  return v4;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4FB1358]);
  uint64_t v7 = (__CFString *)v5;
  double v8 = v7;
  if (v7 == @"kAutoPaymentSection") {
    goto LABEL_4;
  }
  if (!v7) {
    goto LABEL_5;
  }
  int v9 = [@"kAutoPaymentSection" isEqualToString:v7];

  if (v9)
  {
LABEL_4:
    [(PKPayLaterChangeFundingSourceSectionController *)self _configureAutoPaymentSection:v6];
  }
  else
  {
    double v11 = v8;
    if (v11 == @"kFundingSourceSection"
      || (v12 = v11, int v13 = [@"kFundingSourceSection" isEqualToString:v11], v12, v13))
    {
      [(PKPayLaterChangeFundingSourceSectionController *)self _configureFundingSourceSection:v6];
    }
    else
    {
      double v14 = v12;
      if (v14 == @"kAddPaymentMethodSection"
        || (double v15 = v14,
            int v16 = [@"kAddPaymentMethodSection" isEqualToString:v14],
            v15,
            v16))
      {
        [(PKPayLaterChangeFundingSourceSectionController *)self _configureAddPaymentMethodSection:v6];
      }
      else
      {
        int v17 = v15;
        if (v17 == @"kAutoPaymentAgreementSection"
          || (double v18 = v17,
              int v19 = [@"kAutoPaymentAgreementSection" isEqualToString:v17],
              v18,
              v19))
        {
          [(PKPayLaterChangeFundingSourceSectionController *)self _configureAutoPaymentAgreementSection:v6];
        }
        else
        {
          id v20 = v18;
          if (v20 == @"kAutoPaymentNextPaymentSection"
            || (uint64_t v21 = v20,
                int v22 = [@"kAutoPaymentNextPaymentSection" isEqualToString:v20],
                v21,
                v22))
          {
            [(PKPayLaterChangeFundingSourceSectionController *)self _configureAutoPaymentNextPaymentSection:v6];
          }
        }
      }
    }
  }
LABEL_5:

  return v6;
}

- (void)_configureAutoPaymentSection:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  objc_initWeak(&location, self);
  autoPaySwitchRow = self->_autoPaySwitchRow;
  if (!autoPaySwitchRow)
  {
    uint64_t v7 = [PKPayLaterSwitchRow alloc];
    double v8 = PKLocalizedCocoonString(&cfstr_AutoPay.isa);
    BOOL autoPayment = self->_autoPayment;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __79__PKPayLaterChangeFundingSourceSectionController__configureAutoPaymentSection___block_invoke;
    v13[3] = &unk_1E59D7748;
    objc_copyWeak(&v14, &location);
    v13[4] = self;
    double v10 = [(PKPayLaterSwitchRow *)v7 initWithTitle:v8 on:autoPayment changeHandler:v13];
    double v11 = self->_autoPaySwitchRow;
    self->_autoPaySwitchRow = v10;

    objc_destroyWeak(&v14);
    autoPaySwitchRow = self->_autoPaySwitchRow;
  }
  [(PKPayLaterSwitchRow *)autoPaySwitchRow setOn:self->_autoPayment];
  [v5 addObject:self->_autoPaySwitchRow];
  double v12 = (void *)[v5 copy];
  [v4 appendItems:v12];

  objc_destroyWeak(&location);
}

void __79__PKPayLaterChangeFundingSourceSectionController__configureAutoPaymentSection___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained && !*((unsigned char *)WeakRetained + 129)) {
    objc_msgSend(*(id *)(a1 + 32), "_handleAutoPaySwitchEnabled:", objc_msgSend(v5, "BOOLValue"));
  }
}

- (void)_configureFundingSourceSection:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v25 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  availableFundingSources = self->_availableFundingSources;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __81__PKPayLaterChangeFundingSourceSectionController__configureFundingSourceSection___block_invoke;
  v32[3] = &unk_1E59D7770;
  v32[4] = self;
  char v6 = [(NSArray *)availableFundingSources pk_containsObjectPassingTest:v32];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  double v8 = v7;
  if ((v6 & 1) == 0) {
    [v7 addObject:self->_selectedFundingSource];
  }
  objc_msgSend(v8, "addObjectsFromArray:", self->_availableFundingSources, v25);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v8;
  uint64_t v9 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(obj);
        }
        int v13 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v14 = [v13 type];
        switch(v14)
        {
          case 3:
            uint64_t v15 = [(PKPayLaterChangeFundingSourceSectionController *)self _unavailablePaymentSourceRowForFundingSource:v13];
            goto LABEL_14;
          case 2:
            uint64_t v15 = [(PKPayLaterChangeFundingSourceSectionController *)self _paymentSourceRowForBankFundingSource:v13];
            goto LABEL_14;
          case 1:
            uint64_t v15 = [(PKPayLaterChangeFundingSourceSectionController *)self _paymentSourceRowForPassFundingSource:v13];
LABEL_14:
            int v16 = (void *)v15;
            goto LABEL_16;
        }
        int v16 = 0;
LABEL_16:
        [v16 setDisabled:!self->_autoPayment];
        selectedFundingSourceCellIdentifier = self->_selectedFundingSourceCellIdentifier;
        double v18 = [v13 identifier];
        int v19 = selectedFundingSourceCellIdentifier;
        id v20 = v18;
        uint64_t v21 = v20;
        if (v19 == v20)
        {
          uint64_t v23 = 1;
        }
        else
        {
          if (v19) {
            BOOL v22 = v20 == 0;
          }
          else {
            BOOL v22 = 1;
          }
          uint64_t v23 = !v22 && [(NSString *)v19 isEqualToString:v20];
        }

        [v16 setSelected:v23];
        [v4 safelyAddObject:v16];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v10);
  }

  objc_super v24 = (void *)[v4 copy];
  [v26 appendItems:v24];
}

uint64_t __81__PKPayLaterChangeFundingSourceSectionController__configureFundingSourceSection___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 160);
  id v3 = a2;
  id v4 = [v2 identifier];
  id v5 = [v3 identifier];

  id v6 = v4;
  id v7 = v5;
  double v8 = v7;
  if (v6 == v7)
  {
    uint64_t v10 = 1;
  }
  else
  {
    if (v6) {
      BOOL v9 = v7 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9) {
      uint64_t v10 = 0;
    }
    else {
      uint64_t v10 = [v6 isEqualToString:v7];
    }
  }

  return v10;
}

- (void)_configureAddPaymentMethodSection:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  addPaymentMethodRow = self->_addPaymentMethodRow;
  if (!addPaymentMethodRow)
  {
    if (([(PKAccountWebServiceFinancingPlanPaymentIntentResponse *)self->_intentDetails supportedRepaymentTypes] & 0xA) != 0)id v7 = @"ADD_PAYMENT_METHOD"; {
    else
    }
      id v7 = @"ADD_DEBIT_CARD";
    double v8 = PKLocalizedCocoonString(&v7->isa);
    objc_initWeak(&location, self);
    BOOL v9 = [PKPayLaterButtonRow alloc];
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    uint64_t v15 = __84__PKPayLaterChangeFundingSourceSectionController__configureAddPaymentMethodSection___block_invoke;
    int v16 = &unk_1E59CA7F8;
    objc_copyWeak(&v17, &location);
    uint64_t v10 = [(PKPayLaterButtonRow *)v9 initWithTitle:v8 selectionHandler:&v13];
    uint64_t v11 = self->_addPaymentMethodRow;
    self->_addPaymentMethodRow = v10;

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);

    addPaymentMethodRow = self->_addPaymentMethodRow;
  }
  -[PKPayLaterButtonRow setDisabled:](addPaymentMethodRow, "setDisabled:", !self->_autoPayment, v13, v14, v15, v16);
  [v5 addObject:self->_addPaymentMethodRow];
  double v12 = (void *)[v5 copy];
  [v4 appendItems:v12];
}

void __84__PKPayLaterChangeFundingSourceSectionController__configureAddPaymentMethodSection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    [WeakRetained _presentProvisioningFlowFromRow:WeakRetained[18]];
    id WeakRetained = v2;
  }
}

- (void)_configureAutoPaymentAgreementSection:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v4 = a3;
  id v14 = objc_alloc_init(v3);
  id v5 = [PKPayLaterTitleDetailRow alloc];
  id v6 = PKLocalizedCocoonString(&cfstr_PaymentTypeRow.isa);
  id v7 = PKLocalizedCocoonString(&cfstr_AutoPay.isa);
  double v8 = [(PKPayLaterTitleDetailRow *)v5 initWithTitle:v6 detail:v7 selectionHandler:0];

  [v14 safelyAddObject:v8];
  BOOL v9 = [PKPayLaterTitleDetailRow alloc];
  uint64_t v10 = PKLocalizedCocoonString(&cfstr_RepeatsRow.isa);
  uint64_t v11 = PKLocalizedCocoonString(&cfstr_PaymentDueDate.isa);
  double v12 = [(PKPayLaterTitleDetailRow *)v9 initWithTitle:v10 detail:v11 selectionHandler:0];

  [v14 safelyAddObject:v12];
  uint64_t v13 = (void *)[v14 copy];
  [v4 appendItems:v13];
}

- (void)_configureAutoPaymentNextPaymentSection:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v21 = objc_alloc_init(v4);
  id v6 = [(PKPayLaterFinancingPlan *)self->_financingPlan scheduleSummary];
  id v7 = [v6 nextDueInstallment];

  dateFormatter = self->_dateFormatter;
  BOOL v9 = [v7 dueDate];
  uint64_t v10 = [(NSDateFormatter *)dateFormatter stringFromDate:v9];

  uint64_t v11 = [v7 currentBalance];
  id v12 = [v11 formattedStringValue];

  if (([(PKPayLaterFinancingPlan *)self->_financingPlan state] & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    uint64_t v13 = PKLocalizedCocoonString(&cfstr_NextPaymentRow.isa);

    id v12 = v13;
    uint64_t v10 = v12;
  }
  id v14 = [PKPayLaterTitleDetailRow alloc];
  uint64_t v15 = PKLocalizedCocoonString(&cfstr_NextPaymentRow_0.isa);
  int v16 = [(PKPayLaterTitleDetailRow *)v14 initWithTitle:v15 detail:v10 selectionHandler:0];

  [v21 safelyAddObject:v16];
  id v17 = [PKPayLaterTitleDetailRow alloc];
  double v18 = PKLocalizedCocoonString(&cfstr_NextPaymentRow_1.isa);
  int v19 = [(PKPayLaterTitleDetailRow *)v17 initWithTitle:v18 detail:v12 selectionHandler:0];

  [v21 safelyAddObject:v19];
  id v20 = (void *)[v21 copy];
  [v5 appendItems:v20];
}

- (BOOL)_shouldShowNextPaymentSection
{
  if (([(PKPayLaterFinancingPlan *)self->_financingPlan state] & 0xFFFFFFFFFFFFFFFELL) == 2) {
    return 1;
  }
  id v4 = [(PKPayLaterFinancingPlan *)self->_financingPlan scheduleSummary];
  id v5 = [v4 nextDueInstallment];
  BOOL v3 = v5 != 0;

  return v3;
}

- (BOOL)_shouldShowAutoPaymentAgreementSection
{
  v2 = [(PKPayLaterFinancingPlan *)self->_financingPlan fundingSource];
  char v3 = [v2 autoPayment];

  return v3;
}

- (BOOL)_shouldShowAddPaymentMethodSection
{
  return [(PKPayLaterFinancingPlan *)self->_financingPlan state] != 3;
}

- (id)_paymentSourceRowForPassFundingSource:(id)a3
{
  id v4 = a3;
  id v5 = [v4 paymentPass];
  if (!v5)
  {
    id v9 = 0;
    goto LABEL_16;
  }
  paymentSourceRows = self->_paymentSourceRows;
  id v7 = [v4 identifier];
  double v8 = [(NSMutableDictionary *)paymentSourceRows objectForKey:v7];

  if (!v8)
  {
    uint64_t v10 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount associatedPassUniqueID];
    objc_initWeak(&location, self);
    uint64_t v11 = [(PKPayLaterChangeFundingSourceSectionController *)self _rowForPaymentSource:v4];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __88__PKPayLaterChangeFundingSourceSectionController__paymentSourceRowForPassFundingSource___block_invoke;
    v24[3] = &unk_1E59D0588;
    objc_copyWeak(&v26, &location);
    id v12 = v4;
    id v25 = v12;
    uint64_t v13 = [(PKPayLaterChangeFundingSourceSectionController *)self _snapshotForPass:v5 completion:v24];
    [v11 setImage:v13];

    id v14 = [v5 uniqueID];
    id v15 = v10;
    id v16 = v14;
    if (v15 == v16)
    {
    }
    else
    {
      id v17 = v16;
      if (!v15 || !v16)
      {
        id v20 = v15;
        int v19 = v16;
        goto LABEL_13;
      }
      int v18 = [v15 isEqualToString:v16];

      if (!v18) {
        goto LABEL_14;
      }
    }
    int v19 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount currentBalance];
    id v20 = [v19 formattedStringValue];
    id v17 = PKLocalizedCocoonString(&cfstr_PeerPaymentInA.isa, &stru_1EF1B4C70.isa, v20);
    [v11 setOverrideSecondaryText:v17];
LABEL_13:

LABEL_14:
    id v21 = self->_paymentSourceRows;
    BOOL v22 = [v12 identifier];
    [(NSMutableDictionary *)v21 setObject:v11 forKey:v22];

    id v9 = v11;
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);

    goto LABEL_15;
  }
  id v9 = v8;
LABEL_15:

LABEL_16:

  return v9;
}

void __88__PKPayLaterChangeFundingSourceSectionController__paymentSourceRowForPassFundingSource___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__PKPayLaterChangeFundingSourceSectionController__paymentSourceRowForPassFundingSource___block_invoke_2;
  block[3] = &unk_1E59CB378;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v6 = *(id *)(a1 + 32);
  id v7 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v8);
}

void __88__PKPayLaterChangeFundingSourceSectionController__paymentSourceRowForPassFundingSource___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained && !*((unsigned char *)WeakRetained + 129))
  {
    id v3 = (void *)WeakRetained[22];
    id v9 = WeakRetained;
    id v4 = [*(id *)(a1 + 32) identifier];
    id v5 = [v3 objectForKeyedSubscript:v4];

    [v5 setImage:*(void *)(a1 + 40)];
    id v6 = [v9 dynamicCollectionDelegate];
    [v6 reloadItem:v5 animated:1];

    id v7 = (void *)v9[22];
    id v8 = [*(id *)(a1 + 32) identifier];
    [v7 setObject:v5 forKey:v8];

    id WeakRetained = v9;
  }
}

- (id)_paymentSourceRowForBankFundingSource:(id)a3
{
  id v4 = a3;
  id v5 = [v4 accountPaymentFundingSource];
  id v6 = v5;
  if (v5)
  {
    paymentSourceRows = self->_paymentSourceRows;
    id v8 = [v5 identifier];
    id v9 = [(NSMutableDictionary *)paymentSourceRows objectForKey:v8];

    if (v9)
    {
      id v10 = v9;
    }
    else
    {
      uint64_t v11 = (void *)MEMORY[0x1E4FB1818];
      id v12 = PKPassKitUIBundle();
      uint64_t v13 = [v11 imageNamed:@"BankAccountCard" inBundle:v12];

      id v14 = [(PKPayLaterChangeFundingSourceSectionController *)self _rowForPaymentSource:v4];
      [v14 setImage:v13];
      id v15 = self->_paymentSourceRows;
      id v16 = [v4 identifier];
      [(NSMutableDictionary *)v15 setObject:v14 forKey:v16];

      id v10 = v14;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)_unavailablePaymentSourceRowForFundingSource:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    paymentSourceRows = self->_paymentSourceRows;
    id v7 = [v4 identifier];
    id v8 = [(NSMutableDictionary *)paymentSourceRows objectForKey:v7];

    if (v8)
    {
      id v9 = v8;
    }
    else
    {
      id v10 = PKUIImageNamed(@"PlaceholderCardArt_Large");
      id v11 = objc_alloc(MEMORY[0x1E4F84780]);
      id v12 = v10;
      uint64_t v13 = objc_msgSend(v11, "initWithCGImage:scale:orientation:", objc_msgSend(v12, "CGImage"), 1, PKUIScreenScale());
      id v14 = (void *)MEMORY[0x1E4F84790];
      [(PKPayLaterChangeFundingSourceSectionController *)self _passImageSize];
      id v15 = objc_msgSend(v14, "constraintsWithAspectFillToSize:");
      id v16 = [v13 resizedImageWithConstraints:v15];

      id v17 = [MEMORY[0x1E4FB1818] imageWithPKImage:v16];

      int v18 = [(PKPayLaterChangeFundingSourceSectionController *)self _rowForPaymentSource:v5];
      [v18 setImage:v17];
      int v19 = self->_paymentSourceRows;
      id v20 = [v5 identifier];
      [(NSMutableDictionary *)v19 setObject:v18 forKey:v20];

      id v9 = v18;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)_rowForPaymentSource:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifier];
  objc_initWeak(&location, self);
  id v6 = [PKPayLaterPaymentSourceRow alloc];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __71__PKPayLaterChangeFundingSourceSectionController__rowForPaymentSource___block_invoke;
  v11[3] = &unk_1E59CB378;
  objc_copyWeak(&v14, &location);
  id v7 = v5;
  id v12 = v7;
  id v8 = v4;
  id v13 = v8;
  id v9 = [(PKPayLaterPaymentSourceRow *)v6 initWithPayLaterPaymentSource:v8 selectionHandler:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v9;
}

void __71__PKPayLaterChangeFundingSourceSectionController__rowForPaymentSource___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained && !*((unsigned char *)WeakRetained + 129))
  {
    id v20 = WeakRetained;
    if (*(void *)(a1 + 32))
    {
      uint64_t v4 = objc_msgSend(WeakRetained[22], "objectForKeyedSubscript:");
      id v3 = v20;
      id v5 = (void *)v4;
    }
    else
    {
      id v5 = 0;
    }
    id v6 = v3[20];
    id v7 = [v6 identifier];
    id v8 = *(void **)(a1 + 32);
    id v9 = v7;
    id v10 = v8;
    if (v9 != v10)
    {
      id v11 = v10;
      if (v9) {
        BOOL v12 = v10 == 0;
      }
      else {
        BOOL v12 = 1;
      }
      if (v12)
      {
      }
      else
      {
        int v13 = [v9 isEqualToString:v10];

        if (v13) {
          goto LABEL_15;
        }
      }
      objc_storeStrong(v20 + 21, *(id *)(a1 + 32));
      id v15 = objc_loadWeakRetained(v20 + 13);
      [v15 didSelectFundingSource:*(void *)(a1 + 40)];

      if (!v6)
      {
        id v16 = [v20 dynamicCollectionDelegate];
        [v16 reloadDataForSectionIdentifier:@"kAutoPaymentSection" animated:0];
      }
      id v14 = [v20[22] objectForKeyedSubscript:v9];
      if (v5)
      {
        [v5 setSelected:1];
        [v20[22] setObject:v5 forKey:*(void *)(a1 + 32)];
        if (v14)
        {
          [v14 setSelected:0];
          [v20[22] setObject:v14 forKey:v9];
          id v17 = [v20 dynamicCollectionDelegate];
          [v17 reloadItem:v14 animated:1];
        }
        int v18 = [v20 dynamicCollectionDelegate];
        [v18 reloadItem:v5 animated:1];
      }
      int v19 = [v20 dynamicCollectionDelegate];
      [v19 reloadDataForSectionIdentifier:@"kFundingSourceSection" animated:1];

      goto LABEL_23;
    }

LABEL_15:
    id v14 = [v20 dynamicCollectionDelegate];
    [v14 reloadItem:v5 animated:1];
LABEL_23:

    id v3 = v20;
  }
}

- (void)_presentProvisioningFlowFromRow:(id)a3
{
  id v4 = a3;
  if (!self->_preventTouches)
  {
    self->_preventTouches = 1;
    id v5 = [MEMORY[0x1E4F84D50] sharedService];
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F84BB8]) initWithWebService:v5];
    id v7 = [(PKAccountWebServiceFinancingPlanPaymentIntentResponse *)self->_intentDetails supportedRepaymentNetworks];
    [v6 setAllowedPaymentNetworks:v7];

    id v8 = [MEMORY[0x1E4F1CAD0] set];
    [v6 setAllowedFeatureIdentifiers:v8];

    [(PKPayLaterChangeFundingSourceSectionController *)self _showButtonSpinnerForRow:v4 showSpinner:1];
    objc_initWeak(&location, self);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __82__PKPayLaterChangeFundingSourceSectionController__presentProvisioningFlowFromRow___block_invoke;
    v10[3] = &unk_1E59CE810;
    objc_copyWeak(&v14, &location);
    id v11 = v4;
    id v9 = v6;
    id v12 = v9;
    int v13 = self;
    [v9 preflightWithCompletion:v10];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

void __82__PKPayLaterChangeFundingSourceSectionController__presentProvisioningFlowFromRow___block_invoke(id *a1, char a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      id v8 = [[PKPaymentSetupNavigationController alloc] initWithProvisioningController:a1[5] context:8];
      [(PKPaymentSetupNavigationController *)v8 setPaymentSetupMode:1];
      [(PKPaymentSetupNavigationController *)v8 setAllowsManualEntry:1];
      [(PKPaymentSetupNavigationController *)v8 setSetupDelegate:v7];
      [(PKNavigationController *)v8 setCustomFormSheetPresentationStyleForiPad];
      objc_initWeak(&location, a1[6]);
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __82__PKPayLaterChangeFundingSourceSectionController__presentProvisioningFlowFromRow___block_invoke_2;
      v12[3] = &unk_1E59CCC78;
      objc_copyWeak(&v15, &location);
      id v9 = v8;
      int v13 = v9;
      id v14 = a1[4];
      [(PKPaymentSetupNavigationController *)v9 preflightWithCompletion:v12];

      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
    else
    {
      WeakRetained[129] = 0;
      [WeakRetained _showButtonSpinnerForRow:a1[4] showSpinner:0];
      id v10 = [a1[5] alertForDisplayableError:v5];
      if (v10)
      {
        id v11 = [v7 dynamicCollectionDelegate];
        [v11 presentViewController:v10 animated:1 completion:0];
      }
    }
  }
}

void __82__PKPayLaterChangeFundingSourceSectionController__presentProvisioningFlowFromRow___block_invoke_2(uint64_t a1)
{
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = [WeakRetained dynamicCollectionDelegate];
    uint64_t v6 = *(void *)(a1 + 32);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __82__PKPayLaterChangeFundingSourceSectionController__presentProvisioningFlowFromRow___block_invoke_3;
    v7[3] = &unk_1E59CB010;
    objc_copyWeak(&v9, v2);
    id v8 = *(id *)(a1 + 40);
    [v5 presentViewController:v6 animated:1 completion:v7];

    objc_destroyWeak(&v9);
  }
}

void __82__PKPayLaterChangeFundingSourceSectionController__presentProvisioningFlowFromRow___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    WeakRetained[129] = 0;
    id v3 = WeakRetained;
    [WeakRetained _showButtonSpinnerForRow:*(void *)(a1 + 32) showSpinner:0];
    id WeakRetained = v3;
  }
}

- (id)_snapshotForPass:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    objc_initWeak(&location, self);
    snapshotter = self->_snapshotter;
    [(PKPayLaterChangeFundingSourceSectionController *)self _passImageSize];
    double v10 = v9;
    double v12 = v11;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __78__PKPayLaterChangeFundingSourceSectionController__snapshotForPass_completion___block_invoke;
    v14[3] = &unk_1E59CBBA8;
    objc_copyWeak(&v16, &location);
    id v15 = v7;
    -[PKPassSnapshotter snapshotWithPass:size:completion:](snapshotter, "snapshotWithPass:size:completion:", v6, v14, v10, v12);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return 0;
}

void __78__PKPayLaterChangeFundingSourceSectionController__snapshotForPass_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__PKPayLaterChangeFundingSourceSectionController__snapshotForPass_completion___block_invoke_2;
  block[3] = &unk_1E59CA960;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v9);
}

void __78__PKPayLaterChangeFundingSourceSectionController__snapshotForPass_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3)
    {
      id v4 = WeakRetained;
      (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 32));
      id WeakRetained = v4;
    }
  }
}

- (CGSize)_passImageSize
{
  PKPassFrontFaceContentSize();

  PKSizeAspectFit();
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_showButtonSpinnerForRow:(id)a3 showSpinner:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if (objc_opt_respondsToSelector())
  {
    [v7 setShowSpinner:v4];
    id v6 = [(PKPayLaterSectionController *)self dynamicCollectionDelegate];
    [v6 reloadItem:v7 animated:1];
  }
}

- (void)_handleAutoPaySwitchEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__PKPayLaterChangeFundingSourceSectionController__handleAutoPaySwitchEnabled___block_invoke;
  aBlock[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v18, &location);
  id v5 = _Block_copy(aBlock);
  self->_BOOL autoPayment = v3;
  if (v3 && ![(NSArray *)self->_availableFundingSources count])
  {
    [(PKPayLaterChangeFundingSourceSectionController *)self _presentProvisioningFlowFromRow:self->_autoPaySwitchRow];
  }
  else
  {
    id v6 = [(PKPayLaterFinancingPlan *)self->_financingPlan scheduleSummary];
    id v7 = [v6 installments];
    id v8 = objc_msgSend(v7, "pk_firstObjectPassingTest:", &__block_literal_global_131);

    self->_preventTouches = 1;
    [(PKPayLaterSwitchRow *)self->_autoPaySwitchRow setShowSpinner:1];
    id v9 = [(PKPayLaterSectionController *)self dynamicCollectionDelegate];
    [v9 reloadItem:self->_autoPaySwitchRow animated:1];

    double v10 = [(PKPayLaterSectionController *)self dynamicCollectionDelegate];
    [v10 reloadDataAnimated:1];

    if (v3 && v8)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __78__PKPayLaterChangeFundingSourceSectionController__handleAutoPaySwitchEnabled___block_invoke_3;
      v15[3] = &unk_1E59CAD18;
      v15[4] = self;
      id v16 = v5;
      [(PKPayLaterChangeFundingSourceSectionController *)self _presentAutoPayOverdueAlertWithCompletion:v15];
      double v11 = v16;
    }
    else
    {
      self->_BOOL autoPayment = v3;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __78__PKPayLaterChangeFundingSourceSectionController__handleAutoPaySwitchEnabled___block_invoke_4;
      v13[3] = &unk_1E59CAA98;
      id v14 = v5;
      [WeakRetained didUpdateAutoPayment:v3 completion:v13];

      double v11 = v14;
    }
  }
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __78__PKPayLaterChangeFundingSourceSectionController__handleAutoPaySwitchEnabled___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 129) = 0;
    BOOL v4 = WeakRetained;
    [*((id *)WeakRetained + 19) setShowSpinner:0];
    double v2 = [v4 dynamicCollectionDelegate];
    [v2 reloadItem:v4[19] animated:1];

    BOOL v3 = [v4 dynamicCollectionDelegate];
    [v3 reloadDataAnimated:1];

    id WeakRetained = v4;
  }
}

BOOL __78__PKPayLaterChangeFundingSourceSectionController__handleAutoPaySwitchEnabled___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 status] == 4;
}

uint64_t __78__PKPayLaterChangeFundingSourceSectionController__handleAutoPaySwitchEnabled___block_invoke_3(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 128) = 0;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __78__PKPayLaterChangeFundingSourceSectionController__handleAutoPaySwitchEnabled___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_presentAutoPayOverdueAlertWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4FB1418];
  id v6 = PKLocalizedCocoonString(&cfstr_PlanDelinquint.isa);
  id v7 = PKLocalizedCocoonString(&cfstr_PlanDelinquint_0.isa);
  id v8 = [v5 alertControllerWithTitle:v6 message:v7 preferredStyle:1];

  id v9 = (void *)MEMORY[0x1E4FB1410];
  double v10 = PKLocalizedCocoonString(&cfstr_PlanDelinquint_1.isa);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __92__PKPayLaterChangeFundingSourceSectionController__presentAutoPayOverdueAlertWithCompletion___block_invoke;
  void v20[3] = &unk_1E59D0C60;
  v20[4] = self;
  id v11 = v4;
  id v21 = v11;
  double v12 = [v9 actionWithTitle:v10 style:0 handler:v20];

  int v13 = (void *)MEMORY[0x1E4FB1410];
  id v14 = PKLocalizedCocoonString(&cfstr_PlanDelinquint_2.isa);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __92__PKPayLaterChangeFundingSourceSectionController__presentAutoPayOverdueAlertWithCompletion___block_invoke_2;
  v18[3] = &unk_1E59CB150;
  id v19 = v11;
  id v15 = v11;
  id v16 = [v13 actionWithTitle:v14 style:1 handler:v18];

  [v8 addAction:v12];
  [v8 addAction:v16];
  id v17 = [(PKPayLaterSectionController *)self dynamicCollectionDelegate];
  [v17 presentViewController:v8 animated:1 completion:0];
}

uint64_t __92__PKPayLaterChangeFundingSourceSectionController__presentAutoPayOverdueAlertWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _presentMakePaymentWithCompletion:*(void *)(a1 + 40)];
}

uint64_t __92__PKPayLaterChangeFundingSourceSectionController__presentAutoPayOverdueAlertWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_presentMakePaymentWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [[PKPayLaterMakePaymentViewController alloc] initWithFinancingPlan:self->_financingPlan paymentIntentController:self->_paymentIntentController];
  id v6 = [[PKNavigationController alloc] initWithRootViewController:v5];
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __84__PKPayLaterChangeFundingSourceSectionController__presentMakePaymentWithCompletion___block_invoke;
  v9[3] = &unk_1E59CD488;
  objc_copyWeak(&v12, &location);
  id v7 = v4;
  id v11 = v7;
  id v8 = v6;
  double v10 = v8;
  [(PKPayLaterMakePaymentViewController *)v5 preflightWithCompletion:v9];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __84__PKPayLaterChangeFundingSourceSectionController__presentMakePaymentWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v9)
    {
      id v5 = PKAccountDisplayableError();
      id v6 = PKAlertForDisplayableErrorWithHandlers(v5, 0, 0, 0);

      if (v6)
      {
        id v7 = [WeakRetained dynamicCollectionDelegate];
        [v7 presentViewController:v6 animated:1 completion:*(void *)(a1 + 40)];
      }
      else
      {
        uint64_t v8 = *(void *)(a1 + 40);
        if (v8) {
          (*(void (**)(void))(v8 + 16))();
        }
        id v6 = 0;
      }
    }
    else
    {
      id v6 = [WeakRetained dynamicCollectionDelegate];
      [v6 presentViewController:*(void *)(a1 + 32) animated:1 completion:*(void *)(a1 + 40)];
    }
  }
}

- (void)paymentSetupDidFinish:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __72__PKPayLaterChangeFundingSourceSectionController_paymentSetupDidFinish___block_invoke;
  v6[3] = &unk_1E59CA870;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __72__PKPayLaterChangeFundingSourceSectionController_paymentSetupDidFinish___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateCachedValues];
  double v2 = [*(id *)(a1 + 32) dynamicCollectionDelegate];
  [v2 reloadDataAnimated:1];

  BOOL v3 = *(void **)(a1 + 40);

  return [v3 dismissViewControllerAnimated:1 completion:0];
}

- (void)setPaymentIntentController:(id)a3
{
  id v5 = (PKPayLaterPaymentIntentController *)a3;
  if (self->_paymentIntentController != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_paymentIntentController, a3);
    [(PKPayLaterChangeFundingSourceSectionController *)self _updateCachedValues];
    id v5 = v6;
  }
}

- (void)setIntentDetails:(id)a3
{
  id v5 = (PKAccountWebServiceFinancingPlanPaymentIntentResponse *)a3;
  if (self->_intentDetails != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_intentDetails, a3);
    [(PKPayLaterChangeFundingSourceSectionController *)self _updateCachedValues];
    id v5 = v6;
  }
}

- (void)setFinancingPlan:(id)a3
{
  objc_storeStrong((id *)&self->_financingPlan, a3);

  [(PKPayLaterChangeFundingSourceSectionController *)self _updateCachedValues];
}

- (void)_updateCachedValues
{
  BOOL v3 = [(PKPayLaterFinancingPlan *)self->_financingPlan fundingSource];
  self->_BOOL autoPayment = [v3 autoPayment];

  id v4 = [(PKPayLaterFinancingPlan *)self->_financingPlan paymentSource];
  selectedFundingSource = self->_selectedFundingSource;
  self->_selectedFundingSource = v4;

  id v6 = [(PKPayLaterPaymentSource *)self->_selectedFundingSource identifier];
  selectedFundingSourceCellIdentifier = self->_selectedFundingSourceCellIdentifier;
  self->_selectedFundingSourceCellIdentifier = v6;

  uint64_t v8 = [(PKPayLaterPaymentIntentController *)self->_paymentIntentController availableFundingSourcesFilter];
  [v8 clearCache];

  paymentIntentController = self->_paymentIntentController;
  intentDetails = self->_intentDetails;
  id v13 = [(PKPayLaterFinancingPlan *)self->_financingPlan planIdentifier];
  id v11 = [(PKPayLaterPaymentIntentController *)paymentIntentController availableFundingSourcesForPaymentIntentDetails:intentDetails currencyAmount:0 planIdentifier:v13 primaryPaymentSource:self->_selectedFundingSource];
  availableFundingSources = self->_availableFundingSources;
  self->_availableFundingSources = v11;
}

- (PKPayLaterFinancingPlan)financingPlan
{
  return self->_financingPlan;
}

- (PKPayLaterPaymentIntentController)paymentIntentController
{
  return self->_paymentIntentController;
}

- (PKAccountWebServiceFinancingPlanPaymentIntentResponse)intentDetails
{
  return self->_intentDetails;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentDetails, 0);
  objc_storeStrong((id *)&self->_financingPlan, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_paymentIntentController, 0);
  objc_storeStrong((id *)&self->_paymentSourceRows, 0);
  objc_storeStrong((id *)&self->_selectedFundingSourceCellIdentifier, 0);
  objc_storeStrong((id *)&self->_selectedFundingSource, 0);
  objc_storeStrong((id *)&self->_autoPaySwitchRow, 0);
  objc_storeStrong((id *)&self->_addPaymentMethodRow, 0);
  objc_storeStrong((id *)&self->_availableFundingSources, 0);
  objc_storeStrong((id *)&self->_payLaterPass, 0);
  objc_storeStrong((id *)&self->_snapshotter, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_peerPaymentAccount, 0);
}

@end