@interface SRResourcesManager
+ (BOOL)parsecEnabled;
+ (id)defaultParameterWithType:(int64_t)a3 value:(id)a4 name:(id)a5;
+ (id)sharedResourcesManager;
+ (int64_t)parameterTypeFromString:(id)a3;
+ (unint64_t)lastLoadedContentVersion;
+ (void)dumpParameterList:(id)a3;
+ (void)fetchOverrideList;
+ (void)fetchParameterList;
+ (void)fetchUserDefaults;
+ (void)initialize;
+ (void)setTrialUpdateHandler;
+ (void)updateDefaultParameter:(id)a3 withValue:(id)a4;
- (BOOL)overrideFactor:(id)a3 client:(id)a4 type:(id)a5 value:(id)a6;
- (SRResourcesManager)initWithOptions:(id)a3;
- (id)allLoadedAssets;
- (id)assetConfigDump;
- (id)resourcesForClient:(id)a3 locale:(id)a4 options:(id)a5;
- (id)resourcesForClient:(id)a3 options:(id)a4;
- (id)trialConfigDump;
- (void)fetchAllParametersForLanguages:(id)a3 resourcePath:(id)a4;
- (void)loadAllParameters;
- (void)loadAllParametersForClient:(id)a3;
- (void)loadAllParametersForClient:(id)a3 locale:(id)a4;
- (void)loadAllParametersForClient:(id)a3 locale:(id)a4 options:(id)a5;
- (void)loadDataSource:(id)a3;
- (void)refreshTrialForClient:(id)a3;
@end

@implementation SRResourcesManager

- (id)resourcesForClient:(id)a3 locale:(id)a4 options:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  if (v10)
  {
    v12 = [v10 objectForKeyedSubscript:@"SRResourcesOwner"];
  }
  else
  {
    v12 = 0;
  }
  v13 = SRLogCategoryLifeCycle();
  v14 = v13;
  unint64_t v15 = resourcesForClient_locale_options__index;
  os_signpost_id_t v16 = ++resourcesForClient_locale_options__index;
  if (v15 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v13)) {
    goto LABEL_13;
  }
  uint64_t v17 = [v8 UTF8String];
  if (v9)
  {
    id v5 = [v9 localeIdentifier];
    v18 = (const char *)[v5 UTF8String];
    if (v12)
    {
LABEL_8:
      v19 = (const char *)[v12 UTF8String];
      goto LABEL_11;
    }
  }
  else
  {
    v18 = "none";
    if (v12) {
      goto LABEL_8;
    }
  }
  v19 = "unknown";
LABEL_11:
  int v22 = 136315650;
  uint64_t v23 = v17;
  __int16 v24 = 2080;
  v25 = v18;
  __int16 v26 = 2080;
  v27 = v19;
  _os_signpost_emit_with_name_impl(&dword_25E378000, v14, OS_SIGNPOST_EVENT, v16, "SRResourcesCreate", "client=%s, locale=%s, caller=%s", (uint8_t *)&v22, 0x20u);
  if (v9) {

  }
LABEL_13:
  v20 = [[SRResources alloc] initWithClient:v8 locale:v9 options:v11];

  return v20;
}

+ (id)sharedResourcesManager
{
  if (sharedResourcesManager_onceToken != -1) {
    dispatch_once(&sharedResourcesManager_onceToken, &__block_literal_global_481);
  }
  v2 = (void *)sharedResourcesManager_resourcesManager;
  return v2;
}

+ (BOOL)parsecEnabled
{
  v2 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.spotlightui"];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 objectForKey:@"SBSearchDisabledDomains"];
    if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      int v5 = [v4 containsObject:@"DOMAIN_PARSEC"] ^ 1;
    }
    else {
      LOBYTE(v5) = 1;
    }
  }
  else
  {
    LOBYTE(v5) = 1;
  }

  return v5;
}

+ (void)setTrialUpdateHandler
{
  v2 = (void *)sTrialUpdateHandler;
  sTrialUpdateHandler = (uint64_t)&__block_literal_global_416;

  +[SSTrialManager setTrialUpdateHandler:&__block_literal_global_416];
  +[SSTrialManager setTrialOverridePath];
}

