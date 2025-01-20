@interface RMUIConfigurationInterface
- (ACAccount)rmAccount;
- (NSArray)declarationsPayloadIdentifiers;
- (NSArray)privPluginSectionViewModels;
- (NSArray)privPluginViewModels;
- (NSArray)privProfileViewModels;
- (NSSet)filterDeclarationIdentifiers;
- (NSString)mdmProfileIdentifier;
- (NSString)passcodeDeclarationsHeading;
- (NSString)pluginDeclarationsHeading;
- (NSString)profileDeclarationsHeading;
- (NSString)scopeHeading;
- (RMObserverStore)observerStore;
- (RMUIConfigurationInterface)initWithAccount:(id)a3 scope:(int64_t)a4;
- (RMUIConfigurationInterface)initWithAccount:(id)a3 scope:(int64_t)a4 initialLoad:(BOOL)a5;
- (RMUIConfigurationInterface)initWithDeclarationsPayloadIdentifier:(id)a3 scope:(int64_t)a4;
- (RMUIConfigurationInterface)initWithDeclarationsPayloadIdentifier:(id)a3 scope:(int64_t)a4 initialLoad:(BOOL)a5;
- (RMUIConfigurationInterface)initWithDeclarationsPayloadIdentifiers:(id)a3 scope:(int64_t)a4 initialLoad:(BOOL)a5;
- (RMUIConfigurationInterface)initWithMDMProfileIdentifier:(id)a3 scope:(int64_t)a4;
- (RMUIConfigurationInterface)initWithMDMProfileIdentifier:(id)a3 scope:(int64_t)a4 initialLoad:(BOOL)a5;
- (RMUIConfigurationInterface)initWithScope:(int64_t)a3;
- (RMUIConfigurationInterface)initWithStore:(id)a3;
- (RMUILegacyProfilesViewModelProvider)legacyProfilesProvider;
- (RMUIPluginViewModelProvider)pluginProvider;
- (id)accountDeclarationsHeading;
- (id)initForTest:(int64_t)a3;
- (id)viewModels;
- (int64_t)_rmManagementScope;
- (int64_t)_rmStoreScope;
- (int64_t)scope;
- (void)_activateConfiguration:(id)a3 observerStore:(id)a4 completionHandler:(id)a5;
- (void)_deactivateConfiguration:(id)a3 observerStore:(id)a4 completionHandler:(id)a5;
- (void)_loadObserverStoreForDDMWithCompletion:(id)a3;
- (void)_loadObserverStoreForDeclarationsPayloadWithCompletion:(id)a3;
- (void)_loadObserverStoreWithCompletion:(id)a3;
- (void)_reloadUIWithCompletion:(id)a3;
- (void)_reloadViewModelsWithCompletion:(id)a3;
- (void)refreshWithCompletion:(id)a3;
- (void)reloadNotificationPosted:(id)a3;
- (void)setConfigurationActivated:(BOOL)a3 forViewModel:(id)a4 completionHandler:(id)a5;
- (void)setLegacyProfilesProvider:(id)a3;
- (void)setObserverStore:(id)a3;
- (void)setPluginProvider:(id)a3;
- (void)setPrivPluginSectionViewModels:(id)a3;
- (void)setPrivPluginViewModels:(id)a3;
- (void)setPrivProfileViewModels:(id)a3;
@end

@implementation RMUIConfigurationInterface

- (RMUIConfigurationInterface)initWithScope:(int64_t)a3
{
  v15.receiver = self;
  v15.super_class = (Class)RMUIConfigurationInterface;
  v4 = [(RMUIConfigurationInterface *)&v15 init];
  if (v4)
  {
    v5 = [MEMORY[0x263F087C8] defaultCenter];
    [v5 addObserver:v4 selector:sel_reloadNotificationPosted_ name:*MEMORY[0x263F63718] object:0];

    v4->_scope = a3;
    v6 = [[RMUILegacyProfilesViewModelProvider alloc] initWithScope:[(RMUIConfigurationInterface *)v4 _rmStoreScope]];
    legacyProfilesProvider = v4->_legacyProfilesProvider;
    v4->_legacyProfilesProvider = v6;

    uint64_t v8 = objc_opt_new();
    pluginProvider = v4->_pluginProvider;
    v4->_pluginProvider = (RMUIPluginViewModelProvider *)v8;

    privProfileViewModels = v4->_privProfileViewModels;
    v11 = (NSArray *)MEMORY[0x263EFFA68];
    v4->_privProfileViewModels = (NSArray *)MEMORY[0x263EFFA68];

    privPluginSectionViewModels = v4->_privPluginSectionViewModels;
    v4->_privPluginSectionViewModels = v11;

    privPluginViewModels = v4->_privPluginViewModels;
    v4->_privPluginViewModels = v11;
  }
  return v4;
}

