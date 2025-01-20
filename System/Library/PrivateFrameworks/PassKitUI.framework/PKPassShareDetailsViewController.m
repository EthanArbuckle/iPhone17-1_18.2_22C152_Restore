@interface PKPassShareDetailsViewController
- (PKPassShareDetailsViewController)initWithShare:(id)a3 sharesController:(id)a4 authorizer:(id)a5;
- (id)avatarView;
- (void)_donePressed;
- (void)_saveTapped;
- (void)_setIsLoading:(BOOL)a3;
- (void)_setRecipient:(id)a3;
- (void)_setSender:(id)a3;
- (void)_showDisplayableError:(id)a3;
- (void)_updateShareToShare:(id)a3;
- (void)loadView;
- (void)passSharesListSectionController:(id)a3 didSelectShare:(id)a4;
- (void)passSharesListSectionController:(id)a3 presentAlert:(id)a4;
- (void)passSharesListSectionController:(id)a3 setIsLoading:(BOOL)a4;
- (void)passSharesListSectionControllerDidFinishRevokingShares:(id)a3;
- (void)sharePreviewSectionControllerDidSelectEntitlements:(id)a3;
- (void)showSaveButtonIfNecessary;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PKPassShareDetailsViewController

- (PKPassShareDetailsViewController)initWithShare:(id)a3 sharesController:(id)a4 authorizer:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v36.receiver = self;
  v36.super_class = (Class)PKPassShareDetailsViewController;
  v11 = [(PKPaymentSetupOptionsViewController *)&v36 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    share = v11->_share;
    v11->_share = (PKPassShare *)v12;

    objc_storeStrong((id *)&v11->_sharesController, a4);
    objc_storeStrong((id *)&v11->_authorizer, a5);
    uint64_t v14 = [(PKSharedPassSharesController *)v11->_sharesController senderShareForShare:v11->_share];
    senderShare = v11->_senderShare;
    v11->_senderShare = (PKPassShare *)v14;

    id v16 = objc_alloc(MEMORY[0x1E4F84870]);
    v17 = [(PKPassShare *)v11->_share sharedEntitlements];
    v18 = [(PKSharedPassSharesController *)v11->_sharesController shareableEntitlements];
    v19 = [(PKSharedPassSharesController *)v11->_sharesController possiblePredefinedEntitlements];
    uint64_t v20 = objc_msgSend(v16, "initWithSharedEntitlements:availableEntitlements:predefinedSharedEntitlements:editable:", v17, v18, v19, -[PKPassShare isEditable](v11->_share, "isEditable"));
    entitlementComposer = v11->_entitlementComposer;
    v11->_entitlementComposer = (PKPassEntitlementsComposer *)v20;

    [(PKPassEntitlementsComposer *)v11->_entitlementComposer setMaxSelectionCount:[(PKSharedPassSharesController *)v11->_sharesController maxEntitlementSelectionCount]];
    id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v23 = [PKSharePreviewOverviewSectionController alloc];
    v24 = [(PKSharedPassSharesController *)v11->_sharesController pass];
    uint64_t v25 = -[PKSharePreviewOverviewSectionController initWithMode:accessType:entitlementComposer:delegate:](v23, "initWithMode:accessType:entitlementComposer:delegate:", 2, [v24 accessType], v11->_entitlementComposer, v11);
    overviewSectionController = v11->_overviewSectionController;
    v11->_overviewSectionController = (PKSharePreviewOverviewSectionController *)v25;

    [v22 addObject:v11->_overviewSectionController];
    [v8 status];
    if ((PKShareStatusIsPending() & 1) != 0
      || ([v8 status], (PKShareStatusIsPendingVerification() & 1) != 0)
      || ([(PKPassShare *)v11->_share activationOptions],
          v27 = objc_claimAutoreleasedReturnValue(),
          int v28 = [v27 containsVehicleEnteredPin],
          v27,
          v28))
    {
      v29 = [PKSharePreviewAdditionalSecuritySectionController alloc];
      v30 = [(PKPassShare *)v11->_share activationOptions];
      uint64_t v31 = [(PKSharePreviewAdditionalSecuritySectionController *)v29 initWithMode:2 activationOptions:v30 delegate:v11];
      additionalSecuritySectionController = v11->_additionalSecuritySectionController;
      v11->_additionalSecuritySectionController = (PKSharePreviewAdditionalSecuritySectionController *)v31;

      [v22 addObject:v11->_additionalSecuritySectionController];
    }
    v33 = [[PKPassSharesListSectionController alloc] initWithMode:2 sharesController:v11->_sharesController rootShare:v11->_share delegate:v11];
    sharesSectionController = v11->_sharesSectionController;
    v11->_sharesSectionController = v33;

    [v22 addObject:v11->_sharesSectionController];
    [(PKPaymentSetupOptionsViewController *)v11 setSections:v22 animated:0];
  }
  return v11;
}

