@interface UIAlertController
@end

@implementation UIAlertController

void __75__UIAlertController_PhotosUICore__px_showDebugAlertInKeyWindowWithMessage___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained presentingViewController];
  [v1 dismissViewControllerAnimated:1 completion:0];
}

void __84__UIAlertController_PXErrorRecovery__px_alertControllerWithError_completionHandler___block_invoke(uint64_t a1, void *a2, unint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  if (a3 >= 3)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    v14 = [NSString stringWithUTF8String:"UIAlertActionStyle UIAlertActionStyleFromPXAlertActionStyle(PXAlertActionStyle)"];
    [v13 handleFailureInFunction:v14 file:@"PXAlertActionStyle.h" lineNumber:43 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  v9 = *(void **)(a1 + 32);
  v10 = (void *)MEMORY[0x1E4FB1410];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __84__UIAlertController_PXErrorRecovery__px_alertControllerWithError_completionHandler___block_invoke_2;
  v15[3] = &unk_1E5DCE788;
  id v16 = v8;
  id v11 = v8;
  v12 = [v10 actionWithTitle:v7 style:a3 handler:v15];
  [v9 addAction:v12];
}

uint64_t __84__UIAlertController_PXErrorRecovery__px_alertControllerWithError_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __84__UIAlertController_PXErrorRecovery__px_alertControllerWithError_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __80__UIAlertController_CPL__px_alertForCPLEnableError_actionHandler_cancelHandler___block_invoke(uint64_t a1)
{
  v2 = PLUIGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_DEFAULT, "User dismissed iCPL enablement error alert", v4, 2u);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __80__UIAlertController_CPL__px_alertForCPLEnableError_actionHandler_cancelHandler___block_invoke_278(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = PLUIGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_DEFAULT, "User invoked iCPL enablement error alert action with title: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __126__UIAlertController_CPL__px_deleteITunesContentAlertWithAssetCount_includesPhotos_includesVideos_actionHandler_cancelHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __126__UIAlertController_CPL__px_deleteITunesContentAlertWithAssetCount_includesPhotos_includesVideos_actionHandler_cancelHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

@end