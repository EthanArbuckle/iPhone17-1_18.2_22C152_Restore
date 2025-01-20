@interface CRCarPlayCapabilitiesManager
- (CARSessionStatus)sessionStatus;
- (CRCarPlayCapabilities)carCapabilities;
- (CRCarPlayCapabilitiesManager)initWithSessionStatus:(id)a3 vehicleStore:(id)a4;
- (CRCarplayCapabilitiesStateMachine)stateMachine;
- (CRVehicleAccessoryManager)accessoryManager;
- (CRVehicleStore)vehicleStore;
- (NSData)MFiCertificateSerialNumber;
- (NSMutableArray)lookupCompletionHandlers;
- (NSString)lastLookupIdentifer;
- (NSURL)carCapabilitiesURL;
- (OS_dispatch_queue)workerQueue;
- (id)_worker_queue_reloadSessionIfNeeded;
- (id)lookupCompletionHandler;
- (id)session;
- (void)_worker_queue_runStateMachineIfPossible;
- (void)_worker_queue_setSession:(id)a3;
- (void)accessoryManager:(id)a3 didConnectVehicleAccessory:(id)a4;
- (void)accessoryManager:(id)a3 didUpdateVehicleAccessory:(id)a4;
- (void)persistCarCapabilitiesIfNeeded;
- (void)plistLookupFinishedCompletionHandler:(id)a3;
- (void)reconcileCapabilities;
- (void)resolveCapabilitiesForSession:(id)a3;
- (void)sessionDidConnect:(id)a3;
- (void)sessionDidDisconnect:(id)a3;
- (void)setCarCapabilities:(id)a3;
- (void)setCarCapabilitiesURL:(id)a3;
- (void)setLastLookupIdentifer:(id)a3;
- (void)setLookupCompletionHandler:(id)a3;
- (void)setLookupCompletionHandlers:(id)a3;
- (void)setMFiCertificateSerialNumber:(id)a3;
@end

@implementation CRCarPlayCapabilitiesManager

- (CRCarPlayCapabilitiesManager)initWithSessionStatus:(id)a3 vehicleStore:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v28.receiver = self;
  v28.super_class = (Class)CRCarPlayCapabilitiesManager;
  v9 = [(CRCarPlayCapabilitiesManager *)&v28 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_vehicleStore, a4);
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.carkitd.carcapabilities.manager", v11);
    workerQueue = v10->_workerQueue;
    v10->_workerQueue = (OS_dispatch_queue *)v12;

    uint64_t v14 = +[CRCarPlayCapabilities fetchCarCapabilities];
    carCapabilities = v10->_carCapabilities;
    v10->_carCapabilities = (CRCarPlayCapabilities *)v14;

    v16 = objc_alloc_init(CRCarplayCapabilitiesStateMachine);
    stateMachine = v10->_stateMachine;
    v10->_stateMachine = v16;

    if ((CRIsTestContext() & 1) == 0)
    {
      v18 = +[NSUserDefaults standardUserDefaults];
      uint64_t v19 = [v18 URLForKey:@"CRCarPlayCapabilitiesPlistPathKey"];
      carCapabilitiesURL = v10->_carCapabilitiesURL;
      v10->_carCapabilitiesURL = (NSURL *)v19;
    }
    objc_storeStrong((id *)&v10->_sessionStatus, a3);
    [(CARSessionStatus *)v10->_sessionStatus addSessionObserver:v10];
    uint64_t v21 = +[CRVehicleAccessoryManager sharedInstance];
    accessoryManager = v10->_accessoryManager;
    v10->_accessoryManager = (CRVehicleAccessoryManager *)v21;

    [(CRVehicleAccessoryManager *)v10->_accessoryManager addObserver:v10];
    objc_initWeak(&location, v10);
    v23 = [(CRCarPlayCapabilitiesManager *)v10 workerQueue];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1000185BC;
    v25[3] = &unk_1000BD740;
    objc_copyWeak(&v26, &location);
    dispatch_async(v23, v25);

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }

  return v10;
}

