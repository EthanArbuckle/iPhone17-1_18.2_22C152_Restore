@interface SBAppSwitcherServiceManager
+ (id)sharedInstance;
- (id)registeredServicesSnapshot;
- (void)registerService:(id)a3;
- (void)unregisterService:(id)a3;
@end

@implementation SBAppSwitcherServiceManager

- (id)registeredServicesSnapshot
{
  v2 = (void *)[(SBAppSwitcherServiceSet *)self->_services copy];
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_12);
  }
  v2 = (void *)sharedInstance___manager;
  return v2;
}

uint64_t __45__SBAppSwitcherServiceManager_sharedInstance__block_invoke()
{
  kdebug_trace();
  v0 = objc_alloc_init(SBAppSwitcherServiceManager);
  v1 = (void *)sharedInstance___manager;
  sharedInstance___manager = (uint64_t)v0;

  return kdebug_trace();
}

- (void)registerService:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  services = self->_services;
  if (!services)
  {
    v6 = objc_alloc_init(SBAppSwitcherServiceSet);
    v7 = self->_services;
    self->_services = v6;

    services = self->_services;
  }
  [(SBAppSwitcherServiceSet *)services addService:v4];
  v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v10 = @"AppSwitcherService";
  v11[0] = v4;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  [v8 postNotificationName:@"AppSwitcherServiceAdded" object:self userInfo:v9];
}

- (void)unregisterService:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  services = self->_services;
  id v5 = a3;
  [(SBAppSwitcherServiceSet *)services removeService:v5];
  v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v8 = @"AppSwitcherService";
  v9[0] = v5;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];

  [v6 postNotificationName:@"AppSwitcherServiceRemoved" object:self userInfo:v7];
}

- (void).cxx_destruct
{
}

@end