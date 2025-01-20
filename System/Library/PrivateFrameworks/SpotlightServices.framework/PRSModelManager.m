@interface PRSModelManager
+ (BOOL)loadModelsWithDirectory:(id)a3 intoModelDict:(id)a4;
+ (id)directivesFromFilePath:(id)a3;
+ (id)sharedModelManager;
+ (void)cannedInfoForType:(unint64_t)a3 directivesPath:(id *)a4 modelName:(id *)a5;
+ (void)loadModelWithURL:(id)a3 type:(unint64_t)a4 directivesPath:(id)a5 intoModelDict:(id)a6 error:(id *)a7;
+ (void)pathsFor:(unint64_t)a3 withParentPath:(id)a4 modelPath:(id *)a5 directivesPath:(id *)a6;
- (BOOL)disablePolicy;
- (BOOL)loadCannedModels;
- (BOOL)loadModels;
- (BOOL)otherModelsAvailable;
- (BOOL)trialEnabled;
- (NSMutableDictionary)models;
- (NSMutableDictionary)otherModels;
- (NSString)experimentId;
- (NSString)modelType;
- (NSString)modelVersion;
- (NSString)otherModelsType;
- (NSUserDefaults)userDefaults;
- (PRSModelManager)init;
- (double)testL2WithData:(id)a3 experimental:(BOOL)a4;
- (float)computeL2ScoresForVectors:(id)a3 secondVector:(id)a4 withServerFeatures:(id)a5 withBundleFeatures:(id)a6 experimentalWeight1:(double)a7 experimentalWeight2:(double)a8 shouldCancel:(BOOL *)a9 clientBundle:(id)a10;
- (float)computeScoresForFeatures:(id)a3 withBundleFeatures:(id)a4 serverBundleFeatures:(id)a5 usingModelContext:(id)a6 qos:(unsigned int)a7 shouldCancel:(BOOL *)a8 filterBundle:(id)a9;
- (id)getL2ModelVersionForClientBundle:(id)a3;
- (void)activate;
- (void)deactivate;
- (void)loadCannedModelWithType:(unint64_t)a3 error:(id *)a4;
- (void)loadCannedModels;
- (void)setDisablePolicy:(BOOL)a3;
- (void)setExperimentId:(id)a3;
- (void)setModelType:(id)a3;
- (void)setModelVersion:(id)a3;
- (void)setModels:(id)a3;
- (void)setOtherModels:(id)a3;
- (void)setOtherModelsType:(id)a3;
- (void)setTrialEnabled:(BOOL)a3;
- (void)setUserDefaults:(id)a3;
- (void)triggerUpdate;
- (void)updateModelsAccordingToHierarchy;
- (void)updateModelsAccordingToHierarchy:(id)a3 updateEnabled:(BOOL)a4 disablePendingUpdates:(BOOL)a5;
@end

@implementation PRSModelManager

+ (id)sharedModelManager
{
  if (sharedModelManager_onceToken != -1) {
    dispatch_once(&sharedModelManager_onceToken, &__block_literal_global_29);
  }
  v2 = (void *)sharedModelManager_sharedManager;
  return v2;
}

uint64_t __37__PRSModelManager_sharedModelManager__block_invoke()
{
  sharedModelManager_sharedManager = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

+ (void)cannedInfoForType:(unint64_t)a3 directivesPath:(id *)a4 modelName:(id *)a5
{
  if (a3) {
    +[PRSModelManager cannedInfoForType:directivesPath:modelName:]();
  }
  SSDefaultsGetAssetPath(@"directives_l2.mdplist");
  *a4 = (id)objc_claimAutoreleasedReturnValue();
  *a5 = @"spotlight_l2";
}

+ (void)pathsFor:(unint64_t)a3 withParentPath:(id)a4 modelPath:(id *)a5 directivesPath:(id *)a6
{
  id v12 = a4;
  v9 = [v12 stringByAppendingPathComponent:@"models"];
  uint64_t v10 = [v12 stringByAppendingPathComponent:@"directives"];
  if (a3) {
    +[PRSModelManager pathsFor:withParentPath:modelPath:directivesPath:]();
  }
  v11 = (void *)v10;
  *a5 = [v9 stringByAppendingPathComponent:@"spotlight_l2.mlmodelc"];
  *a6 = [v11 stringByAppendingPathComponent:@"directives_l2.mdplist"];
}

- (PRSModelManager)init
{
  v23.receiver = self;
  v23.super_class = (Class)PRSModelManager;
  id v2 = [(PRSModelManager *)&v23 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
    v4 = (void *)*((void *)v2 + 8);
    *((void *)v2 + 8) = v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
    v6 = (void *)*((void *)v2 + 10);
    *((void *)v2 + 10) = v5;

    uint64_t v7 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v8 = (void *)*((void *)v2 + 11);
    *((void *)v2 + 11) = v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.searchd"];
    uint64_t v10 = (void *)*((void *)v2 + 11);
    *((void *)v2 + 11) = v9;

    *((unsigned char *)v2 + 33) = 0;
    uint64_t v11 = [*((id *)v2 + 11) objectForKey:@"ModelVersion"];
    id v12 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v11;

    v13 = (void *)*((void *)v2 + 7);
    *((void *)v2 + 7) = &stru_1F1824018;

    v14 = (void *)*((void *)v2 + 9);
    *((void *)v2 + 9) = &stru_1F1824018;

    *((void *)v2 + 1) = 0;
    dispatch_group_t v15 = dispatch_group_create();
    v16 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v15;

    dispatch_group_t v17 = dispatch_group_create();
    v18 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v17;

    dispatch_group_enter(*((dispatch_group_t *)v2 + 3));
    v19 = dispatch_get_global_queue(25, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __23__PRSModelManager_init__block_invoke;
    block[3] = &unk_1E634C270;
    id v22 = v2;
    dispatch_async(v19, block);
  }
  return (PRSModelManager *)v2;
}

void __23__PRSModelManager_init__block_invoke(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 64);
  objc_sync_enter(v2);
  [*(id *)(a1 + 32) updateModelsAccordingToHierarchy:0 updateEnabled:1 disablePendingUpdates:1];
  objc_sync_exit(v2);

  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 24));
  uint64_t v3 = PRSLogCategoryDefault();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1BDB2A000, v3, OS_LOG_TYPE_INFO, "[Model loading] initial model update finished", v4, 2u);
  }
}