- (void)setCarCapabilitiesURL:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(CRCarPlayCapabilitiesManager *)self workerQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100018714;
  block[3] = &unk_1000BD5C8;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_worker_queue_setSession:(id)a3
{
  id v4 = (CARSession *)a3;
  v5 = [(CRCarPlayCapabilitiesManager *)self workerQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(CARSession *)v4 MFiCertificateSerialNumber];
  [(CRCarPlayCapabilitiesManager *)self setMFiCertificateSerialNumber:v6];

  if (!v4)
  {
    worker_queue_session = self->_worker_queue_session;
    self->_worker_queue_session = 0;

    id v9 = 0;
    goto LABEL_21;
  }
  id v7 = [(CARSession *)v4 configuration];
  unsigned __int8 v8 = [v7 hasAccessory];

  if ((v8 & 1) == 0)
  {
    id v9 = [(CRCarPlayCapabilitiesManager *)self _worker_queue_reloadSessionIfNeeded];

    v10 = [(CARSession *)v9 configuration];
    unsigned __int8 v11 = [v10 hasAccessory];

    if ((v11 & 1) == 0)
    {
      v20 = CarGeneralLogging();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 136315394;
        v23 = "-[CRCarPlayCapabilitiesManager _worker_queue_setSession:]";
        __int16 v24 = 2112;
        v25 = v9;
        uint64_t v21 = "%s: skipping partial session %@";
LABEL_19:
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, v21, (uint8_t *)&v22, 0x16u);
      }
LABEL_20:

      goto LABEL_21;
    }
    id v4 = v9;
  }
  dispatch_queue_t v12 = [(CARSession *)v4 configuration];
  v13 = [v12 infoResponse];

  if (v13)
  {
    id v9 = v4;
    goto LABEL_9;
  }
  id v9 = [(CRCarPlayCapabilitiesManager *)self _worker_queue_reloadSessionIfNeeded];

  v15 = [(CARSession *)v9 configuration];
  v16 = [v15 infoResponse];

  if (!v16)
  {
    v20 = CarGeneralLogging();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 136315394;
      v23 = "-[CRCarPlayCapabilitiesManager _worker_queue_setSession:]";
      __int16 v24 = 2112;
      v25 = v9;
      uint64_t v21 = "%s: skipping partial session (no infoResponse) %@";
      goto LABEL_19;
    }
    goto LABEL_20;
  }
LABEL_9:
  if (self->_worker_queue_session != v9)
  {
    v17 = CarGeneralLogging();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      sub_100070C80();
    }

    objc_storeStrong((id *)&self->_worker_queue_session, v9);
    v18 = [(CRCarPlayCapabilitiesManager *)self carCapabilitiesURL];

    if (!v18)
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.carkit.capabilities-changed", 0, 0, 1u);
    }
    [(CRCarPlayCapabilitiesManager *)self _worker_queue_runStateMachineIfPossible];
  }
LABEL_21:
}

