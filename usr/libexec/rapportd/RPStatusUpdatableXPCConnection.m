@interface RPStatusUpdatableXPCConnection
- (BOOL)_entitledAndReturnError:(id *)a3;
- (BOOL)entitled;
- (NSXPCConnection)xpcCnx;
- (OS_dispatch_queue)dispatchQueue;
- (RPStatusDaemon)daemon;
- (RPStatusProvider)provider;
- (RPStatusSubscriber)subscriber;
- (RPStatusUpdatableXPCConnection)initWithDaemon:(id)a3 xpcCnx:(id)a4;
- (void)connectionInvalidated;
- (void)setDispatchQueue:(id)a3;
- (void)setProvider:(id)a3;
- (void)setSubscriber:(id)a3;
- (void)xpcStatusProviderActivate:(id)a3 completion:(id)a4;
- (void)xpcStatusSubscriberActivate:(id)a3 completion:(id)a4;
- (void)xpcStatusUpdatableCancelProvideStatus:(id)a3;
- (void)xpcStatusUpdatableProvideStatus:(id)a3 statusInfo:(id)a4;
- (void)xpcStatusUpdatableSubscribeToStatus:(id)a3;
- (void)xpcStatusUpdatableUnsubscribeToStatus:(id)a3;
@end

@implementation RPStatusUpdatableXPCConnection

- (RPStatusUpdatableXPCConnection)initWithDaemon:(id)a3 xpcCnx:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)RPStatusUpdatableXPCConnection;
  v9 = [(RPStatusUpdatableXPCConnection *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_daemon, a3);
    objc_storeStrong((id *)&v10->_xpcCnx, a4);
    v11 = v10;
  }

  return v10;
}

- (void)connectionInvalidated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100142810 <= 20 && (dword_100142810 != -1 || _LogCategory_Initialize()))
  {
    [(NSXPCConnection *)self->_xpcCnx processIdentifier];
    LogPrintF();
  }
  provider = self->_provider;
  if (provider)
  {
    [(RPStatusProvider *)provider invalidate];
    v4 = self->_provider;
    self->_provider = 0;
  }
  subscriber = self->_subscriber;
  if (subscriber)
  {
    [(RPStatusSubscriber *)subscriber invalidate];
    v6 = self->_subscriber;
    self->_subscriber = 0;
  }
  xpcCnx = self->_xpcCnx;
  self->_xpcCnx = 0;
}

- (BOOL)_entitledAndReturnError:(id *)a3
{
  if (self->_entitled) {
    return 1;
  }
  v6 = [(NSXPCConnection *)self->_xpcCnx cuValueForEntitlementNoCache:@"com.apple.rapport.StatusUpdates"];
  unsigned int v7 = [v6 isEqual:&__kCFBooleanTrue];

  if (v7)
  {
    BOOL result = 1;
    self->_entitled = 1;
  }
  else
  {
    if (dword_100142810 <= 90 && (dword_100142810 != -1 || _LogCategory_Initialize()))
    {
      [(NSXPCConnection *)self->_xpcCnx processIdentifier];
      LogPrintF();
    }
    if (a3)
    {
      RPErrorF();
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      BOOL result = 0;
      *a3 = v8;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)xpcStatusUpdatableProvideStatus:(id)a3 statusInfo:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100142810 <= 30 && (dword_100142810 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
}

- (void)xpcStatusUpdatableCancelProvideStatus:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100142810 <= 30 && (dword_100142810 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
}

- (void)xpcStatusUpdatableSubscribeToStatus:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100142810 <= 30 && (dword_100142810 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
}

- (void)xpcStatusUpdatableUnsubscribeToStatus:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100142810 <= 30 && (dword_100142810 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
}

- (void)xpcStatusProviderActivate:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void, id))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v13 = 0;
  [(RPStatusUpdatableXPCConnection *)self _entitledAndReturnError:&v13];
  id v9 = v13;
  if (v9)
  {
    if (v8) {
      v8[2](v8, 0, v9);
    }
  }
  else if (self->_provider)
  {
    if (dword_100142810 <= 90 && (dword_100142810 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    if (v8)
    {
      v10 = RPErrorF();
      ((void (**)(id, void *, id))v8)[2](v8, &__NSArray0__struct, v10);
    }
  }
  else
  {
    if (dword_100142810 <= 30 && (dword_100142810 != -1 || _LogCategory_Initialize()))
    {
      id v11 = v7;
      uint64_t v12 = [(NSXPCConnection *)self->_xpcCnx processIdentifier];
      LogPrintF();
    }
    [v7 setDispatchQueue:self->_dispatchQueue v11, v12];
    objc_storeStrong((id *)&self->_provider, a3);
    if (v8) {
      ((void (**)(id, void *, id))v8)[2](v8, &__NSArray0__struct, 0);
    }
    [(RPStatusDaemon *)self->_daemon _update];
  }
}

- (void)xpcStatusSubscriberActivate:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void, id))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v13 = 0;
  [(RPStatusUpdatableXPCConnection *)self _entitledAndReturnError:&v13];
  id v9 = v13;
  if (v9)
  {
    if (v8) {
      v8[2](v8, 0, v9);
    }
  }
  else if (self->_subscriber)
  {
    if (dword_100142810 <= 90 && (dword_100142810 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    if (v8)
    {
      v10 = RPErrorF();
      ((void (**)(id, void *, id))v8)[2](v8, &__NSArray0__struct, v10);
    }
  }
  else
  {
    if (dword_100142810 <= 30 && (dword_100142810 != -1 || _LogCategory_Initialize()))
    {
      id v11 = v7;
      uint64_t v12 = [(NSXPCConnection *)self->_xpcCnx processIdentifier];
      LogPrintF();
    }
    -[RPStatusSubscriber setDispatchQueue:](self->_subscriber, "setDispatchQueue:", self->_dispatchQueue, v11, v12);
    objc_storeStrong((id *)&self->_subscriber, a3);
    if (v8) {
      ((void (**)(id, void *, id))v8)[2](v8, &__NSArray0__struct, 0);
    }
    [(RPStatusDaemon *)self->_daemon _update];
  }
}

- (RPStatusDaemon)daemon
{
  return self->_daemon;
}

- (BOOL)entitled
{
  return self->_entitled;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (RPStatusProvider)provider
{
  return self->_provider;
}

- (void)setProvider:(id)a3
{
}

- (RPStatusSubscriber)subscriber
{
  return self->_subscriber;
}

- (void)setSubscriber:(id)a3
{
}

- (NSXPCConnection)xpcCnx
{
  return self->_xpcCnx;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_subscriber, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);

  objc_storeStrong((id *)&self->_daemon, 0);
}

@end