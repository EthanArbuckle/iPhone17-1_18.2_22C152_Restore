@interface SBSUIWallpaperServiceInterfaceSpecification
+ (BSServiceInterface)interface;
+ (BSServiceQuality)serviceQuality;
+ (NSString)identifier;
@end

@implementation SBSUIWallpaperServiceInterfaceSpecification

+ (NSString)identifier
{
  return (NSString *)@"com.apple.paperboard.wallpaper-service";
}

+ (BSServiceInterface)interface
{
  if (interface_onceToken_0 != -1) {
    dispatch_once(&interface_onceToken_0, &__block_literal_global_19);
  }
  v2 = (void *)interface___interface_0;
  return (BSServiceInterface *)v2;
}

void __56__SBSUIWallpaperServiceInterfaceSpecification_interface__block_invoke()
{
  id v3 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1EFD5AEA0];
  v0 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1EFD5AF00];
  uint64_t v1 = [MEMORY[0x1E4F628A8] interfaceWithServer:v3 client:v0];
  v2 = (void *)interface___interface_0;
  interface___interface_0 = v1;
}

+ (BSServiceQuality)serviceQuality
{
  return (BSServiceQuality *)[MEMORY[0x1E4F628B0] userInitiated];
}

@end