- (RMUIConfigurationInterface)initWithStore:(id)a3
{
  id v5 = a3;
  v6 = -[RMUIConfigurationInterface initWithScope:](self, "initWithScope:", [v5 scope]);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_observerStore, a3);
    [(RMUILegacyProfilesViewModelProvider *)v7->_legacyProfilesProvider setObserverStore:v5];
    [(RMUIPluginViewModelProvider *)v7->_pluginProvider setObserverStore:v5];
    [(RMUIConfigurationInterface *)v7 reloadNotificationPosted:0];
  }

  return v7;
}

- (RMUIConfigurationInterface)initWithAccount:(id)a3 scope:(int64_t)a4
{
  return [(RMUIConfigurationInterface *)self initWithAccount:a3 scope:a4 initialLoad:1];
}

- (RMUIConfigurationInterface)initWithAccount:(id)a3 scope:(int64_t)a4 initialLoad:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v10 = [(RMUIConfigurationInterface *)self initWithScope:a4];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_rmAccount, a3);
    if (v5) {
      [(RMUIConfigurationInterface *)v11 reloadNotificationPosted:0];
    }
  }

  return v11;
}

- (RMUIConfigurationInterface)initWithMDMProfileIdentifier:(id)a3 scope:(int64_t)a4
{
  return [(RMUIConfigurationInterface *)self initWithMDMProfileIdentifier:a3 scope:a4 initialLoad:1];
}

- (RMUIConfigurationInterface)initWithMDMProfileIdentifier:(id)a3 scope:(int64_t)a4 initialLoad:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v10 = [(RMUIConfigurationInterface *)self initWithScope:a4];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_mdmProfileIdentifier, a3);
    if (v5) {
      [(RMUIConfigurationInterface *)v11 reloadNotificationPosted:0];
    }
  }

  return v11;
}

- (RMUIConfigurationInterface)initWithDeclarationsPayloadIdentifier:(id)a3 scope:(int64_t)a4
{
  return [(RMUIConfigurationInterface *)self initWithDeclarationsPayloadIdentifier:a3 scope:a4 initialLoad:1];
}

- (RMUIConfigurationInterface)initWithDeclarationsPayloadIdentifier:(id)a3 scope:(int64_t)a4 initialLoad:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v13 = a3;
  uint64_t v8 = (void *)MEMORY[0x263EFF8C0];
  id v9 = a3;
  v10 = [v8 arrayWithObjects:&v13 count:1];

  v11 = -[RMUIConfigurationInterface initWithDeclarationsPayloadIdentifiers:scope:initialLoad:](self, "initWithDeclarationsPayloadIdentifiers:scope:initialLoad:", v10, a4, v5, v13, v14);
  return v11;
}

- (RMUIConfigurationInterface)initWithDeclarationsPayloadIdentifiers:(id)a3 scope:(int64_t)a4 initialLoad:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v10 = [(RMUIConfigurationInterface *)self initWithScope:a4];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_declarationsPayloadIdentifiers, a3);
    if (v5) {
      [(RMUIConfigurationInterface *)v11 reloadNotificationPosted:0];
    }
  }

  return v11;
}

- (id)initForTest:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RMUIConfigurationInterface;
  id result = [(RMUIConfigurationInterface *)&v5 init];
  if (result) {
    *((void *)result + 1) = a3;
  }
  return result;
}

