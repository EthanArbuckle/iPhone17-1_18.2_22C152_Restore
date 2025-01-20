@interface SBSLockScreenServiceSpecification
+ (BSServiceInterface)interface;
+ (BSServiceQuality)serviceQuality;
+ (NSString)identifier;
@end

@implementation SBSLockScreenServiceSpecification

+ (NSString)identifier
{
  return (NSString *)@"com.apple.springboard.lockscreen";
}

+ (BSServiceQuality)serviceQuality
{
  return (BSServiceQuality *)[MEMORY[0x1E4F50BE0] userInitiated];
}

+ (BSServiceInterface)interface
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__SBSLockScreenServiceSpecification_interface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (interface_onceToken_4 != -1) {
    dispatch_once(&interface_onceToken_4, block);
  }
  v2 = (void *)interface___interface_4;
  return (BSServiceInterface *)v2;
}

void __46__SBSLockScreenServiceSpecification_interface__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F50B98];
  v2 = [*(id *)(a1 + 32) identifier];
  id v6 = [v1 interfaceWithIdentifier:v2];

  v3 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1EDF6C058];
  [v6 setServer:v3];

  uint64_t v4 = [v6 copy];
  v5 = (void *)interface___interface_4;
  interface___interface_4 = v4;
}

@end