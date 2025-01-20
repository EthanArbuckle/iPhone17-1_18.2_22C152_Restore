@interface PSFaceTimeSettingsDetail
+ (id)preferencesURL;
@end

@implementation PSFaceTimeSettingsDetail

+ (id)preferencesURL
{
  return (id)[MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=FACETIME"];
}

@end