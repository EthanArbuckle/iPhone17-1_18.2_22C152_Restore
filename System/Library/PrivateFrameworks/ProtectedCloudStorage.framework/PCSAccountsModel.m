@interface PCSAccountsModel
+ (BOOL)adpEnabledForDSID:(id)a3 error:(id *)a4;
+ (BOOL)currentPersonaSupportsPrimaryAccount:(id *)a3;
+ (id)accountForCurrentPersona;
+ (id)altDSIDForDSID:(id)a3;
+ (id)defaultAccountsModel;
+ (id)guitarfishStateForDSID:(id)a3;
+ (id)settingsKeyForKey:(id)a3 error:(id *)a4;
+ (void)accountForCurrentPersona;
- (ACAccountStore)store;
- (BOOL)accountsChanged;
- (NSString)dsid;
- (NSString)identifier;
- (NSString)lastError;
- (NSString)username;
- (OS_dispatch_queue)queue;
- (PCSAccountsModel)init;
- (uint64_t)update;
- (void)_accountStoreDidChange:(id)a3;
- (void)faultIfCurrentPersonaIsDataSeparated;
- (void)init;
- (void)setAccountsChanged:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setStore:(id)a3;
- (void)update;
@end

@implementation PCSAccountsModel

+ (id)defaultAccountsModel
{
  if (defaultAccountsModel_onceToken != -1) {
    dispatch_once(&defaultAccountsModel_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)defaultAccountsModel_model;
  return v2;
}

void __40__PCSAccountsModel_defaultAccountsModel__block_invoke()
{
  v0 = (void *)MEMORY[0x1AD11CE50]();
  v1 = objc_alloc_init(PCSAccountsModel);
  v2 = (void *)defaultAccountsModel_model;
  defaultAccountsModel_model = (uint64_t)v1;
}

- (PCSAccountsModel)init
{
  v14.receiver = self;
  v14.super_class = (Class)PCSAccountsModel;
  v2 = [(PCSAccountsModel *)&v14 init];
  if (v2)
  {
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x2050000000;
    v3 = (void *)getACAccountStoreClass_softClass;
    uint64_t v23 = getACAccountStoreClass_softClass;
    if (!getACAccountStoreClass_softClass)
    {
      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      v17 = __getACAccountStoreClass_block_invoke;
      v18 = &unk_1E5E6DDF8;
      v19 = &v20;
      __getACAccountStoreClass_block_invoke((uint64_t)&v15);
      v3 = (void *)v21[3];
    }
    id v4 = v3;
    _Block_object_dispose(&v20, 8);
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x2020000000;
    v5 = (id *)getACDAccountStoreDidChangeNotificationSymbolLoc_ptr;
    uint64_t v23 = getACDAccountStoreDidChangeNotificationSymbolLoc_ptr;
    if (!getACDAccountStoreDidChangeNotificationSymbolLoc_ptr)
    {
      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      v17 = __getACDAccountStoreDidChangeNotificationSymbolLoc_block_invoke;
      v18 = &unk_1E5E6DDF8;
      v19 = &v20;
      v6 = (void *)AccountsLibrary();
      v7 = dlsym(v6, "ACDAccountStoreDidChangeNotification");
      *(void *)(v19[1] + 24) = v7;
      getACDAccountStoreDidChangeNotificationSymbolLoc_ptr = *(void *)(v19[1] + 24);
      v5 = (id *)v21[3];
    }
    _Block_object_dispose(&v20, 8);
    if (!v5) {
      -[PCSAccountsModel init]();
    }
    id v8 = *v5;
    v9 = [v4 defaultStore];
    [(PCSAccountsModel *)v2 setStore:v9];

    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("PCSAccountQueue", v10);
    [(PCSAccountsModel *)v2 setQueue:v11];

    [(PCSAccountsModel *)v2 setAccountsChanged:1];
    v12 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v12 addObserver:v2 selector:sel__accountStoreDidChange_ name:v8 object:0];
  }
  return v2;
}

