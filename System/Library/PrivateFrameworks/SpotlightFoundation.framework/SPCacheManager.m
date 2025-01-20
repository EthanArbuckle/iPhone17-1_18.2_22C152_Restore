@interface SPCacheManager
+ (SPCacheManager)defaultManager;
+ (id)defaultProperties;
+ (id)defaultValueWithKey:(id)a3;
+ (id)defaults;
+ (id)identifier;
+ (int64_t)version;
+ (void)removeDefaults;
+ (void)removeKey:(id)a3;
+ (void)setDefaultWithKey:(id)a3 value:(id)a4;
+ (void)setVersionWithValue:(int64_t)a3;
- (SPCacheManager)init;
- (id)_createRecentsFromEngagedResults:(id)a3 maxCount:(unint64_t)a4;
- (id)recentResultsWithOptions:(id)a3;
- (id)recentResultsWithOptions:(id)a3 rankAndDeduplicate:(id)a4;
- (void)cacheContact:(id)a3 contactIdentifier:(id)a4 score:(id)a5 searchString:(id)a6;
- (void)cacheLocalResult:(id)a3 identifier:(id)a4 bundleIdentifier:(id)a5 protectionClass:(id)a6 searchString:(id)a7;
- (void)cachePerson:(id)a3 personQueryIdentifier:(id)a4 score:(id)a5 searchString:(id)a6;
- (void)cacheResult:(id)a3 title:(id)a4 searchString:(id)a5;
- (void)cacheSuggestion:(id)a3 type:(int)a4 score:(id)a5 searchString:(id)a6;
- (void)deleteAllResults;
- (void)deleteContact:(id)a3 contactIdentifier:(id)a4 score:(id)a5;
- (void)deleteLocalResult:(id)a3 identifier:(id)a4 bundleIdentifier:(id)a5 protectionClass:(id)a6;
- (void)deletePerson:(id)a3 personQueryIdentifier:(id)a4 score:(id)a5;
- (void)deleteResult:(id)a3 title:(id)a4;
- (void)deleteSuggestion:(id)a3 type:(int)a4 score:(id)a5;
- (void)enumerateRecentCompletionsWithSearchString:(id)a3 usingBlock:(id)a4;
- (void)enumerateRecentResultsUsingBlock:(id)a3;
- (void)updateRecentsWithBundleIdentifiers:(id)a3;
@end

@implementation SPCacheManager

uint64_t __32__SPCacheManager_defaultManager__block_invoke()
{
  defaultManager___DefaultManager = objc_alloc_init(SPCacheManager);
  return MEMORY[0x1F41817F8]();
}

+ (id)defaultProperties
{
  v2 = [(id)objc_opt_class() defaults];
  v3 = [v2 dictionaryRepresentation];
  v4 = [v3 objectForKey:@"Recents"];

  return v4;
}

+ (id)defaults
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CB18]);
  v3 = +[SPCacheManager identifier];
  v4 = (void *)[v2 initWithSuiteName:v3];

  return v4;
}

+ (id)identifier
{
  return @"com.apple.SpotlightFoundation";
}

+ (id)defaultValueWithKey:(id)a3
{
  id v3 = a3;
  v4 = [(id)objc_opt_class() defaultProperties];
  v5 = [v4 objectForKey:v3];

  return v5;
}

- (id)recentResultsWithOptions:(id)a3 rankAndDeduplicate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy_;
  v36 = __Block_byref_object_dispose_;
  id v37 = 0;
  id v37 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  session = self->_session;
  if (session && [(PARSession *)session enabledStatus] == 1)
  {
    v9 = [v6 objectForKeyedSubscript:@"SPSpotlightRecentsCacheOptionMaxCountKey"];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      uint64_t v10 = (int)[v9 intValue];
    }
    else {
      uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    }
    v12 = dispatch_group_create();
    dispatch_group_enter(v12);
    v13 = logForSPLogCategoryRecents();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[SPCacheManager recentResultsWithOptions:rankAndDeduplicate:]();
    }

    if ((v7 == 0) | ((objc_opt_respondsToSelector() & 1) == 0))
    {
      v17 = logForSPLogCategoryRecents();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B3DE9000, v17, OS_LOG_TYPE_DEFAULT, "spotlight cache: getting top engaged results", buf, 2u);
      }

      v18 = self->_session;
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __62__SPCacheManager_recentResultsWithOptions_rankAndDeduplicate___block_invoke_71;
      v22[3] = &unk_1E6082130;
      v24 = &v32;
      uint64_t v25 = v10;
      v22[4] = self;
      v23 = v12;
      [(PARSession *)v18 topEngagedResultsForInput:&stru_1F0CB2300 maxAmount:10 completion:v22];
      v16 = v23;
    }
    else
    {
      v14 = logForSPLogCategoryRecents();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B3DE9000, v14, OS_LOG_TYPE_DEFAULT, "spotlight cache: ranking, getting all engaged results", buf, 2u);
      }

      v15 = self->_session;
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __62__SPCacheManager_recentResultsWithOptions_rankAndDeduplicate___block_invoke;
      v26[3] = &unk_1E6082108;
      v28 = v7;
      v29 = &v32;
      v26[4] = self;
      uint64_t v30 = v10;
      v27 = v12;
      [(PARSession *)v15 allEngagedResultsForInput:&stru_1F0CB2300 maxAmount:100 completion:v26];

      v16 = v28;
    }

    dispatch_time_t v19 = dispatch_time(0, 10000000000);
    if (dispatch_group_wait(v12, v19)) {
      id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v20 = (id)v33[5];
    }
    id v11 = v20;
  }
  else
  {
    id v11 = (id)v33[5];
  }
  _Block_object_dispose(&v32, 8);

  return v11;
}

