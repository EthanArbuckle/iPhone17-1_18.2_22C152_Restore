@interface PSDUETSettingsDetail
+ (id)preferencesURL;
@end

@implementation PSDUETSettingsDetail

+ (id)preferencesURL
{
  return (id)[MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=General&path=AUTO_CONTENT_DOWNLOAD"];
}

@end