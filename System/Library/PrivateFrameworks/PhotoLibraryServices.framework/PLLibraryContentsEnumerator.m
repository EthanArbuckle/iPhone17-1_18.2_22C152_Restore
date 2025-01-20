@interface PLLibraryContentsEnumerator
- (BOOL)concurrent;
- (BOOL)processObjectsWithError:(id *)a3;
- (NSManagedObjectContext)sourceContext;
- (PLLibraryContentsEnumerator)initWithSourceManagedObjectContext:(id)a3 concurrent:(BOOL)a4;
- (id)_setupAlbumController;
- (id)_setupAssetResourceFaceController;
- (id)_setupConversationController;
- (id)_setupPersonController;
- (void)addAlbumVisitor:(id)a3;
- (void)addAssetVisitor:(id)a3;
- (void)addConversationVisitor:(id)a3;
- (void)addEndOfListVisitor:(id)a3;
- (void)addFaceVisitor:(id)a3;
- (void)addPersonVisitor:(id)a3;
- (void)addResourceVisitor:(id)a3;
@end

@implementation PLLibraryContentsEnumerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceContext, 0);
  objc_storeStrong((id *)&self->_endOfListHandlerBlocks, 0);
  objc_storeStrong((id *)&self->_personHandlerBlocks, 0);
  objc_storeStrong((id *)&self->_faceHandlerBlocks, 0);
  objc_storeStrong((id *)&self->_conversationHandlerBlocks, 0);
  objc_storeStrong((id *)&self->_resourceHandlerBlocks, 0);
  objc_storeStrong((id *)&self->_albumHandlerBlocks, 0);
  objc_storeStrong((id *)&self->_assetHandlerBlocks, 0);
}

- (BOOL)concurrent
{
  return self->_concurrent;
}

- (NSManagedObjectContext)sourceContext
{
  return self->_sourceContext;
}

- (BOOL)processObjectsWithError:(id *)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableArray *)self->_conversationHandlerBlocks count])
  {
    v5 = [(PLLibraryContentsEnumerator *)self _setupConversationController];
  }
  else
  {
    v5 = 0;
  }
  if ([(NSMutableArray *)self->_assetHandlerBlocks count]
    || [(NSMutableArray *)self->_resourceHandlerBlocks count]
    || [(NSMutableArray *)self->_faceHandlerBlocks count])
  {
    v6 = [(PLLibraryContentsEnumerator *)self _setupAssetResourceFaceController];
  }
  else
  {
    v6 = 0;
  }
  if ([(NSMutableArray *)self->_albumHandlerBlocks count])
  {
    v7 = [(PLLibraryContentsEnumerator *)self _setupAlbumController];
    if (v5) {
      goto LABEL_15;
    }
  }
  else
  {
    v7 = 0;
    if (v5) {
      goto LABEL_15;
    }
  }
  if (!v6 && !v7)
  {
    LOBYTE(v8) = 1;
    goto LABEL_37;
  }
LABEL_15:
  v9 = [MEMORY[0x1E4F1C9C8] date];
  if (!v5)
  {
    v11 = 0;
    id v10 = 0;
    int v8 = 1;
LABEL_19:
    if (v6)
    {
      id v31 = v10;
      int v8 = [v6 processObjectsWithError:&v31];
      id v12 = v31;

      v11 = @"PLLibraryContentsEnumerator";
      id v10 = v12;
    }
    goto LABEL_21;
  }
  id v32 = 0;
  int v8 = [v5 processObjectsWithError:&v32];
  id v10 = v32;
  v11 = @"PLConversationEnumerator";
  if (v8) {
    goto LABEL_19;
  }
LABEL_21:
  v25 = a3;
  if (v8 && v7)
  {
    id v30 = v10;
    LOBYTE(v8) = [v7 processObjectsWithError:&v30];
    id v13 = v30;

    v24 = @"PLLibraryContentsAlbumEnumerator";
    id v10 = v13;
  }
  else
  {
    v24 = v11;
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v14 = self->_endOfListHandlerBlocks;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v26 objects:v37 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v27 != v17) {
          objc_enumerationMutation(v14);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v26 + 1) + 8 * i) + 16))();
      }
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v26 objects:v37 count:16];
    }
    while (v16);
  }

  v19 = [MEMORY[0x1E4F1C9C8] date];
  [v19 timeIntervalSinceDate:v9];
  uint64_t v21 = v20;

  v22 = PLBackendGetLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v34 = v24;
    __int16 v35 = 2048;
    uint64_t v36 = v21;
    _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_DEFAULT, "%@ enumerator duration: %g", buf, 0x16u);
  }

  if (v25) {
    id *v25 = v10;
  }