void __43__SRResourcesManager_setTrialUpdateHandler__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = a3;
  v6 = SRLogCategoryGeneral();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v4;
    _os_log_impl(&dword_25E378000, v6, OS_LOG_TYPE_DEFAULT, "Trial update handler called for namespace %@", buf, 0xCu);
  }

  v7 = [v5 getLevelForFactor:@"ExpConfig"];
  if (v7)
  {
    id v8 = SRLogCategoryGeneral();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __43__SRResourcesManager_setTrialUpdateHandler__block_invoke_cold_4();
    }

    id v9 = [v7 stringValue];
    id v10 = (void *)MEMORY[0x263F08900];
    v11 = [v9 dataUsingEncoding:4];
    *(void *)buf = 0;
    v12 = [v10 JSONObjectWithData:v11 options:0 error:buf];
    id v13 = *(id *)buf;

    if (v13)
    {
      v14 = SRLogCategoryGeneral();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        __43__SRResourcesManager_setTrialUpdateHandler__block_invoke_cold_3();
      }
      unint64_t v15 = 0;
    }
    else
    {
      unint64_t v15 = [MEMORY[0x263EFF9A0] dictionary];
      os_signpost_id_t v16 = [v12 objectForKeyedSubscript:@"spotlightConfigParams"];

      if (v16)
      {
        uint64_t v17 = [v12 objectForKeyedSubscript:@"spotlightConfigParams"];
        [v15 setObject:v17 forKeyedSubscript:@"Spotlight"];
      }
      v18 = [v12 objectForKeyedSubscript:@"mailConfigParams"];

      if (v18)
      {
        v19 = [v12 objectForKeyedSubscript:@"mailConfigParams"];
        [v15 setObject:v19 forKeyedSubscript:@"Mail"];
      }
      v14 = SRLogCategoryGeneral();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        __43__SRResourcesManager_setTrialUpdateHandler__block_invoke_cold_2();
      }
    }
  }
  else
  {
    unint64_t v15 = 0;
  }
  v20 = [v5 getLevelForFactor:@"factors"];
  if (v20)
  {
    v21 = SRLogCategoryGeneral();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      __43__SRResourcesManager_setTrialUpdateHandler__block_invoke_cold_1();
    }

    int v22 = [v20 fileValue];
    uint64_t v23 = [v22 path];

    __int16 v24 = +[SRDefaultsManager sharedDefaultsManager];
    [v24 loadFactorsAtPath:v23 namespaceId:v4];
  }
  os_unfair_lock_lock((os_unfair_lock_t)&sTrialParameterListLock);
  v25 = [(id)sTrialParameterList objectForKeyedSubscript:v4];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __43__SRResourcesManager_setTrialUpdateHandler__block_invoke_423;
  v31[3] = &unk_265523358;
  id v26 = v4;
  id v32 = v26;
  id v27 = v5;
  id v33 = v27;
  id v28 = v15;
  id v34 = v28;
  [v25 enumerateKeysAndObjectsUsingBlock:v31];

  os_unfair_lock_unlock((os_unfair_lock_t)&sTrialParameterListLock);
  [v27 setWasLoadedSinceLaunch:1];
  v29 = +[SRDefaultsManager sharedDefaultsManager];
  [v29 didUpdateTrialNamespace:v26];

  v30 = SRLogCategoryGeneral();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v26;
    _os_log_impl(&dword_25E378000, v30, OS_LOG_TYPE_DEFAULT, "Trial update handler completed for namespace %@", buf, 0xCu);
  }
}

void __43__SRResourcesManager_setTrialUpdateHandler__block_invoke_423(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = SRLogCategoryGeneral();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __43__SRResourcesManager_setTrialUpdateHandler__block_invoke_423_cold_12();
  }

  id v8 = [v6 parameter];
  [v6 setHasValueFromTrial:0];
  id v9 = [*(id *)(a1 + 40) getLevelForFactor:v5];
  if (v9)
  {
    id v10 = SRLogCategoryGeneral();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      __43__SRResourcesManager_setTrialUpdateHandler__block_invoke_423_cold_11();
    }

    switch([v8 type])
    {
      case 0:
        objc_msgSend(v8, "updateWithBoolean:", objc_msgSend(v9, "BOOLeanValue"));
        goto LABEL_21;
      case 1:
        objc_msgSend(v8, "updateWithLong:", objc_msgSend(v9, "longValue"));
        if (![v5 isEqualToString:@"MaxSectionsBelowSuggestions"]) {
          goto LABEL_21;
        }
        v12 = SRLogCategoryGeneral();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_16;
        }
        goto LABEL_17;
      case 2:
        [v9 doubleValue];
        objc_msgSend(v8, "updateWithDouble:");
        if (![v5 isEqualToString:@"LocalSuggestionThreshold"]) {
          goto LABEL_21;
        }
        v12 = SRLogCategoryGeneral();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
LABEL_16:
        }
          __43__SRResourcesManager_setTrialUpdateHandler__block_invoke_423_cold_9();
LABEL_17:

        id v13 = v6;
        uint64_t v14 = 0;
        goto LABEL_22;
      case 3:
        unint64_t v15 = [v9 stringValue];
        [v8 updateWithString:v15];
        goto LABEL_20;
      case 4:
        unint64_t v15 = [v9 fileValue];
        os_signpost_id_t v16 = [v15 path];
        [v8 updateWithFilePath:v16];

LABEL_20:
LABEL_21:
        uint64_t v17 = +[SRDefaultsManager sharedDefaultsManager];
        [v17 updateParameter:v5 inNamespace:*(void *)(a1 + 32) withValue:v8];

        id v13 = v6;
        uint64_t v14 = 1;
