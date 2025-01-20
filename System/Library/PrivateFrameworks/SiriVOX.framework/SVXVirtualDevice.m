@interface SVXVirtualDevice
+ (BOOL)_instanceContextIsEndpoint:(id)a3;
- (AFPreferences)preferences;
- (SVXActivationHandling)activationHandler;
- (SVXClientServiceServer)clientServiceServer;
- (SVXDeactivationHandling)deactivationHandler;
- (SVXDeviceSetupManager)deviceSetupManager;
- (SVXMyriadEventHandling)myriadEventHandler;
- (SVXPrewarmHandling)prewarmHandler;
- (SVXSessionManager)sessionManager;
- (SVXSpeechSynthesizer)speechSynthesizer;
- (SVXSynthesisManager)synthesisManager;
- (SVXVirtualDevice)initWithInstanceContext:(id)a3;
- (SVXVirtualDevice)initWithInstanceContext:(id)a3 preferences:(id)a4 analytics:(id)a5 moduleFactory:(id)a6;
- (id)_createBuiltInModules:(id)a3 preferences:(id)a4 analytics:(id)a5 moduleFactory:(id)a6;
- (id)description;
- (void)_startWithModuleInstanceMap:(id)a3 platformDependencies:(id)a4;
- (void)_stopWithModuleInstanceMap:(id)a3;
- (void)startWithPlatformDependencies:(id)a3;
- (void)stop;
@end

@implementation SVXVirtualDevice

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_analytics, 0);
  objc_storeStrong((id *)&self->_instanceContext, 0);
  objc_storeStrong((id *)&self->_moduleInstanceMap, 0);

  objc_storeStrong((id *)&self->_modulesByIdentifier, 0);
}

- (AFPreferences)preferences
{
  return self->_preferences;
}

- (id)_createBuiltInModules:(id)a3 preferences:(id)a4 analytics:(id)a5 moduleFactory:(id)a6
{
  v37[6] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a6;
  v9 = [[SVXQueuePerformer alloc] initWithIdentifier:@"com.apple.SiriVOXService.session-manager" qosClass:33 relativePriority:0 options:2];
  v10 = [v8 createModuleWithIdentifier:@"com.apple.SiriVOXService.client-service" class:objc_opt_class() qos:33];
  v37[0] = v10;
  v11 = [v8 createModuleWithIdentifier:@"com.apple.SiriVOXService.service-command" class:objc_opt_class() performer:v9];
  v37[1] = v11;
  v30 = v9;
  v12 = [v8 createModuleWithIdentifier:@"com.apple.SiriVOXService.session-manager" class:objc_opt_class() performer:v9];
  v37[2] = v12;
  v13 = [v8 createModuleWithIdentifier:@"com.apple.SiriVOXService.speech-synthesis" class:objc_opt_class() qos:33];
  v37[3] = v13;
  v14 = [v8 createModuleWithIdentifier:@"com.apple.SiriVOXService.synthesis-manager" class:objc_opt_class() qos:33];
  v37[4] = v14;
  v15 = [v8 createModuleWithIdentifier:@"com.apple.SiriVOXService.system-observation" class:objc_opt_class() qos:17];
  v37[5] = v15;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:6];

  if ([v7 isDefault])
  {
    v17 = [v8 createModuleWithIdentifier:@"com.apple.SiriVOXService.device-setup" class:objc_opt_class() qos:21];
    v36 = v17;
    v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v36 count:1];
    uint64_t v19 = [v16 arrayByAddingObjectsFromArray:v18];

    v16 = (void *)v19;
  }
  v20 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v16, "count"));
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v21 = v16;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v32 != v24) {
          objc_enumerationMutation(v21);
        }
        v26 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        v27 = [v26 identifier];
        [v20 setObject:v26 forKey:v27];
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v23);
  }

  v28 = (void *)[v20 copy];

  return v28;
}

