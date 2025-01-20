@interface WFIntentActionProvider
+ (id)disabledPlatformsForIntentWithTypeName:(id)a3;
+ (void)initialize;
- (BOOL)isObservingInstalledApplicationsChanges;
- (BOOL)shouldConsiderSystemIntents;
- (BOOL)shouldCreateActionForIntentClassName:(id)a3 actionIdentifier:(id)a4 bundleIdentifier:(id)a5 inSchema:(id)a6;
- (NSDictionary)cachedSchemasByBundleIdentifier;
- (NSSet)cachedSystemIntentActions;
- (OS_dispatch_queue)queue;
- (WFIntentActionProvider)init;
- (WFIntentActionProvider)initWithOptions:(unint64_t)a3;
- (id)actionIdentifiersForBundleIdentifier:(id)a3 schema:(id)a4;
- (id)actionIdentifiersRequiringBundledActionProvider;
- (id)actionIdentifiersRequiringBundledActionProviderMappedByApp;
- (id)availableActionIdentifiers;
- (id)createActionsForBundleIdentifier:(id)a3;
- (id)createAllAvailableActions;
- (id)schemaForBundleIdentifier:(id)a3 ignoreCache:(BOOL)a4;
- (id)schemasByBundleIdentifier;
- (unint64_t)options;
- (void)createActionsForRequests:(id)a3 forceLocalActionsOnly:(BOOL)a4;
- (void)handleApplicationDidChangeNotification:(id)a3;
- (void)installedApplicationsDidChange:(id)a3;
- (void)observeInstalledApplicationsChangesIfNeeded;
- (void)setCachedSchemasByBundleIdentifier:(id)a3;
- (void)setCachedSystemIntentActions:(id)a3;
- (void)setObservingInstalledApplicationsChanges:(BOOL)a3;
- (void)setOptions:(unint64_t)a3;
@end

@implementation WFIntentActionProvider

