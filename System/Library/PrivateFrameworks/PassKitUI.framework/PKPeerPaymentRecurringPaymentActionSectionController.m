@interface PKPeerPaymentRecurringPaymentActionSectionController
- (BOOL)shouldHighlightItem:(id)a3;
- (PKFamilyMemberCollection)familyCollection;
- (PKPeerPaymentAccount)account;
- (PKPeerPaymentRecurringPaymentSectionControllerDelegate)delegate;
- (PKTransactionSourceCollection)sourceCollection;
- (id)_decorateListCell:(id)a3 forRowItem:(id)a4;
- (id)_paymentSetupNavigationControllerForProvisioningController:(id)a3;
- (id)cellRegistrationForItem:(id)a3;
- (id)identifiers;
- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4;
- (void)_beginSetupFlow;
- (void)_openPaymentSetupWithNetworkWhitelist:(id)a3 paymentSetupMode:(int64_t)a4;
- (void)didSelectItem:(id)a3;
- (void)paymentSetupDidFinish:(id)a3;
- (void)setAccount:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFamilyCollection:(id)a3;
- (void)setSourceCollection:(id)a3;
@end

@implementation PKPeerPaymentRecurringPaymentActionSectionController

- (id)identifiers
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"actions";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (void)didSelectItem:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained deselectCells];

  id v12 = 0;
  uint64_t v13 = 0;
  BOOL v6 = +[PKPeerPaymentActionController canPerformPeerPaymentAction:3 account:self->_account unableReason:&v13 displayableError:&v12];
  id v7 = v12;
  if (v6)
  {
    [(PKPeerPaymentRecurringPaymentActionSectionController *)self _beginSetupFlow];
  }
  else
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __70__PKPeerPaymentRecurringPaymentActionSectionController_didSelectItem___block_invoke;
    v11[3] = &unk_1E59CA7D0;
    v11[4] = self;
    v8 = +[PKPeerPaymentActionController alertControllerForPeerPaymentActionUnableReason:v13 displayableError:v7 addCardActionHandler:v11];
    id v9 = objc_loadWeakRetained((id *)p_delegate);
    v10 = [v9 navigationController];
    [v10 presentViewController:v8 animated:1 completion:0];
  }
}

uint64_t __70__PKPeerPaymentRecurringPaymentActionSectionController_didSelectItem___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _openPaymentSetupWithNetworkWhitelist:0 paymentSetupMode:0];
}

- (BOOL)shouldHighlightItem:(id)a3
{
  return 1;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v4 = objc_alloc_init(MEMORY[0x1E4FB1358]);
  [v4 appendItems:&unk_1EF2BA218];

  return v4;
}

- (id)cellRegistrationForItem:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x1E4FB1578];
  uint64_t v6 = objc_opt_class();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __80__PKPeerPaymentRecurringPaymentActionSectionController_cellRegistrationForItem___block_invoke;
  v9[3] = &unk_1E59CBB38;
  objc_copyWeak(&v10, &location);
  id v7 = [v5 registrationWithCellClass:v6 configurationHandler:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v7;
}

void __80__PKPeerPaymentRecurringPaymentActionSectionController_cellRegistrationForItem___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v9 = a2;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = (id)[WeakRetained _decorateListCell:v9 forRowItem:v6];
}

- (void)_beginSetupFlow
{
  id v7 = [[PKRecipientPickerViewController alloc] initWithTransactionSourceCollection:self->_sourceCollection familyCollection:self->_familyCollection peerPaymentSendFlowType:2];
  v3 = [[PKNavigationController alloc] initWithRootViewController:v7];
  if ([(UIViewController *)v3 pkui_userInterfaceIdiomSupportsLargeLayouts])
  {
    uint64_t v4 = 2;
  }
  else
  {
    uint64_t v4 = 1;
  }
  [(PKNavigationController *)v3 setModalPresentationStyle:v4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v6 = [WeakRetained navigationController];
  [v6 presentViewController:v3 animated:1 completion:0];
}

- (void)_openPaymentSetupWithNetworkWhitelist:(id)a3 paymentSetupMode:(int64_t)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  id v7 = objc_alloc(MEMORY[0x1E4F84BB8]);
  id v8 = [MEMORY[0x1E4F84D50] sharedService];
  id v9 = (void *)[v7 initWithWebService:v8];

  [v9 setAllowedPaymentNetworks:v6];
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  [v9 setAllowedFeatureIdentifiers:v10];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __111__PKPeerPaymentRecurringPaymentActionSectionController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke;
  v12[3] = &unk_1E59CAEF8;
  objc_copyWeak(v14, &location);
  id v11 = v9;
  id v13 = v11;
  v14[1] = (id)a4;
  [v11 preflightWithCompletion:v12];

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
}

