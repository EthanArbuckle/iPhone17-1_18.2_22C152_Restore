@interface WFVariableString
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)representsSingleContentVariable;
- (NSArray)stringsAndVariables;
- (NSArray)variables;
- (NSString)description;
- (NSString)stringByRemovingVariables;
- (NSString)stringByReplacingVariablesWithNames;
- (WFPropertyListObject)serializedRepresentation;
- (WFVariableString)init;
- (WFVariableString)initWithAttachmentCharacterString:(id)a3 variableGetter:(id)a4;
- (WFVariableString)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5;
- (WFVariableString)initWithString:(id)a3;
- (WFVariableString)initWithStringsAndVariables:(id)a3;
- (WFVariableString)initWithVariable:(id)a3;
- (id)variablesOfType:(id)a3;
- (unint64_t)hash;
- (void)addVariableDelegate:(id)a3;
- (void)processIntoContentItemsWithContext:(id)a3 completionHandler:(id)a4;
- (void)processIntoStringsAndAttachmentsWithContext:(id)a3 options:(id)a4 completionHandler:(id)a5;
- (void)processWithContext:(id)a3 completionHandler:(id)a4;
- (void)removeVariableDelegate:(id)a3;
@end

@implementation WFVariableString

- (void).cxx_destruct
{
}

- (NSArray)stringsAndVariables
{
  return self->_stringsAndVariables;
}

- (NSString)description
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F28E78];
  v21.receiver = self;
  v21.super_class = (Class)WFVariableString;
  v4 = [(WFVariableString *)&v21 description];
  v5 = [v3 stringWithFormat:@"%@: ", v4];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v6 = [(WFVariableString *)self stringsAndVariables];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v5 appendString:v11];
        }
        else
        {
          id v12 = v11;
          v13 = (objc_class *)objc_opt_class();
          v14 = NSStringFromClass(v13);
          v15 = [v12 name];
          [v5 appendFormat:@"<%@: %p, name: %@>", v14, v12, v15];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v8);
  }

  return (NSString *)v5;
}

- (NSArray)variables
{
  return (NSArray *)[(WFVariableString *)self variablesOfType:0];
}

- (NSString)stringByReplacingVariablesWithNames
{
  v2 = [(WFVariableString *)self stringsAndVariables];
  v3 = objc_msgSend(v2, "if_map:", &__block_literal_global_210);
  v4 = [v3 componentsJoinedByString:&stru_1F229A4D8];

  return (NSString *)v4;
}

id __55__WFVariableString_stringByReplacingVariablesWithNames__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v2;
  }
  else
  {
    id v3 = [v2 nameIncludingPropertyName];
  }
  v4 = v3;

  return v4;
}

- (NSString)stringByRemovingVariables
{
  id v2 = [(WFVariableString *)self stringsAndVariables];
  id v3 = objc_msgSend(v2, "if_objectsPassingTest:", &__block_literal_global_2973);
  v4 = [v3 componentsJoinedByString:&stru_1F229A4D8];

  return (NSString *)v4;
}

uint64_t __45__WFVariableString_stringByRemovingVariables__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)processIntoStringsAndAttachmentsWithContext:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = objc_opt_new();
  id v12 = objc_opt_new();
  v13 = [(WFVariableString *)self stringsAndVariables];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __90__WFVariableString_processIntoStringsAndAttachmentsWithContext_options_completionHandler___block_invoke;
  v23[3] = &unk_1E654D290;
  id v24 = v8;
  id v25 = v11;
  id v26 = v12;
  id v27 = v9;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __90__WFVariableString_processIntoStringsAndAttachmentsWithContext_options_completionHandler___block_invoke_5;
  v19[3] = &unk_1E6557D00;
  id v21 = v25;
  id v22 = v10;
  id v20 = v26;
  id v14 = v25;
  id v15 = v26;
  id v16 = v10;
  id v17 = v9;
  id v18 = v8;
  objc_msgSend(v13, "if_enumerateAsynchronouslyInSequence:completionHandler:", v23, v19);
}

