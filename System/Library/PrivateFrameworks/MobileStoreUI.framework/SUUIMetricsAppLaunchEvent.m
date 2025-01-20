@interface SUUIMetricsAppLaunchEvent
+ (double)processStartTime;
+ (id)consumePendingLaunchEvent;
+ (void)createPendingLaunchEvent;
+ (void)resetPendingLaunchEventForTesting;
+ (void)withPendingLaunchEvent:(id)a3;
- (BOOL)requiredBlockingBagLoad;
- (BOOL)usedBootstrapFallback;
- (NSDictionary)templateMetrics;
- (NSString)description;
- (NSString)launchCorrelationKey;
- (SUUIMetricsAppLaunchEvent)init;
- (double)bootstrapEndTime;
- (double)bootstrapStartTime;
- (double)clientConfigurationLoadTime;
- (double)initialTabRequestStartTime;
- (double)initialTabResponseEndTime;
- (double)initialTabResponseStartTime;
- (double)jsResourcesEndTime;
- (double)jsResourcesStartTime;
- (double)launchEndTime;
- (double)launchFailureTime;
- (double)mainTime;
- (void)addTemplateLoadTimingMetric:(id)a3 forURL:(id)a4;
- (void)appendPropertiesToBody:(id)a3;
- (void)populateObjectInspector:(id)a3;
- (void)setBootstrapEndTime:(double)a3;
- (void)setBootstrapStartTime:(double)a3;
- (void)setClientConfigurationLoadTime:(double)a3;
- (void)setInitialTabRequestStartTime:(double)a3;
- (void)setInitialTabResponseEndTime:(double)a3;
- (void)setInitialTabResponseStartTime:(double)a3;
- (void)setJsResourcesEndTime:(double)a3;
- (void)setJsResourcesStartTime:(double)a3;
- (void)setLaunchCorrelationKey:(id)a3;
- (void)setLaunchEndTime:(double)a3;
- (void)setLaunchFailureTime:(double)a3;
- (void)setMainTime:(double)a3;
- (void)setRequiredBlockingBagLoad:(BOOL)a3;
- (void)setUsedBootstrapFallback:(BOOL)a3;
@end

@implementation SUUIMetricsAppLaunchEvent

+ (void)withPendingLaunchEvent:(id)a3
{
  id v7 = a3;
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2 object:a1 file:@"SUUIMetricsAppLaunchEvent.m" lineNumber:53 description:@"Called off main thread."];
  }
  v5 = v7;
  if (_PendingLaunchEvent)
  {
    (*((void (**)(id))v7 + 2))(v7);
    v5 = v7;
  }
}

- (void)setMainTime:(double)a3
{
  id v4 = [(SSMetricsEvent *)self millisecondsFromTimeInterval:a3];
  [(SSMetricsMutableEvent *)self setProperty:v4 forBodyKey:@"mainTime"];
}

+ (void)createPendingLaunchEvent
{
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    id v4 = [MEMORY[0x263F08690] currentHandler];
    [v4 handleFailureInMethod:a2 object:a1 file:@"SUUIMetricsAppLaunchEvent.m" lineNumber:45 description:@"Called off main thread."];
  }
  if ((_HasConsumedPendingLaunchEvent & 1) == 0 && !_PendingLaunchEvent)
  {
    _PendingLaunchEvent = objc_alloc_init(SUUIMetricsAppLaunchEvent);
    MEMORY[0x270F9A758]();
  }
}

- (SUUIMetricsAppLaunchEvent)init
{
  v9.receiver = self;
  v9.super_class = (Class)SUUIMetricsAppLaunchEvent;
  v2 = [(SSMetricsBaseEvent *)&v9 init];
  v3 = v2;
  if (v2)
  {
    [(SSMetricsMutableEvent *)v2 setEventType:@"appLaunch"];
    [(SSMetricsMutableEvent *)v3 setTopic:@"xp_amp_clientperf"];
    id v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    templateMetrics = v3->_templateMetrics;
    v3->_templateMetrics = v4;

    v6 = [MEMORY[0x263F08C38] UUID];
    id v7 = [v6 UUIDString];
    [(SUUIMetricsAppLaunchEvent *)v3 setLaunchCorrelationKey:v7];
  }
  return v3;
}

