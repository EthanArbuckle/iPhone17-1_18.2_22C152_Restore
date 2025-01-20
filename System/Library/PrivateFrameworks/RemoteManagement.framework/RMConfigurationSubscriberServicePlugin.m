@interface RMConfigurationSubscriberServicePlugin
+ (BOOL)_validPluginWithURL:(id)a3;
+ (id)loadPlugins;
- (NSSet)configurationTypes;
- (NSString)identifier;
- (NSURL)url;
- (RMConfigurationSubscriberServicePlugin)initWithURL:(id)a3;
- (RMConfigurationSubscriberServicePlugin)initWithURL:(id)a3 identifier:(id)a4 configurationTypes:(id)a5;
- (id)_serviceConnection;
- (id)reportDetails;
- (void)applyChangedConfigurationsTypes:(id)a3;
- (void)fetchMissingConfigurationUIs;
@end

@implementation RMConfigurationSubscriberServicePlugin

+ (id)loadPlugins
{
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000289E8;
  v17[3] = &unk_1000C5868;
  v17[4] = a1;
  v2 = +[RMPluginDiscovery discoverPluginsWithType:@"configuration" checkValidURL:v17];
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
        v10 = [RMConfigurationSubscriberServicePlugin alloc];
        v11 = -[RMConfigurationSubscriberServicePlugin initWithURL:](v10, "initWithURL:", v9, (void)v13);
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
  v3 = +[NSBundle bundleWithURL:a3];
  id v4 = [v3 infoDictionary];
  id v5 = +[RMConfigurationSubscriberDescription descriptionWithServiceDictionary:v4];

  id v6 = +[RMModelSharedDefinitions currentPlatform];
  id v7 = +[RMBundle managementScope];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v8 = [v5 types];
  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    long long v16 = v3;
    uint64_t v11 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        if (+[RMFeatureFlags isAllowedDeclarationType:v13]
          && (+[RMModelDeclarationBase isSupportedDeclaration:v13 platform:v6 scope:v7] & 1) != 0)
        {
          BOOL v14 = 1;
          goto LABEL_12;
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v10) {
        continue;
      }
      break;
    }
    BOOL v14 = 0;
LABEL_12:
    v3 = v16;
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (RMConfigurationSubscriberServicePlugin)initWithURL:(id)a3
{
  id v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)RMConfigurationSubscriberServicePlugin;
  id v6 = [(RMConfigurationSubscriberServicePlugin *)&v24 init];
  if (v6)
  {
    id v7 = +[NSBundle bundleWithURL:v5];
    uint64_t v8 = [v7 bundleIdentifier];
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v8;

    id v10 = [v7 infoDictionary];
    uint64_t v11 = +[RMConfigurationSubscriberDescription descriptionWithServiceDictionary:v10];

    v12 = [v11 types];

    if (v12)
    {
      uint64_t v13 = [v11 types];
      uint64_t v14 = +[NSSet setWithArray:v13];
      configurationTypes = v6->_configurationTypes;
      v6->_configurationTypes = (NSSet *)v14;
    }
    else
    {
      long long v16 = +[RMLog configurationSubscriberServicePlugin];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_100029618(v5, v16);
      }

      uint64_t v17 = objc_opt_new();
      uint64_t v13 = v6->_configurationTypes;
      v6->_configurationTypes = (NSSet *)v17;
    }

    objc_storeStrong((id *)&v6->_url, a3);
    long long v18 = +[RMLog configurationSubscriberServicePlugin];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      long long v20 = [v5 lastPathComponent];
      v21 = v6->_identifier;
      v22 = [(NSSet *)v6->_configurationTypes allObjects];
      v23 = [v22 componentsJoinedByString:@", "];
      *(_DWORD *)buf = 138543874;
      v26 = v20;
      __int16 v27 = 2114;
      v28 = v21;
      __int16 v29 = 2114;
      v30 = v23;
      _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Created XPC service plugin: %{public}@ %{public}@ %{public}@", buf, 0x20u);
    }
  }

  return v6;
}

- (RMConfigurationSubscriberServicePlugin)initWithURL:(id)a3 identifier:(id)a4 configurationTypes:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)RMConfigurationSubscriberServicePlugin;
  v12 = [(RMConfigurationSubscriberServicePlugin *)&v20 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_url, a3);
    objc_storeStrong((id *)&v13->_identifier, a4);
    objc_storeStrong((id *)&v13->_configurationTypes, a5);
    uint64_t v14 = +[RMLog configurationSubscriberServicePlugin];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      long long v16 = [v9 lastPathComponent];
      identifier = v13->_identifier;
      long long v18 = [(NSSet *)v13->_configurationTypes allObjects];
      long long v19 = [v18 componentsJoinedByString:@", "];
      *(_DWORD *)buf = 138543874;
      v22 = v16;
      __int16 v23 = 2114;
      objc_super v24 = identifier;
      __int16 v25 = 2114;
      v26 = v19;
      _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Created XPC service plugin: %{public}@ %{public}@ %{public}@", buf, 0x20u);
    }
  }

  return v13;
}

- (void)applyChangedConfigurationsTypes:(id)a3
{
  id v4 = [(RMConfigurationSubscriberServicePlugin *)self _serviceConnection];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000290B8;
  v7[3] = &unk_1000C5890;
  v7[4] = self;
  id v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v7];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100029124;
  v6[3] = &unk_1000C5890;
  v6[4] = self;
  objc_msgSend(v5, "fetchThenApplyConfigurationsWithScope:completionHandler:", +[RMStoreHelper storeScope](RMStoreHelper, "storeScope"), v6);
  [v4 invalidate];
}

- (void)fetchMissingConfigurationUIs
{
  v3 = [(RMConfigurationSubscriberServicePlugin *)self _serviceConnection];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000292B0;
  v6[3] = &unk_1000C5890;
  v6[4] = self;
  id v4 = [v3 synchronousRemoteObjectProxyWithErrorHandler:v6];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10002931C;
  v5[3] = &unk_1000C5890;
  v5[4] = self;
  objc_msgSend(v4, "fetchThenUpdateConfigurationUIsWithScope:completionHandler:", +[RMStoreHelper storeScope](RMStoreHelper, "storeScope"), v5);
  [v3 invalidate];
}

- (id)reportDetails
{
  v11[0] = @"Location";
  v3 = [(RMConfigurationSubscriberServicePlugin *)self url];
  id v4 = [v3 path];
  v12[0] = v4;
  v11[1] = @"Identifier";
  id v5 = [(RMConfigurationSubscriberServicePlugin *)self identifier];
  v12[1] = v5;
  v11[2] = @"ConfigurationTypes";
  id v6 = [(RMConfigurationSubscriberServicePlugin *)self configurationTypes];
  id v7 = [v6 allObjects];
  uint64_t v8 = [v7 sortedArrayUsingSelector:"caseInsensitiveCompare:"];
  v12[2] = v8;
  id v9 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:3];

  return v9;
}

- (id)_serviceConnection
{
  id v3 = objc_alloc((Class)NSXPCConnection);
  id v4 = [(RMConfigurationSubscriberServicePlugin *)self identifier];
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

- (NSSet)configurationTypes
{
  return self->_configurationTypes;
}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_configurationTypes, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end