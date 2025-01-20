@interface WFChooseFromMenuItemParameterState
+ (Class)processingValueClass;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldSerializeAsPlainString;
- (NSArray)synonyms;
- (WFChooseFromMenuItemParameterState)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5;
- (WFChooseFromMenuItemParameterState)initWithVariableString:(id)a3 synonyms:(id)a4 subtitle:(id)a5;
- (WFChooseFromMenuItemParameterState)initWithVariableString:(id)a3 userInputInsertionIndex:(int64_t)a4;
- (WFChooseFromMenuItemParameterState)initWithVariableString:(id)a3 userInputInsertionIndex:(int64_t)a4 synonyms:(id)a5 subtitle:(id)a6;
- (WFVariableString)subtitle;
- (id)containedVariables;
- (id)serializedRepresentation;
- (unint64_t)hash;
- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5;
@end

@implementation WFChooseFromMenuItemParameterState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_synonyms, 0);
}

- (WFVariableString)subtitle
{
  return self->_subtitle;
}

- (NSArray)synonyms
{
  return self->_synonyms;
}

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(WFVariableStringParameterState *)self variableString];

  if (v11)
  {
    v12 = [(WFVariableStringParameterState *)self variableString];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __95__WFChooseFromMenuItemParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke;
    v13[3] = &unk_1E65502E8;
    id v15 = v9;
    v13[4] = self;
    id v16 = v10;
    id v14 = v8;
    [v12 processWithContext:v14 completionHandler:v13];
  }
  else
  {
    (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
  }
}

void __95__WFChooseFromMenuItemParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke(id *a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    v12 = [a1[4] subtitle];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __95__WFChooseFromMenuItemParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_2;
    v22[3] = &unk_1E65502C0;
    id v13 = a1[5];
    id v14 = a1[6];
    id v15 = a1[4];
    id v25 = v14;
    v22[4] = v15;
    id v23 = v9;
    id v26 = a1[7];
    id v24 = a1[5];
    [v12 processWithContext:v13 completionHandler:v22];
  }
  else if (a3 == -1)
  {
    (*((void (**)(void))a1[7] + 2))();
  }
  else
  {
    id v16 = (void (**)(id, id, void *))a1[6];
    id v17 = objc_alloc((Class)objc_opt_class());
    v18 = [[WFVariableString alloc] initWithString:0];
    v19 = [a1[4] synonyms];
    v20 = [a1[4] subtitle];
    v21 = (void *)[v17 initWithVariableString:v18 userInputInsertionIndex:a3 synonyms:v19 subtitle:v20];
    v16[2](v16, v10, v21);
  }
}

void __95__WFChooseFromMenuItemParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    v12 = [*(id *)(a1 + 32) synonyms];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __95__WFChooseFromMenuItemParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_3;
    v23[3] = &unk_1E6550298;
    id v24 = *(id *)(a1 + 48);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __95__WFChooseFromMenuItemParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_5;
    v19[3] = &unk_1E6557A18;
    id v20 = *(id *)(a1 + 40);
    id v21 = v9;
    id v22 = *(id *)(a1 + 64);
    objc_msgSend(v12, "if_mapAsynchronously:completionHandler:", v23, v19);
  }
  else if (a3 == -1)
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    uint64_t v13 = *(void *)(a1 + 56);
    id v14 = objc_alloc((Class)objc_opt_class());
    id v15 = [[WFVariableString alloc] initWithString:*(void *)(a1 + 40)];
    id v16 = [*(id *)(a1 + 32) synonyms];
    id v17 = [[WFVariableString alloc] initWithString:0];
    v18 = (void *)[v14 initWithVariableString:v15 userInputInsertionIndex:a3 synonyms:v16 subtitle:v17];
    (*(void (**)(uint64_t, id, void *))(v13 + 16))(v13, v10, v18);
  }
}

void __95__WFChooseFromMenuItemParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  v7 = [a2 synonym];
  uint64_t v8 = *(void *)(a1 + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __95__WFChooseFromMenuItemParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_4;
  v10[3] = &unk_1E65503B8;
  id v11 = v6;
  id v9 = v6;
  [v7 processWithContext:v8 completionHandler:v10];
}

void __95__WFChooseFromMenuItemParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_5(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  v7 = [[WFChooseFromMenuItem alloc] initWithString:a1[4] synonyms:v6 subtitle:a1[5]];

  (*(void (**)(void))(a1[6] + 16))();
}

uint64_t __95__WFChooseFromMenuItemParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)containedVariables
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  v4 = [(WFVariableStringParameterState *)self variableString];
  id v5 = [v4 variables];
  [v3 addObjectsFromArray:v5];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [(WFChooseFromMenuItemParameterState *)self synonyms];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v16 + 1) + 8 * i) synonym];
        v12 = [v11 variables];
        [v3 addObjectsFromArray:v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  uint64_t v13 = [(WFChooseFromMenuItemParameterState *)self subtitle];
  id v14 = [v13 variables];
  [v3 addObjectsFromArray:v14];

  return v3;
}

- (unint64_t)hash
{
  v3 = [(WFVariableStringParameterState *)self variableString];
  uint64_t v4 = [v3 hash];
  id v5 = [(WFChooseFromMenuItemParameterState *)self synonyms];
  uint64_t v6 = [v5 hash];
  uint64_t v7 = [(WFChooseFromMenuItemParameterState *)self subtitle];
  unint64_t v8 = v4 ^ v6 ^ [v7 hash] ^ 0x5068BE73;

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (WFChooseFromMenuItemParameterState *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(WFVariableStringParameterState *)v4 variableString];
      uint64_t v6 = [(WFVariableStringParameterState *)self variableString];
      if ([v5 isEqual:v6])
      {
        uint64_t v7 = [(WFChooseFromMenuItemParameterState *)v4 synonyms];
        unint64_t v8 = [(WFChooseFromMenuItemParameterState *)self synonyms];
        if ([v7 isEqual:v8])
        {
          uint64_t v9 = [(WFChooseFromMenuItemParameterState *)v4 subtitle];
          id v10 = [(WFChooseFromMenuItemParameterState *)self subtitle];
          char v11 = [v9 isEqual:v10];
        }
        else
        {
          char v11 = 0;
        }
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }

  return v11;
}

- (BOOL)shouldSerializeAsPlainString
{
  v7.receiver = self;
  v7.super_class = (Class)WFChooseFromMenuItemParameterState;
  if (![(WFVariableStringParameterState *)&v7 shouldSerializeAsPlainString]) {
    return 0;
  }
  v3 = [(WFChooseFromMenuItemParameterState *)self synonyms];
  if ([v3 count])
  {
    char v4 = 0;
  }
  else
  {
    id v5 = [(WFChooseFromMenuItemParameterState *)self subtitle];
    char v4 = [v5 isEmpty];
  }
  return v4;
}

- (id)serializedRepresentation
{
  v3 = [(WFVariableStringParameterState *)self variableString];
  char v4 = WFSerializedVariableObject(v3);
  id v5 = (void *)[v4 mutableCopy];

  uint64_t v6 = [(WFChooseFromMenuItemParameterState *)self synonyms];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    unint64_t v8 = [(WFChooseFromMenuItemParameterState *)self synonyms];
    uint64_t v9 = objc_msgSend(v8, "if_map:", &__block_literal_global_22148);
    [v5 setObject:v9 forKeyedSubscript:@"Synonyms"];
  }
  id v10 = [(WFChooseFromMenuItemParameterState *)self subtitle];
  char v11 = [v10 isEmpty];

  if ((v11 & 1) == 0)
  {
    v12 = [(WFChooseFromMenuItemParameterState *)self subtitle];
    uint64_t v13 = [v12 serializedRepresentation];
    [v5 setObject:v13 forKeyedSubscript:@"Subtitle"];
  }
  return v5;
}

id __62__WFChooseFromMenuItemParameterState_serializedRepresentation__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 synonym];
  v3 = [v2 serializedRepresentation];

  return v3;
}

