@interface PBItemRepresentation
- (BOOL)isDataAvailableImmediately;
- (BOOL)isDerivedRepresentation;
- (NSString)typeIdentifier;
- (PBItemRepresentation)initWithNSItemRepresentation:(id)a3;
- (PBItemRepresentation)initWithType:(id)a3 preferredRepresentation:(unint64_t)a4 loader:(id)a5;
- (PBItemRepresentation)initWithType:(id)a3 preferredRepresentation:(unint64_t)a4 v2_loader:(id)a5;
- (PBItemRepresentation)initWithType:(id)a3 preferredRepresentation:(unint64_t)a4 v3_loader:(id)a5;
- (PBItemRepresentationDataTransferDelegate)dataTransferDelegate;
- (id)_loadWithContext:(id)a3 completionBlock:(id)a4;
- (id)copyWithDoNothingLoaderBlock;
- (id)loadDataWithCompletion:(id)a3;
- (id)loadDataWithContext:(id)a3 completion:(id)a4;
- (id)loadDataWithDetailedCompletion:(id)a3;
- (id)loadFileCopyWithCompletion:(id)a3;
- (id)loadFileCopyWithContext:(id)a3 completion:(id)a4;
- (id)loadFileCopyWithDetailedCompletion:(id)a3;
- (id)loadOpenInPlaceWithCompletion:(id)a3;
- (id)loadOpenInPlaceWithContext:(id)a3 completion:(id)a4;
- (id)loadOpenInPlaceWithDetailedCompletion:(id)a3;
- (id)loadWithCompletionHandler:(id)a3;
- (id)loadWithContext:(id)a3 completionHandler:(id)a4;
- (id)performProgressTrackingWithLoaderBlock:(id)a3 onCancelCallback:(id)a4;
- (int64_t)visibility;
- (unint64_t)preferredRepresentation;
- (void)setDataTransferDelegate:(id)a3;
- (void)setDerivedRepresentation:(BOOL)a3;
- (void)setIsDataAvailableImmediately:(BOOL)a3;
- (void)setLoaderBlock:(id)a3;
- (void)setPreferredRepresentation:(unint64_t)a3;
- (void)setVisibility:(int64_t)a3;
@end

@implementation PBItemRepresentation

- (PBItemRepresentation)initWithType:(id)a3 preferredRepresentation:(unint64_t)a4 loader:(id)a5
{
  id v8 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __68__PBItemRepresentation_initWithType_preferredRepresentation_loader___block_invoke;
  v14[3] = &unk_1E5555730;
  id v15 = v8;
  id v9 = v8;
  id v10 = a3;
  v11 = (void *)MEMORY[0x192F9AA30](v14);
  v12 = [(PBItemRepresentation *)self initWithType:v10 preferredRepresentation:a4 v2_loader:v11];

  return v12;
}

id __68__PBItemRepresentation_initWithType_preferredRepresentation_loader___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__PBItemRepresentation_initWithType_preferredRepresentation_loader___block_invoke_2;
  v8[3] = &unk_1E5555708;
  id v9 = v3;
  id v4 = v3;
  v5 = (void *)MEMORY[0x192F9AA30](v8);
  v6 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  return v6;
}

uint64_t __68__PBItemRepresentation_initWithType_preferredRepresentation_loader___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (PBItemRepresentation)initWithType:(id)a3 preferredRepresentation:(unint64_t)a4 v2_loader:(id)a5
{
  id v8 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __71__PBItemRepresentation_initWithType_preferredRepresentation_v2_loader___block_invoke;
  v12[3] = &unk_1E5555758;
  id v13 = v8;
  id v9 = v8;
  id v10 = [(PBItemRepresentation *)self initWithType:a3 preferredRepresentation:a4 v3_loader:v12];

  return v10;
}

uint64_t __71__PBItemRepresentation_initWithType_preferredRepresentation_v2_loader___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (PBItemRepresentation)initWithType:(id)a3 preferredRepresentation:(unint64_t)a4 v3_loader:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PBItemRepresentation;
  v11 = [(PBItemRepresentation *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_typeIdentifier, a3);
    uint64_t v13 = MEMORY[0x192F9AA30](v10);
    id loader = v12->_loader;
    v12->_id loader = (id)v13;

    v12->_preferredRepresentation = a4;
  }

  return v12;
}

- (PBItemRepresentation)initWithNSItemRepresentation:(id)a3
{
  id v4 = a3;
  v5 = [v4 typeIdentifier];
  uint64_t v6 = [v4 preferredRepresentation];
  if (v6 == 2) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = v6 == 1;
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__PBItemRepresentation_initWithNSItemRepresentation___block_invoke;
  v11[3] = &unk_1E55557A8;
  id v8 = v4;
  id v12 = v8;
  id v9 = [(PBItemRepresentation *)self initWithType:v5 preferredRepresentation:v7 v2_loader:v11];

  if (v9)
  {
    v9->_visibility = [v8 visibility];
    if (objc_opt_respondsToSelector()) {
      v9->_isDataAvailableImmediately = [v8 isDataAvailableImmediately];
    }
  }

  return v9;
}

