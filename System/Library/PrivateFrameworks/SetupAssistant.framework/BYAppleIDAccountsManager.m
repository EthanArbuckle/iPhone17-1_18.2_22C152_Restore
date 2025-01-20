@interface BYAppleIDAccountsManager
+ (id)sharedManager;
- (AASetupAssistantService)aaService;
- (BYAppleIDAccountsManager)init;
- (id)initForDelegateBundleIDs:(id)a3;
- (id)storedLoginContext;
- (void)attemptPostRestoreRenewForAccount:(id)a3 loginContext:(id)a4 allowFollowUp:(BOOL)a5 completion:(id)a6;
- (void)clearStoredLoginContext;
- (void)enableDataClassesForAccount:(id)a3 completion:(id)a4;
- (void)loginDelegateAccountsWithUsername:(id)a3 password:(id)a4 rawPassword:(id)a5 skipiTunes:(BOOL)a6 onlyAppleIDPlugin:(BOOL)a7 completion:(id)a8;
- (void)performSilentICDPUpgrade;
- (void)preloadDefaultLoginParametersWithBundleIDs:(id)a3;
- (void)repeatedlyAttemptPostRestoreRenewForAccount:(id)a3 loginContext:(id)a4 numberOfAttemptsAllowed:(unint64_t)a5 completion:(id)a6;
- (void)runPostRestoreRenewCredentialsIfNeeded;
- (void)setAAService:(id)a3;
@end

@implementation BYAppleIDAccountsManager

+ (id)sharedManager
{
  if (sharedManager_onceToken_1 != -1) {
    dispatch_once(&sharedManager_onceToken_1, &__block_literal_global_15);
  }
  v2 = (void *)sharedManager_instance_1;
  return v2;
}

uint64_t __41__BYAppleIDAccountsManager_sharedManager__block_invoke()
{
  sharedManager_instance_1 = objc_alloc_init(BYAppleIDAccountsManager);
  return MEMORY[0x1F41817F8]();
}

- (id)initForDelegateBundleIDs:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BYAppleIDAccountsManager;
  v5 = [(BYAppleIDAccountsManager *)&v11 init];
  if (v5)
  {
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x2050000000;
    v6 = (void *)getAALoginPluginManagerClass_softClass;
    uint64_t v16 = getAALoginPluginManagerClass_softClass;
    if (!getAALoginPluginManagerClass_softClass)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __getAALoginPluginManagerClass_block_invoke;
      v12[3] = &unk_1E5D2B9E8;
      v12[4] = &v13;
      __getAALoginPluginManagerClass_block_invoke((uint64_t)v12);
      v6 = (void *)v14[3];
    }
    id v7 = v6;
    _Block_object_dispose(&v13, 8);
    uint64_t v8 = [v7 sharedInstance];
    appleIDLoginPluginManager = v5->_appleIDLoginPluginManager;
    v5->_appleIDLoginPluginManager = (AALoginPluginManager *)v8;

    [(AALoginPluginManager *)v5->_appleIDLoginPluginManager restrictToPluginBundleIDs:v4];
    [(AALoginPluginManager *)v5->_appleIDLoginPluginManager setShouldStashLoginResponse:1];
  }

  return v5;
}

- (BYAppleIDAccountsManager)init
{
  return (BYAppleIDAccountsManager *)[(BYAppleIDAccountsManager *)self initForDelegateBundleIDs:0];
}

- (AASetupAssistantService)aaService
{
  aaService = self->_aaService;
  if (!aaService)
  {
    uint64_t v10 = 0;
    objc_super v11 = &v10;
    uint64_t v12 = 0x2050000000;
    id v4 = (void *)getAASetupAssistantServiceClass_softClass;
    uint64_t v13 = getAASetupAssistantServiceClass_softClass;
    if (!getAASetupAssistantServiceClass_softClass)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __getAASetupAssistantServiceClass_block_invoke;
      v9[3] = &unk_1E5D2B9E8;
      v9[4] = &v10;
      __getAASetupAssistantServiceClass_block_invoke((uint64_t)v9);
      id v4 = (void *)v11[3];
    }
    v5 = v4;
    _Block_object_dispose(&v10, 8);
    v6 = (AASetupAssistantService *)objc_alloc_init(v5);
    id v7 = self->_aaService;
    self->_aaService = v6;

    aaService = self->_aaService;
  }
  return aaService;
}

- (void)preloadDefaultLoginParametersWithBundleIDs:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__BYAppleIDAccountsManager_preloadDefaultLoginParametersWithBundleIDs___block_invoke;
  v7[3] = &unk_1E5D2C5A0;
  v7[4] = self;
  id v8 = v4;
  uint64_t v5 = preloadDefaultLoginParametersWithBundleIDs__onceToken;
  id v6 = v4;
  if (v5 != -1) {
    dispatch_once(&preloadDefaultLoginParametersWithBundleIDs__onceToken, v7);
  }
}