- (WFIntentActionProvider)initWithOptions:(unint64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)WFIntentActionProvider;
  v4 = [(WFIntentActionProvider *)&v11 init];
  if (v4)
  {
    v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v6 = dispatch_get_global_queue(21, 0);
    dispatch_queue_t v7 = dispatch_queue_create_with_target_V2("com.apple.shortcuts.intentsactionprovider", v5, v6);
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v7;

    v4->_options = a3;
    v9 = v4;
  }
  return v4;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    WFDisableAppTrustChecking();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_cachedSystemIntentActions, 0);
  objc_storeStrong((id *)&self->_cachedSchemasByBundleIdentifier, 0);
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (unint64_t)options
{
  return self->_options;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setCachedSystemIntentActions:(id)a3
{
}

- (void)setCachedSchemasByBundleIdentifier:(id)a3
{
}

- (NSDictionary)cachedSchemasByBundleIdentifier
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setObservingInstalledApplicationsChanges:(BOOL)a3
{
  self->_observingInstalledApplicationsChanges = a3;
}

- (BOOL)isObservingInstalledApplicationsChanges
{
  return self->_observingInstalledApplicationsChanges;
}

- (void)handleApplicationDidChangeNotification:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(WFIntentActionProvider *)self queue];
  dispatch_assert_queue_V2(v5);

  v6 = [v4 userInfo];
  dispatch_queue_t v7 = [v6 objectForKey:@"bundleIDs"];

  v8 = v7;
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v9 = getWFActionRegistryLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v42 = "-[WFIntentActionProvider handleApplicationDidChangeNotification:]";
      __int16 v43 = 2114;
      v44 = v8;
      _os_log_impl(&dword_1C7F0A000, v9, OS_LOG_TYPE_INFO, "%s Installed applications changed: %{public}@", buf, 0x16u);
    }

    v10 = [(WFIntentActionProvider *)self cachedSchemasByBundleIdentifier];
    uint64_t v11 = [v10 mutableCopy];

    v36 = (void *)v11;
    if (v11)
    {
      id v29 = v4;
      v34 = objc_opt_new();
      v33 = objc_opt_new();
      v35 = objc_opt_new();
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      v28 = v8;
      obj = v8;
      uint64_t v12 = [obj countByEnumeratingWithState:&v37 objects:v49 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v31 = *(void *)v38;
        v32 = self;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v38 != v31) {
              objc_enumerationMutation(obj);
            }
            uint64_t v15 = *(void *)(*((void *)&v37 + 1) + 8 * i);
            v16 = objc_opt_new();
            v17 = [v36 objectForKey:v15];
            if (v17)
            {
              uint64_t v18 = [(WFIntentActionProvider *)self actionIdentifiersForBundleIdentifier:v15 schema:v17];

              v16 = (void *)v18;
            }
            v19 = [(WFIntentActionProvider *)self schemaForBundleIdentifier:v15 ignoreCache:1];
            v20 = objc_opt_new();
            if (v19)
            {
              uint64_t v21 = [(WFIntentActionProvider *)self actionIdentifiersForBundleIdentifier:v15 schema:v19];

              v20 = (void *)v21;
            }
            v22 = (void *)[v16 mutableCopy];
            [v22 minusSet:v20];
            v23 = (void *)[v20 mutableCopy];
            [v23 minusSet:v16];
            v24 = (void *)[v20 mutableCopy];
            [v24 intersectSet:v16];
            [v34 unionSet:v22];
            [v33 unionSet:v23];
            [v35 unionSet:v24];
            [v36 setValue:v19 forKey:v15];

            self = v32;
          }
          uint64_t v13 = [obj countByEnumeratingWithState:&v37 objects:v49 count:16];
        }
        while (v13);
      }

      [(WFIntentActionProvider *)self setCachedSchemasByBundleIdentifier:v36];
      v25 = getWFActionRegistryLogObject();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315906;
        v42 = "-[WFIntentActionProvider handleApplicationDidChangeNotification:]";
        __int16 v43 = 2114;
        v44 = v35;
        __int16 v45 = 2114;
        v46 = v33;
        __int16 v47 = 2114;
        v48 = v34;
        _os_log_impl(&dword_1C7F0A000, v25, OS_LOG_TYPE_INFO, "%s Updated: %{public}@, Added: %{public}@, Removed: %{public}@", buf, 0x2Au);
      }

      v8 = v28;
      id v4 = v29;
      if ([v34 count] || objc_msgSend(v33, "count") || -[NSObject count](v35, "count"))
      {
        v26 = [(WFActionProvider *)self delegate];
        [v26 actionProviderDidChange:self updatedActions:v35 removedActions:v34 addedActions:v33];
      }
    }

    v27 = v8;
  }
  else
  {

    v27 = getWFActionRegistryLogObject();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v42 = "-[WFIntentActionProvider handleApplicationDidChangeNotification:]";
      _os_log_impl(&dword_1C7F0A000, v27, OS_LOG_TYPE_FAULT, "%s Got an application did change notification, but couldn't extract bundle identifiers out of it", buf, 0xCu);
    }
  }
}

- (void)installedApplicationsDidChange:(id)a3
{
  id v4 = a3;
  v5 = [(WFIntentActionProvider *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__WFIntentActionProvider_installedApplicationsDidChange___block_invoke;
  v7[3] = &unk_1E6558938;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __57__WFIntentActionProvider_installedApplicationsDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleApplicationDidChangeNotification:*(void *)(a1 + 40)];
}

- (void)observeInstalledApplicationsChangesIfNeeded
{
  if (![(WFIntentActionProvider *)self isObservingInstalledApplicationsChanges])
  {
    [(WFIntentActionProvider *)self setObservingInstalledApplicationsChanges:1];
    id v3 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v3 addObserver:self selector:sel_installedApplicationsDidChange_ name:@"com.apple.LaunchServices.applicationRegistered" object:0];
    [v3 addObserver:self selector:sel_installedApplicationsDidChange_ name:@"com.apple.LaunchServices.applicationUnregistered" object:0];
  }
}