id __53__PBItemRepresentation_initWithNSItemRepresentation___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__PBItemRepresentation_initWithNSItemRepresentation___block_invoke_2;
  v8[3] = &unk_1E5555780;
  id v9 = v3;
  id v5 = v3;
  uint64_t v6 = objc_msgSend(v4, "loadWithOptions_v2:completionHandler:", 0, v8);

  return v6;
}

void __53__PBItemRepresentation_initWithNSItemRepresentation___block_invoke_2(uint64_t a1, void *a2)
{
  if (*(void *)(a1 + 32))
  {
    id v3 = a2;
    id v4 = [PBSecurityScopedURLWrapper alloc];
    id v5 = [v3 urlWrapper];
    id v10 = [(PBSecurityScopedURLWrapper *)v4 initWithNSURLWrapper:v5];

    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = [v3 data];
    id v8 = [v3 error];
    id v9 = [v3 cleanupHandler];

    (*(void (**)(uint64_t, void *, PBSecurityScopedURLWrapper *, void, void *, void *))(v6 + 16))(v6, v7, v10, 0, v8, v9);
  }
}

- (id)copyWithDoNothingLoaderBlock
{
  id v3 = objc_alloc((Class)objc_opt_class());
  typeIdentifier = self->_typeIdentifier;
  unint64_t v5 = [(PBItemRepresentation *)self preferredRepresentation];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__PBItemRepresentation_copyWithDoNothingLoaderBlock__block_invoke;
  v7[3] = &unk_1E55557A8;
  v7[4] = self;
  id result = (id)objc_msgSend(v3, "initWithType:preferredRepresentation:v2_loader:", typeIdentifier, v5, v7);
  *((void *)result + 4) = self->_preferredRepresentation;
  *((void *)result + 5) = self->_visibility;
  *((unsigned char *)result + 16) = self->_isDataAvailableImmediately;
  return result;
}

uint64_t __52__PBItemRepresentation_copyWithDoNothingLoaderBlock__block_invoke(uint64_t a1, void (**a2)(void, void, void, void, void, void))
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 24);
  id v4 = a2;
  unint64_t v5 = PBCannotLoadRepresentationError(v3, 0);
  ((void (**)(void, void, void, void, void *, void))a2)[2](v4, 0, 0, 0, v5, 0);

  return 0;
}

- (id)performProgressTrackingWithLoaderBlock:(id)a3 onCancelCallback:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:100];
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  char v32 = 0;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __80__PBItemRepresentation_performProgressTrackingWithLoaderBlock_onCancelCallback___block_invoke;
  v28[3] = &unk_1E55557D0;
  v30 = v31;
  id v8 = v6;
  id v29 = v8;
  [v7 setCancellationHandler:v28];
  id v9 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:100];
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  id v27 = 0;
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  objc_super v16 = __80__PBItemRepresentation_performProgressTrackingWithLoaderBlock_onCancelCallback___block_invoke_8;
  v17 = &unk_1E5555848;
  v20 = &v22;
  id v10 = v5;
  id v19 = v10;
  id v11 = v9;
  id v18 = v11;
  v21 = v31;
  _os_activity_initiate(&dword_18D208000, "loading item", OS_ACTIVITY_FLAG_DEFAULT, &v14);

  uint64_t v12 = v23[5];
  if (v12) {
    objc_msgSend(v7, "addChild:withPendingUnitCount:", v12, 100, v14, v15, v16, v17);
  }
  else {
    objc_msgSend(v7, "addChild:withPendingUnitCount:", v11, 100, v14, v15, v16, v17);
  }
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(v31, 8);
  return v7;
}

void __80__PBItemRepresentation_performProgressTrackingWithLoaderBlock_onCancelCallback___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __80__PBItemRepresentation_performProgressTrackingWithLoaderBlock_onCancelCallback___block_invoke_2;
  v3[3] = &unk_1E55557D0;
  long long v2 = *(_OWORD *)(a1 + 32);
  id v1 = (id)v2;
  long long v4 = v2;
  PBDispatchAsyncCallback(v3);
}

uint64_t __80__PBItemRepresentation_performProgressTrackingWithLoaderBlock_onCancelCallback___block_invoke_2(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 40) + 8);
  if (!*(unsigned char *)(v1 + 24))
  {
    *(unsigned char *)(v1 + 24) = 1;
    id result = *(void *)(result + 32);
    if (result) {
      return (*(uint64_t (**)(void))(result + 16))();
    }
  }
  return result;
}

void __80__PBItemRepresentation_performProgressTrackingWithLoaderBlock_onCancelCallback___block_invoke_8(uint64_t a1)
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __80__PBItemRepresentation_performProgressTrackingWithLoaderBlock_onCancelCallback___block_invoke_2_9;
  v8[3] = &unk_1E5555820;
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 56);
  id v9 = v3;
  uint64_t v10 = v4;
  uint64_t v5 = (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v8);
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __80__PBItemRepresentation_performProgressTrackingWithLoaderBlock_onCancelCallback___block_invoke_2_9(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __80__PBItemRepresentation_performProgressTrackingWithLoaderBlock_onCancelCallback___block_invoke_3;
  v7[3] = &unk_1E55557F8;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v5;
  id v8 = v4;
  id v6 = v3;
  PBDispatchAsyncCallback(v7);
}

