@interface WFLinkActionArrayParameterDefinition
- (Class)parameterClass;
- (NSString)actionIdentifier;
- (WFLinkActionArrayParameterDefinition)initWithMemberValueType:(id)a3 parameterMetadata:(id)a4 actionIdentifier:(id)a5;
- (id)arraySizeRangeForWidgetFamily:(id)a3 withSizes:(id)a4;
- (id)defaultSerializedRepresentationFromParameterMetadataDefaultValue:(id)a3;
- (id)linkValueFromParameterState:(id)a3 action:(id)a4;
- (id)linkValueFromProcessedParameterValue:(id)a3;
- (id)localizedTitleForLinkValue:(id)a3;
- (id)memberParameterDefinition;
- (id)parameterDefinitionDictionary;
- (id)parameterStateFromLinkValue:(id)a3;
- (void)getLinkValueFromProcessedParameterValue:(id)a3 parameterState:(id)a4 permissionRequestor:(id)a5 runningFromToolKit:(BOOL)a6 completionHandler:(id)a7;
- (void)setActionIdentifier:(id)a3;
@end

@implementation WFLinkActionArrayParameterDefinition

- (void).cxx_destruct
{
}

- (void)setActionIdentifier:(id)a3
{
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (id)memberParameterDefinition
{
  v3 = [(WFLinkActionParameterDefinition *)self valueType];
  v4 = [v3 memberValueType];
  v5 = [(WFLinkActionParameterDefinition *)self parameterMetadata];
  v6 = [(WFLinkActionArrayParameterDefinition *)self actionIdentifier];
  v7 = objc_msgSend(v4, "wf_parameterDefinitionWithParameterMetadata:actionIdentifier:", v5, v6);

  return v7;
}

- (id)localizedTitleForLinkValue:(id)a3
{
  id v4 = a3;
  v5 = [(WFLinkActionArrayParameterDefinition *)self memberParameterDefinition];
  v6 = [v5 localizedTitleForLinkValue:v4];

  return v6;
}

- (id)parameterStateFromLinkValue:(id)a3
{
  id v4 = [a3 value];
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  id v6 = v5;

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__WFLinkActionArrayParameterDefinition_parameterStateFromLinkValue___block_invoke;
  v10[3] = &unk_1E6554AF8;
  v10[4] = self;
  v7 = objc_msgSend(v6, "if_map:", v10);

  if (v7) {
    v8 = [[WFMultipleValueParameterState alloc] initWithParameterStates:v7];
  }
  else {
    v8 = 0;
  }

  return v8;
}

id __68__WFLinkActionArrayParameterDefinition_parameterStateFromLinkValue___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 memberParameterDefinition];
  v5 = [v4 parameterStateFromLinkValue:v3];

  return v5;
}

- (id)defaultSerializedRepresentationFromParameterMetadataDefaultValue:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  id v6 = v5;
  v7 = [(WFLinkActionParameterDefinition *)self valueType];
  v8 = [v7 memberValueType];
  v9 = objc_msgSend(v6, "if_objectsOfClass:", objc_msgSend(v8, "objectClass"));

  if (v9)
  {
    v10 = [(WFLinkActionArrayParameterDefinition *)self memberParameterDefinition];
    v11 = [v10 defaultSerializedRepresentationFromParameterMetadataDefaultValues:v4];
    v12 = v11;
    if (v11)
    {
      id v13 = v11;
    }
    else
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __105__WFLinkActionArrayParameterDefinition_defaultSerializedRepresentationFromParameterMetadataDefaultValue___block_invoke;
      v15[3] = &unk_1E65572C8;
      id v16 = v10;
      objc_msgSend(v9, "if_compactMap:", v15);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

uint64_t __105__WFLinkActionArrayParameterDefinition_defaultSerializedRepresentationFromParameterMetadataDefaultValue___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) defaultSerializedRepresentationFromParameterMetadataDefaultValue:a2];
}

- (id)arraySizeRangeForWidgetFamily:(id)a3 withSizes:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (!v7)
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"WFLinkActionArrayParameterDefinition.m", 142, @"Invalid parameter not satisfying: %@", @"widgetFamily" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_20:
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"WFLinkActionArrayParameterDefinition.m", 143, @"Invalid parameter not satisfying: %@", @"sizes" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_20;
  }