void __71__BYAppleIDAccountsManager_preloadDefaultLoginParametersWithBundleIDs___block_invoke(uint64_t a1)
{
  v2 = dispatch_get_global_queue(25, 0);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __71__BYAppleIDAccountsManager_preloadDefaultLoginParametersWithBundleIDs___block_invoke_2;
  v4[3] = &unk_1E5D2C5A0;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_async(v2, v4);
}

id __71__BYAppleIDAccountsManager_preloadDefaultLoginParametersWithBundleIDs___block_invoke_2(uint64_t a1)
{
  v2 = _BYLoggingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1A7DED000, v2, OS_LOG_TYPE_DEFAULT, "Preload default login parameters", v4, 2u);
  }

  [*(id *)(*(void *)(a1 + 32) + 8) restrictToPluginBundleIDs:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 8) setShouldSkipiTunesPlugin:0];
  return (id)[*(id *)(*(void *)(a1 + 32) + 8) collectParametersForLoginRequest];
}

- (void)loginDelegateAccountsWithUsername:(id)a3 password:(id)a4 rawPassword:(id)a5 skipiTunes:(BOOL)a6 onlyAppleIDPlugin:(BOOL)a7 completion:(id)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  id v14 = a5;
  id v15 = a8;
  id v16 = a4;
  id v17 = a3;
  v18 = _BYLoggingFacility();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A7DED000, v18, OS_LOG_TYPE_DEFAULT, "Login Delegate Accounts", buf, 2u);
  }

  [(AALoginPluginManager *)self->_appleIDLoginPluginManager setShouldSkipiTunesPlugin:v10];
  if (v9) {
    [(AALoginPluginManager *)self->_appleIDLoginPluginManager restrictToPluginBundleIDs:&unk_1EFE4E508];
  }
  kdebug_trace();
  v19 = [(AALoginPluginManager *)self->_appleIDLoginPluginManager collectParametersForLoginRequest];
  kdebug_trace();
  v20 = [(BYAppleIDAccountsManager *)self aaService];
  [v20 setAppleID:v17];

  v21 = [(BYAppleIDAccountsManager *)self aaService];
  [v21 setPassword:v16];

  kdebug_trace();
  v22 = [(BYAppleIDAccountsManager *)self aaService];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __123__BYAppleIDAccountsManager_loginDelegateAccountsWithUsername_password_rawPassword_skipiTunes_onlyAppleIDPlugin_completion___block_invoke;
  v25[3] = &unk_1E5D2C708;
  v25[4] = self;
  id v26 = v14;
  id v27 = v15;
  id v23 = v15;
  id v24 = v14;
  [v22 loginDelegatesWithParameters:v19 completion:v25];
}

void __123__BYAppleIDAccountsManager_loginDelegateAccountsWithUsername_password_rawPassword_skipiTunes_onlyAppleIDPlugin_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  kdebug_trace();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __123__BYAppleIDAccountsManager_loginDelegateAccountsWithUsername_password_rawPassword_skipiTunes_onlyAppleIDPlugin_completion___block_invoke_2;
  block[3] = &unk_1E5D2C6E0;
  id v11 = v6;
  id v12 = v5;
  id v7 = *(void **)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 32);
  id v14 = v7;
  id v15 = *(id *)(a1 + 48);
  id v8 = v5;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __123__BYAppleIDAccountsManager_loginDelegateAccountsWithUsername_password_rawPassword_skipiTunes_onlyAppleIDPlugin_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = _BYLoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    char v4 = _BYIsInternalInstall();
    id v5 = *(void **)(a1 + 32);
    if ((v4 & 1) != 0 || !v5)
    {
      int v7 = 0;
    }
    else
    {
      id v6 = NSString;
      v1 = [*(id *)(a1 + 32) domain];
      id v5 = [v6 stringWithFormat:@"<Error domain: %@, code %ld>", v1, objc_msgSend(*(id *)(a1 + 32), "code")];
      int v7 = 1;
    }
    *(_DWORD *)buf = 138543362;
    v21 = v5;
    _os_log_impl(&dword_1A7DED000, v3, OS_LOG_TYPE_DEFAULT, "Login delgates finished, error = %{public}@", buf, 0xCu);
    if (v7)
    {
    }
  }

  id v8 = _BYLoggingFacility();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __123__BYAppleIDAccountsManager_loginDelegateAccountsWithUsername_password_rawPassword_skipiTunes_onlyAppleIDPlugin_completion___block_invoke_2_cold_1(a1, v8);
  }

  if (*(void *)(a1 + 40) && !*(void *)(a1 + 32))
  {
    kdebug_trace();
    uint64_t v11 = *(void *)(a1 + 40);
    BOOL v10 = *(void **)(a1 + 48);
    id v12 = (void *)v10[1];
    uint64_t v13 = [v10 aaService];
    id v14 = [v13 appleID];
    id v15 = [*(id *)(a1 + 48) aaService];
    id v16 = [v15 password];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __123__BYAppleIDAccountsManager_loginDelegateAccountsWithUsername_password_rawPassword_skipiTunes_onlyAppleIDPlugin_completion___block_invoke_30;
    v18[3] = &unk_1E5D2BEC8;
    uint64_t v17 = *(void *)(a1 + 56);
    id v19 = *(id *)(a1 + 64);
    [v12 notifyServicesOfLoginResponse:v11 forAppleID:v14 password:v16 rawPassword:v17 completion:v18];
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 64);
    if (v9) {
      (*(void (**)(uint64_t, void, void, void))(v9 + 16))(v9, 0, 0, *(void *)(a1 + 32));
    }
  }
}

