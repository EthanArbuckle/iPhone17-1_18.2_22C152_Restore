@interface PXSettings
+ (BOOL)ignoresKey:(id)a3;
+ (NSSet)transientProperties;
+ (NSString)suiteName;
+ (id)_signatureDictionaryWithDefaultSettings:(id *)a3;
+ (id)_userDefaults;
+ (id)createSharedInstance;
+ (id)sharedInstance;
+ (void)setSuiteName:(id)a3;
- (BOOL)_setOverrideValuesFromDictionary:(id)a3;
- (BOOL)hasDefaultValues;
- (BOOL)hasUserDefaultsOverrides;
- (BOOL)isTransientKey:(id)a3;
- (BOOL)isTransientKeyPath:(id)a3;
- (BOOL)suppressesIntrospectionOnCustomerInstalls;
- (NSArray)reparentedRootSettings;
- (PXSettings)parentSettings;
- (id)_archiveDictionaryWithSignature;
- (id)archiveDictionary;
- (id)archiveValueForKey:(id)a3;
- (int64_t)version;
- (void)_resetValuesThatChangedBetweenCurrentDefaultValues:(id)a3 andArchivedDefaultValues:(id)a4 defaultSettings:(id)a5;
- (void)_validateArchivableValue:(id)a3 forKey:(id)a4;
- (void)_willArchiveSettings:(id)a3;
- (void)addDeferredKeyObserver:(id)a3;
- (void)addDeferredKeyPathObserver:(id)a3;
- (void)addKeyObserver:(id)a3;
- (void)addKeyPathObserver:(id)a3;
- (void)applyArchiveValue:(id)a3 forKey:(id)a4;
- (void)clearManualOverrides;
- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3;
- (void)removeKeyObserver:(id)a3;
- (void)removeKeyPathObserver:(id)a3;
- (void)restoreDefaultValues;
- (void)save;
- (void)setVersion:(int64_t)a3;
@end

@implementation PXSettings

- (BOOL)suppressesIntrospectionOnCustomerInstalls
{
  return 1;
}

+ (id)createSharedInstance
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (!PFOSVariantHasInternalUI()
    || !PFOSVariantHasInternalDiagnostics()
    || (PLIsCamera() & 1) != 0)
  {
    id v3 = 0;
LABEL_5:
    v4 = (void *)[objc_alloc((Class)a1) initWithDefaultValues];
    goto LABEL_6;
  }
  v8 = [a1 _userDefaults];
  v9 = [a1 _defaultsKey];
  v10 = [v8 objectForKey:v9];

  v11 = [v10 objectForKeyedSubscript:@"PXSettingsArchiveKey"];
  v12 = [a1 _userDefaults];
  v13 = [v12 objectForKey:@"PXSettingsOverride"];
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = ___ExpandOverrideDictionary_block_invoke;
  v25[3] = &unk_1E5DD0860;
  id v3 = v14;
  id v26 = v3;
  [v13 enumerateKeysAndObjectsUsingBlock:v25];

  v15 = [MEMORY[0x1E4FB1438] sharedApplication];
  LODWORD(v13) = [v15 launchedToTest];

  if (!v13)
  {
    id v24 = 0;
    v16 = [a1 _signatureDictionaryWithDefaultSettings:&v24];
    id v17 = v24;
    v18 = [v10 objectForKeyedSubscript:@"PXSettingsSignatureKey"];
    v19 = [v16 objectForKeyedSubscript:@"PXSettingsSignatureVersionKey"];
    uint64_t v20 = [v19 integerValue];
    v21 = [v18 objectForKeyedSubscript:@"PXSettingsSignatureVersionKey"];
    LOBYTE(v20) = v20 == [v21 integerValue];

    if (v20)
    {
      if (v11)
      {
        v4 = [a1 settingsFromArchiveDictionary:v11];
        v22 = [v16 objectForKeyedSubscript:@"PXSettingsSignatureDefaultValuesKey"];
        v23 = [v18 objectForKeyedSubscript:@"PXSettingsSignatureDefaultValuesKey"];
        [v4 _resetValuesThatChangedBetweenCurrentDefaultValues:v22 andArchivedDefaultValues:v23 defaultSettings:v17];

LABEL_19:
        goto LABEL_20;
      }
    }
    else
    {

      v11 = 0;
    }
    v4 = 0;
    goto LABEL_19;
  }
  if (!v11)
  {

    goto LABEL_5;
  }
  v4 = [a1 settingsFromArchiveDictionary:v11];
