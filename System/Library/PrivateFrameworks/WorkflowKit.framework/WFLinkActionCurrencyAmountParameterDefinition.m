@interface WFLinkActionCurrencyAmountParameterDefinition
- (Class)parameterClass;
- (WFLinkActionCurrencyAmountParameterDefinition)initWithParameterMetadata:(id)a3;
- (id)defaultSerializedRepresentationFromParameterMetadataDefaultValue:(id)a3;
- (id)linkValueFromParameterState:(id)a3 action:(id)a4;
- (id)parameterDefinitionDictionary;
- (id)parameterStateFromLinkValue:(id)a3;
- (void)getLinkValueFromProcessedParameterValue:(id)a3 parameterState:(id)a4 permissionRequestor:(id)a5 runningFromToolKit:(BOOL)a6 completionHandler:(id)a7;
@end

@implementation WFLinkActionCurrencyAmountParameterDefinition

- (id)parameterStateFromLinkValue:(id)a3
{
  v3 = [a3 value];
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = [WFNumberStringSubstitutableState alloc];
    v5 = [v3 amount];
    v6 = [v5 stringValue];
    v7 = [(WFNumberStringSubstitutableState *)v4 initWithValue:v6];

    v8 = [WFQuantityParameterState alloc];
    v9 = [v3 currencyCode];
    v10 = [(WFQuantityParameterState *)v8 initWithMagnitudeState:v7 unitString:v9];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)getLinkValueFromProcessedParameterValue:(id)a3 parameterState:(id)a4 permissionRequestor:(id)a5 runningFromToolKit:(BOOL)a6 completionHandler:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v14 = (void (**)(id, void *, void))a7;
  id v20 = v11;
  if (v20 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v15 = objc_alloc(MEMORY[0x1E4F303C0]);
    v16 = [v20 magnitude];
    v17 = [v20 unitString];
    v18 = (void *)[v15 initWithAmount:v16 currencyCode:v17];

    v19 = [(WFLinkActionParameterDefinition *)self linkValueWithValue:v18];
    v14[2](v14, v19, 0);
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
    id v9 = objc_alloc(MEMORY[0x1E4F303C0]);
    v10 = [v8 magnitudeState];
    id v11 = [v10 decimalNumber];
    id v12 = [v8 unitString];
    id v13 = (void *)[v9 initWithAmount:v11 currencyCode:v12];

    v14 = [(WFLinkActionParameterDefinition *)self linkValueWithValue:v13];
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)defaultSerializedRepresentationFromParameterMetadataDefaultValue:(id)a3
{
  id v3 = a3;
  v4 = v3;
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
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setValue:&unk_1F2317220 forKey:@"DefaultValue"];
  [v3 setValue:*MEMORY[0x1E4FB4E60] forKey:@"TextAlignment"];
  [v3 setValue:MEMORY[0x1E4F1CC28] forKey:@"AllowsNegativeNumbers"];
  v4 = [(WFLinkActionParameterDefinition *)self objectForTypeSpecificMetadataKey:*MEMORY[0x1E4F729C8] ofClass:objc_opt_class()];
  if ([v4 count]) {
    [v3 setObject:v4 forKey:@"PossibleUnits"];
  }
  v8.receiver = self;
  v8.super_class = (Class)WFLinkActionCurrencyAmountParameterDefinition;
  id v5 = [(WFLinkActionParameterDefinition *)&v8 parameterDefinitionDictionary];
  id v6 = [v5 definitionByAddingEntriesInDictionary:v3];

  return v6;
}

- (Class)parameterClass
{
  return (Class)objc_opt_class();
}

- (WFLinkActionCurrencyAmountParameterDefinition)initWithParameterMetadata:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F72CB8];
  id v5 = a3;
  id v6 = [v4 currencyAmountValueType];
  v9.receiver = self;
  v9.super_class = (Class)WFLinkActionCurrencyAmountParameterDefinition;
  id v7 = [(WFLinkActionParameterDefinition *)&v9 initWithValueType:v6 parameterMetadata:v5];

  return v7;
}

@end