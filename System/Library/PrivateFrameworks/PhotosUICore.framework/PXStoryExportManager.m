@interface PXStoryExportManager
+ (BOOL)collectAnalyticsForFixationWithAppleMusicAsset:(id)a3 configuration:(id)a4;
+ (OS_os_log)frequentSignpostLog;
+ (id)_appleIDCountry;
+ (id)_aspectDescriptionFromSize:(CGSize)a3;
+ (id)_defaultPayloadForConfiguration:(id)a3;
+ (id)collectAnalyticsForExportBeginWithConfiguration:(id)a3;
+ (void)_incrementShareCountForMemory:(id)a3;
+ (void)collectAnalyticsForExportEndWithConfiguration:(id)a3 analyticsToken:(id)a4 model:(id)a5 withSuccess:(BOOL)a6 error:(id)a7;
+ (void)collectDataContinuationAnalyticsForExportWithConfiguration:(id)a3 withSuccess:(BOOL)a4 error:(id)a5;
- (NSOperationQueue)operationQueue;
- (PXStoryExportManager)init;
- (id)requestExportWithDestinationURL:(id)a3 configuration:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6;
- (int64_t)maxConcurrentExportCount;
- (int64_t)qualityOfService;
- (void)cancelAllExports;
- (void)setMaxConcurrentExportCount:(int64_t)a3;
- (void)setQualityOfService:(int64_t)a3;
@end

@implementation PXStoryExportManager

+ (void)_incrementShareCountForMemory:(id)a3
{
  id v3 = a3;
  v4 = [v3 photoLibrary];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__PXStoryExportManager_Analytics___incrementShareCountForMemory___block_invoke;
  v8[3] = &unk_1E5DD36F8;
  id v9 = v3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__PXStoryExportManager_Analytics___incrementShareCountForMemory___block_invoke_2;
  v6[3] = &unk_1E5DD3158;
  id v7 = v9;
  id v5 = v9;
  [v4 performChanges:v8 completionHandler:v6];
}

void __65__PXStoryExportManager_Analytics___incrementShareCountForMemory___block_invoke(uint64_t a1)
{
  id v1 = [MEMORY[0x1E4F39170] changeRequestForMemory:*(void *)(a1 + 32)];
  [v1 incrementShareCount];
}

void __65__PXStoryExportManager_Analytics___incrementShareCountForMemory___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = PLMemoriesGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138412546;
      uint64_t v9 = v7;
      __int16 v10 = 2112;
      id v11 = v5;
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_ERROR, "Failed to bump share count of memory %@: %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

+ (id)_defaultPayloadForConfiguration:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithCapacity:3];
  v6 = [v4 storyConfiguration];

  uint64_t v7 = [v6 assetCollection];

  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  [v5 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F56548]];
  return v5;
}

+ (id)_aspectDescriptionFromSize:(CGSize)a3
{
}

