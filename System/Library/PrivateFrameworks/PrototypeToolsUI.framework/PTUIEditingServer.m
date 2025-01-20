@interface PTUIEditingServer
- (BOOL)forRemoteEditing;
- (PTUIEditingServer)initWithDataSource:(id)a3 delegate:(id)a4 forRemoteEditing:(BOOL)a5;
- (id)_loadRootSettingsOrProxyForDomainID:(id)a3;
- (id)_recipeIDForRow:(int64_t)a3 inSection:(int64_t)a4;
- (id)_settingsDomainGroupModule:(id)a3;
- (id)_settingsDomainRow:(id)a3;
- (id)_settingsGroupRow:(id)a3;
- (id)_settingsSection;
- (id)_testRecipeSection;
- (id)choiceRow:(id)a3 shortTitleForRow:(int64_t)a4 inSection:(int64_t)a5;
- (id)choiceRow:(id)a3 titleForRow:(int64_t)a4 inSection:(int64_t)a5;
- (id)choiceRow:(id)a3 titleForSection:(int64_t)a4;
- (id)choiceRow:(id)a3 valueForRow:(int64_t)a4 inSection:(int64_t)a5;
- (id)displayNameForDomainID:(id)a3;
- (id)domainGroupNames;
- (id)domainIDForRootSettings:(id)a3;
- (id)domainIDsInGroup:(id)a3;
- (id)groupNameForDomainID:(id)a3;
- (id)rootSettingsForDomainID:(id)a3;
- (id)settingsEditingModule;
- (id)testRecipeIDsForDomainID:(id)a3;
- (id)testRecipeSelectionModule;
- (id)titleForTestRecipeID:(id)a3;
- (int64_t)choiceRow:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsForChoiceRow:(id)a3;
- (void)_enumerateDomainsWithOneOrMoreTestRecipesUsingBlock:(id)a3;
- (void)proxyDefinitionChanged:(id)a3;
- (void)reloadDomains;
- (void)reloadTestRecipes;
- (void)setForRemoteEditing:(BOOL)a3;
- (void)settings:(id)a3 changedValueForKeyPath:(id)a4;
- (void)settingsDidRestoreDefaults:(id)a3;
@end

@implementation PTUIEditingServer

- (PTUIEditingServer)initWithDataSource:(id)a3 delegate:(id)a4 forRemoteEditing:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v24.receiver = self;
  v24.super_class = (Class)PTUIEditingServer;
  v10 = [(PTUIEditingServer *)&v24 init];
  v11 = v10;
  if (v10)
  {
    v10->_forRemoteEditing = a5;
    objc_storeWeak((id *)&v10->_dataSource, v8);
    objc_storeWeak((id *)&v11->_delegate, v9);
    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    domainIDsByGroupName = v11->_domainIDsByGroupName;
    v11->_domainIDsByGroupName = v12;

    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    rootSettingsByDomainID = v11->_rootSettingsByDomainID;
    v11->_rootSettingsByDomainID = v14;

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    proxyDefinitionsByDomainID = v11->_proxyDefinitionsByDomainID;
    v11->_proxyDefinitionsByDomainID = v16;

    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    testRecipeIDsByDomainID = v11->_testRecipeIDsByDomainID;
    v11->_testRecipeIDsByDomainID = v18;

    uint64_t v20 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
    moduleControllerByDomainID = v11->_moduleControllerByDomainID;
    v11->_moduleControllerByDomainID = (NSMapTable *)v20;

    v22 = [MEMORY[0x263F08A00] defaultCenter];
    [v22 addObserver:v11 selector:sel_reloadDomains name:*MEMORY[0x263F62340] object:0];
    [v22 addObserver:v11 selector:sel_reloadTestRecipes name:*MEMORY[0x263F62350] object:0];
    [v22 addObserver:v11 selector:sel_proxyDefinitionChanged_ name:*MEMORY[0x263F62348] object:0];
    [(PTUIEditingServer *)v11 reloadDomains];
    [(PTUIEditingServer *)v11 reloadTestRecipes];
  }
  return v11;
}

