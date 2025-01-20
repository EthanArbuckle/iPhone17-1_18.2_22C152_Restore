@interface WFConfiguredSystemActionProvider
+ (id)sharedProvider;
- (BOOL)saveUpdatedAction:(id)a3 forActionType:(id)a4;
- (NSMutableDictionary)observers;
- (WFConfiguredSystemActionProvider)init;
- (id)availableActionTypes;
- (id)configuredStaccatoActionFromTemplate:(id)a3 valuesByParameterKey:(id)a4 error:(id *)a5;
- (id)configuredSystemActionForActionType:(id)a3;
- (id)defaultSystemActionForActionType:(id)a3;
- (id)linkActionWithStaccatoIdentifier:(id)a3;
- (id)userDefaultsForSystemActionType:(id)a3;
- (id)userDefaultsKeyForSystemActionType:(id)a3;
- (os_unfair_lock_s)observersLock;
- (void)addObserver:(id)a3 forActionType:(id)a4;
- (void)setObservers:(id)a3;
@end

@implementation WFConfiguredSystemActionProvider

- (void).cxx_destruct
{
}

- (os_unfair_lock_s)observersLock
{
  return self->_observersLock;
}

- (void)setObservers:(id)a3
{
}

- (NSMutableDictionary)observers
{
  return self->_observers;
}

- (void)addObserver:(id)a3 forActionType:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  v9 = [(WFConfiguredSystemActionProvider *)self observers];
  v10 = [v9 objectForKeyedSubscript:v7];

  if (!v10)
  {
    v11 = [(WFConfiguredSystemActionProvider *)self userDefaultsForSystemActionType:v7];
    v12 = [(WFConfiguredSystemActionProvider *)self userDefaultsKeyForSystemActionType:v7];
    v10 = [[WFConfiguredSystemActionObserverRegistration alloc] initWithUserDefaults:v11 userDefaultsKey:v12 actionType:v7];
    v13 = [(WFConfiguredSystemActionProvider *)self observers];
    [v13 setObject:v10 forKeyedSubscript:v7];
  }
  v14 = [(WFConfiguredSystemActionObserverRegistration *)v10 observers];
  [v14 addObject:v6];

  os_unfair_lock_unlock(p_observersLock);
  v15 = getWFStaccatoLogObject();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136315650;
    v17 = "-[WFConfiguredSystemActionProvider addObserver:forActionType:]";
    __int16 v18 = 2112;
    id v19 = v6;
    __int16 v20 = 2112;
    id v21 = v7;
    _os_log_impl(&dword_1C7D7E000, v15, OS_LOG_TYPE_DEFAULT, "%s Added action observer: %@ for %@", (uint8_t *)&v16, 0x20u);
  }
}

- (id)configuredStaccatoActionFromTemplate:(id)a3 valuesByParameterKey:(id)a4 error:(id *)a5
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = [v8 identifier];
  uint64_t v11 = [(WFConfiguredSystemActionProvider *)self linkActionWithStaccatoIdentifier:v10];

  v49 = (void *)v11;
  if (v11)
  {
    id v47 = v9;
    id v48 = v8;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v12 = v9;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v54 objects:v65 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v55;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v55 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v54 + 1) + 8 * i);
          __int16 v18 = [v49 parameterForKey:v17];
          id v19 = [v12 objectForKeyedSubscript:v17];
          id v20 = objc_alloc((Class)[v18 stateClass]);
          id v21 = [v19 serializedState];
          uint64_t v22 = (void *)[v20 initWithSerializedRepresentation:v21 variableProvider:0 parameter:v18];

          v23 = getWFStaccatoLogObject();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315650;
            v60 = "-[WFConfiguredSystemActionProvider configuredStaccatoActionFromTemplate:valuesByParameterKey:error:]";
            __int16 v61 = 2112;
            id v62 = v22;
            __int16 v63 = 2112;
            uint64_t v64 = v17;
            _os_log_impl(&dword_1C7D7E000, v23, OS_LOG_TYPE_INFO, "%s Setting %@ for %@", buf, 0x20u);
          }

          [v49 setParameterState:v22 forKey:v17];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v54 objects:v65 count:16];
      }
      while (v14);
    }

    id v24 = v49;
    int v25 = [v24 conformsToProtocol:&unk_1F229C748];
    if (v25) {
      v26 = v24;
    }
    else {
      v26 = 0;
    }
    id v27 = v26;

    if (v25 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v28 = [v24 defaultParameterStatesForStaccato];
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      uint64_t v29 = [v28 countByEnumeratingWithState:&v50 objects:v58 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v51;
        do
        {
          for (uint64_t j = 0; j != v30; ++j)
          {
            if (*(void *)v51 != v31) {
              objc_enumerationMutation(v28);
            }
            uint64_t v33 = *(void *)(*((void *)&v50 + 1) + 8 * j);
            v34 = [v28 objectForKeyedSubscript:v33];
            [v24 setParameterState:v34 forKey:v33];
          }
          uint64_t v30 = [v28 countByEnumeratingWithState:&v50 objects:v58 count:16];
        }
        while (v30);
      }
    }
    id v35 = objc_alloc(MEMORY[0x1E4F302B8]);
    v36 = [v24 fullyQualifiedLinkActionIdentifier];
    v37 = [v36 bundleIdentifier];
    v38 = [v24 linkActionWithSerializedParameters];
    v39 = [v24 metadata];
    v40 = (void *)[v35 initWithAppBundleIdentifier:v37 linkAction:v38 linkActionMetadata:v39];

    id v41 = objc_alloc(MEMORY[0x1E4FB45F0]);
    v42 = [v24 localizedName];
    v43 = (void *)[v41 initWithIntent:v40 named:v42 previewIcon:0 appShortcutIdentifier:0 templateParameterValues:v12 contextualParameters:0 shortcutsMetadata:0 colorScheme:0];

    id v9 = v47;
    id v8 = v48;
    goto LABEL_29;
  }
  v44 = getWFStaccatoLogObject();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v60 = "-[WFConfiguredSystemActionProvider configuredStaccatoActionFromTemplate:valuesByParameterKey:error:]";
    __int16 v61 = 2112;
    id v62 = v8;
    _os_log_impl(&dword_1C7D7E000, v44, OS_LOG_TYPE_ERROR, "%s Failed to find link action for template: %@", buf, 0x16u);
  }

  if (a5)
  {
    v45 = (void *)MEMORY[0x1E4F28C58];
    id v27 = [v8 identifier];
    objc_msgSend(v45, "vc_voiceShortcutErrorWithCode:reason:", 1002, @"Action template with identifier (%@) does not resolve to valid link action", v27);
    v43 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_29:

    goto LABEL_30;
  }
  v43 = 0;
