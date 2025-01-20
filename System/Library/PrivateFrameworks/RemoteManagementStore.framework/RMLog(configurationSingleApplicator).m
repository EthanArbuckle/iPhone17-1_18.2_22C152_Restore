@interface RMLog(configurationSingleApplicator)
+ (id)configurationSingleApplicator;
@end

@implementation RMLog(configurationSingleApplicator)

+ (id)configurationSingleApplicator
{
  if (configurationSingleApplicator_onceToken != -1) {
    dispatch_once(&configurationSingleApplicator_onceToken, &__block_literal_global_3);
  }
  v0 = (void *)configurationSingleApplicator_result;
  return v0;
}

@end