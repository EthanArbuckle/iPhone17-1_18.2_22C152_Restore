@interface WFVariable
- (BOOL)isAvailable;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRenamed;
- (BOOL)requiresModernVariableSupport;
- (BOOL)supportsAggrandizements;
- (NSArray)aggrandizements;
- (NSDictionary)dictionary;
- (NSHashTable)delegates;
- (NSOrderedSet)possibleAggrandizedContentClasses;
- (NSOrderedSet)possibleContentClasses;
- (NSSet)requiredAccessResources;
- (NSString)UUID;
- (NSString)description;
- (NSString)name;
- (NSString)nameIncludingPropertyName;
- (NSString)propertyName;
- (NSString)type;
- (WFIcon)icon;
- (WFVariable)init;
- (WFVariable)initWithDictionary:(id)a3 variableProvider:(id)a4;
- (WFVariableProvider)variableProvider;
- (id)copyWithZone:(_NSZone *)a3;
- (id)possibleAggrandizedContentClassesWithContext:(id)a3;
- (id)possibleContentClassesWithContext:(id)a3;
- (id)variableBySettingAggrandizements:(id)a3;
- (unint64_t)hash;
- (unint64_t)wf_lengthInVariableString;
- (void)addDelegate:(id)a3;
- (void)getContentWithContext:(id)a3 completionHandler:(id)a4;
- (void)getContentWithContext:(id)a3 trackContentAttribution:(BOOL)a4 completionHandler:(id)a5;
- (void)getFileRepresentationWithContext:(id)a3 completionHandler:(id)a4;
- (void)getObjectRepresentationForClass:(Class)a3 context:(id)a4 completionHandler:(id)a5;
- (void)removeDelegate:(id)a3;
- (void)retrieveContentCollectionWithVariableSource:(id)a3 completionHandler:(id)a4;
- (void)setDictionary:(id)a3;
- (void)variableUpdated;
- (void)wf_getContentItemsWithContext:(id)a3 completionHandler:(id)a4;
@end

@implementation WFVariable

- (unint64_t)wf_lengthInVariableString
{
  return 1;
}

- (void)wf_getContentItemsWithContext:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __87__WFVariable_WFVariableStringContent__wf_getContentItemsWithContext_completionHandler___block_invoke;
  v8[3] = &unk_1E6556D78;
  id v9 = v6;
  id v7 = v6;
  [(WFVariable *)self getContentWithContext:a3 completionHandler:v8];
}

void __87__WFVariable_WFVariableStringContent__wf_getContentItemsWithContext_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    v4 = *(void (**)(uint64_t, void))(v3 + 16);
    uint64_t v5 = *(void *)(a1 + 32);
    v4(v5, 0);
  }
  else
  {
    uint64_t v6 = [a2 items];
    id v8 = (id)v6;
    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = MEMORY[0x1E4F1CBF0];
    }
    (*(void (**)(uint64_t, uint64_t, void))(v3 + 16))(v3, v7, 0);
  }
}

- (NSString)nameIncludingPropertyName
{
  uint64_t v3 = [(WFVariable *)self propertyName];
  if (v3)
  {
    v4 = NSString;
    uint64_t v5 = [(WFVariable *)self name];
    uint64_t v6 = [(WFVariable *)self propertyName];
    uint64_t v7 = [v4 stringWithFormat:@"%@ (%@)", v5, v6];
  }
  else
  {
    uint64_t v7 = [(WFVariable *)self name];
  }

  return (NSString *)v7;
}