- (void)_stopWithModuleInstanceMap:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = [(NSDictionary *)self->_modulesByIdentifier allKeys];
  uint64_t v5 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        v10 = [v4 moduleInstanceWithIdentifier:v9];
        v11 = [(NSDictionary *)self->_modulesByIdentifier objectForKeyedSubscript:v9];
        v12 = [v11 performer];
        v16[0] = MEMORY[0x263EF8330];
        v16[1] = 3221225472;
        v16[2] = __47__SVXVirtualDevice__stopWithModuleInstanceMap___block_invoke;
        v16[3] = &unk_2645547B0;
        id v17 = v10;
        id v18 = v4;
        id v19 = v11;
        id v13 = v11;
        id v14 = v10;
        [v12 performBlock:v16];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v6);
  }
}

uint64_t __47__SVXVirtualDevice__stopWithModuleInstanceMap___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) stopWithModuleInstanceProvider:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 48);

  return [v2 setIsActive:0];
}

- (void)_startWithModuleInstanceMap:(id)a3 platformDependencies:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = [(NSDictionary *)self->_modulesByIdentifier allKeys];
  uint64_t v8 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        id v13 = [v6 moduleInstanceWithIdentifier:v12];
        id v14 = [(NSDictionary *)self->_modulesByIdentifier objectForKeyedSubscript:v12];
        v15 = [v14 performer];
        v19[0] = MEMORY[0x263EF8330];
        v19[1] = 3221225472;
        v19[2] = __69__SVXVirtualDevice__startWithModuleInstanceMap_platformDependencies___block_invoke;
        v19[3] = &unk_264554210;
        id v20 = v13;
        id v21 = v6;
        id v22 = v7;
        id v23 = v14;
        id v16 = v14;
        id v17 = v13;
        [v15 performBlock:v19];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v9);
  }
}

uint64_t __69__SVXVirtualDevice__startWithModuleInstanceMap_platformDependencies___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) startWithModuleInstanceProvider:*(void *)(a1 + 40) platformDependencies:*(void *)(a1 + 48)];
  v2 = *(void **)(a1 + 56);

  return [v2 setIsActive:1];
}

- (SVXSynthesisManager)synthesisManager
{
  return [(SVXModuleInstanceMap *)self->_moduleInstanceMap synthesisManager];
}

- (SVXMyriadEventHandling)myriadEventHandler
{
  return (SVXMyriadEventHandling *)[(SVXModuleInstanceMap *)self->_moduleInstanceMap sessionManager];
}

- (SVXClientServiceServer)clientServiceServer
{
  return [(SVXModuleInstanceMap *)self->_moduleInstanceMap clientServiceServer];
}

- (SVXSpeechSynthesizer)speechSynthesizer
{
  return [(SVXModuleInstanceMap *)self->_moduleInstanceMap speechSynthesizer];
}

- (SVXSessionManager)sessionManager
{
  return [(SVXModuleInstanceMap *)self->_moduleInstanceMap sessionManager];
}

- (SVXDeviceSetupManager)deviceSetupManager
{
  return [(SVXModuleInstanceMap *)self->_moduleInstanceMap deviceSetupManager];
}

- (SVXDeactivationHandling)deactivationHandler
{
  return (SVXDeactivationHandling *)[(SVXModuleInstanceMap *)self->_moduleInstanceMap sessionManager];
}

- (SVXActivationHandling)activationHandler
{
  return (SVXActivationHandling *)[(SVXModuleInstanceMap *)self->_moduleInstanceMap sessionManager];
}

- (SVXPrewarmHandling)prewarmHandler
{
  return (SVXPrewarmHandling *)[(SVXModuleInstanceMap *)self->_moduleInstanceMap sessionManager];
}

- (void)stop
{
  [(SVXVirtualDevice *)self _stopWithModuleInstanceMap:self->_moduleInstanceMap];
  moduleInstanceMap = self->_moduleInstanceMap;
  self->_moduleInstanceMap = 0;
}

