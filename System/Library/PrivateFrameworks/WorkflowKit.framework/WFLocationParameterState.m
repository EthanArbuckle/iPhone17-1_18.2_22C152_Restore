@interface WFLocationParameterState
+ (Class)processingValueClass;
+ (id)serializedRepresentationFromValue:(id)a3;
+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5;
- (WFLocationParameterState)initWithValue:(id)a3;
- (void)getContentCollectionWithContext:(id)a3 completionHandler:(id)a4;
- (void)getContentItemFromValue:(id)a3 withContext:(id)a4 completionHandler:(id)a5;
- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5;
@end

@implementation WFLocationParameterState

- (void)getContentItemFromValue:(id)a3 withContext:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [v8 parameter];
  uint64_t v11 = objc_opt_class();
  v12 = WFEnforceClass(v10, v11);

  if (![v12 allowsCurrentLocation] || !objc_msgSend(v7, "isCurrentLocation"))
  {
    v17 = [v7 legacyVariableString];

    if (v17)
    {
      v18 = [v7 legacyVariableString];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __82__WFLocationParameterState_getContentItemFromValue_withContext_completionHandler___block_invoke_2;
      v25[3] = &unk_1E65503B8;
      id v26 = v9;
      [v18 processWithContext:v8 completionHandler:v25];

      v16 = v26;
      goto LABEL_7;
    }
    v19 = [v7 placemark];

    if (v19)
    {
      v20 = (void *)MEMORY[0x1E4F5A848];
      uint64_t v21 = [v7 placemark];
    }
    else
    {
      if (![v12 allowsTextOnlyLocations]) {
        goto LABEL_14;
      }
      v24 = [v7 locationName];

      if (!v24) {
        goto LABEL_14;
      }
      v20 = (void *)MEMORY[0x1E4F5A848];
      uint64_t v21 = [v7 locationName];
    }
    v22 = (void *)v21;
    v23 = [v20 itemWithObject:v21];

    (*((void (**)(id, void *, void))v9 + 2))(v9, v23, 0);
    goto LABEL_15;
  }
  if ([v12 skipsProcessingCurrentLocation])
  {
LABEL_14:
    (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
    goto LABEL_15;
  }
  uint64_t v13 = [v8 environment];
  [v12 currentLocationAccuracy];
  double v15 = v14;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __82__WFLocationParameterState_getContentItemFromValue_withContext_completionHandler___block_invoke;
  v27[3] = &unk_1E654FFD0;
  id v28 = v9;
  +[WFLocator determineLocationWithWorkflowEnvironment:v13 desiredAccuracy:v27 completion:v15];
  v16 = v28;
LABEL_7:

LABEL_15:
}

void __82__WFLocationParameterState_getContentItemFromValue_withContext_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (v6)
  {
    v3 = (void *)MEMORY[0x1E4F5A960];
    v4 = [MEMORY[0x1E4F5A868] locationLocation];
    v5 = [v3 itemWithObject:v6 origin:v4 disclosureLevel:1];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __82__WFLocationParameterState_getContentItemFromValue_withContext_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v4 = [MEMORY[0x1E4F5A848] itemWithObject:a2];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    v3 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v3();
  }
}

- (void)getContentCollectionWithContext:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(WFVariableSubstitutableParameterState *)self variable];

  if (v8)
  {
    id v9 = [(WFVariableSubstitutableParameterState *)self variable];
    [v9 getContentWithContext:v7 completionHandler:v6];
  }
  else
  {
    v10 = [(WFVariableSubstitutableParameterState *)self value];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __78__WFLocationParameterState_getContentCollectionWithContext_completionHandler___block_invoke;
    v11[3] = &unk_1E654FFA8;
    id v12 = v6;
    [(WFLocationParameterState *)self getContentItemFromValue:v10 withContext:v7 completionHandler:v11];
  }
}

void __78__WFLocationParameterState_getContentCollectionWithContext_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v4 = (void *)MEMORY[0x1E4F5A830];
    id v9 = a2;
    v5 = (void *)MEMORY[0x1E4F1C978];
    id v6 = a2;
    id v7 = [v5 arrayWithObjects:&v9 count:1];
    id v8 = objc_msgSend(v4, "collectionWithItems:", v7, v9, v10);

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void, void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0, a3);
    id v8 = 0;
  }
}

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, void *, void))a4;
  id v10 = a5;
  uint64_t v11 = [(WFVariableSubstitutableParameterState *)self variable];
  if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v12 = [v11 prompt];
    v9[2](v9, v12, 0);
  }
  else
  {

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __85__WFLocationParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke;
    v13[3] = &unk_1E6556C08;
    id v15 = v10;
    id v14 = v8;
    [(WFLocationParameterState *)self getContentCollectionWithContext:v14 completionHandler:v13];

    uint64_t v11 = v15;
  }
}

void __85__WFLocationParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke(uint64_t a1, void *a2)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) parameter];
    uint64_t v5 = objc_opt_class();
    id v6 = WFEnforceClass(v4, v5);

    v12[0] = objc_opt_class();
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    if ([v6 allowsTextOnlyLocations])
    {
      v11[0] = objc_opt_class();
      v11[1] = objc_opt_class();
      uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];

      id v7 = (void *)v8;
    }
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __85__WFLocationParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_2;
    v9[3] = &unk_1E6556D50;
    id v10 = *(id *)(a1 + 40);
    [v3 generateCollectionByCoercingToItemClasses:v7 completionHandler:v9];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __85__WFLocationParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (WFLocationParameterState)initWithValue:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 legacyVariableString];
  id v6 = v5;
  if (v5 && [v5 representsSingleContentVariable])
  {
    id v7 = [v6 variables];
    uint64_t v8 = [v7 firstObject];

    id v9 = [(WFVariableSubstitutableParameterState *)self initWithVariable:v8];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)WFLocationParameterState;
    id v9 = [(WFVariableSubstitutableParameterState *)&v11 initWithValue:v4];
  }

  return v9;
}

+ (id)serializedRepresentationFromValue:(id)a3
{
  return (id)[a3 serializedRepresentation];
}

+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_7;
    }
    id v10 = [[WFVariableString alloc] initWithString:v7];
LABEL_6:
    objc_super v11 = [[WFLocationValue alloc] initWithLegacyVariableString:v10];

    goto LABEL_8;
  }
  WFDeserializedVariableObject(v7, v8, v9);
  id v10 = (WFVariableString *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_6;
  }

LABEL_7:
  objc_super v11 = [[WFLocationValue alloc] initWithSerializedRepresentation:v7 variableProvider:v8 parameter:v9];
LABEL_8:

  return v11;
}

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

@end