void __90__WFVariableString_processIntoStringsAndAttachmentsWithContext_options_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  uint64_t v7 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __90__WFVariableString_processIntoStringsAndAttachmentsWithContext_options_completionHandler___block_invoke_2;
  v9[3] = &unk_1E65579A0;
  id v10 = v7;
  id v11 = *(id *)(a1 + 40);
  id v12 = *(id *)(a1 + 48);
  id v14 = v6;
  id v13 = *(id *)(a1 + 56);
  id v8 = v6;
  objc_msgSend(a2, "wf_getContentItemsWithContext:completionHandler:", v10, v9);
}

void __90__WFVariableString_processIntoStringsAndAttachmentsWithContext_options_completionHandler___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v4 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v4();
  }
  else
  {
    v5 = [MEMORY[0x1E4F5A828] attributionSetByMergingAttributionSets:*(void *)(a1 + 32)];
    id v6 = objc_opt_new();
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v14 = a1;
    id v7 = *(id *)(a1 + 40);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v13 = [MEMORY[0x1E4F5A848] itemWithObject:v12 attributionSet:v5];
            [v6 addItem:v13];
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [v6 addItems:v12];
            }
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }

    (*(void (**)(void))(*(void *)(v14 + 48) + 16))();
  }
}

void __90__WFVariableString_processIntoStringsAndAttachmentsWithContext_options_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 count] == 1)
  {
    id v7 = [v5 firstObject];
    uint64_t v8 = WFVariableStringInferredContentTypeForItem(v7);

    if (!v8)
    {
      id v13 = [v5 firstObject];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __90__WFVariableString_processIntoStringsAndAttachmentsWithContext_options_completionHandler___block_invoke_3;
      v19[3] = &unk_1E654D240;
      id v20 = *(id *)(a1 + 32);
      id v21 = *(id *)(a1 + 40);
      id v22 = *(id *)(a1 + 48);
      id v23 = v5;
      id v24 = *(id *)(a1 + 64);
      [v13 getObjectRepresentation:v19 forClass:objc_opt_class() options:*(void *)(a1 + 56)];

      uint64_t v12 = v20;
      goto LABEL_10;
    }
  }
  if ([v5 count] == 1)
  {
    uint64_t v9 = [v5 firstObject];
    uint64_t v10 = WFVariableStringInferredContentTypeForItem(v9);

    if (v10 == 1)
    {
      id v11 = [v5 firstObject];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __90__WFVariableString_processIntoStringsAndAttachmentsWithContext_options_completionHandler___block_invoke_4;
      v14[3] = &unk_1E654D268;
      id v15 = *(id *)(a1 + 40);
      id v16 = *(id *)(a1 + 48);
      id v17 = v5;
      id v18 = *(id *)(a1 + 64);
      [v11 getObjectRepresentation:v14 forClass:objc_opt_class() options:*(void *)(a1 + 56)];

      uint64_t v12 = v15;
LABEL_10:

      goto LABEL_11;
    }
  }
  if (v5) {
    [*(id *)(a1 + 40) addObject:v5];
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_11:
}

void __90__WFVariableString_processIntoStringsAndAttachmentsWithContext_options_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v17 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v17)
  {
    uint64_t v9 = [*(id *)(a1 + 32) parameter];
    if ([v9 stripsTTSHints])
    {
      uint64_t v10 = [*(id *)(a1 + 32) environment];

      if (v10 == 3)
      {
LABEL_6:
        id v13 = v17;
        goto LABEL_8;
      }
      id v11 = [MEMORY[0x1E4FB49D8] parseAnnotatedString:v17];
      uint64_t v12 = [v11 displayString];

      uint64_t v9 = v17;
      id v17 = (id)v12;
    }

    goto LABEL_6;
  }
  id v13 = 0;
