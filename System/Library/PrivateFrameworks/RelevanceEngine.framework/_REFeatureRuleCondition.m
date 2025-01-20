@interface _REFeatureRuleCondition
- (BOOL)_acceptsFeatureMap:(id)a3 predictionSet:(id)a4 explanation:(id *)a5;
- (BOOL)_requiresTwoFeatures;
- (BOOL)isEqual:(id)a3;
- (REFeature)firstFeature;
- (REFeature)secondFeature;
- (_REFeatureRuleCondition)initWithFeature:(id)a3 relation:(int64_t)a4 feature:(id)a5;
- (id)_dependentFeatures;
- (id)_inflectionFeatureValuePairs;
- (id)_notCondition;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)relation;
- (unint64_t)hash;
@end

@implementation _REFeatureRuleCondition

- (_REFeatureRuleCondition)initWithFeature:(id)a3 relation:(int64_t)a4 feature:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)_REFeatureRuleCondition;
  v11 = [(_REFeatureRuleCondition *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_firstFeature, a3);
    v12->_relation = a4;
    objc_storeStrong((id *)&v12->_secondFeature, a5);
  }

  return v12;
}

- (id)_dependentFeatures
{
  v6[2] = *MEMORY[0x263EF8340];
  secondFeature = self->_secondFeature;
  v6[0] = self->_firstFeature;
  v6[1] = secondFeature;
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
  v4 = +[REFeatureSet featureSetWithFeatures:v3];

  return v4;
}

- (id)_notCondition
{
  v2 = [[_REFeatureRuleCondition alloc] initWithFeature:self->_firstFeature relation:REInvertRelation(self->_relation) feature:self->_secondFeature];
  return v2;
}

- (BOOL)_requiresTwoFeatures
{
  return 1;
}

- (BOOL)_acceptsFeatureMap:(id)a3 predictionSet:(id)a4 explanation:(id *)a5
{
  id v7 = a3;
  if ([v7 hasValueForFeature:self->_firstFeature]
    && [v7 hasValueForFeature:self->_secondFeature])
  {
    unint64_t v8 = [v7 valueForFeature:self->_firstFeature];
    id v9 = (void *)[v7 valueForFeature:self->_secondFeature];
    int64_t relation = self->_relation;
    uint64_t v11 = RECompareFeatureValues(v8, v9);
    switch(relation)
    {
      case -2:
        BOOL v12 = v11 == -1;
        goto LABEL_11;
      case -1:
        BOOL v14 = v11 == 1;
        goto LABEL_17;
      case 0:
        BOOL v12 = v11 == 0;
        goto LABEL_11;
      case 1:
        BOOL v14 = v11 == -1;
        goto LABEL_17;
      case 2:
        BOOL v12 = v11 == 1;
LABEL_11:
        LODWORD(v8) = v12;
        if (!a5) {
          break;
        }
        goto LABEL_21;
      case 4:
        BOOL v14 = v11 == 0;
LABEL_17:
        LODWORD(v8) = !v14;
        if (a5)
        {
LABEL_21:
          if (v8)
          {
            *a5 = +[REMLExplanation explanationForCondition:self];
            LOBYTE(v8) = 1;
          }
        }
        break;
      default:
        break;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8 & 1;
}

- (id)_inflectionFeatureValuePairs
{
  v8[2] = *MEMORY[0x263EF8340];
  v3 = [[REFeatureValuePair alloc] initWithFeature:self->_firstFeature value:0];
  v8[0] = v3;
  v4 = [[REFeatureValuePair alloc] initWithFeature:self->_secondFeature value:0];
  v8[1] = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:2];

  v6 = [MEMORY[0x263EFFA08] setWithArray:v5];

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = self->_relation ^ [(REFeature *)self->_firstFeature hash];
  return v3 ^ [(REFeature *)self->_secondFeature hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_REFeatureRuleCondition *)a3;
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
      firstFeature = self->_firstFeature;
      id v7 = v5->_firstFeature;
      if (firstFeature == v7)
      {
      }
      else
      {
        unint64_t v8 = v7;
        id v9 = firstFeature;
        BOOL v10 = [(REFeature *)v9 isEqual:v8];

        if (!v10) {
          goto LABEL_11;
        }
      }
      secondFeature = self->_secondFeature;
      v13 = v5->_secondFeature;
      if (secondFeature == v13)
      {
      }
      else
      {
        BOOL v14 = v13;
        v15 = secondFeature;
        BOOL v16 = [(REFeature *)v15 isEqual:v14];

        if (!v16)
        {
LABEL_11:
          BOOL v11 = 0;
LABEL_14:

          goto LABEL_15;
        }
      }
      BOOL v11 = self->_relation == v5->_relation;
      goto LABEL_14;
    }
    BOOL v11 = 0;
  }
LABEL_15:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  firstFeature = self->_firstFeature;
  int64_t relation = self->_relation;
  secondFeature = self->_secondFeature;
  return (id)[v4 initWithFeature:firstFeature relation:relation feature:secondFeature];
}

- (REFeature)firstFeature
{
  return self->_firstFeature;
}

- (int64_t)relation
{
  return self->_relation;
}

- (REFeature)secondFeature
{
  return self->_secondFeature;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondFeature, 0);
  objc_storeStrong((id *)&self->_firstFeature, 0);
}

@end