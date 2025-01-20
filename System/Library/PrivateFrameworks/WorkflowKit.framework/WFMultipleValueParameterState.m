@interface WFMultipleValueParameterState
+ (Class)processingValueClass;
+ (id)serializedRepresentationFromValue:(id)a3;
+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5;
- (NSArray)parameterStates;
- (WFMultipleValueParameterState)initWithParameterStates:(id)a3;
- (WFMultipleValueParameterState)initWithValue:(id)a3;
- (id)containedVariables;
- (id)stateByAppendingValue:(id)a3;
- (id)stateByInsertingValueAtIndex:(unint64_t)a3 withValue:(id)a4;
- (id)stateByRemovingValueAtIndex:(unint64_t)a3;
- (id)stateByReplacingValueAtIndex:(unint64_t)a3 withValue:(id)a4;
- (id)stateByReplacingValueAtIndexes:(id)a3 withValues:(id)a4;
- (id)stateByReplacingVariable:(id)a3 withVariable:(id)a4;
- (id)stateByTogglingValue:(id)a3;
- (void)finishProcessingWithContent:(id)a3 error:(id)a4 forParameterStateClass:(Class)a5 valueHandler:(id)a6;
- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5;
@end

@implementation WFMultipleValueParameterState

- (id)stateByInsertingValueAtIndex:(unint64_t)a3 withValue:(id)a4
{
  id v6 = a4;
  v7 = [(WFVariableSubstitutableParameterState *)self value];
  v8 = (void *)[v7 mutableCopy];

  v9 = [WFMultipleValueParameterStateEntry alloc];
  v10 = [MEMORY[0x1E4F29128] UUID];
  v11 = [(WFMultipleValueParameterStateEntry *)v9 initWithIdentity:v10 parameterState:v6];

  if ([v8 count] <= a3) {
    [v8 addObject:v11];
  }
  else {
    [v8 insertObject:v11 atIndex:a3];
  }
  v12 = (void *)[objc_alloc((Class)objc_opt_class()) initWithValue:v8];

  return v12;
}

- (id)stateByRemovingValueAtIndex:(unint64_t)a3
{
  v4 = [(WFVariableSubstitutableParameterState *)self value];
  v5 = (void *)[v4 mutableCopy];

  [v5 removeObjectAtIndex:a3];
  id v6 = (void *)[objc_alloc((Class)objc_opt_class()) initWithValue:v5];

  return v6;
}

- (id)stateByAppendingValue:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  id v6 = [(WFVariableSubstitutableParameterState *)self value];
  v7 = [WFMultipleValueParameterStateEntry alloc];
  v8 = [MEMORY[0x1E4F29128] UUID];
  v9 = [(WFMultipleValueParameterStateEntry *)v7 initWithIdentity:v8 parameterState:v4];

  v10 = [v6 arrayByAddingObject:v9];
  v11 = (void *)[v5 initWithValue:v10];

  return v11;
}

- (id)stateByReplacingValueAtIndexes:(id)a3 withValues:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(WFVariableSubstitutableParameterState *)self value];
  v9 = (void *)[v8 mutableCopy];

  v10 = objc_msgSend(v6, "if_map:", &__block_literal_global_244);

  [v9 replaceObjectsAtIndexes:v7 withObjects:v10];
  v11 = (void *)[objc_alloc((Class)objc_opt_class()) initWithValue:v9];

  return v11;
}

WFMultipleValueParameterStateEntry *__75__WFMultipleValueParameterState_stateByReplacingValueAtIndexes_withValues___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [WFMultipleValueParameterStateEntry alloc];
  id v4 = [MEMORY[0x1E4F29128] UUID];
  id v5 = [(WFMultipleValueParameterStateEntry *)v3 initWithIdentity:v4 parameterState:v2];

  return v5;
}

