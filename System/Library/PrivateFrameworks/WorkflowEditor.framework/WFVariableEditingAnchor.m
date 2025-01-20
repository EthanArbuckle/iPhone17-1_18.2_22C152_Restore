@interface WFVariableEditingAnchor
- (BOOL)isEqual:(id)a3;
- (WFParameter)parameter;
- (WFVariable)variable;
- (WFVariableEditingAnchor)initWithVariable:(id)a3 variableProvider:(id)a4 parameter:(id)a5;
- (WFVariableProvider)variableProvider;
- (unint64_t)hash;
@end

@implementation WFVariableEditingAnchor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameter, 0);
  objc_storeStrong((id *)&self->_variableProvider, 0);
  objc_storeStrong((id *)&self->_variable, 0);
}

- (WFParameter)parameter
{
  return self->_parameter;
}

- (WFVariableProvider)variableProvider
{
  return self->_variableProvider;
}

- (WFVariable)variable
{
  return self->_variable;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = [(WFVariableEditingAnchor *)self variable];
    v6 = [v4 variable];
    if (v5 == v6)
    {
      v8 = [(WFVariableEditingAnchor *)self variableProvider];
      v9 = [v4 variableProvider];
      if (v8 == v9)
      {
        v10 = [(WFVariableEditingAnchor *)self parameter];
        v11 = [v4 parameter];
        BOOL v7 = v10 == v11;
      }
      else
      {
        BOOL v7 = 0;
      }
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = [(WFVariable *)self->_variable hash];
  uint64_t v4 = [(WFVariableProvider *)self->_variableProvider hash] ^ v3;
  return v4 ^ [(WFParameter *)self->_parameter hash];
}

- (WFVariableEditingAnchor)initWithVariable:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
LABEL_8:
    v18 = [MEMORY[0x263F08690] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"WFVariableEditingOptions.m", 19, @"Invalid parameter not satisfying: %@", @"variableProvider" object file lineNumber description];

    if (v12) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v17 = [MEMORY[0x263F08690] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"WFVariableEditingOptions.m", 18, @"Invalid parameter not satisfying: %@", @"variable" object file lineNumber description];

  if (!v11) {
    goto LABEL_8;
  }
LABEL_3:
  if (v12) {
    goto LABEL_4;
  }
LABEL_9:
  v19 = [MEMORY[0x263F08690] currentHandler];
  [v19 handleFailureInMethod:a2, self, @"WFVariableEditingOptions.m", 20, @"Invalid parameter not satisfying: %@", @"parameter" object file lineNumber description];

LABEL_4:
  v20.receiver = self;
  v20.super_class = (Class)WFVariableEditingAnchor;
  v13 = [(WFVariableEditingAnchor *)&v20 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_variable, a3);
    objc_storeStrong((id *)&v14->_variableProvider, a4);
    objc_storeStrong((id *)&v14->_parameter, a5);
    v15 = v14;
  }

  return v14;
}

@end