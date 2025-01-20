@interface _APRSBiomeEventAnalyzer
+ (id)sharedInstance;
- (NSMutableDictionary)bookmarkDictionary;
- (OS_os_log)log;
- (_APRSBiomeEventAnalyzer)init;
- (id)allAppActivationTimeInfo;
- (id)allAppKillsInfo;
- (id)appActivationPublisherForEventsFrom:(id)a3;
- (id)appActivationTimeInfoStartingAtDate:(id)a3 withBookmarkKey:(id)a4;
- (id)appKillsInfoPublisherForEventsFrom:(id)a3;
- (id)appKillsInfoStartingAtDate:(id)a3 withBookmarkKey:(id)a4;
- (id)meanDeltaTimeBetweenColdLaunchAndResume;
- (id)meanDeltaTimeBetweenColdLaunchAndResumeStartingAtDate:(id)a3 withBookmarkKey:(id)a4;
- (void)logCompletion:(id)a3 forAnalysisName:(id)a4;
- (void)setBookmarkDictionary:(id)a3;
- (void)setLog:(id)a3;
- (void)setupDailyTask;
@end

@implementation _APRSBiomeEventAnalyzer

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100055F7C;
  block[3] = &unk_1001753E0;
  block[4] = a1;
  if (qword_1001C3E70 != -1) {
    dispatch_once(&qword_1001C3E70, block);
  }
  v2 = (void *)qword_1001C3E78;

  return v2;
}

- (_APRSBiomeEventAnalyzer)init
{
  v8.receiver = self;
  v8.super_class = (Class)_APRSBiomeEventAnalyzer;
  v2 = [(_APRSBiomeEventAnalyzer *)&v8 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.aprs", "appResume.BiomeAnalyzer");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    bookmarkDictionary = v2->_bookmarkDictionary;
    v2->_bookmarkDictionary = v5;

    [(NSMutableDictionary *)v2->_bookmarkDictionary setObject:0 forKeyedSubscript:@"appKillBookmark"];
    [(NSMutableDictionary *)v2->_bookmarkDictionary setObject:0 forKeyedSubscript:@"appActivationInfoBookmark"];
    [(NSMutableDictionary *)v2->_bookmarkDictionary setObject:0 forKeyedSubscript:@"appActivationMeanBookmark"];
    [(_APRSBiomeEventAnalyzer *)v2 setupDailyTask];
  }
  return v2;
}

- (void)logCompletion:(id)a3 forAnalysisName:(id)a4
{
  id v6 = a4;
  if ([a3 state])
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      sub_1000F6134();
    }
  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
  {
    sub_1000F60CC();
  }
}

- (void)setupDailyTask
{
  os_log_t v3 = +[BGSystemTaskScheduler sharedScheduler];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000562D0;
  v12[3] = &unk_100175600;
  v12[4] = self;
  [v3 registerForTaskWithIdentifier:@"com.apple.dasd.appResumeDaily" usingQueue:0 launchHandler:v12];

  v4 = +[BGSystemTaskScheduler sharedScheduler];
  v5 = [v4 taskRequestForIdentifier:@"com.apple.dasd.appResumeDaily"];

  if (!v5)
  {
    id v6 = [objc_alloc((Class)BGRepeatingSystemTaskRequest) initWithIdentifier:@"com.apple.dasd.appResumeDaily"];
    [v6 setPriority:1];
    [v6 setInterval:86400.0];
    v7 = +[BGSystemTaskScheduler sharedScheduler];
    id v11 = 0;
    unsigned __int8 v8 = [v7 submitTaskRequest:v6 error:&v11];
    id v9 = v11;

    if ((v8 & 1) == 0)
    {
      v10 = +[_DASDaemonLogger defaultCategory];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v14 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Failed to submit task with error: %@", buf, 0xCu);
      }
    }
  }
}

- (id)meanDeltaTimeBetweenColdLaunchAndResume
{
  os_log_t v3 = +[NSDate dateWithTimeIntervalSinceNow:-1814400.0];
  v4 = [(_APRSBiomeEventAnalyzer *)self meanDeltaTimeBetweenColdLaunchAndResumeStartingAtDate:v3 withBookmarkKey:@"appActivationMeanBookmark"];

  return v4;
}

