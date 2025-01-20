@interface _RETrueConstantComparisonCondition
+ (id)sharedInstance;
- (BOOL)_acceptsLeftFeatureMap:(id)a3 rightFeatureMap:(id)a4;
- (BOOL)_validForRanking;
- (id)_inflectionFeatureValuePairs;
- (id)_notCondition;
@end

@implementation _RETrueConstantComparisonCondition

- (BOOL)_validForRanking
{
  return 1;
}

- (id)_inflectionFeatureValuePairs
{
  return (id)[MEMORY[0x263EFFA08] set];
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_4 != -1) {
    dispatch_once(&sharedInstance_onceToken_4, &__block_literal_global_35);
  }
  v2 = (void *)sharedInstance_Condition_0;
  return v2;
}

- (id)_notCondition
{
  return +[_REFalseConstantComparisonCondition sharedInstance];
}

- (BOOL)_acceptsLeftFeatureMap:(id)a3 rightFeatureMap:(id)a4
{
  return 1;
}

@end