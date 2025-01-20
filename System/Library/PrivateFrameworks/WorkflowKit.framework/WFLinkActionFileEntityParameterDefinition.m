@interface WFLinkActionFileEntityParameterDefinition
- (BOOL)supportsDynamicOptions;
- (Class)parameterClass;
- (id)linkValueFromParameterState:(id)a3 action:(id)a4;
- (id)parameterDefinitionDictionary;
- (id)parameterStateFromLinkValue:(id)a3;
- (id)supportedUTIs;
- (void)getLinkValueFromProcessedParameterValue:(id)a3 parameterState:(id)a4 permissionRequestor:(id)a5 runningFromToolKit:(BOOL)a6 completionHandler:(id)a7;
@end

@implementation WFLinkActionFileEntityParameterDefinition

- (id)parameterStateFromLinkValue:(id)a3
{
  id v4 = a3;
  if ([(WFLinkActionFileEntityParameterDefinition *)self supportsDynamicOptions])
  {
    v19.receiver = self;
    v19.super_class = (Class)WFLinkActionFileEntityParameterDefinition;
    v5 = [(WFLinkActionDynamicOptionsParameterDefinition *)&v19 parameterStateFromLinkValue:v4];

    goto LABEL_18;
  }
  v6 = [v4 value];

  if (v6)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass) {
      v8 = v6;
    }
    else {
      v8 = 0;
    }
    id v9 = v8;
    v5 = 0;
    if ((isKindOfClass & 1) == 0) {
      goto LABEL_16;
    }
    v10 = [v6 _bookmarkData];

    if (v10)
    {
      v11 = [WFFileValue alloc];
      v12 = [v6 _bookmarkData];
      v13 = [v6 filename];
      v14 = [v6 filename];
      v15 = [(WFFileValue *)v11 initWithBookmarkData:v12 filename:v13 displayName:v14];
    }
    else
    {
      v16 = [v6 fileURL];

      if (!v16) {
        goto LABEL_15;
      }
      v17 = [WFFileValue alloc];
      v12 = [v6 fileURL];
      v15 = [(WFFileValue *)v17 initWithURL:v12];
    }

    if (v15)
    {
      v5 = [(WFVariableSubstitutableParameterState *)[WFFileEntityParameterState alloc] initWithValue:v15];

LABEL_16:
      goto LABEL_17;
    }
LABEL_15:
    v5 = 0;
    goto LABEL_16;
  }
  v5 = 0;
LABEL_17:

LABEL_18:
  return v5;
}

- (void)getLinkValueFromProcessedParameterValue:(id)a3 parameterState:(id)a4 permissionRequestor:(id)a5 runningFromToolKit:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v16 = (void *)MEMORY[0x1E4F30420];
  v17 = [(WFLinkActionFileEntityParameterDefinition *)self supportedUTIs];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __157__WFLinkActionFileEntityParameterDefinition_getLinkValueFromProcessedParameterValue_parameterState_permissionRequestor_runningFromToolKit_completionHandler___block_invoke;
  v22[3] = &unk_1E6556670;
  id v18 = v15;
  v22[4] = self;
  id v23 = v18;
  LOBYTE(v16) = objc_msgSend(v16, "wf_processParameterValue:parameterState:coerceToSupportedUTIs:array:dynamicOptions:completionHandler:", v12, v13, v17, 0, 0, v22);

  if ((v16 & 1) == 0)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __157__WFLinkActionFileEntityParameterDefinition_getLinkValueFromProcessedParameterValue_parameterState_permissionRequestor_runningFromToolKit_completionHandler___block_invoke_2;
    v20[3] = &unk_1E6554A40;
    id v21 = v18;
    v19.receiver = self;
    v19.super_class = (Class)WFLinkActionFileEntityParameterDefinition;
    [(WFLinkActionDynamicOptionsParameterDefinition *)&v19 getLinkValueFromProcessedParameterValue:v12 parameterState:v13 permissionRequestor:v14 runningFromToolKit:v8 completionHandler:v20];
  }
}

