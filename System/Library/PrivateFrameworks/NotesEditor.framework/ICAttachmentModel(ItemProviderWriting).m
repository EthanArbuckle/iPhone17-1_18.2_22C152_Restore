@interface ICAttachmentModel(ItemProviderWriting)
+ (id)writableTypeIdentifiersForItemProvider;
- (id)itemProviderIdentifier;
- (id)itemProviderUTI;
- (id)itemProviderWritingData;
- (id)itemProviderWritingURL;
- (id)writableTypeIdentifiersForItemProvider;
- (uint64_t)itemProviderType;
- (uint64_t)itemProviderVisibilityForRepresentationWithTypeIdentifier:()ItemProviderWriting;
- (uint64_t)loadDataWithTypeIdentifier:()ItemProviderWriting forItemProviderCompletionHandler:;
- (void)registerFileLoadHandlersOnItemProvider:()ItemProviderWriting;
@end

@implementation ICAttachmentModel(ItemProviderWriting)

- (id)itemProviderIdentifier
{
  v1 = [a1 attachment];
  v2 = [v1 identifier];

  return v2;
}

- (uint64_t)itemProviderType
{
  return 3;
}

+ (id)writableTypeIdentifiersForItemProvider
{
  v2[1] = *MEMORY[0x263EF8340];
  v2[0] = *MEMORY[0x263F5AA90];
  v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:1];

  return v0;
}

- (id)writableTypeIdentifiersForItemProvider
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v1 = [a1 itemProviderUTI];
  v2 = (void *)v1;
  if (v1)
  {
    uint64_t v9 = *MEMORY[0x263F5AA90];
    uint64_t v10 = v1;
    v3 = (void *)MEMORY[0x263EFF8C0];
    v4 = &v9;
    uint64_t v5 = 2;
  }
  else
  {
    uint64_t v8 = *MEMORY[0x263F5AA90];
    v3 = (void *)MEMORY[0x263EFF8C0];
    v4 = &v8;
    uint64_t v5 = 1;
  }
  v6 = objc_msgSend(v3, "arrayWithObjects:count:", v4, v5, v8, v9, v10);

  return v6;
}

- (uint64_t)itemProviderVisibilityForRepresentationWithTypeIdentifier:()ItemProviderWriting
{
  if ([a3 isEqual:*MEMORY[0x263F5AA90]]) {
    return 3;
  }
  else {
    return 0;
  }
}

- (id)itemProviderUTI
{
  uint64_t v1 = [a1 attachment];
  v2 = [v1 typeUTI];

  return v2;
}

- (id)itemProviderWritingURL
{
  v2 = [a1 attachment];
  v3 = [v2 media];
  if ([v3 hasFile])
  {
    v4 = [a1 attachment];
    uint64_t v5 = [v4 media];
    v6 = [v5 mediaURL];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)itemProviderWritingData
{
  v2 = [a1 attachment];
  if ([v2 isPasswordProtected])
  {
    v3 = [v2 media];
    uint64_t v4 = [v3 decryptedData];
LABEL_5:
    uint64_t v5 = (void *)v4;
    goto LABEL_7;
  }
  v3 = [a1 itemProviderWritingURL];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v3 options:1 error:0];
    goto LABEL_5;
  }
  uint64_t v5 = 0;
LABEL_7:

  return v5;
}

- (void)registerFileLoadHandlersOnItemProvider:()ItemProviderWriting
{
  id v4 = a3;
  uint64_t v5 = [a1 attachment];
  v6 = [v5 media];
  if ([v6 hasFile])
  {
    v7 = [a1 attachment];
    char v8 = [v7 isPasswordProtected];

    if ((v8 & 1) == 0)
    {
      uint64_t v9 = [a1 attachment];
      uint64_t v10 = [v9 objectID];

      uint64_t v11 = [a1 attachment];
      v12 = [v11 typeUTI];
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __81__ICAttachmentModel_ItemProviderWriting__registerFileLoadHandlersOnItemProvider___block_invoke;
      v14[3] = &unk_2640B8190;
      id v15 = v10;
      id v13 = v10;
      [v4 registerFileRepresentationForTypeIdentifier:v12 fileOptions:0 visibility:0 loadHandler:v14];
    }
  }
  else
  {
  }
}

- (uint64_t)loadDataWithTypeIdentifier:()ItemProviderWriting forItemProviderCompletionHandler:
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [a1 attachment];
  uint64_t v9 = [v8 objectID];

  uint64_t v10 = [MEMORY[0x263F5ACA0] sharedContext];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __102__ICAttachmentModel_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke;
  v15[3] = &unk_2640B81B8;
  id v16 = v9;
  id v17 = v6;
  id v18 = v7;
  id v11 = v7;
  id v12 = v6;
  id v13 = v9;
  [v10 performBackgroundTask:v15];

  return 0;
}

@end