@interface PXRecoverAssetsAction
- (id)actionIdentifier;
- (void)executeWithUndoManager:(id)a3 completionHandler:(id)a4;
@end

@implementation PXRecoverAssetsAction

- (void)executeWithUndoManager:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  v6 = [(PXAssetsAction *)self assets];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__PXRecoverAssetsAction_executeWithUndoManager_completionHandler___block_invoke;
  v8[3] = &unk_1E5DD36F8;
  id v9 = v6;
  id v7 = v6;
  [(PXPhotosAction *)self performChanges:v8 completionHandler:v5];
}

uint64_t __66__PXRecoverAssetsAction_executeWithUndoManager_completionHandler___block_invoke(uint64_t a1)
{
  return [MEMORY[0x1E4F38ED0] recoverAssets:*(void *)(a1 + 32)];
}

- (id)actionIdentifier
{
  return @"RecoverAssets";
}

@end