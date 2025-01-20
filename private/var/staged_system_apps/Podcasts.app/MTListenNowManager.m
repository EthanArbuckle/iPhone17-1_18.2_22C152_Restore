@interface MTListenNowManager
- (BOOL)automaticallySuggestsEpisodes;
- (MTListenNowManager)init;
- (MTPropertyChangeQueryObserver)listenNowQueryObserver;
- (OS_dispatch_queue)workQueue;
- (id)_predicate;
- (unint64_t)backgroundTaskIdentifier;
- (unint64_t)updateCount;
- (void)_beginBackgroundTask;
- (void)_endBackgroundTask;
- (void)_endBackgroundTask:(BOOL)a3;
- (void)dealloc;
- (void)processListenNowEpisodes:(id)a3;
- (void)results:(id)a3;
- (void)setAutomaticallySuggestsEpisodes:(BOOL)a3;
- (void)setBackgroundTaskIdentifier:(unint64_t)a3;
- (void)setListenNowQueryObserver:(id)a3;
- (void)setUpdateCount:(unint64_t)a3;
- (void)setWorkQueue:(id)a3;
- (void)startObservingChanges;
- (void)stopObservingChanges;
- (void)update;
@end

@implementation MTListenNowManager

- (void)_beginBackgroundTask
{
  v2 = self;
  objc_sync_enter(v2);
  [(MTListenNowManager *)v2 setUpdateCount:(char *)[(MTListenNowManager *)v2 updateCount] + 1];
  if ([(MTListenNowManager *)v2 backgroundTaskIdentifier] == UIBackgroundTaskInvalid)
  {
    v3 = _MTLogCategoryDefault();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "MTListenNowManager starting background task", buf, 2u);
    }

    v4 = +[UIApplication sharedApplication];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10010AB18;
    v5[3] = &unk_10054D570;
    v5[4] = v2;
    -[MTListenNowManager setBackgroundTaskIdentifier:](v2, "setBackgroundTaskIdentifier:", [v4 beginBackgroundTaskWithName:@"Listen now manager" expirationHandler:v5]);
  }
  objc_sync_exit(v2);
}

- (void)_endBackgroundTask:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = self;
  objc_sync_enter(v4);
  [(MTListenNowManager *)v4 setUpdateCount:(char *)[(MTListenNowManager *)v4 updateCount] - 1];
  if ((![(MTListenNowManager *)v4 updateCount] || v3)
    && [(MTListenNowManager *)v4 backgroundTaskIdentifier] != UIBackgroundTaskInvalid)
  {
    v5 = _MTLogCategoryDefault();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v6 = &stru_10056A8A0;
      if (v3) {
        CFStringRef v6 = @"(expired)";
      }
      int v8 = 138412290;
      CFStringRef v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "MTListenNowManager ending background task %@", (uint8_t *)&v8, 0xCu);
    }

    v7 = +[UIApplication sharedApplication];
    [v7 endBackgroundTask:[v4 backgroundTaskIdentifier]];

    [(MTListenNowManager *)v4 setBackgroundTaskIdentifier:UIBackgroundTaskInvalid];
  }
  if ([(MTListenNowManager *)v4 backgroundTaskIdentifier] == UIBackgroundTaskInvalid) {
    [(MTListenNowManager *)v4 setUpdateCount:0];
  }
  objc_sync_exit(v4);
}

- (unint64_t)updateCount
{
  return self->_updateCount;
}

- (void)setUpdateCount:(unint64_t)a3
{
  self->_updateCount = a3;
}

- (unint64_t)backgroundTaskIdentifier
{
  return self->_backgroundTaskIdentifier;
}