LABEL_22:
        [v13 setHasValueFromTrial:v14];
        break;
      default:
        v11 = SRLogCategoryGeneral();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          __43__SRResourcesManager_setTrialUpdateHandler__block_invoke_423_cold_8(v8, v11);
        }

        break;
    }
  }
  uint64_t v18 = [v8 irisName];
  v19 = (void *)v18;
  if (v18) {
    v20 = (void *)v18;
  }
  else {
    v20 = v5;
  }
  id v21 = v20;

  int v22 = NSString;
  uint64_t v23 = [v21 substringToIndex:1];
  __int16 v24 = [v23 lowercaseString];
  v25 = [v21 substringFromIndex:1];
  v46 = [v22 stringWithFormat:@"%@%@", v24, v25];

  id v26 = *(void **)(a1 + 48);
  if (v26)
  {
    id v27 = [*(id *)(a1 + 40) client];
    id v28 = [v26 objectForKeyedSubscript:v27];
    if (v28)
    {
      v29 = *(void **)(a1 + 48);
      [*(id *)(a1 + 40) client];
      uint64_t v45 = a1;
      id v30 = v21;
      v31 = v8;
      id v32 = v5;
      id v33 = v9;
      v35 = id v34 = v6;
      uint64_t v36 = [v29 objectForKeyedSubscript:v35];
      id v26 = [v36 objectForKeyedSubscript:v46];

      id v6 = v34;
      id v9 = v33;
      id v5 = v32;
      id v8 = v31;
      id v21 = v30;
      a1 = v45;
    }
    else
    {
      id v26 = 0;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v37 = (void *)[v26 copy];
    if ([v37 count])
    {
      uint64_t v38 = [v37 componentsJoinedByString:@","];
    }
    else
    {
      uint64_t v38 = 0;
    }

    id v26 = (void *)v38;
  }
  if (v26)
  {
    v39 = SRLogCategoryGeneral();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
      __43__SRResourcesManager_setTrialUpdateHandler__block_invoke_423_cold_7();
    }

    switch([v8 type])
    {
      case 0:
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_msgSend(v8, "updateWithBoolean:", objc_msgSend(v26, "BOOLValue"));
          goto LABEL_52;
        }
        v40 = SRLogCategoryGeneral();
        if (!os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
          goto LABEL_63;
        }
        goto LABEL_62;
      case 1:
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_msgSend(v8, "updateWithLong:", objc_msgSend(v26, "longValue"));
          goto LABEL_52;
        }
        v40 = SRLogCategoryGeneral();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
          goto LABEL_62;
        }
        goto LABEL_63;
      case 2:
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v26 doubleValue];
          objc_msgSend(v8, "updateWithDouble:");
          goto LABEL_52;
        }
        v40 = SRLogCategoryGeneral();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
          goto LABEL_62;
        }
        goto LABEL_63;
      case 3:
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v8 updateWithString:v26];
          goto LABEL_52;
        }
        v40 = SRLogCategoryGeneral();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
          goto LABEL_62;
        }
        goto LABEL_63;
      case 4:
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v8 updateWithFilePath:v26];
LABEL_52:
          +[SRDefaultsManager sharedDefaultsManager];
          id v41 = v5;
          v42 = v9;
          v44 = id v43 = v6;
          [v44 updateParameter:v41 inNamespace:*(void *)(a1 + 32) withValue:v8];

          id v6 = v43;
          id v9 = v42;
          id v5 = v41;
          [v6 setHasValueFromTrial:1];
        }
        else
        {
          v40 = SRLogCategoryGeneral();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
LABEL_62:
          }
            __43__SRResourcesManager_setTrialUpdateHandler__block_invoke_423_cold_2();
LABEL_63:
        }
        break;
      default:
        v40 = SRLogCategoryGeneral();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
          __43__SRResourcesManager_setTrialUpdateHandler__block_invoke_423_cold_1(v8, (uint64_t)v46, v40);
        }
        goto LABEL_63;
    }
  }
}

+ (void)initialize
{
  +[SRDefaultsManager sharedDefaultsManager];

  [a1 setTrialUpdateHandler];
}

- (SRResourcesManager)initWithOptions:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SRResourcesManager;
  v3 = [(SRResourcesManager *)&v6 init];
  if (v3)
  {
    +[SRResourcesManager fetchParameterList];
  }
  else
  {
    id v4 = SRLogCategoryGeneral();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[SRResourcesManager initWithOptions:](v4);
    }
  }
  return v3;
}

+ (unint64_t)lastLoadedContentVersion
{
  return +[SRDefaultsManager lastLoadedContentVersion];
}

+ (id)defaultParameterWithType:(int64_t)a3 value:(id)a4 name:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (v7)
  {
    switch(a3)
    {
      case 0:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_13;
        }
        uint64_t v9 = +[SRParameter parameterWithBoolean:name:](SRParameter, "parameterWithBoolean:name:", [v7 BOOLValue], v8);
        break;
      case 1:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_13;
        }
        uint64_t v9 = +[SRParameter parameterWithLong:name:](SRParameter, "parameterWithLong:name:", [v7 longValue], v8);
        break;
      case 2:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_13;
        }
        [v7 doubleValue];
        uint64_t v9 = +[SRParameter parameterWithDouble:name:](SRParameter, "parameterWithDouble:name:", v8);
        break;
      case 3:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_13;
        }
        uint64_t v9 = +[SRParameter parameterWithString:v7 name:v8];
        break;
      case 4:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_13;
        }
        uint64_t v9 = +[SRParameter parameterWithFilePath:v7 name:v8];
        break;
      default:
        goto LABEL_13;
    }
  }
  else
  {
LABEL_13:
    uint64_t v9 = +[SRParameter nilParameterWithType:a3];
  }
  id v10 = (void *)v9;

  return v10;
}

+ (void)fetchUserDefaults
{
  v3 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.spotlightui"];
  id v4 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.searchd"];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39__SRResourcesManager_fetchUserDefaults__block_invoke;
  v7[3] = &unk_265523380;
  id v8 = v3;
  id v9 = a1;
  uint64_t v5 = fetchUserDefaults_userListOnceToken;
  id v6 = v3;
  if (v5 != -1) {
    dispatch_once(&fetchUserDefaults_userListOnceToken, v7);
  }
}

