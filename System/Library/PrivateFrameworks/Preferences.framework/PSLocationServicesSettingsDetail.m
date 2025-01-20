@interface PSLocationServicesSettingsDetail
+ (BOOL)isEnabled;
+ (id)iconImage;
+ (id)preferencesURL;
+ (void)setEnabled:(BOOL)a3;
@end

@implementation PSLocationServicesSettingsDetail

+ (id)preferencesURL
{
  return (id)[MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=Privacy&path=LOCATION"];
}

+ (void)setEnabled:(BOOL)a3
{
}

+ (BOOL)isEnabled
{
  return [MEMORY[0x1E4F1E600] locationServicesEnabled];
}

+ (id)iconImage
{
  return 0;
}

@end