@interface CRSetupPromptDirectorAgent
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CRSetupLauncher)setupLauncher;
- (CRSetupLockscreenAlert)lockscreenAlert;
- (CRSetupPromptPresenterSession)currentPresenterSession;
- (OS_dispatch_queue)sessionQueue;
- (OS_dispatch_semaphore)waitingOnSession;
- (void)_checkLockScreenStatusWithReply:(id)a3;
- (void)_mainQueue_dismissLockscreenAlert;
- (void)_mainQueue_performWithPromptPresenter:(id)a3 isUILocked:(BOOL)a4 errorHandler:(id)a5;
- (void)_mainQueue_presentLockscreenAlertWithCompletion:(id)a3;
- (void)_mainQueue_setupBlockedSessionQueue;
- (void)_mainQueue_unblockSessionQueue;
- (void)dismissPromptPresenter;
- (void)performWithPromptPresenter:(id)a3 errorHandler:(id)a4;
- (void)setCurrentPresenterSession:(id)a3;
- (void)setLockscreenAlert:(id)a3;
- (void)setSessionQueue:(id)a3;
- (void)setSetupLauncher:(id)a3;
- (void)setWaitingOnSession:(id)a3;
@end

@implementation CRSetupPromptDirectorAgent

- (void)performWithPromptPresenter:(id)a3 errorHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100038A90;
  v10[3] = &unk_1000BE418;
  objc_copyWeak(&v13, &location);
  id v8 = v6;
  id v11 = v8;
  id v9 = v7;
  id v12 = v9;
  [(CRSetupPromptDirectorAgent *)self _checkLockScreenStatusWithReply:v10];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)_mainQueue_performWithPromptPresenter:(id)a3 isUILocked:(BOOL)a4 errorHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (v6
    && ([(CRSetupPromptDirectorAgent *)self lockscreenAlert],
        v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        !v10))
  {
    objc_initWeak(&location, self);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100038DA0;
    v21[3] = &unk_1000BE440;
    objc_copyWeak(&v24, &location);
    id v22 = v8;
    id v23 = v9;
    [(CRSetupPromptDirectorAgent *)self _mainQueue_presentLockscreenAlertWithCompletion:v21];

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
  else
  {
    id v11 = [(CRSetupPromptDirectorAgent *)self currentPresenterSession];

    if (!v11)
    {
      [(CRSetupPromptDirectorAgent *)self _mainQueue_setupBlockedSessionQueue];
      id v12 = objc_alloc_init(CRSetupLauncher);
      [(CRSetupPromptDirectorAgent *)self setSetupLauncher:v12];

      objc_initWeak(&location, self);
      id v13 = [(CRSetupPromptDirectorAgent *)self setupLauncher];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100038DF0;
      v18[3] = &unk_1000BE468;
      objc_copyWeak(&v20, &location);
      id v19 = v9;
      [v13 launchCarPlaySetupWithUserInfo:0 errorHandler:v18];

      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
    }
    v14 = [(CRSetupPromptDirectorAgent *)self sessionQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100038EA0;
    block[3] = &unk_1000BE490;
    block[4] = self;
    id v16 = v9;
    id v17 = v8;
    dispatch_async(v14, block);
  }
}

- (void)dismissPromptPresenter
{
  [(CRSetupPromptDirectorAgent *)self _mainQueue_dismissLockscreenAlert];
  [(CRSetupPromptDirectorAgent *)self setSetupLauncher:0];

  [(CRSetupPromptDirectorAgent *)self setCurrentPresenterSession:0];
}

- (void)setCurrentPresenterSession:(id)a3
{
  v4 = (CRSetupPromptPresenterSession *)a3;
  currentPresenterSession = self->_currentPresenterSession;
  if (currentPresenterSession)
  {
    [(CRSetupPromptPresenterSession *)currentPresenterSession invalidate];
    BOOL v6 = self->_currentPresenterSession;
    self->_currentPresenterSession = 0;
  }
  id v7 = self->_currentPresenterSession;
  self->_currentPresenterSession = v4;
}

- (void)setSetupLauncher:(id)a3
{
  v4 = (CRSetupLauncher *)a3;
  setupLauncher = self->_setupLauncher;
  if (setupLauncher)
  {
    [(CRSetupLauncher *)setupLauncher invalidate];
    BOOL v6 = self->_setupLauncher;
    self->_setupLauncher = 0;
  }
  id v7 = self->_setupLauncher;
  self->_setupLauncher = v4;
}

- (void)_checkLockScreenStatusWithReply:(id)a3
{
  id v3 = a3;
  v4 = dispatch_get_global_queue(2, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100039180;
  block[3] = &unk_1000BD640;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

- (void)_mainQueue_setupBlockedSessionQueue
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
  dispatch_queue_t v4 = dispatch_queue_create("com.apple.carkit.setupPromptPresenterSession", v3);

  [(CRSetupPromptDirectorAgent *)self setSessionQueue:v4];
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  [(CRSetupPromptDirectorAgent *)self setWaitingOnSession:v5];
  BOOL v6 = [(CRSetupPromptDirectorAgent *)self sessionQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000393F4;
  block[3] = &unk_1000BD1B0;
  dispatch_semaphore_t v9 = v5;
  id v7 = v5;
  dispatch_async(v6, block);
}

- (void)_mainQueue_unblockSessionQueue
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v3 = CarPairingLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100073C70();
  }

  dispatch_queue_t v4 = [(CRSetupPromptDirectorAgent *)self waitingOnSession];
  dispatch_semaphore_signal(v4);
}

- (void)_mainQueue_presentLockscreenAlertWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  dispatch_semaphore_t v5 = CarPairingLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "CarPlay Setup presenting lockscreen alert", (uint8_t *)buf, 2u);
  }

  BOOL v6 = objc_alloc_init(CRSetupLockscreenAlert);
  [(CRSetupPromptDirectorAgent *)self setLockscreenAlert:v6];
  objc_initWeak(buf, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10003960C;
  v8[3] = &unk_1000BE4B8;
  objc_copyWeak(&v10, buf);
  id v7 = v4;
  id v9 = v7;
  [(CRAlert *)v6 presentAlertWithCompletion:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(buf);
}

- (void)_mainQueue_dismissLockscreenAlert
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v3 = [(CRSetupPromptDirectorAgent *)self lockscreenAlert];

  if (v3)
  {
    id v4 = CarPairingLogging();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)BOOL v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "CarPlay Setup dismissing lockscreen alert", v6, 2u);
    }

    dispatch_semaphore_t v5 = [(CRSetupPromptDirectorAgent *)self lockscreenAlert];
    [v5 dismissAlert];

    [(CRSetupPromptDirectorAgent *)self setLockscreenAlert:0];
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 serviceName];
  unsigned int v9 = [v8 isEqualToString:@"com.apple.carkit.setupPromptDirector.service"];

  if (v9)
  {
    id v10 = [v7 valueForEntitlement:@"com.apple.private.carkit.setupPromptDirector"];
    unsigned __int8 v11 = [v10 BOOLValue];

    if (v11)
    {
      id v12 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CRSetupPromptDirectorService];
      [v7 setExportedInterface:v12];
      uint64_t v30 = 0;
      v31 = &v30;
      uint64_t v32 = 0x3032000000;
      v33 = sub_100039B84;
      v34 = sub_100039B94;
      id v35 = 0;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100039B9C;
      block[3] = &unk_1000BDB20;
      v29 = &v30;
      void block[4] = self;
      id v13 = v7;
      id v28 = v13;
      dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
      [v13 setExportedObject:v31[5]];
      v14 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CRSetupPromptPresenterService];
      [v13 setRemoteObjectInterface:v14];
      objc_initWeak(&location, v13);
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_100039C20;
      v24[3] = &unk_1000BD5C8;
      objc_copyWeak(&v25, &location);
      v24[4] = self;
      [v13 setInterruptionHandler:v24];
      v18 = _NSConcreteStackBlock;
      uint64_t v19 = 3221225472;
      id v20 = sub_100039D44;
      v21 = &unk_1000BD5C8;
      objc_copyWeak(&v23, &location);
      id v22 = self;
      [v13 setInvalidationHandler:&v18];
      v15 = CarPairingLogging();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = [NSNumber numberWithInt:[v13 processIdentifier:v18, v19, v20, v21]];
        *(_DWORD *)buf = 138412290;
        v37 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Receiving setup prompt service connection from %@", buf, 0xCu);
      }
      [v13 resume];
      objc_destroyWeak(&v23);
      objc_destroyWeak(&v25);
      objc_destroyWeak(&location);

      _Block_object_dispose(&v30, 8);
    }
    else
    {
      id v12 = CarPairingLogging();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_100073CA4(v7, v12);
      }
    }
  }
  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (CRSetupLauncher)setupLauncher
{
  return self->_setupLauncher;
}

- (CRSetupPromptPresenterSession)currentPresenterSession
{
  return self->_currentPresenterSession;
}

- (OS_dispatch_queue)sessionQueue
{
  return self->_sessionQueue;
}

- (void)setSessionQueue:(id)a3
{
}

- (OS_dispatch_semaphore)waitingOnSession
{
  return self->_waitingOnSession;
}

- (void)setWaitingOnSession:(id)a3
{
}

- (CRSetupLockscreenAlert)lockscreenAlert
{
  return self->_lockscreenAlert;
}

- (void)setLockscreenAlert:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockscreenAlert, 0);
  objc_storeStrong((id *)&self->_waitingOnSession, 0);
  objc_storeStrong((id *)&self->_sessionQueue, 0);
  objc_storeStrong((id *)&self->_currentPresenterSession, 0);

  objc_storeStrong((id *)&self->_setupLauncher, 0);
}

@end