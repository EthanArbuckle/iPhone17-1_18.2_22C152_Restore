@interface WFNumberSubstitutableState
+ (Class)processingValueClass;
+ (id)serializedRepresentationFromNumber:(id)a3;
+ (id)serializedRepresentationFromValue:(id)a3;
+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5;
- (NSNumber)number;
- (WFNumberSubstitutableState)initWithNumber:(id)a3;
- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5;
@end

@implementation WFNumberSubstitutableState

- (NSNumber)number
{
  v2 = [(WFVariableSubstitutableParameterState *)self value];
  v3 = [v2 number];

  return (NSNumber *)v3;
}

- (WFNumberSubstitutableState)initWithNumber:(id)a3
{
  v4 = +[WFNumberWrapper wrapperWithNumber:a3];
  v5 = [(WFVariableSubstitutableParameterState *)self initWithValue:v4];

  return v5;
}

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void *, void))a5;
  v11 = [(WFVariableSubstitutableParameterState *)self variable];

  if (v11)
  {
    v13.receiver = self;
    v13.super_class = (Class)WFNumberSubstitutableState;
    [(WFVariableSubstitutableParameterState *)&v13 processWithContext:v8 userInputRequiredHandler:v9 valueHandler:v10];
  }
  else
  {
    v12 = [(WFNumberSubstitutableState *)self number];
    v10[2](v10, v12, 0);
  }
}

+ (id)serializedRepresentationFromNumber:(id)a3
{
  v4 = +[WFNumberWrapper wrapperWithNumber:a3];
  v5 = [a1 serializedRepresentationFromValue:v4];

  return v5;
}

+ (id)serializedRepresentationFromValue:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, a1, @"WFNumberSubstitutableState.m", 57, @"Invalid parameter not satisfying: %@", @"[value isKindOfClass:[WFNumberWrapper class]]" object file lineNumber description];
  }
  v6 = [v5 number];
  v7 = v6;
  if (!v6) {
    v6 = &stru_1F229A4D8;
  }
  id v8 = v6;

  return v8;
}

+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = +[WFNumberWrapper wrapperWithNumber:0];
    goto LABEL_10;
  }
  uint64_t v7 = objc_opt_class();
  id v8 = v5;
  if (v8)
  {
    id v9 = v8;
    if (objc_opt_isKindOfClass())
    {
      v6 = +[WFNumberWrapper wrapperWithNumber:v9];

      goto LABEL_10;
    }
    v10 = getWFGeneralLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      int v13 = 136315906;
      v14 = "WFEnforceClass";
      __int16 v15 = 2114;
      v16 = v9;
      __int16 v17 = 2114;
      id v18 = (id)objc_opt_class();
      __int16 v19 = 2114;
      uint64_t v20 = v7;
      id v11 = v18;
      _os_log_impl(&dword_1C7F0A000, v10, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", (uint8_t *)&v13, 0x2Au);
    }
  }
  v6 = 0;
LABEL_10:

  return v6;
}

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

@end