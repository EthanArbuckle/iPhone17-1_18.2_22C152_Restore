@interface _DASActivityDurationTracker
+ (BOOL)shouldTrackActivity:(id)a3;
+ (id)sharedInstance;
- (BOOL)activityHadEnoughRuntime:(id)a3;
- (NSArray)dayToDurationsList;
- (NSUserDefaults)defaults;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)timer;
- (OS_os_log)log;
- (_DASActivityDurationTracker)init;
- (double)runtimeForActivity:(id)a3 inLastNumDays:(unint64_t)a4;
- (id)description;
- (int)notifyToken;
- (void)activityCanceled:(id)a3;
- (void)activityCompleted:(id)a3;
- (void)addTimeInterval:(double)a3 forActivity:(id)a4;
- (void)deleteOldDurations;
- (void)loadState;
- (void)saveState;
- (void)setDayToDurationsList:(id)a3;
- (void)setDefaults:(id)a3;
- (void)setLog:(id)a3;
- (void)setNotifyToken:(int)a3;
- (void)setQueue:(id)a3;
- (void)setTimer:(id)a3;
@end

@implementation _DASActivityDurationTracker

- (_DASActivityDurationTracker)init
{
  v27.receiver = self;
  v27.super_class = (Class)_DASActivityDurationTracker;
  id v2 = [(_DASActivityDurationTracker *)&v27 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.dasd.activityDurationManager", v3);
    v5 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v4;

    uint64_t v6 = +[_DASDaemonLogger logForCategory:@"activityDurationTracker"];
    v7 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v6;

    id v8 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.dasd.activityDurationTracker"];
    v9 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v8;

    dispatch_source_t v10 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, *((dispatch_queue_t *)v2 + 2));
    v11 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v10;

    v12 = *((void *)v2 + 3);
    dispatch_time_t v13 = dispatch_time(0xFFFFFFFFFFFFFFFELL, 86400000000000);
    dispatch_source_set_timer(v12, v13, 0x4E94914F0000uLL, 0xD18C2E2800uLL);
    v14 = *((void *)v2 + 3);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000F1358;
    handler[3] = &unk_1001754F8;
    v15 = (int *)v2;
    v26 = v15;
    dispatch_source_set_event_handler(v14, handler);
    dispatch_activate(*((dispatch_object_t *)v2 + 3));
    v15[2] = 0;
    v16 = v15 + 2;
    v17 = *((void *)v2 + 2);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1000F1360;
    v23[3] = &unk_1001759D0;
    v18 = v15;
    v24 = v18;
    notify_register_dispatch("com.apple.dasd.testActivityDayDurationsDelete", v16, v17, v23);
    v19 = *((void *)v2 + 2);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000F1368;
    v21[3] = &unk_1001759D0;
    v22 = v18;
    notify_register_dispatch("com.apple.dasd.testActivityDayDurationsLoad", v16, v19, v21);
  }
  return (_DASActivityDurationTracker *)v2;
}

+ (BOOL)shouldTrackActivity:(id)a3
{
  return [a3 isIntensive];
}

- (id)description
{
  return [(NSArray *)self->_dayToDurationsList description];
}

- (void)loadState
{
  v3 = +[NSData dataWithContentsOfFile:@"/var/mobile/Library/DuetActivityScheduler/activityDayDurations.data"];
  if (v3)
  {
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v4, v5, v6, v7, v8, objc_opt_class(), 0);
    id v18 = 0;
    dispatch_source_t v10 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v9 fromData:v3 error:&v18];
    id v11 = v18;
    dayToDurationsList = self->_dayToDurationsList;
    self->_dayToDurationsList = v10;

    if (v11)
    {
      log = self->_log;
      if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR)) {
        sub_100101260((uint64_t)v11, log);
      }
      v14 = +[NSMutableArray array];
      v15 = self->_dayToDurationsList;
      self->_dayToDurationsList = v14;
    }
  }
  else
  {
    id v11 = 0;
  }
  v16 = self->_log;
  if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = self->_dayToDurationsList;
    *(_DWORD *)buf = 138412290;
    v20 = v17;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v16, OS_LOG_TYPE_DEFAULT, "Loaded day to durations data %@", buf, 0xCu);
  }
}

- (void)saveState
{
  dayToDurationsList = self->_dayToDurationsList;
  id v9 = 0;
  uint64_t v4 = +[NSKeyedArchiver archivedDataWithRootObject:dayToDurationsList requiringSecureCoding:1 error:&v9];
  id v5 = v9;
  if (v5)
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR)) {
      sub_1001012D8((uint64_t)v5, log);
    }
    uint64_t v7 = +[NSMutableArray array];
    uint64_t v8 = self->_dayToDurationsList;
    self->_dayToDurationsList = v7;
  }
  [v4 writeToFile:@"/var/mobile/Library/DuetActivityScheduler/activityDayDurations.data" atomically:1];
}

