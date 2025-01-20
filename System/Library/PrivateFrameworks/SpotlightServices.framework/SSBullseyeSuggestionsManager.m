@interface SSBullseyeSuggestionsManager
+ (id)sharedSuggestionsManager;
- (BOOL)enabledAboveFoldResults;
- (BOOL)enabledFullSuggestionsBlending;
- (BOOL)enabledSuggestionsBlending;
- (BOOL)enabledSuggestionsOverrides;
- (BOOL)ignoreMaxCount;
- (NSDictionary)modelFeatureNames;
- (NSNumber)localSuggestionThreshold;
- (NSNumber)serverSuggestionThreshold;
- (NSString)blendingModelPath;
- (OS_dispatch_queue)queue;
- (SRResources)resources;
- (SSBullseyeSuggestionsManager)initWithOptions:(id)a3;
- (SSCoreMLInterface)blendingModel;
- (id)_getScoreForSuggestionResult:(id)a3 options:(id)a4;
- (id)_rankedSuggestionsResultsWithQueryContext:(id)a3 serverSuggestionResults:(id)a4 localSuggestionResults:(id)a5 options:(id)a6;
- (id)intentBasedSuggestionBlending:(id)a3 suggestions:(id)a4;
- (id)orderedSuggestionsWithQueryContext:(id)a3 filters:(id)a4 entityFilters:(id)a5 contactFilters:(id)a6 userSuggestion:(id)a7 userWebSuggestion:(id)a8 shortcutSuggestionResults:(id)a9 actionSuggestionResults:(id)a10 contactSuggestionResults:(id)a11 serverSuggestionResults:(id)a12 localSuggestionResults:(id)a13 options:(id)a14;
- (id)release2022_blendingByPolicyWithQueryContext:(id)a3 filters:(id)a4 entityFilters:(id)a5 contactFilters:(id)a6 userSuggestion:(id)a7 userWebSuggestion:(id)a8 shortcutSuggestionResults:(id)a9 actionSuggestionResults:(id)a10 contactSuggestionResults:(id)a11 serverSuggestionResults:(id)a12 localSuggestionResults:(id)a13 options:(id)a14;
- (id)release2023_blendingByPolicyWithQueryContext:(id)a3 filters:(id)a4 entityFilters:(id)a5 contactFilters:(id)a6 userSuggestion:(id)a7 userWebSuggestion:(id)a8 actionSuggestionResults:(id)a9 contactSuggestionResults:(id)a10 serverSuggestionResults:(id)a11 localSuggestionResults:(id)a12 options:(id)a13;
- (id)release2023_blendingWithQueryContext:(id)a3 filters:(id)a4 entityFilters:(id)a5 contactFilters:(id)a6 userSuggestion:(id)a7 userWebSuggestion:(id)a8 shortcutSuggestionResults:(id)a9 actionSuggestionResults:(id)a10 contactSuggestionResults:(id)a11 serverSuggestionResults:(id)a12 localSuggestionResults:(id)a13 options:(id)a14;
- (id)suggestionKeyWithCompletion:(id)a3;
- (int64_t)maxLocalSuggestionCount;
- (int64_t)maxServerSuggestionCount;
- (int64_t)maxTotalSuggestionCount;
- (int64_t)maxTotalSuggestionCountForAboveFoldResults;
- (unint64_t)localDisplayPosition;
- (void)_filterSuggestionResultsWithQueryContext:(id)a3 filters:(id)a4 entityFilters:(id)a5 contactFilters:(id)a6 contactSuggestionResults:(id)a7 localSuggestionResults:(id)a8 serverSuggestionResults:(id)a9 options:(id)a10;
- (void)clearBlendingModel;
- (void)loadBlendingModelWithPath:(id)a3 forceLoad:(BOOL)a4;
- (void)loadDefaultsWithOptions:(id)a3;
- (void)setBlendingModel:(id)a3;
- (void)updateDefaultsWithOptions:(id)a3;
@end

@implementation SSBullseyeSuggestionsManager

+ (id)sharedSuggestionsManager
{
  if (sharedSuggestionsManager_onceToken != -1) {
    dispatch_once(&sharedSuggestionsManager_onceToken, &__block_literal_global_25);
  }
  v2 = (void *)sharedSuggestionsManager_gSuggestionsManager;
  return v2;
}

uint64_t __56__SSBullseyeSuggestionsManager_sharedSuggestionsManager__block_invoke()
{
  sharedSuggestionsManager_gSuggestionsManager = [[SSBullseyeSuggestionsManager alloc] initWithOptions:0];
  return MEMORY[0x1F41817F8]();
}

- (SSBullseyeSuggestionsManager)initWithOptions:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SSBullseyeSuggestionsManager;
  v5 = [(SSBullseyeSuggestionsManager *)&v11 init];
  if (v5)
  {
    v5->_enabledSuggestionsOverrides = SSDefaultsGetState(5uLL);
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.SpotlightServices.suggestions.blending", v7);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v8;

    [(SSBullseyeSuggestionsManager *)v5 loadDefaultsWithOptions:v4];
  }

  return v5;
}

- (void)loadDefaultsWithOptions:(id)a3
{
  id v52 = a3;
  id v4 = (NSDictionary *)[v52 copy];
  defaultOptions = self->_defaultOptions;
  self->_defaultOptions = v4;

  SSDefaultsGetResources();
  v6 = (SRResources *)objc_claimAutoreleasedReturnValue();
  resources = self->_resources;
  self->_resources = v6;

  uint64_t v8 = [(SRResources *)self->_resources objectForKey:@"EnableSuggestionsBlending"];
  id v9 = v52;
  v51 = (void *)v8;
  if (v52)
  {
    v10 = [v52 objectForKeyedSubscript:@"EnableSuggestionsBlending"];
    if (v10)
    {
      uint64_t v11 = [v52 objectForKeyedSubscript:@"EnableSuggestionsBlending"];
    }
    else
    {
      uint64_t v11 = 0;
    }

    v51 = (void *)v11;
    id v9 = v52;
  }
  if (v51)
  {
    char v12 = [v51 BOOLValue];
    id v9 = v52;
  }
  else
  {
    char v12 = 0;
  }
  self->_enabledSuggestionsBlending = v12;
  if (!v9 && [(SSBullseyeSuggestionsManager *)self enabledSuggestionsOverrides]) {
    self->_enabledSuggestionsBlending = _os_feature_enabled_impl();
  }
  v50 = [(SRResources *)self->_resources objectForKey:@"EnableFullSuggestionsBlending"];
  id v13 = v52;
  if (v52)
  {
    v14 = [v52 objectForKeyedSubscript:@"EnableFullSuggestionsBlending"];
    if (v14)
    {
      uint64_t v15 = [v52 objectForKeyedSubscript:@"EnableFullSuggestionsBlending"];
    }
    else
    {
      uint64_t v15 = 0;
    }

    v50 = (void *)v15;
    id v13 = v52;
  }
  if (v50)
  {
    char v16 = [v50 BOOLValue];
    id v13 = v52;
  }
  else
  {
    char v16 = 0;
  }
  self->_enabledFullSuggestionsBlending = v16;
  if (!v13 && [(SSBullseyeSuggestionsManager *)self enabledSuggestionsOverrides]) {
    self->_enabledFullSuggestionsBlending = _os_feature_enabled_impl();
  }
  v17 = [(SRResources *)self->_resources objectForKey:@"ServerSuggestionThreshold"];
  if (v52)
  {
    uint64_t v18 = [v52 objectForKeyedSubscript:@"serverThreshold"];

    v17 = (void *)v18;
  }
  if (!v17
    || ([v17 doubleValue], v19 == 0.0)
    || ([v17 doubleValue], v20 == 2.22507386e-308))
  {
    v21 = 0;
  }
  else
  {
    v21 = v17;
  }
  objc_storeStrong((id *)&self->_serverSuggestionThreshold, v21);
  v22 = [(SRResources *)self->_resources objectForKey:@"LocalSuggestionThreshold"];
  if (v52)
  {
    uint64_t v23 = [v52 objectForKeyedSubscript:@"localThreshold"];

    v22 = (void *)v23;
  }
  if (!v22
    || ([v22 doubleValue], v24 == 0.0)
    || ([v22 doubleValue], v25 == 2.22507386e-308))
  {
    v26 = 0;
  }
  else
  {
    v26 = v22;
  }
  objc_storeStrong((id *)&self->_localSuggestionThreshold, v26);
  v27 = [(SRResources *)self->_resources objectForKey:@"MaxTotalSuggestions"];
  if (v52)
  {
    uint64_t v28 = [v52 objectForKeyedSubscript:@"maxTotalSuggestions"];

    v27 = (void *)v28;
  }
  v29 = [(SRResources *)self->_resources objectForKey:@"MaxTotalSuggestionsForAboveFoldResults"];
  if (v52)
  {
    uint64_t v30 = [v52 objectForKeyedSubscript:@"maxTotalSuggestionsForAboveFoldResults"];

    v29 = (void *)v30;
  }
  v31 = [(SRResources *)self->_resources objectForKey:@"EnableForceAboveFoldResults"];
  if (v52)
  {
    uint64_t v32 = [v52 objectForKeyedSubscript:@"EnableForceAboveFoldResults"];

    v31 = (void *)v32;
  }
  if (v31) {
    char v33 = [v31 BOOLValue];
  }
  else {
    char v33 = 0;
  }
  self->_enabledAboveFoldResults = v33;
  if (v27) {
    int64_t v34 = [v27 integerValue];
  }
  else {
    int64_t v34 = 0x7FFFFFFFLL;
  }
  self->_maxTotalSuggestionCount = v34;
  if (v29) {
    int64_t v34 = [v29 integerValue];
  }
  self->_maxTotalSuggestionCountForAboveFoldResults = v34;
  v35 = [(SRResources *)self->_resources objectForKey:@"MaxServerSuggestionCount"];
  if (v52)
  {
    uint64_t v36 = [v52 objectForKeyedSubscript:@"maxServerSuggestions"];

    v35 = (void *)v36;
  }
  if (!v35 || [v35 integerValue] < 0) {
    int64_t v37 = 0x7FFFFFFFLL;
  }
  else {
    int64_t v37 = [v35 integerValue];
  }
  self->_maxServerSuggestionCount = v37;
  v38 = [(SRResources *)self->_resources objectForKey:@"MaxSuggestionCount"];
  if (v52)
  {
    uint64_t v39 = [v52 objectForKeyedSubscript:@"maxLocalSuggestions"];

    v38 = (void *)v39;
  }
  if (!v38 || [v38 integerValue] < 0) {
    int64_t v40 = 0x7FFFFFFFLL;
  }
  else {
    int64_t v40 = [v38 integerValue];
  }
  self->_maxLocalSuggestionCount = v40;
  v41 = [(SRResources *)self->_resources objectForKey:@"LocalDisplayPosition"];
  v49 = v31;
  if (v52)
  {
    uint64_t v42 = [v52 objectForKeyedSubscript:@"localDisplayPosition"];

    v41 = (void *)v42;
  }
  if (!v41 || [v41 integerValue] == 0x7FFFFFFF || objc_msgSend(v41, "integerValue") == -1) {
    unint64_t v43 = 0;
  }
  else {
    unint64_t v43 = [v41 unsignedIntValue];
  }
  self->_localDisplayPosition = v43;
  v44 = [(SRResources *)self->_resources objectForKey:@"IgnoreMaxCountForSingleSuggestionsType"];
  if (v52)
  {
    [v52 objectForKeyedSubscript:@"ignoreMaxCountForSingleSuggestionsType"];
    uint64_t v46 = v45 = v35;

    v44 = (void *)v46;
    v35 = v45;
  }
  if (v44) {
    char v47 = [v44 BOOLValue];
  }
  else {
    char v47 = 0;
  }
  self->_ignoreMaxCount = v47;
  if ([(SSBullseyeSuggestionsManager *)self enabledSuggestionsBlending])
  {
    v48 = [(SRResources *)self->_resources filePathForKey:@"SuggestionsBlendingModel"];
    [(SSBullseyeSuggestionsManager *)self loadBlendingModelWithPath:v48 forceLoad:v52 != 0];
  }
}

