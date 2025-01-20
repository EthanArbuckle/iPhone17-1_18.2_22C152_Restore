@interface SUUIMetricsPageRenderEvent
+ (BOOL)shouldCollectPageRenderData;
+ (BOOL)shouldCollectPageRenderDataForDocument:(id)a3;
+ (double)_randomDouble;
+ (id)_sampleWindowStartTime;
+ (void)_setSampleWindowStartTime:(id)a3;
- (BOOL)isReadyForSubmission;
- (BOOL)platformResponseWasCached;
- (BOOL)xpSamplingForced;
- (NSArray)domChanges;
- (NSArray)requests;
- (NSDictionary)metricsBase;
- (NSString)clientCorrelationKey;
- (NSString)description;
- (NSString)launchCorrelationKey;
- (SUUIMetricsPageRenderEvent)init;
- (double)pageAppearTime;
- (double)pageDisappearTime;
- (double)pageRequestedTime;
- (double)pageUserReadyTime;
- (double)platformJsonParseEndTime;
- (double)platformJsonParseStartTime;
- (double)platformRequestStartTime;
- (double)platformResponseEndTime;
- (double)platformResponseStartTime;
- (double)resourceRequestEndTime;
- (double)resourceRequestOnScreenEndTime;
- (double)resourceRequestStartTime;
- (double)xpSamplingPercentageUsers;
- (double)xpSessionDuration;
- (void)addDOMChange:(id)a3;
- (void)addRequest:(id)a3;
- (void)appendPropertiesToBody:(id)a3;
- (void)appendSamplingPropertiesFromClientContext:(id)a3;
- (void)populateObjectInspector:(id)a3;
- (void)setClientCorrelationKey:(id)a3;
- (void)setLaunchCorrelationKey:(id)a3;
- (void)setMetricsBase:(id)a3;
- (void)setPageAppearTime:(double)a3;
- (void)setPageDisappearTime:(double)a3;
- (void)setPageRequestedTime:(double)a3;
- (void)setPageUserReadyTime:(double)a3;
- (void)setPlatformJsonParseEndTime:(double)a3;
- (void)setPlatformJsonParseStartTime:(double)a3;
- (void)setPlatformRequestStartTime:(double)a3;
- (void)setPlatformResponseEndTime:(double)a3;
- (void)setPlatformResponseStartTime:(double)a3;
- (void)setPlatformResponseWasCached:(BOOL)a3;
- (void)setResourceRequestEndTime:(double)a3;
- (void)setResourceRequestOnScreenEndTime:(double)a3;
- (void)setResourceRequestStartTime:(double)a3;
- (void)setXPSamplingForced:(BOOL)a3;
- (void)setXPSamplingPercentageUsers:(double)a3;
- (void)setXPSessionDuration:(double)a3;
@end

@implementation SUUIMetricsPageRenderEvent

- (SUUIMetricsPageRenderEvent)init
{
  v9.receiver = self;
  v9.super_class = (Class)SUUIMetricsPageRenderEvent;
  v2 = [(SSMetricsBaseEvent *)&v9 init];
  v3 = v2;
  if (v2)
  {
    [(SSMetricsMutableEvent *)v2 setEventType:@"pageRender"];
    [(SSMetricsMutableEvent *)v3 setTopic:@"xp_amp_clientperf"];
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    domChanges = v3->_domChanges;
    v3->_domChanges = v4;

    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    requests = v3->_requests;
    v3->_requests = v6;
  }
  return v3;
}

+ (BOOL)shouldCollectPageRenderData
{
  if (+[SUUIMetricsUtilities shouldLogTimingMetrics]
    || +[SUUIMetricsUtilities trackAllEvents])
  {
    return 1;
  }
  v4 = [MEMORY[0x263F7B280] sharedInstance];
  v5 = [MEMORY[0x263EFF910] date];
  [v4 sessionDurationPageRender];
  double v7 = v6;
  v8 = [a1 _sampleWindowStartTime];
  objc_super v9 = [v8 dateByAddingTimeInterval:v7];

  if ([v5 compare:v9] == -1)
  {
    BOOL v3 = 1;
  }
  else
  {
    [a1 _randomDouble];
    if (v10 == 0.0)
    {
      BOOL v3 = 0;
    }
    else
    {
      double v11 = v10;
      [v4 samplingPercentageUsersPageRender];
      BOOL v3 = v11 <= v12;
      if (v11 <= v12) {
        [a1 _setSampleWindowStartTime:v5];
      }
      [v4 update];
    }
  }

  return v3;
}