LABEL_20:

  if (!v4) {
    goto LABEL_5;
  }
LABEL_6:
  if (v3)
  {
    v5 = [a1 _defaultsKey];
    v6 = [v3 objectForKey:v5];

    [v4 _setOverrideValuesFromDictionary:v6];
  }

  return v4;
}

- (void)addDeferredKeyObserver:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  objc_initWeak(&from, v4);
  v5 = +[PXPreloadScheduler sharedScheduler];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__PXSettings_addDeferredKeyObserver___block_invoke;
  v6[3] = &unk_1E5DD0838;
  objc_copyWeak(&v7, &location);
  objc_copyWeak(&v8, &from);
  [v5 scheduleMainQueueTask:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __37__PXSettings_addDeferredKeyObserver___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained addKeyObserver:v2];
}

- (void)addKeyObserver:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PXSettings;
  [(PTSettings *)&v14 addKeyObserver:v4];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = [(PXSettings *)self reparentedRootSettings];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) addKeyObserver:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }
}

- (NSArray)reparentedRootSettings
{
  return self->_reparentedRootSettings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reparentedRootSettings, 0);
  objc_storeStrong((id *)&self->_cachedTransientProperties, 0);
  objc_storeStrong((id *)&self->_archivedSettings, 0);
}

- (void)setVersion:(int64_t)a3
{
  self->_version = a3;
}

- (int64_t)version
{
  return self->_version;
}

- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3
{
  id v4 = a3;
  id v7 = [(PXSettings *)self _archiveDictionaryWithSignature];
  v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  [v4 addAttachmentWithDictionary:v7 name:v6];
}

- (void)addDeferredKeyPathObserver:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  objc_initWeak(&from, v4);
  v5 = +[PXPreloadScheduler sharedScheduler];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__PXSettings_addDeferredKeyPathObserver___block_invoke;
  v6[3] = &unk_1E5DD0838;
  objc_copyWeak(&v7, &location);
  objc_copyWeak(&v8, &from);
  [v5 scheduleMainQueueTask:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __41__PXSettings_addDeferredKeyPathObserver___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained addKeyPathObserver:v2];
}

- (void)removeKeyPathObserver:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PXSettings;
  [(PTSettings *)&v14 removeKeyPathObserver:v4];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = [(PXSettings *)self reparentedRootSettings];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) removeKeyPathObserver:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)addKeyPathObserver:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PXSettings;
  [(PTSettings *)&v14 addKeyPathObserver:v4];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = [(PXSettings *)self reparentedRootSettings];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) addKeyPathObserver:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)removeKeyObserver:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PXSettings;
  [(PTSettings *)&v14 removeKeyObserver:v4];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = [(PXSettings *)self reparentedRootSettings];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) removeKeyObserver:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)applyArchiveValue:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(PXSettings *)self isTransientKey:v7])
  {
    v8.receiver = self;
    v8.super_class = (Class)PXSettings;
    [(PTSettings *)&v8 applyArchiveValue:v6 forKey:v7];
  }
}

- (id)archiveValueForKey:(id)a3
{
  id v4 = a3;
  if ([(PXSettings *)self isTransientKey:v4])
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PXSettings;
    v5 = [(PTSettings *)&v7 archiveValueForKey:v4];
  }

  return v5;
}

- (void)_validateArchivableValue:(id)a3 forKey:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!CFPropertyListIsValid(v7, kCFPropertyListBinaryFormat_v1_0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v17 = [MEMORY[0x1E4F28B00] currentHandler];
        v8,
        v8,
        v7);

      abort();
    }
    id v9 = v7;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v10 = [v9 keyEnumerator];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          uint64_t v16 = [v9 objectForKeyedSubscript:v15];
          [(PXSettings *)self _validateArchivableValue:v16 forKey:v15];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v12);
    }
  }
}

- (id)archiveDictionary
{
  [(PXSettings *)self _willArchiveSettings:self];
  v5.receiver = self;
  v5.super_class = (Class)PXSettings;
  id v3 = [(PTSettings *)&v5 archiveDictionary];
  return v3;
}

