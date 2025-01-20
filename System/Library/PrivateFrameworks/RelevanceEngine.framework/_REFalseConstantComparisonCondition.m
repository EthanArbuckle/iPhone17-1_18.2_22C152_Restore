@interface _REFalseConstantComparisonCondition
+ (id)sharedInstance;
- (BOOL)_acceptsLeftFeatureMap:(id)a3 rightFeatureMap:(id)a4;
- (BOOL)_validForRanking;
- (id)_inflectionFeatureValuePairs;
- (id)_notCondition;
@end

@implementation _REFalseConstantComparisonCondition

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_12 != -1) {
    dispatch_once(&sharedInstance_onceToken_12, &__block_literal_global_14_1);
  }
  v2 = (void *)sharedInstance_Condition_11;
  return v2;
}

- (id)_notCondition
{
  return +[_RETrueConstantComparisonCondition sharedInstance];
}

- (BOOL)_validForRanking
{
  return 1;
}

- (BOOL)_acceptsLeftFeatureMap:(id)a3 rightFeatureMap:(id)a4
{
  return 0;
}

- (id)_inflectionFeatureValuePairs
{
  return (id)[MEMORY[0x263EFFA08] set];
}

@end