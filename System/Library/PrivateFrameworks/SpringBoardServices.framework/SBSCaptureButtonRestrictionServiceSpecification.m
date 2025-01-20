@interface SBSCaptureButtonRestrictionServiceSpecification
+ (BSServiceInterface)interface;
+ (BSServiceQuality)serviceQuality;
+ (NSString)identifier;
@end

@implementation SBSCaptureButtonRestrictionServiceSpecification

+ (NSString)identifier
{
  return (NSString *)@"com.apple.springboard.capture-button-restriction-service";
}

+ (BSServiceQuality)serviceQuality
{
  return (BSServiceQuality *)[MEMORY[0x1E4F50BE0] userInitiated];
}

+ (BSServiceInterface)interface
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__SBSCaptureButtonRestrictionServiceSpecification_interface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (interface_onceToken_18 != -1) {
    dispatch_once(&interface_onceToken_18, block);
  }
  v2 = (void *)interface___interface_17;
  return (BSServiceInterface *)v2;
}

void __60__SBSCaptureButtonRestrictionServiceSpecification_interface__block_invoke(uint64_t a1)
{
  id v7 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1EDF6C5F8];
  v2 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1EDF6C658];
  v3 = (void *)MEMORY[0x1E4F50B98];
  v4 = [*(id *)(a1 + 32) identifier];
  uint64_t v5 = [v3 interfaceWithIdentifier:v4];
  v6 = (void *)interface___interface_17;
  interface___interface_17 = v5;

  [(id)interface___interface_17 setServer:v7];
  [(id)interface___interface_17 setClient:v2];
}

@end