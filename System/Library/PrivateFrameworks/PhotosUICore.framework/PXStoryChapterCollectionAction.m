@interface PXStoryChapterCollectionAction
- (NSArray)edits;
- (NSArray)originalChapters;
- (PXStoryChapterCollectionAction)init;
- (PXStoryChapterCollectionAction)initWithChapterCollectionManager:(id)a3 deleteChapterWithIdentifier:(id)a4;
- (PXStoryChapterCollectionAction)initWithChapterCollectionManager:(id)a3 editChapterWithIdentifier:(id)a4 changeRequest:(id)a5;
- (PXStoryChapterCollectionAction)initWithChapterCollectionManager:(id)a3 edits:(id)a4;
- (PXStoryChapterCollectionAction)initWithChapterCollectionManager:(id)a3 insertChapterWithFirstAsset:(id)a4 configuration:(id)a5;
- (PXStoryChapterCollectionManager)chapterCollectionManager;
- (void)performAction:(id)a3;
- (void)performUndo:(id)a3;
@end

@implementation PXStoryChapterCollectionAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalChapters, 0);
  objc_storeStrong((id *)&self->_edits, 0);
  objc_storeStrong((id *)&self->_chapterCollectionManager, 0);
}

- (NSArray)originalChapters
{
  return self->_originalChapters;
}

- (NSArray)edits
{
  return self->_edits;
}

- (PXStoryChapterCollectionManager)chapterCollectionManager
{
  return self->_chapterCollectionManager;
}

- (void)performUndo:(id)a3
{
  id v4 = a3;
  v5 = [(PXStoryChapterCollectionAction *)self chapterCollectionManager];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__PXStoryChapterCollectionAction_performUndo___block_invoke;
  v6[3] = &unk_1E5DB6820;
  v6[4] = self;
  [v5 performChanges:v6 completionHandler:v4];
}

void __46__PXStoryChapterCollectionAction_performUndo___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [*(id *)(a1 + 32) originalChapters];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        v10 = [v9 identifier];
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __46__PXStoryChapterCollectionAction_performUndo___block_invoke_2;
        v11[3] = &unk_1E5DB67F8;
        v11[4] = v9;
        [v3 editChapterWithIdentifier:v10 changeRequest:v11];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

void __46__PXStoryChapterCollectionAction_performUndo___block_invoke_2(uint64_t a1, void *a2)
{
}

- (void)performAction:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(PXStoryChapterCollectionAction *)self chapterCollectionManager];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__PXStoryChapterCollectionAction_performAction___block_invoke;
  v7[3] = &unk_1E5DB67D0;
  v7[4] = self;
  v7[5] = a2;
  [v6 performChanges:v7 completionHandler:v5];
}

void __48__PXStoryChapterCollectionAction_performAction___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = objc_msgSend(*(id *)(a1 + 32), "edits", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        switch([v9 kind])
        {
          case 0:
            long long v14 = [MEMORY[0x1E4F28B00] currentHandler];
            [v14 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"PXStoryChapterCollectionAction.m" lineNumber:92 description:@"Code which should be unreachable has been reached"];

            abort();
          case 1:
            id v10 = v9;
            v11 = [v10 editedChapterIdentifier];
            long long v12 = [v10 chapterChangeRequest];
            [v3 editChapterWithIdentifier:v11 changeRequest:v12];
            goto LABEL_9;
          case 2:
            id v13 = v9;
            v11 = [v13 firstAsset];
            long long v12 = [v13 chapterConfiguration];
            [v3 insertChapterWithFirstAsset:v11 configuration:v12];
LABEL_9:

            goto LABEL_11;
          case 3:
            v11 = [v9 deletedChapterIdentifier];
            [v3 deleteChapterWithIdentifier:v11];
LABEL_11:

            break;
          default:
            continue;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
}

- (PXStoryChapterCollectionAction)initWithChapterCollectionManager:(id)a3 edits:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v37.receiver = self;
  v37.super_class = (Class)PXStoryChapterCollectionAction;
  v9 = [(PXStoryChapterCollectionAction *)&v37 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_chapterCollectionManager, a3);
    uint64_t v11 = [v8 copy];
    edits = v10->_edits;
    v10->_edits = (NSArray *)v11;

    id v13 = [v7 chapterCollection];
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __73__PXStoryChapterCollectionAction_initWithChapterCollectionManager_edits___block_invoke;
    aBlock[3] = &unk_1E5DB67A8;
    id v29 = v13;
    id v35 = v29;
    id v15 = v14;
    id v36 = v15;
    long long v16 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v17 = v8;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (!v18) {
      goto LABEL_14;
    }
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v31;
    while (1)
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v31 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v23 = objc_msgSend(v22, "kind", v29);
        if (v23 == 3)
        {
          uint64_t v24 = [v22 deletedChapterIdentifier];
        }
        else
        {
          if (v23 != 1) {
            continue;
          }
          uint64_t v24 = [v22 editedChapterIdentifier];
        }
        v25 = (void *)v24;
        v16[2](v16, v24);
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v30 objects:v38 count:16];
      if (!v19)
      {
LABEL_14:

        uint64_t v26 = [v15 copy];
        originalChapters = v10->_originalChapters;
        v10->_originalChapters = (NSArray *)v26;

        break;
      }
    }
  }

  return v10;
}

void __73__PXStoryChapterCollectionAction_initWithChapterCollectionManager_edits___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) indexOfChapterWithIdentifier:a2];
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v4 = *(void **)(a1 + 40);
    id v5 = [*(id *)(a1 + 32) chapterAtIndex:v3];
    [v4 addObject:v5];
  }
}

- (PXStoryChapterCollectionAction)initWithChapterCollectionManager:(id)a3 deleteChapterWithIdentifier:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [[PXStoryConcreteChapterCollectionChapterDeletion alloc] initWithDeletedChapterIdentifier:v6];

  v12[0] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  id v10 = [(PXStoryChapterCollectionAction *)self initWithChapterCollectionManager:v7 edits:v9];

  return v10;
}

- (PXStoryChapterCollectionAction)initWithChapterCollectionManager:(id)a3 insertChapterWithFirstAsset:(id)a4 configuration:(id)a5
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [[PXStoryConcreteChapterCollectionChapterInsertion alloc] initWithFirstAsset:v9 chapterConfiguration:v8];

  v15[0] = v11;
  long long v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  id v13 = [(PXStoryChapterCollectionAction *)self initWithChapterCollectionManager:v10 edits:v12];

  return v13;
}

- (PXStoryChapterCollectionAction)initWithChapterCollectionManager:(id)a3 editChapterWithIdentifier:(id)a4 changeRequest:(id)a5
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [[PXStoryConcreteChapterCollectionChapterModification alloc] initWithEditedChapterIdentifier:v9 chapterChangeRequest:v8];

  v15[0] = v11;
  long long v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  id v13 = [(PXStoryChapterCollectionAction *)self initWithChapterCollectionManager:v10 edits:v12];

  return v13;
}

- (PXStoryChapterCollectionAction)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryChapterCollectionAction.m", 33, @"%s is not available as initializer", "-[PXStoryChapterCollectionAction init]");

  abort();
}

@end