+ (BOOL)shouldCollectPageRenderDataForDocument:(id)a3
{
  id v4 = a3;
  if ([a1 shouldCollectPageRenderData])
  {
    v5 = [v4 templateElement];
    BOOL v6 = [v5 elementType] != 148;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

+ (double)_randomDouble
{
  if (_randomDouble_onceToken != -1) {
    dispatch_once(&_randomDouble_onceToken, &__block_literal_global_45);
  }
  return drand48();
}

void __43__SUUIMetricsPageRenderEvent__randomDouble__block_invoke()
{
  uint64_t v0 = arc4random();
  srand48(v0);
}

+ (void)_setSampleWindowStartTime:(id)a3
{
}

+ (id)_sampleWindowStartTime
{
  v2 = (void *)CFPreferencesCopyAppValue(@"SUUIMetricsPageRenderEventSampleWindowStartTime", (CFStringRef)*MEMORY[0x263F7BDC8]);
  return v2;
}

- (void)setClientCorrelationKey:(id)a3
{
  id v4 = (id)[a3 copy];
  [(SSMetricsMutableEvent *)self setProperty:v4 forBodyKey:@"clientCorrelationKey"];
}

- (NSString)clientCorrelationKey
{
  v2 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"clientCorrelationKey"];
  BOOL v3 = (void *)[v2 copy];

  return (NSString *)v3;
}

- (void)setLaunchCorrelationKey:(id)a3
{
  id v4 = (id)[a3 copy];
  [(SSMetricsMutableEvent *)self setProperty:v4 forBodyKey:@"launchCorrelationKey"];
}

- (NSString)launchCorrelationKey
{
  v2 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"launchCorrelationKey"];
  BOOL v3 = (void *)[v2 copy];

  return (NSString *)v3;
}

- (void)setPageRequestedTime:(double)a3
{
  id v4 = [(SSMetricsEvent *)self millisecondsFromTimeInterval:a3];
  [(SSMetricsMutableEvent *)self setProperty:v4 forBodyKey:@"pageRequestedTime"];
}

- (double)pageRequestedTime
{
  BOOL v3 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"pageRequestedTime"];
  [(SSMetricsEvent *)self timeIntervalFromMilliseconds:v3];
  double v5 = v4;

  return v5;
}

- (void)setPageAppearTime:(double)a3
{
  id v4 = [(SSMetricsEvent *)self millisecondsFromTimeInterval:a3];
  [(SSMetricsMutableEvent *)self setProperty:v4 forBodyKey:@"pageAppearTime"];
}

- (double)pageAppearTime
{
  BOOL v3 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"pageAppearTime"];
  [(SSMetricsEvent *)self timeIntervalFromMilliseconds:v3];
  double v5 = v4;

  return v5;
}

- (void)setPageDisappearTime:(double)a3
{
  id v4 = [(SSMetricsEvent *)self millisecondsFromTimeInterval:a3];
  [(SSMetricsMutableEvent *)self setProperty:v4 forBodyKey:@"pageDisappearTime"];
}

- (double)pageDisappearTime
{
  BOOL v3 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"pageDisappearTime"];
  [(SSMetricsEvent *)self timeIntervalFromMilliseconds:v3];
  double v5 = v4;

  return v5;
}

- (void)setPlatformRequestStartTime:(double)a3
{
  id v4 = [(SSMetricsEvent *)self millisecondsFromTimeInterval:a3];
  [(SSMetricsMutableEvent *)self setProperty:v4 forBodyKey:@"platformRequestStartTime"];
}

- (double)platformRequestStartTime
{
  BOOL v3 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"platformRequestStartTime"];
  [(SSMetricsEvent *)self timeIntervalFromMilliseconds:v3];
  double v5 = v4;

  return v5;
}

- (void)setPlatformResponseStartTime:(double)a3
{
  id v4 = [(SSMetricsEvent *)self millisecondsFromTimeInterval:a3];
  [(SSMetricsMutableEvent *)self setProperty:v4 forBodyKey:@"platformResponseStartTime"];
}

- (double)platformResponseStartTime
{
  BOOL v3 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"platformResponseStartTime"];
  [(SSMetricsEvent *)self timeIntervalFromMilliseconds:v3];
  double v5 = v4;

  return v5;
}