LABEL_30:

  return v43;
}

- (id)linkActionWithStaccatoIdentifier:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v3 = (objc_class *)MEMORY[0x1E4FB70C8];
  id v4 = a3;
  id v5 = [v3 alloc];
  id v6 = (void *)[v5 initWithActionIdentifier:v4 serializedParameters:MEMORY[0x1E4F1CC08]];

  id v7 = [MEMORY[0x1E4FB7240] sharedProvider];
  v13[0] = v6;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  [v7 createActionsForRequests:v8];

  id v9 = [v6 result];
  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v10 = v9;
    }
    else {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }
  id v11 = v10;

  return v11;
}

- (BOOL)saveUpdatedAction:(id)a3 forActionType:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v6 isEqualToString:*MEMORY[0x1E4FB4DE0]])
  {
    id v14 = 0;
    id v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v14];
    id v8 = v14;
    if (v7)
    {
      id v9 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.springboard"];
      [v9 setObject:v7 forKey:@"SBSystemActionConfiguredActionArchive"];
      v10 = getWFStaccatoLogObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_8;
      }
      goto LABEL_9;
    }
    id v9 = getWFStaccatoLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
LABEL_14:
      *(_DWORD *)buf = 136315906;
      int v16 = "-[WFConfiguredSystemActionProvider saveUpdatedAction:forActionType:]";
      __int16 v17 = 2112;
      id v18 = v5;
      __int16 v19 = 2112;
      id v20 = v6;
      __int16 v21 = 2112;
      id v22 = v8;
      _os_log_impl(&dword_1C7D7E000, v9, OS_LOG_TYPE_ERROR, "%s Unable to save updated action %@ of type %@ due to: %@", buf, 0x2Au);
    }
LABEL_15:
    id v7 = 0;
    BOOL v11 = 0;
    goto LABEL_16;
  }
  if ([v6 isEqualToString:*MEMORY[0x1E4FB4DE8]])
  {
    id v13 = 0;
    id v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v13];
    id v8 = v13;
    if (v7)
    {
      id v9 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.springboard"];
      [v9 setObject:v7 forKey:@"SBPencilSystemShortcutAction"];
      v10 = getWFStaccatoLogObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
LABEL_8:
        *(_DWORD *)buf = 136315650;
        int v16 = "-[WFConfiguredSystemActionProvider saveUpdatedAction:forActionType:]";
        __int16 v17 = 2112;
        id v18 = v5;
        __int16 v19 = 2112;
        id v20 = v6;
        _os_log_impl(&dword_1C7D7E000, v10, OS_LOG_TYPE_DEFAULT, "%s Successfuly saved updated action %@ of type %@.", buf, 0x20u);
      }
LABEL_9:

      BOOL v11 = 1;
LABEL_16:

      goto LABEL_17;
    }
    id v9 = getWFStaccatoLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  BOOL v11 = 0;
LABEL_17:

  return v11;
}

