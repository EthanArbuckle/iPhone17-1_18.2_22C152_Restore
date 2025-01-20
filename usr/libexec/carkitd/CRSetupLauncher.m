@interface CRSetupLauncher
- (SBSRemoteAlertHandle)remoteAlert;
- (SFClient)sharingClient;
- (id)currentErrorHandler;
- (void)_launchRemoteAlertWithUserInfo:(id)a3 errorHandler:(id)a4;
- (void)invalidate;
- (void)launchCarPlaySetupWithUserInfo:(id)a3 errorHandler:(id)a4;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidActivate:(id)a3;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
- (void)setCurrentErrorHandler:(id)a3;
- (void)setRemoteAlert:(id)a3;
- (void)setSharingClient:(id)a3;
@end

@implementation CRSetupLauncher

- (void)launchCarPlaySetupWithUserInfo:(id)a3 errorHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(CRSetupLauncher *)self setCurrentErrorHandler:v7];
  v8 = CarPairingLogging();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "requesting prox card transaction", (uint8_t *)buf, 2u);
  }

  id v9 = objc_alloc_init((Class)SFClient);
  [(CRSetupLauncher *)self setSharingClient:v9];

  objc_initWeak(buf, self);
  v10 = [(CRSetupLauncher *)self sharingClient];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100015184;
  v13[3] = &unk_1000BD580;
  objc_copyWeak(&v16, buf);
  id v11 = v6;
  id v14 = v11;
  id v12 = v7;
  id v15 = v12;
  [v10 startProxCardTransactionWithOptions:0 completion:v13];

  objc_destroyWeak(&v16);
  objc_destroyWeak(buf);
}

- (void)_launchRemoteAlertWithUserInfo:(id)a3 errorHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  v8 = [(CRSetupLauncher *)self remoteAlert];
  unsigned int v9 = [v8 isValid];

  if (v9)
  {
    v10 = CarPairingLogging();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Not showing CarPlaySetup - alert is still valid.", v14, 2u);
    }

    if (v7) {
      v7[2](v7, 0);
    }
  }
  else
  {
    id v11 = [objc_alloc((Class)SBSRemoteAlertDefinition) initWithServiceName:@"com.apple.CarPlaySetupApp" viewControllerClassName:@"CARSetupContainerViewController"];
    id v12 = objc_alloc_init((Class)SBSRemoteAlertConfigurationContext);
    [v12 setUserInfo:v6];
    id v13 = +[SBSRemoteAlertHandle newHandleWithDefinition:v11 configurationContext:v12];
    [v13 registerObserver:self];
    [v13 activateWithContext:0];
    [(CRSetupLauncher *)self setRemoteAlert:v13];
  }
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100015588;
  block[3] = &unk_1000BD1B0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v5 = a4;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000156C4;
  block[3] = &unk_1000BD5C8;
  objc_copyWeak(&v9, &location);
  id v8 = v5;
  id v6 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v3 = CarPairingLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100070540(v3);
  }

  [(CRSetupLauncher *)self setCurrentErrorHandler:0];
  v4 = [(CRSetupLauncher *)self remoteAlert];
  [v4 unregisterObserver:self];

  id v5 = [(CRSetupLauncher *)self remoteAlert];
  [v5 invalidate];

  [(CRSetupLauncher *)self setRemoteAlert:0];
  id v6 = [(CRSetupLauncher *)self sharingClient];
  [v6 invalidate];

  [(CRSetupLauncher *)self setSharingClient:0];
}

- (SBSRemoteAlertHandle)remoteAlert
{
  return self->_remoteAlert;
}

- (void)setRemoteAlert:(id)a3
{
}

- (SFClient)sharingClient
{
  return self->_sharingClient;
}

- (void)setSharingClient:(id)a3
{
}

- (id)currentErrorHandler
{
  return self->_currentErrorHandler;
}

- (void)setCurrentErrorHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_currentErrorHandler, 0);
  objc_storeStrong((id *)&self->_sharingClient, 0);

  objc_storeStrong((id *)&self->_remoteAlert, 0);
}

@end