- (SPCacheManager)init
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)SPCacheManager;
  id v2 = [(SPCacheManager *)&v8 init];
  if (v2)
  {
    id v3 = (void *)[objc_alloc(MEMORY[0x1E4F5CBE0]) initWithId:@"com.apple.spotlight" userAgent:@"spotlight/1.0" factory:0];
    v4 = logForSPLogCategoryDefault();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v10 = v3;
      _os_log_impl(&dword_1B3DE9000, v4, OS_LOG_TYPE_DEFAULT, "spotlight cache: initializing session with configuration: %@", buf, 0xCu);
    }

    uint64_t v5 = [MEMORY[0x1E4F5CBD8] sessionWithConfiguration:v3];
    session = v2->_session;
    v2->_session = (PARSession *)v5;

    if (+[SPCacheManager version] != 25) {
      [(SPCacheManager *)v2 deleteAllResults];
    }
    notify_post((const char *)[@"SPSpotlightRecentsCacheDidChange" UTF8String]);
  }
  return v2;
}

+ (int64_t)version
{
  id v2 = +[SPCacheManager defaultValueWithKey:@"Version"];
  id v3 = v2;
  if (v2) {
    int64_t v4 = [v2 integerValue];
  }
  else {
    int64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v4;
}

+ (SPCacheManager)defaultManager
{
  if (defaultManager_onceToken != -1) {
    dispatch_once(&defaultManager_onceToken, &__block_literal_global_0);
  }
  id v2 = (void *)defaultManager___DefaultManager;
  return (SPCacheManager *)v2;
}

+ (void)setDefaultWithKey:(id)a3 value:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v10 = [(id)objc_opt_class() defaults];
  id v7 = [(id)objc_opt_class() defaultProperties];
  if (v7)
  {
    objc_super v8 = [(id)objc_opt_class() defaultProperties];
    id v9 = (id)[v8 mutableCopy];
  }
  else
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }

  [v9 setObject:v5 forKey:v6];
  [v10 setObject:v9 forKey:@"Recents"];
}

+ (void)removeKey:(id)a3
{
  id v3 = a3;
  id v6 = [(id)objc_opt_class() defaults];
  int64_t v4 = [(id)objc_opt_class() defaultProperties];
  id v5 = (void *)[v4 mutableCopy];

  [v5 removeObjectForKey:v3];
  [v6 setObject:v5 forKey:@"Recents"];
}

+ (void)removeDefaults
{
  id v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v3 = +[SPCacheManager identifier];
  [v2 removePersistentDomainForName:v3];

  int64_t v4 = (void *)MEMORY[0x1E4F1CB18];
  [v4 resetStandardUserDefaults];
}

+ (void)setVersionWithValue:(int64_t)a3
{
  int64_t v4 = objc_opt_class();
  id v5 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
  [v4 setDefaultWithKey:@"Version" value:v5];
}

- (void)updateRecentsWithBundleIdentifiers:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v26 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v27 = self;
  id v5 = [(SPCacheManager *)self recentResultsWithOptions:MEMORY[0x1E4F1CC08]];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v30;
    unint64_t v9 = 0x1E4F9A000uLL;
    do
    {
      uint64_t v10 = 0;
      uint64_t v28 = v7;
      do
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v29 + 1) + 8 * v10);
        v12 = [v11 topic];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          v14 = [v11 topic];
          v15 = [v14 identifier];
          v16 = searchResultWithTopicIdentifier(v15, 1.0);

          if ([v16 type] == 2)
          {
            v17 = [v16 resultBundleId];
            v18 = [v17 componentsSeparatedByString:@":"];

            dispatch_time_t v19 = [v18 firstObject];
            id v20 = [v18 lastObject];
            if (([v4 containsObject:v20] & 1) == 0)
            {
              [v16 identifier];
              uint64_t v21 = v8;
              unint64_t v22 = v9;
              v23 = v5;
              uint64_t v25 = v24 = v4;
              [(SPCacheManager *)v27 deleteLocalResult:v16 identifier:v25 bundleIdentifier:v20 protectionClass:v19];

              id v4 = v24;
              id v5 = v23;
              unint64_t v9 = v22;
              uint64_t v8 = v21;
              uint64_t v7 = v28;
            }
          }
        }
        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v7);
  }
}

- (void)cacheResult:(id)a3 title:(id)a4 searchString:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = [SPCachedResult alloc];
  v12 = [v8 normalizedTopic];
  v13 = [(SPCachedResult *)v11 initWithResult:v8 topic:v12 title:v10 searchString:v9];

  if (!v13)
  {
    v17 = logForSPLogCategoryCaching();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[SPCacheManager cacheResult:title:searchString:](v8);
    }
    goto LABEL_10;
  }
  v14 = [(SPCachedResult *)v13 encodedNormalizedTopic];

  if (v14)
  {
    if ([v9 length]) {
      [(PARSession *)self->_session clearEngagementsWithTitle:v9 type:&unk_1F0CB3160];
    }
    v15 = logForSPLogCategoryCaching();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v20 = [v8 type];
      _os_log_impl(&dword_1B3DE9000, v15, OS_LOG_TYPE_DEFAULT, "spotlight cache: spotlight cache: caching result with type: %d", buf, 8u);
    }

    session = self->_session;
    v18 = v13;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
    [(PARSession *)session addEngagedResults:v17 completion:&__block_literal_global_35];
LABEL_10:
  }
}

void __49__SPCacheManager_cacheResult_title_searchString___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v2 = logForSPLogCategoryCaching();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __49__SPCacheManager_cacheResult_title_searchString___block_invoke_cold_1();
    }
  }
  else
  {
    id v3 = (const char *)[@"SPSpotlightRecentsCacheDidChange" UTF8String];
    notify_post(v3);
  }
}

