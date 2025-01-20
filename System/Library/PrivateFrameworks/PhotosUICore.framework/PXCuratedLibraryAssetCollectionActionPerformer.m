@interface PXCuratedLibraryAssetCollectionActionPerformer
- (PXAssetCollectionReference)assetCollectionReference;
- (PXCuratedLibraryAssetCollectionActionPerformer)initWithActionType:(id)a3 viewModel:(id)a4;
- (PXCuratedLibraryAssetCollectionActionPerformer)initWithActionType:(id)a3 viewModel:(id)a4 assetCollectionReference:(id)a5;
- (id)localizedTitleForUseCase:(unint64_t)a3;
- (void)performActionWithCompletionHandler:(id)a3;
@end

@implementation PXCuratedLibraryAssetCollectionActionPerformer

- (void).cxx_destruct
{
}

- (PXAssetCollectionReference)assetCollectionReference
{
  return self->_assetCollectionReference;
}

- (void)performActionWithCompletionHandler:(id)a3
{
  v4 = (void (**)(id, uint64_t, void))a3;
  v5 = [(PXCuratedLibraryAssetCollectionActionPerformer *)self assetCollectionReference];
  if (!v5) {
    goto LABEL_6;
  }
  v6 = [(PXCuratedLibraryActionPerformer *)self viewModel];
  v7 = [(PXActionPerformer *)self actionType];
  int v8 = [v7 isEqualToString:@"PXCuratedLibraryActionSelectAllToggle"];

  if (!v8)
  {

LABEL_6:
    v9.receiver = self;
    v9.super_class = (Class)PXCuratedLibraryAssetCollectionActionPerformer;
    [(PXCuratedLibraryActionPerformer *)&v9 performActionWithCompletionHandler:v4];
    goto LABEL_7;
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __85__PXCuratedLibraryAssetCollectionActionPerformer_performActionWithCompletionHandler___block_invoke;
  v10[3] = &unk_1E5DCF3F0;
  id v11 = v5;
  [v6 performChanges:v10];

  if (v4) {
    v4[2](v4, 1, 0);
  }
LABEL_7:
}

uint64_t __85__PXCuratedLibraryAssetCollectionActionPerformer_performActionWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 toggleSelectionForAssetCollectionReference:*(void *)(a1 + 32)];
}

- (id)localizedTitleForUseCase:(unint64_t)a3
{
  v4 = [(PXActionPerformer *)self actionType];
  v5 = [(PXCuratedLibraryActionPerformer *)self viewModel];
  v6 = [(PXCuratedLibraryAssetCollectionActionPerformer *)self assetCollectionReference];
  int v8 = _PXCuratedLibraryActionTitle(v4, v7, v5, v6);

  return v8;
}

- (PXCuratedLibraryAssetCollectionActionPerformer)initWithActionType:(id)a3 viewModel:(id)a4 assetCollectionReference:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)PXCuratedLibraryAssetCollectionActionPerformer;
  v10 = [(PXCuratedLibraryActionPerformer *)&v13 initWithActionType:a3 viewModel:a4];
  id v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_assetCollectionReference, a5);
  }

  return v11;
}

- (PXCuratedLibraryAssetCollectionActionPerformer)initWithActionType:(id)a3 viewModel:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCuratedLibraryAssetCollectionActionPerformer.m", 48, @"%s is not available as initializer", "-[PXCuratedLibraryAssetCollectionActionPerformer initWithActionType:viewModel:]");

  abort();
}

@end