@interface WFDictionaryParameterState
+ (Class)processingValueClass;
+ (void)processValues:(id)a3 context:(id)a4 processingClass:(Class)a5 userInputRequiredHandler:(id)a6 valueHandler:(id)a7;
- (BOOL)isEqual:(id)a3;
- (NSArray)containedVariables;
- (NSArray)keyValuePairs;
- (NSUUID)identity;
- (WFDictionaryParameterState)initWithKeyValuePairs:(id)a3;
- (WFDictionaryParameterState)initWithKeyValuePairs:(id)a3 identity:(id)a4;
- (WFDictionaryParameterState)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5;
- (WFPropertyListObject)serializedRepresentation;
- (unint64_t)hash;
- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5;
@end

@implementation WFDictionaryParameterState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_keyValuePairs, 0);
}

- (NSUUID)identity
{
  return self->_identity;
}

- (NSArray)keyValuePairs
{
  return self->_keyValuePairs;
}

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = objc_opt_class();
  id v12 = [(WFDictionaryParameterState *)self keyValuePairs];
  [v11 processValues:v12 context:v10 processingClass:objc_opt_class() userInputRequiredHandler:v9 valueHandler:v8];
}

- (NSArray)containedVariables
{
  v2 = [(WFDictionaryParameterState *)self keyValuePairs];
  v3 = [v2 valueForKeyPath:@"@unionOfArrays.containedVariables"];

  return (NSArray *)v3;
}

- (unint64_t)hash
{
  v2 = [(WFDictionaryParameterState *)self keyValuePairs];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WFDictionaryParameterState *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(WFDictionaryParameterState *)v4 keyValuePairs];
      v6 = [(WFDictionaryParameterState *)self keyValuePairs];
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
  v10[2] = *MEMORY[0x1E4F143B8];
  v2 = [(WFDictionaryParameterState *)self keyValuePairs];
  unint64_t v3 = objc_msgSend(v2, "if_map:", &__block_literal_global_10054);

  id v8 = v3;
  v9[0] = @"WFSerializationType";
  v9[1] = @"Value";
  v10[0] = @"WFDictionaryFieldValue";
  char v7 = @"WFDictionaryFieldValueItems";
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  v10[1] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

  return (WFPropertyListObject *)v5;
}

uint64_t __54__WFDictionaryParameterState_serializedRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializedRepresentation];
}

- (WFDictionaryParameterState)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  uint64_t v11 = objc_opt_class();
  id v12 = WFEnforceClass(v10, v11);

  v13 = [v12 objectForKey:@"Value"];
  uint64_t v14 = objc_opt_class();
  v15 = WFEnforceClass(v13, v14);

  v16 = [v15 objectForKey:@"WFDictionaryFieldValueItems"];
  uint64_t v17 = objc_opt_class();
  v18 = WFEnforceClass(v16, v17);

  if (v18)
  {
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    v24 = __90__WFDictionaryParameterState_initWithSerializedRepresentation_variableProvider_parameter___block_invoke;
    v25 = &unk_1E6556D08;
    id v26 = v8;
    id v27 = v9;
    v19 = objc_msgSend(v18, "if_compactMap:", &v22);
    self = -[WFDictionaryParameterState initWithKeyValuePairs:](self, "initWithKeyValuePairs:", v19, v22, v23, v24, v25);

    v20 = self;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

WFDictionaryParameterKeyValuePair *__90__WFDictionaryParameterState_initWithSerializedRepresentation_variableProvider_parameter___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [[WFDictionaryParameterKeyValuePair alloc] initWithSerializedRepresentation:v3 variableProvider:*(void *)(a1 + 32) parameter:*(void *)(a1 + 40)];

  return v4;
}

- (WFDictionaryParameterState)initWithKeyValuePairs:(id)a3 identity:(id)a4
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
    [v15 handleFailureInMethod:a2, self, @"WFDictionaryParameterState.m", 110, @"Invalid parameter not satisfying: %@", @"keyValuePairs" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"WFDictionaryParameterState.m", 111, @"Invalid parameter not satisfying: %@", @"identity" object file lineNumber description];

LABEL_3:
  v17.receiver = self;
  v17.super_class = (Class)WFDictionaryParameterState;
  id v10 = [(WFDictionaryParameterState *)&v17 init];
  if (v10)
  {
    uint64_t v11 = [v7 copy];
    keyValuePairs = v10->_keyValuePairs;
    v10->_keyValuePairs = (NSArray *)v11;

    objc_storeStrong((id *)&v10->_identity, a4);
    v13 = v10;
  }

  return v10;
}

- (WFDictionaryParameterState)initWithKeyValuePairs:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F29128];
  id v5 = a3;
  v6 = [v4 UUID];
  id v7 = [(WFDictionaryParameterState *)self initWithKeyValuePairs:v5 identity:v6];

  return v7;
}

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