- (id)stateByReplacingValueAtIndex:(unint64_t)a3 withValue:(id)a4
{
  id v6 = a4;
  id v7 = [(WFVariableSubstitutableParameterState *)self value];
  v8 = (void *)[v7 mutableCopy];

  v9 = [WFMultipleValueParameterStateEntry alloc];
  v10 = [MEMORY[0x1E4F29128] UUID];
  v11 = [(WFMultipleValueParameterStateEntry *)v9 initWithIdentity:v10 parameterState:v6];

  [v8 replaceObjectAtIndex:a3 withObject:v11];
  v12 = (void *)[objc_alloc((Class)objc_opt_class()) initWithValue:v8];

  return v12;
}

- (id)stateByTogglingValue:(id)a3
{
  id v4 = a3;
  id v5 = [(WFMultipleValueParameterState *)self parameterStates];
  uint64_t v6 = [v5 indexOfObject:v4];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = objc_alloc((Class)objc_opt_class());
    v8 = [(WFVariableSubstitutableParameterState *)self value];
    v9 = [WFMultipleValueParameterStateEntry alloc];
    v10 = [MEMORY[0x1E4F29128] UUID];
    v11 = [(WFMultipleValueParameterStateEntry *)v9 initWithIdentity:v10 parameterState:v4];
    v12 = [v8 arrayByAddingObject:v11];
    v13 = (void *)[v7 initWithValue:v12];
  }
  else
  {
    v14 = [(WFVariableSubstitutableParameterState *)self value];
    v8 = (void *)[v14 mutableCopy];

    [v8 removeObjectAtIndex:v6];
    if ([v8 count]) {
      v13 = (void *)[objc_alloc((Class)objc_opt_class()) initWithValue:v8];
    }
    else {
      v13 = 0;
    }
  }

  return v13;
}

- (void)finishProcessingWithContent:(id)a3 error:(id)a4 forParameterStateClass:(Class)a5 valueHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  v12 = v11;
  if (!v9)
  {
    v14 = (void (*)(void))*((void *)v11 + 2);
LABEL_8:
    v14();
    goto LABEL_9;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v14 = (void (*)(void))v12[2];
    goto LABEL_8;
  }
  uint64_t v13 = [(objc_class *)a5 processingValueClass];
  if (v13 == objc_opt_class())
  {
    v14 = (void (*)(void))v12[2];
    goto LABEL_8;
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __103__WFMultipleValueParameterState_finishProcessingWithContent_error_forParameterStateClass_valueHandler___block_invoke;
  v15[3] = &unk_1E6551BA8;
  v16 = v12;
  [v9 getObjectRepresentations:v15 forClass:v13];

LABEL_9:
}