- (id)viewModels
{
  v3 = objc_opt_new();
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __40__RMUIConfigurationInterface_viewModels__block_invoke;
  v10[3] = &unk_2646FEA70;
  id v11 = v3;
  id v4 = v3;
  [(RMUIConfigurationInterface *)self refreshWithCompletion:v10];
  [v4 waitForCompletion];
  privProfileViewModels = self->_privProfileViewModels;
  v6 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_14];
  v7 = [(NSArray *)privProfileViewModels filteredArrayUsingPredicate:v6];

  uint64_t v8 = [[RMUIConfigurationViewModels alloc] initWithProfileViewModels:v7 pluginSectionViewModels:self->_privPluginSectionViewModels pluginViewModels:self->_privPluginViewModels];

  return v8;
}

uint64_t __40__RMUIConfigurationInterface_viewModels__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) complete];
}

uint64_t __40__RMUIConfigurationInterface_viewModels__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isInteractiveProfile] ^ 1;
}

- (int64_t)_rmManagementScope
{
  return [(RMUIConfigurationInterface *)self scope] != 0;
}

- (int64_t)_rmStoreScope
{
  return [(RMUIConfigurationInterface *)self scope] != 0;
}

- (NSString)scopeHeading
{
  if ([(RMUIConfigurationInterface *)self scope]) {
    return (NSString *)@"Device Declarations";
  }
  else {
    return (NSString *)@"User Declarations";
  }
}

- (NSString)profileDeclarationsHeading
{
  return (NSString *)@"Profiles";
}

- (id)accountDeclarationsHeading
{
  return @"Account";
}

- (NSString)pluginDeclarationsHeading
{
  return (NSString *)@"Declarations";
}

- (void)_reloadUIWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__RMUIConfigurationInterface__reloadUIWithCompletion___block_invoke;
  block[3] = &unk_2646FEAB8;
  objc_copyWeak(&v8, &location);
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

uint64_t __54__RMUIConfigurationInterface__reloadUIWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v22 = WeakRetained;
    v3 = [WeakRetained observerStore];

    if (!v3)
    {
      id v4 = [v22 legacyProfilesProvider];
      id v5 = [v4 profileViewModels];
      [v5 removeAllObjects];

      v6 = [v22 pluginProvider];
      id v7 = [v6 pluginSectionViewModels];
      [v7 removeAllObjects];

      id v8 = [v22 pluginProvider];
      id v9 = [v8 pluginViewModels];
      [v9 removeAllObjects];
    }
    [v22 willChangeValueForKey:@"profileViewModels"];
    v10 = [v22 legacyProfilesProvider];
    id v11 = [v10 profileViewModels];
    v12 = (void *)[v11 copy];
    [v22 setPrivProfileViewModels:v12];

    [v22 didChangeValueForKey:@"profileViewModels"];
    [v22 willChangeValueForKey:@"pluginSectionViewModels"];
    id v13 = [v22 pluginProvider];
    uint64_t v14 = [v13 pluginSectionViewModels];
    objc_super v15 = (void *)[v14 copy];
    [v22 setPrivPluginSectionViewModels:v15];

    [v22 didChangeValueForKey:@"pluginSectionViewModels"];
    [v22 willChangeValueForKey:@"pluginViewModels"];
    v16 = [v22 pluginProvider];
    v17 = [v16 pluginViewModels];
    v18 = (void *)[v17 copy];
    [v22 setPrivPluginViewModels:v18];

    [v22 didChangeValueForKey:@"pluginViewModels"];
    v19 = [MEMORY[0x263F087C8] defaultCenter];
    [v19 postNotificationName:@"RMUIConfigurationsDidChangeNotification" object:0];

    uint64_t v20 = *(void *)(a1 + 32);
    if (v20) {
      (*(void (**)(uint64_t, void *))(v20 + 16))(v20, v22);
    }
  }

  return MEMORY[0x270F9A758]();
}

- (void)_reloadViewModelsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  v6 = [(RMUIConfigurationInterface *)self legacyProfilesProvider];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __62__RMUIConfigurationInterface__reloadViewModelsWithCompletion___block_invoke;
  v15[3] = &unk_2646FEA70;
  id v7 = v5;
  v16 = v7;
  [v6 loadProfilesFromConfigurationsWithCompletionHandler:v15];

  dispatch_group_enter(v7);
  id v8 = [(RMUIConfigurationInterface *)self pluginProvider];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __62__RMUIConfigurationInterface__reloadViewModelsWithCompletion___block_invoke_2;
  v13[3] = &unk_2646FEA70;
  uint64_t v14 = v7;
  id v9 = v7;
  [v8 loadPluginsFromConfigurationsWithCompletionHandler:v13];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __62__RMUIConfigurationInterface__reloadViewModelsWithCompletion___block_invoke_3;
  v11[3] = &unk_2646FEAE0;
  v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  dispatch_group_notify(v9, MEMORY[0x263EF83A0], v11);
}

