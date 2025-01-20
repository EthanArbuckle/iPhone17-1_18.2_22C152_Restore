@interface _DASBARMetricRecorder
+ (BOOL)shouldRecordBARMetricForActivity:(id)a3;
+ (id)sharedInstance;
- (NSMutableDictionary)barMetricDict;
- (NSUserDefaults)defaults;
- (OS_dispatch_queue)queue;
- (OS_os_log)log;
- (_DASBARMetricRecorder)init;
- (id)fetchLatestBARMetric;
- (void)loadState;
- (void)recordBARMetric:(id)a3 atStage:(int64_t)a4;
- (void)resetBARMetric;
- (void)saveState;
- (void)setBarMetricDict:(id)a3;
- (void)setDefaults:(id)a3;
- (void)setLog:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation _DASBARMetricRecorder

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002E618;
  block[3] = &unk_1001753E0;
  block[4] = a1;
  if (qword_1001C3B98 != -1) {
    dispatch_once(&qword_1001C3B98, block);
  }
  v2 = (void *)qword_1001C3B90;

  return v2;
}

- (_DASBARMetricRecorder)init
{
  v11.receiver = self;
  v11.super_class = (Class)_DASBARMetricRecorder;
  v2 = [(_DASBARMetricRecorder *)&v11 init];
  if (v2)
  {
    uint64_t v3 = +[_DASDaemonLogger logForCategory:@"barMetricRecorder"];
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    v5 = v2->_log;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_1000F4390(v5);
    }
    v6 = (NSUserDefaults *)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.dasd.barMetricRecorder"];
    defaults = v2->_defaults;
    v2->_defaults = v6;

    uint64_t v8 = +[NSMutableDictionary dictionary];
    barMetricDict = v2->_barMetricDict;
    v2->_barMetricDict = (NSMutableDictionary *)v8;

    [(_DASBARMetricRecorder *)v2 loadState];
  }
  return v2;
}

+ (BOOL)shouldRecordBARMetricForActivity:(id)a3
{
  id v3 = a3;
  v4 = [v3 launchReason];
  if ([v4 isEqualToString:_DASLaunchReasonBackgroundRemoteNotification])
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    v6 = [v3 launchReason];
    unsigned __int8 v5 = [v6 isEqualToString:_DASLaunchReasonBackgroundRefresh];
  }
  return v5;
}

- (void)loadState
{
  v2 = self;
  objc_sync_enter(v2);
  [(NSMutableDictionary *)v2->_barMetricDict removeAllObjects];
  id v3 = [(NSUserDefaults *)v2->_defaults objectForKey:@"BARMetricDict"];
  id v4 = [v3 mutableCopy];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        barMetricDict = v2->_barMetricDict;
        objc_super v11 = [v5 objectForKeyedSubscript:v9];
        [(NSMutableDictionary *)barMetricDict setObject:v11 forKey:v9];
      }
      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  log = v2->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
    sub_1000F43D4((uint64_t *)&v2->_barMetricDict, log);
  }

  objc_sync_exit(v2);
}

- (void)saveState
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [objc_alloc((Class)NSDictionary) initWithDictionary:v2->_barMetricDict copyItems:1];
  [(NSUserDefaults *)v2->_defaults setObject:v3 forKey:@"BARMetricDict"];
  id v4 = v2->_log;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = [(NSUserDefaults *)v2->_defaults objectForKey:@"BARMetricDict"];
    sub_1000F4450(v5, v6, v4);
  }

  objc_sync_exit(v2);
}

- (void)resetBARMetric
{
  v2 = self;
  objc_sync_enter(v2);
  [(NSMutableDictionary *)v2->_barMetricDict removeAllObjects];
  [(NSMutableDictionary *)v2->_barMetricDict setObject:&off_100186B68 forKeyedSubscript:@"BgRefreshSubmissionCount"];
  [(NSMutableDictionary *)v2->_barMetricDict setObject:&off_100186B68 forKeyedSubscript:@"BgRefreshCompletionCount"];
  [(NSMutableDictionary *)v2->_barMetricDict setObject:&off_100186B68 forKeyedSubscript:@"PushLaunchSubmissionCount"];
  [(NSMutableDictionary *)v2->_barMetricDict setObject:&off_100186B68 forKeyedSubscript:@"PushLaunchCompletionCount"];
  [(_DASBARMetricRecorder *)v2 saveState];
  log = v2->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
    sub_1000F44A8((uint64_t *)&v2->_barMetricDict, log);
  }
  objc_sync_exit(v2);
}

- (void)recordBARMetric:(id)a3 atStage:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  if (a4 == 1)
  {
    v12 = [v6 launchReason];
    unsigned int v9 = [v12 isEqualToString:_DASLaunchReasonBackgroundRefresh];

    CFStringRef v10 = @"PushLaunchCompletionCount";
    CFStringRef v11 = @"BgRefreshCompletionCount";
LABEL_5:
    if (v9) {
      CFStringRef v13 = v11;
    }
    else {
      CFStringRef v13 = v10;
    }
    goto LABEL_11;
  }
  if (!a4)
  {
    uint64_t v8 = [v6 launchReason];
    unsigned int v9 = [v8 isEqualToString:_DASLaunchReasonBackgroundRefresh];

    CFStringRef v10 = @"PushLaunchSubmissionCount";
    CFStringRef v11 = @"BgRefreshSubmissionCount";
    goto LABEL_5;
  }
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR)) {
    sub_1000F4524(a4, log);
  }
  CFStringRef v13 = 0;
LABEL_11:
  long long v15 = self;
  objc_sync_enter(v15);
  long long v16 = [(NSMutableDictionary *)v15->_barMetricDict objectForKeyedSubscript:v13];
  uint64_t v17 = [v16 intValue] + 1;

  v18 = +[NSNumber numberWithInt:v17];
  [(NSMutableDictionary *)v15->_barMetricDict setObject:v18 forKeyedSubscript:v13];

  objc_sync_exit(v15);
  [(_DASBARMetricRecorder *)v15 saveState];
}

- (id)fetchLatestBARMetric
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_barMetricDict;
  objc_sync_exit(v2);

  return v3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
}

- (NSMutableDictionary)barMetricDict
{
  return self->_barMetricDict;
}

- (void)setBarMetricDict:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_barMetricDict, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_log, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end