uint64_t __80__PBItemRepresentation_performProgressTrackingWithLoaderBlock_onCancelCallback___block_invoke_3(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    uint64_t result = *(void *)(a1 + 40);
    if (result)
    {
      id v3 = *(uint64_t (**)(void))(result + 16);
      return v3();
    }
  }
  return result;
}

- (id)_loadWithContext:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(PBCallbackSerialization);
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = __Block_byref_object_copy__12;
  v36[4] = __Block_byref_object_dispose__13;
  id v37 = 0;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy_;
  v34[4] = __Block_byref_object_dispose_;
  id v35 = 0;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __57__PBItemRepresentation__loadWithContext_completionBlock___block_invoke;
  v29[3] = &unk_1E5555898;
  char v32 = v34;
  id v9 = v8;
  v30 = v9;
  v31 = self;
  v33 = v36;
  uint64_t v10 = (void *)MEMORY[0x192F9AA30](v29);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __57__PBItemRepresentation__loadWithContext_completionBlock___block_invoke_3;
  v24[3] = &unk_1E5555960;
  v24[4] = self;
  id v11 = v6;
  id v25 = v11;
  v28 = v36;
  id v26 = v7;
  id v27 = v10;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __57__PBItemRepresentation__loadWithContext_completionBlock___block_invoke_4_19;
  v21[3] = &unk_1E5555988;
  id v12 = v26;
  id v22 = v12;
  id v13 = v27;
  id v23 = v13;
  uint64_t v14 = [(PBItemRepresentation *)self performProgressTrackingWithLoaderBlock:v24 onCancelCallback:v21];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __57__PBItemRepresentation__loadWithContext_completionBlock___block_invoke_7_22;
  v19[3] = &unk_1E55559B0;
  v19[4] = self;
  id v15 = v14;
  id v20 = v15;
  [(PBCallbackSerialization *)v9 sendBeginBlock:v19];
  objc_super v16 = v20;
  id v17 = v15;

  _Block_object_dispose(v34, 8);
  _Block_object_dispose(v36, 8);

  return v17;
}

uint64_t __57__PBItemRepresentation__loadWithContext_completionBlock___block_invoke(void *a1)
{
  objc_msgSend(*(id *)(*(void *)(a1[6] + 8) + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(*(void *)(a1[6] + 8) + 40), "totalUnitCount"));
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__PBItemRepresentation__loadWithContext_completionBlock___block_invoke_2;
  v4[3] = &unk_1E5555870;
  uint64_t v2 = (void *)a1[4];
  v4[4] = a1[5];
  [v2 sendEndBlock:v4];
  uint64_t result = *(void *)(*(void *)(a1[7] + 8) + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __57__PBItemRepresentation__loadWithContext_completionBlock___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) dataTransferDelegate];
  [v2 itemRepresentationFinishedDataTransfer:*(void *)(a1 + 32)];
}

id __57__PBItemRepresentation__loadWithContext_completionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__PBItemRepresentation__loadWithContext_completionBlock___block_invoke_4;
  v9[3] = &unk_1E5555910;
  uint64_t v13 = *(void *)(a1 + 64);
  id v6 = v3;
  id v10 = v6;
  id v11 = *(id *)(a1 + 48);
  id v12 = *(id *)(a1 + 56);
  id v7 = (*(void (**)(uint64_t, uint64_t, void *))(v5 + 16))(v5, v4, v9);

  return v7;
}

void __57__PBItemRepresentation__loadWithContext_completionBlock___block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4, void *a5, uint64_t a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  uint64_t v15 = MEMORY[0x192F9AA30](a6);
  uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8);
  id v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v15;

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __57__PBItemRepresentation__loadWithContext_completionBlock___block_invoke_5;
  v25[3] = &unk_1E55558E8;
  uint64_t v18 = *(void *)(a1 + 32);
  id v19 = *(id *)(a1 + 40);
  id v29 = v14;
  id v30 = v19;
  id v26 = v11;
  id v27 = v12;
  id v28 = v13;
  id v31 = *(id *)(a1 + 48);
  id v20 = *(void (**)(uint64_t, void *))(v18 + 16);
  id v21 = v14;
  id v22 = v13;
  id v23 = v12;
  id v24 = v11;
  v20(v18, v25);
}

void __57__PBItemRepresentation__loadWithContext_completionBlock___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 56);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __57__PBItemRepresentation__loadWithContext_completionBlock___block_invoke_6;
    v7[3] = &unk_1E55558C0;
    id v8 = *(id *)(a1 + 72);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *))(v1 + 16))(v1, v2, v3, v4, v5, v7);
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
    v6();
  }
}