- (id)getL2ModelVersionForClientBundle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self->_models;
  objc_sync_enter(v5);
  v6 = [(NSMutableDictionary *)self->_models objectForKeyedSubscript:&unk_1F18614A8];
  uint64_t v7 = [v6 version];

  objc_sync_exit(v5);
  return v7;
}

- (void)activate
{
  dispatch_group_wait((dispatch_group_t)self->_modelUpdateGroup, 0xFFFFFFFFFFFFFFFFLL);
  obj = self->_models;
  objc_sync_enter(obj);
  activeGroup = self->_activeGroup;
  ++self->_activeCount;
  dispatch_group_enter(activeGroup);
  objc_sync_exit(obj);
}

- (void)deactivate
{
  obj = self->_models;
  objc_sync_enter(obj);
  unint64_t activeCount = self->_activeCount;
  if (activeCount)
  {
    self->_unint64_t activeCount = activeCount - 1;
    dispatch_group_leave((dispatch_group_t)self->_activeGroup);
  }
  objc_sync_exit(obj);
}

- (void)triggerUpdate
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  dispatch_group_enter((dispatch_group_t)self->_modelUpdateGroup);
  uint64_t v3 = PRSLogCategoryDefault();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(v7) = 0;
    _os_log_impl(&dword_1BDB2A000, v3, OS_LOG_TYPE_INFO, "[Model loading] triggerUpdate started", (uint8_t *)&v7, 2u);
  }

  id v4 = self->_models;
  objc_sync_enter(v4);
  uint64_t v5 = PRSLogCategoryDefault();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    unint64_t activeCount = self->_activeCount;
    int v7 = 134217984;
    unint64_t v8 = activeCount;
    _os_log_impl(&dword_1BDB2A000, v5, OS_LOG_TYPE_INFO, "[Model loading] triggerUpdate with activeCount %lu", (uint8_t *)&v7, 0xCu);
  }

  if (!self->_activeCount) {
    [(PRSModelManager *)self updateModelsAccordingToHierarchy];
  }
  objc_sync_exit(v4);

  dispatch_group_leave((dispatch_group_t)self->_modelUpdateGroup);
}

- (void)loadCannedModelWithType:(unint64_t)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v20 = 0;
  id v21 = 0;
  [(id)objc_opt_class() cannedInfoForType:a3 directivesPath:&v21 modelName:&v20];
  id v7 = v21;
  id v8 = v20;
  uint64_t v9 = PRSLogCategoryDefault();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
    *(_DWORD *)buf = 138412802;
    id v23 = v10;
    __int16 v24 = 2112;
    id v25 = v8;
    __int16 v26 = 2112;
    id v27 = v7;
    _os_log_impl(&dword_1BDB2A000, v9, OS_LOG_TYPE_DEFAULT, "[Model loading] loading canned model type %@ model name %@ directive path %@", buf, 0x20u);
  }
  uint64_t v11 = [(id)objc_opt_class() directivesFromFilePath:v7];
  id v12 = objc_opt_new();
  [v12 processDirectives:v11];
  id v13 = [[SSCoreMLInterface alloc] initSpecificModel:v8 error:a4];
  v14 = PRSLogCategoryDefault();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v13;
    _os_log_impl(&dword_1BDB2A000, v14, OS_LOG_TYPE_INFO, "[Model loading] model is %@", buf, 0xCu);
  }

  dispatch_group_t v15 = PRSLogCategoryDefault();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = [v13 getVersionString];
    *(_DWORD *)buf = 138412546;
    id v23 = v8;
    __int16 v24 = 2112;
    id v25 = v16;
    _os_log_impl(&dword_1BDB2A000, v15, OS_LOG_TYPE_INFO, "[Model loading] loaded model name %@ version %@", buf, 0x16u);
  }
  if (*a4 || !v13)
  {
    PRSLogCategoryDefault();
    dispatch_group_t v17 = (PRSModelContext *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v17->super, OS_LOG_TYPE_ERROR)) {
      -[PRSModelManager loadCannedModelWithType:error:](a4);
    }
  }
  else
  {
    dispatch_group_t v17 = [[PRSModelContext alloc] initWithModel:v13 directivesManager:v12 type:a3];
    models = self->_models;
    v19 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
    [(NSMutableDictionary *)models setObject:v17 forKeyedSubscript:v19];
  }
}