uint64_t __103__WFMultipleValueParameterState_finishProcessingWithContent_error_forParameterStateClass_valueHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, void *, void))a4;
  id v10 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __90__WFMultipleValueParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke;
  aBlock[3] = &unk_1E654F908;
  id v11 = v8;
  id v80 = v11;
  id v12 = v10;
  id v81 = v12;
  uint64_t v13 = _Block_copy(aBlock);
  v14 = [(WFVariableSubstitutableParameterState *)self variable];

  if (v14)
  {
    v15 = [(WFVariableSubstitutableParameterState *)self variable];
    if (v15)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v16 = [v15 prompt];
        v9[2](v9, v16, 0);

LABEL_16:
        goto LABEL_25;
      }
    }

    v17 = [v11 parameter];
    v18 = (objc_class *)[v17 singleStateClass];

    if ([(objc_class *)v18 isSubclassOfClass:objc_opt_class()])
    {
      v19 = [(WFVariableSubstitutableParameterState *)self variable];
      v77[0] = MEMORY[0x1E4F143A8];
      v77[1] = 3221225472;
      v77[2] = __90__WFMultipleValueParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_2;
      v77[3] = &unk_1E6556C08;
      v77[4] = self;
      id v78 = v13;
      [v19 getContentWithContext:v11 completionHandler:v77];

      v20 = v78;
    }
    else
    {
      if (([(objc_class *)v18 isSubclassOfClass:objc_opt_class()] & 1) != 0
        || [(objc_class *)v18 isSubclassOfClass:objc_opt_class()])
      {
        id v34 = [v18 alloc];
        v35 = [(WFVariableSubstitutableParameterState *)self variable];
        v15 = (void *)[v34 initWithVariable:v35];

        v75[0] = MEMORY[0x1E4F143A8];
        v75[1] = 3221225472;
        v75[2] = __90__WFMultipleValueParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_5;
        v75[3] = &unk_1E6550860;
        id v76 = v13;
        [v15 processWithContext:v11 userInputRequiredHandler:v9 valueHandler:v75];

        goto LABEL_16;
      }
      v38 = [(WFVariableSubstitutableParameterState *)self variable];
      v72[0] = MEMORY[0x1E4F143A8];
      v72[1] = 3221225472;
      v72[2] = __90__WFMultipleValueParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_6;
      v72[3] = &unk_1E654F930;
      v72[4] = self;
      v74 = v18;
      id v73 = v13;
      [v38 getContentWithContext:v11 completionHandler:v72];

      v20 = v73;
    }
  }
  else
  {
    v70[0] = 0;
    v70[1] = v70;
    v70[2] = 0x2020000000;
    char v71 = 0;
    v21 = [v11 parameter];
    v22 = (void *)[v21 singleStateClass];

    if ([v22 isSubclassOfClass:objc_opt_class()])
    {
      v40 = [(WFMultipleValueParameterState *)self parameterStates];
      v23 = objc_opt_new();
      v39 = objc_opt_new();
      uint64_t v64 = 0;
      v65 = &v64;
      uint64_t v66 = 0x3032000000;
      v67 = __Block_byref_object_copy__17794;
      v68 = __Block_byref_object_dispose__17795;
      id v69 = 0;
      uint64_t v60 = 0;
      v61 = &v60;
      uint64_t v62 = 0x2020000000;
      uint64_t v63 = 1;
      v24 = [(WFMultipleValueParameterState *)self parameterStates];
      uint64_t v25 = [v24 count];

      if (v25)
      {
        v54[0] = MEMORY[0x1E4F143A8];
        v54[1] = 3221225472;
        v54[2] = __90__WFMultipleValueParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_221;
        v54[3] = &unk_1E654F958;
        id v26 = v11;
        id v55 = v26;
        v58 = &v64;
        v59 = &v60;
        id v27 = v23;
        id v56 = v27;
        id v28 = v39;
        id v57 = v28;
        [v40 enumerateObjectsUsingBlock:v54];
        if (v61[3])
        {
          v29 = [v28 allValues];
          uint64_t v30 = [v29 count];

          if (v30)
          {
            v31 = [v28 allValues];
            v32 = objc_msgSend(v31, "if_compactMap:", &__block_literal_global_227);

            v33 = [v26 variableSource];
            v49[0] = MEMORY[0x1E4F143A8];
            v49[1] = 3221225472;
            v49[2] = __90__WFMultipleValueParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_3_228;
            v49[3] = &unk_1E654F9C8;
            id v53 = v13;
            id v50 = v28;
            id v51 = v26;
            id v52 = v27;
            [v33 requestAccessToFileAtLocations:v32 completionHandler:v49];
          }
          else
          {
            (*((void (**)(void *, id, void))v13 + 2))(v13, v27, 0);
          }
        }
        else
        {
          (*((void (**)(void *, void, uint64_t))v13 + 2))(v13, 0, v65[5]);
        }
      }
      else
      {
        (*((void (**)(void *, void *, void))v13 + 2))(v13, v23, 0);
      }
      _Block_object_dispose(&v60, 8);
      _Block_object_dispose(&v64, 8);

      v37 = v40;
    }
    else
    {
      v36 = [(WFMultipleValueParameterState *)self parameterStates];
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __90__WFMultipleValueParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_5_232;
      v44[3] = &unk_1E654FA18;
      id v45 = v11;
      v46 = self;
      v48 = v70;
      v47 = v9;
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __90__WFMultipleValueParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_12;
      v41[3] = &unk_1E654FA40;
      v43 = v70;
      id v42 = v13;
      objc_msgSend(v36, "if_flatMapAsynchronously:completionHandler:", v44, v41);

      v37 = v45;
    }

    _Block_object_dispose(v70, 8);
  }
