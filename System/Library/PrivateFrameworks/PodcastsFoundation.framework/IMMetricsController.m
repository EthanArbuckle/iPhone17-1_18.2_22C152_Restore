@interface IMMetricsController
+ (id)queue;
- (AMSMetrics)metricsController;
- (BOOL)isLoading;
- (BOOL)shouldIgnoreDNU;
- (BOOL)shouldSuppressUserInfo;
- (IMMetricsController)initWithTopic:(id)a3;
- (NSString)topic;
- (id)flushImmediately;
- (void)addAdditionalFieldsToEvent:(id)a3 completion:(id)a4;
- (void)getMetricsController:(id)a3;
- (void)recordEvent:(id)a3;
- (void)setIsLoading:(BOOL)a3;
- (void)setMetricsController:(id)a3;
- (void)setShouldIgnoreDNU:(BOOL)a3;
- (void)setShouldSuppressUserInfo:(BOOL)a3;
- (void)setTopic:(id)a3;
@end

@implementation IMMetricsController

void __61__IMMetricsController_addAdditionalFieldsToEvent_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [*(id *)(a1 + 32) setObject:v5 forKey:v6];
  }
}

- (void)addAdditionalFieldsToEvent:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v8 = +[IMNetworkObserver sharedInstance];
  v9 = [v8 connectionTypeHeader];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v10 = v9;
  }
  else {
    v10 = @"unknown";
  }
  [v7 setObject:v10 forKey:@"connection"];
  v11 = (void *)MEMORY[0x1E4F4DE90];
  v12 = [MEMORY[0x1E4F4DDC8] currentProcess];
  v13 = [v11 userAgentForProcessInfo:v12];

  if ([v13 length]) {
    [v7 setObject:v13 forKey:@"userAgent"];
  }
  v14 = +[IMURLBag sharedInstance];
  v15 = [v14 metricsDictionary];
  v16 = [(id)objc_opt_class() queue];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __61__IMMetricsController_addAdditionalFieldsToEvent_completion___block_invoke;
  v20[3] = &unk_1E5E631C8;
  id v21 = v5;
  id v22 = v7;
  id v23 = v6;
  id v17 = v6;
  id v18 = v7;
  id v19 = v5;
  [v15 asyncValueOnQueue:v16 withCompletion:v20];
}

+ (id)queue
{
  if (queue_onceToken[0] != -1) {
    dispatch_once(queue_onceToken, &__block_literal_global_16);
  }
  v2 = (void *)queue_queue;
  return v2;
}

void __61__IMMetricsController_addAdditionalFieldsToEvent_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a4;
  if (v7)
  {
    v8 = _IMStoreLogCategoryDefault();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v7;
      _os_log_impl(&dword_1AC9D5000, v8, OS_LOG_TYPE_ERROR, "Failed to fetch metrics dictionary with error %@", buf, 0xCu);
    }

    [*(id *)(a1 + 32) addPropertiesWithDictionary:*(void *)(a1 + 40)];
    uint64_t v9 = *(void *)(a1 + 48);
    if (v9) {
      (*(void (**)(void))(v9 + 16))();
    }
  }
  else
  {
    v10 = [v6 objectForKey:@"metricsBase"];
    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = [v6 objectForKey:@"fields"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v18[0] = MEMORY[0x1E4F143A8];
          v18[1] = 3221225472;
          v18[2] = __61__IMMetricsController_addAdditionalFieldsToEvent_completion___block_invoke_37;
          v18[3] = &unk_1E5E631A0;
          id v19 = *(id *)(a1 + 40);
          [v11 enumerateKeysAndObjectsUsingBlock:v18];
        }
      }
    }
    if (v10)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v13 = MEMORY[0x1E4F143A8];
        uint64_t v14 = 3221225472;
        v15 = __61__IMMetricsController_addAdditionalFieldsToEvent_completion___block_invoke_2;
        v16 = &unk_1E5E631A0;
        id v17 = *(id *)(a1 + 40);
        [v10 enumerateKeysAndObjectsUsingBlock:&v13];
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "addPropertiesWithDictionary:", *(void *)(a1 + 40), v13, v14, v15, v16);
    uint64_t v12 = *(void *)(a1 + 48);
    if (v12) {
      (*(void (**)(void))(v12 + 16))();
    }
  }
}

- (void)recordEvent:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__IMMetricsController_recordEvent___block_invoke;
  v6[3] = &unk_1E5E63178;
  id v7 = v4;
  v8 = self;
  id v5 = v4;
  [(IMMetricsController *)self getMetricsController:v6];
}

- (void)getMetricsController:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  id v5 = [(IMMetricsController *)self metricsController];

  if (v5)
  {
    id v6 = [(IMMetricsController *)self metricsController];
    v4[2](v4, v6);
  }
  else
  {
    id v7 = [(id)objc_opt_class() queue];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __44__IMMetricsController_getMetricsController___block_invoke;
    v8[3] = &unk_1E5E61408;
    v8[4] = self;
    uint64_t v9 = v4;
    dispatch_async(v7, v8);
  }
}

- (AMSMetrics)metricsController
{
  return self->_metricsController;
}

