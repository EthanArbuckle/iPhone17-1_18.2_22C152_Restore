@interface WFLinkActionPaymentMethodParameterDefinition
- (Class)parameterClass;
- (WFLinkActionPaymentMethodParameterDefinition)initWithParameterMetadata:(id)a3;
- (id)defaultSerializedRepresentationFromParameterMetadataDefaultValue:(id)a3;
- (id)linkValueFromParameterState:(id)a3;
- (id)parameterStateFromLinkValue:(id)a3;
- (void)getLinkValueFromProcessedParameterValue:(id)a3 parameterState:(id)a4 permissionRequestor:(id)a5 runningFromToolKit:(BOOL)a6 completionHandler:(id)a7;
@end

@implementation WFLinkActionPaymentMethodParameterDefinition

- (id)parameterStateFromLinkValue:(id)a3
{
  v3 = [a3 value];
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    v4 = [(WFVariableSubstitutableParameterState *)[WFINPaymentMethodParameterState alloc] initWithValue:v3];
  }
  else {
    v4 = 0;
  }

  return v4;
}

- (void)getLinkValueFromProcessedParameterValue:(id)a3 parameterState:(id)a4 permissionRequestor:(id)a5 runningFromToolKit:(BOOL)a6 completionHandler:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v14 = (void (**)(id, void *, void))a7;
  id v16 = v11;
  if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v15 = [(WFLinkActionParameterDefinition *)self linkValueWithValue:v16];
    v14[2](v14, v15, 0);
  }
  else
  {

    v14[2](v14, 0, 0);
  }
}

- (id)linkValueFromParameterState:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = objc_alloc(MEMORY[0x1E4F305A8]);
    v6 = [v4 value];
    uint64_t v7 = [v6 type];
    v8 = [v4 value];
    v9 = [v8 name];
    v10 = [v4 value];
    id v11 = [v10 identificationHint];
    id v12 = [v4 value];
    [v12 icon];
    id v13 = v17 = self;
    v14 = (void *)[v5 initWithType:v7 name:v9 identificationHint:v11 icon:v13];

    v15 = [(WFLinkActionParameterDefinition *)v17 linkValueWithValue:v14];
  }
  else
  {
    v15 = 0;
  }

  return v15;
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

- (Class)parameterClass
{
  return (Class)objc_opt_class();
}

- (WFLinkActionPaymentMethodParameterDefinition)initWithParameterMetadata:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F72CB8];
  id v5 = a3;
  v6 = [v4 paymentMethodValueType];
  v9.receiver = self;
  v9.super_class = (Class)WFLinkActionPaymentMethodParameterDefinition;
  uint64_t v7 = [(WFLinkActionParameterDefinition *)&v9 initWithValueType:v6 parameterMetadata:v5];

  return v7;
}

@end