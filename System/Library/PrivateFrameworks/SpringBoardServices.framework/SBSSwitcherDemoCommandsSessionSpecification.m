@interface SBSSwitcherDemoCommandsSessionSpecification
+ (BSServiceInterface)interface;
+ (BSServiceQuality)serviceQuality;
+ (NSString)identifier;
@end

@implementation SBSSwitcherDemoCommandsSessionSpecification

+ (NSString)identifier
{
  return (NSString *)@"com.apple.springboard.switcher-demo-commands-service";
}

+ (BSServiceQuality)serviceQuality
{
  return (BSServiceQuality *)[MEMORY[0x1E4F50BE0] userInteractive];
}

+ (BSServiceInterface)interface
{
  if (interface_onceToken_9 != -1) {
    dispatch_once(&interface_onceToken_9, &__block_literal_global_23);
  }
  v2 = (void *)interface___interface_9;
  return (BSServiceInterface *)v2;
}

void __56__SBSSwitcherDemoCommandsSessionSpecification_interface__block_invoke()
{
  id v3 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1EDF6C1D8];
  v0 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1EDF67740];
  uint64_t v1 = [MEMORY[0x1E4F50BD0] interfaceWithServer:v3 client:v0];
  v2 = (void *)interface___interface_9;
  interface___interface_9 = v1;
}

@end