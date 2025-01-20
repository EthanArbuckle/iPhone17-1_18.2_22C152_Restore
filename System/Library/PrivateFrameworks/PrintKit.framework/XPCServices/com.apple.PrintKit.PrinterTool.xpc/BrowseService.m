@interface BrowseService
- (BrowseService)initWithProxy:(id)a3 session:(id)a4;
- (void)_checkSync;
- (void)_setupBrowser:(id)a3;
- (void)_syncTimerFired;
- (void)addEntity:(id)a3;
- (void)removeEntity:(id)a3;
- (void)startBrowsing:(id)a3 provenance:(unint64_t)a4;
- (void)stopBrowsing;
- (void)stopBrowsing0;
- (void)updateEntity:(id)a3;
@end

@implementation BrowseService

- (BrowseService)initWithProxy:(id)a3 session:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)BrowseService;
  v9 = [(BrowseService *)&v23 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_proxy, a3);
    objc_storeStrong((id *)&v10->_session, a4);
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.printing.BrowseService", v11);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v12;

    dispatch_source_t v14 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)v10->_queue);
    syncTimer = v10->_syncTimer;
    v10->_syncTimer = (OS_dispatch_source *)v14;

    objc_initWeak(&location, v10);
    v16 = +[NSString stringWithFormat:@"%@: sync timer %p", v10, v10->_syncTimer];
    v17 = v10->_syncTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100062D14;
    handler[3] = &unk_1000A2308;
    objc_copyWeak(&v21, &location);
    dispatch_source_set_event_handler(v17, handler);
    dispatch_source_set_cancel_handler((dispatch_source_t)v10->_syncTimer, &stru_1000A3EB8);
    dispatch_source_set_timer((dispatch_source_t)v10->_syncTimer, 0, 0xFFFFFFFFFFFFFFFFLL, 0);
    v10->_syncTimerSuspendedCount = 0;
    v18 = _PKLogCategory(PKLogCategoryDiscovery[0]);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v16;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Setup with %@", buf, 0xCu);
    }

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v10;
}

- (void)_syncTimerFired
{
  unint64_t syncTimerSuspendedCount = self->_syncTimerSuspendedCount;
  if (syncTimerSuspendedCount >= 2) {
    double v4 = pow(1.0 / (double)syncTimerSuspendedCount, 0.7);
  }
  else {
    double v4 = 0.1;
  }
  v5 = _PKLogCategory(PKLogCategoryDefault[0]);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v6 = self->_syncTimerSuspendedCount;
    int v19 = 134218240;
    double v20 = v4;
    __int16 v21 = 1024;
    int v22 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "next sync timer delay %g, count %d", (uint8_t *)&v19, 0x12u);
  }

  dispatch_suspend((dispatch_object_t)self->_syncTimer);
  self->_unint64_t syncTimerSuspendedCount = 0;
  id v7 = [(PrintInfoSet *)self->_browseInfos uniquedBrowseInfos];
  id v8 = v7;
  lastBrowseInfos = self->_lastBrowseInfos;
  if (v7)
  {
    if (!lastBrowseInfos)
    {
      proxy = self->_proxy;
      id v11 = +[NSSet set];
      [(PKPrintdRPC_BrowseClient_ClientProtocol *)proxy browserAdded:v8 removed:v11];
      goto LABEL_15;
    }
  }
  else if (lastBrowseInfos)
  {
    dispatch_queue_t v12 = self->_proxy;
    id v11 = +[NSSet set];
    [(PKPrintdRPC_BrowseClient_ClientProtocol *)v12 browserAdded:v11 removed:self->_lastBrowseInfos];
    goto LABEL_15;
  }
  id v11 = [v7 mutableCopy];
  [v11 minusSet:self->_lastBrowseInfos];
  id v13 = [(NSSet *)self->_lastBrowseInfos mutableCopy];
  [v13 minusSet:v8];
  if ([v11 count] || objc_msgSend(v13, "count")) {
    [(PKPrintdRPC_BrowseClient_ClientProtocol *)self->_proxy browserAdded:v11 removed:v13];
  }

