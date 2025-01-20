@interface PXCloudPhotoWelcomeViewController
- (AAUIGenericTermsRemoteUI)_termsManager;
- (BOOL)_enableOnAppear;
- (BOOL)_requireStorageUpgrade;
- (ICQUICloudStorageOffersManager)_offersManager;
- (NSArray)_buttons;
- (PXCloudPhotoWelcomeViewController)initWithDefaultTitle;
- (PXCloudPhotoWelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5;
- (PXCloudPhotoWelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (void)_applicationWillEnterForeground:(id)a3;
- (void)_cloudPhotoWelcomeViewGoButtonTapped:(id)a3;
- (void)_cloudPhotoWelcomeViewLearnMoreTapped:(id)a3;
- (void)_cloudPhotoWelcomeViewNotNowButtonTapped:(id)a3;
- (void)_continueWithoutStoragePurchase:(id)a3;
- (void)_enableCloudPhotoLibrary;
- (void)_enableCloudPhotoLibraryWithoutCheck;
- (void)_handleEnableError:(id)a3;
- (void)_setButtons:(id)a3;
- (void)_setButtonsEnabled:(BOOL)a3;
- (void)_setEnableOnAppear:(BOOL)a3;
- (void)_setOffersManager:(id)a3;
- (void)_setRequireStorageUpgrade:(BOOL)a3;
- (void)_setTermsManager:(id)a3;
- (void)_updateCurrentActivity;
- (void)genericTermsRemoteUI:(id)a3 didFinishWithSuccess:(BOOL)a4;
- (void)manager:(id)a3 loadDidFailWithError:(id)a4;
- (void)manager:(id)a3 willPresentViewController:(id)a4;
- (void)managerDidCancel:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PXCloudPhotoWelcomeViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__termsManager, 0);
  objc_storeStrong((id *)&self->__offersManager, 0);
  objc_storeStrong((id *)&self->__buttons, 0);
}

- (void)_setEnableOnAppear:(BOOL)a3
{
  self->__enableOnAppear = a3;
}

- (BOOL)_enableOnAppear
{
  return self->__enableOnAppear;
}

- (void)_setRequireStorageUpgrade:(BOOL)a3
{
  self->__requireStorageUpgrade = a3;
}

- (BOOL)_requireStorageUpgrade
{
  return self->__requireStorageUpgrade;
}

- (void)_setTermsManager:(id)a3
{
}

- (AAUIGenericTermsRemoteUI)_termsManager
{
  return self->__termsManager;
}

- (void)_setOffersManager:(id)a3
{
}

- (ICQUICloudStorageOffersManager)_offersManager
{
  return self->__offersManager;
}

- (void)_setButtons:(id)a3
{
}

- (NSArray)_buttons
{
  return self->__buttons;
}

- (void)genericTermsRemoteUI:(id)a3 didFinishWithSuccess:(BOOL)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __79__PXCloudPhotoWelcomeViewController_genericTermsRemoteUI_didFinishWithSuccess___block_invoke;
  v4[3] = &unk_1E5DCFE98;
  BOOL v5 = a4;
  v4[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], v4);
}

uint64_t __79__PXCloudPhotoWelcomeViewController_genericTermsRemoteUI_didFinishWithSuccess___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = *(void **)(a1 + 32);
  if (v1) {
    return [v2 _enableCloudPhotoLibrary];
  }
  else {
    return [v2 _setButtonsEnabled:1];
  }
}

- (void)managerDidCancel:(id)a3
{
  v4 = PLUIGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEFAULT, "PXCloudPhotoWelcomeViewController: Up-sell offer was cancelled by the user.", buf, 2u);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__PXCloudPhotoWelcomeViewController_managerDidCancel___block_invoke;
  block[3] = &unk_1E5DD36F8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __54__PXCloudPhotoWelcomeViewController_managerDidCancel___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setButtonsEnabled:1];
}

- (void)manager:(id)a3 loadDidFailWithError:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = PLUIGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_ERROR, "PXCloudPhotoWelcomeViewController: Loading of Up-sell workflow failed with an error: %@", (uint8_t *)&v7, 0xCu);
  }

  [(PXCloudPhotoWelcomeViewController *)self _setButtonsEnabled:1];
}