- (void)setLaunchCorrelationKey:(id)a3
{
  id v4 = (id)[a3 copy];
  [(SSMetricsMutableEvent *)self setProperty:v4 forBodyKey:@"launchCorrelationKey"];
}

+ (void)resetPendingLaunchEventForTesting
{
  _HasConsumedPendingLaunchEvent = 0;
  v2 = (void *)_PendingLaunchEvent;
  _PendingLaunchEvent = 0;
}

+ (id)consumePendingLaunchEvent
{
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    id v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2 object:a1 file:@"SUUIMetricsAppLaunchEvent.m" lineNumber:61 description:@"Called off main thread."];
  }
  id v4 = (id)_PendingLaunchEvent;
  _HasConsumedPendingLaunchEvent = 1;
  v5 = (void *)_PendingLaunchEvent;
  _PendingLaunchEvent = 0;

  return v4;
}

+ (double)processStartTime
{
  if (processStartTime_onceToken != -1) {
    dispatch_once(&processStartTime_onceToken, &__block_literal_global_42);
  }
  return *(double *)&_ProcessStartTime;
}

uint64_t __45__SUUIMetricsAppLaunchEvent_processStartTime__block_invoke()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  *(void *)id v4 = 0xE00000001;
  int v5 = 1;
  pid_t v6 = getpid();
  memset(v3, 0, 512);
  size_t v2 = 648;
  uint64_t result = sysctl(v4, 4u, v3, &v2, 0, 0);
  if (result)
  {
    uint64_t result = SSDebugLog();
    double v1 = 0.0;
  }
  else
  {
    double v1 = (double)SDWORD2(v3[0]) / 1000000.0 + (double)*(uint64_t *)&v3[0];
  }
  _ProcessStartTime = *(void *)&v1;
  return result;
}

- (NSString)launchCorrelationKey
{
  size_t v2 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"launchCorrelationKey"];
  v3 = (void *)[v2 copy];

  return (NSString *)v3;
}

- (double)mainTime
{
  v3 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"mainTime"];
  [(SSMetricsEvent *)self timeIntervalFromMilliseconds:v3];
  double v5 = v4;

  return v5;
}

- (void)setClientConfigurationLoadTime:(double)a3
{
  id v4 = [(SSMetricsEvent *)self millisecondsFromTimeInterval:a3];
  [(SSMetricsMutableEvent *)self setProperty:v4 forBodyKey:@"clientConfigurationLoadTime"];
}

- (double)clientConfigurationLoadTime
{
  v3 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"clientConfigurationLoadTime"];
  [(SSMetricsEvent *)self timeIntervalFromMilliseconds:v3];
  double v5 = v4;

  return v5;
}

- (void)addTemplateLoadTimingMetric:(id)a3 forURL:(id)a4
{
  id v6 = a4;
  id v7 = (id)[a3 copy];
  [(NSMutableDictionary *)self->_templateMetrics setObject:v7 forKeyedSubscript:v6];
}

- (void)setBootstrapStartTime:(double)a3
{
  id v4 = [(SSMetricsEvent *)self millisecondsFromTimeInterval:a3];
  [(SSMetricsMutableEvent *)self setProperty:v4 forBodyKey:@"bootstrapStartTime"];
}

- (double)bootstrapStartTime
{
  v3 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"bootstrapStartTime"];
  [(SSMetricsEvent *)self timeIntervalFromMilliseconds:v3];
  double v5 = v4;

  return v5;
}

- (void)setBootstrapEndTime:(double)a3
{
  id v4 = [(SSMetricsEvent *)self millisecondsFromTimeInterval:a3];
  [(SSMetricsMutableEvent *)self setProperty:v4 forBodyKey:@"bootstrapEndTime"];
}

- (double)bootstrapEndTime
{
  v3 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"bootstrapEndTime"];
  [(SSMetricsEvent *)self timeIntervalFromMilliseconds:v3];
  double v5 = v4;

  return v5;
}

- (void)setJsResourcesStartTime:(double)a3
{
  id v4 = [(SSMetricsEvent *)self millisecondsFromTimeInterval:a3];
  [(SSMetricsMutableEvent *)self setProperty:v4 forBodyKey:@"jsResourcesStartTime"];
}

- (double)jsResourcesStartTime
{
  v3 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"jsResourcesStartTime"];
  [(SSMetricsEvent *)self timeIntervalFromMilliseconds:v3];
  double v5 = v4;

  return v5;
}