LABEL_3:
  v10 = [v9 objectForKeyedSubscript:v7];
  v11 = v10;
  if (v10)
  {
    v12 = [v10 min];
    uint64_t v13 = [v12 integerValue];

    v14 = [v11 max];
    uint64_t v15 = [v14 integerValue] - v13 + 1;

    id v16 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v13, v15);
    goto LABEL_14;
  }
  char v17 = [v7 isEqualToString:*MEMORY[0x1E4F727E0]];
  v18 = (void *)*MEMORY[0x1E4F727E8];
  if (v17) {
    goto LABEL_13;
  }
  char v19 = [v7 isEqualToString:v18];
  v18 = (void *)*MEMORY[0x1E4F727F0];
  if (v19) {
    goto LABEL_13;
  }
  char v20 = [v7 isEqualToString:v18];
  v18 = (void *)*MEMORY[0x1E4F727F8];
  if (v20) {
    goto LABEL_13;
  }
  if ([v7 isEqualToString:v18]) {
    goto LABEL_9;
  }
  char v21 = [v7 isEqualToString:*MEMORY[0x1E4F727D8]];
  v18 = (void *)*MEMORY[0x1E4F727C0];
  if (v21) {
    goto LABEL_13;
  }
  char v22 = [v7 isEqualToString:v18];
  v18 = (void *)*MEMORY[0x1E4F727C8];
  if (v22) {
    goto LABEL_13;
  }
  char v23 = [v7 isEqualToString:v18];
  v18 = (void *)*MEMORY[0x1E4F727D0];
  if (v23) {
    goto LABEL_13;
  }
  if ([v7 isEqualToString:v18])
  {
LABEL_9:
    v18 = (void *)*MEMORY[0x1E4F72800];
LABEL_13:
    id v24 = v18;
    id v16 = [(WFLinkActionArrayParameterDefinition *)self arraySizeRangeForWidgetFamily:v24 withSizes:v9];

    goto LABEL_14;
  }
  id v16 = 0;
LABEL_14:

  return v16;
}

- (id)parameterDefinitionDictionary
{
  v42[8] = *MEMORY[0x1E4F143B8];
  id v3 = [(WFLinkActionArrayParameterDefinition *)self memberParameterDefinition];
  id v4 = [v3 parameterDefinitionDictionary];

  v5 = [(WFLinkActionParameterDefinition *)self objectForTypeSpecificMetadataKey:*MEMORY[0x1E4F72A00] ofClass:objc_opt_class()];
  id v6 = [v4 objectForKey:@"DefaultValue"];

  if (!v6)
  {
    uint64_t v7 = [(WFLinkActionArrayParameterDefinition *)self defaultSerializedRepresentationFromParameterMetadataDefaultValue:v5];
    id v8 = (void *)v7;
    if (v7)
    {
      v40 = @"DefaultValue";
      uint64_t v41 = v7;
      v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
      uint64_t v10 = [v4 definitionByAddingEntriesInDictionary:v9];

      id v4 = (void *)v10;
    }
  }
  v11 = [(WFLinkActionParameterDefinition *)self objectForTypeSpecificMetadataKey:*MEMORY[0x1E4F729C0] ofClass:objc_opt_class()];
  v12 = objc_msgSend(v11, "if_dictionaryWithNonEmptyValues");

  uint64_t v13 = MEMORY[0x1E4F1CC38];
  if (v12)
  {
    uint64_t v14 = *MEMORY[0x1E4F727F8];
    v42[0] = *MEMORY[0x1E4F72800];
    v42[1] = v14;
    uint64_t v15 = *MEMORY[0x1E4F727E8];
    v42[2] = *MEMORY[0x1E4F727F0];
    v42[3] = v15;
    uint64_t v16 = *MEMORY[0x1E4F727C0];
    v42[4] = *MEMORY[0x1E4F727E0];
    v42[5] = v16;
    uint64_t v17 = *MEMORY[0x1E4F727D0];
    v42[6] = *MEMORY[0x1E4F727D8];
    v42[7] = v17;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:8];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __69__WFLinkActionArrayParameterDefinition_parameterDefinitionDictionary__block_invoke;
    v34[3] = &unk_1E6554A90;
    v34[4] = self;
    id v19 = v11;
    id v35 = v19;
    char v20 = objc_msgSend(v18, "if_compactMap:", v34);
    uint64_t v28 = MEMORY[0x1E4F143A8];
    uint64_t v29 = 3221225472;
    v30 = __69__WFLinkActionArrayParameterDefinition_parameterDefinitionDictionary__block_invoke_2;
    v31 = &unk_1E6554AB8;
    v32 = self;
    id v33 = v19;
    char v21 = objc_msgSend(v18, "if_objectsPassingTest:", &v28);
    char v22 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:", v20, v21, v28, v29, v30, v31, v32);
    v38[0] = @"RangedSizeArray";
    v38[1] = @"ArraySizeRangesForWidgetFamily";
    v39[0] = v13;
    v39[1] = v22;
    char v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:2];
    uint64_t v24 = [v4 definitionByAddingEntriesInDictionary:v23];

    id v4 = (void *)v24;
  }
  v36 = @"AllowsMultipleValues";
  uint64_t v37 = v13;
  v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
  v26 = [v4 definitionByAddingEntriesInDictionary:v25];

  return v26;
}

