@interface UIAlertController(PXErrorRecovery)
+ (id)px_alertControllerWithError:()PXErrorRecovery completionHandler:;
@end

@implementation UIAlertController(PXErrorRecovery)

+ (id)px_alertControllerWithError:()PXErrorRecovery completionHandler:
{
  id v5 = a4;
  id v6 = a3;
  v7 = [v6 localizedDescription];
  v8 = [v6 localizedFailureReason];
  v9 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v7 message:v8 preferredStyle:1];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __84__UIAlertController_PXErrorRecovery__px_alertControllerWithError_completionHandler___block_invoke;
  v21[3] = &unk_1E5DC0700;
  id v10 = v9;
  id v22 = v10;
  char v11 = PXErrorRecoveryEnumerateOptionsForError(v6, v5, v21);

  if ((v11 & 1) == 0)
  {
    v12 = PXLocalizedStringFromTable(@"PXOK", @"PhotosUICore");
    v13 = (void *)MEMORY[0x1E4FB1410];
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __84__UIAlertController_PXErrorRecovery__px_alertControllerWithError_completionHandler___block_invoke_3;
    v19 = &unk_1E5DCE788;
    id v20 = v5;
    v14 = [v13 actionWithTitle:v12 style:0 handler:&v16];
    objc_msgSend(v10, "addAction:", v14, v16, v17, v18, v19);
    [v10 setPreferredAction:v14];
  }
  return v10;
}

@end