@interface PKPaymentMethodPeerPaymentSectionController
- (BOOL)shouldHighlightItem:(id)a3;
- (Class)supplementaryRegistrationClassForKind:(id)a3 sectionIdentifier:(id)a4;
- (NSArray)identifiers;
- (PKPaymentMethodPeerPaymentSectionController)initWithDelegate:(id)a3 request:(id)a4 useAppleCashBalance:(BOOL)a5;
- (id)cellRegistrationForItem:(id)a3;
- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4;
- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4;
- (void)configureSupplementaryRegistration:(id)a3 elementKind:(id)a4 sectionIdentifier:(id)a5;
- (void)paymentMethodCellDidToggleItem:(id)a3;
@end

@implementation PKPaymentMethodPeerPaymentSectionController

- (PKPaymentMethodPeerPaymentSectionController)initWithDelegate:(id)a3 request:(id)a4 useAppleCashBalance:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v21.receiver = self;
  v21.super_class = (Class)PKPaymentMethodPeerPaymentSectionController;
  v10 = [(PKPaymentMethodPeerPaymentSectionController *)&v21 init];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_delegate, v8);
    objc_storeStrong((id *)&v11->_request, a4);
    v11->_useAppleCashBalance = a5;
    v12 = [MEMORY[0x1E4F84E00] sharedInstance];
    uint64_t v13 = [v12 account];
    account = v11->_account;
    v11->_account = (PKPeerPaymentAccount *)v13;

    v15 = [MEMORY[0x1E4F84898] sharedInstance];
    v16 = [(PKPeerPaymentAccount *)v11->_account associatedPassUniqueID];
    v17 = [v15 passWithUniqueID:v16];
    uint64_t v18 = [v17 paymentPass];
    peerPaymentPass = v11->_peerPaymentPass;
    v11->_peerPaymentPass = (PKPaymentPass *)v18;
  }
  return v11;
}

- (NSArray)identifiers
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"peerPayment";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return (NSArray *)v2;
}

- (BOOL)shouldHighlightItem:(id)a3
{
  return 0;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5 = objc_alloc_init(MEMORY[0x1E4FB1358]);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([(PKPaymentRequest *)self->_request isPeerPaymentRequest]
    && [(PKPeerPaymentAccount *)self->_account supportsPreserveCurrentBalance])
  {
    v7 = [MEMORY[0x1E4F84898] sharedInstance];
    id v8 = [v7 peerPaymentPassUniqueID];
    if (self->_peerPaymentPass)
    {
      id v9 = [[PKPaymentMethodSelectionItem alloc] initWithIdentifier:v8];
      [(PKPaymentMethodSelectionItem *)v9 setPaymentPass:self->_peerPaymentPass];
      v10 = [(PKPeerPaymentAccount *)self->_account currentBalance];
      [(PKPaymentMethodSelectionItem *)v9 setBalance:v10];

      [(PKPaymentMethodSelectionItem *)v9 setSelected:self->_useAppleCashBalance];
      [v6 addObject:v9];
    }
  }
  v11 = (void *)[v6 copy];
  [v5 appendItems:v11];

  return v5;
}

- (id)cellRegistrationForItem:(id)a3
{
  v4 = (void *)MEMORY[0x1E4FB1578];
  uint64_t v5 = objc_opt_class();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __71__PKPaymentMethodPeerPaymentSectionController_cellRegistrationForItem___block_invoke;
  v8[3] = &unk_1E59D64F0;
  v8[4] = self;
  id v6 = [v4 registrationWithCellClass:v5 configurationHandler:v8];

  return v6;
}

uint64_t __71__PKPaymentMethodPeerPaymentSectionController_cellRegistrationForItem___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return [a2 configureWithItem:a4 style:1 delegate:*(void *)(a1 + 32)];
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  v4 = (objc_class *)MEMORY[0x1E4FB1558];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithAppearance:2];
  [v6 setFooterMode:1];
  v7 = [MEMORY[0x1E4FB1330] sectionWithListConfiguration:v6 layoutEnvironment:v5];

  return v7;
}

- (Class)supplementaryRegistrationClassForKind:(id)a3 sectionIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)*MEMORY[0x1E4FB2760];
  id v8 = v5;
  id v9 = v7;
  if (v9 == v8)
  {
  }
  else
  {
    v10 = v9;
    if (v8 && v9)
    {
      [v8 isEqualToString:v9];
    }
    else
    {
    }
  }
  v11 = objc_opt_class();

  return (Class)v11;
}

