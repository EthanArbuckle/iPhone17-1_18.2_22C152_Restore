@interface SKUIMetricsAppLaunchEvent
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
- (SKUIMetricsAppLaunchEvent)init;
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
- (void)init;
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

@implementation SKUIMetricsAppLaunchEvent

- (SKUIMetricsAppLaunchEvent)init
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIMetricsAppLaunchEvent init]();
  }
  v10.receiver = self;
  v10.super_class = (Class)SKUIMetricsAppLaunchEvent;
  v3 = [(SSMetricsBaseEvent *)&v10 init];
  v4 = v3;
  if (v3)
  {
    [(SSMetricsMutableEvent *)v3 setEventType:@"appLaunch"];
    [(SSMetricsMutableEvent *)v4 setTopic:@"xp_amp_clientperf"];
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    templateMetrics = v4->_templateMetrics;
    v4->_templateMetrics = v5;

    v7 = [MEMORY[0x1E4F29128] UUID];
    v8 = [v7 UUIDString];
    [(SKUIMetricsAppLaunchEvent *)v4 setLaunchCorrelationKey:v8];
  }
  return v4;
}

+ (void)resetPendingLaunchEventForTesting
{
  _HasConsumedPendingLaunchEvent = 0;
  v2 = (void *)_PendingLaunchEvent;
  _PendingLaunchEvent = 0;
}

+ (void)createPendingLaunchEvent
{
  if ((_HasConsumedPendingLaunchEvent & 1) == 0 && !_PendingLaunchEvent)
  {
    v2 = objc_alloc_init(SKUIMetricsAppLaunchEvent);
    uint64_t v3 = _PendingLaunchEvent;
    _PendingLaunchEvent = (uint64_t)v2;
    MEMORY[0x1F41817F8](v2, v3);
  }
}

+ (void)withPendingLaunchEvent:(id)a3
{
  if (_PendingLaunchEvent) {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

+ (id)consumePendingLaunchEvent
{
  id v2 = (id)_PendingLaunchEvent;
  _HasConsumedPendingLaunchEvent = 1;
  uint64_t v3 = (void *)_PendingLaunchEvent;
  _PendingLaunchEvent = 0;

  return v2;
}

+ (double)processStartTime
{
  if (processStartTime_onceToken != -1) {
    dispatch_once(&processStartTime_onceToken, &__block_literal_global_47);
  }
  return *(double *)&_ProcessStartTime;
}

uint64_t __45__SKUIMetricsAppLaunchEvent_processStartTime__block_invoke()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  *(void *)v4 = 0xE00000001;
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

- (void)setLaunchCorrelationKey:(id)a3
{
  id v4 = (id)[a3 copy];
  [(SSMetricsMutableEvent *)self setProperty:v4 forBodyKey:@"launchCorrelationKey"];
}

- (NSString)launchCorrelationKey
{
  size_t v2 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"launchCorrelationKey"];
  uint64_t v3 = (void *)[v2 copy];

  return (NSString *)v3;
}

- (void)setMainTime:(double)a3
{
  id v4 = [(SSMetricsEvent *)self millisecondsFromTimeInterval:a3];
  [(SSMetricsMutableEvent *)self setProperty:v4 forBodyKey:@"mainTime"];
}

- (double)mainTime
{
  uint64_t v3 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"mainTime"];
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
  uint64_t v3 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"clientConfigurationLoadTime"];
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
  uint64_t v3 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"bootstrapStartTime"];
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
  uint64_t v3 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"bootstrapEndTime"];
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
  uint64_t v3 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"jsResourcesStartTime"];
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
  uint64_t v3 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"jsResourcesEndTime"];
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
  uint64_t v3 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"initialTabRequestStartTime"];
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
  uint64_t v3 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"initialTabResponseStartTime"];
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
  uint64_t v3 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"initialTabResponseEndTime"];
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
  uint64_t v3 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"launchFailureTime"];
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
  uint64_t v3 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"launchEndTime"];
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
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    templateMetrics = self->_templateMetrics;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __52__SKUIMetricsAppLaunchEvent_appendPropertiesToBody___block_invoke;
    v10[3] = &unk_1E64295A0;
    id v11 = v5;
    id v7 = v5;
    [(NSMutableDictionary *)templateMetrics enumerateKeysAndObjectsUsingBlock:v10];
    [v4 setObject:v7 forKeyedSubscript:@"templateMetrics"];
  }
  [(id)objc_opt_class() processStartTime];
  v8 = -[SSMetricsEvent millisecondsFromTimeInterval:](self, "millisecondsFromTimeInterval:");
  [v4 setObject:v8 forKeyedSubscript:@"processStartTime"];

  v9.receiver = self;
  v9.super_class = (Class)SKUIMetricsAppLaunchEvent;
  [(SSMetricsMutableEvent *)&v9 appendPropertiesToBody:v4];
}