- (void)processListenNowEpisodes:(id)a3
{
  id v4 = a3;
  if ([(MTListenNowManager *)self automaticallySuggestsEpisodes])
  {
    v5 = +[MTDB sharedInstance];
    CFStringRef v6 = [v5 mainOrPrivateContext];

    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x3032000000;
    v17 = sub_10005707C;
    v18 = sub_100057308;
    id v19 = 0;
    int v8 = _NSConcreteStackBlock;
    uint64_t v9 = 3221225472;
    v10 = sub_100059208;
    v11 = &unk_10054E2A8;
    v13 = &v14;
    id v12 = v4;
    [v6 performBlockAndWait:&v8];
    v7 = +[MTUpcomingMediaController sharedInstance];
    [v7 setSuggestedEpisodeUuids:v15[5]];

    _Block_object_dispose(&v14, 8);
  }
}

- (MTListenNowManager)init
{
  v21.receiver = self;
  v21.super_class = (Class)MTListenNowManager;
  v2 = [(MTListenNowManager *)&v21 init];
  BOOL v3 = v2;
  if (v2)
  {
    [(MTListenNowManager *)v2 setAutomaticallySuggestsEpisodes:1];
    objc_initWeak(&location, v3);
    id v4 = +[NSFetchRequest fetchRequestWithEntityName:kMTEpisodeEntityName];
    v5 = [(MTListenNowManager *)v3 _predicate];
    [v4 setPredicate:v5];

    CFStringRef v6 = +[MTEpisode sortDescriptorsForListenNow];
    [v4 setSortDescriptors:v6];

    id v7 = objc_alloc((Class)MTPropertyChangeQueryObserver);
    int v8 = +[MTDB sharedInstance];
    uint64_t v9 = [v8 privateQueueContext];
    id v10 = [v7 initWithFetchRequest:v4 managedObjectContext:v9];
    [(MTListenNowManager *)v3 setListenNowQueryObserver:v10];

    v22[0] = kEpisodeListenNowEpisode;
    v22[1] = kEpisodePodcastUuid;
    v11 = +[NSArray arrayWithObjects:v22 count:2];
    id v12 = [(MTListenNowManager *)v3 listenNowQueryObserver];
    [v12 setPropertyKeys:v11];

    v13 = [(MTListenNowManager *)v3 listenNowQueryObserver];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100006044;
    v18[3] = &unk_100551A40;
    objc_copyWeak(&v19, &location);
    id v14 = [v13 addResultsChangedHandler:v18];

    v3->_backgroundTaskIdentifier = UIBackgroundTaskInvalid;
    dispatch_queue_t v15 = dispatch_queue_create("MTListenNowManager", 0);
    workQueue = v3->_workQueue;
    v3->_workQueue = (OS_dispatch_queue *)v15;

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  return v3;
}

- (MTPropertyChangeQueryObserver)listenNowQueryObserver
{
  return self->_listenNowQueryObserver;
}

- (void)update
{
  [(MTListenNowManager *)self _beginBackgroundTask];
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000053A8;
  block[3] = &unk_10054D570;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)startObservingChanges
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100059264;
  block[3] = &unk_10054D570;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)setListenNowQueryObserver:(id)a3
{
}

- (void)setBackgroundTaskIdentifier:(unint64_t)a3
{
  self->_backgroundTaskIdentifier = a3;
}

- (void)setAutomaticallySuggestsEpisodes:(BOOL)a3
{
  self->_automaticallySuggestsEpisodes = a3;
}

- (BOOL)automaticallySuggestsEpisodes
{
  return self->_automaticallySuggestsEpisodes;
}

- (id)_predicate
{
  return +[MTEpisode predicateForListenNow];
}

- (void)_endBackgroundTask
{
}

- (void)dealloc
{
  [(MTListenNowManager *)self stopObservingChanges];
  v3.receiver = self;
  v3.super_class = (Class)MTListenNowManager;
  [(MTListenNowManager *)&v3 dealloc];
}

- (void)stopObservingChanges
{
  objc_super v3 = [(MTListenNowManager *)self listenNowQueryObserver];
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010A9C0;
  block[3] = &unk_10054D570;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(workQueue, block);
}

- (void)results:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10010AA68;
  v7[3] = &unk_10054D738;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listenNowQueryObserver, 0);

  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end