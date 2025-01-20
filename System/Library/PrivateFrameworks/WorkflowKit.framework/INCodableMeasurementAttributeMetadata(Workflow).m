@interface INCodableMeasurementAttributeMetadata(Workflow)
- (WFQuantityParameterState)wf_parameterStateForIntentValue:()Workflow parameterDefinition:;
- (id)wf_measurementType;
- (id)wf_updatedParameterDefinition:()Workflow forCodableAttribute:localizer:;
- (uint64_t)wf_objectClass;
- (uint64_t)wf_parameterClass;
- (uint64_t)wf_processParameterValue:()Workflow forParameter:parameterState:codableAttribute:completionHandler:;
- (void)wf_updateWithParameterState:()Workflow;
- (void)wf_updateWithParameterValue:()Workflow;
@end

@implementation INCodableMeasurementAttributeMetadata(Workflow)

- (void)wf_updateWithParameterValue:()Workflow
{
  id v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v4 = [v5 unit];
      [a1 setUnit:v4];
    }
  }
}

- (void)wf_updateWithParameterState:()Workflow
{
  id v9 = a3;
  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v4 = [a1 name];
      id v5 = WFUnitTypeFromAttributeName(v4);

      v6 = (void *)MEMORY[0x1E4FB47F0];
      v7 = [v9 unitString];
      v8 = [v6 unitFromString:v7 unitType:v5 caseSensitive:1];
      [a1 setUnit:v8];
    }
  }
}

- (WFQuantityParameterState)wf_parameterStateForIntentValue:()Workflow parameterDefinition:
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v6;
    id v9 = [WFNumberStringSubstitutableState alloc];
    v10 = NSNumber;
    [v8 doubleValue];
    v11 = objc_msgSend(v10, "numberWithDouble:");
    v12 = [v11 stringValue];
    v13 = [(WFNumberStringSubstitutableState *)v9 initWithValue:v12];

    v14 = [WFQuantityParameterState alloc];
    v15 = [v8 unit];

    v16 = [v15 symbol];
    v17 = [(WFQuantityParameterState *)v14 initWithMagnitudeState:v13 unitString:v16];
  }
  else
  {
    v19.receiver = a1;
    v19.super_class = (Class)&off_1F238A7E8;
    objc_msgSendSuper2(&v19, sel_wf_parameterStateForIntentValue_parameterDefinition_, v6, v7);
    v17 = (WFQuantityParameterState *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (uint64_t)wf_processParameterValue:()Workflow forParameter:parameterState:codableAttribute:completionHandler:
{
  id v9 = a3;
  v10 = a7;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v9;
    if (v11)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v12 = v11;
      }
      else {
        v12 = 0;
      }
    }
    else
    {
      v12 = 0;
    }
    id v16 = v12;

    v15 = [v16 measurement];
    goto LABEL_29;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = v9;
    if (v13)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v14 = v13;
      }
      else {
        v14 = 0;
      }
    }
    else
    {
      v14 = 0;
    }
    id v16 = v14;

    v17 = [a1 name];
    v18 = WFUnitTypeFromAttributeName(v17);

    if (v18)
    {
      objc_super v19 = (void *)MEMORY[0x1E4FB47F0];
      v20 = [v16 unitString];
      id v21 = [v19 unitFromString:v20 unitType:v18 caseSensitive:1];

      if (v21)
      {
        id v22 = objc_alloc(MEMORY[0x1E4F28E28]);
        v23 = [v16 magnitude];
        [v23 doubleValue];
        v15 = objc_msgSend(v22, "initWithDoubleValue:unit:", v21);
      }
      else
      {
        v15 = 0;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v15 = 0;
LABEL_28:

LABEL_29:
        goto LABEL_30;
      }
      id v24 = v13;
      if (v13)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v25 = v24;
        }
        else {
          v25 = 0;
        }
      }
      else
      {
        v25 = 0;
      }
      id v21 = v25;

      v15 = [v21 measurement];
    }

    goto LABEL_28;
  }
  v15 = 0;
LABEL_30:
  v10[2](v10, v15, 0);

  return 1;
}

- (id)wf_updatedParameterDefinition:()Workflow forCodableAttribute:localizer:
{
  v31[2] = *MEMORY[0x1E4F143B8];
  v24.receiver = a1;
  v24.super_class = (Class)&off_1F238A7E8;
  v2 = objc_msgSendSuper2(&v24, sel_wf_updatedParameterDefinition_forCodableAttribute_localizer_);
  v3 = [a1 name];
  v4 = WFUnitTypeFromAttributeName(v3);

  if (v4)
  {
    v30[0] = @"WFUnitType";
    v30[1] = @"AllowsNegativeNumbers";
    v31[0] = v4;
    id v5 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "supportsNegativeNumbers"));
    v31[1] = v5;
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];
    id v7 = [v2 definitionByAddingEntriesInDictionary:v6];

    id v8 = [a1 unit];

    if (v8)
    {
      v28[0] = @"DefaultUnit";
      id v9 = [a1 unit];
      v10 = [v9 symbol];
      v29[0] = v10;
      v28[1] = @"PossibleUnits";
      id v11 = [a1 unit];
      v12 = [v11 symbol];
      v27 = v12;
      uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
      v29[1] = v13;
      v28[2] = @"DefaultValue";
      v14 = NSNumber;
      [a1 defaultValue];
      v15 = objc_msgSend(v14, "numberWithDouble:");
      v29[2] = v15;
      id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:3];
      v2 = [v7 definitionByAddingEntriesInDictionary:v16];

      id v7 = (void *)v13;
    }
    else
    {
      v17 = [a1 defaultUnits];

      if (!v17)
      {
        v2 = v7;
        goto LABEL_11;
      }
      v18 = [MEMORY[0x1E4F1CA20] currentLocale];
      objc_super v19 = [v18 objectForKey:*MEMORY[0x1E4F1C490]];
      int v20 = [v19 BOOLValue];

      v25 = @"DefaultUnit";
      id v21 = [a1 defaultUnits];
      id v9 = v21;
      if (v20) {
        [v21 firstObject];
      }
      else {
      v10 = [v21 lastObject];
      }
      id v11 = [v10 symbol];
      v26 = v11;
      v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
      v2 = [v7 definitionByAddingEntriesInDictionary:v12];
    }
  }
LABEL_11:
  id v22 = v2;

  return v22;
}

- (uint64_t)wf_parameterClass
{
  return objc_opt_class();
}

- (uint64_t)wf_objectClass
{
  return objc_opt_class();
}

- (id)wf_measurementType
{
  v1 = [a1 name];
  v2 = WFUnitTypeFromAttributeName(v1);

  return v2;
}

@end