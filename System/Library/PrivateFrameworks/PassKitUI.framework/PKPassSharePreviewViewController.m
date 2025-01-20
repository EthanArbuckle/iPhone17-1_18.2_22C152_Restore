@interface PKPassSharePreviewViewController
- (BOOL)presentationControllerShouldDismiss:(id)a3;
- (PKPassSharePreviewViewController)initWithSharesController:(id)a3 context:(id)a4 delegate:(id)a5;
- (id)searchController:(id)a3 composeRecipientForAddress:(id)a4;
- (void)_cancelPressed;
- (void)_closeContactPicker;
- (void)_continueButtonPressed;
- (void)contactPicker:(id)a3 didSelectContact:(id)a4;
- (void)contactPickerDidCancel:(id)a3;
- (void)contextDidChange;
- (void)didTapTextViewAccessoryButtonForSearchController:(id)a3 anchoredToView:(id)a4;
- (void)loadView;
- (void)searchController:(id)a3 didAddRecipient:(id)a4;
- (void)setShowHeaderSpinner:(BOOL)a3;
- (void)sharePreviewSectionControllerDidSelectEntitlements:(id)a3;
- (void)sharePreviewSectionControllerDidSelectShowContactPicker:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PKPassSharePreviewViewController

- (PKPassSharePreviewViewController)initWithSharesController:(id)a3 context:(id)a4 delegate:(id)a5
{
  v39[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v38.receiver = self;
  v38.super_class = (Class)PKPassSharePreviewViewController;
  v12 = [(PKPaymentSetupOptionsViewController *)&v38 initWithProvisioningController:0 context:0 delegate:0];
  v13 = v12;
  if (v12)
  {
    id v36 = v10;
    id v37 = v9;
    p_sharesController = (id *)&v12->_sharesController;
    objc_storeStrong((id *)&v12->_sharesController, a3);
    objc_storeStrong((id *)&v13->_context, a4);
    objc_storeWeak((id *)&v13->_delegate, v11);
    v15 = objc_alloc_init(PKPassSnapshotter);
    passSnapshotter = v13->_passSnapshotter;
    v13->_passSnapshotter = v15;

    id v17 = objc_alloc(MEMORY[0x1E4F84870]);
    v18 = [(PKPassShareInitiationContext *)v13->_context composedShare];
    v19 = [v18 sharedEntitlements];
    v20 = [*p_sharesController shareableEntitlements];
    v21 = [*p_sharesController possiblePredefinedEntitlements];
    uint64_t v22 = [v17 initWithSharedEntitlements:v19 availableEntitlements:v20 predefinedSharedEntitlements:v21 editable:1];
    entitlementComposer = v13->_entitlementComposer;
    v13->_entitlementComposer = (PKPassEntitlementsComposer *)v22;

    -[PKPassEntitlementsComposer setMaxSelectionCount:](v13->_entitlementComposer, "setMaxSelectionCount:", [*p_sharesController maxEntitlementSelectionCount]);
    v24 = [(PKPassEntitlementsComposer *)v13->_entitlementComposer predefinedEntitlementEntries];
    if ([v24 count])
    {
      v25 = v13->_entitlementComposer;
      v26 = [v24 objectAtIndexedSubscript:0];
      v27 = [(PKPassEntitlementsComposer *)v25 viewForPredefined:v26];

      [v27 setEnabled:1];
    }
    v28 = [PKSharePreviewOverviewSectionController alloc];
    v29 = [*p_sharesController pass];
    id v10 = v36;
    uint64_t v30 = -[PKSharePreviewOverviewSectionController initWithInitiationContext:accessType:entitlementComposer:delegate:](v28, "initWithInitiationContext:accessType:entitlementComposer:delegate:", v36, [v29 accessType], v13->_entitlementComposer, v13);
    overviewSectionController = v13->_overviewSectionController;
    v13->_overviewSectionController = (PKSharePreviewOverviewSectionController *)v30;

    v32 = [[PKSharePreviewAdditionalSecuritySectionController alloc] initWithInitiationContext:v13->_context delegate:v13];
    additionalSecuritySectionController = v13->_additionalSecuritySectionController;
    v13->_additionalSecuritySectionController = v32;

    [(PKDynamicCollectionViewController *)v13 setUseItemIdentityWhenUpdating:1];
    [(PKPassSharePreviewViewController *)v13 setModalPresentationStyle:6];
    v39[0] = v13->_overviewSectionController;
    v39[1] = v13->_additionalSecuritySectionController;
    v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];
    [(PKPaymentSetupOptionsViewController *)v13 setSections:v34 animated:0];

    id v9 = v37;
  }

  return v13;
}

