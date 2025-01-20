@interface WFContactSubstitutableState
+ (id)processingValueClasses;
+ (id)serializedRepresentationFromValue:(id)a3;
+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5;
- (BOOL)reinterpretsStringsAsContactHandlesFromVariable:(BOOL)a3;
- (WFCommunicationMethod)communicationMethod;
- (WFContactSubstitutableState)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5;
- (WFContactSubstitutableState)initWithValue:(id)a3;
- (id)processedEntriesFromCoercionResult:(id)a3 allowsCustomHandles:(BOOL)a4;
- (id)serializedRepresentation;
- (id)stringInterpretedAsContactHandle:(id)a3 allowsCustomHandles:(BOOL)a4;
- (id)valueItemClasses;
- (void)processContentCollection:(id)a3 context:(id)a4 valueHandler:(id)a5;
- (void)processIntoEntriesWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5;
- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5;
- (void)setCommunicationMethod:(id)a3;
@end

@implementation WFContactSubstitutableState

- (void).cxx_destruct
{
}

- (void)setCommunicationMethod:(id)a3
{
}

- (WFCommunicationMethod)communicationMethod
{
  return self->_communicationMethod;
}

- (id)valueItemClasses
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

- (id)stringInterpretedAsContactHandle:(id)a3 allowsCustomHandles:(BOOL)a4
{
  return 0;
}

- (BOOL)reinterpretsStringsAsContactHandlesFromVariable:(BOOL)a3
{
  return 0;
}

- (void)processContentCollection:(id)a3 context:(id)a4 valueHandler:(id)a5
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  v11 = [(WFContactSubstitutableState *)self valueItemClasses];
  if ([(WFContactSubstitutableState *)self reinterpretsStringsAsContactHandlesFromVariable:1])
  {
    uint64_t v12 = [v11 arrayByAddingObject:objc_opt_class()];

    v11 = (void *)v12;
  }
  v13 = (void *)MEMORY[0x1E4F5A7E0];
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  v22 = __77__WFContactSubstitutableState_processContentCollection_context_valueHandler___block_invoke;
  v23 = &unk_1E6558FA8;
  id v25 = v8;
  id v26 = v9;
  v24 = self;
  id v14 = v8;
  id v15 = v9;
  v16 = [v13 requestForCoercingToContentClasses:v11 completionHandler:&v20];
  v17 = (void *)MEMORY[0x1E4F5A7D8];
  uint64_t v27 = *MEMORY[0x1E4F5AAB8];
  v28[0] = MEMORY[0x1E4F1CC38];
  v18 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1, v20, v21, v22, v23, v24);
  v19 = [v17 optionsWithDictionary:v18];
  [v16 setOptions:v19];

  [v10 performCoercion:v16];
}

void __77__WFContactSubstitutableState_processContentCollection_context_valueHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v21 = a2;
  id v6 = a4;
  if (![v21 numberOfItems])
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_13;
  }
  v7 = *(void **)(a1 + 32);
  id v8 = [*(id *)(a1 + 40) parameter];
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }
  id v10 = v9;

  uint64_t v11 = [v10 allowsCustomHandles];
  uint64_t v12 = [v7 processedEntriesFromCoercionResult:v21 allowsCustomHandles:v11];
  v13 = [*(id *)(a1 + 40) parameter];
  if (![v13 isRangedSizeArray]) {
    goto LABEL_11;
  }
  unint64_t v14 = [v12 count];
  unint64_t v15 = [*(id *)(a1 + 40) maximumItemCount];

  if (v14 > v15)
  {
    v13 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, objc_msgSend(*(id *)(a1 + 40), "maximumItemCount"));
    uint64_t v16 = [v12 objectsAtIndexes:v13];

    uint64_t v12 = (void *)v16;
LABEL_11:
  }
  id v17 = objc_alloc(MEMORY[0x1E4F5A9E8]);
  v18 = [v21 attributionSet];
  v19 = [*(id *)(a1 + 32) communicationMethod];
  uint64_t v20 = (void *)[v17 initWithEntries:v12 attributionSet:v18 communicationMethod:v19];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_13:
}

- (id)processedEntriesFromCoercionResult:(id)a3 allowsCustomHandles:(BOOL)a4
{
  id v6 = [a3 items];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __86__WFContactSubstitutableState_processedEntriesFromCoercionResult_allowsCustomHandles___block_invoke;
  v9[3] = &unk_1E6558D88;
  v9[4] = self;
  BOOL v10 = a4;
  v7 = objc_msgSend(v6, "if_map:", v9);

  return v7;
}

id __86__WFContactSubstitutableState_processedEntriesFromCoercionResult_allowsCustomHandles___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = *(void **)(a1 + 32);
    v5 = [v3 string];
    uint64_t v6 = [v4 stringInterpretedAsContactHandle:v5 allowsCustomHandles:*(unsigned __int8 *)(a1 + 40)];
