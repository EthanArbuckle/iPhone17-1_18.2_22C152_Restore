@interface PSMapsSettingsDetail
+ (id)preferencesURL;
@end

@implementation PSMapsSettingsDetail

+ (id)preferencesURL
{
  return (id)[MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=MAPS"];
}

@end