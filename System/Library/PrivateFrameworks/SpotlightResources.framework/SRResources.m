@interface SRResources
- (BOOL)BOOLeanForKey:(id)a3;
- (BOOL)BOOLeanForKey:(id)a3 didFailWithError:(id *)a4;
- (BOOL)autoUpdatingLocale;
- (BOOL)hasUpdates;
- (NSLocale)locale;
- (NSString)client;
- (NSString)description;
- (NSString)experimentId;
- (NSString)experimentNamespaceId;
- (NSString)experimentTreatmentId;
- (SRResources)initWithClient:(id)a3 locale:(id)a4 options:(id)a5;
- (double)doubleForKey:(id)a3;
- (double)doubleForKey:(id)a3 didFailWithError:(id *)a4;
- (id)assetPathsForContentType:(id)a3;
- (id)currentExperimentTrialManager;
- (id)fetchBooleanParameter:(id)a3;
- (id)fetchDoubleParameter:(id)a3;
- (id)fetchFilePathParameter:(id)a3;
- (id)fetchLongParameter:(id)a3;
- (id)fetchParameter:(id)a3 checkForPositive:(BOOL)a4;
- (id)fetchStringParameter:(id)a3;
- (id)filePathArrayForKey:(id)a3;
- (id)filePathArrayForKey:(id)a3 didFailWithError:(id *)a4;
- (id)filePathForKey:(id)a3;
- (id)filePathForKey:(id)a3 didFailWithError:(id *)a4;
- (id)getFeedbackData;
- (id)getTTRLogs;
- (id)getTrialExperimentId;
- (id)getTrialNamespaceId;
- (id)getTrialRolloutId;
- (id)getTrialTreatmentId;
- (id)objectForKey:(id)a3;
- (id)objectForKey:(id)a3 didFailWithError:(id *)a4;
- (id)objectForKey:(id)a3 withType:(int64_t *)a4 didFailWithError:(id *)a5;
- (id)parameterUpdates;
- (id)stringForKey:(id)a3;
- (id)stringForKey:(id)a3 didFailWithError:(id *)a4;
- (id)updateWithNewOptions:(id)a3;
- (int)experimentDeploymentId;
- (int)getTrialExperimentDeploymentId;
- (int)getTrialRolloutDeploymentId;
- (int64_t)longForKey:(id)a3;
- (int64_t)longForKey:(id)a3 didFailWithError:(id *)a4;
- (unsigned)experimentVersion;
- (void)appendFeedbackData:(id)a3;
- (void)dealloc;
- (void)didUpdateDefaults;
- (void)logForTrigger:(id)a3 queryID:(int64_t)a4;
- (void)refreshTrial;
- (void)setAutoUpdatingLocale:(BOOL)a3;
- (void)setExperimentDeploymentId:(int)a3;
- (void)setExperimentId:(id)a3;
- (void)setExperimentNamespaceId:(id)a3;
- (void)setExperimentTreatmentId:(id)a3;
- (void)setExperimentVersion:(unsigned int)a3;
- (void)setLocale:(id)a3;
- (void)setParameterUpdates:(id)a3;
- (void)updateLocale;
@end

@implementation SRResources

- (NSLocale)locale
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)[(NSLocale *)v2->_locale copy];
  objc_sync_exit(v2);

  return (NSLocale *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_experimentTreatmentId, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);
  objc_storeStrong((id *)&self->_experimentNamespaceId, 0);
  objc_storeStrong(&self->_parameterUpdates, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_liveAssetBundle, 0);
  objc_storeStrong((id *)&self->_feedbackData, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_overrides, 0);
}

- (void)dealloc
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v4 = SRLogCategoryGeneral();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    client = self->_client;
    v6 = [(NSLocale *)self->_locale localeIdentifier];
    *(_DWORD *)buf = 138412546;
    v20 = client;
    __int16 v21 = 2112;
    v22 = v6;
    _os_log_impl(&dword_25E378000, v4, OS_LOG_TYPE_DEFAULT, "SRResources dealloc (%@, %@)", buf, 0x16u);
  }
  v7 = +[SRDefaultsManager sharedDefaultsManager];
  [v7 unregisterDelegate:self];

  options = self->_options;
  if (options)
  {
    v9 = [(NSMutableDictionary *)options objectForKeyedSubscript:@"SRResourcesOwner"];
  }
  else
  {
    v9 = 0;
  }
  v10 = SRLogCategoryLifeCycle();
  v11 = v10;
  unint64_t v12 = dealloc_index;
  os_signpost_id_t v13 = ++dealloc_index;
  if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    v14 = [(NSString *)self->_client UTF8String];
    locale = self->_locale;
    if (locale)
    {
      id v2 = [(NSLocale *)self->_locale localeIdentifier];
      v16 = (const char *)[v2 UTF8String];
      if (v9)
      {
LABEL_10:
        v17 = (const char *)[v9 UTF8String];
        goto LABEL_13;
      }
    }
    else
    {
      v16 = "none";
      if (v9) {
        goto LABEL_10;
      }
    }
    v17 = "unknown";
