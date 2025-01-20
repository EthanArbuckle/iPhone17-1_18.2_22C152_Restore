@interface MTBackgroundTaskScheduler
+ (void)registerBackgroundTaskClass:(Class)a3;
- (MTBackgroundTaskScheduler)init;
- (OS_dispatch_queue)bgSchedulerQueue;
- (unint64_t)backgroundTaskId;
- (void)_takeAssertionAndSchedule;
- (void)applicationDidEnterBackground:(id)a3;
- (void)applicationWillEnterForeground:(id)a3;
- (void)applicationWillTerminate:(id)a3;
- (void)registerLaunchHandlers;
- (void)rescheduleTasksIfNotScheduledWithIdentifier:(id)a3 completion:(id)a4;
- (void)rescheduleTasksWithIdentifier:(id)a3 completion:(id)a4;
- (void)setBackgroundTaskId:(unint64_t)a3;
- (void)setBgSchedulerQueue:(id)a3;
@end

@implementation MTBackgroundTaskScheduler

- (void)applicationWillEnterForeground:(id)a3
{
  v4 = _MTLogCategoryBackgroundFetching();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "App will enter foreground", v5, 2u);
  }

  dispatch_async((dispatch_queue_t)self->_bgSchedulerQueue, &stru_10054FF60);
}

+ (void)registerBackgroundTaskClass:(Class)a3
{
  id v4 = (id)qword_10060A708;
  objc_sync_enter(v4);
  if (!qword_10060A708)
  {
    uint64_t v5 = objc_opt_new();
    v6 = (void *)qword_10060A708;
    qword_10060A708 = v5;
  }
  if ([(objc_class *)a3 conformsToProtocol:&OBJC_PROTOCOL___MTBackgroundTask])
  {
    v7 = [(objc_class *)a3 identifier];
    [(id)qword_10060A708 setObject:a3 forKey:v7];
  }
  else
  {
    v8 = _MTLogCategoryBackgroundFetching();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Invalid class registered in MTBackgroundTaskScheduler, must be an MTBackgroundTask", v9, 2u);
    }
  }
  objc_sync_exit(v4);
}

- (void)registerLaunchHandlers
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id obj = (id)qword_10060A708;
  id v3 = [obj countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v13;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v13 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v12 + 1) + 8 * (void)v5);
        v10[0] = 0;
        v10[1] = v10;
        v10[2] = 0x3032000000;
        v10[3] = sub_100056F7C;
        v10[4] = sub_100057288;
        [(id)qword_10060A708 objectForKey:v6];
        id v11 = (id)objc_opt_new();
        v7 = +[BGTaskScheduler sharedScheduler];
        v9[0] = _NSConcreteStackBlock;
        v9[1] = 3221225472;
        v9[2] = sub_1000AFAF0;
        v9[3] = &unk_10054FF40;
        v9[4] = v6;
        v9[5] = self;
        v9[6] = v10;
        [v7 registerForTaskWithIdentifier:v6 usingQueue:0 launchHandler:v9];

        _Block_object_dispose(v10, 8);
        uint64_t v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      id v3 = [obj countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v3);
  }
}

- (MTBackgroundTaskScheduler)init
{
  v10.receiver = self;
  v10.super_class = (Class)MTBackgroundTaskScheduler;
  v2 = [(MTBackgroundTaskScheduler *)&v10 init];
  id v3 = v2;
  if (v2)
  {
    [(MTBackgroundTaskScheduler *)v2 setBackgroundTaskId:UIBackgroundTaskInvalid];
    dispatch_queue_t v4 = dispatch_queue_create("MTBackgroundTaskScheduler.bgSchedulerQueue", 0);
    bgSchedulerQueue = v3->_bgSchedulerQueue;
    v3->_bgSchedulerQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:v3 selector:"applicationWillEnterForeground:" name:MTApplicationWillEnterForegroundNotification object:0];

    v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:v3 selector:"applicationDidEnterBackground:" name:MTApplicationDidEnterBackgroundNotification object:0];

    v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:v3 selector:"applicationWillTerminate:" name:MTApplicationWillTerminateNotification object:0];

    [(MTBackgroundTaskScheduler *)v3 registerLaunchHandlers];
  }
  return v3;
}

- (void)setBackgroundTaskId:(unint64_t)a3
{
  self->_backgroundTaskId = a3;
}

- (void)applicationDidEnterBackground:(id)a3
{
  dispatch_queue_t v4 = _MTLogCategoryBackgroundFetching();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "App did enter background", v5, 2u);
  }

  [(MTBackgroundTaskScheduler *)self _takeAssertionAndSchedule];
}

- (void)applicationWillTerminate:(id)a3
{
  dispatch_queue_t v4 = _MTLogCategoryBackgroundFetching();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "App will terminate", v5, 2u);
  }

  [(MTBackgroundTaskScheduler *)self _takeAssertionAndSchedule];
}

- (void)_takeAssertionAndSchedule
{
  id v3 = _MTLogCategoryBackgroundFetching();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Take assertion and schedule", (uint8_t *)buf, 2u);
  }

  if ([(MTBackgroundTaskScheduler *)self backgroundTaskId] != UIBackgroundTaskInvalid)
  {
    dispatch_queue_t v4 = +[UIApplication sharedApplication];
    [v4 endBackgroundTask:[self backgroundTaskId]];

    [(MTBackgroundTaskScheduler *)self setBackgroundTaskId:UIBackgroundTaskInvalid];
  }
  objc_initWeak(buf, self);
  uint64_t v5 = +[NSUUID UUID];
  long long v13 = +[NSString stringWithFormat:@"MTBackgroundTaskScheduler-%@", v5];

  uint64_t v6 = +[UIApplication sharedApplication];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000B0464;
  v21[3] = &unk_10054E8E0;
  objc_copyWeak(&v22, buf);
  -[MTBackgroundTaskScheduler setBackgroundTaskId:](self, "setBackgroundTaskId:", [v6 beginBackgroundTaskWithName:v13 expirationHandler:v21]);

  v7 = dispatch_group_create();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = (id)qword_10060A708;
  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v18;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        dispatch_group_enter(v7);
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_1000B0538;
        v15[3] = &unk_10054D570;
        v16 = v7;
        [(MTBackgroundTaskScheduler *)self rescheduleTasksIfNotScheduledWithIdentifier:v12 completion:v15];
      }
      id v9 = [v8 countByEnumeratingWithState:&v17 objects:v24 count:16];
    }
    while (v9);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B0540;
  block[3] = &unk_10054D570;
  block[4] = self;
  dispatch_group_notify(v7, (dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v22);
  objc_destroyWeak(buf);
}

- (void)rescheduleTasksIfNotScheduledWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  bgSchedulerQueue = self->_bgSchedulerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B0670;
  block[3] = &unk_10054FFB0;
  id v12 = v6;
  long long v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(bgSchedulerQueue, block);
}

- (void)rescheduleTasksWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(id)qword_10060A708 objectForKey:v6];
  bgSchedulerQueue = self->_bgSchedulerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B0944;
  block[3] = &unk_10054FFD8;
  id v14 = v7;
  id v15 = v8;
  id v13 = v6;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(bgSchedulerQueue, block);
}

- (unint64_t)backgroundTaskId
{
  return self->_backgroundTaskId;
}

- (OS_dispatch_queue)bgSchedulerQueue
{
  return self->_bgSchedulerQueue;
}

- (void)setBgSchedulerQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end