+ (void)collectAnalyticsForExportEndWithConfiguration:(id)a3 analyticsToken:(id)a4 model:(id)a5 withSuccess:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  id v48 = a3;
  id v12 = a5;
  id v13 = a7;
  id v14 = a4;
  v15 = [v14 objectForKeyedSubscript:@"signpost"];
  uint64_t v16 = [v15 CPAnalyticsSignpostIDValue];

  v17 = [v14 objectForKeyedSubscript:@"payload"];

  v18 = [NSNumber numberWithBool:v8];
  [v17 setObject:v18 forKeyedSubscript:@"interactiveMemoryExportSucceeded"];

  v19 = [v48 activityType];
  int v20 = [v19 hasPrefix:@"com.apple"];
  v21 = [v48 activityType];

  if (v21)
  {
    [v17 setObject:v19 forKeyedSubscript:@"activityType"];
    v22 = [NSNumber numberWithBool:v20 ^ 1u];
    [v17 setObject:v22 forKeyedSubscript:@"isThirdPartyShareDestination"];
  }
  v23 = [v48 activityCategory];

  if (v23)
  {
    v24 = [v48 activityCategory];
    [v17 setObject:v24 forKeyedSubscript:@"activityCategory"];
  }
  v25 = [v48 videoOptions];
  [v25 resolution];
  double v27 = v26;
  double v29 = v28;

  if (v27 <= v29) {
    v30 = @"portrait";
  }
  else {
    v30 = @"landscape";
  }
  [v17 setObject:v30 forKeyedSubscript:@"Orientation"];
  v31 = objc_msgSend(a1, "_aspectDescriptionFromSize:", v27, v29);
  [v17 setObject:v31 forKeyedSubscript:@"AspectRatio"];

  v32 = [v48 storyConfiguration];
  v33 = [v32 assetCollection];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v34 = v33;
  }
  else {
    v34 = 0;
  }
  id v35 = v34;
  if (!v8)
  {
    v39 = [v13 domain];
    id v46 = v12;
    if ([v39 isEqualToString:*MEMORY[0x1E4F281F8]] && objc_msgSend(v13, "code") == 3072)
    {
      uint64_t v40 = v16;

LABEL_20:
      v38 = @"com.apple.photos.memory.interactiveMemoryExportCancelled";
      v43 = @"com.apple.photos.memory.interactiveMemoryExportCancelled";
LABEL_23:
      v45 = (void *)MEMORY[0x1E4F56658];
      v37 = objc_msgSend(v17, "copy", v46);
      [v45 sendEvent:v38 withPayload:v37];
      uint64_t v16 = v40;
      id v12 = v47;
      goto LABEL_24;
    }
    v41 = objc_msgSend(v13, "domain", v12);
    if ([v41 isEqualToString:@"PXStoryErrorDomain"])
    {
      uint64_t v40 = v16;
      uint64_t v42 = [v13 code];

      if (v42 == 11) {
        goto LABEL_20;
      }
    }
    else
    {
      uint64_t v40 = v16;
    }
    v38 = @"com.apple.photos.memory.interactiveMemoryExportFailed";
    v44 = @"com.apple.photos.memory.interactiveMemoryExportFailed";
    [v17 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F56568]];
    goto LABEL_23;
  }
  v36 = @"com.apple.photos.memory.interactiveMemoryExportSucceeded";
  if (v35) {
    [a1 _incrementShareCountForMemory:v33];
  }
  v37 = (void *)[v17 copy];
  +[PXStoryAnalyticsController sendMemoryEvent:@"com.apple.photos.memory.interactiveMemoryExported" model:v12 payload:v37];
  v38 = @"com.apple.photos.memory.interactiveMemoryExportSucceeded";
LABEL_24:

  [v17 setObject:v38 forKeyedSubscript:*MEMORY[0x1E4F56580]];
  [MEMORY[0x1E4F56658] endSignpost:v16 forEventName:*MEMORY[0x1E4F56440] withPayload:v17];
}

+ (void)collectDataContinuationAnalyticsForExportWithConfiguration:(id)a3 withSuccess:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  id v19 = a3;
  id v8 = a5;
  uint64_t v9 = [a1 _defaultPayloadForConfiguration:v19];
  if (v6)
  {
    __int16 v10 = (id *)MEMORY[0x1E4F56468];
LABEL_10:
    id v14 = *v10;
    goto LABEL_11;
  }
  if (!v8)
  {
LABEL_9:
    __int16 v10 = (id *)MEMORY[0x1E4F56460];
    goto LABEL_10;
  }
  id v11 = [v8 domain];
  if ([v11 isEqualToString:*MEMORY[0x1E4F281F8]] && objc_msgSend(v8, "code") == 3072)
  {

    goto LABEL_9;
  }
  id v12 = [v8 domain];
  if ([v12 isEqualToString:@"PXStoryErrorDomain"])
  {
    uint64_t v13 = [v8 code];

    if (v13 == 11) {
      goto LABEL_9;
    }
  }
  else
  {
  }
  id v14 = (id)*MEMORY[0x1E4F56470];
  [v9 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F56568]];
LABEL_11:
  v15 = [v19 activityType];

  if (v15)
  {
    uint64_t v16 = [v19 activityType];
    [v9 setObject:v16 forKeyedSubscript:@"activityType"];
  }
  v17 = [v19 activityCategory];

  if (v17)
  {
    v18 = [v19 activityCategory];
    [v9 setObject:v18 forKeyedSubscript:@"activityCategory"];
  }
  [MEMORY[0x1E4F56658] sendEvent:v14 withPayload:v9];
}

