@interface ICAccountUtilities
+ (id)sharedInstance;
+ (void)registerStateHandler;
- (ACAccount)primaryICloudACAccount;
- (ACAccountStore)accountStore;
- (BOOL)didChooseToMigratePrimaryICloudAccount;
- (BOOL)hasSyncingAccount;
- (BOOL)isManagedACAccountWithIdentifier:(id)a3;
- (BOOL)isPrimaryICloudACAccountValid;
- (BOOL)primaryICloudAccountEnabled;
- (ICAccountUtilities)init;
- (NSDictionary)currentICloudAccountState;
- (NSMutableDictionary)accountByIdentifier;
- (NSMutableDictionary)accountIsManagedByIdentifier;
- (id)allICloudACAccounts;
- (id)applicationDataContainerURLForAccountIdentifier:(id)a3;
- (id)applicationDocumentsURLForAccountIdentifier:(id)a3;
- (id)iCloudACAccountWithIdentifier:(id)a3;
- (id)initForObservingAccountStoreChanges:(BOOL)a3;
- (id)temporaryDirectoryURLForAccountIdentifier:(id)a3;
- (void)accountStoreDidChange:(id)a3;
- (void)createDirectoryIfNecessaryUsingURL:(id)a3;
- (void)dealloc;
- (void)internalInvalidatePrimaryICloudACAccount;
- (void)invalidateCache;
- (void)performBlockInPersonaContext:(id)a3 forAccountIdentifier:(id)a4;
- (void)primaryICloudACAccount;
- (void)setAccountByIdentifier:(id)a3;
- (void)setAccountIsManagedByIdentifier:(id)a3;
- (void)setAccountStore:(id)a3;
- (void)setCurrentICloudAccountState:(id)a3;
- (void)setPrimaryICloudACAccountValid:(BOOL)a3;
- (void)updateICloudACAccountFromStore;
@end

@implementation ICAccountUtilities

- (BOOL)hasSyncingAccount
{
  v2 = [(ICAccountUtilities *)self accountStore];
  v3 = [v2 accountIdentifiersEnabledForDataclass:*MEMORY[0x263EFACE8]];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (BOOL)isManagedACAccountWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = objc_opt_class();
  v7 = [(ICAccountUtilities *)v5 accountIsManagedByIdentifier];
  v8 = [v7 objectForKeyedSubscript:v4];
  v9 = ICDynamicCast(v6, (uint64_t)v8);

  if (v9)
  {
    LOBYTE(v10) = [v9 BOOLValue];
  }
  else
  {
    v11 = [(ICAccountUtilities *)v5 accountStore];
    v12 = [v11 accountWithIdentifier:v4];

    if (objc_msgSend(v12, "ic_isManagedAppleID")) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = [v12 MCIsManaged];
    }
    v13 = [NSNumber numberWithBool:v10];
    v14 = [(ICAccountUtilities *)v5 accountIsManagedByIdentifier];
    [v14 setObject:v13 forKeyedSubscript:v4];
  }
  objc_sync_exit(v5);

  return v10;
}

- (NSMutableDictionary)accountIsManagedByIdentifier
{
  return self->_accountIsManagedByIdentifier;
}

void __66__ICAccountUtilities_applicationDocumentsURLForAccountIdentifier___block_invoke_2(uint64_t a1)
{
  v2 = ICGroupContainerIdentifier();
  uint64_t v3 = +[ICPaths URLForGroupContainerWithIdentifier:v2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (*(void *)(a1 + 32))
  {
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    v7 = (void *)applicationDocumentsURLForAccountIdentifier__urlsByAccountIdentifier;
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6);
  }
}