void __52__SKUIMetricsAppLaunchEvent_appendPropertiesToBody___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v8 = [a3 dictionaryRepresentation];
  id v6 = *(void **)(a1 + 32);
  id v7 = [v5 absoluteString];

  [v6 setObject:v8 forKeyedSubscript:v7];
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v28.receiver = self;
  v28.super_class = (Class)SKUIMetricsAppLaunchEvent;
  id v4 = [(SSMetricsBaseEvent *)&v28 description];
  [v3 appendString:v4];

  id v5 = [(SKUIMetricsAppLaunchEvent *)self launchCorrelationKey];
  [v3 appendFormat:@"\nlaunchCorrelationKey = %@", v5];

  [(id)objc_opt_class() processStartTime];
  objc_msgSend(v3, "appendFormat:", @"\nprocessStartTime = %f", v6);
  [(SKUIMetricsAppLaunchEvent *)self mainTime];
  objc_msgSend(v3, "appendFormat:", @"\nmainTime = %f", v7);
  [(SKUIMetricsAppLaunchEvent *)self clientConfigurationLoadTime];
  objc_msgSend(v3, "appendFormat:", @"\nclientConfigurationLoadTime = %f", v8);
  objc_msgSend(v3, "appendString:", @"\ntemplateMetrics = (");
  templateMetrics = self->_templateMetrics;
  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  v25 = __40__SKUIMetricsAppLaunchEvent_description__block_invoke;
  v26 = &unk_1E64295A0;
  id v10 = v3;
  id v27 = v10;
  [(NSMutableDictionary *)templateMetrics enumerateKeysAndObjectsUsingBlock:&v23];
  [v10 appendString:@"\n"]);
  [(SKUIMetricsAppLaunchEvent *)self bootstrapStartTime];
  objc_msgSend(v10, "appendFormat:", @"\nbootstrapStartTime = %f", v11, v23, v24, v25, v26);
  [(SKUIMetricsAppLaunchEvent *)self bootstrapEndTime];
  objc_msgSend(v10, "appendFormat:", @"\nbootstrapEndTime = %f", v12);
  [(SKUIMetricsAppLaunchEvent *)self jsResourcesStartTime];
  objc_msgSend(v10, "appendFormat:", @"\njsResourcesStartTime = %f", v13);
  [(SKUIMetricsAppLaunchEvent *)self jsResourcesEndTime];
  objc_msgSend(v10, "appendFormat:", @"\njsResourcesEndTime = %f", v14);
  [(SKUIMetricsAppLaunchEvent *)self initialTabRequestStartTime];
  objc_msgSend(v10, "appendFormat:", @"\ninitialTabRequestStartTime = %f", v15);
  [(SKUIMetricsAppLaunchEvent *)self initialTabResponseStartTime];
  objc_msgSend(v10, "appendFormat:", @"\ninitialTabResponseStartTime = %f", v16);
  [(SKUIMetricsAppLaunchEvent *)self initialTabResponseEndTime];
  objc_msgSend(v10, "appendFormat:", @"\ninitialTabResponseEndTime = %f", v17);
  [(SKUIMetricsAppLaunchEvent *)self launchFailureTime];
  objc_msgSend(v10, "appendFormat:", @"\nlaunchFailureTime = %f", v18);
  [(SKUIMetricsAppLaunchEvent *)self launchEndTime];
  objc_msgSend(v10, "appendFormat:", @"\nlaunchEndTime = %f", v19);
  if ([(SKUIMetricsAppLaunchEvent *)self requiredBlockingBagLoad]) {
    v20 = @"YES";
  }
  else {
    v20 = @"NO";
  }
  [v10 appendFormat:@"\nrequiredBlockingBagLoad = %@", v20];
  if ([(SKUIMetricsAppLaunchEvent *)self usedBootstrapFallback]) {
    v21 = @"YES";
  }
  else {
    v21 = @"NO";
  }
  [v10 appendFormat:@"\nusedBootstrapFallback = %@", v21];

  return (NSString *)v10;
}