+ (id)directivesFromFilePath:(id)a3
{
  id v3 = a3;
  if (v3) {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v3 options:8 error:0];
  }
  else {
    id v4 = 0;
  }
  if ([v4 length])
  {
    id v5 = v4;
    [v5 bytes];
    [v5 length];
    v6 = (const void *)_MDPlistContainerCreateWithBytesAndDeallocator();
    id v7 = (void *)_MDPlistContainerCopyRootObject();
    CFRelease(v6);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void __42__PRSModelManager_directivesFromFilePath___block_invoke(uint64_t a1)
{
}

+ (BOOL)loadModelsWithDirectory:(id)a3 intoModelDict:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v21 = a4;
  v6 = objc_opt_new();
  id v7 = 0;
  id v8 = 0;
  char v9 = 1;
  do
  {
    char v10 = v9;
    if ((v9 & 1) == 0)
    {
      v16 = v21;
      [v21 removeAllObjects];
      [v21 addEntriesFromDictionary:v6];
      id v14 = 0;
      id v12 = v8;
      uint64_t v11 = v7;
      goto LABEL_7;
    }
    id v23 = v8;
    __int16 v24 = v7;
    +[PRSModelManager pathsFor:0 withParentPath:v5 modelPath:&v24 directivesPath:&v23];
    uint64_t v11 = v24;

    id v12 = v23;
    id v13 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v11];
    id v22 = 0;
    +[PRSModelManager loadModelWithURL:v13 type:0 directivesPath:v12 intoModelDict:v6 error:&v22];
    id v14 = v22;

    char v9 = 0;
    id v7 = v11;
    id v8 = v12;
  }
  while (!v14);
  dispatch_group_t v15 = PRSLogCategoryDefault();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    uint64_t v18 = [v14 code];
    v19 = @"nil";
    if (v11) {
      id v20 = v11;
    }
    else {
      id v20 = @"nil";
    }
    *(_DWORD *)buf = 134218498;
    uint64_t v26 = v18;
    __int16 v27 = 2112;
    if (v12) {
      v19 = v12;
    }
    uint64_t v28 = v20;
    __int16 v29 = 2112;
    v30 = v19;
    _os_log_error_impl(&dword_1BDB2A000, v15, OS_LOG_TYPE_ERROR, "[Model loading] model loading failed with err %ld for model path %@ and directives path %@", buf, 0x20u);
  }

  +[SSADEventReporter reportModelLoadingError];
  v16 = v21;
LABEL_7:

  return (v10 & 1) == 0;
}

+ (void)loadModelWithURL:(id)a3 type:(unint64_t)a4 directivesPath:(id)a5 intoModelDict:(id)a6 error:(id *)a7
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  if (v11 && [v12 length])
  {
    id v14 = [(id)objc_opt_class() directivesFromFilePath:v12];
    if ([v14 count])
    {
      dispatch_group_t v15 = objc_opt_new();
      [v15 processDirectives:v14];
      v16 = [[SSCoreMLInterface alloc] initWithURL:v11 error:a7];
      dispatch_group_t v17 = v16;
      if (!*a7)
      {
        if (v16)
        {
          uint64_t v18 = [[PRSModelContext alloc] initWithModel:v16 directivesManager:v15 type:a4];
          v19 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a4];
          [v13 setObject:v18 forKeyedSubscript:v19];
        }
        else
        {
          uint64_t v24 = PRSModelErrorDomain;
          __int16 v27 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v28 = @"type";
          id v25 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a4];
          __int16 v29 = v25;
          uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
          *a7 = [v27 errorWithDomain:v24 code:-1 userInfo:v26];
        }
      }
    }
    else
    {
      id v22 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v23 = PRSModelErrorDomain;
      v30 = @"type";
      dispatch_group_t v15 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a4];
      uint64_t v31 = v15;
      dispatch_group_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
      *a7 = [v22 errorWithDomain:v23 code:-1000 userInfo:v17];
    }
  }
  else
  {
    id v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v21 = PRSModelErrorDomain;
    v32 = @"type";
    id v14 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a4];
    v33[0] = v14;
    dispatch_group_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:&v32 count:1];
    *a7 = [v20 errorWithDomain:v21 code:-1001 userInfo:v15];
  }
}

