@interface STStatusItemsManager
+ (id)sharedInstance;
- (NSString)description;
- (STStatusItemsManager)initWithDefaults:(id)a3;
- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 forDebug:(BOOL)a4;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)resolvedStatusItemFromStatusItems:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)validStatusItemsForStatusItems:(id)a3;
- (id)visualDescriptorForStatusItemWithIdentifier:(id)a3;
- (void)_registerForInternalDefaultsChanges;
- (void)_updateSupportedStatusItemsAndVisualDescriptorsFromBundleRecords;
- (void)recordBundlesChangedForBundleManager:(id)a3;
@end

@implementation STStatusItemsManager

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__STStatusItemsManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals_2 != -1) {
    dispatch_once(&_MergedGlobals_2, block);
  }
  v2 = (void *)qword_1EBDFC7C8;
  return v2;
}

void __38__STStatusItemsManager_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc(*(Class *)(a1 + 32));
  id v4 = [MEMORY[0x1E4FA9550] standardDefaults];
  uint64_t v2 = [v1 initWithDefaults:v4];
  v3 = (void *)qword_1EBDFC7C8;
  qword_1EBDFC7C8 = v2;
}

- (STStatusItemsManager)initWithDefaults:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)STStatusItemsManager;
  v6 = [(STStatusItemsManager *)&v10 init];
  if (v6)
  {
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4FA9360]) initWithBundleRecordClass:objc_opt_class()];
    bundleManager = v6->_bundleManager;
    v6->_bundleManager = (STBundleManager *)v7;

    objc_storeStrong((id *)&v6->_systemStatusDefaults, a3);
    [(STStatusItemsManager *)v6 _registerForInternalDefaultsChanges];
    [(STBundleManager *)v6->_bundleManager addObserver:v6];
    [(STStatusItemsManager *)v6 _updateSupportedStatusItemsAndVisualDescriptorsFromBundleRecords];
  }

  return v6;
}

- (id)resolvedStatusItemFromStatusItems:(id)a3
{
  v3 = [(STStatusItemsManager *)self validStatusItemsForStatusItems:a3];
  id v4 = [v3 anyObject];

  return v4;
}

- (id)validStatusItemsForStatusItems:(id)a3
{
  id v4 = a3;
  if (qword_1EBDFC7D8 != -1) {
    dispatch_once(&qword_1EBDFC7D8, &__block_literal_global_3);
  }
  id v5 = (id)qword_1EBDFC7D0;
  v6 = (void *)[v5 mutableCopy];
  [v6 intersectSet:v4];
  if (self->_allowAllStatusItems)
  {
    id v7 = [MEMORY[0x1E4F1CA80] setWithSet:v4];
    [v7 minusSet:qword_1EBDFC7D0];
    [v7 unionSet:v6];
    if ([v7 count]) {
      goto LABEL_7;
    }
  }
  id v7 = v6;
LABEL_7:

  return v7;
}

void __55__STStatusItemsManager_validStatusItemsForStatusItems___block_invoke()
{
  v8[13] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4FA98C0];
  v8[0] = *MEMORY[0x1E4FA98C8];
  v8[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4FA98D8];
  v8[2] = *MEMORY[0x1E4FA98D0];
  v8[3] = v1;
  uint64_t v2 = *MEMORY[0x1E4FA98E8];
  v8[4] = *MEMORY[0x1E4FA98E0];
  v8[5] = v2;
  uint64_t v3 = *MEMORY[0x1E4FA98F8];
  v8[6] = *MEMORY[0x1E4FA98F0];
  v8[7] = v3;
  uint64_t v4 = *MEMORY[0x1E4FA9908];
  v8[8] = *MEMORY[0x1E4FA9900];
  v8[9] = v4;
  v8[10] = @"com.apple.mediaremoted.status-item.call-to-action.video-route";
  v8[11] = @"com.apple.mediaremoted.status-item.call-to-action.audio-route";
  v8[12] = @"com.apple.sharing.status-item.call-to-action.ask-to-airdrop";
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:13];
  uint64_t v6 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];
  id v7 = (void *)qword_1EBDFC7D0;
  qword_1EBDFC7D0 = v6;
}

- (id)visualDescriptorForStatusItemWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(NSDictionary *)self->_visualDescriptors objectForKeyedSubscript:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [MEMORY[0x1E4FA9510] visualDescriptorForStatusItemWithIdentifier:v4];
  }
  v8 = v7;

  return v8;
}

- (void)_registerForInternalDefaultsChanges
{
  if (!self->_internalDefaultsObserver)
  {
    self->_allowAllStatusItems = [(STSystemStatusDefaults *)self->_systemStatusDefaults shouldEnableUnknownStatusItems];
    objc_initWeak(&location, self);
    systemStatusDefaults = self->_systemStatusDefaults;
    uint64_t v4 = MEMORY[0x1E4F14428];
    id v5 = MEMORY[0x1E4F14428];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __59__STStatusItemsManager__registerForInternalDefaultsChanges__block_invoke;
    v8[3] = &unk_1E6AD2408;
    objc_copyWeak(&v9, &location);
    uint64_t v6 = [(STSystemStatusDefaults *)systemStatusDefaults observeDefault:@"shouldEnableUnknownStatusItems" onQueue:v4 withBlock:v8];
    internalDefaultsObserver = self->_internalDefaultsObserver;
    self->_internalDefaultsObserver = v6;

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

uint64_t __59__STStatusItemsManager__registerForInternalDefaultsChanges__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained;
    WeakRetained = (id *)MEMORY[0x1D9484EB0]("-[STStatusItemsManager _registerForInternalDefaultsChanges]_block_invoke");
    if (WeakRetained) {
      WeakRetained = (id *)[v4[3] shouldEnableUnknownStatusItems];
    }
    uint64_t v2 = v4;
    if (*((unsigned __int8 *)v4 + 40) != WeakRetained) {
      *((unsigned char *)v4 + 40) = (_BYTE)WeakRetained;
    }
  }
  return MEMORY[0x1F41817F8](WeakRetained, v2);
}

