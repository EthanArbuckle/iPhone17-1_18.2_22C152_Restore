@interface PXInternalSettingsDiagnosticsService
- (BOOL)canPerformAction;
- (id)title;
- (void)performAction;
@end

@implementation PXInternalSettingsDiagnosticsService

- (void)performAction
{
  Class v2 = NSClassFromString(&cfstr_Purootsettings.isa);
  SEL v3 = NSSelectorFromString(&cfstr_Presentsetting.isa);
  [(objc_class *)v2 performSelector:v3];
}

- (BOOL)canPerformAction
{
  Class v2 = +[PXDiagnosticsSettings sharedInstance];
  char v3 = [v2 enableInternalSettingsService];

  return v3;
}

- (id)title
{
  return @"Internal Settings";
}

@end