- (void)updateDefaultsWithOptions:(id)a3
{
  id v18 = a3;
  id v4 = [(SSBullseyeSuggestionsManager *)self resources];
  int v5 = [v4 hasUpdates];

  if (v5) {
    [(SSBullseyeSuggestionsManager *)self loadDefaultsWithOptions:self->_defaultOptions];
  }
  v6 = [v18 objectForKeyedSubscript:@"serverThreshold"];
  if (v6) {
    objc_storeStrong((id *)&self->_serverSuggestionThreshold, v6);
  }
  v7 = [v18 objectForKeyedSubscript:@"localThreshold"];
  if (v7) {
    objc_storeStrong((id *)&self->_localSuggestionThreshold, v7);
  }
  uint64_t v8 = [v18 objectForKeyedSubscript:@"maxTotalSuggestions"];
  id v9 = v8;
  if (v8) {
    self->_maxTotalSuggestionCount = [v8 integerValue];
  }
  v10 = [v18 objectForKeyedSubscript:@"maxServerSuggestions"];
  uint64_t v11 = v10;
  if (v10) {
    self->_maxServerSuggestionCount = [v10 integerValue];
  }
  char v12 = [v18 objectForKeyedSubscript:@"maxLocalSuggestions"];
  id v13 = v12;
  if (v12) {
    self->_maxLocalSuggestionCount = [v12 integerValue];
  }
  v14 = [v18 objectForKeyedSubscript:@"localDisplayPosition"];
  uint64_t v15 = v14;
  if (v14) {
    self->_localDisplayPosition = [v14 unsignedIntValue];
  }
  char v16 = [v18 objectForKeyedSubscript:@"ignoreMaxCountForSingleSuggestionsType"];
  v17 = v16;
  if (v16) {
    self->_ignoreMaxCount = [v16 BOOLValue];
  }
}

- (void)loadBlendingModelWithPath:(id)a3 forceLoad:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(SSBullseyeSuggestionsManager *)self blendingModelPath];
  uint64_t v8 = v7;
  if (v6 && v7)
  {
    id v9 = [(SSBullseyeSuggestionsManager *)self blendingModelPath];
    char v10 = [v9 isEqualToString:v6];

    if (v10) {
      goto LABEL_14;
    }
  }
  else
  {
  }
  uint64_t v11 = (NSString *)[v6 copy];
  blendingModelPath = self->_blendingModelPath;
  self->_blendingModelPath = v11;

  if (v4)
  {
    id v13 = (void *)MEMORY[0x1E4F1CB10];
    v14 = [(SSBullseyeSuggestionsManager *)self blendingModelPath];
    uint64_t v15 = [v13 fileURLWithPath:v14 isDirectory:1];

    id v20 = 0;
    char v16 = [[SSCoreMLInterface alloc] initWithURL:v15 error:&v20];
    id v17 = v20;
    if (v17)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[SSBullseyeSuggestionsManager loadBlendingModelWithPath:forceLoad:]((uint64_t)v17);
      }
      [(SSBullseyeSuggestionsManager *)self clearBlendingModel];
    }
    else
    {
      [(SSBullseyeSuggestionsManager *)self setBlendingModel:v16];
    }
  }
  else
  {
    id v18 = [(SSBullseyeSuggestionsManager *)self queue];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __68__SSBullseyeSuggestionsManager_loadBlendingModelWithPath_forceLoad___block_invoke;
    v19[3] = &unk_1E634C270;
    v19[4] = self;
    dispatch_async(v18, v19);
  }
LABEL_14:
}

void __68__SSBullseyeSuggestionsManager_loadBlendingModelWithPath_forceLoad___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F1CB10];
  v3 = [*(id *)(a1 + 32) blendingModelPath];
  BOOL v4 = [v2 fileURLWithPath:v3 isDirectory:1];

  id v8 = 0;
  int v5 = [[SSCoreMLInterface alloc] initWithURL:v4 error:&v8];
  id v6 = v8;
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SSBullseyeSuggestionsManager loadBlendingModelWithPath:forceLoad:]((uint64_t)v6);
    }
  }
  else
  {
    [*(id *)(a1 + 32) setBlendingModel:v5];
    v7 = [*(id *)(a1 + 32) modelFeatureNames];

    if (v7) {
      goto LABEL_6;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      __68__SSBullseyeSuggestionsManager_loadBlendingModelWithPath_forceLoad___block_invoke_cold_1();
    }
  }
  [*(id *)(a1 + 32) clearBlendingModel];
LABEL_6:
}

- (SSCoreMLInterface)blendingModel
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_blendingModel;
  objc_sync_exit(v2);

  return v3;
}

- (void)setBlendingModel:(id)a3
{
  id v8 = a3;
  int v5 = self;
  objc_sync_enter(v5);
  objc_storeStrong((id *)&v5->_blendingModel, a3);
  uint64_t v6 = [(SSCoreMLInterface *)v5->_blendingModel getInputDescriptionsByName];
  modelFeatureNames = v5->_modelFeatureNames;
  v5->_modelFeatureNames = (NSDictionary *)v6;

  objc_sync_exit(v5);
}

- (void)clearBlendingModel
{
  obj = self;
  objc_sync_enter(obj);
  blendingModel = obj->_blendingModel;
  obj->_blendingModel = 0;

  blendingModelPath = obj->_blendingModelPath;
  obj->_blendingModelPath = 0;

  modelFeatureNames = obj->_modelFeatureNames;
  obj->_modelFeatureNames = 0;

  obj->_enabledSuggestionsBlending = 0;
  objc_sync_exit(obj);
}

- (id)orderedSuggestionsWithQueryContext:(id)a3 filters:(id)a4 entityFilters:(id)a5 contactFilters:(id)a6 userSuggestion:(id)a7 userWebSuggestion:(id)a8 shortcutSuggestionResults:(id)a9 actionSuggestionResults:(id)a10 contactSuggestionResults:(id)a11 serverSuggestionResults:(id)a12 localSuggestionResults:(id)a13 options:(id)a14
{
  id v47 = a3;
  id v54 = a4;
  id v46 = a5;
  id v51 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  id v24 = a12;
  id v25 = a13;
  id v26 = a14;
  [(SSBullseyeSuggestionsManager *)self updateDefaultsWithOptions:v26];
  v27 = [(SSBullseyeSuggestionsManager *)self blendingModel];

  id v52 = v21;
  id v53 = v26;
  v49 = v22;
  if (v27)
  {
    uint64_t v28 = v25;
    v29 = v51;
    uint64_t v30 = v46;
    if ([(SSBullseyeSuggestionsManager *)self enabledFullSuggestionsBlending])
    {
      id v42 = v22;
      v31 = v47;
      [(SSBullseyeSuggestionsManager *)self release2023_blendingWithQueryContext:v47 filters:v54 entityFilters:v46 contactFilters:v51 userSuggestion:v19 userWebSuggestion:v20 shortcutSuggestionResults:v52 actionSuggestionResults:v42 contactSuggestionResults:v23 serverSuggestionResults:v24 localSuggestionResults:v25 options:v53];
    }
    else
    {
      id v41 = v22;
      v31 = v47;
      [(SSBullseyeSuggestionsManager *)self release2023_blendingByPolicyWithQueryContext:v47 filters:v54 entityFilters:v46 contactFilters:v51 userSuggestion:v19 userWebSuggestion:v20 actionSuggestionResults:v41 contactSuggestionResults:v23 serverSuggestionResults:v24 localSuggestionResults:v25 options:v53];
    v45 = };
  }
  else
  {
    id v44 = v26;
    id v40 = v21;
    id v43 = v22;
    uint64_t v30 = v46;
    v31 = v47;
    v29 = v51;
    v45 = [(SSBullseyeSuggestionsManager *)self release2022_blendingByPolicyWithQueryContext:v47 filters:v54 entityFilters:v46 contactFilters:v51 userSuggestion:v19 userWebSuggestion:v20 shortcutSuggestionResults:v40 actionSuggestionResults:v43 contactSuggestionResults:v23 serverSuggestionResults:v24 localSuggestionResults:v25 options:v44];
    uint64_t v28 = v25;
  }
  if (+[SSQueryIntentManager isEnabled])
  {
    v48 = v28;
    uint64_t v32 = [v31 queryIntent];
    if (v32)
    {
      char v33 = (void *)v32;
      int64_t v34 = v30;
      v35 = [v31 queryIntent];
      int v36 = [v35 intentType];

      if (v36)
      {
        int64_t v37 = [(SSBullseyeSuggestionsManager *)self intentBasedSuggestionBlending:v31 suggestions:v45];

        uint64_t v30 = v34;
        v29 = v51;
        uint64_t v28 = v48;
        v38 = v53;
        goto LABEL_14;
      }
      uint64_t v30 = v34;
      v29 = v51;
    }
    uint64_t v28 = v48;
    v38 = v53;
    int64_t v37 = v45;
  }
  else
  {
    v38 = v53;
    int64_t v37 = v45;
  }
LABEL_14:

  return v37;
}