LABEL_8:
  id v18 = v13;
  WFAppendStringToVariableContentConcatenatingStringsIfNecessary(*(void **)(a1 + 40), v13);
  uint64_t v14 = *(void **)(a1 + 48);
  id v15 = [*(id *)(a1 + 56) firstObject];
  id v16 = [v15 attributionSet];
  [v14 addObject:v16];

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

void __90__WFVariableString_processIntoStringsAndAttachmentsWithContext_options_completionHandler___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v17 = a4;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = objc_msgSend(a2, "wf_contentAsStringsAndAttachments");
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v18 + 1) + 8 * v10);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          WFAppendStringToVariableContentConcatenatingStringsIfNecessary(*(void **)(a1 + 32), v11);
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v12 = *(void **)(a1 + 32);
            id v22 = v11;
            id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
            [v12 addObject:v13];
          }
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v8);
  }

  uint64_t v14 = *(void **)(a1 + 40);
  id v15 = [*(id *)(a1 + 48) firstObject];
  id v16 = [v15 attributionSet];
  [v14 addObject:v16];

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)processIntoContentItemsWithContext:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(WFVariableString *)self stringsAndVariables];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__WFVariableString_processIntoContentItemsWithContext_completionHandler___block_invoke;
  v13[3] = &unk_1E654D218;
  id v14 = v6;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__WFVariableString_processIntoContentItemsWithContext_completionHandler___block_invoke_2;
  v11[3] = &unk_1E65586C8;
  id v12 = v7;
  id v9 = v7;
  id v10 = v6;
  objc_msgSend(v8, "if_flatMapAsynchronously:completionHandler:", v13, v11);
}

uint64_t __73__WFVariableString_processIntoContentItemsWithContext_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "wf_getContentItemsWithContext:completionHandler:", *(void *)(a1 + 32));
}

void __73__WFVariableString_processIntoContentItemsWithContext_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    v4 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v4();
  }
  else
  {
    id v5 = [MEMORY[0x1E4F5A830] collectionWithItems:a2];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)processWithContext:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v22[3] = -1;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__2990;
  v20[4] = __Block_byref_object_dispose__2991;
  id v21 = 0;
  uint64_t v8 = [(WFVariableString *)self stringsAndVariables];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __57__WFVariableString_processWithContext_completionHandler___block_invoke;
  v16[3] = &unk_1E654D1C8;
  long long v18 = v22;
  long long v19 = v20;
  id v17 = v6;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__WFVariableString_processWithContext_completionHandler___block_invoke_3;
  v11[3] = &unk_1E654D1F0;
  id v9 = v7;
  id v13 = v9;
  id v14 = v22;
  id v10 = v17;
  id v12 = v10;
  id v15 = v20;
  objc_msgSend(v8, "if_mapAsynchronously:completionHandler:", v16, v11);

  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v22, 8);
}

void __57__WFVariableString_processWithContext_completionHandler___block_invoke(uint64_t *a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  uint64_t v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8[2](v8, v7, 0);
  }
  else
  {
    id v9 = v7;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      *(void *)(*(void *)(a1[5] + 8) + 24) = a3;
      uint64_t v10 = [v9 prompt];
      uint64_t v11 = *(void *)(a1[6] + 8);
      id v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;

      v8[2](v8, &stru_1F229A4D8, 0);
      id v13 = v9;
    }
    else
    {

      uint64_t v14 = objc_opt_class();
      uint64_t v15 = a1[4];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __57__WFVariableString_processWithContext_completionHandler___block_invoke_2;
      v16[3] = &unk_1E65504F0;
      long long v18 = v8;
      id v17 = (id)a1[4];
      [v9 getObjectRepresentationForClass:v14 context:v15 completionHandler:v16];

      id v13 = v18;
    }
  }
}