- (void)cacheLocalResult:(id)a3 identifier:(id)a4 bundleIdentifier:(id)a5 protectionClass:(id)a6 searchString:(id)a7
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (![v14 isEqualToString:@"com.apple.Preferences"]
    || ([v13 containsString:@"SAFETY_CHECK"] & 1) == 0)
  {
    v17 = [[SPCachedResult alloc] initWithResult:v12 identifier:v13 bundleIdentifier:v14 protectionClass:v15 searchString:v16];
    if (v17)
    {
      if ([v16 length]) {
        [(PARSession *)self->_session clearEngagementsWithTitle:v16 type:&unk_1F0CB3160];
      }
      v18 = logForSPLogCategoryCaching();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v23 = [v12 type];
        _os_log_impl(&dword_1B3DE9000, v18, OS_LOG_TYPE_DEFAULT, "spotlight cache: caching result with type: %d", buf, 8u);
      }

      session = self->_session;
      uint64_t v21 = v17;
      int v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
      [(PARSession *)session addEngagedResults:v20 completion:&__block_literal_global_43];
    }
    else
    {
      int v20 = logForSPLogCategoryCaching();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[SPCacheManager cacheResult:title:searchString:](v12);
      }
    }
  }
}

void __92__SPCacheManager_cacheLocalResult_identifier_bundleIdentifier_protectionClass_searchString___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v2 = logForSPLogCategoryCaching();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __92__SPCacheManager_cacheLocalResult_identifier_bundleIdentifier_protectionClass_searchString___block_invoke_cold_1();
    }
  }
  else
  {
    id v3 = (const char *)[@"SPSpotlightRecentsCacheDidChange" UTF8String];
    notify_post(v3);
  }
}

- (void)cachePerson:(id)a3 personQueryIdentifier:(id)a4 score:(id)a5 searchString:(id)a6
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [[SPCachedResult alloc] initWithPersonName:v13 personQueryIdentifier:v12 score:v11 searchString:v10];

  if (v14)
  {
    if ([v10 length]) {
      [(PARSession *)self->_session clearEngagementsWithTitle:v10 type:&unk_1F0CB3160];
    }
    id v15 = logForSPLogCategoryCaching();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_1B3DE9000, v15, OS_LOG_TYPE_DEFAULT, "spotlight cache: caching person with type", v18, 2u);
    }

    session = self->_session;
    v19[0] = v14;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    [(PARSession *)session addEngagedResults:v17 completion:&__block_literal_global_45];
  }
  else
  {
    v17 = logForSPLogCategoryCaching();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[SPCacheManager cachePerson:personQueryIdentifier:score:searchString:]();
    }
  }
}

void __71__SPCacheManager_cachePerson_personQueryIdentifier_score_searchString___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v2 = logForSPLogCategoryCaching();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __71__SPCacheManager_cachePerson_personQueryIdentifier_score_searchString___block_invoke_cold_1();
    }
  }
  else
  {
    id v3 = (const char *)[@"SPSpotlightRecentsCacheDidChange" UTF8String];
    notify_post(v3);
  }
}

- (void)cacheContact:(id)a3 contactIdentifier:(id)a4 score:(id)a5 searchString:(id)a6
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [[SPCachedResult alloc] initWithContactName:v13 contactIdentifier:v12 score:v11 searchString:v10];

  if (v14)
  {
    if ([v10 length]) {
      [(PARSession *)self->_session clearEngagementsWithTitle:v10 type:&unk_1F0CB3160];
    }
    id v15 = logForSPLogCategoryCaching();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_1B3DE9000, v15, OS_LOG_TYPE_DEFAULT, "spotlight cache: caching contact with type", v18, 2u);
    }

    session = self->_session;
    v19[0] = v14;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    [(PARSession *)session addEngagedResults:v17 completion:&__block_literal_global_47];
  }
  else
  {
    v17 = logForSPLogCategoryCaching();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[SPCacheManager cacheContact:contactIdentifier:score:searchString:]();
    }
  }
}

void __68__SPCacheManager_cacheContact_contactIdentifier_score_searchString___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v2 = logForSPLogCategoryCaching();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __68__SPCacheManager_cacheContact_contactIdentifier_score_searchString___block_invoke_cold_1();
    }
  }
  else
  {
    id v3 = (const char *)[@"SPSpotlightRecentsCacheDidChange" UTF8String];
    notify_post(v3);
  }
}

- (void)cacheSuggestion:(id)a3 type:(int)a4 score:(id)a5 searchString:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = [[SPCachedResult alloc] initWithTitle:v12 type:v7 score:v11 searchString:v10];

  if (v13)
  {
    if ([v10 length]) {
      [(PARSession *)self->_session clearEngagementsWithTitle:v10 type:&unk_1F0CB3160];
    }
    id v14 = logForSPLogCategoryCaching();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v19 = v7;
      _os_log_impl(&dword_1B3DE9000, v14, OS_LOG_TYPE_DEFAULT, "spotlight cache: caching suggestion with type: %d", buf, 8u);
    }

    session = self->_session;
    v17 = v13;
    id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
    [(PARSession *)session addEngagedResults:v16 completion:&__block_literal_global_49];
  }
  else
  {
    id v16 = logForSPLogCategoryCaching();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[SPCacheManager cacheSuggestion:type:score:searchString:]();
    }
  }
}

void __58__SPCacheManager_cacheSuggestion_type_score_searchString___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v2 = logForSPLogCategoryCaching();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __58__SPCacheManager_cacheSuggestion_type_score_searchString___block_invoke_cold_1();
    }
  }
  else
  {
    id v3 = (const char *)[@"SPSpotlightRecentsCacheDidChange" UTF8String];
    notify_post(v3);
  }
}

