@interface WFLinkActionFileParameterDefinition
- (Class)parameterClass;
- (NSArray)supportedUTIs;
- (WFLinkActionFileParameterDefinition)initWithParameterMetadata:(id)a3;
- (id)linkValueFromParameterState:(id)a3 action:(id)a4;
- (id)localizedTitleForLinkValue:(id)a3;
- (id)parameterDefinitionDictionary;
- (id)parameterStateFromLinkValue:(id)a3;
- (void)getLinkValueFromProcessedParameterValue:(id)a3 parameterState:(id)a4 permissionRequestor:(id)a5 runningFromToolKit:(BOOL)a6 completionHandler:(id)a7;
@end

@implementation WFLinkActionFileParameterDefinition

- (NSArray)supportedUTIs
{
  uint64_t v3 = *MEMORY[0x1E4F72A08];
  uint64_t v4 = objc_opt_class();
  return (NSArray *)[(WFLinkActionParameterDefinition *)self objectForTypeSpecificMetadataKey:v3 ofClass:v4];
}

- (id)parameterStateFromLinkValue:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 value];
  if (!v4)
  {
LABEL_12:
    v11 = 0;
    goto LABEL_19;
  }
  v5 = [(WFLinkActionParameterDefinition *)self valueType];
  char v6 = [v5 objectIsMemberOfType:v4];

  if ((v6 & 1) == 0)
  {
    v18 = getWFAppIntentsLogObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = [(WFLinkActionParameterDefinition *)self valueType];
      int v22 = 136315650;
      v23 = "-[WFLinkActionFileParameterDefinition parameterStateFromLinkValue:]";
      __int16 v24 = 2114;
      v25 = v4;
      __int16 v26 = 2114;
      v27 = v19;
        (uint8_t *)&v22,
        0x20u);
    }
    goto LABEL_12;
  }
  id v7 = v4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass) {
    v9 = v7;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  v11 = 0;
  if ((isKindOfClass & 1) == 0) {
    goto LABEL_18;
  }
  v12 = [v7 _bookmarkData];

  if (v12)
  {
    v13 = [WFFileValue alloc];
    v14 = [v7 _bookmarkData];
    v15 = [v7 filename];
    v16 = [v7 filename];
    v17 = [(WFFileValue *)v13 initWithBookmarkData:v14 filename:v15 displayName:v16];

    goto LABEL_15;
  }
  v11 = [v7 fileURL];

  if (v11)
  {
    v20 = [WFFileValue alloc];
    v14 = [v7 fileURL];
    v17 = [(WFFileValue *)v20 initWithURL:v14];
LABEL_15:

    if (v17)
    {
      v11 = [(WFVariableSubstitutableParameterState *)[WFFileParameterState alloc] initWithValue:v17];
    }
    else
    {
      v11 = 0;
    }
  }
LABEL_18:

LABEL_19:
  return v11;
}

- (void)getLinkValueFromProcessedParameterValue:(id)a3 parameterState:(id)a4 permissionRequestor:(id)a5 runningFromToolKit:(BOOL)a6 completionHandler:(id)a7
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a7;
  v13 = v12;
  if (v10)
  {
    v14 = (void *)MEMORY[0x1E4F30420];
    v15 = [(WFLinkActionFileParameterDefinition *)self supportedUTIs];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __151__WFLinkActionFileParameterDefinition_getLinkValueFromProcessedParameterValue_parameterState_permissionRequestor_runningFromToolKit_completionHandler___block_invoke;
    v16[3] = &unk_1E6556670;
    v16[4] = self;
    id v17 = v13;
    objc_msgSend(v14, "wf_processParameterValue:parameterState:coerceToSupportedUTIs:array:dynamicOptions:completionHandler:", v10, v11, v15, 0, 0, v16);
  }
  else
  {
    (*((void (**)(id, void, void))v12 + 2))(v12, 0, 0);
  }
}

void __151__WFLinkActionFileParameterDefinition_getLinkValueFromProcessedParameterValue_parameterState_permissionRequestor_runningFromToolKit_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (a2)
  {
    id v5 = [*(id *)(a1 + 32) linkValueWithValue:a2];
    (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, v5, 0);
  }
  else
  {
    uint64_t v3 = *(void (**)(uint64_t))(v2 + 16);
    uint64_t v4 = *(void *)(a1 + 40);
    v3(v4);
  }
}

- (id)linkValueFromParameterState:(id)a3 action:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [v8 value];
      id v10 = [v9 bookmarkData];

      if (v10)
      {
        id v11 = (void *)MEMORY[0x1E4F30420];
        id v12 = [v9 bookmarkData];
        v13 = [v9 filename];
        v14 = objc_msgSend(v11, "wf_fileWithBookmarkData:filename:", v12, v13);
      }
      else if (v7)
      {
        id v17 = [v7 workflow];
        v14 = [v17 workflowID];

        uint64_t v25 = 0;
        uint64_t v18 = [v9 resolveURLWithWorkflowID:v14 error:&v25];
        if (!v18)
        {
          v15 = 0;
          goto LABEL_6;
        }
        v19 = (void *)v18;
        v20 = (void *)MEMORY[0x1E4F30420];
        v21 = [v9 filename];
        int v22 = [v19 wfFileType];
        v23 = [v22 string];
        uint64_t v24 = [v20 fileWithFileURL:v19 filename:v21 typeIdentifier:v23];

        v14 = (void *)v24;
        if (!v24)
        {
          v15 = 0;
          goto LABEL_7;
        }
      }
      else
      {
        v14 = 0;
      }
      v15 = [(WFLinkActionParameterDefinition *)self linkValueWithValue:v14];
LABEL_6:

LABEL_7:
      goto LABEL_9;
    }
  }

  v15 = 0;
LABEL_9:

  return v15;
}

- (id)parameterDefinitionDictionary
{
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(WFLinkActionFileParameterDefinition *)self supportedUTIs];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)WFLinkActionFileParameterDefinition;
    id v5 = [(WFLinkActionParameterDefinition *)&v10 parameterDefinitionDictionary];
    id v12 = @"FilePickerSupportedTypes";
    id v6 = [(WFLinkActionFileParameterDefinition *)self supportedUTIs];
    v13[0] = v6;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    id v8 = [v5 definitionByAddingEntriesInDictionary:v7];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)WFLinkActionFileParameterDefinition;
    id v8 = [(WFLinkActionParameterDefinition *)&v11 parameterDefinitionDictionary];
  }
  return v8;
}

- (id)localizedTitleForLinkValue:(id)a3
{
  uint64_t v3 = [a3 value];
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v4 = v3;
    }
    else {
      uint64_t v4 = 0;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = v4;

  id v6 = [v5 filename];

  return v6;
}

- (Class)parameterClass
{
  return (Class)objc_opt_class();
}

- (WFLinkActionFileParameterDefinition)initWithParameterMetadata:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F72CB8];
  id v5 = a3;
  id v6 = [v4 fileValueType];
  v9.receiver = self;
  v9.super_class = (Class)WFLinkActionFileParameterDefinition;
  id v7 = [(WFLinkActionParameterDefinition *)&v9 initWithValueType:v6 parameterMetadata:v5];

  return v7;
}

@end