- (void)manager:(id)a3 willPresentViewController:(id)a4
{
  v14[3] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = PLUIGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEFAULT, "PXCloudPhotoWelcomeViewController: Up-sell offer will present.", v13, 2u);
  }

  int v7 = PXLocalizedStringFromTable(@"ICLOUDPHOTOS_UPGRADE_STORAGE_TITLE", @"PhotosUICore");
  [v5 setTitle:v7];

  if ([(PXCloudPhotoWelcomeViewController *)self _requireStorageUpgrade])
  {
    objc_msgSend(v5, "px_removeFooterToolbar");
  }
  else
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:5 target:0 action:0];
    id v9 = objc_alloc(MEMORY[0x1E4FB14A8]);
    v10 = PXLocalizedStringFromTable(@"ICLOUDPHOTOS_CONTINUE_WITHOUT_PURCHASE", @"PhotosUICore");
    v11 = (void *)[v9 initWithTitle:v10 style:0 target:self action:sel__continueWithoutStoragePurchase_];

    v14[0] = v8;
    v14[1] = v11;
    v14[2] = v8;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:3];
    objc_msgSend(v5, "px_insertFooterToolbarWithItems:", v12);
  }
}

- (void)_setButtonsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v4 = [(PXCloudPhotoWelcomeViewController *)self _buttons];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) setEnabled:v3];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_handleEnableError:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__PXCloudPhotoWelcomeViewController__handleEnableError___block_invoke;
  v6[3] = &unk_1E5DD32A8;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __56__PXCloudPhotoWelcomeViewController__handleEnableError___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) code] == 10)
  {
    v2 = objc_msgSend(MEMORY[0x1E4F8A668], "pl_sharedAccountStore");
    BOOL v3 = objc_msgSend(v2, "aa_primaryAppleAccount");
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x2050000000;
    id v4 = (void *)getAAUIGenericTermsRemoteUIClass_softClass;
    uint64_t v27 = getAAUIGenericTermsRemoteUIClass_softClass;
    if (!getAAUIGenericTermsRemoteUIClass_softClass)
    {
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __getAAUIGenericTermsRemoteUIClass_block_invoke;
      v23[3] = &unk_1E5DD2B08;
      v23[4] = &v24;
      __getAAUIGenericTermsRemoteUIClass_block_invoke((uint64_t)v23);
      id v4 = (void *)v25[3];
    }
    id v5 = v4;
    _Block_object_dispose(&v24, 8);
    uint64_t v6 = (void *)[[v5 alloc] initWithAccount:v3 inStore:v2];
    [*(id *)(a1 + 40) _setTermsManager:v6];

    id v7 = *(void **)(a1 + 40);
    uint64_t v8 = [v7 _termsManager];
    [v8 setDelegate:v7];

    long long v9 = [*(id *)(a1 + 40) _termsManager];
    [v9 presentFromViewController:*(void *)(a1 + 40) modal:1];
  }
  else
  {
    long long v10 = (void *)MEMORY[0x1E4FB1418];
    long long v11 = *(void **)(a1 + 32);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __56__PXCloudPhotoWelcomeViewController__handleEnableError___block_invoke_2;
    v20[3] = &unk_1E5DD32A8;
    id v12 = v11;
    uint64_t v13 = *(void *)(a1 + 40);
    id v21 = v12;
    uint64_t v22 = v13;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __56__PXCloudPhotoWelcomeViewController__handleEnableError___block_invoke_3;
    v17[3] = &unk_1E5DD32A8;
    id v14 = *(id *)(a1 + 32);
    uint64_t v15 = *(void *)(a1 + 40);
    id v18 = v14;
    uint64_t v19 = v15;
    v16 = objc_msgSend(v10, "px_alertForCPLEnableError:actionHandler:cancelHandler:", v12, v20, v17);
    [*(id *)(a1 + 40) presentViewController:v16 animated:1 completion:0];

    v2 = v21;
  }
}

void __56__PXCloudPhotoWelcomeViewController__handleEnableError___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) code];
  BOOL v3 = *(void **)(a1 + 40);
  if (v2 == 7)
  {
    [v3 _setButtonsEnabled:0];
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2050000000;
    id v4 = (void *)getICQUICloudStorageOffersManagerClass_softClass;
    uint64_t v15 = getICQUICloudStorageOffersManagerClass_softClass;
    if (!getICQUICloudStorageOffersManagerClass_softClass)
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __getICQUICloudStorageOffersManagerClass_block_invoke;
      v11[3] = &unk_1E5DD2B08;
      v11[4] = &v12;
      __getICQUICloudStorageOffersManagerClass_block_invoke((uint64_t)v11);
      id v4 = (void *)v13[3];
    }
    id v5 = v4;
    _Block_object_dispose(&v12, 8);
    id v6 = objc_alloc_init(v5);
    [*(id *)(a1 + 40) _setOffersManager:v6];

    id v7 = *(void **)(a1 + 40);
    uint64_t v8 = [v7 _offersManager];
    [v8 setDelegate:v7];

    long long v9 = [*(id *)(a1 + 40) _offersManager];
    long long v10 = [*(id *)(a1 + 40) navigationController];
    [v9 beginFlowWithNavigationController:v10 modally:1];
  }
  else
  {
    [v3 _setButtonsEnabled:1];
  }
}

