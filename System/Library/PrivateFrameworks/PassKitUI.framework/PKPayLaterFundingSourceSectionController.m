@interface PKPayLaterFundingSourceSectionController
- (NSArray)availableFundingSources;
- (PKPayLaterFundingSourceSectionController)initWithPayLaterAccount:(id)a3 dynamicContentPage:(id)a4 peerPaymentAccount:(id)a5 selectedFundingSource:(id)a6 autoPayment:(BOOL)a7 availableFundingSources:(id)a8 setupController:(id)a9 delegate:(id)a10;
- (id)_pageItemForSectionIndex:(int64_t)a3;
- (id)_paymentSourceRowForBankFundingSource:(id)a3;
- (id)_paymentSourceRowForPassFundingSource:(id)a3;
- (id)_rowForPaymentSource:(id)a3;
- (id)identifiers;
- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4;
- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4;
- (void)_configureAddPaymentMethoSectionSnapshot:(id)a3;
- (void)_configureAutoPaySectionSnapshot:(id)a3;
- (void)_configurePaymentPassSectionSnapshot:(id)a3;
- (void)_presentProvisioningFlow;
- (void)_showAddPaymentButtonSpinner:(BOOL)a3;
- (void)configureCellForRegistration:(id)a3 item:(id)a4;
- (void)didTapHyperLink:(id)a3;
- (void)paymentSetupDidFinish:(id)a3;
- (void)setAvailableFundingSources:(id)a3;
@end

@implementation PKPayLaterFundingSourceSectionController

- (PKPayLaterFundingSourceSectionController)initWithPayLaterAccount:(id)a3 dynamicContentPage:(id)a4 peerPaymentAccount:(id)a5 selectedFundingSource:(id)a6 autoPayment:(BOOL)a7 availableFundingSources:(id)a8 setupController:(id)a9 delegate:(id)a10
{
  id v28 = a5;
  id v27 = a6;
  id v16 = a8;
  id v17 = a9;
  id v18 = a10;
  v29.receiver = self;
  v29.super_class = (Class)PKPayLaterFundingSourceSectionController;
  v19 = [(PKPayLaterSectionController *)&v29 initWithPayLaterAccount:a3 dynamicContentPage:a4 viewControllerDelegate:v18];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_setupController, a9);
    objc_storeStrong((id *)&v20->_peerPaymentAccount, a5);
    uint64_t v21 = [v17 selectedFinancingOption];
    selectedFinancingOption = v20->_selectedFinancingOption;
    v20->_selectedFinancingOption = (PKPayLaterFinancingOption *)v21;

    objc_storeStrong((id *)&v20->_selectedFundingSource, a6);
    objc_storeStrong((id *)&v20->_availableFundingSources, a8);
    objc_storeWeak((id *)&v20->_delegate, v18);
    v20->_autoPayment = a7;
    v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    paymentSourceRows = v20->_paymentSourceRows;
    v20->_paymentSourceRows = v23;
  }
  return v20;
}

- (void)didTapHyperLink:(id)a3
{
  p_delegate = &self->_delegate;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained didTapHyperLink:v4];
}

- (void)configureCellForRegistration:(id)a3 item:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)PKPayLaterFundingSourceSectionController;
  id v5 = a3;
  [(PKPayLaterSectionController *)&v6 configureCellForRegistration:v5 item:a4];
  PKPayLaterConfigureCollectionViewCellWithGreyBackgroundForCell(v5);
}

- (id)identifiers
{
  v4[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"kPaymentPassSection";
  v4[1] = @"kAddPaymentMethodSection";
  v4[2] = @"kAutoPaySection";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:3];

  return v2;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4FB1358]);
  v7 = (__CFString *)v5;
  v8 = v7;
  if (v7 == @"kPaymentPassSection") {
    goto LABEL_4;
  }
  if (!v7) {
    goto LABEL_5;
  }
  int v9 = [(__CFString *)v7 isEqualToString:@"kPaymentPassSection"];

  if (v9)
  {
LABEL_4:
    [(PKPayLaterFundingSourceSectionController *)self _configurePaymentPassSectionSnapshot:v6];
  }
  else
  {
    v11 = v8;
    if (v11 == @"kAddPaymentMethodSection"
      || (v12 = v11,
          int v13 = [(__CFString *)v11 isEqualToString:@"kAddPaymentMethodSection"],
          v12,
          v13))
    {
      [(PKPayLaterFundingSourceSectionController *)self _configureAddPaymentMethoSectionSnapshot:v6];
    }
    else
    {
      v14 = v12;
      if (v14 == @"kAutoPaySection"
        || (v15 = v14,
            int v16 = [(__CFString *)v14 isEqualToString:@"kAutoPaySection"],
            v15,
            v16))
      {
        [(PKPayLaterFundingSourceSectionController *)self _configureAutoPaySectionSnapshot:v6];
      }
    }
  }
