@interface _REValueRuleCondition
- (BOOL)_acceptsFeatureMap:(id)a3 predictionSet:(id)a4 explanation:(id *)a5;
- (BOOL)isEqual:(id)a3;
- (REFeature)feature;
- (_REValueRuleCondition)initWithFeature:(id)a3 relation:(int64_t)a4 value:(unint64_t)a5;
- (id)_dependentFeatures;
- (id)_inflectionFeatureValuePairs;
- (id)_notCondition;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)relation;
- (unint64_t)hash;
- (unint64_t)value;
- (void)dealloc;
@end

@implementation _REValueRuleCondition

- (unint64_t)hash
{
  unint64_t v3 = self->_relation ^ [(REFeature *)self->_feature hash];
  return v3 ^ REFeatureValueHashForTaggedPointer(self->_value);
}

- (void).cxx_destruct
{
}

- (id)_inflectionFeatureValuePairs
{
  v2 = (void *)MEMORY[0x263EFFA08];
  unint64_t v3 = [[REFeatureValuePair alloc] initWithFeature:self->_feature value:self->_value];
  v4 = [v2 setWithObject:v3];

  return v4;
}

- (id)_dependentFeatures
{
  return +[REFeatureSet featureSetWithFeature:self->_feature];
}

- (_REValueRuleCondition)initWithFeature:(id)a3 relation:(int64_t)a4 value:(unint64_t)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_REValueRuleCondition;
  v10 = [(_REValueRuleCondition *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_feature, a3);
    v11->_relation = a4;
    v11->_value = a5;
    RERetainFeatureValueTaggedPointer((CFTypeRef)a5);
    v11->_allowsEmptyValueForFeature = 0;
  }

  return v11;
}

- (id)_notCondition
{
  unint64_t v3 = [[_REValueRuleCondition alloc] initWithFeature:self->_feature relation:REInvertRelation(self->_relation) value:self->_value];
  v3->_allowsEmptyValueForFeature = !self->_allowsEmptyValueForFeature;
  return v3;
}

- (void)dealloc
{
  REReleaseFeatureValueTaggedPointer((CFTypeRef)self->_value);
  v3.receiver = self;
  v3.super_class = (Class)_REValueRuleCondition;
  [(_REValueRuleCondition *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_REValueRuleCondition *)a3;
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
        id v9 = feature;
        BOOL v10 = [(REFeature *)v9 isEqual:v8];

        if (!v10) {
          goto LABEL_13;
        }
      }
      unint64_t value = self->_value;
      unint64_t v13 = v5->_value;
      if (value == v13) {
        goto LABEL_10;
      }
      uint64_t v14 = REFeatureValueTypeForTaggedPointer(self->_value);
      if (v14 == REFeatureValueTypeForTaggedPointer(v13))
      {
        v15 = REFeatureValueForTaggedPointer(value);
        v16 = REFeatureValueForTaggedPointer(v13);
        int v17 = [v15 isEqual:v16];

        if (v17)
        {
LABEL_10:
          BOOL v11 = self->_relation == v5->_relation;
LABEL_14:

          goto LABEL_15;
        }
      }
LABEL_13:
      BOOL v11 = 0;
      goto LABEL_14;
    }
    BOOL v11 = 0;
  }
LABEL_15:

  return v11;
}

- (BOOL)_acceptsFeatureMap:(id)a3 predictionSet:(id)a4 explanation:(id *)a5
{
  id v7 = a3;
  if ([v7 hasValueForFeature:self->_feature])
  {
    unint64_t v8 = [v7 valueForFeature:self->_feature];
    int64_t relation = self->_relation;
    uint64_t v10 = RECompareFeatureValues(v8, (void *)self->_value);
    switch(relation)
    {
      case -2:
        BOOL v11 = v10 == -1;
        goto LABEL_14;
      case -1:
        BOOL v12 = v10 == 1;
        goto LABEL_5;
      case 0:
        BOOL v11 = v10 == 0;
        goto LABEL_14;
      case 1:
        BOOL v12 = v10 == -1;
        goto LABEL_5;
      case 2:
        BOOL v11 = v10 == 1;
LABEL_14:
        LODWORD(relation) = v11;
        if (a5) {
          goto LABEL_18;
        }
        goto LABEL_20;
      case 4:
        BOOL v12 = v10 == 0;
        goto LABEL_5;
      default:
        goto LABEL_20;
    }
  }
  BOOL v12 = !self->_allowsEmptyValueForFeature;
LABEL_5:
  LODWORD(relation) = !v12;
  if (a5)
  {
LABEL_18:
    if (relation)
    {
      *a5 = +[REMLExplanation explanationForCondition:self];
      LOBYTE(relation) = 1;
    }
  }
LABEL_20:

  return relation & 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  feature = self->_feature;
  int64_t relation = self->_relation;
  unint64_t value = self->_value;
  return (id)[v4 initWithFeature:feature relation:relation value:value];
}

- (REFeature)feature
{
  return self->_feature;
}

- (int64_t)relation
{
  return self->_relation;
}

- (unint64_t)value
{
  return self->_value;
}

@end