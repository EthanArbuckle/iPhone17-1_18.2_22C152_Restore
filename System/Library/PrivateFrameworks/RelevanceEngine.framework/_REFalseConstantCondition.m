@interface _REFalseConstantCondition
+ (id)sharedInstance;
- (BOOL)_acceptsFeatureMap:(id)a3 predictionSet:(id)a4 explanation:(id *)a5;
- (id)_inflectionFeatureValuePairs;
- (id)_notCondition;
@end

@implementation _REFalseConstantCondition

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_11 != -1) {
    dispatch_once(&sharedInstance_onceToken_11, &__block_literal_global_13);
  }
  v2 = (void *)sharedInstance_Condition_10;
  return v2;
}

- (id)_notCondition
{
  return +[_RETrueConstantCondition sharedInstance];
}

- (BOOL)_acceptsFeatureMap:(id)a3 predictionSet:(id)a4 explanation:(id *)a5
{
  return 0;
}

- (id)_inflectionFeatureValuePairs
{
  return (id)[MEMORY[0x263EFFA08] set];
}

@end