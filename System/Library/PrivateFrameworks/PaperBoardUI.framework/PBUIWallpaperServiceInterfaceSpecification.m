@interface PBUIWallpaperServiceInterfaceSpecification
+ (BSServiceInterface)interface;
+ (BSServiceQuality)serviceQuality;
+ (NSString)identifier;
@end

@implementation PBUIWallpaperServiceInterfaceSpecification

+ (NSString)identifier
{
  v2 = [a1 interface];
  v3 = [v2 identifier];

  return (NSString *)v3;
}

+ (BSServiceInterface)interface
{
  if (interface_onceToken != -1) {
    dispatch_once(&interface_onceToken, &__block_literal_global_25);
  }
  v2 = (void *)interface___interface;
  return (BSServiceInterface *)v2;
}

void __55__PBUIWallpaperServiceInterfaceSpecification_interface__block_invoke()
{
  id v4 = [MEMORY[0x1E4F50B98] interfaceWithIdentifier:@"com.apple.paperboard.wallpaper-service"];
  v0 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1F165AB50];
  [v4 setServer:v0];

  v1 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1F16686D8];
  [v4 setClient:v1];

  uint64_t v2 = [v4 copy];
  v3 = (void *)interface___interface;
  interface___interface = v2;
}

+ (BSServiceQuality)serviceQuality
{
  return (BSServiceQuality *)[MEMORY[0x1E4F50BE0] userInitiated];
}

@end