- (void)setPlatformResponseEndTime:(double)a3
{
  id v4 = [(SSMetricsEvent *)self millisecondsFromTimeInterval:a3];
  [(SSMetricsMutableEvent *)self setProperty:v4 forBodyKey:@"platformResponseEndTime"];
}

- (double)platformResponseEndTime
{
  BOOL v3 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"platformResponseEndTime"];
  [(SSMetricsEvent *)self timeIntervalFromMilliseconds:v3];
  double v5 = v4;

  return v5;
}

- (void)setPlatformResponseWasCached:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(SSMetricsMutableEvent *)self setProperty:v4 forBodyKey:@"platformResponseWasCached"];
}

- (BOOL)platformResponseWasCached
{
  v2 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"platformResponseWasCached"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setPlatformJsonParseStartTime:(double)a3
{
  id v4 = [(SSMetricsEvent *)self millisecondsFromTimeInterval:a3];
  [(SSMetricsMutableEvent *)self setProperty:v4 forBodyKey:@"platformJsonParseStartTime"];
}

- (double)platformJsonParseStartTime
{
  char v3 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"platformJsonParseStartTime"];
  [(SSMetricsEvent *)self timeIntervalFromMilliseconds:v3];
  double v5 = v4;

  return v5;
}

- (void)setPlatformJsonParseEndTime:(double)a3
{
  id v4 = [(SSMetricsEvent *)self millisecondsFromTimeInterval:a3];
  [(SSMetricsMutableEvent *)self setProperty:v4 forBodyKey:@"platformJsonParseEndTime"];
}

- (double)platformJsonParseEndTime
{
  char v3 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"platformJsonParseEndTime"];
  [(SSMetricsEvent *)self timeIntervalFromMilliseconds:v3];
  double v5 = v4;

  return v5;
}

- (void)addDOMChange:(id)a3
{
  domChanges = self->_domChanges;
  id v4 = (id)[a3 copy];
  [(NSMutableArray *)domChanges addObject:v4];
}

- (void)addRequest:(id)a3
{
  requests = self->_requests;
  id v4 = (id)[a3 copy];
  [(NSMutableArray *)requests addObject:v4];
}

- (void)setResourceRequestStartTime:(double)a3
{
  id v4 = [(SSMetricsEvent *)self millisecondsFromTimeInterval:a3];
  [(SSMetricsMutableEvent *)self setProperty:v4 forBodyKey:@"resourceRequestStartTime"];
}

- (double)resourceRequestStartTime
{
  char v3 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"resourceRequestStartTime"];
  [(SSMetricsEvent *)self timeIntervalFromMilliseconds:v3];
  double v5 = v4;

  return v5;
}

- (void)setResourceRequestOnScreenEndTime:(double)a3
{
  id v4 = [(SSMetricsEvent *)self millisecondsFromTimeInterval:a3];
  [(SSMetricsMutableEvent *)self setProperty:v4 forBodyKey:@"resourceRequestOnScreenEndTime"];
}

- (double)resourceRequestOnScreenEndTime
{
  char v3 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"resourceRequestOnScreenEndTime"];
  [(SSMetricsEvent *)self timeIntervalFromMilliseconds:v3];
  double v5 = v4;

  return v5;
}

- (void)setResourceRequestEndTime:(double)a3
{
  id v4 = [(SSMetricsEvent *)self millisecondsFromTimeInterval:a3];
  [(SSMetricsMutableEvent *)self setProperty:v4 forBodyKey:@"resourceRequestEndTime"];
}

- (double)resourceRequestEndTime
{
  char v3 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"resourceRequestEndTime"];
  [(SSMetricsEvent *)self timeIntervalFromMilliseconds:v3];
  double v5 = v4;

  return v5;
}

- (void)setPageUserReadyTime:(double)a3
{
  id v4 = [(SSMetricsEvent *)self millisecondsFromTimeInterval:a3];
  [(SSMetricsMutableEvent *)self setProperty:v4 forBodyKey:@"pageUserReadyTime"];
}

- (double)pageUserReadyTime
{
  char v3 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"pageUserReadyTime"];
  [(SSMetricsEvent *)self timeIntervalFromMilliseconds:v3];
  double v5 = v4;

  return v5;
}

