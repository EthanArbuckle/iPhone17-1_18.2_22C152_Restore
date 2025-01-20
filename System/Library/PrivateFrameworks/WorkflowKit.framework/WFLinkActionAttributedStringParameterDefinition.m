@interface WFLinkActionAttributedStringParameterDefinition
- (Class)parameterClass;
- (WFLinkActionAttributedStringParameterDefinition)initWithParameterMetadata:(id)a3;
- (id)linkValueFromParameterState:(id)a3 action:(id)a4;
- (id)localizedTitleForLinkValue:(id)a3;
- (id)parameterDefinitionDictionary;
- (id)parameterStateFromLinkValue:(id)a3;
- (void)getLinkValueFromProcessedParameterValue:(id)a3 parameterState:(id)a4 permissionRequestor:(id)a5 runningFromToolKit:(BOOL)a6 completionHandler:(id)a7;
@end

@implementation WFLinkActionAttributedStringParameterDefinition

- (id)localizedTitleForLinkValue:(id)a3
{
  v3 = [a3 value];
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v4 = v3;
    }
    else {
      v4 = 0;
    }
  }
  else
  {
    v4 = 0;
  }
  id v5 = v4;

  v6 = [v5 string];

  return v6;
}

- (void)getLinkValueFromProcessedParameterValue:(id)a3 parameterState:(id)a4 permissionRequestor:(id)a5 runningFromToolKit:(BOOL)a6 completionHandler:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v14 = (void (**)(id, void *, void))a7;
  id v15 = v11;
  if (!v15) {
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    id v17 = v15;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v18 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v17];
      v19 = [(WFLinkActionParameterDefinition *)self linkValueWithValue:v18];
      v14[2](v14, v19, 0);

LABEL_8:
      goto LABEL_10;
    }

    id v17 = v17;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __163__WFLinkActionAttributedStringParameterDefinition_getLinkValueFromProcessedParameterValue_parameterState_permissionRequestor_runningFromToolKit_completionHandler___block_invoke;
      v20[3] = &unk_1E65568A0;
      v20[4] = self;
      v21 = v14;
      [v17 getRichTextRepresentation:v20];

      goto LABEL_8;
    }
LABEL_9:

    v14[2](v14, 0, 0);
    goto LABEL_10;
  }
  v16 = [(WFLinkActionParameterDefinition *)self linkValueWithValue:v15];
  v14[2](v14, v16, 0);

LABEL_10:
}

void __163__WFLinkActionAttributedStringParameterDefinition_getLinkValueFromProcessedParameterValue_parameterState_permissionRequestor_runningFromToolKit_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 40);
  id v10 = v5;
  if (v5)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F72E10]);
    v8 = [*(id *)(a1 + 32) valueType];
    v9 = (void *)[v7 initWithValue:v10 valueType:v8];
    (*(void (**)(uint64_t, void *, void))(v6 + 16))(v6, v9, 0);
  }
  else
  {
    (*(void (**)(uint64_t, void, uint64_t))(v6 + 16))(v6, 0, a3);
  }
}

- (id)linkValueFromParameterState:(id)a3 action:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v9 = [v8 variableString];
    id v10 = [v9 stringByRemovingVariables];

    id v11 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v10];
    id v12 = [(WFLinkActionParameterDefinition *)self linkValueWithValue:v11];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)parameterStateFromLinkValue:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v4 = [a3 value];
  if (!v4)
  {
LABEL_12:
    id v11 = 0;
    goto LABEL_13;
  }
  id v5 = [(WFLinkActionParameterDefinition *)self valueType];
  char v6 = [v5 objectIsMemberOfType:v4];

  if ((v6 & 1) == 0)
  {
    id v15 = getWFAppIntentsLogObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = [(WFLinkActionParameterDefinition *)self valueType];
      int v18 = 136315650;
      v19 = "-[WFLinkActionAttributedStringParameterDefinition parameterStateFromLinkValue:]";
      __int16 v20 = 2114;
      v21 = v4;
      __int16 v22 = 2114;
      v23 = v16;
        (uint8_t *)&v18,
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

  id v11 = 0;
  if (isKindOfClass)
  {
    id v12 = [WFVariableString alloc];
    id v13 = [v7 string];
    v14 = [(WFVariableString *)v12 initWithString:v13];

    id v11 = [[WFVariableStringParameterState alloc] initWithVariableString:v14];
  }

LABEL_13:
  return v11;
}

- (id)parameterDefinitionDictionary
{
  v9[3] = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)WFLinkActionAttributedStringParameterDefinition;
  v2 = [(WFLinkActionParameterDefinition *)&v7 parameterDefinitionDictionary];
  uint64_t v3 = *MEMORY[0x1E4FB4E60];
  v8[0] = @"TextAlignment";
  v8[1] = @"Multiline";
  v9[0] = v3;
  v9[1] = MEMORY[0x1E4F1CC38];
  v8[2] = @"ProcessIntoContentItems";
  v9[2] = MEMORY[0x1E4F1CC38];
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];
  id v5 = [v2 definitionByAddingEntriesInDictionary:v4];

  return v5;
}

- (Class)parameterClass
{
  return (Class)objc_opt_class();
}

- (WFLinkActionAttributedStringParameterDefinition)initWithParameterMetadata:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F72D18];
  id v5 = a3;
  char v6 = [v4 attributedStringValueType];
  v9.receiver = self;
  v9.super_class = (Class)WFLinkActionAttributedStringParameterDefinition;
  objc_super v7 = [(WFLinkActionParameterDefinition *)&v9 initWithValueType:v6 parameterMetadata:v5];

  return v7;
}

@end