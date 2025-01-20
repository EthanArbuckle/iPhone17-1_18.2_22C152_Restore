@interface INCodableCurrencyAmountAttributeMetadata(Workflow)
- (WFQuantityParameterState)wf_parameterStateForIntentValue:()Workflow parameterDefinition:;
- (id)wf_updatedParameterDefinition:()Workflow forCodableAttribute:localizer:;
- (uint64_t)wf_objectClass;
- (uint64_t)wf_parameterClass;
- (uint64_t)wf_processParameterValue:()Workflow forParameter:parameterState:codableAttribute:completionHandler:;
- (void)wf_updateWithParameterState:()Workflow;
- (void)wf_updateWithParameterValue:()Workflow;
@end

@implementation INCodableCurrencyAmountAttributeMetadata(Workflow)

- (void)wf_updateWithParameterValue:()Workflow
{
  id v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v4 = [v5 currencyCode];
      [a1 setCurrencyCode:v4];
    }
  }
}

- (void)wf_updateWithParameterState:()Workflow
{
  id v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v4 = [v5 unitString];
      [a1 setCurrencyCode:v4];
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
    v9 = [WFQuantityParameterState alloc];
    v10 = [WFNumberStringSubstitutableState alloc];
    v11 = [v8 amount];
    v12 = [v11 stringValue];
    v13 = [(WFNumberStringSubstitutableState *)v10 initWithValue:v12];
    v14 = [v8 currencyCode];

    v15 = [(WFQuantityParameterState *)v9 initWithMagnitudeState:v13 unitString:v14];
  }
  else
  {
    v17.receiver = a1;
    v17.super_class = (Class)&off_1F23792F8;
    objc_msgSendSuper2(&v17, sel_wf_parameterStateForIntentValue_parameterDefinition_, v6, v7);
    v15 = (WFQuantityParameterState *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (uint64_t)wf_processParameterValue:()Workflow forParameter:parameterState:codableAttribute:completionHandler:
{
  id v8 = a3;
  v9 = a7;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    v11 = (objc_class *)MEMORY[0x1E4F303C0];
    id v12 = v8;
    id v13 = [v11 alloc];
    v14 = [v12 magnitude];
    v15 = [v12 unitString];

    v16 = (void *)[v13 initWithAmount:v14 currencyCode:v15];
    v9[2](v9, v16, 0);
  }
  return isKindOfClass & 1;
}

- (id)wf_updatedParameterDefinition:()Workflow forCodableAttribute:localizer:
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v8.receiver = a1;
  v8.super_class = (Class)&off_1F23792F8;
  v2 = objc_msgSendSuper2(&v8, sel_wf_updatedParameterDefinition_forCodableAttribute_localizer_);
  v9[0] = @"PossibleUnits";
  v3 = [a1 currencyCodes];
  v9[1] = @"AllowsNegativeNumbers";
  v10[0] = v3;
  v4 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "supportsNegativeNumbers"));
  v10[1] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  id v6 = [v2 definitionByAddingEntriesInDictionary:v5];

  return v6;
}

- (uint64_t)wf_parameterClass
{
  return objc_opt_class();
}

- (uint64_t)wf_objectClass
{
  return objc_opt_class();
}

@end