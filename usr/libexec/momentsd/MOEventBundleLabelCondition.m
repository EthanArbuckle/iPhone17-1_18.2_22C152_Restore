@interface MOEventBundleLabelCondition
+ (id)stringFromTemplateOperator:(unint64_t)a3;
+ (id)stringFromValueType:(unint64_t)a3;
+ (unint64_t)templateOperatorFromString:(id)a3;
+ (unint64_t)valueTypeFromString:(id)a3;
- (BOOL)capitalized;
- (BOOL)isNumeric:(id)a3;
- (BOOL)yieldConditionForMetaData:(id)a3;
- (BOOL)yieldConditionForValueData:(id)a3;
- (BOOL)yieldPresenceCheckForValueData:(id)a3;
- (MOEventBundleLabelCondition)initWithKeyword:(id)a3;
- (NSArray)values;
- (NSString)keyword;
- (NSString)value;
- (id)description;
- (unint64_t)templateOperator;
- (unint64_t)valueType;
- (void)setCapitalized:(BOOL)a3;
- (void)setKeyword:(id)a3;
- (void)setTemplateOperator:(unint64_t)a3;
- (void)setValue:(id)a3;
- (void)setValueType:(unint64_t)a3;
- (void)setValues:(id)a3;
@end

@implementation MOEventBundleLabelCondition

- (MOEventBundleLabelCondition)initWithKeyword:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    v15.receiver = self;
    v15.super_class = (Class)MOEventBundleLabelCondition;
    v7 = [(MOEventBundleLabelCondition *)&v15 init];
    v8 = v7;
    if (v7)
    {
      objc_storeStrong((id *)&v7->_keyword, a3);
      value = v8->_value;
      v8->_templateOperator = 0;
      v8->_value = 0;

      values = v8->_values;
      v8->_values = 0;

      v8->_valueType = 0;
      v8->_capitalized = 0;
    }
    self = v8;
    v11 = self;
  }
  else
  {
    v12 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[MOEventBundleLabelCondition initWithKeyword:](v12);
    }

    v13 = +[NSAssertionHandler currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"MOEventBundleLabelCondition.m" lineNumber:23 description:@"Invalid parameter not satisfying: keyword"];

    v11 = 0;
  }

  return v11;
}

- (BOOL)isNumeric:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSNumberFormatter);
  v5 = [v4 numberFromString:v3];

  return v5 != 0;
}

- (BOOL)yieldPresenceCheckForValueData:(id)a3
{
  id v3 = a3;
  if (!v3) {
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    if ([v4 length])
    {
      unsigned __int8 v5 = [v4 isEqualToString:@"NO"];

      if ((v5 & 1) == 0) {
        goto LABEL_5;
      }
    }
    else
    {
    }
LABEL_9:
    BOOL v6 = 0;
    goto LABEL_10;
  }
LABEL_5:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ![v3 BOOLValue]) {
    goto LABEL_9;
  }
  BOOL v6 = 1;
LABEL_10:

  return v6;
}

- (BOOL)yieldConditionForMetaData:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(MOEventBundleLabelCondition *)self keyword];
  BOOL v6 = [v4 objectForKey:v5];

  if ((id)[(MOEventBundleLabelCondition *)self templateOperator] != (id)9)
  {
    unsigned __int8 v11 = [(MOEventBundleLabelCondition *)self yieldConditionForValueData:v6];
    goto LABEL_10;
  }
  if (!v6)
  {
LABEL_9:
    unsigned __int8 v11 = 0;
    goto LABEL_10;
  }
  uint64_t v7 = [(MOEventBundleLabelCondition *)self value];
  if (!v7
    || (v8 = (void *)v7,
        [(MOEventBundleLabelCondition *)self value],
        v9 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v10 = [v9 isEqualToString:@"_ANY_"],
        v9,
        v8,
        (v10 & 1) == 0))
  {
    v12 = [(MOEventBundleLabelCondition *)self values];
    unsigned int v13 = [v12 containsObject:v6];

    if (v13)
    {
      v14 = [v4 objectForKey:v6];
      unsigned __int8 v11 = v14 != 0;

      goto LABEL_10;
    }
    goto LABEL_9;
  }
  unsigned __int8 v11 = 1;
