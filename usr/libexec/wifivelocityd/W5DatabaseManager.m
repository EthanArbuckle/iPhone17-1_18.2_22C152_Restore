@interface W5DatabaseManager
+ (id)sharedObject;
- (W5DatabaseManager)init;
- (id)_getWAAnalyticsAccess;
- (id)_performFetch:(id)a3 error:(id *)a4;
- (id)fetchLastHourFaults;
- (id)fetchLastHourLinkTests;
- (id)fetchLastHourRecoveries;
- (id)performFetch:(id)a3;
- (id)updatedFaultsCallback;
- (id)updatedLinkTestsCallback;
- (id)updatedRecoveriesCallback;
- (void)dealloc;
- (void)performFetchAndReply:(id)a3 reply:(id)a4;
- (void)remoteStoreUpdate:(id)a3;
- (void)setUpdatedFaultsCallback:(id)a3;
- (void)setUpdatedLinkTestsCallback:(id)a3;
- (void)setUpdatedRecoveriesCallback:(id)a3;
- (void)startEventMonitoring;
- (void)stopEventMonitoring;
@end

@implementation W5DatabaseManager

+ (id)sharedObject
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100082C94;
  block[3] = &unk_1000DD380;
  block[4] = a1;
  if (qword_100103740 != -1) {
    dispatch_once(&qword_100103740, block);
  }
  v2 = (void *)qword_100103738;

  return v2;
}

- (W5DatabaseManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)W5DatabaseManager;
  v2 = [(W5DatabaseManager *)&v12 init];
  if (v2
    && (dispatch_queue_t v3 = dispatch_queue_create("com.apple.wifivelocity.dbquery", 0),
        queue = v2->_queue,
        v2->_queue = (OS_dispatch_queue *)v3,
        queue,
        v2->_queue))
  {
    uint64_t v5 = +[NSFetchRequest fetchRequestWithEntityName:@"Fault"];
    fetchLastHourFaultsDict = v2->_fetchLastHourFaultsDict;
    v2->_fetchLastHourFaultsDict = (NSFetchRequest *)v5;

    [(NSFetchRequest *)v2->_fetchLastHourFaultsDict setResultType:2];
    uint64_t v7 = +[NSFetchRequest fetchRequestWithEntityName:@"LinkTest"];
    fetchLastHourLinkTestsDict = v2->_fetchLastHourLinkTestsDict;
    v2->_fetchLastHourLinkTestsDict = (NSFetchRequest *)v7;

    [(NSFetchRequest *)v2->_fetchLastHourLinkTestsDict setResultType:2];
    uint64_t v9 = +[NSFetchRequest fetchRequestWithEntityName:@"Recovery"];
    fetchLastHourRecoveriesDict = v2->_fetchLastHourRecoveriesDict;
    v2->_fetchLastHourRecoveriesDict = (NSFetchRequest *)v9;

    [(NSFetchRequest *)v2->_fetchLastHourRecoveriesDict setResultType:2];
  }
  else
  {

    return 0;
  }
  return v2;
}

- (id)_getWAAnalyticsAccess
{
  dispatch_queue_t v3 = self->_analyticsAccess;
  if (!self->_analyticsAccess && sub_100082E50())
  {
    v4 = [sub_100082E50() accessWithOptions:0];
    uint64_t v5 = (WAAnalyticsAccess *)[v4 copy];
    analyticsAccess = self->_analyticsAccess;
    self->_analyticsAccess = v5;
  }

  return v3;
}

- (void)dealloc
{
  dispatch_queue_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  analyticsAccess = self->_analyticsAccess;
  if (analyticsAccess)
  {
    uint64_t v5 = [(W5DatabaseManager *)self _getWAAnalyticsAccess];
    v6 = [v5 mainObjectContext];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100083028;
    v8[3] = &unk_1000DD230;
    v8[4] = self;
    [v6 performBlockAndWait:v8];

    analyticsAccess = self->_analyticsAccess;
  }
  self->_analyticsAccess = 0;

  v7.receiver = self;
  v7.super_class = (Class)W5DatabaseManager;
  [(W5DatabaseManager *)&v7 dealloc];
}

