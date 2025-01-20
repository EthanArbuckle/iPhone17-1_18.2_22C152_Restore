@interface INCodableURLAttributeMetadata(Workflow)
- (WFURLStringParameterState)wf_parameterStateForIntentValue:()Workflow parameterDefinition:;
- (uint64_t)wf_objectClass;
- (uint64_t)wf_parameterClass;
@end

@implementation INCodableURLAttributeMetadata(Workflow)

- (WFURLStringParameterState)wf_parameterStateForIntentValue:()Workflow parameterDefinition:
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_class();
  id v9 = v6;
  if (v9)
  {
    if (objc_opt_isKindOfClass())
    {
      v10 = [WFVariableString alloc];
      v11 = [v9 absoluteString];
      v12 = [(WFVariableString *)v10 initWithString:v11];

      v13 = [(WFVariableStringParameterState *)[WFURLStringParameterState alloc] initWithVariableString:v12];
      goto LABEL_8;
    }
    v14 = getWFGeneralLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315906;
      v19 = "WFEnforceClass";
      __int16 v20 = 2114;
      id v21 = v9;
      __int16 v22 = 2114;
      id v23 = (id)objc_opt_class();
      __int16 v24 = 2114;
      uint64_t v25 = v8;
      id v15 = v23;
      _os_log_impl(&dword_1C7F0A000, v14, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", buf, 0x2Au);
    }
  }
  v17.receiver = a1;
  v17.super_class = (Class)&off_1F2380740;
  objc_msgSendSuper2(&v17, sel_wf_parameterStateForIntentValue_parameterDefinition_, v9, v7);
  v13 = (WFURLStringParameterState *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v13;
}

- (uint64_t)wf_parameterClass
{
  return objc_opt_class();
}

- (uint64_t)wf_objectClass
{
  return objc_opt_class();
}

@end