@interface SBApplicationLaunchAlertEvaluatorFactory
+ (id)defaultApplicationLaunchAlertEvaluators;
@end

@implementation SBApplicationLaunchAlertEvaluatorFactory

+ (id)defaultApplicationLaunchAlertEvaluators
{
  if (defaultApplicationLaunchAlertEvaluators___once != -1) {
    dispatch_once(&defaultApplicationLaunchAlertEvaluators___once, &__block_literal_global_276);
  }
  v2 = (void *)defaultApplicationLaunchAlertEvaluators___evaluators;
  return v2;
}

void __83__SBApplicationLaunchAlertEvaluatorFactory_defaultApplicationLaunchAlertEvaluators__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v1 = (void *)defaultApplicationLaunchAlertEvaluators___evaluators;
  defaultApplicationLaunchAlertEvaluators___evaluators = (uint64_t)v0;

  v2 = (void *)defaultApplicationLaunchAlertEvaluators___evaluators;
  v3 = objc_alloc_init(SBApplicationLaunchAlertEvaluatorForNetworkBasedAlertItems);
  [v2 addObject:v3];
}

@end