- (void)setXPSessionDuration:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(SSMetricsMutableEvent *)self setProperty:v4 forBodyKey:@"xpSessionDuration"];
}

- (double)xpSessionDuration
{
  v2 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"xpSessionDuration"];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (void)setXPSamplingForced:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(SSMetricsMutableEvent *)self setProperty:v4 forBodyKey:@"xpSamplingForced"];
}

- (BOOL)xpSamplingForced
{
  v2 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"xpSamplingForced"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setXPSamplingPercentageUsers:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(SSMetricsMutableEvent *)self setProperty:v4 forBodyKey:@"xpSamplingPercentageUsers"];
}

- (double)xpSamplingPercentageUsers
{
  v2 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"xpSamplingPercentageUsers"];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (void)appendSamplingPropertiesFromClientContext:(id)a3
{
  double v4 = [a3 existingBagValueForKey:*MEMORY[0x263F7BBD0]];
  double v5 = v4;
  if (!v4)
  {
    objc_super v9 = [MEMORY[0x263F7B1F8] sharedConfig];
    int v10 = [v9 shouldLog];
    if ([v9 shouldLogToDisk]) {
      int v11 = v10 | 2;
    }
    else {
      int v11 = v10;
    }
    double v12 = [v9 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      int v13 = v11;
    }
    else {
      int v13 = v11 & 2;
    }
    if (v13)
    {
      v16[0] = 0;
      LODWORD(v15) = 2;
      v14 = (void *)_os_log_send_and_compose_impl();

      if (!v14)
      {
LABEL_15:

        goto LABEL_16;
      }
      double v12 = objc_msgSend(NSString, "stringWithCString:encoding:", v14, 4, v16, v15);
      free(v14);
      SSFileLog();
    }

    goto LABEL_15;
  }
  BOOL v6 = [v4 objectForKeyedSubscript:@"performance"];
  double v7 = [v6 objectForKeyedSubscript:@"sessionDuration"];
  [v7 doubleValue];
  -[SUUIMetricsPageRenderEvent setXPSessionDuration:](self, "setXPSessionDuration:");

  v8 = [v6 objectForKeyedSubscript:@"samplingPercentageUsers"];
  [v8 doubleValue];
  -[SUUIMetricsPageRenderEvent setXPSamplingPercentageUsers:](self, "setXPSamplingPercentageUsers:");

  if (+[SUUIMetricsUtilities shouldLogTimingMetrics])
  {
    [(SUUIMetricsPageRenderEvent *)self setXPSamplingForced:1];
    [(SUUIMetricsPageRenderEvent *)self setXPSamplingPercentageUsers:1.0];
  }

LABEL_16:
}

- (BOOL)isReadyForSubmission
{
  [(SUUIMetricsPageRenderEvent *)self pageAppearTime];
  if (v3 <= 2.22044605e-16) {
    return 0;
  }
  [(SUUIMetricsPageRenderEvent *)self resourceRequestStartTime];
  if (v4 <= 2.22044605e-16) {
    return 0;
  }
  [(SUUIMetricsPageRenderEvent *)self resourceRequestOnScreenEndTime];
  if (v5 <= 2.22044605e-16) {
    return 0;
  }
  [(SUUIMetricsPageRenderEvent *)self resourceRequestEndTime];
  if (v6 <= 2.22044605e-16) {
    return 0;
  }
  [(SUUIMetricsPageRenderEvent *)self pageUserReadyTime];
  if (v7 <= 2.22044605e-16) {
    return 0;
  }
  v8 = [(SUUIMetricsPageRenderEvent *)self domChanges];
  BOOL v9 = [v8 count] != 0;

  return v9;
}

- (void)appendPropertiesToBody:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(NSMutableArray *)self->_domChanges count])
  {
    double v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_domChanges, "count"));
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    double v6 = self->_domChanges;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v25;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v25 != v9) {
            objc_enumerationMutation(v6);
          }
          int v11 = [*(id *)(*((void *)&v24 + 1) + 8 * v10) dictionaryRepresentation];
          [v5 addObject:v11];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v8);
    }

    [v4 setObject:v5 forKeyedSubscript:@"domChanges"];
  }
  if ([(NSMutableArray *)self->_requests count])
  {
    double v12 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_requests, "count"));
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    int v13 = self->_requests;
    uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v21;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v21 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = [*(id *)(*((void *)&v20 + 1) + 8 * v17) dictionaryRepresentation];
          [v12 addObject:v18];

          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v15);
    }

    [v4 setObject:v12 forKeyedSubscript:@"requests"];
  }
  if ([(NSDictionary *)self->_metricsBase count]) {
    [v4 addEntriesFromDictionary:self->_metricsBase];
  }
  v19.receiver = self;
  v19.super_class = (Class)SUUIMetricsPageRenderEvent;
  [(SSMetricsMutableEvent *)&v19 appendPropertiesToBody:v4];
}