- (void)setJsResourcesEndTime:(double)a3
{
  id v4 = [(SSMetricsEvent *)self millisecondsFromTimeInterval:a3];
  [(SSMetricsMutableEvent *)self setProperty:v4 forBodyKey:@"jsResourcesEndTime"];
}

- (double)jsResourcesEndTime
{
  v3 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"jsResourcesEndTime"];
  [(SSMetricsEvent *)self timeIntervalFromMilliseconds:v3];
  double v5 = v4;

  return v5;
}

- (void)setInitialTabRequestStartTime:(double)a3
{
  id v4 = [(SSMetricsEvent *)self millisecondsFromTimeInterval:a3];
  [(SSMetricsMutableEvent *)self setProperty:v4 forBodyKey:@"initialTabRequestStartTime"];
}

- (double)initialTabRequestStartTime
{
  v3 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"initialTabRequestStartTime"];
  [(SSMetricsEvent *)self timeIntervalFromMilliseconds:v3];
  double v5 = v4;

  return v5;
}

- (void)setInitialTabResponseStartTime:(double)a3
{
  id v4 = [(SSMetricsEvent *)self millisecondsFromTimeInterval:a3];
  [(SSMetricsMutableEvent *)self setProperty:v4 forBodyKey:@"initialTabResponseStartTime"];
}

- (double)initialTabResponseStartTime
{
  v3 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"initialTabResponseStartTime"];
  [(SSMetricsEvent *)self timeIntervalFromMilliseconds:v3];
  double v5 = v4;

  return v5;
}

- (void)setInitialTabResponseEndTime:(double)a3
{
  id v4 = [(SSMetricsEvent *)self millisecondsFromTimeInterval:a3];
  [(SSMetricsMutableEvent *)self setProperty:v4 forBodyKey:@"initialTabResponseEndTime"];
}

- (double)initialTabResponseEndTime
{
  v3 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"initialTabResponseEndTime"];
  [(SSMetricsEvent *)self timeIntervalFromMilliseconds:v3];
  double v5 = v4;

  return v5;
}

- (void)setLaunchFailureTime:(double)a3
{
  id v4 = [(SSMetricsEvent *)self millisecondsFromTimeInterval:a3];
  [(SSMetricsMutableEvent *)self setProperty:v4 forBodyKey:@"launchFailureTime"];
}

- (double)launchFailureTime
{
  v3 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"launchFailureTime"];
  [(SSMetricsEvent *)self timeIntervalFromMilliseconds:v3];
  double v5 = v4;

  return v5;
}

- (void)setLaunchEndTime:(double)a3
{
  id v4 = [(SSMetricsEvent *)self millisecondsFromTimeInterval:a3];
  [(SSMetricsMutableEvent *)self setProperty:v4 forBodyKey:@"launchEndTime"];
}

- (double)launchEndTime
{
  v3 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"launchEndTime"];
  [(SSMetricsEvent *)self timeIntervalFromMilliseconds:v3];
  double v5 = v4;

  return v5;
}

- (void)setRequiredBlockingBagLoad:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(SSMetricsMutableEvent *)self setProperty:v4 forBodyKey:@"requiredBlockingBagLoad"];
}

- (BOOL)requiredBlockingBagLoad
{
  size_t v2 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"requiredBlockingBagLoad"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setUsedBootstrapFallback:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(SSMetricsMutableEvent *)self setProperty:v4 forBodyKey:@"usedBootstrapFallback"];
}

- (BOOL)usedBootstrapFallback
{
  size_t v2 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"usedBootstrapFallback"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)appendPropertiesToBody:(id)a3
{
  id v4 = a3;
  if ([(NSMutableDictionary *)self->_templateMetrics count])
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    templateMetrics = self->_templateMetrics;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __52__SUUIMetricsAppLaunchEvent_appendPropertiesToBody___block_invoke;
    v10[3] = &unk_265406AB8;
    id v11 = v5;
    id v7 = v5;
    [(NSMutableDictionary *)templateMetrics enumerateKeysAndObjectsUsingBlock:v10];
    [v4 setObject:v7 forKeyedSubscript:@"templateMetrics"];
  }
  [(id)objc_opt_class() processStartTime];
  v8 = -[SSMetricsEvent millisecondsFromTimeInterval:](self, "millisecondsFromTimeInterval:");
  [v4 setObject:v8 forKeyedSubscript:@"processStartTime"];

  v9.receiver = self;
  v9.super_class = (Class)SUUIMetricsAppLaunchEvent;
  [(SSMetricsMutableEvent *)&v9 appendPropertiesToBody:v4];
}

