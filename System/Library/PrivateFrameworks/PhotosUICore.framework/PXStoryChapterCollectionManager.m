@interface PXStoryChapterCollectionManager
- (BOOL)applyEditTransaction:(id)a3 error:(id *)a4;
- (NSMutableArray)pendingEdits;
- (PXStoryChapterCollection)chapterCollection;
- (PXStoryChapterCollectionManager)init;
- (PXStoryChapterCollectionManager)initWithChapterCollection:(id)a3;
- (id)pendingCompletionHandler;
- (void)deleteAllChapters;
- (void)deleteChapterWithIdentifier:(id)a3;
- (void)didPerformChanges;
- (void)editChapterWithIdentifier:(id)a3 changeRequest:(id)a4;
- (void)insertChapterWithFirstAsset:(id)a3 configuration:(id)a4;
- (void)performChanges:(id)a3 completionHandler:(id)a4;
- (void)setChapterCollection:(id)a3;
- (void)setPendingCompletionHandler:(id)a3;
- (void)setPendingEdits:(id)a3;
@end

@implementation PXStoryChapterCollectionManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingEdits, 0);
  objc_storeStrong(&self->_pendingCompletionHandler, 0);
  objc_storeStrong((id *)&self->_chapterCollection, 0);
}

- (void)setPendingEdits:(id)a3
{
}

- (NSMutableArray)pendingEdits
{
  return self->_pendingEdits;
}

- (void)setPendingCompletionHandler:(id)a3
{
}

- (id)pendingCompletionHandler
{
  return self->_pendingCompletionHandler;
}

- (PXStoryChapterCollection)chapterCollection
{
  return self->_chapterCollection;
}

- (void)deleteAllChapters
{
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v3 = [(PXStoryChapterCollectionManager *)self chapterCollection];
  uint64_t v4 = [v3 numberOfChapters];

  if (v4 >= 1)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      v6 = [(PXStoryChapterCollectionManager *)self chapterCollection];
      v7 = [v6 chapterAtIndex:i];

      v8 = [PXStoryConcreteChapterCollectionChapterDeletion alloc];
      v9 = [v7 identifier];
      v10 = [(PXStoryConcreteChapterCollectionChapterDeletion *)v8 initWithDeletedChapterIdentifier:v9];

      [v12 addObject:v10];
    }
  }
  v11 = [(PXStoryChapterCollectionManager *)self pendingEdits];
  [v11 addObjectsFromArray:v12];
}

- (void)deleteChapterWithIdentifier:(id)a3
{
  id v4 = a3;
  id v6 = [(PXStoryChapterCollectionManager *)self pendingEdits];
  v5 = [[PXStoryConcreteChapterCollectionChapterDeletion alloc] initWithDeletedChapterIdentifier:v4];

  [v6 addObject:v5];
}

- (void)insertChapterWithFirstAsset:(id)a3 configuration:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(PXStoryChapterCollectionManager *)self pendingEdits];
  v8 = [[PXStoryConcreteChapterCollectionChapterInsertion alloc] initWithFirstAsset:v7 chapterConfiguration:v6];

  [v9 addObject:v8];
}

- (void)editChapterWithIdentifier:(id)a3 changeRequest:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(PXStoryChapterCollectionManager *)self pendingEdits];
  v8 = [[PXStoryConcreteChapterCollectionChapterModification alloc] initWithEditedChapterIdentifier:v7 chapterChangeRequest:v6];

  [v9 addObject:v8];
}

- (void)setChapterCollection:(id)a3
{
  v5 = (PXStoryChapterCollection *)a3;
  if (self->_chapterCollection != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_chapterCollection, a3);
    [(PXStoryChapterCollectionManager *)self signalChange:1];
    v5 = v6;
  }
}

- (BOOL)applyEditTransaction:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    v5 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F28228];
    id v6 = [NSString alloc];
    id v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    id v9 = (void *)[v6 initWithFormat:@"Method %s is a responsibility of subclass %@", "-[PXStoryChapterCollectionManager applyEditTransaction:error:]", v8];
    v13[0] = v9;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    *a4 = [v5 errorWithDomain:@"PXStoryChapterCollectionManagerErrorDomain" code:1 userInfo:v10];
  }
  return 0;
}

- (void)didPerformChanges
{
  v13.receiver = self;
  v13.super_class = (Class)PXStoryChapterCollectionManager;
  [(PXStoryChapterCollectionManager *)&v13 didPerformChanges];
  v3 = [(PXStoryChapterCollectionManager *)self pendingEdits];
  id v4 = (void *)[v3 copy];

  v5 = [(PXStoryChapterCollectionManager *)self pendingEdits];
  [v5 removeAllObjects];

  if ([v4 count])
  {
    id v6 = [PXStoryConcreteChapterCollectionEditTransaction alloc];
    id v7 = [(PXStoryChapterCollectionManager *)self chapterCollection];
    v8 = [(PXStoryConcreteChapterCollectionEditTransaction *)v6 initWithOriginalChapterCollection:v7 edits:v4];

    id v12 = 0;
    BOOL v9 = [(PXStoryChapterCollectionManager *)self applyEditTransaction:v8 error:&v12];
    id v10 = v12;
  }
  else
  {
    id v10 = 0;
    BOOL v9 = 1;
  }
  v11 = [(PXStoryChapterCollectionManager *)self pendingCompletionHandler];
  if (v11)
  {
    [(PXStoryChapterCollectionManager *)self setPendingCompletionHandler:0];
    ((void (**)(void, BOOL, id))v11)[2](v11, v9, v10);
  }
}

- (void)performChanges:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__PXStoryChapterCollectionManager_performChanges_completionHandler___block_invoke;
  v10[3] = &unk_1E5DBF0F0;
  v10[4] = self;
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  [(PXStoryChapterCollectionManager *)self performChanges:v10];
}

uint64_t __68__PXStoryChapterCollectionManager_performChanges_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (*(void *)(a1 + 40))
  {
    v5 = [*(id *)(a1 + 32) pendingCompletionHandler];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __68__PXStoryChapterCollectionManager_performChanges_completionHandler___block_invoke_2;
    v9[3] = &unk_1E5DBF0C8;
    id v10 = v5;
    id v11 = *(id *)(a1 + 40);
    id v6 = *(void **)(a1 + 32);
    id v7 = v5;
    [v6 setPendingCompletionHandler:v9];
  }
  return (*(uint64_t (**)(void, void, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 32), a3, a4);
}

void __68__PXStoryChapterCollectionManager_performChanges_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = v5;
  if (v6) {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v5);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (PXStoryChapterCollectionManager)initWithChapterCollection:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXStoryChapterCollectionManager;
  uint64_t v6 = [(PXStoryChapterCollectionManager *)&v11 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_chapterCollection, a3);
    id v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    pendingEdits = v7->_pendingEdits;
    v7->_pendingEdits = v8;
  }
  return v7;
}

- (PXStoryChapterCollectionManager)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryChapterCollectionManager.m", 35, @"%s is not available as initializer", "-[PXStoryChapterCollectionManager init]");

  abort();
}

@end