- (NSString)description
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  v58.receiver = self;
  v58.super_class = (Class)SUUIMetricsPageRenderEvent;
  id v4 = [(SSMetricsBaseEvent *)&v58 description];
  [v3 appendString:v4];

  double v5 = [(SUUIMetricsPageRenderEvent *)self clientCorrelationKey];
  [v3 appendFormat:@"\nclientCorrelationKey = %@", v5];

  double v6 = [(SUUIMetricsPageRenderEvent *)self launchCorrelationKey];
  [v3 appendFormat:@"\nlaunchCorrelationKey = %@", v6];

  [(SUUIMetricsPageRenderEvent *)self pageRequestedTime];
  objc_msgSend(v3, "appendFormat:", @"\npageRequestedTime = %f", v7);
  [(SUUIMetricsPageRenderEvent *)self pageAppearTime];
  objc_msgSend(v3, "appendFormat:", @"\npageAppearTime = %f", v8);
  [(SUUIMetricsPageRenderEvent *)self pageDisappearTime];
  objc_msgSend(v3, "appendFormat:", @"\npageDisappearTime = %f", v9);
  [(SUUIMetricsPageRenderEvent *)self platformRequestStartTime];
  objc_msgSend(v3, "appendFormat:", @"\nplatformRequestStartTime = %f", v10);
  [(SUUIMetricsPageRenderEvent *)self platformResponseStartTime];
  objc_msgSend(v3, "appendFormat:", @"\nplatformResponseStartTime = %f", v11);
  [(SUUIMetricsPageRenderEvent *)self platformResponseEndTime];
  objc_msgSend(v3, "appendFormat:", @"\nplatformResponseEndTime = %f", v12);
  BOOL v13 = [(SUUIMetricsPageRenderEvent *)self platformResponseWasCached];
  uint64_t v14 = @"NO";
  if (v13) {
    uint64_t v14 = @"YES";
  }
  [v3 appendFormat:@"\nplatformResponseWasCached = %@", v14];
  [(SUUIMetricsPageRenderEvent *)self platformJsonParseStartTime];
  objc_msgSend(v3, "appendFormat:", @"\nplatformJsonParseStartTime = %f", v15);
  [(SUUIMetricsPageRenderEvent *)self platformJsonParseEndTime];
  objc_msgSend(v3, "appendFormat:", @"\nplatformJsonParseEndTime = %f", v16);
  objc_msgSend(v3, "appendString:", @"\ndomChanges = (");
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  v47 = self;
  obuint64_t j = self->_domChanges;
  uint64_t v17 = [(NSMutableArray *)obj countByEnumeratingWithState:&v54 objects:v60 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v55 != v19) {
          objc_enumerationMutation(obj);
        }
        long long v21 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        [v3 appendFormat:@"\n\t{"];
        [v21 buildStartTime];
        objc_msgSend(v3, "appendFormat:", @"\n\t\tbuildStartTime = %f", v22);
        [v21 buildEndTime];
        objc_msgSend(v3, "appendFormat:", @"\n\t\tbuildEndTime = %f", v23);
        [v21 renderStartTime];
        objc_msgSend(v3, "appendFormat:", @"\n\t\trenderStartTime = %f", v24);
        [v21 renderEndTime];
        objc_msgSend(v3, "appendFormat:", @"\n\t\trenderEndTime = %f", v25);
        [v3 appendFormat:@"\n\t},"];
      }
      uint64_t v18 = [(NSMutableArray *)obj countByEnumeratingWithState:&v54 objects:v60 count:16];
    }
    while (v18);
  }

  [v3 appendString:@"\n"]);
  objc_msgSend(v3, "appendString:", @"\ndomChanges = (");
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  obja = v47->_requests;
  uint64_t v26 = [(NSMutableArray *)obja countByEnumeratingWithState:&v50 objects:v59 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v51;
    do
    {
      for (uint64_t j = 0; j != v27; ++j)
      {
        if (*(void *)v51 != v28) {
          objc_enumerationMutation(obja);
        }
        uint64_t v30 = *(void **)(*((void *)&v50 + 1) + 8 * j);
        [v3 appendFormat:@"\n\t{"];
        [v30 requestStartTime];
        objc_msgSend(v3, "appendFormat:", @"\n\t\trequestStartTime = %f", v31);
        [v30 responseStartTime];
        objc_msgSend(v3, "appendFormat:", @"\n\t\tresponseStartTime = %f", v32);
        [v30 responseEndTime];
        objc_msgSend(v3, "appendFormat:", @"\n\t\tresponseEndTime = %f", v33);
        int v34 = [v30 responseWasCached];
        v35 = @"NO";
        if (v34) {
          v35 = @"YES";
        }
        [v3 appendFormat:@"\n\t\tresponseWasCached = %@", v35];
        [v3 appendFormat:@"\n\t},"];
      }
      uint64_t v27 = [(NSMutableArray *)obja countByEnumeratingWithState:&v50 objects:v59 count:16];
    }
    while (v27);
  }

  [v3 appendString:@"\n"]);
  [(SUUIMetricsPageRenderEvent *)v47 resourceRequestStartTime];
  objc_msgSend(v3, "appendFormat:", @"\nresourceRequestStartTime = %f", v36);
  [(SUUIMetricsPageRenderEvent *)v47 resourceRequestOnScreenEndTime];
  objc_msgSend(v3, "appendFormat:", @"\nresourceRequestOnScreenEndTime = %f", v37);
  [(SUUIMetricsPageRenderEvent *)v47 resourceRequestEndTime];
  objc_msgSend(v3, "appendFormat:", @"\nresourceRequestEndTime = %f", v38);
  [(SUUIMetricsPageRenderEvent *)v47 pageUserReadyTime];
  objc_msgSend(v3, "appendFormat:", @"\npageUserReadyTime = %f", v39);
  BOOL v40 = [(SUUIMetricsPageRenderEvent *)v47 xpSamplingForced];
  v41 = @"NO";
  if (v40) {
    v41 = @"YES";
  }
  [v3 appendFormat:@"\nxpSamplingForced = %@", v41];
  [(SUUIMetricsPageRenderEvent *)v47 xpSamplingPercentageUsers];
  objc_msgSend(v3, "appendFormat:", @"\nxpSamplingPercentageUsers = %f", v42);
  [(SUUIMetricsPageRenderEvent *)v47 xpSessionDuration];
  objc_msgSend(v3, "appendFormat:", @"\nxpSessionDuration = %f", v43);
  v44 = [(SUUIMetricsPageRenderEvent *)v47 metricsBase];
  [v3 appendFormat:@"\nmetricsBase = %@", v44];

  v45 = (void *)[v3 copy];
  return (NSString *)v45;
}