- (void)recordBundlesChangedForBundleManager:(id)a3
{
  uint64_t v4 = (STBundleManager *)a3;
  objc_initWeak(&location, self);
  if (self->_bundleManager == v4)
  {
    objc_copyWeak(&v5, &location);
    BSDispatchMain();
    objc_destroyWeak(&v5);
  }
  objc_destroyWeak(&location);
}

void __61__STStatusItemsManager_recordBundlesChangedForBundleManager___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateSupportedStatusItemsAndVisualDescriptorsFromBundleRecords];
}

- (void)_updateSupportedStatusItemsAndVisualDescriptorsFromBundleRecords
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v4 = [(STBundleManager *)self->_bundleManager recordIdentifiers];
  id v5 = STSystemStatusLogBundleLoading();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v35 = v4;
    _os_log_impl(&dword_1D8320000, v5, OS_LOG_TYPE_DEFAULT, "Bundle manager reports status item bundle identifiers changed: %{public}@", buf, 0xCu);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v30 objects:v39 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v31;
    uint64_t v21 = *(void *)v31;
    v22 = self;
    do
    {
      uint64_t v9 = 0;
      uint64_t v23 = v7;
      do
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(obj);
        }
        objc_super v10 = *(void **)(*((void *)&v30 + 1) + 8 * v9);
        v11 = [(STBundleManager *)self->_bundleManager bundleRecordForRecordIdentifier:v10];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v25 = v9;
          long long v28 = 0u;
          long long v29 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          v12 = [v11 statusItemIdentifiers];
          uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v38 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v27;
            do
            {
              for (uint64_t i = 0; i != v14; ++i)
              {
                if (*(void *)v27 != v15) {
                  objc_enumerationMutation(v12);
                }
                v17 = *(void **)(*((void *)&v26 + 1) + 8 * i);
                v18 = [v11 visualDescriptorForStatusItemWithIdentifier:v17];
                if (v18)
                {
                  [(NSDictionary *)v3 setValue:v18 forKey:v17];
                  v19 = STSystemStatusLogBundleLoading();
                  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138543618;
                    v35 = v17;
                    __int16 v36 = 2114;
                    v37 = v18;
                    _os_log_debug_impl(&dword_1D8320000, v19, OS_LOG_TYPE_DEBUG, "Status item identifier %{public}@ associated with visual descriptor %{public}@", buf, 0x16u);
                  }
                }
                else
                {
                  v19 = STSystemStatusLogBundleLoading();
                  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138477827;
                    v35 = v17;
                    _os_log_error_impl(&dword_1D8320000, v19, OS_LOG_TYPE_ERROR, "No valid visual descriptor for status item '%{private}@'", buf, 0xCu);
                  }
                }
              }
              uint64_t v14 = [v12 countByEnumeratingWithState:&v26 objects:v38 count:16];
            }
            while (v14);
            uint64_t v8 = v21;
            self = v22;
            uint64_t v7 = v23;
          }
          uint64_t v9 = v25;
        }
        else
        {
          v12 = STSystemStatusLogBundleLoading();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138477827;
            v35 = v10;
            _os_log_error_impl(&dword_1D8320000, v12, OS_LOG_TYPE_ERROR, "Bundle %{private}@ is of unexpected type, expected 'StatusItems'", buf, 0xCu);
          }
        }

        ++v9;
      }
      while (v9 != v7);
      uint64_t v7 = [obj countByEnumeratingWithState:&v30 objects:v39 count:16];
    }
    while (v7);
  }

  visualDescriptors = self->_visualDescriptors;
  self->_visualDescriptors = v3;
}

- (NSString)description
{
  return (NSString *)[(STStatusItemsManager *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  uint64_t v2 = [(STStatusItemsManager *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(STStatusItemsManager *)self descriptionBuilderWithMultilinePrefix:a3];
  uint64_t v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(STStatusItemsManager *)self _descriptionBuilderWithMultilinePrefix:a3 forDebug:1];
  uint64_t v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return [(STStatusItemsManager *)self _descriptionBuilderWithMultilinePrefix:a3 forDebug:0];
}

- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 forDebug:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(STStatusItemsManager *)self succinctDescriptionBuilder];
  [v7 setUseDebugDescription:v4];
  [v7 setActiveMultilinePrefix:v6];

  [v7 appendDictionarySection:self->_visualDescriptors withName:@"registeredVisualDescriptors" skipIfEmpty:0];
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalDefaultsObserver, 0);
  objc_storeStrong((id *)&self->_systemStatusDefaults, 0);
  objc_storeStrong((id *)&self->_visualDescriptors, 0);
  objc_storeStrong((id *)&self->_bundleManager, 0);
}

@end