LABEL_37:
  return v8;
}

- (id)_setupPersonController
{
  v24[1] = *MEMORY[0x1E4F143B8];
  v3 = NSString;
  v4 = [(NSManagedObjectContext *)self->_sourceContext name];
  v5 = [v3 stringWithFormat:@"%@-PersonEnumerator", v4];

  v6 = (void *)MEMORY[0x1E4F1C0D0];
  v7 = +[PLPerson entityName];
  int v8 = [v6 fetchRequestWithEntityName:v7];

  v24[0] = @"userFeedbacks";
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
  [v8 setRelationshipKeyPathsForPrefetching:v9];

  id v10 = [(PLLibraryContentsEnumerator *)self sourceContext];
  v11 = [v10 transactionAuthor];

  id v12 = [PLEnumerateAndSaveController alloc];
  sourceContext = self->_sourceContext;
  v14 = [(NSManagedObjectContext *)sourceContext pathManager];
  BOOL concurrent = self->_concurrent;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __53__PLLibraryContentsEnumerator__setupPersonController__block_invoke;
  v21[3] = &unk_1E5871B18;
  v21[4] = self;
  id v22 = v5;
  id v23 = v11;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __53__PLLibraryContentsEnumerator__setupPersonController__block_invoke_2;
  v20[3] = &unk_1E5871BB8;
  v20[4] = self;
  id v16 = v11;
  id v17 = v5;
  v18 = [(PLEnumerateAndSaveController *)v12 initWithName:v17 fetchRequest:v8 context:sourceContext pathManager:v14 concurrent:concurrent refreshAllAfterSave:1 generateContextBlock:v21 didFetchObjectIDsBlock:0 processResultBlock:v20];

  return v18;
}

id __53__PLLibraryContentsEnumerator__setupPersonController__block_invoke(uint64_t a1)
{
  return CreatePrivateQueueMOC(*(void **)(*(void *)(a1 + 32) + 64), *(void **)(a1 + 40), *(void **)(a1 + 48));
}