- (void)populateObjectInspector:(id)a3
{
  id v4 = a3;
  [v4 setFriendlyName:@"Page Render Times"];
  [v4 setInformation:@"All times relative to earliest recorded operation time"];
  [(SUUIMetricsPageRenderEvent *)self pageAppearTime];
  double v6 = v5;
  [(SUUIMetricsPageRenderEvent *)self pageRequestedTime];
  if (v6 >= v7) {
    double v6 = v7;
  }
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__SUUIMetricsPageRenderEvent_populateObjectInspector___block_invoke;
  aBlock[3] = &__block_descriptor_40_e18___NSString_16__0d8l;
  *(double *)&aBlock[4] = v6;
  uint64_t v8 = (void (**)(id))_Block_copy(aBlock);
  [v4 beginSectionWithFriendlyName:@"Baseline"];
  uint64_t v9 = (void *)MEMORY[0x263F08790];
  uint64_t v10 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:v6];
  uint64_t v11 = [v9 localizedStringFromDate:v10 dateStyle:0 timeStyle:3];

  [v4 exposePropertyWithFriendlyName:@"Start Time" value:v11];
  [v4 endSection];
  [v4 beginSectionWithFriendlyName:@"Page Times"];
  [(SUUIMetricsPageRenderEvent *)self pageRequestedTime];
  uint64_t v12 = v8 + 2;
  BOOL v13 = v8[2](v8);
  [v4 exposePropertyWithFriendlyName:@"Page Requested Time" value:v13];

  [(SUUIMetricsPageRenderEvent *)self pageAppearTime];
  uint64_t v14 = v8[2](v8);
  [v4 exposePropertyWithFriendlyName:@"Page Appear Time" value:v14];

  [(SUUIMetricsPageRenderEvent *)self pageDisappearTime];
  uint64_t v15 = v8[2](v8);
  [v4 exposePropertyWithFriendlyName:@"Page Disappear Time" value:v15];

  [(SUUIMetricsPageRenderEvent *)self pageUserReadyTime];
  uint64_t v16 = v8[2](v8);
  [v4 exposePropertyWithFriendlyName:@"Page User Ready Time" value:v16];

  [v4 endSection];
  [v4 beginSectionWithFriendlyName:@"Platform Request Times"];
  [(SUUIMetricsPageRenderEvent *)self platformRequestStartTime];
  uint64_t v17 = v8[2](v8);
  [v4 exposePropertyWithFriendlyName:@"Platform Request Start Time" value:v17];

  [(SUUIMetricsPageRenderEvent *)self platformResponseStartTime];
  uint64_t v18 = v8[2](v8);
  [v4 exposePropertyWithFriendlyName:@"Platform Response Start Time" value:v18];

  [(SUUIMetricsPageRenderEvent *)self platformResponseEndTime];
  uint64_t v19 = v8[2](v8);
  [v4 exposePropertyWithFriendlyName:@"Platform Response End Time" value:v19];

  if ([(SUUIMetricsPageRenderEvent *)self platformResponseWasCached]) {
    long long v20 = @"Yes";
  }
  else {
    long long v20 = @"No";
  }
  [v4 exposePropertyWithFriendlyName:@"Platform Response Was Cached" value:v20];
  [(SUUIMetricsPageRenderEvent *)self platformJsonParseStartTime];
  long long v21 = (*v12)(v8);
  [v4 exposePropertyWithFriendlyName:@"Platform JSON Parse Start Time" value:v21];

  [(SUUIMetricsPageRenderEvent *)self platformJsonParseEndTime];
  uint64_t v22 = (*v12)(v8);
  [v4 exposePropertyWithFriendlyName:@"Platform JSON Parse End Time" value:v22];

  [v4 endSection];
  [v4 beginSectionWithFriendlyName:@"DOM Times"];
  uint64_t v23 = [(SUUIMetricsPageRenderEvent *)self domChanges];
  v43[0] = MEMORY[0x263EF8330];
  v43[1] = 3221225472;
  v43[2] = __54__SUUIMetricsPageRenderEvent_populateObjectInspector___block_invoke_3;
  v43[3] = &unk_265406E58;
  id v24 = v4;
  id v44 = v24;
  uint64_t v25 = v8;
  v45 = v25;
  [v23 enumerateObjectsUsingBlock:v43];

  [v24 endSection];
  [v24 beginSectionWithFriendlyName:@"Request Times"];
  uint64_t v26 = [(SUUIMetricsPageRenderEvent *)self requests];
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __54__SUUIMetricsPageRenderEvent_populateObjectInspector___block_invoke_4;
  v39[3] = &unk_265406E80;
  id v40 = v24;
  v41 = v25;
  id v42 = &__block_literal_global_206;
  id v27 = v24;
  uint64_t v28 = v25;
  [v26 enumerateObjectsUsingBlock:v39];

  [v27 endSection];
  [v27 beginSectionWithFriendlyName:@"Resource Request Times"];
  [(SUUIMetricsPageRenderEvent *)self resourceRequestStartTime];
  v29 = (*v12)(v28);
  [v27 exposePropertyWithFriendlyName:@"Resource Request Start Time" value:v29];

  [(SUUIMetricsPageRenderEvent *)self resourceRequestOnScreenEndTime];
  uint64_t v30 = (*v12)(v28);
  [v27 exposePropertyWithFriendlyName:@"Resource Request On Screen End Time" value:v30];

  [(SUUIMetricsPageRenderEvent *)self resourceRequestEndTime];
  uint64_t v31 = (*v12)(v28);
  [v27 exposePropertyWithFriendlyName:@"Resource Request End Time" value:v31];

  [v27 endSection];
  [v27 beginSectionWithFriendlyName:@"Sampling Configuration"];
  uint64_t v32 = NSString;
  [(SUUIMetricsPageRenderEvent *)self xpSessionDuration];
  int v34 = objc_msgSend(v32, "stringWithFormat:", @"%.0fs", v33 / 1000.0);
  [v27 exposePropertyWithFriendlyName:@"XP Session Duration" value:v34];

  if ([(SUUIMetricsPageRenderEvent *)self xpSamplingForced]) {
    v35 = @"Yes";
  }
  else {
    v35 = @"No";
  }
  [v27 exposePropertyWithFriendlyName:@"XP Sampling Forced" value:v35];
  uint64_t v36 = NSString;
  [(SUUIMetricsPageRenderEvent *)self xpSamplingPercentageUsers];
  uint64_t v38 = objc_msgSend(v36, "stringWithFormat:", @"%ld%%", (uint64_t)(v37 * 100.0));
  [v27 exposePropertyWithFriendlyName:@"XP Sampling Percentage Users" value:v38];

  [v27 endSection];
}

