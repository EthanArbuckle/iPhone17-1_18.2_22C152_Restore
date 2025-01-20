@interface RMLog(configurationSubscriberDelegate)
+ (id)configurationSubscriberDelegate;
@end

@implementation RMLog(configurationSubscriberDelegate)

+ (id)configurationSubscriberDelegate
{
  if (configurationSubscriberDelegate_onceToken != -1) {
    dispatch_once(&configurationSubscriberDelegate_onceToken, &__block_literal_global_5);
  }
  v0 = (void *)configurationSubscriberDelegate_result;
  return v0;
}

@end