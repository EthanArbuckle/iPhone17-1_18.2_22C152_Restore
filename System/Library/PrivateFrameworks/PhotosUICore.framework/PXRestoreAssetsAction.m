@interface PXRestoreAssetsAction
- (id)actionIdentifier;
- (id)actionNameLocalizationKey;
- (void)performAction:(id)a3;
- (void)performUndo:(id)a3;
@end

@implementation PXRestoreAssetsAction

- (void)performUndo:(id)a3
{
  id v4 = a3;
  v5 = [(PXAssetsAction *)self assets];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__PXRestoreAssetsAction_performUndo___block_invoke;
  v7[3] = &unk_1E5DD36F8;
  id v8 = v5;
  id v6 = v5;
  [(PXDestructiveAssetsAction *)self performChanges:v7 completionHandler:v4];
}

uint64_t __37__PXRestoreAssetsAction_performUndo___block_invoke(uint64_t a1)
{
  return [MEMORY[0x1E4F38ED0] deleteAssets:*(void *)(a1 + 32)];
}

- (void)performAction:(id)a3
{
  id v4 = a3;
  v5 = [(PXAssetsAction *)self assets];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__PXRestoreAssetsAction_performAction___block_invoke;
  v7[3] = &unk_1E5DD36F8;
  id v8 = v5;
  id v6 = v5;
  [(PXDestructiveAssetsAction *)self performChanges:v7 completionHandler:v4];
}

uint64_t __39__PXRestoreAssetsAction_performAction___block_invoke(uint64_t a1)
{
  return [MEMORY[0x1E4F38ED0] undeleteAssets:*(void *)(a1 + 32)];
}

- (id)actionNameLocalizationKey
{
  return @"PXRestoreActionName";
}

- (id)actionIdentifier
{
  return @"RestoreAssets";
}

@end