- (void)_willArchiveSettings:(id)a3
{
  id v4 = a3;
  if (_PXSettingsRootIsSaving == 1)
  {
    id v7 = v4;
    objc_super v5 = [(PXSettings *)self parentSettings];
    id v6 = v5;
    if (v5) {
      [v5 _willArchiveSettings:v7];
    }
    else {
      [(NSMutableSet *)self->_archivedSettings addObject:v7];
    }

    id v4 = v7;
  }
}

- (id)_archiveDictionaryWithSignature
{
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
  _PXSettingsRootIsSaving = 1;
  id v4 = [(PXSettings *)self archiveDictionary];
  [v3 setObject:v4 forKeyedSubscript:@"PXSettingsArchiveKey"];

  _PXSettingsRootIsSaving = 0;
  objc_super v5 = [(id)objc_opt_class() _signatureDictionaryWithDefaultSettings:0];
  [v3 setObject:v5 forKeyedSubscript:@"PXSettingsSignatureKey"];

  id v6 = (void *)[v3 copy];
  return v6;
}

- (void)save
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if PFOSVariantHasInternalUI() && (PFOSVariantHasInternalDiagnostics())
  {
    id v3 = [(PXSettings *)self parentSettings];
    if (v3)
    {
      id v4 = v3;
      [v3 save];
    }
    else
    {
      if (self->_hasUserDefaultsOverrides)
      {
        objc_super v5 = PLUIGetLog();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v31 = self;
          __int16 v32 = 2112;
          v33 = @"PXSettingsOverride";
          _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_ERROR, "%@: Will skip attempt to save a settings tree with some settings overridden. It would conflict with manual override key \"%@\"", buf, 0x16u);
        }
      }
      else
      {
        id v6 = [MEMORY[0x1E4F1CA80] set];
        archivedSettings = self->_archivedSettings;
        self->_archivedSettings = v6;

        objc_super v5 = [(id)objc_opt_class() _userDefaults];
        id v8 = [(id)objc_opt_class() _defaultsKey];
        id v9 = [(PXSettings *)self _archiveDictionaryWithSignature];
        [(PXSettings *)self _validateArchivableValue:v9 forKey:v8];
        [v5 setObject:v9 forKey:v8];
        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v10 = self->_archivedSettings;
        uint64_t v11 = [(NSMutableSet *)v10 countByEnumeratingWithState:&v25 objects:v34 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v26;
          do
          {
            uint64_t v14 = 0;
            do
            {
              if (*(void *)v26 != v13) {
                objc_enumerationMutation(v10);
              }
              [*(id *)(*((void *)&v25 + 1) + 8 * v14++) performPostSaveActions];
            }
            while (v12 != v14);
            uint64_t v12 = [(NSMutableSet *)v10 countByEnumeratingWithState:&v25 objects:v34 count:16];
          }
          while (v12);
        }

        uint64_t v15 = self->_archivedSettings;
        self->_archivedSettings = 0;

        [v5 synchronize];
      }

      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      uint64_t v16 = [(PXSettings *)self reparentedRootSettings];
      uint64_t v17 = [v16 countByEnumeratingWithState:&v21 objects:v29 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v22;
        do
        {
          uint64_t v20 = 0;
          do
          {
            if (*(void *)v22 != v19) {
              objc_enumerationMutation(v16);
            }
            [*(id *)(*((void *)&v21 + 1) + 8 * v20++) save];
          }
          while (v18 != v20);
          uint64_t v18 = [v16 countByEnumeratingWithState:&v21 objects:v29 count:16];
        }
        while (v18);
      }

      id v4 = 0;
    }
  }
  else
  {
    id v4 = PLUIGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_FAULT, "internal settings can't be saved", buf, 2u);
    }
  }
}

- (void)clearManualOverrides
{
  id v2 = [(PXSettings *)self parentSettings];
  id v4 = v2;
  if (v2)
  {
    [v2 clearManualOverrides];
  }
  else
  {
    id v3 = [(id)objc_opt_class() _userDefaults];
    [v3 removeObjectForKey:@"PXSettingsOverride"];
  }
}

- (BOOL)hasDefaultValues
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init((Class)objc_opt_class());
  id v4 = [(PXSettings *)self archiveDictionary];
  objc_super v5 = [v3 archiveDictionary];
  char v6 = [v4 isEqual:v5];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = [(PXSettings *)self reparentedRootSettings];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        if (v6) {
          char v6 = [*(id *)(*((void *)&v13 + 1) + 8 * i) hasDefaultValues];
        }
        else {
          char v6 = 0;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  return v6;
}