void __53__PLLibraryContentsEnumerator__setupPersonController__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = *(id *)(*(void *)(a1 + 32) + 48);
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
        (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * v9) + 16))(*(void *)(*((void *)&v10 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)_setupConversationController
{
  v24[1] = *MEMORY[0x1E4F143B8];
  v3 = NSString;
  id v4 = [(NSManagedObjectContext *)self->_sourceContext name];
  id v5 = [v3 stringWithFormat:@"%@-ConversationEnumerator", v4];

  uint64_t v6 = (void *)MEMORY[0x1E4F1C0D0];
  uint64_t v7 = +[PLConversation entityName];
  uint64_t v8 = [v6 fetchRequestWithEntityName:v7];

  v24[0] = @"assets";
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
  [v8 setRelationshipKeyPathsForPrefetching:v9];

  long long v10 = [(PLLibraryContentsEnumerator *)self sourceContext];
  long long v11 = [v10 transactionAuthor];

  long long v12 = [PLEnumerateAndSaveController alloc];
  sourceContext = self->_sourceContext;
  v14 = [(NSManagedObjectContext *)sourceContext pathManager];
  BOOL concurrent = self->_concurrent;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __59__PLLibraryContentsEnumerator__setupConversationController__block_invoke;
  v21[3] = &unk_1E5871B18;
  v21[4] = self;
  id v22 = v5;
  id v23 = v11;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __59__PLLibraryContentsEnumerator__setupConversationController__block_invoke_2;
  v20[3] = &unk_1E5871B90;
  v20[4] = self;
  id v16 = v11;
  id v17 = v5;
  v18 = [(PLEnumerateAndSaveController *)v12 initWithName:v17 fetchRequest:v8 context:sourceContext pathManager:v14 concurrent:concurrent refreshAllAfterSave:1 generateContextBlock:v21 didFetchObjectIDsBlock:0 processResultBlock:v20];

  return v18;
}

id __59__PLLibraryContentsEnumerator__setupConversationController__block_invoke(uint64_t a1)
{
  return CreatePrivateQueueMOC(*(void **)(*(void *)(a1 + 32) + 64), *(void **)(a1 + 40), *(void **)(a1 + 48));
}

void __59__PLLibraryContentsEnumerator__setupConversationController__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *(id *)(*(void *)(a1 + 32) + 32);
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
        (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * v9) + 16))(*(void *)(*((void *)&v10 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)_setupAlbumController
{
  v3 = NSString;
  id v4 = [(NSManagedObjectContext *)self->_sourceContext name];
  id v5 = [v3 stringWithFormat:@"%@-ManagedAlbumEnumerator", v4];

  uint64_t v6 = (void *)MEMORY[0x1E4F1C0D0];
  uint64_t v7 = +[PLManagedAlbum entityName];
  uint64_t v8 = [v6 fetchRequestWithEntityName:v7];

  uint64_t v9 = [(PLLibraryContentsEnumerator *)self sourceContext];
  long long v10 = [v9 transactionAuthor];

  long long v11 = [PLEnumerateAndSaveController alloc];
  sourceContext = self->_sourceContext;
  long long v13 = [(NSManagedObjectContext *)sourceContext pathManager];
  BOOL concurrent = self->_concurrent;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __52__PLLibraryContentsEnumerator__setupAlbumController__block_invoke;
  v20[3] = &unk_1E5871B18;
  v20[4] = self;
  id v21 = v5;
  id v22 = v10;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __52__PLLibraryContentsEnumerator__setupAlbumController__block_invoke_2;
  v19[3] = &unk_1E5871B68;
  v19[4] = self;
  id v15 = v10;
  id v16 = v5;
  id v17 = [(PLEnumerateAndSaveController *)v11 initWithName:v16 fetchRequest:v8 context:sourceContext pathManager:v13 concurrent:concurrent refreshAllAfterSave:1 generateContextBlock:v20 didFetchObjectIDsBlock:0 processResultBlock:v19];

  return v17;
}

id __52__PLLibraryContentsEnumerator__setupAlbumController__block_invoke(uint64_t a1)
{
  return CreatePrivateQueueMOC(*(void **)(*(void *)(a1 + 32) + 64), *(void **)(a1 + 40), *(void **)(a1 + 48));
}

void __52__PLLibraryContentsEnumerator__setupAlbumController__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *(id *)(*(void *)(a1 + 32) + 16);
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
        (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * v9) + 16))(*(void *)(*((void *)&v10 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)_setupAssetResourceFaceController
{
  v24[4] = *MEMORY[0x1E4F143B8];
  v3 = NSString;
  id v4 = [(NSManagedObjectContext *)self->_sourceContext name];
  id v5 = [v3 stringWithFormat:@"%@-AssetResourceFaceEnumerator", v4];

  uint64_t v6 = (void *)MEMORY[0x1E4F1C0D0];
  uint64_t v7 = +[PLManagedAsset entityName];
  uint64_t v8 = [v6 fetchRequestWithEntityName:v7];

  v24[0] = @"additionalAttributes";
  v24[1] = @"modernResources";
  void v24[2] = @"detectedFaces";
  v24[3] = @"extendedAttributes";
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:4];
  [v8 setRelationshipKeyPathsForPrefetching:v9];

  long long v10 = [(PLLibraryContentsEnumerator *)self sourceContext];
  long long v11 = [v10 transactionAuthor];

  long long v12 = [PLEnumerateAndSaveController alloc];
  sourceContext = self->_sourceContext;
  v14 = [(NSManagedObjectContext *)sourceContext pathManager];
  BOOL concurrent = self->_concurrent;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __64__PLLibraryContentsEnumerator__setupAssetResourceFaceController__block_invoke;
  v21[3] = &unk_1E5871B18;
  v21[4] = self;
  id v22 = v5;
  id v23 = v11;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __64__PLLibraryContentsEnumerator__setupAssetResourceFaceController__block_invoke_2;
  v20[3] = &unk_1E5871B40;
  v20[4] = self;
  id v16 = v11;
  id v17 = v5;
  v18 = [(PLEnumerateAndSaveController *)v12 initWithName:v17 fetchRequest:v8 context:sourceContext pathManager:v14 concurrent:concurrent refreshAllAfterSave:1 generateContextBlock:v21 didFetchObjectIDsBlock:0 processResultBlock:v20];

  return v18;
}

id __64__PLLibraryContentsEnumerator__setupAssetResourceFaceController__block_invoke(uint64_t a1)
{
  return CreatePrivateQueueMOC(*(void **)(*(void *)(a1 + 32) + 64), *(void **)(a1 + 40), *(void **)(a1 + 48));
}

void __64__PLLibraryContentsEnumerator__setupAssetResourceFaceController__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v5 = *(id *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v46 objects:v54 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v47;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v47 != v8) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v46 + 1) + 8 * v9++) + 16))();
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v46 objects:v54 count:16];
    }
    while (v7);
  }

  if ([*(id *)(*(void *)(a1 + 32) + 24) count])
  {
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id obj = [v4 modernResources];
    uint64_t v10 = [obj countByEnumeratingWithState:&v42 objects:v53 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v43;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v43 != v12) {
            objc_enumerationMutation(obj);
          }
          long long v40 = 0u;
          long long v41 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          id v14 = *(id *)(*(void *)(a1 + 32) + 24);
          uint64_t v15 = [v14 countByEnumeratingWithState:&v38 objects:v52 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v39;
            do
            {
              uint64_t v18 = 0;
              do
              {
                if (*(void *)v39 != v17) {
                  objc_enumerationMutation(v14);
                }
                (*(void (**)(void))(*(void *)(*((void *)&v38 + 1) + 8 * v18++) + 16))();
              }
              while (v16 != v18);
              uint64_t v16 = [v14 countByEnumeratingWithState:&v38 objects:v52 count:16];
            }
            while (v16);
          }

          ++v13;
        }
        while (v13 != v11);
        uint64_t v11 = [obj countByEnumeratingWithState:&v42 objects:v53 count:16];
      }
      while (v11);
    }
  }
  if ([*(id *)(*(void *)(a1 + 32) + 40) count])
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id obja = [v4 detectedFaces];
    uint64_t v19 = [obja countByEnumeratingWithState:&v34 objects:v51 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v35;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v35 != v21) {
            objc_enumerationMutation(obja);
          }
          long long v32 = 0u;
          long long v33 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          id v23 = *(id *)(*(void *)(a1 + 32) + 40);
          uint64_t v24 = [v23 countByEnumeratingWithState:&v30 objects:v50 count:16];
          if (v24)
          {
            uint64_t v25 = v24;
            uint64_t v26 = *(void *)v31;
            do
            {
              uint64_t v27 = 0;
              do
              {
                if (*(void *)v31 != v26) {
                  objc_enumerationMutation(v23);
                }
                (*(void (**)(void))(*(void *)(*((void *)&v30 + 1) + 8 * v27++) + 16))();
              }
              while (v25 != v27);
              uint64_t v25 = [v23 countByEnumeratingWithState:&v30 objects:v50 count:16];
            }
            while (v25);
          }

          ++v22;
        }
        while (v22 != v20);
        uint64_t v20 = [obja countByEnumeratingWithState:&v34 objects:v51 count:16];
      }
      while (v20);
    }
  }
}