LABEL_13:
    *(_DWORD *)buf = 136315650;
    v20 = (void *)v14;
    __int16 v21 = 2080;
    v22 = v16;
    __int16 v23 = 2080;
    v24 = v17;
    _os_signpost_emit_with_name_impl(&dword_25E378000, v11, OS_SIGNPOST_EVENT, v13, "SRResourcesDestroy", "client=%s, locale=%s, caller=%s", buf, 0x20u);
    if (locale) {
  }
    }
  v18.receiver = self;
  v18.super_class = (Class)SRResources;
  [(SRResources *)&v18 dealloc];
}

- (id)fetchParameter:(id)a3 checkForPositive:(BOOL)a4
{
  BOOL v51 = a4;
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = +[SRDefaultsManager sharedDefaultsManager];
  v7 = [(SRResources *)self client];
  v8 = [v6 parametersOfNamespaceWithName:v5 client:v7];

  if (v8)
  {
    v9 = [v8 allValues];
    v10 = v9;
    if (!v9 || ![v9 count])
    {
      unint64_t v12 = SRLogCategoryGeneral();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[SRResources fetchParameter:checkForPositive:]();
      }
      v15 = 0;
      goto LABEL_66;
    }
    v11 = [v10 objectAtIndex:0];
    unint64_t v12 = v11;
    if (!v11)
    {
      v16 = SRLogCategoryGeneral();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        -[SRResources fetchParameter:checkForPositive:]();
      }
      v15 = 0;
      goto LABEL_65;
    }
    char v13 = [v11 flag];
    char v14 = v13;
    v50 = v10;
    char v47 = v13;
    if ((v13 & 2) == 0)
    {
      v15 = 0;
LABEL_38:
      v48 = v12;
      v49 = v8;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id v29 = v8;
      uint64_t v30 = [v29 countByEnumeratingWithState:&v53 objects:v61 count:16];
      if (v30)
      {
        uint64_t v31 = v30;
        uint64_t v52 = *(void *)v54;
        while (2)
        {
          for (uint64_t i = 0; i != v31; ++i)
          {
            if (*(void *)v54 != v52) {
              objc_enumerationMutation(v29);
            }
            uint64_t v33 = *(void *)(*((void *)&v53 + 1) + 8 * i);
            v34 = [v29 objectForKeyedSubscript:v33];

            os_unfair_lock_lock((os_unfair_lock_t)&sTrialParameterListLock);
            v35 = [(id)sTrialParameterList objectForKeyedSubscript:v33];
            id v36 = v5;
            v37 = [v35 objectForKeyedSubscript:v5];

            if ([v37 hasValueFromTrial])
            {
              v38 = [v37 parameter];
              uint64_t v39 = [v38 copy];

              v40 = SRLogCategoryGeneral();
              if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412546;
                id v58 = v36;
                __int16 v59 = 2112;
                uint64_t v60 = v33;
                _os_log_debug_impl(&dword_25E378000, v40, OS_LOG_TYPE_DEBUG, "Parameter %@ has value from Trial namespace %@", buf, 0x16u);
              }

              v34 = (void *)v39;
            }
            os_unfair_lock_unlock((os_unfair_lock_t)&sTrialParameterListLock);
            if (v34
              && ([v34 isNil] & 1) == 0
              && (![v34 isLong] || !v51 || (objc_msgSend(v34, "isPositiveLong") & 1) != 0))
            {
              v16 = v34;

              v15 = v16;
              id v5 = v36;
              v8 = v49;
              v10 = v50;
              unint64_t v12 = v48;
              goto LABEL_65;
            }
            v41 = [v29 objectForKeyedSubscript:v33];
            v15 = (void *)[v41 copy];

            id v5 = v36;
          }
          uint64_t v31 = [v29 countByEnumeratingWithState:&v53 objects:v61 count:16];
          if (v31) {
            continue;
          }
          break;
        }
      }

      if ((~v47 & 0xA) != 0)
      {
        v8 = v49;
        v10 = v50;
        unint64_t v12 = v48;
      }
      else
      {
        os_unfair_lock_lock(&sUserDefaultsParameterListLock);
        v42 = [(id)sUserDefaultsParameterList objectForKeyedSubscript:v5];

        v8 = v49;
        v10 = v50;
        if (v42)
        {
          v43 = [(id)sUserDefaultsParameterList objectForKeyedSubscript:v5];
          uint64_t v44 = [v43 copy];

          v45 = SRLogCategoryGeneral();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG)) {
            -[SRResources fetchParameter:checkForPositive:].cold.4();
          }

          v15 = (void *)v44;
        }
        unint64_t v12 = v48;
        os_unfair_lock_unlock(&sUserDefaultsParameterListLock);
        if (v15 && ([v15 isNil] & 1) == 0 && objc_msgSend(v15, "isLong") && v51) {
          [v15 isPositiveLong];
        }
      }
      goto LABEL_66;
    }
    if ((v13 & 0x10) != 0)
    {
      os_unfair_lock_lock(&sUserDefaultsParameterListLock);
      v17 = [(id)sUserDefaultsParameterList objectForKeyedSubscript:v5];

      if (v17)
      {
        objc_super v18 = [(id)sUserDefaultsParameterList objectForKeyedSubscript:v5];
        v15 = (void *)[v18 copy];

        v19 = SRLogCategoryGeneral();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
          -[SRResources fetchParameter:checkForPositive:].cold.4();
        }

        os_unfair_lock_unlock(&sUserDefaultsParameterListLock);
        if (v15
          && ([v15 isNil] & 1) == 0
          && (![v15 isLong] || !v51 || (objc_msgSend(v15, "isPositiveLong") & 1) != 0))
        {
          goto LABEL_66;
        }
LABEL_28:
        if ((v14 & 4) == 0) {
          goto LABEL_38;
        }
        v20 = [(SRResources *)self client];
        __int16 v21 = +[SSTrialManager currentTrialManagerForClient:v20];

        if (v21)
        {
          v22 = [v21 namespaceId];
          os_unfair_lock_lock((os_unfair_lock_t)&sTrialParameterListLock);
          __int16 v23 = [(id)sTrialParameterList objectForKeyedSubscript:v22];
          v24 = [v23 objectForKeyedSubscript:v5];

          if ([v24 hasValueFromTrial])
          {
            id v25 = v5;
            v26 = [v24 parameter];
            uint64_t v27 = [v26 copy];

            v28 = SRLogCategoryGeneral();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
              -[SRResources fetchParameter:checkForPositive:].cold.5();
            }

            v15 = (void *)v27;
            id v5 = v25;
          }
          os_unfair_lock_unlock((os_unfair_lock_t)&sTrialParameterListLock);
          if (v15
            && ([v15 isNil] & 1) == 0
            && (![v15 isLong] || !v51 || (objc_msgSend(v15, "isPositiveLong") & 1) != 0))
          {
            v16 = v15;

            v15 = v16;
LABEL_65:

LABEL_66:
            goto LABEL_67;
          }
        }
        goto LABEL_38;
      }
      os_unfair_lock_unlock(&sUserDefaultsParameterListLock);
    }
    v15 = 0;
    goto LABEL_28;
  }
  v10 = SRLogCategoryGeneral();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[SRResources fetchParameter:checkForPositive:]();
  }
  v15 = 0;
