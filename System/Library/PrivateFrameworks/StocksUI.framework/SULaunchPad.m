@interface SULaunchPad
+ (void)launchSettings;
+ (void)openStocksSettings;
@end

@implementation SULaunchPad

+ (void)launchSettings
{
  id v2 = (id)objc_opt_new();
  [v2 openApplication:@"com.apple.Preferences" options:0 withResult:0];
}

+ (void)openStocksSettings
{
  id v3 = [MEMORY[0x263F01880] defaultWorkspace];
  id v2 = [NSURL URLWithString:@"prefs:root=STOCKS"];
  [v3 openSensitiveURL:v2 withOptions:0];
}

@end