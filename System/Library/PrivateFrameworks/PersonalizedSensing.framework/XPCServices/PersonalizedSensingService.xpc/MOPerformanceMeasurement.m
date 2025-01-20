@interface MOPerformanceMeasurement
+ (BOOL)isEnabled;
- (BOOL)measureRecentPeak;
- (MOPerformanceMeasurement)initWithName:(id)a3 measureRecentPeak:(BOOL)a4;
- (NSMutableDictionary)metrics;
- (NSString)name;
- (id)description;
- (void)_addMetricWithKey:(id)a3 name:(id)a4 unit:(id)a5 denominator:(double)a6 pcMetricID:(unint64_t)a7;
- (void)_evaluateEndedSession:(pc_session *)a3 duration:(double)a4;
- (void)dealloc;
- (void)endSession;
- (void)measureBlock:(id)a3;
- (void)setMetrics:(id)a3;
- (void)setName:(id)a3;
- (void)startSession;
@end

@implementation MOPerformanceMeasurement

- (MOPerformanceMeasurement)initWithName:(id)a3 measureRecentPeak:(BOOL)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MOPerformanceMeasurement;
  v8 = [(MOPerformanceMeasurement *)&v12 init];
  v9 = v8;
  if (v8)
  {
    v8->_session = 0;
    v10 = objc_opt_new();
    [(MOPerformanceMeasurement *)v9 setMetrics:v10];

    objc_storeStrong((id *)&v9->_name, a3);
    v9->_measureRecentPeak = a4;
    [(MOPerformanceMeasurement *)v9 _addMetricWithKey:@"MOPerformanceMetricExecutionTime" name:@"Execution Time" unit:@"ms" denominator:0 pcMetricID:1.0];
    [(MOPerformanceMeasurement *)v9 _addMetricWithKey:@"MOPerformanceMetricCPUTime" name:@"CPU Time" unit:@"ms" denominator:0x63707574696D6500 pcMetricID:1000000.0];
    [(MOPerformanceMeasurement *)v9 _addMetricWithKey:@"MOPerformanceMetricLifetimeMemPeak" name:@"Lifetime Peak" unit:@"MB" denominator:0x6C6966657065616BLL pcMetricID:1000.0];
    [(MOPerformanceMeasurement *)v9 _addMetricWithKey:@"MOPerformanceMetricDeltaMem" name:@"Mem Delta" unit:@"MB" denominator:0x6D656D64656C7461 pcMetricID:1000.0];
    if (v9->_measureRecentPeak)
    {
      [(MOPerformanceMeasurement *)v9 _addMetricWithKey:@"MOPerformanceMetricDeltaMemPeak" name:@"Peak Delta" unit:@"MB" denominator:0x7065616B646C7461 pcMetricID:1000.0];
      [(MOPerformanceMeasurement *)v9 _addMetricWithKey:@"MOPerformanceMetricRecentMemPeak" name:@"Recent Peak" unit:@"MB" denominator:0x72636E747065616BLL pcMetricID:1000.0];
    }
  }

  return v9;
}

- (id)description
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy_;
  objc_super v12 = __Block_byref_object_dispose_;
  id v3 = [(MOPerformanceMeasurement *)self name];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"\n=========== %s ===========\n", [v3 UTF8String]);
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  v4 = [(MOPerformanceMeasurement *)self metrics];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __39__MOPerformanceMeasurement_description__block_invoke;
  v7[3] = &unk_1000A49C0;
  v7[4] = &v8;
  [v4 enumerateKeysAndObjectsUsingBlock:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __39__MOPerformanceMeasurement_description__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v10 = v4;
  id v6 = [v4 description];
  uint64_t v7 = objc_msgSend(v5, "stringByAppendingFormat:", @"%s\n", objc_msgSend(v6, "UTF8String"));
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

- (void)measureBlock:(id)a3
{
  id v4 = (void (**)(void))a3;
  [(MOPerformanceMeasurement *)self startSession];
  v4[2]();
  [(MOPerformanceMeasurement *)self endSession];
}

- (void)startSession
{
  if (+[MOPerformanceMeasurement isEnabled])
  {
    if (self->_session)
    {
      pc_session_end();
      pc_session_destroy();
      startDate = self->_startDate;
      self->_startDate = 0;
      self->_session = 0;
    }
    uint64_t v4 = pc_session_create();
    if (v4)
    {
      id v5 = (pc_session *)v4;
      id v6 = +[NSProcessInfo processInfo];
      [v6 processIdentifier];
      pc_session_set_procpid();

      if (self->_measureRecentPeak)
      {
        pc_session_add_metric();
        pc_session_add_metric();
      }
      uint64_t v7 = (NSDate *)objc_opt_new();
      uint64_t v8 = self->_startDate;
      self->_startDate = v7;

      self->_session = v5;
      _pc_session_begin(v5);
    }
  }
}

- (void)endSession
{
  if (self->_session)
  {
    pc_session_end();
    session = self->_session;
    uint64_t v4 = objc_opt_new();
    [v4 timeIntervalSinceDate:self->_startDate];
    -[MOPerformanceMeasurement _evaluateEndedSession:duration:](self, "_evaluateEndedSession:duration:", session);

    pc_session_destroy();
    startDate = self->_startDate;
    self->_startDate = 0;
    self->_session = 0;

    id v6 = _mo_log_facility_get_os_log(&MOLogFacilityPerformance);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      id v7 = [(MOPerformanceMeasurement *)self description];
      int v8 = 136315138;
      id v9 = [v7 UTF8String];
      _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "METRICS: %s", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)dealloc
{
  [(MOPerformanceMeasurement *)self endSession];
  v3.receiver = self;
  v3.super_class = (Class)MOPerformanceMeasurement;
  [(MOPerformanceMeasurement *)&v3 dealloc];
}

+ (BOOL)isEnabled
{
  return 1;
}

- (void)_addMetricWithKey:(id)a3 name:(id)a4 unit:(id)a5 denominator:(double)a6 pcMetricID:(unint64_t)a7
{
  id v16 = a3;
  id v12 = a4;
  id v13 = a5;
  v14 = [[MOPerformanceMetric alloc] initWithDisplayName:v12 pcMetricID:a7 unit:v13 denominator:a6];
  v15 = [(MOPerformanceMeasurement *)self metrics];
  [v15 setObject:v14 forKeyedSubscript:v16];
}

- (void)_evaluateEndedSession:(pc_session *)a3 duration:(double)a4
{
  id v7 = [(MOPerformanceMeasurement *)self metrics];
  int v8 = [v7 objectForKeyedSubscript:@"MOPerformanceMetricExecutionTime"];
  [v8 setRawValue:a4 * 1000.0];

  id v9 = [(MOPerformanceMeasurement *)self metrics];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __59__MOPerformanceMeasurement__evaluateEndedSession_duration___block_invoke;
  v10[3] = &__block_descriptor_40_e46_v32__0__NSString_8__MOPerformanceMetric_16_B24l;
  v10[4] = a3;
  [v9 enumerateKeysAndObjectsUsingBlock:v10];
}

void __59__MOPerformanceMeasurement__evaluateEndedSession_duration___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  if ([v3 pcMetricID])
  {
    [v3 pcMetricID];
    if (!pc_session_get_value()) {
      [v3 setRawValue:0.0];
    }
  }
}

- (NSMutableDictionary)metrics
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMetrics:(id)a3
{
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setName:(id)a3
{
}

- (BOOL)measureRecentPeak
{
  return self->_measureRecentPeak;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end