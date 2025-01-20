@interface SSUSBApplication
+ (BOOL)_isSystemUIService;
+ (id)_systemUIServiceClientSettings;
+ (id)_systemUIServiceIdentifier;
@end

@implementation SSUSBApplication

+ (BOOL)_isSystemUIService
{
  return 1;
}

+ (id)_systemUIServiceClientSettings
{
  v2 = +[UIMutableApplicationSceneClientSettings settings];
  [v2 setPreferredLevel:UIScreenshotServicesWindowLevel + -1.0];
  return v2;
}

+ (id)_systemUIServiceIdentifier
{
  return @"com.apple.Sharing.SharingHUDService";
}

@end