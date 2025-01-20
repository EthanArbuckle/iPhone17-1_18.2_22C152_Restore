@interface SBSApplicationUserQuitMonitorSessionSpecification
+ (BSServiceInterface)interface;
+ (BSServiceQuality)serviceQuality;
+ (NSString)identifier;
@end

@implementation SBSApplicationUserQuitMonitorSessionSpecification

+ (NSString)identifier
{
  return (NSString *)@"com.apple.springboard.application-user-quit-monitor-service";
}

+ (BSServiceQuality)serviceQuality
{
  return (BSServiceQuality *)[MEMORY[0x1E4F50BE0] userInteractive];
}

+ (BSServiceInterface)interface
{
  if (interface_onceToken_5 != -1) {
    dispatch_once(&interface_onceToken_5, &__block_literal_global_18);
  }
  v2 = (void *)interface___interface_5;
  return (BSServiceInterface *)v2;
}

void __62__SBSApplicationUserQuitMonitorSessionSpecification_interface__block_invoke()
{
  id v3 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1EDF6C0B8];
  v0 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1EDF67398];
  uint64_t v1 = [MEMORY[0x1E4F50BD0] interfaceWithServer:v3 client:v0];
  v2 = (void *)interface___interface_5;
  interface___interface_5 = v1;
}

@end