- (void)performBlockInPersonaContext:(id)a3 forAccountIdentifier:(id)a4
{
  uint64_t v6 = (void (**)(void))a3;
  id v7 = a4;
  v8 = [(ICAccountUtilities *)self iCloudACAccountWithIdentifier:v7];
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = [v8 accountPropertyForKey:*MEMORY[0x263EFADE0]];
  v11 = ICDynamicCast(v9, (uint64_t)v10);

  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x2050000000;
  v12 = (void *)getUMUserManagerClass_softClass;
  uint64_t v43 = getUMUserManagerClass_softClass;
  if (!getUMUserManagerClass_softClass)
  {
    uint64_t v35 = MEMORY[0x263EF8330];
    uint64_t v36 = 3221225472;
    v37 = __getUMUserManagerClass_block_invoke;
    v38 = &unk_2640CD368;
    v39 = &v40;
    __getUMUserManagerClass_block_invoke((uint64_t)&v35);
    v12 = (void *)v41[3];
  }
  id v13 = v12;
  _Block_object_dispose(&v40, 8);
  v14 = [v13 sharedManager];
  v15 = [v14 currentPersona];
  if ([v11 length]
    || !v11
    && ([v14 currentUser],
        v20 = objc_claimAutoreleasedReturnValue(),
        uint64_t v21 = [v20 userType],
        v20,
        v21 != 1))
  {
    v16 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[ICAccountUtilities performBlockInPersonaContext:forAccountIdentifier:].cold.5();
    }

    id v34 = 0;
    v17 = (void *)[v15 copyCurrentPersonaContextWithError:&v34];
    id v18 = v34;
    if (!v18)
    {
      id v25 = (id)[v15 generateAndRestorePersonaContextWithPersonaUniqueString:v11];
      v6[2](v6);
      id v26 = (id)[v15 restorePersonaWithSavedPersonaContext:v17];
      goto LABEL_19;
    }
    v19 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[ICAccountUtilities performBlockInPersonaContext:forAccountIdentifier:]();
    }
LABEL_9:

    v6[2](v6);
LABEL_19:

    goto LABEL_20;
  }
  int v22 = [v15 isProxy];
  v23 = os_log_create("com.apple.notes", "Accounts");
  BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG);
  if (v22)
  {
    if (v24) {
      -[ICAccountUtilities performBlockInPersonaContext:forAccountIdentifier:]();
    }

    id v33 = 0;
    v17 = (void *)[v15 copyCurrentPersonaContextWithError:&v33];
    id v18 = v33;
    if (!v18)
    {
      uint64_t v40 = 0;
      v41 = &v40;
      uint64_t v42 = 0x2050000000;
      v27 = (void *)getUMUserPersonaAttributesClass_softClass;
      uint64_t v43 = getUMUserPersonaAttributesClass_softClass;
      if (!getUMUserPersonaAttributesClass_softClass)
      {
        uint64_t v35 = MEMORY[0x263EF8330];
        uint64_t v36 = 3221225472;
        v37 = __getUMUserPersonaAttributesClass_block_invoke;
        v38 = &unk_2640CD368;
        v39 = &v40;
        __getUMUserPersonaAttributesClass_block_invoke((uint64_t)&v35);
        v27 = (void *)v41[3];
      }
      id v28 = v27;
      _Block_object_dispose(&v40, 8);
      v29 = [v28 personaAttributesForPersonaType:0];
      v30 = [v29 userPersonaUniqueString];
      id v31 = (id)[v15 generateAndRestorePersonaContextWithPersonaUniqueString:v30];

      v6[2](v6);
      id v32 = (id)[v15 restorePersonaWithSavedPersonaContext:v17];

      goto LABEL_19;
    }
    v19 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[ICAccountUtilities performBlockInPersonaContext:forAccountIdentifier:]();
    }
    goto LABEL_9;
  }
  if (v24) {
    -[ICAccountUtilities performBlockInPersonaContext:forAccountIdentifier:]();
  }

  v6[2](v6);
LABEL_20:
}

- (void)performBlockInPersonaContext:forAccountIdentifier:.cold.5()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_20C263000, v0, OS_LOG_TYPE_DEBUG, "Adopting persona {persona: %@, accountID: %@}", v1, 0x16u);
}

