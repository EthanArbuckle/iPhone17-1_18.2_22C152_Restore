@interface WFActionRequest
- (BOOL)isEqual:(id)a3;
- (NSDictionary)serializedParameters;
- (NSString)actionIdentifier;
- (WFAction)result;
- (WFActionRequest)initWithActionIdentifier:(id)a3 serializedParameters:(id)a4;
- (id)description;
- (unint64_t)hash;
- (void)setResult:(id)a3;
@end

@implementation WFActionRequest

- (NSDictionary)serializedParameters
{
  return self->_serializedParameters;
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_serializedParameters, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
}

- (void)setResult:(id)a3
{
}

- (WFAction)result
{
  return self->_result;
}

- (WFActionRequest)initWithActionIdentifier:(id)a3 serializedParameters:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WFActionRequest;
  v8 = [(WFActionRequest *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    actionIdentifier = v8->_actionIdentifier;
    v8->_actionIdentifier = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    serializedParameters = v8->_serializedParameters;
    v8->_serializedParameters = (NSDictionary *)v11;

    v13 = v8;
  }

  return v8;
}

- (unint64_t)hash
{
  v3 = [(WFActionRequest *)self actionIdentifier];
  uint64_t v4 = [v3 hash];
  v5 = [(WFActionRequest *)self serializedParameters];
  uint64_t v6 = [v5 hash] ^ v4;
  id v7 = [(WFActionRequest *)self result];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)WFActionRequest;
  unsigned int v5 = [(WFActionRequest *)&v27 isEqual:v4];
  id v6 = v4;
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }
  id v8 = v7;

  if (v5)
  {
    uint64_t v9 = [(WFActionRequest *)self actionIdentifier];
    v10 = [v8 actionIdentifier];
    id v11 = v9;
    id v12 = v10;
    v13 = v12;
    if (v11 == v12)
    {
    }
    else
    {
      LOBYTE(v14) = 0;
      objc_super v15 = v12;
      id v16 = v11;
      if (!v11 || !v12) {
        goto LABEL_27;
      }
      int v17 = [v11 isEqualToString:v12];

      if (!v17)
      {
        LOBYTE(v14) = 0;
LABEL_28:

        goto LABEL_29;
      }
    }
    v18 = [(WFActionRequest *)self serializedParameters];
    v19 = [v8 serializedParameters];
    id v16 = v18;
    id v20 = v19;
    objc_super v15 = v20;
    if (v16 == v20)
    {
    }
    else
    {
      LOBYTE(v14) = 0;
      v21 = v20;
      id v22 = v16;
      if (!v16 || !v20)
      {
LABEL_26:

LABEL_27:
        goto LABEL_28;
      }
      int v14 = [v16 isEqualToDictionary:v20];

      if (!v14) {
        goto LABEL_27;
      }
    }
    v23 = [(WFActionRequest *)self result];
    v24 = [v8 result];
    id v22 = v23;
    id v25 = v24;
    v21 = v25;
    if (v22 == v25)
    {
      LOBYTE(v14) = 1;
    }
    else
    {
      LOBYTE(v14) = 0;
      if (v22 && v25) {
        LOBYTE(v14) = [v22 isEqual:v25];
      }
    }

    goto LABEL_26;
  }
  LOBYTE(v14) = 0;
LABEL_29:

  return v14;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WFActionRequest;
  id v4 = [(WFActionRequest *)&v8 description];
  unsigned int v5 = [(WFActionRequest *)self actionIdentifier];
  id v6 = [v3 stringWithFormat:@"%@ for %@", v4, v5];

  return v6;
}

@end