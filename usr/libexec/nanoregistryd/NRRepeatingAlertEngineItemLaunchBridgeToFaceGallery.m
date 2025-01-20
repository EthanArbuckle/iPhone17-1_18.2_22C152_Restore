@interface NRRepeatingAlertEngineItemLaunchBridgeToFaceGallery
+ (id)launchURL;
- (void)alternateButtonWasPressed;
@end

@implementation NRRepeatingAlertEngineItemLaunchBridgeToFaceGallery

+ (id)launchURL
{
  return @"facegallery://";
}

- (void)alternateButtonWasPressed
{
  CFPreferencesSetAppValue(@"kShouldJumpToFaceGalleryKey", kCFBooleanTrue, @"com.apple.Bridge");

  CFPreferencesAppSynchronize(@"com.apple.Bridge");
}

@end