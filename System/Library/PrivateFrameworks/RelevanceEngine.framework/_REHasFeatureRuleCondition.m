@interface _REHasFeatureRuleCondition
- (BOOL)_acceptsFeatureMap:(id)a3 predictionSet:(id)a4 explanation:(id *)a5;
- (BOOL)contains;
- (BOOL)isEqual:(id)a3;
- (REFeature)feature;
- (_REHasFeatureRuleCondition)initWithFeature:(id)a3 contains:(BOOL)a4;
- (id)_dependentFeatures;
- (id)_inflectionFeatureValuePairs;
- (id)_notCondition;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation _REHasFeatureRuleCondition

- (unint64_t)hash
{
  return [(REFeature *)self->_feature hash] ^ self->_contains;
}

- (void).cxx_destruct
{
}

- (id)_inflectionFeatureValuePairs
{
  return (id)[MEMORY[0x263EFFA08] set];
}

- (id)_dependentFeatures
{
  return +[REFeatureSet featureSetWithFeature:self->_feature];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_REHasFeatureRuleCondition *)a3;
  if (self == v4)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      feature = self->_feature;
      v7 = v5->_feature;
      if (feature == v7)
      {
      }
      else
      {
        v8 = v7;
        v9 = feature;
        BOOL v10 = [(REFeature *)v9 isEqual:v8];

        if (!v10)
        {
          BOOL v11 = 0;
LABEL_10:

          goto LABEL_11;
        }
      }
      BOOL v11 = self->_contains == v5->_contains;
      goto LABEL_10;
    }
    BOOL v11 = 0;
  }
LABEL_11:

  return v11;
}

- (_REHasFeatureRuleCondition)initWithFeature:(id)a3 contains:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_REHasFeatureRuleCondition;
  v8 = [(_REHasFeatureRuleCondition *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_feature, a3);
    v9->_contains = a4;
  }

  return v9;
}

- (id)_notCondition
{
  v2 = [[_REHasFeatureRuleCondition alloc] initWithFeature:self->_feature contains:!self->_contains];
  return v2;
}

- (BOOL)_acceptsFeatureMap:(id)a3 predictionSet:(id)a4 explanation:(id *)a5
{
  int v7 = objc_msgSend(a3, "hasValueForFeature:", self->_feature, a4);
  int v8 = v7;
  int contains = self->_contains;
  if (a5 && contains == v7)
  {
    *a5 = +[REMLExplanation explanationForCondition:self];
  }
  return contains == v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  feature = self->_feature;
  BOOL contains = self->_contains;
  return (id)[v4 initWithFeature:feature contains:contains];
}

- (REFeature)feature
{
  return self->_feature;
}

- (BOOL)contains
{
  return self->_contains;
}

@end