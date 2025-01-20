@interface CMSLogger
+ (id)_LoggingQueue;
- (BOOL)_checkDictionary:(id)a3 forKeyType:(Class)a4 andValueType:(Class)a5;
- (NSDictionary)entryRenamingDictionary;
- (NSString)logIdentity;
- (NSString)occuranceLog;
- (NSString)performanceLog;
- (double)reportFrequency;
- (id)_loggerStorage;
- (id)createNewSessionForType:(id)a3 withMetadata:(id)a4;
- (id)defaultSession;
- (id)initForIdentity:(id)a3;
- (id)sendEvent;
- (void)_fileMetrics;
- (void)_loadAnalyticsData;
- (void)_saveAnalyticsData;
- (void)_sumbitFromSessionType:(id)a3 withMetadata:(id)a4 withEventDurations:(id)a5 withEventOccurance:(id)a6;
- (void)setEntryRenamingDictionary:(id)a3;
- (void)setOccuranceLog:(id)a3;
- (void)setPerformanceLog:(id)a3;
- (void)setReportFrequency:(double)a3;
- (void)setSendEvent:(id)a3;
@end

@implementation CMSLogger

+ (id)_LoggingQueue
{
  if (qword_1000567F8 != -1) {
    dispatch_once(&qword_1000567F8, &stru_10004E770);
  }
  v2 = (void *)qword_100056800;

  return v2;
}

- (id)initForIdentity:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CMSLogger;
  v5 = [(CMSLogger *)&v24 init];
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    logIdentity = v5->_logIdentity;
    v5->_logIdentity = v6;

    uint64_t v8 = +[NSString stringWithFormat:@"%@.Performance", v5->_logIdentity];
    performanceLog = v5->_performanceLog;
    v5->_performanceLog = (NSString *)v8;

    uint64_t v10 = +[NSString stringWithFormat:@"%@.Occurance", v5->_logIdentity];
    occuranceLog = v5->_occuranceLog;
    v5->_occuranceLog = (NSString *)v10;

    uint64_t v12 = objc_opt_new();
    performanceData = v5->performanceData;
    v5->performanceData = (NSMutableDictionary *)v12;

    uint64_t v14 = objc_opt_new();
    performanceDataCount = v5->performanceDataCount;
    v5->performanceDataCount = (NSMutableDictionary *)v14;

    uint64_t v16 = objc_opt_new();
    metadata = v5->metadata;
    v5->metadata = (NSMutableDictionary *)v16;

    uint64_t v18 = objc_opt_new();
    occuranceData = v5->occuranceData;
    v5->occuranceData = (NSMutableDictionary *)v18;

    uint64_t v20 = +[NSDate date];
    lastTransitTimestamp = v5->_lastTransitTimestamp;
    v5->_lastTransitTimestamp = (NSDate *)v20;

    [(CMSLogger *)v5 _loadAnalyticsData];
    id sendEvent = v5->_sendEvent;
    v5->_id sendEvent = &stru_10004E7B0;
  }
  return v5;
}

- (double)reportFrequency
{
  [(NSTimer *)self->reportTimer timeInterval];
  return result;
}

- (void)setReportFrequency:(double)a3
{
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100031DCC;
  block[3] = &unk_10004E800;
  objc_copyWeak(v5, &location);
  v5[1] = *(id *)&a3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(v5);
  objc_destroyWeak(&location);
}

- (id)sendEvent
{
  id v2 = objc_retainBlock(self->_sendEvent);

  return v2;
}

- (void)setSendEvent:(id)a3
{
  id v4 = a3;
  v5 = +[CMSLogger _LoggingQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100032018;
  v7[3] = &unk_10004E828;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (id)defaultSession
{
  return [(CMSLogger *)self createNewSessionForType:&stru_10004F560 withMetadata:&__NSDictionary0__struct];
}

- (id)createNewSessionForType:(id)a3 withMetadata:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[CMSLoggingSession alloc] initForType:v7 withMetadata:v6];

  [v8 setBelongedLogger:self];

  return v8;
}

- (void)_sumbitFromSessionType:(id)a3 withMetadata:(id)a4 withEventDurations:(id)a5 withEventOccurance:(id)a6
{
  performanceData = self->performanceData;
  id v11 = a6;
  id v12 = a5;
  id v26 = a4;
  id v13 = a3;
  uint64_t v14 = [(NSMutableDictionary *)performanceData objectForKeyedSubscript:v13];
  v15 = [(NSMutableDictionary *)self->performanceDataCount objectForKeyedSubscript:v13];
  uint64_t v16 = +[NSMutableDictionary dictionaryWithDictionary:v14];
  +[NSMutableDictionary dictionaryWithDictionary:v15];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_10003241C;
  v33[3] = &unk_10004E850;
  id v34 = v14;
  id v35 = v15;
  id v36 = (id)objc_claimAutoreleasedReturnValue();
  id v37 = v16;
  id v17 = v16;
  id v18 = v36;
  id v27 = v15;
  id v19 = v14;
  [v12 enumerateKeysAndObjectsUsingBlock:v33];

  uint64_t v20 = [v19 objectForKeyedSubscript:@"Count"];
  v21 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)[v20 unsignedIntegerValue] + 1);
  [v17 setObject:v21 forKeyedSubscript:@"Count"];

  [(NSMutableDictionary *)self->performanceData setObject:v17 forKeyedSubscript:v13];
  [(NSMutableDictionary *)self->performanceDataCount setObject:v18 forKeyedSubscript:v13];
  v22 = [(NSMutableDictionary *)self->occuranceData objectForKeyedSubscript:v13];
  +[NSMutableDictionary dictionaryWithDictionary:v22];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100032578;
  v30[3] = &unk_10004E878;
  id v31 = v22;
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  id v32 = v23;
  id v24 = v22;
  [v11 enumerateKeysAndObjectsUsingBlock:v30];

  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100032638;
  v28[3] = &unk_10004E8A0;
  id v29 = v23;
  id v25 = v23;
  [v24 enumerateKeysAndObjectsUsingBlock:v28];
  [(NSMutableDictionary *)self->occuranceData setObject:v25 forKeyedSubscript:v13];
  [(NSMutableDictionary *)self->metadata setObject:v26 forKeyedSubscript:v13];

  [(CMSLogger *)self _saveAnalyticsData];
}