- (id)iCloudACAccountWithIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    v5 = self;
    objc_sync_enter(v5);
    uint64_t v6 = [(ICAccountUtilities *)v5 accountByIdentifier];
    id v7 = [v6 objectForKeyedSubscript:v4];

    if (!v7)
    {
      v8 = [(ICAccountUtilities *)v5 accountStore];
      uint64_t v9 = [v8 accountWithIdentifier:v4];
      uint64_t v10 = [(ICAccountUtilities *)v5 accountByIdentifier];
      [v10 setObject:v9 forKeyedSubscript:v4];
    }
    v11 = [(ICAccountUtilities *)v5 accountByIdentifier];
    v12 = [v11 objectForKeyedSubscript:v4];

    objc_sync_exit(v5);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (NSMutableDictionary)accountByIdentifier
{
  return self->_accountByIdentifier;
}

- (id)allICloudACAccounts
{
  uint64_t v2 = [(ICAccountUtilities *)self accountStore];
  uint64_t v3 = objc_msgSend(v2, "aa_appleAccounts");

  return v3;
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

+ (id)sharedInstance
{
  uint64_t block = MEMORY[0x263EF8330];
  uint64_t v5 = 3221225472;
  uint64_t v6 = __36__ICAccountUtilities_sharedInstance__block_invoke;
  id v7 = &__block_descriptor_40_e5_v8__0l;
  id v8 = a1;
  if (sharedInstance_once != -1) {
    dispatch_once(&sharedInstance_once, &block);
  }
  uint64_t v2 = (void *)sharedInstance_sharedInstance;
  if (!sharedInstance_sharedInstance)
  {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((sharedInstance) != nil)", "+[ICAccountUtilities sharedInstance]", 1, 0, @"Expected non-nil value for '%s'", "sharedInstance", block, v5, v6, v7, v8);
    uint64_t v2 = (void *)sharedInstance_sharedInstance;
  }
  return v2;
}

- (id)applicationDocumentsURLForAccountIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  if (applicationDocumentsURLForAccountIdentifier__onceToken != -1) {
    dispatch_once(&applicationDocumentsURLForAccountIdentifier__onceToken, &__block_literal_global_0);
  }
  id v5 = (id)applicationDocumentsURLForAccountIdentifier__urlsByAccountIdentifier;
  objc_sync_enter(v5);
  uint64_t v6 = [(id)applicationDocumentsURLForAccountIdentifier__urlsByAccountIdentifier objectForKeyedSubscript:v4];
  id v7 = (void *)v14[5];
  v14[5] = v6;

  if (!v14[5])
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __66__ICAccountUtilities_applicationDocumentsURLForAccountIdentifier___block_invoke_2;
    v10[3] = &unk_2640CD2F8;
    v12 = &v13;
    id v11 = v4;
    [(ICAccountUtilities *)self performBlockInPersonaContext:v10 forAccountIdentifier:v11];
  }
  objc_sync_exit(v5);

  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

uint64_t __66__ICAccountUtilities_applicationDocumentsURLForAccountIdentifier___block_invoke()
{
  applicationDocumentsURLForAccountIdentifier__urlsByAccountIdentifier = (uint64_t)objc_alloc_init(MEMORY[0x263EFF9A0]);
  return MEMORY[0x270F9A758]();
}

uint64_t __36__ICAccountUtilities_sharedInstance__block_invoke(uint64_t result)
{
  if (!sharedInstance_sharedInstance)
  {
    sharedInstance_sharedInstance = (uint64_t)objc_alloc_init(*(Class *)(result + 32));
    return MEMORY[0x270F9A758]();
  }
  return result;
}

- (ICAccountUtilities)init
{
  return (ICAccountUtilities *)[(ICAccountUtilities *)self initForObservingAccountStoreChanges:1];
}

- (id)initForObservingAccountStoreChanges:(BOOL)a3
{
  BOOL v3 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ICAccountUtilities;
  id v4 = [(ICAccountUtilities *)&v13 init];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x263EFB210] defaultStore];
    accountStore = v4->_accountStore;
    v4->_accountStore = (ACAccountStore *)v5;

    id v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    accountByIdentifier = v4->_accountByIdentifier;
    v4->_accountByIdentifier = v7;

    uint64_t v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    accountIsManagedByIdentifier = v4->_accountIsManagedByIdentifier;
    v4->_accountIsManagedByIdentifier = v9;

    if (v3)
    {
      id v11 = [MEMORY[0x263F08A00] defaultCenter];
      [v11 addObserver:v4 selector:sel_accountStoreDidChange_ name:*MEMORY[0x263EFB060] object:v4->_accountStore];
    }
  }
  return v4;
}