LABEL_25:
}

void __90__WFMultipleValueParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v24 = a2;
  id v5 = a3;
  if (!v24
    || ([*(id *)(a1 + 32) parameter],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v6 isRangedSizeArray],
        v6,
        (v7 & 1) == 0))
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_19;
  }
  unint64_t v8 = [*(id *)(a1 + 32) maximumItemCount];
  id v9 = v24;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  if (v11 && [v11 count] > v8)
  {
    id v12 = (void *)MEMORY[0x1E4F28D60];
    unint64_t v13 = [v11 count];
    if (v13 >= v8) {
      unint64_t v14 = v8;
    }
    else {
      unint64_t v14 = v13;
    }
    v15 = objc_msgSend(v12, "indexSetWithIndexesInRange:", 0, v14);
    uint64_t v16 = *(void *)(a1 + 40);
    v17 = [v11 objectsAtIndexes:v15];
    (*(void (**)(uint64_t, void *, id))(v16 + 16))(v16, v17, v5);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || ([v9 items],
          v18 = objc_claimAutoreleasedReturnValue(),
          unint64_t v19 = [v18 count],
          v18,
          v19 <= v8))
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      goto LABEL_18;
    }
    v15 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, v8);
    v20 = (void *)MEMORY[0x1E4F5A830];
    v21 = [v9 items];
    v22 = [v21 objectsAtIndexes:v15];
    v23 = [v20 collectionWithItems:v22];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }

LABEL_18:
LABEL_19:
}

void __90__WFMultipleValueParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    char v7 = [*(id *)(a1 + 32) variable];
    unint64_t v8 = [v7 possibleContentClasses];
    int v9 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "firstObject"), "superclass"), "isEqual:", objc_opt_class());

    if (v9)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __90__WFMultipleValueParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_3;
      v13[3] = &unk_1E6551BA8;
      id v14 = *(id *)(a1 + 40);
      [v5 getObjectRepresentations:v13 forClass:objc_opt_class()];
      id v10 = v14;
    }
    else
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __90__WFMultipleValueParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_4;
      v11[3] = &unk_1E65586C8;
      id v12 = *(id *)(a1 + 40);
      [v5 getFileRepresentations:v11 forType:0];
      id v10 = v12;
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __90__WFMultipleValueParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    char v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
LABEL_5:
    v7();
    goto LABEL_6;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v9 = *(void *)(a1 + 32);
  if (isKindOfClass)
  {
    (*(void (**)(uint64_t, id, void))(v9 + 16))(v9, v5, 0);
  }
  else
  {
    v11[0] = v5;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    (*(void (**)(uint64_t, void *, void))(v9 + 16))(v9, v10, 0);
  }
LABEL_6:
}

void __90__WFMultipleValueParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 48);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __90__WFMultipleValueParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_7;
  v7[3] = &unk_1E6550860;
  id v6 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  [v6 finishProcessingWithContent:a2 error:a3 forParameterStateClass:v5 valueHandler:v7];
}

void __90__WFMultipleValueParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_221(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 64);
  uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v10 + 40);
  id v11 = [v7 processForMultipleStateWithContext:v8 error:&obj resolution:*(void *)(v9 + 8) + 24];
  objc_storeStrong((id *)(v10 + 40), obj);
  if (v11)
  {
    [*(id *)(a1 + 40) addObject:v11];
  }
  else if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) == 2)
  {
    id v12 = *(void **)(a1 + 48);
    unint64_t v13 = [NSNumber numberWithUnsignedInteger:a3];
    [v12 setObject:v7 forKey:v13];
  }
  else
  {
    *a4 = 1;
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
  }
}

