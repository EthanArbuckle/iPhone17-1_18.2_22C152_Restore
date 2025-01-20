@interface PXSharedLibraryLegacyDevicesRemoteController
+ (id)legacyDevicesRemoteControllerIfEnabledWithSharedLibraryOrPreviewPresent:(BOOL)a3;
- (PXSharedLibraryLegacyDevicesRemoteController)init;
- (id)_init;
- (id)accountsForAccountManager:(id)a3;
- (int64_t)state;
- (void)_updateStateOnMainQueue:(int64_t)a3;
- (void)beginRemoteUIRequestWithPresenter:(id)a3;
- (void)remoteUIDidEndFlow:(id)a3;
- (void)remoteUIRequestComplete:(id)a3 error:(id)a4;
- (void)remoteUIWillLoadRequest:(id)a3;
- (void)remoteUIWillPresentObjectModel:(id)a3 modally:(BOOL)a4;
- (void)setState:(int64_t)a3;
@end

@implementation PXSharedLibraryLegacyDevicesRemoteController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteUIPresenter, 0);
  objc_storeStrong((id *)&self->_currentAccount, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
}

- (int64_t)state
{
  return self->_state;
}

- (void)remoteUIWillPresentObjectModel:(id)a3 modally:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = PLSharedLibraryGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [v6 identifier];
    int v9 = 138543618;
    v10 = v8;
    __int16 v11 = 1024;
    BOOL v12 = v4;
    _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEFAULT, "PXSharedLibraryLegacyDevicesRemoteController: Presenting: %{public}@; modal: %d",
      (uint8_t *)&v9,
      0x12u);
  }
  if (!v4) {
    [(PXSharedLibraryLegacyDevicesRemoteController *)self _updateStateOnMainQueue:2];
  }
}

- (void)remoteUIDidEndFlow:(id)a3
{
  BOOL v4 = PLSharedLibraryGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEFAULT, "PXSharedLibraryLegacyDevicesRemoteController: moving to completed state due to end of flow", v5, 2u);
  }

  [(PXSharedLibraryLegacyDevicesRemoteController *)self _updateStateOnMainQueue:3];
}

- (void)remoteUIWillLoadRequest:(id)a3
{
  id v4 = a3;
  [(PXSharedLibraryLegacyDevicesRemoteController *)self _updateStateOnMainQueue:1];
  v5 = [v4 URL];

  id v6 = [v5 path];
  int v7 = [v6 hasSuffix:@"/goldilocks/skip"];

  if (v7)
  {
    v8 = PLSharedLibraryGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v9 = 0;
      _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEFAULT, "PXSharedLibraryLegacyDevicesRemoteController: moving to completed state due to user request", v9, 2u);
    }

    [(PXSharedLibraryLegacyDevicesRemoteController *)self _updateStateOnMainQueue:3];
  }
}

- (void)remoteUIRequestComplete:(id)a3 error:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = PLSharedLibraryGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412546;
    uint64_t v14 = (uint64_t)v6;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEFAULT, "PXSharedLibraryLegacyDevicesRemoteController: Request complete: %@\nerror: %@", (uint8_t *)&v13, 0x16u);
  }

  int v9 = [v7 userInfo];
  v10 = [v9 objectForKeyedSubscript:@"statusCode"];
  uint64_t v11 = [v10 integerValue];

  if (v11 >= 400)
  {
    BOOL v12 = PLSharedLibraryGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = 134217984;
      uint64_t v14 = v11;
      _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_ERROR, "PXSharedLibraryLegacyDevicesRemoteController: Request error code %ld", (uint8_t *)&v13, 0xCu);
    }

    if ([(PXSharedLibraryLegacyDevicesRemoteController *)self state] != 3) {
      [(PXSharedLibraryLegacyDevicesRemoteController *)self _updateStateOnMainQueue:4];
    }
  }
}