- (void)reloadDomains
{
  domainGroupNames = self->_domainGroupNames;
  self->_domainGroupNames = 0;

  [(NSMutableDictionary *)self->_domainIDsByGroupName removeAllObjects];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v5 = [WeakRetained domainInfoByID];
  domainInfoByID = self->_domainInfoByID;
  self->_domainInfoByID = v5;

  id v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 postNotificationName:@"PTUIEditingServerDidReloadDomainsNotification" object:0];
}

- (void)reloadTestRecipes
{
  [(NSMutableDictionary *)self->_testRecipeIDsByDomainID removeAllObjects];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v4 = [WeakRetained testRecipeInfoByID];
  testRecipeInfoByID = self->_testRecipeInfoByID;
  self->_testRecipeInfoByID = v4;

  id v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 postNotificationName:@"PTUIEditingServerDidReloadTestRecipesNotification" object:0];
}

- (void)proxyDefinitionChanged:(id)a3
{
  id v12 = a3;
  v4 = [v12 userInfo];
  v5 = [v4 objectForKey:*MEMORY[0x263F62330]];

  id v6 = [(NSMutableDictionary *)self->_rootSettingsByDomainID objectForKey:v5];
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [(NSMutableDictionary *)self->_proxyDefinitionsByDomainID objectForKeyedSubscript:v5];
      id v8 = [v12 userInfo];
      id v9 = [v8 objectForKey:*MEMORY[0x263F62358]];

      if ((BSEqualObjects() & 1) == 0)
      {
        [(NSMutableDictionary *)self->_proxyDefinitionsByDomainID setObject:v9 forKeyedSubscript:v5];
        v10 = [(PTUIEditingServer *)self _loadRootSettingsOrProxyForDomainID:v5];
        [(NSMutableDictionary *)self->_rootSettingsByDomainID setObject:v10 forKeyedSubscript:v5];
        v11 = [MEMORY[0x263F08A00] defaultCenter];
        [v11 postNotificationName:@"PTUIEditingServerDidReloadDomainsNotification" object:0];
      }
    }
  }
}

- (id)rootSettingsForDomainID:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_rootSettingsByDomainID objectForKey:v4];
  if (!v5)
  {
    v5 = [(PTUIEditingServer *)self _loadRootSettingsOrProxyForDomainID:v4];
    [(NSMutableDictionary *)self->_rootSettingsByDomainID setObject:v5 forKey:v4];
  }

  return v5;
}

- (id)domainIDForRootSettings:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v5 = [(NSMutableDictionary *)self->_rootSettingsByDomainID allKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v11 = [(NSMutableDictionary *)self->_rootSettingsByDomainID objectForKeyedSubscript:v10];

        if (v11 == v4)
        {
          id v12 = v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v12 = 0;
LABEL_11:

  return v12;
}

- (id)domainGroupNames
{
  domainGroupNames = self->_domainGroupNames;
  if (!domainGroupNames)
  {
    id v4 = [MEMORY[0x263EFF9C0] set];
    domainInfoByID = self->_domainInfoByID;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __37__PTUIEditingServer_domainGroupNames__block_invoke;
    v11[3] = &unk_26425EAA0;
    id v12 = v4;
    id v6 = v4;
    [(NSDictionary *)domainInfoByID enumerateKeysAndObjectsUsingBlock:v11];
    uint64_t v7 = [v6 allObjects];
    uint64_t v8 = [v7 sortedArrayUsingSelector:sel_compare_];
    id v9 = self->_domainGroupNames;
    self->_domainGroupNames = v8;

    domainGroupNames = self->_domainGroupNames;
  }

  return domainGroupNames;
}

void __37__PTUIEditingServer_domainGroupNames__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v3 = *(void **)(a1 + 32);
  id v4 = [a3 domainGroupName];
  [v3 addObject:v4];
}

