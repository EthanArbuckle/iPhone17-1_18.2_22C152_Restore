@interface PSPointerClientDefaultServiceSpecification
+ (BSServiceInterface)interface;
+ (BSServiceQuality)serviceQuality;
+ (NSString)domainName;
+ (NSString)machName;
+ (NSString)serviceName;
@end

@implementation PSPointerClientDefaultServiceSpecification

+ (NSString)domainName
{
  return (NSString *)@"com.apple.PointerUI.pointeruid";
}

+ (NSString)machName
{
  return (NSString *)@"com.apple.PointerUI.pointeruid.service";
}

+ (NSString)serviceName
{
  return (NSString *)@"com.apple.PointerUI.pointeruid.default-service";
}

+ (BSServiceQuality)serviceQuality
{
  return (BSServiceQuality *)[MEMORY[0x1E4F50BE0] userInteractive];
}

+ (BSServiceInterface)interface
{
  if (interface_onceToken != -1) {
    dispatch_once(&interface_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)interface___interface;
  return (BSServiceInterface *)v2;
}

void __55__PSPointerClientDefaultServiceSpecification_interface__block_invoke()
{
  id v3 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1EDF279E0];
  v0 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1EDF26458];
  uint64_t v1 = [MEMORY[0x1E4F50BD0] interfaceWithServer:v3 client:v0];
  v2 = (void *)interface___interface;
  interface___interface = v1;
}

@end