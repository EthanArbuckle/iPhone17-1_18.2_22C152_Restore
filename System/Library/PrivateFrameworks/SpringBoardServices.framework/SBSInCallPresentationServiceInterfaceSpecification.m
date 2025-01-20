@interface SBSInCallPresentationServiceInterfaceSpecification
+ (BSServiceInterface)interface;
+ (BSServiceQuality)serviceQuality;
+ (NSString)identifier;
@end

@implementation SBSInCallPresentationServiceInterfaceSpecification

+ (NSString)identifier
{
  return (NSString *)@"com.apple.springboard.in-call-presentation-service";
}

+ (BSServiceInterface)interface
{
  if (interface_onceToken != -1) {
    dispatch_once(&interface_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)interface___interface;
  return (BSServiceInterface *)v2;
}

void __63__SBSInCallPresentationServiceInterfaceSpecification_interface__block_invoke()
{
  id v3 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1EDF6BDB8];
  v0 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1EDF6BE18];
  uint64_t v1 = [MEMORY[0x1E4F50BD0] interfaceWithServer:v3 client:v0];
  v2 = (void *)interface___interface;
  interface___interface = v1;
}

+ (BSServiceQuality)serviceQuality
{
  return (BSServiceQuality *)[MEMORY[0x1E4F50BE0] userInitiated];
}

@end