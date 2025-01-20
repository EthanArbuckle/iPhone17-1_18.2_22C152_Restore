@interface SDServiceManager
- (NSMutableArray)companionStreams;
- (NSMutableArray)enabledServices;
- (NSMutableDictionary)streamHandlers;
- (NSString)bundleID;
- (NSString)managerID;
- (SDServiceManager)initWithClientProxy:(id)a3 withIdentifier:(id)a4;
- (SFCompanionServiceManagerClient)clientProxy;
- (id)streamHandlerForService:(id)a3;
- (void)companionStreamClosedStreams:(id)a3;
- (void)disableService:(id)a3;
- (void)enableService:(id)a3;
- (void)manager:(id)a3 connectedToService:(id)a4 withFileHandle:(id)a5 acceptHandler:(id)a6;
- (void)setBundleID:(id)a3;
- (void)setClientProxy:(id)a3;
- (void)setCompanionStreams:(id)a3;
- (void)setEnabledServices:(id)a3;
- (void)setStreamHandlers:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation SDServiceManager

- (SDServiceManager)initWithClientProxy:(id)a3 withIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)SDServiceManager;
  v9 = [(SDServiceManager *)&v19 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_clientProxy, a3);
    objc_storeStrong((id *)&v10->_managerID, a4);
    bundleID = v10->_bundleID;
    v10->_bundleID = (NSString *)&stru_1008E7020;

    uint64_t v12 = objc_opt_new();
    enabledServices = v10->_enabledServices;
    v10->_enabledServices = (NSMutableArray *)v12;

    uint64_t v14 = objc_opt_new();
    companionStreams = v10->_companionStreams;
    v10->_companionStreams = (NSMutableArray *)v14;

    uint64_t v16 = objc_opt_new();
    streamHandlers = v10->_streamHandlers;
    v10->_streamHandlers = (NSMutableDictionary *)v16;
  }
  return v10;
}

- (void)start
{
  id v3 = +[SDStreamManager sharedManager];
  [v3 registerManager:self];
}

- (void)stop
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = self->_enabledServices;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v13 + 1) + 8 * (void)v7);
        v9 = +[SDStreamManager sharedManager];
        [v9 removeService:v8];

        v10 = +[SDStreamManager sharedManager];
        v11 = [v8 identifier];
        [v10 closeStreamsForIdentifier:v11];

        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  [(NSMutableArray *)self->_enabledServices removeAllObjects];
  uint64_t v12 = +[SDStreamManager sharedManager];
  [v12 unregisterManager:self];
}

- (id)streamHandlerForService:(id)a3
{
  streamHandlers = self->_streamHandlers;
  id v4 = [a3 identifier];
  id v5 = [(NSMutableDictionary *)streamHandlers objectForKeyedSubscript:v4];

  return v5;
}

- (void)enableService:(id)a3
{
  enabledServices = self->_enabledServices;
  id v4 = a3;
  [(NSMutableArray *)enabledServices addObject:v4];
  id v5 = +[SDStreamManager sharedManager];
  [v5 addService:v4];
}

- (void)disableService:(id)a3
{
  id v5 = a3;
  id v4 = +[SDStreamManager sharedManager];
  [v4 removeService:v5];

  [(NSMutableArray *)self->_enabledServices removeObject:v5];
}

- (void)manager:(id)a3 connectedToService:(id)a4 withFileHandle:(id)a5 acceptHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  long long v14 = v13;
  if (v11)
  {
    if (v12)
    {
      clientProxy = self->_clientProxy;
      if (clientProxy)
      {
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_1001B5818;
        v16[3] = &unk_1008CA150;
        id v17 = v13;
        [(SFCompanionServiceManagerClient *)clientProxy streamToService:v11 withFileHandle:v12 acceptReply:v16];
        [v12 closeFile];
      }
    }
  }
}

- (void)companionStreamClosedStreams:(id)a3
{
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setBundleID:(id)a3
{
}

- (NSString)managerID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (SFCompanionServiceManagerClient)clientProxy
{
  return (SFCompanionServiceManagerClient *)objc_getProperty(self, a2, 24, 1);
}

- (void)setClientProxy:(id)a3
{
}

- (NSMutableDictionary)streamHandlers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setStreamHandlers:(id)a3
{
}

- (NSMutableArray)enabledServices
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setEnabledServices:(id)a3
{
}

- (NSMutableArray)companionStreams
{
  return (NSMutableArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCompanionStreams:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_companionStreams, 0);
  objc_storeStrong((id *)&self->_enabledServices, 0);
  objc_storeStrong((id *)&self->_streamHandlers, 0);
  objc_storeStrong((id *)&self->_clientProxy, 0);
  objc_storeStrong((id *)&self->_managerID, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end