LABEL_67:

  return v15;
}

- (SRResources)initWithClient:(id)a3 locale:(id)a4 options:(id)a5
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  unint64_t v12 = SRLogCategoryGeneral();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    char v13 = [v10 localeIdentifier];
    *(_DWORD *)buf = 138412546;
    id v42 = v9;
    __int16 v43 = 2112;
    uint64_t v44 = v13;
    _os_log_impl(&dword_25E378000, v12, OS_LOG_TYPE_DEFAULT, "SRResources init (%@, %@)", buf, 0x16u);
  }
  v40.receiver = self;
  v40.super_class = (Class)SRResources;
  char v14 = [(SRResources *)&v40 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_client, a3);
    if (v11) {
      v16 = (NSMutableDictionary *)[v11 mutableCopy];
    }
    else {
      v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    }
    options = v15->_options;
    v15->_options = v16;

    uint64_t v18 = [MEMORY[0x263EFF990] data];
    feedbackData = v15->_feedbackData;
    v15->_feedbackData = (NSMutableData *)v18;

    experimentNamespaceId = v15->_experimentNamespaceId;
    v15->_experimentNamespaceId = 0;

    experimentId = v15->_experimentId;
    v15->_experimentId = 0;

    experimentTreatmentId = v15->_experimentTreatmentId;
    v15->_experimentTreatmentId = 0;

    v15->_hasUpdates = 0;
    __int16 v23 = [v10 localeIdentifier];
    uint64_t v24 = normalizedLocaleForIdentifier(v23);
    locale = v15->_locale;
    v15->_locale = (NSLocale *)v24;

    overrides = v15->_overrides;
    v15->_overrides = 0;

    if (SRIsAppleInternalInstall() && sUsingOverrides)
    {
      uint64_t v27 = [(id)sOverrideList objectForKeyedSubscript:v9];
      v28 = v15->_overrides;
      v15->_overrides = (NSDictionary *)v27;
    }
    id v29 = +[SRDefaultsManager sharedDefaultsManager];
    [v29 setOptions:v11];

    uint64_t v30 = +[SRDefaultsManager sharedDefaultsManager];
    [v30 registerDelegate:v15];

    uint64_t v31 = +[SRDefaultsManager sharedDefaultsManager];
    uint64_t v32 = [v31 assetBundleForLocale:v15->_locale client:v15->_client];
    liveAssetBundle = v15->_liveAssetBundle;
    v15->_liveAssetBundle = (SRAssetBundle *)v32;

    if (v11)
    {
      uint64_t v34 = [v11 objectForKeyedSubscript:@"autoUpdateLocale"];
      if (v34)
      {
        v35 = (void *)v34;
        id v36 = [v11 objectForKeyedSubscript:@"autoUpdateLocale"];
        int v37 = [v36 BOOLValue];

        if (v37)
        {
          v38 = [MEMORY[0x263F08A00] defaultCenter];
          [v38 addObserver:v15 selector:sel_updateLocale name:*MEMORY[0x263EFF458] object:0];
        }
      }
    }
  }

  return v15;
}

- (NSString)client
{
  return self->_client;
}

- (id)filePathArrayForKey:(id)a3
{
  uint64_t v5 = 0;
  v3 = [(SRResources *)self filePathArrayForKey:a3 didFailWithError:&v5];
  return v3;
}

