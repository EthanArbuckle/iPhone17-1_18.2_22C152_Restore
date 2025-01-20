@interface RMLog(statusPublisherDelegate)
+ (id)statusPublisherDelegate;
@end

@implementation RMLog(statusPublisherDelegate)

+ (id)statusPublisherDelegate
{
  if (statusPublisherDelegate_onceToken != -1) {
    dispatch_once(&statusPublisherDelegate_onceToken, &__block_literal_global_10);
  }
  v0 = (void *)statusPublisherDelegate_result;
  return v0;
}

@end