- (BOOL)loadCannedModels
{
  char v3 = 1;
  while (1)
  {
    char v4 = v3;
    if ((v3 & 1) == 0) {
      break;
    }
    id v14 = 0;
    [(PRSModelManager *)self loadCannedModelWithType:0 error:&v14];
    id v5 = v14;
    char v3 = 0;
    if (v5)
    {
      v6 = v5;
      id v7 = PRSLogCategoryDefault();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        [(PRSModelManager *)(uint64_t)v6 loadCannedModels];
      }

      getpid();
      id v8 = NSString;
      char v9 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:0];
      char v10 = [v8 stringWithFormat:@"failed load canned model type %@", v9];
      SimulateCrash();

      goto LABEL_9;
    }
  }
  modelType = self->_modelType;
  self->_modelType = (NSString *)@"Canned";

  [(NSUserDefaults *)self->_userDefaults setValue:self->_modelType forKey:@"ModelName"];
  v6 = PRSLogCategoryDefault();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BDB2A000, v6, OS_LOG_TYPE_DEFAULT, "[Model loading] loaded canned models", buf, 2u);
  }
LABEL_9:

  return (v4 & 1) == 0;
}

- (BOOL)loadModels
{
  if (self->_trialEnabled)
  {
    uint64_t v3 = 2;
    while (1)
    {
      char v4 = +[SSModelLoader assetDirectoryPathForType:v3 forUpdate:0];
      if (+[PRSModelManager loadModelsWithDirectory:v4 intoModelDict:self->_models])
      {
        break;
      }

      if (!--v3) {
        goto LABEL_5;
      }
    }
    if (v3 == 1)
    {
      modelType = self->_modelType;
      id v7 = @"Default";
    }
    else
    {
      if (v3 != 2)
      {
LABEL_13:

        return 1;
      }
      modelType = self->_modelType;
      id v7 = @"Experimental";
    }
    self->_modelType = &v7->isa;

    goto LABEL_13;
  }
LABEL_5:
  return [(PRSModelManager *)self loadCannedModels];
}

- (void)updateModelsAccordingToHierarchy:(id)a3 updateEnabled:(BOOL)a4 disablePendingUpdates:(BOOL)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  char v9 = +[SSModelLoader sharedInstance];
  int v10 = [v9 hasPendingUpdates];

  if (!a5 && v10)
  {
    id v11 = dispatch_group_create();
    id v12 = +[SSModelLoader sharedInstance];
    [v12 moveNewlyPackagedAssets:v11];

    dispatch_group_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  }
  if (v6)
  {
    int v13 = [(NSMutableDictionary *)self->_models count] ? v10 : 1;
    if (v13 == 1 && ![(PRSModelManager *)self loadModels])
    {
      id v14 = PRSLogCategoryDefault();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[PRSModelManager updateModelsAccordingToHierarchy:updateEnabled:disablePendingUpdates:](v14);
      }
    }
  }
  if (v8) {
    dispatch_group_leave(v8);
  }
}

- (void)updateModelsAccordingToHierarchy
{
  Boolean keyExistsAndHasValidFormat = 0;
  CFPreferencesGetAppBooleanValue(@"SearchRankingDisableModelUpdate", @"com.apple.searchd", &keyExistsAndHasValidFormat);
  [(PRSModelManager *)self updateModelsAccordingToHierarchy:0 updateEnabled:keyExistsAndHasValidFormat == 0 disablePendingUpdates:0];
}

- (BOOL)otherModelsAvailable
{
  return [(NSMutableDictionary *)self->_otherModels count] != 0;
}

