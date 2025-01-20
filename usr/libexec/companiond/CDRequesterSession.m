@interface CDRequesterSession
- (BOOL)_isSandboxPurchase;
- (BOOL)_requireOwnerDevice;
- (CDRequesterSession)initWithClient:(id)a3 request:(id)a4;
- (CDServiceClient)client;
- (OS_dispatch_queue)dispatchQueue;
- (id)_idsMessageRecipientUsernames;
- (id)_notifyDeviceIDSIdentifier;
- (id)_responseForGetNotifInfoRequest:(id)a3;
- (id)deviceAcceptedNotificationHandler;
- (id)deviceStartedAuthenticationHandler;
- (id)invalidationHandler;
- (id)request;
- (id)sessionFailedHandler;
- (id)sessionFinishedHandler;
- (unint64_t)_authFlags;
- (unsigned)_deviceActionType;
- (void)_configureRapportClient:(id)a3;
- (void)_invalidated;
- (void)_notifyDeviceAcceptedNotification:(id)a3;
- (void)_notifyDeviceStartedAuthentication:(id)a3;
- (void)_notifySessionFailed:(id)a3;
- (void)_notifySessionFinished:(id)a3;
- (void)_prepareForActivationWithCompletionHandler:(id)a3;
- (void)_stopAdvertisingNearbyAction;
- (void)activateWithCompletionHandler:(id)a3;
- (void)invalidate;
- (void)setDeviceAcceptedNotificationHandler:(id)a3;
- (void)setDeviceStartedAuthenticationHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setSessionFailedHandler:(id)a3;
- (void)setSessionFinishedHandler:(id)a3;
@end

@implementation CDRequesterSession

- (CDRequesterSession)initWithClient:(id)a3 request:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CDRequesterSession;
  v9 = [(CDRequesterSession *)&v13 init];
  if (v9)
  {
    uint64_t v10 = os_transaction_create();
    transaction = v9->_transaction;
    v9->_transaction = (OS_os_transaction *)v10;

    objc_storeStrong((id *)&v9->_dispatchQueue, &_dispatch_main_q);
    v9->_activateCalledAtomic = 0;
    objc_storeStrong((id *)&v9->_client, a3);
    objc_storeStrong(&v9->_request, a4);
  }

  return v9;
}

- (void)setDispatchQueue:(id)a3
{
}

- (void)activateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  atomic_store(1u, (unsigned __int8 *)&self->_activateCalledAtomic);
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100017524;
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
  block[2] = sub_100017704;
  block[3] = &unk_1000347D8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)_invalidated
{
  if (!self->_invalidateDone)
  {
    [(RPCompanionLinkClient *)self->_rapportClient invalidate];
    rapportClient = self->_rapportClient;
    self->_rapportClient = 0;

    [(SFService *)self->_sharingService invalidate];
    sharingService = self->_sharingService;
    self->_sharingService = 0;

    id deviceAcceptedNotificationHandler = self->_deviceAcceptedNotificationHandler;
    self->_id deviceAcceptedNotificationHandler = 0;

    id deviceStartedAuthenticationHandler = self->_deviceStartedAuthenticationHandler;
    self->_id deviceStartedAuthenticationHandler = 0;

    id sessionFinishedHandler = self->_sessionFinishedHandler;
    self->_id sessionFinishedHandler = 0;

    id sessionFailedHandler = self->_sessionFailedHandler;
    self->_id sessionFailedHandler = 0;

    sub_100017B84((id *)&self->super.isa);
    [(CDIDSService *)self->_idsService invalidate];
    idsService = self->_idsService;
    self->_idsService = 0;

    invalidationHandler = (void (**)(void))self->_invalidationHandler;
    if (invalidationHandler)
    {
      invalidationHandler[2]();
      id v11 = self->_invalidationHandler;
      self->_invalidationHandler = 0;
    }
    self->_invalidateDone = 1;
  }
}

- (void)_prepareForActivationWithCompletionHandler:(id)a3
{
}