void __57__PBItemRepresentation__loadWithContext_completionBlock___block_invoke_6(uint64_t a1)
{
  v1[0] = MEMORY[0x1E4F143A8];
  v1[1] = 3221225472;
  v1[2] = __57__PBItemRepresentation__loadWithContext_completionBlock___block_invoke_7;
  v1[3] = &unk_1E55558C0;
  id v2 = *(id *)(a1 + 32);
  PBDispatchAsyncCallback(v1);
}

uint64_t __57__PBItemRepresentation__loadWithContext_completionBlock___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __57__PBItemRepresentation__loadWithContext_completionBlock___block_invoke_15(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2)
  {
    uint64_t v3 = PBCannotLoadRepresentationError(*(void *)(*(void *)(a1 + 32) + 24), 0);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __57__PBItemRepresentation__loadWithContext_completionBlock___block_invoke_2_16;
    v5[3] = &unk_1E55558C0;
    id v6 = *(id *)(a1 + 48);
    (*(void (**)(uint64_t, void, void, void, void *, void *))(v2 + 16))(v2, 0, 0, 0, v3, v5);
  }
  else
  {
    uint64_t v4 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v4();
  }
}

void __57__PBItemRepresentation__loadWithContext_completionBlock___block_invoke_2_16(uint64_t a1)
{
  v1[0] = MEMORY[0x1E4F143A8];
  v1[1] = 3221225472;
  v1[2] = __57__PBItemRepresentation__loadWithContext_completionBlock___block_invoke_3_17;
  v1[3] = &unk_1E55558C0;
  id v2 = *(id *)(a1 + 32);
  PBDispatchAsyncCallback(v1);
}

uint64_t __57__PBItemRepresentation__loadWithContext_completionBlock___block_invoke_3_17(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __57__PBItemRepresentation__loadWithContext_completionBlock___block_invoke_4_19(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = PBDataTransferCancelledError(0);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __57__PBItemRepresentation__loadWithContext_completionBlock___block_invoke_5_20;
    v5[3] = &unk_1E55558C0;
    id v6 = *(id *)(a1 + 40);
    (*(void (**)(uint64_t, void, void, void, void *, void *))(v2 + 16))(v2, 0, 0, 0, v3, v5);
  }
  else
  {
    uint64_t v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v4();
  }
}

void __57__PBItemRepresentation__loadWithContext_completionBlock___block_invoke_5_20(uint64_t a1)
{
  v1[0] = MEMORY[0x1E4F143A8];
  v1[1] = 3221225472;
  v1[2] = __57__PBItemRepresentation__loadWithContext_completionBlock___block_invoke_6_21;
  v1[3] = &unk_1E55558C0;
  id v2 = *(id *)(a1 + 32);
  PBDispatchAsyncCallback(v1);
}

uint64_t __57__PBItemRepresentation__loadWithContext_completionBlock___block_invoke_6_21(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __57__PBItemRepresentation__loadWithContext_completionBlock___block_invoke_7_22(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) dataTransferDelegate];
  [v2 itemRepresentation:*(void *)(a1 + 32) beganDataTransferWithProgress:*(void *)(a1 + 40)];
}

- (id)loadWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__PBItemRepresentation_loadWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E55559D8;
  id v9 = v4;
  id v5 = v4;
  id v6 = [(PBItemRepresentation *)self loadWithContext:0 completionHandler:v8];

  return v6;
}

uint64_t __50__PBItemRepresentation_loadWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)loadWithContext:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58__PBItemRepresentation_loadWithContext_completionHandler___block_invoke;
  v10[3] = &unk_1E55559D8;
  id v11 = v6;
  id v7 = v6;
  id v8 = [(PBItemRepresentation *)self _loadWithContext:a3 completionBlock:v10];

  return v8;
}

void __58__PBItemRepresentation_loadWithContext_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v16 = *(void **)(a1 + 32);
  if (v16)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __58__PBItemRepresentation_loadWithContext_completionHandler___block_invoke_2;
    v17[3] = &unk_1E55558E8;
    id v22 = v16;
    id v18 = v11;
    id v19 = v12;
    id v20 = v13;
    id v21 = v14;
    id v23 = v15;
    PBDispatchAsyncCallback(v17);
  }
}

uint64_t __58__PBItemRepresentation_loadWithContext_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void, void, void))(a1[8] + 16))(a1[8], a1[4], a1[5], a1[6], a1[7], a1[9]);
}

- (void)setLoaderBlock:(id)a3
{
  self->_id loader = (id)MEMORY[0x192F9AA30](a3, a2);
  MEMORY[0x1F41817F8]();
}

- (id)loadDataWithCompletion:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__PBItemRepresentation_loadDataWithCompletion___block_invoke;
  v8[3] = &unk_1E5555A00;
  id v9 = v4;
  id v5 = v4;
  id v6 = [(PBItemRepresentation *)self loadDataWithDetailedCompletion:v8];

  return v6;
}

uint64_t __47__PBItemRepresentation_loadDataWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)loadDataWithDetailedCompletion:(id)a3
{
  return [(PBItemRepresentation *)self loadDataWithContext:0 completion:a3];
}

