@interface _SESSession
+ (id)validateEntitlements:(id)a3;
- (BOOL)isActive;
- (BOOL)isBackgrounded;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)queue;
- (_SESSession)initWithRemoteObject:(id)a3 queue:(id)a4;
- (id)didEndCallback;
- (id)remoteObject;
- (void)endSession:(id)a3;
- (void)endSessionInternal:(id)a3;
- (void)releaseRemoteObject;
- (void)setConnection:(id)a3;
- (void)setDidEndCallback:(id)a3;
- (void)setIsBackgrounded:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)start;
@end

@implementation _SESSession

- (_SESSession)initWithRemoteObject:(id)a3 queue:(id)a4
{
  id v7 = a3;
  v8 = (OS_dispatch_queue *)a4;
  v12.receiver = self;
  v12.super_class = (Class)_SESSession;
  v9 = [(_SESSession *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_remoteObject, a3);
    v10->_queue = v8;
    v10->_isBackgrounded = 0;
    *(_WORD *)&v10->_didStart = 0;
    v10->_lock._os_unfair_lock_opaque = 0;
  }

  return v10;
}

+ (id)validateEntitlements:(id)a3
{
  v3 = SESDefaultLogObject();
  v4 = SESCreateAndLogError();

  return v4;
}

- (void)setDidEndCallback:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = [v5 copy];

  id didEndCallback = self->_didEndCallback;
  self->_id didEndCallback = v6;

  os_unfair_lock_unlock(p_lock);
}

- (void)releaseRemoteObject
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  os_unfair_lock_lock(&self->_lock);
  id remoteObject = self->_remoteObject;
  self->_id remoteObject = 0;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)start
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  os_unfair_lock_lock(&self->_lock);
  v3 = SESDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    id v5 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "SESSession start %@", (uint8_t *)&v4, 0xCu);
  }

  if (!self->_didStart)
  {
    self->_didStart = 1;
    [self->_remoteObject didStartSession:0];
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)endSessionInternal:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  os_unfair_lock_lock(&self->_lock);
  id v5 = SESDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412546;
    v10 = self;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "SESSession endSessionInternal %@ error %@", (uint8_t *)&v9, 0x16u);
  }

  if (!self->_didStart)
  {
    self->_didStart = 1;
    if (!v4)
    {
      id v6 = SESDefaultLogObject();
      SESCreateAndLogError();
      id v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    [self->_remoteObject didStartSession:v4];
  }
  self->_didEnd = 1;
  id didEndCallback = (void (**)(id, _SESSession *))self->_didEndCallback;
  if (didEndCallback)
  {
    didEndCallback[2](didEndCallback, self);
    id v8 = self->_didEndCallback;
    self->_id didEndCallback = 0;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)isActive
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL v4 = self->_didStart && !self->_didEnd;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)endSession:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100015468;
  v7[3] = &unk_10040BE80;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (id)remoteObject
{
  return objc_getProperty(self, a2, 32, 1);
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 40, 1);
}

- (void)setConnection:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  self->_queue = (OS_dispatch_queue *)a3;
}

- (id)didEndCallback
{
  return self->_didEndCallback;
}

- (BOOL)isBackgrounded
{
  return self->_isBackgrounded;
}

- (void)setIsBackgrounded:(BOOL)a3
{
  self->_isBackgrounded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong(&self->_remoteObject, 0);

  objc_storeStrong(&self->_didEndCallback, 0);
}

@end