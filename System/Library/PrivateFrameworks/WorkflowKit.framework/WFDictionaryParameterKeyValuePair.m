@interface WFDictionaryParameterKeyValuePair
- (BOOL)isEqual:(id)a3;
- (NSUUID)identity;
- (WFDictionaryParameterKeyValuePair)initWithKey:(id)a3 value:(id)a4;
- (WFDictionaryParameterKeyValuePair)initWithKey:(id)a3 value:(id)a4 identity:(id)a5;
- (WFDictionaryParameterKeyValuePair)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5;
- (WFPropertyListObject)serializedRepresentation;
- (WFPropertyListParameterValue)value;
- (WFVariableString)key;
- (id)containedVariables;
- (void)getProcessedPair:(id)a3 context:(id)a4 userInputRequiredHandler:(id)a5;
@end

@implementation WFDictionaryParameterKeyValuePair

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (NSUUID)identity
{
  return self->_identity;
}

- (WFPropertyListParameterValue)value
{
  return self->_value;
}

- (WFVariableString)key
{
  return self->_key;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WFDictionaryParameterKeyValuePair *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ([(WFDictionaryParameterKeyValuePair *)v4 key],
          v5 = objc_claimAutoreleasedReturnValue(),
          [(WFDictionaryParameterKeyValuePair *)self key],
          v6 = objc_claimAutoreleasedReturnValue(),
          int v7 = [v5 isEqual:v6],
          v6,
          v5,
          v7))
    {
      v8 = [(WFDictionaryParameterKeyValuePair *)v4 value];
      v9 = [(WFDictionaryParameterKeyValuePair *)self value];
      char v10 = [v8 isEqual:v9];
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (WFPropertyListObject)serializedRepresentation
{
  v3 = objc_opt_new();
  v4 = [(WFDictionaryParameterKeyValuePair *)self key];
  v5 = WFSerializedVariableObject(v4);
  [v3 setObject:v5 forKey:@"WFKey"];

  v6 = [(WFDictionaryParameterKeyValuePair *)self value];
  int v7 = [v6 serializedRepresentation];
  [v3 addEntriesFromDictionary:v7];

  return (WFPropertyListObject *)v3;
}

- (WFDictionaryParameterKeyValuePair)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v8 objectForKey:@"WFKey"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    WFDeserializedVariableObject(v11, v9, v10);
    v12 = (WFVariableString *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v13 = v12;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v12 = [[WFVariableString alloc] initWithString:v11];
    goto LABEL_5;
  }
  v13 = 0;
LABEL_7:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v14 = [[WFPropertyListParameterValue alloc] initWithSerializedRepresentation:v8 variableProvider:v9 parameter:v10];
    self = [(WFDictionaryParameterKeyValuePair *)self initWithKey:v13 value:v14];

    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)containedVariables
{
  v3 = objc_opt_new();
  v4 = [(WFDictionaryParameterKeyValuePair *)self key];
  v5 = [v4 variables];
  [v3 addObjectsFromArray:v5];

  v6 = [(WFDictionaryParameterKeyValuePair *)self value];
  int v7 = [v6 containedVariables];
  [v3 addObjectsFromArray:v7];

  return v3;
}

- (void)getProcessedPair:(id)a3 context:(id)a4 userInputRequiredHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(WFDictionaryParameterKeyValuePair *)self key];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __87__WFDictionaryParameterKeyValuePair_getProcessedPair_context_userInputRequiredHandler___block_invoke;
  v15[3] = &unk_1E65502E8;
  v15[4] = self;
  id v16 = v9;
  id v17 = v10;
  id v18 = v8;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  [v11 processWithContext:v14 completionHandler:v15];
}

void __87__WFDictionaryParameterKeyValuePair_getProcessedPair_context_userInputRequiredHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a4;
  id v11 = a5;
  id v12 = [*(id *)(a1 + 32) value];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __87__WFDictionaryParameterKeyValuePair_getProcessedPair_context_userInputRequiredHandler___block_invoke_2;
  v23[3] = &unk_1E654EBD0;
  uint64_t v13 = *(void *)(a1 + 40);
  id v26 = *(id *)(a1 + 48);
  id v24 = v9;
  id v25 = v10;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __87__WFDictionaryParameterKeyValuePair_getProcessedPair_context_userInputRequiredHandler___block_invoke_3;
  v17[3] = &unk_1E654EBF8;
  id v21 = *(id *)(a1 + 56);
  uint64_t v22 = a3;
  id v18 = v24;
  id v19 = v25;
  id v20 = v11;
  id v14 = v11;
  id v15 = v25;
  id v16 = v24;
  [v12 processWithContext:v13 userInputRequiredHandler:v23 valueHandler:v17];
}

uint64_t __87__WFDictionaryParameterKeyValuePair_getProcessedPair_context_userInputRequiredHandler___block_invoke_2(void *a1, uint64_t a2, uint64_t a3)
{
  if (a1[5]) {
    a2 = a1[5];
  }
  return (*(uint64_t (**)(void, void, uint64_t, uint64_t))(a1[6] + 16))(a1[6], a1[4], a2, a3);
}

uint64_t __87__WFDictionaryParameterKeyValuePair_getProcessedPair_context_userInputRequiredHandler___block_invoke_3(void *a1, uint64_t a2, uint64_t a3)
{
  if (a1[6]) {
    a3 = a1[6];
  }
  return (*(uint64_t (**)(void, void, uint64_t, void, void, uint64_t))(a1[7] + 16))(a1[7], a1[4], a2, a1[8], a1[5], a3);
}

- (WFDictionaryParameterKeyValuePair)initWithKey:(id)a3 value:(id)a4 identity:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"WFDictionaryParameterState.m", 23, @"Invalid parameter not satisfying: %@", @"[key isKindOfClass:[WFVariableString class]]" object file lineNumber description];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"WFDictionaryParameterState.m", 24, @"Invalid parameter not satisfying: %@", @"[value isKindOfClass:[WFPropertyListParameterValue class]]" object file lineNumber description];
  }
  v21.receiver = self;
  v21.super_class = (Class)WFDictionaryParameterKeyValuePair;
  id v12 = [(WFDictionaryParameterKeyValuePair *)&v21 init];
  if (v12)
  {
    uint64_t v13 = [v9 copy];
    key = v12->_key;
    v12->_key = (WFVariableString *)v13;

    uint64_t v15 = [v10 copy];
    value = v12->_value;
    v12->_value = (WFPropertyListParameterValue *)v15;

    objc_storeStrong((id *)&v12->_identity, a5);
    id v17 = v12;
  }

  return v12;
}

- (WFDictionaryParameterKeyValuePair)initWithKey:(id)a3 value:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F29128];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 UUID];
  id v10 = [(WFDictionaryParameterKeyValuePair *)self initWithKey:v8 value:v7 identity:v9];

  return v10;
}

@end