void __123__BYAppleIDAccountsManager_loginDelegateAccountsWithUsername_password_rawPassword_skipiTunes_onlyAppleIDPlugin_completion___block_invoke_30(uint64_t a1, int a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  kdebug_trace();
  int v7 = _BYLoggingFacility();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (a2) {
      id v8 = @"YES";
    }
    else {
      id v8 = @"NO";
    }
    if (_BYIsInternalInstall())
    {
      int v9 = 0;
      BOOL v10 = v6;
    }
    else if (v6)
    {
      uint64_t v11 = NSString;
      v3 = [v6 domain];
      BOOL v10 = [v11 stringWithFormat:@"<Error domain: %@, code %ld>", v3, objc_msgSend(v6, "code")];
      int v9 = 1;
    }
    else
    {
      int v9 = 0;
      BOOL v10 = 0;
    }
    *(_DWORD *)buf = 138543618;
    id v19 = v8;
    __int16 v20 = 2114;
    v21 = v10;
    _os_log_impl(&dword_1A7DED000, v7, OS_LOG_TYPE_DEFAULT, "Notify delegates success: %{public}@ error: %{public}@", buf, 0x16u);
    if (v9)
    {
    }
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __123__BYAppleIDAccountsManager_loginDelegateAccountsWithUsername_password_rawPassword_skipiTunes_onlyAppleIDPlugin_completion___block_invoke_37;
  block[3] = &unk_1E5D2C6B8;
  id v12 = *(id *)(a1 + 32);
  char v17 = a2;
  id v15 = v6;
  id v16 = v12;
  id v13 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __123__BYAppleIDAccountsManager_loginDelegateAccountsWithUsername_password_rawPassword_skipiTunes_onlyAppleIDPlugin_completion___block_invoke_37(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void, void))(result + 16))(result, 1, *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
  }
  return result;
}

