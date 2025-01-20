@interface GTServiceProviderXPCDispatcher
- (GTServiceProviderXPCDispatcher)initWithService:(id)a3 properties:(id)a4;
- (void)allServices:(id)a3 replyConnection:(id)a4;
- (void)broadcastDisconnect:(id)a3 replyConnection:(id)a4;
- (void)deregisterObserver_:(id)a3 replyConnection:(id)a4;
- (void)deregisterService_:(id)a3 replyConnection:(id)a4;
- (void)registerObserver_:(id)a3 replyConnection:(id)a4;
- (void)registerService_forProcess_:(id)a3 replyConnection:(id)a4;
- (void)setConnections:(id)a3;
- (void)waitForService_completionHandler_:(id)a3 replyConnection:(id)a4;
- (void)waitForService_error_:(id)a3 replyConnection:(id)a4;
@end

@implementation GTServiceProviderXPCDispatcher

- (GTServiceProviderXPCDispatcher)initWithService:(id)a3 properties:(id)a4
{
  id v7 = a3;
  v8 = [a4 protocolMethods];
  id v9 = [v8 mutableCopy];

  [v9 addObject:@"broadcastDisconnect"];
  v13.receiver = self;
  v13.super_class = (Class)GTServiceProviderXPCDispatcher;
  v10 = [(GTXPCDispatcher *)&v13 initWithProtocolMethods:v9];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_serviceProvider, a3);
  }

  return v11;
}

- (void)setConnections:(id)a3
{
}

- (void)allServices:(id)a3 replyConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(GTServiceProvider *)self->_serviceProvider allServices];
  id v9 = gt_xpc_dictionary_create_reply(v6);
  if (([v7 isTrusted] & 1) == 0)
  {
    id v10 = [objc_alloc((Class)NSArray) initWithArray:v8 copyItems:1];

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = v10;
    id v11 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v17;
      do
      {
        v14 = 0;
        do
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v8);
          }
          v15 = [*(id *)(*((void *)&v16 + 1) + 8 * (void)v14) serviceProperties:v16];
          [v15 setDeviceUDID:0];

          v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        id v12 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v12);
    }
  }
  xpc_dictionary_set_nsobject(v9, "returnValue", (uint64_t)v8);
  [v7 sendMessage:v9];
}

- (void)registerService_forProcess_:(id)a3 replyConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = gt_xpc_dictionary_create_reply(v6);
  uint64_t v9 = objc_opt_class();
  nsobject = xpc_dictionary_get_nsobject(v6, "serviceProperties", v9);
  if (nsobject)
  {
    uint64_t v11 = objc_opt_class();
    id v12 = xpc_dictionary_get_nsobject(v6, "processInfo", v11);
    if (!v12)
    {
      NSErrorUserInfoKey v21 = NSLocalizedDescriptionKey;
      long long v18 = +[NSString stringWithFormat:@"Invalid argument sent to service \"%@\": %@", @"GTServiceProvider", @"Invalid processInfo argument passed to registerService"];
      v22 = v18;
      long long v19 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      v20 = +[NSError errorWithDomain:@"com.apple.gputools.transport" code:4 userInfo:v19];

      xpc_dictionary_set_nserror(v8, "error", v20);
      [v7 sendMessage:v8];

      goto LABEL_7;
    }
    [(GTServiceProvider *)self->_serviceProvider registerService:nsobject forProcess:v12];
    registeredConnections = self->_registeredConnections;
    v14 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [nsobject servicePort]);
    [(NSMutableDictionary *)registeredConnections setObject:v7 forKeyedSubscript:v14];

    id v15 = [nsobject deviceUDID];
    xpc_dictionary_set_string(v8, "deviceUDID", (const char *)[v15 UTF8String]);

    xpc_dictionary_set_uint64(v8, "servicePort", (uint64_t)[nsobject servicePort]);
  }
  else
  {
    NSErrorUserInfoKey v23 = NSLocalizedDescriptionKey;
    long long v16 = +[NSString stringWithFormat:@"Invalid argument sent to service \"%@\": %@", @"GTServiceProvider", @"Invalid serviceProperties argument passed to registerService"];
    v24 = v16;
    long long v17 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    id v12 = +[NSError errorWithDomain:@"com.apple.gputools.transport" code:4 userInfo:v17];

    xpc_dictionary_set_nserror(v8, "error", v12);
  }
  [v7 sendMessage:v8];
LABEL_7:
}

- (void)waitForService_completionHandler_:(id)a3 replyConnection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = gt_xpc_dictionary_create_reply(v7);
  string = (void *)xpc_dictionary_get_string(v7, "protocolName");

  if (string)
  {
    string = +[NSString stringWithUTF8String:string];
  }
  serviceProvider = self->_serviceProvider;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100016660;
  v13[3] = &unk_100034AE8;
  id v14 = v8;
  id v15 = v6;
  id v11 = v6;
  id v12 = v8;
  [(GTServiceProvider *)serviceProvider waitForService:string completionHandler:v13];
}

- (void)waitForService_error_:(id)a3 replyConnection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = gt_xpc_dictionary_create_reply(v7);
  string = (void *)xpc_dictionary_get_string(v7, "protocolName");

  if (string)
  {
    string = +[NSString stringWithUTF8String:string];
  }
  serviceProvider = self->_serviceProvider;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000167C4;
  v13[3] = &unk_100034AE8;
  id v14 = v8;
  id v15 = v6;
  id v11 = v6;
  id v12 = v8;
  [(GTServiceProvider *)serviceProvider waitForService:string completionHandler:v13];
}

- (void)deregisterService_:(id)a3 replyConnection:(id)a4
{
  uint64_t uint64 = xpc_dictionary_get_uint64(a3, "servicePort");
  [(GTServiceProvider *)self->_serviceProvider deregisterService:uint64];
  registeredConnections = self->_registeredConnections;
  id v7 = +[NSNumber numberWithUnsignedLongLong:uint64];
  [(NSMutableDictionary *)registeredConnections removeObjectForKey:v7];
}

- (void)registerObserver_:(id)a3 replyConnection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = [(GTServiceObserver *)[GTServiceProviderObserver alloc] initWithMessage:v7 notifyConnection:v6];
  uint64_t v8 = [(GTServiceProvider *)self->_serviceProvider registerObserver:v10];
  uint64_t v9 = gt_xpc_dictionary_create_reply(v7);

  xpc_dictionary_set_uint64(v9, "observerId", v8);
  [v6 sendMessage:v9];
}

- (void)deregisterObserver_:(id)a3 replyConnection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(GTServiceProvider *)self->_serviceProvider deregisterObserver:xpc_dictionary_get_uint64(v7, "observerId")];
  gt_xpc_dictionary_create_reply(v7);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  [v6 sendMessage:v8];
}

- (void)broadcastDisconnect:(id)a3 replyConnection:(id)a4
{
  id v6 = a4;
  xpc_dictionary_get_array(a3, "_pathHistory");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(GTServiceProvider *)self->_serviceProvider deregisterObserversForConnection:v6 path:v7];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredConnections, 0);

  objc_storeStrong((id *)&self->_serviceProvider, 0);
}

@end