- (id)session
{
  uint64_t v7 = 0;
  unsigned __int8 v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = sub_100018BA0;
  unsigned __int8 v11 = sub_100018BB0;
  id v12 = 0;
  v3 = [(CRCarPlayCapabilitiesManager *)self workerQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100018BB8;
  v6[3] = &unk_1000BD768;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)_worker_queue_reloadSessionIfNeeded
{
  v3 = [(CRCarPlayCapabilitiesManager *)self workerQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = self->_worker_queue_session;
  v5 = v4;
  if (v4
    && ([(CARSession *)v4 configuration],
        id v6 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v7 = [v6 hasAccessory],
        v6,
        (v7 & 1) != 0))
  {
    unsigned __int8 v8 = v5;
  }
  else
  {
    [(CARSessionStatus *)self->_sessionStatus waitForSessionInitialization];
    uint64_t v9 = [(CARSessionStatus *)self->_sessionStatus currentSession];

    if (v9) {
      [(CARSessionStatus *)self->_sessionStatus _handleConfigurationUpdated];
    }
    unsigned __int8 v8 = [(CARSessionStatus *)self->_sessionStatus currentSession];

    v10 = CarGeneralLogging();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v11 = [v8 configuration];
      unsigned int v12 = [v11 hasAccessory];
      CFStringRef v13 = @"NO";
      v16 = "-[CRCarPlayCapabilitiesManager _worker_queue_reloadSessionIfNeeded]";
      int v15 = 136315650;
      __int16 v17 = 2112;
      v18 = v8;
      if (v12) {
        CFStringRef v13 = @"YES";
      }
      __int16 v19 = 2112;
      CFStringRef v20 = v13;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: updated partial session %@ (hasAccessory = %@)", (uint8_t *)&v15, 0x20u);
    }
  }

  return v8;
}

- (void)accessoryManager:(id)a3 didConnectVehicleAccessory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  unsigned __int8 v8 = [(CRCarPlayCapabilitiesManager *)self workerQueue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100018E50;
  v9[3] = &unk_1000BD740;
  objc_copyWeak(&v10, &location);
  dispatch_async(v8, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)accessoryManager:(id)a3 didUpdateVehicleAccessory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  unsigned __int8 v8 = [(CRCarPlayCapabilitiesManager *)self workerQueue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100018FB0;
  v9[3] = &unk_1000BD740;
  objc_copyWeak(&v10, &location);
  dispatch_async(v8, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)sessionDidConnect:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(CRCarPlayCapabilitiesManager *)self workerQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100019114;
  block[3] = &unk_1000BD5C8;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)sessionDidDisconnect:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(CRCarPlayCapabilitiesManager *)self workerQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100019280;
  block[3] = &unk_1000BD5C8;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)setCarCapabilities:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(CRCarPlayCapabilitiesManager *)self workerQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000193F0;
  block[3] = &unk_1000BD5C8;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)setLastLookupIdentifer:(id)a3
{
  self->_lastLookupIdentifer = (NSString *)[a3 copy];

  _objc_release_x1();
}

- (void)_worker_queue_runStateMachineIfPossible
{
  v3 = [(CRCarPlayCapabilitiesManager *)self workerQueue];
  dispatch_assert_queue_V2(v3);

  if (self->_worker_queue_session && self->_carCapabilitiesURL)
  {
    -[CRCarPlayCapabilitiesManager resolveCapabilitiesForSession:](self, "resolveCapabilitiesForSession:");
  }
}

- (void)resolveCapabilitiesForSession:(id)a3
{
  id v4 = a3;
  v5 = CarGeneralLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100070ED4(v5, v6, v7, v8, v9, v10, v11, v12);
  }

  objc_initWeak(&location, self);
  stateMachine = self->_stateMachine;
  carCapabilitiesURL = self->_carCapabilitiesURL;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100019608;
  v15[3] = &unk_1000BD790;
  objc_copyWeak(&v16, &location);
  [(CRCarplayCapabilitiesStateMachine *)stateMachine lookupCarcapabilitiesForSession:v4 plistURL:carCapabilitiesURL completionHandler:v15];
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)persistCarCapabilitiesIfNeeded
{
  v3 = +[CRCarPlayCapabilities fetchCarCapabilities];
  id v4 = [(CRCarPlayCapabilitiesManager *)self carCapabilities];
  unsigned int v5 = [v3 isEqual:v4];

  if (v5)
  {
    uint64_t v6 = (CRCarPlayCapabilities *)[v3 copy];
    carCapabilities = self->_carCapabilities;
    self->_carCapabilities = v6;
  }
  else
  {
    uint64_t v8 = [(CRCarPlayCapabilitiesManager *)self carCapabilities];
    uint64_t v9 = [v8 version];
    uint64_t v10 = (uint64_t)[v9 integerValue];

    if (v10 >= 1)
    {
      uint64_t v11 = [(CRCarPlayCapabilitiesManager *)self carCapabilities];
      [v11 persistCapabilitiesToGlobalDomain];

      uint64_t v12 = CarGeneralLogging();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v13 = [(CRCarPlayCapabilitiesManager *)self carCapabilities];
        *(_DWORD *)buf = 136315394;
        v30 = "-[CRCarPlayCapabilitiesManager persistCarCapabilitiesIfNeeded]";
        __int16 v31 = 2112;
        v32 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s: sending CARSessionCarCapabilitiesUpdatedNotification signaling capabilities have change to %@", buf, 0x16u);
      }
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, CARSessionCarCapabilitiesUpdatedNotification, 0, 0, 1u);
    }
  }
  objc_initWeak(&location, self);
  int v15 = [(CRCarPlayCapabilitiesManager *)self workerQueue];
  v23 = _NSConcreteStackBlock;
  uint64_t v24 = 3221225472;
  v25 = sub_100019A8C;
  id v26 = &unk_1000BD740;
  objc_copyWeak(&v27, &location);
  dispatch_async(v15, &v23);

  id v16 = [(CRCarPlayCapabilitiesManager *)self carCapabilities];
  __int16 v17 = [v16 version];
  if ((uint64_t)[v17 integerValue] <= 0)
  {
  }
  else
  {
    v18 = [(CRCarPlayCapabilitiesManager *)self carCapabilities];
    unsigned int v19 = [v18 persisted];

    if (v19)
    {
      CFStringRef v20 = CarGeneralLogging();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = [(CRCarPlayCapabilitiesManager *)self carCapabilities];
        *(_DWORD *)buf = 136315394;
        v30 = "-[CRCarPlayCapabilitiesManager persistCarCapabilitiesIfNeeded]";
        __int16 v31 = 2112;
        v32 = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s: sending CARSessionCarCapabilitiesReadyNotification signaling capabilities are loaded %@", buf, 0x16u);
      }
      int v22 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(v22, CARSessionCarCapabilitiesReadyNotification, 0, 0, 1u);
    }
  }
  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

