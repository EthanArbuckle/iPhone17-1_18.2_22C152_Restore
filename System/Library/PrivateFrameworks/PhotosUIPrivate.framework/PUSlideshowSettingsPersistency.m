@interface PUSlideshowSettingsPersistency
+ (id)createSlideshowSettingsViewModel;
+ (void)saveSlideshowSettingsViewModel:(id)a3;
@end

@implementation PUSlideshowSettingsPersistency

+ (void)saveSlideshowSettingsViewModel:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CB18];
  id v4 = a3;
  id v6 = [v3 standardUserDefaults];
  v5 = [v4 propertyDictionary];

  [v6 setObject:v5 forKey:@"PUSlideshowSettingsManagerSettingsUserDefaultsKey"];
  [v6 synchronize];
}

+ (id)createSlideshowSettingsViewModel
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v3 = [v2 objectForKey:@"PUSlideshowSettingsManagerSettingsUserDefaultsKey"];
  id v4 = [[PUSlideshowSettingsViewModel alloc] initWithPropertyDictionary:v3];

  return v4;
}

@end