- (id)_getScoreForSuggestionResult:(id)a3 options:(id)a4
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = objc_opt_new();
  double v7 = (double)(int)[v5 type];
  id v8 = [v5 query];
  double v9 = (double)(unint64_t)[v8 length];

  char v10 = [v5 completion];
  double v11 = (double)(unint64_t)[v10 length];

  char v12 = [MEMORY[0x1E4F28ED0] numberWithDouble:v7];
  [v6 setObject:v12 forKey:@"type"];

  id v13 = [MEMORY[0x1E4F28ED0] numberWithDouble:v9];
  [v6 setObject:v13 forKey:@"plen"];

  v14 = [MEMORY[0x1E4F28ED0] numberWithDouble:v11];
  [v6 setObject:v14 forKey:@"slen"];

  uint64_t v15 = [MEMORY[0x1E4F28ED0] numberWithDouble:v9 / (v11 + 1.0)];
  [v6 setObject:v15 forKey:@"ratio"];

  char v16 = (void *)MEMORY[0x1E4F28ED0];
  [v5 rankingScore];
  id v17 = objc_msgSend(v16, "numberWithDouble:");
  [v6 setObject:v17 forKey:@"score"];

  id v18 = [v5 spotlightSuggestion];

  if (v18)
  {
    id v19 = [v5 spotlightSuggestion];
    id v20 = [v19 features];

    if (getFeaturesForSuggestionResult_onceToken == -1)
    {
      if (v20)
      {
LABEL_4:
        id v82 = 0;
        id v21 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:getFeaturesForSuggestionResult_sFeatureClasses fromData:v20 error:&v82];
        id v22 = v82;
        if (!v22 && v21)
        {
          [v6 addEntriesFromDictionary:v21];
          id v22 = 0;
LABEL_28:

LABEL_29:
          goto LABEL_30;
        }
LABEL_26:
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          -[SSBullseyeSuggestionsManager _getScoreForSuggestionResult:options:]();
        }
        goto LABEL_28;
      }
    }
    else
    {
      dispatch_once(&getFeaturesForSuggestionResult_onceToken, &__block_literal_global_300);
      if (v20) {
        goto LABEL_4;
      }
    }
    id v22 = 0;
    id v21 = 0;
    goto LABEL_26;
  }
  id v23 = [v5 suggestion];

  if (v23)
  {
    id v24 = (void *)MEMORY[0x1E4F28ED0];
    id v25 = [v5 suggestion];
    [v25 score];
    id v26 = objc_msgSend(v24, "numberWithDouble:");
    [v6 setObject:v26 forKey:@"score"];

    v27 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v28 = [v5 suggestion];
    v29 = objc_msgSend(v27, "numberWithInt:", objc_msgSend(v28, "type"));
    [v6 setObject:v29 forKey:@"stype"];

    uint64_t v30 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v31 = [v5 suggestion];
    uint64_t v32 = [(id)v31 suggestion];
    char v33 = objc_msgSend(v30, "numberWithUnsignedInteger:", objc_msgSend(v32, "length"));
    [v6 setObject:v33 forKey:@"sslen"];

    int64_t v34 = [v5 suggestion];
    objc_opt_class();
    LOBYTE(v31) = objc_opt_isKindOfClass();

    if (v31)
    {
      id v20 = [v5 suggestion];
      v35 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithDouble:", (double)(unint64_t)objc_msgSend(v20, "queryLen"));
      [v6 setObject:v35 forKey:@"queryLen"];

      int v36 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithDouble:", (double)(unint64_t)objc_msgSend(v20, "fragments"));
      [v6 setObject:v36 forKey:@"fragments"];

      int64_t v37 = (void *)MEMORY[0x1E4F28ED0];
      [v20 age];
      v38 = objc_msgSend(v37, "numberWithDouble:");
      [v6 setObject:v38 forKey:@"age"];

      uint64_t v39 = (void *)MEMORY[0x1E4F28ED0];
      [v20 prob];
      id v40 = objc_msgSend(v39, "numberWithDouble:");
      [v6 setObject:v40 forKey:@"prob"];

      [v20 compositeScore];
      double v42 = v41;
      double v43 = 0.0;
      if (v42 != 1.79769313e308) {
        objc_msgSend(v20, "compositeScore", 0.0);
      }
      id v44 = [MEMORY[0x1E4F28ED0] numberWithDouble:v43];
      [v6 setObject:v44 forKey:@"compositeScore"];

      if ([v20 isSingleThread]) {
        v45 = &unk_1F1864090;
      }
      else {
        v45 = &unk_1F1864080;
      }
      [v6 setObject:v45 forKey:@"isSingleThread"];
      if ([v20 hasUsedDate]) {
        id v46 = &unk_1F1864090;
      }
      else {
        id v46 = &unk_1F1864080;
      }
      [v6 setObject:v46 forKey:@"hasUsedDate"];
      if ([v20 isShortcut]) {
        id v47 = &unk_1F1864090;
      }
      else {
        id v47 = &unk_1F1864080;
      }
      [v6 setObject:v47 forKey:@"isShortcut"];
      if ([v20 hasMultipleResults]) {
        v48 = &unk_1F1864090;
      }
      else {
        v48 = &unk_1F1864080;
      }
      [v6 setObject:v48 forKey:@"hasMultipleResults"];
      goto LABEL_29;
    }
  }
LABEL_30:
  v49 = [v5 serverFeatures];
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  uint64_t v50 = [v49 countByEnumeratingWithState:&v78 objects:v84 count:16];
  if (v50)
  {
    uint64_t v51 = v50;
    uint64_t v52 = *(void *)v79;
    do
    {
      for (uint64_t i = 0; i != v51; ++i)
      {
        if (*(void *)v79 != v52) {
          objc_enumerationMutation(v49);
        }
        uint64_t v54 = *(void *)(*((void *)&v78 + 1) + 8 * i);
        v55 = [v49 objectForKeyedSubscript:v54];
        [v6 setObject:v55 forKey:v54];
      }
      uint64_t v51 = [v49 countByEnumeratingWithState:&v78 objects:v84 count:16];
    }
    while (v51);
  }

  if (!v6 || ![v6 count])
  {
    v70 = &unk_1F1864080;
    goto LABEL_56;
  }
  v56 = objc_opt_new();
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  v72 = self;
  v57 = [(SSBullseyeSuggestionsManager *)self modelFeatureNames];
  uint64_t v58 = [v57 countByEnumeratingWithState:&v74 objects:v83 count:16];
  if (v58)
  {
    uint64_t v59 = v58;
    uint64_t v60 = *(void *)v75;
    do
    {
      for (uint64_t j = 0; j != v59; ++j)
      {
        if (*(void *)v75 != v60) {
          objc_enumerationMutation(v57);
        }
        uint64_t v62 = *(void *)(*((void *)&v74 + 1) + 8 * j);
        v63 = [v6 objectForKey:v62];

        if (v63)
        {
          v64 = [v6 objectForKeyedSubscript:v62];
          [v56 setObject:v64 forKey:v62];
        }
        else
        {
          [v56 setObject:&unk_1F1864080 forKey:v62];
        }
      }
      uint64_t v59 = [v57 countByEnumeratingWithState:&v74 objects:v83 count:16];
    }
    while (v59);
  }

  v65 = [(SSBullseyeSuggestionsManager *)v72 blendingModel];
  id v73 = 0;
  [v65 predictFromDictionaryFeatures:v56 error:&v73];
  float v67 = v66;
  id v68 = v73;

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SSBullseyeSuggestionsManager _getScoreForSuggestionResult:options:]((uint64_t)v56, v67);
    if (v68) {
      goto LABEL_51;
    }
LABEL_54:
    *(float *)&double v69 = v67;
    v70 = [MEMORY[0x1E4F28ED0] numberWithFloat:v69];
    goto LABEL_55;
  }
  if (!v68) {
    goto LABEL_54;
  }
LABEL_51:
  v70 = &unk_1F1864080;
LABEL_55:

LABEL_56:
  return v70;
}

- (id)suggestionKeyWithCompletion:(id)a3
{
  v3 = SSNormalizedQueryString(a3);
  BOOL v4 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  id v5 = [v3 stringByTrimmingCharactersInSet:v4];

  return v5;
}

- (void)_filterSuggestionResultsWithQueryContext:(id)a3 filters:(id)a4 entityFilters:(id)a5 contactFilters:(id)a6 contactSuggestionResults:(id)a7 localSuggestionResults:(id)a8 serverSuggestionResults:(id)a9 options:(id)a10
{
  uint64_t v130 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v87 = a4;
  id v17 = a5;
  id v95 = a6;
  id v18 = a7;
  id v19 = a8;
  id v85 = a9;
  id v86 = a10;
  v103 = objc_opt_new();
  id v98 = (id)objc_opt_new();
  v93 = objc_opt_new();
  v88 = v16;
  id v20 = [v16 searchString];
  v94 = [(SSBullseyeSuggestionsManager *)self suggestionKeyWithCompletion:v20];

  long long v123 = 0u;
  long long v124 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  obuint64_t j = v18;
  uint64_t v21 = [obj countByEnumeratingWithState:&v121 objects:v129 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    v90 = 0;
    uint64_t v23 = *(void *)v122;
    while (2)
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v122 != v23) {
          objc_enumerationMutation(obj);
        }
        id v25 = *(void **)(*((void *)&v121 + 1) + 8 * i);
        id v26 = [v25 completion];
        v27 = [(SSBullseyeSuggestionsManager *)self suggestionKeyWithCompletion:v26];

        if ((!v95 || ([v95 containsObject:v27] & 1) == 0)
          && ([v93 containsObject:v27] & 1) == 0
          && [v27 containsString:v94])
        {
          uint64_t v28 = v90;
          if (!v90) {
            uint64_t v28 = objc_opt_new();
          }
          [v28 addObject:v25];
          [v93 addObject:v27];
          v90 = v28;
          if ([(SSBullseyeSuggestionsManager *)self maxLocalSuggestionCount] != 0x7FFFFFFF)
          {
            uint64_t v29 = [v28 count];
            if (v29 >= [(SSBullseyeSuggestionsManager *)self maxLocalSuggestionCount])
            {

              goto LABEL_19;
            }
          }
        }
      }
      uint64_t v22 = [obj countByEnumeratingWithState:&v121 objects:v129 count:16];
      if (v22) {
        continue;
      }
      break;
    }
  }
  else
  {
    v90 = 0;
  }
LABEL_19:
  id v97 = v17;

  id v96 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v30 = (id)[v19 sortedArrayUsingComparator:&__block_literal_global_151];
  long long v117 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  id v31 = v19;
  uint64_t v32 = [v31 countByEnumeratingWithState:&v117 objects:v128 count:16];
  v104 = self;
  if (!v32)
  {
    v89 = 0;
    v35 = v98;
    goto LABEL_53;
  }
  uint64_t v33 = v32;
  v89 = 0;
  uint64_t v34 = *(void *)v118;
  v35 = v98;
  id v101 = v31;
  do
  {
    uint64_t v36 = 0;
    do
    {
      if (*(void *)v118 != v34) {
        objc_enumerationMutation(v101);
      }
      int64_t v37 = *(void **)(*((void *)&v117 + 1) + 8 * v36);
      int v38 = [v37 type];
      uint64_t v39 = [v37 completion];
      id v40 = [(SSBullseyeSuggestionsManager *)self suggestionKeyWithCompletion:v39];

      if (v38 == 38 || v38 == 32)
      {
        if ((!v95 || ([v95 containsObject:v40] & 1) == 0)
          && ([v35 containsObject:v40] & 1) == 0)
        {
          [v96 addObject:v37];
        }
        if (!v35) {
          v35 = objc_opt_new();
        }
        double v41 = v35;
LABEL_33:
        [v41 addObject:v40];
        goto LABEL_34;
      }
      if (([v103 containsObject:v40] & 1) == 0)
      {
        if ([v40 isEqualToString:v94])
        {
          if (v38 == 34)
          {
            id v42 = v37;

            v89 = v42;
          }
        }
        else if (!v95 || ([v95 containsObject:v40] & 1) == 0)
        {
          if (v38 != 31 && v38 != 16) {
            goto LABEL_46;
          }
          uint64_t v43 = [(SSBullseyeSuggestionsManager *)self localSuggestionThreshold];
          if (!v43) {
            goto LABEL_46;
          }
          id v44 = (void *)v43;
          v45 = (void *)MEMORY[0x1E4F28ED0];
          [v37 rankingScore];
          id v46 = objc_msgSend(v45, "numberWithDouble:");
          [(SSBullseyeSuggestionsManager *)self localSuggestionThreshold];
          v48 = id v47 = v35;
          id v99 = (id)[v46 compare:v48];

          v35 = v47;
          self = v104;

          if (v99 == (id)-1) {
LABEL_46:
          }
            [v96 addObject:v37];
          double v41 = v103;
          if (!v103) {
            double v41 = objc_opt_new();
          }
          v103 = v41;
          goto LABEL_33;
        }
      }
LABEL_34:

      ++v36;
    }
    while (v33 != v36);
    id v31 = v101;
    uint64_t v49 = [v101 countByEnumeratingWithState:&v117 objects:v128 count:16];
    uint64_t v33 = v49;
  }
  while (v49);
