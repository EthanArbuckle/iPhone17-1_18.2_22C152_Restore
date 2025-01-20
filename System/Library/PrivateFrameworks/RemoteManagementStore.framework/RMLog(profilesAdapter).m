@interface RMLog(profilesAdapter)
+ (id)profilesAdapter;
@end

@implementation RMLog(profilesAdapter)

+ (id)profilesAdapter
{
  if (profilesAdapter_onceToken != -1) {
    dispatch_once(&profilesAdapter_onceToken, &__block_literal_global_14);
  }
  v0 = (void *)profilesAdapter_result;
  return v0;
}

@end