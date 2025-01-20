@interface ICUlyssesContentMapping
- (BOOL)skipURLEncoding;
- (id)contentItemClasses;
- (void)getImageURLQueryString:(id)a3 withInput:(id)a4 parameters:(id)a5;
- (void)getStringRepresentation:(id)a3 withInput:(id)a4 parameters:(id)a5;
- (void)getTextRepresentation:(id)a3 withInput:(id)a4 parameters:(id)a5;
- (void)getTextURLQueryString:(id)a3 withInput:(id)a4 parameters:(id)a5;
@end

@implementation ICUlyssesContentMapping

- (void)getImageURLQueryString:(id)a3 withInput:(id)a4 parameters:(id)a5
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_class();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71__ICUlyssesContentMapping_getImageURLQueryString_withInput_parameters___block_invoke;
  v10[3] = &unk_1E6556D50;
  id v11 = v6;
  id v9 = v6;
  [v7 generateCollectionByCoercingToItemClass:v8 completionHandler:v10];
}

void __71__ICUlyssesContentMapping_getImageURLQueryString_withInput_parameters___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if ([v6 numberOfItems])
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __71__ICUlyssesContentMapping_getImageURLQueryString_withInput_parameters___block_invoke_2;
    v8[3] = &unk_1E6557448;
    id v9 = *(id *)(a1 + 32);
    [v6 getFileRepresentation:v8 forType:0];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __71__ICUlyssesContentMapping_getImageURLQueryString_withInput_parameters___block_invoke_2(uint64_t a1, void *a2)
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = [v3 data];
    id v6 = [v5 base64EncodedStringWithOptions:0];

    id v7 = (void *)MEMORY[0x1E4F1CB10];
    v11[0] = @"image";
    v11[1] = @"filename";
    v12[0] = v6;
    uint64_t v8 = [v4 filename];
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
  id v11 = [v10 objectForKey:@"UlyssesTextFormat"];
  int v12 = [v11 isEqualToString:@"Markdown"];
  int v13 = [v11 isEqualToString:@"HTML"];
  v14 = [v9 items];
  v15 = [v14 objectsMatchingClass:objc_opt_class()];
  v16 = [v15 firstObject];

  if (v16 && ((v12 | v13) & 1) != 0)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __70__ICUlyssesContentMapping_getTextRepresentation_withInput_parameters___block_invoke;
    v18[3] = &unk_1E6555000;
    id v19 = v8;
    char v20 = v12;
    v17 = objc_msgSend(MEMORY[0x1E4FB4718], "typeWithUTType:", *MEMORY[0x1E4F443F0], v18[0], 3221225472, __70__ICUlyssesContentMapping_getTextRepresentation_withInput_parameters___block_invoke, &unk_1E6555000);
    [v16 getFileRepresentation:v18 forType:v17];
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)ICUlyssesContentMapping;
    [(ICContentMapping *)&v21 getStringRepresentation:v8 withInput:v9 parameters:v10];
  }
}

void __70__ICUlyssesContentMapping_getTextRepresentation_withInput_parameters___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  id v6 = NSString;
  id v7 = [v15 data];
  id v8 = objc_msgSend(v6, "wf_stringWithData:", v7);

  if (v8)
  {
    if (*(unsigned char *)(a1 + 40))
    {
      id v9 = objc_alloc(MEMORY[0x1E4F5A930]);
      id v10 = [v15 originalURL];
      id v11 = (void *)[v9 initWithBaseURL:v10];

      uint64_t v12 = *(void *)(a1 + 32);
      int v13 = [v11 handleHTML:v8];
      (*(void (**)(uint64_t, void *, void))(v12 + 16))(v12, v13, 0);

      goto LABEL_7;
    }
    v14 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    v14 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v14();
LABEL_7:
}

- (void)getTextURLQueryString:(id)a3 withInput:(id)a4 parameters:(id)a5
{
  id v8 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__ICUlyssesContentMapping_getTextURLQueryString_withInput_parameters___block_invoke;
  v10[3] = &unk_1E6558C90;
  id v11 = v8;
  id v9 = v8;
  [(ICUlyssesContentMapping *)self getTextRepresentation:v10 withInput:a4 parameters:a5];
}

void __70__ICUlyssesContentMapping_getTextURLQueryString_withInput_parameters___block_invoke(uint64_t a1, void *a2, uint64_t a3)
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
  id v11 = (void (**)(id, __CFString *, void))a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v9 objectForKey:@"UlyssesAttachmentType"];
  if ([v10 isEqualToString:@"Keywords"])
  {
    v11[2](v11, &stru_1F229A4D8, 0);
  }
  else if ([v10 isEqualToString:@"Image"])
  {
    [(ICUlyssesContentMapping *)self getImageURLQueryString:v11 withInput:v8 parameters:v9];
  }
  else
  {
    [(ICUlyssesContentMapping *)self getTextURLQueryString:v11 withInput:v8 parameters:v9];
  }
}

- (BOOL)skipURLEncoding
{
  return 1;
}

- (id)contentItemClasses
{
  v2 = (void *)MEMORY[0x1E4F1CAA0];
  uint64_t v3 = objc_opt_class();
  return (id)objc_msgSend(v2, "orderedSetWithObjects:", v3, objc_opt_class(), 0);
}

@end