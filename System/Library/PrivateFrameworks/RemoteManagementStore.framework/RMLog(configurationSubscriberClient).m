@interface RMLog(configurationSubscriberClient)
+ (id)configurationSubscriberClient;
@end

@implementation RMLog(configurationSubscriberClient)

+ (id)configurationSubscriberClient
{
  if (configurationSubscriberClient_onceToken != -1) {
    dispatch_once(&configurationSubscriberClient_onceToken, &__block_literal_global_4);
  }
  v0 = (void *)configurationSubscriberClient_result;
  return v0;
}

@end