- (id)domainIDsInGroup:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_domainIDsByGroupName objectForKey:v4];
  if (!v5)
  {
    id v6 = [MEMORY[0x263EFF980] array];
    domainInfoByID = self->_domainInfoByID;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __38__PTUIEditingServer_domainIDsInGroup___block_invoke;
    v12[3] = &unk_26425EAC8;
    id v8 = v4;
    id v13 = v8;
    id v14 = v6;
    id v9 = v6;
    [(NSDictionary *)domainInfoByID enumerateKeysAndObjectsUsingBlock:v12];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __38__PTUIEditingServer_domainIDsInGroup___block_invoke_2;
    v11[3] = &unk_26425EAF0;
    void v11[4] = self;
    v5 = [v9 sortedArrayUsingComparator:v11];
    [(NSMutableDictionary *)self->_domainIDsByGroupName setObject:v5 forKey:v8];
  }

  return v5;
}

void __38__PTUIEditingServer_domainIDsInGroup___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  v5 = [a3 domainGroupName];
  int v6 = [v5 isEqualToString:*(void *)(a1 + 32)];

  if (v6) {
    [*(id *)(a1 + 40) addObject:v7];
  }
}

uint64_t __38__PTUIEditingServer_domainIDsInGroup___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = *(void **)(*(void *)(a1 + 32) + 24);
  id v6 = a3;
  id v7 = [v5 objectForKeyedSubscript:a2];
  id v8 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:v6];

  id v9 = [v7 domainName];
  v10 = [v8 domainName];
  uint64_t v11 = [v9 compare:v10];

  return v11;
}

- (id)displayNameForDomainID:(id)a3
{
  v3 = [(NSDictionary *)self->_domainInfoByID objectForKeyedSubscript:a3];
  id v4 = [v3 domainName];

  return v4;
}

- (id)groupNameForDomainID:(id)a3
{
  v3 = [(NSDictionary *)self->_domainInfoByID objectForKeyedSubscript:a3];
  id v4 = [v3 domainGroupName];

  return v4;
}

- (id)testRecipeIDsForDomainID:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_testRecipeIDsByDomainID objectForKey:v4];
  if (!v5)
  {
    id v6 = [MEMORY[0x263EFF980] array];
    testRecipeInfoByID = self->_testRecipeInfoByID;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __46__PTUIEditingServer_testRecipeIDsForDomainID___block_invoke;
    v12[3] = &unk_26425EB18;
    id v8 = v4;
    id v13 = v8;
    id v14 = v6;
    id v9 = v6;
    [(NSDictionary *)testRecipeInfoByID enumerateKeysAndObjectsUsingBlock:v12];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __46__PTUIEditingServer_testRecipeIDsForDomainID___block_invoke_2;
    v11[3] = &unk_26425EAF0;
    void v11[4] = self;
    v5 = [v9 sortedArrayUsingComparator:v11];
    [(NSMutableDictionary *)self->_testRecipeIDsByDomainID setObject:v5 forKey:v8];
  }

  return v5;
}

void __46__PTUIEditingServer_testRecipeIDsForDomainID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  v5 = [a3 domainIdentifier];
  int v6 = [v5 isEqualToString:*(void *)(a1 + 32)];

  if (v6) {
    [*(id *)(a1 + 40) addObject:v7];
  }
}

uint64_t __46__PTUIEditingServer_testRecipeIDsForDomainID___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = *(void **)(*(void *)(a1 + 32) + 32);
  id v6 = a3;
  id v7 = [v5 objectForKeyedSubscript:a2];
  id v8 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:v6];

  id v9 = [v7 title];
  v10 = [v8 title];
  uint64_t v11 = [v9 compare:v10];

  return v11;
}

- (id)titleForTestRecipeID:(id)a3
{
  v3 = [(NSDictionary *)self->_testRecipeInfoByID objectForKeyedSubscript:a3];
  id v4 = [v3 title];

  return v4;
}

- (id)testRecipeSelectionModule
{
  v7[1] = *MEMORY[0x263EF8340];
  v2 = [(PTUIEditingServer *)self _testRecipeSection];
  v3 = (void *)MEMORY[0x263F622D8];
  v7[0] = v2;
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  v5 = [v3 moduleWithTitle:0 contents:v4];

  return v5;
}

- (id)settingsEditingModule
{
  v7[1] = *MEMORY[0x263EF8340];
  v2 = [(PTUIEditingServer *)self _settingsSection];
  v3 = (void *)MEMORY[0x263F622D8];
  v7[0] = v2;
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  v5 = [v3 moduleWithTitle:0 contents:v4];

  return v5;
}