LABEL_5:

  return v6;
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  id v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PKPayLaterFundingSourceSectionController;
  v7 = [(PKPayLaterSectionController *)&v13 layoutWithLayoutEnvironment:a3 sectionIdentifier:v6];
  v8 = (__CFString *)v6;
  int v9 = v8;
  if (v8 == @"kAutoPaySection"
    || v8 && (int v10 = [@"kAutoPaySection" isEqualToString:v8], v9, v10))
  {
    [v7 contentInsets];
    [v7 setContentInsets:v11 + 34.0];
  }

  return v7;
}

- (void)paymentSetupDidFinish:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained reloadFundingSources];

  [v5 dismissViewControllerAnimated:1 completion:0];
}

- (void)_configurePaymentPassSectionSnapshot:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = self->_availableFundingSources;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "type", (void)v16);
        if (v12 == 2)
        {
          uint64_t v13 = [(PKPayLaterFundingSourceSectionController *)self _paymentSourceRowForBankFundingSource:v11];
          goto LABEL_10;
        }
        if (v12 == 1)
        {
          uint64_t v13 = [(PKPayLaterFundingSourceSectionController *)self _paymentSourceRowForPassFundingSource:v11];
LABEL_10:
          v14 = (void *)v13;
          goto LABEL_12;
        }
        v14 = 0;
LABEL_12:
        [v5 safelyAddObject:v14];
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  v15 = (void *)[v5 copy];
  [v4 appendItems:v15];
}

- (void)_configureAddPaymentMethoSectionSnapshot:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  objc_initWeak(&location, self);
  addPaymentMethodRow = self->_addPaymentMethodRow;
  if (!addPaymentMethodRow)
  {
    uint64_t v7 = [(PKPayLaterFundingSourceSectionController *)self identifiers];
    uint64_t v8 = -[PKPayLaterFundingSourceSectionController _pageItemForSectionIndex:](self, "_pageItemForSectionIndex:", [v7 indexOfObject:@"kAddPaymentMethodSection"]);

    uint64_t v9 = [v8 contentTitle];
    int v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      uint64_t v12 = [(PKPayLaterSetupFlowController *)self->_setupController preferredLanguage];
      PKLocalizedApplyFeatureString();
      id v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v13 = [PKPayLaterButtonRow alloc];
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    long long v19 = __85__PKPayLaterFundingSourceSectionController__configureAddPaymentMethoSectionSnapshot___block_invoke;
    v20 = &unk_1E59CA7F8;
    objc_copyWeak(&v21, &location);
    v14 = [(PKPayLaterButtonRow *)v13 initWithTitle:v11 selectionHandler:&v17];
    v15 = self->_addPaymentMethodRow;
    self->_addPaymentMethodRow = v14;

    objc_destroyWeak(&v21);
    addPaymentMethodRow = self->_addPaymentMethodRow;
  }
  objc_msgSend(v5, "safelyAddObject:", addPaymentMethodRow, v17, v18, v19, v20);
  long long v16 = (void *)[v5 copy];
  [v4 appendItems:v16];

  objc_destroyWeak(&location);
}

void __85__PKPayLaterFundingSourceSectionController__configureAddPaymentMethoSectionSnapshot___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _presentProvisioningFlow];
    id WeakRetained = v2;
  }
}