LABEL_53:

  [v31 removeAllObjects];
  [v31 addObjectsFromArray:v96];
  uint64_t v50 = v35;
  if (![v35 count])
  {
    long long v115 = 0u;
    long long v116 = 0u;
    long long v113 = 0u;
    long long v114 = 0u;
    id v51 = v90;
    uint64_t v52 = [v51 countByEnumeratingWithState:&v113 objects:v127 count:16];
    if (v52)
    {
      uint64_t v53 = v52;
      uint64_t v54 = *(void *)v114;
      do
      {
        for (uint64_t j = 0; j != v53; ++j)
        {
          if (*(void *)v114 != v54) {
            objc_enumerationMutation(v51);
          }
          v56 = *(void **)(*((void *)&v113 + 1) + 8 * j);
          v57 = [v56 completion];
          uint64_t v58 = [(SSBullseyeSuggestionsManager *)v104 suggestionKeyWithCompletion:v57];

          v35 = v50;
          if (([v50 containsObject:v58] & 1) == 0) {
            [v31 addObject:v56];
          }
        }
        uint64_t v53 = [v51 countByEnumeratingWithState:&v113 objects:v127 count:16];
      }
      while (v53);
    }
  }
  [v96 removeAllObjects];
  long long v111 = 0u;
  long long v112 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  id v102 = v31;
  uint64_t v59 = [v102 countByEnumeratingWithState:&v109 objects:v126 count:16];
  if (v59)
  {
    uint64_t v60 = v59;
    uint64_t v61 = *(void *)v110;
    do
    {
      for (uint64_t k = 0; k != v60; ++k)
      {
        if (*(void *)v110 != v61) {
          objc_enumerationMutation(v102);
        }
        v63 = *(void **)(*((void *)&v109 + 1) + 8 * k);
        if (!_os_feature_enabled_impl()
          || [v63 type] != 32 && objc_msgSend(v63, "type") != 38)
        {
          if ([v63 type] == 32 || objc_msgSend(v63, "type") == 38)
          {
            [v96 addObject:v63];
          }
          else
          {
            v64 = [v63 completion];
            v65 = [(SSBullseyeSuggestionsManager *)v104 suggestionKeyWithCompletion:v64];

            v35 = v50;
            if (([v50 containsObject:v65] & 1) == 0) {
              [v96 addObject:v63];
            }
          }
        }
      }
      uint64_t v60 = [v102 countByEnumeratingWithState:&v109 objects:v126 count:16];
    }
    while (v60);
  }

  [v102 removeAllObjects];
  [v102 addObjectsFromArray:v96];
  id v92 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v105 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  id v100 = v85;
  uint64_t v66 = [v100 countByEnumeratingWithState:&v105 objects:v125 count:16];
  if (v66)
  {
    uint64_t v67 = v66;
    id v68 = 0;
    uint64_t v69 = *(void *)v106;
    v70 = v97;
    do
    {
      for (uint64_t m = 0; m != v67; ++m)
      {
        if (*(void *)v106 != v69) {
          objc_enumerationMutation(v100);
        }
        v72 = *(void **)(*((void *)&v105 + 1) + 8 * m);
        if ([v72 type] == 29)
        {
          id v73 = v72;

          id v68 = v73;
        }
        else
        {
          uint64_t v74 = [(SSBullseyeSuggestionsManager *)v104 serverSuggestionThreshold];
          if (!v74) {
            goto LABEL_89;
          }
          long long v75 = (void *)v74;
          long long v76 = (void *)MEMORY[0x1E4F28ED0];
          [v72 rankingScore];
          long long v77 = objc_msgSend(v76, "numberWithDouble:");
          long long v78 = [(SSBullseyeSuggestionsManager *)v104 serverSuggestionThreshold];
          uint64_t v79 = [v77 compare:v78];

          v70 = v97;
          if (v79 != 1)
          {
LABEL_89:
            long long v80 = [v72 entityIdentifier];

            if (v80)
            {
              if (![v70 count]
                || ([v72 entityIdentifier],
                    long long v81 = objc_claimAutoreleasedReturnValue(),
                    char v82 = [v70 containsObject:v81],
                    v81,
                    (v82 & 1) == 0))
              {
                [v92 addObject:v72];
              }
            }
            else
            {
              v83 = [v72 completion];
              v84 = [(SSBullseyeSuggestionsManager *)v104 suggestionKeyWithCompletion:v83];

              if (([v103 containsObject:v84] & 1) == 0) {
                [v92 addObject:v72];
              }
            }
          }
        }
        v35 = v50;
      }
      uint64_t v67 = [v100 countByEnumeratingWithState:&v105 objects:v125 count:16];
    }
    while (v67);
  }
  else
  {
    id v68 = 0;
    v70 = v97;
  }

  [v100 removeAllObjects];
  [v100 addObjectsFromArray:v92];
  if (!v68 && v89) {
    [v102 addObject:v89];
  }
}

uint64_t __190__SSBullseyeSuggestionsManager__filterSuggestionResultsWithQueryContext_filters_entityFilters_contactFilters_contactSuggestionResults_localSuggestionResults_serverSuggestionResults_options___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compareByRank:");
}

- (id)_rankedSuggestionsResultsWithQueryContext:(id)a3 serverSuggestionResults:(id)a4 localSuggestionResults:(id)a5 options:(id)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v13 = v9;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v34 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        id v19 = [(SSBullseyeSuggestionsManager *)self _getScoreForSuggestionResult:v18 options:v11];
        [v12 setObject:v19 forKey:v18];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v15);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v20 = v10;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v30;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v30 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = *(void *)(*((void *)&v29 + 1) + 8 * j);
        id v26 = -[SSBullseyeSuggestionsManager _getScoreForSuggestionResult:options:](self, "_getScoreForSuggestionResult:options:", v25, v11, (void)v29);
        [v12 setObject:v26 forKey:v25];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v22);
  }

  v27 = [v12 keysSortedByValueUsingComparator:&__block_literal_global_154];

  return v27;
}

uint64_t __129__SSBullseyeSuggestionsManager__rankedSuggestionsResultsWithQueryContext_serverSuggestionResults_localSuggestionResults_options___block_invoke(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, "compare:") == -1) {
    return 1;
  }
  else {
    return -1;
  }
}

- (id)release2023_blendingWithQueryContext:(id)a3 filters:(id)a4 entityFilters:(id)a5 contactFilters:(id)a6 userSuggestion:(id)a7 userWebSuggestion:(id)a8 shortcutSuggestionResults:(id)a9 actionSuggestionResults:(id)a10 contactSuggestionResults:(id)a11 serverSuggestionResults:(id)a12 localSuggestionResults:(id)a13 options:(id)a14
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v69 = a3;
  id v76 = a4;
  id v75 = a5;
  id v74 = a6;
  id v19 = a7;
  id v20 = a8;
  id v71 = a9;
  id v70 = a10;
  id v21 = a11;
  id v22 = a12;
  id v23 = a13;
  id v73 = a14;
  unint64_t v24 = 0x1E4F1C000uLL;
  uint64_t v25 = [MEMORY[0x1E4F1CA48] array];
  id v26 = (void *)MEMORY[0x1C1885190]();
  uint64_t v66 = v20;
  if ([v21 count]
    || [v23 count]
    || [v22 count]
    || [v71 count]
    || [v70 count])
  {
    context = v26;
    id v65 = v19;
    id v27 = v20;
    long long v82 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    id v28 = v22;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v82 objects:v88 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      id v31 = v23;
      uint64_t v32 = *(void *)v83;
LABEL_8:
      uint64_t v33 = 0;
      while (1)
      {
        if (*(void *)v83 != v32) {
          objc_enumerationMutation(v28);
        }
        long long v34 = *(void **)(*((void *)&v82 + 1) + 8 * v33);
        if ([v34 type] == 29) {
          break;
        }
        if (v30 == ++v33)
        {
          uint64_t v30 = [v28 countByEnumeratingWithState:&v82 objects:v88 count:16];
          if (v30) {
            goto LABEL_8;
          }
          id v62 = 0;
          long long v35 = v28;
          goto LABEL_17;
        }
      }
      id v36 = v34;

      if (v36)
      {
        id v37 = v36;
        long long v35 = v27;
        id v62 = v37;
        id v27 = v37;
LABEL_17:
        int v38 = v69;
        id v23 = v31;
        unint64_t v24 = 0x1E4F1C000;
        goto LABEL_19;
      }
      id v62 = 0;
      int v38 = v69;
      id v23 = v31;
      unint64_t v24 = 0x1E4F1C000uLL;
    }
    else
    {
      id v62 = 0;
      long long v35 = v28;
      int v38 = v69;
LABEL_19:
    }
    if ([v23 count]) {
      id v39 = (id)[v23 mutableCopy];
    }
    else {
      id v39 = objc_alloc_init(*(Class *)(v24 + 2632));
    }
    id v40 = v39;
    if ([v28 count]) {
      id v41 = (id)[v28 mutableCopy];
    }
    else {
      id v41 = objc_alloc_init(*(Class *)(v24 + 2632));
    }
    id v42 = v41;
    id v64 = v22;
    uint64_t v43 = self;
    [(SSBullseyeSuggestionsManager *)self _filterSuggestionResultsWithQueryContext:v38 filters:v76 entityFilters:v75 contactFilters:v74 contactSuggestionResults:v21 localSuggestionResults:v40 serverSuggestionResults:v41 options:v73];
    if (v27 && ([v42 containsObject:v27] & 1) == 0) {
      [v42 addObject:v27];
    }
    v72 = [(SSBullseyeSuggestionsManager *)self _rankedSuggestionsResultsWithQueryContext:v38 serverSuggestionResults:v42 localSuggestionResults:v40 options:v73];
    if (![(SSBullseyeSuggestionsManager *)self enabledAboveFoldResults]) {
      goto LABEL_34;
    }
    uint64_t v44 = [v73 objectForKeyedSubscript:@"ForceAboveFoldResults"];
    if (!v44) {
      goto LABEL_34;
    }
    v45 = (void *)v44;
    [v73 objectForKeyedSubscript:@"ForceAboveFoldResults"];
    v47 = id v46 = v21;
    int v48 = [v47 BOOLValue];

    id v21 = v46;
    uint64_t v43 = self;

    if (v48) {
      uint64_t v49 = [(SSBullseyeSuggestionsManager *)self maxTotalSuggestionCountForAboveFoldResults];
    }
    else {
LABEL_34:
    }
      uint64_t v49 = [(SSBullseyeSuggestionsManager *)v43 maxTotalSuggestionCount];
    uint64_t v50 = v49;
    id v51 = v70;
    uint64_t v52 = v71;
    if ([v70 count])
    {
      memset(v81, 0, sizeof(v81));
      if ([v70 countByEnumeratingWithState:v81 objects:v87 count:16])
      {
        if (v50)
        {
          [v25 addObject:**((void **)&v81[0] + 1)];
          if (v50 != 0x7FFFFFFF) {
            --v50;
          }
        }
      }
    }
    if ([v71 count])
    {
      id v61 = v23;
      id v68 = v21;
      long long v79 = 0u;
      long long v80 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      id v53 = v71;
      uint64_t v54 = [v53 countByEnumeratingWithState:&v77 objects:v86 count:16];
      if (v54)
      {
        uint64_t v55 = v54;
        uint64_t v56 = *(void *)v78;
LABEL_43:
        uint64_t v57 = 0;
        while (1)
        {
          if (*(void *)v78 != v56) {
            objc_enumerationMutation(v53);
          }
          if (!v50) {
            break;
          }
          [v25 addObject:*(void *)(*((void *)&v77 + 1) + 8 * v57)];
          if (v50 != 0x7FFFFFFF) {
            --v50;
          }
          if (v55 == ++v57)
          {
            uint64_t v55 = [v53 countByEnumeratingWithState:&v77 objects:v86 count:16];
            if (v55) {
              goto LABEL_43;
            }
            break;
          }
        }
      }

      int v38 = v69;
      id v51 = v70;
      uint64_t v52 = v71;
      id v21 = v68;
      id v23 = v61;
    }
    [v25 addObjectsFromArray:v72];
    if (v50 != 0x7FFFFFFF)
    {
      while ([v25 count] > v50)
        [v25 removeLastObject];
    }
    if (v27 && ([v25 containsObject:v27] & 1) == 0)
    {
      if (v50 != 0x7FFFFFFF && [v25 count] >= v50) {
        [v25 removeLastObject];
      }
      [v25 insertObject:v27 atIndex:0];
    }

    id v58 = v25;
    id v22 = v64;
    id v19 = v65;
  }
  else
  {
    if (v19) {
      [v25 addObject:v19];
    }
    int v38 = v69;
    id v51 = v70;
    uint64_t v52 = v71;
    if (v66) {
      objc_msgSend(v25, "addObject:");
    }
    id v60 = v25;
  }

  return v25;
}

