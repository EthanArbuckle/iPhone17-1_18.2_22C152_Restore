@interface RMLog(statusPublisherDescription)
+ (id)statusPublisherDescription;
@end

@implementation RMLog(statusPublisherDescription)

+ (id)statusPublisherDescription
{
  if (statusPublisherDescription_onceToken != -1) {
    dispatch_once(&statusPublisherDescription_onceToken, &__block_literal_global_11);
  }
  v0 = (void *)statusPublisherDescription_result;
  return v0;
}

@end