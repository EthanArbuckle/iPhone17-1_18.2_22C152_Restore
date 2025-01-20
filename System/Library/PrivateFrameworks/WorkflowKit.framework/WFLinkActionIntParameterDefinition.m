@interface WFLinkActionIntParameterDefinition
- (Class)parameterClass;
- (WFLinkActionIntParameterDefinition)initWithParameterMetadata:(id)a3;
- (id)linkValueFromParameterState:(id)a3 action:(id)a4;
- (id)localizedTitleForLinkValue:(id)a3;
- (id)parameterDefinitionDictionary;
- (id)parameterStateFromLinkValue:(id)a3;
@end

@implementation WFLinkActionIntParameterDefinition

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

  v6 = [v5 stringValue];

  return v6;
}

- (id)parameterStateFromLinkValue:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v4 = [a3 value];
  if (v4)
  {
    id v5 = [(WFLinkActionParameterDefinition *)self valueType];
    char v6 = [v5 objectIsMemberOfType:v4];

    if (v6)
    {
      v7 = [[WFNumberSubstitutableState alloc] initWithNumber:v4];
      goto LABEL_8;
    }
    v8 = getWFAppIntentsLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = [(WFLinkActionParameterDefinition *)self valueType];
      int v11 = 136315650;
      v12 = "-[WFLinkActionIntParameterDefinition parameterStateFromLinkValue:]";
      __int16 v13 = 2114;
      v14 = v4;
      __int16 v15 = 2114;
      v16 = v9;
        (uint8_t *)&v11,
        0x20u);
    }
  }
  v7 = 0;
LABEL_8:

  return v7;
}

- (id)linkValueFromParameterState:(id)a3 action:(id)a4
{
  id v6 = a3;
  if (!v6)
  {
    v11.receiver = self;
    v11.super_class = (Class)WFLinkActionIntParameterDefinition;
    v8 = [(WFLinkActionParameterDefinition *)&v11 linkValueFromParameterState:0 action:a4];
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [v6 decimalNumber];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_9;
    }
    uint64_t v7 = [v6 number];
  }
  v9 = (void *)v7;
  if (v7)
  {
    v8 = [(WFLinkActionParameterDefinition *)self linkValueWithValue:v7];

    goto LABEL_10;
  }
LABEL_9:
  v8 = 0;
LABEL_10:

  return v8;
}

- (id)parameterDefinitionDictionary
{
  BOOL v3 = 1;
  int64_t v4 = [(WFLinkActionParameterDefinition *)self integerForTypeSpecificMetadataKey:*MEMORY[0x1E4F72A38] defaultValue:1];
  int64_t v5 = [(WFLinkActionParameterDefinition *)self integerForTypeSpecificMetadataKey:*MEMORY[0x1E4F72A48] defaultValue:0];
  id v6 = [(WFLinkActionParameterDefinition *)self objectForTypeSpecificMetadataKey:*MEMORY[0x1E4F72A40] ofClass:objc_opt_class()];
  uint64_t v7 = [(WFLinkActionParameterDefinition *)self objectForTypeSpecificMetadataKey:*MEMORY[0x1E4F72A50] ofClass:objc_opt_class()];
  if (v6)
  {
    [v6 doubleValue];
    BOOL v3 = v8 < 0.0;
  }
  if ((unint64_t)(v5 - 3) <= 1)
  {
    uint64_t v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "integerValue") - 1);

    uint64_t v7 = (void *)v9;
  }
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  objc_super v11 = v10;
  if (v4)
  {
    if (v4 != 1) {
      goto LABEL_10;
    }
    [v10 setValue:*MEMORY[0x1E4FB4E60] forKey:@"TextAlignment"];
    v12 = [NSNumber numberWithBool:v3];
    [v11 setValue:v12 forKey:@"AllowsNegativeNumbers"];
  }
  else
  {
    [v10 setValue:v6 forKey:@"MinimumValue"];
    [v11 setValue:v7 forKey:@"MaximumValue"];
    __int16 v13 = [(WFLinkActionParameterDefinition *)self parameterMetadata];
    v14 = objc_msgSend(v13, "wf_localizedTitle");
    [v11 setValue:v14 forKey:@"StepperDescription"];

    __int16 v15 = NSString;
    v12 = [(WFLinkActionParameterDefinition *)self parameterMetadata];
    v16 = objc_msgSend(v12, "wf_localizedTitle");
    uint64_t v17 = [v15 localizedStringWithFormat:@"%@: %@", v16, @"%ld"];
    [v11 setValue:v17 forKey:@"StepperNoun"];
  }
LABEL_10:
  v21.receiver = self;
  v21.super_class = (Class)WFLinkActionIntParameterDefinition;
  v18 = [(WFLinkActionParameterDefinition *)&v21 parameterDefinitionDictionary];
  v19 = [v18 definitionByAddingEntriesInDictionary:v11];

  return v19;
}

- (Class)parameterClass
{
  [(WFLinkActionParameterDefinition *)self integerForTypeSpecificMetadataKey:*MEMORY[0x1E4F72A38] defaultValue:1];
  v2 = objc_opt_class();
  return (Class)v2;
}

- (WFLinkActionIntParameterDefinition)initWithParameterMetadata:(id)a3
{
  int64_t v4 = (void *)MEMORY[0x1E4F72D18];
  id v5 = a3;
  id v6 = [v4 intValueType];
  v9.receiver = self;
  v9.super_class = (Class)WFLinkActionIntParameterDefinition;
  uint64_t v7 = [(WFLinkActionParameterDefinition *)&v9 initWithValueType:v6 parameterMetadata:v5];

  return v7;
}

@end