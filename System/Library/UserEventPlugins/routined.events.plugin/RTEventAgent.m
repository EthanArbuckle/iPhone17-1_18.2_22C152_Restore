@interface RTEventAgent
- (NSMutableDictionary)clients;
- (NSXPCConnection)connection;
- (RTEventAgent)init;
- (void)createConnection;
- (void)dealloc;
- (void)launchDaemonWithRestorationIdentifier:(id)a3 reply:(id)a4;
- (void)logClients;
- (void)onEventCallback:(int64_t)a3 token:(unint64_t)a4 event:(id)a5;
- (void)provider;
- (void)setClients:(id)a3;
- (void)setConnection:(id)a3;
- (void)setProvider:(void *)a3;
@end

@implementation RTEventAgent

- (RTEventAgent)init
{
  v3.receiver = self;
  v3.super_class = (Class)RTEventAgent;
  if ([(RTEventAgent *)&v3 init])
  {
    [@"com.apple.routined-events" UTF8String];
    xpc_event_provider_create();
  }
  return 0;
}

- (void)createConnection
{
  objc_super v3 = [(RTEventAgent *)self connection];
  [v3 invalidate];

  id v4 = objc_alloc((Class)NSXPCConnection);
  id v5 = [v4 initWithMachServiceName:RTMachServiceEvent options:4096];
  [(RTEventAgent *)self setConnection:v5];

  v6 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___RTEventAgentPluginProtocol];
  v7 = [(RTEventAgent *)self connection];
  [v7 setExportedInterface:v6];

  v8 = [(RTEventAgent *)self connection];
  [v8 setExportedObject:self];

  v9 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___RTEventAgentDaemonProtocol];
  v10 = [(RTEventAgent *)self connection];
  [v10 setRemoteObjectInterface:v9];

  [(RTEventAgent *)self connection];
  objc_claimAutoreleasedReturnValue();
  [(RTEventAgent *)self provider];
  xpc_event_provider_get_queue();
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  CFRelease(self->_provider);
  provider = self->_provider;
  if (provider)
  {
    free(provider);
    self->_provider = 0;
  }
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)RTEventAgent;
  [(RTEventAgent *)&v5 dealloc];
}

- (void)onEventCallback:(int64_t)a3 token:(unint64_t)a4 event:(id)a5
{
  id v8 = a5;
  v9 = v8;
  if (a3 == 1)
  {
    if (v8
      && xpc_get_type(v8) == (xpc_type_t)&_xpc_type_dictionary
      && (xpc_dictionary_get_value(v9, "RestorationIdentifier"),
          v11 = objc_claimAutoreleasedReturnValue(),
          v11,
          v11))
    {
      v12 = xpc_dictionary_get_value(v9, "RestorationIdentifier");
      v10 = +[NSString stringWithUTF8String:xpc_string_get_string_ptr(v12)];

      v13 = sub_30DC(&qword_4A78);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        int v17 = 138412290;
        v18 = v10;
        _os_log_debug_impl(&dword_0, v13, OS_LOG_TYPE_DEBUG, "client with restoration identifier, %@, registering for launch on demand", (uint8_t *)&v17, 0xCu);
      }

      v14 = [(RTEventAgent *)self clients];
      v15 = +[NSNumber numberWithUnsignedLongLong:a4];
      [v14 setObject:v15 forKey:v10];

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      {
        v16 = [(RTEventAgent *)self clients];
        [v16 enumerateKeysAndObjectsUsingBlock:&stru_4178];
      }
    }
    else
    {
      v10 = sub_30DC(&qword_4A78);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v17) = 0;
        _os_log_debug_impl(&dword_0, v10, OS_LOG_TYPE_DEBUG, "received an unknown event from daemon", (uint8_t *)&v17, 2u);
      }
    }
  }
}

- (void)launchDaemonWithRestorationIdentifier:(id)a3 reply:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void))a4;
  if (v6)
  {
    id v8 = [(RTEventAgent *)self clients];
    v9 = [v8 objectForKey:v6];

    if (v9)
    {
      [(RTEventAgent *)self provider];
      [v9 unsignedLongLongValue];
      xpc_event_provider_token_fire();
    }
    v11 = sub_30DC(&qword_4A78);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int v12 = 138412290;
      id v13 = v6;
      _os_log_debug_impl(&dword_0, v11, OS_LOG_TYPE_DEBUG, "no token for restoration identifier, %@", (uint8_t *)&v12, 0xCu);
    }

    if (v7) {
      v7[2](v7, 0);
    }
  }
  else
  {
    v10 = sub_30DC(&qword_4A78);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v12 = 138412290;
      id v13 = 0;
      _os_log_debug_impl(&dword_0, v10, OS_LOG_TYPE_DEBUG, "invalid restoration identifier, %@", (uint8_t *)&v12, 0xCu);
    }

    if (v7) {
      v7[2](v7, 0);
    }
  }
}

- (void)logClients
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    id v3 = [(RTEventAgent *)self clients];
    [v3 enumerateKeysAndObjectsUsingBlock:&stru_4198];
  }
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void)provider
{
  return self->_provider;
}

- (void)setProvider:(void *)a3
{
  self->_provider = a3;
}

- (NSMutableDictionary)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clients, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end