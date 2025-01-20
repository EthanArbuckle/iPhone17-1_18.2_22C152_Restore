@interface PXPhotoKitCollectionListMoveActionPerformer
+ (BOOL)canPerformOnCollectionList:(id)a3;
- (PXPhotoKitCollectionListMoveActionPerformer)initWithActionType:(id)a3 collectionList:(id)a4 parameters:(id)a5;
- (void)performBackgroundTask;
@end

@implementation PXPhotoKitCollectionListMoveActionPerformer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceCollections, 0);
  objc_storeStrong((id *)&self->_collectionList, 0);
}

- (void)performBackgroundTask
{
  v3 = [[PXMoveToCollectionListAction alloc] initWithCollections:self->_sourceCollections targetCollectionList:self->_collectionList];
  v4 = [(PXActionPerformer *)self undoManager];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__PXPhotoKitCollectionListMoveActionPerformer_performBackgroundTask__block_invoke;
  v5[3] = &unk_1E5DD3158;
  v5[4] = self;
  [(PXAction *)v3 executeWithUndoManager:v4 completionHandler:v5];
}

uint64_t __68__PXPhotoKitCollectionListMoveActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) completeBackgroundTaskWithSuccess:a2 error:a3];
}

- (PXPhotoKitCollectionListMoveActionPerformer)initWithActionType:(id)a3 collectionList:(id)a4 parameters:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PXPhotoKitCollectionListMoveActionPerformer;
  v11 = [(PXPhotoKitCollectionListActionPerformer *)&v16 initWithActionType:a3 collectionList:v9 parameters:v10];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_collectionList, a4);
    uint64_t v13 = [v10 objectForKeyedSubscript:*(void *)off_1E5DAAE78];
    sourceCollections = v12->_sourceCollections;
    v12->_sourceCollections = (PXFastEnumeration *)v13;
  }
  return v12;
}

+ (BOOL)canPerformOnCollectionList:(id)a3
{
  return +[PXMoveToCollectionListAction canPerformOnCollection:a3];
}

@end