void __62__RMUIConfigurationInterface__reloadViewModelsWithCompletion___block_invoke(uint64_t a1)
{
}

void __62__RMUIConfigurationInterface__reloadViewModelsWithCompletion___block_invoke_2(uint64_t a1)
{
}

uint64_t __62__RMUIConfigurationInterface__reloadViewModelsWithCompletion___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadUIWithCompletion:*(void *)(a1 + 40)];
}

- (void)refreshWithCompletion:(id)a3
{
  id v9 = a3;
  id v4 = [(RMUIConfigurationInterface *)self observerStore];
  if (!v4)
  {
    id v7 = [(RMUIConfigurationInterface *)self mdmProfileIdentifier];
    if (v7
      || ([(RMUIConfigurationInterface *)self rmAccount],
          (id v7 = objc_claimAutoreleasedReturnValue()) != 0))
    {
    }
    else
    {
      id v8 = [(RMUIConfigurationInterface *)self declarationsPayloadIdentifiers];

      if (!v8) {
        goto LABEL_3;
      }
    }
    [(RMUIConfigurationInterface *)self _loadObserverStoreWithCompletion:v9];
    goto LABEL_9;
  }

LABEL_3:
  id v5 = [(RMUIConfigurationInterface *)self observerStore];

  v6 = v9;
  if (!v5) {
    goto LABEL_10;
  }
  [(RMUIConfigurationInterface *)self _reloadViewModelsWithCompletion:v9];
LABEL_9:
  v6 = v9;
LABEL_10:
}

- (void)reloadNotificationPosted:(id)a3
{
}

- (void)_loadObserverStoreWithCompletion:(id)a3
{
  id v5 = a3;
  id v4 = [(RMUIConfigurationInterface *)self declarationsPayloadIdentifiers];

  if (v4) {
    [(RMUIConfigurationInterface *)self _loadObserverStoreForDeclarationsPayloadWithCompletion:v5];
  }
  else {
    [(RMUIConfigurationInterface *)self _loadObserverStoreForDDMWithCompletion:v5];
  }
}

- (void)_loadObserverStoreForDDMWithCompletion:(id)a3
{
  id v4 = a3;
  if (objc_msgSend(MEMORY[0x263F635B8], "isActiveForScope:", -[RMUIConfigurationInterface _rmManagementScope](self, "_rmManagementScope")))
  {
    id v5 = [(RMUIConfigurationInterface *)self mdmProfileIdentifier];
    v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      id v9 = [(RMUIConfigurationInterface *)self rmAccount];
      objc_msgSend(v9, "dmc_managementProfileIdentifier");
      id v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v10 = objc_opt_new();
    [v10 setScheme:@"mdm"];
    [v10 setPath:v7];
    id v11 = [v10 URL];
    objc_initWeak(&location, self);
    id v12 = (void *)MEMORY[0x263F636F0];
    int64_t v13 = [(RMUIConfigurationInterface *)self _rmStoreScope];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __69__RMUIConfigurationInterface__loadObserverStoreForDDMWithCompletion___block_invoke;
    v16[3] = &unk_2646FEB08;
    objc_copyWeak(&v20, &location);
    id v14 = v7;
    id v17 = v14;
    id v19 = v4;
    id v15 = v11;
    id v18 = v15;
    [v12 storesWithScope:v13 completionHandler:v16];

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  else
  {
    id v8 = +[RMUILog configurationInterface];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[RMUIConfigurationInterface _loadObserverStoreForDDMWithCompletion:](v8);
    }

    [(RMUIConfigurationInterface *)self _reloadUIWithCompletion:v4];
  }
}

void __69__RMUIConfigurationInterface__loadObserverStoreForDDMWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!WeakRetained) {
    goto LABEL_21;
  }
  if (!v5)
  {
    id v20 = +[RMUILog configurationInterface];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      __69__RMUIConfigurationInterface__loadObserverStoreForDDMWithCompletion___block_invoke_cold_1();
    }
