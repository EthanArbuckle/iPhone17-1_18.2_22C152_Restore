@interface PKPassDetailsIdentityBioBindingSectionController
+ (BOOL)validForPaymentPass:(id)a3;
- (PKPassDetailsIdentityBioBindingSectionController)init;
- (PKPassDetailsIdentityBioBindingSectionController)initWithPass:(id)a3 webService:(id)a4 delegate:(id)a5;
- (PKPassDetailsIdentityBioBindingSectionControllerDelegate)delegate;
- (id)allSectionIdentifiers;
- (id)sectionIdentifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5;
- (int64_t)tableView:(id)a3 numberOfRowsInSectionIdentifier:(id)a4;
- (void)_updateSectionIdentifiersNotify:(BOOL)a3 animated:(BOOL)a4;
- (void)loadBioBindingStateWithAnimated:(BOOL)a3 completion:(id)a4;
- (void)preflight:(id)a3;
- (void)setDelegate:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5;
@end

@implementation PKPassDetailsIdentityBioBindingSectionController

- (PKPassDetailsIdentityBioBindingSectionController)init
{
  return 0;
}

- (PKPassDetailsIdentityBioBindingSectionController)initWithPass:(id)a3 webService:(id)a4 delegate:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)PKPassDetailsIdentityBioBindingSectionController;
  v10 = [(PKPaymentPassDetailSectionController *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_pass, a3);
    objc_storeWeak((id *)&v11->_delegate, v9);
  }

  return v11;
}

+ (BOOL)validForPaymentPass:(id)a3
{
  return [a3 isIdentityPass];
}

- (void)_updateSectionIdentifiersNotify:(BOOL)a3 animated:(BOOL)a4
{
  int mapped = self->_mapped;
  int hasInvalidBioBinding = self->_hasInvalidBioBinding;
  self->_int mapped = hasInvalidBioBinding;
  if (mapped != hasInvalidBioBinding && a3)
  {
    BOOL v7 = a4;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v11 = WeakRetained;
    if (v7)
    {
      v10 = [(PKPassDetailsIdentityBioBindingSectionController *)self sectionIdentifiers];
      [v11 reloadSections:v10];
    }
    else
    {
      [WeakRetained reloadData:0];
    }
  }
}

- (void)loadBioBindingStateWithAnimated:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __95__PKPassDetailsIdentityBioBindingSectionController_loadBioBindingStateWithAnimated_completion___block_invoke;
  aBlock[3] = &unk_1E59CE138;
  aBlock[4] = self;
  BOOL v14 = a3;
  id v7 = v6;
  id v13 = v7;
  id v8 = (void (**)(void *, void))_Block_copy(aBlock);
  if ([(PKSecureElementPass *)self->_pass passActivationState])
  {
    v8[2](v8, 0);
  }
  else
  {
    Class NPKIDVRemoteDeviceSessionClass = getNPKIDVRemoteDeviceSessionClass();
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __95__PKPassDetailsIdentityBioBindingSectionController_loadBioBindingStateWithAnimated_completion___block_invoke_2;
    v10[3] = &unk_1E59CE188;
    id v11 = v8;
    [(objc_class *)NPKIDVRemoteDeviceSessionClass sessionForDeviceID:0 completion:v10];
  }
}

uint64_t __95__PKPassDetailsIdentityBioBindingSectionController_loadBioBindingStateWithAnimated_completion___block_invoke(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 73) = a2;
  [*(id *)(a1 + 32) _updateSectionIdentifiersNotify:1 animated:*(unsigned __int8 *)(a1 + 48)];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

void __95__PKPassDetailsIdentityBioBindingSectionController_loadBioBindingStateWithAnimated_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __95__PKPassDetailsIdentityBioBindingSectionController_loadBioBindingStateWithAnimated_completion___block_invoke_14;
    v8[3] = &unk_1E59CE160;
    id v9 = *(id *)(a1 + 32);
    [v5 fetchRemoteBiometricAuthenticationStatusForCredentialType:1 completion:v8];
  }
  else
  {
    id v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v6;
      _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "PKPassDetailsIdentityBioBindingSectionController: Failed to obtain NPK remote device session with error: %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __95__PKPassDetailsIdentityBioBindingSectionController_loadBioBindingStateWithAnimated_completion___block_invoke_14(uint64_t a1, int a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = PKLogFacilityTypeGetObject();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      int v9 = 138412290;
      v10 = v5;
      _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "PKPassDetailsIdentityBioBindingSectionController: Unable to fetch remote biometric authentication status. Error: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (v7)
  {
    id v8 = @"No";
    if (a2) {
      id v8 = @"Yes";
    }
    int v9 = 138412290;
    v10 = v8;
    _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "PKPassDetailsIdentityBioBindingSectionController: Credential trust lost: %@", (uint8_t *)&v9, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)preflight:(id)a3
{
}

- (id)allSectionIdentifiers
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"BioBindingSection";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (id)sectionIdentifiers
{
  if ([(PKPaymentPassDetailSectionController *)self detailViewStyle] == 2
    && ![(PKPaymentPassDetailSectionController *)self currentSegment]
    && self->_mapped)
  {
    v3 = [(PKPassDetailsIdentityBioBindingSectionController *)self allSectionIdentifiers];
  }
  else
  {
    v3 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v3;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  if (PKEqualObjects())
  {
    if ([v8 row])
    {
      int v9 = PKLocalizedIdentityString(&cfstr_IdentityWatchB_2.isa);
      v10 = [(PKPaymentPassDetailSectionController *)self linkCellWithText:v9 forTableView:v7];
    }
    else
    {
      unint64_t v11 = [(PKSecureElementPass *)self->_pass identityType];
      if (v11 > 3)
      {
        int v9 = 0;
      }
      else
      {
        int v9 = PKLocalizedIdentityString(&off_1E59CE1A8[v11]->isa);
      }
      uint64_t v12 = PKLocalizedIdentityString(&cfstr_IdentityWatchB_1.isa);
      v10 = [(PKPaymentPassDetailSectionController *)self stackedInfoCellWithPrimaryText:v12 detailText:v9 cellStyle:1 forTableView:v7];
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSectionIdentifier:(id)a4
{
  if (PKEqualObjects()) {
    return 2 * self->_hasInvalidBioBinding;
  }
  else {
    return 0;
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [v8 deselectRowAtIndexPath:v9 animated:1];
  int v11 = PKEqualObjects();

  if (v11 && [v9 row] == 1)
  {
    uint64_t v12 = [v8 cellForRowAtIndexPath:v9];
    [(PKPaymentPassDetailSectionController *)self showSpinner:1 inCell:v12 overrideTextColor:0];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __104__PKPassDetailsIdentityBioBindingSectionController_tableView_didSelectRowAtIndexPath_sectionIdentifier___block_invoke;
    v15[3] = &unk_1E59CA870;
    v15[4] = self;
    id v16 = v12;
    id v14 = v12;
    [WeakRetained didSelectDeleteReAddForSectionController:self completion:v15];
  }
}

void __104__PKPassDetailsIdentityBioBindingSectionController_tableView_didSelectRowAtIndexPath_sectionIdentifier___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [v1 linkTextColor];
  [v1 showSpinner:0 inCell:v2 overrideTextColor:v3];
}

- (PKPassDetailsIdentityBioBindingSectionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPassDetailsIdentityBioBindingSectionControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_pass, 0);
}

@end