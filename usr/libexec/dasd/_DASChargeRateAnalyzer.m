@interface _DASChargeRateAnalyzer
- (BOOL)encounteredTLC;
- (BOOL)isActive;
- (NSMutableDictionary)analyticsStatus;
- (NSString)analyzerName;
- (OS_dispatch_queue)executionQueue;
- (_CDContext)context;
- (_DASChargeRateAnalyzer)initWithQueueLimit:(unint64_t)a3 reader:(id)a4 monitoringInterval:(unint64_t)a5 analyzeToMonitorRatio:(unint64_t)a6;
- (_DASSignalQueue)chargeRateQueue;
- (_DASSignalReader)reader;
- (_DASTimer)monitoringTimer;
- (double)getReferenceChargeRateForContext:(id)a3 reader:(id)a4;
- (unint64_t)analyzeToMonitorRatio;
- (unint64_t)controlEffortResult;
- (unint64_t)monitorCount;
- (unint64_t)monitorInterval;
- (void)analyzeValues:(id)a3 currentContext:(id)a4;
- (void)recordValue;
- (void)setAnalyticsStatus:(id)a3;
- (void)setAnalyzeToMonitorRatio:(unint64_t)a3;
- (void)setAnalyzerName:(id)a3;
- (void)setChargeRateQueue:(id)a3;
- (void)setContext:(id)a3;
- (void)setControlEffortResult:(unint64_t)a3;
- (void)setEncounteredTLC:(BOOL)a3;
- (void)setExecutionQueue:(id)a3;
- (void)setIsActive:(BOOL)a3;
- (void)setMonitorCount:(unint64_t)a3;
- (void)setMonitorInterval:(unint64_t)a3;
- (void)setMonitoringTimer:(id)a3;
- (void)setReader:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation _DASChargeRateAnalyzer

- (void)analyzeValues:(id)a3 currentContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  executionQueue = self->_executionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009CAC;
  block[3] = &unk_100175548;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(executionQueue, block);
}

- (double)getReferenceChargeRateForContext:(id)a3 reader:(id)a4
{
  id v4 = a3;
  v5 = +[_CDContextQueries keyPathForBatteryLevel];
  id v6 = [v4 objectForKeyedSubscript:v5];
  unint64_t v7 = (unint64_t)[v6 integerValue];

  v8 = +[_CDContextQueries keyPathForBatteryStateDataDictionary];
  id v9 = [v4 objectForKeyedSubscript:v8];

  if (+[_DASRequiresPluggedInPolicy isWirelessCharger:v9])
  {
    double v10 = 0.75;
    if ((uint64_t)v7 >= 50)
    {
      double v10 = 0.375;
      if (v7 >= 0x3C)
      {
        if (v7 >= 0x50)
        {
          if (v7 < 0x5A)
          {
            double v10 = 0.15;
            goto LABEL_18;
          }
          BOOL v11 = v7 >= 0x5F;
          double v12 = 0.1125;
          goto LABEL_15;
        }
        goto LABEL_12;
      }
    }
  }
  else
  {
    if ((uint64_t)v7 < 50)
    {
      double v10 = 0.9;
      goto LABEL_18;
    }
    double v10 = 0.75;
    if (v7 >= 0x3C)
    {
      double v10 = 0.375;
      if (v7 >= 0x50)
      {
        if (v7 >= 0x5A)
        {
          BOOL v11 = v7 >= 0x5F;
          double v12 = 0.15;
LABEL_15:
          if (v11) {
            double v10 = 0.0;
          }
          else {
            double v10 = v12;
          }
          goto LABEL_18;
        }
LABEL_12:
        double v10 = 0.225;
      }
    }
  }
LABEL_18:

  return v10;
}

- (void)recordValue
{
  executionQueue = self->_executionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004B94;
  block[3] = &unk_1001754F8;
  block[4] = self;
  dispatch_sync(executionQueue, block);
}

- (_DASChargeRateAnalyzer)initWithQueueLimit:(unint64_t)a3 reader:(id)a4 monitoringInterval:(unint64_t)a5 analyzeToMonitorRatio:(unint64_t)a6
{
  id v11 = a4;
  v26.receiver = self;
  v26.super_class = (Class)_DASChargeRateAnalyzer;
  double v12 = [(_DASChargeRateAnalyzer *)&v26 init];
  if (v12)
  {
    id v13 = [[_DASSignalQueue alloc] initWithCount:a3];
    chargeRateQueue = v12->_chargeRateQueue;
    v12->_chargeRateQueue = v13;

    objc_storeStrong((id *)&v12->_analyzerName, off_1001C2A78);
    uint64_t v15 = +[_CDClientContext userContext];
    context = v12->_context;
    v12->_context = (_CDContext *)v15;

    v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v18 = dispatch_queue_create("com.apple.das.clas.chargeRateQueue", v17);
    executionQueue = v12->_executionQueue;
    v12->_executionQueue = (OS_dispatch_queue *)v18;

    objc_storeStrong((id *)&v12->_reader, a4);
    v12->_monitorInterval = a5;
    v12->_analyzeToMonitorRatio = a6;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000110D8;
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
  block[2] = sub_10002F054;
  block[3] = &unk_1001754F8;
  block[4] = self;
  dispatch_sync(executionQueue, block);
}

- (void)stop
{
  executionQueue = self->_executionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002F0F8;
  block[3] = &unk_1001754F8;
  block[4] = self;
  dispatch_sync(executionQueue, block);
}

- (NSMutableDictionary)analyticsStatus
{
  uint64_t v6 = 0;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_10002F1FC;
  double v10 = sub_10002F20C;
  id v11 = 0;
  executionQueue = self->_executionQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10002F214;
  v5[3] = &unk_100175598;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(executionQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSMutableDictionary *)v3;
}

- (BOOL)encounteredTLC
{
  return self->_encounteredTLC;
}

- (void)setEncounteredTLC:(BOOL)a3
{
  self->_encounteredTLC = a3;
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

- (_DASSignalQueue)chargeRateQueue
{
  return self->_chargeRateQueue;
}

- (void)setChargeRateQueue:(id)a3
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
  objc_storeStrong((id *)&self->_chargeRateQueue, 0);
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end