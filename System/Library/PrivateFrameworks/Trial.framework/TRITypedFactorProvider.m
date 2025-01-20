@interface TRITypedFactorProvider
+ (id)providerWithType:(unint64_t)a3 provider:(id)a4 logDesc:(id)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToProvider:(id)a3;
- (NSString)logDesc;
- (TRINamespaceFactorProviding)provider;
- (TRITypedFactorProvider)initWithType:(unint64_t)a3 provider:(id)a4 logDesc:(id)a5;
- (id)copyWithReplacementLogDesc:(id)a3;
- (id)copyWithReplacementProvider:(id)a3;
- (id)copyWithReplacementType:(unint64_t)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)type;
@end

@implementation TRITypedFactorProvider

- (TRINamespaceFactorProviding)provider
{
  return self->_provider;
}

- (unint64_t)type
{
  return self->_type;
}

- (TRITypedFactorProvider)initWithType:(unint64_t)a3 provider:(id)a4 logDesc:(id)a5
{
  id v10 = a4;
  id v11 = a5;
  v12 = v11;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"TRIClientTupleTypes.m", 1483, @"Invalid parameter not satisfying: %@", @"provider != nil" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"TRIClientTupleTypes.m", 1484, @"Invalid parameter not satisfying: %@", @"logDesc != nil" object file lineNumber description];

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)TRITypedFactorProvider;
  v13 = [(TRITypedFactorProvider *)&v18 init];
  v14 = v13;
  if (v13)
  {
    v13->_type = a3;
    objc_storeStrong((id *)&v13->_provider, a4);
    objc_storeStrong((id *)&v14->_logDesc, a5);
  }

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logDesc, 0);
  objc_storeStrong((id *)&self->_provider, 0);
}

+ (id)providerWithType:(unint64_t)a3 provider:(id)a4 logDesc:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = (void *)[objc_alloc((Class)a1) initWithType:a3 provider:v9 logDesc:v8];

  return v10;
}

- (id)copyWithReplacementType:(unint64_t)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  provider = self->_provider;
  logDesc = self->_logDesc;
  return (id)[v5 initWithType:a3 provider:provider logDesc:logDesc];
}

- (id)copyWithReplacementProvider:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithType:self->_type provider:v4 logDesc:self->_logDesc];

  return v5;
}

- (id)copyWithReplacementLogDesc:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithType:self->_type provider:self->_provider logDesc:v4];

  return v5;
}

- (BOOL)isEqualToProvider:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_9;
  }
  unint64_t type = self->_type;
  if (type != [v4 type]) {
    goto LABEL_9;
  }
  int v7 = self->_provider != 0;
  id v8 = [v5 provider];
  int v9 = v8 == 0;

  if (v7 == v9) {
    goto LABEL_9;
  }
  provider = self->_provider;
  if (provider)
  {
    id v11 = [v5 provider];
    int v12 = [(TRINamespaceFactorProviding *)provider isEqual:v11];

    if (!v12) {
      goto LABEL_9;
    }
  }
  int v13 = self->_logDesc != 0;
  v14 = [v5 logDesc];
  int v15 = v14 == 0;

  if (v13 == v15)
  {
LABEL_9:
    char v18 = 0;
  }
  else
  {
    logDesc = self->_logDesc;
    if (logDesc)
    {
      v17 = [v5 logDesc];
      char v18 = [(NSString *)logDesc isEqual:v17];
    }
    else
    {
      char v18 = 1;
    }
  }

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TRITypedFactorProvider *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(TRITypedFactorProvider *)self isEqualToProvider:v5];

  return v6;
}

- (unint64_t)hash
{
  unint64_t type = self->_type;
  uint64_t v4 = [(TRINamespaceFactorProviding *)self->_provider hash] - type + 32 * type;
  return [(NSString *)self->_logDesc hash] - v4 + 32 * v4;
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = [NSNumber numberWithUnsignedLongLong:self->_type];
  id v5 = (void *)[v3 initWithFormat:@"<TRITypedFactorProvider | type:%@ provider:%@ logDesc:%@>", v4, self->_provider, self->_logDesc];

  return v5;
}

- (NSString)logDesc
{
  return self->_logDesc;
}

@end