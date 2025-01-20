@interface PSStoreSettingsDetail
+ (id)preferencesURL;
@end

@implementation PSStoreSettingsDetail

+ (id)preferencesURL
{
  return (id)[MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=STORE"];
}

@end