- (void)deleteResult:(id)a3 title:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [SPCachedResult alloc];
  id v9 = [v6 normalizedTopic];
  id v10 = [(SPCachedResult *)v8 initWithResult:v6 topic:v9 title:v7 searchString:0];

  if (v10)
  {
    id v11 = logForSPLogCategoryCaching();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v18 = [v6 type];
      _os_log_impl(&dword_1B3DE9000, v11, OS_LOG_TYPE_DEFAULT, "spotlight cache: deleting result with type: %d", buf, 8u);
    }

    session = self->_session;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __37__SPCacheManager_deleteResult_title___block_invoke;
    v13[3] = &unk_1E60820E0;
    id v14 = v6;
    id v15 = v7;
    id v16 = self;
    [(PARSession *)session clearEngagedResult:v10 completion:v13];
  }
}

void __37__SPCacheManager_deleteResult_title___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v2 = logForSPLogCategoryCaching();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __37__SPCacheManager_deleteResult_title___block_invoke_cold_1();
    }
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) requestedTopic];

    if (v4)
    {
      id v5 = [SPCachedResult alloc];
      id v6 = *(void **)(a1 + 32);
      id v7 = [v6 requestedTopic];
      id v8 = [(SPCachedResult *)v5 initWithResult:v6 topic:v7 title:*(void *)(a1 + 40) searchString:0];

      if (v8)
      {
        id v9 = logForSPLogCategoryCaching();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          int v10 = [*(id *)(a1 + 32) type];
          v12[0] = 67109120;
          v12[1] = v10;
          _os_log_impl(&dword_1B3DE9000, v9, OS_LOG_TYPE_DEFAULT, "spotlight cache: deleting result with type: %d", (uint8_t *)v12, 8u);
        }

        [*(id *)(*(void *)(a1 + 48) + 8) clearEngagedResult:v8 completion:&__block_literal_global_52];
      }
    }
    else
    {
      id v11 = (const char *)[@"SPSpotlightRecentsCacheDidChange" UTF8String];
      notify_post(v11);
    }
  }
}

void __37__SPCacheManager_deleteResult_title___block_invoke_50(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v2 = logForSPLogCategoryCaching();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __37__SPCacheManager_deleteResult_title___block_invoke_cold_1();
    }
  }
  else
  {
    id v3 = (const char *)[@"SPSpotlightRecentsCacheDidChange" UTF8String];
    notify_post(v3);
  }
}

- (void)deleteLocalResult:(id)a3 identifier:(id)a4 bundleIdentifier:(id)a5 protectionClass:(id)a6
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = [[SPCachedResult alloc] initWithResult:v10 identifier:v13 bundleIdentifier:v12 protectionClass:v11 searchString:0];

  id v15 = logForSPLogCategoryCaching();
  id v16 = v15;
  if (v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v17[0] = 67109120;
      v17[1] = [v10 type];
      _os_log_impl(&dword_1B3DE9000, v16, OS_LOG_TYPE_DEFAULT, "spotlight cache: deleting local result with type: %d", (uint8_t *)v17, 8u);
    }

    [(PARSession *)self->_session clearEngagedResult:v14 completion:&__block_literal_global_54];
  }
  else
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[SPCacheManager deleteLocalResult:identifier:bundleIdentifier:protectionClass:](v10);
    }
  }
}

void __80__SPCacheManager_deleteLocalResult_identifier_bundleIdentifier_protectionClass___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v2 = logForSPLogCategoryCaching();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __37__SPCacheManager_deleteResult_title___block_invoke_cold_1();
    }
  }
  else
  {
    id v3 = (const char *)[@"SPSpotlightRecentsCacheDidChange" UTF8String];
    notify_post(v3);
  }
}

- (void)deletePerson:(id)a3 personQueryIdentifier:(id)a4 score:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [[SPCachedResult alloc] initWithPersonName:v10 personQueryIdentifier:v9 score:v8 searchString:0];

  id v12 = logForSPLogCategoryCaching();
  id v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_1B3DE9000, v13, OS_LOG_TYPE_DEFAULT, "spotlight cache: deleting person with type", v18, 2u);
    }

    session = self->_session;
    id v15 = [(SPCachedResult *)v11 title];
    [(PARSession *)session clearEngagementsWithTitle:v15 type:&unk_1F0CB3178];

    id v16 = self->_session;
    v17 = [(SPCachedResult *)v11 title];
    [(PARSession *)v16 clearEngagementsWithTitle:v17 type:&unk_1F0CB3190];

    notify_post((const char *)[@"SPSpotlightRecentsCacheDidChange" UTF8String]);
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[SPCacheManager deletePerson:personQueryIdentifier:score:]();
    }
  }
}

- (void)deleteContact:(id)a3 contactIdentifier:(id)a4 score:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [[SPCachedResult alloc] initWithContactName:v10 contactIdentifier:v9 score:v8 searchString:0];

  id v12 = logForSPLogCategoryCaching();
  id v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_1B3DE9000, v13, OS_LOG_TYPE_DEFAULT, "spotlight cache: deleting contact with type", v18, 2u);
    }

    session = self->_session;
    id v15 = [(SPCachedResult *)v11 title];
    [(PARSession *)session clearEngagementsWithTitle:v15 type:&unk_1F0CB31A8];

    id v16 = self->_session;
    v17 = [(SPCachedResult *)v11 title];
    [(PARSession *)v16 clearEngagementsWithTitle:v17 type:&unk_1F0CB31C0];

    notify_post((const char *)[@"SPSpotlightRecentsCacheDidChange" UTF8String]);
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[SPCacheManager deleteContact:contactIdentifier:score:]();
    }
  }
}

