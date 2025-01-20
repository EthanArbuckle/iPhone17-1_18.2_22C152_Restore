@interface RMStatusPublisherServicePlugin
+ (BOOL)_validPluginWithURL:(id)a3;
+ (id)loadPlugins;
- (NSDictionary)statusKeysByXPCEvent;
- (NSSet)statusKeys;
- (NSString)identifier;
- (NSURL)url;
- (RMStatusPublisherServicePlugin)initWithURL:(id)a3;
- (RMStatusPublisherServicePlugin)initWithURL:(id)a3 identifier:(id)a4 statusKeysByXPCEvent:(id)a5 statusKeys:(id)a6;
- (id)_serviceConnection;
- (id)reportDetails;
- (void)publishStatusKeys:(id)a3 storeIdentifier:(id)a4;
- (void)setStatusKeys:(id)a3;
- (void)setStatusKeysByXPCEvent:(id)a3;
@end

@implementation RMStatusPublisherServicePlugin

+ (id)loadPlugins
{
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100065244;
  v17[3] = &unk_1000C5868;
  v17[4] = a1;
  v2 = +[RMPluginDiscovery discoverPluginsWithType:@"status" checkValidURL:v17];
  v3 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v2 count]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = v2;
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        v10 = [RMStatusPublisherServicePlugin alloc];
        v11 = -[RMStatusPublisherServicePlugin initWithURL:](v10, "initWithURL:", v9, (void)v13);
        [v3 addObject:v11];
      }
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v6);
  }

  return v3;
}

+ (BOOL)_validPluginWithURL:(id)a3
{
  long long v15 = +[NSBundle bundleWithURL:a3];
  v3 = [v15 infoDictionary];
  id v4 = +[RMStatusPublisherDescription descriptionWithServiceDictionary:v3];

  id v5 = +[RMModelSharedDefinitions currentPlatform];
  id v6 = +[RMBundle managementScope];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v7 = [v4 statusKeys];
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v17 != v10) {
        objc_enumerationMutation(v7);
      }
      uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * v11);
      BOOL v13 = +[RMFeatureFlags isAllowedStatusItem:v12];
      if (!v13
        || (+[RMModelStatusBase isSupportedStatusItem:v12 platform:v5 scope:v6] & 1) != 0)
      {
        break;
      }
      if (v9 == (id)++v11)
      {
        id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
        LOBYTE(v13) = 0;
        if (v9) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    LOBYTE(v13) = 0;
  }

  return v13;
}

- (RMStatusPublisherServicePlugin)initWithURL:(id)a3
{
  id v5 = a3;
  v29.receiver = self;
  v29.super_class = (Class)RMStatusPublisherServicePlugin;
  id v6 = [(RMStatusPublisherServicePlugin *)&v29 init];
  if (v6)
  {
    uint64_t v7 = +[NSBundle bundleWithURL:v5];
    uint64_t v8 = [v7 bundleIdentifier];
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v8;

    uint64_t v10 = [v7 infoDictionary];
    uint64_t v11 = +[RMStatusPublisherDescription descriptionWithServiceDictionary:v10];

    uint64_t v12 = [v11 statusKeys];

    if (v12)
    {
      BOOL v13 = [v11 statusKeysByXPCEvent];
      long long v14 = (NSDictionary *)[v13 copy];
      statusKeysByXPCEvent = v6->_statusKeysByXPCEvent;
      v6->_statusKeysByXPCEvent = v14;

      long long v16 = [v11 statusKeys];
      long long v17 = (NSSet *)[v16 copy];
      statusKeys = v6->_statusKeys;
      v6->_statusKeys = v17;
    }
    else
    {
      long long v19 = +[RMLog statusPublisherServicePlugin];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_100029618(v5, v19);
      }

      uint64_t v20 = objc_opt_new();
      v21 = v6->_statusKeysByXPCEvent;
      v6->_statusKeysByXPCEvent = (NSDictionary *)v20;

      uint64_t v22 = objc_opt_new();
      long long v16 = v6->_statusKeys;
      v6->_statusKeys = (NSSet *)v22;
    }

    objc_storeStrong((id *)&v6->_url, a3);
    v23 = +[RMLog statusPublisherServicePlugin];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      v25 = [v5 lastPathComponent];
      v26 = v6->_identifier;
      v27 = [(NSSet *)v6->_statusKeys allObjects];
      v28 = [v27 componentsJoinedByString:@", "];
      *(_DWORD *)buf = 138543874;
      v31 = v25;
      __int16 v32 = 2114;
      v33 = v26;
      __int16 v34 = 2114;
      v35 = v28;
      _os_log_debug_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "Created XPC service plugin: %{public}@ %{public}@ %{public}@", buf, 0x20u);
    }
  }

  return v6;
}