uint64_t __56__PXCloudPhotoWelcomeViewController__handleEnableError___block_invoke_3(uint64_t a1)
{
  if ([*(id *)(a1 + 32) code] == 6 || objc_msgSend(*(id *)(a1 + 32), "code") == 8)
  {
    uint64_t v2 = *(void **)(a1 + 40);
    return [v2 dismissViewControllerAnimated:1 completion:0];
  }
  else
  {
    if ([*(id *)(a1 + 32) code] == 7) {
      PLRecordLibrarySizeWithReason();
    }
    id v4 = *(void **)(a1 + 40);
    return [v4 _setButtonsEnabled:1];
  }
}

- (void)_enableCloudPhotoLibraryWithoutCheck
{
  [(PXCloudPhotoWelcomeViewController *)self _setButtonsEnabled:0];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __73__PXCloudPhotoWelcomeViewController__enableCloudPhotoLibraryWithoutCheck__block_invoke;
  v3[3] = &unk_1E5DD3158;
  v3[4] = self;
  [MEMORY[0x1E4F8A718] enableCPL:v3];
}

void __73__PXCloudPhotoWelcomeViewController__enableCloudPhotoLibraryWithoutCheck__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__PXCloudPhotoWelcomeViewController__enableCloudPhotoLibraryWithoutCheck__block_invoke_2;
  block[3] = &unk_1E5DD21E8;
  char v9 = a2;
  block[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __73__PXCloudPhotoWelcomeViewController__enableCloudPhotoLibraryWithoutCheck__block_invoke_2(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  BOOL v3 = *(void **)(a1 + 32);
  if (v2) {
    return [v3 dismissViewControllerAnimated:1 completion:0];
  }
  else {
    return [v3 _handleEnableError:*(void *)(a1 + 40)];
  }
}

- (void)_enableCloudPhotoLibrary
{
  [(PXCloudPhotoWelcomeViewController *)self _setButtonsEnabled:0];
  int v2 = objc_msgSend(MEMORY[0x1E4F8A668], "pl_sharedAccountStore");
  BOOL v3 = [v2 cachedPrimaryAppleAccount];

  PLCanEnableCloudPhotoLibraryForAccount();
}

void __61__PXCloudPhotoWelcomeViewController__enableCloudPhotoLibrary__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  PLRecordiCPLEnableState();
  if (a2)
  {
    [*(id *)(a1 + 32) _enableCloudPhotoLibraryWithoutCheck];
  }
  else
  {
    [*(id *)(a1 + 32) _setRequireStorageUpgrade:PLCPLShouldRequireStorageUpgradeForError()];
    [*(id *)(a1 + 32) _handleEnableError:v5];
  }
}

- (void)_cloudPhotoWelcomeViewLearnMoreTapped:(id)a3
{
  id v4 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://www.apple.com/ios/photos/"];
  BOOL v3 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v3 openURL:v4 options:MEMORY[0x1E4F1CC08] completionHandler:0];
}

- (void)_cloudPhotoWelcomeViewNotNowButtonTapped:(id)a3
{
  PLRecordLibrarySizeWithReason();
  [(PXCloudPhotoWelcomeViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)_cloudPhotoWelcomeViewGoButtonTapped:(id)a3
{
  PLRecordLibrarySizeWithReason();
  [(PXCloudPhotoWelcomeViewController *)self _setButtonsEnabled:0];
  id v4 = [MEMORY[0x1E4F8AA78] systemPhotoLibrary];
  id v5 = [v4 iTunesSyncedContentInfo];

  id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8AD98]];
  uint64_t v7 = [v6 integerValue];

  if (v7)
  {
    id v8 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8ADA8]];
    uint64_t v9 = [v8 BOOLValue];

    long long v10 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8ADA0]];
    uint64_t v11 = [v10 BOOLValue];

    v13[4] = self;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __74__PXCloudPhotoWelcomeViewController__cloudPhotoWelcomeViewGoButtonTapped___block_invoke;
    v14[3] = &unk_1E5DD36F8;
    void v14[4] = self;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __74__PXCloudPhotoWelcomeViewController__cloudPhotoWelcomeViewGoButtonTapped___block_invoke_4;
    v13[3] = &unk_1E5DD36F8;
    uint64_t v12 = objc_msgSend(MEMORY[0x1E4FB1418], "px_deleteITunesContentAlertWithAssetCount:includesPhotos:includesVideos:actionHandler:cancelHandler:", v7, v11, v9, v14, v13);
    [(PXCloudPhotoWelcomeViewController *)self presentViewController:v12 animated:1 completion:0];
  }
  else
  {
    [(PXCloudPhotoWelcomeViewController *)self _enableCloudPhotoLibrary];
  }
}

