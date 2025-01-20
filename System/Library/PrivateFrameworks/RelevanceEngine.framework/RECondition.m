@interface RECondition
+ (id)andConditions:(id)a3;
+ (id)conditionForFeature:(id)a3 hasBoolValue:(BOOL)a4;
+ (id)conditionForFeature:(id)a3 hasIntegerValue:(int64_t)a4;
+ (id)conditionForFeature:(id)a3 hasValue:(id)a4;
+ (id)conditionForFeature:(id)a3 relation:(int64_t)a4 feature:(id)a5;
+ (id)conditionForFeature:(id)a3 relation:(int64_t)a4 floatValue:(float)a5;
+ (id)conditionForFeature:(id)a3 relation:(int64_t)a4 integerValue:(int64_t)a5;
+ (id)conditionForProbabilityForInteraction:(id)a3 relation:(int64_t)a4 feature:(id)a5;
+ (id)conditionForProbabilityForInteraction:(id)a3 relation:(int64_t)a4 floatValue:(float)a5;
+ (id)conditionForProbabilityWithRelation:(int64_t)a3 floatValue:(float)a4;
+ (id)conditionHasValueForFeature:(id)a3;
+ (id)falseCondition;
+ (id)notCondition:(id)a3;
+ (id)orConditions:(id)a3;
+ (id)trueCondition;
- (BOOL)_acceptsFeatureMap:(id)a3 predictionSet:(id)a4 explanation:(id *)a5;
- (BOOL)_acceptsLeftFeatureMap:(id)a3 rightFeatureMap:(id)a4;
- (BOOL)_needsProbability;
- (BOOL)_requiresTwoFeatures;
- (BOOL)_validForRanking;
- (id)_dependentFeatures;
- (id)_inflectionFeatureValuePairs;
@end

@implementation RECondition

+ (id)conditionForFeature:(id)a3 hasValue:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  REEnsureFeatureWithType(v6, 1uLL);
  v7 = +[REFeatureValue featureValueWithString:v5];

  v8 = (const void *)RECreateFeatureValueTaggedPointer(v7);
  v9 = [[_REValueRuleCondition alloc] initWithFeature:v6 relation:0 value:v8];

  RERetainFeatureValueTaggedPointer(v8);
  return v9;
}

- (BOOL)_validForRanking
{
  return 0;
}

- (id)_dependentFeatures
{
  return +[REFeatureSet featureSet];
}

+ (id)andConditions:(id)a3
{
  id v3 = a3;
  v4 = [_REAggregateRuleCondition alloc];
  if (v3) {
    id v5 = v3;
  }
  else {
    id v5 = (id)MEMORY[0x263EFFA68];
  }
  id v6 = [(_REAggregateRuleCondition *)v4 initWithConditions:v5 type:0];

  return v6;
}

+ (id)notCondition:(id)a3
{
  id v9 = a3;
  if (!v9) {
    RERaiseInternalException((void *)*MEMORY[0x263EFF4A0], @"Condition must be non-nil", v3, v4, v5, v6, v7, v8, v12);
  }
  v10 = [v9 _notCondition];

  return v10;
}

+ (id)conditionHasValueForFeature:(id)a3
{
  id v9 = a3;
  if (!v9) {
    RERaiseInternalException((void *)*MEMORY[0x263EFF4A0], @"Feature must be non-nil", v3, v4, v5, v6, v7, v8, v12);
  }
  v10 = [[_REHasFeatureRuleCondition alloc] initWithFeature:v9 contains:1];

  return v10;
}

+ (id)conditionForFeature:(id)a3 relation:(int64_t)a4 floatValue:(float)a5
{
  id v6 = a3;
  REEnsureFeatureWithType(v6, 2uLL);
  uint64_t v7 = (const void *)RECreateDoubleFeatureValueTaggedPointer();
  uint64_t v8 = [[_REValueRuleCondition alloc] initWithFeature:v6 relation:a4 value:v7];

  REReleaseFeatureValueTaggedPointer(v7);
  return v8;
}

+ (id)conditionForFeature:(id)a3 hasIntegerValue:(int64_t)a4
{
  id v5 = a3;
  REEnsureFeatureWithType(v5, 1uLL);
  id v6 = (const void *)RECreateIntegerFeatureValueTaggedPointer(a4);
  uint64_t v7 = [[_REValueRuleCondition alloc] initWithFeature:v5 relation:0 value:v6];

  REReleaseFeatureValueTaggedPointer(v6);
  return v7;
}

+ (id)orConditions:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [_REAggregateRuleCondition alloc];
  if (v3) {
    id v5 = v3;
  }
  else {
    id v5 = (id)MEMORY[0x263EFFA68];
  }
  id v6 = [(_REAggregateRuleCondition *)v4 initWithConditions:v5 type:1];

  return v6;
}

+ (id)conditionForFeature:(id)a3 hasBoolValue:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  REEnsureFeatureWithType(v5, 0);
  id v6 = (const void *)RECreateBooleanFeatureValueTaggedPointer(v4);
  uint64_t v7 = [[_REValueRuleCondition alloc] initWithFeature:v5 relation:0 value:v6];

  REReleaseFeatureValueTaggedPointer(v6);
  return v7;
}

+ (id)trueCondition
{
  return +[_RETrueConstantCondition sharedInstance];
}

+ (id)falseCondition
{
  return +[_REFalseConstantCondition sharedInstance];
}

+ (id)conditionForFeature:(id)a3 relation:(int64_t)a4 integerValue:(int64_t)a5
{
  id v7 = a3;
  REEnsureFeatureWithType(v7, 2uLL);
  uint64_t v8 = (const void *)RECreateIntegerFeatureValueTaggedPointer(a5);
  id v9 = [[_REValueRuleCondition alloc] initWithFeature:v7 relation:a4 value:v8];

  REReleaseFeatureValueTaggedPointer(v8);
  return v9;
}

+ (id)conditionForFeature:(id)a3 relation:(int64_t)a4 feature:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  REEnsureMatchingFeatureTypes(v8, v7);
  id v9 = [[_REFeatureRuleCondition alloc] initWithFeature:v8 relation:a4 feature:v7];

  return v9;
}

+ (id)conditionForProbabilityWithRelation:(int64_t)a3 floatValue:(float)a4
{
  return (id)objc_msgSend(a1, "conditionForProbabilityForInteraction:relation:floatValue:", 0, a3);
}

+ (id)conditionForProbabilityForInteraction:(id)a3 relation:(int64_t)a4 floatValue:(float)a5
{
  id v7 = a3;
  id v8 = [_REProbabilityRuleCondition alloc];
  *(float *)&double v9 = a5;
  v10 = [(_REProbabilityRuleCondition *)v8 initWithProbability:v7 relation:a4 feature:0 threshold:v9];

  return v10;
}

+ (id)conditionForProbabilityForInteraction:(id)a3 relation:(int64_t)a4 feature:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  REEnsureFeatureWithType(v7, 2uLL);
  double v9 = [[_REProbabilityRuleCondition alloc] initWithProbability:v8 relation:a4 feature:v7 threshold:0.0];

  return v9;
}

- (BOOL)_requiresTwoFeatures
{
  return 0;
}

- (BOOL)_needsProbability
{
  return 0;
}

- (BOOL)_acceptsFeatureMap:(id)a3 predictionSet:(id)a4 explanation:(id *)a5
{
  return 0;
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