- (NSString)propertyName
{
  v2 = self;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = [(WFVariable *)self possibleContentClasses];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v4 = [(WFVariable *)v2 aggrandizements];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v36;
    v23 = v2;
    uint64_t v24 = *(void *)v36;
    do
    {
      uint64_t v8 = 0;
      id v9 = v3;
      uint64_t v25 = v6;
      do
      {
        if (*(void *)v36 != v7) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v35 + 1) + 8 * v8);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v26 = v10;
          v11 = [v26 propertyName];
          long long v31 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          id v3 = v9;
          uint64_t v12 = [v3 countByEnumeratingWithState:&v31 objects:v40 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v32;
            while (2)
            {
              for (uint64_t i = 0; i != v13; ++i)
              {
                if (*(void *)v32 != v14) {
                  objc_enumerationMutation(v3);
                }
                uint64_t v16 = objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * i), "propertyForName:", v11, v23);
                if (v16)
                {
                  v21 = (void *)v16;
                  if ([v26 negativeProperty]) {
                    [v21 localizedNegativeName];
                  }
                  else {
                  v17 = [v21 localizedName];
                  }

                  goto LABEL_32;
                }
              }
              uint64_t v13 = [v3 countByEnumeratingWithState:&v31 objects:v40 count:16];
              if (v13) {
                continue;
              }
              break;
            }
          }

          uint64_t v7 = v24;
          uint64_t v6 = v25;
        }
        objc_msgSend(v10, "processedContentClasses:", v9, v23);
        id v3 = (id)objc_claimAutoreleasedReturnValue();

        ++v8;
        id v9 = v3;
      }
      while (v8 != v6);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v35 objects:v41 count:16];
      v2 = v23;
    }
    while (v6);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v4 = [(WFVariable *)v2 aggrandizements];
  v17 = (void *)[v4 countByEnumeratingWithState:&v27 objects:v39 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v28;
    while (2)
    {
      for (j = 0; j != v17; j = (char *)j + 1)
      {
        if (*(void *)v28 != v18) {
          objc_enumerationMutation(v4);
        }
        v20 = *(void **)(*((void *)&v27 + 1) + 8 * (void)j);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v17 = [v20 dictionaryKey];
          goto LABEL_32;
        }
      }
      v17 = (void *)[v4 countByEnumeratingWithState:&v27 objects:v39 count:16];
      if (v17) {
        continue;
      }
      break;
    }
  }
LABEL_32:

  return (NSString *)v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_aggrandizements, 0);
}

- (void)setDictionary:(id)a3
{
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (NSArray)aggrandizements
{
  return self->_aggrandizements;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v5 = [(WFVariable *)self dictionary];
  uint64_t v6 = [(WFVariable *)self variableProvider];
  uint64_t v7 = (void *)[v4 initWithDictionary:v5 variableProvider:v6];

  return v7;
}

- (id)variableBySettingAggrandizements:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFVariable *)self dictionary];
  uint64_t v6 = (void *)[v5 mutableCopy];

  uint64_t v7 = WFVariableDictionaryWithAggrandizements(v4);

  uint64_t v8 = [v7 allKeys];
  uint64_t v9 = [v8 count];

  if (v9) {
    [v6 addEntriesFromDictionary:v7];
  }
  else {
    [v6 removeObjectForKey:@"Aggrandizements"];
  }
  id v10 = objc_alloc((Class)objc_opt_class());
  v11 = [(WFVariable *)self variableProvider];
  uint64_t v12 = (void *)[v10 initWithDictionary:v6 variableProvider:v11];

  return v12;
}

