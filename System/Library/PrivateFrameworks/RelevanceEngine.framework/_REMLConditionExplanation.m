@interface _REMLConditionExplanation
- (_REMLConditionExplanation)explanationWithStyle:(unint64_t)a3;
- (_REMLConditionExplanation)initWithCondition:(id)a3;
- (id)_constantConditionExplanationWithStyle:(unint64_t)a3;
- (id)_featureRuleExplanation:(id)a3 withStyle:(unint64_t)a4;
- (id)_hasFeatureExplanation:(id)a3 withStyle:(unint64_t)a4;
- (id)_probabilityExplanation:(id)a3 withStyle:(unint64_t)a4;
- (id)_valueExplanation:(id)a3 withStyle:(unint64_t)a4;
- (id)explanationByCombiningWithExplanation:(id)a3;
- (int64_t)_rankExplanationToSimilarExplanation:(id)a3;
@end

@implementation _REMLConditionExplanation

- (_REMLConditionExplanation)initWithCondition:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_REMLConditionExplanation;
  v6 = [(_REMLConditionExplanation *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_condition, a3);
    v7->_type = 6;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v8 = 1;
LABEL_12:
      v7->_type = v8;
      goto LABEL_13;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v8 = 3;
      goto LABEL_12;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v8 = 2;
      goto LABEL_12;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v8 = 4;
      goto LABEL_12;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v8 = 5;
      goto LABEL_12;
    }
  }
LABEL_13:

  return v7;
}

- (id)explanationByCombiningWithExplanation:(id)a3
{
  v4 = (_REMLConditionExplanation *)a3;
  if ([(REMLExplanation *)self rankExplanationToExplanation:v4] == -1) {
    id v5 = self;
  }
  else {
    id v5 = v4;
  }
  v6 = v5;

  return v6;
}

- (int64_t)_rankExplanationToSimilarExplanation:(id)a3
{
  v3 = NSNumber;
  unint64_t type = self->_type;
  id v5 = a3;
  v6 = [v3 numberWithUnsignedInteger:type];
  v7 = NSNumber;
  uint64_t v8 = v5[2];

  v9 = [v7 numberWithUnsignedInteger:v8];
  int64_t v10 = [v6 compare:v9];

  return v10;
}

- (_REMLConditionExplanation)explanationWithStyle:(unint64_t)a3
{
  switch(self->_type)
  {
    case 1uLL:
      v3 = [(_REMLConditionExplanation *)self _constantConditionExplanationWithStyle:a3];
      break;
    case 2uLL:
      v3 = [(_REMLConditionExplanation *)self _probabilityExplanation:self->_condition withStyle:a3];
      break;
    case 3uLL:
      v3 = [(_REMLConditionExplanation *)self _featureRuleExplanation:self->_condition withStyle:a3];
      break;
    case 4uLL:
      v3 = [(_REMLConditionExplanation *)self _valueExplanation:self->_condition withStyle:a3];
      break;
    case 5uLL:
      v3 = [(_REMLConditionExplanation *)self _hasFeatureExplanation:self->_condition withStyle:a3];
      break;
    default:
      v3 = &stru_26CFA57D0;
      break;
  }
  return (_REMLConditionExplanation *)v3;
}

- (id)_constantConditionExplanationWithStyle:(unint64_t)a3
{
  v3 = @"condition is always true";
  if (a3 != 1) {
    v3 = 0;
  }
  if (a3) {
    return v3;
  }
  else {
    return @"always true";
  }
}

