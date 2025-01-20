@interface NSUbiquitousKeyValueStore(WeatherCore)
+ (id)wc_sharedInstance;
@end

@implementation NSUbiquitousKeyValueStore(WeatherCore)

+ (id)wc_sharedInstance
{
  if (wc_sharedInstance_onceToken != -1) {
    dispatch_once(&wc_sharedInstance_onceToken, &__block_literal_global_0);
  }
  v0 = (void *)wc_sharedInstance_sSharedInstance;
  return v0;
}

@end