- (id)filePathArrayForKey:(id)a3 didFailWithError:(id *)a4
{
  v22[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (SRIsAppleInternalInstall() && sUsingOverrides)
  {
    v7 = [(NSDictionary *)self->_overrides objectForKeyedSubscript:v6];
    v8 = v7;
    if (v7)
    {
      if ([v7 isFilePath])
      {
        uint64_t v9 = [v8 getFilePathValue];
        if (v9)
        {
          id v10 = (void *)v9;
          id v11 = SRLogCategoryGeneral();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
            -[SRResources BOOLeanForKey:didFailWithError:]();
          }

          *a4 = 0;
          v22[0] = v10;
          unint64_t v12 = (void *)MEMORY[0x263EFF8C0];
          char v13 = (void **)v22;
          goto LABEL_19;
        }
      }
    }
  }
  char v14 = [(SRResources *)self fetchFilePathParameter:v6];
  v8 = v14;
  if (v14 && [v14 isFilePath] && (objc_msgSend(v8, "isNil") & 1) == 0)
  {
    *a4 = 0;
    id v10 = [v8 getFilePathValue];
    __int16 v21 = v10;
    unint64_t v12 = (void *)MEMORY[0x263EFF8C0];
    char v13 = &v21;
LABEL_19:
    id v15 = [v12 arrayWithObjects:v13 count:1];
    goto LABEL_20;
  }
  id v10 = [(SRResources *)self assetPathsForContentType:v6];
  if ([v10 count])
  {
    *a4 = 0;
    id v15 = v10;
    id v10 = v15;
LABEL_20:
    v17 = v15;
    goto LABEL_21;
  }
  *a4 = [MEMORY[0x263F087E8] errorWithDomain:@"SpotlightResourcesErrorDomain" code:-1 userInfo:0];
  v16 = SRLogCategoryGeneral();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412290;
    id v20 = v6;
    _os_log_impl(&dword_25E378000, v16, OS_LOG_TYPE_DEFAULT, "SpotlightResources could not find file paths parameter %@", (uint8_t *)&v19, 0xCu);
  }

  v17 = 0;
LABEL_21:

  return v17;
}

- (id)fetchFilePathParameter:(id)a3
{
  v3 = [(SRResources *)self fetchParameter:a3 checkForPositive:0];
  v4 = v3;
  if (v3 && [v3 isFilePath]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (id)assetPathsForContentType:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = [(SRAssetBundle *)v5->_liveAssetBundle assetsWithContentType:v4];
  objc_sync_exit(v5);

  return v6;
}

- (void)setLocale:(id)a3
{
  id v4 = (NSLocale *)a3;
  obj = self;
  objc_sync_enter(obj);
  locale = obj->_locale;
  obj->_locale = v4;

  objc_sync_exit(obj);
}

- (void)updateLocale
{
  v3 = [MEMORY[0x263EFF960] currentLocale];
  [(SRResources *)self setLocale:v3];

  [(SRResources *)self didUpdateDefaults];
}

- (BOOL)hasUpdates
{
  id v2 = self;
  objc_sync_enter(v2);
  BOOL hasUpdates = v2->_hasUpdates;
  v2->_BOOL hasUpdates = 0;
  objc_sync_exit(v2);

  return hasUpdates;
}

- (void)didUpdateDefaults
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v2 = self;
  objc_sync_enter(v2);
  v2->_BOOL hasUpdates = 1;
  v3 = +[SRDefaultsManager sharedDefaultsManager];
  uint64_t v4 = [v3 assetBundleForLocale:v2->_locale client:v2->_client];
  liveAssetBundle = v2->_liveAssetBundle;
  v2->_liveAssetBundle = (SRAssetBundle *)v4;

  id v6 = [(SRAssetBundle *)v2->_liveAssetBundle contentTypes];
  v7 = [(SRResources *)v2 parameterUpdates];

  if (v7)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v15;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * v11);
          char v13 = [(SRResources *)v2 parameterUpdates];
          v13[2](v13, v12);

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
  }
  objc_sync_exit(v2);
}