__CFString *__54__SUUIMetricsPageRenderEvent_populateObjectInspector___block_invoke(uint64_t a1, double a2)
{
  if (a2 >= 2.22044605e-16)
  {
    id v3 = [NSNumber numberWithDouble:a2 - *(double *)(a1 + 32)];
    id v4 = [MEMORY[0x263F08A30] localizedStringFromNumber:v3 numberStyle:1];
    v2 = [NSString stringWithFormat:@"+%@s", v4];
  }
  else
  {
    v2 = @"--";
  }
  return v2;
}

__CFString *__54__SUUIMetricsPageRenderEvent_populateObjectInspector___block_invoke_2(uint64_t a1, int a2)
{
  if (a2) {
    return @"Yes";
  }
  else {
    return @"No";
  }
}

void __54__SUUIMetricsPageRenderEvent_populateObjectInspector___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a2;
  [v5 buildStartTime];
  double v6 = (*(void (**)(uint64_t))(v4 + 16))(v4);
  [v3 exposePropertyWithFriendlyName:@"Build Start Time" value:v6];

  double v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  [v5 buildEndTime];
  uint64_t v9 = (*(void (**)(uint64_t))(v8 + 16))(v8);
  [v7 exposePropertyWithFriendlyName:@"Build End Time" value:v9];

  uint64_t v10 = *(void **)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 40);
  [v5 renderStartTime];
  uint64_t v12 = (*(void (**)(uint64_t))(v11 + 16))(v11);
  [v10 exposePropertyWithFriendlyName:@"Render Start Time" value:v12];

  uint64_t v14 = *(void **)(a1 + 32);
  uint64_t v13 = *(void *)(a1 + 40);
  [v5 renderEndTime];
  double v16 = v15;

  (*(void (**)(uint64_t, double))(v13 + 16))(v13, v16);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  [v14 exposePropertyWithFriendlyName:@"Render End Time" value:v17];
}

