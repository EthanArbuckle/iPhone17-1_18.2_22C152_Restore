@interface WFLinkActionStringSearchCriteriaParameterDefinition
- (Class)parameterClass;
- (WFLinkActionStringSearchCriteriaParameterDefinition)initWithParameterMetadata:(id)a3;
- (id)linkValueFromParameterState:(id)a3 action:(id)a4;
- (id)parameterDefinitionDictionary;
- (id)parameterStateFromLinkValue:(id)a3;
- (void)getLinkValueFromProcessedParameterValue:(id)a3 parameterState:(id)a4 permissionRequestor:(id)a5 runningFromToolKit:(BOOL)a6 completionHandler:(id)a7;
@end

@implementation WFLinkActionStringSearchCriteriaParameterDefinition

- (id)parameterStateFromLinkValue:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v4 = [a3 value];
  if (v4)
  {
    v5 = [(WFLinkActionParameterDefinition *)self valueType];
    char v6 = [v5 objectIsMemberOfType:v4];

    if (v6)
    {
      id v7 = v4;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v8 = v7;
      }
      else {
        v8 = 0;
      }
      id v9 = v8;

      v10 = [WFVariableString alloc];
      v11 = [v9 term];
      v12 = [(WFVariableString *)v10 initWithString:v11];

      v13 = [WFVariableStringParameterState alloc];
      v14 = [(WFVariableStringParameterState *)v13 initWithVariableString:v12];

      goto LABEL_11;
    }
    v15 = getWFAppIntentsLogObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = [(WFLinkActionParameterDefinition *)self valueType];
      int v18 = 136315650;
      v19 = "-[WFLinkActionStringSearchCriteriaParameterDefinition parameterStateFromLinkValue:]";
      __int16 v20 = 2114;
      v21 = v4;
      __int16 v22 = 2114;
      v23 = v16;
        (uint8_t *)&v18,
        0x20u);
    }
  }
  v14 = 0;
LABEL_11:

  return v14;
}

- (void)getLinkValueFromProcessedParameterValue:(id)a3 parameterState:(id)a4 permissionRequestor:(id)a5 runningFromToolKit:(BOOL)a6 completionHandler:(id)a7
{
  id v17 = a3;
  id v9 = (void (**)(id, void *, void))a7;
  if (v17)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v10 = v17;
    }
    else {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }
  v11 = v10;
  v12 = v11;
  v13 = &stru_1F229A4D8;
  if (v11) {
    v13 = v11;
  }
  v14 = v13;

  v15 = (void *)[objc_alloc(MEMORY[0x1E4F72DA8]) initWithTerm:v14];
  v16 = [(WFLinkActionParameterDefinition *)self linkValueWithValue:v15];
  v9[2](v9, v16, 0);
}

- (id)linkValueFromParameterState:(id)a3 action:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v8 = v6;
    }
    else {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }
  id v9 = v8;
  v10 = [v9 variableString];
  v11 = [v10 stringByRemovingVariables];

  if (v11)
  {
    id v12 = objc_alloc(MEMORY[0x1E4F72DA8]);
    v13 = [v9 variableString];
    v14 = [v13 stringByRemovingVariables];
    v15 = (void *)[v12 initWithTerm:v14];

    v16 = [(WFLinkActionParameterDefinition *)self linkValueWithValue:v15];
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)parameterDefinitionDictionary
{
  v11[5] = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)WFLinkActionStringSearchCriteriaParameterDefinition;
  v2 = [(WFLinkActionParameterDefinition *)&v9 parameterDefinitionDictionary];
  uint64_t v3 = *MEMORY[0x1E4FB4E60];
  v10[0] = @"TextAlignment";
  v10[1] = @"KeyboardType";
  uint64_t v4 = *MEMORY[0x1E4FB4E18];
  v11[0] = v3;
  v11[1] = v4;
  uint64_t v5 = *MEMORY[0x1E4FB4DF8];
  v10[2] = @"AutocapitalizationType";
  v10[3] = @"DisableSmartDashes";
  v11[2] = v5;
  v11[3] = MEMORY[0x1E4F1CC28];
  v10[4] = @"DisableSmartQuotes";
  v11[4] = MEMORY[0x1E4F1CC28];
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:5];
  id v7 = [v2 definitionByAddingEntriesInDictionary:v6];

  return v7;
}

- (Class)parameterClass
{
  return (Class)objc_opt_class();
}

- (WFLinkActionStringSearchCriteriaParameterDefinition)initWithParameterMetadata:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F72D90];
  id v5 = a3;
  id v6 = [v4 stringValueType];
  v9.receiver = self;
  v9.super_class = (Class)WFLinkActionStringSearchCriteriaParameterDefinition;
  id v7 = [(WFLinkActionParameterDefinition *)&v9 initWithValueType:v6 parameterMetadata:v5];

  return v7;
}

@end