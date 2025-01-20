@interface CDProviderViewService
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CDProviderViewService)init;
- (CPSDedicatedCameraRequest)dedicatedCameraRequest;
- (CPSRestrictedAccessRequest)restrictedAccessRequest;
- (CPSStoreAuthenticationRequest)storeAuthenticationRequest;
- (CPSSystemAuthenticationRequest)systemAuthenticationRequest;
- (CPSTVProviderRequest)tvProviderRequest;
- (CPSWebRequest)webAuthenticationRequest;
- (NSArray)proxiedAppDomains;
- (NSData)sharingData;
- (NSString)remoteDeviceName;
- (NSString)viewControllerClassName;
- (OS_dispatch_queue)dispatchQueue;
- (id)actionHandler;
- (id)invalidationHandler;
- (id)storeAuthenticationCompletionHandler;
- (id)webAuthenticationCompletionHandler;
- (void)activateWithCompletionHandler:(id)a3;
- (void)confirm;
- (void)deactivateWithError:(id)a3;
- (void)invalidate;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidActivate:(id)a3;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
- (void)setActionHandler:(id)a3;
- (void)setDedicatedCameraRequest:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setProxiedAppDomains:(id)a3;
- (void)setRemoteDeviceName:(id)a3;
- (void)setRestrictedAccessRequest:(id)a3;
- (void)setSharingData:(id)a3;
- (void)setStoreAuthenticationCompletionHandler:(id)a3;
- (void)setStoreAuthenticationRequest:(id)a3;
- (void)setSystemAuthenticationRequest:(id)a3;
- (void)setTvProviderRequest:(id)a3;
- (void)setViewControllerClassName:(id)a3;
- (void)setWebAuthenticationCompletionHandler:(id)a3;
- (void)setWebAuthenticationRequest:(id)a3;
- (void)shareCompleted;
- (void)shareFailedWithError:(id)a3;
- (void)storeAuthenticationFailedWithError:(id)a3;
- (void)storeAuthenticationFinishedWithResult:(id)a3;
- (void)webAuthenticationFailedWithError:(id)a3;
- (void)webAuthenticationFinishedWithCallbackURL:(id)a3;
@end

@implementation CDProviderViewService

- (CDProviderViewService)init
{
  v7.receiver = self;
  v7.super_class = (Class)CDProviderViewService;
  v2 = [(CDProviderViewService *)&v7 init];
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
    uint64_t v4 = os_transaction_create();
    transaction = v3->_transaction;
    v3->_transaction = (OS_os_transaction *)v4;
  }
  return v3;
}

- (void)setDispatchQueue:(id)a3
{
}

- (void)setActionHandler:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000117EC;
    v9[3] = &unk_100034DA8;
    v9[4] = self;
    id v10 = v4;
    v6 = objc_retainBlock(v9);
    id actionHandler = self->_actionHandler;
    self->_id actionHandler = v6;

    id v8 = v10;
  }
  else
  {
    id v8 = self->_actionHandler;
    self->_id actionHandler = 0;
  }
}

- (void)activateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  [(BSAtomicSignal *)self->_activateCalledSignal signal];
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000118D8;
  v7[3] = &unk_100034DD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)dispatchQueue, v7);
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100011C18;
  block[3] = &unk_1000347D8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  id v3 = a3;
  id v4 = cps_daemon_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "View service activated: %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4 = a3;
  int v5 = cps_daemon_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "View service deactivated: %@", buf, 0xCu);
  }

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001218C;
  block[3] = &unk_1000347D8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = cps_daemon_log();
  id v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10002203C((uint64_t)v6, (uint64_t)v7, v9);
    }

    dispatchQueue = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100012344;
    block[3] = &unk_100034800;
    block[4] = self;
    id v14 = v7;
    dispatch_async((dispatch_queue_t)dispatchQueue, block);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "View service invalidated: %@", buf, 0xCu);
    }

    v11 = self->_dispatchQueue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000123AC;
    v12[3] = &unk_1000347D8;
    v12[4] = self;
    dispatch_async((dispatch_queue_t)v11, v12);
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  int v5 = (NSXPCConnection *)a4;
  [(NSXPCConnection *)v5 setExportedObject:self];
  id v6 = +[CPSViewServiceInterface presenterInterface];
  [(NSXPCConnection *)v5 setExportedInterface:v6];

  id v7 = +[CPSViewServiceInterface presentingInterface];
  [(NSXPCConnection *)v5 setRemoteObjectInterface:v7];

  [(NSXPCConnection *)v5 resume];
  viewServiceConnection = self->_viewServiceConnection;
  self->_viewServiceConnection = v5;

  id v9 = sub_100011D98((id *)&self->super.isa);
  [v9 establishConnection];

  return 1;
}