void __39__SRResourcesManager_fetchUserDefaults__block_invoke(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  os_unfair_lock_lock(&sUserDefaultsParameterListLock);
  uint64_t v2 = [MEMORY[0x263EFF9A0] dictionary];
  v3 = (void *)sUserDefaultsParameterList;
  sUserDefaultsParameterList = v2;

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v4 = [&unk_270B1D658 countByEnumeratingWithState:&v39 objects:v46 count:16];
  unint64_t v5 = 0x265523000uLL;
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v40;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v40 != v7) {
          objc_enumerationMutation(&unk_270B1D658);
        }
        uint64_t v9 = *(void *)(*((void *)&v39 + 1) + 8 * v8);
        id v10 = [*(id *)(v5 + 544) sharedDefaultsManager];
        v11 = [v10 parametersOfNamespaceWithName:v9];

        if (v11)
        {
          v12 = [&unk_270B1D680 objectForKeyedSubscript:v9];
          id v13 = [*(id *)(a1 + 32) objectForKey:v12];
          if (v13)
          {
            uint64_t v14 = [v11 allValues];
            unint64_t v15 = [v14 firstObject];

            os_signpost_id_t v16 = objc_msgSend(*(id *)(a1 + 40), "defaultParameterWithType:value:name:", objc_msgSend(v15, "type"), v13, v9);
            [(id)sUserDefaultsParameterList setObject:v16 forKeyedSubscript:v9];

            unint64_t v5 = 0x265523000;
          }
        }
        else
        {
          v12 = SRLogCategoryGeneral();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v45 = v9;
            _os_log_debug_impl(&dword_25E378000, v12, OS_LOG_TYPE_DEBUG, "User default is not set for parameter %@", buf, 0xCu);
          }
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [&unk_270B1D658 countByEnumeratingWithState:&v39 objects:v46 count:16];
    }
    while (v6);
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v17 = [&unk_270B1D680 countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (v17)
  {
    uint64_t v19 = v17;
    uint64_t v20 = *(void *)v36;
    *(void *)&long long v18 = 138412290;
    long long v33 = v18;
    id v21 = &unk_270B1D680;
    do
    {
      uint64_t v22 = 0;
      uint64_t v34 = v19;
      do
      {
        if (*(void *)v36 != v20) {
          objc_enumerationMutation(v21);
        }
        uint64_t v23 = *(void *)(*((void *)&v35 + 1) + 8 * v22);
        __int16 v24 = objc_msgSend(*(id *)(v5 + 544), "sharedDefaultsManager", v33);
        v25 = [v24 parametersOfNamespaceWithName:v23];

        if (v25)
        {
          id v26 = [v21 objectForKeyedSubscript:v23];
          id v27 = [*(id *)(a1 + 32) objectForKey:v26];
          if (v27)
          {
            [v25 allValues];
            uint64_t v28 = v20;
            id v30 = v29 = v21;
            v31 = [v30 firstObject];

            id v32 = objc_msgSend(*(id *)(a1 + 40), "defaultParameterWithType:value:name:", objc_msgSend(v31, "type"), v27, v23);
            [(id)sUserDefaultsParameterList setObject:v32 forKeyedSubscript:v23];

            id v21 = v29;
            uint64_t v20 = v28;
            uint64_t v19 = v34;

            unint64_t v5 = 0x265523000;
          }
        }
        else
        {
          id v26 = SRLogCategoryGeneral();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v33;
            uint64_t v45 = v23;
            _os_log_debug_impl(&dword_25E378000, v26, OS_LOG_TYPE_DEBUG, "User default is not set for parameter %@", buf, 0xCu);
          }
        }

        ++v22;
      }
      while (v19 != v22);
      uint64_t v19 = [v21 countByEnumeratingWithState:&v35 objects:v43 count:16];
    }
    while (v19);
  }
  os_unfair_lock_unlock(&sUserDefaultsParameterListLock);
}

+ (void)updateDefaultParameter:(id)a3 withValue:(id)a4
{
  id v7 = a3;
  id v5 = a4;
  uint64_t v6 = [v7 type];
  if (v5)
  {
    switch(v6)
    {
      case 0:
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v7, "updateWithBoolean:", objc_msgSend(v5, "BOOLValue"));
        }
        break;
      case 1:
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v7, "updateWithLong:", objc_msgSend(v5, "longValue"));
        }
        break;
      case 2:
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v5 doubleValue];
          objc_msgSend(v7, "updateWithDouble:");
        }
        break;
      case 3:
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v7 updateWithString:v5];
        }
        break;
      case 4:
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v7 updateWithFilePath:v5];
        }
        break;
      default:
        break;
    }
  }
}

+ (int64_t)parameterTypeFromString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Boolean"])
  {
    int64_t v4 = 0;
  }
  else if ([v3 isEqualToString:@"Long"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"Double"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"String"])
  {
    int64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"File"])
  {
    int64_t v4 = 4;
  }
  else
  {
    id v5 = SRLogCategoryGeneral();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[SRResourcesManager parameterTypeFromString:]();
    }

    int64_t v4 = -1;
  }

  return v4;
}

+ (void)fetchParameterList
{
  if (fetchParameterList_trialListOnceToken != -1) {
    dispatch_once(&fetchParameterList_trialListOnceToken, &__block_literal_global_459);
  }
  [a1 fetchUserDefaults];
  if (SRIsAppleInternalInstall())
  {
    [a1 fetchOverrideList];
  }
}

void __40__SRResourcesManager_fetchParameterList__block_invoke()
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  os_unfair_lock_lock((os_unfair_lock_t)&sTrialParameterListLock);
  uint64_t v0 = [MEMORY[0x263EFF9A0] dictionary];
  v1 = (void *)sTrialParameterList;
  sTrialParameterList = v0;

  uint64_t v2 = +[SRDefaultsManager sharedDefaultsManager];
  id v3 = [v2 currentNamespaceDescription];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v3;
  uint64_t v17 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v17)
  {
    uint64_t v16 = *(void *)v25;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = v4;
        uint64_t v5 = *(void *)(*((void *)&v24 + 1) + 8 * v4);
        uint64_t v6 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v16);
        [(id)sTrialParameterList setObject:v6 forKeyedSubscript:v5];

        long long v22 = 0u;
        long long v23 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        id v7 = [obj objectForKeyedSubscript:v5];
        uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v21;
          do
          {
            uint64_t v11 = 0;
            do
            {
              if (*(void *)v21 != v10) {
                objc_enumerationMutation(v7);
              }
              v12 = *(void **)(*((void *)&v20 + 1) + 8 * v11);
              id v13 = [[SRTrialParameter alloc] initWithParameter:v12];
              uint64_t v14 = [(id)sTrialParameterList objectForKeyedSubscript:v5];
              unint64_t v15 = [v12 name];
              [v14 setObject:v13 forKeyedSubscript:v15];

              ++v11;
            }
            while (v9 != v11);
            uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v28 count:16];
          }
          while (v9);
        }

        uint64_t v4 = v19 + 1;
      }
      while (v19 + 1 != v17);
      uint64_t v17 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v17);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&sTrialParameterListLock);
}

