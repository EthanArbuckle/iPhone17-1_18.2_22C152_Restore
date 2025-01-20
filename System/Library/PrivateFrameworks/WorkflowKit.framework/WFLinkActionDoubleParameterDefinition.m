@interface WFLinkActionDoubleParameterDefinition
- (Class)parameterClass;
- (WFLinkActionDoubleParameterDefinition)initWithParameterMetadata:(id)a3;
- (id)defaultSerializedRepresentationFromParameterMetadataDefaultValue:(id)a3;
- (id)linkValueFromParameterState:(id)a3 action:(id)a4;
- (id)localizedTitleForLinkValue:(id)a3;
- (id)parameterDefinitionDictionary;
- (id)parameterStateFromLinkValue:(id)a3;
@end

@implementation WFLinkActionDoubleParameterDefinition

- (id)localizedTitleForLinkValue:(id)a3
{
  v3 = [a3 value];
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    [v4 setNumberStyle:1];
    v5 = [v4 stringFromNumber:v3];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)parameterStateFromLinkValue:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 value];
  if (v4)
  {
    v5 = [(WFLinkActionParameterDefinition *)self valueType];
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
      v12 = "-[WFLinkActionDoubleParameterDefinition parameterStateFromLinkValue:]";
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

- (id)defaultSerializedRepresentationFromParameterMetadataDefaultValue:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WFLinkActionDoubleParameterDefinition;
  v3 = [(WFLinkActionParameterDefinition *)&v8 defaultSerializedRepresentationFromParameterMetadataDefaultValue:a3];
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v4 = v3;
    }
    else {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }
  id v5 = v4;

  char v6 = [v5 stringValue];

  return v6;
}

- (id)parameterDefinitionDictionary
{
  v3 = [(WFLinkActionParameterDefinition *)self objectForTypeSpecificMetadataKey:*MEMORY[0x1E4F72A40] ofClass:objc_opt_class()];
  id v4 = [(WFLinkActionParameterDefinition *)self objectForTypeSpecificMetadataKey:*MEMORY[0x1E4F72A50] ofClass:objc_opt_class()];
  BOOL v5 = 1;
  int64_t v6 = [(WFLinkActionParameterDefinition *)self integerForTypeSpecificMetadataKey:*MEMORY[0x1E4F72A38] defaultValue:1];
  int64_t v7 = [(WFLinkActionParameterDefinition *)self integerForTypeSpecificMetadataKey:*MEMORY[0x1E4F72A48] defaultValue:0];
  if (v3)
  {
    [v3 doubleValue];
    BOOL v5 = v8 < 0.0;
  }
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if ((unint64_t)(v7 - 3) <= 1)
  {
    v10 = NSNumber;
    [v4 doubleValue];
    uint64_t v12 = [v10 numberWithDouble:v11 + -2.22507386e-308];

    id v4 = (void *)v12;
  }
  if (!v6)
  {
    v22 = [(WFLinkActionParameterDefinition *)self parameterMetadata];
    v23 = objc_msgSend(v22, "wf_localizedTitle");
    [v9 setValue:v23 forKey:@"StepperDescription"];

    v24 = NSString;
    v21 = [(WFLinkActionParameterDefinition *)self parameterMetadata];
    v25 = objc_msgSend(v21, "wf_localizedTitle");
    v26 = [v24 localizedStringWithFormat:@"%@: %@", v25, @"%ld"];
    [v9 setValue:v26 forKey:@"StepperNoun"];

    goto LABEL_21;
  }
  if (v6 != 1)
  {
    if (v6 != 2)
    {
LABEL_22:
      [v9 setValue:v3 forKey:@"MinimumValue"];
      [v9 setValue:v4 forKey:@"MaximumValue"];
      goto LABEL_24;
    }
    [v3 doubleValue];
    double v14 = v13;
    [v4 doubleValue];
    if (v14 > 1.0 && v4 == 0) {
      double v17 = v14 + 1.0;
    }
    else {
      double v17 = v15;
    }
    BOOL v18 = v17 < 0.0 && v3 == 0;
    double v19 = v17 + -1.0;
    if (!v18) {
      double v19 = v14;
    }
    uint64_t v20 = [NSNumber numberWithDouble:v19];

    [NSNumber numberWithDouble:v17];
    v21 = v4;
    id v4 = v3 = (void *)v20;
LABEL_21:

    goto LABEL_22;
  }
  [v9 setValue:*MEMORY[0x1E4FB4E60] forKey:@"TextAlignment"];
  [v9 setValue:MEMORY[0x1E4F1CC38] forKey:@"AllowsDecimalNumbers"];
  v27 = [NSNumber numberWithBool:v5];
  [v9 setValue:v27 forKey:@"AllowsNegativeNumbers"];

LABEL_24:
  v31.receiver = self;
  v31.super_class = (Class)WFLinkActionDoubleParameterDefinition;
  v28 = [(WFLinkActionParameterDefinition *)&v31 parameterDefinitionDictionary];
  v29 = [v28 definitionByAddingEntriesInDictionary:v9];

  return v29;
}

- (id)linkValueFromParameterState:(id)a3 action:(id)a4
{
  id v6 = a3;
  if (!v6)
  {
    v11.receiver = self;
    v11.super_class = (Class)WFLinkActionDoubleParameterDefinition;
    double v8 = [(WFLinkActionParameterDefinition *)&v11 linkValueFromParameterState:0 action:a4];
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
  id v9 = (void *)v7;
  if (v7)
  {
    double v8 = [(WFLinkActionParameterDefinition *)self linkValueWithValue:v7];

    goto LABEL_10;
  }
LABEL_9:
  double v8 = 0;
LABEL_10:

  return v8;
}

- (Class)parameterClass
{
  [(WFLinkActionParameterDefinition *)self integerForTypeSpecificMetadataKey:*MEMORY[0x1E4F72A38] defaultValue:1];
  v2 = objc_opt_class();
  return (Class)v2;
}

- (WFLinkActionDoubleParameterDefinition)initWithParameterMetadata:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F72D18];
  id v5 = a3;
  id v6 = [v4 doubleValueType];
  v9.receiver = self;
  v9.super_class = (Class)WFLinkActionDoubleParameterDefinition;
  uint64_t v7 = [(WFLinkActionParameterDefinition *)&v9 initWithValueType:v6 parameterMetadata:v5];

  return v7;
}

@end