- (void)enableDataClassesForAccount:(id)a3 completion:(id)a4
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v61 = a3;
  id v5 = a4;
  uint64_t v75 = 0;
  v76 = &v75;
  uint64_t v77 = 0x3032000000;
  v78 = __Block_byref_object_copy__6;
  v79 = __Block_byref_object_dispose__6;
  uint64_t v81 = 0;
  v82 = &v81;
  uint64_t v83 = 0x2050000000;
  id v6 = (void *)getACAccountStoreClass_softClass_0;
  uint64_t v84 = getACAccountStoreClass_softClass_0;
  if (!getACAccountStoreClass_softClass_0)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&uint8_t buf[16] = __getACAccountStoreClass_block_invoke_0;
    v88 = &unk_1E5D2B9E8;
    v89 = &v81;
    __getACAccountStoreClass_block_invoke_0((uint64_t)buf);
    id v6 = (void *)v82[3];
  }
  v60 = v5;
  int v7 = v6;
  _Block_object_dispose(&v81, 8);
  id v80 = objc_alloc_init(v7);
  id v62 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (objc_msgSend(v61, "aa_isPrimaryEmailVerified"))
  {
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id v8 = [v61 provisionedDataclasses];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v71 objects:v86 count:16];
    if (!v9) {
      goto LABEL_46;
    }
    uint64_t v10 = *(void *)v72;
    obj = v8;
    while (1)
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v72 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v71 + 1) + 8 * v11);
        uint64_t v81 = 0;
        v82 = &v81;
        uint64_t v83 = 0x2020000000;
        id v13 = (id *)getkAccountDataclassDeviceLocatorSymbolLoc_ptr;
        uint64_t v84 = getkAccountDataclassDeviceLocatorSymbolLoc_ptr;
        if (!getkAccountDataclassDeviceLocatorSymbolLoc_ptr)
        {
          *(void *)buf = MEMORY[0x1E4F143A8];
          *(void *)&buf[8] = 3221225472;
          *(void *)&uint8_t buf[16] = __getkAccountDataclassDeviceLocatorSymbolLoc_block_invoke;
          v88 = &unk_1E5D2B9E8;
          v89 = &v81;
          id v14 = (void *)AccountsLibrary();
          id v15 = dlsym(v14, "kAccountDataclassDeviceLocator");
          *(void *)(v89[1] + 24) = v15;
          getkAccountDataclassDeviceLocatorSymbolLoc_ptr = *(void *)(v89[1] + 24);
          id v13 = (id *)v82[3];
        }
        _Block_object_dispose(&v81, 8);
        if (!v13)
        {
LABEL_66:
          dlerror();
          abort_report_np();
          goto LABEL_68;
        }
        id v16 = *v13;
        char v17 = [v12 isEqualToString:v16];

        if ((v17 & 1) == 0)
        {
          uint64_t v81 = 0;
          v82 = &v81;
          uint64_t v83 = 0x2020000000;
          v18 = (id *)getkAccountDataclassCloudPhotosSymbolLoc_ptr;
          uint64_t v84 = getkAccountDataclassCloudPhotosSymbolLoc_ptr;
          if (!getkAccountDataclassCloudPhotosSymbolLoc_ptr)
          {
            *(void *)buf = MEMORY[0x1E4F143A8];
            *(void *)&buf[8] = 3221225472;
            *(void *)&uint8_t buf[16] = __getkAccountDataclassCloudPhotosSymbolLoc_block_invoke;
            v88 = &unk_1E5D2B9E8;
            v89 = &v81;
            id v19 = (void *)AccountsLibrary();
            __int16 v20 = dlsym(v19, "kAccountDataclassCloudPhotos");
            *(void *)(v89[1] + 24) = v20;
            getkAccountDataclassCloudPhotosSymbolLoc_ptr = *(void *)(v89[1] + 24);
            v18 = (id *)v82[3];
          }
          _Block_object_dispose(&v81, 8);
          if (!v18) {
            goto LABEL_66;
          }
          id v21 = *v18;
          if ([v12 isEqualToString:v21]) {
            goto LABEL_22;
          }
          uint64_t v81 = 0;
          v82 = &v81;
          uint64_t v83 = 0x2020000000;
          uint64_t v22 = (id *)getkAccountDataclassMediaStreamSymbolLoc_ptr;
          uint64_t v84 = getkAccountDataclassMediaStreamSymbolLoc_ptr;
          if (!getkAccountDataclassMediaStreamSymbolLoc_ptr)
          {
            *(void *)buf = MEMORY[0x1E4F143A8];
            *(void *)&buf[8] = 3221225472;
            *(void *)&uint8_t buf[16] = __getkAccountDataclassMediaStreamSymbolLoc_block_invoke;
            v88 = &unk_1E5D2B9E8;
            v89 = &v81;
            id v23 = (void *)AccountsLibrary();
            id v24 = dlsym(v23, "kAccountDataclassMediaStream");
            *(void *)(v89[1] + 24) = v24;
            getkAccountDataclassMediaStreamSymbolLoc_ptr = *(void *)(v89[1] + 24);
            uint64_t v22 = (id *)v82[3];
          }
          _Block_object_dispose(&v81, 8);
          if (!v22) {
            goto LABEL_66;
          }
          id v25 = *v22;
          if ([v12 isEqualToString:v25])
          {

LABEL_22:
            goto LABEL_23;
          }
          uint64_t v81 = 0;
          v82 = &v81;
          uint64_t v83 = 0x2020000000;
          id v26 = (id *)getkAccountDataclassSharedStreamsSymbolLoc_ptr;
          uint64_t v84 = getkAccountDataclassSharedStreamsSymbolLoc_ptr;
          if (!getkAccountDataclassSharedStreamsSymbolLoc_ptr)
          {
            *(void *)buf = MEMORY[0x1E4F143A8];
            *(void *)&buf[8] = 3221225472;
            *(void *)&uint8_t buf[16] = __getkAccountDataclassSharedStreamsSymbolLoc_block_invoke;
            v88 = &unk_1E5D2B9E8;
            v89 = &v81;
            id v27 = (void *)AccountsLibrary();
            v28 = dlsym(v27, "kAccountDataclassSharedStreams");
            *(void *)(v89[1] + 24) = v28;
            getkAccountDataclassSharedStreamsSymbolLoc_ptr = *(void *)(v89[1] + 24);
            id v26 = (id *)v82[3];
          }
          _Block_object_dispose(&v81, 8);
          if (!v26) {
            goto LABEL_66;
          }
          id v29 = *v26;
          char v30 = [v12 isEqualToString:v29];

          if ((v30 & 1) == 0)
          {
            uint64_t v81 = 0;
            v82 = &v81;
            uint64_t v83 = 0x2020000000;
            v31 = (id *)getkAccountDataclassMailSymbolLoc_ptr;
            uint64_t v84 = getkAccountDataclassMailSymbolLoc_ptr;
            if (!getkAccountDataclassMailSymbolLoc_ptr)
            {
              *(void *)buf = MEMORY[0x1E4F143A8];
              *(void *)&buf[8] = 3221225472;
              *(void *)&uint8_t buf[16] = __getkAccountDataclassMailSymbolLoc_block_invoke;
              v88 = &unk_1E5D2B9E8;
              v89 = &v81;
              v32 = (void *)AccountsLibrary();
              v33 = dlsym(v32, "kAccountDataclassMail");
              *(void *)(v89[1] + 24) = v33;
              getkAccountDataclassMailSymbolLoc_ptr = *(void *)(v89[1] + 24);
              v31 = (id *)v82[3];
            }
            _Block_object_dispose(&v81, 8);
            if (!v31) {
              goto LABEL_66;
            }
            id v34 = *v31;
            int v35 = [v12 isEqualToString:v34];

            if (v35)
            {
              char v36 = objc_msgSend(v61, "aa_needsEmailConfiguration");
              goto LABEL_34;
            }
            uint64_t v81 = 0;
            v82 = &v81;
            uint64_t v83 = 0x2020000000;
            v37 = (id *)getkAccountDataclassNotesSymbolLoc_ptr;
            uint64_t v84 = getkAccountDataclassNotesSymbolLoc_ptr;
            if (!getkAccountDataclassNotesSymbolLoc_ptr)
            {
              *(void *)buf = MEMORY[0x1E4F143A8];
              *(void *)&buf[8] = 3221225472;
              *(void *)&uint8_t buf[16] = __getkAccountDataclassNotesSymbolLoc_block_invoke;
              v88 = &unk_1E5D2B9E8;
              v89 = &v81;
              v38 = (void *)AccountsLibrary();
              v39 = dlsym(v38, "kAccountDataclassNotes");
              *(void *)(v89[1] + 24) = v39;
              getkAccountDataclassNotesSymbolLoc_ptr = *(void *)(v89[1] + 24);
              v37 = (id *)v82[3];
            }
            _Block_object_dispose(&v81, 8);
            if (!v37) {
              goto LABEL_66;
            }
            id v40 = *v37;
            int v41 = [v12 isEqualToString:v40];

            if (!v41) {
              goto LABEL_43;
            }
            if ((objc_msgSend(v61, "aa_isPrimaryAccount") & 1) != 0
              || (objc_msgSend(v61, "aa_needsEmailConfiguration") & 1) == 0)
            {
              if (objc_msgSend(v61, "aa_isPrimaryAccount"))
              {
LABEL_43:
                [v61 setEnabled:1 forDataclass:v12];
                goto LABEL_23;
              }
              char v36 = objc_msgSend(v61, "aa_isManagedAppleID");
LABEL_34:
              if (v36) {
                goto LABEL_23;
              }
              goto LABEL_43;
            }
          }
        }
