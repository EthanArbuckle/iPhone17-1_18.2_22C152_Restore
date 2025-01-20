@interface PKPeerPaymentRecurringPaymentPassDetailsSectionController
+ (BOOL)validForPaymentPass:(id)a3;
- (BOOL)_sectionAvailable;
- (PKPeerPaymentRecurringPaymentPassDetailsSectionController)initWithDelegate:(id)a3 pass:(id)a4 context:(int64_t)a5 passLibraryDataProvider:(id)a6;
- (id)allSectionIdentifiers;
- (id)sectionIdentifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5;
- (int64_t)tableView:(id)a3 numberOfRowsInSectionIdentifier:(id)a4;
- (void)_presentRecurringPaymentsWithIdentifier:(id)a3;
- (void)_updateRecurringPaymentsWithCompletion:(id)a3;
- (void)preflight:(id)a3;
- (void)recurringPaymentsChanged;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5;
@end

@implementation PKPeerPaymentRecurringPaymentPassDetailsSectionController

- (PKPeerPaymentRecurringPaymentPassDetailsSectionController)initWithDelegate:(id)a3 pass:(id)a4 context:(int64_t)a5 passLibraryDataProvider:(id)a6
{
  id v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKPeerPaymentRecurringPaymentPassDetailsSectionController;
  v9 = [(PKPaymentPassDetailSectionController *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_delegate, v8);
    v10->_context = a5;
    v11 = [MEMORY[0x1E4F84E00] sharedInstance];
    uint64_t v12 = [v11 account];
    account = v10->_account;
    v10->_account = (PKPeerPaymentAccount *)v12;

    [v11 registerObserver:v10];
  }

  return v10;
}

- (id)allSectionIdentifiers
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"PeerPaymentRecurringPaymentsSection";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (id)sectionIdentifiers
{
  if ([(PKPaymentPassDetailSectionController *)self currentSegment]
    || ![(PKPeerPaymentRecurringPaymentPassDetailsSectionController *)self _sectionAvailable])
  {
    v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v3 = [(PKPeerPaymentRecurringPaymentPassDetailsSectionController *)self allSectionIdentifiers];
  }

  return v3;
}

+ (BOOL)validForPaymentPass:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x1E4F84E00] sharedInstance];
  v5 = [v4 account];

  if ([v3 hasAssociatedPeerPaymentAccount] && !objc_msgSend(v3, "passActivationState")) {
    char v6 = [v5 supportsRecurringPayments];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (void)preflight:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F84E00];
  id v8 = a3;
  v5 = [v4 sharedInstance];
  char v6 = [v5 account];
  account = self->_account;
  self->_account = v6;

  [(PKPeerPaymentRecurringPaymentPassDetailsSectionController *)self _updateRecurringPaymentsWithCompletion:v8];
}

- (BOOL)_sectionAvailable
{
  if ([(PKPeerPaymentAccount *)self->_account supportsRecurringPayments])
  {
    account = self->_account;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v5 = [WeakRetained familyCollection];
    char v6 = [v5 currentUser];
    if ([(PKPeerPaymentAccount *)account isEligibleForRecurringPaymentsForUser:v6])int v7 = PKIsVision() ^ 1; {
    else
    }
      LOBYTE(v7) = 0;
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (void)_updateRecurringPaymentsWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F84E00] sharedInstance];
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __100__PKPeerPaymentRecurringPaymentPassDetailsSectionController__updateRecurringPaymentsWithCompletion___block_invoke;
  v7[3] = &unk_1E59CC358;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [v5 recurringPaymentsWithCompletion:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __100__PKPeerPaymentRecurringPaymentPassDetailsSectionController__updateRecurringPaymentsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = objc_msgSend(a2, "pk_objectsPassingTest:", &__block_literal_global_75);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __100__PKPeerPaymentRecurringPaymentPassDetailsSectionController__updateRecurringPaymentsWithCompletion___block_invoke_3;
  block[3] = &unk_1E59CB038;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v8);
}

