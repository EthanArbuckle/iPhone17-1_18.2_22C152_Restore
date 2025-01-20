@interface RSDRemoteDisplayDeviceDevice
- (BOOL)connectable;
- (BOOL)suspended;
- (RSDRemoteDisplayDeviceDevice)initWithGeneratedName;
- (RSDRemoteDisplayDeviceDevice)initWithInterface:(id)a3;
- (unsigned)type;
- (void)attach;
- (void)createPortListener;
- (void)disconnect;
- (void)needsConnect;
- (void)setSuspended:(BOOL)a3;
@end

@implementation RSDRemoteDisplayDeviceDevice

- (unsigned)type
{
  return 12;
}

- (RSDRemoteDisplayDeviceDevice)initWithGeneratedName
{
  *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)__str = v3;
  long long v8 = v3;
  int v4 = dword_10005B628++;
  snprintf(__str, 0x20uLL, "displayhost-%d", v4);
  v6.receiver = self;
  v6.super_class = (Class)RSDRemoteDisplayDeviceDevice;
  return [(RSDRemoteDevice *)&v6 initWithName:__str];
}

- (RSDRemoteDisplayDeviceDevice)initWithInterface:(id)a3
{
  id v4 = a3;
  v5 = [(RSDRemoteDisplayDeviceDevice *)self initWithGeneratedName];
  objc_super v6 = v5;
  if (v5)
  {
    [(RSDRemoteNCMDevice *)v5 setInterface:v4];
    v7 = v6;
  }

  return v6;
}

- (void)attach
{
  v3.receiver = self;
  v3.super_class = (Class)RSDRemoteDisplayDeviceDevice;
  [(RSDRemoteDevice *)&v3 attach];
  [(RSDRemoteDisplayDeviceDevice *)self createPortListener];
}

- (void)disconnect
{
  objc_super v3 = qword_10005BF00;
  if (os_log_type_enabled((os_log_t)qword_10005BF00, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@> disconnect", buf, 0xCu);
  }
  if (self->listener_source)
  {
    id v4 = qword_10005BF00;
    if (os_log_type_enabled((os_log_t)qword_10005BF00, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v7 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@> cancelling port listener", buf, 0xCu);
    }
    dispatch_source_cancel((dispatch_source_t)self->listener_source);
  }
  if (self->reestablished_connection) {
    xpc_remote_connection_cancel();
  }
  v5.receiver = self;
  v5.super_class = (Class)RSDRemoteDisplayDeviceDevice;
  [(RSDRemoteDevice *)&v5 disconnect];
}

- (void)needsConnect
{
  objc_super v3 = qword_10005BF00;
  if (os_log_type_enabled((os_log_t)qword_10005BF00, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@> needsConnect", (uint8_t *)&v9, 0xCu);
  }
  if (self->reestablished_connection)
  {
    id v4 = [(RSDRemoteDevice *)self connection];

    objc_super v5 = qword_10005BF00;
    BOOL v6 = os_log_type_enabled((os_log_t)qword_10005BF00, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v6)
      {
        int v9 = 138543362;
        v10 = self;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@> wait for current connection to invalidate before applying reestablished connection", (uint8_t *)&v9, 0xCu);
      }
    }
    else
    {
      if (v6)
      {
        int v9 = 138543362;
        v10 = self;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@> Applying re-established connection", (uint8_t *)&v9, 0xCu);
      }
      reestablished_connection = self->reestablished_connection;
      self->reestablished_connection = 0;
      long long v8 = reestablished_connection;

      [(RSDRemoteDevice *)self connect:v8];
    }
  }
}

- (void)createPortListener
{
  objc_super v3 = qword_10005BF00;
  if (os_log_type_enabled((os_log_t)qword_10005BF00, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v19 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@> create port listener start", buf, 0xCu);
  }
  __int16 v17 = -6753;
  int v16 = -1;
  id v4 = [(RSDRemoteNCMDevice *)self local_address];
  objc_super v5 = [(RSDRemoteNCMDevice *)self interface];
  int v6 = sub_10001F504(&v16, (__n128 *)v4, &v17, (int)[v5 index], (uint64_t)&unk_100044D94);

  if (v6)
  {
    v7 = qword_10005BF00;
    if (os_log_type_enabled((os_log_t)qword_10005BF00, OS_LOG_TYPE_ERROR)) {
      sub_10003D4CC((uint64_t)self, v6, v7);
    }
    dispatch_time_t v8 = dispatch_time(0, 200000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000270E8;
    block[3] = &unk_1000550D0;
    block[4] = self;
    dispatch_after(v8, (dispatch_queue_t)qword_10005BF08, block);
  }
  else
  {
    int v9 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, v16, 0, (dispatch_queue_t)qword_10005BF08);
    listener_source = self->listener_source;
    self->listener_source = v9;

    v11 = self->listener_source;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100027138;
    handler[3] = &unk_1000554D0;
    int v14 = v16;
    handler[4] = self;
    dispatch_source_set_event_handler(v11, handler);
    dispatch_source_set_mandatory_cancel_handler();
    dispatch_activate((dispatch_object_t)self->listener_source);
    v12 = qword_10005BF00;
    if (os_log_type_enabled((os_log_t)qword_10005BF00, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v19 = self;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@> create port listener done", buf, 0xCu);
    }
  }
}

- (BOOL)connectable
{
  if (self->_suspended) {
    return 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)RSDRemoteDisplayDeviceDevice;
  return [(RSDRemoteDevice *)&v3 connectable];
}

- (void)setSuspended:(BOOL)a3
{
  if (self->_suspended != a3)
  {
    BOOL v3 = a3;
    objc_super v5 = qword_10005BF00;
    BOOL v6 = os_log_type_enabled((os_log_t)qword_10005BF00, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v6)
      {
        int v7 = 138543362;
        dispatch_time_t v8 = self;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%{public}@> Suspending", (uint8_t *)&v7, 0xCu);
      }
    }
    else
    {
      if (v6)
      {
        int v7 = 138543362;
        dispatch_time_t v8 = self;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%{public}@> Resuming", (uint8_t *)&v7, 0xCu);
      }
      [(RSDRemoteDevice *)self drainPendedRequests];
    }
    self->_suspended = v3;
  }
}

- (BOOL)suspended
{
  return self->_suspended;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->listener_source, 0);
  objc_storeStrong((id *)&self->bonjour_listener, 0);

  objc_storeStrong((id *)&self->reestablished_connection, 0);
}

@end