LABEL_23:
        ++v11;
      }
      while (v9 != v11);
      id v8 = obj;
      uint64_t v42 = [obj countByEnumeratingWithState:&v71 objects:v86 count:16];
      uint64_t v9 = v42;
      if (!v42)
      {
LABEL_46:

        kdebug_trace();
        v43 = [(id)v76[5] dataclassActionsForAccountSave:v61];
        kdebug_trace();
        long long v69 = 0u;
        long long v70 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        v44 = [v61 provisionedDataclasses];
        uint64_t v45 = [v44 countByEnumeratingWithState:&v67 objects:v85 count:16];
        if (v45)
        {
          uint64_t v46 = *(void *)v68;
          do
          {
            for (uint64_t i = 0; i != v45; ++i)
            {
              if (*(void *)v68 != v46) {
                objc_enumerationMutation(v44);
              }
              uint64_t v48 = *(void *)(*((void *)&v67 + 1) + 8 * i);
              v49 = [v43 objectForKeyedSubscript:v48];
              if ([v49 count] == 1)
              {
                v50 = [v49 lastObject];
                if ([v50 type])
                {
                  v51 = _BYLoggingFacility();
                  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
                  {
                    uint64_t v52 = [v50 type];
                    *(_DWORD *)buf = 134218242;
                    *(void *)&uint8_t buf[4] = v52;
                    *(_WORD *)&buf[12] = 2114;
                    *(void *)&buf[14] = v48;
                    _os_log_impl(&dword_1A7DED000, v51, OS_LOG_TYPE_DEFAULT, "Setting action %lu for dataclass %{public}@", buf, 0x16u);
                  }

                  [v62 setObject:v50 forKey:v48];
                }
              }
            }
            uint64_t v45 = [v44 countByEnumeratingWithState:&v67 objects:v85 count:16];
          }
          while (v45);
        }

        uint64_t v81 = 0;
        v82 = &v81;
        uint64_t v83 = 0x2020000000;
        v53 = (id *)getkAccountDataclassKeyValueSymbolLoc_ptr;
        uint64_t v84 = getkAccountDataclassKeyValueSymbolLoc_ptr;
        if (!getkAccountDataclassKeyValueSymbolLoc_ptr)
        {
          *(void *)buf = MEMORY[0x1E4F143A8];
          *(void *)&buf[8] = 3221225472;
          *(void *)&uint8_t buf[16] = __getkAccountDataclassKeyValueSymbolLoc_block_invoke;
          v88 = &unk_1E5D2B9E8;
          v89 = &v81;
          v54 = (void *)AccountsLibrary();
          v55 = dlsym(v54, "kAccountDataclassKeyValue");
          *(void *)(v89[1] + 24) = v55;
          getkAccountDataclassKeyValueSymbolLoc_ptr = *(void *)(v89[1] + 24);
          v53 = (id *)v82[3];
        }
        _Block_object_dispose(&v81, 8);
        if (v53)
        {
          id v56 = *v53;
          [v61 setEnabled:1 forDataclass:v56];

          break;
        }
        dlerror();
        abort_report_np();
LABEL_68:
        __break(1u);
      }
    }
  }
  kdebug_trace();
  v57 = _BYLoggingFacility();
  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A7DED000, v57, OS_LOG_TYPE_DEFAULT, "Saving Account...", buf, 2u);
  }

  v58 = (void *)v76[5];
  v64[0] = MEMORY[0x1E4F143A8];
  v64[1] = 3221225472;
  v64[2] = __67__BYAppleIDAccountsManager_enableDataClassesForAccount_completion___block_invoke;
  v64[3] = &unk_1E5D2C758;
  id v59 = v60;
  id v65 = v59;
  v66 = &v75;
  [v58 saveAccount:v61 withDataclassActions:v62 completion:v64];

  _Block_object_dispose(&v75, 8);
}