- (id)accountsForAccountManager:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v14 = 0;
  __int16 v15 = &v14;
  uint64_t v16 = 0x2020000000;
  v5 = (id *)getAIDAServiceTypeCloudSymbolLoc_ptr;
  uint64_t v17 = getAIDAServiceTypeCloudSymbolLoc_ptr;
  if (!getAIDAServiceTypeCloudSymbolLoc_ptr)
  {
    id v6 = AppleIDSSOAuthenticationLibrary();
    v15[3] = (uint64_t)dlsym(v6, "AIDAServiceTypeCloud");
    getAIDAServiceTypeCloudSymbolLoc_ptr = v15[3];
    v5 = (id *)v15[3];
  }
  _Block_object_dispose(&v14, 8);
  if (!v5)
  {
    BOOL v12 = [MEMORY[0x1E4F28B00] currentHandler];
    int v13 = [NSString stringWithUTF8String:"NSString *getAIDAServiceTypeCloud(void)"];
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, @"PXSharedLibraryLegacyDevicesRemoteController+iOS.m", 27, @"%s", dlerror());

    __break(1u);
  }
  currentAccount = self->_currentAccount;
  id v18 = *v5;
  v19[0] = currentAccount;
  v8 = (void *)MEMORY[0x1E4F1C9E8];
  id v9 = v18;
  v10 = [v8 dictionaryWithObjects:v19 forKeys:&v18 count:1];

  return v10;
}

- (void)_updateStateOnMainQueue:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __72__PXSharedLibraryLegacyDevicesRemoteController__updateStateOnMainQueue___block_invoke;
  v3[3] = &unk_1E5DD08D8;
  v3[4] = self;
  v3[5] = a3;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

uint64_t __72__PXSharedLibraryLegacyDevicesRemoteController__updateStateOnMainQueue___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __72__PXSharedLibraryLegacyDevicesRemoteController__updateStateOnMainQueue___block_invoke_2;
  v3[3] = &unk_1E5DD09C8;
  uint64_t v1 = *(void *)(a1 + 40);
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = v1;
  return [v4 performChanges:v3];
}

uint64_t __72__PXSharedLibraryLegacyDevicesRemoteController__updateStateOnMainQueue___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setState:*(void *)(a1 + 40)];
}

- (void)setState:(int64_t)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    [(PXSharedLibraryLegacyDevicesRemoteController *)self signalChange:1];
  }
}

- (void)beginRemoteUIRequestWithPresenter:(id)a3
{
  id v4 = a3;
  [(PXSharedLibraryLegacyDevicesRemoteController *)self _updateStateOnMainQueue:1];
  objc_initWeak(&location, self);
  uint64_t v5 = +[PXSharedLibrarySettings sharedInstance];
  char v6 = [v5 simulateLegacyDevicesRemoteFailure];

  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  int v13 = __82__PXSharedLibraryLegacyDevicesRemoteController_beginRemoteUIRequestWithPresenter___block_invoke;
  uint64_t v14 = &unk_1E5DB23E0;
  char v18 = v6;
  objc_copyWeak(&v17, &location);
  __int16 v15 = self;
  id v7 = v4;
  id v16 = v7;
  v8 = &v11;
  id v9 = objc_msgSend(MEMORY[0x1E4F4F0C8], "bagForAltDSID:", 0, v11, v12, v13, v14, v15);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = ___RequestURLForGoldilocksLegacyDevices_block_invoke;
  v20[3] = &unk_1E5DCDAC0;
  v21 = v8;
  v10 = v8;
  [v9 urlForKey:@"goldilocksIncompatibleDevices" completion:v20];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __82__PXSharedLibraryLegacyDevicesRemoteController_beginRemoteUIRequestWithPresenter___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5 && !*(unsigned char *)(a1 + 56))
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __82__PXSharedLibraryLegacyDevicesRemoteController_beginRemoteUIRequestWithPresenter___block_invoke_37;
    v11[3] = &unk_1E5DCEA88;
    objc_copyWeak(&v14, (id *)(a1 + 48));
    v10 = *(void **)(a1 + 40);
    v11[4] = *(void *)(a1 + 32);
    id v12 = v10;
    id v13 = v5;
    dispatch_async(MEMORY[0x1E4F14428], v11);

    objc_destroyWeak(&v14);
  }
  else
  {
    id v7 = PLSharedLibraryGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = *(unsigned __int8 *)(a1 + 56);
      *(_DWORD *)buf = 67109634;
      BOOL v16 = v5 != 0;
      __int16 v17 = 1024;
      int v18 = v8;
      __int16 v19 = 2112;
      id v20 = v6;
      _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEFAULT, "PXSharedLibraryLegacyDevicesRemoteController: remote immediately unavailable with URL present: %d; simulate fail"
        "ure %d; error = %@",
        buf,
        0x18u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained _updateStateOnMainQueue:4];
  }
}