- (void)startWithPlatformDependencies:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263EFF9A0];
  id v5 = a3;
  id v6 = objc_msgSend([v4 alloc], "initWithCapacity:", -[NSDictionary count](self->_modulesByIdentifier, "count"));
  modulesByIdentifier = self->_modulesByIdentifier;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __50__SVXVirtualDevice_startWithPlatformDependencies___block_invoke;
  v11[3] = &unk_2645541E8;
  id v12 = v6;
  id v8 = v6;
  [(NSDictionary *)modulesByIdentifier enumerateKeysAndObjectsUsingBlock:v11];
  uint64_t v9 = [[SVXModuleInstanceMap alloc] initWithDictionaryRepresentation:v8];
  moduleInstanceMap = self->_moduleInstanceMap;
  self->_moduleInstanceMap = v9;

  [(SVXVirtualDevice *)self _startWithModuleInstanceMap:self->_moduleInstanceMap platformDependencies:v5];
}

void __50__SVXVirtualDevice_startWithPlatformDependencies___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = objc_msgSend(objc_alloc((Class)objc_msgSend(v5, "instanceClass")), "initWithModule:", v5);

  if (v6) {
    [*(id *)(a1 + 32) setObject:v6 forKey:v7];
  }
}

- (SVXVirtualDevice)initWithInstanceContext:(id)a3 preferences:(id)a4 analytics:(id)a5 moduleFactory:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)SVXVirtualDevice;
  v15 = [(SVXVirtualDevice *)&v20 init];
  id v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_instanceContext, a3);
    objc_storeStrong((id *)&v16->_analytics, a5);
    objc_storeStrong((id *)&v16->_preferences, a4);
    uint64_t v17 = [(SVXVirtualDevice *)v16 _createBuiltInModules:v16->_instanceContext preferences:v16->_preferences analytics:v16->_analytics moduleFactory:v14];
    modulesByIdentifier = v16->_modulesByIdentifier;
    v16->_modulesByIdentifier = (NSDictionary *)v17;
  }
  return v16;
}

- (SVXVirtualDevice)initWithInstanceContext:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [MEMORY[0x263F28528] defaultContext];
  }
  id v7 = v6;
  if ([(id)objc_opt_class() _instanceContextIsEndpoint:v6])
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x263F285A0]) initWithInstanceContext:v7];
    uint64_t v9 = [objc_alloc(MEMORY[0x263F283F8]) initWithInstanceContext:v7];
  }
  else
  {
    id v8 = [MEMORY[0x263F285A0] sharedPreferences];
    uint64_t v9 = [MEMORY[0x263F283F8] sharedAnalytics];
  }
  uint64_t v10 = (void *)v9;
  id v11 = [[SVXModuleFactory alloc] initWithInstanceContext:v7 preferences:v8 analytics:v9];
  id v12 = [(SVXVirtualDevice *)self initWithInstanceContext:v7 preferences:v8 analytics:v10 moduleFactory:v11];

  return v12;
}

- (id)description
{
  id v3 = [NSString alloc];
  v7.receiver = self;
  v7.super_class = (Class)SVXVirtualDevice;
  id v4 = [(SVXVirtualDevice *)&v7 description];
  id v5 = (void *)[v3 initWithFormat:@"%@ {instanceContext = %@}", v4, self->_instanceContext];

  return v5;
}

+ (BOOL)_instanceContextIsEndpoint:(id)a3
{
  if (!a3)
  {
    id v4 = [MEMORY[0x263F08690] currentHandler];
    id v5 = [NSString stringWithUTF8String:"+[SVXVirtualDevice _instanceContextIsEndpoint:]"];
    [v4 handleFailureInFunction:v5, @"SVXVirtualDevice.m", 195, @"Invalid parameter not satisfying: %@", @"instanceContext != nil" file lineNumber description];
  }
  return 0;
}

@end