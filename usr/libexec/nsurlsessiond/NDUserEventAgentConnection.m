@interface NDUserEventAgentConnection
+ (id)sharedUserEventAgentConnection;
- (BOOL)canLaunchProcessWithIdentifier:(id)a3;
- (NDUserEventAgentConnection)init;
- (void)handleNewConnection:(id)a3;
- (void)launchProcessWithIdentifier:(id)a3 sessionIdentifier:(id)a4;
- (void)performWake:(id)a3 uponNotification:(id)a4 sessionIdentifier:(id)a5;
- (void)removePendingWakeForClient:(id)a3 sessionIdentifier:(id)a4;
- (void)start;
@end

@implementation NDUserEventAgentConnection

- (void)removePendingWakeForClient:(id)a3 sessionIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005438;
  block[3] = &unk_1000B60C0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

+ (id)sharedUserEventAgentConnection
{
  if (qword_1000CB070 != -1) {
    dispatch_once(&qword_1000CB070, &stru_1000B5770);
  }
  v2 = (void *)qword_1000CB068;

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingWakes, 0);
  objc_storeStrong((id *)&self->_registeredClients, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)performWake:(id)a3 uponNotification:(id)a4 sessionIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10004184C;
  v15[3] = &unk_1000B57C0;
  v15[4] = self;
  id v16 = v9;
  id v17 = v10;
  id v18 = v8;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  dispatch_async(queue, v15);
}

- (void)launchProcessWithIdentifier:(id)a3 sessionIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100041A64;
  block[3] = &unk_1000B60C0;
  id v12 = v6;
  id v13 = v7;
  id v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (BOOL)canLaunchProcessWithIdentifier:(id)a3
{
  v3 = [(NSDictionary *)self->_registeredClients objectForKey:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)handleNewConnection:(id)a3
{
  v5 = (_xpc_connection_s *)a3;
  p_connection = &self->_connection;
  connection = self->_connection;
  if (connection)
  {
    id v8 = qword_1000CB148;
    if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Received a new connection from UserEventAgent! Canceling the old one", buf, 2u);
      connection = *p_connection;
    }
    xpc_connection_cancel(connection);
    id v9 = *p_connection;
    *p_connection = 0;
  }
  objc_storeStrong((id *)&self->_connection, a3);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100041D90;
  handler[3] = &unk_1000B5798;
  handler[4] = self;
  xpc_connection_set_event_handler(v5, handler);
  xpc_connection_set_target_queue(v5, (dispatch_queue_t)self->_queue);
  xpc_connection_resume(*p_connection);
}

- (void)start
{
  mach_service = xpc_connection_create_mach_service("com.apple.nsurlsessiond-launchondemand", (dispatch_queue_t)self->_queue, 1uLL);
  listener = self->_listener;
  self->_listener = mach_service;

  v5 = qword_1000CB148;
  if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = self->_listener;
    *(_DWORD *)buf = 138412290;
    id v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Created xpc listener: %@", buf, 0xCu);
  }
  id v7 = self->_listener;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000421F8;
  handler[3] = &unk_1000B5798;
  handler[4] = self;
  xpc_connection_set_event_handler(v7, handler);
  xpc_connection_resume(self->_listener);
}

- (NDUserEventAgentConnection)init
{
  v10.receiver = self;
  v10.super_class = (Class)NDUserEventAgentConnection;
  v2 = [(NDUserEventAgentConnection *)&v10 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    BOOL v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.nsurlsessiond.UserEventAgentConnectionQueue", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    uint64_t v7 = objc_opt_new();
    pendingWakes = v2->_pendingWakes;
    v2->_pendingWakes = (NSMutableDictionary *)v7;
  }
  return v2;
}

@end