LABEL_10:

  return v11;
}

- (BOOL)yieldConditionForValueData:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(MOEventBundleLabelCondition *)self value];

  if (v5)
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v6 = v4;
        if (![v6 length])
        {
LABEL_9:
          LOBYTE(self) = 0;
LABEL_46:

          goto LABEL_47;
        }
        if ((id)[(MOEventBundleLabelCondition *)self templateOperator] == (id)1
          && ![(MOEventBundleLabelCondition *)self valueType])
        {
          v9 = [(MOEventBundleLabelCondition *)self value];
          LOBYTE(self) = [v9 isEqualToString:v6];
        }
        else
        {
          if ((id)[(MOEventBundleLabelCondition *)self templateOperator] != (id)2
            || [(MOEventBundleLabelCondition *)self valueType])
          {
            goto LABEL_9;
          }
          v9 = [(MOEventBundleLabelCondition *)self value];
          LODWORD(self) = [v9 isEqualToString:v6] ^ 1;
        }
LABEL_45:

        goto LABEL_46;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v6 = (id)objc_opt_new();
        v8 = [(MOEventBundleLabelCondition *)self value];
        v9 = [v6 numberFromString:v8];

        id v10 = v4;
        if ((id)[(MOEventBundleLabelCondition *)self valueType] == (id)1)
        {
          switch([(MOEventBundleLabelCondition *)self templateOperator])
          {
            case 1uLL:
              self = (MOEventBundleLabelCondition *)[v10 integerValue];
              LOBYTE(self) = self == [v9 integerValue];
              break;
            case 2uLL:
              self = (MOEventBundleLabelCondition *)[v10 integerValue];
              LOBYTE(self) = self != [v9 integerValue];
              break;
            case 3uLL:
              self = (MOEventBundleLabelCondition *)[v10 integerValue];
              LOBYTE(self) = (uint64_t)self < (uint64_t)[v9 integerValue];
              break;
            case 4uLL:
              self = (MOEventBundleLabelCondition *)[v10 integerValue];
              LOBYTE(self) = (uint64_t)self <= (uint64_t)[v9 integerValue];
              break;
            case 5uLL:
              id v15 = [v10 integerValue];
              BOOL v16 = (uint64_t)v15 <= (uint64_t)[v9 integerValue];
              goto LABEL_37;
            case 6uLL:
              id v17 = [v10 integerValue];
              BOOL v18 = (uint64_t)v17 < (uint64_t)[v9 integerValue];
              goto LABEL_41;
            default:
              goto LABEL_24;
          }
LABEL_44:

          goto LABEL_45;
        }
        if ((id)[(MOEventBundleLabelCondition *)self valueType] == (id)2
          || ![(MOEventBundleLabelCondition *)self valueType])
        {
          switch([(MOEventBundleLabelCondition *)self templateOperator])
          {
            case 1uLL:
              [v10 doubleValue];
              double v12 = v11;
              [v9 doubleValue];
              BOOL v14 = vabdd_f64(v12, v13) < 0.0001;
              goto LABEL_32;
            case 2uLL:
              [v10 doubleValue];
              double v20 = v19;
              [v9 doubleValue];
              BOOL v18 = vabdd_f64(v20, v21) < 0.0001;
              goto LABEL_41;
            case 3uLL:
              [v10 doubleValue];
              double v23 = v22;
              [v9 doubleValue];
              BOOL v14 = v23 < v24;
LABEL_32:
              LOBYTE(self) = v14;
              goto LABEL_44;
            case 4uLL:
              [v10 doubleValue];
              double v26 = v25;
              [v9 doubleValue];
              LOBYTE(self) = v26 <= v27;
              goto LABEL_44;
            case 5uLL:
              [v10 doubleValue];
              double v29 = v28;
              [v9 doubleValue];
              BOOL v16 = v29 <= v30;
LABEL_37:
              LOBYTE(self) = !v16;
              goto LABEL_44;
            case 6uLL:
              [v10 doubleValue];
              double v32 = v31;
              [v9 doubleValue];
              BOOL v18 = v32 < v33;
LABEL_41:
              LOBYTE(self) = !v18;
              break;
            default:
LABEL_24:
              LOBYTE(self) = 0;
              break;
          }
          goto LABEL_44;
        }
      }
      LOBYTE(self) = 0;
    }
    else
    {
      LOBYTE(self) = (id)[(MOEventBundleLabelCondition *)self templateOperator] == (id)2;
    }
  }
  else
  {
    uint64_t v7 = [(MOEventBundleLabelCondition *)self yieldPresenceCheckForValueData:v4];
    LOBYTE(self) = v7 ^ ((id)[(MOEventBundleLabelCondition *)self templateOperator] == (id)8);
  }
