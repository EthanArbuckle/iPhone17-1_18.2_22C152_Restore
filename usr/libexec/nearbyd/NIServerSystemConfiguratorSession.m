@interface NIServerSystemConfiguratorSession
- (BOOL)updateConfiguration:(id)a3;
- (NIServerSystemConfiguratorSession)initWithResourcesManager:(id)a3 configuration:(id)a4 error:(id *)a5;
- (duration<long)nominalCycleRate;
- (id)_processSystemEvent:(id)a3;
- (id)configure;
- (id)lastConfiguration;
- (id)pauseWithSource:(int64_t)a3;
- (id)run;
- (void)dealloc;
- (void)didUpdateResourceUsageLimitExceeded:(BOOL)a3 forSessionConfigurationType:(Class)a4;
- (void)didUpdateSystemState:(id)a3;
- (void)invalidate;
@end

@implementation NIServerSystemConfiguratorSession

- (NIServerSystemConfiguratorSession)initWithResourcesManager:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = objc_opt_class();
  if (v11 != objc_opt_class())
  {
    v23 = +[NSAssertionHandler currentHandler];
    [v23 handleFailureInMethod:a2 object:self file:@"NIServerSystemConfiguratorSession.mm" lineNumber:33 description:@"Invalid configuration type."];
  }
  v12 = [v9 serverSessionIdentifier];

  if (!v12)
  {
    v24 = +[NSAssertionHandler currentHandler];
    [v24 handleFailureInMethod:a2, self, @"NIServerSystemConfiguratorSession.mm", 34, @"Invalid parameter not satisfying: %@", @"resourcesManager.serverSessionIdentifier" object file lineNumber description];
  }
  v25.receiver = self;
  v25.super_class = (Class)NIServerSystemConfiguratorSession;
  v13 = [(NIServerBaseSession *)&v25 initWithResourcesManager:v9 configuration:v10 error:a5];
  if (v13)
  {
    uint64_t v14 = [v9 clientConnectionQueue];
    clientQueue = v13->_clientQueue;
    v13->_clientQueue = (OS_dispatch_queue *)v14;

    v16 = (NISystemConfiguration *)[v10 copy];
    configuration = v13->_configuration;
    v13->_configuration = v16;

    v18 = +[NSUUID UUID];
    v19 = [v18 UUIDString];
    uint64_t v20 = +[NSString stringWithFormat:@"ses-system-%@", v19];
    configuratorClientIdentifier = v13->_configuratorClientIdentifier;
    v13->_configuratorClientIdentifier = (NSString *)v20;
  }
  return v13;
}

- (id)configure
{
  v7.receiver = self;
  v7.super_class = (Class)NIServerSystemConfiguratorSession;
  v2 = [(NIServerBaseSession *)&v7 resourcesManager];
  if ([v2 entitlementGranted:0])
  {
    v3 = 0;
  }
  else
  {
    v4 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10041BC5C(v4);
    }
    NSErrorUserInfoKey v8 = NSLocalizedDescriptionKey;
    CFStringRef v9 = @"Not authorized.";
    v5 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
    v3 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5888 userInfo:v5];
  }

  return v3;
}

- (id)run
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v3 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    configuration = self->_configuration;
    *(_DWORD *)buf = 138412290;
    v12 = configuration;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ses-system,Run with configuration: %@", buf, 0xCu);
  }
  v10.receiver = self;
  v10.super_class = (Class)NIServerSystemConfiguratorSession;
  v5 = [(NIServerBaseSession *)&v10 resourcesManager];
  v6 = [v5 lifecycleSupervisor];
  [v6 setTimeoutOnPeerInactivity:0];

  objc_super v7 = +[NIServerSystemConfigurator sharedInstance];
  [v7 addClient:self identifier:self->_configuratorClientIdentifier];

  NSErrorUserInfoKey v8 = +[NIServerSystemConfigurator sharedInstance];
  [v8 clientWithIdentifier:self->_configuratorClientIdentifier requestedPrewarmUWB:-[NISystemConfiguration prewarmUWB](self->_configuration, "prewarmUWB") prewarmSecureElementChannel:-[NISystemConfiguration prewarmSecureElementChannel](self->_configuration, "prewarmSecureElementChannel")];

  return 0;
}

- (id)pauseWithSource:(int64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v3 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ses-system,Pause (no-op)", v5, 2u);
  }
  return 0;
}

