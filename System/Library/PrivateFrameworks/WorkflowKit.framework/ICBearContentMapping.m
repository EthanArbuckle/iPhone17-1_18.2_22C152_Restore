@interface ICBearContentMapping
- (BOOL)skipURLEncoding;
- (id)contentItemClasses;
- (void)getFileURLQueryString:(id)a3 withInput:(id)a4 parameters:(id)a5;
- (void)getStringRepresentation:(id)a3 withInput:(id)a4 parameters:(id)a5;
- (void)getTextRepresentation:(id)a3 withInput:(id)a4 parameters:(id)a5;
- (void)getTextURLQueryString:(id)a3 withInput:(id)a4 parameters:(id)a5;
@end

@implementation ICBearContentMapping

- (void)getFileURLQueryString:(id)a3 withInput:(id)a4 parameters:(id)a5
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67__ICBearContentMapping_getFileURLQueryString_withInput_parameters___block_invoke;
  v8[3] = &unk_1E6557448;
  id v9 = v6;
  id v7 = v6;
  [a4 getFileRepresentation:v8 forType:0];
}

void __67__ICBearContentMapping_getFileURLQueryString_withInput_parameters___block_invoke(uint64_t a1, void *a2)
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = [v3 data];
    id v6 = [v5 base64EncodedStringWithOptions:0];

    id v7 = (void *)MEMORY[0x1E4F1CB10];
    v11[0] = @"file";
    v11[1] = @"filename";
    v12[0] = v6;
    v8 = [v4 filename];
    v12[1] = v8;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
    v10 = objc_msgSend(v7, "dc_queryStringWithQueryDictionary:", v9);

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)getTextRepresentation:(id)a3 withInput:(id)a4 parameters:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v9 items];
  v12 = [v11 objectsMatchingClass:objc_opt_class()];
  v13 = [v12 firstObject];

  if (v13)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __67__ICBearContentMapping_getTextRepresentation_withInput_parameters___block_invoke;
    v15[3] = &unk_1E6557448;
    id v16 = v8;
    v14 = [MEMORY[0x1E4FB4718] typeWithUTType:*MEMORY[0x1E4F443F0]];
    [v13 getFileRepresentation:v15 forType:v14];
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)ICBearContentMapping;
    [(ICContentMapping *)&v17 getStringRepresentation:v8 withInput:v9 parameters:v10];
  }
}

void __67__ICBearContentMapping_getTextRepresentation_withInput_parameters___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  id v6 = NSString;
  id v7 = [v14 data];
  id v8 = objc_msgSend(v6, "wf_stringWithData:", v7);

  if (v8)
  {
    id v9 = objc_alloc(MEMORY[0x1E4F5A930]);
    id v10 = [v14 originalURL];
    v11 = (void *)[v9 initWithBaseURL:v10];

    uint64_t v12 = *(void *)(a1 + 32);
    v13 = [v11 handleHTML:v8];
    (*(void (**)(uint64_t, void *, void))(v12 + 16))(v12, v13, 0);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)getTextURLQueryString:(id)a3 withInput:(id)a4 parameters:(id)a5
{
  id v8 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__ICBearContentMapping_getTextURLQueryString_withInput_parameters___block_invoke;
  v10[3] = &unk_1E6558C90;
  id v11 = v8;
  id v9 = v8;
  [(ICBearContentMapping *)self getTextRepresentation:v10 withInput:a4 parameters:a5];
}

void __67__ICBearContentMapping_getTextURLQueryString_withInput_parameters___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    v4 = (void *)MEMORY[0x1E4F1CB10];
    id v9 = @"text";
    v10[0] = a2;
    id v5 = (void *)MEMORY[0x1E4F1C9E8];
    id v6 = a2;
    id v7 = [v5 dictionaryWithObjects:v10 forKeys:&v9 count:1];
    id v8 = objc_msgSend(v4, "dc_queryStringWithQueryDictionary:", v7);

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void, void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0, a3);
    id v8 = 0;
  }
}

- (void)getStringRepresentation:(id)a3 withInput:(id)a4 parameters:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v10 objectForKey:@"BearAttachmentType"];
  uint64_t v12 = v11;
  if (v11)
  {
    if ([v11 isEqualToString:@"File"]) {
      [(ICBearContentMapping *)self getFileURLQueryString:v8 withInput:v9 parameters:v10];
    }
    else {
      [(ICBearContentMapping *)self getTextURLQueryString:v8 withInput:v9 parameters:v10];
    }
  }
  else
  {
    id v23 = 0;
    v13 = [v9 collectionByFilteringItemsWithBlock:&__block_literal_global_48234 excludedItems:&v23];
    id v14 = v23;
    if (![v14 numberOfItems])
    {
      v15 = [v13 collectionByFilteringToItemClass:objc_opt_class() excludedItems:0];
      if ([v15 numberOfItems])
      {
        id v16 = [v15 items];
        objc_super v17 = [v16 firstObject];

        [v14 addItem:v17];
        [v13 removeItem:v17];
      }
    }
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __69__ICBearContentMapping_getStringRepresentation_withInput_parameters___block_invoke_2;
    v19[3] = &unk_1E65549C8;
    id v22 = v8;
    v19[4] = self;
    id v20 = v13;
    id v21 = v10;
    id v18 = v13;
    [(ICBearContentMapping *)self getTextURLQueryString:v19 withInput:v14 parameters:v21];
  }
}

void __69__ICBearContentMapping_getStringRepresentation_withInput_parameters___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v5, 0);
    id v7 = *(void **)(a1 + 32);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __69__ICBearContentMapping_getStringRepresentation_withInput_parameters___block_invoke_3;
    void v12[3] = &unk_1E65549A0;
    id v8 = *(id *)(a1 + 56);
    id v13 = v6;
    id v14 = v8;
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    id v11 = v6;
    [v7 getFileURLQueryString:v12 withInput:v10 parameters:v9];
  }
}

void __69__ICBearContentMapping_getStringRepresentation_withInput_parameters___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (v8) {
      [*(id *)(a1 + 32) addObject:v8];
    }
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = [*(id *)(a1 + 32) componentsJoinedByString:@"&"];
    (*(void (**)(uint64_t, void *, void))(v6 + 16))(v6, v7, 0);
  }
}

uint64_t __69__ICBearContentMapping_getStringRepresentation_withInput_parameters___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    char v3 = objc_opt_isKindOfClass() ^ 1;
  }
  else
  {
    char v3 = 0;
  }

  return v3 & 1;
}

- (BOOL)skipURLEncoding
{
  return 1;
}

- (id)contentItemClasses
{
  id v2 = (void *)MEMORY[0x1E4F1CAA0];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  return (id)objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, objc_opt_class(), 0);
}

@end