@interface PXDestructiveAssetsAction
+ (id)actionWithAssets:(id)a3 record:(id)a4;
- (PXActionRecord)record;
- (PXDestructiveAssetsAction)initWithAsset:(id)a3 record:(id)a4;
- (PXDestructiveAssetsAction)initWithAssets:(id)a3;
- (PXDestructiveAssetsAction)initWithAssets:(id)a3 record:(id)a4;
- (void)performChanges:(id)a3 completionHandler:(id)a4;
@end

@implementation PXDestructiveAssetsAction

- (void).cxx_destruct
{
}

- (PXActionRecord)record
{
  return self->_record;
}

- (PXDestructiveAssetsAction)initWithAsset:(id)a3 record:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v14[0] = v7;
  v8 = (void *)MEMORY[0x1E4F1C978];
  id v9 = a4;
  v10 = [v8 arrayWithObjects:v14 count:1];
  v11 = [(PXDestructiveAssetsAction *)self initWithAssets:v10 record:v9];

  if (!v11)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, 0, @"PXDestructiveAssetsAction.m", 76, @"Invalid parameter not satisfying: %@", @"self != nil" object file lineNumber description];
  }
  return v11;
}

- (void)performChanges:(id)a3 completionHandler:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = NSString;
  id v9 = PXActionPhaseDescription([(PXAction *)self phase]);
  v10 = [(PXAction *)self actionIdentifier];
  v11 = [v8 stringWithFormat:@"%@ %@", v9, v10];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__PXDestructiveAssetsAction_performChanges_completionHandler___block_invoke;
  aBlock[3] = &unk_1E5DD2B90;
  aBlock[4] = self;
  id v12 = v7;
  id v26 = v12;
  v13 = (void (**)(void *, void, void *))_Block_copy(aBlock);
  v14 = [(PXDestructiveAssetsAction *)self record];
  v15 = [(PXAssetsAction *)self assets];
  uint64_t v16 = [v15 count];

  uint64_t v17 = [v14 userConfirmation];
  if (v17 == 1)
  {
    if ([v14 assetCount] != v16)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"confirmed asset count %ti doesn't match %ti for destructive action %@", objc_msgSend(v14, "assetCount"), v16, v11);
      goto LABEL_9;
    }
  }
  else if (v17 == 2)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"user denied destructive action %@, record: %@", v11, v14, v21);
    v20 = LABEL_9:;
    v13[2](v13, 0, v20);
    goto LABEL_10;
  }
  v18 = PLUIActionsGetLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = [v14 publicDescription];
    *(_DWORD *)buf = 134218754;
    v28 = self;
    __int16 v29 = 2114;
    v30 = v11;
    __int16 v31 = 2048;
    uint64_t v32 = v16;
    __int16 v33 = 2114;
    v34 = v19;
    _os_log_impl(&dword_1A9AE7000, v18, OS_LOG_TYPE_DEFAULT, "%p %{public}@ on %ti asset(s), record: %{public}@", buf, 0x2Au);
  }
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __62__PXDestructiveAssetsAction_performChanges_completionHandler___block_invoke_17;
  v23[3] = &unk_1E5DCDD58;
  v24 = v13;
  v22.receiver = self;
  v22.super_class = (Class)PXDestructiveAssetsAction;
  [(PXPhotosAction *)&v22 performChanges:v6 completionHandler:v23];
  v20 = v24;
LABEL_10:
}

void __62__PXDestructiveAssetsAction_performChanges_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = PLUIActionsGetLog();
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v15 = 134217984;
      uint64_t v16 = v8;
      id v9 = "%p succeeded";
      v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
      uint32_t v12 = 12;
LABEL_6:
      _os_log_impl(&dword_1A9AE7000, v10, v11, v9, (uint8_t *)&v15, v12);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v13 = *(void *)(a1 + 32);
    int v15 = 134218242;
    uint64_t v16 = v13;
    __int16 v17 = 2114;
    id v18 = v5;
    id v9 = "%p failed: %{public}@";
    v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_ERROR;
    uint32_t v12 = 22;
    goto LABEL_6;
  }

  (*(void (**)(void, uint64_t, id, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, v5, v14);
}

uint64_t __62__PXDestructiveAssetsAction_performChanges_completionHandler___block_invoke_17(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (PXDestructiveAssetsAction)initWithAssets:(id)a3
{
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXDestructiveAssetsAction.m", 38, @"%s is not available as initializer", "-[PXDestructiveAssetsAction initWithAssets:]");

  abort();
}

- (PXDestructiveAssetsAction)initWithAssets:(id)a3 record:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PXDestructiveAssetsAction;
  uint64_t v8 = [(PXAssetsAction *)&v11 initWithAssets:a3];
  id v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_record, a4);
  }

  return v9;
}

+ (id)actionWithAssets:(id)a3 record:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (PXNoOpAction *)[objc_alloc((Class)objc_opt_class()) initWithAssets:v6 record:v5];

  if (!v7) {
    id v7 = objc_alloc_init(PXNoOpAction);
  }
  return v7;
}

@end