- (void)configureSupplementaryRegistration:(id)a3 elementKind:(id)a4 sectionIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)*MEMORY[0x1E4FB2760];
  id v12 = v9;
  id v13 = v11;
  if (v13 == v12)
  {
  }
  else
  {
    v14 = v13;
    if (!v12 || !v13)
    {

      goto LABEL_9;
    }
    int v15 = [v12 isEqualToString:v13];

    if (!v15) {
      goto LABEL_9;
    }
  }
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v17 = PKLocalizedPeerPaymentRecurringString(&cfstr_PaymentSheetPa.isa);
  uint64_t v18 = PKLocalizedPeerPaymentRecurringString(&cfstr_PaymentSheetPa_1.isa);
  v19 = PKLocalizedPeerPaymentRecurringString(&cfstr_PaymentSheetPa_0.isa, &stru_1EF1B5770.isa, v18, v17);
  objc_initWeak(&location, self);
  v20 = [PKTextRangeHyperlink alloc];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __112__PKPaymentMethodPeerPaymentSectionController_configureSupplementaryRegistration_elementKind_sectionIdentifier___block_invoke;
  v25[3] = &unk_1E59CB010;
  objc_copyWeak(&v26, &location);
  v25[4] = self;
  objc_super v21 = [(PKTextRangeHyperlink *)v20 initWithLinkText:v17 action:v25];
  [v16 addObject:v21];
  id v22 = v8;
  [v22 edgeInsets];
  double v24 = v23;
  [v22 edgeInsets];
  objc_msgSend(v22, "setEdgeInsets:", 0.0, v24, 0.0);
  [v22 setText:v19];
  [v22 setTextAlignment:4];
  [v22 setSources:v16];

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);

LABEL_9:
}

void __112__PKPaymentMethodPeerPaymentSectionController_configureSupplementaryRegistration_elementKind_sectionIdentifier___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    if ([*(id *)(*(void *)(a1 + 32) + 32) termsAcceptanceRequired])
    {
      v3 = [MEMORY[0x1E4F84E10] sharedService];
      v4 = [v3 targetDevice];
      [v4 updateAccountWithCompletion:&__block_literal_global_115];
    }
    else
    {
      v3 = [v6[2] localizedValueForFieldKey:*MEMORY[0x1E4F87A80]];
      v4 = [MEMORY[0x1E4F1CB10] URLWithString:v3];
      if (v4)
      {
        id v5 = objc_loadWeakRetained(v6 + 1);
        [v5 requestOpenURL:v4];
      }
    }

    WeakRetained = v6;
  }
}

void __112__PKPaymentMethodPeerPaymentSectionController_configureSupplementaryRegistration_elementKind_sectionIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    if (PKIsPad())
    {
      v3 = NSNumber;
      v4 = [MEMORY[0x1E4FB1438] sharedApplication];
      id v5 = objc_msgSend(v3, "numberWithInteger:", objc_msgSend(v4, "statusBarOrientation"));
    }
    else
    {
      id v5 = &unk_1EF2B93D8;
    }
    id v6 = [MEMORY[0x1E4F84E00] sharedInstance];
    [v6 presentPeerPaymentTermsAndConditionsWithAccount:v2 orientation:v5 completion:&__block_literal_global_206];
  }
  else
  {
    id v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Cannot present terms acceptance flow because the account is nil", v7, 2u);
    }
  }
}

void __112__PKPaymentMethodPeerPaymentSectionController_configureSupplementaryRegistration_elementKind_sectionIdentifier___block_invoke_203()
{
  v0 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_19F450000, v0, OS_LOG_TYPE_DEFAULT, "Presented Terms & Conditions acceptance flow", v1, 2u);
  }
}

- (void)paymentMethodCellDidToggleItem:(id)a3
{
  self->_useAppleCashBalance = [a3 isSelected];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained toggledUseAppleCashBalance:self->_useAppleCashBalance];

  unint64_t v5 = [(PKPaymentPass *)self->_peerPaymentPass settings];
  if (((v5 >> 11) & 1) != !self->_useAppleCashBalance)
  {
    unint64_t v6 = v5 & 0xFFFFFFFFFFFFF7FFLL | ((unint64_t)!self->_useAppleCashBalance << 11);
    peerPaymentPass = self->_peerPaymentPass;
    [(PKPaymentPass *)peerPaymentPass setSettings:v6];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_peerPaymentPass, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end