void __57__WFVariableString_processWithContext_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  if (v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_10;
  }
  id v6 = v14;
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) != -1)
  {
    id v7 = [v14 subarrayWithRange:0];
    uint64_t v8 = [v7 valueForKeyPath:@"@sum.length"];
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v8 integerValue];

    id v6 = v14;
  }
  id v9 = [v6 componentsJoinedByString:&stru_1F229A4D8];
  uint64_t v10 = [*(id *)(a1 + 32) parameter];
  if (![v10 stripsTTSHints]) {
    goto LABEL_8;
  }
  uint64_t v11 = [*(id *)(a1 + 32) environment];

  if (v11 != 3)
  {
    id v12 = [MEMORY[0x1E4FB49D8] parseAnnotatedString:v9];
    uint64_t v13 = [v12 displayString];

    uint64_t v10 = v9;
    id v9 = (void *)v13;
LABEL_8:
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

LABEL_10:
}

void __57__WFVariableString_processWithContext_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v13 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v11)
  {
    id v12 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (v10) {
      [*(id *)(a1 + 32) addContentAttributionSet:v10];
    }
    id v12 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v12();
}

- (WFPropertyListObject)serializedRepresentation
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  v4 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v5 = [(WFVariableString *)self stringsAndVariables];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v4 appendString:v10];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v11 = [v10 serializedRepresentation];
            v32.location = [v4 length];
            v32.length = 1;
            id v12 = NSStringFromRange(v32);
            [v3 setObject:v11 forKey:v12];

            __int16 v20 = -4;
            id v13 = [NSString stringWithCharacters:&v20 length:1];
            [v4 appendString:v13];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v7);
  }

  if ([v3 count])
  {
    v27[0] = @"string";
    v27[1] = @"attachmentsByRange";
    v28[0] = v4;
    v28[1] = v3;
    id v14 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v15 = (void **)v28;
    id v16 = (__CFString **)v27;
    uint64_t v17 = 2;
  }
  else
  {
    id v25 = @"string";
    id v26 = v4;
    id v14 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v15 = &v26;
    id v16 = &v25;
    uint64_t v17 = 1;
  }
  long long v18 = [v14 dictionaryWithObjects:v15 forKeys:v16 count:v17];

  return (WFPropertyListObject *)v18;
}

- (WFVariableString)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = [v10 objectForKey:@"string"];
  id v12 = [v10 objectForKey:@"attachmentsByRange"];

  if (v11)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __80__WFVariableString_initWithSerializedRepresentation_variableProvider_parameter___block_invoke;
    v15[3] = &unk_1E654D1A0;
    id v16 = v12;
    id v17 = v8;
    id v18 = v9;
    self = [(WFVariableString *)self initWithAttachmentCharacterString:v11 variableGetter:v15];

    id v13 = self;
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

WFVariable *__80__WFVariableString_initWithSerializedRepresentation_variableProvider_parameter___block_invoke(void *a1, NSRange range)
{
  id v3 = (void *)a1[4];
  v9.location = range.location;
  v9.length = 1;
  v4 = NSStringFromRange(v9);
  id v5 = [v3 objectForKey:v4];

  if (v5) {
    uint64_t v6 = [[WFVariable alloc] initWithSerializedRepresentation:v5 variableProvider:a1[5] parameter:a1[6]];
  }
  else {
    uint64_t v6 = 0;
  }

  return v6;
}

- (WFVariableString)initWithAttachmentCharacterString:(id)a3 variableGetter:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int16 v22 = -4;
  id v8 = [NSString stringWithCharacters:&v22 length:1];
  NSRange v9 = [v6 componentsSeparatedByString:v8];
  uint64_t v10 = [v9 count];
  id v11 = objc_opt_new();
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v21[3] = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __69__WFVariableString_initWithAttachmentCharacterString_variableGetter___block_invoke;
  v16[3] = &unk_1E654D178;
  id v12 = v11;
  id v17 = v12;
  long long v19 = v21;
  uint64_t v20 = v10;
  id v13 = v7;
  id v18 = v13;
  [v9 enumerateObjectsUsingBlock:v16];
  id v14 = [(WFVariableString *)self initWithStringsAndVariables:v12];

  _Block_object_dispose(v21, 8);
  return v14;
}