void __54__SUUIMetricsPageRenderEvent_populateObjectInspector___block_invoke_4(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  id v5 = a2;
  [v5 requestStartTime];
  double v6 = (*(void (**)(uint64_t))(v4 + 16))(v4);
  [v3 exposePropertyWithFriendlyName:@"Request Start Time" value:v6];

  double v7 = (void *)a1[4];
  uint64_t v8 = a1[5];
  [v5 responseStartTime];
  uint64_t v9 = (*(void (**)(uint64_t))(v8 + 16))(v8);
  [v7 exposePropertyWithFriendlyName:@"Response Start Time" value:v9];

  uint64_t v10 = (void *)a1[4];
  uint64_t v11 = a1[5];
  [v5 responseEndTime];
  uint64_t v12 = (*(void (**)(uint64_t))(v11 + 16))(v11);
  [v10 exposePropertyWithFriendlyName:@"Response End Time" value:v12];

  uint64_t v13 = (void *)a1[4];
  uint64_t v14 = a1[6];
  uint64_t v15 = [v5 responseWasCached];

  (*(void (**)(uint64_t, uint64_t))(v14 + 16))(v14, v15);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  [v13 exposePropertyWithFriendlyName:@"Response Was Cached" value:v16];
}

- (NSArray)domChanges
{
  return &self->_domChanges->super;
}

- (NSArray)requests
{
  return &self->_requests->super;
}

- (NSDictionary)metricsBase
{
  return self->_metricsBase;
}

- (void)setMetricsBase:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricsBase, 0);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_domChanges, 0);
}

@end