- (void)settings:(id)a3 changedValueForKeyPath:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(PTUIEditingServer *)self domainIDForRootSettings:v10];
  if (v7)
  {
    id v8 = [v10 _archiveValueForKeyPath:v6];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained applyArchiveValue:v8 forRootSettingsKeyPath:v6 domainID:v7];
  }
}

- (void)settingsDidRestoreDefaults:(id)a3
{
  id v5 = [(PTUIEditingServer *)self domainIDForRootSettings:a3];
  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained restoreDefaultValuesForDomainID:v5];
  }
}

- (id)_loadRootSettingsOrProxyForDomainID:(id)a3
{
  id v4 = a3;
  id v5 = [(NSDictionary *)self->_domainInfoByID objectForKeyedSubscript:v4];
  [v5 loadSettingsClassBundleIfNecessary];
  id v6 = [(NSMutableDictionary *)self->_proxyDefinitionsByDomainID objectForKeyedSubscript:v4];
  if (v6
    || (id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource),
        [WeakRetained rootSettingsProxyDefinitionForDomainID:v4],
        id v6 = objc_claimAutoreleasedReturnValue(),
        WeakRetained,
        [(NSMutableDictionary *)self->_proxyDefinitionsByDomainID setObject:v6 forKeyedSubscript:v4], v6))
  {
    uint64_t v8 = [MEMORY[0x263F622E8] settingsOrProxyWithDefinition:v6];
LABEL_4:
    id v9 = (void *)v8;

    goto LABEL_5;
  }
  id v14 = [v5 settingsClassName];
  Class v15 = NSClassFromString(v14);

  if (self->_forRemoteEditing
    || !v15
    || ![(objc_class *)v15 isSubclassOfClass:objc_opt_class()])
  {
    id v6 = [MEMORY[0x263F622F0] definitionForSettingsClass:objc_opt_class()];
    uint64_t v8 = [MEMORY[0x263F622E8] proxyWithDefinition:v6];
    goto LABEL_4;
  }
  id v9 = (void *)[[v15 alloc] initWithDefaultValues];
LABEL_5:
  id v10 = objc_loadWeakRetained((id *)&self->_dataSource);
  uint64_t v11 = [v10 rootSettingsArchiveForDomainID:v4];

  if (v11) {
    [v9 restoreFromArchiveDictionary:v11];
  }
  [v9 addKeyPathObserver:self];
  [v9 _setRestoreDefaultsObserver:self];
  [v9 _setObservationEnabled:1];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __57__PTUIEditingServer__loadRootSettingsOrProxyForDomainID___block_invoke;
  v16[3] = &unk_26425EB40;
  v16[4] = self;
  id v17 = v4;
  id v12 = v4;
  _RecursivelyObserveOutletsForSettingsAtKeyPathWithBlock(v9, 0, v16);

  return v9;
}

void __57__PTUIEditingServer__loadRootSettingsOrProxyForDomainID___block_invoke(uint64_t a1, void *a2)
{
  v3 = (id *)(*(void *)(a1 + 32) + 16);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained invokeOutletAtKeyPath:v4 domainID:*(void *)(a1 + 40)];
}

- (id)_testRecipeSection
{
  v18[1] = *MEMORY[0x263EF8340];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __39__PTUIEditingServer__testRecipeSection__block_invoke;
  v17[3] = &unk_26425EB68;
  v17[4] = self;
  v3 = (void *)MEMORY[0x2166C6A80](v17, a2);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __39__PTUIEditingServer__testRecipeSection__block_invoke_2;
  v16[3] = &unk_26425EB90;
  v16[4] = self;
  id v4 = (void *)MEMORY[0x2166C6A80](v16);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __39__PTUIEditingServer__testRecipeSection__block_invoke_3;
  v15[3] = &unk_26425EBB8;
  v15[4] = self;
  id v5 = (void *)MEMORY[0x2166C6A80](v15);
  id v6 = [MEMORY[0x263F622A8] rowWithTitle:@"Test Recipe" valueGetter:v3 valueSetter:v4];
  [v6 setDataSource:self];
  id v7 = (void *)MEMORY[0x263F622D8];
  v18[0] = v6;
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
  id v9 = [v7 sectionWithRows:v8];

  [v9 setFooterTextGetter:v5];
  id v10 = [MEMORY[0x263F08A00] defaultCenter];
  [v10 addObserver:v9 selector:sel_reloadSection name:*MEMORY[0x263F62338] object:0];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __39__PTUIEditingServer__testRecipeSection__block_invoke_4;
  v13[3] = &unk_26425EBE0;
  id v14 = v10;
  id v11 = v10;
  [v9 setUnregisterBlock:v13];

  return v9;
}

