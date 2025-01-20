@interface MIDaemon
- (MIDaemon)init;
- (NSMutableArray)connections;
- (void)connection:(id)a3 didCloseConnection:(int64_t)a4;
- (void)connection:(id)a3 didRecieveData:(id)a4;
- (void)connectionMade:(id)a3;
- (void)handleConnection:(id)a3;
- (void)setConnections:(id)a3;
@end

@implementation MIDaemon

- (MIDaemon)init
{
  v12.receiver = self;
  v12.super_class = (Class)MIDaemon;
  v2 = [(MIDaemon *)&v12 init];
  if (v2)
  {
    xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.mapinspectord", (dispatch_queue_t)&_dispatch_main_q, 1uLL);
    xpcApplicationListenConnection = v2->_xpcApplicationListenConnection;
    v2->_xpcApplicationListenConnection = mach_service;

    v5 = v2->_xpcApplicationListenConnection;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100002674;
    handler[3] = &unk_1000042A8;
    v6 = v2;
    v11 = v6;
    xpc_connection_set_event_handler(v5, handler);
    xpc_connection_resume(v2->_xpcApplicationListenConnection);
    v7 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    connections = v6->_connections;
    v6->_connections = v7;
  }
  return v2;
}

- (void)handleConnection:(id)a3
{
  id v4 = a3;
  if (xpc_get_type(v4) == (xpc_type_t)&_xpc_type_connection) {
    +[MIConnection createConnectionWithXPCObject:v4 withSelector:"connectionMade:" onTarget:self];
  }
}

- (void)connectionMade:(id)a3
{
  id v4 = a3;
  [v4 setDelegate:self];
  [(NSMutableArray *)self->_connections addObject:v4];
}

- (void)connection:(id)a3 didRecieveData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v8 = self->_connections;
  id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      objc_super v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(id *)(*((void *)&v14 + 1) + 8 * (void)v12);
        if (v13 != v6) {
          objc_msgSend(v13, "sendData:", v7, (void)v14);
        }
        objc_super v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (void)connection:(id)a3 didCloseConnection:(int64_t)a4
{
  -[NSMutableArray removeObject:](self->_connections, "removeObject:", a3, a4);
  if (![(NSMutableArray *)self->_connections count])
  {
    Current = CFRunLoopGetCurrent();
    CFRunLoopStop(Current);
  }
}

- (NSMutableArray)connections
{
  return self->_connections;
}

- (void)setConnections:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_xpcApplicationListenConnection, 0);
}

@end