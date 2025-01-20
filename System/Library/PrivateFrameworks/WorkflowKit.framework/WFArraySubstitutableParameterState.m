@interface WFArraySubstitutableParameterState
+ (Class)processingValueClass;
+ (id)serializedRepresentationFromValue:(id)a3;
+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5;
- (NSUUID)identity;
- (WFArraySubstitutableParameterState)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5;
- (WFArraySubstitutableParameterState)initWithValues:(id)a3;
- (WFArraySubstitutableParameterState)initWithValues:(id)a3 identity:(id)a4;
- (id)containedVariables;
- (void)getObjectRepresentationOfVariableWithContext:(id)a3 processingValueClass:(Class)a4 valueHandler:(id)a5;
- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5;
@end

@implementation WFArraySubstitutableParameterState

- (void).cxx_destruct
{
}

- (NSUUID)identity
{
  return self->_identity;
}

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(WFVariableSubstitutableParameterState *)self variable];

  if (v11)
  {
    v14.receiver = self;
    v14.super_class = (Class)WFArraySubstitutableParameterState;
    [(WFVariableSubstitutableParameterState *)&v14 processWithContext:v8 userInputRequiredHandler:v9 valueHandler:v10];
  }
  else
  {
    v12 = objc_opt_class();
    v13 = [(WFVariableSubstitutableParameterState *)self value];
    [v12 processValues:v13 context:v8 processingClass:objc_opt_class() userInputRequiredHandler:v9 valueHandler:v10 processSingleVariableStringsAsContentItems:0];
  }
}

- (void)getObjectRepresentationOfVariableWithContext:(id)a3 processingValueClass:(Class)a4 valueHandler:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = [(WFVariableSubstitutableParameterState *)self variable];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __117__WFArraySubstitutableParameterState_getObjectRepresentationOfVariableWithContext_processingValueClass_valueHandler___block_invoke;
  v11[3] = &unk_1E6556D78;
  id v12 = v7;
  id v10 = v7;
  [v9 getContentWithContext:v8 completionHandler:v11];
}

void __117__WFArraySubstitutableParameterState_getObjectRepresentationOfVariableWithContext_processingValueClass_valueHandler___block_invoke(uint64_t a1, void *a2)
{
  v7[4] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  v7[2] = objc_opt_class();
  v7[3] = objc_opt_class();
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:4];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __117__WFArraySubstitutableParameterState_getObjectRepresentationOfVariableWithContext_processingValueClass_valueHandler___block_invoke_2;
  v5[3] = &unk_1E6556D50;
  id v6 = *(id *)(a1 + 32);
  [v3 generateCollectionByCoercingToItemClasses:v4 completionHandler:v5];
}

void __117__WFArraySubstitutableParameterState_getObjectRepresentationOfVariableWithContext_processingValueClass_valueHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  id v7 = [a2 items];
  objc_msgSend(v7, "if_compactMap:", &__block_literal_global_191);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __117__WFArraySubstitutableParameterState_getObjectRepresentationOfVariableWithContext_processingValueClass_valueHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = [v2 string];
LABEL_8:
    v4 = (void *)v3;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = [v2 dictionary];
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    uint64_t v3 = [v2 number];
    goto LABEL_8;
  }
  v4 = 0;
LABEL_9:

  return v4;
}

- (id)containedVariables
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v9.receiver = self;
  v9.super_class = (Class)WFArraySubstitutableParameterState;
  v4 = [(WFVariableSubstitutableParameterState *)&v9 containedVariables];
  v5 = (void *)[v3 initWithArray:v4];

  id v6 = [(WFArraySubstitutableParameterState *)self values];
  id v7 = [v6 valueForKeyPath:@"@unionOfArrays.containedVariables"];
  [v5 addObjectsFromArray:v7];

  return v5;
}

- (WFArraySubstitutableParameterState)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v11 = WFDeserializedVariableObject(v8, v9, v10);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = [v11 values];
      self = [(WFArraySubstitutableParameterState *)self initWithValues:v12];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      self = [(WFVariableSubstitutableParameterState *)self initWithVariable:v11];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [v11 representsSingleContentVariable])
      {
        v13 = [v11 stringsAndVariables];
        objc_super v14 = [v13 firstObject];
        self = [(WFVariableSubstitutableParameterState *)self initWithVariable:v14];
      }
    }
  }
  v15 = [(id)objc_opt_class() valueFromSerializedRepresentation:v8 variableProvider:v9 parameter:v10];
  if (v15) {
    self = [(WFVariableSubstitutableParameterState *)self initWithValue:v15];
  }
  if (self)
  {
    v16 = [MEMORY[0x1E4F29128] UUID];
    identity = self->_identity;
    self->_identity = v16;

    v18 = self;
  }

  return self;
}

- (WFArraySubstitutableParameterState)initWithValues:(id)a3 identity:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    objc_super v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"WFArraySubstitutableParameterState.m", 24, @"Invalid parameter not satisfying: %@", @"values" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"WFArraySubstitutableParameterState.m", 25, @"Invalid parameter not satisfying: %@", @"identity" object file lineNumber description];

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)WFArraySubstitutableParameterState;
  id v10 = [(WFVariableSubstitutableParameterState *)&v16 initWithValue:v7];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_identity, a4);
    id v12 = v11;
  }

  return v11;
}

- (WFArraySubstitutableParameterState)initWithValues:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F29128];
  id v5 = a3;
  id v6 = [v4 UUID];
  id v7 = [(WFArraySubstitutableParameterState *)self initWithValues:v5 identity:v6];

  return v7;
}

+ (id)serializedRepresentationFromValue:(id)a3
{
  return (id)objc_msgSend(a3, "if_map:", &__block_literal_global_13519);
}

id __72__WFArraySubstitutableParameterState_serializedRepresentationFromValue___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (![v2 valueType] || objc_msgSend(v2, "valueType") == 6)
  {
    id v3 = [v2 state];
    if ([v3 shouldSerializeAsPlainString])
    {
      v4 = [v3 variableString];
      id v5 = [v4 stringByRemovingVariables];

      goto LABEL_7;
    }
  }
  id v5 = [v2 serializedRepresentation];
LABEL_7:

  return v5;
}

+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = objc_opt_class();
  id v11 = v7;
  if (v11)
  {
    if (objc_opt_isKindOfClass())
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __99__WFArraySubstitutableParameterState_valueFromSerializedRepresentation_variableProvider_parameter___block_invoke;
      v16[3] = &unk_1E6556AF8;
      v17 = v8;
      id v18 = v9;
      id v12 = objc_msgSend(v11, "if_compactMap:", v16);

      v13 = v17;
    }
    else
    {
      v13 = getWFGeneralLogObject();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315906;
        v20 = "WFEnforceClass";
        __int16 v21 = 2114;
        id v22 = v11;
        __int16 v23 = 2114;
        id v24 = (id)objc_opt_class();
        __int16 v25 = 2114;
        uint64_t v26 = v10;
        id v14 = v24;
        _os_log_impl(&dword_1C7F0A000, v13, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", buf, 0x2Au);
      }
      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

WFPropertyListParameterValue *__99__WFArraySubstitutableParameterState_valueFromSerializedRepresentation_variableProvider_parameter___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [[WFPropertyListParameterValue alloc] initWithString:v3];
LABEL_5:
    id v5 = v4;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [[WFPropertyListParameterValue alloc] initWithSerializedRepresentation:v3 variableProvider:*(void *)(a1 + 32) parameter:*(void *)(a1 + 40)];
    goto LABEL_5;
  }
  id v5 = 0;
LABEL_7:

  return v5;
}

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

@end