- (unint64_t)hash
{
  id v3 = [(WFVariable *)self dictionary];
  uint64_t v4 = [v3 hash];
  uint64_t v5 = [(WFVariable *)self variableProvider];
  unint64_t v6 = v4 ^ [v5 hash] ^ 0x4620840A;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (WFVariable *)a3;
  if (v4 == self)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [(WFVariable *)v4 dictionary];
      unint64_t v6 = [(WFVariable *)self dictionary];
      if ([v5 isEqual:v6])
      {
        uint64_t v7 = [(WFVariable *)self variableProvider];
        uint64_t v8 = [(WFVariable *)v4 variableProvider];
        BOOL v9 = v7 == v8;
      }
      else
      {
        BOOL v9 = 0;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (void)getFileRepresentationWithContext:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__WFVariable_getFileRepresentationWithContext_completionHandler___block_invoke;
  v10[3] = &unk_1E6556C08;
  id v11 = v6;
  id v12 = v7;
  id v8 = v6;
  id v9 = v7;
  [(WFVariable *)self getContentWithContext:v8 trackContentAttribution:0 completionHandler:v10];
}

void __65__WFVariable_getFileRepresentationWithContext_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __65__WFVariable_getFileRepresentationWithContext_completionHandler___block_invoke_2;
    v5[3] = &unk_1E6554888;
    id v6 = v3;
    id v7 = *(id *)(a1 + 32);
    id v8 = *(id *)(a1 + 40);
    [v6 getFileRepresentationAndAttributionSet:v5 forType:0];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __65__WFVariable_getFileRepresentationWithContext_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v9 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v7 && *(void *)(a1 + 32)) {
    [*(id *)(a1 + 40) addContentAttributionSet:v7];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)getObjectRepresentationForClass:(Class)a3 context:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __72__WFVariable_getObjectRepresentationForClass_context_completionHandler___block_invoke;
  v12[3] = &unk_1E6554860;
  id v13 = v8;
  id v14 = v9;
  Class v15 = a3;
  id v10 = v8;
  id v11 = v9;
  [(WFVariable *)self getContentWithContext:v10 trackContentAttribution:0 completionHandler:v12];
}

void __72__WFVariable_getObjectRepresentationForClass_context_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __72__WFVariable_getObjectRepresentationForClass_context_completionHandler___block_invoke_2;
    v5[3] = &unk_1E6554838;
    id v6 = v3;
    id v7 = *(id *)(a1 + 32);
    id v8 = *(id *)(a1 + 40);
    [v6 getObjectRepresentationAndAttributionSet:v5 forClass:*(void *)(a1 + 48)];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __72__WFVariable_getObjectRepresentationForClass_context_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v12 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v10 && *(void *)(a1 + 32)) {
    [*(id *)(a1 + 40) addContentAttributionSet:v10];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)retrieveContentCollectionWithVariableSource:(id)a3 completionHandler:(id)a4
{
}

- (void)getContentWithContext:(id)a3 completionHandler:(id)a4
{
}

- (void)getContentWithContext:(id)a3 trackContentAttribution:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__WFVariable_getContentWithContext_trackContentAttribution_completionHandler___block_invoke;
  aBlock[3] = &unk_1E6554810;
  aBlock[4] = self;
  id v10 = v8;
  id v19 = v10;
  id v11 = v9;
  id v20 = v11;
  BOOL v21 = a4;
  id v12 = _Block_copy(aBlock);
  id v13 = v12;
  if (v10)
  {
    id v14 = [(WFVariable *)self requiredAccessResources];
    Class v15 = [MEMORY[0x1E4FB4890] sharedManager];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __78__WFVariable_getContentWithContext_trackContentAttribution_completionHandler___block_invoke_4;
    v16[3] = &unk_1E6556318;
    id v17 = v13;
    [v15 requestSandboxExtensionForRunningActionWithAccessResources:v14 completion:v16];
  }
  else
  {
    (*((void (**)(void *))v12 + 2))(v12);
  }
}

void __78__WFVariable_getContentWithContext_trackContentAttribution_completionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) variableSource];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__WFVariable_getContentWithContext_trackContentAttribution_completionHandler___block_invoke_2;
  v7[3] = &unk_1E65547E8;
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  id v9 = v4;
  v7[4] = v5;
  char v10 = *(unsigned char *)(a1 + 56);
  id v8 = v6;
  [v2 retrieveContentCollectionWithVariableSource:v3 completionHandler:v7];
}