- (void)_accountStoreDidChange:(id)a3
{
  id v4 = a3;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  v5 = (id *)getACAccountTypeIdentifierKeySymbolLoc_ptr;
  uint64_t v24 = getACAccountTypeIdentifierKeySymbolLoc_ptr;
  if (!getACAccountTypeIdentifierKeySymbolLoc_ptr)
  {
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __getACAccountTypeIdentifierKeySymbolLoc_block_invoke;
    v19 = &unk_1E5E6DDF8;
    uint64_t v20 = &v21;
    v6 = (void *)AccountsLibrary();
    v22[3] = (uint64_t)dlsym(v6, "ACAccountTypeIdentifierKey");
    getACAccountTypeIdentifierKeySymbolLoc_ptr = *(void *)(v20[1] + 24);
    v5 = (id *)v22[3];
  }
  _Block_object_dispose(&v21, 8);
  if (!v5) {
    -[PCSAccountsModel init]();
  }
  id v7 = *v5;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  id v8 = (id *)getACAccountTypeIdentifierAppleAccountSymbolLoc_ptr;
  uint64_t v24 = getACAccountTypeIdentifierAppleAccountSymbolLoc_ptr;
  if (!getACAccountTypeIdentifierAppleAccountSymbolLoc_ptr)
  {
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __getACAccountTypeIdentifierAppleAccountSymbolLoc_block_invoke;
    v19 = &unk_1E5E6DDF8;
    uint64_t v20 = &v21;
    v9 = (void *)AccountsLibrary();
    v22[3] = (uint64_t)dlsym(v9, "ACAccountTypeIdentifierAppleAccount");
    getACAccountTypeIdentifierAppleAccountSymbolLoc_ptr = *(void *)(v20[1] + 24);
    id v8 = (id *)v22[3];
  }
  _Block_object_dispose(&v21, 8);
  if (!v8) {
    -[PCSAccountsModel init]();
  }
  id v10 = *v8;
  dispatch_queue_t v11 = [v4 userInfo];
  v12 = [v11 objectForKeyedSubscript:v7];
  int v13 = [v12 isEqualToString:v10];

  if (v13)
  {
    objc_super v14 = [(PCSAccountsModel *)self queue];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __43__PCSAccountsModel__accountStoreDidChange___block_invoke;
    v15[3] = &unk_1E5E6E0B0;
    v15[4] = self;
    dispatch_sync(v14, v15);
  }
}

uint64_t __43__PCSAccountsModel__accountStoreDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAccountsChanged:1];
}

- (void)faultIfCurrentPersonaIsDataSeparated
{
  *(_WORD *)v0 = 0;
  _os_log_fault_impl(&dword_1ACF98000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "PCSAccountsModel used with active persona", v0, 2u);
}

- (NSString)username
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  if (PCSSupportsPersonaMultiuser())
  {
    v3 = +[PCSAccountsModel accountForCurrentPersona];
    uint64_t v4 = [v3 username];
    v5 = (void *)v16[5];
    v16[5] = v4;

    v6 = MEMORY[0x1E4F14500];
    id v7 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      dispatch_queue_t v11 = [v3 personaIdentifier];
      v12 = objc_msgSend(v3, "aa_personID");
      int v13 = objc_msgSend(v3, "aa_altDSID");
      *(_DWORD *)buf = 138412802;
      uint64_t v22 = v11;
      __int16 v23 = 2112;
      uint64_t v24 = v12;
      __int16 v25 = 2112;
      v26 = v13;
      _os_log_fault_impl(&dword_1ACF98000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "username invoked with current persona: %@, dsid: %@, altDSID: %@", buf, 0x20u);
    }
  }
  else
  {
    [(PCSAccountsModel *)self faultIfCurrentPersonaIsDataSeparated];
    id v8 = [(PCSAccountsModel *)self queue];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __28__PCSAccountsModel_username__block_invoke;
    v14[3] = &unk_1E5E6E0D8;
    v14[4] = self;
    v14[5] = &v15;
    dispatch_sync(v8, v14);
  }
  id v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return (NSString *)v9;
}

void __28__PCSAccountsModel_username__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) update];
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  v3 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  objc_storeStrong(v3, v2);
}

