@interface NSUserDefaults(WLKAdditions)
+ (id)wlk_userDefaults;
@end

@implementation NSUserDefaults(WLKAdditions)

+ (id)wlk_userDefaults
{
  if (wlk_userDefaults_onceToken != -1) {
    dispatch_once(&wlk_userDefaults_onceToken, &__block_literal_global_58_0);
  }
  v0 = (void *)wlk_userDefaults___wlkDefaults;

  return v0;
}

@end