- (void)deleteOldDurations
{
  v3 = (NSArray *)[(NSArray *)self->_dayToDurationsList mutableCopy];
  id v10 = +[NSMutableIndexSet indexSet];
  if ([(NSArray *)v3 count])
  {
    unint64_t v4 = 0;
    do
    {
      id v5 = [(NSArray *)v3 objectAtIndexedSubscript:v4];
      uint64_t v6 = [v5 date];
      [v6 timeIntervalSinceNow];
      unint64_t v8 = (uint64_t)v7;

      if (v8 <= 0xFFFFFFFFFFF573FFLL) {
        [v10 addIndex:v4];
      }
      ++v4;
    }
    while (v4 < [(NSArray *)v3 count]);
  }
  [(NSArray *)v3 removeObjectsAtIndexes:v10];
  dayToDurationsList = self->_dayToDurationsList;
  self->_dayToDurationsList = v3;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F17CC;
  block[3] = &unk_1001753E0;
  block[4] = a1;
  if (qword_1001C4580 != -1) {
    dispatch_once(&qword_1001C4580, block);
  }
  id v2 = (void *)qword_1001C4588;

  return v2;
}

- (void)addTimeInterval:(double)a3 forActivity:(id)a4
{
  id v25 = [a4 name];
  dayToDurationsList = self->_dayToDurationsList;
  if (!dayToDurationsList)
  {
    [(_DASActivityDurationTracker *)self loadState];
    dayToDurationsList = self->_dayToDurationsList;
  }
  id v7 = [(NSArray *)dayToDurationsList mutableCopy];
  if (!v7)
  {
    id v7 = +[NSMutableArray array];
  }
  unint64_t v8 = [v7 lastObject];
  if (v8)
  {
    id v9 = +[NSCalendar currentCalendar];
    id v10 = [v8 date];
    id v11 = +[NSDate date];
    unsigned __int8 v12 = [v9 isDate:v10 inSameDayAsDate:v11];

    if (v12) {
      goto LABEL_9;
    }
    [(_DASActivityDurationTracker *)self deleteOldDurations];
    id v13 = [(NSArray *)self->_dayToDurationsList mutableCopy];

    id v7 = v13;
  }
  v14 = [_DASActivityDayToDurations alloc];
  v15 = +[NSDate date];
  v16 = +[NSMutableDictionary dictionary];
  v17 = [(_DASActivityDayToDurations *)v14 initWithDate:v15 activityDurations:v16];

  [v7 addObject:v17];
  unint64_t v8 = v17;
LABEL_9:
  id v18 = [v8 activityDurations];
  id v19 = [v18 mutableCopy];

  v20 = [v19 objectForKeyedSubscript:v25];
  [v20 doubleValue];
  v22 = +[NSNumber numberWithInteger:(uint64_t)(v21 + a3)];
  [v19 setObject:v22 forKeyedSubscript:v25];

  [v8 setActivityDurations:v19];
  v23 = (NSArray *)[v7 copy];
  v24 = self->_dayToDurationsList;
  self->_dayToDurationsList = v23;

  [(_DASActivityDurationTracker *)self saveState];
}

- (void)activityCanceled:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000F1AD0;
  v7[3] = &unk_100175570;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (void)activityCompleted:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000F1BEC;
  v7[3] = &unk_100175570;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (double)runtimeForActivity:(id)a3 inLastNumDays:(unint64_t)a4
{
  id v5 = a3;
  dayToDurationsList = self->_dayToDurationsList;
  double v7 = 0.0;
  if (dayToDurationsList)
  {
    if ([(NSArray *)dayToDurationsList count])
    {
      [(NSArray *)self->_dayToDurationsList count];
      if ([(NSArray *)self->_dayToDurationsList count])
      {
        unint64_t v8 = 0;
        do
        {
          id v9 = [(NSArray *)self->_dayToDurationsList objectAtIndexedSubscript:v8];
          id v10 = [v9 activityDurations];
          id v11 = [v5 name];
          unsigned __int8 v12 = [v10 objectForKeyedSubscript:v11];

          if (v12)
          {
            id v13 = [v9 activityDurations];
            v14 = [v5 name];
            v15 = [v13 objectForKeyedSubscript:v14];
            [v15 doubleValue];
            double v17 = v16;

            double v7 = v7 + v17;
          }

          ++v8;
        }
        while (v8 < [(NSArray *)self->_dayToDurationsList count]);
      }
    }
  }

  return v7;
}

- (BOOL)activityHadEnoughRuntime:(id)a3
{
  [(_DASActivityDurationTracker *)self runtimeForActivity:a3 inLastNumDays:7];
  return v3 >= 18000.0;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (int)notifyToken
{
  return self->_notifyToken;
}

- (void)setNotifyToken:(int)a3
{
  self->_notifyToken = a3;
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
}

- (NSArray)dayToDurationsList
{
  return self->_dayToDurationsList;
}

- (void)setDayToDurationsList:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dayToDurationsList, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_timer, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end