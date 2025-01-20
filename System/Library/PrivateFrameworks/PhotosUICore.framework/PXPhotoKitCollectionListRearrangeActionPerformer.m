@interface PXPhotoKitCollectionListRearrangeActionPerformer
+ (BOOL)canPerformOnCollectionList:(id)a3;
- (PXPhotoKitCollectionListRearrangeActionPerformer)initWithActionType:(id)a3 collectionList:(id)a4 parameters:(id)a5;
- (void)performBackgroundTask;
@end

@implementation PXPhotoKitCollectionListRearrangeActionPerformer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetCollection, 0);
  objc_storeStrong((id *)&self->_sourceCollections, 0);
}

- (void)performBackgroundTask
{
  v3 = [PXRearrangeCollectionListAction alloc];
  v4 = [(PXPhotoKitCollectionListActionPerformer *)self collectionList];
  v5 = [(PXRearrangeCollectionListAction *)v3 initWithCollectionList:v4 movedCollections:self->_sourceCollections targetCollection:self->_targetCollection];

  v6 = [(PXActionPerformer *)self undoManager];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__PXPhotoKitCollectionListRearrangeActionPerformer_performBackgroundTask__block_invoke;
  v7[3] = &unk_1E5DD3158;
  v7[4] = self;
  [(PXAction *)v5 executeWithUndoManager:v6 completionHandler:v7];
}

uint64_t __73__PXPhotoKitCollectionListRearrangeActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) completeBackgroundTaskWithSuccess:a2 error:a3];
}

- (PXPhotoKitCollectionListRearrangeActionPerformer)initWithActionType:(id)a3 collectionList:(id)a4 parameters:(id)a5
{
  id v9 = a5;
  v20.receiver = self;
  v20.super_class = (Class)PXPhotoKitCollectionListRearrangeActionPerformer;
  v10 = [(PXPhotoKitCollectionListActionPerformer *)&v20 initWithActionType:a3 collectionList:a4 parameters:v9];
  if (v10)
  {
    uint64_t v11 = [v9 objectForKeyedSubscript:*(void *)off_1E5DAAE80];
    sourceCollections = v10->_sourceCollections;
    v10->_sourceCollections = (PXFastEnumeration *)v11;

    v13 = [v9 objectForKeyedSubscript:*(void *)off_1E5DAAE88];
    if (v13)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v16 = [MEMORY[0x1E4F28B00] currentHandler];
        v17 = (objc_class *)objc_opt_class();
        v18 = NSStringFromClass(v17);
        v19 = [(PHCollection *)v13 px_descriptionForAssertionMessage];
        [v16 handleFailureInMethod:a2, v10, @"PXPhotoKitCollectionListRearrangeActionPerformer.m", 29, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"parameters[PXActionParameterKeyTargetObject]", v18, v19 object file lineNumber description];
      }
    }
    targetCollection = v10->_targetCollection;
    v10->_targetCollection = v13;
  }
  return v10;
}

+ (BOOL)canPerformOnCollectionList:(id)a3
{
  return +[PXRearrangeCollectionListAction canPerformOnCollection:a3];
}

@end