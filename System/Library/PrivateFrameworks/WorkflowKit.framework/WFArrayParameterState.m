@interface WFArrayParameterState
+ (Class)processingValueClass;
+ (void)processValues:(id)a3 context:(id)a4 processingClass:(Class)a5 userInputRequiredHandler:(id)a6 valueHandler:(id)a7 processSingleVariableStringsAsContentItems:(BOOL)a8;
- (BOOL)isEqual:(id)a3;
- (NSArray)containedVariables;
- (NSArray)values;
- (NSUUID)identity;
- (WFArrayParameterState)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5;
- (WFArrayParameterState)initWithValues:(id)a3;
- (WFArrayParameterState)initWithValues:(id)a3 identity:(id)a4;
- (WFPropertyListObject)serializedRepresentation;
- (unint64_t)hash;
- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5;
@end

@implementation WFArrayParameterState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_values, 0);
}

- (NSUUID)identity
{
  return self->_identity;
}

- (NSArray)values
{
  return self->_values;
}

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = objc_opt_class();
  id v12 = [(WFArrayParameterState *)self values];
  [v11 processValues:v12 context:v10 processingClass:objc_opt_class() userInputRequiredHandler:v9 valueHandler:v8 processSingleVariableStringsAsContentItems:0];
}

- (NSArray)containedVariables
{
  v2 = [(WFArrayParameterState *)self values];
  v3 = [v2 valueForKeyPath:@"@unionOfArrays.containedVariables"];

  return (NSArray *)v3;
}

- (unint64_t)hash
{
  v2 = [(WFArrayParameterState *)self values];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WFArrayParameterState *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(WFArrayParameterState *)v4 values];
      v6 = [(WFArrayParameterState *)self values];
      char v7 = [v5 isEqualToArray:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (WFPropertyListObject)serializedRepresentation
{
  v2 = [(WFArrayParameterState *)self values];
  unint64_t v3 = objc_msgSend(v2, "if_map:", &__block_literal_global_62157);

  return (WFPropertyListObject *)v3;
}

id __49__WFArrayParameterState_serializedRepresentation__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (![v2 valueType] || objc_msgSend(v2, "valueType") == 6)
  {
    unint64_t v3 = [v2 state];
    if ([v3 shouldSerializeAsPlainString])
    {
      v4 = [v3 variableString];
      v5 = [v4 stringByRemovingVariables];

      goto LABEL_7;
    }
  }
  v5 = [v2 serializedRepresentation];
LABEL_7:

  return v5;
}

- (WFArrayParameterState)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  uint64_t v11 = objc_opt_class();
  id v12 = WFEnforceClass(v10, v11);

  if (v12)
  {
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __85__WFArrayParameterState_initWithSerializedRepresentation_variableProvider_parameter___block_invoke;
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

WFPropertyListParameterValue *__85__WFArrayParameterState_initWithSerializedRepresentation_variableProvider_parameter___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [[WFPropertyListParameterValue alloc] initWithString:v3];
LABEL_5:
    v5 = v4;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [[WFPropertyListParameterValue alloc] initWithSerializedRepresentation:v3 variableProvider:*(void *)(a1 + 32) parameter:*(void *)(a1 + 40)];
    goto LABEL_5;
  }
  v5 = 0;
LABEL_7:

  return v5;
}

- (WFArrayParameterState)initWithValues:(id)a3 identity:(id)a4
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
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"WFArrayParameterState.m", 23, @"Invalid parameter not satisfying: %@", @"values" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"WFArrayParameterState.m", 24, @"Invalid parameter not satisfying: %@", @"identity" object file lineNumber description];

LABEL_3:
  v17.receiver = self;
  v17.super_class = (Class)WFArrayParameterState;
  id v10 = [(WFArrayParameterState *)&v17 init];
  if (v10)
  {
    uint64_t v11 = [v7 copy];
    values = v10->_values;
    v10->_values = (NSArray *)v11;

    objc_storeStrong((id *)&v10->_identity, a4);
    v13 = v10;
  }

  return v10;
}

- (WFArrayParameterState)initWithValues:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F29128];
  id v5 = a3;
  v6 = [v4 UUID];
  id v7 = [(WFArrayParameterState *)self initWithValues:v5 identity:v6];

  return v7;
}

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

