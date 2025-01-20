@interface WFQuantityFieldParameter
+ (BOOL)defaultAllowsDecimalNumbers;
+ (BOOL)defaultAllowsNegativeNumbers;
- (Class)singleStateClass;
- (NSArray)possibleUnits;
- (WFQuantityFieldParameter)initWithDefinition:(id)a3;
- (id)defaultSerializedRepresentation;
- (id)defaultUnit;
- (id)localizedLabelForPossibleUnit:(id)a3 magnitude:(id)a4 style:(unint64_t)a5;
- (void)createDialogRequestWithAttribution:(id)a3 defaultState:(id)a4 prompt:(id)a5 completionHandler:(id)a6;
- (void)setPossibleUnits:(id)a3;
@end

@implementation WFQuantityFieldParameter

- (void).cxx_destruct
{
}

- (NSArray)possibleUnits
{
  return self->_possibleUnits;
}

- (void)createDialogRequestWithAttribution:(id)a3 defaultState:(id)a4 prompt:(id)a5 completionHandler:(id)a6
{
}

- (id)defaultSerializedRepresentation
{
  v10.receiver = self;
  v10.super_class = (Class)WFQuantityFieldParameter;
  v3 = [(WFParameter *)&v10 defaultSerializedRepresentation];
  if (v3) {
    v4 = [(WFVariableSubstitutableParameterState *)[WFNumberStringSubstitutableState alloc] initWithSerializedRepresentation:v3 variableProvider:0 parameter:0];
  }
  else {
    v4 = 0;
  }
  v5 = [WFQuantityParameterState alloc];
  v6 = [(WFQuantityFieldParameter *)self defaultUnit];
  v7 = [(WFQuantityParameterState *)v5 initWithMagnitudeState:v4 unitString:v6];
  v8 = [(WFQuantityParameterState *)v7 serializedRepresentation];

  return v8;
}

- (id)defaultUnit
{
  v2 = [(WFQuantityFieldParameter *)self possibleUnits];
  v3 = [v2 firstObject];

  return v3;
}

- (id)localizedLabelForPossibleUnit:(id)a3 magnitude:(id)a4 style:(unint64_t)a5
{
  id v5 = a3;
  return v5;
}

- (void)setPossibleUnits:(id)a3
{
  v4 = (NSArray *)[a3 copy];
  possibleUnits = self->_possibleUnits;
  self->_possibleUnits = v4;

  [(WFParameter *)self attributesDidChange];
}

- (WFQuantityFieldParameter)initWithDefinition:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WFQuantityFieldParameter;
  id v5 = [(WFNumberFieldParameter *)&v16 initWithDefinition:v4];
  if (v5)
  {
    v6 = [v4 objectForKey:@"PossibleUnits"];
    uint64_t v7 = objc_opt_class();
    id v8 = v6;
    if (v8 && (objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_super v10 = getWFGeneralLogObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        v11 = objc_opt_class();
        *(_DWORD *)buf = 136315906;
        v18 = "WFEnforceClass";
        __int16 v19 = 2114;
        id v20 = v8;
        __int16 v21 = 2114;
        v22 = v11;
        __int16 v23 = 2114;
        uint64_t v24 = v7;
        id v12 = v11;
        _os_log_impl(&dword_1C7F0A000, v10, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", buf, 0x2Au);
      }
      id v9 = 0;
    }
    else
    {
      id v9 = v8;
    }

    if (v9) {
      v13 = v9;
    }
    else {
      v13 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong((id *)&v5->_possibleUnits, v13);

    v14 = v5;
  }

  return v5;
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)defaultAllowsNegativeNumbers
{
  return 0;
}

+ (BOOL)defaultAllowsDecimalNumbers
{
  return 1;
}

@end