- (BOOL)updateConfiguration:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v5 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    configuration = self->_configuration;
    int v10 = 138412546;
    id v11 = v4;
    __int16 v12 = 2112;
    v13 = configuration;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ses-system,Update to configuration: %@. Previous: %@", (uint8_t *)&v10, 0x16u);
  }
  objc_super v7 = (NISystemConfiguration *)[v4 copy];
  NSErrorUserInfoKey v8 = self->_configuration;
  self->_configuration = v7;

  return 1;
}

- (id)_processSystemEvent:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  if (!v4) {
    __assert_rtn("-[NIServerSystemConfiguratorSession _processSystemEvent:]", "NIServerSystemConfiguratorSession.mm", 91, "event");
  }
  v5 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    id v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ses-system,Process system event: %@", (uint8_t *)&v17, 0xCu);
  }
  v6 = [v4 objectForKeyedSubscript:@"SystemEventDictKey_EventType"];
  id v7 = [v6 integerValue];

  if ((unint64_t)v7 >= 3) {
    id v8 = 0;
  }
  else {
    id v8 = v7;
  }
  if (v8 == (id)1)
  {
    id v11 = [v4 objectForKeyedSubscript:@"SystemEventDictKey_PassiveAccessIntentOptions"];
    if (v11)
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
    }
    else
    {
      char isKindOfClass = 0;
    }
    id v14 = [v11 unsignedIntegerValue];
    if ((isKindOfClass & 1) == 0) {
      goto LABEL_18;
    }
    id v15 = v14;
    __int16 v12 = +[NIServerSystemConfigurator sharedInstance];
    [v12 clientWithIdentifier:self->_configuratorClientIdentifier notifiedPassiveAccessIntent:v15];
    goto LABEL_17;
  }
  if (v8 == (id)2)
  {
    CFStringRef v9 = [v4 objectForKeyedSubscript:@"SystemEventDictKey_ConfigurationType"];
    Class v10 = NSClassFromString(v9);

    id v11 = [v4 objectForKeyedSubscript:@"SystemEventDictKey_ResourceUsageLimitExceededValue"];
    if (!v11) {
      goto LABEL_18;
    }
    objc_opt_class();
    if (((v10 != 0) & objc_opt_isKindOfClass()) != 1) {
      goto LABEL_18;
    }
    __int16 v12 = +[NIServerSystemConfigurator sharedInstance];
    [v12 clientWithIdentifier:self->_configuratorClientIdentifier notifiedResourceUsageLimitExceeded:[v11 BOOLValue] forSessionConfigurationType:v10];
LABEL_17:

LABEL_18:
  }

  return 0;
}

- (void)invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v3 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ses-system,Invalidate", buf, 2u);
  }
  id v4 = +[NIServerSystemConfigurator sharedInstance];
  [v4 removeClientWithIdentifier:self->_configuratorClientIdentifier];

  v5.receiver = self;
  v5.super_class = (Class)NIServerSystemConfiguratorSession;
  [(NIServerBaseSession *)&v5 invalidate];
}

- (void)dealloc
{
  v3 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ses-system,Dealloc", buf, 2u);
  }
  id v4 = +[NIServerSystemConfigurator sharedInstance];
  [v4 removeClientWithIdentifier:self->_configuratorClientIdentifier];

  v5.receiver = self;
  v5.super_class = (Class)NIServerSystemConfiguratorSession;
  [(NIServerSystemConfiguratorSession *)&v5 dealloc];
}

- (id)lastConfiguration
{
  return self->_configuration;
}

- (duration<long)nominalCycleRate
{
  return (duration<long long, std::ratio<1, 1000>>)100;
}

- (void)didUpdateSystemState:(id)a3
{
  id v4 = a3;
  clientQueue = self->_clientQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001DC3F0;
  v7[3] = &unk_100846588;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)clientQueue, v7);
}

- (void)didUpdateResourceUsageLimitExceeded:(BOOL)a3 forSessionConfigurationType:(Class)a4
{
  clientQueue = self->_clientQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001DC500;
  block[3] = &unk_1008585D8;
  BOOL v6 = a3;
  block[4] = self;
  block[5] = a4;
  dispatch_async((dispatch_queue_t)clientQueue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuratorClientIdentifier, 0);
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong((id *)&self->_clientQueue, 0);
}

@end