uint64_t __78__WFVariable_getContentWithContext_trackContentAttribution_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __78__WFVariable_getContentWithContext_trackContentAttribution_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x3032000000;
    v17[3] = __Block_byref_object_copy__47831;
    v17[4] = __Block_byref_object_dispose__47832;
    id v18 = v5;
    id v8 = [*(id *)(a1 + 32) aggrandizements];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __78__WFVariable_getContentWithContext_trackContentAttribution_completionHandler___block_invoke_221;
    v16[3] = &unk_1E6554798;
    void v16[4] = v17;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __78__WFVariable_getContentWithContext_trackContentAttribution_completionHandler___block_invoke_3;
    v11[3] = &unk_1E65547C0;
    id v14 = v17;
    char v15 = *(unsigned char *)(a1 + 56);
    id v12 = *(id *)(a1 + 40);
    id v13 = *(id *)(a1 + 48);
    objc_msgSend(v8, "if_enumerateAsynchronouslyInSequence:completionHandler:", v16, v11);

    _Block_object_dispose(v17, 8);
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 48);
    if (v6)
    {
      (*(void (**)(uint64_t, void, id))(v9 + 16))(v9, 0, v6);
    }
    else
    {
      char v10 = objc_opt_new();
      (*(void (**)(uint64_t, void *, void))(v9 + 16))(v9, v10, 0);
    }
  }
}

void __78__WFVariable_getContentWithContext_trackContentAttribution_completionHandler___block_invoke_221(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v8 = a4;
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(*(void *)(v9 + 8) + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __78__WFVariable_getContentWithContext_trackContentAttribution_completionHandler___block_invoke_2_222;
  v12[3] = &unk_1E6554770;
  uint64_t v14 = v9;
  uint64_t v15 = a5;
  id v13 = v8;
  id v11 = v8;
  [a2 applyToContentCollection:v10 completionHandler:v12];
}

void __78__WFVariable_getContentWithContext_trackContentAttribution_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t v4 = a3;
  unint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  id v11 = (id)v4;
  if (v5)
  {
    if (!*(unsigned char *)(a1 + 56)) {
      goto LABEL_6;
    }
    id v6 = *(void **)(a1 + 32);
    id v7 = objc_msgSend((id)v5, "attributionSet", v4);
    [v6 addContentAttributionSet:v7];

    unint64_t v4 = (unint64_t)v11;
    unint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  }
  if (!(v4 | v5))
  {
    uint64_t v8 = objc_opt_new();
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
LABEL_6:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __78__WFVariable_getContentWithContext_trackContentAttribution_completionHandler___block_invoke_2_222(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v6 = a3;
  if (!v10 || v6)
  {
    **(unsigned char **)(a1 + 48) = 1;
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = 0;

    id v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    id v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v7();
}

- (id)possibleAggrandizedContentClassesWithContext:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = [(WFVariable *)self possibleContentClassesWithContext:a3];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  unint64_t v5 = [(WFVariable *)self aggrandizements];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      id v10 = v4;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        unint64_t v4 = [*(id *)(*((void *)&v12 + 1) + 8 * v9) processedContentClasses:v10];

        ++v9;
        id v10 = v4;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)possibleContentClassesWithContext:(id)a3
{
  id v3 = objc_opt_new();
  return v3;
}

- (NSOrderedSet)possibleAggrandizedContentClasses
{
  id v3 = objc_opt_new();
  unint64_t v4 = [(WFVariable *)self possibleAggrandizedContentClassesWithContext:v3];

  return (NSOrderedSet *)v4;
}

- (NSOrderedSet)possibleContentClasses
{
  id v3 = objc_opt_new();
  unint64_t v4 = [(WFVariable *)self possibleContentClassesWithContext:v3];

  return (NSOrderedSet *)v4;
}

- (void)variableUpdated
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = [(WFVariable *)self delegates];
  unint64_t v4 = (void *)[v3 copy];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) variableDidChange:self];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(WFVariable *)self delegates];
  [v5 removeObject:v4];
}

- (void)addDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(WFVariable *)self delegates];
  [v5 addObject:v4];
}