- (BOOL)shouldCreateActionForIntentClassName:(id)a3 actionIdentifier:(id)a4 bundleIdentifier:(id)a5 inSchema:(id)a6
{
  v10 = (NSString *)a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([v11 isEqualToString:@"com.apple.mobilemail.MSGetMailIntent"]) {
    goto LABEL_8;
  }
  if (![v11 hasSuffix:@"Intent"]) {
    goto LABEL_8;
  }
  if ([v12 isEqualToString:@"com.apple.WorkflowKit.ShortcutsIntents"]) {
    goto LABEL_8;
  }
  if ([v12 isEqualToString:@"com.apple.ActionKit.BundledIntentHandler"]) {
    goto LABEL_8;
  }
  if ([v12 isEqualToString:@"com.apple.shortcuts"]) {
    goto LABEL_8;
  }
  v14 = [MEMORY[0x1E4F4B7E0] applicationWithBundleIdentifier:v12];
  char v15 = [v14 isHidden];

  if ((v15 & 1) != 0
    || (-[WFIntentActionProvider actionIdentifiersRequiringBundledActionProvider](self, "actionIdentifiersRequiringBundledActionProvider"), v16 = objc_claimAutoreleasedReturnValue(), char v17 = [v16 containsObject:v11], v16, (v17 & 1) != 0))
  {
LABEL_8:
    BOOL v18 = 0;
  }
  else if (v13)
  {
    v20 = [v13 intentCodableDescriptionWithIntentClassName:v10];
    uint64_t v21 = [v13 _parameterCombinationsForClassName:v10];
    v22 = [v20 resolvableParameterCombinationsWithParameterCombinations:v21];
    uint64_t v23 = [v22 count];

    NSClassFromString(v10);
    v24 = INIntentSchemaGetIntentDescriptionWithFacadeClass();

    char v25 = [v20 isConfigurable];
    if (v23) {
      char v26 = 1;
    }
    else {
      char v26 = v25;
    }
    if (v24) {
      BOOL v18 = 0;
    }
    else {
      BOOL v18 = v26;
    }
  }
  else
  {
    BOOL v18 = 1;
  }

  return v18;
}

- (id)actionIdentifiersRequiringBundledActionProvider
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__WFIntentActionProvider_actionIdentifiersRequiringBundledActionProvider__block_invoke;
  block[3] = &unk_1E6558B28;
  block[4] = self;
  if (actionIdentifiersRequiringBundledActionProvider_onceToken != -1) {
    dispatch_once(&actionIdentifiersRequiringBundledActionProvider_onceToken, block);
  }
  return (id)actionIdentifiersRequiringBundledActionProvider_actionIdentifiersRequiringBundledActionProvider;
}

void __73__WFIntentActionProvider_actionIdentifiersRequiringBundledActionProvider__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_opt_new();
  id v3 = (void *)actionIdentifiersRequiringBundledActionProvider_actionIdentifiersRequiringBundledActionProvider;
  actionIdentifiersRequiringBundledActionProvider_actionIdentifiersRequiringBundledActionProvider = v2;

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = objc_msgSend(*(id *)(a1 + 32), "actionIdentifiersRequiringBundledActionProviderMappedByApp", 0);
  v5 = [v4 allValues];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = (void *)actionIdentifiersRequiringBundledActionProvider_actionIdentifiersRequiringBundledActionProvider;
        id v11 = [*(id *)(*((void *)&v12 + 1) + 8 * v9) allKeys];
        [v10 addObjectsFromArray:v11];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (id)actionIdentifiersRequiringBundledActionProviderMappedByApp
{
  if (actionIdentifiersRequiringBundledActionProviderMappedByApp_onceToken != -1) {
    dispatch_once(&actionIdentifiersRequiringBundledActionProviderMappedByApp_onceToken, &__block_literal_global_199_55348);
  }
  uint64_t v2 = (void *)actionIdentifiersRequiringBundledActionProviderMappedByApp_map;
  return v2;
}

void __84__WFIntentActionProvider_actionIdentifiersRequiringBundledActionProviderMappedByApp__block_invoke()
{
  v0 = (void *)actionIdentifiersRequiringBundledActionProviderMappedByApp_map;
  actionIdentifiersRequiringBundledActionProviderMappedByApp_map = (uint64_t)&unk_1F2318020;
}

- (id)actionIdentifiersForBundleIdentifier:(id)a3 schema:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v15 = (id)objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = [v7 _classNamesForClass:objc_opt_class()];
  uint64_t v8 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        long long v13 = [NSString stringWithFormat:@"%@.%@", v6, v12];
        if ([(WFIntentActionProvider *)self shouldCreateActionForIntentClassName:v12 actionIdentifier:v13 bundleIdentifier:v6 inSchema:v7])
        {
          [v15 addObject:v13];
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  return v15;
}