- (void)_fileMetrics
{
  v3 = +[CMSLogger _LoggingQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100032750;
  block[3] = &unk_10004CAC0;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (id)_loggerStorage
{
  id v3 = objc_alloc((Class)NSUserDefaults);
  id v4 = +[NSString stringWithFormat:@"%@.Metrics", self->_logIdentity];
  id v5 = [v3 initWithSuiteName:v4];

  return v5;
}

- (void)_saveAnalyticsData
{
  id v3 = [(CMSLogger *)self _loggerStorage];
  [v3 setObject:self->_lastTransitTimestamp forKey:@"lastTransitTimestamp"];
  [v3 setObject:self->performanceData forKey:@"performanceData"];
  [v3 setObject:self->performanceDataCount forKey:@"performanceDataCount"];
  [v3 setObject:self->occuranceData forKey:@"occuranceData"];
  [v3 setObject:self->metadata forKey:@"metadata"];
  [(NSTimer *)self->reportTimer timeInterval];
  [v3 setDouble:forKey:@"ReportInterval"];
  [v3 synchronize];
}

- (BOOL)_checkDictionary:(id)a3 forKeyType:(Class)a4 andValueType:(Class)a5
{
  id v7 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 1;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100032EB4;
  v9[3] = &unk_10004E8F0;
  v9[5] = a4;
  v9[6] = a5;
  v9[4] = &v10;
  [v7 enumerateKeysAndObjectsUsingBlock:v9];
  LOBYTE(a5) = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);

  return (char)a5;
}

- (void)_loadAnalyticsData
{
  id v13 = [(CMSLogger *)self _loggerStorage];
  id v3 = [v13 objectForKey:@"lastTransitTimestamp"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_storeStrong((id *)&self->_lastTransitTimestamp, v3);
  }
  id v4 = [v13 objectForKey:@"performanceData"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = objc_opt_class();
    if ([(CMSLogger *)self _checkDictionary:v4 forKeyType:v5 andValueType:objc_opt_class()])
    {
      [(NSMutableDictionary *)self->performanceData addEntriesFromDictionary:v4];
    }
  }
  id v6 = [v13 objectForKey:@"performanceDataCount"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = objc_opt_class();
    if ([(CMSLogger *)self _checkDictionary:v6 forKeyType:v7 andValueType:objc_opt_class()])
    {
      [(NSMutableDictionary *)self->performanceDataCount addEntriesFromDictionary:v6];
    }
  }
  id v8 = [v13 objectForKey:@"occuranceData"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = objc_opt_class();
    if ([(CMSLogger *)self _checkDictionary:v8 forKeyType:v9 andValueType:objc_opt_class()])
    {
      [(NSMutableDictionary *)self->occuranceData addEntriesFromDictionary:v8];
    }
  }
  uint64_t v10 = [v13 objectForKey:@"metadata"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = objc_opt_class();
    if ([(CMSLogger *)self _checkDictionary:v10 forKeyType:v11 andValueType:objc_opt_class()])
    {
      [(NSMutableDictionary *)self->metadata addEntriesFromDictionary:v10];
    }
  }
  [v13 doubleForKey:@"ReportInterval"];
  if (v12 > 0.0) {
    -[CMSLogger setReportFrequency:](self, "setReportFrequency:");
  }
}

- (NSString)logIdentity
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (NSString)performanceLog
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setPerformanceLog:(id)a3
{
}

- (NSString)occuranceLog
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setOccuranceLog:(id)a3
{
}

- (NSDictionary)entryRenamingDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setEntryRenamingDictionary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entryRenamingDictionary, 0);
  objc_storeStrong((id *)&self->_occuranceLog, 0);
  objc_storeStrong((id *)&self->_performanceLog, 0);
  objc_storeStrong((id *)&self->_logIdentity, 0);
  objc_storeStrong(&self->_sendEvent, 0);
  objc_storeStrong((id *)&self->occuranceData, 0);
  objc_storeStrong((id *)&self->performanceDataCount, 0);
  objc_storeStrong((id *)&self->performanceData, 0);
  objc_storeStrong((id *)&self->metadata, 0);
  objc_storeStrong((id *)&self->reportTimer, 0);

  objc_storeStrong((id *)&self->_lastTransitTimestamp, 0);
}

@end