void __90__WFMultipleValueParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_3_228(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v18 = 0;
    unint64_t v19 = &v18;
    uint64_t v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__17794;
    v22 = __Block_byref_object_dispose__17795;
    id v23 = 0;
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x2020000000;
    uint64_t v17 = 0;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __90__WFMultipleValueParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_4_229;
    v9[3] = &unk_1E654F9A0;
    id v6 = *(void **)(a1 + 32);
    id v10 = *(id *)(a1 + 40);
    id v12 = &v18;
    unint64_t v13 = &v14;
    id v11 = *(id *)(a1 + 48);
    [v6 enumerateKeysAndObjectsUsingBlock:v9];
    if (v15[3])
    {
      uint64_t v7 = 0;
      uint64_t v8 = *(void *)(a1 + 48);
    }
    else
    {
      uint64_t v8 = 0;
      uint64_t v7 = v19[5];
    }
    (*(void (**)(void, uint64_t, uint64_t))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), v8, v7);

    _Block_object_dispose(&v14, 8);
    _Block_object_dispose(&v18, 8);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __90__WFMultipleValueParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_5_232(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v9 = [v6 variableString];
      id v11 = [v6 containedVariables];
      id v12 = NSStringFromSelector(sel_type);
      unint64_t v13 = [v11 filteredArrayForKey:v12 value:@"Ask"];

      if (![v13 count] && objc_msgSend(v9, "representsSingleContentVariable"))
      {
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __90__WFMultipleValueParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_6_236;
        v26[3] = &unk_1E6558FD0;
        uint64_t v14 = a1[4];
        v26[4] = a1[5];
        id v27 = v6;
        id v28 = v7;
        [v9 processIntoContentItemsWithContext:v14 completionHandler:v26];

        goto LABEL_11;
      }

LABEL_10:
      uint64_t v15 = a1[4];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __90__WFMultipleValueParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_10;
      v19[3] = &unk_1E654F9F0;
      uint64_t v16 = (void *)a1[6];
      uint64_t v22 = a1[7];
      id v20 = v16;
      id v21 = v7;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __90__WFMultipleValueParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_11;
      v17[3] = &unk_1E6556BE0;
      id v18 = v21;
      [v6 processWithContext:v15 userInputRequiredHandler:v19 valueHandler:v17];

      uint64_t v9 = v20;
      goto LABEL_11;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_10;
  }
  uint64_t v8 = [v6 variable];
  if (!v8) {
    goto LABEL_10;
  }
  uint64_t v9 = (void *)v8;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __90__WFMultipleValueParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_8;
  v23[3] = &unk_1E6558FD0;
  uint64_t v10 = a1[4];
  v23[4] = a1[5];
  id v24 = v6;
  id v25 = v7;
  [v9 getContentWithContext:v10 completionHandler:v23];

LABEL_11:
}

uint64_t __90__WFMultipleValueParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_12(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24)) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

void __90__WFMultipleValueParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_6_236(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  uint64_t v8 = objc_opt_class();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __90__WFMultipleValueParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_7_237;
  v9[3] = &unk_1E6550860;
  id v10 = *(id *)(a1 + 48);
  [v5 finishProcessingWithContent:v7 error:v6 forParameterStateClass:v8 valueHandler:v9];
}

void __90__WFMultipleValueParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  uint64_t v8 = objc_opt_class();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __90__WFMultipleValueParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_9;
  v9[3] = &unk_1E6550860;
  id v10 = *(id *)(a1 + 48);
  [v5 finishProcessingWithContent:v7 error:v6 forParameterStateClass:v8 valueHandler:v9];
}

uint64_t __90__WFMultipleValueParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_10(void *a1)
{
  uint64_t v2 = *(void *)(a1[6] + 8);
  if (!*(unsigned char *)(v2 + 24))
  {
    *(unsigned char *)(v2 + 24) = 1;
    (*(void (**)(void))(a1[4] + 16))();
  }
  v3 = *(uint64_t (**)(void))(a1[5] + 16);
  return v3();
}

