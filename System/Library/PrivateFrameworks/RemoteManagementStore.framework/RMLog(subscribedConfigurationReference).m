@interface RMLog(subscribedConfigurationReference)
+ (id)subscribedConfigurationReference;
@end

@implementation RMLog(subscribedConfigurationReference)

+ (id)subscribedConfigurationReference
{
  if (subscribedConfigurationReference_onceToken != -1) {
    dispatch_once(&subscribedConfigurationReference_onceToken, &__block_literal_global_16);
  }
  v0 = (void *)subscribedConfigurationReference_result;
  return v0;
}

@end