void __157__WFLinkActionFileEntityParameterDefinition_getLinkValueFromProcessedParameterValue_parameterState_permissionRequestor_runningFromToolKit_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (a2)
  {
    id v5 = [*(id *)(a1 + 32) linkValueWithValue:a2];
    (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, v5, 0);
  }
  else
  {
    v3 = *(void (**)(uint64_t))(v2 + 16);
    uint64_t v4 = *(void *)(a1 + 40);
    v3(v4);
  }
}

uint64_t __157__WFLinkActionFileEntityParameterDefinition_getLinkValueFromProcessedParameterValue_parameterState_permissionRequestor_runningFromToolKit_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)linkValueFromParameterState:(id)a3 action:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)WFLinkActionFileEntityParameterDefinition;
  BOOL v8 = [(WFLinkActionDynamicOptionsParameterDefinition *)&v28 linkValueFromParameterState:v6 action:v7];
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
    goto LABEL_12;
  }
  id v11 = v6;
  if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v10 = 0;
    goto LABEL_11;
  }
  id v12 = [v11 value];
  id v13 = [v12 bookmarkData];

  if (v13)
  {
    id v14 = (void *)MEMORY[0x1E4F30420];
    id v15 = [v12 bookmarkData];
    v16 = [v12 filename];
    v17 = objc_msgSend(v14, "wf_fileWithBookmarkData:filename:", v15, v16);
  }
  else if (v7)
  {
    objc_super v19 = [v7 workflow];
    v17 = [v19 workflowID];

    uint64_t v27 = 0;
    uint64_t v20 = [v12 resolveURLWithWorkflowID:v17 error:&v27];
    if (!v20)
    {
      id v10 = 0;
      goto LABEL_8;
    }
    id v21 = (void *)v20;
    v25 = (void *)MEMORY[0x1E4F30420];
    v22 = [v12 filename];
    v24 = [v21 wfFileType];
    id v23 = [v24 string];
    uint64_t v26 = [v25 fileWithFileURL:v21 filename:v22 typeIdentifier:v23];

    v17 = (void *)v26;
    if (!v26)
    {
      id v10 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    v17 = 0;
  }
  id v10 = [(WFLinkActionParameterDefinition *)self linkValueWithValue:v17];
LABEL_8:

LABEL_9:
LABEL_11:

LABEL_12:
  return v10;
}

- (id)parameterDefinitionDictionary
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)WFLinkActionFileEntityParameterDefinition;
  v3 = [(WFLinkActionParameterDefinition *)&v8 parameterDefinitionDictionary];
  id v9 = @"FilePickerSupportedTypes";
  uint64_t v4 = [(WFLinkActionFileEntityParameterDefinition *)self supportedUTIs];
  v10[0] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  id v6 = [v3 definitionByAddingEntriesInDictionary:v5];

  return v6;
}

- (id)supportedUTIs
{
  v3 = [(WFLinkActionParameterDefinition *)self objectForTypeSpecificMetadataKey:*MEMORY[0x1E4F72A08] ofClass:objc_opt_class()];
  if ([v3 count])
  {
    id v4 = v3;
  }
  else
  {
    id v5 = [(WFLinkActionParameterDefinition *)self objectForTypeSpecificMetadataKey:@"LNValueTypeSpecificMetadataKeyLinkEntityMetadata" ofClass:objc_opt_class()];
    id v6 = [v5 systemProtocolMetadata];
    id v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F72928]];

    if (v7)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_super v8 = v7;
      }
      else {
        objc_super v8 = 0;
      }
    }
    else
    {
      objc_super v8 = 0;
    }
    id v9 = v8;

    id v10 = [v9 supportedContentTypes];
    uint64_t v11 = [v10 count];

    if (v11)
    {
      id v12 = [v9 supportedContentTypes];
      objc_msgSend(v12, "if_map:", &__block_literal_global_11017);
      id v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v4 = (id)MEMORY[0x1E4F1CBF0];
    }
  }
  return v4;
}

uint64_t __58__WFLinkActionFileEntityParameterDefinition_supportedUTIs__block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (Class)parameterClass
{
  return (Class)objc_opt_class();
}

- (BOOL)supportsDynamicOptions
{
  uint64_t v2 = [(WFLinkActionParameterDefinition *)self parameterMetadata];
  BOOL v3 = [v2 dynamicOptionsSupport] == 2;

  return v3;
}

@end