void __67__BYAppleIDAccountsManager_enableDataClassesForAccount_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  kdebug_trace();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__BYAppleIDAccountsManager_enableDataClassesForAccount_completion___block_invoke_2;
  v9[3] = &unk_1E5D2C730;
  char v13 = a2;
  id v10 = v5;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  id v11 = v6;
  uint64_t v12 = v7;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v9);
}

void __67__BYAppleIDAccountsManager_enableDataClassesForAccount_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = _BYLoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = *(unsigned __int8 *)(a1 + 56);
    char v5 = _BYIsInternalInstall();
    id v6 = *(void **)(a1 + 32);
    if ((v5 & 1) != 0 || !v6)
    {
      int v8 = 0;
    }
    else
    {
      uint64_t v7 = NSString;
      v1 = [*(id *)(a1 + 32) domain];
      id v6 = [v7 stringWithFormat:@"<Error domain: %@, code %ld>", v1, objc_msgSend(*(id *)(a1 + 32), "code")];
      int v8 = 1;
    }
    *(_DWORD *)buf = 67109378;
    int v12 = v4;
    __int16 v13 = 2114;
    id v14 = v6;
    _os_log_impl(&dword_1A7DED000, v3, OS_LOG_TYPE_DEFAULT, "Enable dataclasses for account success = %d, error = %{public}@", buf, 0x12u);
    if (v8)
    {
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = 0;
}

- (void)runPostRestoreRenewCredentialsIfNeeded
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F179C8] defaultStore];
  int v4 = objc_msgSend(v3, "aa_primaryAppleAccount");

  if (v4)
  {
    if ([v4 isAuthenticated])
    {
      char v5 = _BYLoggingFacility();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        id v6 = "Post-restore renew unneccessary: primary account already authenticated";
LABEL_7:
        _os_log_impl(&dword_1A7DED000, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
        goto LABEL_18;
      }
      goto LABEL_18;
    }
    char v5 = [(BYAppleIDAccountsManager *)self storedLoginContext];
    uint64_t v7 = [v5 appleID];
    if (v7)
    {
      int v8 = (void *)v7;
      uint64_t v9 = [v5 rawPassword];
      if (v9)
      {

LABEL_12:
        id v11 = _BYLoggingFacility();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v15 = 3;
          _os_log_impl(&dword_1A7DED000, v11, OS_LOG_TYPE_DEFAULT, "Primary account is not authenticated; attempting %ld renews...",
            buf,
            0xCu);
        }

        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __66__BYAppleIDAccountsManager_runPostRestoreRenewCredentialsIfNeeded__block_invoke;
        v13[3] = &unk_1E5D2BA60;
        v13[4] = self;
        [(BYAppleIDAccountsManager *)self repeatedlyAttemptPostRestoreRenewForAccount:v4 loginContext:v5 numberOfAttemptsAllowed:3 completion:v13];
        goto LABEL_18;
      }
      id v10 = [v5 continuationKey];

      if (v10) {
        goto LABEL_12;
      }
    }
    int v12 = _BYLoggingFacility();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7DED000, v12, OS_LOG_TYPE_DEFAULT, "Unable to perform post-restore renew: login context has no data", buf, 2u);
    }

    goto LABEL_18;
  }
  char v5 = _BYLoggingFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    id v6 = "Unable to perform post-restore renew; no primary account!";
    goto LABEL_7;
  }
LABEL_18:
}

uint64_t __66__BYAppleIDAccountsManager_runPostRestoreRenewCredentialsIfNeeded__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) clearStoredLoginContext];
}

- (void)repeatedlyAttemptPostRestoreRenewForAccount:(id)a3 loginContext:(id)a4 numberOfAttemptsAllowed:(unint64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  __int16 v13 = v12;
  if (a5)
  {
    id v14 = _BYLoggingFacility();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7DED000, v14, OS_LOG_TYPE_DEFAULT, "Attempting post-restore renew...", buf, 2u);
    }

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __120__BYAppleIDAccountsManager_repeatedlyAttemptPostRestoreRenewForAccount_loginContext_numberOfAttemptsAllowed_completion___block_invoke;
    v15[3] = &unk_1E5D2C7A8;
    id v18 = v13;
    unint64_t v19 = a5;
    v15[4] = self;
    id v16 = v10;
    id v17 = v11;
    [(BYAppleIDAccountsManager *)self attemptPostRestoreRenewForAccount:v16 loginContext:v17 allowFollowUp:a5 == 1 completion:v15];
  }
  else if (v12)
  {
    (*((void (**)(id))v12 + 2))(v12);
  }
}

