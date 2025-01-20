@interface PUHidePhotosActionController
- (NSArray)assets;
- (NSUndoManager)undoManager;
- (PUHidePhotosActionController)initWithAssets:(id)a3 undoManager:(id)a4;
- (id)alertControllerForTogglingAssetsVisibilityWithCompletionHandler:(id)a3;
- (void)performActionWithCompletionHandler:(id)a3;
@end

@implementation PUHidePhotosActionController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_undoManager, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

- (NSUndoManager)undoManager
{
  return self->_undoManager;
}

- (NSArray)assets
{
  return self->_assets;
}

- (void)performActionWithCompletionHandler:(id)a3
{
  id v4 = a3;
  action = self->_action;
  v6 = [(PUHidePhotosActionController *)self undoManager];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67__PUHidePhotosActionController_performActionWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E5F2DB20;
  id v9 = v4;
  id v7 = v4;
  [(PXHideAssetsAction *)action executeWithUndoManager:v6 completionHandler:v8];
}

uint64_t __67__PUHidePhotosActionController_performActionWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)alertControllerForTogglingAssetsVisibilityWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if ([(PXHideAssetsAction *)self->_action isHidden])
  {
    v5 = [(PUHidePhotosActionController *)self assets];
    v6 = PLSuffixForItems();
    v21 = v5;
    if ([v5 count] == 1)
    {
      id v7 = [@"HIDE_CONFIRMATION_MESSAGE_" stringByAppendingString:v6];
      v8 = PULocalizedString(v7);

      id v9 = [@"HIDE_BUTTON_TITLE_" stringByAppendingString:v6];
      v10 = PULocalizedString(v9);
    }
    else
    {
      v12 = [NSString stringWithFormat:@"HIDE_CONFIRMATION_MESSAGE_%@S", v6];
      v8 = PULocalizedString(v12);

      id v9 = [NSString stringWithFormat:@"HIDE_BUTTON_TITLE_%@S", v6];
      v13 = PULocalizedString(v9);
      v10 = PULocalizedStringWithValidatedFormat(v13, @"%lu");
    }
    v14 = PULocalizedString(@"CANCEL");
    v11 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v8 message:0 preferredStyle:0];
    v15 = (void *)MEMORY[0x1E4FB1410];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __96__PUHidePhotosActionController_alertControllerForTogglingAssetsVisibilityWithCompletionHandler___block_invoke;
    v24[3] = &unk_1E5F2E898;
    id v16 = v4;
    id v25 = v16;
    v17 = [v15 actionWithTitle:v10 style:2 handler:v24];
    [v11 addAction:v17];

    v18 = (void *)MEMORY[0x1E4FB1410];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __96__PUHidePhotosActionController_alertControllerForTogglingAssetsVisibilityWithCompletionHandler___block_invoke_2;
    v22[3] = &unk_1E5F2E898;
    id v23 = v16;
    v19 = [v18 actionWithTitle:v14 style:1 handler:v22];
    [v11 addAction:v19];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

uint64_t __96__PUHidePhotosActionController_alertControllerForTogglingAssetsVisibilityWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

uint64_t __96__PUHidePhotosActionController_alertControllerForTogglingAssetsVisibilityWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (PUHidePhotosActionController)initWithAssets:(id)a3 undoManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F90290]) initWithAssets:v7];
  if (v9)
  {
    v14.receiver = self;
    v14.super_class = (Class)PUHidePhotosActionController;
    v10 = [(PUHidePhotosActionController *)&v14 init];
    p_isa = (id *)&v10->super.isa;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_action, v9);
      objc_storeStrong(p_isa + 2, a3);
      objc_storeStrong(p_isa + 3, a4);
    }
    self = p_isa;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

@end