- (void)confirm
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000124D8;
  block[3] = &unk_1000347D8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)deactivateWithError:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000125D8;
  v7[3] = &unk_100034800;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)dispatchQueue, v7);
}

- (void)webAuthenticationFinishedWithCallbackURL:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000126D8;
  v7[3] = &unk_100034800;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)dispatchQueue, v7);
}

- (void)webAuthenticationFailedWithError:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000127D8;
  v7[3] = &unk_100034800;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)dispatchQueue, v7);
}

- (void)shareCompleted
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000128B4;
  block[3] = &unk_1000347D8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)shareFailedWithError:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100012954;
  v7[3] = &unk_100034800;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)dispatchQueue, v7);
}

- (void)storeAuthenticationFinishedWithResult:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100012A54;
  v7[3] = &unk_100034800;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)dispatchQueue, v7);
}

- (void)storeAuthenticationFailedWithError:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100012B54;
  v7[3] = &unk_100034800;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)dispatchQueue, v7);
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (NSString)remoteDeviceName
{
  return self->_remoteDeviceName;
}

- (void)setRemoteDeviceName:(id)a3
{
}

- (NSString)viewControllerClassName
{
  return self->_viewControllerClassName;
}

- (void)setViewControllerClassName:(id)a3
{
}

- (NSData)sharingData
{
  return self->_sharingData;
}

- (void)setSharingData:(id)a3
{
}

- (CPSSystemAuthenticationRequest)systemAuthenticationRequest
{
  return self->_systemAuthenticationRequest;
}

- (void)setSystemAuthenticationRequest:(id)a3
{
}

- (CPSWebRequest)webAuthenticationRequest
{
  return self->_webAuthenticationRequest;
}

- (void)setWebAuthenticationRequest:(id)a3
{
}

- (NSArray)proxiedAppDomains
{
  return self->_proxiedAppDomains;
}

- (void)setProxiedAppDomains:(id)a3
{
}

- (id)webAuthenticationCompletionHandler
{
  return self->_webAuthenticationCompletionHandler;
}

- (void)setWebAuthenticationCompletionHandler:(id)a3
{
}

- (CPSRestrictedAccessRequest)restrictedAccessRequest
{
  return self->_restrictedAccessRequest;
}

- (void)setRestrictedAccessRequest:(id)a3
{
}

- (CPSStoreAuthenticationRequest)storeAuthenticationRequest
{
  return self->_storeAuthenticationRequest;
}

- (void)setStoreAuthenticationRequest:(id)a3
{
}

- (id)storeAuthenticationCompletionHandler
{
  return self->_storeAuthenticationCompletionHandler;
}

- (void)setStoreAuthenticationCompletionHandler:(id)a3
{
}

- (CPSTVProviderRequest)tvProviderRequest
{
  return self->_tvProviderRequest;
}

- (void)setTvProviderRequest:(id)a3
{
}

- (CPSDedicatedCameraRequest)dedicatedCameraRequest
{
  return self->_dedicatedCameraRequest;
}

- (void)setDedicatedCameraRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dedicatedCameraRequest, 0);
  objc_storeStrong((id *)&self->_tvProviderRequest, 0);
  objc_storeStrong(&self->_storeAuthenticationCompletionHandler, 0);
  objc_storeStrong((id *)&self->_storeAuthenticationRequest, 0);
  objc_storeStrong((id *)&self->_restrictedAccessRequest, 0);
  objc_storeStrong(&self->_webAuthenticationCompletionHandler, 0);
  objc_storeStrong((id *)&self->_proxiedAppDomains, 0);
  objc_storeStrong((id *)&self->_webAuthenticationRequest, 0);
  objc_storeStrong((id *)&self->_systemAuthenticationRequest, 0);
  objc_storeStrong((id *)&self->_sharingData, 0);
  objc_storeStrong((id *)&self->_viewControllerClassName, 0);
  objc_storeStrong((id *)&self->_remoteDeviceName, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_activateCalledSignal, 0);
  objc_storeStrong((id *)&self->_viewServiceHandle, 0);
  objc_storeStrong((id *)&self->_viewServiceConnection, 0);
  objc_storeStrong((id *)&self->_serviceListener, 0);

  objc_storeStrong((id *)&self->_transaction, 0);
}

@end