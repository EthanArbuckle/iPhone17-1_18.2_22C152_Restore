@interface RMLog(profilesController)
+ (id)profilesController;
@end

@implementation RMLog(profilesController)

+ (id)profilesController
{
  if (profilesController_onceToken != -1) {
    dispatch_once(&profilesController_onceToken, &__block_literal_global_15);
  }
  v0 = (void *)profilesController_result;
  return v0;
}

@end