- (BOOL)shouldConsiderSystemIntents
{
  return self->_options & 1;
}

- (NSSet)cachedSystemIntentActions
{
  if (!self->_cachedSystemIntentActions
    && [(WFIntentActionProvider *)self shouldConsiderSystemIntents])
  {
    WFLoadAllSystemIntentActions(self);
    id v3 = (NSSet *)objc_claimAutoreleasedReturnValue();
    cachedSystemIntentActions = self->_cachedSystemIntentActions;
    self->_cachedSystemIntentActions = v3;
  }
  v5 = self->_cachedSystemIntentActions;
  return v5;
}

- (id)schemaForBundleIdentifier:(id)a3 ignoreCache:(BOOL)a4
{
  id v6 = a3;
  if (a4
    || ([(WFIntentActionProvider *)self cachedSchemasByBundleIdentifier],
        id v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        !v7))
  {
    uint64_t v8 = [MEMORY[0x1E4F304C8] sharedConnection];
    uint64_t v10 = [MEMORY[0x1E4F1CAD0] setWithObject:v6];
    id v11 = [v8 loadSchemasForBundleIdentifiers:v10 error:0];
    uint64_t v9 = [v11 objectForKey:v6];
  }
  else
  {
    uint64_t v8 = [(WFIntentActionProvider *)self cachedSchemasByBundleIdentifier];
    uint64_t v9 = [v8 objectForKey:v6];
  }

  return v9;
}

- (id)schemasByBundleIdentifier
{
  id v3 = [(WFIntentActionProvider *)self cachedSchemasByBundleIdentifier];

  if (!v3)
  {
    id v4 = [MEMORY[0x1E4F304C8] sharedConnection];
    v5 = [v4 availableSchemasWithError:0];
    [(WFIntentActionProvider *)self setCachedSchemasByBundleIdentifier:v5];
  }
  return [(WFIntentActionProvider *)self cachedSchemasByBundleIdentifier];
}

- (id)createActionsForBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v6 = [MEMORY[0x1E4F304C8] sharedConnection];
  id v7 = [MEMORY[0x1E4F1CAD0] setWithObject:v4];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __59__WFIntentActionProvider_createActionsForBundleIdentifier___block_invoke;
  v13[3] = &unk_1E65556E0;
  v13[4] = self;
  id v14 = v4;
  id v8 = v5;
  id v15 = v8;
  id v9 = v4;
  objc_msgSend(v6, "wf_accessBundleContentForBundleIdentifiers:withBlock:", v7, v13);

  uint64_t v10 = v15;
  id v11 = v8;

  return v11;
}

void __59__WFIntentActionProvider_createActionsForBundleIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) schemaForBundleIdentifier:*(void *)(a1 + 40) ignoreCache:0];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = [v2 _classNamesForClass:objc_opt_class()];
  uint64_t v3 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v22;
    unint64_t v6 = 0x1E4F29000uLL;
    uint64_t v18 = *(void *)v22;
    do
    {
      uint64_t v7 = 0;
      uint64_t v19 = v4;
      do
      {
        if (*(void *)v22 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v21 + 1) + 8 * v7);
        id v9 = (void *)MEMORY[0x1C87CA430]();
        uint64_t v10 = [*(id *)(v6 + 24) stringWithFormat:@"%@.%@", *(void *)(a1 + 40), v8];
        if ([*(id *)(a1 + 32) shouldCreateActionForIntentClassName:v8 actionIdentifier:v10 bundleIdentifier:*(void *)(a1 + 40) inSchema:v2])
        {
          id v11 = [WFHandleCustomIntentAction alloc];
          uint64_t v12 = [*(id *)(a1 + 32) defaultActionDefinition];
          long long v13 = v2;
          uint64_t v14 = *(void *)(a1 + 40);
          id v15 = [*(id *)(a1 + 32) stringLocalizer];
          uint64_t v17 = v14;
          uint64_t v2 = v13;
          v16 = [(WFHandleCustomIntentAction *)v11 initWithIdentifier:v10 definition:v12 serializedParameters:0 schema:v13 intent:0 className:v8 bundleIdentifier:v17 stringLocalizer:v15];

          if (v16) {
            [*(id *)(a1 + 48) addObject:v16];
          }

          uint64_t v5 = v18;
          uint64_t v4 = v19;
          unint64_t v6 = 0x1E4F29000;
        }

        ++v7;
      }
      while (v4 != v7);
      uint64_t v4 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v4);
  }
}

