@interface WFChooseFromMenuArrayParameterState
- (WFChooseFromMenuArrayParameterState)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5;
@end

@implementation WFChooseFromMenuArrayParameterState

- (WFChooseFromMenuArrayParameterState)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  uint64_t v11 = objc_opt_class();
  v12 = WFEnforceClass(v10, v11);

  if (v12)
  {
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __99__WFChooseFromMenuArrayParameterState_initWithSerializedRepresentation_variableProvider_parameter___block_invoke;
    v19 = &unk_1E6556AF8;
    id v20 = v8;
    id v21 = v9;
    v13 = objc_msgSend(v12, "if_compactMap:", &v16);
    self = -[WFArrayParameterState initWithValues:](self, "initWithValues:", v13, v16, v17, v18, v19);

    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

WFPropertyListParameterValue *__99__WFChooseFromMenuArrayParameterState_initWithSerializedRepresentation_variableProvider_parameter___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [[WFPropertyListParameterValue alloc] initWithChooseFromMenuString:v3];
LABEL_5:
    v5 = v4;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [[WFPropertyListParameterValue alloc] initWithSerializedRepresentation:v3 variableProvider:*(void *)(a1 + 32) parameter:*(void *)(a1 + 40) valueType:6 variableStringStateClass:objc_opt_class()];
    goto LABEL_5;
  }
  v5 = 0;
LABEL_7:

  return v5;
}

@end