- (void)restoreDefaultValues
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)PXSettings;
  [(PTSettings *)&v12 restoreDefaultValues];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v3 = [(PXSettings *)self reparentedRootSettings];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) restoreDefaultValues];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
    }
    while (v5);
  }
}

- (BOOL)_setOverrideValuesFromDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  long long v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47__PXSettings__setOverrideValuesFromDictionary___block_invoke;
  v9[3] = &unk_1E5DD0810;
  v9[4] = self;
  v9[5] = &v10;
  [v4 enumerateKeysAndObjectsUsingBlock:v9];
  uint64_t v5 = v11;
  BOOL v6 = self->_hasUserDefaultsOverrides || *((unsigned char *)v11 + 24) != 0;
  self->_hasUserDefaultsOverrides = v6;
  char v7 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __47__PXSettings__setOverrideValuesFromDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  long long v8 = [*(id *)(a1 + 32) valueForKey:v5];
  objc_opt_class();
  char v9 = objc_opt_isKindOfClass();
  char v10 = v9;
  if (isKindOfClass)
  {
    if (v9)
    {
      char v11 = [v8 _setOverrideValuesFromDictionary:v6];
      uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
      if (*(unsigned char *)(v12 + 24)) {
        char v13 = 1;
      }
      else {
        char v13 = v11;
      }
      *(unsigned char *)(v12 + 24) = v13;
      goto LABEL_17;
    }
    long long v15 = PLUIGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = *(void *)(a1 + 32);
      int v20 = 138412546;
      uint64_t v21 = v18;
      __int16 v22 = 2112;
      id v23 = v5;
      uint64_t v17 = "%@: Unable to find child settings object for key \"%@\"";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  uint64_t v14 = PLUIGetLog();
  long long v15 = v14;
  if (v10)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = *(void *)(a1 + 32);
      int v20 = 138412546;
      uint64_t v21 = v16;
      __int16 v22 = 2112;
      id v23 = v5;
      uint64_t v17 = "%@: Unable to override value for key \"%@\" because it is a child settings tree";
LABEL_12:
      _os_log_impl(&dword_1A9AE7000, v15, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v20, 0x16u);
    }
LABEL_13:

    goto LABEL_17;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = *(void *)(a1 + 32);
    int v20 = 138412546;
    uint64_t v21 = v19;
    __int16 v22 = 2112;
    id v23 = v5;
    _os_log_impl(&dword_1A9AE7000, v15, OS_LOG_TYPE_DEFAULT, "%@: Overriding value for key \"%@\"", (uint8_t *)&v20, 0x16u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  [*(id *)(a1 + 32) setValue:v6 forKey:v5];
LABEL_17:
}

- (BOOL)hasUserDefaultsOverrides
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL hasUserDefaultsOverrides = self->_hasUserDefaultsOverrides;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = [(PXSettings *)self reparentedRootSettings];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  char v5 = hasUserDefaultsOverrides;
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        if (v5) {
          char v5 = 1;
        }
        else {
          char v5 = [*(id *)(*((void *)&v10 + 1) + 8 * i) hasUserDefaultsOverrides];
        }
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return v5;
}

- (void)_resetValuesThatChangedBetweenCurrentDefaultValues:(id)a3 andArchivedDefaultValues:(id)a4 defaultSettings:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v11 = [MEMORY[0x1E4F1CA48] array];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __106__PXSettings__resetValuesThatChangedBetweenCurrentDefaultValues_andArchivedDefaultValues_defaultSettings___block_invoke;
  v24[3] = &unk_1E5DD07E8;
  v24[4] = self;
  id v12 = v9;
  id v25 = v12;
  id v13 = v10;
  id v26 = v13;
  id v14 = v11;
  id v27 = v14;
  [v8 enumerateKeysAndObjectsUsingBlock:v24];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v15 = v14;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        -[PXSettings defaultValueDidChangeForKey:](self, "defaultValueDidChangeForKey:", *(void *)(*((void *)&v20 + 1) + 8 * v19++), (void)v20);
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v17);
  }
}

