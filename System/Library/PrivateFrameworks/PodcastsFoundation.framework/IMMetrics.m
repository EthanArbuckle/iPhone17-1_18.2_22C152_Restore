@interface IMMetrics
+ (BOOL)canRecordEvent;
+ (double)endTimer:(id)a3;
+ (double)endTimer:(id)a3 dataSource:(id)a4;
+ (double)endTimer:(id)a3 dataSource:(id)a4 withData:(id)a5;
+ (id)defaultMetricsController;
+ (id)flushImmediately;
+ (id)keyForTimerName:(id)a3 dataSource:(id)a4;
+ (id)metricsControllerForTopic:(id)a3;
+ (void)addMetricsController:(id)a3;
+ (void)cancelFlush;
+ (void)initialize;
+ (void)recordEvent:(id)a3;
+ (void)recordEvent:(id)a3 dataSource:(id)a4 data:(id)a5;
+ (void)recordEvent:(id)a3 dataSource:(id)a4 data:(id)a5 topic:(id)a6;
+ (void)recordEvent:(id)a3 topic:(id)a4;
+ (void)recordEvent:(id)a3 with:(id)a4;
+ (void)recordMemory:(id)a3;
+ (void)recordUserAction:(id)a3;
+ (void)recordUserAction:(id)a3 dataSource:(id)a4;
+ (void)recordUserAction:(id)a3 dataSource:(id)a4 withData:(id)a5;
+ (void)removeMetricsController:(id)a3;
+ (void)setDefaultMetricsController:(id)a3;
+ (void)setLogLevel:(int)a3;
+ (void)setupEvent:(id)a3 forDataSource:(id)a4;
+ (void)startTimer:(id)a3;
+ (void)startTimer:(id)a3 dataSource:(id)a4;
@end

@implementation IMMetrics

+ (void)recordEvent:(id)a3 dataSource:(id)a4 data:(id)a5
{
}

+ (void)recordEvent:(id)a3 dataSource:(id)a4 data:(id)a5 topic:(id)a6
{
  id v14 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  v13 = objc_opt_new();
  [v13 setProperty:v12 forBodyKey:@"eventType"];

  [a1 setupEvent:v13 forDataSource:v11];
  if (v14) {
    objc_msgSend(v13, "im_addPropertiesWithDictionary:", v14);
  }
  [a1 recordEvent:v13 topic:v10];
}

+ (void)setupEvent:(id)a3 forDataSource:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  v6 = [v5 metricsContentIdentifier];
  objc_msgSend(v8, "im_setContentIdentifier:", v6);

  if (objc_opt_respondsToSelector())
  {
    v7 = [v5 metricsAdditionalData];
    if (v7) {
      objc_msgSend(v8, "im_addPropertiesWithDictionary:", v7);
    }
  }
}

uint64_t __30__IMMetrics_recordEvent_with___block_invoke(id *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (([a1[6] canRecordEvent] & 1) != 0
    || (uint64_t result = [a1[4] shouldIgnoreDNU], result))
  {
    objc_msgSend(a1[5], "im_setToken:", _token);
    int v3 = _logLevel;
    v4 = _MTLogCategoryMetrics();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (v3 == 2)
    {
      if (v5)
      {
        id v6 = a1[5];
        int v8 = 138412290;
        v9 = v6;
        _os_log_impl(&dword_1AC9D5000, v4, OS_LOG_TYPE_DEFAULT, "Record event - %@", (uint8_t *)&v8, 0xCu);
      }
    }
    else if (v5)
    {
      v7 = [a1[5] shortDescription];
      int v8 = 138412290;
      v9 = v7;
      _os_log_impl(&dword_1AC9D5000, v4, OS_LOG_TYPE_DEFAULT, "Record event - %@", (uint8_t *)&v8, 0xCu);
    }
    return [a1[4] recordEvent:a1[5]];
  }
  return result;
}

+ (BOOL)canRecordEvent
{
  return [MEMORY[0x1E4F4DE08] onDeviceDiagnosticsAllowed];
}

+ (id)defaultMetricsController
{
  return (id)_metricsController;
}

+ (void)recordEvent:(id)a3
{
  id v4 = a3;
  id v5 = [a1 defaultMetricsController];
  [a1 recordEvent:v4 with:v5];
}

+ (void)recordEvent:(id)a3 topic:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  v7 = [a1 metricsControllerForTopic:v6];
  if (!v7 && _logLevel) {
    NSLog(&cfstr_RecodingAnEven.isa, v6);
  }
  if ([v7 shouldSuppressUserInfo]) {
    [v8 setAccount:0];
  }
  [a1 recordEvent:v8 with:v7];
}

+ (void)recordEvent:(id)a3 with:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __30__IMMetrics_recordEvent_with___block_invoke;
  aBlock[3] = &unk_1E5E61458;
  id v13 = v6;
  id v14 = a1;
  id v12 = v7;
  id v8 = v6;
  id v9 = v7;
  uint64_t v10 = _Block_copy(aBlock);
  dispatch_async((dispatch_queue_t)_metricsQueue, v10);
}

+ (id)metricsControllerForTopic:(id)a3
{
  if (a3) {
    objc_msgSend((id)_metricsControllersByTopic, "objectForKeyedSubscript:");
  }
  else {
  int v3 = [a1 defaultMetricsController];
  }
  return v3;
}

+ (void)setDefaultMetricsController:(id)a3
{
  id v4 = a3;
  if (_metricsController) {
    objc_msgSend(a1, "removeMetricsController:");
  }
  id v5 = (void *)_metricsController;
  _metricsController = (uint64_t)v4;
  id v6 = v4;

  [a1 addMetricsController:v6];
}

