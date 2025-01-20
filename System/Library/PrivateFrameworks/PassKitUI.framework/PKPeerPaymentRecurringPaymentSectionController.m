@interface PKPeerPaymentRecurringPaymentSectionController
- (BOOL)shouldHighlightItem:(id)a3;
- (NSArray)payments;
- (PKFamilyMemberCollection)familyCollection;
- (PKPeerPaymentRecurringPaymentSectionController)init;
- (PKPeerPaymentRecurringPaymentSectionControllerDelegate)delegate;
- (PKTransactionSourceCollection)sourceCollection;
- (id)cellRegistrationForItem:(id)a3;
- (id)identifiers;
- (id)paymentTransactionItemForPayment:(id)a3;
- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4;
- (void)_applyMaskToCell:(id)a3 firstInSection:(BOOL)a4 lastInSection:(BOOL)a5;
- (void)didSelectItem:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFamilyCollection:(id)a3;
- (void)setPayments:(id)a3;
- (void)setSourceCollection:(id)a3;
@end

@implementation PKPeerPaymentRecurringPaymentSectionController

- (PKPeerPaymentRecurringPaymentSectionController)init
{
  v6.receiver = self;
  v6.super_class = (Class)PKPeerPaymentRecurringPaymentSectionController;
  v2 = [(PKPeerPaymentRecurringPaymentSectionController *)&v6 init];
  if (v2)
  {
    v3 = [[PKDashboardPaymentTransactionItemPresenter alloc] initWithContext:0 detailViewStyle:0 avatarViewDelegate:0];
    presenter = v2->_presenter;
    v2->_presenter = v3;
  }
  return v2;
}

- (id)identifiers
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"recurringPayments";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (void)didSelectItem:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F84D80];
  id v5 = a3;
  id v6 = [v4 alloc];
  v7 = [MEMORY[0x1E4F84E10] sharedService];
  id v17 = (id)[v6 initWithPeerPaymentWebService:v7];

  v8 = [v17 account];
  v9 = [v8 recurringPaymentsFeatureDescriptor];

  v10 = [PKPeerPaymentRecurringPaymentDetailViewController alloc];
  v11 = [v5 recipientAddress];
  v12 = [(PKPeerPaymentRecurringPaymentDetailViewController *)v10 initWithRecurringPayment:v5 recipientAddress:v11 mode:2 context:0 peerPaymentController:v17 remoteMessagesComposer:0];

  v13 = [v9 minimumAmount];
  [(PKPeerPaymentRecurringPaymentDetailViewController *)v12 setMinimumAmount:v13];

  v14 = [v9 maximumAmount];
  [(PKPeerPaymentRecurringPaymentDetailViewController *)v12 setMaximumAmount:v14];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v16 = [WeakRetained navigationController];
  [v16 pushViewController:v12 animated:1];
}

- (BOOL)shouldHighlightItem:(id)a3
{
  return 1;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5 = objc_alloc_init(MEMORY[0x1E4FB1358]);
  [v5 appendItems:self->_payments];

  return v5;
}

- (id)cellRegistrationForItem:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = (void *)MEMORY[0x1E4FB1578];
    uint64_t v7 = objc_opt_class();
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __74__PKPeerPaymentRecurringPaymentSectionController_cellRegistrationForItem___block_invoke;
    v10[3] = &unk_1E59DDA90;
    v10[4] = self;
    v8 = [v6 registrationWithCellClass:v7 configurationHandler:v10];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __74__PKPeerPaymentRecurringPaymentSectionController_cellRegistrationForItem___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(*(void *)(a1 + 32) + 72);
  id v6 = a3;
  id v7 = a2;
  objc_msgSend(v5, "objectAtIndex:", objc_msgSend(v6, "row"));
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 32);
  v9 = (void *)v8[8];
  v10 = [v8 paymentTransactionItemForPayment:v14];
  [v9 updateCell:v7 forItem:v10 inCollectionView:v7 atIndexPath:v6];

  v11 = *(void **)(a1 + 32);
  BOOL v12 = [v6 row] == 0;
  uint64_t v13 = [v6 row];

  objc_msgSend(v11, "_applyMaskToCell:firstInSection:lastInSection:", v7, v12, v13 == objc_msgSend(*(id *)(*(void *)(a1 + 32) + 72), "count") - 1);
}

- (void)_applyMaskToCell:(id)a3 firstInSection:(BOOL)a4 lastInSection:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v7 = a3;
  id v11 = v7;
  uint64_t v8 = 3;
  if (!v6 || !v5) {
    uint64_t v8 = 1;
  }
  uint64_t v9 = 2;
  if (!v5) {
    uint64_t v9 = 0;
  }
  if (v6) {
    uint64_t v10 = v8;
  }
  else {
    uint64_t v10 = v9;
  }
  [v7 setMaskType:v10];
  [v11 setShowsBottomSeparator:!v5];
}

- (id)paymentTransactionItemForPayment:(id)a3
{
  id v4 = a3;
  BOOL v5 = [PKDashboardPaymentTransactionItem alloc];
  sourceCollection = self->_sourceCollection;
  familyCollection = self->_familyCollection;
  uint64_t v8 = PKPeerPaymentTransactionForRecurringPayment();

  uint64_t v9 = [(PKDashboardPaymentTransactionItem *)v5 initWithTransactionSourceCollection:sourceCollection familyCollection:familyCollection transaction:v8 account:0 accountUserCollection:0 bankConnectInstitution:0];

  return v9;
}

- (NSArray)payments
{
  return self->_payments;
}

- (void)setPayments:(id)a3
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
  objc_storeStrong((id *)&self->_payments, 0);

  objc_storeStrong((id *)&self->_presenter, 0);
}

@end