- (NSString)dsid
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  if (PCSSupportsPersonaMultiuser())
  {
    v3 = +[PCSAccountsModel accountForCurrentPersona];
    uint64_t v4 = objc_msgSend(v3, "aa_personID");
    v5 = (void *)v16[5];
    v16[5] = v4;

    v6 = MEMORY[0x1E4F14500];
    id v7 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      dispatch_queue_t v11 = [v3 personaIdentifier];
      v12 = objc_msgSend(v3, "aa_personID");
      int v13 = objc_msgSend(v3, "aa_altDSID");
      *(_DWORD *)buf = 138412802;
      uint64_t v22 = v11;
      __int16 v23 = 2112;
      uint64_t v24 = v12;
      __int16 v25 = 2112;
      v26 = v13;
      _os_log_fault_impl(&dword_1ACF98000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "dsid invoked with current persona: %@, dsid: %@, altDSID: %@", buf, 0x20u);
    }
  }
  else
  {
    [(PCSAccountsModel *)self faultIfCurrentPersonaIsDataSeparated];
    id v8 = [(PCSAccountsModel *)self queue];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __24__PCSAccountsModel_dsid__block_invoke;
    v14[3] = &unk_1E5E6E0D8;
    v14[4] = self;
    v14[5] = &v15;
    dispatch_sync(v8, v14);
  }
  id v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return (NSString *)v9;
}

void __24__PCSAccountsModel_dsid__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) update];
  v2 = *(void **)(*(void *)(a1 + 32) + 24);
  v3 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  objc_storeStrong(v3, v2);
}

- (NSString)identifier
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  if (PCSSupportsPersonaMultiuser())
  {
    v3 = +[PCSAccountsModel accountForCurrentPersona];
    uint64_t v4 = [v3 identifier];
    v5 = (void *)v16[5];
    v16[5] = v4;

    v6 = MEMORY[0x1E4F14500];
    id v7 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      dispatch_queue_t v11 = [v3 personaIdentifier];
      v12 = objc_msgSend(v3, "aa_personID");
      int v13 = objc_msgSend(v3, "aa_altDSID");
      *(_DWORD *)buf = 138412802;
      uint64_t v22 = v11;
      __int16 v23 = 2112;
      uint64_t v24 = v12;
      __int16 v25 = 2112;
      v26 = v13;
      _os_log_fault_impl(&dword_1ACF98000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "identifier invoked with current persona: %@, dsid: %@, altDSID: %@", buf, 0x20u);
    }
  }
  else
  {
    [(PCSAccountsModel *)self faultIfCurrentPersonaIsDataSeparated];
    id v8 = [(PCSAccountsModel *)self queue];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __30__PCSAccountsModel_identifier__block_invoke;
    v14[3] = &unk_1E5E6E0D8;
    v14[4] = self;
    v14[5] = &v15;
    dispatch_sync(v8, v14);
  }
  id v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return (NSString *)v9;
}

void __30__PCSAccountsModel_identifier__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) update];
  v2 = *(void **)(*(void *)(a1 + 32) + 32);
  v3 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  objc_storeStrong(v3, v2);
}