void __120__BYAppleIDAccountsManager_repeatedlyAttemptPostRestoreRenewForAccount_loginContext_numberOfAttemptsAllowed_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F179C8] defaultStore];
  uint64_t v7 = objc_msgSend(v6, "aa_primaryAppleAccount");

  if (![v7 isAuthenticated])
  {
    uint64_t v10 = *(void *)(a1 + 64);
    BOOL v11 = v10 != 0;
    uint64_t v12 = v10 - 1;
    if (v11) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 0;
    }
    id v14 = _BYLoggingFacility();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (a2 || v5)
    {
      if (!v15) {
        goto LABEL_16;
      }
      *(_DWORD *)buf = 134218242;
      uint64_t v32 = a2;
      __int16 v33 = 2112;
      id v34 = v5;
      id v16 = "Renew failed (%ld): %@";
      id v17 = v14;
      uint32_t v18 = 22;
    }
    else
    {
      if (!v15) {
        goto LABEL_16;
      }
      *(_WORD *)buf = 0;
      id v16 = "Renew succeeded, but we're not authenticated";
      id v17 = v14;
      uint32_t v18 = 2;
    }
    _os_log_impl(&dword_1A7DED000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
LABEL_16:

    unint64_t v19 = _BYLoggingFacility();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    if (v13 == 1)
    {
      if (v20)
      {
        *(_WORD *)buf = 0;
        id v21 = "Waiting for retry (1 attempt remaining)...";
        uint64_t v22 = v19;
        uint32_t v23 = 2;
LABEL_21:
        _os_log_impl(&dword_1A7DED000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
      }
    }
    else if (v20)
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v32 = v13;
      id v21 = "Waiting for retry (%ld attempts remaining)...";
      uint64_t v22 = v19;
      uint32_t v23 = 12;
      goto LABEL_21;
    }

    dispatch_time_t v24 = dispatch_time(0, 10000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __120__BYAppleIDAccountsManager_repeatedlyAttemptPostRestoreRenewForAccount_loginContext_numberOfAttemptsAllowed_completion___block_invoke_42;
    block[3] = &unk_1E5D2C780;
    id v25 = *(void **)(a1 + 40);
    void block[4] = *(void *)(a1 + 32);
    id v27 = v25;
    id v28 = *(id *)(a1 + 48);
    uint64_t v30 = v13;
    id v29 = *(id *)(a1 + 56);
    dispatch_after(v24, MEMORY[0x1E4F14428], block);

    goto LABEL_23;
  }
  int v8 = _BYLoggingFacility();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A7DED000, v8, OS_LOG_TYPE_DEFAULT, "Account is now authenticated!", buf, 2u);
  }

  uint64_t v9 = *(void *)(a1 + 56);
  if (v9) {
    (*(void (**)(void))(v9 + 16))();
  }
LABEL_23:
}

uint64_t __120__BYAppleIDAccountsManager_repeatedlyAttemptPostRestoreRenewForAccount_loginContext_numberOfAttemptsAllowed_completion___block_invoke_42(uint64_t a1)
{
  return [*(id *)(a1 + 32) repeatedlyAttemptPostRestoreRenewForAccount:*(void *)(a1 + 40) loginContext:*(void *)(a1 + 48) numberOfAttemptsAllowed:*(void *)(a1 + 64) completion:*(void *)(a1 + 56)];
}

- (void)attemptPostRestoreRenewForAccount:(id)a3 loginContext:(id)a4 allowFollowUp:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  v21[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  uint64_t v12 = [v10 rawPassword];

  if (v12)
  {
    uint64_t v13 = [v10 rawPassword];
    objc_msgSend(v9, "_aa_setRawPassword:", v13);
  }
  uint64_t v14 = *MEMORY[0x1E4F17A40];
  v20[0] = *MEMORY[0x1E4F17A30];
  v20[1] = v14;
  v21[0] = MEMORY[0x1E4F1CC38];
  v21[1] = MEMORY[0x1E4F1CC38];
  BOOL v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
  id v16 = (void *)[v15 mutableCopy];

  if (v7)
  {
    id v17 = _BYLoggingFacility();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unint64_t v19 = 0;
      _os_log_impl(&dword_1A7DED000, v17, OS_LOG_TYPE_DEFAULT, "Posting a followup for post-restore auth assistance", v19, 2u);
    }

    [v16 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"AARenewShouldPostFollowUp"];
  }
  uint32_t v18 = [MEMORY[0x1E4F179C8] defaultStore];
  [v18 renewCredentialsForAccount:v9 options:v16 completion:v11];
}