LABEL_9:
    BOOL v10 = (void *)v6;

    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = objc_alloc(MEMORY[0x1E4F5A800]);
    v5 = [v3 emailAddress];
    uint64_t v6 = [v7 initWithEmailAddress:v5];
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = objc_alloc(MEMORY[0x1E4F5A800]);
    v5 = [v3 phoneNumber];
    uint64_t v6 = [v8 initWithPhoneNumber:v5];
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = objc_alloc(MEMORY[0x1E4F5A800]);
    v5 = [v3 contact];
    uint64_t v6 = [v9 initWithContact:v5];
    goto LABEL_9;
  }
  BOOL v10 = 0;
LABEL_10:

  return v10;
}

- (void)processIntoEntriesWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, void *, void))a4;
  id v10 = a5;
  uint64_t v11 = [(WFVariableSubstitutableParameterState *)self variable];

  if (v11)
  {
    uint64_t v12 = [(WFVariableSubstitutableParameterState *)self variable];
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v13 = [v12 prompt];
      v9[2](v9, v13, 0);
    }
    else
    {

      unint64_t v14 = [(WFVariableSubstitutableParameterState *)self variable];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __99__WFContactSubstitutableState_processIntoEntriesWithContext_userInputRequiredHandler_valueHandler___block_invoke;
      v22[3] = &unk_1E6558FD0;
      id v24 = v10;
      v22[4] = self;
      id v23 = v8;
      [v14 getContentWithContext:v23 completionHandler:v22];

      uint64_t v12 = v24;
    }
  }
  else
  {
    unint64_t v15 = [(WFVariableSubstitutableParameterState *)self value];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __99__WFContactSubstitutableState_processIntoEntriesWithContext_userInputRequiredHandler_valueHandler___block_invoke_2;
    v20[3] = &unk_1E6558D60;
    v20[4] = self;
    id v21 = v8;
    uint64_t v16 = objc_msgSend(v15, "if_map:", v20);

    id v17 = objc_alloc(MEMORY[0x1E4F5A9E8]);
    v18 = [(WFContactSubstitutableState *)self communicationMethod];
    v19 = (void *)[v17 initWithEntries:v16 attributionSet:0 communicationMethod:v18];

    (*((void (**)(id, void *, void))v10 + 2))(v10, v19, 0);
  }
}

void __99__WFContactSubstitutableState_processIntoEntriesWithContext_userInputRequiredHandler_valueHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ([v6 numberOfItems]) {
    [*(id *)(a1 + 32) processContentCollection:v6 context:*(void *)(a1 + 40) valueHandler:*(void *)(a1 + 48)];
  }
  else {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

id __99__WFContactSubstitutableState_processIntoEntriesWithContext_userInputRequiredHandler_valueHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 parameterState];
  if ([*(id *)(a1 + 32) reinterpretsStringsAsContactHandlesFromVariable:0]
    && [v3 type] == 3)
  {
    v4 = *(void **)(a1 + 32);
    id v5 = [v3 customHandle];
    id v6 = [*(id *)(a1 + 40) parameter];
    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v7 = v6;
      }
      else {
        id v7 = 0;
      }
    }
    else
    {
      id v7 = 0;
    }
    id v9 = v7;

    uint64_t v10 = [v9 allowsCustomHandles];
    id v8 = [v4 stringInterpretedAsContactHandle:v5 allowsCustomHandles:v10];
  }
  else
  {
    id v8 = v3;
  }

  return v8;
}

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __88__WFContactSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke;
  v12[3] = &unk_1E6558D38;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(WFContactSubstitutableState *)self processIntoEntriesWithContext:v11 userInputRequiredHandler:a4 valueHandler:v12];
}

void __88__WFContactSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a3;
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  int v7 = [v5 isInputParameter];
  uint64_t v8 = *(void *)(a1 + 40);
  if (v7)
  {
    uint64_t v9 = [v6 contentCollection];

    id v6 = (id)v9;
  }
  (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v6, v10);
}

- (WFContactSubstitutableState)initWithValue:(id)a3
{
  v4 = objc_msgSend(a3, "if_map:", &__block_literal_global_186_72877);
  v7.receiver = self;
  v7.super_class = (Class)WFContactSubstitutableState;
  id v5 = [(WFMultipleValueParameterState *)&v7 initWithValue:v4];

  return v5;
}