void __106__PXSettings__resetValuesThatChangedBetweenCurrentDefaultValues_andArchivedDefaultValues_defaultSettings___block_invoke(id *a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  if (([a1[4] isTransientKey:v13] & 1) == 0)
  {
    uint64_t v6 = [a1[5] objectForKeyedSubscript:v13];
    uint64_t v7 = [a1[6] valueForKey:v13];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ([a1[4] valueForKey:v13], (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v9 = (void *)v8;
      id v10 = [a1[6] valueForKey:v13];
      [v9 _resetValuesThatChangedBetweenCurrentDefaultValues:v5 andArchivedDefaultValues:v6 defaultSettings:v10];
    }
    else if (([v5 isEqual:v6] & 1) == 0)
    {
      int v11 = [v13 isEqualToString:@"version"];
      id v12 = a1[4];
      if (v11) {
        [v12 restoreDefaultValues];
      }
      else {
        [v12 setValue:v7 forKey:v13];
      }
      [a1[7] addObject:v13];
    }
  }
}

- (BOOL)isTransientKeyPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 rangeOfString:@"." options:2];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    char v7 = [(PXSettings *)self isTransientKey:v4];
  }
  else
  {
    uint64_t v8 = v5;
    uint64_t v9 = v6;
    id v10 = [v4 substringToIndex:v5];
    int v11 = [(PXSettings *)self valueForKey:v10];
    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }

    id v13 = [v4 substringFromIndex:v8 + v9];
    char v7 = [v12 isTransientKeyPath:v13];
  }
  return v7;
}

- (BOOL)isTransientKey:(id)a3
{
  id v4 = a3;
  cachedTransientProperties = self->_cachedTransientProperties;
  if (!cachedTransientProperties)
  {
    uint64_t v6 = [(id)objc_opt_class() transientProperties];
    char v7 = self->_cachedTransientProperties;
    self->_cachedTransientProperties = v6;

    cachedTransientProperties = self->_cachedTransientProperties;
  }
  if ([(NSSet *)cachedTransientProperties containsObject:v4]) {
    char v8 = 1;
  }
  else {
    char v8 = [v4 hasPrefix:@"_internal_"];
  }

  return v8;
}

- (PXSettings)parentSettings
{
  return 0;
}

+ (id)_signatureDictionaryWithDefaultSettings:(id *)a3
{
  uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v6 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDefaultValues];
  char v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "version"));
  [v5 setObject:v7 forKeyedSubscript:@"PXSettingsSignatureVersionKey"];

  char v8 = [v6 archiveDictionary];
  [v5 setObject:v8 forKeyedSubscript:@"PXSettingsSignatureDefaultValuesKey"];

  if (a3) {
    *a3 = v6;
  }

  return v5;
}

+ (id)_userDefaults
{
  id v2 = [a1 suiteName];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:v2];
  }
  else
  {
    uint64_t v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  }
  id v4 = (void *)v3;

  return v4;
}

+ (NSSet)transientProperties
{
  if (transientProperties_onceToken_283479 != -1) {
    dispatch_once(&transientProperties_onceToken_283479, &__block_literal_global_283480);
  }
  id v2 = (void *)transientProperties_transientProperties_283481;
  return (NSSet *)v2;
}

void __33__PXSettings_transientProperties__block_invoke()
{
  v8[4] = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v1 = NSStringFromSelector(sel_parentSettings);
  v8[0] = v1;
  id v2 = NSStringFromSelector(sel_hasDefaultValues);
  v8[1] = v2;
  uint64_t v3 = NSStringFromSelector(sel_hasUserDefaultsOverrides);
  v8[2] = v3;
  id v4 = NSStringFromSelector(sel_reparentedRootSettings);
  v8[3] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];
  uint64_t v6 = [v0 initWithArray:v5];
  char v7 = (void *)transientProperties_transientProperties_283481;
  transientProperties_transientProperties_283481 = v6;
}

+ (BOOL)ignoresKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 transientProperties];
  char v6 = [v5 containsObject:v4];

  return v6;
}

+ (id)sharedInstance
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"PXSettings.m" lineNumber:100 description:@"Concrete subclass must implement. Use either PXSettingsImplementRootSettings() or PXSettingsImplementChildSettings() macro for this."];

  return 0;
}

+ (void)setSuiteName:(id)a3
{
  uint64_t v3 = [a3 copy];
  id v4 = (void *)_suiteName;
  _suiteName = v3;
}

+ (NSString)suiteName
{
  return (NSString *)(id)_suiteName;
}

@end