uint64_t __100__PKPeerPaymentRecurringPaymentPassDetailsSectionController__updateRecurringPaymentsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 type] == 1) {
    uint64_t v3 = [v2 sentByMe];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

void __100__PKPeerPaymentRecurringPaymentPassDetailsSectionController__updateRecurringPaymentsWithCompletion___block_invoke_3(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = WeakRetained;
    objc_storeStrong(WeakRetained + 8, *(id *)(a1 + 32));
    id v4 = objc_loadWeakRetained(v7 + 11);
    v5 = [v7 sectionIdentifiers];
    [v4 reloadSections:v5];

    uint64_t v3 = v7;
    uint64_t v6 = *(void *)(a1 + 40);
    if (v6)
    {
      (*(void (**)(void))(v6 + 16))();
      uint64_t v3 = v7;
    }
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSectionIdentifier:(id)a4
{
  return [(PKPeerPaymentRecurringPaymentPassDetailsSectionController *)self _sectionAvailable];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  uint64_t v6 = objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", @"PeerPaymentRecurringPayments", a4, a5);
  if (!v6) {
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:2 reuseIdentifier:@"PeerPaymentRecurringPayments"];
  }
  id v7 = [MEMORY[0x1E4FB1948] valueCellConfiguration];
  id v8 = PKLocalizedPeerPaymentRecurringString(&cfstr_DashboardMoreM.isa);
  [v7 setText:v8];

  NSUInteger v9 = [(NSArray *)self->_recurringPayments count];
  if (v9)
  {
    v10 = (void *)MEMORY[0x1E4F28EE0];
    v11 = [NSNumber numberWithUnsignedInteger:v9];
    uint64_t v12 = [v10 localizedStringFromNumber:v11 numberStyle:0];

    [v7 setSecondaryText:v12];
  }
  [v6 setAccessoryType:1];
  [v6 setContentConfiguration:v7];

  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_context != 3
    || (PKPeerPaymentRecurringPaymentHasShownEducationMessage() & 1) != 0
    || [(NSArray *)self->_recurringPayments count])
  {
    [(PKPeerPaymentRecurringPaymentPassDetailsSectionController *)self _presentRecurringPaymentsWithIdentifier:0];
  }
  else
  {
    objc_initWeak(&location, self);
    v11 = [PKPeerPaymentRecurringPaymentEducationViewController alloc];
    int64_t context = self->_context;
    p_delegate = &self->_delegate;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_super v15 = [WeakRetained transactionSourceCollection];
    id v16 = objc_loadWeakRetained((id *)&self->_delegate);
    v17 = [v16 familyCollection];
    v18 = [(PKPeerPaymentRecurringPaymentEducationViewController *)v11 initWithContext:context transactionSourceCollection:v15 familyCollection:v17];

    uint64_t v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    v25 = __113__PKPeerPaymentRecurringPaymentPassDetailsSectionController_tableView_didSelectRowAtIndexPath_sectionIdentifier___block_invoke;
    v26 = &unk_1E59CA7F8;
    objc_copyWeak(&v27, &location);
    [(PKPeerPaymentRecurringPaymentEducationViewController *)v18 setAddCardHandler:&v23];
    v19 = [PKNavigationController alloc];
    v20 = -[PKNavigationController initWithRootViewController:](v19, "initWithRootViewController:", v18, v23, v24, v25, v26);
    if ([(UIViewController *)v20 pkui_userInterfaceIdiomSupportsLargeLayouts])
    {
      [(PKNavigationController *)v20 setModalPresentationStyle:2];
    }
    id v21 = objc_loadWeakRetained((id *)p_delegate);
    v22 = [v21 navigationController];
    [v22 presentViewController:v20 animated:1 completion:0];

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
  [v8 deselectRowAtIndexPath:v9 animated:1];
}

void __113__PKPeerPaymentRecurringPaymentPassDetailsSectionController_tableView_didSelectRowAtIndexPath_sectionIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained;
    id v2 = objc_loadWeakRetained(WeakRetained + 11);
    [v2 presentAddCard];

    id WeakRetained = v3;
  }
}

- (void)_presentRecurringPaymentsWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [PKPeerPaymentRecurringPaymentViewController alloc];
  int64_t context = self->_context;
  id v7 = [MEMORY[0x1E4F84E00] sharedInstance];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v9 = [WeakRetained transactionSourceCollection];
  id v10 = objc_loadWeakRetained((id *)&self->_delegate);
  v11 = [v10 familyCollection];
  uint64_t v12 = [(PKPeerPaymentRecurringPaymentViewController *)v5 initWithContext:context peerPaymentService:v7 transactionSourceCollection:v9 familyCollection:v11];

  objc_initWeak(&location, self);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __101__PKPeerPaymentRecurringPaymentPassDetailsSectionController__presentRecurringPaymentsWithIdentifier___block_invoke;
  v15[3] = &unk_1E59CCC78;
  objc_copyWeak(&v18, &location);
  v13 = v12;
  id v16 = v13;
  id v14 = v4;
  id v17 = v14;
  [(PKPeerPaymentRecurringPaymentViewController *)v13 preflightWithCompletion:v15];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __101__PKPeerPaymentRecurringPaymentPassDetailsSectionController__presentRecurringPaymentsWithIdentifier___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (a2)
    {
      id v7 = WeakRetained;
      id v5 = objc_loadWeakRetained(WeakRetained + 11);
      uint64_t v6 = [v5 navigationController];
      [v6 pushViewController:*(void *)(a1 + 32) animated:1];

      id WeakRetained = v7;
      if (*(void *)(a1 + 40))
      {
        objc_msgSend(*(id *)(a1 + 32), "showDetailsForRecurringPaymentIdentifier:");
        id WeakRetained = v7;
      }
    }
  }
}

- (void)recurringPaymentsChanged
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_account, 0);

  objc_storeStrong((id *)&self->_recurringPayments, 0);
}

@end