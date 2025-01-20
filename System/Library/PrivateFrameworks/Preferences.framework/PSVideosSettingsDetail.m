@interface PSVideosSettingsDetail
+ (id)preferencesURL;
@end

@implementation PSVideosSettingsDetail

+ (id)preferencesURL
{
  return (id)[MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=VIDEO"];
}

@end