+ (void)fetchOverrideList
{
  if (fetchOverrideList_overridesPlistOnceToken != -1) {
    dispatch_once(&fetchOverrideList_overridesPlistOnceToken, &__block_literal_global_462);
  }
}

void __39__SRResourcesManager_fetchOverrideList__block_invoke()
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v0 = [NSString alloc];
  v1 = NSHomeDirectory();
  uint64_t v2 = [v0 initWithFormat:@"%@/Library/Spotlight/overrides.plist", v1];
  id v3 = (void *)sOverridesPath;
  sOverridesPath = v2;

  uint64_t v4 = [MEMORY[0x263F08850] defaultManager];
  LODWORD(v1) = [v4 fileExistsAtPath:sOverridesPath];

  if (v1)
  {
    uint64_t v5 = [NSDictionary dictionaryWithContentsOfFile:sOverridesPath];
    uint64_t v6 = v5;
    if (v5)
    {
      id v7 = [v5 objectForKeyedSubscript:@"UsingOverrides"];

      if (v7)
      {
        uint64_t v8 = [v6 objectForKeyedSubscript:@"UsingOverrides"];
        sUsingOverrides = [v8 BOOLValue];

        if (sUsingOverrides)
        {
          uint64_t v9 = SRLogCategoryGeneral();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_25E378000, v9, OS_LOG_TYPE_DEFAULT, "Using overrides.plist", buf, 2u);
          }

          long long v41 = [MEMORY[0x263EFF9A0] dictionary];
          long long v51 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          long long v54 = 0u;
          uint64_t v42 = [&unk_270B1D5F8 countByEnumeratingWithState:&v51 objects:v60 count:16];
          if (v42)
          {
            uint64_t v40 = *(void *)v52;
            do
            {
              uint64_t v10 = 0;
              do
              {
                if (*(void *)v52 != v40) {
                  objc_enumerationMutation(&unk_270B1D5F8);
                }
                uint64_t v43 = v10;
                uint64_t v11 = *(void *)(*((void *)&v51 + 1) + 8 * v10);
                v44 = [MEMORY[0x263EFF9A0] dictionary];
                long long v47 = 0u;
                long long v48 = 0u;
                long long v49 = 0u;
                long long v50 = 0u;
                uint64_t v46 = v11;
                id obj = [v6 objectForKeyedSubscript:v11];
                uint64_t v12 = [obj countByEnumeratingWithState:&v47 objects:v59 count:16];
                if (v12)
                {
                  uint64_t v13 = v12;
                  uint64_t v14 = *(void *)v48;
                  do
                  {
                    for (uint64_t i = 0; i != v13; ++i)
                    {
                      if (*(void *)v48 != v14) {
                        objc_enumerationMutation(obj);
                      }
                      uint64_t v16 = *(void **)(*((void *)&v47 + 1) + 8 * i);
                      if (([v16 isEqualToString:@"SampleOverrideParameter"] & 1) == 0)
                      {
                        uint64_t v17 = [v6 objectForKeyedSubscript:v46];
                        long long v18 = [v17 objectForKeyedSubscript:v16];
                        uint64_t v19 = [v18 objectForKeyedSubscript:@"Type"];

                        if (v19)
                        {
                          if (![v19 isEqualToString:@"Boolean"])
                          {
                            if ([v19 isEqualToString:@"Long"])
                            {
                              long long v25 = [v6 objectForKeyedSubscript:v46];
                              long long v26 = [v25 objectForKeyedSubscript:v16];
                              long long v22 = [v26 objectForKeyedSubscript:@"Value"];

                              if (!v22) {
                                goto LABEL_35;
                              }
                              uint64_t v23 = +[SRParameter parameterWithLong:name:](SRParameter, "parameterWithLong:name:", [v22 longValue], v16);
                            }
                            else if ([v19 isEqualToString:@"Double"])
                            {
                              long long v27 = [v6 objectForKeyedSubscript:v46];
                              uint64_t v28 = [v27 objectForKeyedSubscript:v16];
                              long long v22 = [v28 objectForKeyedSubscript:@"Value"];

                              if (!v22) {
                                goto LABEL_35;
                              }
                              [v22 doubleValue];
                              uint64_t v23 = +[SRParameter parameterWithDouble:name:](SRParameter, "parameterWithDouble:name:", v16);
                            }
                            else
                            {
                              if (([v19 isEqualToString:@"String"] & 1) == 0
                                && ![v19 isEqualToString:@"File"])
                              {
                                goto LABEL_42;
                              }
                              v29 = [v6 objectForKeyedSubscript:v46];
                              uint64_t v30 = [v29 objectForKeyedSubscript:v16];
                              long long v22 = [v30 objectForKeyedSubscript:@"Value"];

                              if (!v22) {
                                goto LABEL_35;
                              }
                              uint64_t v23 = +[SRParameter parameterWithString:v22 name:v16];
                            }
LABEL_34:
                            long long v24 = v23;
                            goto LABEL_36;
                          }
                          long long v20 = [v6 objectForKeyedSubscript:v46];
                          long long v21 = [v20 objectForKeyedSubscript:v16];
                          long long v22 = [v21 objectForKeyedSubscript:@"Value"];

                          if (v22)
                          {
                            uint64_t v23 = +[SRParameter parameterWithBoolean:name:](SRParameter, "parameterWithBoolean:name:", [v22 BOOLValue], v16);
                            goto LABEL_34;
                          }
LABEL_35:
                          long long v24 = 0;
LABEL_36:

                          if (v24)
                          {
                            [v44 setObject:v24 forKeyedSubscript:v16];
                            v31 = SRLogCategoryLifeCycle();
                            id v32 = v31;
                            unint64_t v33 = fetchOverrideList_index;
                            os_signpost_id_t v34 = ++fetchOverrideList_index;
                            if (v33 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
                            {
                              [v24 typeString];
                              long long v36 = v35 = v6;
                              *(_DWORD *)buf = 138412546;
                              v56 = v16;
                              __int16 v57 = 2112;
                              v58 = v36;
                              _os_signpost_emit_with_name_impl(&dword_25E378000, v32, OS_SIGNPOST_EVENT, v34, "SRResourcesFactorOverride", "Overriding factor %@ of type %@", buf, 0x16u);

                              uint64_t v6 = v35;
                            }

                            goto LABEL_41;
                          }
                        }
                        else
                        {
                          long long v24 = SRLogCategoryGeneral();
                          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
                          {
                            *(_DWORD *)buf = 138412290;
                            v56 = v16;
                            _os_log_error_impl(&dword_25E378000, v24, OS_LOG_TYPE_ERROR, "Overrides.plist has no type for parameter %@, skipping", buf, 0xCu);
                          }
LABEL_41:
                        }
LABEL_42:

                        continue;
                      }
                    }
                    uint64_t v13 = [obj countByEnumeratingWithState:&v47 objects:v59 count:16];
                  }
                  while (v13);
                }

                long long v37 = [NSDictionary dictionaryWithDictionary:v44];
                [v41 setObject:v37 forKeyedSubscript:v46];

                uint64_t v10 = v43 + 1;
              }
              while (v43 + 1 != v42);
              uint64_t v42 = [&unk_270B1D5F8 countByEnumeratingWithState:&v51 objects:v60 count:16];
            }
            while (v42);
          }
          uint64_t v38 = [NSDictionary dictionaryWithDictionary:v41];
          long long v39 = (void *)sOverrideList;
          sOverrideList = v38;
        }
      }
    }
  }
}