- (void)loadView
{
  v15.receiver = self;
  v15.super_class = (Class)PKPassShareDetailsViewController;
  [(PKDynamicCollectionViewController *)&v15 loadView];
  v3 = objc_alloc_init(PKAvatarView);
  [(PKAvatarView *)v3 setDiameter:100.0];
  v4 = [(PKPaymentSetupOptionsViewController *)self headerView];
  [v4 setTopArtView:v3];

  v5 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
  [(PKPaymentSetupOptionsViewController *)self setBackgroundColor:v5];

  v6 = [(PKDynamicCollectionViewController *)self collectionView];
  objc_msgSend(v6, "setContentInset:", 10.0, 0.0, 0.0, 0.0);

  if (self->_senderShare)
  {
    v7 = -[PKSharedPassSharesController contactForShare:](self->_sharesController, "contactForShare:");
    if (v7)
    {
      [(PKPassShareDetailsViewController *)self _setSender:v7];
    }
    else
    {
      sharesController = self->_sharesController;
      senderShare = self->_senderShare;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __44__PKPassShareDetailsViewController_loadView__block_invoke;
      v14[3] = &unk_1E59D25A8;
      v14[4] = self;
      [(PKSharedPassSharesController *)sharesController fetchContactForShare:senderShare withCompletion:v14];
    }
  }
  id v10 = [(PKSharedPassSharesController *)self->_sharesController contactForShare:self->_share];
  if (v10)
  {
    [(PKPassShareDetailsViewController *)self _setRecipient:v10];
  }
  else
  {
    v11 = self->_sharesController;
    share = self->_share;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __44__PKPassShareDetailsViewController_loadView__block_invoke_2;
    v13[3] = &unk_1E59D25A8;
    v13[4] = self;
    [(PKSharedPassSharesController *)v11 fetchContactForShare:share withCompletion:v13];
  }
}

void __44__PKPassShareDetailsViewController_loadView__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    [v3 _setSender:a2];
  }
  else
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1BA40]);
    v4 = [*(id *)(*(void *)(a1 + 32) + 1288) recipientNickname];
    [v5 setNickname:v4];

    [*(id *)(a1 + 32) _setSender:v5];
  }
}

void __44__PKPassShareDetailsViewController_loadView__block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    [v3 _setRecipient:a2];
  }
  else
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1BA40]);
    v4 = [*(id *)(*(void *)(a1 + 32) + 1280) recipientNickname];
    [v6 setNickname:v4];

    id v5 = [*(id *)(*(void *)(a1 + 32) + 1280) recipientNickname];
    [v6 setGivenName:v5];

    [*(id *)(a1 + 32) _setRecipient:v6];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PKPassShareDetailsViewController;
  [(PKPaymentSetupOptionsViewController *)&v10 viewWillAppear:a3];
  [(PKPassShareDetailsViewController *)self showSaveButtonIfNecessary];
  v4 = [(PKPassShareDetailsViewController *)self navigationController];
  id v5 = [v4 viewControllers];
  uint64_t v6 = [v5 count];

  if (v6 == 1)
  {
    v7 = [(PKPassShareDetailsViewController *)self navigationItem];
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel__donePressed];
    [v7 setRightBarButtonItem:v8];
  }
  id v9 = [(PKPassShareDetailsViewController *)self navigationItem];
  [v9 setLargeTitleDisplayMode:2];
}

