@interface SBSCaptureApplicationServiceSpecification
+ (BSServiceInterface)interface;
+ (BSServiceQuality)serviceQuality;
+ (NSString)identifier;
@end

@implementation SBSCaptureApplicationServiceSpecification

+ (NSString)identifier
{
  return (NSString *)@"com.apple.springboard.capture-application";
}

+ (BSServiceQuality)serviceQuality
{
  return (BSServiceQuality *)[MEMORY[0x1E4F50BE0] userInitiated];
}

+ (BSServiceInterface)interface
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__SBSCaptureApplicationServiceSpecification_interface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (interface_onceToken_15 != -1) {
    dispatch_once(&interface_onceToken_15, block);
  }
  v2 = (void *)interface___interface_14;
  return (BSServiceInterface *)v2;
}

void __54__SBSCaptureApplicationServiceSpecification_interface__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F50B98];
  v2 = [*(id *)(a1 + 32) identifier];
  id v7 = [v1 interfaceWithIdentifier:v2];

  v3 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1EDF6C418];
  [v7 setServer:v3];

  v4 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1EDF6C478];
  [v7 setClient:v4];

  uint64_t v5 = [v7 copy];
  v6 = (void *)interface___interface_14;
  interface___interface_14 = v5;
}

@end