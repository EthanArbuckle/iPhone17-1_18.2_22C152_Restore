@interface _DASPostRestoreBUILogger
+ (id)sharedInstance;
- (OS_os_log)log;
- (_DASPostRestoreBUILogger)init;
- (_DASRuntimeLimiter)runtimeLimiter;
- (void)reportState:(unint64_t)a3 forActivity:(id)a4;
- (void)reportState:(unint64_t)a3 forTaskName:(id)a4 featureCode:(id)a5 involvedProcesses:(id)a6;
- (void)setLog:(id)a3;
- (void)setRuntimeLimiter:(id)a3;
@end

@implementation _DASPostRestoreBUILogger

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000989F4;
  block[3] = &unk_1001753E0;
  block[4] = a1;
  if (qword_1001C42E0 != -1) {
    dispatch_once(&qword_1001C42E0, block);
  }
  v2 = (void *)qword_1001C42D8;

  return v2;
}

- (_DASPostRestoreBUILogger)init
{
  v8.receiver = self;
  v8.super_class = (Class)_DASPostRestoreBUILogger;
  v2 = [(_DASPostRestoreBUILogger *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[_DASDaemonLogger logForCategory:@"postRestoreBUILogger"];
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    uint64_t v5 = +[_DASRuntimeLimiter sharedLimiter];
    runtimeLimiter = v2->_runtimeLimiter;
    v2->_runtimeLimiter = (_DASRuntimeLimiter *)v5;
  }
  return v2;
}

- (void)reportState:(unint64_t)a3 forActivity:(id)a4
{
  id v6 = a4;
  v7 = [v6 fastPass];

  if (v7
    && (a3 != 10
     || ![(_DASRuntimeLimiter *)self->_runtimeLimiter featureHasNoRemainingRuntimeForActivity:v6]))
  {
    objc_super v8 = [v6 serviceName];

    if (v8)
    {
      v9 = [v6 identifier];
      v10 = [v6 featureCodes];
      v11 = [v6 serviceName];
      v14 = v11;
      v12 = +[NSArray arrayWithObjects:&v14 count:1];
      [(_DASPostRestoreBUILogger *)self reportState:a3 forTaskName:v9 featureCode:v10 involvedProcesses:v12];
    }
    else
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
        sub_1000FBFFC(log, v6);
      }
    }
  }
}

- (void)reportState:(unint64_t)a3 forTaskName:(id)a4 featureCode:(id)a5 involvedProcesses:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ((uint64_t)a3 > 29)
  {
    if (a3 != 30 && a3 != 50) {
      goto LABEL_15;
    }
    unint64_t v13 = 30;
  }
  else
  {
    unint64_t v13 = a3;
    if (a3 != 10)
    {
      if (a3 != 20) {
        goto LABEL_15;
      }
      unint64_t v13 = 20;
    }
  }
  v14 = +[NSMutableDictionary dictionary];
  [v14 setObject:v10 forKeyedSubscript:@"fastPassName"];
  [v14 setObject:v11 forKeyedSubscript:@"featureCodes"];
  v15 = +[NSNumber numberWithUnsignedInteger:v13];
  [v14 setObject:v15 forKeyedSubscript:@"state"];

  [v14 setObject:v12 forKeyedSubscript:@"processName"];
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138412290;
    v21 = v14;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Reporting %@ for BUI via PPS", (uint8_t *)&v20, 0xCu);
  }
  v17 = +[_DASPPSDataManager sharedInstance];
  [v17 sendDataToPPS:v14 subsystem:@"XPCMetrics" category:@"OngoingRestore"];

  if (a3 == 30)
  {
    [v14 setObject:&off_100187258 forKeyedSubscript:@"state"];
    v18 = self->_log;
    if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412290;
      v21 = v14;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v18, OS_LOG_TYPE_DEFAULT, "Reporting %@ for BUI via PPS", (uint8_t *)&v20, 0xCu);
    }
    v19 = +[_DASPPSDataManager sharedInstance];
    [v19 sendDataToPPS:v14 subsystem:@"XPCMetrics" category:@"OngoingRestore"];
  }
LABEL_15:
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (_DASRuntimeLimiter)runtimeLimiter
{
  return self->_runtimeLimiter;
}

- (void)setRuntimeLimiter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runtimeLimiter, 0);

  objc_storeStrong((id *)&self->_log, 0);
}

@end