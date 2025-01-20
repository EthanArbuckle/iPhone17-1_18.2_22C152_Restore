@interface PSNotesSettingsDetail
+ (id)preferencesURL;
@end

@implementation PSNotesSettingsDetail

+ (id)preferencesURL
{
  return (id)[MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=NOTES"];
}

@end