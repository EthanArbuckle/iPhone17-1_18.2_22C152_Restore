@interface _APRSSignpostReader
- (DASDelegate)dasDelegate;
- (NSMutableDictionary)launches;
- (NSMutableDictionary)resumes;
- (OS_dispatch_queue)queue;
- (OS_os_log)log;
- (_APRSSignpostReader)init;
- (void)begin;
- (void)end;
- (void)logAppResumeAndLaunchesFrom:(id)a3 endDate:(id)a4;
- (void)processSignpostInterval:(id)a3;
- (void)recordResumesAndLaunches;
- (void)setDasDelegate:(id)a3;
- (void)setLaunches:(id)a3;
- (void)setLog:(id)a3;
- (void)setQueue:(id)a3;
- (void)setResumes:(id)a3;
- (void)updateLaunchesForProcess:(id)a3 withInterval:(id)a4;
- (void)updateResumesForProcess:(id)a3 withInterval:(id)a4;
@end

@implementation _APRSSignpostReader

- (_APRSSignpostReader)init
{
  v15.receiver = self;
  v15.super_class = (Class)_APRSSignpostReader;
  v2 = [(_APRSSignpostReader *)&v15 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.appResume.signpostReader", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    os_log_t v6 = os_log_create("com.apple.aprs", "appResume.signpostReader");
    log = v2->_log;
    v2->_log = (OS_os_log *)v6;

    uint64_t v8 = +[NSMutableDictionary dictionary];
    resumes = v2->_resumes;
    v2->_resumes = (NSMutableDictionary *)v8;

    uint64_t v10 = +[NSMutableDictionary dictionary];
    launches = v2->_launches;
    v2->_launches = (NSMutableDictionary *)v10;

    uint64_t v12 = objc_opt_new();
    dasDelegate = v2->_dasDelegate;
    v2->_dasDelegate = (DASDelegate *)v12;
  }
  return v2;
}

- (void)begin
{
}

- (void)end
{
}

- (void)logAppResumeAndLaunchesFrom:(id)a3 endDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000538F4;
  block[3] = &unk_100175548;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, block);
}

- (void)processSignpostInterval:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"ProcessName"];
  if (v5)
  {
    id v6 = (void *)v5;
    uint64_t v7 = [v4 objectForKeyedSubscript:@"DurationSeconds"];
    if (v7)
    {
      uint64_t v8 = (void *)v7;
      id v9 = [v4 objectForKeyedSubscript:@"BeginEvent"];

      if (v9)
      {
        id v10 = [v4 objectForKeyedSubscript:@"ProcessName"];
        v11 = +[_DASAppResumePLLogger applicationBundleIDForExecutableName:v10];
        if (v11)
        {
          if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
            sub_1000F5E74();
          }
          id v12 = [v4 objectForKeyedSubscript:@"BeginEvent"];
          unsigned int v13 = [v12 isEqualToString:@"AppLaunch"];

          if (v13)
          {
            [(_APRSSignpostReader *)self updateLaunchesForProcess:v11 withInterval:v4];
          }
          else
          {
            objc_super v15 = [v4 objectForKeyedSubscript:@"BeginEvent"];
            unsigned int v16 = [v15 isEqualToString:@"AppResume"];

            if (v16) {
              [(_APRSSignpostReader *)self updateResumesForProcess:v11 withInterval:v4];
            }
          }
        }

        goto LABEL_15;
      }
    }
    else
    {
    }
  }
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR)) {
    sub_1000F5E30((os_log_t)log);
  }
LABEL_15:
}

- (void)updateResumesForProcess:(id)a3 withInterval:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
    sub_1000F5F50(log, v7);
  }
  id v9 = [v7 objectForKeyedSubscript:@"DurationSeconds"];
  [v9 floatValue];
  unint64_t v11 = (unint64_t)(float)(v10 * 1000.0);

  if (v11 < 0x1389)
  {
    id v12 = [(NSMutableDictionary *)self->_resumes objectForKeyedSubscript:v6];

    if (v12)
    {
      unsigned int v13 = [(NSMutableDictionary *)self->_resumes objectForKeyedSubscript:v6];
      v14 = +[NSNumber numberWithUnsignedLongLong:v11];
      [v13 addObject:v14];
    }
    else
    {
      id v15 = objc_alloc_init((Class)NSMutableArray);
      unsigned int v16 = +[NSNumber numberWithUnsignedLongLong:v11];
      [v15 addObject:v16];

      [(NSMutableDictionary *)self->_resumes setObject:v15 forKey:v6];
    }
  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
  {
    sub_1000F5EE8();
  }
}

- (void)updateLaunchesForProcess:(id)a3 withInterval:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
    sub_1000F5FEC(log, v7);
  }
  id v9 = [v7 objectForKeyedSubscript:@"DurationSeconds"];
  [v9 floatValue];
  unint64_t v11 = (unint64_t)(float)(v10 * 1000.0);

  if (v11 < 0x1389)
  {
    id v12 = [(NSMutableDictionary *)self->_launches objectForKeyedSubscript:v6];

    if (v12)
    {
      unsigned int v13 = [(NSMutableDictionary *)self->_launches objectForKeyedSubscript:v6];
      v14 = +[NSNumber numberWithUnsignedLongLong:v11];
      [v13 addObject:v14];
    }
    else
    {
      id v15 = objc_alloc_init((Class)NSMutableArray);
      unsigned int v16 = +[NSNumber numberWithUnsignedLongLong:v11];
      [v15 addObject:v16];

      [(NSMutableDictionary *)self->_launches setObject:v15 forKey:v6];
    }
  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
  {
    sub_1000F5EE8();
  }
}

- (void)recordResumesAndLaunches
{
  v3 = +[NSMutableArray array];
  resumes = self->_resumes;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10005424C;
  v16[3] = &unk_1001762E0;
  int v18 = 1;
  id v6 = v3;
  id v17 = v6;
  [(NSMutableDictionary *)resumes enumerateKeysAndObjectsUsingBlock:v16];
  launches = self->_launches;
  float v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  id v12 = sub_1000543C0;
  unsigned int v13 = &unk_1001762E0;
  int v15 = 0;
  id v8 = v6;
  id v14 = v8;
  [(NSMutableDictionary *)launches enumerateKeysAndObjectsUsingBlock:&v10];

  id v9 = +[_APRSMetricRecorder sharedInstance];
  [v9 reportActivationTimes:v8];
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSMutableDictionary)resumes
{
  return self->_resumes;
}

- (void)setResumes:(id)a3
{
}

- (NSMutableDictionary)launches
{
  return self->_launches;
}

- (void)setLaunches:(id)a3
{
}

- (DASDelegate)dasDelegate
{
  return self->_dasDelegate;
}

- (void)setDasDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dasDelegate, 0);
  objc_storeStrong((id *)&self->_launches, 0);
  objc_storeStrong((id *)&self->_resumes, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_log, 0);
}

@end