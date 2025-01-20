@interface ICFileAttachmentsContentMapping
- (BOOL)skipURLEncoding;
- (BOOL)supportsMultipleItems;
- (void)getStringRepresentation:(id)a3 withInput:(id)a4 parameters:(id)a5;
@end

@implementation ICFileAttachmentsContentMapping

- (void)getStringRepresentation:(id)a3 withInput:(id)a4 parameters:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v9 = [(ICContentMapping *)self sourceKey];
  v10 = [v8 objectForKey:v9];

  if ([v10 numberOfItems])
  {
    v11 = [(ICContentMapping *)self definition];
    v12 = [v11 objectForKey:@"AttachmentNameKey"];

    v13 = [(ICContentMapping *)self definition];
    v14 = [v13 objectForKey:@"AttachmentDataKey"];

    v15 = [MEMORY[0x1E4F28B88] URLQueryAllowedCharacterSet];
    v16 = (void *)[v15 mutableCopy];

    [v16 removeCharactersInString:@"?=&"];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __80__ICFileAttachmentsContentMapping_getStringRepresentation_withInput_parameters___block_invoke;
    v20[3] = &unk_1E654C660;
    id v21 = v12;
    id v22 = v16;
    id v23 = v14;
    id v24 = v7;
    id v17 = v14;
    id v18 = v16;
    id v19 = v12;
    [v10 getFileRepresentations:v20 forType:0];
  }
  else
  {
    (*((void (**)(id, __CFString *, void))v7 + 2))(v7, &stru_1F229A4D8, 0);
  }
}

void __80__ICFileAttachmentsContentMapping_getStringRepresentation_withInput_parameters___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([v5 count])
  {
    id v19 = v6;
    id v7 = objc_opt_new();
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v20 = v5;
    id obj = v5;
    uint64_t v8 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v23;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(obj);
          }
          v12 = *(void **)(*((void *)&v22 + 1) + 8 * v11);
          uint64_t v13 = a1[4];
          if (v13)
          {
            v14 = [*(id *)(*((void *)&v22 + 1) + 8 * v11) filename];
            v15 = [v14 stringByAddingPercentEncodingWithAllowedCharacters:a1[5]];
            [v7 appendFormat:@"&%@=%@", v13, v15];
          }
          uint64_t v16 = a1[6];
          id v17 = [v12 data];
          id v18 = [v17 base64EncodedStringWithOptions:0];
          [v7 appendFormat:@"&%@=%@", v16, v18];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v9);
    }

    (*(void (**)(void))(a1[7] + 16))();
    id v6 = v19;
    id v5 = v20;
  }
  else
  {
    (*(void (**)(void))(a1[7] + 16))();
  }
}

- (BOOL)skipURLEncoding
{
  return 1;
}

- (BOOL)supportsMultipleItems
{
  v2 = [(ICContentMapping *)self definition];
  v3 = [v2 objectForKey:@"SupportsMultipleItems"];
  char v4 = [v3 BOOLValue];

  return v4;
}

@end