void __111__PKPeerPaymentRecurringPaymentActionSectionController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke(id *a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __111__PKPeerPaymentRecurringPaymentActionSectionController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke_2;
  block[3] = &unk_1E59CAED0;
  objc_copyWeak(v11, a1 + 5);
  char v12 = a2;
  id v6 = a1[4];
  v11[1] = a1[6];
  id v9 = v6;
  id v10 = v5;
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(v11);
}

void __111__PKPeerPaymentRecurringPaymentActionSectionController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(unsigned char *)(a1 + 64))
    {
      uint64_t v4 = [WeakRetained _paymentSetupNavigationControllerForProvisioningController:*(void *)(a1 + 32)];
      [v4 setPaymentSetupMode:*(void *)(a1 + 56)];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      id v11[2] = __111__PKPeerPaymentRecurringPaymentActionSectionController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke_3;
      v11[3] = &unk_1E59CAEA8;
      v11[4] = v3;
      id v12 = v4;
      id v5 = v4;
      [v5 preflightWithCompletion:v11];
    }
    else
    {
      id v6 = *(void **)(a1 + 40);
      if (v6)
      {
        id v7 = v6;
      }
      else
      {
        PKDisplayableErrorForCommonType();
        id v7 = (id)objc_claimAutoreleasedReturnValue();
      }
      id v5 = v7;
      id v8 = +[PKPaymentSetupNavigationController viewControllerForPresentingPaymentError:v7];
      id v9 = objc_loadWeakRetained(v3 + 11);
      id v10 = [v9 navigationController];
      [v10 presentViewController:v8 animated:1 completion:0];
    }
  }
}

void __111__PKPeerPaymentRecurringPaymentActionSectionController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 88));
  v2 = [WeakRetained navigationController];
  [v2 presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

- (id)_paymentSetupNavigationControllerForProvisioningController:(id)a3
{
  id v4 = a3;
  id v5 = [[PKPaymentSetupNavigationController alloc] initWithProvisioningController:v4 context:0];

  [(PKNavigationController *)v5 setCustomFormSheetPresentationStyleForiPad];
  [(PKPaymentSetupNavigationController *)v5 setSetupDelegate:self];
  [(PKPaymentSetupNavigationController *)v5 setShowsWelcomeViewController:0];

  return v5;
}

- (id)_decorateListCell:(id)a3 forRowItem:(id)a4
{
  id v4 = (void *)MEMORY[0x1E4FB1948];
  id v5 = a3;
  id v6 = [v4 cellConfiguration];
  id v7 = PKLocalizedPeerPaymentRecurringString(&cfstr_RecurringListA.isa);
  [v6 setText:v7];

  id v8 = [v6 textProperties];
  id v9 = [MEMORY[0x1E4FB1618] linkColor];
  [v8 setColor:v9];

  objc_msgSend(v6, "setDirectionalLayoutMargins:", 10.0, 0.0, 10.0, 8.0);
  [v5 setContentConfiguration:v6];
  [v5 setConfigurationUpdateHandler:&__block_literal_global_205];

  return v6;
}

void __85__PKPeerPaymentRecurringPaymentActionSectionController__decorateListCell_forRowItem___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v4 = a3;
  id v5 = [MEMORY[0x1E4FB1498] listGroupedCellConfiguration];
  if (([v4 isHighlighted] & 1) != 0 || objc_msgSend(v4, "isSelected"))
  {
    id v6 = [MEMORY[0x1E4FB1618] tableCellDefaultSelectionTintColor];
    [v5 setBackgroundColor:v6];
  }
  [v7 setBackgroundConfiguration:v5];
}

- (void)paymentSetupDidFinish:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v3 = [WeakRetained navigationController];
  id v4 = objc_msgSend(v3, "pkui_frontMostViewController");
  [v4 dismissViewControllerAnimated:1 completion:0];
}

- (PKPeerPaymentAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (PKTransactionSourceCollection)sourceCollection
{
  return self->_sourceCollection;
}

- (void)setSourceCollection:(id)a3
{
}

- (PKFamilyMemberCollection)familyCollection
{
  return self->_familyCollection;
}

- (void)setFamilyCollection:(id)a3
{
}

- (PKPeerPaymentRecurringPaymentSectionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPeerPaymentRecurringPaymentSectionControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_familyCollection, 0);
  objc_storeStrong((id *)&self->_sourceCollection, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

@end