- (id)defaultSystemActionForActionType:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = (objc_class *)MEMORY[0x1E4FB4618];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  int v7 = [v5 isEqualToString:*MEMORY[0x1E4FB4DE0]];

  if (v7)
  {
    id v8 = (id)*MEMORY[0x1E4FB4DC0];
    id v9 = [(WFConfiguredSystemActionProvider *)self linkActionWithStaccatoIdentifier:v8];
    if (v9)
    {
      v10 = (void *)[objc_alloc(MEMORY[0x1E4FB4980]) initWithIdentifier:v8 sectionIdentifier:@"SilentMode" linkAction:v9];
      uint64_t v17 = 0;
      BOOL v11 = [(WFConfiguredSystemActionProvider *)self configuredStaccatoActionFromTemplate:v10 valuesByParameterKey:MEMORY[0x1E4F1CC08] error:&v17];
      id v12 = v11;
      if (!v11)
      {
        id v13 = getWFStaccatoLogObject();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          __int16 v19 = "-[WFConfiguredSystemActionProvider defaultSystemActionForActionType:]";
          __int16 v20 = 2112;
          id v21 = v8;
          _os_log_impl(&dword_1C7D7E000, v13, OS_LOG_TYPE_ERROR, "%s Failed to find link action for default action identifier: %@", buf, 0x16u);
        }

        id v12 = v6;
      }
      id v14 = v12;
    }
    else
    {
      uint64_t v15 = getWFStaccatoLogObject();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v19 = "-[WFConfiguredSystemActionProvider defaultSystemActionForActionType:]";
        __int16 v20 = 2112;
        id v21 = v8;
        _os_log_impl(&dword_1C7D7E000, v15, OS_LOG_TYPE_ERROR, "%s Failed to find link action for default action identifier: %@", buf, 0x16u);
      }

      id v14 = v6;
    }
  }
  else
  {
    id v14 = v6;
  }

  return v14;
}

- (id)userDefaultsKeyForSystemActionType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:*MEMORY[0x1E4FB4DE0]])
  {
    id v4 = @"SBSystemActionConfiguredActionArchive";
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4FB4DE8]])
  {
    id v4 = @"SBPencilSystemShortcutAction";
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)userDefaultsForSystemActionType:(id)a3
{
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.springboard"];
  return v3;
}

- (id)configuredSystemActionForActionType:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(WFConfiguredSystemActionProvider *)self userDefaultsForSystemActionType:v4];
  id v6 = [(WFConfiguredSystemActionProvider *)self userDefaultsKeyForSystemActionType:v4];
  int v7 = [v5 objectForKey:v6];
  id v12 = 0;
  id v8 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v7 error:&v12];
  id v9 = v12;
  if (!v8)
  {
    v10 = getWFStaccatoLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      id v14 = "-[WFConfiguredSystemActionProvider configuredSystemActionForActionType:]";
      __int16 v15 = 2112;
      id v16 = v4;
      __int16 v17 = 2112;
      id v18 = v9;
      _os_log_impl(&dword_1C7D7E000, v10, OS_LOG_TYPE_ERROR, "%s Failed to read configured action for type: %@ due to: %@", buf, 0x20u);
    }
  }
  return v8;
}

- (id)availableActionTypes
{
  v2 = objc_opt_new();
  id v3 = [MEMORY[0x1E4FB46B8] currentDevice];
  int v4 = [v3 hasCapability:*MEMORY[0x1E4FB4C68]];

  if (v4) {
    [v2 addObject:*MEMORY[0x1E4FB4DE0]];
  }
  id v5 = [MEMORY[0x1E4FB46B8] currentDevice];
  int v6 = [v5 hasCapability:*MEMORY[0x1E4FB4C70]];

  if (v6) {
    [v2 addObject:*MEMORY[0x1E4FB4DE8]];
  }
  int v7 = (void *)[v2 copy];

  return v7;
}

- (WFConfiguredSystemActionProvider)init
{
  v8.receiver = self;
  v8.super_class = (Class)WFConfiguredSystemActionProvider;
  v2 = [(WFConfiguredSystemActionProvider *)&v8 init];
  id v3 = v2;
  if (v2)
  {
    v2->_observersLock._os_unfair_lock_opaque = 0;
    uint64_t v4 = objc_opt_new();
    observers = v3->_observers;
    v3->_observers = (NSMutableDictionary *)v4;

    int v6 = v3;
  }

  return v3;
}

+ (id)sharedProvider
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__WFConfiguredSystemActionProvider_sharedProvider__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedProvider_onceToken_1019 != -1) {
    dispatch_once(&sharedProvider_onceToken_1019, block);
  }
  v2 = (void *)sharedProvider_sharedProvider;
  return v2;
}

uint64_t __50__WFConfiguredSystemActionProvider_sharedProvider__block_invoke(uint64_t a1)
{
  sharedProvider_sharedProvider = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x1F41817F8]();
}

@end