void __74__PXCloudPhotoWelcomeViewController__cloudPhotoWelcomeViewGoButtonTapped___block_invoke(uint64_t a1)
{
  int v2 = [MEMORY[0x1E4F8AA78] systemPhotoLibrary];
  BOOL v3 = [v2 assetsdClient];

  id v4 = [v3 libraryInternalClient];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __74__PXCloudPhotoWelcomeViewController__cloudPhotoWelcomeViewGoButtonTapped___block_invoke_2;
  v5[3] = &unk_1E5DD3158;
  v5[4] = *(void *)(a1 + 32);
  [v4 deleteiTunesSyncedContentWithCompletionHandler:v5];
}

uint64_t __74__PXCloudPhotoWelcomeViewController__cloudPhotoWelcomeViewGoButtonTapped___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setButtonsEnabled:1];
}

void __74__PXCloudPhotoWelcomeViewController__cloudPhotoWelcomeViewGoButtonTapped___block_invoke_2(uint64_t a1, char a2)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __74__PXCloudPhotoWelcomeViewController__cloudPhotoWelcomeViewGoButtonTapped___block_invoke_3;
  v2[3] = &unk_1E5DCFE98;
  char v3 = a2;
  v2[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], v2);
}

uint64_t __74__PXCloudPhotoWelcomeViewController__cloudPhotoWelcomeViewGoButtonTapped___block_invoke_3(uint64_t result)
{
  if (*(unsigned char *)(result + 40)) {
    return [*(id *)(result + 32) _enableCloudPhotoLibrary];
  }
  return result;
}

- (void)_continueWithoutStoragePurchase:(id)a3
{
  [(PXCloudPhotoWelcomeViewController *)self _setEnableOnAppear:1];
  id v4 = [(PXCloudPhotoWelcomeViewController *)self _offersManager];
  [v4 cancelLoad];
}

- (void)_updateCurrentActivity
{
  if ([(PXCloudPhotoWelcomeViewController *)self _enableOnAppear])
  {
    [(PXCloudPhotoWelcomeViewController *)self _enableCloudPhotoLibraryWithoutCheck];
    [(PXCloudPhotoWelcomeViewController *)self _setEnableOnAppear:0];
  }
  else
  {
    [(PXCloudPhotoWelcomeViewController *)self _setButtonsEnabled:1];
  }
}

- (void)_applicationWillEnterForeground:(id)a3
{
  id v4 = a3;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2050000000;
  id v5 = (void *)getMCProfileConnectionClass_softClass_122619;
  uint64_t v22 = getMCProfileConnectionClass_softClass_122619;
  if (!getMCProfileConnectionClass_softClass_122619)
  {
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    v16 = __getMCProfileConnectionClass_block_invoke_122620;
    v17 = &unk_1E5DD2B08;
    id v18 = &v19;
    __getMCProfileConnectionClass_block_invoke_122620((uint64_t)&v14);
    id v5 = (void *)v20[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v19, 8);
  uint64_t v7 = [v6 sharedConnection];
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  id v8 = (void *)getMCFeatureCloudPhotoLibraryAllowedSymbolLoc_ptr_122621;
  uint64_t v22 = getMCFeatureCloudPhotoLibraryAllowedSymbolLoc_ptr_122621;
  if (!getMCFeatureCloudPhotoLibraryAllowedSymbolLoc_ptr_122621)
  {
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    v16 = __getMCFeatureCloudPhotoLibraryAllowedSymbolLoc_block_invoke_122622;
    v17 = &unk_1E5DD2B08;
    id v18 = &v19;
    uint64_t v9 = ManagedConfigurationLibrary_122623();
    long long v10 = dlsym(v9, "MCFeatureCloudPhotoLibraryAllowed");
    *(void *)(v18[1] + 24) = v10;
    getMCFeatureCloudPhotoLibraryAllowedSymbolLoc_ptr_122621 = *(void *)(v18[1] + 24);
    id v8 = (void *)v20[3];
  }
  _Block_object_dispose(&v19, 8);
  if (v8)
  {
    int v11 = [v7 BOOLRestrictionForFeature:*v8];

    if (v11 == 2) {
      [(PXCloudPhotoWelcomeViewController *)self dismissViewControllerAnimated:1 completion:0];
    }
  }
  else
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v13 = [NSString stringWithUTF8String:"NSString *getMCFeatureCloudPhotoLibraryAllowed(void)"];
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, @"PXCloudPhotoWelcomeViewController.m", 53, @"%s", dlerror());

    __break(1u);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXCloudPhotoWelcomeViewController;
  [(PXCloudPhotoWelcomeViewController *)&v4 viewWillAppear:a3];
  [(PXCloudPhotoWelcomeViewController *)self _updateCurrentActivity];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)PXCloudPhotoWelcomeViewController;
  [(OBBaseWelcomeController *)&v4 viewDidLoad];
  char v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__applicationWillEnterForeground_ name:*MEMORY[0x1E4FB2730] object:0];
}