uint64_t __40__SKUIMetricsAppLaunchEvent_description__block_invoke(uint64_t a1, void *a2, void *a3)
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
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__SKUIMetricsAppLaunchEvent_populateObjectInspector___block_invoke;
  aBlock[3] = &__block_descriptor_40_e18___NSString_16__0d8l;
  *(double *)&aBlock[4] = v5;
  id v7 = (void (**)(void))_Block_copy(aBlock);
  [v4 beginSectionWithFriendlyName:@"Process Stats"];
  uint64_t v8 = (void *)MEMORY[0x1E4F28C10];
  uint64_t v9 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v6];
  id v10 = [v8 localizedStringFromDate:v9 dateStyle:0 timeStyle:3];

  [v4 exposePropertyWithFriendlyName:@"Process Start Time" value:v10];
  [(SKUIMetricsAppLaunchEvent *)self mainTime];
  uint64_t v11 = v7 + 2;
  uint64_t v12 = v7[2](v7);
  [v4 exposePropertyWithFriendlyName:@"Main Time" value:v12];

  [(SKUIMetricsAppLaunchEvent *)self clientConfigurationLoadTime];
  uint64_t v13 = v7[2](v7);
  [v4 exposePropertyWithFriendlyName:@"Client Configuration Load Time" value:v13];

  [(SKUIMetricsAppLaunchEvent *)self launchFailureTime];
  uint64_t v14 = v7[2](v7);
  [v4 exposePropertyWithFriendlyName:@"Launch Failure Time" value:v14];

  [(SKUIMetricsAppLaunchEvent *)self launchEndTime];
  uint64_t v15 = v7[2](v7);
  [v4 exposePropertyWithFriendlyName:@"Launch End Time" value:v15];

  if ([(SKUIMetricsAppLaunchEvent *)self requiredBlockingBagLoad]) {
    uint64_t v16 = @"Yes";
  }
  else {
    uint64_t v16 = @"No";
  }
  [v4 exposePropertyWithFriendlyName:@"Required Blocking Bag Load" value:v16];
  if ([(SKUIMetricsAppLaunchEvent *)self usedBootstrapFallback]) {
    uint64_t v17 = @"Yes";
  }
  else {
    uint64_t v17 = @"No";
  }
  [v4 exposePropertyWithFriendlyName:@"Used Bootstrap Fallback" value:v17];
  [v4 endSection];
  [v4 beginSectionWithFriendlyName:@"App Resource Times"];
  [(SKUIMetricsAppLaunchEvent *)self bootstrapStartTime];
  uint64_t v18 = (*v11)(v7);
  [v4 exposePropertyWithFriendlyName:@"Bootstrap Start Time" value:v18];

  [(SKUIMetricsAppLaunchEvent *)self bootstrapEndTime];
  uint64_t v19 = (*v11)(v7);
  [v4 exposePropertyWithFriendlyName:@"Bootstrap End Time" value:v19];

  [(SKUIMetricsAppLaunchEvent *)self jsResourcesEndTime];
  v20 = (*v11)(v7);
  [v4 exposePropertyWithFriendlyName:@"JS Resources Start Time" value:v20];

  [(SKUIMetricsAppLaunchEvent *)self jsResourcesEndTime];
  v21 = (*v11)(v7);
  [v4 exposePropertyWithFriendlyName:@"JS Resources End Time" value:v21];

  [(SKUIMetricsAppLaunchEvent *)self initialTabRequestStartTime];
  v22 = (*v11)(v7);
  [v4 exposePropertyWithFriendlyName:@"Initial Tab Request Start Time" value:v22];

  [(SKUIMetricsAppLaunchEvent *)self initialTabResponseStartTime];
  uint64_t v23 = (*v11)(v7);
  [v4 exposePropertyWithFriendlyName:@"Initial Tab Response Start Time" value:v23];

  [(SKUIMetricsAppLaunchEvent *)self initialTabResponseEndTime];
  uint64_t v24 = (*v11)(v7);
  [v4 exposePropertyWithFriendlyName:@"Initial Tab Response End Time" value:v24];

  [v4 endSection];
  v25 = [(SKUIMetricsAppLaunchEvent *)self templateMetrics];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __53__SKUIMetricsAppLaunchEvent_populateObjectInspector___block_invoke_3;
  v28[3] = &unk_1E64295C8;
  id v29 = v4;
  id v30 = v7;
  id v31 = &__block_literal_global_163;
  id v26 = v4;
  id v27 = v7;
  [v25 enumerateKeysAndObjectsUsingBlock:v28];
}

__CFString *__53__SKUIMetricsAppLaunchEvent_populateObjectInspector___block_invoke(uint64_t a1, double a2)
{
  if (a2 >= 2.22044605e-16)
  {
    id v3 = [NSNumber numberWithDouble:a2 - *(double *)(a1 + 32)];
    id v4 = [MEMORY[0x1E4F28EE0] localizedStringFromNumber:v3 numberStyle:1];
    size_t v2 = [NSString stringWithFormat:@"+%@s", v4];
  }
  else
  {
    size_t v2 = @"--";
  }

  return v2;
}

__CFString *__53__SKUIMetricsAppLaunchEvent_populateObjectInspector___block_invoke_2(uint64_t a1, int a2)
{
  if (a2) {
    return @"Yes";
  }
  else {
    return @"No";
  }
}

uint64_t __53__SKUIMetricsAppLaunchEvent_populateObjectInspector___block_invoke_3(void *a1, void *a2, void *a3)
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

- (void)init
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  double v1 = "-[SKUIMetricsAppLaunchEvent init]";
}

@end