- (RMStatusPublisherServicePlugin)initWithURL:(id)a3 identifier:(id)a4 statusKeysByXPCEvent:(id)a5 statusKeys:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v25.receiver = self;
  v25.super_class = (Class)RMStatusPublisherServicePlugin;
  long long v15 = [(RMStatusPublisherServicePlugin *)&v25 init];
  long long v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_url, a3);
    objc_storeStrong((id *)&v16->_identifier, a4);
    objc_storeStrong((id *)&v16->_statusKeysByXPCEvent, a5);
    long long v17 = (NSSet *)[v14 copy];
    statusKeys = v16->_statusKeys;
    v16->_statusKeys = v17;

    long long v19 = +[RMLog statusPublisherServicePlugin];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v21 = [v11 lastPathComponent];
      identifier = v16->_identifier;
      v23 = [(NSSet *)v16->_statusKeys allObjects];
      v24 = [v23 componentsJoinedByString:@", "];
      *(_DWORD *)buf = 138543874;
      v27 = v21;
      __int16 v28 = 2114;
      objc_super v29 = identifier;
      __int16 v30 = 2114;
      v31 = v24;
      _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Created XPC service plugin: %{public}@ %{public}@ %{public}@", buf, 0x20u);
    }
  }

  return v16;
}

- (void)publishStatusKeys:(id)a3 storeIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(RMStatusPublisherServicePlugin *)self _serviceConnection];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000659B0;
  v12[3] = &unk_1000C5890;
  v12[4] = self;
  id v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v12];
  uint64_t v10 = [v7 allObjects];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100065A1C;
  v11[3] = &unk_1000C5890;
  v11[4] = self;
  objc_msgSend(v9, "publishStatusKeys:storeIdentifier:scope:completionHandler:", v10, v6, +[RMStoreHelper storeScope](RMStoreHelper, "storeScope"), v11);

  [v8 invalidate];
}

- (id)reportDetails
{
  v11[0] = @"Location";
  v3 = [(RMStatusPublisherServicePlugin *)self url];
  id v4 = [v3 path];
  v12[0] = v4;
  v11[1] = @"Identifier";
  id v5 = [(RMStatusPublisherServicePlugin *)self identifier];
  v12[1] = v5;
  v11[2] = @"StatusItems";
  id v6 = [(RMStatusPublisherServicePlugin *)self statusKeys];
  id v7 = [v6 allObjects];
  uint64_t v8 = [v7 sortedArrayUsingSelector:"caseInsensitiveCompare:"];
  v12[2] = v8;
  id v9 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:3];

  return v9;
}

- (id)_serviceConnection
{
  id v3 = objc_alloc((Class)NSXPCConnection);
  id v4 = [(RMStatusPublisherServicePlugin *)self identifier];
  id v5 = [v3 initWithServiceName:v4];

  id v6 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___RMConfigurationSubscriberXPCService];
  [v5 setRemoteObjectInterface:v6];
  [v5 resume];

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSURL)url
{
  return self->_url;
}

- (NSDictionary)statusKeysByXPCEvent
{
  return self->_statusKeysByXPCEvent;
}

- (void)setStatusKeysByXPCEvent:(id)a3
{
}

- (NSSet)statusKeys
{
  return self->_statusKeys;
}

- (void)setStatusKeys:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusKeys, 0);
  objc_storeStrong((id *)&self->_statusKeysByXPCEvent, 0);
  objc_storeStrong((id *)&self->_url, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end