- (PXCloudPhotoWelcomeViewController)initWithDefaultTitle
{
  v22[3] = *MEMORY[0x1E4F143B8];
  char v3 = PXLocalizedStringFromTable(@"CLOUD_PHOTOS_WELCOME_TITLE", @"PhotosUICore");
  objc_super v4 = PXLocalizedStringFromTable(@"CLOUD_PHOTOS_WELCOME_BODY", @"PhotosUICore");
  id v5 = objc_msgSend(MEMORY[0x1E4FB1818], "px_imageNamed:", @"Photos_GettingStarted");
  v21.receiver = self;
  v21.super_class = (Class)PXCloudPhotoWelcomeViewController;
  id v6 = [(PXCloudPhotoWelcomeViewController *)&v21 initWithTitle:v3 detailText:v4 icon:v5 contentLayout:2];
  if (v6)
  {
    v20 = PXLocalizedStringFromTable(@"CLOUD_PHOTOS_WELCOME_LEARN_MORE", @"PhotosUICore");
    uint64_t v7 = [MEMORY[0x1E4F83A98] accessoryButton];
    [v7 setTitle:v20 forState:0];
    [v7 addTarget:v6 action:sel__cloudPhotoWelcomeViewLearnMoreTapped_ forControlEvents:0x2000];
    id v8 = [(PXCloudPhotoWelcomeViewController *)v6 headerView];
    [v8 addAccessoryButton:v7];

    uint64_t v9 = [(PXCloudPhotoWelcomeViewController *)v6 buttonTray];
    long long v10 = PXLocalizedStringFromTable(@"ICLOUD_PHOTOS_WELCOME_FINE_PRINT", @"PhotosUICore");
    [v9 setCaptionText:v10];

    int v11 = PXLocalizedStringFromTable(@"CLOUD_PHOTOS_WELCOME_GO_BUTTON", @"PhotosUICore");
    uint64_t v12 = [MEMORY[0x1E4F83A80] boldButton];
    [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v12 setTitle:v11 forState:0];
    [v12 addTarget:v6 action:sel__cloudPhotoWelcomeViewGoButtonTapped_ forControlEvents:0x2000];
    uint64_t v13 = [(PXCloudPhotoWelcomeViewController *)v6 buttonTray];
    [v13 addButton:v12];

    uint64_t v14 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:@"\r" modifierFlags:0 action:sel__cloudPhotoWelcomeViewGoButtonTapped_];
    [(PXCloudPhotoWelcomeViewController *)v6 addKeyCommand:v14];

    uint64_t v15 = PXLocalizedStringFromTable(@"ICLOUD_PHOTOS_WELCOME_NOT_NOW", @"PhotosUICore");
    v16 = [MEMORY[0x1E4F83AB8] linkButton];
    [v16 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v16 setTitle:v15 forState:0];
    [v16 addTarget:v6 action:sel__cloudPhotoWelcomeViewNotNowButtonTapped_ forControlEvents:0x2000];
    v17 = [(PXCloudPhotoWelcomeViewController *)v6 buttonTray];
    [v17 addButton:v16];

    [(PXCloudPhotoWelcomeViewController *)v6 setModalInPresentation:1];
    v22[0] = v7;
    v22[1] = v12;
    v22[2] = v16;
    id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:3];
    [(PXCloudPhotoWelcomeViewController *)v6 _setButtons:v18];
  }
  return v6;
}

- (PXCloudPhotoWelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCloudPhotoWelcomeViewController.m", 83, @"%s is not available as initializer", "-[PXCloudPhotoWelcomeViewController initWithTitle:detailText:icon:contentLayout:]");

  abort();
}

- (PXCloudPhotoWelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCloudPhotoWelcomeViewController.m", 79, @"%s is not available as initializer", "-[PXCloudPhotoWelcomeViewController initWithTitle:detailText:icon:]");

  abort();
}

@end