- (id)release2023_blendingByPolicyWithQueryContext:(id)a3 filters:(id)a4 entityFilters:(id)a5 contactFilters:(id)a6 userSuggestion:(id)a7 userWebSuggestion:(id)a8 actionSuggestionResults:(id)a9 contactSuggestionResults:(id)a10 serverSuggestionResults:(id)a11 localSuggestionResults:(id)a12 options:(id)a13
{
  uint64_t v150 = *MEMORY[0x1E4F143B8];
  id v119 = a3;
  id v18 = a4;
  id v19 = a5;
  id v118 = a6;
  id v20 = a7;
  id v21 = a8;
  id v121 = a9;
  id v22 = a10;
  id v23 = a11;
  id v24 = a12;
  id v25 = a13;
  id v26 = [MEMORY[0x1E4F1CA48] array];
  id v27 = (void *)MEMORY[0x1C1885190]();
  id v28 = v20;
  id v120 = v21;
  if ([v22 count]
    || [v24 count]
    || [v23 count]
    || [v121 count])
  {
    context = v27;
    long long v110 = v28;
    id v111 = v24;
    if ([v24 count]) {
      id v29 = (id)[v24 mutableCopy];
    }
    else {
      id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    uint64_t v30 = v29;
    long long v122 = v26;
    id v112 = v23;
    if ([v23 count]) {
      id v31 = (id)[v23 mutableCopy];
    }
    else {
      id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    uint64_t v32 = v31;
    [(SSBullseyeSuggestionsManager *)self _filterSuggestionResultsWithQueryContext:v119 filters:v18 entityFilters:v19 contactFilters:v118 contactSuggestionResults:v22 localSuggestionResults:v30 serverSuggestionResults:v31 options:v25];
    uint64_t v33 = [(SSBullseyeSuggestionsManager *)self _rankedSuggestionsResultsWithQueryContext:v119 serverSuggestionResults:v32 localSuggestionResults:v30 options:v25];
    long long v108 = v33;
    if ([v33 count])
    {
      long long v34 = [v33 firstObject];
      BOOL v106 = [v34 type] == 28
          || [v34 type] == 29
          || [v34 type] == 17;
      long long v35 = v122;
    }
    else
    {
      BOOL v106 = 0;
      long long v35 = v122;
    }
    id v36 = v120;
    id v117 = v25;
    if ([v32 count])
    {
      long long v143 = 0u;
      long long v144 = 0u;
      long long v141 = 0u;
      long long v142 = 0u;
      id v37 = v32;
      uint64_t v38 = [v37 countByEnumeratingWithState:&v141 objects:v149 count:16];
      if (v38)
      {
        uint64_t v39 = v38;
        id v40 = v19;
        id v41 = v18;
        uint64_t v42 = *(void *)v142;
LABEL_21:
        uint64_t v43 = 0;
        while (1)
        {
          if (*(void *)v142 != v42) {
            objc_enumerationMutation(v37);
          }
          uint64_t v44 = *(void **)(*((void *)&v141 + 1) + 8 * v43);
          if ([v44 type] == 29) {
            break;
          }
          if (v39 == ++v43)
          {
            uint64_t v39 = [v37 countByEnumeratingWithState:&v141 objects:v149 count:16];
            if (v39) {
              goto LABEL_21;
            }
            id v45 = v120;
            id v18 = v41;
            id v19 = v40;
            long long v35 = v122;
            id v25 = v117;
            goto LABEL_31;
          }
        }
        id v46 = v44;

        id v36 = v120;
        id v18 = v41;
        id v19 = v40;
        long long v35 = v122;
        id v25 = v117;
        if (!v46) {
          goto LABEL_32;
        }
        id v37 = v46;

        id v45 = v37;
      }
      else
      {
        id v45 = v120;
      }
LABEL_31:

      id v36 = v45;
    }
LABEL_32:
    id v47 = self;
    id v114 = v18;
    if ([(SSBullseyeSuggestionsManager *)self enabledAboveFoldResults])
    {
      id v48 = v36;
      uint64_t v49 = [v25 objectForKeyedSubscript:@"ForceAboveFoldResults"];
      if (v49)
      {
        uint64_t v50 = (void *)v49;
        id v51 = [v25 objectForKeyedSubscript:@"ForceAboveFoldResults"];
        int v52 = [v51 BOOLValue];

        id v47 = self;
        uint64_t v140 = 0;
        id v36 = v48;
        if (v52)
        {
          uint64_t v53 = [(SSBullseyeSuggestionsManager *)self maxTotalSuggestionCountForAboveFoldResults];
LABEL_39:
          uint64_t v140 = v53;
          if (v36)
          {
            [v32 removeObject:v36];
            [v35 addObject:v36];
            if (v140 != 0x7FFFFFFF) {
              --v140;
            }
          }
          long long v116 = v36;
          uint64_t v54 = [v30 count];
          uint64_t v55 = [v121 count] + v54;
          uint64_t v56 = [v32 count];
          uint64_t v139 = [(SSBullseyeSuggestionsManager *)v47 maxLocalSuggestionCount];
          uint64_t v138 = [(SSBullseyeSuggestionsManager *)v47 maxServerSuggestionCount];
          if ([v121 count])
          {
            memset(v137, 0, sizeof(v137));
            id v57 = v121;
            if ([v57 countByEnumeratingWithState:v137 objects:v148 count:16])
            {
              if (v140)
              {
                [v122 addObject:**((void **)&v137[0] + 1)];
                if (v140 != 0x7FFFFFFF) {
                  --v140;
                }
              }
            }
          }
          id v113 = v22;
          SSSplitCounts(v55, v139, 0, v56, v138, 0, v140, &v139, &v138, &v140);
          id v58 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          id v59 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          id v60 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          long long v133 = 0u;
          long long v134 = 0u;
          long long v135 = 0u;
          long long v136 = 0u;
          id v61 = v32;
          uint64_t v62 = [v61 countByEnumeratingWithState:&v133 objects:v147 count:16];
          if (v62)
          {
            uint64_t v63 = v62;
            uint64_t v64 = *(void *)v134;
LABEL_50:
            uint64_t v65 = 0;
            while (1)
            {
              if (*(void *)v134 != v64) {
                objc_enumerationMutation(v61);
              }
              uint64_t v66 = *(void *)(*((void *)&v133 + 1) + 8 * v65);
              uint64_t v67 = [v58 count];
              if (v67 >= v138) {
                break;
              }
              [v58 addObject:v66];
              if (v63 == ++v65)
              {
                uint64_t v63 = [v61 countByEnumeratingWithState:&v133 objects:v147 count:16];
                if (v63) {
                  goto LABEL_50;
                }
                break;
              }
            }
          }
          long long v124 = v59;
          id v115 = v58;
          long long v105 = v61;

          [v30 sortUsingComparator:&__block_literal_global_159];
          long long v131 = 0u;
          long long v132 = 0u;
          long long v129 = 0u;
          long long v130 = 0u;
          id v68 = v30;
          uint64_t v69 = [v68 countByEnumeratingWithState:&v129 objects:v146 count:16];
          if (v69)
          {
            uint64_t v70 = v69;
            id v71 = 0;
            id v72 = 0;
            uint64_t v73 = *(void *)v130;
            while (1)
            {
              uint64_t v74 = 0;
              do
              {
                if (*(void *)v130 != v73) {
                  objc_enumerationMutation(v68);
                }
                id v75 = *(void **)(*((void *)&v129 + 1) + 8 * v74);
                int v76 = [v75 type];
                if (v76 == 38 || v76 == 32)
                {
                  long long v77 = v60;
LABEL_64:
                  [v77 addObject:v75];
                  goto LABEL_65;
                }
                if (v71 || v76 != 35)
                {
                  if (v72 || v76 != 34)
                  {
                    long long v77 = v124;
                    goto LABEL_64;
                  }
                  id v72 = v75;
                }
                else
                {
                  id v71 = v75;
                }
LABEL_65:
                ++v74;
              }
              while (v70 != v74);
              uint64_t v78 = [v68 countByEnumeratingWithState:&v129 objects:v146 count:16];
              uint64_t v70 = v78;
              if (!v78) {
                goto LABEL_77;
              }
            }
          }
          id v71 = 0;
          id v72 = 0;
LABEL_77:

          uint64_t v79 = [v122 count];
          [v60 sortUsingComparator:&__block_literal_global_161];
          do
          {
            if (![v60 count]) {
              break;
            }
            uint64_t v80 = [v122 count];
            if (v80 >= v140) {
              break;
            }
            uint64_t v81 = [v122 count] - v79;
            if (v81 > v139) {
              break;
            }
            long long v82 = [v60 firstObject];
            [v122 addObject:v82];
            [v60 removeObject:v82];
            if (v139 != 0x7FFFFFFF) {
              --v139;
            }
            uint64_t v83 = [v124 count];

            if (v83) {
              break;
            }
          }
          while (!v71 && !v72);
          if (v71 && (uint64_t v84 = [v122 count], v84 < v140))
          {
            uint64_t v85 = [v122 count];
            uint64_t v86 = v139;
            BOOL v87 = v85 - v79 < v139;
            v88 = v116;
            id v25 = v117;
            uint64_t v89 = v115;
            v90 = v124;
            if (v87)
            {
              [v122 addObject:v71];
              if (v139 == 0x7FFFFFFF) {
                goto LABEL_96;
              }
              uint64_t v86 = --v139;
            }
          }
          else
          {
            uint64_t v86 = v139;
            v88 = v116;
            id v25 = v117;
            uint64_t v89 = v115;
            v90 = v124;
          }
          if (v86 != 0x7FFFFFFF)
          {
            do
            {
              uint64_t v91 = [v90 count];
              if (v91 <= v139) {
                break;
              }
              [v90 removeLastObject];
            }
            while (v139 != 0x7FFFFFFF);
          }
LABEL_96:
          if (v72 && [v90 count] && (objc_msgSend(v90, "containsObject:", v72) & 1) == 0)
          {
            [v90 removeLastObject];
            [v90 addObject:v72];
          }
          id v26 = v122;
          if (!v106 || (uint64_t v92 = [v60 count], v71) || v92)
          {
            [v122 addObjectsFromArray:v90];
          }
          else if ([v90 count])
          {
            id v107 = v19;
            id v93 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            long long v125 = 0u;
            long long v126 = 0u;
            long long v127 = 0u;
            long long v128 = 0u;
            id v94 = v89;
            uint64_t v95 = [v94 countByEnumeratingWithState:&v125 objects:v145 count:16];
            if (v95)
            {
              uint64_t v96 = v95;
              uint64_t v97 = *(void *)v126;
              do
              {
                for (uint64_t i = 0; i != v96; ++i)
                {
                  if (*(void *)v126 != v97) {
                    objc_enumerationMutation(v94);
                  }
                  id v99 = *(void **)(*((void *)&v125 + 1) + 8 * i);
                  int v100 = [v99 type];
                  id v101 = v93;
                  if (v100 != 28)
                  {
                    if ([v99 type] == 29) {
                      id v101 = v93;
                    }
                    else {
                      id v101 = v122;
                    }
                  }
                  [v101 addObject:v99];
                }
                uint64_t v96 = [v94 countByEnumeratingWithState:&v125 objects:v145 count:16];
              }
              while (v96);
            }

            id v26 = v122;
            v90 = v124;
            [v122 addObjectsFromArray:v124];
            [v122 addObjectsFromArray:v93];

            id v19 = v107;
            v88 = v116;
            id v25 = v117;
            uint64_t v89 = v115;
            goto LABEL_118;
          }
          [v122 addObjectsFromArray:v89];
LABEL_118:

          id v28 = v110;
          id v102 = v26;
          id v22 = v113;
          id v18 = v114;
          id v24 = v111;
          id v23 = v112;
          goto LABEL_119;
        }
      }
      else
      {
        uint64_t v140 = 0;
      }
    }
    else
    {
      uint64_t v140 = 0;
    }
    uint64_t v53 = [(SSBullseyeSuggestionsManager *)v47 maxTotalSuggestionCount];
    goto LABEL_39;
  }
  if (v120) {
    objc_msgSend(v26, "addObject:");
  }
  if (v28) {
    [v26 addObject:v28];
  }
  id v104 = v26;

LABEL_119:

  return v26;
}

uint64_t __251__SSBullseyeSuggestionsManager_release2023_blendingByPolicyWithQueryContext_filters_entityFilters_contactFilters_userSuggestion_userWebSuggestion_actionSuggestionResults_contactSuggestionResults_serverSuggestionResults_localSuggestionResults_options___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compareByRank:");
}

uint64_t __251__SSBullseyeSuggestionsManager_release2023_blendingByPolicyWithQueryContext_filters_entityFilters_contactFilters_userSuggestion_userWebSuggestion_actionSuggestionResults_contactSuggestionResults_serverSuggestionResults_localSuggestionResults_options___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compareByRank:");
}

