@interface ZhuGeKeysConfigArmory
+ (id)getConfig;
@end

@implementation ZhuGeKeysConfigArmory

+ (id)getConfig
{
  if (getConfigDict_aToken != -1) {
    dispatch_once(&getConfigDict_aToken, &__block_literal_global_3);
  }
  v2 = (void *)getConfigDict_aDict;
  return v2;
}

@end