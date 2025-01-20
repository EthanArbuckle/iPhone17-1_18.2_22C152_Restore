@interface WFIntentDescriptorParameterState
+ (Class)processingValueClass;
+ (id)serializedRepresentationFromValue:(id)a3;
+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5;
- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5;
@end

@implementation WFIntentDescriptorParameterState

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v8 = a3;
  v9 = (void (**)(id, void *, void))a4;
  id v10 = a5;
  v11 = WFLocalizedString(@"Select an app");
  v12 = [(WFVariableSubstitutableParameterState *)self value];
  int v13 = [v12 requiresUserConfirmation];

  if (v13) {
    goto LABEL_7;
  }
  v14 = [(WFVariableSubstitutableParameterState *)self variable];

  if (!v14)
  {
    v17.receiver = self;
    v17.super_class = (Class)WFIntentDescriptorParameterState;
    [(WFVariableSubstitutableParameterState *)&v17 processWithContext:v8 userInputRequiredHandler:v9 valueHandler:v10];
    goto LABEL_9;
  }
  v15 = [(WFVariableSubstitutableParameterState *)self variable];
  if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

LABEL_7:
    v9[2](v9, v11, 0);
    goto LABEL_9;
  }
  v16 = [v15 prompt];
  v9[2](v9, v16, 0);

LABEL_9:
}

+ (id)serializedRepresentationFromValue:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"WFAppDescriptorParameterState.m", 104, @"Invalid parameter not satisfying: %@", @"[value isKindOfClass:[INIntentDescriptor class]]" object file lineNumber description];
  }
  id v6 = v5;
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

  v9 = [v8 serializedRepresentation];

  return v9;
}

+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  id v7 = v5;
  if (v7)
  {
    if (objc_opt_isKindOfClass())
    {
      id v8 = (void *)[objc_alloc(MEMORY[0x1E4F304E0]) initWithSerializedRepresentation:v7];
      v9 = [MEMORY[0x1E4F302D0] sharedResolver];
      id v10 = [v9 resolvedIntentMatchingDescriptor:v8];

      goto LABEL_8;
    }
    v11 = getWFGeneralLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      int v14 = 136315906;
      v15 = "WFEnforceClass";
      __int16 v16 = 2114;
      id v17 = v7;
      __int16 v18 = 2114;
      id v19 = (id)objc_opt_class();
      __int16 v20 = 2114;
      uint64_t v21 = v6;
      id v12 = v19;
      _os_log_impl(&dword_1C7F0A000, v11, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", (uint8_t *)&v14, 0x2Au);
    }
  }
  id v10 = 0;
LABEL_8:

  return v10;
}

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

@end