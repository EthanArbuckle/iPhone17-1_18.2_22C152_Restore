@interface WFBundledActionProvider
- (NSSet)identifiersOfActionsDisabledOnWatch;
- (id)actionDefinitionsWithIdentifiers:(id)a3;
- (id)availableActionIdentifiers;
- (id)createActionWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5 fallbackToMissing:(BOOL)a6 isForLocalization:(BOOL)a7;
- (id)createAllAvailableActions;
- (id)createAllAvailableActionsForLocalization;
- (id)createAllAvailableActionsIncludingMissingActions:(BOOL)a3;
- (void)createActionsForRequests:(id)a3 forceLocalActionsOnly:(BOOL)a4;
@end

@implementation WFBundledActionProvider

- (void)createActionsForRequests:(id)a3 forceLocalActionsOnly:(BOOL)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_opt_new();
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v31 objects:v40 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [*(id *)(*((void *)&v31 + 1) + 8 * i) actionIdentifier];
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v31 objects:v40 count:16];
    }
    while (v8);
  }

  v25 = v5;
  v12 = [(WFBundledActionProvider *)self actionDefinitionsWithIdentifiers:v5];
  v13 = getWFActionRegistryLogObject();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = [v12 allKeys];
    *(_DWORD *)buf = 136315394;
    v37 = "-[WFBundledActionProvider createActionsForRequests:forceLocalActionsOnly:]";
    __int16 v38 = 2114;
    v39 = v14;
    _os_log_impl(&dword_1C7F0A000, v13, OS_LOG_TYPE_DEFAULT, "%s Found actions: %{public}@", buf, 0x16u);
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v15 = v6;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v28 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v27 + 1) + 8 * j);
        v21 = [v20 actionIdentifier];
        v22 = [v12 objectForKey:v21];
        if (v22)
        {
          v23 = [v20 serializedParameters];
          v24 = [(WFBundledActionProvider *)self createActionWithIdentifier:v21 definition:v22 serializedParameters:v23 fallbackToMissing:1 isForLocalization:0];

          if (v24) {
            [v20 setResult:v24];
          }
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v17);
  }
}

- (id)createActionWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5 fallbackToMissing:(BOOL)a6 isForLocalization:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = WFActionSkipList();
  char v16 = [v15 containsObject:v12];

  if (v16)
  {
    uint64_t v17 = 0;
    goto LABEL_14;
  }
  uint64_t v18 = [v13 objectForKey:@"ActionClass"];
  v19 = NSClassFromString(v18);

  if ([(objc_class *)v19 isSubclassOfClass:objc_opt_class()])
  {
    id v20 = [v19 alloc];
    v21 = [(WFActionProvider *)self stringLocalizer];
    uint64_t v17 = (WFMissingAction *)[v20 initWithIdentifier:v12 definition:v13 serializedParameters:v14 stringLocalizer:v21];

    if (v17) {
      goto LABEL_14;
    }
  }
  else if ([(objc_class *)v19 isSubclassOfClass:objc_opt_class()])
  {
    uint64_t v17 = (WFMissingAction *)[[v19 alloc] initWithIdentifier:v12 definition:v13 serializedParameters:v14];
    if (v17) {
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v17 = 0;
  }
  if (v8)
  {
    v22 = getWFActionRegistryLogObject();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      int v24 = 136315394;
      v25 = "-[WFBundledActionProvider createActionWithIdentifier:definition:serializedParameters:fallbackToMissing:isForLocalization:]";
      __int16 v26 = 2114;
      id v27 = v12;
      _os_log_impl(&dword_1C7F0A000, v22, OS_LOG_TYPE_ERROR, "%s Action %{public}@ is missing", (uint8_t *)&v24, 0x16u);
    }

    uint64_t v17 = [(WFAction *)[WFMissingAction alloc] initWithIdentifier:v12 definition:v13 serializedParameters:v14];
    [(WFMissingAction *)v17 setIsForLocalization:v7];
  }
LABEL_14:

  return v17;
}

