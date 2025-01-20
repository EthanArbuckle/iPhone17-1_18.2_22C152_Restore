@interface PKPeerPaymentAutoReloadSectionController
+ (BOOL)validForPaymentPass:(id)a3;
- (BOOL)_sectionAvailable;
- (PKPeerPaymentAutoReloadSectionController)initWithDelegate:(id)a3 pass:(id)a4 context:(int64_t)a5 passLibraryDataProvider:(id)a6;
- (id)allSectionIdentifiers;
- (id)presentationSceneIdentifierForTopUpController:(id)a3;
- (id)sectionIdentifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5;
- (id)titleForFooterInSectionIdentifier:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSectionIdentifier:(id)a4;
- (void)_updateRecurringPaymentsWithCompletion:(id)a3;
- (void)preflight:(id)a3;
- (void)presentAutoReload;
- (void)recurringPaymentsChanged;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5;
- (void)thresholdTopUpController:(id)a3 requestsDismissViewController:(id)a4;
- (void)thresholdTopUpController:(id)a3 requestsPopViewController:(id)a4;
- (void)thresholdTopUpController:(id)a3 requestsPresentViewController:(id)a4;
- (void)thresholdTopUpController:(id)a3 requestsPushViewController:(id)a4;
- (void)thresholdTopUpControllerCompletedSetup:(id)a3;
@end

@implementation PKPeerPaymentAutoReloadSectionController

- (PKPeerPaymentAutoReloadSectionController)initWithDelegate:(id)a3 pass:(id)a4 context:(int64_t)a5 passLibraryDataProvider:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)PKPeerPaymentAutoReloadSectionController;
  v13 = [(PKPaymentPassDetailSectionController *)&v21 init];
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_delegate, v10);
    v15 = [MEMORY[0x1E4F84E00] sharedInstance];
    uint64_t v16 = [v15 account];
    account = v14->_account;
    v14->_account = (PKPeerPaymentAccount *)v16;

    [v15 registerObserver:v14];
    v18 = [[PKPeerPaymentThresholdTopUpController alloc] initWithPeerPaymentAccount:v14->_account pass:v11 context:a5 passLibraryDataProvider:v12 delegate:v14];
    controller = v14->_controller;
    v14->_controller = v18;
  }
  return v14;
}

- (id)allSectionIdentifiers
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"PeerPaymentAutoReloadSection";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (id)sectionIdentifiers
{
  if ([(PKPaymentPassDetailSectionController *)self currentSegment]
    || ![(PKPeerPaymentAutoReloadSectionController *)self _sectionAvailable])
  {
    v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v3 = [(PKPeerPaymentAutoReloadSectionController *)self allSectionIdentifiers];
  }

  return v3;
}

+ (BOOL)validForPaymentPass:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x1E4F84E00] sharedInstance];
  v5 = [v4 account];

  if ([v3 hasAssociatedPeerPaymentAccount] && !objc_msgSend(v3, "passActivationState")) {
    char v6 = [v5 supportsThresholdTopUp];
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

  [(PKPeerPaymentAutoReloadSectionController *)self _updateRecurringPaymentsWithCompletion:v8];
}

- (void)_updateRecurringPaymentsWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F84E00] sharedInstance];
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __83__PKPeerPaymentAutoReloadSectionController__updateRecurringPaymentsWithCompletion___block_invoke;
  v7[3] = &unk_1E59CC358;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [v5 recurringPaymentsWithCompletion:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __83__PKPeerPaymentAutoReloadSectionController__updateRecurringPaymentsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = objc_msgSend(a2, "pk_firstObjectPassingTest:", &__block_literal_global_16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__PKPeerPaymentAutoReloadSectionController__updateRecurringPaymentsWithCompletion___block_invoke_3;
  block[3] = &unk_1E59CB038;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v8);
}

BOOL __83__PKPeerPaymentAutoReloadSectionController__updateRecurringPaymentsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 type] == 3;
}

void __83__PKPeerPaymentAutoReloadSectionController__updateRecurringPaymentsWithCompletion___block_invoke_3(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = WeakRetained;
    objc_storeStrong(WeakRetained + 8, *(id *)(a1 + 32));
    id v4 = objc_loadWeakRetained(v7 + 10);
    v5 = [v7 sectionIdentifiers];
    [v4 reloadSections:v5];

    id v3 = v7;
    uint64_t v6 = *(void *)(a1 + 40);
    if (v6)
    {
      (*(void (**)(void))(v6 + 16))();
      id v3 = v7;
    }
  }
}

