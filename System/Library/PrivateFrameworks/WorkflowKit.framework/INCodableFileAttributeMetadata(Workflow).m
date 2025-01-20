@interface INCodableFileAttributeMetadata(Workflow)
- (WFFileParameterState)wf_parameterStateForIntentValue:()Workflow parameterDefinition:;
- (id)wf_updatedParameterDefinition:()Workflow forCodableAttribute:localizer:;
- (uint64_t)wf_objectClass;
- (uint64_t)wf_parameterClass;
- (uint64_t)wf_processParameterValue:()Workflow forParameter:parameterState:codableAttribute:completionHandler:;
@end

@implementation INCodableFileAttributeMetadata(Workflow)

- (id)wf_updatedParameterDefinition:()Workflow forCodableAttribute:localizer:
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v7.receiver = a1;
  v7.super_class = (Class)&off_1F238D3D8;
  v2 = objc_msgSendSuper2(&v7, sel_wf_updatedParameterDefinition_forCodableAttribute_localizer_);
  v8 = @"FilePickerSupportedTypes";
  v3 = [a1 UTIs];
  v9[0] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  v5 = [v2 definitionByAddingEntriesInDictionary:v4];

  return v5;
}

- (WFFileParameterState)wf_parameterStateForIntentValue:()Workflow parameterDefinition:
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_super v7 = v5;
    }
    else {
      objc_super v7 = 0;
    }
  }
  else
  {
    objc_super v7 = 0;
  }
  id v8 = v7;
  v9 = [v8 _bookmarkData];

  if (v9)
  {
    v10 = [WFFileValue alloc];
    v11 = [v8 _bookmarkData];
    v12 = [v8 filename];
    v13 = [v8 filename];
    v14 = [(WFFileValue *)v10 initWithBookmarkData:v11 filename:v12 displayName:v13];
  }
  else
  {
    v15 = [v8 fileURL];

    if (!v15) {
      goto LABEL_12;
    }
    v16 = [WFFileValue alloc];
    v11 = [v8 fileURL];
    v14 = [(WFFileValue *)v16 initWithURL:v11];
  }

  if (v14)
  {
    v17 = [(WFVariableSubstitutableParameterState *)[WFFileParameterState alloc] initWithValue:v14];

    goto LABEL_13;
  }
LABEL_12:
  v17 = 0;
LABEL_13:

  return v17;
}

- (uint64_t)wf_processParameterValue:()Workflow forParameter:parameterState:codableAttribute:completionHandler:
{
  v11 = (void *)MEMORY[0x1E4F30420];
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a3;
  v16 = [a1 UTIs];
  uint64_t v17 = objc_msgSend(v13, "wf_multipleValues");
  uint64_t v18 = [v13 supportsDynamicEnumeration];

  uint64_t v19 = objc_msgSend(v11, "wf_processParameterValue:parameterState:coerceToSupportedUTIs:array:dynamicOptions:completionHandler:", v15, v14, v16, v17, v18, v12);
  return v19;
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