- (id)actionDefinitionsWithIdentifiers:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = +[WFActionDefinitionRegistry registeredDefinitions];
  id v6 = objc_opt_new();
  BOOL v7 = v6;
  id v29 = v4;
  if (v4)
  {
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    obuint64_t j = v4;
    uint64_t v8 = [obj countByEnumeratingWithState:&v39 objects:v48 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v32 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v40 != v32) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void *)(*((void *)&v39 + 1) + 8 * i);
          id v12 = [v5 objectForKey:v11];
          if (v12)
          {
            [(WFActionProvider *)self defaultActionDefinition];
            id v13 = v7;
            id v14 = self;
            v16 = id v15 = v5;
            uint64_t v17 = v12[2](v12);
            uint64_t v18 = [v16 definitionByMergingWithDefinition:v17];

            v5 = v15;
            self = v14;
            BOOL v7 = v13;
            [v13 setObject:v18 forKey:v11];
          }
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v39 objects:v48 count:16];
      }
      while (v9);
    }

    id v4 = v29;
  }
  else
  {
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __60__WFBundledActionProvider_actionDefinitionsWithIdentifiers___block_invoke;
    v37[3] = &unk_1E6556FA8;
    v37[4] = self;
    id v38 = v6;
    [v5 enumerateKeysAndObjectsUsingBlock:v37];
  }
  v19 = WFActionSkipList();
  if ([v19 count])
  {
    uint64_t v28 = v19;
    id obja = v5;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v20 = WFActionSkipList();
    uint64_t v21 = [v20 countByEnumeratingWithState:&v33 objects:v47 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v34;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v34 != v23) {
            objc_enumerationMutation(v20);
          }
          uint64_t v25 = *(void *)(*((void *)&v33 + 1) + 8 * j);
          __int16 v26 = getWFActionRegistryLogObject();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            v44 = "-[WFBundledActionProvider actionDefinitionsWithIdentifiers:]";
            __int16 v45 = 2114;
            uint64_t v46 = v25;
            _os_log_impl(&dword_1C7F0A000, v26, OS_LOG_TYPE_INFO, "%s Skipping action with identifier: %{public}@", buf, 0x16u);
          }

          [v7 removeObjectForKey:v25];
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v33 objects:v47 count:16];
      }
      while (v22);
    }

    id v4 = v29;
    v5 = obja;
    v19 = v28;
  }

  return v7;
}

- (NSSet)identifiersOfActionsDisabledOnWatch
{
  v3 = (void *)os_transaction_create();
  id v4 = objc_opt_new();
  v5 = (void *)MEMORY[0x1C87CA430]();
  id v6 = [(WFBundledActionProvider *)self actionDefinitionsWithIdentifiers:0];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __79__WFBundledActionProvider_DisabledOnWatch__identifiersOfActionsDisabledOnWatch__block_invoke;
  v9[3] = &unk_1E654C8E8;
  id v7 = v4;
  id v10 = v7;
  [v6 enumerateKeysAndObjectsUsingBlock:v9];

  return (NSSet *)v7;
}

void __79__WFBundledActionProvider_DisabledOnWatch__identifiersOfActionsDisabledOnWatch__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id v6 = (void *)MEMORY[0x1C87CA430]();
  id v7 = [v5 objectForKey:@"DisabledOnPlatforms"];
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v9 = v8;

  int v10 = [v9 containsObject:@"Watch"];
  if (v10) {
    [*(id *)(a1 + 32) addObject:v11];
  }
}

- (id)createAllAvailableActionsForLocalization
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [(WFBundledActionProvider *)self actionDefinitionsWithIdentifiers:0];
  id v4 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        id v11 = objc_msgSend(v5, "objectForKey:", v10, (void)v14);
        id v12 = [(WFBundledActionProvider *)self createActionWithIdentifier:v10 definition:v11 serializedParameters:0 fallbackToMissing:1 isForLocalization:1];
        if (v12) {
          [v4 addObject:v12];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)createAllAvailableActionsIncludingMissingActions:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = [(WFBundledActionProvider *)self actionDefinitionsWithIdentifiers:0];
  uint64_t v6 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        id v13 = objc_msgSend(v7, "objectForKey:", v12, (void)v16);
        long long v14 = [(WFBundledActionProvider *)self createActionWithIdentifier:v12 definition:v13 serializedParameters:0 fallbackToMissing:v3 isForLocalization:0];
        if (v14) {
          [v6 addObject:v14];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  return v6;
}

- (id)createAllAvailableActions
{
  return [(WFBundledActionProvider *)self createAllAvailableActionsIncludingMissingActions:0];
}

- (id)availableActionIdentifiers
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  id v4 = [(WFBundledActionProvider *)self actionDefinitionsWithIdentifiers:0];
  id v5 = [v4 allKeys];
  uint64_t v6 = (void *)[v3 initWithArray:v5];

  return v6;
}

void __60__WFBundledActionProvider_actionDefinitionsWithIdentifiers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = a3;
  id v7 = a2;
  uint64_t v8 = [v5 defaultActionDefinition];
  uint64_t v9 = v6[2](v6);

  id v10 = [v8 definitionByMergingWithDefinition:v9];

  [*(id *)(a1 + 40) setObject:v10 forKey:v7];
}

@end