void __90__WFMultipleValueParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_11(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = (void *)MEMORY[0x1E4F1C978];
  id v6 = a3;
  objc_msgSend(v5, "arrayWithObjects:", a2, 0);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v7, v6);
}

void __90__WFMultipleValueParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v8 = v5;
  objc_opt_class();
  id v7 = v8;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v7 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v8, 0);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __90__WFMultipleValueParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_7_237(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v8 = v5;
  objc_opt_class();
  id v7 = v8;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v7 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v8, 0);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __90__WFMultipleValueParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_4_229(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 56);
  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v10 + 40);
  id v11 = [a3 processForMultipleStateWithContext:v8 error:&obj resolution:*(void *)(v9 + 8) + 24];
  objc_storeStrong((id *)(v10 + 40), obj);
  if (v11)
  {
    objc_msgSend(*(id *)(a1 + 40), "insertObject:atIndex:", v11, objc_msgSend(v7, "unsignedIntegerValue"));
  }
  else
  {
    *a4 = 1;
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
}

id __90__WFMultipleValueParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_2_224(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 value];
  v3 = [v2 fileLocation];

  return v3;
}

uint64_t __90__WFMultipleValueParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __90__WFMultipleValueParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __90__WFMultipleValueParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)stateByReplacingVariable:(id)a3 withVariable:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(WFVariableSubstitutableParameterState *)self value];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    id v10 = objc_alloc((Class)objc_opt_class());
    id v11 = [(WFVariableSubstitutableParameterState *)self value];
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    unint64_t v19 = __71__WFMultipleValueParameterState_stateByReplacingVariable_withVariable___block_invoke;
    id v20 = &unk_1E654F8E0;
    id v21 = v6;
    id v22 = v7;
    id v12 = objc_msgSend(v11, "if_map:", &v17);
    unint64_t v13 = objc_msgSend(v10, "initWithValue:", v12, v17, v18, v19, v20);
  }
  else
  {
    id v14 = objc_alloc((Class)objc_opt_class());
    if (v7) {
      uint64_t v15 = [v14 initWithVariable:v7];
    }
    else {
      uint64_t v15 = [v14 initWithParameterStates:MEMORY[0x1E4F1CBF0]];
    }
    unint64_t v13 = (void *)v15;
  }

  return v13;
}

WFMultipleValueParameterStateEntry *__71__WFMultipleValueParameterState_stateByReplacingVariable_withVariable___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v6 = v5;
  uint64_t v7 = *(void *)(a1 + 32);
  if (!v7
    || ([v5 parameterState],
        uint64_t v2 = objc_claimAutoreleasedReturnValue(),
        [v2 containedVariables],
        v3 = objc_claimAutoreleasedReturnValue(),
        ([v3 containsObject:*(void *)(a1 + 32)] & 1) != 0))
  {
    uint64_t v8 = [v6 parameterState];
    char v9 = objc_opt_respondsToSelector();

    if (v7)
    {
    }
    if (v9)
    {
      id v10 = [WFMultipleValueParameterStateEntry alloc];
      id v11 = [v6 identity];
      id v12 = [v6 parameterState];
      unint64_t v13 = [v12 stateByReplacingVariable:*(void *)(a1 + 32) withVariable:*(void *)(a1 + 40)];
      id v14 = [(WFMultipleValueParameterStateEntry *)v10 initWithIdentity:v11 parameterState:v13];

      goto LABEL_9;
    }
  }
  else
  {
  }
  id v14 = v6;
LABEL_9:

  return v14;
}

