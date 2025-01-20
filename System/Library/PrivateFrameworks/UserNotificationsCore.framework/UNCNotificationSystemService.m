@interface UNCNotificationSystemService
+ (id)domain;
+ (id)machServiceName;
+ (id)serviceInterface;
@end

@implementation UNCNotificationSystemService

+ (id)domain
{
  return @"com.apple.usernotifications.systemservice";
}

+ (id)machServiceName
{
  return @"com.apple.usernotifications.systemservice";
}

+ (id)serviceInterface
{
  if (serviceInterface_onceToken != -1) {
    dispatch_once(&serviceInterface_onceToken, &__block_literal_global_9);
  }
  v2 = (void *)serviceInterface_serviceInterface;

  return v2;
}

void __48__UNCNotificationSystemService_serviceInterface__block_invoke()
{
  id v4 = [MEMORY[0x263F2B9B0] interfaceWithIdentifier:@"com.apple.usernotifications.systemservice"];
  v0 = [MEMORY[0x263F29C88] protocolForProtocol:&unk_270CE8738];
  [v4 setServer:v0];

  v1 = [MEMORY[0x263F29C88] protocolForProtocol:&unk_270CF5BC8];
  [v4 setClient:v1];

  uint64_t v2 = [v4 copy];
  v3 = (void *)serviceInterface_serviceInterface;
  serviceInterface_serviceInterface = v2;
}

@end