- (void)createActionsForRequests:(id)a3 forceLocalActionsOnly:(BOOL)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __73__WFIntentActionProvider_createActionsForRequests_forceLocalActionsOnly___block_invoke;
  v4[3] = &unk_1E6555758;
  v4[4] = self;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v4, a4);
}

void __73__WFIntentActionProvider_createActionsForRequests_forceLocalActionsOnly___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v42 = a2;
  uint64_t v3 = [v42 actionIdentifier];
  __int16 v43 = [v3 componentsSeparatedByString:@"."];
  uint64_t v4 = v43;
  if ((unint64_t)[v43 count] >= 2)
  {
    uint64_t v5 = objc_msgSend(v43, "subarrayWithRange:", 0, objc_msgSend(v43, "count") - 1);
    long long v39 = [v5 componentsJoinedByString:@"."];

    v44 = [v43 lastObject];
    if ([*(id *)(a1 + 32) shouldConsiderSystemIntents]
      && (WFSupportedSystemIntentClasses(),
          unint64_t v6 = objc_claimAutoreleasedReturnValue(),
          int v7 = [v6 containsObject:v44],
          v6,
          v7)
      && (WFGetSystemIntentActionForBundleIdentifierAndIntentClassName(v39, v44, *(void **)(a1 + 32)),
          (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      [v42 setResult:v8];
    }
    else if ([v44 hasSuffix:@"Intent"])
    {
      id v9 = [v42 serializedParameters];
      if (v9)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v10 = v9;
        }
        else {
          uint64_t v10 = 0;
        }
      }
      else
      {
        uint64_t v10 = 0;
      }
      id v11 = v10;

      long long v37 = v11;
      uint64_t v12 = [v11 objectForKey:@"AppIntentDescriptor"];

      if (!v12)
      {
        long long v13 = [v42 serializedParameters];
        v36 = [v13 objectForKey:@"SerializedIntentDescriptor"];

        if (v36 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F304E0]) initWithSerializedRepresentation:v36];
        }
        else
        {

          uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F304E0]) initWithIntentClassName:v44 launchableAppBundleId:v39];
          v36 = 0;
        }
        id v15 = [MEMORY[0x1E4F302D0] sharedResolver];
        long long v38 = [v15 resolvedIntentMatchingDescriptor:v14];

        v16 = objc_opt_new();
        uint64_t v17 = [v38 extensionBundleIdentifier];

        if (v17)
        {
          uint64_t v18 = [v38 extensionBundleIdentifier];
          [v16 addObject:v18];
        }
        uint64_t v19 = [v38 bundleIdentifier];

        if (v19)
        {
          long long v20 = [v38 bundleIdentifier];
          [v16 addObject:v20];
        }
        long long v21 = [v38 intentClassName];
        uint64_t v22 = [v21 length];

        if (v22)
        {
          uint64_t v23 = [v38 intentClassName];

          v44 = (void *)v23;
        }
        [v16 addObject:v39];
        long long v58 = 0u;
        long long v59 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        id obj = v16;
        uint64_t v24 = [obj countByEnumeratingWithState:&v56 objects:v60 count:16];
        if (!v24)
        {

          id v26 = 0;
          id v41 = 0;
          goto LABEL_40;
        }
        id v41 = 0;
        char v25 = 0;
        id v26 = 0;
        uint64_t v27 = *(void *)v57;
