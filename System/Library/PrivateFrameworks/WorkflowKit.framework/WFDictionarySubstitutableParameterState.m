@interface WFDictionarySubstitutableParameterState
+ (Class)processingValueClass;
+ (id)serializedRepresentationFromValue:(id)a3;
+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5;
- (NSUUID)identity;
- (WFDictionarySubstitutableParameterState)initWithKeyValuePairs:(id)a3;
- (WFDictionarySubstitutableParameterState)initWithKeyValuePairs:(id)a3 identity:(id)a4;
- (WFDictionarySubstitutableParameterState)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5;
- (id)containedVariables;
- (void)getObjectRepresentationOfVariableWithContext:(id)a3 processingValueClass:(Class)a4 valueHandler:(id)a5;
- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5;
@end

@implementation WFDictionarySubstitutableParameterState

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
    v14.super_class = (Class)WFDictionarySubstitutableParameterState;
    [(WFVariableSubstitutableParameterState *)&v14 processWithContext:v8 userInputRequiredHandler:v9 valueHandler:v10];
  }
  else
  {
    v12 = objc_opt_class();
    v13 = [(WFVariableSubstitutableParameterState *)self value];
    [v12 processValues:v13 context:v8 processingClass:objc_opt_class() userInputRequiredHandler:v9 valueHandler:v10];
  }
}

- (void)getObjectRepresentationOfVariableWithContext:(id)a3 processingValueClass:(Class)a4 valueHandler:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = [(WFVariableSubstitutableParameterState *)self variable];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __122__WFDictionarySubstitutableParameterState_getObjectRepresentationOfVariableWithContext_processingValueClass_valueHandler___block_invoke;
  v11[3] = &unk_1E6556D78;
  id v12 = v7;
  id v10 = v7;
  [v9 getContentWithContext:v8 completionHandler:v11];
}

void __122__WFDictionarySubstitutableParameterState_getObjectRepresentationOfVariableWithContext_processingValueClass_valueHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __122__WFDictionarySubstitutableParameterState_getObjectRepresentationOfVariableWithContext_processingValueClass_valueHandler___block_invoke_2;
  v5[3] = &unk_1E6556D50;
  id v6 = *(id *)(a1 + 32);
  [v3 generateCollectionByCoercingToItemClass:v4 completionHandler:v5];
}

void __122__WFDictionarySubstitutableParameterState_getObjectRepresentationOfVariableWithContext_processingValueClass_valueHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  id v7 = [a2 items];
  id v10 = [v7 firstObject];

  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = [v10 dictionary];
  (*(void (**)(uint64_t, void *, id))(v8 + 16))(v8, v9, v6);
}

- (id)containedVariables
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v9.receiver = self;
  v9.super_class = (Class)WFDictionarySubstitutableParameterState;
  uint64_t v4 = [(WFVariableSubstitutableParameterState *)&v9 containedVariables];
  v5 = (void *)[v3 initWithArray:v4];

  id v6 = [(WFDictionarySubstitutableParameterState *)self keyValuePairs];
  id v7 = [v6 valueForKeyPath:@"@unionOfArrays.containedVariables"];
  [v5 addObjectsFromArray:v7];

  return v5;
}

- (WFDictionarySubstitutableParameterState)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
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
      id v12 = [v11 keyValuePairs];
      self = [(WFDictionarySubstitutableParameterState *)self initWithKeyValuePairs:v12];
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
  v16 = [MEMORY[0x1E4F29128] UUID];
  identity = self->_identity;
  self->_identity = v16;

  return self;
}

- (WFDictionarySubstitutableParameterState)initWithKeyValuePairs:(id)a3 identity:(id)a4
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
    [v14 handleFailureInMethod:a2, self, @"WFDictionarySubstitutableParameterState.m", 23, @"Invalid parameter not satisfying: %@", @"keyValuePairs" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"WFDictionarySubstitutableParameterState.m", 24, @"Invalid parameter not satisfying: %@", @"identity" object file lineNumber description];

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)WFDictionarySubstitutableParameterState;
  id v10 = [(WFVariableSubstitutableParameterState *)&v16 initWithValue:v7];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_identity, a4);
    id v12 = v11;
  }

  return v11;
}

- (WFDictionarySubstitutableParameterState)initWithKeyValuePairs:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F29128];
  id v5 = a3;
  id v6 = [v4 UUID];
  id v7 = [(WFDictionarySubstitutableParameterState *)self initWithKeyValuePairs:v5 identity:v6];

  return v7;
}

+ (id)serializedRepresentationFromValue:(id)a3
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_msgSend(a3, "if_map:", &__block_literal_global_62513);
  id v8 = v3;
  v9[0] = @"WFSerializationType";
  v9[1] = @"Value";
  v10[0] = @"WFDictionaryFieldValue";
  id v7 = @"WFDictionaryFieldValueItems";
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  v10[1] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

  return v5;
}

uint64_t __77__WFDictionarySubstitutableParameterState_serializedRepresentationFromValue___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializedRepresentation];
}

+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = objc_opt_class();
  v11 = WFEnforceClass(v9, v10);

  id v12 = [v11 objectForKey:@"Value"];
  uint64_t v13 = objc_opt_class();
  objc_super v14 = WFEnforceClass(v12, v13);

  v15 = [v14 objectForKey:@"WFDictionaryFieldValueItems"];
  uint64_t v16 = objc_opt_class();
  v17 = WFEnforceClass(v15, v16);

  if (v17)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __104__WFDictionarySubstitutableParameterState_valueFromSerializedRepresentation_variableProvider_parameter___block_invoke;
    v20[3] = &unk_1E6556D08;
    id v21 = v7;
    id v22 = v8;
    v18 = objc_msgSend(v17, "if_compactMap:", v20);
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

WFDictionaryParameterKeyValuePair *__104__WFDictionarySubstitutableParameterState_valueFromSerializedRepresentation_variableProvider_parameter___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [[WFDictionaryParameterKeyValuePair alloc] initWithSerializedRepresentation:v3 variableProvider:*(void *)(a1 + 32) parameter:*(void *)(a1 + 40)];

  return v4;
}

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

@end