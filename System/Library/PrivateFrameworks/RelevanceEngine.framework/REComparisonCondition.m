@interface REComparisonCondition
+ (id)conditionForLeftFeature:(id)a3 relation:(int64_t)a4 rightFeature:(id)a5;
+ (id)falseCondition;
+ (id)trueCondition;
- (BOOL)_validForRanking;
- (id)_inflectionFeatureValuePairs;
@end

@implementation REComparisonCondition

+ (id)trueCondition
{
  return +[_RETrueConstantComparisonCondition sharedInstance];
}

+ (id)conditionForLeftFeature:(id)a3 relation:(int64_t)a4 rightFeature:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  REEnsureMatchingFeatureTypes(v8, v7);
  v9 = [[_REFeatureComparisonCondition alloc] initWithLeftFeature:v8 relation:a4 rightFeature:v7];

  return v9;
}

+ (id)falseCondition
{
  return +[_REFalseConstantComparisonCondition sharedInstance];
}

- (BOOL)_validForRanking
{
  return 1;
}

- (id)_inflectionFeatureValuePairs
{
  return (id)[MEMORY[0x263EFFA08] set];
}

@end