- (void)deleteSuggestion:(id)a3 type:(int)a4 score:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [[SPCachedResult alloc] initWithTitle:v9 type:v5 score:v8 searchString:0];

  if (v10)
  {
    session = self->_session;
    id v12 = [(SPCachedResult *)v10 title];
    id v13 = [MEMORY[0x1E4F28ED0] numberWithInt:v5];
    [(PARSession *)session clearEngagementsWithTitle:v12 type:v13];

    notify_post((const char *)[@"SPSpotlightRecentsCacheDidChange" UTF8String]);
  }
  else
  {
    id v14 = logForSPLogCategoryCaching();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[SPCacheManager deleteSuggestion:type:score:]();
    }
  }
}

- (void)deleteAllResults
{
  session = self->_session;
  id v3 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:0.0];
  id v4 = [MEMORY[0x1E4F1C9C8] now];
  [(PARSession *)session clearEngagementsFromDate:v3 toDate:v4];

  +[SPCacheManager removeDefaults];
  +[SPCacheManager setVersionWithValue:25];
}

- (id)recentResultsWithOptions:(id)a3
{
  return [(SPCacheManager *)self recentResultsWithOptions:a3 rankAndDeduplicate:0];
}

void __62__SPCacheManager_recentResultsWithOptions_rankAndDeduplicate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = logForSPLogCategoryRecents();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134217984;
    uint64_t v12 = [v3 count];
    _os_log_impl(&dword_1B3DE9000, v4, OS_LOG_TYPE_DEFAULT, "spotlight cache: found all %ld engaged results", (uint8_t *)&v11, 0xCu);
  }

  uint64_t v5 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

  id v6 = logForSPLogCategoryRecents();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [v5 count];
    int v11 = 134217984;
    uint64_t v12 = v7;
    _os_log_impl(&dword_1B3DE9000, v6, OS_LOG_TYPE_DEFAULT, "spotlight cache: filtered to %ld engaged results", (uint8_t *)&v11, 0xCu);
  }

  uint64_t v8 = [*(id *)(a1 + 32) _createRecentsFromEngagedResults:v5 maxCount:*(void *)(a1 + 64)];
  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __62__SPCacheManager_recentResultsWithOptions_rankAndDeduplicate___block_invoke_71(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = logForSPLogCategoryRecents();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    uint64_t v9 = [v3 count];
    _os_log_impl(&dword_1B3DE9000, v4, OS_LOG_TYPE_DEFAULT, "spotlight cache: found top %ld engaged results", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v5 = [*(id *)(a1 + 32) _createRecentsFromEngagedResults:v3 maxCount:*(void *)(a1 + 56)];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (id)_createRecentsFromEngagedResults:(id)a3 maxCount:(unint64_t)a4
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v51 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v54 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v52 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  obuint64_t j = v4;
  uint64_t v8 = [obj countByEnumeratingWithState:&v75 objects:v85 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v76;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v76 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v75 + 1) + 8 * v11);
        uint64_t v13 = [[SPCachedResult alloc] initWithEngagedResult:v12];
        if (!v13)
        {
          id v14 = logForSPLogCategoryRecents();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            -[SPCacheManager _createRecentsFromEngagedResults:maxCount:](&v73, v74, v14);
          }
          goto LABEL_13;
        }
        if ([v12 type] == 36 || objc_msgSend(v12, "type") == 32)
        {
          id v14 = objc_msgSend(v12, "title", v51);
          id v15 = v54;
          goto LABEL_10;
        }
        if ([v12 type] == 37 || objc_msgSend(v12, "type") == 38)
        {
          id v14 = objc_msgSend(v12, "title", v51);
          id v15 = v6;
LABEL_10:
          [v15 setObject:v13 forKey:v14];
LABEL_13:

          goto LABEL_14;
        }
        if ([v12 type] == 34
          || [v12 type] == 16
          || [v12 type] == 17
          || [v12 type] == 15
          || [v12 type] == 31)
        {
          id v16 = [(SPCachedResult *)v13 title];
          id v14 = [v16 lowercaseString];

          if (([v7 containsObject:v14] & 1) == 0) {
            [v5 addObject:v13];
          }
          [v7 addObject:v14];
          goto LABEL_13;
        }
        if ([v12 type] == 30) {
          v17 = v52;
        }
        else {
          v17 = v5;
        }
        objc_msgSend(v17, "addObject:", v13, v51);
