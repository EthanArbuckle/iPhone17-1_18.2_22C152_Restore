@interface SSMetricsTimingDefaults
+ (id)sharedInstance;
+ (id)sharedInstanceWithSessionDelegate:(id)a3;
- (BOOL)isRunningTests;
- (NSDictionary)cachedValues;
- (NSDictionary)values;
- (SSCoalescingQueue)updateQueue;
- (SSMetricsTimingDefaults)initWithSessionDelegate:(id)a3;
- (double)samplingPercentageCachedResponsesLoadURL;
- (double)samplingPercentageUsersLoadURL;
- (double)samplingPercentageUsersPageRender;
- (double)sessionDurationLoadURL;
- (double)sessionDurationPageRender;
- (void)setCachedValues:(id)a3;
- (void)setRunningTests:(BOOL)a3;
- (void)setUpdateQueue:(id)a3;
- (void)update;
@end

@implementation SSMetricsTimingDefaults

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_26);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

void __41__SSMetricsTimingDefaults_sharedInstance__block_invoke()
{
  v0 = [[SSMetricsTimingDefaults alloc] initWithSessionDelegate:0];
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;
}

+ (id)sharedInstanceWithSessionDelegate:(id)a3
{
  id v3 = a3;
  v4 = [[SSMetricsTimingDefaults alloc] initWithSessionDelegate:v3];

  return v4;
}

- (SSMetricsTimingDefaults)initWithSessionDelegate:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SSMetricsTimingDefaults;
  v5 = [(SSMetricsTimingDefaults *)&v16 init];
  if (v5)
  {
    v6 = (NSDictionary *)CFPreferencesCopyAppValue(@"NetworkTimingMetrics", @"com.apple.itunesstored");
    cachedValues = v5->_cachedValues;
    v5->_cachedValues = v6;

    objc_initWeak(&location, v5);
    v8 = [SSCoalescingQueue alloc];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __51__SSMetricsTimingDefaults_initWithSessionDelegate___block_invoke;
    v12[3] = &unk_1E5BA8860;
    objc_copyWeak(&v14, &location);
    id v13 = v4;
    uint64_t v9 = [(SSCoalescingQueue *)v8 initWithBlock:v12];
    updateQueue = v5->_updateQueue;
    v5->_updateQueue = (SSCoalescingQueue *)v9;

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return v5;
}

void __51__SSMetricsTimingDefaults_initWithSessionDelegate___block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (*(void *)(a1 + 32) && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v3 = [*(id *)(a1 + 32) bag];
  }
  else
  {
    id v3 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && [*(id *)(a1 + 32) isURLBagRequest])
  {
    id v4 = +[SSLogConfig sharediTunesStoreConfig];
    if (!v4)
    {
      id v4 = +[SSLogConfig sharedConfig];
    }
    int v5 = [v4 shouldLog];
    if ([v4 shouldLogToDisk]) {
      int v6 = v5 | 2;
    }
    else {
      int v6 = v5;
    }
    v7 = [v4 OSLogObject];
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      v6 &= 2u;
    }
    if (v6)
    {
      *(_DWORD *)v36 = 138412290;
      *(void *)&v36[4] = objc_opt_class();
      id v8 = *(id *)&v36[4];
      LODWORD(v35) = 12;
      v34 = v36;
      uint64_t v9 = (void *)_os_log_send_and_compose_impl();

      if (!v9)
      {
LABEL_18:

        objc_super v16 = 0;
        goto LABEL_36;
      }
      v7 = objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, v36, v35, *(_OWORD *)v36);
      free(v9);
      SSFileLog(v4, @"%@", v10, v11, v12, v13, v14, v15, (uint64_t)v7);
    }

    goto LABEL_18;
  }
  if (!v3)
  {
    v17 = +[SSURLBagContext contextWithBagType:0];
    if (SSIsDaemon())
    {
      uint64_t v29 = SSViTunesStoreFramework();
      v30 = objc_msgSend(SSVWeakLinkedClassForString(&cfstr_Isurlbagcache.isa, v29), "sharedCache");
      v20 = [v30 URLBagForContext:v17];

      [v20 valueForKey:@"metrics"];
    }
    else
    {
      v20 = +[SSURLBag URLBagForContext:v17];
      [v20 valueForKey:@"metrics" error:0];
    objc_super v16 = };
    goto LABEL_34;
  }
  objc_super v16 = [v3 dictionaryForKey:@"metrics" error:0];
  v17 = +[SSLogConfig sharediTunesStoreConfig];
  if (!v17)
  {
    v17 = +[SSLogConfig sharedConfig];
  }
  int v18 = [v17 shouldLog];
  if ([v17 shouldLogToDisk]) {
    int v19 = v18 | 2;
  }
  else {
    int v19 = v18;
  }
  v20 = [v17 OSLogObject];
  if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
    v19 &= 2u;
  }
  if (!v19) {
    goto LABEL_34;
  }
  *(_DWORD *)v36 = 138412546;
  *(void *)&v36[4] = objc_opt_class();
  *(_WORD *)&v36[12] = 2112;
  *(void *)&v36[14] = v16;
  id v21 = *(id *)&v36[4];
  LODWORD(v35) = 22;
  v34 = v36;
  v22 = (void *)_os_log_send_and_compose_impl();

  if (v22)
  {
    v20 = objc_msgSend(NSString, "stringWithCString:encoding:", v22, 4, v36, v35, *(void *)v36, *(_OWORD *)&v36[8], v37);
    free(v22);
    SSFileLog(v17, @"%@", v23, v24, v25, v26, v27, v28, (uint64_t)v20);
LABEL_34:
  }
