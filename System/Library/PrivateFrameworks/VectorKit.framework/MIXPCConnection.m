@interface MIXPCConnection
- (MIXPCConnection)initWithXPCConnection:(id)a3;
- (void)handleEvent:(id)a3;
- (void)sendData:(id)a3;
@end

@implementation MIXPCConnection

- (MIXPCConnection)initWithXPCConnection:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MIXPCConnection;
  v6 = [(MIConnection *)&v12 initWithType:2];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    connection = v7->_connection;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100002D88;
    handler[3] = &unk_1000042A8;
    v11 = v7;
    xpc_connection_set_event_handler(connection, handler);
  }
  return v7;
}

- (void)handleEvent:(id)a3
{
  id v8 = a3;
  xpc_type_t type = xpc_get_type(v8);
  if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    id v6 = (id)_CFXPCCreateCFObjectFromXPCMessage();
    v7 = [(MIConnection *)self delegate];
    [v7 connection:self didRecieveData:v6];

    CFRelease(v6);
  }
  else
  {
    if (type != (xpc_type_t)&_xpc_type_error) {
      goto LABEL_6;
    }
    xpc_connection_cancel(self->_connection);
    connection = self->_connection;
    self->_connection = 0;

    id v6 = [(MIConnection *)self delegate];
    [v6 connection:self didCloseConnection:0];
  }

LABEL_6:
}

- (void)sendData:(id)a3
{
  if (self->_connection)
  {
    id v4 = a3;
    id v5 = (const UInt8 *)[v4 bytes];
    id v6 = [v4 length];

    CFDataRef v7 = CFDataCreate(0, v5, (CFIndex)v6);
    id v8 = (void *)_CFXPCCreateXPCMessageWithCFObject();
    xpc_connection_send_message(self->_connection, v8);

    CFRelease(v7);
  }
}

- (void).cxx_destruct
{
}

@end