LABEL_14:

        ++v11;
      }
      while (v9 != v11);
      uint64_t v18 = [obj countByEnumeratingWithState:&v75 objects:v85 count:16];
      uint64_t v9 = v18;
    }
    while (v18);
  }

  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id v55 = v52;
  uint64_t v19 = [v55 countByEnumeratingWithState:&v69 objects:v84 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v70;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v70 != v21) {
          objc_enumerationMutation(v55);
        }
        int v23 = *(void **)(*((void *)&v69 + 1) + 8 * i);
        uint64_t v24 = objc_msgSend(v23, "title", v51);
        uint64_t v25 = [v24 lowercaseString];
        char v26 = [v7 containsObject:v25];

        if ((v26 & 1) == 0) {
          [v5 addObject:v23];
        }
      }
      uint64_t v20 = [v55 countByEnumeratingWithState:&v69 objects:v84 count:16];
    }
    while (v20);
  }

  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v27 = v54;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v65 objects:v83 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v66;
    do
    {
      for (uint64_t j = 0; j != v29; ++j)
      {
        if (*(void *)v66 != v30) {
          objc_enumerationMutation(v27);
        }
        uint64_t v32 = *(void *)(*((void *)&v65 + 1) + 8 * j);
        v33 = objc_msgSend(v6, "objectForKey:", v32, v51);

        if (!v33)
        {
          uint64_t v34 = [v27 objectForKeyedSubscript:v32];
          [v5 addObject:v34];
        }
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v65 objects:v83 count:16];
    }
    while (v29);
  }

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v35 = v6;
  uint64_t v36 = [v35 countByEnumeratingWithState:&v61 objects:v82 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v62;
    do
    {
      for (uint64_t k = 0; k != v37; ++k)
      {
        if (*(void *)v62 != v38) {
          objc_enumerationMutation(v35);
        }
        v40 = objc_msgSend(v35, "objectForKeyedSubscript:", *(void *)(*((void *)&v61 + 1) + 8 * k), v51);
        [v5 addObject:v40];
      }
      uint64_t v37 = [v35 countByEnumeratingWithState:&v61 objects:v82 count:16];
    }
    while (v37);
  }

  v41 = logForSPLogCategoryRecents();
  v42 = v51;
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v43 = [v5 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v81 = v43;
    _os_log_impl(&dword_1B3DE9000, v41, OS_LOG_TYPE_DEFAULT, "spotlight cache: returning %ld engaged completions", buf, 0xCu);
  }

  [v5 sortUsingComparator:&__block_literal_global_74];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v44 = v5;
  uint64_t v45 = [v44 countByEnumeratingWithState:&v57 objects:v79 count:16];
  if (v45)
  {
    uint64_t v46 = v45;
    uint64_t v47 = *(void *)v58;
    while (2)
    {
      for (uint64_t m = 0; m != v46; ++m)
      {
        if (*(void *)v58 != v47) {
          objc_enumerationMutation(v44);
        }
        v49 = objc_msgSend(*(id *)(*((void *)&v57 + 1) + 8 * m), "recentTopic", v51);
        if (v49) {
          [v42 addObject:v49];
        }
        if (a4 != 0x7FFFFFFFFFFFFFFFLL && [v42 count] >= a4)
        {

          goto LABEL_72;
        }
      }
      uint64_t v46 = [v44 countByEnumeratingWithState:&v57 objects:v79 count:16];
      if (v46) {
        continue;
      }
      break;
    }
  }
LABEL_72:

  return v42;
}

uint64_t __60__SPCacheManager__createRecentsFromEngagedResults_maxCount___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = [a3 engagementTime];
  id v6 = [v4 engagementTime];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (void)enumerateRecentResultsUsingBlock:(id)a3
{
  uint64_t v106 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void, void *, char *))a3;
  id v5 = [MEMORY[0x1E4F28ED0] numberWithInt:0xFFFFFFFFLL];
  char v100 = 1;
  session = self->_session;
  if (session && [(PARSession *)session enabledStatus] == 1)
  {
    uint64_t v94 = 0;
    v95 = &v94;
    uint64_t v96 = 0x3032000000;
    v97 = __Block_byref_object_copy_;
    v98 = __Block_byref_object_dispose_;
    id v99 = 0;
    id v99 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v88 = 0;
    v89 = &v88;
    uint64_t v90 = 0x3032000000;
    v91 = __Block_byref_object_copy_;
    v92 = __Block_byref_object_dispose_;
    id v93 = 0;
    id v93 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v82 = 0;
    v83 = &v82;
    uint64_t v84 = 0x3032000000;
    v85 = __Block_byref_object_copy_;
    uint64_t v86 = __Block_byref_object_dispose_;
    id v87 = 0;
    id v87 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v76 = 0;
    long long v77 = &v76;
    uint64_t v78 = 0x3032000000;
    v79 = __Block_byref_object_copy_;
    v80 = __Block_byref_object_dispose_;
    id v81 = 0;
    id v81 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v70 = 0;
    long long v71 = &v70;
    uint64_t v72 = 0x3032000000;
    uint8_t v73 = __Block_byref_object_copy_;
    v74 = __Block_byref_object_dispose_;
    id v75 = 0;
    id v75 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v64 = 0;
    long long v65 = &v64;
    uint64_t v66 = 0x3032000000;
    long long v67 = __Block_byref_object_copy_;
    long long v68 = __Block_byref_object_dispose_;
    id v69 = 0;
    id v69 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v7 = dispatch_group_create();
    dispatch_group_enter(v7);
    uint64_t v8 = logForSPLogCategoryRecents();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B3DE9000, v8, OS_LOG_TYPE_DEFAULT, "spotlight cache: getting top engaged results", buf, 2u);
    }

    uint64_t v9 = self->_session;
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __51__SPCacheManager_enumerateRecentResultsUsingBlock___block_invoke;
    v56[3] = &unk_1E6082178;
    long long v58 = &v70;
    long long v59 = &v64;
    long long v60 = &v82;
    long long v61 = &v76;
    long long v62 = &v88;
    long long v63 = &v94;
    dispatch_group_t group = v7;
    dispatch_group_t v57 = group;
    [(PARSession *)v9 topEngagedResultsForInput:&stru_1F0CB2300 maxAmount:10 completion:v56];
    dispatch_time_t v10 = dispatch_time(0, 10000000000);
    if (dispatch_group_wait(group, v10))
    {
      v4[2](v4, 0, v5, &v100);
    }
    else
    {
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      id v11 = (id)v71[5];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v52 objects:v105 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v53;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v53 != v13) {
              objc_enumerationMutation(v11);
            }
            uint64_t v15 = *(void *)(*((void *)&v52 + 1) + 8 * i);
            id v16 = [(id)v83[5] objectForKey:v15];

            if (!v16)
            {
              v17 = [(id)v71[5] objectForKeyedSubscript:v15];
              uint64_t v18 = [(id)v65[5] objectForKeyedSubscript:v15];

              uint64_t v19 = [(id)v89[5] count];
              [(id)v89[5] addObject:v17];
              uint64_t v20 = (void *)v95[5];
              uint64_t v21 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v19];
              [v20 setObject:v18 forKey:v21];

              id v5 = (void *)v18;
            }
          }
          uint64_t v12 = [v11 countByEnumeratingWithState:&v52 objects:v105 count:16];
        }
        while (v12);
      }

      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      id v22 = (id)v83[5];
      uint64_t v23 = [v22 countByEnumeratingWithState:&v48 objects:v104 count:16];
      if (v23)
      {
        uint64_t v24 = *(void *)v49;
        do
        {
          uint64_t v25 = 0;
          char v26 = v5;
          do
          {
            if (*(void *)v49 != v24) {
              objc_enumerationMutation(v22);
            }
            uint64_t v27 = *(void *)(*((void *)&v48 + 1) + 8 * v25);
            uint64_t v28 = [(id)v83[5] objectForKeyedSubscript:v27];
            id v5 = [(id)v77[5] objectForKeyedSubscript:v27];

            uint64_t v29 = [(id)v89[5] count];
            [(id)v89[5] addObject:v28];
            uint64_t v30 = (void *)v95[5];
            long long v31 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v29];
            [v30 setObject:v5 forKey:v31];

            ++v25;
            char v26 = v5;
          }
          while (v23 != v25);
          uint64_t v23 = [v22 countByEnumeratingWithState:&v48 objects:v104 count:16];
        }
        while (v23);
      }

      uint64_t v32 = logForSPLogCategoryRecents();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v33 = [(id)v95[5] count];
        *(_DWORD *)buf = 134217984;
        uint64_t v103 = v33;
        _os_log_impl(&dword_1B3DE9000, v32, OS_LOG_TYPE_DEFAULT, "spotlight cache: returning %ld engaged completions", buf, 0xCu);
      }

      uint64_t v34 = [(id)v95[5] keysSortedByValueUsingSelector:sel_compare_];
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v35 = [v34 reverseObjectEnumerator];
      uint64_t v36 = [v35 countByEnumeratingWithState:&v44 objects:v101 count:16];
      if (v36)
      {
        uint64_t v37 = *(void *)v45;
LABEL_28:
        uint64_t v38 = 0;
        v39 = v5;
        while (1)
        {
          if (*(void *)v45 != v37) {
            objc_enumerationMutation(v35);
          }
          v40 = *(void **)(*((void *)&v44 + 1) + 8 * v38);
          id v5 = [(id)v95[5] objectForKeyedSubscript:v40];

          v41 = objc_msgSend((id)v89[5], "objectAtIndex:", (int)objc_msgSend(v40, "intValue"));
          ((void (**)(id, void *, void *, char *))v4)[2](v4, v41, v5, &v100);
          BOOL v42 = v100 == 0;

          if (!v42) {
            break;
          }
          ++v38;
          v39 = v5;
          if (v36 == v38)
          {
            uint64_t v36 = [v35 countByEnumeratingWithState:&v44 objects:v101 count:16];
            if (v36) {
              goto LABEL_28;
            }
            break;
          }
        }
      }
    }
    _Block_object_dispose(&v64, 8);

    _Block_object_dispose(&v70, 8);
    _Block_object_dispose(&v76, 8);

    _Block_object_dispose(&v82, 8);
    _Block_object_dispose(&v88, 8);

    _Block_object_dispose(&v94, 8);
  }
  else
  {
    v4[2](v4, 0, v5, &v100);
  }
}

