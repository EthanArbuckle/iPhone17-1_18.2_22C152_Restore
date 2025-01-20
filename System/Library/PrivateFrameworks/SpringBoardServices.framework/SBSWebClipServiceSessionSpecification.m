@interface SBSWebClipServiceSessionSpecification
+ (BSServiceInterface)interface;
+ (BSServiceQuality)serviceQuality;
+ (NSString)identifier;
@end

@implementation SBSWebClipServiceSessionSpecification

+ (NSString)identifier
{
  return (NSString *)@"com.apple.springboard.web-clip-service";
}

+ (BSServiceQuality)serviceQuality
{
  return (BSServiceQuality *)[MEMORY[0x1E4F50BE0] userInitiated];
}

+ (BSServiceInterface)interface
{
  if (interface_onceToken_19 != -1) {
    dispatch_once(&interface_onceToken_19, &__block_literal_global_41);
  }
  v2 = (void *)interface___interface_18;
  return (BSServiceInterface *)v2;
}

void __50__SBSWebClipServiceSessionSpecification_interface__block_invoke()
{
  id v3 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1EDF6C6B8];
  v0 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1EDF6C718];
  uint64_t v1 = [MEMORY[0x1E4F50BD0] interfaceWithServer:v3 client:v0];
  v2 = (void *)interface___interface_18;
  interface___interface_18 = v1;
}

@end