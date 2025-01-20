@interface RMLog(profileStore)
+ (id)profileStore;
@end

@implementation RMLog(profileStore)

+ (id)profileStore
{
  if (profileStore_onceToken != -1) {
    dispatch_once(&profileStore_onceToken, &__block_literal_global_9);
  }
  v0 = (void *)profileStore_result;
  return v0;
}

@end