- (void)dealloc
{
  BOOL v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ICAccountUtilities;
  [(ICAccountUtilities *)&v4 dealloc];
}

- (void)updateICloudACAccountFromStore
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  BOOL v3 = [a1 currentICloudAccountState];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_20C263000, a2, OS_LOG_TYPE_DEBUG, "Updated iCloud Apple Account from store {state: %@}", v4, 0xCu);
}

- (ACAccount)primaryICloudACAccount
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if ([(ICAccountUtilities *)v2 isPrimaryICloudACAccountValid])
  {
    BOOL v3 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      -[ICAccountUtilities primaryICloudACAccount](v3);
    }
  }
  else
  {
    [(ICAccountUtilities *)v2 updateICloudACAccountFromStore];
  }
  objc_super v4 = v2->_primaryICloudACAccount;
  objc_sync_exit(v2);

  return v4;
}

- (id)applicationDataContainerURLForAccountIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  if (applicationDataContainerURLForAccountIdentifier__onceToken != -1) {
    dispatch_once(&applicationDataContainerURLForAccountIdentifier__onceToken, &__block_literal_global_26);
  }
  id v5 = (id)applicationDataContainerURLForAccountIdentifier__urlsByAccountIdentifier;
  objc_sync_enter(v5);
  uint64_t v6 = [(id)applicationDataContainerURLForAccountIdentifier__urlsByAccountIdentifier objectForKeyedSubscript:v4];
  id v7 = (void *)v14[5];
  v14[5] = v6;

  if (!v14[5])
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __70__ICAccountUtilities_applicationDataContainerURLForAccountIdentifier___block_invoke_2;
    v10[3] = &unk_2640CD2F8;
    v12 = &v13;
    id v11 = v4;
    [(ICAccountUtilities *)self performBlockInPersonaContext:v10 forAccountIdentifier:v11];
  }
  objc_sync_exit(v5);

  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

uint64_t __70__ICAccountUtilities_applicationDataContainerURLForAccountIdentifier___block_invoke()
{
  applicationDataContainerURLForAccountIdentifier__urlsByAccountIdentifier = (uint64_t)objc_alloc_init(MEMORY[0x263EFF9A0]);
  return MEMORY[0x270F9A758]();
}

void __70__ICAccountUtilities_applicationDataContainerURLForAccountIdentifier___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = +[ICPaths applicationDataContainerURL];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (*(void *)(a1 + 32))
  {
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v6 = (void *)applicationDataContainerURLForAccountIdentifier__urlsByAccountIdentifier;
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v5);
  }
}

- (id)temporaryDirectoryURLForAccountIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  if (temporaryDirectoryURLForAccountIdentifier__onceToken != -1) {
    dispatch_once(&temporaryDirectoryURLForAccountIdentifier__onceToken, &__block_literal_global_28);
  }
  id v5 = (id)temporaryDirectoryURLForAccountIdentifier__urlsByAccountIdentifier;
  objc_sync_enter(v5);
  uint64_t v6 = [(id)temporaryDirectoryURLForAccountIdentifier__urlsByAccountIdentifier objectForKeyedSubscript:v4];
  id v7 = (void *)v14[5];
  v14[5] = v6;

  if (!v14[5])
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __64__ICAccountUtilities_temporaryDirectoryURLForAccountIdentifier___block_invoke_2;
    v10[3] = &unk_2640CD320;
    void v10[4] = self;
    id v11 = v4;
    v12 = &v13;
    [(ICAccountUtilities *)self performBlockInPersonaContext:v10 forAccountIdentifier:v11];
  }
  objc_sync_exit(v5);

  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

uint64_t __64__ICAccountUtilities_temporaryDirectoryURLForAccountIdentifier___block_invoke()
{
  temporaryDirectoryURLForAccountIdentifier__urlsByAccountIdentifier = (uint64_t)objc_alloc_init(MEMORY[0x263EFF9A0]);
  return MEMORY[0x270F9A758]();
}

