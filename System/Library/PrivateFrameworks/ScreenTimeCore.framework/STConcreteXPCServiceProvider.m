@interface STConcreteXPCServiceProvider
+ (id)askServiceDescription;
+ (id)communicationServiceDescription;
+ (id)downtimeServiceDescription;
+ (id)privateAgentServiceDescription;
+ (id)publicAgentServiceDescription;
+ (id)reactorToolServiceDescription;
+ (id)setupServiceDescription;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSMutableDictionary)anonymousXpcListenersByServiceName;
- (NSMutableDictionary)machXpcListenersByServiceName;
- (NSMutableDictionary)providedServicesByServiceName;
- (NSMutableDictionary)serviceDescriptionsByServiceName;
- (STConcreteXPCServiceProvider)init;
- (id)_supportedMachServices;
- (id)provideAskService;
- (id)provideCommunicationService;
- (id)provideDowntimeService;
- (id)providePasscodeAuthenticationServiceWithClientListenerEndpoint:(id)a3;
- (id)providePasscodePromptServiceWithClientListenerEndpoint:(id)a3;
- (id)providePrivateAgentService;
- (id)providePublicAgentService;
- (id)provideReactorToolService;
- (id)provideSetupService;
- (void)resume;
- (void)suspend;
@end

@implementation STConcreteXPCServiceProvider

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 serviceName];
  if (!v8)
  {
    v9 = +[STLog xpcServiceProvider];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Looking for service description for anonymous connection request: %{public}@", (uint8_t *)&buf, 0xCu);
    }

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v29 = 0x3032000000;
    v30 = sub_10001F7AC;
    v31 = sub_10001F7BC;
    id v32 = 0;
    v10 = [(STConcreteXPCServiceProvider *)self anonymousXpcListenersByServiceName];
    v22 = _NSConcreteStackBlock;
    uint64_t v23 = 3221225472;
    v24 = sub_10001F7C4;
    v25 = &unk_1002FBD38;
    id v26 = v6;
    p_long long buf = &buf;
    [v10 enumerateKeysAndObjectsUsingBlock:&v22];

    id v8 = *(id *)(*((void *)&buf + 1) + 40);
    _Block_object_dispose(&buf, 8);
  }
  v11 = +[STLog xpcServiceProvider];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "New connection request on service: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  v12 = [(STConcreteXPCServiceProvider *)self serviceDescriptionsByServiceName];
  v13 = [v12 objectForKeyedSubscript:v8];

  if (v13)
  {
    v14 = [(STConcreteXPCServiceProvider *)self providedServicesByServiceName];
    v15 = [v14 objectForKeyedSubscript:v8];

    if (!v15)
    {
      v16 = +[STLog xpcServiceProvider];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_10025CAA4(v16);
      }
      BOOL v19 = 0;
      goto LABEL_26;
    }
    v16 = [v13 serviceEntitlement];
    if (v16)
    {
      v17 = [v7 valueForEntitlement:v16];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || ([v17 BOOLValue] & 1) == 0)
      {
        v20 = +[STLog xpcServiceProvider];
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          sub_10025CAE8((uint64_t)v16, v20);
        }

        BOOL v19 = 0;
        goto LABEL_25;
      }
    }
    v18 = [v13 exportedInterface];
    [v7 setExportedInterface:v18];

    [v7 setExportedObject:v15];
    [v7 resume];
    v17 = +[STLog xpcServiceProvider];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Accepted connection", (uint8_t *)&buf, 2u);
    }
    BOOL v19 = 1;
LABEL_25:

LABEL_26:
    goto LABEL_27;
  }
  v15 = +[STLog xpcServiceProvider];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_10025CA60(v15);
  }
  BOOL v19 = 0;
LABEL_27:

  return v19;
}

- (NSMutableDictionary)serviceDescriptionsByServiceName
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (NSMutableDictionary)providedServicesByServiceName
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (STConcreteXPCServiceProvider)init
{
  v24.receiver = self;
  v24.super_class = (Class)STConcreteXPCServiceProvider;
  v2 = [(STConcreteXPCServiceProvider *)&v24 init];
  uint64_t v3 = objc_opt_new();
  machXpcListenersByServiceName = v2->_machXpcListenersByServiceName;
  v2->_machXpcListenersByServiceName = (NSMutableDictionary *)v3;

  uint64_t v5 = objc_opt_new();
  anonymousXpcListenersByServiceName = v2->_anonymousXpcListenersByServiceName;
  v2->_anonymousXpcListenersByServiceName = (NSMutableDictionary *)v5;

  uint64_t v7 = objc_opt_new();
  serviceDescriptionsByServiceName = v2->_serviceDescriptionsByServiceName;
  v2->_serviceDescriptionsByServiceName = (NSMutableDictionary *)v7;

  uint64_t v9 = objc_opt_new();
  providedServicesByServiceName = v2->_providedServicesByServiceName;
  v2->_providedServicesByServiceName = (NSMutableDictionary *)v9;

  v11 = [(STConcreteXPCServiceProvider *)v2 _supportedMachServices];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v12 = [v11 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v17 = [v16 serviceName];
        [(NSMutableDictionary *)v2->_serviceDescriptionsByServiceName setObject:v16 forKeyedSubscript:v17];
        id v18 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:v17];
        [v18 setDelegate:v2];
        [(NSMutableDictionary *)v2->_machXpcListenersByServiceName setObject:v18 forKeyedSubscript:v17];
      }
      id v13 = [v11 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v13);
  }

  return v2;
}