LABEL_20:

    [WeakRetained _reloadUIWithCompletion:*(void *)(a1 + 48)];
    goto LABEL_21;
  }
  id v21 = v6;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (!v9)
  {
LABEL_11:

LABEL_16:
    id v20 = +[RMUILog configurationInterface];
    id v6 = v21;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      __69__RMUIConfigurationInterface__loadObserverStoreForDDMWithCompletion___block_invoke_cold_2();
    }
    goto LABEL_20;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v23;
LABEL_5:
  uint64_t v12 = 0;
  while (1)
  {
    if (*(void *)v23 != v11) {
      objc_enumerationMutation(v8);
    }
    int64_t v13 = *(void **)(*((void *)&v22 + 1) + 8 * v12);
    id v14 = [v13 enrollmentURL];
    char v15 = [v14 isEqual:*(void *)(a1 + 40)];

    if (v15) {
      break;
    }
    if (v10 == ++v12)
    {
      uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v10) {
        goto LABEL_5;
      }
      goto LABEL_11;
    }
  }
  id v16 = v13;

  if (!v16) {
    goto LABEL_16;
  }
  id v17 = +[RMUILog configurationInterface];
  id v6 = v21;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    __69__RMUIConfigurationInterface__loadObserverStoreForDDMWithCompletion___block_invoke_cold_3(v16);
  }

  [WeakRetained setObserverStore:v16];
  id v18 = [WeakRetained legacyProfilesProvider];
  [v18 setObserverStore:v16];

  id v19 = [WeakRetained pluginProvider];
  [v19 setObserverStore:v16];

  [WeakRetained _reloadViewModelsWithCompletion:*(void *)(a1 + 48)];
LABEL_21:
}

- (void)_loadObserverStoreForDeclarationsPayloadWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x263F636F8], "profileStoreForOwner:scope:", *MEMORY[0x263F63720], -[RMUIConfigurationInterface _rmStoreScope](self, "_rmStoreScope"));
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __85__RMUIConfigurationInterface__loadObserverStoreForDeclarationsPayloadWithCompletion___block_invoke;
  v8[3] = &unk_2646FEB58;
  id v9 = v5;
  id v10 = v4;
  v8[4] = self;
  id v6 = v5;
  id v7 = v4;
  [v6 observerStoreWithCompletionHandler:v8];
}

void __85__RMUIConfigurationInterface__loadObserverStoreForDeclarationsPayloadWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[RMUILog configurationInterface];
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5) {
      __69__RMUIConfigurationInterface__loadObserverStoreForDDMWithCompletion___block_invoke_cold_3(v3);
    }

    [*(id *)(a1 + 32) setObserverStore:v3];
    id v6 = *(void **)(a1 + 40);
    id v7 = [*(id *)(a1 + 32) declarationsPayloadIdentifiers];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __85__RMUIConfigurationInterface__loadObserverStoreForDeclarationsPayloadWithCompletion___block_invoke_47;
    v8[3] = &unk_2646FEB30;
    v8[4] = *(void *)(a1 + 32);
    id v9 = v3;
    id v10 = *(id *)(a1 + 48);
    [v6 declarationIdentifiersForProfilePayloadIdentifiers:v7 completionHandler:v8];
  }
  else
  {
    if (v5) {
      __85__RMUIConfigurationInterface__loadObserverStoreForDeclarationsPayloadWithCompletion___block_invoke_cold_1(a1);
    }

    [*(id *)(a1 + 32) _reloadUIWithCompletion:*(void *)(a1 + 48)];
  }
}

uint64_t __85__RMUIConfigurationInterface__loadObserverStoreForDeclarationsPayloadWithCompletion___block_invoke_47(uint64_t a1, void *a2)
{
  id v4 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = a2;
  id v6 = [v4 legacyProfilesProvider];
  [v6 setObserverStore:v3];

  id v7 = [*(id *)(a1 + 32) legacyProfilesProvider];
  [v7 setFilterDeclarationIdentifiers:v5];

  uint64_t v8 = *(void *)(a1 + 40);
  id v9 = [*(id *)(a1 + 32) pluginProvider];
  [v9 setObserverStore:v8];

  id v10 = [*(id *)(a1 + 32) pluginProvider];
  [v10 setFilterDeclarationIdentifiers:v5];

  uint64_t v11 = *(void **)(a1 + 32);
  uint64_t v12 = *(void *)(a1 + 48);

  return [v11 _reloadViewModelsWithCompletion:v12];
}