void __69__WFVariableString_initWithAttachmentCharacterString_variableGetter___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  uint64_t v5 = [v8 length];
  if (v5)
  {
    uint64_t v6 = v5;
    [*(id *)(a1 + 32) addObject:v8];
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += v6;
  }
  if (*(void *)(a1 + 56) - 1 != a3)
  {
    id v7 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      [*(id *)(a1 + 32) addObject:v7];
    }
  }
}

- (unint64_t)hash
{
  id v2 = [(WFVariableString *)self stringsAndVariables];
  unint64_t v3 = [v2 hash] ^ 0xD1DEFC;

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WFVariableString *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [(WFVariableString *)self stringsAndVariables];
      uint64_t v6 = [(WFVariableString *)v4 stringsAndVariables];
      char v7 = [v5 isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (WFVariableString)initWithStringsAndVariables:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFVariableString.m", 46, @"Invalid parameter not satisfying: %@", @"[stringsAndVariables isKindOfClass:[NSArray class]]" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)WFVariableString;
  uint64_t v6 = [(WFVariableString *)&v12 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    stringsAndVariables = v6->_stringsAndVariables;
    v6->_stringsAndVariables = (NSArray *)v7;

    NSRange v9 = v6;
  }

  return v6;
}

- (WFVariableString)initWithString:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    NSRange v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"WFVariableString.m", 41, @"Invalid parameter not satisfying: %@", @"[string isKindOfClass:[NSString class]]" object file lineNumber description];
  }
  v10[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  uint64_t v7 = [(WFVariableString *)self initWithStringsAndVariables:v6];

  return v7;
}

- (WFVariableString)initWithVariable:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    NSRange v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"WFVariableString.m", 36, @"Invalid parameter not satisfying: %@", @"[variable isKindOfClass:[WFVariable class]]" object file lineNumber description];
  }
  v10[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  uint64_t v7 = [(WFVariableString *)self initWithStringsAndVariables:v6];

  return v7;
}

- (WFVariableString)init
{
  return [(WFVariableString *)self initWithStringsAndVariables:MEMORY[0x1E4F1CBF0]];
}

- (void)removeVariableDelegate:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(WFVariableString *)self variables];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) removeDelegate:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)addVariableDelegate:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(WFVariableString *)self variables];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) addDelegate:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (BOOL)isEmpty
{
  unint64_t v3 = [(WFVariableString *)self variables];
  if ([v3 count])
  {
    BOOL v4 = 0;
  }
  else
  {
    id v5 = [(WFVariableString *)self stringByRemovingVariables];
    BOOL v4 = [v5 length] == 0;
  }
  return v4;
}

- (BOOL)representsSingleContentVariable
{
  unint64_t v3 = [(WFVariableString *)self variables];
  BOOL v4 = [v3 firstObject];

  if (v4)
  {
    id v5 = [(WFVariableString *)self stringsAndVariables];
    if ([v5 count] == 1)
    {
      uint64_t v6 = [v4 type];
      int v7 = [v6 isEqualToString:@"Ask"] ^ 1;
    }
    else
    {
      LOBYTE(v7) = 0;
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (id)variablesOfType:(id)a3
{
  id v4 = a3;
  id v5 = [(WFVariableString *)self stringsAndVariables];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__WFVariableString_Convenience__variablesOfType___block_invoke;
  v9[3] = &unk_1E654D2F8;
  id v10 = v4;
  id v6 = v4;
  int v7 = objc_msgSend(v5, "if_objectsPassingTest:", v9);

  return v7;
}

uint64_t __49__WFVariableString_Convenience__variablesOfType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (*(void *)(a1 + 32))
    {
      id v4 = [v3 type];
      uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];
    }
    else
    {
      uint64_t v5 = 1;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

@end