LABEL_36:
  v31 = objc_msgSend(v16, "objectForKeyedSubscript:", @"performance", v34);
  v32 = [WeakRetained cachedValues];
  char v33 = [v32 isEqualToDictionary:v31];

  if ((v33 & 1) == 0)
  {
    CFPreferencesSetAppValue(@"NetworkTimingMetrics", v31, @"com.apple.itunesstored");
    [WeakRetained setCachedValues:v31];
  }
}

- (NSDictionary)values
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__58;
  uint64_t v12 = __Block_byref_object_dispose__58;
  id v13 = 0;
  id v3 = [(SSMetricsTimingDefaults *)self updateQueue];
  id v4 = [v3 queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33__SSMetricsTimingDefaults_values__block_invoke;
  v7[3] = &unk_1E5BA6F30;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSDictionary *)v5;
}

void __33__SSMetricsTimingDefaults_values__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) cachedValues];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (double)sessionDurationLoadURL
{
  uint64_t v2 = [(SSMetricsTimingDefaults *)self values];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"sessionDuration"];
  [v3 doubleValue];
  double v5 = v4 / 1000.0;

  return v5;
}

- (double)samplingPercentageUsersLoadURL
{
  uint64_t v2 = [(SSMetricsTimingDefaults *)self values];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"samplingPercentageUsers"];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (double)samplingPercentageCachedResponsesLoadURL
{
  uint64_t v2 = [(SSMetricsTimingDefaults *)self values];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"samplingPercentageCachedResponses"];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (double)sessionDurationPageRender
{
  uint64_t v2 = [(SSMetricsTimingDefaults *)self values];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"sessionDurationPageRender"];
  [v3 doubleValue];
  double v5 = v4 / 1000.0;

  return v5;
}

- (double)samplingPercentageUsersPageRender
{
  uint64_t v2 = [(SSMetricsTimingDefaults *)self values];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"samplingPercentageUsersPageRender"];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (void)update
{
  if (![(SSMetricsTimingDefaults *)self isRunningTests])
  {
    id v3 = [(SSMetricsTimingDefaults *)self updateQueue];
    [v3 executeBlock];
  }
}

- (SSCoalescingQueue)updateQueue
{
  return self->_updateQueue;
}

- (void)setUpdateQueue:(id)a3
{
}

- (NSDictionary)cachedValues
{
  return self->_cachedValues;
}

- (void)setCachedValues:(id)a3
{
}

- (BOOL)isRunningTests
{
  return self->_runningTests;
}

- (void)setRunningTests:(BOOL)a3
{
  self->_runningTests = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedValues, 0);
  objc_storeStrong((id *)&self->_updateQueue, 0);
}

@end