- (void)performSilentICDPUpgrade
{
  uint64_t v16 = 0;
  uint64_t v17 = (uint64_t)&v16;
  uint64_t v18 = 0x2050000000;
  v2 = (void *)getCDPContextClass_softClass;
  unint64_t v19 = (void *)getCDPContextClass_softClass;
  if (!getCDPContextClass_softClass)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    uint64_t v12 = (uint64_t)__getCDPContextClass_block_invoke;
    uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E5D2B9E8;
    uint64_t v14 = (void (*)(uint64_t))&v16;
    __getCDPContextClass_block_invoke((uint64_t)buf);
    v2 = *(void **)(v17 + 24);
  }
  id v3 = v2;
  _Block_object_dispose(&v16, 8);
  int v4 = [v3 contextForPrimaryAccount];
  if (v4)
  {
    id v5 = _BYLoggingFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7DED000, v5, OS_LOG_TYPE_DEFAULT, "Will perform silent ICDP upgrade", buf, 2u);
    }

    *(void *)buf = 0;
    uint64_t v11 = (uint64_t)buf;
    uint64_t v12 = 0x3032000000;
    uint64_t v13 = __Block_byref_object_copy__6;
    uint64_t v14 = __Block_byref_object_dispose__6;
    id v15 = (id)os_transaction_create();
    uint64_t v21 = 0;
    uint64_t v22 = &v21;
    uint64_t v23 = 0x2050000000;
    id v6 = (void *)getCDPStateControllerClass_softClass;
    uint64_t v24 = getCDPStateControllerClass_softClass;
    if (!getCDPStateControllerClass_softClass)
    {
      uint64_t v16 = MEMORY[0x1E4F143A8];
      uint64_t v17 = 3221225472;
      uint64_t v18 = (uint64_t)__getCDPStateControllerClass_block_invoke;
      unint64_t v19 = &unk_1E5D2B9E8;
      BOOL v20 = &v21;
      __getCDPStateControllerClass_block_invoke((uint64_t)&v16);
      id v6 = (void *)v22[3];
    }
    BOOL v7 = v6;
    _Block_object_dispose(&v21, 8);
    int v8 = (void *)[[v7 alloc] initWithContext:v4];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __52__BYAppleIDAccountsManager_performSilentICDPUpgrade__block_invoke;
    v9[3] = &unk_1E5D2C7D0;
    void v9[4] = buf;
    [v8 handleCloudDataProtectionStateWithCompletion:v9];

    _Block_object_dispose(buf, 8);
  }
}

void __52__BYAppleIDAccountsManager_performSilentICDPUpgrade__block_invoke(uint64_t a1, int a2, int a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = _BYLoggingFacility();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if (_BYIsInternalInstall())
    {
      int v10 = 0;
      uint64_t v11 = v8;
    }
    else if (v8)
    {
      uint64_t v12 = NSString;
      int v4 = [v8 domain];
      uint64_t v11 = [v12 stringWithFormat:@"<Error domain: %@, code %ld>", v4, objc_msgSend(v8, "code")];
      int v10 = 1;
    }
    else
    {
      int v10 = 0;
      uint64_t v11 = 0;
    }
    *(_DWORD *)buf = 67109634;
    int v16 = a2;
    __int16 v17 = 1024;
    int v18 = a3;
    __int16 v19 = 2114;
    BOOL v20 = v11;
    _os_log_impl(&dword_1A7DED000, v9, OS_LOG_TYPE_DEFAULT, "Did perform silent ICDP upgrade: shouldCompleteSignIn %d cloudDataProtectionEnabled %d error %{public}@", buf, 0x18u);
    if (v10)
    {
    }
  }

  uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = 0;
}

- (id)storedLoginContext
{
  storedLoginContext = self->_storedLoginContext;
  if (!storedLoginContext)
  {
    int v4 = [getAALoginContextTransientStorageClass() sharedStorage];
    id v5 = [v4 storedContext];
    id v6 = self->_storedLoginContext;
    self->_storedLoginContext = v5;

    storedLoginContext = self->_storedLoginContext;
  }
  return storedLoginContext;
}

- (void)clearStoredLoginContext
{
  id v3 = _BYLoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1A7DED000, v3, OS_LOG_TYPE_DEFAULT, "Clearing stored login context", v6, 2u);
  }

  int v4 = [getAALoginContextTransientStorageClass() sharedStorage];
  [v4 clear];

  storedLoginContext = self->_storedLoginContext;
  self->_storedLoginContext = 0;
}

- (void)setAAService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aaService, 0);
  objc_storeStrong((id *)&self->_storedLoginContext, 0);
  objc_storeStrong((id *)&self->_appleIDLoginPluginManager, 0);
}

void __123__BYAppleIDAccountsManager_loginDelegateAccountsWithUsername_password_rawPassword_skipiTunes_onlyAppleIDPlugin_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v4 = [*(id *)(a1 + 40) status];
  id v5 = [*(id *)(a1 + 40) statusMessage];
  id v6 = [*(id *)(a1 + 40) responseParameters];
  int v7 = 138412802;
  id v8 = v4;
  __int16 v9 = 2112;
  int v10 = v5;
  __int16 v11 = 2112;
  uint64_t v12 = v6;
  _os_log_debug_impl(&dword_1A7DED000, a2, OS_LOG_TYPE_DEBUG, "loginResponse: %@, %@, %@", (uint8_t *)&v7, 0x20u);
}

@end