void __64__ICAccountUtilities_temporaryDirectoryURLForAccountIdentifier___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) applicationDocumentsURLForAccountIdentifier:*(void *)(a1 + 40)];
  uint64_t v3 = [MEMORY[0x263F08850] defaultManager];
  id v13 = 0;
  uint64_t v4 = [v3 URLForDirectory:99 inDomain:1 appropriateForURL:v2 create:1 error:&v13];
  id v5 = v13;
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v4;

  if (v5)
  {
    id v8 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __64__ICAccountUtilities_temporaryDirectoryURLForAccountIdentifier___block_invoke_2_cold_1();
    }

    uint64_t v9 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v10 = [v9 temporaryDirectory];
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
  if (*(void *)(a1 + 40)) {
    objc_msgSend((id)temporaryDirectoryURLForAccountIdentifier__urlsByAccountIdentifier, "setObject:forKeyedSubscript:", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
  }
}

- (BOOL)primaryICloudAccountEnabled
{
  uint64_t v2 = [(ICAccountUtilities *)self primaryICloudACAccount];
  char v3 = [v2 isEnabledForDataclass:*MEMORY[0x263EFACE8]];

  return v3;
}

- (BOOL)didChooseToMigratePrimaryICloudAccount
{
  uint64_t v2 = [(ICAccountUtilities *)self primaryICloudACAccount];
  char v3 = [v2 objectForKeyedSubscript:@"notesIsUsingCloudKit"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (void)internalInvalidatePrimaryICloudACAccount
{
  [(ICAccountUtilities *)self setPrimaryICloudACAccountValid:0];
  primaryICloudACAccount = self->_primaryICloudACAccount;
  self->_primaryICloudACAccount = 0;

  [(ICAccountUtilities *)self setCurrentICloudAccountState:0];
}

- (void)invalidateCache
{
  obj = self;
  objc_sync_enter(obj);
  [(ICAccountUtilities *)obj internalInvalidatePrimaryICloudACAccount];
  uint64_t v2 = [(ICAccountUtilities *)obj accountByIdentifier];
  [v2 removeAllObjects];

  char v3 = [(ICAccountUtilities *)obj accountIsManagedByIdentifier];
  [v3 removeAllObjects];

  objc_sync_exit(obj);
}

- (void)accountStoreDidChange:(id)a3
{
  id v8 = a3;
  char v4 = self;
  objc_sync_enter(v4);
  id v5 = [(ICAccountUtilities *)v4 currentICloudAccountState];
  uint64_t v6 = (void *)[v5 copy];

  [(ICAccountUtilities *)v4 invalidateCache];
  objc_sync_exit(v4);

  id v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 postNotificationName:@"ICAccountUtilitiesStoreDidChangeNotification" object:v4 userInfo:v6];
}

- (void)createDirectoryIfNecessaryUsingURL:(id)a3
{
  id v3 = a3;
  char v12 = 0;
  char v4 = [MEMORY[0x263F08850] defaultManager];
  id v5 = [v3 path];
  int v6 = [v4 fileExistsAtPath:v5 isDirectory:&v12];

  if (v6) {
    BOOL v7 = v12 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    id v8 = [MEMORY[0x263F08850] defaultManager];
    id v11 = 0;
    [v8 createDirectoryAtURL:v3 withIntermediateDirectories:0 attributes:0 error:&v11];
    id v9 = v11;

    if (v9)
    {
      uint64_t v10 = os_log_create("com.apple.notes", "Accounts");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[ICAccountUtilities createDirectoryIfNecessaryUsingURL:]();
      }
    }
  }
}

+ (void)registerStateHandler
{
}