+ (id)_appleIDCountry
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (_appleIDCountry_onceToken != -1) {
    dispatch_once(&_appleIDCountry_onceToken, &__block_literal_global_196577);
  }
  if (!_appleIDCountry_bag) {
    PXAssertGetLog();
  }
  *(void *)buf = 0;
  uint64_t v16 = buf;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__196579;
  id v19 = __Block_byref_object_dispose__196580;
  id v20 = 0;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__196579;
  v13[4] = __Block_byref_object_dispose__196580;
  id v14 = 0;
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  id v3 = [(id)_appleIDCountry_bag stringForKey:@"countryCode"];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__PXStoryExportManager_Analytics___appleIDCountry__block_invoke_325;
  v9[3] = &unk_1E5DC3D88;
  id v11 = buf;
  id v12 = v13;
  id v4 = v2;
  __int16 v10 = v4;
  [v3 valueWithCompletion:v9];

  dispatch_time_t v5 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v4, v5);
  BOOL v6 = (void *)*((void *)v16 + 5);
  if (!v6) {
    PXAssertGetLog();
  }
  id v7 = v6;

  _Block_object_dispose(v13, 8);
  _Block_object_dispose(buf, 8);

  return v7;
}

void __50__PXStoryExportManager_Analytics___appleIDCountry__block_invoke_325(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v13 = a2;
  id v7 = a4;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  uint64_t v8 = 40;
  if (v13)
  {
    uint64_t v9 = v13;
  }
  else
  {
    uint64_t v8 = 48;
    uint64_t v9 = v7;
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + v8) + 8);
  id v11 = v9;
  id v12 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v11;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __50__PXStoryExportManager_Analytics___appleIDCountry__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F4DBD8] bagForProfile:@"Photos" profileVersion:@"1"];
  id v1 = (void *)_appleIDCountry_bag;
  _appleIDCountry_bag = v0;
}

+ (BOOL)collectAnalyticsForFixationWithAppleMusicAsset:(id)a3 configuration:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, a1, @"PXStoryExportManager+Analytics.m", 50, @"Invalid parameter not satisfying: %@", @"appleMusicAsset != nil" object file lineNumber description];
  }
  uint64_t v9 = [v8 activityType];
  if (!v9) {
    PXAssertGetLog();
  }
  uint64_t v10 = [v7 contentProvider];
  if (!v10)
  {
    id v11 = PLStoryGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = [v7 identifier];
      *(_DWORD *)buf = 138543362;
      double v28 = v12;
      _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_ERROR, "Music asset with identifier %{public}@ missing contentProvider", buf, 0xCu);
    }
    uint64_t v10 = @"unknown";
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __96__PXStoryExportManager_Analytics__collectAnalyticsForFixationWithAppleMusicAsset_configuration___block_invoke;
  block[3] = &__block_descriptor_48_e5_v8__0l;
  block[4] = a2;
  block[5] = a1;
  if (collectAnalyticsForFixationWithAppleMusicAsset_configuration__onceToken != -1) {
    dispatch_once(&collectAnalyticsForFixationWithAppleMusicAsset_configuration__onceToken, block);
  }
  id v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
  [v13 setObject:v9 forKeyedSubscript:@"ActivityType"];
  id v14 = [v7 identifier];
  [v13 setObject:v14 forKeyedSubscript:@"AdamID"];

  if (([(id)collectAnalyticsForFixationWithAppleMusicAsset_configuration__topCPIDSet containsObject:v10] & 1) == 0)
  {

    uint64_t v10 = @"other";
  }
  [v13 setObject:v10 forKeyedSubscript:@"CPID"];
  v15 = [a1 _appleIDCountry];
  uint64_t v16 = v15;
  BOOL v17 = v15 != 0;
  if (v15)
  {
    v18 = [v15 uppercaseString];
    [v13 setObject:v18 forKeyedSubscript:@"AppleIDCountry"];

    id v19 = (void *)collectAnalyticsForFixationWithAppleMusicAsset_configuration__dateFormatter;
    id v20 = [MEMORY[0x1E4F1C9C8] now];
    uint64_t v21 = [v19 stringFromDate:v20];
    [v13 setObject:v21 forKeyedSubscript:@"DayOfEvent"];

    v22 = (void *)MEMORY[0x1E4F56658];
    v23 = (void *)[v13 copy];
    [v22 sendEvent:@"com.apple.photos.memory.appleMusicFixation" withPayload:v23];
  }
  return v17;
}