LABEL_25:
        uint64_t v28 = 0;
        while (1)
        {
          if (*(void *)v57 != v27) {
            objc_enumerationMutation(obj);
          }
          id v29 = *(void **)(*((void *)&v56 + 1) + 8 * v28);
          v30 = [*(id *)(a1 + 32) schemaForBundleIdentifier:v29 ignoreCache:0];

          id v26 = v30;
          if ([*(id *)(a1 + 32) shouldCreateActionForIntentClassName:v44 actionIdentifier:v3 bundleIdentifier:v29 inSchema:v30])
          {
            if (v30)
            {
              id v31 = v29;

              id v41 = v31;
              goto LABEL_38;
            }
            if (!v41) {
              id v41 = v29;
            }
            char v25 = 1;
          }
          if (v24 == ++v28)
          {
            uint64_t v24 = [obj countByEnumeratingWithState:&v56 objects:v60 count:16];
            if (v24) {
              goto LABEL_25;
            }

            if ((v25 & 1) == 0)
            {
LABEL_40:

              break;
            }
LABEL_38:
            uint64_t v50 = 0;
            v51 = &v50;
            uint64_t v52 = 0x3032000000;
            v53 = __Block_byref_object_copy__55423;
            v54 = __Block_byref_object_dispose__55424;
            id v55 = 0;
            v32 = [MEMORY[0x1E4F304C8] sharedConnection];
            v33 = [MEMORY[0x1E4F1CAD0] setWithObject:v41];
            v45[0] = MEMORY[0x1E4F143A8];
            v45[1] = 3221225472;
            v45[2] = __73__WFIntentActionProvider_createActionsForRequests_forceLocalActionsOnly___block_invoke_183;
            v45[3] = &unk_1E6555730;
            v49 = &v50;
            uint64_t v34 = *(void *)(a1 + 32);
            v45[4] = v3;
            v45[5] = v34;
            id v35 = v42;
            id v46 = v35;
            id v26 = v30;
            id v47 = v26;
            id v48 = v38;
            objc_msgSend(v32, "wf_accessBundleContentForBundleIdentifiers:withBlock:", v33, v45);

            [v35 setResult:v51[5]];
            _Block_object_dispose(&v50, 8);

            goto LABEL_40;
          }
        }
      }
    }
    uint64_t v4 = v43;
  }
}

void __73__WFIntentActionProvider_createActionsForRequests_forceLocalActionsOnly___block_invoke_183(uint64_t a1)
{
  uint64_t v2 = [WFHandleCustomIntentAction alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  id v11 = [*(id *)(a1 + 40) defaultActionDefinition];
  uint64_t v4 = [*(id *)(a1 + 48) serializedParameters];
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 64);
  int v7 = [*(id *)(a1 + 40) stringLocalizer];
  uint64_t v8 = [(WFHandleCustomIntentAction *)v2 initWithIdentifier:v3 definition:v11 serializedParameters:v4 schema:v5 intent:0 resolvedIntentDescriptor:v6 stringLocalizer:v7];
  uint64_t v9 = *(void *)(*(void *)(a1 + 72) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

- (id)availableActionIdentifiers
{
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = [(WFIntentActionProvider *)self schemasByBundleIdentifier];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__WFIntentActionProvider_availableActionIdentifiers__block_invoke;
  v9[3] = &unk_1E65556B8;
  v9[4] = v3;
  v9[5] = self;
  [v4 enumerateKeysAndObjectsUsingBlock:v9];

  if ([(WFIntentActionProvider *)self shouldConsiderSystemIntents])
  {
    uint64_t v5 = [(WFIntentActionProvider *)self cachedSystemIntentActions];
    uint64_t v6 = objc_msgSend(v5, "if_compactMap:", &__block_literal_global_55430);

    [v3 unionSet:v6];
  }
  id v7 = v3;

  return v7;
}

void __52__WFIntentActionProvider_availableActionIdentifiers__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) actionIdentifiersForBundleIdentifier:a2 schema:a3];
  [v3 unionSet:v4];
}

uint64_t __52__WFIntentActionProvider_availableActionIdentifiers__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (id)createAllAvailableActions
{
  [(WFIntentActionProvider *)self observeInstalledApplicationsChangesIfNeeded];
  uint64_t v3 = objc_opt_new();
  id v4 = [(WFIntentActionProvider *)self schemasByBundleIdentifier];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F304C8] sharedConnection];
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    id v7 = [v4 allKeys];
    uint64_t v8 = [v6 setWithArray:v7];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __51__WFIntentActionProvider_createAllAvailableActions__block_invoke;
    v12[3] = &unk_1E65556E0;
    v12[4] = v4;
    v12[5] = self;
    v12[6] = v3;
    objc_msgSend(v5, "wf_accessBundleContentForBundleIdentifiers:withBlock:", v8, v12);

    if ([(WFIntentActionProvider *)self shouldConsiderSystemIntents])
    {
      uint64_t v9 = [(WFIntentActionProvider *)self cachedSystemIntentActions];
      [v3 unionSet:v9];
    }
    id v10 = v3;
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