void __52__SUUIMetricsAppLaunchEvent_appendPropertiesToBody___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v8 = [a3 dictionaryRepresentation];
  id v6 = *(void **)(a1 + 32);
  id v7 = [v5 absoluteString];

  [v6 setObject:v8 forKeyedSubscript:v7];
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  v28.receiver = self;
  v28.super_class = (Class)SUUIMetricsAppLaunchEvent;
  id v4 = [(SSMetricsBaseEvent *)&v28 description];
  [v3 appendString:v4];

  id v5 = [(SUUIMetricsAppLaunchEvent *)self launchCorrelationKey];
  [v3 appendFormat:@"\nlaunchCorrelationKey = %@", v5];

  [(id)objc_opt_class() processStartTime];
  objc_msgSend(v3, "appendFormat:", @"\nprocessStartTime = %f", v6);
  [(SUUIMetricsAppLaunchEvent *)self mainTime];
  objc_msgSend(v3, "appendFormat:", @"\nmainTime = %f", v7);
  [(SUUIMetricsAppLaunchEvent *)self clientConfigurationLoadTime];
  objc_msgSend(v3, "appendFormat:", @"\nclientConfigurationLoadTime = %f", v8);
  objc_msgSend(v3, "appendString:", @"\ntemplateMetrics = (");
  templateMetrics = self->_templateMetrics;
  uint64_t v23 = MEMORY[0x263EF8330];
  uint64_t v24 = 3221225472;
  v25 = __40__SUUIMetricsAppLaunchEvent_description__block_invoke;
  v26 = &unk_265406AB8;
  id v10 = v3;
  id v27 = v10;
  [(NSMutableDictionary *)templateMetrics enumerateKeysAndObjectsUsingBlock:&v23];
  [v10 appendString:@"\n"]);
  [(SUUIMetricsAppLaunchEvent *)self bootstrapStartTime];
  objc_msgSend(v10, "appendFormat:", @"\nbootstrapStartTime = %f", v11, v23, v24, v25, v26);
  [(SUUIMetricsAppLaunchEvent *)self bootstrapEndTime];
  objc_msgSend(v10, "appendFormat:", @"\nbootstrapEndTime = %f", v12);
  [(SUUIMetricsAppLaunchEvent *)self jsResourcesStartTime];
  objc_msgSend(v10, "appendFormat:", @"\njsResourcesStartTime = %f", v13);
  [(SUUIMetricsAppLaunchEvent *)self jsResourcesEndTime];
  objc_msgSend(v10, "appendFormat:", @"\njsResourcesEndTime = %f", v14);
  [(SUUIMetricsAppLaunchEvent *)self initialTabRequestStartTime];
  objc_msgSend(v10, "appendFormat:", @"\ninitialTabRequestStartTime = %f", v15);
  [(SUUIMetricsAppLaunchEvent *)self initialTabResponseStartTime];
  objc_msgSend(v10, "appendFormat:", @"\ninitialTabResponseStartTime = %f", v16);
  [(SUUIMetricsAppLaunchEvent *)self initialTabResponseEndTime];
  objc_msgSend(v10, "appendFormat:", @"\ninitialTabResponseEndTime = %f", v17);
  [(SUUIMetricsAppLaunchEvent *)self launchFailureTime];
  objc_msgSend(v10, "appendFormat:", @"\nlaunchFailureTime = %f", v18);
  [(SUUIMetricsAppLaunchEvent *)self launchEndTime];
  objc_msgSend(v10, "appendFormat:", @"\nlaunchEndTime = %f", v19);
  if ([(SUUIMetricsAppLaunchEvent *)self requiredBlockingBagLoad]) {
    v20 = @"YES";
  }
  else {
    v20 = @"NO";
  }
  [v10 appendFormat:@"\nrequiredBlockingBagLoad = %@", v20];
  if ([(SUUIMetricsAppLaunchEvent *)self usedBootstrapFallback]) {
    v21 = @"YES";
  }
  else {
    v21 = @"NO";
  }
  [v10 appendFormat:@"\nusedBootstrapFallback = %@", v21];

  return (NSString *)v10;
}

