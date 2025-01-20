@interface SDXPCSession
+ (id)sharedSession;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSMutableArray)connections;
- (NSXPCListener)xpcManagerListener;
- (SDXPCSession)init;
- (void)connectionManagerDidInvalidate:(id)a3;
- (void)setConnections:(id)a3;
- (void)setXpcManagerListener:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation SDXPCSession

+ (id)sharedSession
{
  if (qword_10097FF98 != -1) {
    dispatch_once(&qword_10097FF98, &stru_1008CD3B8);
  }
  v2 = (void *)qword_10097FF90;

  return v2;
}

- (SDXPCSession)init
{
  v8.receiver = self;
  v8.super_class = (Class)SDXPCSession;
  v2 = [(SDXPCSession *)&v8 init];
  v3 = v2;
  if (v2)
  {
    xpcManagerListener = v2->_xpcManagerListener;
    v2->_xpcManagerListener = 0;

    uint64_t v5 = objc_opt_new();
    connections = v3->_connections;
    v3->_connections = (NSMutableArray *)v5;
  }
  return v3;
}

- (void)start
{
  v3 = daemon_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1000FA7F8(v3);
  }

  if (!self->_xpcManagerListener)
  {
    v4 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.sharingd.nsxpc"];
    xpcManagerListener = self->_xpcManagerListener;
    self->_xpcManagerListener = v4;

    [(NSXPCListener *)self->_xpcManagerListener _setQueue:&_dispatch_main_q];
    [(NSXPCListener *)self->_xpcManagerListener setDelegate:self];
    [(NSXPCListener *)self->_xpcManagerListener resume];
  }
}

- (void)stop
{
  xpcManagerListener = self->_xpcManagerListener;
  if (xpcManagerListener)
  {
    [(NSXPCListener *)xpcManagerListener invalidate];
    [(NSXPCListener *)self->_xpcManagerListener setDelegate:0];
    v4 = self->_xpcManagerListener;
    self->_xpcManagerListener = 0;
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = [[SDConnectionManager alloc] initWithXPCConnection:v5];

  [(NSMutableArray *)self->_connections addObject:v6];
  [(SDConnectionManager *)v6 setDelegate:self];
  [(SDConnectionManager *)v6 start];

  return 1;
}

- (void)connectionManagerDidInvalidate:(id)a3
{
}

- (NSXPCListener)xpcManagerListener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 8, 1);
}

- (void)setXpcManagerListener:(id)a3
{
}

- (NSMutableArray)connections
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setConnections:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connections, 0);

  objc_storeStrong((id *)&self->_xpcManagerListener, 0);
}

@end