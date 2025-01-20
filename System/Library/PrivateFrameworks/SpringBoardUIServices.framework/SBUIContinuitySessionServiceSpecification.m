@interface SBUIContinuitySessionServiceSpecification
+ (BSServiceInterface)interface;
+ (BSServiceQuality)serviceQuality;
+ (NSString)identifier;
@end

@implementation SBUIContinuitySessionServiceSpecification

+ (NSString)identifier
{
  return (NSString *)@"com.apple.springboard.continuity-session-service";
}

+ (BSServiceQuality)serviceQuality
{
  return (BSServiceQuality *)[MEMORY[0x1E4F628B0] userInitiated];
}

+ (BSServiceInterface)interface
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__SBUIContinuitySessionServiceSpecification_interface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (interface_onceToken != -1) {
    dispatch_once(&interface_onceToken, block);
  }
  v2 = (void *)interface___interface;
  return (BSServiceInterface *)v2;
}

void __54__SBUIContinuitySessionServiceSpecification_interface__block_invoke(uint64_t a1)
{
  id v7 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1EFD5AC60];
  v2 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1EFD3B900];
  v3 = (void *)MEMORY[0x1E4F62858];
  v4 = [*(id *)(a1 + 32) identifier];
  uint64_t v5 = [v3 interfaceWithIdentifier:v4];
  v6 = (void *)interface___interface;
  interface___interface = v5;

  [(id)interface___interface setServer:v7];
  [(id)interface___interface setClient:v2];
}

@end