+ (void)dumpParameterList:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = SRLogCategoryGeneral();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_25E378000, v5, OS_LOG_TYPE_DEFAULT, "entry is a dictionary:", buf, 2u);
    }

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v6 = [v4 allKeys];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v37 count:16];
    if (v7)
    {
      uint64_t v9 = v7;
      uint64_t v10 = *(void *)v29;
      *(void *)&long long v8 = 138412290;
      long long v23 = v8;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v29 != v10) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          uint64_t v13 = objc_msgSend(v4, "objectForKey:", v12, v23);
          if (v13)
          {
            uint64_t v14 = SRLogCategoryGeneral();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v23;
              id v33 = v12;
              _os_log_impl(&dword_25E378000, v14, OS_LOG_TYPE_DEFAULT, "dumping entry [%@]:", buf, 0xCu);
            }

            [a1 dumpParameterList:v13];
          }
        }
        uint64_t v9 = [v6 countByEnumeratingWithState:&v28 objects:v37 count:16];
      }
      while (v9);
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v15 = SRLogCategoryGeneral();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_25E378000, v15, OS_LOG_TYPE_DEFAULT, "entry is an array:", buf, 2u);
      }

      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      uint64_t v6 = v4;
      uint64_t v16 = [v6 countByEnumeratingWithState:&v24 objects:v36 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v25;
        do
        {
          for (uint64_t j = 0; j != v17; ++j)
          {
            if (*(void *)v25 != v18) {
              objc_enumerationMutation(v6);
            }
            [a1 dumpParameterList:*(void *)(*((void *)&v24 + 1) + 8 * j)];
          }
          uint64_t v17 = [v6 countByEnumeratingWithState:&v24 objects:v36 count:16];
        }
        while (v17);
      }
    }
    else
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      uint64_t v6 = SRLogCategoryGeneral();
      BOOL v21 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
      if (isKindOfClass)
      {
        if (v21)
        {
          *(_DWORD *)buf = 138412290;
          id v33 = v4;
          _os_log_impl(&dword_25E378000, v6, OS_LOG_TYPE_DEFAULT, "entry is a parameter = (%@)", buf, 0xCu);
        }
      }
      else if (v21)
      {
        *(_DWORD *)buf = 138412546;
        id v33 = (id)objc_opt_class();
        __int16 v34 = 2112;
        id v35 = v4;
        id v22 = v33;
        _os_log_impl(&dword_25E378000, v6, OS_LOG_TYPE_DEFAULT, "entry has type %@ and is (%@)", buf, 0x16u);
      }
    }
  }
}

uint64_t __44__SRResourcesManager_sharedResourcesManager__block_invoke()
{
  id v0 = [SRResourcesManager alloc];
  sharedResourcesManager_resourcesManager = [(SRResourcesManager *)v0 initWithOptions:MEMORY[0x263EFFA78]];
  return MEMORY[0x270F9A758]();
}

- (id)resourcesForClient:(id)a3 options:(id)a4
{
  uint64_t v6 = (void *)MEMORY[0x263EFF960];
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [v6 currentLocale];
  uint64_t v10 = [(SRResourcesManager *)self resourcesForClient:v8 locale:v9 options:v7];

  return v10;
}