- (float)computeL2ScoresForVectors:(id)a3 secondVector:(id)a4 withServerFeatures:(id)a5 withBundleFeatures:(id)a6 experimentalWeight1:(double)a7 experimentalWeight2:(double)a8 shouldCancel:(BOOL *)a9 clientBundle:(id)a10
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v46 = a10;
  if (a9 && *a9)
  {
    id v22 = 0;
  }
  else
  {
    uint64_t v23 = PRSLogCategoryDefault();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = [v18 count];
      _os_log_impl(&dword_1BDB2A000, v23, OS_LOG_TYPE_INFO, "computing L2 scores for %lu items", (uint8_t *)&buf, 0xCu);
    }

    uint64_t v24 = [(PRSModelManager *)self models];
    if (![v24 count])
    {
      id v25 = PRSLogCategoryDefault();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        -[PRSModelManager computeL2ScoresForVectors:secondVector:withServerFeatures:withBundleFeatures:experimentalWeight1:experimentalWeight2:shouldCancel:clientBundle:](self);
      }

      getpid();
      uint64_t v26 = NSString;
      __int16 v27 = [(PRSModelManager *)self modelVersion];
      uint64_t v28 = [v26 stringWithFormat:@"expected models version %@", v27, v46];
      SimulateCrash();

      +[SSADEventReporter reportBadL2Models];
    }
    pthread_mutex_lock(&sComputeScoreLock);
    if (a9 && *a9)
    {
      pthread_mutex_unlock(&sComputeScoreLock);
      id v22 = 0;
    }
    else
    {
      __int16 v29 = dispatch_group_create();
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v58 = 0x2020000000;
      uint64_t v59 = 0;
      v30 = dispatch_get_global_queue(33, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __162__PRSModelManager_computeL2ScoresForVectors_secondVector_withServerFeatures_withBundleFeatures_experimentalWeight1_experimentalWeight2_shouldCancel_clientBundle___block_invoke;
      block[3] = &unk_1E634D190;
      p_long long buf = &buf;
      void block[4] = self;
      id v31 = v18;
      id v48 = v31;
      id v49 = v21;
      id v50 = v20;
      id v32 = v24;
      int v54 = 33;
      id v51 = v32;
      v53 = a9;
      dispatch_group_async(v29, v30, block);

      dispatch_group_wait(v29, 0xFFFFFFFFFFFFFFFFLL);
      pthread_mutex_unlock(&sComputeScoreLock);
      if (*(void *)(*((void *)&buf + 1) + 24))
      {
        if (a7 <= 0.0 && a8 <= 0.0)
        {
          v33 = [v32 objectForKeyedSubscript:&unk_1F18614A8];
          v34 = [v33 directivesManager];

          [v34 weightX];
          a7 = v35;
          [v34 weightY];
          a8 = v36;
        }
        v37 = PRSLogCategoryDefault();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
          -[PRSModelManager computeL2ScoresForVectors:secondVector:withServerFeatures:withBundleFeatures:experimentalWeight1:experimentalWeight2:shouldCancel:clientBundle:](v37, a7, a8);
        }

        uint64_t v38 = [v31 count];
        if (v38)
        {
          uint64_t v39 = 0;
          do
          {
            int v40 = *(_DWORD *)(*(void *)(*((void *)&buf + 1) + 24) + 4 * v39);
            v41 = [v31 objectAtIndexedSubscript:v39];
            LODWORD(v42) = v40;
            [v41 setOriginalL2Score:v42];

            ++v39;
          }
          while (v38 != v39);
        }
        v43 = PRSLogCategoryDefault();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          uint64_t v44 = [v31 count];
          *(_DWORD *)v55 = 134217984;
          uint64_t v56 = v44;
          _os_log_impl(&dword_1BDB2A000, v43, OS_LOG_TYPE_INFO, "finished computing L2 scores for %lu items", v55, 0xCu);
        }

        id v22 = *(float **)(*((void *)&buf + 1) + 24);
      }
      else
      {
        id v22 = 0;
      }

      _Block_object_dispose(&buf, 8);
    }
  }
  return v22;
}

void __162__PRSModelManager_computeL2ScoresForVectors_secondVector_withServerFeatures_withBundleFeatures_experimentalWeight1_experimentalWeight2_shouldCancel_clientBundle___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  id v6 = [*(id *)(a1 + 64) objectForKeyedSubscript:&unk_1F18614A8];
  *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [v2 computeScoresForFeatures:v3 withBundleFeatures:v4 serverBundleFeatures:v5 usingModelContext:v6 qos:*(unsigned int *)(a1 + 88) shouldCancel:*(void *)(a1 + 80) filterBundle:0];
}

- (float)computeScoresForFeatures:(id)a3 withBundleFeatures:(id)a4 serverBundleFeatures:(id)a5 usingModelContext:(id)a6 qos:(unsigned int)a7 shouldCancel:(BOOL *)a8 filterBundle:(id)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a9;
  uint64_t v19 = [v14 count];
  id v20 = 0;
  if (v17 && v19)
  {
    if (a8 && *a8)
    {
      id v20 = 0;
    }
    else
    {
      id v20 = malloc_type_calloc([v14 count], 4uLL, 0x100004052888210uLL);
      id v21 = [v17 directivesManager];
      unint64_t v22 = [v14 count];
      unint64_t v23 = v22 / 0x1E;
      if (v22 % 0x1E) {
        ++v23;
      }
      size_t iterations = v23;
      id v31 = v16;
      id v32 = v15;
      [v21 processResultSetValuesWithMap:v15 serverFeatures:v16];
      uint64_t v24 = [v21 processingContext];
      uint64_t v25 = [v24 expandedFeatureCount];

      uint64_t v26 = [v17 model];
      unsigned int v33 = (PRSRankingSDEnabledFlagState() >> 1) & 1;
      __int16 v27 = dispatch_get_global_queue(a7, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __132__PRSModelManager_computeScoresForFeatures_withBundleFeatures_serverBundleFeatures_usingModelContext_qos_shouldCancel_filterBundle___block_invoke;
      block[3] = &unk_1E634D1B8;
      uint64_t v41 = v25;
      double v42 = a8;
      id v36 = v14;
      id v37 = v18;
      id v28 = v21;
      id v38 = v28;
      id v39 = v26;
      v43 = v20;
      char v44 = v33;
      id v40 = v17;
      id v29 = v26;
      dispatch_apply(iterations, v27, block);

      [v28 cleanup];
      if (a8 && *a8)
      {
        free(v20);
        id v20 = 0;
      }
      id v16 = v31;
      id v15 = v32;
    }
  }

  return (float *)v20;
}

