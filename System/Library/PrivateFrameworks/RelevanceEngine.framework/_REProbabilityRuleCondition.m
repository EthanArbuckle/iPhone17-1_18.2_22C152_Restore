@interface _REProbabilityRuleCondition
- (BOOL)_acceptsFeatureMap:(id)a3 predictionSet:(id)a4 explanation:(id *)a5;
- (BOOL)_needsProbability;
- (BOOL)isEqual:(id)a3;
- (NSString)interaction;
- (REFeature)feature;
- (_REProbabilityRuleCondition)initWithProbability:(id)a3 relation:(int64_t)a4 feature:(id)a5 threshold:(float)a6;
- (float)threshold;
- (id)_dependentFeatures;
- (id)_inflectionFeatureValuePairs;
- (id)_notCondition;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)relation;
- (unint64_t)hash;
@end

@implementation _REProbabilityRuleCondition

- (_REProbabilityRuleCondition)initWithProbability:(id)a3 relation:(int64_t)a4 feature:(id)a5 threshold:(float)a6
{
  id v11 = a3;
  id v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)_REProbabilityRuleCondition;
  v13 = [(_REProbabilityRuleCondition *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_interaction, a3);
    v14->_relation = a4;
    objc_storeStrong((id *)&v14->_feature, a5);
    v14->_threshold = a6;
  }

  return v14;
}

- (id)_dependentFeatures
{
  if (self->_feature) {
    +[REFeatureSet featureSetWithFeature:](REFeatureSet, "featureSetWithFeature:");
  }
  else {
  v2 = +[REFeatureSet featureSet];
  }
  return v2;
}

- (BOOL)_needsProbability
{
  return 1;
}

- (id)_notCondition
{
  v3 = [_REProbabilityRuleCondition alloc];
  interaction = self->_interaction;
  uint64_t v5 = REInvertRelation(self->_relation);
  *(float *)&double v6 = self->_threshold;
  v7 = [(_REProbabilityRuleCondition *)v3 initWithProbability:interaction relation:v5 feature:self->_feature threshold:v6];
  return v7;
}

- (BOOL)_acceptsFeatureMap:(id)a3 predictionSet:(id)a4 explanation:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (self->_interaction) {
    objc_msgSend(v9, "predictionForKey:");
  }
  else {
  id v11 = [v9 prediction];
  }
  [v11 probability];

  if (self->_feature)
  {
    if (!objc_msgSend(v8, "hasValueForFeature:"))
    {
      LOBYTE(relation) = 0;
      goto LABEL_25;
    }
    id v12 = (void *)[v8 valueForFeature:self->_feature];
    RERetainFeatureValueTaggedPointer(v12);
  }
  else
  {
    id v12 = (void *)RECreateDoubleFeatureValueTaggedPointer();
  }
  v13 = (const void *)RECreateDoubleFeatureValueTaggedPointer();
  int64_t relation = self->_relation;
  uint64_t v15 = RECompareFeatureValues((unint64_t)v13, v12);
  switch(relation)
  {
    case -2:
      BOOL v16 = v15 == -1;
      goto LABEL_15;
    case -1:
      BOOL v17 = v15 == 1;
      goto LABEL_19;
    case 0:
      BOOL v16 = v15 == 0;
      goto LABEL_15;
    case 1:
      BOOL v17 = v15 == -1;
      goto LABEL_19;
    case 2:
      BOOL v16 = v15 == 1;
LABEL_15:
      LOBYTE(relation) = v16;
      break;
    case 4:
      BOOL v17 = v15 == 0;
LABEL_19:
      LOBYTE(relation) = !v17;
      break;
    default:
      break;
  }
  REReleaseFeatureValueTaggedPointer(v12);
  REReleaseFeatureValueTaggedPointer(v13);
  if (a5 && (relation & 1) != 0)
  {
    *a5 = +[REMLExplanation explanationForCondition:self];
    LOBYTE(relation) = 1;
  }
LABEL_25:

  return relation & 1;
}

- (id)_inflectionFeatureValuePairs
{
  v2 = (void *)MEMORY[0x263EFFA08];
  if (self->_feature)
  {
    v3 = [[REFeatureValuePair alloc] initWithFeature:self->_feature value:0];
    v4 = [v2 setWithObject:v3];
  }
  else
  {
    v4 = [MEMORY[0x263EFFA08] set];
  }
  return v4;
}

- (unint64_t)hash
{
  NSUInteger v3 = self->_relation ^ [(NSString *)self->_interaction hash];
  unint64_t v4 = v3 ^ [(REFeature *)self->_feature hash];
  *(float *)&double v5 = self->_threshold;
  double v6 = [NSNumber numberWithFloat:v5];
  unint64_t v7 = v4 ^ [v6 hash];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (_REProbabilityRuleCondition *)a3;
  if (self == v4)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v5 = v4;
      interaction = self->_interaction;
      unint64_t v7 = v5->_interaction;
      if (interaction == v7)
      {
      }
      else
      {
        id v8 = v7;
        id v9 = interaction;
        int v10 = [(NSString *)v9 isEqual:v8];

        if (!v10) {
          goto LABEL_15;
        }
      }
      feature = self->_feature;
      v13 = v5->_feature;
      if (feature == v13)
      {
      }
      else
      {
        v14 = v13;
        uint64_t v15 = feature;
        BOOL v16 = [(REFeature *)v15 isEqual:v14];

        if (!v16) {
          goto LABEL_15;
        }
      }
      if (self->_relation == v5->_relation)
      {
        BOOL v11 = RERelevanceEqualToRelevance(self->_threshold, v5->_threshold);
LABEL_16:

        goto LABEL_17;
      }
LABEL_15:
      BOOL v11 = 0;
      goto LABEL_16;
    }
    BOOL v11 = 0;
  }
LABEL_17:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  interaction = self->_interaction;
  int64_t relation = self->_relation;
  feature = self->_feature;
  *(float *)&double v8 = self->_threshold;
  return (id)[v4 initWithProbability:interaction relation:relation feature:feature threshold:v8];
}

- (NSString)interaction
{
  return self->_interaction;
}

- (REFeature)feature
{
  return self->_feature;
}

- (int64_t)relation
{
  return self->_relation;
}

- (float)threshold
{
  return self->_threshold;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feature, 0);
  objc_storeStrong((id *)&self->_interaction, 0);
}

@end