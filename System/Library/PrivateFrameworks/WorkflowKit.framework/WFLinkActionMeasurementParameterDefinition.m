@interface WFLinkActionMeasurementParameterDefinition
- (Class)parameterClass;
- (id)defaultSerializedRepresentationFromParameterMetadataDefaultValue:(id)a3;
- (id)linkValueFromParameterState:(id)a3 action:(id)a4;
- (id)localizedTitleForLinkValue:(id)a3;
- (id)parameterDefinitionDictionary;
- (id)parameterStateFromLinkValue:(id)a3;
- (id)unitFromUnitString:(id)a3;
- (void)getLinkValueFromProcessedParameterValue:(id)a3 parameterState:(id)a4 permissionRequestor:(id)a5 runningFromToolKit:(BOOL)a6 completionHandler:(id)a7;
@end

@implementation WFLinkActionMeasurementParameterDefinition

- (id)localizedTitleForLinkValue:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F28E30];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  v6 = [v4 value];

  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }
  id v8 = v7;

  v9 = [v5 stringFromMeasurement:v8];

  return v9;
}

- (id)parameterStateFromLinkValue:(id)a3
{
  v3 = [a3 value];
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v4 = objc_alloc(MEMORY[0x1E4F28C28]);
    [v3 doubleValue];
    id v5 = objc_msgSend(v4, "initWithDouble:");
    v6 = [WFNumberStringSubstitutableState alloc];
    v7 = [v5 stringValue];
    id v8 = [(WFNumberStringSubstitutableState *)v6 initWithValue:v7];

    v9 = [WFQuantityParameterState alloc];
    v10 = [v3 unit];
    v11 = [v10 symbol];
    v12 = [(WFQuantityParameterState *)v9 initWithMagnitudeState:v8 unitString:v11];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)getLinkValueFromProcessedParameterValue:(id)a3 parameterState:(id)a4 permissionRequestor:(id)a5 runningFromToolKit:(BOOL)a6 completionHandler:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v14 = (void (**)(id, void *, void))a7;
  id v15 = v11;
  id v23 = v15;
  if (v15 && (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), id v15 = v23, (isKindOfClass & 1) != 0))
  {
    v17 = [v23 unitString];
    v18 = [(WFLinkActionMeasurementParameterDefinition *)self unitFromUnitString:v17];

    if (v18)
    {
      id v19 = objc_alloc(MEMORY[0x1E4F28E28]);
      v20 = [v23 magnitude];
      [v20 doubleValue];
      v21 = objc_msgSend(v19, "initWithDoubleValue:unit:", v18);

      v22 = [(WFLinkActionParameterDefinition *)self linkValueWithValue:v21];
      v14[2](v14, v22, 0);
    }
    else
    {
      v14[2](v14, 0, 0);
    }
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
  if (!v8)
  {
    v9 = 0;
    id v19 = 0;
    v18 = 0;
LABEL_10:

    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v19 = 0;
    v18 = 0;
    v9 = v8;
    goto LABEL_10;
  }
  v9 = [v8 magnitudeState];
  uint64_t v10 = [v9 decimalNumber];
  if (!v10)
  {
    v18 = 0;
    goto LABEL_9;
  }
  id v11 = (void *)v10;
  id v12 = [v8 unitString];

  if (v12)
  {
    id v13 = [v8 unitString];
    v9 = [(WFLinkActionMeasurementParameterDefinition *)self unitFromUnitString:v13];

    id v14 = objc_alloc(MEMORY[0x1E4F28E28]);
    id v15 = [v8 magnitudeState];
    v16 = [v15 decimalNumber];
    [v16 doubleValue];
    v17 = objc_msgSend(v14, "initWithDoubleValue:unit:", v9);

    v18 = [(WFLinkActionParameterDefinition *)self linkValueWithValue:v17];

LABEL_9:
    id v19 = v8;
    goto LABEL_10;
  }
  v18 = 0;
  id v19 = v8;
LABEL_11:

  return v18;
}

