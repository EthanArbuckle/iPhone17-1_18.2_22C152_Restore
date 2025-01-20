@interface SBSAccidentalActivationMitigationSessionServiceSpecification
+ (BSServiceInterface)interface;
+ (BSServiceQuality)serviceQuality;
+ (NSString)identifier;
@end

@implementation SBSAccidentalActivationMitigationSessionServiceSpecification

+ (NSString)identifier
{
  return (NSString *)@"com.apple.springboard.mitigation-session-service";
}

+ (BSServiceQuality)serviceQuality
{
  return (BSServiceQuality *)[MEMORY[0x1E4F50BE0] userInitiated];
}

+ (BSServiceInterface)interface
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__SBSAccidentalActivationMitigationSessionServiceSpecification_interface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (interface_onceToken_6 != -1) {
    dispatch_once(&interface_onceToken_6, block);
  }
  v2 = (void *)interface___interface_6;
  return (BSServiceInterface *)v2;
}

void __73__SBSAccidentalActivationMitigationSessionServiceSpecification_interface__block_invoke(uint64_t a1)
{
  id v7 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1EDF674D0];
  v2 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1EDF5C3C0];
  v3 = (void *)MEMORY[0x1E4F50B98];
  v4 = [*(id *)(a1 + 32) identifier];
  uint64_t v5 = [v3 interfaceWithIdentifier:v4];
  v6 = (void *)interface___interface_6;
  interface___interface_6 = v5;

  [(id)interface___interface_6 setServer:v7];
  [(id)interface___interface_6 setClient:v2];
}

@end