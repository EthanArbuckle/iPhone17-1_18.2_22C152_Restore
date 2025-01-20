@interface SBSHomeScreenServiceSpecification
+ (BSServiceInterface)interface;
+ (BSServiceQuality)serviceQuality;
+ (NSString)identifier;
@end

@implementation SBSHomeScreenServiceSpecification

+ (NSString)identifier
{
  return (NSString *)@"com.apple.springboard.homescreen";
}

+ (BSServiceInterface)interface
{
  if (interface_onceToken_8 != -1) {
    dispatch_once(&interface_onceToken_8, &__block_literal_global_20);
  }
  v2 = (void *)interface___interface_8;
  return (BSServiceInterface *)v2;
}

void __46__SBSHomeScreenServiceSpecification_interface__block_invoke()
{
  id v3 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1EDF6C178];
  v0 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1EDF61BC0];
  uint64_t v1 = [MEMORY[0x1E4F50BD0] interfaceWithServer:v3 client:v0];
  v2 = (void *)interface___interface_8;
  interface___interface_8 = v1;
}

+ (BSServiceQuality)serviceQuality
{
  return (BSServiceQuality *)[MEMORY[0x1E4F50BE0] userInitiated];
}

@end