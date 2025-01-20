@interface SBSSystemApertureRestrictionServiceSpecification
+ (BSServiceInterface)interface;
+ (BSServiceQuality)serviceQuality;
+ (NSString)identifier;
@end

@implementation SBSSystemApertureRestrictionServiceSpecification

+ (NSString)identifier
{
  return (NSString *)@"com.apple.springboard.system-component-restriction-service";
}

+ (BSServiceQuality)serviceQuality
{
  return (BSServiceQuality *)[MEMORY[0x1E4F50BE0] userInitiated];
}

+ (BSServiceInterface)interface
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__SBSSystemApertureRestrictionServiceSpecification_interface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (interface_onceToken_12 != -1) {
    dispatch_once(&interface_onceToken_12, block);
  }
  v2 = (void *)interface___interface_11;
  return (BSServiceInterface *)v2;
}

void __61__SBSSystemApertureRestrictionServiceSpecification_interface__block_invoke(uint64_t a1)
{
  id v7 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1EDF6C298];
  v2 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1EDF6C2F8];
  v3 = (void *)MEMORY[0x1E4F50B98];
  v4 = [*(id *)(a1 + 32) identifier];
  uint64_t v5 = [v3 interfaceWithIdentifier:v4];
  v6 = (void *)interface___interface_11;
  interface___interface_11 = v5;

  [(id)interface___interface_11 setServer:v7];
  [(id)interface___interface_11 setClient:v2];
}

@end