- (void)remoteStoreUpdate:(id)a3
{
  id v4 = a3;
  NSLog(@"Got NSNotification %@", v4);
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = sub_100083374;
  v33 = sub_100083384;
  id v34 = 0;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = sub_100083374;
  v27 = sub_100083384;
  id v28 = 0;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = sub_100083374;
  v21 = sub_100083384;
  id v22 = 0;
  uint64_t v5 = [(W5DatabaseManager *)self fetchLastHourFaults];
  v6 = (void *)v30[5];
  v30[5] = v5;

  uint64_t v7 = [(W5DatabaseManager *)self fetchLastHourLinkTests];
  v8 = (void *)v24[5];
  v24[5] = v7;

  uint64_t v9 = [(W5DatabaseManager *)self fetchLastHourRecoveries];
  v10 = (void *)v18[5];
  v18[5] = v9;

  if (v30[5])
  {
    v11 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10008338C;
    block[3] = &unk_1000DD7A0;
    block[4] = self;
    void block[5] = &v29;
    dispatch_async(v11, block);
  }
  if (v24[5])
  {
    objc_super v12 = dispatch_get_global_queue(0, 0);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10008348C;
    v15[3] = &unk_1000DD7A0;
    v15[4] = self;
    v15[5] = &v23;
    dispatch_async(v12, v15);
  }
  if (v18[5])
  {
    v13 = dispatch_get_global_queue(0, 0);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10008358C;
    v14[3] = &unk_1000DD7A0;
    v14[4] = self;
    v14[5] = &v17;
    dispatch_async(v13, v14);
  }
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);
}

- (id)performFetch:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = sub_100083374;
  uint64_t v19 = sub_100083384;
  id v20 = 0;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = sub_100083374;
  v13[4] = sub_100083384;
  id v14 = 0;
  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000837E4;
  v9[3] = &unk_1000DF0C0;
  v9[4] = self;
  id v10 = v4;
  v11 = &v15;
  objc_super v12 = v13;
  id v6 = v4;
  dispatch_sync(queue, v9);
  id v7 = (id)v16[5];

  _Block_object_dispose(v13, 8);
  _Block_object_dispose(&v15, 8);

  return v7;
}

- (id)_performFetch:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = +[NSArray array];
  v8 = [(W5DatabaseManager *)self _getWAAnalyticsAccess];
  uint64_t v9 = [v8 mainObjectContext];
  uint64_t v10 = [v9 persistentStoreCoordinator];
  v11 = [(id)v10 managedObjectModel];
  objc_super v12 = [v11 entitiesByName];

  v13 = [v12 allKeys];
  id v14 = [v6 entityName];
  LOBYTE(v10) = [v13 containsObject:v14];

  if ((v10 & 1) == 0)
  {
    v26 = sub_10009756C();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      [v6 entityName];
      int v34 = 136315394;
      v35 = "-[W5DatabaseManager _performFetch:error:]";
      __int16 v36 = 2112;
      id v37 = (id)objc_claimAutoreleasedReturnValue();
      _os_log_send_and_compose_impl();
    }
    goto LABEL_11;
  }
  uint64_t v15 = [(W5DatabaseManager *)self _getWAAnalyticsAccess];
  v16 = [v15 mainObjectContext];
  id v33 = 0;
  uint64_t v17 = (const char *)[v16 countForFetchRequest:v6 error:&v33];
  id v18 = v33;

  uint64_t v19 = sub_10009756C();
  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
  if (!v18)
  {
    if (v20)
    {
      v21 = [v6 entityName];
      int v34 = 134218242;
      v35 = v17;
      __int16 v36 = 2112;
      id v37 = v21;
      _os_log_send_and_compose_impl();
    }
    if (v17)
    {
      id v22 = [(W5DatabaseManager *)self _getWAAnalyticsAccess];
      uint64_t v23 = [v22 mainObjectContext];
      id v32 = 0;
      uint64_t v24 = [v23 executeFetchRequest:v6 error:&v32];
      id v18 = v32;

      if (!v18)
      {
        id v25 = 0;
        id v7 = (void *)v24;
        goto LABEL_12;
      }
      uint64_t v19 = sub_10009756C();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v30 = [v18 localizedDescription];
        uint64_t v31 = [v18 userInfo];
        int v34 = 138412802;
        v35 = (const char *)v6;
        __int16 v36 = 2112;
        id v37 = v30;
        __int16 v38 = 2112;
        v39 = v31;
        _os_log_send_and_compose_impl();
      }
      id v7 = (void *)v24;
      goto LABEL_20;
    }
LABEL_11:
    id v25 = 0;
    goto LABEL_12;
  }
  if (v20)
  {
    id v28 = [v18 localizedDescription];
    uint64_t v29 = [v18 userInfo];
    int v34 = 138412802;
    v35 = (const char *)v6;
    __int16 v36 = 2112;
    id v37 = v28;
    __int16 v38 = 2112;
    v39 = v29;
    _os_log_send_and_compose_impl();
  }
LABEL_20:

  if (*a4)
  {
    id v25 = v18;
  }
  else
  {
    id v25 = v18;
    *a4 = v25;
  }
LABEL_12:

  return v7;
}

