@interface PSCastleSettingsDetail
+ (id)preferencesURL;
@end

@implementation PSCastleSettingsDetail

+ (id)preferencesURL
{
  return (id)[MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=CASTLE"];
}

@end