- (id)meanDeltaTimeBetweenColdLaunchAndResumeStartingAtDate:(id)a3 withBookmarkKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = (void *)os_transaction_create();
  id v9 = +[NSString stringWithFormat:@"App Activation Metrics - Mean calculation - start date: %@", v6];
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = sub_10005698C;
  v28 = sub_10005699C;
  id v29 = objc_alloc_init((Class)NSMutableDictionary);
  v10 = [(NSMutableDictionary *)self->_bookmarkDictionary objectForKeyedSubscript:v7];
  id v11 = +[_APRSBiomeBase sharedEventQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000569A4;
  block[3] = &unk_100176400;
  block[4] = self;
  id v19 = v6;
  id v20 = v10;
  id v21 = v7;
  id v22 = v9;
  v23 = &v24;
  id v12 = v9;
  id v13 = v7;
  id v14 = v10;
  id v15 = v6;
  dispatch_sync(v11, block);
  id v16 = (id)v25[5];

  _Block_object_dispose(&v24, 8);

  return v16;
}

- (id)allAppActivationTimeInfo
{
  os_log_t v3 = +[NSDate dateWithTimeIntervalSinceNow:-1814400.0];
  v4 = [(_APRSBiomeEventAnalyzer *)self appActivationTimeInfoStartingAtDate:v3 withBookmarkKey:@"appActivationInfoBookmark"];

  return v4;
}

- (id)appActivationTimeInfoStartingAtDate:(id)a3 withBookmarkKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = (void *)os_transaction_create();
  id v9 = +[NSString stringWithFormat:@"App Activation Metrics - Info calculation - start date: %@", v6];
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = sub_10005698C;
  v28 = sub_10005699C;
  id v29 = 0;
  v10 = [(NSMutableDictionary *)self->_bookmarkDictionary objectForKeyedSubscript:v7];
  id v11 = +[_APRSBiomeBase sharedEventQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100056EF4;
  block[3] = &unk_100176400;
  block[4] = self;
  id v19 = v6;
  id v20 = v10;
  id v21 = v7;
  id v22 = v9;
  v23 = &v24;
  id v12 = v9;
  id v13 = v7;
  id v14 = v10;
  id v15 = v6;
  dispatch_sync(v11, block);
  id v16 = (id)v25[5];

  _Block_object_dispose(&v24, 8);

  return v16;
}

- (id)appActivationPublisherForEventsFrom:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = +[_APRSBiomeBase publisherForEventsStartingFromDate:v3];

  id v6 = [v5 filterWithIsIncluded:&stru_100176440];
  id v7 = [v6 reduceWithInitial:v4 nextPartialResult:&stru_100176480];

  return v7;
}

- (id)allAppKillsInfo
{
  id v3 = +[NSDate dateWithTimeIntervalSinceNow:-1814400.0];
  id v4 = [(_APRSBiomeEventAnalyzer *)self appKillsInfoStartingAtDate:v3 withBookmarkKey:@"appKillBookmark"];

  return v4;
}

- (id)appKillsInfoStartingAtDate:(id)a3 withBookmarkKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = (void *)os_transaction_create();
  id v9 = +[NSString stringWithFormat:@"App Kill Metrics - Info calculation - start date: %@", v6];
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = sub_10005698C;
  v28 = sub_10005699C;
  id v29 = 0;
  v10 = [(NSMutableDictionary *)self->_bookmarkDictionary objectForKeyedSubscript:v7];
  id v11 = +[_APRSBiomeBase sharedEventQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100057578;
  block[3] = &unk_100176400;
  block[4] = self;
  id v19 = v6;
  id v20 = v10;
  id v21 = v7;
  id v22 = v9;
  v23 = &v24;
  id v12 = v9;
  id v13 = v7;
  id v14 = v10;
  id v15 = v6;
  dispatch_sync(v11, block);
  id v16 = (id)v25[5];

  _Block_object_dispose(&v24, 8);

  return v16;
}

- (id)appKillsInfoPublisherForEventsFrom:(id)a3
{
  id v3 = +[_APRSBiomeBase publisherForEventsStartingFromDate:a3];
  id v4 = [v3 filterWithIsIncluded:&stru_1001764E0];
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  id v6 = [v4 reduceWithInitial:v5 nextPartialResult:&stru_100176500];

  return v6;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (NSMutableDictionary)bookmarkDictionary
{
  return self->_bookmarkDictionary;
}

- (void)setBookmarkDictionary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bookmarkDictionary, 0);

  objc_storeStrong((id *)&self->_log, 0);
}

@end