uint64_t __40__SUUIMetricsAppLaunchEvent_description__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  [v5 appendString:@"\n\t{"];
  [*(id *)(a1 + 32) appendFormat:@"\n\t\ttemplateURL = %@", v7];

  uint64_t v8 = *(void **)(a1 + 32);
  [v6 requestStartTime];
  objc_msgSend(v8, "appendFormat:", @"\n\t\trequestStartTime = %f", v9);
  id v10 = *(void **)(a1 + 32);
  [v6 responseStartTime];
  objc_msgSend(v10, "appendFormat:", @"\n\t\tresponseStartTime = %f", v11);
  uint64_t v12 = *(void **)(a1 + 32);
  [v6 responseEndTime];
  objc_msgSend(v12, "appendFormat:", @"\n\t\tresponseEndTime = %f", v13);
  uint64_t v14 = *(void **)(a1 + 32);
  LODWORD(v5) = [v6 responseWasCached];

  uint64_t v15 = @"NO";
  if (v5) {
    uint64_t v15 = @"YES";
  }
  [v14 appendFormat:@"\n\t\tresponseWasCached = %@", v15];
  uint64_t v16 = *(void **)(a1 + 32);
  return [v16 appendString:@"\n\t},"];
}

- (void)populateObjectInspector:(id)a3
{
  id v4 = a3;
  [v4 setFriendlyName:@"App Launch Times"];
  [v4 setInformation:@"All times relative to process start time"];
  [(id)objc_opt_class() processStartTime];
  double v6 = v5;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__SUUIMetricsAppLaunchEvent_populateObjectInspector___block_invoke;
  aBlock[3] = &__block_descriptor_40_e18___NSString_16__0d8l;
  *(double *)&aBlock[4] = v5;
  id v7 = (void (**)(void))_Block_copy(aBlock);
  [v4 beginSectionWithFriendlyName:@"Process Stats"];
  uint64_t v8 = (void *)MEMORY[0x263F08790];
  uint64_t v9 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:v6];
  id v10 = [v8 localizedStringFromDate:v9 dateStyle:0 timeStyle:3];

  [v4 exposePropertyWithFriendlyName:@"Process Start Time" value:v10];
  [(SUUIMetricsAppLaunchEvent *)self mainTime];
  uint64_t v11 = v7 + 2;
  uint64_t v12 = v7[2](v7);
  [v4 exposePropertyWithFriendlyName:@"Main Time" value:v12];

  [(SUUIMetricsAppLaunchEvent *)self clientConfigurationLoadTime];
  uint64_t v13 = v7[2](v7);
  [v4 exposePropertyWithFriendlyName:@"Client Configuration Load Time" value:v13];

  [(SUUIMetricsAppLaunchEvent *)self launchFailureTime];
  uint64_t v14 = v7[2](v7);
  [v4 exposePropertyWithFriendlyName:@"Launch Failure Time" value:v14];

  [(SUUIMetricsAppLaunchEvent *)self launchEndTime];
  uint64_t v15 = v7[2](v7);
  [v4 exposePropertyWithFriendlyName:@"Launch End Time" value:v15];

  if ([(SUUIMetricsAppLaunchEvent *)self requiredBlockingBagLoad]) {
    uint64_t v16 = @"Yes";
  }
  else {
    uint64_t v16 = @"No";
  }
  [v4 exposePropertyWithFriendlyName:@"Required Blocking Bag Load" value:v16];
  if ([(SUUIMetricsAppLaunchEvent *)self usedBootstrapFallback]) {
    uint64_t v17 = @"Yes";
  }
  else {
    uint64_t v17 = @"No";
  }
  [v4 exposePropertyWithFriendlyName:@"Used Bootstrap Fallback" value:v17];
  [v4 endSection];
  [v4 beginSectionWithFriendlyName:@"App Resource Times"];
  [(SUUIMetricsAppLaunchEvent *)self bootstrapStartTime];
  uint64_t v18 = (*v11)(v7);
  [v4 exposePropertyWithFriendlyName:@"Bootstrap Start Time" value:v18];

  [(SUUIMetricsAppLaunchEvent *)self bootstrapEndTime];
  uint64_t v19 = (*v11)(v7);
  [v4 exposePropertyWithFriendlyName:@"Bootstrap End Time" value:v19];

  [(SUUIMetricsAppLaunchEvent *)self jsResourcesEndTime];
  v20 = (*v11)(v7);
  [v4 exposePropertyWithFriendlyName:@"JS Resources Start Time" value:v20];

  [(SUUIMetricsAppLaunchEvent *)self jsResourcesEndTime];
  v21 = (*v11)(v7);
  [v4 exposePropertyWithFriendlyName:@"JS Resources End Time" value:v21];

  [(SUUIMetricsAppLaunchEvent *)self initialTabRequestStartTime];
  v22 = (*v11)(v7);
  [v4 exposePropertyWithFriendlyName:@"Initial Tab Request Start Time" value:v22];

  [(SUUIMetricsAppLaunchEvent *)self initialTabResponseStartTime];
  uint64_t v23 = (*v11)(v7);
  [v4 exposePropertyWithFriendlyName:@"Initial Tab Response Start Time" value:v23];

  [(SUUIMetricsAppLaunchEvent *)self initialTabResponseEndTime];
  uint64_t v24 = (*v11)(v7);
  [v4 exposePropertyWithFriendlyName:@"Initial Tab Response End Time" value:v24];

  [v4 endSection];
  v25 = [(SUUIMetricsAppLaunchEvent *)self templateMetrics];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __53__SUUIMetricsAppLaunchEvent_populateObjectInspector___block_invoke_3;
  v28[3] = &unk_265406B20;
  id v29 = v4;
  id v30 = v7;
  id v31 = &__block_literal_global_168;
  id v26 = v4;
  id v27 = v7;
  [v25 enumerateKeysAndObjectsUsingBlock:v28];
}