- (NSString)lastError
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy_;
  uint64_t v21 = __Block_byref_object_dispose_;
  id v22 = 0;
  if (PCSSupportsPersonaMultiuser())
  {
    v3 = +[PCSAccountsModel accountForCurrentPersona];
    uint64_t v4 = MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      int v13 = [v3 personaIdentifier];
      objc_super v14 = objc_msgSend(v3, "aa_personID");
      uint64_t v15 = objc_msgSend(v3, "aa_altDSID");
      *(_DWORD *)buf = 138412802;
      uint64_t v24 = v13;
      __int16 v25 = 2112;
      v26 = v14;
      __int16 v27 = 2112;
      v28 = v15;
      _os_log_fault_impl(&dword_1ACF98000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "lastError invoked with current persona: %@, dsid: %@, altDSID: %@", buf, 0x20u);
    }
    v6 = NSString;
    id v7 = [v3 personaIdentifier];
    uint64_t v8 = [v6 stringWithFormat:@"lastError not set for current persona %@", v7];
    id v9 = (void *)v18[5];
    v18[5] = v8;
  }
  else
  {
    [(PCSAccountsModel *)self faultIfCurrentPersonaIsDataSeparated];
    id v10 = [(PCSAccountsModel *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __29__PCSAccountsModel_lastError__block_invoke;
    block[3] = &unk_1E5E6E100;
    block[4] = self;
    block[5] = &v17;
    dispatch_sync(v10, block);
  }
  id v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return (NSString *)v11;
}

void __29__PCSAccountsModel_lastError__block_invoke(uint64_t a1)
{
}

- (void)update
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = [(PCSAccountsModel *)self queue];
  dispatch_assert_queue_V2(v3);

  if (![(PCSAccountsModel *)self accountsChanged])
  {
    uint64_t v17 = 0;
    uint64_t v4 = 0;
    goto LABEL_18;
  }
  [(PCSAccountsModel *)self setAccountsChanged:0];
  uint64_t v4 = self->_dsid;
  username = self->_username;
  self->_username = 0;

  dsid = self->_dsid;
  self->_dsid = 0;

  identifier = self->_identifier;
  self->_identifier = 0;

  lastError = self->_lastError;
  self->_lastError = 0;

  id v9 = [(PCSAccountsModel *)self store];
  id v10 = objc_msgSend(v9, "aa_primaryAppleAccount");

  if (!v10)
  {
    uint64_t v17 = 0;
    v18 = @"No primary AppleAccount";
LABEL_11:
    uint64_t v19 = self->_lastError;
    self->_lastError = &v18->isa;

    goto LABEL_12;
  }
  id v11 = [v10 username];
  v12 = self->_username;
  self->_username = v11;

  objc_msgSend(v10, "aa_personID");
  int v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  objc_super v14 = self->_dsid;
  self->_dsid = v13;

  uint64_t v15 = [v10 identifier];
  uint64_t v16 = self->_identifier;
  self->_identifier = v15;

  if (!self->_username)
  {
    v18 = @"No username found on accounts";
LABEL_10:
    uint64_t v17 = v10;
    goto LABEL_11;
  }
  if (!self->_dsid)
  {
    v18 = @"No dsid found on accounts";
    goto LABEL_10;
  }
  uint64_t v17 = v10;
LABEL_12:
  id v20 = self->_dsid;
  if (((v4 != 0) != (v20 != 0) || v4 && v20 && ![(NSString *)v20 isEqualToString:v4])
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = self->_dsid;
    int v22 = 138543618;
    __int16 v23 = v4;
    __int16 v24 = 2114;
    __int16 v25 = v21;
    _os_log_impl(&dword_1ACF98000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Switching from DSID %{public}@ to %{public}@", (uint8_t *)&v22, 0x16u);
  }
LABEL_18:
}

+ (BOOL)currentPersonaSupportsPrimaryAccount:(id *)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [getUMUserManagerClass() sharedManager];
  id v5 = [v4 currentPersona];

  int v6 = [v5 isDataSeparatedPersona];
  char v7 = v6;
  if (a3 && v6)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F28C58];
    id v9 = kPCSErrorDomain;
    uint64_t v12 = *MEMORY[0x1E4F28568];
    v13[0] = @"Operation unsupported for non-primary persona";
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    *a3 = [v8 errorWithDomain:v9 code:146 userInfo:v10];
  }
  return v7 ^ 1;
}