- (id)release2022_blendingByPolicyWithQueryContext:(id)a3 filters:(id)a4 entityFilters:(id)a5 contactFilters:(id)a6 userSuggestion:(id)a7 userWebSuggestion:(id)a8 shortcutSuggestionResults:(id)a9 actionSuggestionResults:(id)a10 contactSuggestionResults:(id)a11 serverSuggestionResults:(id)a12 localSuggestionResults:(id)a13 options:(id)a14
{
  uint64_t v266 = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  id v191 = a4;
  id v216 = a5;
  id v230 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  id v202 = a10;
  id v24 = a11;
  id v199 = a12;
  id v200 = a13;
  id v203 = a14;
  id v25 = [MEMORY[0x1E4F1CA48] array];
  id v26 = [v20 searchString];
  v224 = [(SSBullseyeSuggestionsManager *)self suggestionKeyWithCompletion:v26];

  id v27 = v21;
  id v197 = v22;
  id v205 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v208 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v198 = v24;
  if ([v24 count]
    || [v200 count]
    || [v199 count]
    || [v23 count]
    || [v202 count])
  {
    id v195 = v27;
    v214 = objc_opt_new();
    v222 = objc_opt_new();
    uint64_t v28 = objc_opt_new();
    v206 = objc_opt_new();
    v212 = objc_opt_new();
    int64_t v29 = [(SSBullseyeSuggestionsManager *)self maxTotalSuggestionCount];
    unint64_t v209 = [(SSBullseyeSuggestionsManager *)self maxLocalSuggestionCount];
    int64_t v190 = [(SSBullseyeSuggestionsManager *)self maxServerSuggestionCount];
    uint64_t v30 = v203;
    if (v203)
    {
      id v31 = [v203 objectForKeyedSubscript:@"localDisplayPosition"];
      if (v31)
      {
        uint64_t v32 = [v203 objectForKeyedSubscript:@"localDisplayPosition"];
        unint64_t v189 = (int)[v32 intValue];

        uint64_t v30 = v203;
      }
      else
      {
        unint64_t v189 = [(SSBullseyeSuggestionsManager *)self localDisplayPosition];
      }

      uint64_t v33 = [v30 objectForKeyedSubscript:@"localThreshold"];
      if (v33)
      {
        long long v34 = (void *)v33;
        id v213 = [v30 objectForKeyedSubscript:@"localThreshold"];

LABEL_14:
        uint64_t v35 = [v30 objectForKeyedSubscript:@"serverThreshold"];
        if (v35)
        {
          id v36 = (void *)v35;
          id v215 = [v30 objectForKeyedSubscript:@"serverThreshold"];

          goto LABEL_17;
        }
LABEL_16:
        id v37 = [(SSBullseyeSuggestionsManager *)self serverSuggestionThreshold];

        id v215 = v37;
        if (!v30)
        {
          int v186 = [(SSBullseyeSuggestionsManager *)self ignoreMaxCount];
          unsigned int v187 = 0;
          id v201 = 0;
          id v192 = 0;
          LOBYTE(v183) = 1;
          int v185 = 1;
          id v46 = v195;
          goto LABEL_39;
        }
LABEL_17:
        uint64_t v38 = [v30 objectForKeyedSubscript:@"localFilteringScore"];
        if (v38)
        {
          id v201 = [v30 objectForKeyedSubscript:@"localFilteringScore"];
        }
        else
        {
          id v201 = 0;
        }

        uint64_t v39 = [v30 objectForKeyedSubscript:@"qualityThreshold"];
        if (v39)
        {
          id v192 = [v30 objectForKeyedSubscript:@"qualityThreshold"];
        }
        else
        {
          id v192 = 0;
        }

        id v40 = [v30 objectForKeyedSubscript:@"ignoreMaxCountForSingleSuggestionsType"];
        if (v40)
        {
          id v41 = [v30 objectForKeyedSubscript:@"ignoreMaxCountForSingleSuggestionsType"];
          int v186 = [v41 BOOLValue];

          uint64_t v30 = v203;
        }
        else
        {
          int v186 = [(SSBullseyeSuggestionsManager *)self ignoreMaxCount];
        }

        uint64_t v42 = [v30 objectForKeyedSubscript:@"prefersLocalUserTypedSuggestion"];
        if (v42)
        {
          uint64_t v43 = [v30 objectForKeyedSubscript:@"prefersLocalUserTypedSuggestion"];
          unsigned int v187 = [v43 BOOLValue];

          uint64_t v30 = v203;
        }
        else
        {
          unsigned int v187 = 0;
        }

        uint64_t v44 = [v30 objectForKeyedSubscript:@"suggestionsAreBlended"];
        if (v44)
        {
          id v45 = [v30 objectForKeyedSubscript:@"suggestionsAreBlended"];
          int v183 = [v45 BOOLValue] ^ 1;
        }
        else
        {
          LOBYTE(v183) = 1;
        }
        id v46 = v195;

        if (!v201)
        {
          id v201 = 0;
          BOOL v50 = 1;
          goto LABEL_36;
        }
        if (v192)
        {
          [v201 doubleValue];
          double v48 = v47;
          [v192 doubleValue];
          BOOL v50 = v48 >= v49;
LABEL_36:
          int v185 = v50;
          goto LABEL_39;
        }
        int v185 = 0;
LABEL_39:
        v207 = (void *)v28;
        v193 = v25;
        v194 = v20;
        v196 = v23;
        uint64_t v51 = [v23 count];
        int64_t v52 = v29 - v51;
        if (v29 < v51) {
          int64_t v52 = 0;
        }
        uint64_t v184 = v51;
        if (v51) {
          BOOL v53 = v29 == 0x7FFFFFFF;
        }
        else {
          BOOL v53 = 1;
        }
        if (v53) {
          int64_t v52 = v29;
        }
        uint64_t v188 = v52;
        v211 = [MEMORY[0x1E4F1CA48] array];
        v219 = [MEMORY[0x1E4F1CA48] array];
        v226 = objc_opt_new();
        v217 = objc_opt_new();
        v218 = objc_opt_new();
        v204 = objc_opt_new();
        long long v256 = 0u;
        long long v257 = 0u;
        long long v258 = 0u;
        long long v259 = 0u;
        id v54 = v199;
        uint64_t v55 = [v54 countByEnumeratingWithState:&v256 objects:v265 count:16];
        if (v55)
        {
          uint64_t v56 = v55;
          int v227 = 0;
          uint64_t v57 = *(void *)v257;
          v221 = v46;
          v225 = v197;
          id v58 = v214;
LABEL_49:
          uint64_t v59 = 0;
          while (2)
          {
            if (*(void *)v257 != v57) {
              objc_enumerationMutation(v54);
            }
            id v60 = *(void **)(*((void *)&v256 + 1) + 8 * v59);
            int v61 = [v60 type];
            uint64_t v62 = [v60 completion];
            uint64_t v63 = [(SSBullseyeSuggestionsManager *)self suggestionKeyWithCompletion:v62];

            switch(v61)
            {
              case 27:
                goto LABEL_70;
              case 28:
                if ([v63 isEqualToString:v224])
                {
                  [v60 setType:29];
                  goto LABEL_55;
                }
                [v219 addObject:v60];
                v227 |= [v58 count] == 0;
                goto LABEL_69;
              case 29:
LABEL_55:
                id v64 = v60;

                [v219 addObject:v64];
                v227 |= [v58 count] == 0;
                v225 = v64;
                goto LABEL_69;
              case 30:
                id v72 = v60;

                v221 = v72;
                goto LABEL_69;
              default:
                if (v61 != 17) {
                  goto LABEL_69;
                }
                if (v215)
                {
                  uint64_t v65 = (void *)MEMORY[0x1E4F28ED0];
                  [v60 rankingScore];
                  uint64_t v66 = objc_msgSend(v65, "numberWithDouble:");
                  uint64_t v67 = [v66 compare:v215];

                  if (v67 == -1) {
                    goto LABEL_70;
                  }
                }
                id v68 = [v60 entityIdentifier];
                uint64_t v69 = v68;
                if (v216 && v68)
                {
                  uint64_t v70 = [v60 entityIdentifier];
                  char v71 = [v216 containsObject:v70];

                  if (v71)
                  {
                    id v58 = v214;
                    goto LABEL_70;
                  }
                }
                else
                {
                }
                uint64_t v73 = [v60 entityIdentifier];

                if (v73) {
                  [v212 addObject:v63];
                }
                [v226 addObject:v63];
                [v211 addObject:v60];
                id v58 = v214;
LABEL_69:
                [v58 addObject:v60];
LABEL_70:

                if (v56 != ++v59) {
                  continue;
                }
                uint64_t v56 = [v54 countByEnumeratingWithState:&v256 objects:v265 count:16];
                if (!v56) {
                  goto LABEL_74;
                }
                goto LABEL_49;
            }
          }
        }
        int v227 = 0;
        v221 = v46;
        v225 = v197;
        id v58 = v214;
LABEL_74:

        if (v225 && ([v58 containsObject:v225] & 1) == 0)
        {
          [v58 addObject:v225];
          [v219 addObject:v225];
        }
        long long v252 = 0u;
        long long v253 = 0u;
        BOOL v182 = [v58 count] != 1;
        long long v254 = 0u;
        long long v255 = 0u;
        id v74 = v198;
        uint64_t v75 = [v74 countByEnumeratingWithState:&v252 objects:v264 count:16];
        if (v75)
        {
          uint64_t v76 = v75;
          uint64_t v77 = *(void *)v253;
          while (2)
          {
            for (uint64_t i = 0; i != v76; ++i)
            {
              if (*(void *)v253 != v77) {
                objc_enumerationMutation(v74);
              }
              uint64_t v79 = *(void **)(*((void *)&v252 + 1) + 8 * i);
              uint64_t v80 = [v79 completion];
              uint64_t v81 = [(SSBullseyeSuggestionsManager *)self suggestionKeyWithCompletion:v80];

              if ((!v230 || ([v230 containsObject:v81] & 1) == 0)
                && ([v218 containsObject:v81] & 1) == 0)
              {
                if ([v81 containsString:v224])
                {
                  [v206 addObject:v79];
                  [v218 addObject:v81];
                  if (v209 != 0x7FFFFFFF && [v206 count] >= v209)
                  {

                    goto LABEL_92;
                  }
                }
              }
            }
            uint64_t v76 = [v74 countByEnumeratingWithState:&v252 objects:v264 count:16];
            if (v76) {
              continue;
            }
            break;
          }
        }
LABEL_92:

        long long v250 = 0u;
        long long v251 = 0u;
        long long v248 = 0u;
        long long v249 = 0u;
        id v82 = v200;
        uint64_t v83 = [v82 countByEnumeratingWithState:&v248 objects:v263 count:16];
        if (v83)
        {
          uint64_t v84 = v83;
          v220 = 0;
          uint64_t v85 = *(void *)v249;
          do
          {
            for (uint64_t j = 0; j != v84; ++j)
            {
              if (*(void *)v249 != v85) {
                objc_enumerationMutation(v82);
              }
              BOOL v87 = *(void **)(*((void *)&v248 + 1) + 8 * j);
              int v88 = [v87 type];
              uint64_t v89 = [v87 completion];
              v90 = [(SSBullseyeSuggestionsManager *)self suggestionKeyWithCompletion:v89];

              switch(v88)
              {
                case ' ':
                case '&':
                  [v87 rankingScore];
                  if (v91 != 0.0
                    && (!v230 || ([v230 containsObject:v90] & 1) == 0)
                    && ([v217 containsObject:v90] & 1) == 0)
                  {
                    [v207 addObject:v87];
                    [v226 addObject:v90];
                    uint64_t v92 = v217;
                    goto LABEL_113;
                  }
                  break;
                case '""':
                  uint64_t v97 = [v194 searchString];
                  if (!v97
                    || (id v98 = (void *)v97,
                        char v99 = [v90 isEqualToString:v224],
                        v98,
                        (v99 & 1) == 0))
                  {
                    if (([v226 containsObject:v90] & 1) == 0)
                    {
                      int v100 = v205;
                      goto LABEL_121;
                    }
                  }
                  break;
                case '#':
                  id v101 = v87;

                  [v222 addObject:v101];
                  v220 = v101;
                  break;
                case '\'':
                  if (([v226 containsObject:v90] & 1) == 0)
                  {
                    int v100 = v208;
LABEL_121:
                    [v100 addObject:v87];
                    uint64_t v92 = v222;
                    uint64_t v96 = v87;
                    goto LABEL_122;
                  }
                  break;
                default:
                  if (!v230 || ([v230 containsObject:v90] & 1) == 0)
                  {
                    if (!v213
                      || (id v93 = (void *)MEMORY[0x1E4F28ED0],
                          [v87 rankingScore],
                          objc_msgSend(v93, "numberWithDouble:"),
                          id v94 = objc_claimAutoreleasedReturnValue(),
                          uint64_t v95 = [v94 compare:v213],
                          v94,
                          v95 != -1))
                    {
                      if ((![v226 containsObject:v90]
                         || [v212 containsObject:v90])
                        && ([v217 containsObject:v90] & 1) == 0)
                      {
                        if ([v218 containsObject:v90]) {
                          [v204 addObject:v87];
                        }
                        [v222 addObject:v87];
                        uint64_t v92 = v226;
LABEL_113:
                        uint64_t v96 = v90;
LABEL_122:
                        [v92 addObject:v96];
                      }
                    }
                  }
                  break;
              }
            }
            uint64_t v84 = [v82 countByEnumeratingWithState:&v248 objects:v263 count:16];
          }
          while (v84);
        }
        else
        {
          v220 = 0;
        }

        id v102 = v214;
        if (![v207 count])
        {
          long long v246 = 0u;
          long long v247 = 0u;
          long long v244 = 0u;
          long long v245 = 0u;
          id v103 = v206;
          uint64_t v104 = [v103 countByEnumeratingWithState:&v244 objects:v262 count:16];
          if (v104)
          {
            uint64_t v105 = v104;
            uint64_t v106 = *(void *)v245;
            do
            {
              for (uint64_t k = 0; k != v105; ++k)
              {
                if (*(void *)v245 != v106) {
                  objc_enumerationMutation(v103);
                }
                long long v108 = *(void **)(*((void *)&v244 + 1) + 8 * k);
                long long v109 = [v108 completion];
                long long v110 = [(SSBullseyeSuggestionsManager *)self suggestionKeyWithCompletion:v109];

                if (([v217 containsObject:v110] & 1) == 0) {
                  [v207 addObject:v108];
                }
              }
              uint64_t v105 = [v103 countByEnumeratingWithState:&v244 objects:v262 count:16];
            }
            while (v105);
          }

          long long v242 = 0u;
          long long v243 = 0u;
          long long v240 = 0u;
          long long v241 = 0u;
          id v111 = v204;
          uint64_t v112 = [v111 countByEnumeratingWithState:&v240 objects:v261 count:16];
          if (v112)
          {
            uint64_t v113 = v112;
            uint64_t v114 = *(void *)v241;
            do
            {
              for (uint64_t m = 0; m != v113; ++m)
              {
                if (*(void *)v241 != v114) {
                  objc_enumerationMutation(v111);
                }
                [v222 removeObject:*(void *)(*((void *)&v240 + 1) + 8 * m)];
              }
              uint64_t v113 = [v111 countByEnumeratingWithState:&v240 objects:v261 count:16];
            }
            while (v113);
          }

          id v102 = v214;
        }
        long long v116 = [v222 sortedArrayUsingComparator:&__block_literal_global_175];
        id v117 = (void *)[v116 mutableCopy];

        id v25 = v193;
        if (v207) {
          uint64_t v118 = [v207 count];
        }
        else {
          uint64_t v118 = 0;
        }
        id v119 = v202;
        if (v117)
        {
          uint64_t v120 = [v117 count];
          if (v102)
          {
LABEL_150:
            unint64_t v121 = [v102 count];
            goto LABEL_153;
          }
        }
        else
        {
          uint64_t v120 = 0;
          if (v102) {
            goto LABEL_150;
          }
        }
        unint64_t v121 = 0;
LABEL_153:
        uint64_t v238 = v209;
        uint64_t v239 = v188;
        uint64_t v122 = v190;
        uint64_t v237 = v190;
        if (v186)
        {
          unint64_t v123 = v209;
          if (v121 < 2) {
            unint64_t v123 = v188;
          }
          unint64_t v209 = v123;
          if (!(v118 | v120)) {
            uint64_t v122 = v188;
          }
        }
        if (v188 != 0x7FFFFFFF)
        {
          if (v221) {
            uint64_t v124 = v187;
          }
          else {
            uint64_t v124 = 0;
          }
          SSSplitCounts(v120 + v118, v209, v124, v121, v122, 0, v188, &v238, &v237, &v239);
        }
        BOOL v125 = v185 == 0;
        if (v189) {
          BOOL v125 = v189;
        }
        uint64_t v223 = v125;
        if (v221) {
          unsigned int v126 = v187;
        }
        else {
          unsigned int v126 = 0;
        }
        if (v126 == 1) {
          [v193 addObject:v221];
        }
        long long v127 = [MEMORY[0x1E4F1CA48] array];
        long long v128 = v127;
        if (v239 == 0x7FFFFFFF)
        {
          [v127 addObjectsFromArray:v102];
        }
        else if ([v102 count])
        {
          if (v183)
          {
            int v129 = v182 & v227;
            uint64_t v235 = 0;
            uint64_t v236 = 0;
            if ([v219 count] == 1)
            {
              uint64_t v130 = [v219 count];
              uint64_t v131 = [v211 count];
              SSSplitCounts(v130, 0x7FFFFFFFLL, 0, v131, 0x7FFFFFFFLL, 0, v237, &v235, &v236, 0);
            }
            else
            {
              uint64_t v133 = [v211 count];
              uint64_t v134 = [v219 count];
              SSSplitCounts(v133, 0x7FFFFFFFLL, 0, v134, 0x7FFFFFFFLL, 0, v237, &v236, &v235, 0);
            }
            long long v132 = getFilteredSuggestionResults(v219, v235);
            uint64_t v135 = getFilteredSuggestionResults(v211, v236);
            long long v136 = (void *)v135;
            BOOL v137 = v129 == 0;
            if (v129) {
              uint64_t v138 = v132;
            }
            else {
              uint64_t v138 = (void *)v135;
            }
            if (v129) {
              uint64_t v139 = (void *)v135;
            }
            else {
              uint64_t v139 = v132;
            }
            uint64_t v140 = v223;
            if (!v137) {
              uint64_t v140 = 1;
            }
            uint64_t v223 = v140;
            [v128 addObjectsFromArray:v138];
            [v128 addObjectsFromArray:v139];
          }
          else
          {
            long long v132 = getFilteredSuggestionResults(v102, v237);
            [v128 addObjectsFromArray:v132];
          }
        }
        long long v141 = [MEMORY[0x1E4F1CA48] array];
        if ([v207 count])
        {
          v228 = v128;
          long long v233 = 0u;
          long long v234 = 0u;
          long long v231 = 0u;
          long long v232 = 0u;
          id v142 = v207;
          uint64_t v143 = [v142 countByEnumeratingWithState:&v231 objects:v260 count:16];
          if (v143)
          {
            uint64_t v144 = v143;
            uint64_t v145 = 0;
            uint64_t v146 = *(void *)v232;
LABEL_191:
            uint64_t v147 = 0;
            uint64_t v148 = v145 + v144;
            while (1)
            {
              if (*(void *)v232 != v146) {
                objc_enumerationMutation(v142);
              }
              uint64_t v149 = *(void *)(*((void *)&v231 + 1) + 8 * v147);
              if ((v209 & 0x8000000000000000) == 0)
              {
                uint64_t v150 = v145 + v147;
                if ([v117 count])
                {
                  if (v150 && v145 + v147 + 1 >= v238) {
                    break;
                  }
                }
                if (![v117 count] && v150 >= v238) {
                  break;
                }
              }
              [v141 addObject:v149];
              if (v144 == ++v147)
              {
                uint64_t v144 = [v142 countByEnumeratingWithState:&v231 objects:v260 count:16];
                uint64_t v145 = v148;
                if (v144) {
                  goto LABEL_191;
                }
                break;
              }
            }
          }

          id v25 = v193;
          id v119 = v202;
          long long v128 = v228;
        }
        if (v117) {
          [v141 addObjectsFromArray:v117];
        }
        if ([v196 count]) {
          [v25 addObjectsFromArray:v196];
        }
        if ([v119 count]) {
          [v25 addObjectsFromArray:v119];
        }
        if (v220 && ([v25 containsObject:v220] & 1) == 0)
        {
          [v25 removeLastObject];
          [v25 addObject:v220];
        }
        id v151 = v141;
        uint64_t v152 = v238;
        id v153 = v128;
        v210 = v153;
        if (v223)
        {
          id v154 = v153;

          uint64_t v152 = v237;
          id v229 = v151;

          v155 = &v238;
        }
        else
        {
          v155 = &v237;
          id v154 = v151;
          id v229 = v153;
        }
        uint64_t v156 = *v155;
        v157 = getFilteredSuggestionResults(v154, v152);
        [v25 addObjectsFromArray:v157];
        if (v223)
        {
          if (v225 && ([v25 containsObject:v225] & 1) == 0)
          {
            [v25 removeLastObject];
            [v25 addObject:v225];
          }
LABEL_228:
          v165 = getFilteredSuggestionResults(v229, v156);
          [v25 addObjectsFromArray:v165];
          v166 = v207;
          if (v223)
          {
            if ([v205 count])
            {
              v167 = [v205 firstObject];
              int v168 = [v25 containsObject:v167];

              v169 = v205;
              v166 = v207;
              if (!v168) {
                goto LABEL_235;
              }
            }
            uint64_t v170 = [v208 count];
            if (!v119)
            {
              if (v170)
              {
                if (!v184)
                {
                  v171 = [v208 firstObject];
                  char v172 = [v25 containsObject:v171];

                  v169 = v208;
                  v166 = v207;
                  if ((v172 & 1) == 0)
                  {
LABEL_235:
                    [v25 removeLastObject];
                    v173 = [v169 firstObject];
                    [v25 addObject:v173];
                  }
                }
              }
            }
            v174 = v225;
            if (!v225) {
              goto LABEL_242;
            }
          }
          else
          {
            v174 = v225;
            if (!v225)
            {
LABEL_242:
              id v175 = v25;

              id v20 = v194;
              id v27 = v195;
              v176 = v230;
              id v23 = v196;
              v177 = v197;
              v178 = v203;
              v179 = v220;
              goto LABEL_243;
            }
            if (([v25 containsObject:v225] & 1) == 0)
            {
              [v25 removeLastObject];
              [v25 addObject:v225];
            }
          }
          [v25 removeObject:v174];
          [v25 insertObject:v174 atIndex:0];
          goto LABEL_242;
        }
        if ([v205 count]
          && ([v205 firstObject],
              v158 = objc_claimAutoreleasedReturnValue(),
              char v159 = [v25 containsObject:v158],
              v158,
              (v159 & 1) == 0))
        {
          [v25 removeLastObject];
          v163 = v205;
        }
        else
        {
          uint64_t v160 = [v208 count];
          if (v119) {
            goto LABEL_228;
          }
          if (!v160) {
            goto LABEL_228;
          }
          if (v184) {
            goto LABEL_228;
          }
          v161 = [v208 firstObject];
          char v162 = [v25 containsObject:v161];

          if (v162) {
            goto LABEL_228;
          }
          [v25 removeLastObject];
          v163 = v208;
        }
        v164 = [v163 firstObject];
        [v25 addObject:v164];

        goto LABEL_228;
      }
    }
    else
    {
      unint64_t v189 = [(SSBullseyeSuggestionsManager *)self localDisplayPosition];
    }
    id v213 = [(SSBullseyeSuggestionsManager *)self localSuggestionThreshold];

    if (!v30) {
      goto LABEL_16;
    }
    goto LABEL_14;
  }
  v177 = v197;
  if (v197) {
    [v25 addObject:v197];
  }
  v176 = v230;
  v178 = v203;
  if (v27) {
    [v25 addObject:v27];
  }
  id v181 = v25;
  v179 = 0;
  v221 = v27;
  v174 = v197;
LABEL_243:

  return v25;
}