- (void)refreshTrialForClient:(id)a3
{
  id v9 = a3;
  if ([v9 isEqualToString:@"Spotlight"])
  {
    id v3 = +[SSTrialManager sharedSpotlightModelTrialManager];
    id v4 = v3;
    if (v3) {
      [v3 refreshTrackingId];
    }
    uint64_t v5 = +[SSTrialManager sharedSpotlightUITrialManager];

    if (v5) {
      [v5 refreshTrackingId];
    }
    uint64_t v6 = +[SSTrialManager sharedSpotlightRankingTrialManager];

    if (v6) {
      [v6 refreshTrackingId];
    }
    id v7 = +[SSTrialManager sharedSpotlightPolicyTrialManager];

    if (!v7) {
      goto LABEL_10;
    }
LABEL_9:
    [v7 refreshTrackingId];
LABEL_10:

    goto LABEL_11;
  }
  if ([v9 isEqualToString:@"SpotlightKnowledge"])
  {
    uint64_t v8 = +[SSTrialManager sharedSpotlightKnowledgeTrialManager];
    goto LABEL_18;
  }
  if ([v9 isEqualToString:@"Mail"])
  {
    uint64_t v8 = +[SSTrialManager sharedSpotlightUITrialManager];
LABEL_18:
    id v7 = (void *)v8;
    if (!v8) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_11:
}

- (void)loadDataSource:(id)a3
{
  id v20 = a3;
  id v3 = +[SRDefaultsManager sharedDefaultsManager];
  id v4 = [v3 currentNamespaces];

  if (!v4) {
    goto LABEL_18;
  }
  uint64_t v5 = [v4 objectForKeyedSubscript:v20];
  int v6 = [v5 isEqualToString:@"SPOTLIGHT_BLENDING_MODEL"];

  if (!v6)
  {
    uint64_t v8 = [v4 objectForKeyedSubscript:v20];
    int v9 = [v8 isEqualToString:@"SPOTLIGHT_UI"];

    if (v9)
    {
      id v7 = +[SSTrialManager sharedSpotlightUITrialManager];
      goto LABEL_8;
    }
    uint64_t v10 = [v4 objectForKeyedSubscript:v20];
    int v11 = [v10 isEqualToString:@"SPOTLIGHT_RANKING_RULES"];

    if (v11)
    {
      id v7 = +[SSTrialManager sharedSpotlightRankingTrialManager];
      goto LABEL_8;
    }
    uint64_t v13 = [v4 objectForKeyedSubscript:v20];
    int v14 = [v13 isEqualToString:@"SPOTLIGHT_RANKING_POLICY"];

    if (v14)
    {
      uint64_t v15 = +[SSTrialManager sharedSpotlightPolicyTrialManager];
LABEL_15:
      uint64_t v12 = (void *)v15;
      goto LABEL_19;
    }
    uint64_t v16 = [v4 objectForKeyedSubscript:v20];
    int v17 = [v16 isEqualToString:@"SPOTLIGHT_KNOWLEDGE_BEHAVIOR"];

    if (v17)
    {
      uint64_t v15 = +[SSTrialManager sharedSpotlightKnowledgeTrialManager];
      goto LABEL_15;
    }
    uint64_t v18 = [v4 objectForKeyedSubscript:v20];
    int v19 = [v18 isEqualToString:@"SPOTLIGHT_MAIL_APP"];

    if (v19)
    {
      id v7 = +[SSTrialManager sharedSpotlightMailTrialManager];
      goto LABEL_8;
    }
LABEL_18:
    uint64_t v12 = 0;
    goto LABEL_19;
  }
  id v7 = +[SSTrialManager sharedSpotlightModelTrialManager];
LABEL_8:
  uint64_t v12 = v7;
  if (v7 && ([v7 wasLoadedSinceLaunch] & 1) == 0) {
    [v12 loadWithUpdateHandler:sTrialUpdateHandler];
  }
LABEL_19:
}

- (void)loadAllParametersForClient:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFF960];
  id v5 = a3;
  id v6 = [v4 currentLocale];
  [(SRResourcesManager *)self loadAllParametersForClient:v5 locale:v6];
}

- (void)loadAllParametersForClient:(id)a3 locale:(id)a4
{
}

- (void)loadAllParametersForClient:(id)a3 locale:(id)a4 options:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [a4 localeIdentifier];
  int v11 = normalizedLocaleForIdentifier(v10);

  uint64_t v12 = +[SRDefaultsManager sharedDefaultsManager];
  [v12 setOptions:v9];

  uint64_t v13 = +[SRDefaultsManager sharedDefaultsManager];
  int v14 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"root"];
  [v13 loadDefaultsForLocale:v14 reload:0];

  uint64_t v15 = +[SRDefaultsManager sharedDefaultsManager];
  [v15 loadDefaultsForLocale:v11 reload:0];

  uint64_t v16 = +[SRDefaultsManager sharedDefaultsManager];
  int v17 = [v16 currentNamespacesForClient:v8];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v18 = v17;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v24;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v24 != v21) {
          objc_enumerationMutation(v18);
        }
        -[SRResourcesManager loadDataSource:](self, "loadDataSource:", *(void *)(*((void *)&v23 + 1) + 8 * v22++), (void)v23);
      }
      while (v20 != v22);
      uint64_t v20 = [v18 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v20);
  }
}

- (void)loadAllParameters
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v3 = [&unk_270B1D5F8 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(&unk_270B1D5F8);
        }
        [(SRResourcesManager *)self loadAllParametersForClient:*(void *)(*((void *)&v7 + 1) + 8 * v6++)];
      }
      while (v4 != v6);
      uint64_t v4 = [&unk_270B1D5F8 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)fetchAllParametersForLanguages:(id)a3 resourcePath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(SRResourcesManager *)self loadAllParameters];
  id v9 = +[SRDefaultsManager sharedDefaultsManager];
  long long v8 = [v7 setByAddingObject:@"root"];

  [v9 requestAssetsForLanguages:v8 resourcePath:v6];
}

- (id)allLoadedAssets
{
  uint64_t v2 = +[SRDefaultsManager sharedDefaultsManager];
  uint64_t v3 = [v2 allLoadedAssets];

  return v3;
}

- (id)assetConfigDump
{
  uint64_t v2 = +[SRDefaultsManager sharedDefaultsManager];
  uint64_t v3 = [v2 assetConfigDump];

  return v3;
}

