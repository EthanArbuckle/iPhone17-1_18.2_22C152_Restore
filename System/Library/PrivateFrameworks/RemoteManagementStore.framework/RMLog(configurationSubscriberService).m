@interface RMLog(configurationSubscriberService)
+ (id)configurationSubscriberService;
@end

@implementation RMLog(configurationSubscriberService)

+ (id)configurationSubscriberService
{
  if (configurationSubscriberService_onceToken != -1) {
    dispatch_once(&configurationSubscriberService_onceToken, &__block_literal_global_8);
  }
  v0 = (void *)configurationSubscriberService_result;
  return v0;
}

@end