void __132__PRSModelManager_computeScoresForFeatures_withBundleFeatures_serverBundleFeatures_usingModelContext_qos_shouldCancel_filterBundle___block_invoke(uint64_t a1, uint64_t a2)
{
  v66[2] = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1C1885190]();
  id v4 = objc_alloc(MEMORY[0x1E4F1E9A8]);
  uint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:*(void *)(a1 + 72)];
  v66[0] = v5;
  v66[1] = &unk_1F18614C0;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:2];
  id v7 = (void *)[v4 initForFloat32TypeWithShape:v6];

  uint64_t v8 = 0;
  uint64_t v63 = 30 * a2;
  memset(v65, 0, sizeof(v65));
  int64x2_t v61 = vdupq_n_s64(0x10uLL);
  v62 = v7;
  do
  {
    char v9 = *(unsigned char **)(a1 + 80);
    if (v9)
    {
      if (*v9) {
        break;
      }
    }
    uint64_t v10 = v63 + v8;
    if (v63 + v8 >= (unint64_t)[*(id *)(a1 + 32) count]) {
      break;
    }
    id v11 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v10];
    id v12 = v11;
    if (!*(void *)(a1 + 40)
      || ([v11 bundleID],
          int v13 = objc_claimAutoreleasedReturnValue(),
          int v14 = [v13 isEqualToString:*(void *)(a1 + 40)],
          v13,
          v14))
    {
      unint64_t v15 = [v12 indexScore];
      uint64_t v17 = 0;
      int64x2_t v18 = (int64x2_t)xmmword_1BDC5D810;
      int64x2_t v19 = (int64x2_t)xmmword_1BDC5D800;
      int64x2_t v20 = (int64x2_t)xmmword_1BDC5D7F0;
      int64x2_t v21 = (int64x2_t)xmmword_1BDC5D7E0;
      int64x2_t v22 = (int64x2_t)xmmword_1BDC5D7D0;
      int64x2_t v23 = (int64x2_t)xmmword_1BDC5D7C0;
      int64x2_t v24 = (int64x2_t)xmmword_1BDC5D7B0;
      int64x2_t v25 = (int64x2_t)xmmword_1BDC5D7A0;
      v26.i64[0] = 0x101010101010101;
      v26.i64[1] = 0x101010101010101;
      do
      {
        uint64_t v27 = 2 * v16;
        if ((v25.i8[8] & 0x40) != 0) {
          unint64_t v28 = v16 >> v25.i8[8];
        }
        else {
          unint64_t v28 = ((2 * v16) << ~v25.i8[8]) | (v15 >> v25.i8[8]);
        }
        if ((v25.i8[0] & 0x40) != 0) {
          unint64_t v29 = v16 >> v25.i8[0];
        }
        else {
          unint64_t v29 = (v27 << ~v25.i8[0]) | (v15 >> v25.i8[0]);
        }
        if ((v24.i8[8] & 0x40) != 0) {
          unint64_t v30 = v16 >> v24.i8[8];
        }
        else {
          unint64_t v30 = (v27 << ~v24.i8[8]) | (v15 >> v24.i8[8]);
        }
        if ((v24.i8[0] & 0x40) != 0) {
          unint64_t v31 = v16 >> v24.i8[0];
        }
        else {
          unint64_t v31 = (v27 << ~v24.i8[0]) | (v15 >> v24.i8[0]);
        }
        if ((v23.i8[8] & 0x40) != 0) {
          unint64_t v32 = v16 >> v23.i8[8];
        }
        else {
          unint64_t v32 = (v27 << ~v23.i8[8]) | (v15 >> v23.i8[8]);
        }
        if ((v23.i8[0] & 0x40) != 0) {
          unint64_t v33 = v16 >> v23.i8[0];
        }
        else {
          unint64_t v33 = (v27 << ~v23.i8[0]) | (v15 >> v23.i8[0]);
        }
        if ((v22.i8[8] & 0x40) != 0) {
          unint64_t v34 = v16 >> v22.i8[8];
        }
        else {
          unint64_t v34 = (v27 << ~v22.i8[8]) | (v15 >> v22.i8[8]);
        }
        if ((v22.i8[0] & 0x40) != 0) {
          unint64_t v35 = v16 >> v22.i8[0];
        }
        else {
          unint64_t v35 = (v27 << ~v22.i8[0]) | (v15 >> v22.i8[0]);
        }
        if ((v21.i8[8] & 0x40) != 0) {
          unint64_t v36 = v16 >> v21.i8[8];
        }
        else {
          unint64_t v36 = (v27 << ~v21.i8[8]) | (v15 >> v21.i8[8]);
        }
        if ((v21.i8[0] & 0x40) != 0) {
          unint64_t v37 = v16 >> v21.i8[0];
        }
        else {
          unint64_t v37 = (v27 << ~v21.i8[0]) | (v15 >> v21.i8[0]);
        }
        if ((v20.i8[8] & 0x40) != 0) {
          unint64_t v38 = v16 >> v20.i8[8];
        }
        else {
          unint64_t v38 = (v27 << ~v20.i8[8]) | (v15 >> v20.i8[8]);
        }
        unint64_t v39 = (v27 << ~v20.i8[0]) | (v15 >> v20.i8[0]);
        if ((v20.i8[0] & 0x40) != 0) {
          unint64_t v39 = v16 >> v20.i8[0];
        }
        if ((v19.i8[8] & 0x40) != 0) {
          unint64_t v40 = v16 >> v19.i8[8];
        }
        else {
          unint64_t v40 = (v27 << ~v19.i8[8]) | (v15 >> v19.i8[8]);
        }
        unint64_t v41 = (v27 << ~v19.i8[0]) | (v15 >> v19.i8[0]);
        unint64_t v42 = (v27 << ~v18.i8[0]) | (v15 >> v18.i8[0]);
        if ((v19.i8[0] & 0x40) != 0) {
          unint64_t v41 = v16 >> v19.i8[0];
        }
        if ((v18.i8[0] & 0x40) != 0) {
          unint64_t v42 = v16 >> v18.i8[0];
        }
        if ((v18.i8[8] & 0x40) != 0) {
          unint64_t v43 = v16 >> v18.i8[8];
        }
        else {
          LOBYTE(v43) = ((_BYTE)v27 << ~v18.i8[8]) | (v15 >> v18.i8[8]);
        }
        v44.i8[0] = v42;
        v44.i8[1] = v43;
        v44.i8[2] = v41;
        v44.i8[3] = v40;
        v44.i8[4] = v39;
        v44.i8[5] = v38;
        v44.i8[6] = v37;
        v44.i8[7] = v36;
        v44.i8[8] = v35;
        v44.i8[9] = v34;
        v44.i8[10] = v33;
        v44.i8[11] = v32;
        v44.i8[12] = v31;
        v44.i8[13] = v30;
        v44.i8[14] = v29;
        v44.i8[15] = v28;
        int64x2_t v20 = vaddq_s64(v20, v61);
        int64x2_t v19 = vaddq_s64(v19, v61);
        v65[v17] = vandq_s8(v44, v26);
        int64x2_t v18 = vaddq_s64(v18, v61);
        ++v17;
        int64x2_t v21 = vaddq_s64(v21, v61);
        int64x2_t v22 = vaddq_s64(v22, v61);
        int64x2_t v23 = vaddq_s64(v23, v61);
        int64x2_t v24 = vaddq_s64(v24, v61);
        int64x2_t v25 = vaddq_s64(v25, v61);
      }
      while (v17 != 8);
      id v7 = v62;
      objc_msgSend(*(id *)(a1 + 48), "processL2FeatureVector:populatingValues:scoreValue:count:", v12, objc_msgSend(v62, "floatPointer", *(double *)v18.i64, *(double *)v19.i64, *(double *)v20.i64, *(double *)v21.i64, *(double *)v22.i64, *(double *)v23.i64, *(double *)v24.i64, *(double *)v25.i64), v65, 95);
      v45 = *(void **)(a1 + 56);
      id v64 = 0;
      [v45 predict:v62 error:&v64];
      int v47 = v46;
      id v48 = v64;
      if (v48)
      {
        uint64_t v58 = v48;
        uint64_t v59 = PRSLogCategoryDefault();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
          __132__PRSModelManager_computeScoresForFeatures_withBundleFeatures_serverBundleFeatures_usingModelContext_qos_shouldCancel_filterBundle___block_invoke_cold_1(v58);
        }

        break;
      }
      *(_DWORD *)(*(void *)(a1 + 88) + 4 * v10) = v47;
      if (*(unsigned char *)(a1 + 96))
      {
        id v49 = objc_getAssociatedObject(v12, "_rankingItemObjectKey");
        if (v49)
        {
          id v50 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*(void *)(a1 + 72)];
          if (*(void *)(a1 + 72))
          {
            unint64_t v51 = 0;
            do
            {
              v52 = (void *)MEMORY[0x1E4F28ED0];
              LODWORD(v53) = *(_DWORD *)([v62 floatPointer] + 4 * v51);
              int v54 = [v52 numberWithFloat:v53];
              [v50 addObject:v54];

              ++v51;
            }
            while (*(void *)(a1 + 72) > v51);
          }
          if (![*(id *)(a1 + 64) type])
          {
            objc_setAssociatedObject(v49, "_l2FeaturesObjectKey", v50, (void *)1);
            v55 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:*(void *)(a1 + 72)];
            objc_setAssociatedObject(v49, "_l2FeatureCountObjectKey", v55, (void *)1);

            LODWORD(v56) = v47;
            v57 = [MEMORY[0x1E4F28ED0] numberWithFloat:v56];
            objc_setAssociatedObject(v49, "_l2ScoreObjectKey", v57, (void *)1);
          }
        }
      }
    }

    ++v8;
  }
  while (v8 != 30);
}

