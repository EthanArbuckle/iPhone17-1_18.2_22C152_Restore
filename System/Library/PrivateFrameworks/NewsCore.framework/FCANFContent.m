@interface FCANFContent
- (BOOL)isANFDocumentCached;
- (FCANFContent)initWithIdentifier:(id)a3 mainDocumentAssetHandle:(id)a4 fontResourceIDs:(id)a5;
- (FCAssetHandle)mainDocumentAssetHandle;
- (NSArray)anfDocumentAssetHandles;
- (NSArray)fontResourceIDs;
- (NSString)identifier;
- (id)fetchANFDocumentDataProviderWithCompletion:(id)a3;
- (id)fetchANFDocumentDataProviderWithPriority:(int64_t)a3 completion:(id)a4;
@end

@implementation FCANFContent

- (NSString)identifier
{
  return self->_identifier;
}

- (NSArray)fontResourceIDs
{
  return self->_fontResourceIDs;
}

- (FCANFContent)initWithIdentifier:(id)a3 mainDocumentAssetHandle:(id)a4 fontResourceIDs:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)FCANFContent;
  v11 = [(FCANFContent *)&v18 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    objc_storeStrong((id *)&v11->_mainDocumentAssetHandle, a4);
    uint64_t v14 = [v10 copy];
    v15 = (void *)v14;
    if (v14) {
      v16 = (void *)v14;
    }
    else {
      v16 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong((id *)&v11->_fontResourceIDs, v16);
  }
  return v11;
}

- (id)fetchANFDocumentDataProviderWithPriority:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  v7 = [(FCANFContent *)self mainDocumentAssetHandle];

  if (v7)
  {
    id v8 = [(FCANFContent *)self mainDocumentAssetHandle];
    id v9 = [v8 fetchDataProviderWithPriority:a3 flags:0 completion:v6];
  }
  else
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __68__FCANFContent_fetchANFDocumentDataProviderWithPriority_completion___block_invoke;
    v11[3] = &unk_1E5B567C0;
    v11[4] = self;
    id v12 = v6;
    id v9 = __68__FCANFContent_fetchANFDocumentDataProviderWithPriority_completion___block_invoke((uint64_t)v11);
  }
  return v9;
}

- (FCAssetHandle)mainDocumentAssetHandle
{
  return self->_mainDocumentAssetHandle;
}

- (NSArray)anfDocumentAssetHandles
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __39__FCANFContent_anfDocumentAssetHandles__block_invoke;
  v4[3] = &unk_1E5B4BF30;
  v4[4] = self;
  v2 = objc_msgSend(MEMORY[0x1E4F1C978], "fc_array:", v4);
  return (NSArray *)v2;
}

void __39__FCANFContent_anfDocumentAssetHandles__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 mainDocumentAssetHandle];
  objc_msgSend(v3, "fc_safelyAddObject:", v4);
}

- (BOOL)isANFDocumentCached
{
  v2 = [(FCANFContent *)self mainDocumentAssetHandle];
  id v3 = [v2 dataProvider];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)fetchANFDocumentDataProviderWithCompletion:(id)a3
{
  return [(FCANFContent *)self fetchANFDocumentDataProviderWithPriority:0 completion:a3];
}

uint64_t __68__FCANFContent_fetchANFDocumentDataProviderWithPriority_completion___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 40);
  if (v1)
  {
    id v3 = dispatch_get_global_queue(0, 0);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __68__FCANFContent_fetchANFDocumentDataProviderWithPriority_completion___block_invoke_2;
    v6[3] = &unk_1E5B4C7C0;
    id v4 = v1;
    v6[4] = *(void *)(a1 + 32);
    id v7 = v4;
    dispatch_async(v3, v6);
  }
  return 0;
}

void __68__FCANFContent_fetchANFDocumentDataProviderWithPriority_completion___block_invoke_2(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) identifier];
  id v3 = objc_msgSend(v1, "fc_missingANFDocumentErrorForArticleID:", v4);
  (*(void (**)(uint64_t, void, void *))(v2 + 16))(v2, 0, v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainDocumentAssetHandle, 0);
  objc_storeStrong((id *)&self->_fontResourceIDs, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end