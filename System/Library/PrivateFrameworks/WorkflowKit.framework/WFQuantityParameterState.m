@interface WFQuantityParameterState
+ (Class)processingValueClass;
- (BOOL)isEqual:(id)a3;
- (NSArray)containedVariables;
- (NSString)unitString;
- (WFNumberStringSubstitutableState)magnitudeState;
- (WFPropertyListObject)serializedRepresentation;
- (WFQuantityParameterState)initWithMagnitudeState:(id)a3 unitString:(id)a4;
- (WFQuantityParameterState)initWithMagnitudeState:(id)a3 unitString:(id)a4 variable:(id)a5;
- (WFQuantityParameterState)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5;
- (WFQuantityParameterState)initWithVariable:(id)a3;
- (WFVariable)variable;
- (unint64_t)hash;
- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5;
@end

@implementation WFQuantityParameterState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitString, 0);
  objc_storeStrong((id *)&self->_magnitudeState, 0);
  objc_storeStrong((id *)&self->_variable, 0);
}

- (NSString)unitString
{
  return self->_unitString;
}

- (WFNumberStringSubstitutableState)magnitudeState
{
  return self->_magnitudeState;
}

- (WFVariable)variable
{
  return self->_variable;
}

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(WFQuantityParameterState *)self magnitudeState];
  v12 = [v11 decimalNumber];
  if (v12)
  {
  }
  else
  {
    v13 = [(WFQuantityParameterState *)self magnitudeState];
    v14 = [v13 variable];

    if (!v14)
    {
      (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
      goto LABEL_5;
    }
  }
  v15 = [(WFQuantityParameterState *)self magnitudeState];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __85__WFQuantityParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke;
  v18[3] = &unk_1E654F640;
  v18[4] = self;
  id v19 = v9;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __85__WFQuantityParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_2;
  v16[3] = &unk_1E654F668;
  v16[4] = self;
  id v17 = v10;
  [v15 processWithContext:v8 userInputRequiredHandler:v18 valueHandler:v16];

LABEL_5:
}

void __85__WFQuantityParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id v8 = objc_alloc((Class)objc_opt_class());
  id v10 = [*(id *)(a1 + 32) unitString];
  id v9 = (void *)[v8 initWithMagnitudeState:v6 unitString:v10];

  (*(void (**)(uint64_t, id, void *))(v5 + 16))(v5, v7, v9);
}

void __85__WFQuantityParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 40);
  id v10 = v5;
  if (v5)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F5A9F0]);
    id v8 = [*(id *)(a1 + 32) unitString];
    id v9 = (void *)[v7 initWithMagnitude:v10 unitString:v8];
    (*(void (**)(uint64_t, void *, void))(v6 + 16))(v6, v9, 0);
  }
  else
  {
    (*(void (**)(uint64_t, void, uint64_t))(v6 + 16))(v6, 0, a3);
  }
}

- (NSArray)containedVariables
{
  v2 = [(WFQuantityParameterState *)self magnitudeState];
  v3 = [v2 containedVariables];

  return (NSArray *)v3;
}

- (unint64_t)hash
{
  v3 = [(WFQuantityParameterState *)self magnitudeState];
  uint64_t v4 = [v3 hash];
  id v5 = [(WFQuantityParameterState *)self unitString];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v6 = (WFQuantityParameterState *)a3;
  if (self == v6)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [(WFQuantityParameterState *)v6 magnitudeState];
      id v8 = [(WFQuantityParameterState *)self magnitudeState];
      if (v7 == v8
        || ([(WFQuantityParameterState *)v6 magnitudeState],
            v3 = objc_claimAutoreleasedReturnValue(),
            [(WFQuantityParameterState *)self magnitudeState],
            uint64_t v4 = objc_claimAutoreleasedReturnValue(),
            [v3 isEqual:v4]))
      {
        id v10 = [(WFQuantityParameterState *)v6 unitString];
        v11 = [(WFQuantityParameterState *)self unitString];
        if (v10 == v11)
        {
          char v9 = 1;
        }
        else
        {
          v12 = [(WFQuantityParameterState *)v6 unitString];
          v13 = [(WFQuantityParameterState *)self unitString];
          char v9 = [v12 isEqualToString:v13];
        }
        if (v7 == v8) {
          goto LABEL_13;
        }
      }
      else
      {
        char v9 = 0;
      }

LABEL_13:
      goto LABEL_14;
    }
    char v9 = 0;
  }
