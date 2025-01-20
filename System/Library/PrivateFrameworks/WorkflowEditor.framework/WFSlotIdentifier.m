@interface WFSlotIdentifier
- (BOOL)isEqual:(id)a3;
- (NSString)key;
- (NSString)parameterKey;
- (WFSlotIdentifier)initWithKey:(id)a3;
- (WFSlotIdentifier)initWithKey:(id)a3 parameterKey:(id)a4 arrayIndex:(int64_t)a5;
- (id)identifierBySettingArrayIndex:(int64_t)a3;
- (id)identifierBySettingParameterKey:(id)a3;
- (id)identifierBySettingParameterKey:(id)a3 arrayIndex:(int64_t)a4;
- (int64_t)arrayIndex;
@end

@implementation WFSlotIdentifier

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameterKey, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (int64_t)arrayIndex
{
  return self->_arrayIndex;
}

- (NSString)parameterKey
{
  return self->_parameterKey;
}

- (NSString)key
{
  return self->_key;
}

- (BOOL)isEqual:(id)a3
{
  v6 = (WFSlotIdentifier *)a3;
  if (self == v6)
  {
    BOOL v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = v6;
      v8 = [(WFSlotIdentifier *)self key];
      v9 = [(WFSlotIdentifier *)v7 key];
      if (![v8 isEqualToString:v9])
      {
        BOOL v12 = 0;
LABEL_13:

        goto LABEL_14;
      }
      v10 = [(WFSlotIdentifier *)self parameterKey];
      v11 = [(WFSlotIdentifier *)v7 parameterKey];
      if (v10 == v11
        || ([(WFSlotIdentifier *)self parameterKey],
            v3 = objc_claimAutoreleasedReturnValue(),
            [(WFSlotIdentifier *)v7 parameterKey],
            v4 = objc_claimAutoreleasedReturnValue(),
            [v3 isEqualToString:v4]))
      {
        int64_t v13 = [(WFSlotIdentifier *)self arrayIndex];
        BOOL v12 = v13 == [(WFSlotIdentifier *)v7 arrayIndex];
        if (v10 == v11)
        {
LABEL_12:

          goto LABEL_13;
        }
      }
      else
      {
        BOOL v12 = 0;
      }

      goto LABEL_12;
    }
    BOOL v12 = 0;
  }
LABEL_14:

  return v12;
}

- (id)identifierBySettingArrayIndex:(int64_t)a3
{
  v5 = [(WFSlotIdentifier *)self parameterKey];
  v6 = [(WFSlotIdentifier *)self identifierBySettingParameterKey:v5 arrayIndex:a3];

  return v6;
}

- (id)identifierBySettingParameterKey:(id)a3
{
  id v4 = a3;
  v5 = [(WFSlotIdentifier *)self identifierBySettingParameterKey:v4 arrayIndex:[(WFSlotIdentifier *)self arrayIndex]];

  return v5;
}

- (id)identifierBySettingParameterKey:(id)a3 arrayIndex:(int64_t)a4
{
  id v6 = a3;
  v7 = [WFSlotIdentifier alloc];
  v8 = [(WFSlotIdentifier *)self key];
  v9 = [(WFSlotIdentifier *)v7 initWithKey:v8 parameterKey:v6 arrayIndex:a4];

  return v9;
}

- (WFSlotIdentifier)initWithKey:(id)a3 parameterKey:(id)a4 arrayIndex:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)WFSlotIdentifier;
  v10 = [(WFSlotIdentifier *)&v17 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    key = v10->_key;
    v10->_key = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    parameterKey = v10->_parameterKey;
    v10->_parameterKey = (NSString *)v13;

    v10->_arrayIndex = a5;
    v15 = v10;
  }

  return v10;
}

- (WFSlotIdentifier)initWithKey:(id)a3
{
  return [(WFSlotIdentifier *)self initWithKey:a3 parameterKey:0 arrayIndex:0x7FFFFFFFFFFFFFFFLL];
}

@end