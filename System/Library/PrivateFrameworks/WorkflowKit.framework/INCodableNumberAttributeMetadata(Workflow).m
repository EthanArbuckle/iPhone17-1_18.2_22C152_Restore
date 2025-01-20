@interface INCodableNumberAttributeMetadata(Workflow)
- (WFNumberSubstitutableState)wf_parameterStateForIntentValue:()Workflow parameterDefinition:;
- (id)wf_parameterClass;
- (id)wf_updatedParameterDefinition:()Workflow forCodableAttribute:localizer:;
- (uint64_t)wf_objectClass;
@end

@implementation INCodableNumberAttributeMetadata(Workflow)

- (WFNumberSubstitutableState)wf_parameterStateForIntentValue:()Workflow parameterDefinition:
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_class();
  id v9 = v6;
  if (v9)
  {
    if (objc_opt_isKindOfClass())
    {
      if ([a1 type])
      {
        v10 = [[WFNumberSubstitutableState alloc] initWithNumber:v9];
      }
      else
      {
        v13 = [WFNumberStringSubstitutableState alloc];
        v14 = [v9 stringValue];
        v10 = [(WFNumberStringSubstitutableState *)v13 initWithValue:v14];
      }
      goto LABEL_11;
    }
    v11 = getWFGeneralLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315906;
      v18 = "WFEnforceClass";
      __int16 v19 = 2114;
      id v20 = v9;
      __int16 v21 = 2114;
      id v22 = (id)objc_opt_class();
      __int16 v23 = 2114;
      uint64_t v24 = v8;
      id v12 = v22;
      _os_log_impl(&dword_1C7F0A000, v11, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", buf, 0x2Au);
    }
  }
  v16.receiver = a1;
  v16.super_class = (Class)&off_1F2379188;
  objc_msgSendSuper2(&v16, sel_wf_parameterStateForIntentValue_parameterDefinition_, v9, v7);
  v10 = (WFNumberSubstitutableState *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v10;
}

- (id)wf_updatedParameterDefinition:()Workflow forCodableAttribute:localizer:
{
  v48[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  v34.receiver = a1;
  v34.super_class = (Class)&off_1F2379188;
  v10 = objc_msgSendSuper2(&v34, sel_wf_updatedParameterDefinition_forCodableAttribute_localizer_, a3, v8, v9);
  uint64_t v11 = [a1 type];
  id v12 = [a1 defaultValue];
  if (v12)
  {
    if ([a1 type])
    {
      v45 = @"DefaultValue";
      v46 = v12;
      v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
      uint64_t v14 = [v10 definitionByAddingEntriesInDictionary:v13];
    }
    else
    {
      v47 = @"DefaultValue";
      v13 = [v12 stringValue];
      v48[0] = v13;
      uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:&v47 count:1];
      uint64_t v14 = [v10 definitionByAddingEntriesInDictionary:v15];

      v10 = (void *)v15;
    }

    v10 = (void *)v14;
  }
  v43 = @"AllowsNegativeNumbers";
  objc_super v16 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "supportsNegativeNumbers"));
  v44 = v16;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
  v18 = [v10 definitionByAddingEntriesInDictionary:v17];

  if (!v11)
  {
    v35 = @"AllowsDecimalNumbers";
    uint64_t v31 = [v8 valueType];
    uint64_t v32 = MEMORY[0x1E4F1CC28];
    if (v31 == 21) {
      uint64_t v32 = MEMORY[0x1E4F1CC38];
    }
    uint64_t v36 = v32;
    uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
    uint64_t v30 = [v18 definitionByAddingEntriesInDictionary:v25];
    goto LABEL_16;
  }
  __int16 v19 = [a1 minimumValue];
  id v20 = [a1 maximumValue];
  if (v19)
  {
    v41 = @"MinimumValue";
    v42 = v19;
    __int16 v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
    uint64_t v22 = [v18 definitionByAddingEntriesInDictionary:v21];

    v18 = (void *)v22;
  }
  if (v20)
  {
    v39 = @"MaximumValue";
    v40 = v20;
    __int16 v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v40 forKeys:&v39 count:1];
    uint64_t v24 = [v18 definitionByAddingEntriesInDictionary:v23];

    v18 = (void *)v24;
  }

  if (v11 == 1)
  {
    v37[0] = @"StepperDescription";
    uint64_t v25 = [v8 localizedDisplayNameWithLocalizer:v9];
    v37[1] = @"StepperNoun";
    v38[0] = v25;
    v26 = NSString;
    uint64_t v27 = [v8 localizedDisplayNameWithLocalizer:v9];
    v28 = [v26 localizedStringWithFormat:@"%@: %@", v27, @"%ld"];
    v38[1] = v28;
    v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:2];
    uint64_t v30 = [v18 definitionByAddingEntriesInDictionary:v29];

    v18 = (void *)v27;
LABEL_16:

    v18 = (void *)v30;
  }

  return v18;
}

- (id)wf_parameterClass
{
  if ((unint64_t)[a1 type] > 2)
  {
    v1 = 0;
  }
  else
  {
    v1 = objc_opt_class();
  }
  return v1;
}

- (uint64_t)wf_objectClass
{
  return objc_opt_class();
}

@end