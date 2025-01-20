@interface PSMusicSettingsDetail
+ (id)preferencesURL;
@end

@implementation PSMusicSettingsDetail

+ (id)preferencesURL
{
  return (id)[MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=MUSIC"];
}

@end