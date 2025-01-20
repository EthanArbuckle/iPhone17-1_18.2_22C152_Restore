@interface WFLinkActionDynamicOptionsParameterDefinition
- (Class)parameterClass;
- (WFLinkActionDynamicOptionsParameterDefinition)initWithParameterMetadata:(id)a3;
- (id)defaultSerializedRepresentationFromParameterMetadataDefaultValue:(id)a3;
- (id)linkValueFromParameterState:(id)a3 action:(id)a4;
- (id)localizedTitleForLinkValue:(id)a3;
- (id)parameterStateFromLinkValue:(id)a3;
- (void)getLinkValueFromProcessedParameterValue:(id)a3 parameterState:(id)a4 permissionRequestor:(id)a5 runningFromToolKit:(BOOL)a6 completionHandler:(id)a7;
@end

@implementation WFLinkActionDynamicOptionsParameterDefinition

- (WFLinkActionDynamicOptionsParameterDefinition)initWithParameterMetadata:(id)a3
{
  id v4 = a3;
  v5 = [v4 valueType];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [v5 memberValueType];

    v5 = (void *)v6;
  }
  v9.receiver = self;
  v9.super_class = (Class)WFLinkActionDynamicOptionsParameterDefinition;
  v7 = [(WFLinkActionParameterDefinition *)&v9 initWithValueType:v5 parameterMetadata:v4];

  return v7;
}

- (id)linkValueFromParameterState:(id)a3 action:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = [v7 value];
    objc_super v9 = [v8 value];
  }
  else
  {
    objc_super v9 = 0;
  }

  return v9;
}

- (Class)parameterClass
{
  return (Class)objc_opt_class();
}

- (id)defaultSerializedRepresentationFromParameterMetadataDefaultValue:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = [(WFLinkActionParameterDefinition *)self objectForTypeSpecificMetadataKey:@"LNValueTypeSpecificMetadataKeyLinkEnumerationMetadata" ofClass:objc_opt_class()];
    id v6 = [v5 cases];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __114__WFLinkActionDynamicOptionsParameterDefinition_defaultSerializedRepresentationFromParameterMetadataDefaultValue___block_invoke;
    v19[3] = &unk_1E65581D0;
    id v7 = v4;
    id v20 = v7;
    v8 = objc_msgSend(v6, "if_firstObjectPassingTest:", v19);

    if (v8)
    {
      id v9 = objc_alloc(MEMORY[0x1E4F72CC0]);
      v10 = [v5 identifier];
      v11 = (void *)[v9 initWithEnumerationIdentifier:v10];

      id v12 = objc_alloc(MEMORY[0x1E4F72E10]);
      v13 = [v8 identifier];
      v14 = [v8 displayRepresentation];
      v15 = (void *)[v12 initWithValue:v13 valueType:v11 displayRepresentation:v14];

      v16 = (void *)[objc_alloc(MEMORY[0x1E4F72C08]) initWithValue:v15 indentationLevel:0];
      v17 = +[WFLinkDynamicOptionSubstitutableState serializedRepresentationFromValue:v16];
    }
    else
    {
      v17 = 0;
    }
  }
  else
  {

    v17 = 0;
  }

  return v17;
}

- (void)getLinkValueFromProcessedParameterValue:(id)a3 parameterState:(id)a4 permissionRequestor:(id)a5 runningFromToolKit:(BOOL)a6 completionHandler:(id)a7
{
  id v13 = a3;
  v8 = (void (**)(id, id, void))a7;
  if (v13)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass) {
      v10 = v13;
    }
    else {
      v10 = 0;
    }
    id v11 = v10;
    if (isKindOfClass) {
      id v12 = v13;
    }
    else {
      id v12 = 0;
    }
    v8[2](v8, v12, 0);
  }
  else
  {
    v8[2](v8, 0, 0);
  }
}

- (id)parameterStateFromLinkValue:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 value];
  if (v5)
  {
    id v6 = [(WFLinkActionParameterDefinition *)self valueType];
    char v7 = [v6 objectIsMemberOfType:v5];

    if (v7)
    {
      v8 = (void *)[objc_alloc(MEMORY[0x1E4F72C08]) initWithValue:v4 indentationLevel:0];
      id v9 = [WFLinkDynamicOptionSubstitutableState alloc];
      v10 = [v8 title];
      id v11 = objc_msgSend(v10, "wf_localizedString");
      id v12 = [v8 subtitle];
      id v13 = objc_msgSend(v12, "wf_localizedString");
      v14 = [v8 image];
      v15 = objc_msgSend(v14, "wf_image");
      v16 = [(WFLinkDynamicOptionSubstitutableState *)v9 initWithValue:v8 localizedTitle:v11 localizedSubtitle:v13 image:v15];

      goto LABEL_8;
    }
    v17 = getWFAppIntentsLogObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = [(WFLinkActionParameterDefinition *)self valueType];
      int v20 = 136315650;
      v21 = "-[WFLinkActionDynamicOptionsParameterDefinition parameterStateFromLinkValue:]";
      __int16 v22 = 2114;
      v23 = v5;
      __int16 v24 = 2114;
      v25 = v18;
        (uint8_t *)&v20,
        0x20u);
    }
  }
  v16 = 0;
LABEL_8:

  return v16;
}

- (id)localizedTitleForLinkValue:(id)a3
{
  id v4 = a3;
  id v5 = [v4 valueType];
  id v6 = [(WFLinkActionParameterDefinition *)self parameterMetadata];
  char v7 = objc_msgSend(v5, "wf_parameterDefinitionWithParameterMetadata:dynamicOptionsSupport:", v6, 0);
  v8 = [v7 localizedTitleForLinkValue:v4];

  return v8;
}

uint64_t __114__WFLinkActionDynamicOptionsParameterDefinition_defaultSerializedRepresentationFromParameterMetadataDefaultValue___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

@end