- (void)loadView
{
  v28.receiver = self;
  v28.super_class = (Class)PKPassSharePreviewViewController;
  [(PKDynamicCollectionViewController *)&v28 loadView];
  v3 = [(PKPassSharePreviewViewController *)self navigationItem];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel__cancelPressed];
  [v3 setLeftBarButtonItem:v4];

  id v5 = objc_alloc(MEMORY[0x1E4FB14A8]);
  v6 = PKLocalizedPaymentString(&cfstr_Continue.isa);
  v7 = (void *)[v5 initWithTitle:v6 style:0 target:self action:sel__continueButtonPressed];
  [v3 setRightBarButtonItem:v7];

  v8 = [(PKSharedPassSharesController *)self->_sharesController pass];
  PKLocalizationKeyForPassType();
  id v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  id v10 = PKLocalizedShareableCredentialString(v9);
  [(PKPaymentSetupOptionsViewController *)self setTitleText:v10];

  id v11 = PKLocalizationKeyForPassType();
  if ([v8 accessType] == 4)
  {
    uint64_t v12 = [v11 stringByAppendingString:@"_VEHICLE"];

    id v11 = (void *)v12;
  }
  v13 = PKLocalizedShareableCredentialString((NSString *)v11);
  [(PKPaymentSetupOptionsViewController *)self setSubtitleText:v13];

  v14 = [(PKPaymentSetupOptionsViewController *)self headerView];
  v15 = [[PKHeroCardExplanationHeaderView alloc] initWithImage:0];
  [(PKHeroCardExplanationHeaderView *)v15 setPadding:1];
  v16 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [(PKHeroCardExplanationHeaderView *)v15 setBackgroundColor:v16];

  [(PKHeroCardExplanationHeaderView *)v15 setSize:0];
  [v14 setTopArtView:v15];
  passSnapshotter = self->_passSnapshotter;
  v18 = [(PKSharedPassSharesController *)self->_sharesController pass];
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  v24 = __44__PKPassSharePreviewViewController_loadView__block_invoke;
  v25 = &unk_1E59CA910;
  v26 = v15;
  v27 = self;
  v19 = v15;
  -[PKPassSnapshotter snapshotWithPass:size:completion:](passSnapshotter, "snapshotWithPass:size:completion:", v18, &v22, 142.0, 90.0);

  objc_msgSend(v14, "setAdditionalBottomPadding:", 5.0, v22, v23, v24, v25);
  v20 = [(PKPaymentSetupOptionsViewController *)self dockView];
  v21 = [v20 footerView];
  [v20 setPrimaryButton:0];
  [v21 setSetupLaterButton:0];
  [v21 setManualEntryButton:0];
}

void __44__PKPassSharePreviewViewController_loadView__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__PKPassSharePreviewViewController_loadView__block_invoke_2;
  block[3] = &unk_1E59CA8E8;
  id v6 = *(id *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = *(void *)(a1 + 40);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __44__PKPassSharePreviewViewController_loadView__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setCardImage:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 48) view];
  [v2 setNeedsLayout];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPassSharePreviewViewController;
  [(PKPaymentSetupOptionsViewController *)&v5 viewWillAppear:a3];
  [(PKPassSharePreviewViewController *)self contextDidChange];
  id v4 = [(PKPassSharePreviewViewController *)self sheetPresentationController];
  [v4 setDelegate:self];
}

- (void)_continueButtonPressed
{
  context = self->_context;
  id v8 = 0;
  id v4 = [(PKSharedPassSharesController *)self->_sharesController pass];
  BOOL v5 = [(PKPassShareInitiationContext *)context isShareConfiguredEnoughToBeSentOverChannelWithDisplayableError:&v8 pass:v4];
  id v6 = v8;

  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained sharePreviewViewControllerDidContinue:self];
  }
  else
  {
    id WeakRetained = PKAlertForDisplayableErrorWithHandlers(v6, 0, 0, 0);
    [(PKPassSharePreviewViewController *)self presentViewController:WeakRetained animated:1 completion:0];
  }
}

- (void)_cancelPressed
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained sharePreviewViewControllerDidCancel:self];
}

- (void)contextDidChange
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = [(PKPassEntitlementsComposer *)self->_entitlementComposer composeSharedEntitlements];
  id v4 = [(PKPassShareInitiationContext *)self->_context composedShare];
  [v4 setSharedEntitlements:v3];

  BOOL v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Entitlements To Shares: %@", (uint8_t *)&v6, 0xCu);
  }

  [(PKSharePreviewOverviewSectionController *)self->_overviewSectionController setContext:self->_context];
  [(PKSharePreviewOverviewSectionController *)self->_overviewSectionController reloadItemsAnimated:0];
}

- (void)_closeContactPicker
{
}

