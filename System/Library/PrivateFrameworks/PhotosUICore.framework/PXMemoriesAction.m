@interface PXMemoriesAction
- (PXMemoriesAction)initWithMemories:(id)a3;
- (id)collections;
- (void)performMemoryChanges:(id)a3 completionHandler:(id)a4;
@end

@implementation PXMemoriesAction

- (void).cxx_destruct
{
}

- (id)collections
{
  return self->_collections;
}

- (void)performMemoryChanges:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__PXMemoriesAction_performMemoryChanges_completionHandler___block_invoke;
  v8[3] = &unk_1E5DD3280;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(PXPhotosAction *)self performChanges:v8 completionHandler:a4];
}

void __59__PXMemoriesAction_performMemoryChanges_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "collections", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        v8 = [MEMORY[0x1E4F39170] changeRequestForMemory:v7];
        uint64_t v9 = *(void *)(a1 + 40);
        v10 = [v7 localIdentifier];
        (*(void (**)(uint64_t, void *, void *))(v9 + 16))(v9, v8, v10);
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

- (PXMemoriesAction)initWithMemories:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 firstObject];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 photoLibrary];
    v13.receiver = self;
    v13.super_class = (Class)PXMemoriesAction;
    v8 = [(PXPhotosAction *)&v13 initWithPhotoLibrary:v7];

    if (v8)
    {
      uint64_t v9 = [v4 copy];
      collections = v8->_collections;
      v8->_collections = (PXFastEnumeration *)v9;
    }
    self = v8;
    long long v11 = self;
  }
  else
  {
    long long v11 = 0;
  }

  return v11;
}

@end