- (void)_setSender:(id)a3
{
  uint64_t v4 = [MEMORY[0x1E4F1B910] stringFromContact:a3 style:0];
  if (!v4)
  {
    uint64_t v4 = [(PKPassShare *)self->_senderShare recipientNickname];
  }
  id v10 = (id)v4;
  uint64_t v5 = [(PKPassShare *)self->_share status];
  if ((unint64_t)(v5 - 2) < 4)
  {
    uint64_t v6 = @"SHARED_KEY_INVITED_CELL_SUBTITLE";
    goto LABEL_7;
  }
  if ((unint64_t)(v5 - 6) < 3)
  {
    uint64_t v6 = @"SHARED_KEY_REVOKING_CELL_SUBTITLE";
LABEL_7:
    v7 = PKLocalizedCredentialString(&v6->isa);
    goto LABEL_8;
  }
  if (v5 != 1)
  {
    v7 = 0;
    goto LABEL_8;
  }
  id v8 = [(PKPassShare *)self->_share creationDate];
  if (v10 && v8)
  {
    id v9 = PKLongDateString();
    PKLocalizedShareableCredentialString(&cfstr_ShareManagemen_4.isa, &stru_1EF1B5770.isa, v10, v9);
  }
  else
  {
    if (v10)
    {
      v7 = PKLocalizedShareableCredentialString(&cfstr_ShareManagemen_5.isa, &stru_1EF1B4C70.isa, v10);
      goto LABEL_19;
    }
    if (!v8)
    {
      v7 = 0;
      goto LABEL_19;
    }
    id v9 = PKLongDateString();
    PKLocalizedShareableCredentialString(&cfstr_ShareManagemen_6.isa, &stru_1EF1B4C70.isa, v9);
  v7 = };

LABEL_19:
LABEL_8:
  [(PKPaymentSetupOptionsViewController *)self setSubtitleText:v7];
}

- (void)_setRecipient:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PKPassShareDetailsViewController *)self avatarView];
  [v5 setContact:v4];

  id v7 = [MEMORY[0x1E4F1B910] stringFromContact:v4 style:0];

  uint64_t v6 = (uint64_t)v7;
  if (!v7)
  {
    uint64_t v6 = [(PKPassShare *)self->_share recipientNickname];
  }
  id v8 = (id)v6;
  [(PKPaymentSetupOptionsViewController *)self setTitleText:v6];
}

- (void)_saveTapped
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v3 = [(PKPassEntitlementsComposer *)self->_entitlementComposer composeSharedEntitlements];
  id v4 = (void *)[(PKPassShare *)self->_share copy];
  [v4 setSharedEntitlements:v3];
  if ([v3 count])
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v5 = v3;
    uint64_t v6 = 0;
    uint64_t v7 = [v5 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v36 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          if (v6 <= [v10 creationVersion]) {
            uint64_t v6 = [v10 creationVersion];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v7);
    }

    if (v6 <= *MEMORY[0x1E4F87EA0])
    {
      [(PKPassShareDetailsViewController *)self _updateShareToShare:v4];
    }
    else
    {
      v11 = [(PKSharedPassSharesController *)self->_sharesController pass];
      PKLocalizationKeyForPassType();
      uint64_t v12 = (NSString *)objc_claimAutoreleasedReturnValue();
      v13 = PKLocalizedShareableCredentialString(v12);

      uint64_t v14 = [(PKSharedPassSharesController *)self->_sharesController pass];
      PKLocalizationKeyForPassType();
      objc_super v15 = (NSString *)objc_claimAutoreleasedReturnValue();
      id v16 = PKLocalizedShareableCredentialString(v15);

      v17 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v13 message:v16 preferredStyle:1];
      objc_initWeak(&location, self);
      v18 = (void *)MEMORY[0x1E4FB1410];
      v19 = PKLocalizedPaymentString(&cfstr_Continue.isa);
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __47__PKPassShareDetailsViewController__saveTapped__block_invoke;
      v31[3] = &unk_1E59D25D0;
      objc_copyWeak(&v33, &location);
      id v32 = v4;
      uint64_t v20 = [v18 actionWithTitle:v19 style:0 handler:v31];
      [v17 addAction:v20];

      v21 = (void *)MEMORY[0x1E4FB1410];
      id v22 = PKLocalizedString(&cfstr_CancelButtonTi.isa);
      v23 = [v21 actionWithTitle:v22 style:0 handler:0];
      [v17 addAction:v23];

      [(PKPassShareDetailsViewController *)self presentViewController:v17 animated:1 completion:0];
      objc_destroyWeak(&v33);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    v24 = (void *)MEMORY[0x1E4FB1418];
    uint64_t v25 = PKLocalizedShareableCredentialString(&cfstr_ShareManagemen_7.isa);
    v26 = PKLocalizedShareableCredentialString(&cfstr_ShareManagemen_8.isa);
    v27 = [v24 alertControllerWithTitle:v25 message:v26 preferredStyle:1];

    int v28 = (void *)MEMORY[0x1E4FB1410];
    v29 = PKLocalizedString(&cfstr_OkButtonTitle.isa);
    v30 = [v28 actionWithTitle:v29 style:0 handler:0];
    [v27 addAction:v30];

    [(PKPassShareDetailsViewController *)self presentViewController:v27 animated:1 completion:0];
  }
}