LABEL_15:
  if ([v8 count])
  {
    dispatch_source_t v14 = v8;
  }
  else
  {
    v15 = _PKLogCategory(PKLogCategoryDefault[0]);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "next sync timer delay set to ASAP", (uint8_t *)&v19, 2u);
    }

    dispatch_source_t v14 = 0;
    double v4 = 0.0;
  }
  v16 = self->_lastBrowseInfos;
  self->_lastBrowseInfos = v14;

  syncTimer = self->_syncTimer;
  dispatch_time_t v18 = dispatch_time(0xFFFFFFFFFFFFFFFELL, (uint64_t)(v4 * 1000000000.0));
  dispatch_source_set_timer(syncTimer, v18, 0xFFFFFFFFFFFFFFFFLL, 0);
}

- (void)_checkSync
{
  unint64_t syncTimerSuspendedCount = self->_syncTimerSuspendedCount;
  self->_unint64_t syncTimerSuspendedCount = syncTimerSuspendedCount + 1;
  if (!syncTimerSuspendedCount)
  {
    syncTimer = self->_syncTimer;
    if (syncTimer) {
      dispatch_resume(syncTimer);
    }
  }
}

- (void)addEntity:(id)a3
{
  id v8 = a3;
  if ((-[NSMutableSet containsObject:](self->_entities, "containsObject:") & 1) == 0)
  {
    [(NSMutableSet *)self->_entities addObject:v8];
    browseInfos = self->_browseInfos;
    if (!browseInfos)
    {
      v5 = (PrintInfoSet *)objc_opt_new();
      unint64_t v6 = self->_browseInfos;
      self->_browseInfos = v5;

      browseInfos = self->_browseInfos;
    }
    id v7 = [v8 browseInfo];
    [(PrintInfoSet *)browseInfos addInfo:v7];

    [(BrowseService *)self _checkSync];
  }
}

- (void)removeEntity:(id)a3
{
  id v6 = a3;
  if (-[NSMutableSet containsObject:](self->_entities, "containsObject:"))
  {
    [(NSMutableSet *)self->_entities removeObject:v6];
    browseInfos = self->_browseInfos;
    if (browseInfos)
    {
      v5 = [v6 browseInfo];
      [(PrintInfoSet *)browseInfos removeInfo:v5];
    }
    [(BrowseService *)self _checkSync];
  }
}

- (void)updateEntity:(id)a3
{
  id v4 = a3;
  -[BrowseService removeEntity:](self, "removeEntity:");
  [(BrowseService *)self addEntity:v4];
}

- (void)startBrowsing:(id)a3 provenance:(unint64_t)a4
{
  id v20 = a3;
  id v6 = (NSMutableSet *)objc_opt_new();
  entities = self->_entities;
  self->_entities = v6;

  if (!a4 || (a4 & 4) != 0)
  {
    id v8 = [[Browse_Bonjour alloc] initWithQueue:self->_queue];
    bonjour = self->_bonjour;
    self->_bonjour = v8;

    [(BrowseService *)self _setupBrowser:self->_bonjour];
  }
  if (!a4 || (a4 & 1) != 0)
  {
    v10 = [[Browse_MDM alloc] initWithQueue:self->_queue];
    mdm = self->_mdm;
    self->_mdm = v10;

    [(BrowseService *)self _setupBrowser:self->_mdm];
  }
  if (!a4 || (a4 & 8) != 0)
  {
    dispatch_queue_t v12 = [[Browse_WirelessProximity alloc] initWithQueue:self->_queue];
    proximity = self->_proximity;
    self->_proximity = v12;

    [(BrowseService *)self _setupBrowser:self->_proximity];
  }
  if (!a4 || (a4 & 2) != 0)
  {
    dispatch_source_t v14 = [[Browse_Extension alloc] initWithQueue:self->_queue printInfo:v20];
    extension = self->_extension;
    self->_extension = v14;

    [(BrowseService *)self _setupBrowser:self->_extension];
  }
  if ((a4 & 0x20) != 0
    || !a4
    && (+[NSUserDefaults standardUserDefaults],
        v16 = objc_claimAutoreleasedReturnValue(),
        unsigned int v17 = [v16 BOOLForKey:@"PrintKitBrowseNAN"],
        v16,
        v17))
  {
    dispatch_time_t v18 = [[Browse_NAN alloc] initWithQueue:self->_queue];
    nan = self->_nan;
    self->_nan = v18;

    [(BrowseService *)self _setupBrowser:self->_nan];
  }
}