LABEL_47:

  return (char)self;
}

- (id)description
{
  id v3 = [(MOEventBundleLabelCondition *)self keyword];
  id v4 = +[MOEventBundleLabelCondition stringFromTemplateOperator:[(MOEventBundleLabelCondition *)self templateOperator]];
  unsigned __int8 v5 = [(MOEventBundleLabelCondition *)self value];
  id v6 = +[MOEventBundleLabelCondition stringFromValueType:[(MOEventBundleLabelCondition *)self valueType]];
  uint64_t v7 = +[NSString stringWithFormat:@"keyword, %@,  operator, %@, value, %@, value type, %@", v3, v4, v5, v6];

  return v7;
}

+ (unint64_t)templateOperatorFromString:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"="] & 1) != 0
    || ([v3 isEqualToString:@"=="] & 1) != 0)
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"!="])
  {
    unint64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"<"])
  {
    unint64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"<="])
  {
    unint64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@">"])
  {
    unint64_t v4 = 5;
  }
  else if ([v3 isEqualToString:@">="])
  {
    unint64_t v4 = 6;
  }
  else if ([v3 isEqualToString:@"!"])
  {
    unint64_t v4 = 8;
  }
  else if ([v3 isEqualToString:@":"])
  {
    unint64_t v4 = 9;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

+ (id)stringFromTemplateOperator:(unint64_t)a3
{
  if (a3 > 9) {
    return @"invalid";
  }
  else {
    return off_1002CBE88[a3];
  }
}

+ (unint64_t)valueTypeFromString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"s"])
  {
    unint64_t v4 = 0;
  }
  else if ([v3 isEqualToString:@"d"])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"f"])
  {
    unint64_t v4 = 2;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

+ (id)stringFromValueType:(unint64_t)a3
{
  if (a3 > 2) {
    return @"invalid";
  }
  else {
    return off_1002CBED8[a3];
  }
}

- (NSString)keyword
{
  return self->_keyword;
}

- (void)setKeyword:(id)a3
{
}

- (unint64_t)templateOperator
{
  return self->_templateOperator;
}

- (void)setTemplateOperator:(unint64_t)a3
{
  self->_templateOperator = a3;
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (NSArray)values
{
  return self->_values;
}

- (void)setValues:(id)a3
{
}

- (unint64_t)valueType
{
  return self->_valueType;
}

- (void)setValueType:(unint64_t)a3
{
  self->_valueType = a3;
}

- (BOOL)capitalized
{
  return self->_capitalized;
}

- (void)setCapitalized:(BOOL)a3
{
  self->_capitalized = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_value, 0);

  objc_storeStrong((id *)&self->_keyword, 0);
}

- (void)initWithKeyword:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: keyword", v1, 2u);
}

@end