void __96__PXStoryExportManager_Analytics__collectAnalyticsForFixationWithAppleMusicAsset_configuration___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  id v1 = (void *)collectAnalyticsForFixationWithAppleMusicAsset_configuration__dateFormatter;
  collectAnalyticsForFixationWithAppleMusicAsset_configuration__dateFormatter = (uint64_t)v0;

  [(id)collectAnalyticsForFixationWithAppleMusicAsset_configuration__dateFormatter setDateFormat:@"yyyy-MM-dd"];
  uint64_t v2 = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:&unk_1F02D4D50];
  id v3 = (void *)collectAnalyticsForFixationWithAppleMusicAsset_configuration__topCPIDSet;
  collectAnalyticsForFixationWithAppleMusicAsset_configuration__topCPIDSet = v2;
}

+ (id)collectAnalyticsForExportBeginWithConfiguration:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F56658];
  id v5 = a3;
  uint64_t v6 = [v4 startSignpost];
  v11[0] = @"signpost";
  id v7 = [NSNumber numberWithLongLong:v6];
  v11[1] = @"payload";
  v12[0] = v7;
  id v8 = [a1 _defaultPayloadForConfiguration:v5];

  v12[1] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];

  return v9;
}

- (void).cxx_destruct
{
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (void)cancelAllExports
{
  id v2 = [(PXStoryExportManager *)self operationQueue];
  [v2 cancelAllOperations];
}

- (void)setMaxConcurrentExportCount:(int64_t)a3
{
  if (a3 <= 1) {
    int64_t v3 = 1;
  }
  else {
    int64_t v3 = a3;
  }
  id v4 = [(PXStoryExportManager *)self operationQueue];
  [v4 setMaxConcurrentOperationCount:v3];
}

- (void)setQualityOfService:(int64_t)a3
{
  if (self->_qualityOfService != a3)
  {
    self->_qualityOfService = a3;
    id v4 = [(PXStoryExportManager *)self operationQueue];
    [v4 setQualityOfService:a3];
  }
}

- (int64_t)maxConcurrentExportCount
{
  id v2 = [(PXStoryExportManager *)self operationQueue];
  int64_t v3 = [v2 maxConcurrentOperationCount];

  return v3;
}

- (id)requestExportWithDestinationURL:(id)a3 configuration:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [[_PXStoryExportOperation alloc] initWithURL:v10 configuration:v11 qualityOfService:[(PXStoryExportManager *)self qualityOfService] progressHandler:v12];
  objc_initWeak(&location, v14);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __104__PXStoryExportManager_requestExportWithDestinationURL_configuration_progressHandler_completionHandler___block_invoke;
  v18[3] = &unk_1E5DD1848;
  objc_copyWeak(&v20, &location);
  id v15 = v13;
  id v19 = v15;
  [(_PXStoryExportOperation *)v14 setCompletionBlock:v18];
  uint64_t v16 = [(PXStoryExportManager *)self operationQueue];
  [v16 addOperation:v14];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  return v14;
}

void __104__PXStoryExportManager_requestExportWithDestinationURL_configuration_progressHandler_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    int64_t v3 = [WeakRetained error];
    [v4 status];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (PXStoryExportManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)PXStoryExportManager;
  id v2 = [(PXStoryExportManager *)&v6 init];
  if (v2)
  {
    int64_t v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = v3;

    v2->_qualityOfService = -1;
    [(NSOperationQueue *)v2->_operationQueue setQualityOfService:-1];
    [(NSOperationQueue *)v2->_operationQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v2->_operationQueue setName:@"com.apple.PXStoryExportManager.operationQueue"];
  }
  return v2;
}

+ (OS_os_log)frequentSignpostLog
{
  if (frequentSignpostLog_onceToken != -1) {
    dispatch_once(&frequentSignpostLog_onceToken, &__block_literal_global_229564);
  }
  id v2 = (void *)frequentSignpostLog_log;
  return (OS_os_log *)v2;
}

void __43__PXStoryExportManager_frequentSignpostLog__block_invoke()
{
  id v0 = [MEMORY[0x1E4FB1438] sharedApplication];
  int v1 = [v0 launchedToTest];

  if (v1)
  {
    os_log_t v2 = os_log_create((const char *)*MEMORY[0x1E4F8C518], "FrequentStoryExportSignPost");
  }
  else
  {
    os_log_t v2 = (os_log_t)MEMORY[0x1E4F14508];
    id v3 = MEMORY[0x1E4F14508];
  }
  id v4 = (void *)frequentSignpostLog_log;
  frequentSignpostLog_log = (uint64_t)v2;
}

@end