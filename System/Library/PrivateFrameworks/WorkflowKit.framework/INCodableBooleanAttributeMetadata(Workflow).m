@interface INCodableBooleanAttributeMetadata(Workflow)
- (WFBooleanSubstitutableState)wf_parameterStateForIntentValue:()Workflow parameterDefinition:;
- (id)wf_updatedParameterDefinition:()Workflow forCodableAttribute:localizer:;
- (uint64_t)wf_objectClass;
- (uint64_t)wf_parameterClass;
@end

@implementation INCodableBooleanAttributeMetadata(Workflow)

- (WFBooleanSubstitutableState)wf_parameterStateForIntentValue:()Workflow parameterDefinition:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_class();
  id v9 = v6;
  if (v9)
  {
    if (objc_opt_isKindOfClass())
    {
      v10 = [(WFNumberSubstitutableState *)[WFBooleanSubstitutableState alloc] initWithNumber:v9];

      goto LABEL_8;
    }
    v11 = getWFGeneralLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315906;
      v16 = "WFEnforceClass";
      __int16 v17 = 2114;
      id v18 = v9;
      __int16 v19 = 2114;
      id v20 = (id)objc_opt_class();
      __int16 v21 = 2114;
      uint64_t v22 = v8;
      id v12 = v20;
      _os_log_impl(&dword_1C7F0A000, v11, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", buf, 0x2Au);
    }
  }
  v14.receiver = a1;
  v14.super_class = (Class)&off_1F237B1C0;
  objc_msgSendSuper2(&v14, sel_wf_parameterStateForIntentValue_parameterDefinition_, v9, v7);
  v10 = (WFBooleanSubstitutableState *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v10;
}

- (id)wf_updatedParameterDefinition:()Workflow forCodableAttribute:localizer:
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  v24.receiver = a1;
  v24.super_class = (Class)&off_1F237B1C0;
  id v9 = objc_msgSendSuper2(&v24, sel_wf_updatedParameterDefinition_forCodableAttribute_localizer_, a3, a4, v8);
  uint64_t v10 = [a1 defaultValue];
  v11 = (void *)v10;
  if (v10) {
    uint64_t v12 = v10;
  }
  else {
    uint64_t v12 = MEMORY[0x1E4F1CC28];
  }
  v29 = @"DefaultValue";
  v30[0] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
  objc_super v14 = [v9 definitionByAddingEntriesInDictionary:v13];

  uint64_t v15 = [a1 localizedTrueDisplayNameWithLocalizer:v8];
  v16 = (void *)v15;
  if (v15)
  {
    v27 = @"OnDisplayName";
    uint64_t v28 = v15;
    __int16 v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    uint64_t v18 = [v14 definitionByAddingEntriesInDictionary:v17];

    objc_super v14 = (void *)v18;
  }
  uint64_t v19 = [a1 localizedFalseDisplayNameWithLocalizer:v8];
  id v20 = (void *)v19;
  if (v19)
  {
    v25 = @"OffDisplayName";
    uint64_t v26 = v19;
    __int16 v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    uint64_t v22 = [v14 definitionByAddingEntriesInDictionary:v21];

    objc_super v14 = (void *)v22;
  }

  return v14;
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