- (void)reconcileCapabilities
{
  objc_initWeak(&location, self);
  v3 = [(CRCarPlayCapabilitiesManager *)self workerQueue];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100019D4C;
  v4[3] = &unk_1000BD740;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)plistLookupFinishedCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(CRCarPlayCapabilitiesManager *)self workerQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001A440;
  block[3] = &unk_1000BD7B8;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (NSURL)carCapabilitiesURL
{
  return self->_carCapabilitiesURL;
}

- (CRCarPlayCapabilities)carCapabilities
{
  return self->_carCapabilities;
}

- (CARSessionStatus)sessionStatus
{
  return self->_sessionStatus;
}

- (NSData)MFiCertificateSerialNumber
{
  return self->_MFiCertificateSerialNumber;
}

- (void)setMFiCertificateSerialNumber:(id)a3
{
}

- (CRCarplayCapabilitiesStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (CRVehicleAccessoryManager)accessoryManager
{
  return self->_accessoryManager;
}

- (NSString)lastLookupIdentifer
{
  return self->_lastLookupIdentifer;
}

- (id)lookupCompletionHandler
{
  return self->_lookupCompletionHandler;
}

- (void)setLookupCompletionHandler:(id)a3
{
}

- (NSMutableArray)lookupCompletionHandlers
{
  return self->_lookupCompletionHandlers;
}

- (void)setLookupCompletionHandlers:(id)a3
{
}

- (OS_dispatch_queue)workerQueue
{
  return self->_workerQueue;
}

- (CRVehicleStore)vehicleStore
{
  return self->_vehicleStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicleStore, 0);
  objc_storeStrong((id *)&self->_workerQueue, 0);
  objc_storeStrong((id *)&self->_lookupCompletionHandlers, 0);
  objc_storeStrong(&self->_lookupCompletionHandler, 0);
  objc_storeStrong((id *)&self->_lastLookupIdentifer, 0);
  objc_storeStrong((id *)&self->_accessoryManager, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_MFiCertificateSerialNumber, 0);
  objc_storeStrong((id *)&self->_sessionStatus, 0);
  objc_storeStrong((id *)&self->_carCapabilities, 0);
  objc_storeStrong((id *)&self->_carCapabilitiesURL, 0);

  objc_storeStrong((id *)&self->_worker_queue_session, 0);
}

@end