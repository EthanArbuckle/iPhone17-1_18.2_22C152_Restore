@interface PXMoveAssetsToSharedLibraryAction
- (PXMoveAssetsToSharedLibraryAction)initWithAssets:(id)a3;
- (id)actionIdentifier;
- (id)localizedActionName;
- (void)performAction:(id)a3;
- (void)performUndo:(id)a3;
@end

@implementation PXMoveAssetsToSharedLibraryAction

- (void).cxx_destruct
{
}

- (void)performUndo:(id)a3
{
  id v4 = a3;
  v5 = [(PXAssetsAction *)self assets];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__PXMoveAssetsToSharedLibraryAction_performUndo___block_invoke;
  v7[3] = &unk_1E5DD2B90;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  PXSharedLibraryMoveAssetsToPersonalLibrary(v5, v7);
}

void __49__PXMoveAssetsToSharedLibraryAction_performUndo___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (a2 && [*(id *)(*(void *)(a1 + 32) + 96) count])
  {
    PXSharedLibraryAddSharingSuggestions(*(void **)(*(void *)(a1 + 32) + 96), *(void **)(a1 + 40));
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 40);
    if (v5) {
      (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v6);
    }
  }
}

- (void)performAction:(id)a3
{
  id v4 = a3;
  id v5 = [(PXAssetsAction *)self assets];
  PXSharedLibraryMoveAssetsToSharedLibrary(v5, v4);
}

- (id)localizedActionName
{
  return PXLocalizedSharedLibraryString(@"PXSharedLibrary_Action_MoveToSharedLibrary");
}

- (id)actionIdentifier
{
  return @"MoveAssetsToSharedLibrary";
}

- (PXMoveAssetsToSharedLibraryAction)initWithAssets:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PXMoveAssetsToSharedLibraryAction;
  if ([(PXAssetsAction *)&v6 initWithAssets:v4]) {
    PXFilter();
  }

  return 0;
}

uint64_t __52__PXMoveAssetsToSharedLibraryAction_initWithAssets___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 fetchPropertySetsIfNeeded];
  v3 = [v2 libraryScopeProperties];

  uint64_t v4 = [v3 assetIsInPhotosSuggestedPreviewState];
  return v4;
}

@end