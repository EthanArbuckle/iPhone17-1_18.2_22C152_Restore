@interface RMLog(storeKeychainController)
+ (id)storeKeychainController;
@end

@implementation RMLog(storeKeychainController)

+ (id)storeKeychainController
{
  if (storeKeychainController_onceToken != -1) {
    dispatch_once(&storeKeychainController_onceToken, &__block_literal_global_12);
  }
  v0 = (void *)storeKeychainController_result;
  return v0;
}

@end