- (id)fetchBooleanParameter:(id)a3
{
  v3 = [(SRResources *)self fetchParameter:a3 checkForPositive:0];
  uint64_t v4 = v3;
  if (v3 && [v3 isBool]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (id)fetchLongParameter:(id)a3
{
  v3 = [(SRResources *)self fetchParameter:a3 checkForPositive:1];
  uint64_t v4 = v3;
  if (v3 && [v3 isLong]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (id)fetchDoubleParameter:(id)a3
{
  v3 = [(SRResources *)self fetchParameter:a3 checkForPositive:0];
  uint64_t v4 = v3;
  if (v3 && [v3 isDouble]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (id)fetchStringParameter:(id)a3
{
  v3 = [(SRResources *)self fetchParameter:a3 checkForPositive:0];
  uint64_t v4 = v3;
  if (v3 && [v3 isString]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)BOOLeanForKey:(id)a3 didFailWithError:(id *)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (SRIsAppleInternalInstall() && sUsingOverrides)
  {
    v7 = [(NSDictionary *)self->_overrides objectForKeyedSubscript:v6];
    id v8 = v7;
    if (v7)
    {
      if ([v7 isBool])
      {
        uint64_t v9 = [v8 getBooleanValue];
        if (v9)
        {
          uint64_t v10 = (void *)v9;
          uint64_t v11 = SRLogCategoryGeneral();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
            -[SRResources BOOLeanForKey:didFailWithError:]();
          }

          *a4 = 0;
          char v12 = [v10 BOOLValue];

          goto LABEL_17;
        }
      }
    }
  }
  char v13 = [(SRResources *)self fetchBooleanParameter:v6];
  id v8 = v13;
  if (v13
    && [v13 isBool]
    && ([v8 getBooleanValue], (long long v14 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    long long v15 = v14;
    *a4 = 0;
    char v12 = [v14 BOOLValue];
  }
  else
  {
    *a4 = [MEMORY[0x263F087E8] errorWithDomain:@"SpotlightResourcesErrorDomain" code:-1 userInfo:0];
    long long v16 = SRLogCategoryGeneral();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      id v19 = v6;
      _os_log_impl(&dword_25E378000, v16, OS_LOG_TYPE_DEFAULT, "SpotlightResources could not find BOOLean parameter %@", (uint8_t *)&v18, 0xCu);
    }

    char v12 = 0;
  }
LABEL_17:

  return v12;
}

- (BOOL)BOOLeanForKey:(id)a3
{
  uint64_t v4 = 0;
  return [(SRResources *)self BOOLeanForKey:a3 didFailWithError:&v4];
}

- (int64_t)longForKey:(id)a3 didFailWithError:(id *)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (SRIsAppleInternalInstall() && sUsingOverrides)
  {
    v7 = [(NSDictionary *)self->_overrides objectForKeyedSubscript:v6];
    id v8 = v7;
    if (v7)
    {
      if ([v7 isLong])
      {
        uint64_t v9 = [v8 getLongValue];
        if (v9)
        {
          uint64_t v10 = (void *)v9;
          uint64_t v11 = SRLogCategoryGeneral();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
            -[SRResources BOOLeanForKey:didFailWithError:]();
          }

          *a4 = 0;
          int64_t v12 = [v10 longValue];

          goto LABEL_17;
        }
      }
    }
  }
  char v13 = [(SRResources *)self fetchLongParameter:v6];
  id v8 = v13;
  if (v13
    && [v13 isLong]
    && ([v8 getLongValue], (long long v14 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    long long v15 = v14;
    *a4 = 0;
    int64_t v12 = [v14 longValue];
  }
  else
  {
    *a4 = [MEMORY[0x263F087E8] errorWithDomain:@"SpotlightResourcesErrorDomain" code:-1 userInfo:0];
    long long v16 = SRLogCategoryGeneral();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      id v19 = v6;
      _os_log_impl(&dword_25E378000, v16, OS_LOG_TYPE_DEFAULT, "SpotlightResources could not find long parameter %@", (uint8_t *)&v18, 0xCu);
    }

    int64_t v12 = 0;
  }
LABEL_17:

  return v12;
}

- (int64_t)longForKey:(id)a3
{
  uint64_t v4 = 0;
  return [(SRResources *)self longForKey:a3 didFailWithError:&v4];
}

- (double)doubleForKey:(id)a3 didFailWithError:(id *)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (SRIsAppleInternalInstall() && sUsingOverrides)
  {
    v7 = [(NSDictionary *)self->_overrides objectForKeyedSubscript:v6];
    id v8 = v7;
    if (v7)
    {
      if ([v7 isDouble])
      {
        uint64_t v9 = [v8 getDoubleValue];
        if (v9)
        {
          uint64_t v10 = (void *)v9;
          uint64_t v11 = SRLogCategoryGeneral();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
            -[SRResources BOOLeanForKey:didFailWithError:]();
          }

          *a4 = 0;
          [v10 doubleValue];
          double v13 = v12;

          goto LABEL_17;
        }
      }
    }
  }
  long long v14 = [(SRResources *)self fetchDoubleParameter:v6];
  id v8 = v14;
  if (v14
    && [v14 isDouble]
    && ([v8 getDoubleValue], (long long v15 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    long long v16 = v15;
    *a4 = 0;
    [v15 doubleValue];
    double v13 = v17;
  }
  else
  {
    *a4 = [MEMORY[0x263F087E8] errorWithDomain:@"SpotlightResourcesErrorDomain" code:-1 userInfo:0];
    int v18 = SRLogCategoryGeneral();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412290;
      id v21 = v6;
      _os_log_impl(&dword_25E378000, v18, OS_LOG_TYPE_DEFAULT, "SpotlightResources could not find double parameter %@", (uint8_t *)&v20, 0xCu);
    }

    double v13 = 2.22507386e-308;
  }
LABEL_17:

  return v13;
}

- (double)doubleForKey:(id)a3
{
  uint64_t v4 = 0;
  [(SRResources *)self doubleForKey:a3 didFailWithError:&v4];
  return result;
}

- (id)stringForKey:(id)a3 didFailWithError:(id *)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (SRIsAppleInternalInstall() && sUsingOverrides)
  {
    v7 = [(NSDictionary *)self->_overrides objectForKeyedSubscript:v6];
    id v8 = v7;
    if (v7)
    {
      if ([v7 isString])
      {
        uint64_t v9 = [v8 getStringValue];
        if (v9)
        {
          uint64_t v10 = (void *)v9;
          uint64_t v11 = SRLogCategoryGeneral();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
            -[SRResources BOOLeanForKey:didFailWithError:]();
          }

          goto LABEL_14;
        }
      }
    }
  }
  double v12 = [(SRResources *)self fetchStringParameter:v6];
  id v8 = v12;
  if (v12)
  {
    if ([v12 isString])
    {
      uint64_t v13 = [v8 getStringValue];
      if (v13)
      {
        uint64_t v10 = (void *)v13;
LABEL_14:
        *a4 = 0;
        goto LABEL_18;
      }
    }
  }
  *a4 = [MEMORY[0x263F087E8] errorWithDomain:@"SpotlightResourcesErrorDomain" code:-1 userInfo:0];
  long long v14 = SRLogCategoryGeneral();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    id v17 = v6;
    _os_log_impl(&dword_25E378000, v14, OS_LOG_TYPE_DEFAULT, "SpotlightResources could not find string parameter %@", (uint8_t *)&v16, 0xCu);
  }

  uint64_t v10 = 0;
LABEL_18:

  return v10;
}

- (id)stringForKey:(id)a3
{
  uint64_t v5 = 0;
  v3 = [(SRResources *)self stringForKey:a3 didFailWithError:&v5];
  return v3;
}

- (id)filePathForKey:(id)a3 didFailWithError:(id *)a4
{
  id v6 = a3;
  if (SRIsAppleInternalInstall() && sUsingOverrides)
  {
    v7 = [(NSDictionary *)self->_overrides objectForKeyedSubscript:v6];
    id v8 = v7;
    if (v7)
    {
      if ([v7 isFilePath])
      {
        uint64_t v9 = [v8 getFilePathValue];
        if (v9)
        {
          uint64_t v10 = (void *)v9;
          uint64_t v11 = SRLogCategoryGeneral();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
            -[SRResources BOOLeanForKey:didFailWithError:]();
          }

          goto LABEL_14;
        }
      }
    }
  }
  double v12 = [(SRResources *)self fetchFilePathParameter:v6];
  id v8 = v12;
  if (v12)
  {
    if ([v12 isFilePath])
    {
      uint64_t v13 = [v8 getFilePathValue];
      if (v13)
      {
        uint64_t v10 = (void *)v13;
LABEL_14:
        *a4 = 0;
        goto LABEL_21;
      }
    }
  }
  long long v14 = [(SRResources *)self assetPathsForContentType:v6];
  if ([v14 count])
  {
    *a4 = 0;
    uint64_t v10 = [v14 firstObject];
  }
  else
  {
    *a4 = [MEMORY[0x263F087E8] errorWithDomain:@"SpotlightResourcesErrorDomain" code:-1 userInfo:0];
    long long v15 = SRLogCategoryGeneral();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[SRResources filePathForKey:didFailWithError:]();
    }

    uint64_t v10 = 0;
  }

