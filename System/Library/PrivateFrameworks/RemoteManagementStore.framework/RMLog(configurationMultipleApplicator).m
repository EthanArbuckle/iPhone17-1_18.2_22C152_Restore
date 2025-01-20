@interface RMLog(configurationMultipleApplicator)
+ (id)configurationMultipleApplicator;
@end

@implementation RMLog(configurationMultipleApplicator)

+ (id)configurationMultipleApplicator
{
  if (configurationMultipleApplicator_onceToken != -1) {
    dispatch_once(&configurationMultipleApplicator_onceToken, &__block_literal_global_2);
  }
  v0 = (void *)configurationMultipleApplicator_result;
  return v0;
}

@end