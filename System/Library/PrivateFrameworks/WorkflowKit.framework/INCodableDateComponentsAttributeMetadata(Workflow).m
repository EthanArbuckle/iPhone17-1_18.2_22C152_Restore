@interface INCodableDateComponentsAttributeMetadata(Workflow)
- (WFDateFieldParameterState)wf_parameterStateForIntentValue:()Workflow parameterDefinition:;
- (id)wf_updatedParameterDefinition:()Workflow forCodableAttribute:localizer:;
- (uint64_t)wf_objectClass;
- (uint64_t)wf_parameterClass;
@end

@implementation INCodableDateComponentsAttributeMetadata(Workflow)

- (WFDateFieldParameterState)wf_parameterStateForIntentValue:()Workflow parameterDefinition:
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
      v10 = [MEMORY[0x1E4F30788] localizerForLanguage:0];
      v11 = objc_msgSend(v9, "_intents_readableTitleWithLocalizer:metadata:", v10, a1);

      v12 = [[WFVariableString alloc] initWithString:v11];
      v13 = [(WFVariableStringParameterState *)[WFDateFieldParameterState alloc] initWithVariableString:v12];

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
  v17.super_class = (Class)&off_1F23772B8;
  objc_msgSendSuper2(&v17, sel_wf_parameterStateForIntentValue_parameterDefinition_, v9, v7);
  v13 = (WFDateFieldParameterState *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v13;
}

- (id)wf_updatedParameterDefinition:()Workflow forCodableAttribute:localizer:
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v9.receiver = a1;
  v9.super_class = (Class)&off_1F23772B8;
  v2 = objc_msgSendSuper2(&v9, sel_wf_updatedParameterDefinition_forCodableAttribute_localizer_);
  unint64_t v3 = [a1 type];
  if (v3 <= 2 && (v4 = *off_1E654F3C0[v3]) != 0)
  {
    v5 = v4;
    v10 = @"HintDateMode";
    v11[0] = v4;
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    id v7 = [v2 definitionByAddingEntriesInDictionary:v6];
  }
  else
  {
    id v7 = v2;
  }

  return v7;
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