+ (void)addMetricsController:(id)a3
{
  if (a3)
  {
    int v3 = (void *)_metricsControllersByTopic;
    id v4 = a3;
    id v5 = [v4 topic];
    [v3 setObject:v4 forKeyedSubscript:v5];
  }
}

+ (void)recordUserAction:(id)a3 dataSource:(id)a4 withData:(id)a5
{
  id v11 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = objc_opt_new();
  [v10 setPageType:v9];

  [a1 setupEvent:v10 forDataSource:v8];
  if (v11) {
    objc_msgSend(v10, "im_addPropertiesWithDictionary:", v11);
  }
  [a1 recordEvent:v10];
}

+ (double)endTimer:(id)a3 dataSource:(id)a4 withData:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [a1 keyForTimerName:v8 dataSource:v9];
  id v12 = [(id)_metricsTimers objectForKeyedSubscript:v11];
  if (v12)
  {
    [(id)_metricsTimers removeObjectForKey:v11];
    [v12 doubleValue];
    double v14 = v13;
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v16 = v15 - v14;
    v17 = objc_opt_new();
    objc_msgSend(v17, "im_setName:", v8);
    [v17 setDuration:v16];
    [a1 setupEvent:v17 forDataSource:v9];
    if (v10) {
      objc_msgSend(v17, "im_addPropertiesWithDictionary:", v10);
    }
    [a1 recordEvent:v17];
  }
  else
  {
    double v16 = 0.0;
  }

  return v16;
}

+ (void)startTimer:(id)a3 dataSource:(id)a4
{
  id v8 = a3;
  id v5 = objc_msgSend(a1, "keyForTimerName:dataSource:");
  id v6 = [(id)_metricsTimers objectForKey:v5];

  if (v6) {
    NSLog(&cfstr_ATimerNamedAlr.isa, v8);
  }
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  id v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithDouble:");
  [(id)_metricsTimers setObject:v7 forKeyedSubscript:v5];
}

+ (id)keyForTimerName:(id)a3 dataSource:(id)a4
{
  id v5 = NSString;
  id v6 = a3;
  id v7 = [a4 metricsContentIdentifier];
  id v8 = [v5 stringWithFormat:@"%@_%@", v6, v7];

  return v8;
}

+ (double)endTimer:(id)a3 dataSource:(id)a4
{
  [a1 endTimer:a3 dataSource:a4 withData:0];
  return result;
}

+ (double)endTimer:(id)a3
{
  [a1 endTimer:a3 dataSource:0];
  return result;
}

+ (void)startTimer:(id)a3
{
}

+ (void)initialize
{
  v15.receiver = a1;
  v15.super_class = (Class)&OBJC_METACLASS___IMMetrics;
  objc_msgSendSuper2(&v15, sel_initialize);
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  int v3 = (void *)_metricsTimers;
  _metricsTimers = (uint64_t)v2;

  _logLevel = 0;
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v5 = [v4 objectForKey:@"IMMetricsDeviceToken"];
  id v6 = (void *)_token;
  _token = v5;

  if (!_token)
  {
    id v7 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v8 = [v7 UUIDString];
    id v9 = (void *)_token;
    _token = v8;

    [v4 setObject:_token forKey:@"IMMetricsDeviceToken"];
    [v4 synchronize];
  }
  uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
  id v11 = (void *)_metricsControllersByTopic;
  _metricsControllersByTopic = v10;

  id v12 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  dispatch_queue_t v13 = dispatch_queue_create("com.apple.podcasts.IMMetrics.metricsQueue", v12);
  double v14 = (void *)_metricsQueue;
  _metricsQueue = (uint64_t)v13;
}

+ (id)flushImmediately
{
  id v2 = _MTLogCategoryMetrics();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1AC9D5000, v2, OS_LOG_TYPE_DEFAULT, "Flush immediately", v7, 2u);
  }

  int v3 = [(id)_metricsControllersByTopic allValues];
  id v4 = objc_msgSend(v3, "ams_mapWithTransformIgnoresNil:", &__block_literal_global_20);

  if ([v4 count]) {
    [MEMORY[0x1E4F4DDD0] promiseWithFlattenedPromises:v4];
  }
  else {
  uint64_t v5 = [MEMORY[0x1E4F4DDD0] promiseWithResult:&unk_1F03D8958];
  }

  return v5;
}

uint64_t __29__IMMetrics_flushImmediately__block_invoke(uint64_t a1, void *a2)
{
  return [a2 flushImmediately];
}

+ (void)cancelFlush
{
  id v2 = _MTLogCategoryMetrics();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1AC9D5000, v2, OS_LOG_TYPE_DEFAULT, "Cancel flush", v4, 2u);
  }

  int v3 = [(id)_metricsControllersByTopic allValues];
  [v3 makeObjectsPerformSelector:sel_cancel];
}

+ (void)removeMetricsController:(id)a3
{
  if (a3)
  {
    int v3 = (void *)_metricsControllersByTopic;
    id v4 = [a3 topic];
    [v3 removeObjectForKey:v4];
  }
}

+ (void)setLogLevel:(int)a3
{
  _logLevel = a3;
}

+ (void)recordUserAction:(id)a3
{
}

+ (void)recordUserAction:(id)a3 dataSource:(id)a4
{
}

+ (void)recordMemory:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_opt_new();
  objc_msgSend(v5, "im_setName:", v4);

  [a1 recordEvent:v5];
}

@end