id __42__ICAccountUtilities_registerStateHandler__block_invoke()
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v26 = [MEMORY[0x263EFF9A0] dictionary];
  os_log_t v0 = [MEMORY[0x263EFB210] defaultStore];
  uint64_t v25 = *MEMORY[0x263EFACE8];
  objc_msgSend(v0, "accountIdentifiersEnabledForDataclass:");
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v28 != v3) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        int v6 = [v0 accountWithIdentifier:v5];
        if (v6)
        {
          BOOL v7 = [MEMORY[0x263EFF9A0] dictionary];
          id v8 = [v6 accountType];
          uint64_t v9 = [v8 identifier];
          uint64_t v10 = (void *)v9;
          if (v9) {
            id v11 = (__CFString *)v9;
          }
          else {
            id v11 = &stru_26C13B138;
          }
          [v7 setObject:v11 forKeyedSubscript:@"accountType"];

          uint64_t v12 = [v6 username];
          id v13 = (void *)v12;
          if (v12) {
            v14 = (__CFString *)v12;
          }
          else {
            v14 = &stru_26C13B138;
          }
          [v7 setObject:v14 forKeyedSubscript:@"username"];

          uint64_t v15 = objc_msgSend(v6, "aa_personID");
          v16 = (void *)v15;
          if (v15) {
            v17 = (__CFString *)v15;
          }
          else {
            v17 = &stru_26C13B138;
          }
          [v7 setObject:v17 forKeyedSubscript:@"dsid"];

          if (objc_msgSend(v6, "aa_isManagedAppleID")) {
            id v18 = @"YES";
          }
          else {
            id v18 = @"NO";
          }
          [v7 setObject:v18 forKeyedSubscript:@"isManaged"];
          v19 = [v6 parentAccountIdentifier];

          if (v19)
          {
            v20 = [v6 parentAccountIdentifier];
            [v7 setObject:v20 forKeyedSubscript:@"parentAccountIdentifier"];
          }
          uint64_t v21 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "ic_isNotesMigrated"));
          [v7 setObject:v21 forKeyedSubscript:@"notesMigrated"];

          int v22 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "isEnabledForDataclass:", v25));
          [v7 setObject:v22 forKeyedSubscript:@"notesEnabled"];

          [v26 setObject:v7 forKeyedSubscript:v5];
        }
      }
      uint64_t v2 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v2);
  }

  return v26;
}

- (void)setAccountStore:(id)a3
{
}

- (NSDictionary)currentICloudAccountState
{
  return self->_currentICloudAccountState;
}

- (void)setCurrentICloudAccountState:(id)a3
{
}

- (void)setAccountByIdentifier:(id)a3
{
}

- (void)setAccountIsManagedByIdentifier:(id)a3
{
}

- (BOOL)isPrimaryICloudACAccountValid
{
  return self->_primaryICloudACAccountValid;
}

- (void)setPrimaryICloudACAccountValid:(BOOL)a3
{
  self->_primaryICloudACAccountValid = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountIsManagedByIdentifier, 0);
  objc_storeStrong((id *)&self->_accountByIdentifier, 0);
  objc_storeStrong((id *)&self->_currentICloudAccountState, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_primaryICloudACAccount, 0);
}

- (void)primaryICloudACAccount
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_20C263000, log, OS_LOG_TYPE_DEBUG, "Primary iCloud Apple Account is valid — not updating", v1, 2u);
}

void __64__ICAccountUtilities_temporaryDirectoryURLForAccountIdentifier___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20C263000, v0, v1, "Error creating temporary directory — falling back to system's temporary directory {error: %@}", v2, v3, v4, v5, v6);
}

- (void)performBlockInPersonaContext:forAccountIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20C263000, v0, v1, "Failed to save persona context — using current persona {error: %@}", v2, v3, v4, v5, v6);
}

- (void)performBlockInPersonaContext:forAccountIdentifier:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_20C263000, v0, OS_LOG_TYPE_DEBUG, "Adopting personal persona {accountID: %@}", v1, 0xCu);
}

- (void)performBlockInPersonaContext:forAccountIdentifier:.cold.3()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_20C263000, v0, OS_LOG_TYPE_DEBUG, "Using default persona {accountID: %@}", v1, 0xCu);
}

- (void)createDirectoryIfNecessaryUsingURL:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_20C263000, v0, OS_LOG_TYPE_ERROR, "Could not create temporary directory {url: %@, error: %@}", v1, 0x16u);
}

@end