__CFString *__39__PTUIEditingServer__testRecipeSection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  v2 = [WeakRetained activeTestRecipeID];

  if (v2) {
    v3 = v2;
  }
  else {
    v3 = @"__NoTestRecipe__";
  }
  id v4 = v3;

  return v4;
}

void __39__PTUIEditingServer__testRecipeSection__block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 isEqualToString:@"__NoTestRecipe__"])
  {

    id v4 = 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  [WeakRetained setActiveTestRecipeID:v4];
}

id __39__PTUIEditingServer__testRecipeSection__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  v3 = [WeakRetained activeTestRecipeID];

  if (v3)
  {
    id v4 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:v3];
    id v5 = [v4 recipeDescription];
    id v6 = [v4 events];
    id v7 = PTPrototypingEventsDescription();

    uint64_t v8 = [NSString stringWithFormat:@"Active test recipe \"%@\" is consuming %@.", v5, v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

uint64_t __39__PTUIEditingServer__testRecipeSection__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeObserver:a2 name:*MEMORY[0x263F62338] object:0];
}

- (id)_settingsSection
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF980] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(PTUIEditingServer *)self domainGroupNames];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [(PTUIEditingServer *)self _settingsGroupRow:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  id v10 = [MEMORY[0x263F622D8] sectionWithRows:v3 title:@"Settings"];

  return v10;
}

- (id)_settingsGroupRow:(id)a3
{
  id v4 = a3;
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  long long v14 = __39__PTUIEditingServer__settingsGroupRow___block_invoke;
  long long v15 = &unk_26425EC08;
  long long v16 = self;
  id v17 = v4;
  id v5 = v4;
  uint64_t v6 = (void *)MEMORY[0x2166C6A80](&v12);
  uint64_t v7 = +[PTUIPushViewControllerRowAction actionWithViewControllerCreator:](PTUIPushViewControllerRowAction, "actionWithViewControllerCreator:", v6, v12, v13, v14, v15, v16);
  uint64_t v8 = [MEMORY[0x263F622B8] row];
  id v9 = [v8 staticTitle:v5];
  id v10 = [v9 action:v7];

  return v10;
}

id __39__PTUIEditingServer__settingsGroupRow___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  uint64_t v8 = [v4 _settingsDomainGroupModule:v5];
  id v9 = (objc_class *)objc_opt_class();

  id v10 = (void *)[[v9 alloc] _initWithModule:v8 presentingRow:v7];

  return v10;
}

- (id)_settingsDomainGroupModule:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263EFF980] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = -[PTUIEditingServer domainIDsInGroup:](self, "domainIDsInGroup:", v4, 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [(PTUIEditingServer *)self _settingsDomainRow:*(void *)(*((void *)&v17 + 1) + 8 * i)];
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v8);
  }

  uint64_t v12 = (void *)MEMORY[0x263F622D8];
  uint64_t v13 = [MEMORY[0x263F622D8] sectionWithRows:v5];
  v21 = v13;
  long long v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v21 count:1];
  long long v15 = [v12 moduleWithTitle:v4 contents:v14];

  return v15;
}