LABEL_14:

  return v9;
}

- (WFPropertyListObject)serializedRepresentation
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v3 = [(WFQuantityParameterState *)self magnitudeState];
  uint64_t v4 = [v3 variable];
  id v5 = [v4 serializedRepresentation];
  unint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [v3 serializedRepresentation];
  }
  id v8 = v7;

  char v9 = objc_opt_new();
  [v9 setValue:v8 forKey:*MEMORY[0x1E4F5ABB0]];
  id v10 = [(WFQuantityParameterState *)self unitString];
  [v9 setValue:v10 forKey:*MEMORY[0x1E4F5ABB8]];

  v13[0] = @"WFSerializationType";
  v13[1] = @"Value";
  v14[0] = @"WFQuantityFieldValue";
  v14[1] = v9;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

  return (WFPropertyListObject *)v11;
}

- (WFQuantityParameterState)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  uint64_t v11 = objc_opt_class();
  v12 = WFEnforceClass(v10, v11);

  if (v12)
  {
    v13 = [v12 objectForKey:@"Value"];
    uint64_t v14 = objc_opt_class();
    WFEnforceClass(v13, v14);
    v15 = (WFQuantityParameterState *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = [(WFQuantityParameterState *)v15 objectForKeyedSubscript:*MEMORY[0x1E4F5ABB0]];
      id v17 = [(WFQuantityParameterState *)v15 objectForKeyedSubscript:*MEMORY[0x1E4F5ABB8]];
      uint64_t v18 = objc_opt_class();
      id v19 = WFEnforceClass(v17, v18);

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v20 = [[WFVariable alloc] initWithDictionary:v16 variableProvider:v8];
        if (v20) {
          v21 = [(WFVariableSubstitutableParameterState *)[WFNumberStringSubstitutableState alloc] initWithVariable:v20];
        }
        else {
          v21 = 0;
        }
      }
      else
      {
        v21 = [(WFVariableSubstitutableParameterState *)[WFNumberStringSubstitutableState alloc] initWithSerializedRepresentation:v16 variableProvider:v8 parameter:v9];
      }
      self = [(WFQuantityParameterState *)self initWithMagnitudeState:v21 unitString:v19];

      v15 = self;
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (WFQuantityParameterState)initWithVariable:(id)a3
{
  id v4 = a3;
  id v5 = [(WFVariableSubstitutableParameterState *)[WFNumberStringSubstitutableState alloc] initWithVariable:v4];
  unint64_t v6 = [(WFQuantityParameterState *)self initWithMagnitudeState:v5 unitString:0 variable:v4];

  return v6;
}

- (WFQuantityParameterState)initWithMagnitudeState:(id)a3 unitString:(id)a4 variable:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)WFQuantityParameterState;
  v12 = [(WFQuantityParameterState *)&v18 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_magnitudeState, a3);
    uint64_t v14 = [v10 copy];
    unitString = v13->_unitString;
    v13->_unitString = (NSString *)v14;

    objc_storeStrong((id *)&v13->_variable, a5);
    v16 = v13;
  }

  return v13;
}

- (WFQuantityParameterState)initWithMagnitudeState:(id)a3 unitString:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WFQuantityParameterState;
  id v9 = [(WFQuantityParameterState *)&v15 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_magnitudeState, a3);
    uint64_t v11 = [v8 copy];
    unitString = v10->_unitString;
    v10->_unitString = (NSString *)v11;

    v13 = v10;
  }

  return v10;
}

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

@end