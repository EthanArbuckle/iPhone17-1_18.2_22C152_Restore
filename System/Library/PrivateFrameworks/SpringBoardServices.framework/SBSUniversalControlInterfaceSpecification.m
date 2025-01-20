@interface SBSUniversalControlInterfaceSpecification
+ (BSServiceInterface)interface;
+ (BSServiceQuality)serviceQuality;
+ (NSString)identifier;
@end

@implementation SBSUniversalControlInterfaceSpecification

+ (NSString)identifier
{
  return (NSString *)@"com.apple.springboard.universal-control";
}

+ (BSServiceQuality)serviceQuality
{
  return (BSServiceQuality *)[MEMORY[0x1E4F50BE0] userInteractive];
}

+ (BSServiceInterface)interface
{
  if (interface_onceToken_21 != -1) {
    dispatch_once(&interface_onceToken_21, &__block_literal_global_44);
  }
  v2 = (void *)interface___interface_20;
  return (BSServiceInterface *)v2;
}

void __54__SBSUniversalControlInterfaceSpecification_interface__block_invoke()
{
  id v3 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1EDF6C7D8];
  v0 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1EDF67268];
  uint64_t v1 = [MEMORY[0x1E4F50BD0] interfaceWithServer:v3 client:v0];
  v2 = (void *)interface___interface_20;
  interface___interface_20 = v1;
}

@end