- (id)_settingsDomainRow:(id)a3
{
  id v4 = a3;
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  long long v15 = __40__PTUIEditingServer__settingsDomainRow___block_invoke;
  long long v16 = &unk_26425EC08;
  long long v17 = self;
  id v18 = v4;
  id v5 = v4;
  id v6 = (void *)MEMORY[0x2166C6A80](&v13);
  uint64_t v7 = -[PTUIEditingServer displayNameForDomainID:](self, "displayNameForDomainID:", v5, v13, v14, v15, v16, v17);
  uint64_t v8 = +[PTUIPushViewControllerRowAction actionWithViewControllerCreator:v6];
  uint64_t v9 = [MEMORY[0x263F622B8] row];
  id v10 = [v9 staticTitle:v7];
  id v11 = [v10 action:v8];

  return v11;
}

id __40__PTUIEditingServer__settingsDomainRow___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = a3;
  id v8 = a2;
  uint64_t v9 = [v5 rootSettingsForDomainID:v6];
  id v10 = (objc_class *)objc_opt_class();

  id v11 = (void *)[[v10 alloc] initWithSettings:v9 presentingRow:v8];
  [*(id *)(*(void *)(a1 + 32) + 80) setObject:v11 forKey:*(void *)(a1 + 40)];

  return v11;
}

- (int64_t)numberOfSectionsForChoiceRow:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 1;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  void v7[2] = __50__PTUIEditingServer_numberOfSectionsForChoiceRow___block_invoke;
  v7[3] = &unk_26425EC30;
  v7[4] = &v8;
  [(PTUIEditingServer *)self _enumerateDomainsWithOneOrMoreTestRecipesUsingBlock:v7];
  int64_t v5 = v9[3];
  _Block_object_dispose(&v8, 8);

  return v5;
}

uint64_t __50__PTUIEditingServer_numberOfSectionsForChoiceRow___block_invoke(uint64_t result)
{
  return result;
}

- (id)choiceRow:(id)a3 titleForSection:(int64_t)a4
{
  id v6 = a3;
  if (a4)
  {
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x2020000000;
    v16[3] = 0;
    uint64_t v10 = 0;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x3032000000;
    uint64_t v13 = __Block_byref_object_copy_;
    uint64_t v14 = __Block_byref_object_dispose_;
    id v15 = 0;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __47__PTUIEditingServer_choiceRow_titleForSection___block_invoke;
    v9[3] = &unk_26425EC58;
    v9[6] = &v10;
    v9[7] = a4;
    v9[4] = self;
    v9[5] = v16;
    [(PTUIEditingServer *)self _enumerateDomainsWithOneOrMoreTestRecipesUsingBlock:v9];
    id v7 = (id)v11[5];
    _Block_object_dispose(&v10, 8);

    _Block_object_dispose(v16, 8);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void __47__PTUIEditingServer_choiceRow_titleForSection___block_invoke(void *a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  if (++*(void *)(*(void *)(a1[5] + 8) + 24) == a1[7])
  {
    uint64_t v8 = NSString;
    uint64_t v9 = (void *)a1[4];
    id v10 = a2;
    uint64_t v11 = [v9 displayNameForDomainID:a3];
    uint64_t v12 = [v8 stringWithFormat:@"%@ – %@", v10, v11];

    uint64_t v13 = *(void *)(a1[6] + 8);
    uint64_t v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    *a5 = 1;
  }
}

- (int64_t)choiceRow:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4)
  {
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x2020000000;
    v14[3] = 0;
    uint64_t v10 = 0;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x2020000000;
    uint64_t v13 = 0;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __53__PTUIEditingServer_choiceRow_numberOfRowsInSection___block_invoke;
    v9[3] = &unk_26425EC80;
    v9[5] = &v10;
    v9[6] = a4;
    v9[4] = v14;
    [(PTUIEditingServer *)self _enumerateDomainsWithOneOrMoreTestRecipesUsingBlock:v9];
    int64_t v7 = v11[3];
    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(v14, 8);
  }
  else
  {
    int64_t v7 = 1;
  }

  return v7;
}