uint64_t __69__WFLinkActionArrayParameterDefinition_parameterDefinitionDictionary__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) arraySizeRangeForWidgetFamily:a2 withSizes:*(void *)(a1 + 40)];
}

BOOL __69__WFLinkActionArrayParameterDefinition_parameterDefinitionDictionary__block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) arraySizeRangeForWidgetFamily:a2 withSizes:*(void *)(a1 + 40)];
  BOOL v3 = v2 != 0;

  return v3;
}

- (Class)parameterClass
{
  v2 = [(WFLinkActionArrayParameterDefinition *)self memberParameterDefinition];
  BOOL v3 = [v2 parameterClass];

  return (Class)v3;
}

- (void)getLinkValueFromProcessedParameterValue:(id)a3 parameterState:(id)a4 permissionRequestor:(id)a5 runningFromToolKit:(BOOL)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = v12;
  if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __152__WFLinkActionArrayParameterDefinition_getLinkValueFromProcessedParameterValue_parameterState_permissionRequestor_runningFromToolKit_completionHandler___block_invoke_2;
    v22[3] = &unk_1E6554A68;
    v22[4] = self;
    id v23 = v13;
    id v24 = v14;
    BOOL v25 = a6;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __152__WFLinkActionArrayParameterDefinition_getLinkValueFromProcessedParameterValue_parameterState_permissionRequestor_runningFromToolKit_completionHandler___block_invoke_4;
    v20[3] = &unk_1E6558040;
    v20[4] = self;
    id v21 = v15;
    id v17 = v15;
    objc_msgSend(v16, "if_mapAsynchronously:completionHandler:", v22, v20);

    v18 = v16;
  }
  else
  {

    v18 = [(WFLinkActionArrayParameterDefinition *)self memberParameterDefinition];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __152__WFLinkActionArrayParameterDefinition_getLinkValueFromProcessedParameterValue_parameterState_permissionRequestor_runningFromToolKit_completionHandler___block_invoke;
    v26[3] = &unk_1E6558040;
    v26[4] = self;
    id v27 = v15;
    id v19 = v15;
    [v18 getLinkArrayValuesFromProcessedParameterValue:v16 parameterState:v13 permissionRequestor:v14 completionHandler:v26];
  }
}

void __152__WFLinkActionArrayParameterDefinition_getLinkValueFromProcessedParameterValue_parameterState_permissionRequestor_runningFromToolKit_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 40);
  id v14 = v5;
  if (v5)
  {
    uint64_t v7 = (objc_class *)MEMORY[0x1E4F72E10];
    id v8 = a3;
    id v9 = [v7 alloc];
    id v10 = [*(id *)(a1 + 32) valueType];
    v11 = [v10 memberValueType];
    id v12 = (void *)[v9 initWithValues:v14 memberValueType:v11];
    (*(void (**)(uint64_t, void *, id))(v6 + 16))(v6, v12, v8);
  }
  else
  {
    id v13 = *(void (**)(uint64_t, void, id))(v6 + 16);
    id v10 = a3;
    v13(v6, 0, v10);
  }
}

