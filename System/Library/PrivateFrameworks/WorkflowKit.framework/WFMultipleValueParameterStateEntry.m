@interface WFMultipleValueParameterStateEntry
- (BOOL)isEqual:(id)a3;
- (NSUUID)identity;
- (WFMultipleValueParameterStateEntry)initWithIdentity:(id)a3 parameterState:(id)a4;
- (WFParameterState)parameterState;
- (unint64_t)hash;
@end

@implementation WFMultipleValueParameterStateEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameterState, 0);
  objc_storeStrong((id *)&self->_identity, 0);
}

- (WFParameterState)parameterState
{
  return self->_parameterState;
}

- (NSUUID)identity
{
  return self->_identity;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(WFMultipleValueParameterStateEntry *)self identity];
      v6 = [v4 identity];
      id v7 = v5;
      id v8 = v6;
      v9 = v8;
      if (v7 == v8)
      {
      }
      else
      {
        LOBYTE(v10) = 0;
        v11 = v8;
        v12 = v7;
        if (!v7 || !v8) {
          goto LABEL_11;
        }
        int v10 = [v7 isEqual:v8];

        if (!v10) {
          goto LABEL_12;
        }
      }
      v12 = [(WFMultipleValueParameterStateEntry *)self parameterState];
      v11 = [v4 parameterState];
      LOBYTE(v10) = [v12 isEqual:v11];
LABEL_11:

LABEL_12:
      goto LABEL_13;
    }
  }
  LOBYTE(v10) = 0;
LABEL_13:

  return v10;
}

- (unint64_t)hash
{
  v3 = [(WFMultipleValueParameterStateEntry *)self identity];
  uint64_t v4 = [v3 hash];
  v5 = [(WFMultipleValueParameterStateEntry *)self parameterState];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (WFMultipleValueParameterStateEntry)initWithIdentity:(id)a3 parameterState:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WFMultipleValueParameterStateEntry;
  v9 = [(WFMultipleValueParameterStateEntry *)&v13 init];
  int v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identity, a3);
    objc_storeStrong((id *)&v10->_parameterState, a4);
    v11 = v10;
  }

  return v10;
}

@end