- (id)trialConfigDump
{
  id v2 = objc_alloc(MEMORY[0x263F089D8]);
  uint64_t v3 = +[SRDefaultsManager sharedDefaultsManager];
  uint64_t v4 = [v3 trialConfigDump];
  uint64_t v5 = (void *)[v2 initWithString:v4];

  os_unfair_lock_lock((os_unfair_lock_t)&sTrialParameterListLock);
  [v5 appendFormat:@"\nFactors:\n%@", sTrialParameterList];
  os_unfair_lock_unlock((os_unfair_lock_t)&sTrialParameterListLock);
  [v5 appendFormat:@"\n\nOverrides:\n%@", sOverrideList];
  return v5;
}

- (BOOL)overrideFactor:(id)a3 client:(id)a4 type:(id)a5 value:(id)a6
{
  v36[1] = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = NSURL;
  uint64_t v13 = sOverridesPath;
  id v14 = a3;
  uint64_t v15 = [v12 fileURLWithPath:v13];
  uint64_t v16 = [MEMORY[0x263F08850] defaultManager];
  char v17 = [v16 fileExistsAtPath:sOverridesPath];

  if ((v17 & 1) == 0)
  {
    id v18 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v19 = sOverridesPath;
    uint64_t v35 = *MEMORY[0x263F080A8];
    v36[0] = *MEMORY[0x263F08098];
    uint64_t v20 = [NSDictionary dictionaryWithObjects:v36 forKeys:&v35 count:1];
    [v18 createFileAtPath:v19 contents:0 attributes:v20];
  }
  uint64_t v21 = [NSDictionary dictionaryWithContentsOfURL:v15];
  id v22 = (id)[v21 mutableCopy];

  if (!v22) {
    id v22 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  long long v23 = [v22 objectForKeyedSubscript:v9];

  if (!v23)
  {
    id v24 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [v22 setObject:v24 forKeyedSubscript:v9];
  }
  id v25 = v11;
  if ([v10 isEqualToString:@"Boolean"])
  {
    uint64_t v26 = objc_msgSend(objc_alloc(NSNumber), "initWithBool:", objc_msgSend(v25, "BOOLValue"));
LABEL_13:
    long long v27 = (void *)v26;

    goto LABEL_14;
  }
  if ([v10 isEqualToString:@"Long"])
  {
    uint64_t v26 = objc_msgSend(objc_alloc(NSNumber), "initWithLong:", objc_msgSend(v25, "integerValue"));
    goto LABEL_13;
  }
  long long v27 = v25;
  if ([v10 isEqualToString:@"Double"])
  {
    id v28 = objc_alloc(NSNumber);
    [v25 doubleValue];
    uint64_t v26 = objc_msgSend(v28, "initWithDouble:");
    goto LABEL_13;
  }
LABEL_14:
  v33[0] = @"Type";
  v33[1] = @"Value";
  v34[0] = v10;
  v34[1] = v27;
  long long v29 = [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:2];
  long long v30 = [v22 objectForKeyedSubscript:v9];
  [v30 setObject:v29 forKeyedSubscript:v14];

  long long v31 = (void *)[objc_alloc(NSNumber) initWithBool:1];
  [v22 setObject:v31 forKeyedSubscript:@"UsingOverrides"];

  LOBYTE(v31) = [v22 writeToURL:v15 error:0];
  return (char)v31;
}

void __43__SRResourcesManager_setTrialUpdateHandler__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_25E378000, v0, v1, "Loading monofactor for namespace %@", v2, v3, v4, v5, v6);
}

void __43__SRResourcesManager_setTrialUpdateHandler__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_25E378000, v0, v1, "Got exp config %@", v2, v3, v4, v5, v6);
}

void __43__SRResourcesManager_setTrialUpdateHandler__block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25E378000, v0, v1, "Error parsing exp config json: %@", v2, v3, v4, v5, v6);
}

void __43__SRResourcesManager_setTrialUpdateHandler__block_invoke_cold_4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_25E378000, v0, v1, "Loading IRIS exp config for namespace %@", v2, v3, v4, v5, v6);
}

void __43__SRResourcesManager_setTrialUpdateHandler__block_invoke_423_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v5 = 134218242;
  uint64_t v6 = [a1 type];
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_25E378000, a3, OS_LOG_TYPE_ERROR, "loadDataSource: invalid SRParameter type %ld for exp config %@", (uint8_t *)&v5, 0x16u);
}

void __43__SRResourcesManager_setTrialUpdateHandler__block_invoke_423_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25E378000, v0, v1, "Error updating exp config %@", v2, v3, v4, v5, v6);
}

void __43__SRResourcesManager_setTrialUpdateHandler__block_invoke_423_cold_7()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_25E378000, v0, v1, "Parameter %@ has exp config (%@)");
}

void __43__SRResourcesManager_setTrialUpdateHandler__block_invoke_423_cold_8(void *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  [a1 type];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_25E378000, a2, OS_LOG_TYPE_ERROR, "loadDataSource: invalid SRParameter type %ld", v3, 0xCu);
}

void __43__SRResourcesManager_setTrialUpdateHandler__block_invoke_423_cold_9()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_25E378000, v0, v1, "Ignoring Trial value for %@", v2, v3, v4, v5, v6);
}

void __43__SRResourcesManager_setTrialUpdateHandler__block_invoke_423_cold_11()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_25E378000, v0, v1, "Parameter %@ has Trial level", v2, v3, v4, v5, v6);
}

void __43__SRResourcesManager_setTrialUpdateHandler__block_invoke_423_cold_12()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_25E378000, v0, v1, "Updating parameter %@ for namespace %@");
}

- (void)initWithOptions:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_25E378000, log, OS_LOG_TYPE_ERROR, "SRResourcesManager init returning nil self", v1, 2u);
}

+ (void)parameterTypeFromString:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25E378000, v0, v1, "Invalid parameter type string %@", v2, v3, v4, v5, v6);
}

@end