- (id)fetchLastHourFaults
{
  dispatch_queue_t v3 = +[NSDate dateWithTimeIntervalSinceNow:-3600.0];
  id v4 = +[NSPredicate predicateWithFormat:@"date >= %@", v3];
  [(NSFetchRequest *)self->_fetchLastHourFaultsDict setPredicate:v4];
  uint64_t v5 = [(W5DatabaseManager *)self performFetch:self->_fetchLastHourFaultsDict];

  return v5;
}

- (id)fetchLastHourLinkTests
{
  dispatch_queue_t v3 = +[NSDate dateWithTimeIntervalSinceNow:-3600.0];
  id v4 = +[NSPredicate predicateWithFormat:@"date >= %@", v3];
  [(NSFetchRequest *)self->_fetchLastHourLinkTestsDict setPredicate:v4];
  uint64_t v5 = [(W5DatabaseManager *)self performFetch:self->_fetchLastHourLinkTestsDict];

  return v5;
}

- (id)fetchLastHourRecoveries
{
  dispatch_queue_t v3 = +[NSDate dateWithTimeIntervalSinceNow:-3600.0];
  id v4 = +[NSPredicate predicateWithFormat:@"date >= %@", v3];
  [(NSFetchRequest *)self->_fetchLastHourRecoveriesDict setPredicate:v4];
  uint64_t v5 = [(W5DatabaseManager *)self performFetch:self->_fetchLastHourRecoveriesDict];

  return v5;
}

- (void)performFetchAndReply:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100083F78;
  block[3] = &unk_1000DF0E8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)setUpdatedFaultsCallback:(id)a3
{
  id v4 = a3;
  if (dispatch_get_specific(&self->_queue))
  {
    id updatedFaultsCallback = self->_updatedFaultsCallback;
    self->_id updatedFaultsCallback = 0;

    id v6 = objc_retainBlock(v4);
    id v7 = self->_updatedFaultsCallback;
    self->_id updatedFaultsCallback = v6;
  }
  else
  {
    queue = self->_queue;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100084180;
    v9[3] = &unk_1000DF110;
    v9[4] = self;
    id v10 = v4;
    dispatch_sync(queue, v9);
    id v7 = v10;
  }
}

- (void)setUpdatedLinkTestsCallback:(id)a3
{
  id v4 = a3;
  if (dispatch_get_specific(&self->_queue))
  {
    id updatedLinkTestsCallback = self->_updatedLinkTestsCallback;
    self->_id updatedLinkTestsCallback = 0;

    id v6 = objc_retainBlock(v4);
    id v7 = self->_updatedLinkTestsCallback;
    self->_id updatedLinkTestsCallback = v6;
  }
  else
  {
    queue = self->_queue;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000842B4;
    v9[3] = &unk_1000DF110;
    v9[4] = self;
    id v10 = v4;
    dispatch_sync(queue, v9);
    id v7 = v10;
  }
}

- (void)setUpdatedRecoveriesCallback:(id)a3
{
  id v4 = a3;
  if (dispatch_get_specific(&self->_queue))
  {
    id updatedRecoveriesCallback = self->_updatedRecoveriesCallback;
    self->_id updatedRecoveriesCallback = 0;

    id v6 = objc_retainBlock(v4);
    id v7 = self->_updatedRecoveriesCallback;
    self->_id updatedRecoveriesCallback = v6;
  }
  else
  {
    queue = self->_queue;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000843E8;
    v9[3] = &unk_1000DF110;
    v9[4] = self;
    id v10 = v4;
    dispatch_sync(queue, v9);
    id v7 = v10;
  }
}

- (void)startEventMonitoring
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000844C0;
  block[3] = &unk_1000DD230;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)stopEventMonitoring
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008464C;
  block[3] = &unk_1000DD230;
  block[4] = self;
  dispatch_async(queue, block);
}

- (id)updatedFaultsCallback
{
  return self->_updatedFaultsCallback;
}

- (id)updatedLinkTestsCallback
{
  return self->_updatedLinkTestsCallback;
}

- (id)updatedRecoveriesCallback
{
  return self->_updatedRecoveriesCallback;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updatedRecoveriesCallback, 0);
  objc_storeStrong(&self->_updatedLinkTestsCallback, 0);
  objc_storeStrong(&self->_updatedFaultsCallback, 0);
  objc_storeStrong((id *)&self->_fetchLastHourRecoveriesDict, 0);
  objc_storeStrong((id *)&self->_fetchLastHourLinkTestsDict, 0);
  objc_storeStrong((id *)&self->_fetchLastHourFaultsDict, 0);
  objc_storeStrong((id *)&self->_analyticsAccess, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end