- (id)containedVariables
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v18.receiver = self;
  v18.super_class = (Class)WFMultipleValueParameterState;
  uint64_t v4 = [(WFVariableSubstitutableParameterState *)&v18 containedVariables];
  id v5 = (void *)[v3 initWithArray:v4];

  id v6 = [(WFVariableSubstitutableParameterState *)self value];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v14 + 1) + 8 * i) parameterState];
        id v12 = [v11 containedVariables];
        [v5 addObjectsFromArray:v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (NSArray)parameterStates
{
  uint64_t v2 = [(WFVariableSubstitutableParameterState *)self value];
  id v3 = objc_msgSend(v2, "if_compactMap:", &__block_literal_global_199);

  return (NSArray *)v3;
}

uint64_t __48__WFMultipleValueParameterState_parameterStates__block_invoke(uint64_t a1, void *a2)
{
  return [a2 parameterState];
}

- (WFMultipleValueParameterState)initWithParameterStates:(id)a3
{
  uint64_t v4 = objc_msgSend(a3, "if_map:", &__block_literal_global_196_17818);
  id v5 = [(WFMultipleValueParameterState *)self initWithValue:v4];

  return v5;
}

WFMultipleValueParameterStateEntry *__57__WFMultipleValueParameterState_initWithParameterStates___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [WFMultipleValueParameterStateEntry alloc];
  uint64_t v4 = [MEMORY[0x1E4F29128] UUID];
  id v5 = [(WFMultipleValueParameterStateEntry *)v3 initWithIdentity:v4 parameterState:v2];

  return v5;
}

- (WFMultipleValueParameterState)initWithValue:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v10 = [MEMORY[0x1E4F28B00] currentHandler];
          [v10 handleFailureInMethod:a2, self, @"WFMultipleValueParameterState.m", 87, @"Invalid parameter not satisfying: %@", @"[entry isKindOfClass:[WFMultipleValueParameterStateEntry class]]" object file lineNumber description];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
  v13.receiver = self;
  v13.super_class = (Class)WFMultipleValueParameterState;
  id v11 = [(WFVariableSubstitutableParameterState *)&v13 initWithValue:v5];

  return v11;
}

+ (id)serializedRepresentationFromValue:(id)a3
{
  id v3 = a3;
  if ([v3 count] != 1) {
    goto LABEL_5;
  }
  uint64_t v4 = [v3 firstObject];
  id v5 = [v4 parameterState];
  uint64_t v6 = [v5 serializedRepresentation];

  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {

LABEL_5:
      uint64_t v6 = objc_msgSend(v3, "if_compactMap:", &__block_literal_global_17838);
    }
  }

  return v6;
}

id __67__WFMultipleValueParameterState_serializedRepresentationFromValue___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 parameterState];
  id v3 = [v2 serializedRepresentation];

  return v3;
}

+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v9 singleStateClass];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v7;
LABEL_5:
    id v12 = v11;
    goto LABEL_6;
  }
  if (v7)
  {
    v21[0] = v7;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    goto LABEL_5;
  }
  id v12 = 0;
LABEL_6:
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __94__WFMultipleValueParameterState_valueFromSerializedRepresentation_variableProvider_parameter___block_invoke;
  v17[3] = &unk_1E654F878;
  id v19 = v9;
  uint64_t v20 = v10;
  id v18 = v8;
  id v13 = v9;
  id v14 = v8;
  long long v15 = objc_msgSend(v12, "if_compactMap:", v17);

  return v15;
}

WFMultipleValueParameterStateEntry *__94__WFMultipleValueParameterState_valueFromSerializedRepresentation_variableProvider_parameter___block_invoke(void *a1, void *a2)
{
  id v3 = (objc_class *)a1[6];
  id v4 = a2;
  id v5 = (void *)[[v3 alloc] initWithSerializedRepresentation:v4 variableProvider:a1[4] parameter:a1[5]];

  if (v5)
  {
    uint64_t v6 = [WFMultipleValueParameterStateEntry alloc];
    id v7 = [MEMORY[0x1E4F29128] UUID];
    id v8 = [(WFMultipleValueParameterStateEntry *)v6 initWithIdentity:v7 parameterState:v5];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

@end