void __47__PKPassShareDetailsViewController__saveTapped__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _updateShareToShare:*(void *)(a1 + 32)];
}

- (void)_updateShareToShare:(id)a3
{
  id v4 = a3;
  [(PKPassShareDetailsViewController *)self _setIsLoading:1];
  objc_initWeak(&location, self);
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__16;
  v15[4] = __Block_byref_object_dispose__16;
  id v16 = 0;
  authorizer = self->_authorizer;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __56__PKPassShareDetailsViewController__updateShareToShare___block_invoke;
  v12[3] = &unk_1E59D2620;
  v12[4] = self;
  id v6 = v4;
  id v13 = v6;
  uint64_t v14 = v15;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__PKPassShareDetailsViewController__updateShareToShare___block_invoke_3;
  v8[3] = &unk_1E59D2648;
  objc_copyWeak(&v11, &location);
  id v10 = v15;
  id v7 = v6;
  id v9 = v7;
  [(PKShareAuthorizationSession *)authorizer authorizeDeviceOwnerWithAuthHandler:v12 completion:v8];

  objc_destroyWeak(&v11);
  _Block_object_dispose(v15, 8);

  objc_destroyWeak(&location);
}

void __56__PKPassShareDetailsViewController__updateShareToShare___block_invoke(void *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = a1[5];
  id v7 = *(void **)(a1[4] + 1296);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__PKPassShareDetailsViewController__updateShareToShare___block_invoke_2;
  v10[3] = &unk_1E59D25F8;
  uint64_t v8 = a1[6];
  id v11 = v5;
  uint64_t v12 = v8;
  id v9 = v5;
  [v7 updateShare:v6 authorization:a2 completion:v10];
}

void __56__PKPassShareDetailsViewController__updateShareToShare___block_invoke_2(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  id v5 = obj;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __56__PKPassShareDetailsViewController__updateShareToShare___block_invoke_3(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v7 = WeakRetained;
    [WeakRetained _setIsLoading:0];
    if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) || (a2 & 1) == 0)
    {
      uint64_t v6 = [MEMORY[0x1E4F28C58] pkSharingError:9];
      [v7 _showDisplayableError:v6];
    }
    else
    {
      id v5 = *(id *)(a1 + 32);
      uint64_t v6 = (void *)v7[160];
      v7[160] = v5;
    }

    [v7 showSaveButtonIfNecessary];
    [v7 reloadDataAnimated:1];
    id WeakRetained = v7;
  }
}

- (void)_setIsLoading:(BOOL)a3
{
  if (a3)
  {
    id v8 = (id)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    [v8 startAnimating];
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v8];
    id v5 = [(PKPassShareDetailsViewController *)self navigationItem];
    [v5 setRightBarButtonItem:v4];

    uint64_t v6 = [(PKDynamicCollectionViewController *)self collectionView];
    [v6 setUserInteractionEnabled:0];
  }
  else
  {
    id v7 = [(PKPassShareDetailsViewController *)self navigationItem];
    [v7 setRightBarButtonItem:0];

    id v8 = [(PKDynamicCollectionViewController *)self collectionView];
    [v8 setUserInteractionEnabled:1];
  }
}

