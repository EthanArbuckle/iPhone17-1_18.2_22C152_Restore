@interface _REFeatureComparisonCondition
- (BOOL)_acceptsLeftFeatureMap:(id)a3 rightFeatureMap:(id)a4;
- (BOOL)_requiresTwoFeatures;
- (BOOL)_validForRanking;
- (BOOL)isEqual:(id)a3;
- (REFeature)leftFeature;
- (REFeature)rightFeature;
- (_REFeatureComparisonCondition)initWithLeftFeature:(id)a3 relation:(int64_t)a4 rightFeature:(id)a5;
- (id)_dependentFeatures;
- (id)_inflectionFeatureValuePairs;
- (id)_notCondition;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)relation;
- (unint64_t)hash;
@end

@implementation _REFeatureComparisonCondition

- (unint64_t)hash
{
  unint64_t v3 = self->_relation ^ [(REFeature *)self->_leftFeature hash];
  return v3 ^ [(REFeature *)self->_rightFeature hash];
}

- (BOOL)_validForRanking
{
  return 1;
}

- (id)_inflectionFeatureValuePairs
{
  v8[2] = *MEMORY[0x263EF8340];
  unint64_t v3 = [[REFeatureValuePair alloc] initWithFeature:self->_leftFeature value:0];
  v8[0] = v3;
  v4 = [[REFeatureValuePair alloc] initWithFeature:self->_rightFeature value:0];
  v8[1] = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:2];

  v6 = [MEMORY[0x263EFFA08] setWithArray:v5];

  return v6;
}

- (id)_dependentFeatures
{
  v6[2] = *MEMORY[0x263EF8340];
  rightFeature = self->_rightFeature;
  v6[0] = self->_leftFeature;
  v6[1] = rightFeature;
  unint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
  v4 = +[REFeatureSet featureSetWithFeatures:v3];

  return v4;
}

- (_REFeatureComparisonCondition)initWithLeftFeature:(id)a3 relation:(int64_t)a4 rightFeature:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)_REFeatureComparisonCondition;
  v11 = [(_REFeatureComparisonCondition *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_leftFeature, a3);
    v12->_relation = a4;
    objc_storeStrong((id *)&v12->_rightFeature, a5);
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightFeature, 0);
  objc_storeStrong((id *)&self->_leftFeature, 0);
}

- (id)_notCondition
{
  v2 = [[_REFeatureComparisonCondition alloc] initWithLeftFeature:self->_leftFeature relation:REInvertRelation(self->_relation) rightFeature:self->_rightFeature];
  return v2;
}

- (BOOL)_requiresTwoFeatures
{
  return 1;
}

- (BOOL)_acceptsLeftFeatureMap:(id)a3 rightFeatureMap:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 hasValueForFeature:self->_leftFeature]
    && [v7 hasValueForFeature:self->_rightFeature])
  {
    unint64_t v8 = [v6 valueForFeature:self->_leftFeature];
    id v9 = (void *)[v7 valueForFeature:self->_rightFeature];
    int64_t relation = self->_relation;
    uint64_t v11 = RECompareFeatureValues(v8, v9);
    switch(relation)
    {
      case -2:
        BOOL v12 = v11 == -1;
        goto LABEL_11;
      case -1:
        BOOL v14 = v11 == 1;
        goto LABEL_15;
      case 0:
        BOOL v12 = v11 == 0;
        goto LABEL_11;
      case 1:
        BOOL v14 = v11 == -1;
        goto LABEL_15;
      case 2:
        BOOL v12 = v11 == 1;
LABEL_11:
        LOBYTE(relation) = v12;
        break;
      case 4:
        BOOL v14 = v11 == 0;
LABEL_15:
        LOBYTE(relation) = !v14;
        break;
      default:
        break;
    }
  }
  else
  {
    LOBYTE(relation) = 0;
  }

  return relation & 1;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_REFeatureComparisonCondition *)a3;
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
      leftFeature = self->_leftFeature;
      id v7 = v5->_leftFeature;
      if (leftFeature == v7)
      {
      }
      else
      {
        unint64_t v8 = v7;
        id v9 = leftFeature;
        BOOL v10 = [(REFeature *)v9 isEqual:v8];

        if (!v10) {
          goto LABEL_11;
        }
      }
      rightFeature = self->_rightFeature;
      v13 = v5->_rightFeature;
      if (rightFeature == v13)
      {
      }
      else
      {
        BOOL v14 = v13;
        v15 = rightFeature;
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
  leftFeature = self->_leftFeature;
  int64_t relation = self->_relation;
  rightFeature = self->_rightFeature;
  return (id)[v4 initWithLeftFeature:leftFeature relation:relation rightFeature:rightFeature];
}

- (REFeature)leftFeature
{
  return self->_leftFeature;
}

- (int64_t)relation
{
  return self->_relation;
}

- (REFeature)rightFeature
{
  return self->_rightFeature;
}

@end