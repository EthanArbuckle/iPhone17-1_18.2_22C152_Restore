@interface NRGSync
- (NRDevice)pairedDevice;
- (NRGSync)initWithDelegate:(id)a3;
- (NRGSyncDelegate)delegate;
- (NSString)gizmoBuild;
- (PSYSyncCoordinator)pairedSyncCoordinator;
- (void)device:(id)a3 propertyDidChange:(id)a4 fromValue:(id)a5;
- (void)gizmoBuildPath:(id)a3;
- (void)loadGizmoBuild:(id)a3;
- (void)performIconSync:(id)a3 completion:(id)a4;
- (void)registerNotifyGizmoBuildChange;
- (void)saveGizmoBuild;
- (void)setDelegate:(id)a3;
- (void)setGizmoBuild:(id)a3;
- (void)setPairedDevice:(id)a3;
- (void)setPairedSyncCoordinator:(id)a3;
- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4;
- (void)syncIcons:(id)a3;
@end

@implementation NRGSync

- (NRGSync)initWithDelegate:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)NRGSync;
  v5 = [(NRGSync *)&v30 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
    startupSemaphore = v6->_startupSemaphore;
    v6->_startupSemaphore = (OS_dispatch_semaphore *)v7;

    +[NSDate timeIntervalSinceReferenceDate];
    double v10 = v9;
    dispatch_queue_t v11 = dispatch_queue_create((const char *)[@"com.apple.nanoresourcegrabber.sync" UTF8String], 0);
    syncQueue = v6->_syncQueue;
    v6->_syncQueue = (OS_dispatch_queue *)v11;

    dispatch_queue_t v13 = dispatch_queue_create("com.apple.nanoresourcegrabber.iconqueue", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    iconQueue = v6->_iconQueue;
    v6->_iconQueue = (OS_dispatch_queue *)v13;

    uint64_t v15 = +[PSYSyncCoordinator syncCoordinatorWithServiceName:@"com.apple.pairedsync.nanoresourcegrabber"];
    pairedSyncCoordinator = v6->_pairedSyncCoordinator;
    v6->_pairedSyncCoordinator = (PSYSyncCoordinator *)v15;

    v17 = v6->_syncQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000AE10;
    block[3] = &unk_1000205E0;
    v29 = v6;
    dispatch_async(v17, block);
    v18 = v6->_startupSemaphore;
    dispatch_time_t v19 = dispatch_time(0, 500000000);
    intptr_t v20 = dispatch_semaphore_wait(v18, v19);
    v21 = nrg_daemon_log();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    if (v20)
    {
      if (v22)
      {
        *(_WORD *)buf = 0;
        v23 = "resourcegrabberd timed out blocking the daemon when checking for gizmo OS version and deleting icons";
        v24 = v21;
        uint32_t v25 = 2;
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, v23, buf, v25);
      }
    }
    else if (v22)
    {
      +[NSDate timeIntervalSinceReferenceDate];
      *(_DWORD *)buf = 134217984;
      double v32 = v26 - v10;
      v23 = "resourcegrabberd startup blocked for %1.3f";
      v24 = v21;
      uint32_t v25 = 12;
      goto LABEL_7;
    }
  }
  return v6;
}

- (void)registerNotifyGizmoBuildChange
{
}

- (void)device:(id)a3 propertyDidChange:(id)a4 fromValue:(id)a5
{
  id v7 = a3;
  uint64_t v8 = NRDevicePropertySystemBuildVersion;
  if ([a4 isEqualToString:NRDevicePropertySystemBuildVersion])
  {
    double v9 = [v7 valueForProperty:v8];
    double v10 = [(NRGSync *)self gizmoBuild];
    unsigned __int8 v11 = [v10 isEqualToString:v9];

    if (v11)
    {
      dispatch_semaphore_signal((dispatch_semaphore_t)self->_startupSemaphore);
    }
    else
    {
      v12 = nrg_framework_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        dispatch_queue_t v13 = [(NRGSync *)self gizmoBuild];
        *(_DWORD *)buf = 138412546;
        v18 = v13;
        __int16 v19 = 2112;
        intptr_t v20 = v9;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "build has changed, old build is %@, new build is %@", buf, 0x16u);
      }
      if ([(PSYSyncCoordinator *)self->_pairedSyncCoordinator syncRestriction])
      {
        dispatch_semaphore_signal((dispatch_semaphore_t)self->_startupSemaphore);
        v14 = nrg_framework_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "sync not allowed", buf, 2u);
        }
      }
      else
      {
        uint64_t v15 = nrg_framework_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "sync allowed", buf, 2u);
        }

        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_10000B2E0;
        v16[3] = &unk_100020818;
        v16[4] = self;
        [(NRGSync *)self gizmoBuildPath:v16];
      }
    }
  }
}

- (void)gizmoBuildPath:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  NRGWaitForActivePairedDeviceStorePath();
}