WFMultipleValueParameterStateEntry *__45__WFContactSubstitutableState_initWithValue___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 parameterState];
  if ([v3 type]
    || ([v3 contact],
        v4 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v4,
        (isKindOfClass & 1) == 0))
  {
    v18 = (WFMultipleValueParameterStateEntry *)v2;
  }
  else
  {
    id v6 = [v3 contact];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = WFEnforceClass(v6, v7);

    uint64_t v9 = [v8 contactIdentifier];

    if (v9)
    {
      id v10 = [v3 contact];
      id v11 = [v10 wfSerializedRepresentation];

      uint64_t v12 = [MEMORY[0x1E4F5A7F0] objectWithWFSerializedRepresentation:v11];
      uint64_t v13 = objc_opt_class();
      id v14 = WFEnforceClass(v12, v13);

      if (v14)
      {
        unint64_t v15 = [WFMultipleValueParameterStateEntry alloc];
        uint64_t v16 = [v2 identity];
        id v17 = (void *)[objc_alloc(MEMORY[0x1E4F5A800]) initWithContact:v14];
        v18 = [(WFMultipleValueParameterStateEntry *)v15 initWithIdentity:v16 parameterState:v17];
      }
      else
      {
        v18 = (WFMultipleValueParameterStateEntry *)v2;
      }
    }
    else
    {
      v18 = (WFMultipleValueParameterStateEntry *)v2;
    }
  }
  return v18;
}

- (id)serializedRepresentation
{
  v17[1] = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)WFContactSubstitutableState;
  id v3 = [(WFVariableSubstitutableParameterState *)&v15 serializedRepresentation];
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v4 = v3;
    }
    else {
      v4 = 0;
    }
  }
  else
  {
    v4 = 0;
  }
  id v5 = v4;
  id v6 = [v5 objectForKeyedSubscript:@"Value"];
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v7 = [(WFContactSubstitutableState *)self communicationMethod];

    if (v7)
    {
      uint64_t v8 = (void *)[v5 mutableCopy];
      uint64_t v16 = @"WFCommunicationMethodValue";
      uint64_t v9 = [(WFContactSubstitutableState *)self communicationMethod];
      id v10 = [v9 serializedRepresentation];
      v17[0] = v10;
      id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
      uint64_t v12 = objc_msgSend(v6, "if_dictionaryByAddingEntriesFromDictionary:", v11);
      [v8 setObject:v12 forKeyedSubscript:@"Value"];

      id v13 = (id)[v8 copy];
      goto LABEL_12;
    }
  }
  else
  {

    id v6 = 0;
  }
  id v13 = v3;
LABEL_12:

  return v13;
}

- (WFContactSubstitutableState)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v8 = a3;
  v19.receiver = self;
  v19.super_class = (Class)WFContactSubstitutableState;
  uint64_t v9 = [(WFVariableSubstitutableParameterState *)&v19 initWithSerializedRepresentation:v8 variableProvider:a4 parameter:a5];
  if (v9)
  {
    id v10 = v8;
    if (v10)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v11 = [v10 objectForKeyedSubscript:@"Value"];
        if (v11)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            uint64_t v12 = v11;
          }
          else {
            uint64_t v12 = 0;
          }
        }
        else
        {
          uint64_t v12 = 0;
        }
        id v13 = v12;

        id v14 = [v13 objectForKeyedSubscript:@"WFCommunicationMethodValue"];

        if (v14)
        {
          uint64_t v15 = [objc_alloc(MEMORY[0x1E4F5A7E8]) initWithSerializedRepresentation:v14];
          communicationMethod = v9->_communicationMethod;
          v9->_communicationMethod = (WFCommunicationMethod *)v15;
        }
      }
    }

    id v17 = v9;
  }

  return v9;
}

+ (id)serializedRepresentationFromValue:(id)a3
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_msgSend(a3, "if_compactMap:", &__block_literal_global_72898);
  id v8 = v3;
  v9[0] = @"WFSerializationType";
  v9[1] = @"Value";
  v10[0] = @"WFContactFieldValue";
  uint64_t v7 = @"WFContactFieldValues";
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  v10[1] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

  return v5;
}

id __65__WFContactSubstitutableState_serializedRepresentationFromValue___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 parameterState];
  id v3 = [v2 serializedRepresentation];

  return v3;
}

+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = WFEnforceClass(v10, v11);

  if (v12)
  {
    id v13 = [v12 objectForKeyedSubscript:@"Value"];
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = WFEnforceClass(v13, v14);

    if (v15)
    {
      uint64_t v16 = [v15 objectForKey:@"WFContactFieldValues"];
      uint64_t v17 = objc_opt_class();
      v18 = WFEnforceClass(v16, v17);

      if (v18)
      {
        v21.receiver = a1;
        v21.super_class = (Class)&OBJC_METACLASS___WFContactSubstitutableState;
        objc_super v19 = objc_msgSendSuper2(&v21, sel_valueFromSerializedRepresentation_variableProvider_parameter_, v18, v8, v9);
      }
      else
      {
        objc_super v19 = 0;
      }
    }
    else
    {
      objc_super v19 = 0;
    }
  }
  else
  {
    objc_super v19 = 0;
  }

  return v19;
}

+ (id)processingValueClasses
{
  void v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  return v2;
}

@end