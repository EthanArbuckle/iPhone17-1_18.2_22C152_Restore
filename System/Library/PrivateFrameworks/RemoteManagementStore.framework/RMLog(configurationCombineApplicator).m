@interface RMLog(configurationCombineApplicator)
+ (id)configurationCombineApplicator;
@end

@implementation RMLog(configurationCombineApplicator)

+ (id)configurationCombineApplicator
{
  if (configurationCombineApplicator_onceToken != -1) {
    dispatch_once(&configurationCombineApplicator_onceToken, &__block_literal_global_1);
  }
  v0 = (void *)configurationCombineApplicator_result;
  return v0;
}

@end