- (BOOL)_sectionAvailable
{
  if ([(PKPeerPaymentAccount *)self->_account supportsThresholdTopUp])
  {
    account = self->_account;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v5 = [WeakRetained familyCollection];
    uint64_t v6 = [v5 currentUser];
    if ([(PKPeerPaymentAccount *)account isEligibleForThresholdTopUpForUser:v6])int v7 = PKIsVision() ^ 1; {
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

- (int64_t)tableView:(id)a3 numberOfRowsInSectionIdentifier:(id)a4
{
  return [(PKPeerPaymentAutoReloadSectionController *)self _sectionAvailable];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  v43[2] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", @"AutoReload", a4, a5);
  if (!v6) {
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:@"AutoReload"];
  }
  int v7 = [MEMORY[0x1E4FB1948] cellConfiguration];
  if (self->_autoReloadPayment)
  {
    id v8 = PKLocalizedPeerPaymentRecurringString(&cfstr_AutoReloadEntr.isa);
    [v7 setText:v8];

    id v9 = [(PKPeerPaymentRecurringPayment *)self->_autoReloadPayment currency];
    id v10 = [(PKPeerPaymentRecurringPayment *)self->_autoReloadPayment amount];
    id v11 = [(PKPeerPaymentRecurringPayment *)self->_autoReloadPayment threshold];
    if (v11) {
      BOOL v12 = v9 == 0;
    }
    else {
      BOOL v12 = 1;
    }
    if (!v12)
    {
      v13 = PKCurrencyAmountMake();
      v14 = [v13 minimalFormattedStringValue];
      v15 = PKLocalizedPeerPaymentRecurringString(&cfstr_AutoReloadEntr_0.isa, &stru_1EF1B4C70.isa, v14);
      [v7 setSecondaryText:v15];
    }
    uint64_t v16 = [v7 textProperties];
    v17 = [MEMORY[0x1E4FB1618] labelColor];
    [v16 setColor:v17];

    if (v10 && v9)
    {
      v41 = PKCurrencyAmountMake();
      v18 = [MEMORY[0x1E4FB1830] configurationWithWeight:6];
      v19 = [MEMORY[0x1E4FB1830] configurationWithScale:1];
      v42 = [v18 configurationByApplyingConfiguration:v19];

      v20 = [MEMORY[0x1E4FB1818] systemImageNamed:@"chevron.forward" withConfiguration:v42];
      objc_super v21 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v20];
      v22 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
      [v21 setTintColor:v22];

      objc_msgSend(v21, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
      double v24 = v23;
      double v26 = v25;
      id v27 = objc_alloc_init(MEMORY[0x1E4FB1930]);
      v28 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], (NSString *)*MEMORY[0x1E4FB2798]);
      [v27 setFont:v28];

      v29 = [v41 minimalFormattedStringValue];
      [v27 setText:v29];

      [v27 setAccessibilityIdentifier:*MEMORY[0x1E4F85228]];
      objc_msgSend(v27, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
      double v31 = v30;
      double v33 = v32;
      id v34 = objc_alloc(MEMORY[0x1E4FB1C60]);
      v43[0] = v27;
      v43[1] = v21;
      v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:2];
      v36 = (void *)[v34 initWithArrangedSubviews:v35];

      [v36 setAxis:0];
      [v36 setAlignment:4];
      [v36 setSpacing:6.0];
      objc_msgSend(v36, "setFrame:", 0.0, 0.0, v24 + v31 + 6.0, fmax(v33, v26));
      [v6 setAccessoryView:v36];
    }
    else
    {
      [v6 setAccessoryType:1];
    }
  }
  else
  {
    v37 = PKLocalizedPeerPaymentRecurringString(&cfstr_AutoReloadSetu.isa);
    [v7 setText:v37];

    v38 = [v7 textProperties];
    v39 = [MEMORY[0x1E4FB1618] systemBlueColor];
    [v38 setColor:v39];

    [v6 setAccessoryView:0];
    [v6 setAccessoryType:0];
  }
  [v6 setAccessibilityIdentifier:*MEMORY[0x1E4F85258]];
  [v6 setContentConfiguration:v7];

  return v6;
}

- (id)titleForFooterInSectionIdentifier:(id)a3
{
  if ([(PKPeerPaymentAutoReloadSectionController *)self _sectionAvailable])
  {
    id v3 = PKLocalizedPeerPaymentRecurringString(&cfstr_AutoReloadSetu_0.isa);
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  [(PKPeerPaymentAutoReloadSectionController *)self presentAutoReload];
  [v8 deselectRowAtIndexPath:v7 animated:1];
}

- (void)presentAutoReload
{
}

- (void)recurringPaymentsChanged
{
}

- (void)thresholdTopUpController:(id)a3 requestsDismissViewController:(id)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v4 = objc_msgSend(WeakRetained, "pkui_frontMostViewController");
  [v4 dismissViewControllerAnimated:1 completion:0];
}

- (void)thresholdTopUpController:(id)a3 requestsPresentViewController:(id)a4
{
  p_delegate = &self->_delegate;
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  uint64_t v6 = objc_msgSend(WeakRetained, "pkui_frontMostViewController");
  [v6 presentViewController:v5 animated:1 completion:0];
}

- (void)thresholdTopUpController:(id)a3 requestsPushViewController:(id)a4
{
  p_delegate = &self->_delegate;
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  uint64_t v6 = [WeakRetained navigationController];
  [v6 pushViewController:v5 animated:1];
}

- (void)thresholdTopUpControllerCompletedSetup:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v3 = [WeakRetained navigationController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (id)presentationSceneIdentifierForTopUpController:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v4 = [WeakRetained view];
  id v5 = [v4 window];
  uint64_t v6 = [v5 windowScene];
  id v7 = [v6 _sceneIdentifier];

  return v7;
}

- (void)thresholdTopUpController:(id)a3 requestsPopViewController:(id)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v4 = [WeakRetained navigationController];
  id v5 = (id)[v4 popViewControllerAnimated:1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controller, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_account, 0);

  objc_storeStrong((id *)&self->_autoReloadPayment, 0);
}

@end