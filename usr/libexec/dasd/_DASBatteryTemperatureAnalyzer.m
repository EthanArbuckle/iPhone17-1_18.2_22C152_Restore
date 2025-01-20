@interface _DASBatteryTemperatureAnalyzer
- (BOOL)isActive;
- (NSMutableDictionary)analyticsStatus;
- (NSString)analyzerName;
- (OS_dispatch_queue)executionQueue;
- (_CDContext)context;
- (_DASBatteryTemperatureAnalyzer)initWithQueueLimit:(unint64_t)a3 reader:(id)a4 monitoringInterval:(unint64_t)a5 analyzeToMonitorRatio:(unint64_t)a6;
- (_DASSignalQueue)batterytemperatureQueue;
- (_DASSignalReader)reader;
- (_DASTimer)monitoringTimer;
- (double)getReferenceTemperatureForContext:(id)a3 reader:(id)a4;
- (unint64_t)analyzeToMonitorRatio;
- (unint64_t)controlEffortResult;
- (unint64_t)monitorCount;
- (unint64_t)monitorInterval;
- (void)analyzeValues:(id)a3 currentContext:(id)a4;
- (void)recordValue;
- (void)setAnalyticsStatus:(id)a3;
- (void)setAnalyzeToMonitorRatio:(unint64_t)a3;
- (void)setAnalyzerName:(id)a3;
- (void)setBatterytemperatureQueue:(id)a3;
- (void)setContext:(id)a3;
- (void)setControlEffortResult:(unint64_t)a3;
- (void)setExecutionQueue:(id)a3;
- (void)setIsActive:(BOOL)a3;
- (void)setMonitorCount:(unint64_t)a3;
- (void)setMonitorInterval:(unint64_t)a3;
- (void)setMonitoringTimer:(id)a3;
- (void)setReader:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation _DASBatteryTemperatureAnalyzer

- (double)getReferenceTemperatureForContext:(id)a3 reader:(id)a4
{
  id v4 = a3;
  v5 = +[_CDContextQueries keyPathForBatteryLevel];
  v6 = [v4 objectForKeyedSubscript:v5];

  uint64_t v7 = (uint64_t)[v6 integerValue];
  if (v7 >= 60) {
    return (8.14409 / (pow((double)v7 / 77.02316, 45.64696) + 1.0) + 34.17899 + -1.0) * 100.0;
  }
  else {
    return 10000.0;
  }
}

- (void)analyzeValues:(id)a3 currentContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  executionQueue = self->_executionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000079CC;
  block[3] = &unk_100175548;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(executionQueue, block);
}

- (void)recordValue
{
  executionQueue = self->_executionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005090;
  block[3] = &unk_1001754F8;
  void block[4] = self;
  dispatch_sync(executionQueue, block);
}

- (_DASBatteryTemperatureAnalyzer)initWithQueueLimit:(unint64_t)a3 reader:(id)a4 monitoringInterval:(unint64_t)a5 analyzeToMonitorRatio:(unint64_t)a6
{
  id v11 = a4;
  v26.receiver = self;
  v26.super_class = (Class)_DASBatteryTemperatureAnalyzer;
  id v12 = [(_DASBatteryTemperatureAnalyzer *)&v26 init];
  if (v12)
  {
    v13 = [[_DASSignalQueue alloc] initWithCount:a3];
    batterytemperatureQueue = v12->_batterytemperatureQueue;
    v12->_batterytemperatureQueue = v13;

    uint64_t v15 = +[_CDClientContext userContext];
    context = v12->_context;
    v12->_context = (_CDContext *)v15;

    v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v18 = dispatch_queue_create("com.apple.das.clas.batteryTemperatureQueue", v17);
    executionQueue = v12->_executionQueue;
    v12->_executionQueue = (OS_dispatch_queue *)v18;

    objc_storeStrong((id *)&v12->_reader, a4);
    v12->_monitorInterval = a5;
    v12->_analyzeToMonitorRatio = a6;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000111F0;
    v24[3] = &unk_1001754F8;
    v20 = v12;
    v25 = v20;
    uint64_t v21 = +[_DASTimer timerWithCallback:v24];
    monitoringTimer = v20->_monitoringTimer;
    v20->_monitoringTimer = (_DASTimer *)v21;
  }
  return v12;
}

- (void)start
{
  executionQueue = self->_executionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002E218;
  block[3] = &unk_1001754F8;
  void block[4] = self;
  dispatch_sync(executionQueue, block);
}

- (void)stop
{
  executionQueue = self->_executionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002E2BC;
  block[3] = &unk_1001754F8;
  void block[4] = self;
  dispatch_sync(executionQueue, block);
}

- (NSMutableDictionary)analyticsStatus
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_10002E3C0;
  id v10 = sub_10002E3D0;
  id v11 = 0;
  executionQueue = self->_executionQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10002E3D8;
  v5[3] = &unk_100175598;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(executionQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSMutableDictionary *)v3;
}

- (unint64_t)controlEffortResult
{
  return self->_controlEffortResult;
}

- (void)setControlEffortResult:(unint64_t)a3
{
  self->_controlEffortResult = a3;
}

- (_DASSignalReader)reader
{
  return self->_reader;
}

- (void)setReader:(id)a3
{
}

- (unint64_t)analyzeToMonitorRatio
{
  return self->_analyzeToMonitorRatio;
}

- (void)setAnalyzeToMonitorRatio:(unint64_t)a3
{
  self->_analyzeToMonitorRatio = a3;
}

- (_CDContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (_DASSignalQueue)batterytemperatureQueue
{
  return self->_batterytemperatureQueue;
}

- (void)setBatterytemperatureQueue:(id)a3
{
}

- (OS_dispatch_queue)executionQueue
{
  return self->_executionQueue;
}

- (void)setExecutionQueue:(id)a3
{
}

- (_DASTimer)monitoringTimer
{
  return self->_monitoringTimer;
}

- (void)setMonitoringTimer:(id)a3
{
}

- (unint64_t)monitorInterval
{
  return self->_monitorInterval;
}

- (void)setMonitorInterval:(unint64_t)a3
{
  self->_monitorInterval = a3;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (unint64_t)monitorCount
{
  return self->_monitorCount;
}

- (void)setMonitorCount:(unint64_t)a3
{
  self->_monitorCount = a3;
}

- (NSString)analyzerName
{
  return self->_analyzerName;
}

- (void)setAnalyzerName:(id)a3
{
}

- (void)setAnalyticsStatus:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsStatus, 0);
  objc_storeStrong((id *)&self->_analyzerName, 0);
  objc_storeStrong((id *)&self->_monitoringTimer, 0);
  objc_storeStrong((id *)&self->_executionQueue, 0);
  objc_storeStrong((id *)&self->_batterytemperatureQueue, 0);
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end