uint64_t __277__SSBullseyeSuggestionsManager_release2022_blendingByPolicyWithQueryContext_filters_entityFilters_contactFilters_userSuggestion_userWebSuggestion_shortcutSuggestionResults_actionSuggestionResults_contactSuggestionResults_serverSuggestionResults_localSuggestionResults_options___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compareByRank:");
}

- (id)intentBasedSuggestionBlending:(id)a3 suggestions:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 queryIntent];
  if (!v7) {
    goto LABEL_23;
  }
  id v8 = (void *)v7;
  id v9 = [v5 queryIntent];
  if (![v9 intentType])
  {

    goto LABEL_23;
  }
  id v10 = [v5 queryIntent];
  id v11 = [v10 suggestionConfig];

  if (!v11)
  {
LABEL_23:
    id v12 = v6;
    goto LABEL_24;
  }
  id v12 = [MEMORY[0x1E4F1CA48] array];
  context = (void *)MEMORY[0x1C1885190]();
  id v26 = v5;
  id v13 = [v5 queryIntent];
  uint64_t v14 = [v13 suggestionConfig];

  int v15 = [v14 localSuggestionQuota];
  int v16 = [v14 serverSuggestionQuota];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v17 = v6;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(v17);
        }
        id v22 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        unsigned int v23 = [v22 type];
        if (v23 <= 0x27)
        {
          if (((1 << v23) & 0xCF80010000) != 0)
          {
            if (v15)
            {
              [v12 addObject:v22];
              --v15;
            }
          }
          else if (((1 << v23) & 0x10020000) != 0)
          {
            if (v16)
            {
              [v12 addObject:v22];
              --v16;
            }
          }
          else if (v23 == 29 && [v14 showWebAsTypedSuggestion])
          {
            [v12 addObject:v22];
          }
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v19);
  }

  id v5 = v26;