- (void)setConfigurationActivated:(BOOL)a3 forViewModel:(id)a4 completionHandler:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v8 toggleViewModel];
  [v10 setToggleState:v6];

  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __87__RMUIConfigurationInterface_setConfigurationActivated_forViewModel_completionHandler___block_invoke;
  v23[3] = &unk_2646FEBA8;
  id v11 = v8;
  id v24 = v11;
  BOOL v26 = v6;
  id v12 = v9;
  id v25 = v12;
  int64_t v13 = (void (**)(void, void, void))MEMORY[0x22A620FE0](v23);
  id v14 = [v11 declaration];
  char v15 = [v14 declarationIdentifier];

  if (!v15)
  {
    id v21 = +[RMUILog configurationInterface];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[RMUIConfigurationInterface setConfigurationActivated:forViewModel:completionHandler:](v6, v21);
    }

    uint64_t v22 = +[RMUIError legacyProfilesNoDeclarationToSetActivated:v6];
    goto LABEL_13;
  }
  id v16 = [(RMUIConfigurationInterface *)self observerStore];

  id v17 = +[RMUILog configurationInterface];
  id v18 = v17;
  if (!v16)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[RMUIConfigurationInterface setConfigurationActivated:forViewModel:completionHandler:]();
    }

    uint64_t v22 = +[RMUIError legacyProfilesNoObserverStoreForDeclarationID:v15];
LABEL_13:
    id v19 = (void *)v22;
    v13[2](v13, 0, v22);
    goto LABEL_16;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    -[RMUIConfigurationInterface setConfigurationActivated:forViewModel:completionHandler:]();
  }

  id v19 = [v11 declaration];
  id v20 = [(RMUIConfigurationInterface *)self observerStore];
  if (v6) {
    [(RMUIConfigurationInterface *)self _activateConfiguration:v19 observerStore:v20 completionHandler:v13];
  }
  else {
    [(RMUIConfigurationInterface *)self _deactivateConfiguration:v19 observerStore:v20 completionHandler:v13];
  }

LABEL_16:
}

void __87__RMUIConfigurationInterface_setConfigurationActivated_forViewModel_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __87__RMUIConfigurationInterface_setConfigurationActivated_forViewModel_completionHandler___block_invoke_2;
  block[3] = &unk_2646FEB80;
  id v11 = v6;
  id v7 = *(id *)(a1 + 32);
  char v15 = *(unsigned char *)(a1 + 48);
  id v12 = v7;
  id v13 = v5;
  id v14 = *(id *)(a1 + 40);
  id v8 = v5;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __87__RMUIConfigurationInterface_setConfigurationActivated_forViewModel_completionHandler___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    BOOL v2 = *(unsigned char *)(a1 + 64) == 0;
    uint64_t v3 = [*(id *)(a1 + 40) toggleViewModel];
    [v3 setToggleState:v2];

    id v4 = [[RMUIInteractiveProfileErrorViewModel alloc] initWithError:*(void *)(a1 + 32) isActivating:*(unsigned __int8 *)(a1 + 64)];
  }
  else
  {
    [*(id *)(a1 + 40) setInteractiveProfileActive:*(unsigned __int8 *)(a1 + 64) profileIdentifier:*(void *)(a1 + 48)];
    id v5 = [MEMORY[0x263F087C8] defaultCenter];
    [v5 postNotificationName:*MEMORY[0x263F63718] object:0 userInfo:0 options:3];

    id v4 = 0;
  }
  id v6 = v4;
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)_activateConfiguration:(id)a3 observerStore:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 declarationIdentifier];
  id v12 = [v8 payloadProfileURL];
  if (v12)
  {
    id v13 = [NSURL URLWithString:v12];
    if (v13)
    {
      id v14 = objc_msgSend(MEMORY[0x263F63708], "newProfileControllerWithPrefix:scope:", *MEMORY[0x263F636D8], -[RMUIConfigurationInterface _rmStoreScope](self, "_rmStoreScope"));
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __85__RMUIConfigurationInterface__activateConfiguration_observerStore_completionHandler___block_invoke;
      v17[3] = &unk_2646FEBD0;
      id v18 = v13;
      id v19 = v10;
      [v14 downloadAndInstallProfileDeclaration:v8 store:v9 fromURL:v18 completionHandler:v17];
    }
    else
    {
      id v16 = +[RMUILog configurationInterface];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[RMUIConfigurationInterface _activateConfiguration:observerStore:completionHandler:]();
      }

      id v14 = +[RMUIError legacyProfilesInvalidURLForDeclarationID:v11 urlString:v12];
      (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v14);
    }
  }
  else
  {
    char v15 = +[RMUILog configurationInterface];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[RMUIConfigurationInterface _activateConfiguration:observerStore:completionHandler:]();
    }

    id v13 = +[RMUIError legacyProfilesInvalidURLForDeclarationID:v11 urlString:&stru_26D81A770];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v13);
  }
}

