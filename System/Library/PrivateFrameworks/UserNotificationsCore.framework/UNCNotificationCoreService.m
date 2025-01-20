@interface UNCNotificationCoreService
+ (id)domain;
+ (id)machServiceName;
+ (id)serviceInterface;
+ (id)serviceName;
@end

@implementation UNCNotificationCoreService

+ (id)domain
{
  return @"com.apple.usernotifications.coreservice";
}

+ (id)machServiceName
{
  return @"com.apple.usernotifications.coreservice";
}

+ (id)serviceName
{
  return @"com.apple.usernotifications.coreservice";
}

+ (id)serviceInterface
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__UNCNotificationCoreService_serviceInterface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (serviceInterface_onceToken_0[0] != -1) {
    dispatch_once(serviceInterface_onceToken_0, block);
  }
  v2 = (void *)serviceInterface_serviceInterface_0;

  return v2;
}

void __46__UNCNotificationCoreService_serviceInterface__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F2B9B0];
  v2 = [*(id *)(a1 + 32) serviceName];
  id v7 = [v1 interfaceWithIdentifier:v2];

  v3 = [MEMORY[0x263F29C88] protocolForProtocol:&unk_270CF5A70];
  [v7 setServer:v3];

  v4 = [MEMORY[0x263F29C88] protocolForProtocol:&unk_270CF4A30];
  [v7 setClient:v4];

  uint64_t v5 = [v7 copy];
  v6 = (void *)serviceInterface_serviceInterface_0;
  serviceInterface_serviceInterface_0 = v5;
}

@end