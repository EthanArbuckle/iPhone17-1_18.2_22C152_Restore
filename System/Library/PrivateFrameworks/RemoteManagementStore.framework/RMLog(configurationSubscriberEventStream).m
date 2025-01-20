@interface RMLog(configurationSubscriberEventStream)
+ (id)configurationSubscriberEventStream;
@end

@implementation RMLog(configurationSubscriberEventStream)

+ (id)configurationSubscriberEventStream
{
  if (configurationSubscriberEventStream_onceToken != -1) {
    dispatch_once(&configurationSubscriberEventStream_onceToken, &__block_literal_global_7);
  }
  v0 = (void *)configurationSubscriberEventStream_result;
  return v0;
}

@end