void __152__WFLinkActionArrayParameterDefinition_getLinkValueFromProcessedParameterValue_parameterState_permissionRequestor_runningFromToolKit_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = a2;
  id v9 = [v7 memberParameterDefinition];
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 48);
  uint64_t v12 = *(unsigned __int8 *)(a1 + 56);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __152__WFLinkActionArrayParameterDefinition_getLinkValueFromProcessedParameterValue_parameterState_permissionRequestor_runningFromToolKit_completionHandler___block_invoke_3;
  v14[3] = &unk_1E6554A40;
  id v15 = v6;
  id v13 = v6;
  [v9 getLinkValueFromProcessedParameterValue:v8 parameterState:v10 permissionRequestor:v11 runningFromToolKit:v12 completionHandler:v14];
}

void __152__WFLinkActionArrayParameterDefinition_getLinkValueFromProcessedParameterValue_parameterState_permissionRequestor_runningFromToolKit_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = a3;
  id v7 = [v5 linkValueWithValue:a2];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v7, v6);
}

uint64_t __152__WFLinkActionArrayParameterDefinition_getLinkValueFromProcessedParameterValue_parameterState_permissionRequestor_runningFromToolKit_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)linkValueFromProcessedParameterValue:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = [(WFLinkActionParameterDefinition *)self valueType];
    char v6 = [v5 objectIsMemberOfType:v4];

    if (v6)
    {
      id v7 = objc_alloc(MEMORY[0x1E4F72E10]);
      id v8 = [(WFLinkActionParameterDefinition *)self valueType];
      id v9 = [v8 memberValueType];
      uint64_t v10 = (void *)[v7 initWithValues:v4 memberValueType:v9];

      goto LABEL_8;
    }
    uint64_t v11 = getWFAppIntentsLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      uint64_t v12 = [(WFLinkActionParameterDefinition *)self valueType];
      int v14 = 136315650;
      id v15 = "-[WFLinkActionArrayParameterDefinition linkValueFromProcessedParameterValue:]";
      __int16 v16 = 2112;
      id v17 = v4;
      __int16 v18 = 2112;
      id v19 = v12;
    }
  }
  uint64_t v10 = 0;
LABEL_8:

  return v10;
}

- (id)linkValueFromParameterState:(id)a3 action:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v9 = [v8 parameterStates];
    if (v9)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = 0;
      }
    }
    else
    {
      uint64_t v10 = 0;
    }
    id v12 = v10;

    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    id v17 = __75__WFLinkActionArrayParameterDefinition_linkValueFromParameterState_action___block_invoke;
    __int16 v18 = &unk_1E6554A18;
    id v19 = self;
    id v20 = v7;
    id v13 = objc_msgSend(v12, "if_compactMap:", &v15);

    if (v13)
    {
      uint64_t v11 = -[WFLinkActionParameterDefinition linkValueWithValue:](self, "linkValueWithValue:", v13, v15, v16, v17, v18, v19);
    }
    else
    {
      uint64_t v11 = 0;
    }
  }
  else
  {

    uint64_t v11 = 0;
  }

  return v11;
}

id __75__WFLinkActionArrayParameterDefinition_linkValueFromParameterState_action___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 memberParameterDefinition];
  id v6 = [v5 linkValueFromParameterState:v4 action:*(void *)(a1 + 40)];

  return v6;
}

- (WFLinkActionArrayParameterDefinition)initWithMemberValueType:(id)a3 parameterMetadata:(id)a4 actionIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = (objc_class *)MEMORY[0x1E4F72B08];
  id v10 = a4;
  id v11 = a3;
  id v12 = (void *)[[v9 alloc] initWithMemberValueType:v11];

  v18.receiver = self;
  v18.super_class = (Class)WFLinkActionArrayParameterDefinition;
  id v13 = [(WFLinkActionParameterDefinition *)&v18 initWithValueType:v12 parameterMetadata:v10];

  if (v13)
  {
    uint64_t v14 = [v8 copy];
    actionIdentifier = v13->_actionIdentifier;
    v13->_actionIdentifier = (NSString *)v14;

    uint64_t v16 = v13;
  }

  return v13;
}

@end