- (void)setShowHeaderSpinner:(BOOL)a3
{
  BOOL v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPassSharePreviewViewController;
  -[PKPaymentSetupOptionsViewController setShowHeaderSpinner:](&v10, sel_setShowHeaderSpinner_);
  BOOL v5 = !v3;
  int v6 = [(PKPassSharePreviewViewController *)self navigationItem];
  id v7 = [v6 rightBarButtonItem];
  [v7 setEnabled:v5];

  uint64_t v8 = [v6 leftBarButtonItem];
  [v8 setEnabled:v5];

  id v9 = [(PKPassSharePreviewViewController *)self view];
  [v9 setUserInteractionEnabled:v5];
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  return 0;
}

- (void)sharePreviewSectionControllerDidSelectShowContactPicker:(id)a3
{
  id v4 = (CNAutocompleteSearchController *)[objc_alloc(MEMORY[0x1E4F5A0F8]) initWithSearchType:5];
  contactSearchController = self->_contactSearchController;
  self->_contactSearchController = v4;

  int v6 = self->_contactSearchController;
  id v7 = PKLocalizedShareableCredentialString(&cfstr_ShareOverviewC.isa);
  [(CNAutocompleteSearchController *)v6 setSuggestionsHeaderTitleOverride:v7];

  [(CNAutocompleteSearchController *)self->_contactSearchController setDelegate:self];
  id v11 = [(CNAutocompleteSearchController *)self->_contactSearchController navigationItem];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel__closeContactPicker];
  [v11 setRightBarButtonItem:v8];

  id v9 = PKLocalizedShareableCredentialString(&cfstr_ShareOverviewS_1.isa);
  [v11 setTitle:v9];

  objc_super v10 = [[PKNavigationController alloc] initWithRootViewController:self->_contactSearchController];
  [(PKPassSharePreviewViewController *)self presentViewController:v10 animated:1 completion:0];
}

- (void)sharePreviewSectionControllerDidSelectEntitlements:(id)a3
{
  id v8 = [(PKSharedPassSharesController *)self->_sharesController pass];
  id v4 = [(PKPassEntitlementsComposer *)self->_entitlementComposer predefinedEntitlementEntries];

  if (v4) {
    BOOL v5 = [[PKPassSharePredefinedEntitlementSelectionViewController alloc] initWithMode:0 entitlementComposer:self->_entitlementComposer pass:v8];
  }
  else {
    BOOL v5 = -[PKPassShareEntitlementSelectionViewController initWithAccessType:mode:entitlementComposer:]([PKPassShareEntitlementSelectionViewController alloc], "initWithAccessType:mode:entitlementComposer:", [v8 accessType], 0, self->_entitlementComposer);
  }
  int v6 = v5;
  id v7 = [(PKPassSharePreviewViewController *)self navigationController];
  [v7 pushViewController:v6 animated:1];
}

- (id)searchController:(id)a3 composeRecipientForAddress:(id)a4
{
  id v4 = (objc_class *)MEMORY[0x1E4F5A138];
  id v5 = a4;
  int v6 = (void *)[[v4 alloc] initWithContact:0 address:v5 kind:2];

  return v6;
}

- (void)searchController:(id)a3 didAddRecipient:(id)a4
{
  id v10 = a4;
  [a3 dismissViewControllerAnimated:1 completion:0];
  int v6 = [v10 displayString];
  if (![v6 length])
  {
    uint64_t v7 = [v10 address];

    int v6 = (void *)v7;
  }
  context = self->_context;
  id v9 = [v10 contact];
  [(PKPassShareInitiationContext *)context setRecipient:v9 fallbackNickname:v6];

  [(PKPassSharePreviewViewController *)self contextDidChange];
}

- (void)didTapTextViewAccessoryButtonForSearchController:(id)a3 anchoredToView:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x1E4F1BB80];
  id v6 = a4;
  id v8 = (id)[[v5 alloc] initWithNibName:0 bundle:0];
  [v8 setDelegate:self];
  [v8 setEditing:0];
  uint64_t v7 = [v8 popoverPresentationController];
  [v7 setSourceView:v6];

  [(CNAutocompleteSearchController *)self->_contactSearchController presentViewController:v8 animated:1 completion:0];
}

- (void)contactPickerDidCancel:(id)a3
{
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x1E4F5A138];
  id v6 = a4;
  id v7 = (id)[[v5 alloc] initWithContact:v6 address:0 kind:2];

  [(PKPassSharePreviewViewController *)self searchController:self->_contactSearchController didAddRecipient:v7];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passSnapshotter, 0);
  objc_storeStrong((id *)&self->_contactSearchController, 0);
  objc_storeStrong((id *)&self->_additionalSecuritySectionController, 0);
  objc_storeStrong((id *)&self->_overviewSectionController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_entitlementComposer, 0);
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_sharesController, 0);
}

@end