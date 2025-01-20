@interface WFLinkActionDateParameterDefinition
- (Class)parameterClass;
- (WFLinkActionDateParameterDefinition)initWithParameterMetadata:(id)a3;
- (id)dateFromStringValue:(id)a3 error:(id *)a4;
- (id)linkValueFromParameterState:(id)a3 action:(id)a4;
- (id)localizedTitleForLinkValue:(id)a3;
- (id)parameterDefinitionDictionary;
- (id)parameterStateFromLinkValue:(id)a3;
- (void)getLinkValueFromProcessedParameterValue:(id)a3 parameterState:(id)a4 permissionRequestor:(id)a5 runningFromToolKit:(BOOL)a6 completionHandler:(id)a7;
@end

@implementation WFLinkActionDateParameterDefinition

- (id)localizedTitleForLinkValue:(id)a3
{
  id v4 = a3;
  v5 = [WFDateFieldParameter alloc];
  v6 = [(WFLinkActionDateParameterDefinition *)self parameterDefinitionDictionary];
  v7 = [(WFDateFieldParameter *)v5 initWithDefinition:v6];

  v8 = [v4 value];

  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v9 = v8;
    }
    else {
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
  }
  id v10 = v9;

  v11 = [(WFDateFieldParameter *)v7 hintDateFormatter];
  v12 = [v11 stringFromDate:v10];

  return v12;
}

- (id)parameterStateFromLinkValue:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 value];
  if (v4)
  {
    v5 = [(WFLinkActionParameterDefinition *)self valueType];
    char v6 = [v5 objectIsMemberOfType:v4];

    if (v6)
    {
      v7 = [WFDateFieldParameter alloc];
      v8 = [(WFLinkActionDateParameterDefinition *)self parameterDefinitionDictionary];
      v9 = [(WFDateFieldParameter *)v7 initWithDefinition:v8];

      id v10 = v4;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v11 = v10;
      }
      else {
        v11 = 0;
      }
      id v12 = v11;

      v13 = [(WFDateFieldParameter *)v9 hintDateFormatter];
      v14 = [v13 stringFromDate:v12];

      v15 = [[WFVariableString alloc] initWithString:v14];
      v16 = [WFDateFieldParameterState alloc];

      v17 = [(WFVariableStringParameterState *)v16 initWithVariableString:v15];
      goto LABEL_11;
    }
    v18 = getWFAppIntentsLogObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = [(WFLinkActionParameterDefinition *)self valueType];
      int v21 = 136315650;
      v22 = "-[WFLinkActionDateParameterDefinition parameterStateFromLinkValue:]";
      __int16 v23 = 2114;
      v24 = v4;
      __int16 v25 = 2114;
      v26 = v19;
        (uint8_t *)&v21,
        0x20u);
    }
  }
  v17 = 0;
LABEL_11:

  return v17;
}

- (id)dateFromStringValue:(id)a3 error:(id *)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  char v6 = [MEMORY[0x1E4F5A8B0] datesInString:v5 error:a4];
  v7 = [v6 firstObject];

  if (a4 && !v7)
  {
    v8 = getWFActionsLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = *a4;
      int v11 = 136315650;
      id v12 = "-[WFLinkActionDateParameterDefinition dateFromStringValue:error:]";
      __int16 v13 = 2112;
      id v14 = v5;
      __int16 v15 = 2112;
      id v16 = v9;
      _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_ERROR, "%s Unable to get date for parameter value: %@, error: %@", (uint8_t *)&v11, 0x20u);
    }
  }
  return v7;
}

- (void)getLinkValueFromProcessedParameterValue:(id)a3 parameterState:(id)a4 permissionRequestor:(id)a5 runningFromToolKit:(BOOL)a6 completionHandler:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = (void (**)(id, void *, void))a7;
  id v16 = v11;
  if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    __int16 v15 = [(WFLinkActionParameterDefinition *)self linkValueWithValue:v16];
    v14[2](v14, v15, 0);
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
    id v9 = [v8 variableString];
    id v10 = [v9 stringByRemovingVariables];

    if (v10)
    {
      id v11 = [(WFLinkActionDateParameterDefinition *)self dateFromStringValue:v10 error:0];
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

- (id)parameterDefinitionDictionary
{
  unint64_t v3 = [(WFLinkActionParameterDefinition *)self integerForTypeSpecificMetadataKey:*MEMORY[0x1E4F729E0] defaultValue:2];
  int64_t v4 = [(WFLinkActionParameterDefinition *)self integerForTypeSpecificMetadataKey:*MEMORY[0x1E4F729E8] defaultValue:0];
  int64_t v5 = [(WFLinkActionParameterDefinition *)self integerForTypeSpecificMetadataKey:*MEMORY[0x1E4F729D0] defaultValue:2];
  int64_t v6 = [(WFLinkActionParameterDefinition *)self integerForTypeSpecificMetadataKey:*MEMORY[0x1E4F729D8] defaultValue:2];
  id v7 = [(WFLinkActionParameterDefinition *)self objectForTypeSpecificMetadataKey:*MEMORY[0x1E4F729F0] ofClass:objc_opt_class()];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v8 setValue:*MEMORY[0x1E4FB4E60] forKey:@"TextAlignment"];
  if (v3 > 2) {
    id v9 = WFDateFieldHintDateModeDateAndTime;
  }
  else {
    id v9 = off_1E6551408[v3];
  }
  [v8 setValue:*v9 forKey:@"HintDateMode"];
  id v10 = [NSNumber numberWithBool:v4 == 1];
  [v8 setValue:v10 forKey:@"DateFormatterAllowsRelative"];

  [v8 setValue:v7 forKey:@"DateFormatterTemplate"];
  id v11 = [NSNumber numberWithUnsignedInteger:v5];
  [v8 setValue:v11 forKey:@"DateFormatterDateStyle"];

  id v12 = [NSNumber numberWithUnsignedInteger:v6];
  [v8 setValue:v12 forKey:@"DateFormatterTimeStyle"];

  v16.receiver = self;
  v16.super_class = (Class)WFLinkActionDateParameterDefinition;
  id v13 = [(WFLinkActionParameterDefinition *)&v16 parameterDefinitionDictionary];
  id v14 = [v13 definitionByAddingEntriesInDictionary:v8];

  return v14;
}

- (Class)parameterClass
{
  return (Class)objc_opt_class();
}

- (WFLinkActionDateParameterDefinition)initWithParameterMetadata:(id)a3
{
  int64_t v4 = (void *)MEMORY[0x1E4F72D18];
  id v5 = a3;
  int64_t v6 = [v4 dateValueType];
  v9.receiver = self;
  v9.super_class = (Class)WFLinkActionDateParameterDefinition;
  id v7 = [(WFLinkActionParameterDefinition *)&v9 initWithValueType:v6 parameterMetadata:v5];

  return v7;
}

@end