+ (void)processValues:(id)a3 context:(id)a4 processingClass:(Class)a5 userInputRequiredHandler:(id)a6 valueHandler:(id)a7
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a7;
  uint64_t v14 = objc_opt_new();
  v15 = objc_opt_new();
  v16 = objc_opt_new();
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x2020000000;
  char v44 = 0;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3032000000;
  v41[3] = __Block_byref_object_copy__10141;
  v41[4] = __Block_byref_object_dispose__10142;
  id v42 = 0;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __119__WFDictionaryParameterState_Convenience__processValues_context_processingClass_userInputRequiredHandler_valueHandler___block_invoke;
  v34[3] = &unk_1E654EC70;
  id v35 = v14;
  id v36 = v15;
  id v37 = v16;
  v39 = v43;
  v40 = v41;
  id v17 = v11;
  id v38 = v17;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __119__WFDictionaryParameterState_Convenience__processValues_context_processingClass_userInputRequiredHandler_valueHandler___block_invoke_4;
  v25[3] = &unk_1E654EC98;
  v31 = v43;
  id v18 = v12;
  id v29 = v18;
  v32 = v41;
  v19 = v10;
  Class v33 = a5;
  id v20 = v37;
  id v26 = v20;
  id v21 = v36;
  id v27 = v21;
  id v22 = v35;
  id v28 = v22;
  id v23 = v13;
  id v30 = v23;
  objc_msgSend(v19, "if_enumerateAsynchronouslyInSequence:completionHandler:", v34, v25);

  _Block_object_dispose(v41, 8);
  _Block_object_dispose(v43, 8);
}

void __119__WFDictionaryParameterState_Convenience__processValues_context_processingClass_userInputRequiredHandler_valueHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __119__WFDictionaryParameterState_Convenience__processValues_context_processingClass_userInputRequiredHandler_valueHandler___block_invoke_2;
  v17[3] = &unk_1E654EC20;
  id v22 = v7;
  id v18 = *(id *)(a1 + 32);
  id v19 = *(id *)(a1 + 40);
  id v20 = v6;
  id v21 = *(id *)(a1 + 48);
  long long v23 = *(_OWORD *)(a1 + 64);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __119__WFDictionaryParameterState_Convenience__processValues_context_processingClass_userInputRequiredHandler_valueHandler___block_invoke_3;
  v12[3] = &unk_1E654EC48;
  id v13 = v20;
  uint64_t v8 = *(void *)(a1 + 56);
  id v9 = *(id *)(a1 + 48);
  long long v16 = *(_OWORD *)(a1 + 64);
  id v14 = v9;
  id v15 = v22;
  id v10 = v22;
  id v11 = v20;
  [v11 getProcessedPair:v17 context:v8 userInputRequiredHandler:v12];
}

void __119__WFDictionaryParameterState_Convenience__processValues_context_processingClass_userInputRequiredHandler_valueHandler___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    uint64_t v4 = *(void *)(a1 + 56);
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
    id v6 = (void *)[objc_alloc(*(Class *)(a1 + 88)) initWithKeyValuePairs:*(void *)(a1 + 32)];
    (*(void (**)(uint64_t, uint64_t, void *))(v4 + 16))(v4, v5, v6);
  }
  else
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F5A9B0]) initWithObjects:*(void *)(a1 + 40) forKeys:*(void *)(a1 + 48)];
    (*(void (**)(void, void *, id))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64), v6, v7);
  }
}

void __119__WFDictionaryParameterState_Convenience__processValues_context_processingClass_userInputRequiredHandler_valueHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v18 = a2;
  id v9 = a3;
  id v10 = a5;
  if (v18 && v9)
  {
    [*(id *)(a1 + 32) addObject:v18];
    [*(id *)(a1 + 40) addObject:v9];
    id v11 = [[WFVariableString alloc] initWithString:v18];
    id v12 = [[WFPropertyListParameterValue alloc] initWithObject:v9];
    id v13 = v12;
    if (v12)
    {
      id v14 = v12;
    }
    else
    {
      id v14 = [*(id *)(a1 + 48) value];
    }
    id v15 = v14;

    long long v16 = *(void **)(a1 + 56);
    id v17 = [[WFDictionaryParameterKeyValuePair alloc] initWithKey:v11 value:v15];
    [v16 addObject:v17];

    if (a4 != -1)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), a5);
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

void __119__WFDictionaryParameterState_Convenience__processValues_context_processingClass_userInputRequiredHandler_valueHandler___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a3;
  id v19 = a4;
  id v8 = a2;
  id v9 = [[WFVariableString alloc] initWithString:v8];

  if (!v19)
  {
    id v10 = [*(id *)(a1 + 32) value];
    +[WFPropertyListParameterValue defaultStateForValueType:](WFPropertyListParameterValue, "defaultStateForValueType:", [v10 valueType]);
    id v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v11 = [WFPropertyListParameterValue alloc];
  id v12 = [*(id *)(a1 + 32) value];
  id v13 = -[WFPropertyListParameterValue initWithType:state:](v11, "initWithType:state:", [v12 valueType], v19);

  id v14 = *(void **)(a1 + 40);
  id v15 = [[WFDictionaryParameterKeyValuePair alloc] initWithKey:v9 value:v13];
  [v14 addObject:v15];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  uint64_t v16 = *(void *)(*(void *)(a1 + 64) + 8);
  id v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v7;
  id v18 = v7;

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

@end