- (id)_featureRuleExplanation:(id)a3 withStyle:(unint64_t)a4
{
  id v6 = a3;
  v7 = [v6 firstFeature];
  uint64_t v8 = [(REMLExplanation *)self _formattedNameForFeature:v7 style:a4];

  v9 = [v6 secondFeature];
  int64_t v10 = [(REMLExplanation *)self _formattedNameForFeature:v9 style:a4];

  uint64_t v11 = [v6 relation];
  if (a4 == 1)
  {
    if ((unint64_t)(v11 + 2) <= 6)
    {
      v12 = off_2644C0958[v11 + 2];
      goto LABEL_7;
    }
  }
  else if (!a4)
  {
    RERelationDescription(v11);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v12 = 0;
LABEL_7:
  v13 = [NSString stringWithFormat:@"%@ %@ %@", v8, v12, v10];

  return v13;
}

- (id)_probabilityExplanation:(id)a3 withStyle:(unint64_t)a4
{
  id v6 = a3;
  v7 = [v6 feature];

  if (v7)
  {
    uint64_t v8 = [v6 feature];
    [(REMLExplanation *)self _formattedNameForFeature:v8 style:a4];
  }
  else
  {
    v9 = NSNumber;
    [v6 threshold];
    uint64_t v8 = objc_msgSend(v9, "numberWithFloat:");
    [v8 stringValue];
  int64_t v10 = };

  uint64_t v11 = [v6 interaction];

  if (v11)
  {
    if (a4 != 1)
    {
      if (!a4)
      {
        v12 = NSString;
        v13 = [v6 interaction];
        v14 = [v12 stringWithFormat:@"%@ prob", v13];

LABEL_11:
        RERelationDescription([v6 relation]);
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      }
LABEL_12:
      [v6 relation];
      v14 = 0;
LABEL_13:
      v15 = 0;
      goto LABEL_14;
    }
    v18 = NSString;
    v19 = [v6 interaction];
    v14 = [v18 stringWithFormat:@"probability for %@", v19];
  }
  else
  {
    if (a4 != 1)
    {
      if (!a4)
      {
        v14 = @"prob";
        goto LABEL_11;
      }
      goto LABEL_12;
    }
    v14 = @"probability";
  }
  v15 = @"less than";
  switch([v6 relation])
  {
    case -2:
      break;
    case -1:
      v15 = @"less than or equal to";
      break;
    case 0:
      v15 = @"equal to";
      break;
    case 1:
      v15 = @"greater than or equal to";
      break;
    case 2:
      v15 = @"greater than";
      break;
    case 4:
      v15 = @"not equal to";
      break;
    default:
      goto LABEL_13;
  }
LABEL_14:
  v16 = [NSString stringWithFormat:@"%@ %@ %@", v14, v15, v10];

  return v16;
}

- (id)_valueExplanation:(id)a3 withStyle:(unint64_t)a4
{
  id v6 = a3;
  v7 = REDescriptionForTaggedPointer([v6 value]);
  uint64_t v8 = [v6 feature];
  v9 = [(REMLExplanation *)self _formattedNameForFeature:v8 style:a4];

  uint64_t v10 = [v6 relation];
  if (a4 == 1)
  {
    if ((unint64_t)(v10 + 2) <= 6)
    {
      uint64_t v11 = off_2644C0958[v10 + 2];
      goto LABEL_7;
    }
  }
  else if (!a4)
  {
    RERelationDescription(v10);
    uint64_t v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  uint64_t v11 = 0;
LABEL_7:
  v12 = [NSString stringWithFormat:@"%@ %@ %@", v9, v11, v7];

  return v12;
}

- (id)_hasFeatureExplanation:(id)a3 withStyle:(unint64_t)a4
{
  id v6 = a3;
  v7 = [v6 feature];
  uint64_t v8 = [(REMLExplanation *)self _formattedNameForFeature:v7 style:a4];

  LODWORD(v7) = [v6 contains];
  v9 = @"doesn't";
  if (v7) {
    v9 = &stru_26CFA57D0;
  }
  uint64_t v10 = v9;
  if (!a4)
  {
    uint64_t v11 = @"%@contains %@";
    goto LABEL_7;
  }
  if (a4 == 1)
  {
    uint64_t v11 = @"%@contains value for %@";
LABEL_7:
    objc_msgSend(NSString, "stringWithFormat:", v11, v10, v8);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  v12 = @"Unknown style";
LABEL_9:

  return v12;
}

- (void).cxx_destruct
{
}

@end