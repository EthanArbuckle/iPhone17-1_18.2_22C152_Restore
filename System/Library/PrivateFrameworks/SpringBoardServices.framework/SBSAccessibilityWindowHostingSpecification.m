@interface SBSAccessibilityWindowHostingSpecification
+ (BSServiceInterface)interface;
+ (BSServiceQuality)serviceQuality;
+ (NSString)identifier;
@end

@implementation SBSAccessibilityWindowHostingSpecification

+ (NSString)identifier
{
  return (NSString *)@"com.apple.springboard.accessibility-window-hosting";
}

+ (BSServiceQuality)serviceQuality
{
  return (BSServiceQuality *)[MEMORY[0x1E4F50BE0] userInitiated];
}

+ (BSServiceInterface)interface
{
  if (interface_onceToken_1 != -1) {
    dispatch_once(&interface_onceToken_1, &__block_literal_global_11);
  }
  v2 = (void *)interface___interface_1;
  return (BSServiceInterface *)v2;
}

void __55__SBSAccessibilityWindowHostingSpecification_interface__block_invoke()
{
  id v3 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1EDF6BF98];
  v0 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1EDF62E38];
  uint64_t v1 = [MEMORY[0x1E4F50BD0] interfaceWithServer:v3 client:v0];
  v2 = (void *)interface___interface_1;
  interface___interface_1 = v1;
}

@end