uint64_t __53__PTUIEditingServer_choiceRow_numberOfRowsInSection___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, void *a4, unsigned char *a5)
{
  if (++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) == *(void *)(result + 48))
  {
    uint64_t v6 = result;
    result = [a4 count];
    *(void *)(*(void *)(*(void *)(v6 + 40) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = result;
    *a5 = 1;
  }
  return result;
}

- (id)choiceRow:(id)a3 valueForRow:(int64_t)a4 inSection:(int64_t)a5
{
  if (a5)
  {
    uint64_t v6 = [(PTUIEditingServer *)self _recipeIDForRow:a4 inSection:a5];
  }
  else
  {
    uint64_t v6 = @"__NoTestRecipe__";
  }
  return v6;
}

- (id)choiceRow:(id)a3 titleForRow:(int64_t)a4 inSection:(int64_t)a5
{
  if (a5)
  {
    uint64_t v6 = [(PTUIEditingServer *)self _recipeIDForRow:a4 inSection:a5];
    int64_t v7 = [(PTUIEditingServer *)self titleForTestRecipeID:v6];
  }
  else
  {
    int64_t v7 = @"None";
  }

  return v7;
}

- (id)choiceRow:(id)a3 shortTitleForRow:(int64_t)a4 inSection:(int64_t)a5
{
  return 0;
}

- (void)_enumerateDomainsWithOneOrMoreTestRecipesUsingBlock:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, uint64_t, uint64_t, void *, char *))a3;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v5 = [(PTUIEditingServer *)self domainGroupNames];
  uint64_t v17 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v17)
  {
    uint64_t v6 = *(void *)v26;
    long long v19 = v5;
    uint64_t v16 = *(void *)v26;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v26 != v6) {
          objc_enumerationMutation(v5);
        }
        uint64_t v18 = v7;
        uint64_t v8 = *(void *)(*((void *)&v25 + 1) + 8 * v7);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        uint64_t v9 = [(PTUIEditingServer *)self domainIDsInGroup:v8];
        uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v22;
          while (2)
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v22 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8 * i);
              id v15 = [(PTUIEditingServer *)self testRecipeIDsForDomainID:v14];
              if ([v15 count])
              {
                char v20 = 0;
                v4[2](v4, v8, v14, v15, &v20);
                if (v20)
                {

                  uint64_t v5 = v19;
                  goto LABEL_19;
                }
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }

        uint64_t v7 = v18 + 1;
        uint64_t v5 = v19;
        uint64_t v6 = v16;
      }
      while (v18 + 1 != v17);
      uint64_t v17 = [v19 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v17);
  }
LABEL_19:
}

- (id)_recipeIDForRow:(int64_t)a3 inSection:(int64_t)a4
{
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v13[3] = 0;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy_;
  uint64_t v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __47__PTUIEditingServer__recipeIDForRow_inSection___block_invoke;
  v6[3] = &unk_26425ECA8;
  v6[4] = v13;
  v6[5] = &v7;
  v6[6] = a4;
  v6[7] = a3;
  [(PTUIEditingServer *)self _enumerateDomainsWithOneOrMoreTestRecipesUsingBlock:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(v13, 8);

  return v4;
}

void __47__PTUIEditingServer__recipeIDForRow_inSection___block_invoke(void *a1, uint64_t a2, uint64_t a3, void *a4, unsigned char *a5)
{
  if (++*(void *)(*(void *)(a1[4] + 8) + 24) == a1[6])
  {
    uint64_t v7 = [a4 objectAtIndex:a1[7]];
    uint64_t v8 = *(void *)(a1[5] + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    *a5 = 1;
  }
}

- (BOOL)forRemoteEditing
{
  return self->_forRemoteEditing;
}

- (void)setForRemoteEditing:(BOOL)a3
{
  self->_forRemoteEditing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moduleControllerByDomainID, 0);
  objc_storeStrong((id *)&self->_testRecipeIDsByDomainID, 0);
  objc_storeStrong((id *)&self->_proxyDefinitionsByDomainID, 0);
  objc_storeStrong((id *)&self->_rootSettingsByDomainID, 0);
  objc_storeStrong((id *)&self->_domainIDsByGroupName, 0);
  objc_storeStrong((id *)&self->_domainGroupNames, 0);
  objc_storeStrong((id *)&self->_testRecipeInfoByID, 0);
  objc_storeStrong((id *)&self->_domainInfoByID, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak((id *)&self->_dataSource);
}

@end