void __85__RMUIConfigurationInterface__activateConfiguration_observerStore_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = +[RMUILog configurationInterface];
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __85__RMUIConfigurationInterface__activateConfiguration_observerStore_completionHandler___block_invoke_cold_2();
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    __85__RMUIConfigurationInterface__activateConfiguration_observerStore_completionHandler___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_deactivateConfiguration:(id)a3 observerStore:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = (void *)MEMORY[0x263F63708];
  uint64_t v10 = *MEMORY[0x263F636D8];
  id v11 = a4;
  id v12 = a3;
  id v13 = objc_msgSend(v9, "newProfileControllerWithPrefix:scope:", v10, -[RMUIConfigurationInterface _rmStoreScope](self, "_rmStoreScope"));
  id v14 = [v13 profileIdentifierForDeclaration:v12 store:v11];

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __87__RMUIConfigurationInterface__deactivateConfiguration_observerStore_completionHandler___block_invoke;
  v17[3] = &unk_2646FEBF8;
  id v18 = v14;
  id v19 = v8;
  id v15 = v8;
  id v16 = v14;
  [v13 uninstallProfileWithIdentifier:v16 store:v11 completionHandler:v17];
}

void __87__RMUIConfigurationInterface__deactivateConfiguration_observerStore_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[RMUILog configurationInterface];
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __87__RMUIConfigurationInterface__deactivateConfiguration_observerStore_completionHandler___block_invoke_cold_2();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __87__RMUIConfigurationInterface__deactivateConfiguration_observerStore_completionHandler___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (int64_t)scope
{
  return self->_scope;
}

- (ACAccount)rmAccount
{
  return self->_rmAccount;
}

- (NSString)passcodeDeclarationsHeading
{
  return self->_passcodeDeclarationsHeading;
}

- (RMObserverStore)observerStore
{
  return (RMObserverStore *)objc_getProperty(self, a2, 32, 1);
}

- (void)setObserverStore:(id)a3
{
}

- (NSString)mdmProfileIdentifier
{
  return self->_mdmProfileIdentifier;
}

- (NSArray)declarationsPayloadIdentifiers
{
  return self->_declarationsPayloadIdentifiers;
}

- (NSSet)filterDeclarationIdentifiers
{
  return self->_filterDeclarationIdentifiers;
}

- (RMUILegacyProfilesViewModelProvider)legacyProfilesProvider
{
  return self->_legacyProfilesProvider;
}

- (void)setLegacyProfilesProvider:(id)a3
{
}

- (RMUIPluginViewModelProvider)pluginProvider
{
  return self->_pluginProvider;
}

- (void)setPluginProvider:(id)a3
{
}

- (NSArray)privProfileViewModels
{
  return self->_privProfileViewModels;
}

- (void)setPrivProfileViewModels:(id)a3
{
}

- (NSArray)privPluginSectionViewModels
{
  return self->_privPluginSectionViewModels;
}

- (void)setPrivPluginSectionViewModels:(id)a3
{
}

- (NSArray)privPluginViewModels
{
  return self->_privPluginViewModels;
}

