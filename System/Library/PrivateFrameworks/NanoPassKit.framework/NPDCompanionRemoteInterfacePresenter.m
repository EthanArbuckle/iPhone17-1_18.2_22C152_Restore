@interface NPDCompanionRemoteInterfacePresenter
+ (id)_errorWithMessage:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NPDCompanionRemoteInterfacePresenter)initWithDispatchQueue:(id)a3 viewServiceName:(id)a4;
- (NPDCompanionRemoteInterfacePresenterDelegate)delegate;
- (NSDictionary)userInfo;
- (NSString)viewControllerClassName;
- (id)initForRemotePassUIService;
- (void)_queue_activateServiceListener;
- (void)_queue_activateViewServiceHandle;
- (void)_queue_activateWithCompletionHandler:(id)a3;
- (void)_queue_invalidated;
- (void)activateWithCompletionHandler:(id)a3;
- (void)handleCompanionItemSelectionCancelledForRequestIdentifier:(id)a3;
- (void)handleCompanionItemSelectionFinishedWithRenewalAmount:(id)a3 serviceProviderData:(id)a4 forRequestIdentifier:(id)a5;
- (void)handleCompanionValueEntryCancelledForRequestIdentifier:(id)a3;
- (void)handleCompanionValueEntryFinishedWithCurrencyAmount:(id)a3 forRequestIdentifier:(id)a4;
- (void)invalidate;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidActivate:(id)a3;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setUserInfo:(id)a3;
- (void)setViewControllerClassName:(id)a3;
@end

@implementation NPDCompanionRemoteInterfacePresenter

- (id)initForRemotePassUIService
{
  return [(NPDCompanionRemoteInterfacePresenter *)self initWithDispatchQueue:&_dispatch_main_q viewServiceName:@"com.apple.RemotePassUIService"];
}

- (NPDCompanionRemoteInterfacePresenter)initWithDispatchQueue:(id)a3 viewServiceName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NPDCompanionRemoteInterfacePresenter;
  v9 = [(NPDCompanionRemoteInterfacePresenter *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dispatchQueue, a3);
    objc_storeStrong((id *)&v10->_viewServiceName, a4);
  }

  return v10;
}

- (void)activateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003D670;
  v7[3] = &unk_10006D5E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003D784;
  block[3] = &unk_10006CFC0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  id v4 = a3;
  v5 = pk_General_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_General_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Notice: View service activated: %@", buf, 0xCu);
    }
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003D8B8;
  block[3] = &unk_10006CFC0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4 = a3;
  v5 = pk_General_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_General_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Notice: View service deactivated: %@", buf, 0xCu);
    }
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003D9F4;
  block[3] = &unk_10006CFC0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003DAC0;
  block[3] = &unk_10006CF68;
  id v12 = v6;
  id v13 = v7;
  v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  [v5 setExportedObject:self];
  id v6 = +[NPKRemotePassActionUIServicePresenterInterface interface];
  [v5 setExportedInterface:v6];

  [v5 resume];
  return 1;
}

- (void)_queue_activateWithCompletionHandler:(id)a3
{
  viewControllerClassName = self->_viewControllerClassName;
  id v5 = (void (**)(void))a3;
  if (viewControllerClassName)
  {
    [(NPDCompanionRemoteInterfacePresenter *)self _queue_activateServiceListener];
    [(NPDCompanionRemoteInterfacePresenter *)self _queue_activateViewServiceHandle];
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = [(id)objc_opt_class() _errorWithMessage:@"Failed to activate alert with nil view controller class name."];
  }
  id v7 = (id)v6;
  v5[2](v5);
}

- (void)_queue_invalidated
{
  self->_activated = 0;
  [(NSXPCListener *)self->_serviceListener invalidate];
  serviceListener = self->_serviceListener;
  self->_serviceListener = 0;

  [(SBSRemoteAlertHandle *)self->_viewServiceHandle invalidate];
  viewServiceHandle = self->_viewServiceHandle;
  self->_viewServiceHandle = 0;
}

- (void)_queue_activateServiceListener
{
  v3 = +[NSXPCListener anonymousListener];
  serviceListener = self->_serviceListener;
  self->_serviceListener = v3;

  [(NSXPCListener *)self->_serviceListener _setQueue:self->_dispatchQueue];
  [(NSXPCListener *)self->_serviceListener setDelegate:self];
  id v5 = self->_serviceListener;
  [(NSXPCListener *)v5 resume];
}

- (void)_queue_activateViewServiceHandle
{
  id v8 = [objc_alloc((Class)SBSRemoteAlertDefinition) initWithServiceName:self->_viewServiceName viewControllerClassName:self->_viewControllerClassName];
  id v3 = objc_alloc_init((Class)SBSRemoteAlertConfigurationContext);
  id v4 = [(NSXPCListener *)self->_serviceListener endpoint];
  id v5 = [v4 _endpoint];
  [v3 setXpcEndpoint:v5];

  [v3 setUserInfo:self->_userInfo];
  uint64_t v6 = (SBSRemoteAlertHandle *)+[SBSRemoteAlertHandle newHandleWithDefinition:v8 configurationContext:v3];
  viewServiceHandle = self->_viewServiceHandle;
  self->_viewServiceHandle = v6;

  [(SBSRemoteAlertHandle *)self->_viewServiceHandle registerObserver:self];
  [(SBSRemoteAlertHandle *)self->_viewServiceHandle activateWithContext:0];
}

+ (id)_errorWithMessage:(id)a3
{
  uint64_t v3 = NPKErrorDomain;
  NSErrorUserInfoKey v8 = NSLocalizedDescriptionKey;
  id v9 = a3;
  id v4 = a3;
  id v5 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  uint64_t v6 = +[NSError errorWithDomain:v3 code:-1000 userInfo:v5];

  return v6;
}

- (void)handleCompanionValueEntryFinishedWithCurrencyAmount:(id)a3 forRequestIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NPDCompanionRemoteInterfacePresenter *)self delegate];
  [v8 remoteInterfacePresenter:self handleCompanionValueEntryRequestDidFinishWithCurrencyAmount:v7 forRequestIdentifier:v6];
}

- (void)handleCompanionValueEntryCancelledForRequestIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(NPDCompanionRemoteInterfacePresenter *)self delegate];
  [v5 remoteInterfacePresenter:self handleCompanionValueEntryRequestDidCancelForRequestIdentifier:v4];
}

- (void)handleCompanionItemSelectionFinishedWithRenewalAmount:(id)a3 serviceProviderData:(id)a4 forRequestIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(NPDCompanionRemoteInterfacePresenter *)self delegate];
  [v11 remoteInterfacePresenter:self handleCompanionItemSelectionRequestDidFinishWithRenewalAmount:v10 serviceProviderData:v9 forRequestIdentifier:v8];
}

- (void)handleCompanionItemSelectionCancelledForRequestIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(NPDCompanionRemoteInterfacePresenter *)self delegate];
  [v5 remoteInterfacePresenter:self handleCompanionItemSelectionRequestDidCancelForRequestIdentifier:v4];
}

- (NPDCompanionRemoteInterfacePresenterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NPDCompanionRemoteInterfacePresenterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)viewControllerClassName
{
  return self->_viewControllerClassName;
}

- (void)setViewControllerClassName:(id)a3
{
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_viewControllerClassName, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_viewServiceHandle, 0);
  objc_storeStrong((id *)&self->_serviceListener, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_viewServiceName, 0);
}

@end