- (void)_configureAutoPaySectionSnapshot:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  objc_initWeak(&location, self);
  id v6 = [(PKPayLaterFundingSourceSectionController *)self identifiers];
  uint64_t v7 = -[PKPayLaterFundingSourceSectionController _pageItemForSectionIndex:](self, "_pageItemForSectionIndex:", [v6 indexOfObject:@"kAutoPaySection"]);

  uint64_t v8 = [v7 contentTitle];
  uint64_t v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v11 = [(PKPayLaterSetupFlowController *)self->_setupController preferredLanguage];
    PKLocalizedApplyFeatureString();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v12 = [PKPayLaterSwitchRow alloc];
  BOOL autoPayment = self->_autoPayment;
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  uint64_t v18 = __77__PKPayLaterFundingSourceSectionController__configureAutoPaySectionSnapshot___block_invoke;
  long long v19 = &unk_1E59D0560;
  objc_copyWeak(&v20, &location);
  v14 = [(PKPayLaterSwitchRow *)v12 initWithTitle:v10 on:autoPayment changeHandler:&v16];
  -[PKPayLaterSwitchRow setDisabled:](v14, "setDisabled:", self->_selectedFundingSource == 0, v16, v17, v18, v19);
  [v5 addObject:v14];
  v15 = (void *)[v5 copy];
  [v4 appendItems:v15];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __77__PKPayLaterFundingSourceSectionController__configureAutoPaySectionSnapshot___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v4 = [v6 BOOLValue];
    *((unsigned char *)WeakRetained + 160) = v4;
    id v5 = objc_loadWeakRetained((id *)WeakRetained + 17);
    [v5 didUpdateAutoPayment:v4];
  }
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
  uint64_t v7 = [v4 identifier];
  uint64_t v8 = [(NSMutableDictionary *)paymentSourceRows objectForKey:v7];

  if (!v8)
  {
    id v10 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount associatedPassUniqueID];
    objc_initWeak(&location, self);
    id v11 = [(PKPayLaterFundingSourceSectionController *)self _rowForPaymentSource:v4];
    setupController = self->_setupController;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __82__PKPayLaterFundingSourceSectionController__paymentSourceRowForPassFundingSource___block_invoke;
    v26[3] = &unk_1E59D0588;
    objc_copyWeak(&v28, &location);
    id v25 = v4;
    id v27 = v25;
    uint64_t v13 = [(PKPayLaterSetupFlowController *)setupController snapshotForPass:v5 completion:v26];
    [v11 setImage:v13];

    v14 = [v5 uniqueID];
    id v15 = v10;
    id v16 = v14;
    if (v15 == v16)
    {
    }
    else
    {
      uint64_t v17 = v16;
      if (!v15 || !v16)
      {
        id v20 = v15;
        long long v19 = v16;
        goto LABEL_13;
      }
      int v18 = [v15 isEqualToString:v16];

      if (!v18) {
        goto LABEL_14;
      }
    }
    long long v19 = [(PKPayLaterSetupFlowController *)self->_setupController preferredLanguage];
    id v20 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount currentBalance];
    uint64_t v17 = [v20 formattedStringValue];
    id v21 = PKLocalizedApplyFeatureString();
    objc_msgSend(v11, "setOverrideSecondaryText:", v21, v17);

LABEL_13:
LABEL_14:
    v22 = self->_paymentSourceRows;
    v23 = [v25 identifier];
    [(NSMutableDictionary *)v22 setObject:v11 forKey:v23];

    id v9 = v11;
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);

    goto LABEL_15;
  }
  id v9 = v8;
LABEL_15:

LABEL_16:

  return v9;
}

void __82__PKPayLaterFundingSourceSectionController__paymentSourceRowForPassFundingSource___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__PKPayLaterFundingSourceSectionController__paymentSourceRowForPassFundingSource___block_invoke_2;
  block[3] = &unk_1E59CB378;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v6 = *(id *)(a1 + 32);
  id v7 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v8);
}

void __82__PKPayLaterFundingSourceSectionController__paymentSourceRowForPassFundingSource___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = (void *)WeakRetained[18];
    id v11 = WeakRetained;
    id v4 = [*(id *)(a1 + 32) identifier];
    id v5 = [v3 objectForKeyedSubscript:v4];

    id v6 = [v11 dynamicCollectionDelegate];
    id v7 = [v6 cellForItem:v5];

    if (v7)
    {
      [v5 setImage:*(void *)(a1 + 40)];
      [v5 configureCell:v7];
    }
    else
    {
      id v8 = [v11 dynamicCollectionDelegate];
      [v8 reloadItem:v5 animated:1];
    }
    id v9 = (void *)v11[18];
    id v10 = [*(id *)(a1 + 32) identifier];
    [v9 setObject:v5 forKey:v10];

    id WeakRetained = v11;
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
      id v11 = (void *)MEMORY[0x1E4FB1818];
      uint64_t v12 = PKPassKitUIBundle();
      uint64_t v13 = [v11 imageNamed:@"BankAccountCard" inBundle:v12];

      v14 = [(PKPayLaterFundingSourceSectionController *)self _rowForPaymentSource:v4];
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

