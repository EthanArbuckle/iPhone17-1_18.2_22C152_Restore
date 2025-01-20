@interface STDevicePINFactory
+ (Class)devicePINControllerForPlatform;
+ (Class)devicePINPaneForPlatform;
@end

@implementation STDevicePINFactory

+ (Class)devicePINPaneForPlatform
{
  return (Class)objc_opt_class();
}

+ (Class)devicePINControllerForPlatform
{
  return (Class)objc_opt_class();
}

@end