- (double)testL2WithData:(id)a3 experimental:(BOOL)a4
{
  id v5 = a3;
  id v6 = [(PRSModelManager *)self models];
  id v7 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:0];
  uint64_t v8 = [v6 objectForKeyedSubscript:v7];
  char v9 = [v8 model];

  id v13 = 0;
  [v9 predict:v5 error:&v13];
  float v11 = v10;
  if (v13) {
    -[PRSModelManager testL2WithData:experimental:]();
  }

  return v11;
}

- (BOOL)disablePolicy
{
  return self->_disablePolicy;
}

- (void)setDisablePolicy:(BOOL)a3
{
  self->_disablePolicy = a3;
}

- (BOOL)trialEnabled
{
  return self->_trialEnabled;
}

- (void)setTrialEnabled:(BOOL)a3
{
  self->_trialEnabled = a3;
}

- (NSString)modelVersion
{
  return self->_modelVersion;
}

- (void)setModelVersion:(id)a3
{
}

- (NSString)experimentId
{
  return self->_experimentId;
}

- (void)setExperimentId:(id)a3
{
}

- (NSString)modelType
{
  return self->_modelType;
}

- (void)setModelType:(id)a3
{
}

- (NSMutableDictionary)models
{
  return self->_models;
}

- (void)setModels:(id)a3
{
}

