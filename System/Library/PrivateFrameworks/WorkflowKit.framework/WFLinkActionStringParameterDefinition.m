@interface WFLinkActionStringParameterDefinition
- (Class)parameterClass;
- (WFLinkActionStringParameterDefinition)initWithParameterMetadata:(id)a3;
- (id)autocapitalizationTypeFromStringCapitalizationType:(int64_t)a3;
- (id)keyboardTypeFromStringKeyboardType:(int64_t)a3;
- (id)linkValueFromParameterState:(id)a3 action:(id)a4;
- (id)localizedTitleForLinkValue:(id)a3;
- (id)parameterDefinitionDictionary;
- (id)parameterStateFromLinkValue:(id)a3;
@end

@implementation WFLinkActionStringParameterDefinition

- (id)autocapitalizationTypeFromStringCapitalizationType:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    v3 = (id *)MEMORY[0x1E4FB4DF8];
  }
  else {
    v3 = (id *)qword_1E6557DC0[a3];
  }
  return *v3;
}

- (id)keyboardTypeFromStringKeyboardType:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    v3 = (id *)MEMORY[0x1E4FB4E18];
  }
  else {
    v3 = (id *)qword_1E6557DA0[a3];
  }
  return *v3;
}

- (id)localizedTitleForLinkValue:(id)a3
{
  v3 = [a3 value];
  v4 = v3;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v3 = v4;
    }
    else {
      v3 = 0;
    }
  }
  id v5 = v3;

  return v5;
}

- (id)parameterStateFromLinkValue:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v4 = [a3 value];
  if (v4)
  {
    id v5 = [(WFLinkActionParameterDefinition *)self valueType];
    char v6 = [v5 objectIsMemberOfType:v4];

    if (v6)
    {
      v7 = [[WFVariableString alloc] initWithString:v4];
      v8 = [[WFVariableStringParameterState alloc] initWithVariableString:v7];

      goto LABEL_8;
    }
    v9 = getWFAppIntentsLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = [(WFLinkActionParameterDefinition *)self valueType];
      int v12 = 136315650;
      v13 = "-[WFLinkActionStringParameterDefinition parameterStateFromLinkValue:]";
      __int16 v14 = 2114;
      v15 = v4;
      __int16 v16 = 2114;
      v17 = v10;
        (uint8_t *)&v12,
        0x20u);
    }
  }
  v8 = 0;
LABEL_8:

  return v8;
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

    v11 = [(WFLinkActionParameterDefinition *)self linkValueWithValue:v10];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)parameterDefinitionDictionary
{
  v23[7] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(WFLinkActionParameterDefinition *)self BOOLForTypeSpecificMetadataKey:*MEMORY[0x1E4F72A70] defaultValue:1];
  BOOL v4 = [(WFLinkActionParameterDefinition *)self BOOLForTypeSpecificMetadataKey:*MEMORY[0x1E4F72A88] defaultValue:0];
  BOOL v5 = [(WFLinkActionParameterDefinition *)self BOOLForTypeSpecificMetadataKey:*MEMORY[0x1E4F72A90] defaultValue:1];
  BOOL v6 = [(WFLinkActionParameterDefinition *)self BOOLForTypeSpecificMetadataKey:*MEMORY[0x1E4F72A98] defaultValue:1];
  int64_t v7 = [(WFLinkActionParameterDefinition *)self integerForTypeSpecificMetadataKey:*MEMORY[0x1E4F72A80] defaultValue:4];
  int64_t v8 = [(WFLinkActionParameterDefinition *)self integerForTypeSpecificMetadataKey:*MEMORY[0x1E4F72A78] defaultValue:2];
  v9 = [WFParameterDefinition alloc];
  v23[0] = *MEMORY[0x1E4FB4E60];
  v22[0] = @"TextAlignment";
  v22[1] = @"DisableAutocorrection";
  v10 = [NSNumber numberWithInt:!v3];
  v23[1] = v10;
  v22[2] = @"Multiline";
  v11 = [NSNumber numberWithBool:v4];
  v23[2] = v11;
  v22[3] = @"DisableSmartDashes";
  int v12 = [NSNumber numberWithInt:!v5];
  v23[3] = v12;
  v22[4] = @"DisableSmartQuotes";
  v13 = [NSNumber numberWithInt:!v6];
  v23[4] = v13;
  v22[5] = @"KeyboardType";
  __int16 v14 = [(WFLinkActionStringParameterDefinition *)self keyboardTypeFromStringKeyboardType:v7];
  v23[5] = v14;
  v22[6] = @"AutocapitalizationType";
  v15 = [(WFLinkActionStringParameterDefinition *)self autocapitalizationTypeFromStringCapitalizationType:v8];
  v23[6] = v15;
  __int16 v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:7];
  v17 = [(WFParameterDefinition *)v9 initWithDictionary:v16];

  v21.receiver = self;
  v21.super_class = (Class)WFLinkActionStringParameterDefinition;
  uint64_t v18 = [(WFLinkActionParameterDefinition *)&v21 parameterDefinitionDictionary];
  v19 = [v18 definitionByMergingWithDefinition:v17];

  return v19;
}

- (Class)parameterClass
{
  return (Class)objc_opt_class();
}

- (WFLinkActionStringParameterDefinition)initWithParameterMetadata:(id)a3
{
  BOOL v4 = (void *)MEMORY[0x1E4F72D18];
  id v5 = a3;
  BOOL v6 = [v4 stringValueType];
  v9.receiver = self;
  v9.super_class = (Class)WFLinkActionStringParameterDefinition;
  int64_t v7 = [(WFLinkActionParameterDefinition *)&v9 initWithValueType:v6 parameterMetadata:v5];

  return v7;
}

@end