- (void)addEndOfListVisitor:(id)a3
{
  id v8 = a3;
  if (!v8)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PLLibraryContentsEnumerator.m", 100, @"Invalid parameter not satisfying: %@", @"endOfListHandler" object file lineNumber description];
  }
  endOfListHandlerBlocks = self->_endOfListHandlerBlocks;
  uint64_t v6 = (void *)MEMORY[0x19F38D650]();
  [(NSMutableArray *)endOfListHandlerBlocks addObject:v6];
}

- (void)addPersonVisitor:(id)a3
{
  id v8 = a3;
  if (!v8)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PLLibraryContentsEnumerator.m", 95, @"Invalid parameter not satisfying: %@", @"personHandler" object file lineNumber description];
  }
  personHandlerBlocks = self->_personHandlerBlocks;
  uint64_t v6 = (void *)MEMORY[0x19F38D650]();
  [(NSMutableArray *)personHandlerBlocks addObject:v6];
}

- (void)addFaceVisitor:(id)a3
{
  id v8 = a3;
  if (!v8)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PLLibraryContentsEnumerator.m", 90, @"Invalid parameter not satisfying: %@", @"faceHandler" object file lineNumber description];
  }
  faceHandlerBlocks = self->_faceHandlerBlocks;
  uint64_t v6 = (void *)MEMORY[0x19F38D650]();
  [(NSMutableArray *)faceHandlerBlocks addObject:v6];
}