LABEL_21:
  return v10;
}

- (id)filePathForKey:(id)a3
{
  uint64_t v5 = 0;
  v3 = [(SRResources *)self filePathForKey:a3 didFailWithError:&v5];
  return v3;
}

- (id)objectForKey:(id)a3 withType:(int64_t *)a4 didFailWithError:(id *)a5
{
  id v8 = a3;
  if (!SRIsAppleInternalInstall() || !sUsingOverrides)
  {
LABEL_9:
    long long v14 = [(SRResources *)self fetchBooleanParameter:v8];
    uint64_t v10 = v14;
    *a5 = 0;
    if (v14 && [v14 isBool] && (objc_msgSend(v10, "isNil") & 1) == 0)
    {
      *a4 = 0;
LABEL_32:
      double v12 = [v10 value];
      goto LABEL_33;
    }
    long long v15 = [(SRResources *)self fetchLongParameter:v8];

    if (v15 && [v15 isLong] && (objc_msgSend(v15, "isNil") & 1) == 0)
    {
      int64_t v16 = 1;
    }
    else
    {
      uint64_t v10 = [(SRResources *)self fetchDoubleParameter:v8];

      if (v10 && [v10 isDouble] && (objc_msgSend(v10, "isNil") & 1) == 0)
      {
        int64_t v17 = 2;
LABEL_31:
        *a4 = v17;
        goto LABEL_32;
      }
      long long v15 = [(SRResources *)self fetchStringParameter:v8];

      if (!v15 || ![v15 isString] || (objc_msgSend(v15, "isNil") & 1) != 0)
      {
        uint64_t v10 = [(SRResources *)self fetchFilePathParameter:v8];

        if (!v10 || ![v10 isFilePath] || (objc_msgSend(v10, "isNil") & 1) != 0)
        {
          [MEMORY[0x263F087E8] errorWithDomain:@"SpotlightResourcesErrorDomain" code:-1 userInfo:0];
          double v12 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
          *a4 = -1;
          goto LABEL_33;
        }
        int64_t v17 = 4;
        goto LABEL_31;
      }
      int64_t v16 = 3;
    }
    *a4 = v16;
    double v12 = [v15 value];
    uint64_t v10 = v15;
    goto LABEL_33;
  }
  uint64_t v9 = [(NSDictionary *)self->_overrides objectForKeyedSubscript:v8];
  uint64_t v10 = v9;
  if (!v9 || ([v9 value], (uint64_t v11 = objc_claimAutoreleasedReturnValue()) == 0))
  {

    goto LABEL_9;
  }
  double v12 = (void *)v11;
  uint64_t v13 = SRLogCategoryGeneral();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[SRResources BOOLeanForKey:didFailWithError:]();
  }

  *a5 = 0;
