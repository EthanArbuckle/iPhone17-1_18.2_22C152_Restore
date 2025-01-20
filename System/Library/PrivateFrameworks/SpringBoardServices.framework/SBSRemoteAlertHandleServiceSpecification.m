@interface SBSRemoteAlertHandleServiceSpecification
+ (BSServiceInterface)interface;
+ (BSServiceQuality)serviceQuality;
+ (NSString)identifier;
@end

@implementation SBSRemoteAlertHandleServiceSpecification

+ (NSString)identifier
{
  return (NSString *)@"com.apple.springboard.remote-alert-service";
}

+ (BSServiceQuality)serviceQuality
{
  return (BSServiceQuality *)[MEMORY[0x1E4F50BE0] userInitiated];
}

+ (BSServiceInterface)interface
{
  if (interface_sOnceToken != -1) {
    dispatch_once(&interface_sOnceToken, &__block_literal_global_8);
  }
  v2 = (void *)interface_sInterface;
  return (BSServiceInterface *)v2;
}

void __53__SBSRemoteAlertHandleServiceSpecification_interface__block_invoke()
{
  id v3 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1EDF6BF38];
  v0 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1EDF66D78];
  uint64_t v1 = [MEMORY[0x1E4F50BD0] interfaceWithServer:v3 client:v0];
  v2 = (void *)interface_sInterface;
  interface_sInterface = v1;
}

@end