- (id)_supportedMachServices
{
  v2 = objc_opt_new();
  uint64_t v3 = +[STConcreteXPCServiceProvider askServiceDescription];
  v4 = +[STConcreteXPCServiceProvider setupServiceDescription];
  uint64_t v5 = +[STConcreteXPCServiceProvider communicationServiceDescription];
  id v6 = +[STConcreteXPCServiceProvider privateAgentServiceDescription];
  uint64_t v7 = +[STConcreteXPCServiceProvider publicAgentServiceDescription];
  id v8 = +[STConcreteXPCServiceProvider reactorToolServiceDescription];
  uint64_t v9 = +[STConcreteXPCServiceProvider downtimeServiceDescription];
  [v2 addObject:v3];
  [v2 addObject:v4];
  [v2 addObject:v5];
  [v2 addObject:v6];
  [v2 addObject:v7];
  [v2 addObject:v8];
  [v2 addObject:v9];
  id v10 = [v2 copy];

  return v10;
}

- (void)resume
{
  id v2 = [(STConcreteXPCServiceProvider *)self machXpcListenersByServiceName];
  [v2 enumerateKeysAndObjectsUsingBlock:&stru_1002FBCF0];
}

- (void)suspend
{
  id v2 = [(STConcreteXPCServiceProvider *)self machXpcListenersByServiceName];
  [v2 enumerateKeysAndObjectsUsingBlock:&stru_1002FBD10];
}

+ (id)setupServiceDescription
{
  return +[STXPCServiceDescription machDescriptionWithServiceName:STMachServiceNameSetup serviceEntitlement:STMachServiceEntitlementSetup exportedProtocol:&OBJC_PROTOCOL___STSetupServiceInterface];
}

+ (id)communicationServiceDescription
{
  return +[STXPCServiceDescription machDescriptionWithServiceName:STMachServiceNameCommunication serviceEntitlement:STMachServiceEntitlementCommunication exportedProtocol:&OBJC_PROTOCOL___STCommunicationServiceInterface];
}

+ (id)privateAgentServiceDescription
{
  id v2 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___STPrivateAgentServiceInterface];
  id v3 = objc_alloc((Class)NSSet);
  uint64_t v4 = objc_opt_class();
  id v5 = objc_msgSend(v3, "initWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:"deleteWebHistoryForURLs:webApplication:replyHandler:" argumentIndex:0 ofReply:0];
  [v2 setClasses:v5 forSelector:"deleteWebHistoryForURLs:webApplication:profileIdentifier:replyHandler:" argumentIndex:0 ofReply:0];
  id v6 = +[STXPCServiceDescription machDescriptionWithServiceName:STMachServiceNameScreenTimePrivate serviceEntitlement:STEntitlementScreenTimePrivate exportedInterface:v2];

  return v6;
}

+ (id)askServiceDescription
{
  return +[STXPCServiceDescription machDescriptionWithServiceName:STMachServiceNameAsk serviceEntitlement:STMachServiceEntitlementAsk exportedProtocol:&OBJC_PROTOCOL___STAskServiceInterface];
}

+ (id)publicAgentServiceDescription
{
  return +[STXPCServiceDescription machDescriptionWithServiceName:STMachServiceNameScreenTime serviceEntitlement:0 exportedProtocol:&OBJC_PROTOCOL___STScreenTimeAgent];
}

+ (id)reactorToolServiceDescription
{
  return +[STXPCServiceDescription machDescriptionWithServiceName:@"com.apple.ScreenTimeAgent.reactor-tool" serviceEntitlement:@"com.apple.private.screentime-reactor-tool" exportedProtocol:&OBJC_PROTOCOL___STReactorToolServiceInterface];
}

+ (id)downtimeServiceDescription
{
  return +[STXPCServiceDescription machDescriptionWithServiceName:STMachServiceNameDowntime serviceEntitlement:STMachServiceEntitlementDowntime exportedProtocol:&OBJC_PROTOCOL___STDowntimeServiceInterface];
}