- (void)_showDisplayableError:(id)a3
{
  id v4 = PKSharingDisplayableError((NSError *)a3);
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    PKDisplayableErrorForCommonType();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v14 = v6;

  id v7 = (void *)MEMORY[0x1E4FB1418];
  id v8 = PKTitleForDisplayableError();
  id v9 = MEMORY[0x1A6221F20](v14);
  id v10 = [v7 alertControllerWithTitle:v8 message:v9 preferredStyle:1];

  id v11 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v12 = PKLocalizedString(&cfstr_OkButtonTitle.isa);
  id v13 = [v11 actionWithTitle:v12 style:0 handler:0];
  [v10 addAction:v13];

  [(PKPassShareDetailsViewController *)self presentViewController:v10 animated:1 completion:0];
}

- (void)_donePressed
{
}

- (id)avatarView
{
  v2 = [(PKPaymentSetupOptionsViewController *)self headerView];
  v3 = [v2 topArtView];

  return v3;
}

- (void)showSaveButtonIfNecessary
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  id v4 = [(PKPassShare *)self->_share sharedEntitlements];
  id v14 = (id)[v3 initWithArray:v4];

  id v5 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  id v6 = [(PKPassEntitlementsComposer *)self->_entitlementComposer composeSharedEntitlements];
  id v7 = (void *)[v5 initWithArray:v6];

  char v8 = [v7 isEqualToSet:v14];
  if (!self->_saveButton)
  {
    id v9 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:3 target:self action:sel__saveTapped];
    saveButton = self->_saveButton;
    self->_saveButton = v9;
  }
  id v11 = [(PKPassShareDetailsViewController *)self navigationItem];
  uint64_t v12 = v11;
  if (v8) {
    id v13 = 0;
  }
  else {
    id v13 = self->_saveButton;
  }
  [v11 setRightBarButtonItem:v13];
}

- (void)passSharesListSectionController:(id)a3 didSelectShare:(id)a4
{
  id v5 = a4;
  id v7 = [[PKPassShareDetailsViewController alloc] initWithShare:v5 sharesController:self->_sharesController authorizer:self->_authorizer];

  id v6 = [(PKPassShareDetailsViewController *)self navigationController];
  [v6 pushViewController:v7 animated:1];
}

- (void)passSharesListSectionController:(id)a3 setIsLoading:(BOOL)a4
{
}

- (void)passSharesListSectionControllerDidFinishRevokingShares:(id)a3
{
  id v4 = [(PKPassShareDetailsViewController *)self navigationController];
  id v3 = (id)[v4 popViewControllerAnimated:1];
}

- (void)passSharesListSectionController:(id)a3 presentAlert:(id)a4
{
}

- (void)sharePreviewSectionControllerDidSelectEntitlements:(id)a3
{
  id v4 = [PKPassShareEntitlementSelectionViewController alloc];
  id v5 = [(PKSharedPassSharesController *)self->_sharesController pass];
  id v7 = -[PKPassShareEntitlementSelectionViewController initWithAccessType:mode:entitlementComposer:](v4, "initWithAccessType:mode:entitlementComposer:", [v5 accessType], 2, self->_entitlementComposer);

  id v6 = [(PKPassShareDetailsViewController *)self navigationController];
  [v6 pushViewController:v7 animated:1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_saveButton, 0);
  objc_storeStrong((id *)&self->_sharesSectionController, 0);
  objc_storeStrong((id *)&self->_additionalSecuritySectionController, 0);
  objc_storeStrong((id *)&self->_entitlementSectionController, 0);
  objc_storeStrong((id *)&self->_overviewSectionController, 0);
  objc_storeStrong((id *)&self->_entitlementComposer, 0);
  objc_storeStrong((id *)&self->_authorizer, 0);
  objc_storeStrong((id *)&self->_sharesController, 0);
  objc_storeStrong((id *)&self->_senderShare, 0);

  objc_storeStrong((id *)&self->_share, 0);
}

@end