void __51__SPCacheManager_enumerateRecentResultsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = logForSPLogCategoryRecents();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v35 = [v3 count];
    _os_log_impl(&dword_1B3DE9000, v4, OS_LOG_TYPE_DEFAULT, "spotlight cache: found %ld engaged results", buf, 0xCu);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v30;
    uint64_t v27 = &buf[1];
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(v5);
        }
        dispatch_time_t v10 = *(void **)(*((void *)&v29 + 1) + 8 * v9);
        id v11 = [[SPCachedResult alloc] initWithEngagedResult:v10];
        uint64_t v12 = [(SPCachedResult *)v11 searchResult];

        if (v12)
        {
          if ([v10 type] == 36 || objc_msgSend(v10, "type") == 32)
          {
            uint64_t v13 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
            id v14 = objc_msgSend(v10, "title", v27);
            [v13 setObject:v12 forKey:v14];

            uint64_t v15 = *(void *)(a1 + 48);
            goto LABEL_12;
          }
          if ([v10 type] == 37 || objc_msgSend(v10, "type") == 38)
          {
            uint64_t v21 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
            id v22 = objc_msgSend(v10, "title", v27);
            [v21 setObject:v12 forKey:v22];

            uint64_t v15 = *(void *)(a1 + 64);
LABEL_12:
            id v16 = *(void **)(*(void *)(v15 + 8) + 40);
            v17 = (void *)MEMORY[0x1E4F28ED0];
            [v10 freshnessScore];
            uint64_t v18 = objc_msgSend(v17, "numberWithDouble:");
            uint64_t v19 = [v10 title];
            uint64_t v20 = v16;
          }
          else
          {
            uint64_t v28 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) count];
            [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) addObject:v12];
            id v23 = v5;
            uint64_t v24 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
            uint64_t v25 = (void *)MEMORY[0x1E4F28ED0];
            [v10 freshnessScore];
            uint64_t v18 = objc_msgSend(v25, "numberWithDouble:");
            uint64_t v19 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v28];
            uint64_t v20 = v24;
            id v5 = v23;
          }
          objc_msgSend(v20, "setObject:forKey:", v18, v19, v27);

          goto LABEL_16;
        }
        uint64_t v18 = logForSPLogCategoryRecents();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          -[SPCacheManager _createRecentsFromEngagedResults:maxCount:](buf, v27, v18);
        }