- (id)provideAskService
{
  id v3 = +[STConcreteXPCServiceProvider askServiceDescription];
  uint64_t v4 = objc_opt_new();
  id v5 = [(STConcreteXPCServiceProvider *)self providedServicesByServiceName];
  id v6 = [v3 serviceName];
  [v5 setObject:v4 forKeyedSubscript:v6];

  return v4;
}

- (id)provideSetupService
{
  id v3 = +[STConcreteXPCServiceProvider setupServiceDescription];
  uint64_t v4 = objc_opt_new();
  id v5 = [(STConcreteXPCServiceProvider *)self providedServicesByServiceName];
  id v6 = [v3 serviceName];
  [v5 setObject:v4 forKeyedSubscript:v6];

  return v4;
}

- (id)providePasscodePromptServiceWithClientListenerEndpoint:(id)a3
{
  uint64_t v8 = STRemoteAlertConfigurationContextKeyPasscodeMode;
  uint64_t v9 = &off_10030FB98;
  id v3 = a3;
  uint64_t v4 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  id v5 = +[STRemoteViewServiceDescription sharedDescriptionWithServiceName:@"com.apple.ScreenTimeUnlock" viewControllerClassName:@"STRemoteServiceViewController" configurationContextUserInfo:v4];

  id v6 = [[STConcretePrimitiveRemoteViewService alloc] initWithServiceDescription:v5 listenerEndpoint:v3];
  return v6;
}

- (id)provideCommunicationService
{
  id v3 = +[STConcreteXPCServiceProvider communicationServiceDescription];
  uint64_t v4 = objc_opt_new();
  id v5 = [(STConcreteXPCServiceProvider *)self providedServicesByServiceName];
  id v6 = [v3 serviceName];
  [v5 setObject:v4 forKeyedSubscript:v6];

  return v4;
}

- (id)providePasscodeAuthenticationServiceWithClientListenerEndpoint:(id)a3
{
  uint64_t v8 = STRemoteAlertConfigurationContextKeyPasscodeMode;
  uint64_t v9 = &off_10030FBB0;
  id v3 = a3;
  uint64_t v4 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  id v5 = +[STRemoteViewServiceDescription sharedDescriptionWithServiceName:@"com.apple.ScreenTimeUnlock" viewControllerClassName:@"STRemoteServiceViewController" configurationContextUserInfo:v4];

  id v6 = [[STConcretePrimitiveRemoteViewService alloc] initWithServiceDescription:v5 listenerEndpoint:v3];
  return v6;
}

- (id)providePrivateAgentService
{
  id v3 = +[STConcreteXPCServiceProvider privateAgentServiceDescription];
  uint64_t v4 = objc_opt_new();
  id v5 = [(STConcreteXPCServiceProvider *)self providedServicesByServiceName];
  id v6 = [v3 serviceName];
  [v5 setObject:v4 forKeyedSubscript:v6];

  return v4;
}

- (id)providePublicAgentService
{
  id v3 = +[STConcreteXPCServiceProvider publicAgentServiceDescription];
  uint64_t v4 = objc_opt_new();
  id v5 = [(STConcreteXPCServiceProvider *)self providedServicesByServiceName];
  id v6 = [v3 serviceName];
  [v5 setObject:v4 forKeyedSubscript:v6];

  return v4;
}

- (id)provideReactorToolService
{
  id v3 = +[STConcreteXPCServiceProvider reactorToolServiceDescription];
  uint64_t v4 = objc_opt_new();
  id v5 = [(STConcreteXPCServiceProvider *)self providedServicesByServiceName];
  id v6 = [v3 serviceName];
  [v5 setObject:v4 forKeyedSubscript:v6];

  return v4;
}

- (id)provideDowntimeService
{
  id v3 = +[STConcreteXPCServiceProvider downtimeServiceDescription];
  uint64_t v4 = objc_opt_new();
  id v5 = [(STConcreteXPCServiceProvider *)self providedServicesByServiceName];
  id v6 = [v3 serviceName];
  [v5 setObject:v4 forKeyedSubscript:v6];

  return v4;
}

- (NSMutableDictionary)machXpcListenersByServiceName
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (NSMutableDictionary)anonymousXpcListenersByServiceName
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providedServicesByServiceName, 0);
  objc_storeStrong((id *)&self->_serviceDescriptionsByServiceName, 0);
  objc_storeStrong((id *)&self->_anonymousXpcListenersByServiceName, 0);
  objc_storeStrong((id *)&self->_machXpcListenersByServiceName, 0);
}

@end