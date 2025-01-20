@interface PGBackgroundPIPServiceSpecification
+ (BSServiceInterface)interface;
+ (BSServiceQuality)serviceQuality;
+ (NSString)identifier;
@end

@implementation PGBackgroundPIPServiceSpecification

+ (NSString)identifier
{
  return (NSString *)@"com.apple.pegasus.background-pip-service";
}

+ (BSServiceInterface)interface
{
  if (interface_onceToken != -1) {
    dispatch_once(&interface_onceToken, &__block_literal_global_10);
  }
  v2 = (void *)interface___interface;

  return (BSServiceInterface *)v2;
}

void __48__PGBackgroundPIPServiceSpecification_interface__block_invoke()
{
  id v3 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1F0E75F88];
  v0 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1F0E74B18];
  uint64_t v1 = [MEMORY[0x1E4F628A8] interfaceWithServer:v3 client:v0];
  v2 = (void *)interface___interface;
  interface___interface = v1;
}

+ (BSServiceQuality)serviceQuality
{
  return (BSServiceQuality *)[MEMORY[0x1E4F628B0] userInitiated];
}

@end