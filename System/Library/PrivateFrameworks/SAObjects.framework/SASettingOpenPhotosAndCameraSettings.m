@interface SASettingOpenPhotosAndCameraSettings
+ (id)openPhotosAndCameraSettings;
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SASettingOpenPhotosAndCameraSettings

- (id)groupIdentifier
{
  return @"com.apple.ace.setting";
}

- (id)encodedClassName
{
  return @"OpenPhotosAndCameraSettings";
}

+ (id)openPhotosAndCameraSettings
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)requiresResponse
{
  return 0;
}

@end