- (id)loadDataWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:100];
  id v9 = [(PBItemRepresentation *)self preferredRepresentation];
  if (v9)
  {
    id v9 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:100];
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __55__PBItemRepresentation_loadDataWithContext_completion___block_invoke;
  v17[3] = &unk_1E5555AA0;
  void v17[4] = self;
  id v19 = v7;
  id v10 = v9;
  id v18 = v10;
  id v11 = v7;
  id v12 = [(PBItemRepresentation *)self _loadWithContext:v6 completionBlock:v17];
  if (v10)
  {
    if ([(PBItemRepresentation *)self preferredRepresentation] == 2)
    {
      [v8 addChild:v12 withPendingUnitCount:10];
      id v13 = v8;
      id v14 = v10;
      uint64_t v15 = 90;
    }
    else
    {
      [v8 addChild:v12 withPendingUnitCount:50];
      id v13 = v8;
      id v14 = v10;
      uint64_t v15 = 50;
    }
  }
  else
  {
    id v13 = v8;
    id v14 = v12;
    uint64_t v15 = 100;
  }
  [v13 addChild:v14 withPendingUnitCount:v15];

  return v8;
}

void __55__PBItemRepresentation_loadDataWithContext_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3032000000;
  v38[3] = __Block_byref_object_copy_;
  v38[4] = __Block_byref_object_dispose_;
  id v39 = 0;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  id v35 = __Block_byref_object_copy_;
  v36 = __Block_byref_object_dispose_;
  id v16 = v14;
  id v37 = v16;
  if (v16) {
    goto LABEL_5;
  }
  if (v11)
  {
    id v17 = v11;
    id v18 = 0;
    id v16 = 0;
    id v39 = v17;
LABEL_4:

    goto LABEL_5;
  }
  if (v12)
  {
    id v19 = [v12 url];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __55__PBItemRepresentation_loadDataWithContext_completion___block_invoke_2;
    v28[3] = &unk_1E5555A50;
    void v28[4] = *(void *)(a1 + 32);
    id v30 = *(id *)(a1 + 48);
    id v29 = v13;
    id v31 = v15;
    id v20 = PBCoordinatedReadForUploading(v19, v28);

    [*(id *)(a1 + 40) addChild:v20 withPendingUnitCount:100];
    id v16 = 0;
    goto LABEL_6;
  }
  PBNoLoaderAvailableError(*(void *)(*(void *)(a1 + 32) + 24), 0);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    uint64_t v21 = PBCannotLoadRepresentationError(*(void *)(*(void *)(a1 + 32) + 24), v16);
    id v18 = (void *)v33[5];
    v33[5] = v21;
    goto LABEL_4;
  }
LABEL_5:
  objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __55__PBItemRepresentation_loadDataWithContext_completion___block_invoke_4;
  v22[3] = &unk_1E5555A78;
  id v24 = *(id *)(a1 + 48);
  id v26 = v38;
  id v23 = v13;
  id v27 = &v32;
  id v25 = v15;
  PBDispatchAsyncCallback(v22);

LABEL_6:
  _Block_object_dispose(&v32, 8);

  _Block_object_dispose(v38, 8);
}

void __55__PBItemRepresentation_loadDataWithContext_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (uint64_t)v6;
  uint64_t v8 = 0;
  id v9 = v6;
  if (v5 && !v6)
  {
    id v10 = *(void **)(*(void *)(a1 + 32) + 24);
    id v26 = 0;
    id v11 = PBCloneToTemporaryDir(v5, v10, &v26);
    id v12 = v26;
    if (v11) {
      BOOL v13 = v12 == 0;
    }
    else {
      BOOL v13 = 0;
    }
    if (v13)
    {
      id v25 = 0;
      uint64_t v14 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v11 options:8 error:&v25];
      id v9 = v25;
    }
    else
    {
      id v9 = v12;
      uint64_t v14 = 0;
      uint64_t v8 = 0;
      if (!v11) {
        goto LABEL_11;
      }
    }
    id v15 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v15 removeItemAtURL:v11 error:0];

    uint64_t v8 = v14;
LABEL_11:
  }
  if (v9)
  {
    uint64_t v16 = PBCannotLoadRepresentationError(*(void *)(*(void *)(a1 + 32) + 24), v9);

    uint64_t v7 = v16;
  }
  if (!(v8 | v7))
  {
    uint64_t v7 = PBCannotLoadRepresentationError(*(void *)(*(void *)(a1 + 32) + 24), 0);
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __55__PBItemRepresentation_loadDataWithContext_completion___block_invoke_3;
  v19[3] = &unk_1E5555A28;
  id v23 = *(id *)(a1 + 48);
  id v20 = (id)v8;
  id v21 = *(id *)(a1 + 40);
  id v22 = (id)v7;
  id v24 = *(id *)(a1 + 56);
  id v17 = (id)v7;
  id v18 = (id)v8;
  PBDispatchAsyncCallback(v19);
}