- (id)_rowForPaymentSource:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifier];
  objc_initWeak(&location, self);
  id v6 = [PKPayLaterPaymentSourceRow alloc];
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  id v20 = __65__PKPayLaterFundingSourceSectionController__rowForPaymentSource___block_invoke;
  id v21 = &unk_1E59CB378;
  objc_copyWeak(&v24, &location);
  id v7 = v5;
  id v22 = v7;
  id v8 = v4;
  id v23 = v8;
  id v9 = [(PKPayLaterPaymentSourceRow *)v6 initWithPayLaterPaymentSource:v8 selectionHandler:&v18];
  id v10 = [(PKPayLaterPaymentSource *)self->_selectedFundingSource identifier];
  id v11 = [v8 identifier];
  id v12 = v10;
  id v13 = v11;
  v14 = v13;
  if (v12 == v13)
  {
    uint64_t v16 = 1;
  }
  else
  {
    if (v12) {
      BOOL v15 = v13 == 0;
    }
    else {
      BOOL v15 = 1;
    }
    if (v15) {
      uint64_t v16 = 0;
    }
    else {
      uint64_t v16 = [v12 isEqualToString:v13];
    }
  }

  [(PKPayLaterPaymentSourceRow *)v9 setSelected:v16];
  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

  return v9;
}

void __65__PKPayLaterFundingSourceSectionController__rowForPaymentSource___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v19 = WeakRetained;
    if (*(void *)(a1 + 32))
    {
      id v3 = objc_msgSend(WeakRetained[18], "objectForKeyedSubscript:");
      id WeakRetained = v19;
    }
    else
    {
      id v3 = 0;
    }
    id v4 = WeakRetained + 15;
    id v5 = WeakRetained[15];
    id v6 = [v5 identifier];
    id v7 = *(void **)(a1 + 32);
    id v8 = v6;
    id v9 = v7;
    if (v8 != v9)
    {
      id v10 = v9;
      if (v8) {
        BOOL v11 = v9 == 0;
      }
      else {
        BOOL v11 = 1;
      }
      if (v11)
      {
      }
      else
      {
        int v12 = [v8 isEqualToString:v9];

        if (v12) {
          goto LABEL_14;
        }
      }
      objc_storeStrong(v4, *(id *)(a1 + 40));
      id v14 = objc_loadWeakRetained(v19 + 17);
      [v14 didSelectFundingSource:*(void *)(a1 + 40)];

      if (!v5)
      {
        BOOL v15 = [v19 dynamicCollectionDelegate];
        [v15 reloadDataForSectionIdentifier:@"kAutoPaySection" animated:1];
      }
      id v13 = [v19[18] objectForKeyedSubscript:v8];
      if (v3)
      {
        [v3 setSelected:1];
        [v19[18] setObject:v3 forKey:*(void *)(a1 + 32)];
        if (v13)
        {
          [v13 setSelected:0];
          [v19[18] setObject:v13 forKey:v8];
          uint64_t v16 = [v19 dynamicCollectionDelegate];
          [v16 reloadItem:v13 animated:1];
        }
        uint64_t v17 = [v19 dynamicCollectionDelegate];
        [v17 reloadItem:v3 animated:1];
      }
      uint64_t v18 = [v19 dynamicCollectionDelegate];
      [v18 reloadDataForSectionIdentifier:@"kPaymentPassSection" animated:1];

      goto LABEL_22;
    }

LABEL_14:
    id v13 = [v19 dynamicCollectionDelegate];
    [v13 reloadItem:v3 animated:1];
LABEL_22:

    id WeakRetained = v19;
  }
}