- (void)_configureRapportClient:(id)a3
{
  id v3 = a3;
  __break(1u);
}

- (unsigned)_deviceActionType
{
  return 34;
}

- (void)_notifyDeviceAcceptedNotification:(id)a3
{
  id v4 = a3;
  v5 = cps_session_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Device accepted notification: %@", (uint8_t *)&v7, 0xCu);
  }

  id deviceAcceptedNotificationHandler = (void (**)(id, id))self->_deviceAcceptedNotificationHandler;
  if (deviceAcceptedNotificationHandler) {
    deviceAcceptedNotificationHandler[2](deviceAcceptedNotificationHandler, v4);
  }
}

- (void)_notifyDeviceStartedAuthentication:(id)a3
{
  id v4 = a3;
  v5 = cps_session_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Device started server authentication: %@", (uint8_t *)&v7, 0xCu);
  }

  id deviceStartedAuthenticationHandler = (void (**)(id, id))self->_deviceStartedAuthenticationHandler;
  if (deviceStartedAuthenticationHandler) {
    deviceStartedAuthenticationHandler[2](deviceStartedAuthenticationHandler, v4);
  }
}

- (void)_notifySessionFinished:(id)a3
{
  id v4 = a3;
  v5 = cps_session_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Authentication session finished: %@", (uint8_t *)&v7, 0xCu);
  }

  id sessionFinishedHandler = (void (**)(id, id))self->_sessionFinishedHandler;
  if (sessionFinishedHandler) {
    sessionFinishedHandler[2](sessionFinishedHandler, v4);
  }
}

- (void)_notifySessionFailed:(id)a3
{
  id v4 = a3;
  v5 = cps_session_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_100022444((uint64_t)v4, v5);
  }

  id sessionFailedHandler = (void (**)(id, id))self->_sessionFailedHandler;
  if (sessionFailedHandler)
  {
    if (v4)
    {
      sessionFailedHandler[2](sessionFailedHandler, v4);
    }
    else
    {
      int v7 = +[NSError errorWithDomain:CPSErrorDomain code:100 userInfo:0];
      sessionFailedHandler[2](sessionFailedHandler, v7);
    }
  }
}

- (id)_responseForGetNotifInfoRequest:(id)a3
{
  return 0;
}

- (BOOL)_isSandboxPurchase
{
  return 0;
}

- (void)_stopAdvertisingNearbyAction
{
  [(SFService *)self->_sharingService invalidate];
  sharingService = self->_sharingService;
  self->_sharingService = 0;
}

- (BOOL)_requireOwnerDevice
{
  return 0;
}

- (unint64_t)_authFlags
{
  return 0;
}

- (id)_idsMessageRecipientUsernames
{
  return 0;
}

- (id)_notifyDeviceIDSIdentifier
{
  return 0;
}

- (CDServiceClient)client
{
  return self->_client;
}

- (id)request
{
  return self->_request;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (id)deviceAcceptedNotificationHandler
{
  return self->_deviceAcceptedNotificationHandler;
}

- (void)setDeviceAcceptedNotificationHandler:(id)a3
{
}

- (id)deviceStartedAuthenticationHandler
{
  return self->_deviceStartedAuthenticationHandler;
}

- (void)setDeviceStartedAuthenticationHandler:(id)a3
{
}

- (id)sessionFinishedHandler
{
  return self->_sessionFinishedHandler;
}

- (void)setSessionFinishedHandler:(id)a3
{
}

- (id)sessionFailedHandler
{
  return self->_sessionFailedHandler;
}

- (void)setSessionFailedHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_sessionFailedHandler, 0);
  objc_storeStrong(&self->_sessionFinishedHandler, 0);
  objc_storeStrong(&self->_deviceStartedAuthenticationHandler, 0);
  objc_storeStrong(&self->_deviceAcceptedNotificationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_request, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_idsService, 0);
  objc_storeStrong((id *)&self->_sharingService, 0);
  objc_storeStrong((id *)&self->_rapportClient, 0);

  objc_storeStrong((id *)&self->_transaction, 0);
}

@end