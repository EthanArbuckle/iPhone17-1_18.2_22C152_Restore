@interface WFLinkActionURLParameterDefinition
- (Class)parameterClass;
- (WFLinkActionURLParameterDefinition)initWithParameterMetadata:(id)a3;
- (id)defaultSerializedRepresentationFromParameterMetadataDefaultValue:(id)a3;
- (id)linkValueFromParameterState:(id)a3 action:(id)a4;
- (id)localizedTitleForLinkValue:(id)a3;
- (id)parameterDefinitionDictionary;
- (id)parameterStateFromLinkValue:(id)a3;
- (void)getLinkValueFromProcessedParameterValue:(id)a3 parameterState:(id)a4 permissionRequestor:(id)a5 runningFromToolKit:(BOOL)a6 completionHandler:(id)a7;
@end

@implementation WFLinkActionURLParameterDefinition

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

  v6 = [v5 absoluteString];

  return v6;
}

- (void)getLinkValueFromProcessedParameterValue:(id)a3 parameterState:(id)a4 permissionRequestor:(id)a5 runningFromToolKit:(BOOL)a6 completionHandler:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v14 = (void (**)(id, void *, void))a7;
  id v18 = v11;
  if (v18 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v15 = objc_alloc(MEMORY[0x1E4F72E10]);
    v16 = [(WFLinkActionParameterDefinition *)self valueType];
    v17 = (void *)[v15 initWithValue:v18 valueType:v16];
    v14[2](v14, v17, 0);
  }
  else
  {

    v14[2](v14, 0, 0);
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
    v10 = [v9 stringByRemovingVariables];

    if (v10)
    {
      id v11 = [MEMORY[0x1E4F1CB10] URLWithString:v10];
      id v12 = [(WFLinkActionParameterDefinition *)self linkValueWithValue:v11];
    }
    else
    {
      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)defaultSerializedRepresentationFromParameterMetadataDefaultValue:(id)a3
{
  id v3 = a3;
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
  id v6 = [v5 absoluteString];

  return v6;
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
      v19 = "-[WFLinkActionURLParameterDefinition parameterStateFromLinkValue:]";
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
    id v13 = [v7 absoluteString];
    v14 = [(WFVariableString *)v12 initWithString:v13];

    id v11 = [[WFVariableStringParameterState alloc] initWithVariableString:v14];
  }

LABEL_13:
  return v11;
}

- (id)parameterDefinitionDictionary
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)WFLinkActionURLParameterDefinition;
  v2 = [(WFLinkActionParameterDefinition *)&v6 parameterDefinitionDictionary];
  id v7 = @"TextAlignment";
  v8[0] = *MEMORY[0x1E4FB4E60];
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  v4 = [v2 definitionByAddingEntriesInDictionary:v3];

  return v4;
}

- (Class)parameterClass
{
  return (Class)objc_opt_class();
}

- (WFLinkActionURLParameterDefinition)initWithParameterMetadata:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F72D18];
  id v5 = a3;
  objc_super v6 = [v4 URLValueType];
  v9.receiver = self;
  v9.super_class = (Class)WFLinkActionURLParameterDefinition;
  id v7 = [(WFLinkActionParameterDefinition *)&v9 initWithValueType:v6 parameterMetadata:v5];

  return v7;
}

@end