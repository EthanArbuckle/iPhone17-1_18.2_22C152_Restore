@interface WFVariableParameterState
+ (Class)processingValueClass;
- (BOOL)isEqual:(id)a3;
- (NSArray)containedVariables;
- (WFPropertyListObject)serializedRepresentation;
- (WFVariable)variable;
- (WFVariableParameterState)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5;
- (WFVariableParameterState)initWithVariable:(id)a3;
- (unint64_t)hash;
- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5;
@end

@implementation WFVariableParameterState

- (void).cxx_destruct
{
}

- (WFVariable)variable
{
  return self->_variable;
}

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v8 = a3;
  v9 = (void (**)(id, void *, void))a4;
  id v10 = a5;
  v11 = [(WFVariableParameterState *)self variable];
  if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v12 = [v11 prompt];
    v9[2](v9, v12, 0);
  }
  else
  {

    v13 = [(WFVariableParameterState *)self variable];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __85__WFVariableParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke;
    v14[3] = &unk_1E6556D78;
    id v15 = v10;
    [v13 getContentWithContext:v8 completionHandler:v14];

    v11 = v15;
  }
}

uint64_t __85__WFVariableParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSArray)containedVariables
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(WFVariableParameterState *)self variable];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return (NSArray *)v3;
}

- (unint64_t)hash
{
  v2 = [(WFVariableParameterState *)self variable];
  unint64_t v3 = [v2 hash] ^ 0xADFAF12DLL;

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (WFVariableParameterState *)a3;
  if (self == v5)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = [(WFVariableParameterState *)self variable];
      if (v6
        || ([(WFVariableParameterState *)v5 variable],
            (unint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v7 = [(WFVariableParameterState *)self variable];
        id v8 = [(WFVariableParameterState *)v5 variable];
        char v9 = [v7 isEqual:v8];

        if (v6)
        {
LABEL_11:

          goto LABEL_12;
        }
      }
      else
      {
        char v9 = 1;
      }

      goto LABEL_11;
    }
    char v9 = 0;
  }
LABEL_12:

  return v9;
}

- (WFPropertyListObject)serializedRepresentation
{
  v2 = [(WFVariableParameterState *)self variable];
  unint64_t v3 = WFSerializedVariableObject(v2);

  return (WFPropertyListObject *)v3;
}

- (WFVariableParameterState)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_opt_class();
  id v12 = v8;
  if (!v12)
  {
LABEL_8:
    v14 = 0;
    goto LABEL_11;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v15 = getWFGeneralLogObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      int v18 = 136315906;
      v19 = "WFEnforceClass";
      __int16 v20 = 2114;
      id v21 = v12;
      __int16 v22 = 2114;
      id v23 = (id)objc_opt_class();
      __int16 v24 = 2114;
      uint64_t v25 = v11;
      id v16 = v23;
      _os_log_impl(&dword_1C7F0A000, v15, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", (uint8_t *)&v18, 0x2Au);
    }
    goto LABEL_8;
  }
  v13 = WFDeserializedVariableObject(v12, v9, v10);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    self = [(WFVariableParameterState *)self initWithVariable:v13];
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

LABEL_11:
  return v14;
}

- (WFVariableParameterState)initWithVariable:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFVariableParameterState.m", 18, @"Invalid parameter not satisfying: %@", @"variable" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)WFVariableParameterState;
  v7 = [(WFVariableParameterState *)&v12 init];
  id v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_variable, a3);
    id v9 = v8;
  }

  return v8;
}

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

@end