uint64_t __55__PBItemRepresentation_loadDataWithContext_completion___block_invoke_3(void *a1)
{
  uint64_t v2 = a1[7];
  if (v2) {
    (*(void (**)(uint64_t, void, void, void))(v2 + 16))(v2, a1[4], a1[5], a1[6]);
  }
  uint64_t result = a1[8];
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

uint64_t __55__PBItemRepresentation_loadDataWithContext_completion___block_invoke_4(void *a1)
{
  uint64_t v2 = a1[5];
  if (v2) {
    (*(void (**)(uint64_t, void, void, void))(v2 + 16))(v2, *(void *)(*(void *)(a1[7] + 8) + 40), a1[4], *(void *)(*(void *)(a1[8] + 8) + 40));
  }
  uint64_t result = a1[6];
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (id)loadFileCopyWithCompletion:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__PBItemRepresentation_loadFileCopyWithCompletion___block_invoke;
  v8[3] = &unk_1E5555AC8;
  id v9 = v4;
  id v5 = v4;
  id v6 = [(PBItemRepresentation *)self loadFileCopyWithDetailedCompletion:v8];

  return v6;
}

uint64_t __51__PBItemRepresentation_loadFileCopyWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)loadFileCopyWithDetailedCompletion:(id)a3
{
  return [(PBItemRepresentation *)self loadFileCopyWithContext:0 completion:a3];
}

- (id)loadFileCopyWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:100];
  id v9 = [(PBItemRepresentation *)self preferredRepresentation];
  if (v9)
  {
    id v9 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:100];
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __59__PBItemRepresentation_loadFileCopyWithContext_completion___block_invoke;
  v17[3] = &unk_1E5555AA0;
  void v17[4] = self;
  id v19 = v7;
  id v10 = v9;
  id v18 = v10;
  id v11 = v7;
  id v12 = [(PBItemRepresentation *)self _loadWithContext:v6 completionBlock:v17];
  if (v10)
  {
    if ([(PBItemRepresentation *)self preferredRepresentation] == 2)
    {
      [v8 addChild:v12 withPendingUnitCount:10];
      BOOL v13 = v8;
      id v14 = v10;
      uint64_t v15 = 90;
    }
    else
    {
      [v8 addChild:v12 withPendingUnitCount:50];
      BOOL v13 = v8;
      id v14 = v10;
      uint64_t v15 = 50;
    }
  }
  else
  {
    BOOL v13 = v8;
    id v14 = v12;
    uint64_t v15 = 100;
  }
  [v13 addChild:v14 withPendingUnitCount:v15];

  return v8;
}

void __59__PBItemRepresentation_loadFileCopyWithContext_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = v14;
  id v17 = v16;
  if (v16)
  {
    id v18 = 0;
    id v19 = v16;
LABEL_16:
    objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __59__PBItemRepresentation_loadFileCopyWithContext_completion___block_invoke_3;
    void v31[3] = &unk_1E5555A28;
    id v28 = *(id *)(a1 + 48);
    id v32 = v18;
    id v33 = v13;
    id v34 = v19;
    id v35 = v28;
    id v36 = v15;
    id v29 = v15;
    id v30 = v13;
    id v24 = v19;
    id v25 = v18;
    PBDispatchAsyncCallback(v31);

    goto LABEL_17;
  }
  if (v11)
  {
    id v18 = CPTemporaryFileWithUniqueName();
    if (v18)
    {
      [v11 writeToURL:v18 atomically:1];
      id v20 = v18;
      id v21 = 0;
    }
    else
    {
      id v27 = _PBLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_18D208000, v27, OS_LOG_TYPE_FAULT, "Cannot create temporary file.", buf, 2u);
      }

      id v21 = PBCannotLoadRepresentationError(*(void *)(*(void *)(a1 + 32) + 24), 0);
    }

    if (v21) {
      goto LABEL_12;
    }
    goto LABEL_14;
  }
  if (!v12)
  {
    id v21 = PBNoLoaderAvailableError(*(void *)(*(void *)(a1 + 32) + 24), 0);
    id v18 = 0;
    if (v21)
    {
LABEL_12:
      id v19 = PBCannotLoadRepresentationError(*(void *)(*(void *)(a1 + 32) + 24), v21);
LABEL_15:

      goto LABEL_16;
    }
LABEL_14:
    id v19 = 0;
    goto LABEL_15;
  }
  id v22 = [v12 url];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __59__PBItemRepresentation_loadFileCopyWithContext_completion___block_invoke_28;
  v37[3] = &unk_1E5555AF0;
  v37[4] = *(void *)(a1 + 32);
  id v38 = v12;
  id v23 = *(id *)(a1 + 48);
  id v39 = v13;
  id v40 = v23;
  id v41 = v15;
  id v24 = v15;
  id v25 = v13;
  id v26 = PBCoordinatedRead(v22, v37);

  [*(id *)(a1 + 40) addChild:v26 withPendingUnitCount:100];
LABEL_17:
}

