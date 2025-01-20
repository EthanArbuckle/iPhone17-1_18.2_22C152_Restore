@interface TSLaunchPad
+ (void)launchSettings;
@end

@implementation TSLaunchPad

+ (void)launchSettings
{
  id v2 = (id)objc_opt_new();
  [v2 openApplication:@"com.apple.Preferences" options:0 withResult:0];
}

@end