uint64_t __51__WFIntentActionProvider_createAllAvailableActions__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51__WFIntentActionProvider_createAllAvailableActions__block_invoke_2;
  v3[3] = &unk_1E65556B8;
  long long v4 = *(_OWORD *)(a1 + 40);
  return [v1 enumerateKeysAndObjectsUsingBlock:v3];
}

void __51__WFIntentActionProvider_createAllAvailableActions__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v22 = a2;
  id v5 = a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = [v5 _classNamesForClass:objc_opt_class()];
  uint64_t v21 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v21)
  {
    uint64_t v6 = *(void *)v24;
    unint64_t v7 = 0x1E4F29000uLL;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v23 + 1) + 8 * v8);
        id v10 = (void *)MEMORY[0x1C87CA430]();
        id v11 = [*(id *)(v7 + 24) stringWithFormat:@"%@.%@", v22, v9];
        if ([*(id *)(a1 + 32) shouldCreateActionForIntentClassName:v9 actionIdentifier:v11 bundleIdentifier:v22 inSchema:v5])
        {
          uint64_t v12 = v6;
          id v13 = v5;
          uint64_t v14 = [WFHandleCustomIntentAction alloc];
          id v15 = [*(id *)(a1 + 32) defaultActionDefinition];
          [*(id *)(a1 + 32) stringLocalizer];
          uint64_t v17 = v16 = a1;
          uint64_t v18 = v14;
          id v5 = v13;
          uint64_t v19 = [(WFHandleCustomIntentAction *)v18 initWithIdentifier:v11 definition:v15 serializedParameters:0 schema:v13 intent:0 className:v9 bundleIdentifier:v22 stringLocalizer:v17];

          a1 = v16;
          if (v19) {
            [*(id *)(v16 + 40) addObject:v19];
          }

          uint64_t v6 = v12;
          unint64_t v7 = 0x1E4F29000;
        }

        ++v8;
      }
      while (v21 != v8);
      uint64_t v21 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v21);
  }
}

- (WFIntentActionProvider)init
{
  return [(WFIntentActionProvider *)self initWithOptions:0];
}

+ (id)disabledPlatformsForIntentWithTypeName:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (__CFString *)a3;
  long long v4 = v3;
  if (v3 == @"sirikit.intents.custom.com.apple.mobilecal.EKUICreateEventIntent") {
    goto LABEL_6;
  }
  if (v3)
  {
    char v5 = [(__CFString *)v3 isEqualToString:@"sirikit.intents.custom.com.apple.mobilecal.EKUICreateEventIntent"];

    if ((v5 & 1) != 0
      || (uint64_t v6 = v4, v6 == @"sirikit.intents.custom.com.apple.mobilesafari.OpenURLsIntent")
      || (unint64_t v7 = v6,
          int v8 = [(__CFString *)v6 isEqualToString:@"sirikit.intents.custom.com.apple.mobilesafari.OpenURLsIntent"], v7, v8))
    {
LABEL_6:
      long long v20 = @"Watch";
      uint64_t v9 = &v20;
LABEL_7:
      id v10 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v9, 1, v18, v19, v20, v21);
      goto LABEL_15;
    }
    id v11 = v7;
    if (v11 == @"sirikit.intents.custom.com.apple.weather.WeatherIntent"
      || (uint64_t v12 = v11,
          int v13 = [(__CFString *)v11 isEqualToString:@"sirikit.intents.custom.com.apple.weather.WeatherIntent"], v12, v13))
    {
      uint64_t v19 = @"Watch";
      uint64_t v9 = &v19;
      goto LABEL_7;
    }
    uint64_t v14 = v12;
    if (v14 == @"sirikit.intent.payments.SendPaymentIntent"
      || (id v15 = v14,
          int v16 = [(__CFString *)v14 isEqualToString:@"sirikit.intent.payments.SendPaymentIntent"], v15, v16))
    {
      uint64_t v18 = @"Desktop";
      uint64_t v9 = &v18;
      goto LABEL_7;
    }
  }
  id v10 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_15:

  return v10;
}

@end