void __59__PBItemRepresentation_loadFileCopyWithContext_completion___block_invoke_28(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  id v7 = 0;
  uint64_t v8 = v5;
  if (a2 && !v5)
  {
    id v9 = *(void **)(*(void *)(a1 + 32) + 24);
    id v23 = 0;
    id v10 = PBCloneToTemporaryDir(a2, v9, &v23);
    id v11 = v23;
    if (v10) {
      BOOL v12 = v11 == 0;
    }
    else {
      BOOL v12 = 0;
    }
    if (v12)
    {
      id v7 = v10;
      uint64_t v8 = 0;
    }
    else
    {
      id v13 = v11;
      id v14 = [*(id *)(a1 + 40) url];
      uint64_t v8 = PBCannotCopyFileError(v14, 0, v13);

      if (v8)
      {
        id v6 = PBCannotLoadRepresentationError(*(void *)(*(void *)(a1 + 32) + 24), v8);
        id v7 = 0;
LABEL_12:

        goto LABEL_13;
      }
      id v7 = 0;
    }
    id v6 = 0;
    goto LABEL_12;
  }
LABEL_13:
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __59__PBItemRepresentation_loadFileCopyWithContext_completion___block_invoke_2;
  v17[3] = &unk_1E5555A28;
  id v21 = *(id *)(a1 + 56);
  id v18 = v7;
  id v19 = *(id *)(a1 + 48);
  id v20 = v6;
  id v22 = *(id *)(a1 + 64);
  id v15 = v6;
  id v16 = v7;
  PBDispatchAsyncCallback(v17);
}

uint64_t __59__PBItemRepresentation_loadFileCopyWithContext_completion___block_invoke_2(void *a1)
{
  uint64_t v2 = a1[7];
  if (v2)
  {
    (*(void (**)(uint64_t, void, void, void))(v2 + 16))(v2, a1[4], a1[5], a1[6]);
    if (a1[4])
    {
      uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v3 removeItemAtURL:a1[4] error:0];
    }
  }
  uint64_t result = a1[8];
  if (result)
  {
    id v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

uint64_t __59__PBItemRepresentation_loadFileCopyWithContext_completion___block_invoke_3(void *a1)
{
  uint64_t v2 = a1[7];
  if (v2)
  {
    (*(void (**)(uint64_t, void, void, void))(v2 + 16))(v2, a1[4], a1[5], a1[6]);
    if (a1[4])
    {
      uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v3 removeItemAtURL:a1[4] error:0];
    }
  }
  uint64_t result = a1[8];
  if (result)
  {
    id v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

- (id)loadOpenInPlaceWithCompletion:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__PBItemRepresentation_loadOpenInPlaceWithCompletion___block_invoke;
  v8[3] = &unk_1E5555B18;
  id v9 = v4;
  id v5 = v4;
  id v6 = [(PBItemRepresentation *)self loadOpenInPlaceWithDetailedCompletion:v8];

  return v6;
}

uint64_t __54__PBItemRepresentation_loadOpenInPlaceWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)loadOpenInPlaceWithDetailedCompletion:(id)a3
{
  return [(PBItemRepresentation *)self loadOpenInPlaceWithContext:0 completion:a3];
}

- (id)loadOpenInPlaceWithContext:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__PBItemRepresentation_loadOpenInPlaceWithContext_completion___block_invoke;
  v10[3] = &unk_1E5555B90;
  void v10[4] = self;
  id v11 = v6;
  id v7 = v6;
  uint64_t v8 = [(PBItemRepresentation *)self _loadWithContext:a3 completionBlock:v10];

  return v8;
}

void __62__PBItemRepresentation_loadOpenInPlaceWithContext_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = v14;
  id v17 = v16;
  if (v16)
  {
    id v18 = 0;
    LOBYTE(v19) = 0;
    id v20 = v16;
    goto LABEL_3;
  }
  if (v11)
  {
    id v21 = CPTemporaryFileWithUniqueName();
    if (v21)
    {
      if ([v11 writeToURL:v21 atomically:1])
      {
        id v18 = v21;
        id v19 = 0;
        goto LABEL_22;
      }
      id v32 = _PBLog();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_18D208000, v32, OS_LOG_TYPE_FAULT, "Could not write data to temporary file.", buf, 2u);
      }

      uint64_t v31 = PBCannotCopyFileError(0, 0, 0);
    }
    else
    {
      id v30 = _PBLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_18D208000, v30, OS_LOG_TYPE_FAULT, "Could not create temporary file.", buf, 2u);
      }

      uint64_t v31 = PBCannotCreateTemporaryFile(0, 0);
    }
    id v19 = (id)v31;
    id v18 = 0;
LABEL_22:

    if (v19) {
      goto LABEL_23;
    }