- (void)_setupBrowser:(id)a3
{
  id v4 = a3;
  objc_initWeak(location, self);
  v5 = +[NSString stringWithFormat:@"<%@@%p>", objc_opt_class(), v4];
  id v6 = self->_queue;
  [v4 setSession:self->_session];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100063778;
  v27[3] = &unk_1000A3EE0;
  objc_copyWeak(&v30, location);
  id v7 = v6;
  v28 = v7;
  id v8 = v5;
  id v29 = v8;
  [v4 setAddEntity:v27];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100063950;
  v23[3] = &unk_1000A3EE0;
  objc_copyWeak(&v26, location);
  v9 = v7;
  v24 = v9;
  id v10 = v8;
  id v25 = v10;
  [v4 setRemoveEntity:v23];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100063B28;
  v19[3] = &unk_1000A3EE0;
  objc_copyWeak(&v22, location);
  id v11 = v9;
  id v20 = v11;
  id v12 = v10;
  id v21 = v12;
  [v4 setUpdateEntity:v19];
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100063D00;
  block[3] = &unk_1000A3F08;
  block[4] = self;
  id v17 = v12;
  id v18 = v4;
  id v14 = v4;
  id v15 = v12;
  dispatch_async(queue, block);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&v26);

  objc_destroyWeak(&v30);
  objc_destroyWeak(location);
}

- (void)stopBrowsing
{
  v2 = self;
  queue = v2->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100063E5C;
  v5[3] = &unk_1000957A8;
  v5[4] = v2;
  id v6 = v2;
  id v4 = v2;
  dispatch_async(queue, v5);
}

- (void)stopBrowsing0
{
  [(Browse_Bonjour *)self->_bonjour cancel];
  bonjour = self->_bonjour;
  self->_bonjour = 0;

  [(Browse_MDM *)self->_mdm cancel];
  mdm = self->_mdm;
  self->_mdm = 0;

  [(Browse_WirelessProximity *)self->_proximity cancel];
  proximity = self->_proximity;
  self->_proximity = 0;

  [(Browse_Extension *)self->_extension cancel];
  extension = self->_extension;
  self->_extension = 0;

  [(Browse_CUPS *)self->_cups cancel];
  cups = self->_cups;
  self->_cups = 0;

  [(Browse_NAN *)self->_nan cancel];
  nan = self->_nan;
  self->_nan = 0;

  syncTimer = self->_syncTimer;
  if (syncTimer)
  {
    source = syncTimer;
    id v10 = self->_syncTimer;
    self->_syncTimer = 0;

    dispatch_source_cancel(source);
    if (!self->_syncTimerSuspendedCount) {
      dispatch_resume(source);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nan, 0);
  objc_storeStrong((id *)&self->_cups, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_proximity, 0);
  objc_storeStrong((id *)&self->_mdm, 0);
  objc_storeStrong((id *)&self->_bonjour, 0);
  objc_storeStrong((id *)&self->_syncTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_lastBrowseInfos, 0);
  objc_storeStrong((id *)&self->_browseInfos, 0);
  objc_storeStrong((id *)&self->_entities, 0);
  objc_storeStrong((id *)&self->_session, 0);

  objc_storeStrong((id *)&self->_proxy, 0);
}

@end