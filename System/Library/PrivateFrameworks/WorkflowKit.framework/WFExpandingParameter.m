@interface WFExpandingParameter
- (Class)singleStateClass;
- (NSString)hintLabel;
- (WFExpandingParameter)initWithDefinition:(id)a3;
- (WFExpandingParameterHintProvider)hintProvider;
- (id)defaultSupportedVariableTypes;
- (id)importQuestionBehavior;
- (void)setHintProvider:(id)a3;
@end

@implementation WFExpandingParameter

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hintProvider);
  objc_storeStrong((id *)&self->_hintLabel, 0);
}

- (void)setHintProvider:(id)a3
{
}

- (WFExpandingParameterHintProvider)hintProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hintProvider);
  return (WFExpandingParameterHintProvider *)WeakRetained;
}

- (id)importQuestionBehavior
{
  v2 = @"Hidden";
  return @"Hidden";
}

- (id)defaultSupportedVariableTypes
{
  return 0;
}

- (NSString)hintLabel
{
  v3 = [(WFExpandingParameter *)self hintProvider];
  if (v3)
  {
    v4 = [(WFExpandingParameter *)self hintProvider];
    v5 = [v4 hintForExpandingParameter:self];
  }
  else
  {
    v5 = self->_hintLabel;
  }

  return v5;
}

- (WFExpandingParameter)initWithDefinition:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WFExpandingParameter;
  v5 = [(WFParameter *)&v16 initWithDefinition:v4];
  if (v5)
  {
    v6 = [v4 objectForKey:@"HintLabel"];
    uint64_t v7 = objc_opt_class();
    id v8 = v6;
    if (v8 && (objc_opt_isKindOfClass() & 1) == 0)
    {
      v10 = getWFGeneralLogObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        v11 = objc_opt_class();
        *(_DWORD *)buf = 136315906;
        v18 = "WFEnforceClass";
        __int16 v19 = 2114;
        id v20 = v8;
        __int16 v21 = 2114;
        v22 = v11;
        __int16 v23 = 2114;
        uint64_t v24 = v7;
        id v12 = v11;
        _os_log_impl(&dword_1C7F0A000, v10, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", buf, 0x2Au);
      }
      v9 = 0;
    }
    else
    {
      v9 = (NSString *)v8;
    }

    hintLabel = v5->_hintLabel;
    v5->_hintLabel = v9;

    v14 = v5;
  }

  return v5;
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

@end