LABEL_33:

  return v12;
}

- (id)objectForKey:(id)a3 didFailWithError:(id *)a4
{
  uint64_t v6 = -1;
  uint64_t v4 = [(SRResources *)self objectForKey:a3 withType:&v6 didFailWithError:a4];
  return v4;
}

- (id)objectForKey:(id)a3
{
  uint64_t v5 = 0;
  v3 = [(SRResources *)self objectForKey:a3 didFailWithError:&v5];
  return v3;
}

- (id)currentExperimentTrialManager
{
  return +[SSTrialManager currentTrialManagerForClient:self->_client];
}

- (id)getTrialNamespaceId
{
  id v2 = [(SRResources *)self currentExperimentTrialManager];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 namespaceId];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)getTrialExperimentId
{
  id v2 = [(SRResources *)self currentExperimentTrialManager];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 experimentId];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)getTrialTreatmentId
{
  id v2 = [(SRResources *)self currentExperimentTrialManager];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 treatmentId];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)getTrialRolloutId
{
  id v2 = [(SRResources *)self currentExperimentTrialManager];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 rolloutId];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (int)getTrialExperimentDeploymentId
{
  id v2 = [(SRResources *)self currentExperimentTrialManager];
  v3 = v2;
  if (v2) {
    int v4 = [v2 experimentDeploymentId];
  }
  else {
    int v4 = -1;
  }

  return v4;
}

- (int)getTrialRolloutDeploymentId
{
  id v2 = [(SRResources *)self currentExperimentTrialManager];
  v3 = v2;
  if (v2) {
    int v4 = [v2 rolloutDeploymentId];
  }
  else {
    int v4 = -1;
  }

  return v4;
}

- (void)refreshTrial
{
  id v3 = +[SRResourcesManager sharedResourcesManager];
  [v3 refreshTrialForClient:self->_client];
}

- (id)getTTRLogs
{
  return +[SSTrialManager getTTRLogsForClient:self->_client];
}

- (id)getFeedbackData
{
  return self->_feedbackData;
}

- (void)appendFeedbackData:(id)a3
{
}

- (id)updateWithNewOptions:(id)a3
{
  if (a3)
  {
    objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithDictionary:");
    int v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    options = self->_options;
    self->_options = v4;
  }
  return self;
}

- (void)logForTrigger:(id)a3 queryID:(int64_t)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (+[SRResourcesManager parsecEnabled]
    && ([(NSString *)self->_client isEqualToString:@"Spotlight"]
     || [(NSString *)self->_client isEqualToString:@"Mail"]))
  {
    v7 = SRLogCategoryGeneral();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v6 UUIDString];
      client = self->_client;
      *(_DWORD *)buf = 138412802;
      uint64_t v30 = (uint64_t)v8;
      __int16 v31 = 2048;
      int64_t v32 = a4;
      __int16 v33 = 2112;
      uint64_t v34 = client;
      _os_log_impl(&dword_25E378000, v7, OS_LOG_TYPE_DEFAULT, "logForTrigger:%@ queryID:%lld client:%@", buf, 0x20u);
    }
    uint64_t v10 = [(SRResources *)self stringForKey:@"codepathIDs"];
    uint64_t v11 = SRLogCategoryGeneral();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[SRResources logForTrigger:queryID:]();
    }

    if (v6)
    {
      if (v10)
      {
        double v12 = [v10 uppercaseString];
        uint64_t v13 = [v6 UUIDString];
        int v14 = [v12 containsString:v13];

        if (v14)
        {
          long long v15 = SRLogCategoryGeneral();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            int64_t v16 = [v6 UUIDString];
            *(_DWORD *)buf = 138412290;
            uint64_t v30 = (uint64_t)v16;
            _os_log_impl(&dword_25E378000, v15, OS_LOG_TYPE_DEFAULT, "Emitting trigger for codepathID: %@", buf, 0xCu);
          }
          id v17 = objc_alloc_init(MEMORY[0x263F678A8]);
          [v17 setQueryId:a4];
          [v17 setCodepathId:v6];
          options = self->_options;
          if (options)
          {
            [(NSMutableDictionary *)options objectForKeyedSubscript:@"SRResourcesOwner"];
          }
          id v19 = SRLogCategoryLifeCycle();
          int v20 = v19;
          unint64_t v21 = logForTrigger_queryID__index;
          os_signpost_id_t v22 = ++logForTrigger_queryID__index;
          if (v21 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
          {
            id v23 = [v6 UUIDString];
            uint64_t v24 = [v23 UTF8String];
            *(_DWORD *)buf = 136315394;
            uint64_t v30 = v24;
            __int16 v31 = 2048;
            int64_t v32 = a4;
            _os_signpost_emit_with_name_impl(&dword_25E378000, v20, OS_SIGNPOST_EVENT, v22, "SRResourcesLogForTrigger", "uuid=%s, queryID=%lld", buf, 0x16u);
          }
          id v25 = dispatch_get_global_queue(25, 0);
          v27[0] = MEMORY[0x263EF8330];
          v27[1] = 3221225472;
          v27[2] = __37__SRResources_logForTrigger_queryID___block_invoke;
          v27[3] = &unk_265523310;
          v27[4] = self;
          id v28 = v17;
          id v26 = v17;
          dispatch_async(v25, v27);
        }
      }
    }
  }
}

