@interface URTAlertServiceSpecification
+ (BSServiceInterface)interface;
+ (BSServiceQuality)serviceQuality;
+ (NSString)entitlementName;
+ (NSString)identifier;
@end

@implementation URTAlertServiceSpecification

+ (NSString)identifier
{
  return (NSString *)@"com.apple.UserAlerts.alert-presentation";
}

+ (BSServiceQuality)serviceQuality
{
  return (BSServiceQuality *)[MEMORY[0x263F2B9F0] userInteractive];
}

+ (BSServiceInterface)interface
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__URTAlertServiceSpecification_interface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (interface_onceToken != -1) {
    dispatch_once(&interface_onceToken, block);
  }
  v2 = (void *)interface___interface;
  return (BSServiceInterface *)v2;
}

void __41__URTAlertServiceSpecification_interface__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F2B9B0];
  v2 = [*(id *)(a1 + 32) identifier];
  id v7 = [v1 interfaceWithIdentifier:v2];

  v3 = [MEMORY[0x263F29C88] protocolForProtocol:&unk_26D9FDE88];
  [v7 setServer:v3];

  v4 = [MEMORY[0x263F29C88] protocolForProtocol:&unk_26D9FE6C0];
  [v7 setClient:v4];

  [v7 setClientMessagingExpectation:1];
  uint64_t v5 = [v7 copy];
  v6 = (void *)interface___interface;
  interface___interface = v5;
}

+ (NSString)entitlementName
{
  return (NSString *)@"com.apple.UserAlerts.destinations";
}

@end