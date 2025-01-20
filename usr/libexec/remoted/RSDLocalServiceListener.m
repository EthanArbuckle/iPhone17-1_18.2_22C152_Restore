@interface RSDLocalServiceListener
- (BOOL)canceled;
- (OS_dispatch_source)socket_source;
- (RSDLocalService)service;
- (RSDLocalServiceListener)initWithService:(id)a3 forDevice:(id)a4 withPort:(char *)a5 onSocket:(int)a6;
- (RSDRemoteDevice)device;
- (char)port;
- (id)copyServiceDescription;
- (int)socket;
- (void)cancel;
- (void)dealloc;
- (void)setCanceled:(BOOL)a3;
- (void)setDevice:(id)a3;
- (void)setPort:(char *)a3;
- (void)setService:(id)a3;
- (void)setSocket:(int)a3;
- (void)setSocket_source:(id)a3;
@end

@implementation RSDLocalServiceListener

- (RSDLocalServiceListener)initWithService:(id)a3 forDevice:(id)a4 withPort:(char *)a5 onSocket:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v10 = a3;
  id v11 = a4;
  v12 = [(RSDLocalServiceListener *)self init];
  v13 = v12;
  if (v12)
  {
    [(RSDLocalServiceListener *)v12 setService:v10];
    [(RSDLocalServiceListener *)v13 setPort:a5];
    [(RSDLocalServiceListener *)v13 setSocket:v6];
    [(RSDLocalServiceListener *)v13 setDevice:v11];
    dispatch_source_t v14 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, (int)v6, 0, (dispatch_queue_t)qword_10005BCF0);
    [(RSDLocalServiceListener *)v13 setSocket_source:v14];

    v15 = [(RSDLocalServiceListener *)v13 socket_source];
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000075A4;
    handler[3] = &unk_1000550A8;
    v16 = v13;
    v23 = v16;
    id v24 = v11;
    dispatch_source_set_event_handler(v15, handler);

    v17 = [(RSDLocalServiceListener *)v16 socket_source];
    v21 = v16;
    dispatch_source_set_mandatory_cancel_handler();

    v18 = [(RSDLocalServiceListener *)v21 socket_source];
    dispatch_activate(v18);

    v19 = v21;
  }

  return v13;
}

- (id)copyServiceDescription
{
  v3 = [(RSDLocalServiceListener *)self service];
  id v4 = [v3 copyServiceDescription];

  if (!v4) {
    sub_100033984(&v6, v7);
  }
  xpc_dictionary_set_string(v4, "Port", [(RSDLocalServiceListener *)self port]);
  return v4;
}

- (void)cancel
{
  [(RSDLocalServiceListener *)self setCanceled:1];
  v3 = [(RSDLocalServiceListener *)self socket_source];
  dispatch_source_cancel(v3);
}

- (void)dealloc
{
  if (!self->_canceled) {
    sub_1000339F0(&v4, v5);
  }
  free(self->_port);
  v3.receiver = self;
  v3.super_class = (Class)RSDLocalServiceListener;
  [(RSDLocalServiceListener *)&v3 dealloc];
}

- (RSDLocalService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (RSDRemoteDevice)device
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_device);

  return (RSDRemoteDevice *)WeakRetained;
}

- (void)setDevice:(id)a3
{
}

- (char)port
{
  return self->_port;
}

- (void)setPort:(char *)a3
{
  self->_port = a3;
}

- (int)socket
{
  return self->_socket;
}

- (void)setSocket:(int)a3
{
  self->_socket = a3;
}

- (OS_dispatch_source)socket_source
{
  return self->_socket_source;
}

- (void)setSocket_source:(id)a3
{
}

- (BOOL)canceled
{
  return self->_canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_socket_source, 0);
  objc_destroyWeak((id *)&self->_device);

  objc_storeStrong((id *)&self->_service, 0);
}

@end