__CFString *__53__SUUIMetricsAppLaunchEvent_populateObjectInspector___block_invoke(uint64_t a1, double a2)
{
  if (a2 >= 2.22044605e-16)
  {
    id v3 = [NSNumber numberWithDouble:a2 - *(double *)(a1 + 32)];
    id v4 = [MEMORY[0x263F08A30] localizedStringFromNumber:v3 numberStyle:1];
    size_t v2 = [NSString stringWithFormat:@"+%@s", v4];
  }
  else
  {
    size_t v2 = @"--";
  }
  return v2;
}

__CFString *__53__SUUIMetricsAppLaunchEvent_populateObjectInspector___block_invoke_2(uint64_t a1, int a2)
{
  if (a2) {
    return @"Yes";
  }
  else {
    return @"No";
  }
}

uint64_t __53__SUUIMetricsAppLaunchEvent_populateObjectInspector___block_invoke_3(void *a1, void *a2, void *a3)
{
  double v5 = (void *)a1[4];
  id v6 = a3;
  id v7 = [a2 lastPathComponent];
  [v5 beginSectionWithFriendlyName:v7];

  uint64_t v8 = (void *)a1[4];
  uint64_t v9 = a1[5];
  [v6 requestStartTime];
  id v10 = (*(void (**)(uint64_t))(v9 + 16))(v9);
  [v8 exposePropertyWithFriendlyName:@"Request Start Time" value:v10];

  uint64_t v11 = (void *)a1[4];
  uint64_t v12 = a1[5];
  [v6 responseStartTime];
  uint64_t v13 = (*(void (**)(uint64_t))(v12 + 16))(v12);
  [v11 exposePropertyWithFriendlyName:@"Response Start Time" value:v13];

  uint64_t v14 = (void *)a1[4];
  uint64_t v15 = a1[5];
  [v6 responseEndTime];
  uint64_t v16 = (*(void (**)(uint64_t))(v15 + 16))(v15);
  [v14 exposePropertyWithFriendlyName:@"Response End Time" value:v16];

  uint64_t v17 = (void *)a1[4];
  uint64_t v18 = a1[6];
  uint64_t v19 = [v6 responseWasCached];

  v20 = (*(void (**)(uint64_t, uint64_t))(v18 + 16))(v18, v19);
  [v17 exposePropertyWithFriendlyName:@"Response Was Cached" value:v20];

  v21 = (void *)a1[4];
  return [v21 endSection];
}

- (NSDictionary)templateMetrics
{
  return &self->_templateMetrics->super;
}

- (void).cxx_destruct
{
}

@end