- (id)unitFromUnitString:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4FB47F0] unitFromString:v3];
  if (!v4)
  {
    if ([v3 isEqualToString:@"sec"])
    {
      uint64_t v5 = [MEMORY[0x1E4F29180] seconds];
LABEL_8:
      id v4 = (void *)v5;
      goto LABEL_9;
    }
    if ([v3 isEqualToString:@"min"])
    {
      uint64_t v5 = [MEMORY[0x1E4F29180] minutes];
      goto LABEL_8;
    }
    if ([v3 isEqualToString:@"hr"])
    {
      uint64_t v5 = [MEMORY[0x1E4F29180] hours];
      goto LABEL_8;
    }
    id v7 = getWFAppIntentsLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      int v8 = 136315394;
      v9 = "-[WFLinkActionMeasurementParameterDefinition unitFromUnitString:]";
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_FAULT, "%s Unexpected nil WFMeasurementUnit for unit string: %@", (uint8_t *)&v8, 0x16u);
    }

    id v4 = 0;
  }
LABEL_9:

  return v4;
}

- (id)defaultSerializedRepresentationFromParameterMetadataDefaultValue:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v3 = v4;
    }
    else {
      id v3 = 0;
    }
  }
  id v5 = v3;

  return v5;
}

- (id)parameterDefinitionDictionary
{
  v42[1] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4FB47F0];
  id v4 = [(WFLinkActionParameterDefinition *)self valueType];
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;

  uint64_t v7 = [v6 unitType];
  int v8 = [v3 unitTypeFromLinkMeasurementUnitType:v7];
  if (!v8)
  {
    v41.receiver = self;
    v41.super_class = (Class)WFLinkActionMeasurementParameterDefinition;
    v18 = [(WFLinkActionParameterDefinition *)&v41 parameterDefinitionDictionary];
    goto LABEL_28;
  }
  v9 = [(WFLinkActionParameterDefinition *)self parameterMetadata];
  __int16 v10 = [v9 typeSpecificMetadata];

  id v11 = [v10 objectForKey:*MEMORY[0x1E4F72A20]];
  uint64_t v12 = [v11 BOOLValue];

  id v13 = [v10 objectForKey:*MEMORY[0x1E4F72A28]];
  int v14 = [v13 BOOLValue];

  id v15 = [v10 objectForKey:*MEMORY[0x1E4F72A30]];
  v16 = [v10 objectForKey:*MEMORY[0x1E4F72A18]];
  if (v15) {
    v17 = v15;
  }
  else {
    v17 = v16;
  }
  id v19 = [MEMORY[0x1E4FB47F0] unitFromString:v17 unitType:v8 caseSensitive:0];
  id v20 = v19;
  if (v14)
  {
    v39 = v16;
    id v21 = v19;
    v22 = WFMetricToImperialUnitMapping();
    id v23 = [v22 allKeys];
    int v24 = [v23 containsObject:v21];

    v25 = WFImperialToMetricUnitMapping();
    v26 = [v25 allKeys];
    int v27 = [v26 containsObject:v21];

    if ((v24 & 1) == 0 && (v27 & 1) == 0)
    {
      id v20 = v21;
LABEL_24:
      v16 = v39;

      goto LABEL_25;
    }
    v28 = [MEMORY[0x1E4FB47F0] unitTypeForUnitClass:objc_opt_class()];
    int v29 = [MEMORY[0x1E4FB47F0] usesMetricSystemForUnitType:v28];
    if (v24 & v29) != 1 && ((v27 ^ 1 | v29))
    {
      if (v24)
      {
        v30 = WFMetricToImperialUnitMapping();
LABEL_21:
        v31 = v30;
        id v20 = [v30 objectForKey:v21];

LABEL_23:
        goto LABEL_24;
      }
      if (v27)
      {
        v30 = WFImperialToMetricUnitMapping();
        goto LABEL_21;
      }
    }
    id v20 = v21;
    goto LABEL_23;
  }
LABEL_25:
  v32 = objc_opt_new();
  [v32 setValue:v8 forKey:@"WFUnitType"];
  v33 = [v20 symbol];
  [v32 setValue:v33 forKey:@"DefaultUnit"];

  if (v15)
  {
    v34 = [v20 symbol];
    v42[0] = v34;
    v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:1];
    [v32 setValue:v35 forKey:@"PossibleUnits"];
  }
  v36 = [NSNumber numberWithBool:v12];
  [v32 setValue:v36 forKey:@"AllowsNegativeNumbers"];

  v40.receiver = self;
  v40.super_class = (Class)WFLinkActionMeasurementParameterDefinition;
  v37 = [(WFLinkActionParameterDefinition *)&v40 parameterDefinitionDictionary];
  v18 = [v37 definitionByAddingEntriesInDictionary:v32];

LABEL_28:
  return v18;
}

- (Class)parameterClass
{
  return (Class)objc_opt_class();
}

@end