LABEL_24:

  return v12;
}

- (SRResources)resources
{
  return self->_resources;
}

- (NSString)blendingModelPath
{
  return self->_blendingModelPath;
}

- (NSDictionary)modelFeatureNames
{
  return self->_modelFeatureNames;
}

- (BOOL)enabledSuggestionsOverrides
{
  return self->_enabledSuggestionsOverrides;
}

- (BOOL)enabledSuggestionsBlending
{
  return self->_enabledSuggestionsBlending;
}

- (BOOL)enabledFullSuggestionsBlending
{
  return self->_enabledFullSuggestionsBlending;
}

- (BOOL)enabledAboveFoldResults
{
  return self->_enabledAboveFoldResults;
}

- (BOOL)ignoreMaxCount
{
  return self->_ignoreMaxCount;
}

- (NSNumber)serverSuggestionThreshold
{
  return self->_serverSuggestionThreshold;
}

- (NSNumber)localSuggestionThreshold
{
  return self->_localSuggestionThreshold;
}

- (int64_t)maxTotalSuggestionCount
{
  return self->_maxTotalSuggestionCount;
}

- (int64_t)maxTotalSuggestionCountForAboveFoldResults
{
  return self->_maxTotalSuggestionCountForAboveFoldResults;
}

- (int64_t)maxServerSuggestionCount
{
  return self->_maxServerSuggestionCount;
}

- (int64_t)maxLocalSuggestionCount
{
  return self->_maxLocalSuggestionCount;
}

- (unint64_t)localDisplayPosition
{
  return self->_localDisplayPosition;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_localSuggestionThreshold, 0);
  objc_storeStrong((id *)&self->_serverSuggestionThreshold, 0);
  objc_storeStrong((id *)&self->_modelFeatureNames, 0);
  objc_storeStrong((id *)&self->_blendingModelPath, 0);
  objc_storeStrong((id *)&self->_resources, 0);
  objc_storeStrong((id *)&self->_blendingModel, 0);
  objc_storeStrong((id *)&self->_defaultOptions, 0);
}

- (void)loadBlendingModelWithPath:(uint64_t)a1 forceLoad:.cold.1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_1BDB2A000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "SuggestionsManager: error loading blending model <%@>", (uint8_t *)&v1, 0xCu);
}

void __68__SSBullseyeSuggestionsManager_loadBlendingModelWithPath_forceLoad___block_invoke_cold_1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1BDB2A000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "SuggestionsManager: error loading model feature names", v0, 2u);
}

- (void)_getScoreForSuggestionResult:(uint64_t)a1 options:(float)a2 .cold.1(uint64_t a1, float a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 138412546;
  uint64_t v3 = a1;
  __int16 v4 = 2048;
  double v5 = a2;
  _os_log_debug_impl(&dword_1BDB2A000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Suggestions blending: extracted features <%@>;\n score: %f",
    (uint8_t *)&v2,
    0x16u);
}

- (void)_getScoreForSuggestionResult:options:.cold.2()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1BDB2A000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Suggestions blending: unable to read local features", v0, 2u);
}

@end