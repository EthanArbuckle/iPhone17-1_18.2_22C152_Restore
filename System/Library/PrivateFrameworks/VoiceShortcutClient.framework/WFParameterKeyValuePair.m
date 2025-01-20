@interface WFParameterKeyValuePair
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)parameterKey;
- (WFEncodedTypedValue)parameterValue;
- (WFParameterKeyValuePair)initWithCoder:(id)a3;
- (WFParameterKeyValuePair)initWithParameterKey:(id)a3 parameterValue:(id)a4;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFParameterKeyValuePair

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameterValue, 0);
  objc_storeStrong((id *)&self->_parameterKey, 0);
}

- (WFEncodedTypedValue)parameterValue
{
  return self->_parameterValue;
}

- (NSString)parameterKey
{
  return self->_parameterKey;
}

- (unint64_t)hash
{
  v3 = [(WFParameterKeyValuePair *)self parameterKey];
  uint64_t v4 = [v3 hash];
  v5 = [(WFParameterKeyValuePair *)self parameterValue];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (WFParameterKeyValuePair *)a3;
  v5 = v4;
  if (v4 != self)
  {
    unint64_t v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_20:

      goto LABEL_21;
    }
    v7 = [(WFParameterKeyValuePair *)self parameterKey];
    v8 = [(WFParameterKeyValuePair *)v6 parameterKey];
    id v9 = v7;
    id v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      v13 = v10;
      id v14 = v9;
      if (!v9 || !v10)
      {
LABEL_18:

LABEL_19:
        goto LABEL_20;
      }
      int v12 = [v9 isEqualToString:v10];

      if (!v12) {
        goto LABEL_19;
      }
    }
    v15 = [(WFParameterKeyValuePair *)self parameterValue];
    v16 = [(WFParameterKeyValuePair *)v6 parameterValue];
    id v14 = v15;
    id v17 = v16;
    v13 = v17;
    if (v14 == v17)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      LOBYTE(v12) = 0;
      if (v14 && v17) {
        LOBYTE(v12) = [v14 isEqual:v17];
      }
    }

    goto LABEL_18;
  }
  LOBYTE(v12) = 1;
LABEL_21:

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WFParameterKeyValuePair *)self parameterKey];
  [v4 encodeObject:v5 forKey:@"parameterKey"];

  id v6 = [(WFParameterKeyValuePair *)self parameterValue];
  [v4 encodeObject:v6 forKey:@"parameterValue"];
}

- (WFParameterKeyValuePair)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parameterKey"];
  parameterKey = self->_parameterKey;
  self->_parameterKey = v5;

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parameterValue"];

  parameterValue = self->_parameterValue;
  self->_parameterValue = v7;

  return self;
}

- (WFParameterKeyValuePair)initWithParameterKey:(id)a3 parameterValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WFParameterKeyValuePair;
  v8 = [(WFParameterKeyValuePair *)&v13 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    parameterKey = v8->_parameterKey;
    v8->_parameterKey = (NSString *)v9;

    objc_storeStrong((id *)&v8->_parameterValue, a4);
    v11 = v8;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end