void __37__SRResources_logForTrigger_queryID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  id v3 = +[SRPARSession spotlightResourcesPARSessionForClient:v2];

  if (v3)
  {
    int v4 = [*(id *)(a1 + 32) experimentNamespaceId];
    uint64_t v5 = [v3 configuration];
    [v5 setExperimentNamespaceId:v4];

    id v6 = [*(id *)(a1 + 32) experimentId];
    v7 = [v3 configuration];
    [v7 setExperimentId:v6];

    id v8 = [*(id *)(a1 + 32) experimentTreatmentId];
    uint64_t v9 = [v3 configuration];
    [v9 setExperimentTreatmentId:v8];

    uint64_t v10 = [*(id *)(a1 + 32) experimentDeploymentId];
    uint64_t v11 = [v3 configuration];
    [v11 setExperimentDeploymentId:v10];

    uint64_t v12 = [*(id *)(a1 + 32) experimentVersion];
    uint64_t v13 = [v3 configuration];
    [v13 setExperimentVersion:v12];

    [v3 reportEvent:*(void *)(a1 + 40)];
  }
  else
  {
    int v14 = SRLogCategoryGeneral();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __37__SRResources_logForTrigger_queryID___block_invoke_cold_1(v14);
    }
  }
}

- (NSString)description
{
  client = (__CFString *)self->_client;
  if (!client) {
    client = @"none";
  }
  int v4 = [MEMORY[0x263F089D8] stringWithFormat:@"SRResources: { client = %@", client];
  locale = self->_locale;
  if (locale)
  {
    id v6 = [(NSLocale *)locale localeIdentifier];
    [v4 appendFormat:@", locale = %@", v6];
  }
  else
  {
    [v4 appendFormat:@", locale = %@", @"none"];
  }
  options = self->_options;
  if (options)
  {
    id v8 = [(NSMutableDictionary *)options objectForKeyedSubscript:@"SRResourcesOwner"];

    if (v8)
    {
      uint64_t v9 = [(NSMutableDictionary *)self->_options objectForKeyedSubscript:@"SRResourcesOwner"];
      [v4 appendFormat:@", owner = %@", v9];
    }
  }
  [v4 appendString:@" }"];
  uint64_t v10 = [NSString stringWithString:v4];

  return (NSString *)v10;
}

- (id)parameterUpdates
{
  return self->_parameterUpdates;
}

- (void)setParameterUpdates:(id)a3
{
}

- (NSString)experimentNamespaceId
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setExperimentNamespaceId:(id)a3
{
}

- (NSString)experimentId
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setExperimentId:(id)a3
{
}

- (NSString)experimentTreatmentId
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setExperimentTreatmentId:(id)a3
{
}

- (int)experimentDeploymentId
{
  return self->_experimentDeploymentId;
}

- (void)setExperimentDeploymentId:(int)a3
{
  self->_experimentDeploymentId = a3;
}

- (unsigned)experimentVersion
{
  return self->_experimentVersion;
}

- (void)setExperimentVersion:(unsigned int)a3
{
  self->_experimentVersion = a3;
}

- (BOOL)autoUpdatingLocale
{
  return self->_autoUpdatingLocale;
}

- (void)setAutoUpdatingLocale:(BOOL)a3
{
  self->_autoUpdatingLocale = a3;
}

- (void)fetchParameter:checkForPositive:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_25E378000, v0, v1, "Parameter %@ not found in defaults manager", v2, v3, v4, v5, v6);
}

- (void)fetchParameter:checkForPositive:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_25E378000, v0, v1, "Parameter %@ not found in defaults manager.", v2, v3, v4, v5, v6);
}

- (void)fetchParameter:checkForPositive:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_25E378000, v0, v1, "Default parameter for %@ is nil", v2, v3, v4, v5, v6);
}

- (void)fetchParameter:checkForPositive:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_25E378000, v0, v1, "Parameter %@ has value from user defaults", v2, v3, v4, v5, v6);
}

- (void)fetchParameter:checkForPositive:.cold.5()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_25E378000, v0, v1, "Parameter %@ has value from Trial namespace %@");
}

- (void)BOOLeanForKey:didFailWithError:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_25E378000, v0, v1, "Overriding value of parameter %@", v2, v3, v4, v5, v6);
}

- (void)filePathForKey:didFailWithError:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25E378000, v0, v1, "SpotlightResources could not find file path parameter %@", v2, v3, v4, v5, v6);
}

- (void)logForTrigger:queryID:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_25E378000, v0, v1, "logForTrigger got codepathIDs %@", v2, v3, v4, v5, v6);
}

void __37__SRResources_logForTrigger_queryID___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_25E378000, log, OS_LOG_TYPE_ERROR, "Feedback session is nil", v1, 2u);
}

@end