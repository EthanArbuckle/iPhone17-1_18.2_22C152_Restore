@interface BTXPCConnection
- (BTXPCConnection)initWithConnection:(id)a3;
- (OS_xpc_object)connection;
- (id)description;
- (int)remotePID;
- (unsigned)remoteUID;
- (void)dealloc;
- (void)handleDisconnection;
- (void)handleEvent:(id)a3;
- (void)handleMsg:(id)a3;
- (void)sendMsg:(id)a3 args:(id)a4;
- (void)setConnection:(id)a3;
- (void)setRemotePID:(int)a3;
- (void)setRemoteUID:(unsigned int)a3;
@end

@implementation BTXPCConnection

- (BTXPCConnection)initWithConnection:(id)a3
{
  id v5 = a3;
  if (os_log_type_enabled((os_log_t)qword_10026AAD8, OS_LOG_TYPE_DEBUG)) {
    sub_1001B9380();
  }
  v17.receiver = self;
  v17.super_class = (Class)BTXPCConnection;
  v6 = [(BTXPCConnection *)&v17 init];
  v7 = v6;
  if (v6)
  {
    p_connection = &v6->_connection;
    objc_storeStrong((id *)&v6->_connection, a3);
    [(BTXPCConnection *)v7 setRemoteUID:xpc_connection_get_euid(v7->_connection)];
    [(BTXPCConnection *)v7 setRemotePID:xpc_connection_get_pid(v7->_connection)];
    objc_initWeak(&location, v7);
    connection = v7->_connection;
    v10 = +[CloudXPCService sharedInstance];
    v11 = [v10 xpcQueue];
    xpc_connection_set_target_queue(connection, v11);

    v12 = *p_connection;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100098BA4;
    v14[3] = &unk_100235418;
    objc_copyWeak(&v15, &location);
    xpc_connection_set_event_handler(v12, v14);
    xpc_connection_resume(*p_connection);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v7;
}

- (id)description
{
  memset(buffer, 0, sizeof(buffer));
  v3 = [(BTXPCConnection *)self connection];

  if (v3)
  {
    v4 = [(BTXPCConnection *)self connection];
    pid_t pid = xpc_connection_get_pid(v4);
    proc_name(pid, buffer, 0x40u);
  }
  v6 = +[NSString stringWithFormat:@"BTXPCConnection(%d-%d): Process Name: %s", [(BTXPCConnection *)self remotePID], [(BTXPCConnection *)self remoteUID], buffer];

  return v6;
}

- (void)dealloc
{
  v3 = sub_10006CA04("XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(BTXPCConnection *)self description];
    *(_DWORD *)buf = 138412290;
    v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "XPC client connection dealloc: %@", buf, 0xCu);
  }
  v5.receiver = self;
  v5.super_class = (Class)BTXPCConnection;
  [(BTXPCConnection *)&v5 dealloc];
}

- (void)handleEvent:(id)a3
{
  id v4 = a3;
  xpc_type_t type = xpc_get_type(v4);
  if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    [(BTXPCConnection *)self handleMsg:v4];
  }
  else
  {
    if (type == (xpc_type_t)&_xpc_type_error)
    {
      if (v4 == &_xpc_error_connection_invalid)
      {
        [(BTXPCConnection *)self handleDisconnection];
        goto LABEL_10;
      }
      v6 = sub_10006CA04("XPC");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_1001B93F4();
      }
    }
    else
    {
      v6 = sub_10006CA04("XPC");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_1001B9468();
      }
    }
  }
LABEL_10:
}

- (void)handleDisconnection
{
  v3 = sub_10006CA04("XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(BTXPCConnection *)self description];
    int v6 = 138412290;
    v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "XPC client disconnection: %@", (uint8_t *)&v6, 0xCu);
  }
  objc_super v5 = +[CloudXPCService sharedInstance];
  [v5 removeConnection:self];
}

- (void)handleMsg:(id)a3
{
  id v4 = a3;
  objc_super v5 = sub_10006CA04("XPC");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v6 = [(BTXPCConnection *)self remoteUID];
    unsigned int v7 = [(BTXPCConnection *)self remotePID];
    v8 = [v4 description];
    v11[0] = 67109634;
    v11[1] = v6;
    __int16 v12 = 1024;
    unsigned int v13 = v7;
    __int16 v14 = 2112;
    id v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received XPC(%d-%d) message: %@", (uint8_t *)v11, 0x18u);
  }
  v9 = +[CloudXPCService sharedInstance];
  v10 = [(BTXPCConnection *)self connection];
  [v9 handleConnection:v10 XPCMessage:v4 userID:-[BTXPCConnection remoteUID](self, "remoteUID") processID:-[BTXPCConnection remotePID](self, "remotePID")];
}

- (void)sendMsg:(id)a3 args:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v9 = sub_10006CA04("XPC");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412547;
    id v16 = v6;
    __int16 v17 = 2113;
    id v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Send message: %@, args: %{private}@", (uint8_t *)&v15, 0x16u);
  }

  xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
  id v11 = v6;
  xpc_dictionary_set_string(v10, "kMsgId", (const char *)[v11 UTF8String]);
  if (v7)
  {
    __int16 v12 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    xpc_dictionary_set_value(v10, "kMsgArgs", v12);
  }
  unsigned int v13 = sub_10006CA04("XPC");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_1001B94DC();
  }

  __int16 v14 = [(BTXPCConnection *)self connection];
  xpc_connection_send_message(v14, v10);
}

- (OS_xpc_object)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (unsigned)remoteUID
{
  return self->_remoteUID;
}

- (void)setRemoteUID:(unsigned int)a3
{
  self->_remoteUID = a3;
}

- (int)remotePID
{
  return self->_remotePID;
}

- (void)setRemotePID:(int)a3
{
  self->_remotePID = a3;
}

- (void).cxx_destruct
{
}

@end