- (NSHashTable)delegates
{
  delegates = self->_delegates;
  if (!delegates)
  {
    id v4 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    id v5 = self->_delegates;
    self->_delegates = v4;

    delegates = self->_delegates;
  }
  return delegates;
}

- (NSSet)requiredAccessResources
{
  return 0;
}

- (NSString)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WFVariable;
  id v4 = [(WFVariable *)&v8 description];
  id v5 = [(WFVariable *)self nameIncludingPropertyName];
  uint64_t v6 = [v3 stringWithFormat:@"%@: %@", v4, v5];

  return (NSString *)v6;
}

- (WFVariableProvider)variableProvider
{
  return 0;
}

- (BOOL)requiresModernVariableSupport
{
  return 1;
}

- (BOOL)supportsAggrandizements
{
  return 1;
}

- (BOOL)isAvailable
{
  return 0;
}

- (NSString)UUID
{
  return 0;
}

- (BOOL)isRenamed
{
  return 0;
}

- (NSString)name
{
  return (NSString *)WFLocalizedString(@"Unknown Variable");
}

- (WFIcon)icon
{
  return 0;
}

- (NSString)type
{
  v2 = [(WFVariable *)self dictionary];
  id v3 = [v2 objectForKey:@"Type"];

  return (NSString *)v3;
}

- (WFVariable)initWithDictionary:(id)a3 variableProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    id v6 = (id)MEMORY[0x1E4F1CC08];
  }
  objc_super v8 = [v6 objectForKey:@"Type"];
  uint64_t v9 = objc_opt_class();
  long long v10 = WFEnforceClass(v8, v9);

  uint64_t v11 = objc_opt_class();
  if (v11 == objc_opt_class())
  {
    long long v12 = WFVariableClassesByType();
    long long v13 = (objc_class *)[v12 objectForKey:v10];

    if ([(objc_class *)v13 isSubclassOfClass:objc_opt_class()])
    {
      uint64_t v14 = [[v13 alloc] initWithDictionary:v6 variableProvider:v7];
      if (v14)
      {
        long long v15 = (WFVariable *)v14;
LABEL_17:

        goto LABEL_18;
      }
    }
  }
  v32.receiver = self;
  v32.super_class = (Class)WFVariable;
  uint64_t v16 = [(WFVariable *)&v32 init];
  if (v16)
  {
    uint64_t v17 = v16;
    if (!v10)
    {
      uint64_t v18 = objc_opt_class();
      if (v18 == objc_opt_class())
      {
        long long v10 = 0;
      }
      else
      {
        id v19 = (void *)[v6 mutableCopy];
        id v20 = WFVariableClassesByType();
        BOOL v21 = [v20 allKeysForObject:objc_opt_class()];
        long long v10 = [v21 firstObject];

        [v19 setValue:v10 forKey:@"Type"];
        id v6 = v19;
      }
    }
    v22 = [v6 objectForKey:@"Aggrandizements"];
    uint64_t v23 = objc_opt_class();
    uint64_t v24 = WFEnforceClass(v22, v23);

    uint64_t v25 = objc_msgSend(v24, "if_map:", &__block_literal_global_205_47853);
    uint64_t v26 = [v25 copy];
    long long v27 = (void *)v26;
    if (v26) {
      long long v28 = (void *)v26;
    }
    else {
      long long v28 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong((id *)&v17->_aggrandizements, v28);

    uint64_t v29 = [v6 copy];
    dictionary = v17->_dictionary;
    v17->_dictionary = (NSDictionary *)v29;

    self = v17;
    long long v15 = self;
    goto LABEL_17;
  }
  long long v15 = 0;
LABEL_18:

  return v15;
}

WFVariableAggrandizement *__50__WFVariable_initWithDictionary_variableProvider___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[WFVariableAggrandizement alloc] initWithDictionary:v2];

  return v3;
}

- (WFVariable)init
{
  return [(WFVariable *)self initWithDictionary:MEMORY[0x1E4F1CC08] variableProvider:0];
}

@end