void __35__IMMetricsController_recordEvent___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = +[PFClientUtil clientBundleVersion];
  [v4 setAppVersion:v5];

  id v6 = *(void **)(a1 + 32);
  id v7 = [*(id *)(a1 + 40) topic];
  [v6 setTopic:v7];

  [*(id *)(a1 + 32) setAnonymous:1];
  uint64_t v10 = a1 + 32;
  v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void **)(v10 + 8);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __35__IMMetricsController_recordEvent___block_invoke_2;
  v12[3] = &unk_1E5E615A8;
  id v13 = v3;
  id v14 = v8;
  id v11 = v3;
  [v9 addAdditionalFieldsToEvent:v8 completion:v12];
}

- (NSString)topic
{
  return self->_topic;
}

uint64_t __35__IMMetricsController_recordEvent___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) enqueueEvent:*(void *)(a1 + 40)];
}

- (BOOL)shouldSuppressUserInfo
{
  return self->_shouldSuppressUserInfo;
}

- (IMMetricsController)initWithTopic:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)IMMetricsController;
  id v5 = [(IMMetricsController *)&v8 init];
  id v6 = v5;
  if (v5)
  {
    [(IMMetricsController *)v5 setTopic:v4];
    [(IMMetricsController *)v6 setIsLoading:0];
    [(IMMetricsController *)v6 setShouldIgnoreDNU:0];
    [(IMMetricsController *)v6 setShouldSuppressUserInfo:0];
  }

  return v6;
}

- (void)setShouldSuppressUserInfo:(BOOL)a3
{
  self->_shouldSuppressUserInfo = a3;
}

- (void)setShouldIgnoreDNU:(BOOL)a3
{
  self->_shouldIgnoreDNU = a3;
}

- (void)setTopic:(id)a3
{
}

- (void)setIsLoading:(BOOL)a3
{
  self->_isLoading = a3;
}

void __44__IMMetricsController_getMetricsController___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) metricsController];

  if (!v2)
  {
    id v3 = +[IMURLBag sharedInstance];
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F4DD58]) initWithContainerID:@"com.apple.podcasts" bag:v3];
    [*(id *)(a1 + 32) setMetricsController:v4];
  }
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = [*(id *)(a1 + 32) metricsController];
  (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
}

- (void)setMetricsController:(id)a3
{
}

void __28__IMMetricsController_queue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  dispatch_queue_t v0 = dispatch_queue_create("IMMetricsController", v2);
  v1 = (void *)queue_queue;
  queue_queue = (uint64_t)v0;
}

- (id)flushImmediately
{
  id v3 = [(IMMetricsController *)self metricsController];

  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F4DDD0]);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __39__IMMetricsController_flushImmediately__block_invoke;
    aBlock[3] = &unk_1E5E615A8;
    aBlock[4] = self;
    id v5 = v4;
    id v15 = v5;
    id v6 = _Block_copy(aBlock);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __39__IMMetricsController_flushImmediately__block_invoke_12;
    v12[3] = &unk_1E5E63150;
    id v13 = v6;
    id v7 = v6;
    objc_super v8 = _Block_copy(v12);
    uint64_t v9 = [(id)objc_opt_class() queue];
    dispatch_async(v9, v8);

    id v10 = v5;
  }
  else
  {
    id v10 = 0;
  }
  return v10;
}

void __39__IMMetricsController_flushImmediately__block_invoke(uint64_t a1)
{
  v2 = _IMStoreLogCategoryDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1AC9D5000, v2, OS_LOG_TYPE_DEFAULT, "Start flushing metric events.", v6, 2u);
  }

  id v3 = [*(id *)(a1 + 32) metricsController];
  id v4 = [v3 flush];

  id v5 = *(void **)(a1 + 40);
  if (v4)
  {
    [v5 finishWithPromise:v4];
    [v4 addErrorBlock:&__block_literal_global_6_0];
    [v4 addFinishBlock:&__block_literal_global_10];
  }
  else
  {
    [v5 finishWithResult:&unk_1F03D8700];
  }
}

void __39__IMMetricsController_flushImmediately__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = _IMStoreLogCategoryDefault();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_1AC9D5000, v3, OS_LOG_TYPE_ERROR, "Error flushing metric events: %@", (uint8_t *)&v4, 0xCu);
  }
}

void __39__IMMetricsController_flushImmediately__block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = _IMStoreLogCategoryDefault();
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412546;
      id v13 = v4;
      __int16 v14 = 2112;
      id v15 = v5;
      objc_super v8 = "Finished flushing %@ metric events. Error: %@";
      uint64_t v9 = v7;
      os_log_type_t v10 = OS_LOG_TYPE_ERROR;
      uint32_t v11 = 22;
LABEL_6:
      _os_log_impl(&dword_1AC9D5000, v9, v10, v8, (uint8_t *)&v12, v11);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v4;
    objc_super v8 = "Finished flushing %@ metric events.";
    uint64_t v9 = v7;
    os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
    uint32_t v11 = 12;
    goto LABEL_6;
  }
}

uint64_t __39__IMMetricsController_flushImmediately__block_invoke_12(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __61__IMMetricsController_addAdditionalFieldsToEvent_completion___block_invoke_37(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [*(id *)(a1 + 32) setObject:v5 forKey:v6];
  }
}

- (BOOL)shouldIgnoreDNU
{
  return self->_shouldIgnoreDNU;
}

- (BOOL)isLoading
{
  return self->_isLoading;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricsController, 0);
  objc_storeStrong((id *)&self->_topic, 0);
}

@end