LABEL_16:

        ++v9;
      }
      while (v7 != v9);
      uint64_t v26 = [v5 countByEnumeratingWithState:&v29 objects:v33 count:16];
      uint64_t v7 = v26;
    }
    while (v26);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)enumerateRecentCompletionsWithSearchString:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = logForSPLogCategoryRecents();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3DE9000, v8, OS_LOG_TYPE_DEFAULT, "spotlight cache: getting top engaged results", buf, 2u);
  }

  session = self->_session;
  if (session && [(PARSession *)session enabledStatus] == 1)
  {
    dispatch_time_t v10 = self->_session;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __72__SPCacheManager_enumerateRecentCompletionsWithSearchString_usingBlock___block_invoke;
    v11[3] = &unk_1E60821A0;
    id v12 = v7;
    [(PARSession *)v10 topEngagedResultsForInput:v6 maxAmount:10 completion:v11];
  }
}

void __72__SPCacheManager_enumerateRecentCompletionsWithSearchString_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = logForSPLogCategoryRecents();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v24 = [v3 count];
    _os_log_impl(&dword_1B3DE9000, v4, OS_LOG_TYPE_DEFAULT, "spotlight cache: found %ld engaged results", buf, 0xCu);
  }

  char v21 = 0;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v18;
LABEL_5:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v18 != v9) {
        objc_enumerationMutation(v5);
      }
      id v11 = *(void **)(*((void *)&v17 + 1) + 8 * v10);
      if (resultIsSuggestionType(objc_msgSend(v11, "type", (void)v17)))
      {
        uint64_t v12 = *(void *)(a1 + 32);
        uint64_t v13 = [v11 title];
        id v14 = (void *)MEMORY[0x1E4F28ED0];
        [v11 score];
        uint64_t v15 = objc_msgSend(v14, "numberWithDouble:");
        (*(void (**)(uint64_t, void *, void *, uint64_t, char *))(v12 + 16))(v12, v13, v15, [v11 type], &v21);

        ++v8;
        if (v21) {
          break;
        }
      }
      if (v7 == ++v10)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v22 count:16];
        if (v7) {
          goto LABEL_5;
        }
        break;
      }
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  id v16 = logForSPLogCategoryRecents();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v24 = v8;
    _os_log_impl(&dword_1B3DE9000, v16, OS_LOG_TYPE_DEFAULT, "spotlight cache: returning %ld engaged completions", buf, 0xCu);
  }
}

- (void).cxx_destruct
{
}

- (void)cacheResult:(void *)a1 title:searchString:.cold.1(void *a1)
{
  [a1 type];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1B3DE9000, v1, v2, "spotlight cache: could not create cached result with result: %d", v3, v4, v5, v6, v7);
}

void __49__SPCacheManager_cacheResult_title_searchString___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B3DE9000, v0, v1, "spotlight cache: could not add result to cache", v2, v3, v4, v5, v6);
}

void __92__SPCacheManager_cacheLocalResult_identifier_bundleIdentifier_protectionClass_searchString___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B3DE9000, v0, v1, "spotlight cache: could not add local result to cache", v2, v3, v4, v5, v6);
}

- (void)cachePerson:personQueryIdentifier:score:searchString:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B3DE9000, v0, v1, "spotlight cache: could not create cached person result", v2, v3, v4, v5, v6);
}

void __71__SPCacheManager_cachePerson_personQueryIdentifier_score_searchString___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B3DE9000, v0, v1, "spotlight cache: could not add person result to cache", v2, v3, v4, v5, v6);
}

- (void)cacheContact:contactIdentifier:score:searchString:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B3DE9000, v0, v1, "spotlight cache: could not create cached contact result", v2, v3, v4, v5, v6);
}

void __68__SPCacheManager_cacheContact_contactIdentifier_score_searchString___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B3DE9000, v0, v1, "spotlight cache: could not add contact result to cache", v2, v3, v4, v5, v6);
}

- (void)cacheSuggestion:type:score:searchString:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1B3DE9000, v0, OS_LOG_TYPE_ERROR, "spotlight cache: could not create cached result with suggestion: %d", v1, 8u);
}

void __58__SPCacheManager_cacheSuggestion_type_score_searchString___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B3DE9000, v0, v1, "spotlight cache: could not add suggestion to cache", v2, v3, v4, v5, v6);
}

void __37__SPCacheManager_deleteResult_title___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B3DE9000, v0, v1, "spotlight cache: could not delete cached result", v2, v3, v4, v5, v6);
}

- (void)deleteLocalResult:(void *)a1 identifier:bundleIdentifier:protectionClass:.cold.1(void *a1)
{
  [a1 type];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1B3DE9000, v1, v2, "spotlight cache: could not delete cached result with result: %d", v3, v4, v5, v6, v7);
}

- (void)deletePerson:personQueryIdentifier:score:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B3DE9000, v0, v1, "spotlight cache: could not delete cached person result", v2, v3, v4, v5, v6);
}

- (void)deleteContact:contactIdentifier:score:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B3DE9000, v0, v1, "spotlight cache: could not delete cached contact result", v2, v3, v4, v5, v6);
}

- (void)deleteSuggestion:type:score:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1B3DE9000, v0, OS_LOG_TYPE_ERROR, "spotlight cache: could not delete cached result with suggestion: %d", v1, 8u);
}

- (void)recentResultsWithOptions:rankAndDeduplicate:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B3DE9000, v0, v1, "spotlight cache: meh", v2, v3, v4, v5, v6);
}

- (void)_createRecentsFromEngagedResults:(os_log_t)log maxCount:.cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1B3DE9000, log, OS_LOG_TYPE_ERROR, "spotlight cache: could not create search result with engaged result", buf, 2u);
}

@end