LABEL_27:
    id v20 = 0;
    goto LABEL_3;
  }
  if (v12)
  {
    int v22 = [v12 isReadonly];
    id v23 = [v12 url];
    id v18 = v23;
    if (!v22)
    {
      id v20 = 0;
      LOBYTE(v19) = 1;
      goto LABEL_3;
    }
    int v24 = [v23 startAccessingSecurityScopedResource];

    id v25 = objc_alloc_init(MEMORY[0x1E4F28CA0]);
    id v26 = [v12 url];
    id v44 = 0;
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __62__PBItemRepresentation_loadOpenInPlaceWithContext_completion___block_invoke_31;
    v40[3] = &unk_1E5555B40;
    id v27 = *(void **)(a1 + 40);
    v40[4] = *(void *)(a1 + 32);
    id v42 = v27;
    id v41 = v13;
    id v43 = v15;
    [v25 coordinateReadingItemAtURL:v26 options:1 error:&v44 byAccessor:v40];
    id v19 = v44;

    if (v24)
    {
      id v28 = [v12 url];
      [v28 stopAccessingSecurityScopedResource];
    }
    id v18 = 0;
    if (!v19)
    {
      id v20 = 0;
      goto LABEL_4;
    }
    int v29 = 0;
    goto LABEL_24;
  }
  PBNoLoaderAvailableError(*(void *)(*(void *)(a1 + 32) + 24), 0);
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  id v18 = 0;
  if (!v19) {
    goto LABEL_27;
  }
LABEL_23:
  int v29 = 1;
LABEL_24:
  PBCannotLoadRepresentationError(*(void *)(*(void *)(a1 + 32) + 24), v19);
  id v20 = (id)objc_claimAutoreleasedReturnValue();

  if (!v29) {
    goto LABEL_4;
  }
  LOBYTE(v19) = 0;
LABEL_3:
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __62__PBItemRepresentation_loadOpenInPlaceWithContext_completion___block_invoke_3;
  v33[3] = &unk_1E5555B68;
  id v37 = *(id *)(a1 + 40);
  id v18 = v18;
  id v34 = v18;
  char v39 = (char)v19;
  id v35 = v13;
  id v20 = v20;
  id v36 = v20;
  id v38 = v15;
  PBDispatchAsyncCallback(v33);

LABEL_4:
}

void __62__PBItemRepresentation_loadOpenInPlaceWithContext_completion___block_invoke_31(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    id v5 = *(void **)(*(void *)(a1 + 32) + 24);
    id v19 = 0;
    id v6 = PBCloneToTemporaryDir(v3, v5, &v19);
    id v7 = v19;
    if (v6) {
      BOOL v8 = v7 == 0;
    }
    else {
      BOOL v8 = 0;
    }
    if (v8)
    {
      id v10 = v6;
      id v9 = 0;
    }
    else
    {
      id v9 = v7;
      if (!v7)
      {
        id v9 = PBCannotCopyFileError(v4, 0, 0);
      }
      id v10 = 0;
    }
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __62__PBItemRepresentation_loadOpenInPlaceWithContext_completion___block_invoke_2;
    v13[3] = &unk_1E5555A28;
    id v17 = *(id *)(a1 + 48);
    id v14 = v10;
    id v15 = *(id *)(a1 + 40);
    id v16 = v9;
    id v18 = *(id *)(a1 + 56);
    id v11 = v9;
    id v12 = v10;
    PBDispatchAsyncCallback(v13);
  }
}

uint64_t __62__PBItemRepresentation_loadOpenInPlaceWithContext_completion___block_invoke_2(void *a1)
{
  uint64_t v2 = a1[7];
  if (v2) {
    (*(void (**)(uint64_t, void, void, void, void))(v2 + 16))(v2, a1[4], 0, a1[5], a1[6]);
  }
  uint64_t result = a1[8];
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

uint64_t __62__PBItemRepresentation_loadOpenInPlaceWithContext_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  if (v2) {
    (*(void (**)(uint64_t, void, void, void, void))(v2 + 16))(v2, *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 72), *(void *)(a1 + 40), *(void *)(a1 + 48));
  }
  uint64_t result = *(void *)(a1 + 64);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (NSString)typeIdentifier
{
  return self->_typeIdentifier;
}

- (unint64_t)preferredRepresentation
{
  return self->_preferredRepresentation;
}

- (void)setPreferredRepresentation:(unint64_t)a3
{
  self->_preferredRepresentation = a3;
}

- (int64_t)visibility
{
  return self->_visibility;
}

- (void)setVisibility:(int64_t)a3
{
  self->_visibility = a3;
}

- (BOOL)isDataAvailableImmediately
{
  return self->_isDataAvailableImmediately;
}

- (void)setIsDataAvailableImmediately:(BOOL)a3
{
  self->_isDataAvailableImmediately = a3;
}

- (BOOL)isDerivedRepresentation
{
  return self->_derivedRepresentation;
}

- (void)setDerivedRepresentation:(BOOL)a3
{
  self->_derivedRepresentation = a3;
}

- (PBItemRepresentationDataTransferDelegate)dataTransferDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataTransferDelegate);
  return (PBItemRepresentationDataTransferDelegate *)WeakRetained;
}

- (void)setDataTransferDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataTransferDelegate);
  objc_storeStrong((id *)&self->_typeIdentifier, 0);
  objc_storeStrong(&self->_loader, 0);
}

@end