- (void)_presentProvisioningFlow
{
  id v3 = [(PKPayLaterSetupFlowController *)self->_setupController financingController];
  id v4 = [v3 paymentWebService];

  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F84BB8]) initWithWebService:v4];
  id v6 = [(PKPayLaterFinancingOption *)self->_selectedFinancingOption supportedRepaymentNetworks];
  [v5 setAllowedPaymentNetworks:v6];

  id v7 = [MEMORY[0x1E4F1CAD0] set];
  [v5 setAllowedFeatureIdentifiers:v7];

  [(PKPayLaterFundingSourceSectionController *)self _showAddPaymentButtonSpinner:1];
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__PKPayLaterFundingSourceSectionController__presentProvisioningFlow__block_invoke;
  v9[3] = &unk_1E59CC710;
  objc_copyWeak(&v12, &location);
  id v8 = v5;
  id v10 = v8;
  BOOL v11 = self;
  [v8 preflightWithCompletion:v9];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __68__PKPayLaterFundingSourceSectionController__presentProvisioningFlow__block_invoke(id *a1, char a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      id v8 = -[PKPaymentSetupNavigationController initWithProvisioningController:context:]([PKPaymentSetupNavigationController alloc], "initWithProvisioningController:context:", a1[4], [WeakRetained[12] setupContext]);
      [(PKPaymentSetupNavigationController *)v8 setPaymentSetupMode:1];
      [(PKPaymentSetupNavigationController *)v8 setAllowsManualEntry:1];
      [(PKPaymentSetupNavigationController *)v8 setSetupDelegate:v7];
      [(PKNavigationController *)v8 setCustomFormSheetPresentationStyleForiPad];
      objc_initWeak(&location, a1[5]);
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __68__PKPayLaterFundingSourceSectionController__presentProvisioningFlow__block_invoke_2;
      v12[3] = &unk_1E59CB268;
      objc_copyWeak(&v14, &location);
      id v9 = v8;
      id v13 = v9;
      [(PKPaymentSetupNavigationController *)v9 preflightWithCompletion:v12];

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
    else
    {
      [WeakRetained _showAddPaymentButtonSpinner:0];
      id v10 = [a1[4] alertForDisplayableError:v5];
      if (v10)
      {
        BOOL v11 = [v7 dynamicCollectionDelegate];
        [v11 presentViewController:v10 animated:1 completion:0];
      }
    }
  }
}

void __68__PKPayLaterFundingSourceSectionController__presentProvisioningFlow__block_invoke_2(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = [WeakRetained dynamicCollectionDelegate];
    uint64_t v6 = *(void *)(a1 + 32);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __68__PKPayLaterFundingSourceSectionController__presentProvisioningFlow__block_invoke_3;
    v7[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v8, v2);
    [v5 presentViewController:v6 animated:1 completion:v7];

    objc_destroyWeak(&v8);
  }
}

void __68__PKPayLaterFundingSourceSectionController__presentProvisioningFlow__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _showAddPaymentButtonSpinner:0];
    id WeakRetained = v2;
  }
}

- (void)_showAddPaymentButtonSpinner:(BOOL)a3
{
  [(PKPayLaterButtonRow *)self->_addPaymentMethodRow setShowSpinner:a3];
  id v4 = [(PKPayLaterSectionController *)self dynamicCollectionDelegate];
  [v4 reloadItem:self->_addPaymentMethodRow animated:1];
}

- (id)_pageItemForSectionIndex:(int64_t)a3
{
  id v4 = [(PKPayLaterSectionController *)self dynamicContentPage];
  id v5 = [v4 sections];

  if ((unint64_t)a3 > 0x7FFFFFFFFFFFFFFELL || [v5 count] <= (unint64_t)a3)
  {
    id v8 = 0;
  }
  else
  {
    [v5 count];
    uint64_t v6 = [v5 objectAtIndexedSubscript:a3];
    id v7 = [v6 rows];
    if ([v7 count])
    {
      id v8 = [v7 firstObject];
    }
    else
    {
      id v8 = 0;
    }
  }

  return v8;
}

- (NSArray)availableFundingSources
{
  return self->_availableFundingSources;
}

- (void)setAvailableFundingSources:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addPaymentMethodRow, 0);
  objc_storeStrong((id *)&self->_paymentSourceRows, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_availableFundingSources, 0);
  objc_storeStrong((id *)&self->_selectedFundingSource, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccount, 0);
  objc_storeStrong((id *)&self->_selectedFinancingOption, 0);

  objc_storeStrong((id *)&self->_setupController, 0);
}

@end