- (void)saveGizmoBuild
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10000B58C;
  v2[3] = &unk_100020818;
  v2[4] = self;
  [(NRGSync *)self gizmoBuildPath:v2];
}

- (void)loadGizmoBuild:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000B820;
  v4[3] = &unk_100020868;
  v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(NRGSync *)v5 gizmoBuildPath:v4];
}

- (void)syncIcons:(id)a3
{
  id v4 = a3;
  v5 = +[NSDate date];
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = sub_10000BE0C;
  v29[4] = sub_10000BE1C;
  [@"com.apple.nanoresourcegrabber.sync" UTF8String];
  id v30 = (id)os_transaction_create();
  objc_initWeak(&location, self);
  v21 = _NSConcreteStackBlock;
  uint64_t v22 = 3221225472;
  v23 = sub_10000BE24;
  v24 = &unk_100020890;
  id v6 = v5;
  id v25 = v6;
  double v26 = v29;
  objc_copyWeak(&v27, &location);
  id v7 = objc_retainBlock(&v21);
  id v8 = [v4 syncSessionType:v21, v22, v23, v24];
  if (!v8)
  {
    dispatch_queue_t v13 = [(NRGSync *)self delegate];
    [v13 pairedSyncInProgress];

    double v10 = nrg_daemon_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v14 = NRGGetActivePairedDevice();
      uint64_t v15 = [v14 pairingID];
      *(_DWORD *)buf = 138412290;
      double v32 = v15;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "performing full sync, activeDevice = %@", buf, 0xCu);
    }
    goto LABEL_9;
  }
  if (v8 == (id)1)
  {
    v17 = nrg_daemon_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = NRGGetActivePairedDevice();
      __int16 v19 = [v18 pairingID];
      *(_DWORD *)buf = 138412290;
      double v32 = v19;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "performing reunion sync (aka quick watch switch), activeDevice = %@", buf, 0xCu);
    }
    intptr_t v20 = [(NRGSync *)self delegate];
    [v20 deviceSwitched];
  }
  else if (v8 == (id)2)
  {
    double v9 = [(NRGSync *)self delegate];
    [v9 pairedSyncInProgress];

    double v10 = nrg_daemon_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v11 = NRGGetActivePairedDevice();
      v12 = [v11 pairingID];
      *(_DWORD *)buf = 138412290;
      double v32 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "performing migration sync, activeDevice = %@", buf, 0xCu);
    }
LABEL_9:

    v16 = NRGGetActivePairedDeviceStorePath();
    +[NRGResourceCache invalidatePairedDevice:v16];

    [(NRGSync *)self performIconSync:v4 completion:v7];
  }

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
  _Block_object_dispose(v29, 8);
}

- (void)performIconSync:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [[NRGFullSyncRequestOperation alloc] initWithRequest:0];
  id v8 = +[NRGCompanionDaemon sharedInstance];
  [(NRGFullSyncRequestOperation *)v7 setDaemon:v8];

  double v9 = nrg_daemon_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "starting full sync %@", buf, 0xCu);
  }

  double v10 = +[NanoResourceGrabber nrgIconVariants];
  [(NRGFullSyncRequestOperation *)v7 setIconVariants:v10];

  [(NRGFullSyncRequestOperation *)v7 setShouldReset:1];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10000C224;
  v19[3] = &unk_1000208B8;
  id v11 = v5;
  id v20 = v11;
  [(NRGFullSyncRequestOperation *)v7 setRequestSentHandler:v19];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10000C2D4;
  v16[3] = &unk_1000208E0;
  id v12 = v11;
  id v17 = v12;
  id v13 = v6;
  id v18 = v13;
  [(NRGFullSyncRequestOperation *)v7 setCompletionHandler:v16];
  v14 = +[NRGCompanionDaemon sharedInstance];
  [v14 queueFullSyncRequestOperation:v7];

  uint64_t v15 = nrg_framework_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "returning from full sync request", buf, 2u);
  }
}

- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4
{
  id v5 = a4;
  id v6 = nrg_daemon_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "received beginSyncSession: %@", (uint8_t *)&v7, 0xCu);
  }

  [(NRGSync *)self syncIcons:v5];
}

- (NRGSyncDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NRGSyncDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)gizmoBuild
{
  return self->_gizmoBuild;
}

- (void)setGizmoBuild:(id)a3
{
}

- (NRDevice)pairedDevice
{
  return self->_pairedDevice;
}

- (void)setPairedDevice:(id)a3
{
}

- (PSYSyncCoordinator)pairedSyncCoordinator
{
  return self->_pairedSyncCoordinator;
}

- (void)setPairedSyncCoordinator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairedSyncCoordinator, 0);
  objc_storeStrong((id *)&self->_pairedDevice, 0);
  objc_storeStrong((id *)&self->_gizmoBuild, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_startupSemaphore, 0);
  objc_storeStrong((id *)&self->_iconQueue, 0);

  objc_storeStrong((id *)&self->_syncQueue, 0);
}

@end