- (void)addConversationVisitor:(id)a3
{
  id v8 = a3;
  if (!v8)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PLLibraryContentsEnumerator.m", 85, @"Invalid parameter not satisfying: %@", @"conversationHandler" object file lineNumber description];
  }
  conversationHandlerBlocks = self->_conversationHandlerBlocks;
  uint64_t v6 = (void *)MEMORY[0x19F38D650]();
  [(NSMutableArray *)conversationHandlerBlocks addObject:v6];
}

- (void)addResourceVisitor:(id)a3
{
  id v8 = a3;
  if (!v8)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PLLibraryContentsEnumerator.m", 80, @"Invalid parameter not satisfying: %@", @"resourceHandler" object file lineNumber description];
  }
  resourceHandlerBlocks = self->_resourceHandlerBlocks;
  uint64_t v6 = (void *)MEMORY[0x19F38D650]();
  [(NSMutableArray *)resourceHandlerBlocks addObject:v6];
}

- (void)addAlbumVisitor:(id)a3
{
  id v8 = a3;
  if (!v8)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PLLibraryContentsEnumerator.m", 75, @"Invalid parameter not satisfying: %@", @"albumHandler" object file lineNumber description];
  }
  albumHandlerBlocks = self->_albumHandlerBlocks;
  uint64_t v6 = (void *)MEMORY[0x19F38D650]();
  [(NSMutableArray *)albumHandlerBlocks addObject:v6];
}

- (void)addAssetVisitor:(id)a3
{
  id v8 = a3;
  if (!v8)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PLLibraryContentsEnumerator.m", 70, @"Invalid parameter not satisfying: %@", @"assetHandler" object file lineNumber description];
  }
  assetHandlerBlocks = self->_assetHandlerBlocks;
  uint64_t v6 = (void *)MEMORY[0x19F38D650]();
  [(NSMutableArray *)assetHandlerBlocks addObject:v6];
}

- (PLLibraryContentsEnumerator)initWithSourceManagedObjectContext:(id)a3 concurrent:(BOOL)a4
{
  id v8 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PLLibraryContentsEnumerator;
  uint64_t v9 = [(PLLibraryContentsEnumerator *)&v26 init];
  if (v9)
  {
    if (!v8)
    {
      uint64_t v25 = [MEMORY[0x1E4F28B00] currentHandler];
      [v25 handleFailureInMethod:a2, v9, @"PLLibraryContentsEnumerator.m", 53, @"Invalid parameter not satisfying: %@", @"sourceContext" object file lineNumber description];
    }
    objc_storeStrong((id *)&v9->_sourceContext, a3);
    uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
    assetHandlerBlocks = v9->_assetHandlerBlocks;
    v9->_assetHandlerBlocks = (NSMutableArray *)v10;

    uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
    albumHandlerBlocks = v9->_albumHandlerBlocks;
    v9->_albumHandlerBlocks = (NSMutableArray *)v12;

    uint64_t v14 = [MEMORY[0x1E4F1CA48] array];
    resourceHandlerBlocks = v9->_resourceHandlerBlocks;
    v9->_resourceHandlerBlocks = (NSMutableArray *)v14;

    uint64_t v16 = [MEMORY[0x1E4F1CA48] array];
    conversationHandlerBlocks = v9->_conversationHandlerBlocks;
    v9->_conversationHandlerBlocks = (NSMutableArray *)v16;

    uint64_t v18 = [MEMORY[0x1E4F1CA48] array];
    faceHandlerBlocks = v9->_faceHandlerBlocks;
    v9->_faceHandlerBlocks = (NSMutableArray *)v18;

    uint64_t v20 = [MEMORY[0x1E4F1CA48] array];
    personHandlerBlocks = v9->_personHandlerBlocks;
    v9->_personHandlerBlocks = (NSMutableArray *)v20;

    uint64_t v22 = [MEMORY[0x1E4F1CA48] array];
    endOfListHandlerBlocks = v9->_endOfListHandlerBlocks;
    v9->_endOfListHandlerBlocks = (NSMutableArray *)v22;

    v9->_BOOL concurrent = a4;
  }

  return v9;
}

@end