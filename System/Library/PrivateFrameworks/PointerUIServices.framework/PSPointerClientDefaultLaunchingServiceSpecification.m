@interface PSPointerClientDefaultLaunchingServiceSpecification
+ (BSServiceInterface)interface;
+ (BSServiceQuality)serviceQuality;
+ (NSString)domainName;
+ (NSString)machName;
+ (NSString)serviceName;
@end

@implementation PSPointerClientDefaultLaunchingServiceSpecification

+ (NSString)domainName
{
  return (NSString *)@"com.apple.PointerUI.pointeruid-launching";
}

+ (NSString)machName
{
  return (NSString *)@"com.apple.PointerUI.pointeruid.service-launching";
}

+ (NSString)serviceName
{
  return (NSString *)@"com.apple.PointerUI.pointeruid.default-service-launching";
}

+ (BSServiceQuality)serviceQuality
{
  return (BSServiceQuality *)[MEMORY[0x1E4F50BE0] userInteractive];
}

+ (BSServiceInterface)interface
{
  if (interface_onceToken_0 != -1) {
    dispatch_once(&interface_onceToken_0, &__block_literal_global_3);
  }
  v2 = (void *)interface___interface_0;
  return (BSServiceInterface *)v2;
}

void __64__PSPointerClientDefaultLaunchingServiceSpecification_interface__block_invoke()
{
  id v3 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1EDF27A40];
  v0 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1EDF264B8];
  uint64_t v1 = [MEMORY[0x1E4F50BD0] interfaceWithServer:v3 client:v0];
  v2 = (void *)interface___interface_0;
  interface___interface_0 = v1;
}

@end