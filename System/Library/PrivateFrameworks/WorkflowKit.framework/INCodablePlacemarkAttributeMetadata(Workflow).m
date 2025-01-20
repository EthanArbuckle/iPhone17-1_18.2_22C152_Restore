@interface INCodablePlacemarkAttributeMetadata(Workflow)
- (WFLocationParameterState)wf_parameterStateForIntentValue:()Workflow parameterDefinition:;
- (id)wf_updatedParameterDefinition:()Workflow forCodableAttribute:localizer:;
- (uint64_t)wf_parameterClass;
@end

@implementation INCodablePlacemarkAttributeMetadata(Workflow)

- (WFLocationParameterState)wf_parameterStateForIntentValue:()Workflow parameterDefinition:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id CLPlacemarkClass = getCLPlacemarkClass();
  id v9 = v6;
  if (v9)
  {
    if (objc_opt_isKindOfClass())
    {
      v10 = [[WFLocationValue alloc] initWithPlacemark:v9];
      v11 = [[WFLocationParameterState alloc] initWithValue:v10];

      goto LABEL_8;
    }
    v12 = getWFGeneralLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315906;
      v17 = "WFEnforceClass";
      __int16 v18 = 2114;
      id v19 = v9;
      __int16 v20 = 2114;
      id v21 = (id)objc_opt_class();
      __int16 v22 = 2114;
      id v23 = CLPlacemarkClass;
      id v13 = v21;
      _os_log_impl(&dword_1C7F0A000, v12, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", buf, 0x2Au);
    }
  }
  v15.receiver = a1;
  v15.super_class = (Class)&off_1F2388870;
  objc_msgSendSuper2(&v15, sel_wf_parameterStateForIntentValue_parameterDefinition_, v9, v7);
  v11 = (WFLocationParameterState *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v11;
}

- (id)wf_updatedParameterDefinition:()Workflow forCodableAttribute:localizer:
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v6.receiver = a1;
  v6.super_class = (Class)&off_1F2388870;
  v2 = objc_msgSendSuper2(&v6, sel_wf_updatedParameterDefinition_forCodableAttribute_localizer_);
  if ([a1 type] == 2)
  {
    id v7 = @"CurrentLocationAccuracy";
    v8[0] = @"ThreeKilometers";
    v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    uint64_t v4 = [v2 definitionByAddingEntriesInDictionary:v3];

    v2 = (void *)v4;
  }
  return v2;
}

- (uint64_t)wf_parameterClass
{
  return objc_opt_class();
}

@end