- (NSString)otherModelsType
{
  return self->_otherModelsType;
}

- (void)setOtherModelsType:(id)a3
{
}

- (NSMutableDictionary)otherModels
{
  return self->_otherModels;
}

- (void)setOtherModels:(id)a3
{
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_otherModels, 0);
  objc_storeStrong((id *)&self->_otherModelsType, 0);
  objc_storeStrong((id *)&self->_models, 0);
  objc_storeStrong((id *)&self->_modelType, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);
  objc_storeStrong((id *)&self->_modelVersion, 0);
  objc_storeStrong((id *)&self->_modelUpdateGroup, 0);
  objc_storeStrong((id *)&self->_activeGroup, 0);
}

+ (void)cannedInfoForType:directivesPath:modelName:.cold.1()
{
}

+ (void)pathsFor:withParentPath:modelPath:directivesPath:.cold.1()
{
}

- (void)loadCannedModelWithType:(id *)a1 error:.cold.1(id *a1)
{
  [*a1 code];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_5(&dword_1BDB2A000, v1, v2, "[Model loading] canned model loading failed in load canned model with err %ld", v3, v4, v5, v6, v7);
}

- (void)loadCannedModels
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:0];
  OUTLINED_FUNCTION_2_0();
  __int16 v6 = 2112;
  uint64_t v7 = a1;
  _os_log_error_impl(&dword_1BDB2A000, a2, OS_LOG_TYPE_ERROR, "[Model loading] unrecoverable - failed to load canned model type %@ with err %@", v5, 0x16u);
}

- (void)updateModelsAccordingToHierarchy:(os_log_t)log updateEnabled:disablePendingUpdates:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1BDB2A000, log, OS_LOG_TYPE_ERROR, "[Model loading] Error in loading models", v1, 2u);
}

- (void)computeL2ScoresForVectors:(double)a3 secondVector:withServerFeatures:withBundleFeatures:experimentalWeight1:experimentalWeight2:shouldCancel:clientBundle:.cold.1(os_log_t log, double a2, double a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 134218240;
  double v4 = a2;
  __int16 v5 = 2048;
  double v6 = a3;
  _os_log_debug_impl(&dword_1BDB2A000, log, OS_LOG_TYPE_DEBUG, "using weights X %f Y %f", (uint8_t *)&v3, 0x16u);
}

- (void)computeL2ScoresForVectors:(void *)a1 secondVector:withServerFeatures:withBundleFeatures:experimentalWeight1:experimentalWeight2:shouldCancel:clientBundle:.cold.2(void *a1)
{
  uint64_t v1 = [a1 modelVersion];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_5(&dword_1BDB2A000, v2, v3, "unable to compute L2scores with no models; version %@",
    v4,
    v5,
    v6,
    v7,
    v8);
}

void __132__PRSModelManager_computeScoresForFeatures_withBundleFeatures_serverBundleFeatures_usingModelContext_qos_shouldCancel_filterBundle___block_invoke_cold_1(void *a1)
{
  [a1 code];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_5(&dword_1BDB2A000, v1, v2, "error in L2 model score computation: %ld", v3, v4, v5, v6, v7);
}

- (void)testL2WithData:experimental:.cold.1()
{
  __assert_rtn("-[PRSModelManager testL2WithData:experimental:]", "PRSModelManager.m", 688, "error == nil");
}

@end