+ (id)accountForCurrentPersona
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v2 = +[PCSAccountsModel defaultAccountsModel];
  v3 = [v2 store];

  uint64_t v4 = [getUMUserManagerClass() sharedManager];
  id v5 = [v4 currentPersona];

  if ([v5 isDataSeparatedPersona])
  {
    int v6 = [v5 userPersonaUniqueString];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    char v7 = objc_msgSend(v3, "aa_appleAccounts", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v23 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
LABEL_4:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8 * v11);
        int v13 = [v12 personaIdentifier];
        char v14 = [v6 isEqualToString:v13];

        if (v14) {
          break;
        }
        if (v9 == ++v11)
        {
          uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v23 count:16];
          if (v9) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      id v15 = v12;

      if (!v15) {
        goto LABEL_15;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        int v22 = v6;
        _os_log_impl(&dword_1ACF98000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "using account for persona %@", buf, 0xCu);
      }
    }
    else
    {
LABEL_10:

LABEL_15:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        +[PCSAccountsModel accountForCurrentPersona]((uint64_t)v6);
      }
      id v15 = 0;
    }
  }
  else
  {
    objc_msgSend(v3, "aa_primaryAppleAccount");
    id v15 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

+ (id)altDSIDForDSID:(id)a3
{
  id v3 = a3;
  if (!AppleAccountLibraryCore_frameworkLibrary) {
    AppleAccountLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (AppleAccountLibraryCore_frameworkLibrary) {
    BOOL v4 = v3 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    uint64_t v8 = 0;
  }
  else
  {
    id v5 = +[PCSAccountsModel defaultAccountsModel];
    int v6 = [v5 store];

    char v7 = objc_msgSend(v6, "aa_appleAccountWithPersonID:", v3);
    uint64_t v8 = objc_msgSend(v7, "aa_altDSID");
  }
  return v8;
}

+ (id)settingsKeyForKey:(id)a3 error:(id *)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (+[PCSAccountsModel currentPersonaSupportsPrimaryAccount:0])
  {
    a4 = (id *)v5;
  }
  else if ([v5 isEqualToString:@"nextRegistrySync"])
  {
    a4 = (id *)@"nextRegistrySyncEnterprise";
  }
  else if ([v5 isEqualToString:@"registrySyncIdentifier"])
  {
    a4 = (id *)@"registrySyncIdentifierEnterprise";
  }
  else if (a4)
  {
    int v6 = (void *)MEMORY[0x1E4F28C58];
    char v7 = kPCSErrorDomain;
    uint64_t v8 = [NSString stringWithFormat:@"Unrecognized key :%@", v5, *MEMORY[0x1E4F28568]];
    v12[0] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    *a4 = [v6 errorWithDomain:v7 code:153 userInfo:v9];

    a4 = 0;
  }

  return a4;
}

+ (id)guitarfishStateForDSID:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2050000000;
  id v5 = (void *)getAKAccountManagerClass_softClass;
  uint64_t v18 = getAKAccountManagerClass_softClass;
  if (!getAKAccountManagerClass_softClass)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    long long v20 = __getAKAccountManagerClass_block_invoke;
    uint64_t v21 = &unk_1E5E6DDF8;
    int v22 = &v15;
    __getAKAccountManagerClass_block_invoke((uint64_t)&buf);
    id v5 = (void *)v16[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v15, 8);
  char v7 = [a1 altDSIDForDSID:v4];
  if (!v7)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1ACF98000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "unable to determine altDSID", (uint8_t *)&buf, 2u);
    }
    id v10 = 0;
    uint64_t v8 = 0;
    goto LABEL_11;
  }
  uint64_t v8 = [v6 sharedInstance];
  id v14 = 0;
  uint64_t v9 = [v8 authKitAccountWithAltDSID:v7 error:&v14];
  id v10 = v14;
  if (!v9)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v10;
      _os_log_impl(&dword_1ACF98000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "unable to get AuthKit account: %@", (uint8_t *)&buf, 0xCu);
    }
LABEL_11:
    uint64_t v9 = 0;
    uint64_t v11 = 0;
    goto LABEL_12;
  }
  uint64_t v11 = [v8 edpStateForAccount:v9];
LABEL_12:
  id v12 = v11;

  return v12;
}

+ (BOOL)adpEnabledForDSID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!objc_opt_class())
  {
    _PCSNSError(a4, 15, @"OctagonTrust not available", v7, v8, v9, v10, v11, v24);
    char v22 = 0;
    uint64_t v17 = 0;
LABEL_7:
    id v18 = 0;
    goto LABEL_9;
  }
  uint64_t v17 = [a1 altDSIDForDSID:v6];
  if (!v17)
  {
    _PCSNSError(a4, 90, @"unable to determine altDSID", v12, v13, v14, v15, v16, v24);
    char v22 = 0;
    goto LABEL_7;
  }
  id v18 = objc_alloc_init(MEMORY[0x1E4F3B438]);
  [v18 setAltDSID:v17];
  [v18 setContext:*MEMORY[0x1E4F3B458]];
  long long v19 = [MEMORY[0x1E4F3B430] fetchAccountWideSettingsDefaultWithForceFetch:0 configuration:v18 error:a4];
  if (v19)
  {
    long long v20 = v19;
    uint64_t v21 = [v19 walrus];
    char v22 = [v21 enabled];
  }
  else
  {
    char v22 = 0;
  }
LABEL_9:

  return v22;
}

- (BOOL)accountsChanged
{
  return self->_accountsChanged;
}

- (void)setAccountsChanged:(BOOL)a3
{
  self->_accountsChanged = a3;
}

- (ACAccountStore)store
{
  return (ACAccountStore *)objc_getProperty(self, a2, 48, 1);
}

- (void)setStore:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 56, 1);
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_lastError, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_username, 0);
}

- (void)init
{
  dlerror();
  uint64_t v0 = abort_report_np();
  -[PCSAccountsModel faultIfCurrentPersonaIsDataSeparated](v0);
}

- (uint64_t)update
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = objc_begin_catch(a1);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1ACF98000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "no accounts found: %@", (uint8_t *)&v6, 0xCu);
  }
  objc_end_catch();
  return a3 & 1;
}

+ (void)accountForCurrentPersona
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_1ACF98000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "unable to find account for persona %@", (uint8_t *)&v1, 0xCu);
}

@end