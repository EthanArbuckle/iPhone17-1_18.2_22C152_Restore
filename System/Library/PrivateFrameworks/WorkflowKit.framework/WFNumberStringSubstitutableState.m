@interface WFNumberStringSubstitutableState
+ (Class)processingValueClass;
+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5;
- (NSDecimalNumber)decimalNumber;
- (NSNumber)legacyNumber;
- (WFNumberStringSubstitutableState)initWithValue:(id)a3;
- (id)serializedRepresentation;
- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5;
- (void)setLegacyNumber:(id)a3;
@end

@implementation WFNumberStringSubstitutableState

+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v8;
  }
  else
  {
    v14.receiver = a1;
    v14.super_class = (Class)&OBJC_METACLASS___WFNumberStringSubstitutableState;
    objc_msgSendSuper2(&v14, sel_valueFromSerializedRepresentation_variableProvider_parameter_, v8, v9, v10);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  return v12;
}

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
}

- (void)setLegacyNumber:(id)a3
{
}

- (NSNumber)legacyNumber
{
  return self->_legacyNumber;
}

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, void))a5;
  id v11 = [(WFVariableSubstitutableParameterState *)self variable];

  if (v11)
  {
    v19.receiver = self;
    v19.super_class = (Class)WFNumberStringSubstitutableState;
    [(WFVariableSubstitutableParameterState *)&v19 processWithContext:v8 userInputRequiredHandler:v9 valueHandler:v10];
  }
  else
  {
    v12 = [(WFNumberStringSubstitutableState *)self legacyNumber];

    if (v12)
    {
      v13 = (void *)MEMORY[0x1E4F28C28];
      objc_super v14 = [(WFNumberStringSubstitutableState *)self legacyNumber];
      v15 = v14;
      if (v14)
      {
        [v14 decimalValue];
      }
      else
      {
        v17[0] = 0;
        v17[1] = 0;
        int v18 = 0;
      }
      v16 = [v13 decimalNumberWithDecimal:v17];
      v10[2](v10, v16, 0);
    }
    else
    {
      v15 = [(WFNumberStringSubstitutableState *)self decimalNumber];
      v10[2](v10, v15, 0);
    }
  }
}

- (NSDecimalNumber)decimalNumber
{
  v2 = [(WFVariableSubstitutableParameterState *)self value];
  if ([v2 length])
  {
    v3 = objc_opt_new();
    [v3 setNumberStyle:1];
    [v3 setUsesGroupingSeparator:0];
    [v3 setGeneratesDecimalNumbers:1];
    v4 = [v3 numberFromString:v2];
    if (!v4)
    {
      [v2 doubleValue];
      v5 = objc_msgSend(NSNumber, "numberWithDouble:");
      v6 = [v5 stringValue];
      v4 = [v3 numberFromString:v6];
    }
    v7 = [MEMORY[0x1E4F28C28] notANumber];
    char v8 = [v4 isEqual:v7];

    if (v8) {
      id v9 = 0;
    }
    else {
      id v9 = v4;
    }
  }
  else
  {
    id v9 = 0;
  }

  return (NSDecimalNumber *)v9;
}

- (id)serializedRepresentation
{
  v3 = [(WFNumberStringSubstitutableState *)self legacyNumber];

  if (v3)
  {
    v4 = [(WFNumberStringSubstitutableState *)self legacyNumber];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)WFNumberStringSubstitutableState;
    v4 = [(WFVariableSubstitutableParameterState *)&v6 serializedRepresentation];
  }
  return v4;
}

- (WFNumberStringSubstitutableState)initWithValue:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 stringValue];
  }
  else
  {
    v5 = v4;
    id v4 = 0;
  }
  v10.receiver = self;
  v10.super_class = (Class)WFNumberStringSubstitutableState;
  objc_super v6 = [(WFVariableSubstitutableParameterState *)&v10 initWithValue:v5];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_legacyNumber, v4);
    char v8 = v7;
  }

  return v7;
}

@end