- (WFChooseFromMenuItemParameterState)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v11 = (WFVariableString *)v8;
      uint64_t v13 = WFDeserializedVariableObject(v11, v9, v10);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v14 = [(WFVariableString *)v11 objectForKeyedSubscript:@"Synonyms"];
        uint64_t v15 = objc_opt_class();
        long long v16 = WFEnforceClass(v14, v15);

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v23 = MEMORY[0x1E4F143A8];
          uint64_t v24 = 3221225472;
          id v25 = __98__WFChooseFromMenuItemParameterState_initWithSerializedRepresentation_variableProvider_parameter___block_invoke;
          id v26 = &unk_1E6550250;
          id v27 = v9;
          id v28 = v10;
          long long v17 = objc_msgSend(v16, "if_map:", &v23);
        }
        else
        {
          long long v17 = (void *)MEMORY[0x1E4F1CBF0];
        }
        long long v19 = [(WFVariableString *)v11 objectForKeyedSubscript:@"Subtitle", v23, v24, v25, v26];
        uint64_t v20 = objc_opt_class();
        uint64_t v21 = WFEnforceClass(v19, v20);

        if (!v21
          || (id v22 = [[WFVariableString alloc] initWithSerializedRepresentation:v21 variableProvider:v9 parameter:v10]) == 0)
        {
          id v22 = objc_alloc_init(WFVariableString);
        }
        self = [(WFChooseFromMenuItemParameterState *)self initWithVariableString:v13 synonyms:v17 subtitle:v22];

        goto LABEL_3;
      }
    }
    v12 = 0;
    goto LABEL_10;
  }
  char v11 = [[WFVariableString alloc] initWithString:v8];
  self = [(WFVariableStringParameterState *)self initWithVariableString:v11];
LABEL_3:

  v12 = self;
LABEL_10:

  return v12;
}

WFChooseFromMenuItemSynonym *__98__WFChooseFromMenuItemParameterState_initWithSerializedRepresentation_variableProvider_parameter___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = [[WFVariableString alloc] initWithSerializedRepresentation:v3 variableProvider:*(void *)(a1 + 32) parameter:*(void *)(a1 + 40)];

  id v5 = [WFChooseFromMenuItemSynonym alloc];
  uint64_t v6 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v7 = [(WFChooseFromMenuItemSynonym *)v5 initWithIdentity:v6 synonym:v4];

  return v7;
}

- (WFChooseFromMenuItemParameterState)initWithVariableString:(id)a3 userInputInsertionIndex:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = objc_alloc_init(WFVariableString);
  id v8 = [(WFChooseFromMenuItemParameterState *)self initWithVariableString:v6 userInputInsertionIndex:a4 synonyms:MEMORY[0x1E4F1CBF0] subtitle:v7];

  return v8;
}

- (WFChooseFromMenuItemParameterState)initWithVariableString:(id)a3 synonyms:(id)a4 subtitle:(id)a5
{
  return [(WFChooseFromMenuItemParameterState *)self initWithVariableString:a3 userInputInsertionIndex:-1 synonyms:a4 subtitle:a5];
}

- (WFChooseFromMenuItemParameterState)initWithVariableString:(id)a3 userInputInsertionIndex:(int64_t)a4 synonyms:(id)a5 subtitle:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = v13;
  if (v12)
  {
    if (v13) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"WFChooseFromMenuItemParameterState.m", 52, @"Invalid parameter not satisfying: %@", @"synonyms" object file lineNumber description];

    if (v14) {
      goto LABEL_3;
    }
  }
  uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:a2, self, @"WFChooseFromMenuItemParameterState.m", 53, @"Invalid parameter not satisfying: %@", @"subtitle" object file lineNumber description];

LABEL_3:
  v22.receiver = self;
  v22.super_class = (Class)WFChooseFromMenuItemParameterState;
  uint64_t v15 = [(WFVariableStringParameterState *)&v22 initWithVariableString:v11 userInputInsertionIndex:a4];
  if (v15)
  {
    uint64_t v16 = [v12 copy];
    synonyms = v15->_synonyms;
    v15->_synonyms = (NSArray *)v16;

    objc_storeStrong((id *)&v15->_subtitle, a6);
    long long v18 = v15;
  }

  return v15;
}

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

@end