void __82__PXSharedLibraryLegacyDevicesRemoteController_beginRemoteUIRequestWithPresenter___block_invoke_37(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2050000000;
  v3 = (void *)getAAUIGrandSlamRemoteUIPresenterClass_softClass;
  uint64_t v13 = getAAUIGrandSlamRemoteUIPresenterClass_softClass;
  if (!getAAUIGrandSlamRemoteUIPresenterClass_softClass)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __getAAUIGrandSlamRemoteUIPresenterClass_block_invoke;
    v9[3] = &unk_1E5DD2B08;
    v9[4] = &v10;
    __getAAUIGrandSlamRemoteUIPresenterClass_block_invoke((uint64_t)v9);
    v3 = (void *)v11[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v10, 8);
  uint64_t v5 = [[v4 alloc] initWithAccountManager:*(void *)(*(void *)(a1 + 32) + 96) presenter:*(void *)(a1 + 40)];
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 112);
  *(void *)(v6 + 112) = v5;

  [*(id *)(*(void *)(a1 + 32) + 112) setDelegate:WeakRetained];
  id v8 = objc_alloc_init(MEMORY[0x1E4F28E88]);
  [v8 setURL:*(void *)(a1 + 48)];
  [v8 setHTTPMethod:@"GET"];
  [*(id *)(*(void *)(a1 + 32) + 112) loadRequest:v8 completion:0];
}

- (id)_init
{
  v11.receiver = self;
  v11.super_class = (Class)PXSharedLibraryLegacyDevicesRemoteController;
  v2 = [(PXSharedLibraryLegacyDevicesRemoteController *)&v11 init];
  if (v2)
  {
    v3 = objc_msgSend(MEMORY[0x1E4F8A668], "pl_sharedAccountStore");
    uint64_t v13 = 0;
    id v14 = &v13;
    uint64_t v15 = 0x2050000000;
    id v4 = (void *)getAIDAAccountManagerClass_softClass;
    uint64_t v16 = getAIDAAccountManagerClass_softClass;
    if (!getAIDAAccountManagerClass_softClass)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __getAIDAAccountManagerClass_block_invoke;
      v12[3] = &unk_1E5DD2B08;
      v12[4] = &v13;
      __getAIDAAccountManagerClass_block_invoke((uint64_t)v12);
      id v4 = (void *)v14[3];
    }
    uint64_t v5 = v4;
    _Block_object_dispose(&v13, 8);
    uint64_t v6 = [[v5 alloc] initWithAccountStore:v3];
    accountManager = v2->_accountManager;
    v2->_accountManager = (AIDAAccountManager *)v6;

    [(AIDAAccountManager *)v2->_accountManager setDelegate:v2];
    uint64_t v8 = [v3 cachedPrimaryAppleAccount];
    currentAccount = v2->_currentAccount;
    v2->_currentAccount = (ACAccount *)v8;
  }
  return v2;
}

- (PXSharedLibraryLegacyDevicesRemoteController)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSharedLibraryLegacyDevicesRemoteController+iOS.m", 53, @"%s is not available as initializer", "-[PXSharedLibraryLegacyDevicesRemoteController init]");

  abort();
}

+ (id)legacyDevicesRemoteControllerIfEnabledWithSharedLibraryOrPreviewPresent:(BOOL)a3
{
  int v4 = _os_feature_enabled_impl();
  id v5 = 0;
  if (v4 && !a3) {
    id v5 = [[PXSharedLibraryLegacyDevicesRemoteController alloc] _init];
  }
  return v5;
}

@end