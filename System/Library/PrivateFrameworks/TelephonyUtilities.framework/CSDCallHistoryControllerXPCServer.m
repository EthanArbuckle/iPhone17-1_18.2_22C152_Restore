@interface CSDCallHistoryControllerXPCServer
- (CSDCallHistoryController)callHistoryController;
- (CSDCallHistoryControllerXPCServer)initWithCallHistoryController:(id)a3;
- (CSDClientManager)clientManager;
- (OS_dispatch_queue)queue;
- (int)clientsShouldConnectToken;
- (void)allCallHistoryDeleted;
- (void)dealloc;
- (void)invalidate;
- (void)notifyClientsToConnectIfNecessary;
- (void)recentCallsDeleted:(id)a3;
- (void)registerClient:(id)a3;
- (void)setClientsShouldConnectToken:(int)a3;
- (void)unregisterClient:(id)a3;
@end

@implementation CSDCallHistoryControllerXPCServer

- (CSDCallHistoryControllerXPCServer)initWithCallHistoryController:(id)a3
{
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CSDCallHistoryControllerXPCServer;
  v6 = [(CSDCallHistoryControllerXPCServer *)&v21 init];
  if (v6)
  {
    v7 = sub_100008DCC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Creating CSDCallHistoryControllerXPCServer", buf, 2u);
    }

    dispatch_queue_t v8 = dispatch_queue_create("com.apple.telephonyutilities.callservicesd.callhistorycontrollerxpcserver", 0);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v8;

    objc_storeStrong((id *)&v6->_callHistoryController, a3);
    v10 = [[CSDClientManager alloc] initWithSerialQueue:v6->_queue];
    clientManager = v6->_clientManager;
    v6->_clientManager = v10;

    v12 = v6->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002BAC0;
    block[3] = &unk_100504EC0;
    v13 = v6;
    v19 = v13;
    dispatch_sync(v12, block);
    v14 = [(CSDCallHistoryControllerXPCServer *)v13 queue];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10002BD50;
    v16[3] = &unk_100504EC0;
    v17 = v13;
    dispatch_async(v14, v16);
  }
  return v6;
}

- (void)dealloc
{
  v3 = sub_100008DCC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "deallocing CallHistoryControllerXPCServer", buf, 2u);
  }

  notify_cancel(self->_clientsShouldConnectToken);
  v4.receiver = self;
  v4.super_class = (Class)CSDCallHistoryControllerXPCServer;
  [(CSDCallHistoryControllerXPCServer *)&v4 dealloc];
}

- (void)invalidate
{
  v3 = sub_100008DCC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "invalidating CallHistoryControllerXPCServer", buf, 2u);
  }

  objc_super v4 = [(CSDCallHistoryControllerXPCServer *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002BF28;
  block[3] = &unk_100504EC0;
  void block[4] = self;
  dispatch_async(v4, block);
}

- (void)notifyClientsToConnectIfNecessary
{
  v3 = [(CSDCallHistoryControllerXPCServer *)self queue];
  dispatch_assert_queue_V2(v3);

  objc_super v4 = sub_100008DCC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "NOTIFYING CLIENTS TO CONNECT", v5, 2u);
  }

  notify_set_state(self->_clientsShouldConnectToken, 1uLL);
  notify_post("CSDCallHistoryControllerClientsShouldConnectNotification");
}

- (void)registerClient:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCallHistoryControllerXPCServer *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002C0B8;
  v7[3] = &unk_100504F10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)unregisterClient:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCallHistoryControllerXPCServer *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002C1C0;
  v7[3] = &unk_100504F10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)recentCallsDeleted:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDCallHistoryControllerXPCServer *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002C2C8;
  v7[3] = &unk_100504F10;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)allCallHistoryDeleted
{
  v3 = [(CSDCallHistoryControllerXPCServer *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002C414;
  block[3] = &unk_100504EC0;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CSDCallHistoryController)callHistoryController
{
  return self->_callHistoryController;
}

- (CSDClientManager)clientManager
{
  return self->_clientManager;
}

- (int)clientsShouldConnectToken
{
  return self->_clientsShouldConnectToken;
}

- (void)setClientsShouldConnectToken:(int)a3
{
  self->_clientsShouldConnectToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientManager, 0);
  objc_storeStrong((id *)&self->_callHistoryController, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end