+ (void)processValues:(id)a3 context:(id)a4 processingClass:(Class)a5 userInputRequiredHandler:(id)a6 valueHandler:(id)a7 processSingleVariableStringsAsContentItems:(BOOL)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  objc_super v17 = objc_opt_new();
  v18 = objc_opt_new();
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x2020000000;
  char v42 = 0;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x3032000000;
  v39[3] = __Block_byref_object_copy__62265;
  v39[4] = __Block_byref_object_dispose__62266;
  id v40 = 0;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __157__WFArrayParameterState_Convenience__processValues_context_processingClass_userInputRequiredHandler_valueHandler_processSingleVariableStringsAsContentItems___block_invoke;
  v32[3] = &unk_1E6556B90;
  BOOL v38 = a8;
  id v19 = v14;
  id v33 = v19;
  id v34 = v17;
  id v35 = v18;
  v36 = v41;
  v37 = v39;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __157__WFArrayParameterState_Convenience__processValues_context_processingClass_userInputRequiredHandler_valueHandler_processSingleVariableStringsAsContentItems___block_invoke_4;
  v24[3] = &unk_1E6556BB8;
  v29 = v41;
  id v20 = v15;
  id v27 = v20;
  v30 = v39;
  Class v31 = a5;
  id v21 = v35;
  id v25 = v21;
  id v22 = v16;
  id v28 = v22;
  id v23 = v34;
  id v26 = v23;
  objc_msgSend(v13, "if_enumerateAsynchronouslyInSequence:completionHandler:", v32, v24);

  _Block_object_dispose(v39, 8);
  _Block_object_dispose(v41, 8);
}

void __157__WFArrayParameterState_Convenience__processValues_context_processingClass_userInputRequiredHandler_valueHandler_processSingleVariableStringsAsContentItems___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if (!*(unsigned char *)(a1 + 72)) {
    goto LABEL_7;
  }
  id v8 = *(void **)(a1 + 32);
  id v9 = *(void **)(a1 + 40);
  id v10 = v6;
  id v11 = v8;
  id v12 = v9;
  id v13 = v7;
  if ([v10 valueType])
  {
LABEL_6:

LABEL_7:
    uint64_t v19 = *(void *)(a1 + 32);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __157__WFArrayParameterState_Convenience__processValues_context_processingClass_userInputRequiredHandler_valueHandler_processSingleVariableStringsAsContentItems___block_invoke_2;
    v25[3] = &unk_1E6556B40;
    id v26 = v6;
    id v27 = *(id *)(a1 + 48);
    long long v29 = *(_OWORD *)(a1 + 56);
    id v28 = v7;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __157__WFArrayParameterState_Convenience__processValues_context_processingClass_userInputRequiredHandler_valueHandler_processSingleVariableStringsAsContentItems___block_invoke_3;
    v21[3] = &unk_1E6556B68;
    id v24 = v28;
    id v22 = *(id *)(a1 + 40);
    id v23 = *(id *)(a1 + 48);
    [v26 processWithContext:v19 userInputRequiredHandler:v25 valueHandler:v21];

    goto LABEL_8;
  }
  id v14 = [v10 state];
  id v15 = [v14 variableString];
  if (![v15 representsSingleContentVariable])
  {

    goto LABEL_6;
  }
  id v20 = [v15 variables];
  id v16 = [v20 firstObject];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __WFProcessStringValueVariableContent_block_invoke;
  v30[3] = &unk_1E6556C08;
  id v31 = v12;
  id v32 = v13;
  id v17 = v13;
  id v18 = v12;
  [v16 getContentWithContext:v11 completionHandler:v30];

  [*(id *)(a1 + 48) addObject:v10];
LABEL_8:
}

void __157__WFArrayParameterState_Convenience__processValues_context_processingClass_userInputRequiredHandler_valueHandler_processSingleVariableStringsAsContentItems___block_invoke_4(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    uint64_t v1 = *(void *)(a1 + 48);
    uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    id v4 = (id)[objc_alloc(*(Class *)(a1 + 80)) initWithValues:*(void *)(a1 + 32)];
    (*(void (**)(uint64_t, uint64_t, id))(v1 + 16))(v1, v2, v4);
  }
  else
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v3();
  }
}

void __157__WFArrayParameterState_Convenience__processValues_context_processingClass_userInputRequiredHandler_valueHandler_processSingleVariableStringsAsContentItems___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    +[WFPropertyListParameterValue defaultStateForValueType:](WFPropertyListParameterValue, "defaultStateForValueType:", [*(id *)(a1 + 32) valueType]);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v11 = v6;
  id v7 = -[WFPropertyListParameterValue initWithType:state:]([WFPropertyListParameterValue alloc], "initWithType:state:", [*(id *)(a1 + 32) valueType], v6);
  [*(id *)(a1 + 40) addObject:v7];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
  id v10 = v5;

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __157__WFArrayParameterState_Convenience__processValues_context_processingClass_userInputRequiredHandler_valueHandler_processSingleVariableStringsAsContentItems___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (v3)
  {
    [*(id *)(a1 + 32) addObject:v3];
    id v4 = *(void **)(a1 + 40);
    id v5 = [[WFPropertyListParameterValue alloc] initWithObject:v6];
    [v4 addObject:v5];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

@end