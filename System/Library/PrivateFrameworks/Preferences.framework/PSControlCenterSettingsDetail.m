@interface PSControlCenterSettingsDetail
+ (id)preferencesURL;
@end

@implementation PSControlCenterSettingsDetail

+ (id)preferencesURL
{
  return (id)[MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=ControlCenter"];
}

@end