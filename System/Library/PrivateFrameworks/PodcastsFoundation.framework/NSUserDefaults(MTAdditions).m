@interface NSUserDefaults(MTAdditions)
+ (id)_applePodcastsFoundationSettingsUserDefaults;
+ (id)_applePodcastsFoundationSharedUserDefaults;
+ (uint64_t)settingsAppWritesDirectlyToSharedUserDefaults;
+ (uint64_t)shouldReadSettingsFromSharedUserDefaults;
@end

@implementation NSUserDefaults(MTAdditions)

+ (id)_applePodcastsFoundationSettingsUserDefaults
{
  v2 = [MEMORY[0x1E4F1CB18] appUserDefaultsForUnitTesting];

  if (v2)
  {
    v3 = [MEMORY[0x1E4F1CB18] appUserDefaultsForUnitTesting];
  }
  else
  {
    if ([a1 shouldReadSettingsFromSharedUserDefaults]) {
      [MEMORY[0x1E4F1CB18] _applePodcastsFoundationSharedUserDefaults];
    }
    else {
    v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    }
  }
  return v3;
}

+ (id)_applePodcastsFoundationSharedUserDefaults
{
  if (_applePodcastsFoundationSharedUserDefaults_onceToken != -1) {
    dispatch_once(&_applePodcastsFoundationSharedUserDefaults_onceToken, &__block_literal_global_1);
  }
  v0 = (void *)_applePodcastsFoundationSharedUserDefaults_defaults;
  return v0;
}

+ (uint64_t)shouldReadSettingsFromSharedUserDefaults
{
  if ([a1 settingsAppWritesDirectlyToSharedUserDefaults]) {
    return 1;
  }
  else {
    return +[PFClientUtil isPodcastsApp] ^ 1;
  }
}

+ (uint64_t)settingsAppWritesDirectlyToSharedUserDefaults
{
  return 1;
}

@end