- (void)setPrivPluginViewModels:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privPluginViewModels, 0);
  objc_storeStrong((id *)&self->_privPluginSectionViewModels, 0);
  objc_storeStrong((id *)&self->_privProfileViewModels, 0);
  objc_storeStrong((id *)&self->_pluginProvider, 0);
  objc_storeStrong((id *)&self->_legacyProfilesProvider, 0);
  objc_storeStrong((id *)&self->_filterDeclarationIdentifiers, 0);
  objc_storeStrong((id *)&self->_declarationsPayloadIdentifiers, 0);
  objc_storeStrong((id *)&self->_mdmProfileIdentifier, 0);
  objc_storeStrong((id *)&self->_observerStore, 0);
  objc_storeStrong((id *)&self->_passcodeDeclarationsHeading, 0);

  objc_storeStrong((id *)&self->_rmAccount, 0);
}

- (void)_loadObserverStoreForDDMWithCompletion:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_224D14000, log, OS_LOG_TYPE_DEBUG, "DDM not enabled", v1, 2u);
}

void __69__RMUIConfigurationInterface__loadObserverStoreForDDMWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_224D14000, v0, v1, "Failed to find RMObserverStore for MDM profile: %{public}@, %{public}@");
}

void __69__RMUIConfigurationInterface__loadObserverStoreForDDMWithCompletion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_5(&dword_224D14000, v0, v1, "No RMObserverStore for MDM profile: %{public}@", v2, v3, v4, v5, 2u);
}

void __69__RMUIConfigurationInterface__loadObserverStoreForDDMWithCompletion___block_invoke_cold_3(void *a1)
{
  uint64_t v1 = [a1 identifier];
  OUTLINED_FUNCTION_2(&dword_224D14000, v2, v3, "Found RMObserverStore: %{public}@", v4, v5, v6, v7, 2u);
}

void __85__RMUIConfigurationInterface__loadObserverStoreForDeclarationsPayloadWithCompletion___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) declarationsPayloadIdentifiers];
  OUTLINED_FUNCTION_2(&dword_224D14000, v2, v3, "No RMObserverStore for profile payloads: %{public}@", v4, v5, v6, v7, 2u);
}

- (void)setConfigurationActivated:(char)a1 forViewModel:(NSObject *)a2 completionHandler:.cold.1(char a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67240192;
  v2[1] = a1 & 1;
  _os_log_error_impl(&dword_224D14000, a2, OS_LOG_TYPE_ERROR, "No declaration to set activation %{public}d", (uint8_t *)v2, 8u);
}

- (void)setConfigurationActivated:forViewModel:completionHandler:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_224D14000, v0, OS_LOG_TYPE_ERROR, "No observer store to set activation %{public}d for declaration %{public}@", v1, 0x12u);
}

- (void)setConfigurationActivated:forViewModel:completionHandler:.cold.3()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_224D14000, v0, OS_LOG_TYPE_DEBUG, "RMUIConfigurationInterface set activation %{public}d for declaration %{public}@", v1, 0x12u);
}

- (void)_activateConfiguration:observerStore:completionHandler:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_6();
  uint64_t v2 = 0;
  _os_log_error_impl(&dword_224D14000, v0, OS_LOG_TYPE_ERROR, "Missing profile URL for declaration %{public}@: %{public}@", v1, 0x16u);
}

- (void)_activateConfiguration:observerStore:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_224D14000, v0, v1, "Invalid profile URL for declaration %{public}@: %{public}@");
}

void __85__RMUIConfigurationInterface__activateConfiguration_observerStore_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_5(&dword_224D14000, v0, v1, "Installed configuration from %{public}@", v2, v3, v4, v5, 2u);
}

void __85__RMUIConfigurationInterface__activateConfiguration_observerStore_completionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_224D14000, v0, v1, "Error downloading and installing configuration from %{public}@: %{public}@");
}

void __87__RMUIConfigurationInterface__deactivateConfiguration_observerStore_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_5(&dword_224D14000, v0, v1, "Uninstalled profile with identifier %{public}@", v2, v3, v4, v5, 2u);
}

void __87__RMUIConfigurationInterface__deactivateConfiguration_observerStore_completionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_224D14000, v0, v1, "Error uninstalling profile with identifier %{public}@: %{public}@");
}

@end