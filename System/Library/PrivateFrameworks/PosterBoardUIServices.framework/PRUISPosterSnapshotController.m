@interface PRUISPosterSnapshotController
+ (id)sharedIncomingCallSnapshotController;
- (BOOL)isActive;
- (PRUISPosterSnapshotCache)cache;
- (PRUISPosterSnapshotController)initWithCache:(id)a3 instanceIdentifier:(id)a4;
- (PRUISPosterSnapshotController)initWithCacheURL:(id)a3;
- (id)acquireKeepActiveAssertionForReason:(id)a3;
- (id)currentSnapshotBundleForRequest:(id)a3 error:(id *)a4;
- (id)latestSnapshotBundleForRequest:(id)a3 error:(id *)a4;
- (void)executeSnapshotRequest:(id)a3 completion:(id)a4;
- (void)invalidate;
@end

@implementation PRUISPosterSnapshotController

- (PRUISPosterSnapshotController)initWithCache:(id)a3 instanceIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PRUISPosterSnapshotController;
  v9 = [(PRUISPosterSnapshotController *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_cache, a3);
    if (PUIFeatureEnabled())
    {
      uint64_t v11 = objc_opt_new();
      snapshotService = v10->_snapshotService;
      v10->_snapshotService = (PRUISSnapshotService *)v11;
    }
    id v13 = objc_alloc(MEMORY[0x263F5F5B0]);
    v14 = [v7 underlyingCache];
    uint64_t v15 = [v13 initWithCache:v14 instanceIdentifier:v8];
    snapshotController = v10->_snapshotController;
    v10->_snapshotController = (PUIPosterSnapshotController *)v15;
  }
  return v10;
}

- (PRUISPosterSnapshotController)initWithCacheURL:(id)a3
{
  id v4 = a3;
  v5 = [[PRUISPosterSnapshotFilesystemCache alloc] initWithURL:v4];

  v6 = [MEMORY[0x263F08C38] UUID];
  id v7 = [(PRUISPosterSnapshotController *)self initWithCache:v5 instanceIdentifier:v6];

  return v7;
}

- (void)executeSnapshotRequest:(id)a3 completion:(id)a4
{
  v52[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = (void (**)(id, id, void, void *))a4;
  id v7 = [v5 attachmentConfiguration];
  id v8 = [v7 attachments];
  uint64_t v9 = [v8 count];

  v10 = objc_opt_new();
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x3032000000;
  v49[3] = __Block_byref_object_copy_;
  v49[4] = __Block_byref_object_dispose_;
  id v50 = 0;
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x2020000000;
  v48[3] = -10000;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x3032000000;
  v45 = __Block_byref_object_copy_;
  v46 = __Block_byref_object_dispose_;
  id v47 = 0;
  uint64_t v11 = dispatch_group_create();
  if (v9)
  {
    v12 = [v5 attachmentConfiguration];
    id v13 = [v12 attachmentHostWindowScene];
    v14 = (void *)v43[5];
    v43[5] = (uint64_t)v13;

    id v15 = v13;
    if (!v15)
    {
      v25 = (void *)MEMORY[0x263F087E8];
      uint64_t v51 = *MEMORY[0x263F08338];
      v52[0] = @"No attachment host window scene specified; abort";
      id v18 = [NSDictionary dictionaryWithObjects:v52 forKeys:&v51 count:1];
      v24 = [v25 errorWithDomain:*MEMORY[0x263F5F5D8] code:1 userInfo:v18];
      v6[2](v6, v5, 0, v24);
      goto LABEL_9;
    }
    dispatch_group_enter(v11);
    v35[6] = MEMORY[0x263EF8330];
    v35[7] = 3221225472;
    v35[8] = __67__PRUISPosterSnapshotController_executeSnapshotRequest_completion___block_invoke;
    v35[9] = &unk_26546B170;
    v40 = v49;
    id v36 = v5;
    id v37 = v15;
    v41 = v48;
    id v38 = v10;
    v39 = v11;
    BSDispatchMain();
  }
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __67__PRUISPosterSnapshotController_executeSnapshotRequest_completion___block_invoke_3;
  v35[3] = &unk_26546B198;
  BOOL v16 = v9 == 0;
  v35[4] = v49;
  v35[5] = &v42;
  v17 = (void *)MEMORY[0x25A2F4350](v35);
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __67__PRUISPosterSnapshotController_executeSnapshotRequest_completion___block_invoke_5;
  v32[3] = &unk_26546B1C0;
  id v18 = v17;
  id v33 = v18;
  v34 = v6;
  v19 = (void *)MEMORY[0x25A2F4350](v32);
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __67__PRUISPosterSnapshotController_executeSnapshotRequest_completion___block_invoke_6;
  v27[3] = &unk_26546B210;
  id v28 = v5;
  id v29 = v10;
  id v20 = v19;
  v30 = self;
  id v31 = v20;
  uint64_t v21 = MEMORY[0x25A2F4350](v27);
  v22 = (void *)v21;
  if (v16)
  {
    (*(void (**)(uint64_t))(v21 + 16))(v21);
  }
  else
  {
    v23 = [MEMORY[0x263F5F450] snapshotWorkloop];
    dispatch_group_notify(v11, v23, v22);
  }
  v24 = v33;
LABEL_9:

  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(v48, 8);
  _Block_object_dispose(v49, 8);
}

void __67__PRUISPosterSnapshotController_executeSnapshotRequest_completion___block_invoke(uint64_t a1)
{
  v2 = (void *)*MEMORY[0x263F1D020];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __67__PRUISPosterSnapshotController_executeSnapshotRequest_completion___block_invoke_2;
  v5[3] = &unk_26546B170;
  uint64_t v10 = *(void *)(a1 + 64);
  id v6 = *(id *)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 72);
  id v7 = v3;
  uint64_t v11 = v4;
  id v8 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 56);
  [v2 _performBlockAfterCATransactionCommits:v5];
}

void __67__PRUISPosterSnapshotController_executeSnapshotRequest_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  uint64_t v2 = objc_opt_new();
  uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = [*(id *)(a1 + 32) screen];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  v39.origin.x = v7;
  v39.origin.y = v9;
  v39.size.width = v11;
  v39.size.height = v13;
  double MaxX = CGRectGetMaxX(v39);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v15 = [*(id *)(a1 + 32) attachmentConfiguration];
  BOOL v16 = [v15 attachments];
  v17 = [v16 sortedArrayUsingSelector:sel_compare_];

  id obj = v17;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    double v20 = v7 + MaxX * 10.0;
    uint64_t v32 = *(void *)v34;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v34 != v32) {
          objc_enumerationMutation(obj);
        }
        v22 = *(void **)(*((void *)&v33 + 1) + 8 * v21);
        v23 = [[_PRUISSecureSnapshotWindow alloc] initWithWindowScene:*(void *)(a1 + 40)];
        -[_PRUISSecureSnapshotWindow setFrame:](v23, "setFrame:", v20, v9, v11, v13);
        v24 = objc_opt_new();
        [(_PRUISSecureSnapshotWindow *)v23 setRootViewController:v24];

        [(_PRUISSecureSnapshotWindow *)v23 setWindowLevel:(double)*(uint64_t *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)];
        [(_PRUISSecureSnapshotWindow *)v23 setHidden:0];
        [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) addObject:v23];
        v25 = [v22 view];
        [(_PRUISSecureSnapshotWindow *)v23 addSubview:v25];

        id v26 = objc_alloc(MEMORY[0x263F5F598]);
        uint64_t v27 = [(_PRUISSecureSnapshotWindow *)v23 _contextId];
        id v28 = [v22 view];
        id v29 = [v28 layer];
        v30 = objc_msgSend(v26, "initWithContextId:renderId:level:", v27, CALayerGetRenderId(), objc_msgSend(v22, "level"));

        [*(id *)(a1 + 48) addObject:v30];
        --*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);

        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v19);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

uint64_t __67__PRUISPosterSnapshotController_executeSnapshotRequest_completion___block_invoke_3()
{
  return BSDispatchMain();
}

void __67__PRUISPosterSnapshotController_executeSnapshotRequest_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v6++), "setHidden:", 1, (void)v11);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }

  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  double v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  double v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = 0;
}

void __67__PRUISPosterSnapshotController_executeSnapshotRequest_completion___block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v10 = a2;
  id v7 = a3;
  id v8 = a4;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, id, id, id))(v9 + 16))(v9, v10, v7, v8);
  }
}

void __67__PRUISPosterSnapshotController_executeSnapshotRequest_completion___block_invoke_6(uint64_t a1)
{
  if (!PUIFeatureEnabled()) {
    goto LABEL_4;
  }
  id v2 = [*(id *)(a1 + 32) poster];
  uint64_t v3 = [v2 role];
  if ([v3 isEqualToString:*MEMORY[0x263F5F570]])
  {

LABEL_4:
    BOOL v4 = 0;
    uint64_t v5 = 1;
    goto LABEL_8;
  }
  uint64_t v6 = [*(id *)(a1 + 40) count];

  BOOL v7 = v6 == 0;
  BOOL v4 = v6 == 0;
  if (v7) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 1;
  }
LABEL_8:
  id v8 = *(void **)(a1 + 32);
  uint64_t v9 = [v8 priority];
  uint64_t v10 = *(void *)(a1 + 40);
  id v23 = 0;
  long long v11 = [v8 buildPosterKitSnapshotRequestForOutput:v5 priority:v9 sceneAttachments:v10 error:&v23];
  id v12 = v23;
  if (v12)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    uint64_t v13 = *(void *)(a1 + 48);
    if (v4)
    {
      long long v14 = *(void **)(v13 + 16);
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __67__PRUISPosterSnapshotController_executeSnapshotRequest_completion___block_invoke_7;
      v20[3] = &unk_26546B1E8;
      id v22 = *(id *)(a1 + 56);
      id v21 = *(id *)(a1 + 32);
      [v14 executeSnapshotRequest:v11 completion:v20];

      id v15 = v22;
    }
    else
    {
      uint64_t v16 = *(void **)(v13 + 8);
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __67__PRUISPosterSnapshotController_executeSnapshotRequest_completion___block_invoke_8;
      v17[3] = &unk_26546B1E8;
      id v19 = *(id *)(a1 + 56);
      id v18 = *(id *)(a1 + 32);
      [v16 executeSnapshotRequest:v11 completion:v17];

      id v15 = v19;
    }
  }
}

void __67__PRUISPosterSnapshotController_executeSnapshotRequest_completion___block_invoke_7(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v10 = a3;
  uint64_t v8 = a1 + 32;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(v8 + 8);
  if (a4)
  {
    (*(void (**)(uint64_t, uint64_t, void, uint64_t))(v6 + 16))(v6, v7, 0, a4);
  }
  else
  {
    uint64_t v9 = [[PRUISPosterSnapshotResult alloc] initWithPUIPosterSnapshotResult:v10];
    (*(void (**)(uint64_t, uint64_t, PRUISPosterSnapshotResult *, void))(v6 + 16))(v6, v7, v9, 0);
  }
}

void __67__PRUISPosterSnapshotController_executeSnapshotRequest_completion___block_invoke_8(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [[PRUISPosterSnapshotResult alloc] initWithPUIPosterSnapshotResult:v8];

  (*(void (**)(uint64_t, uint64_t, PRUISPosterSnapshotResult *, id))(v5 + 16))(v5, v6, v9, v7);
}

- (void)invalidate
{
}

- (id)latestSnapshotBundleForRequest:(id)a3 error:(id *)a4
{
  BOOL v4 = [(PRUISPosterSnapshotController *)self currentSnapshotBundleForRequest:a3 error:a4];
  uint64_t v5 = [v4 prPosterSnapshotBundle];

  return v5;
}

- (id)currentSnapshotBundleForRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (PUIFeatureEnabled()
    && ([v6 poster],
        id v7 = objc_claimAutoreleasedReturnValue(),
        [v7 role],
        id v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v8 isEqualToString:*MEMORY[0x263F5F570]],
        v8,
        v7,
        (v9 & 1) == 0))
  {
    id v17 = 0;
    long long v11 = objc_msgSend(v6, "buildPosterKitSnapshotRequestForOutput:priority:sceneAttachments:error:", 2, objc_msgSend(v6, "priority"), 0, &v17);
    id v12 = v17;
    uint64_t v13 = v12;
    if (v12)
    {
      id v10 = 0;
      if (a4) {
        *a4 = v12;
      }
    }
    else
    {
      long long v14 = [(PRUISSnapshotService *)self->_snapshotService cachedSnapshotForRequest:v11 error:a4];
      id v15 = [v14 snapshotBundle];
      id v10 = +[PRUISPosterSnapshotBundle snapshotBundleWithPUIPosterSnapshotBundle:v15];
    }
  }
  else
  {
    id v10 = [(PRUISPosterSnapshotFilesystemCache *)self->_cache latestSnapshotBundleForRequest:v6 error:a4];
  }

  return v10;
}

- (id)acquireKeepActiveAssertionForReason:(id)a3
{
  id v3 = a3;
  BOOL v4 = [(BSSimpleAssertion *)[PRUISPosterSnapshotControllerActiveAssertion alloc] initWithIdentifier:@"Keep Active Assertion" forReason:v3 invalidationBlock:&__block_literal_global];

  return v4;
}

- (PRUISPosterSnapshotCache)cache
{
  return (PRUISPosterSnapshotCache *)self->_cache;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_completionBlockQueue, 0);
  objc_storeStrong((id *)&self->_instanceIdentifier, 0);
  objc_storeStrong((id *)&self->_lock_keepActiveAssertionReasons, 0);
  objc_storeStrong((id *)&self->_activeAssertions, 0);
  objc_storeStrong((id *)&self->_snapshotService, 0);

  objc_storeStrong((id *)&self->_snapshotController, 0);
}

+ (id)sharedIncomingCallSnapshotController
{
  if (sharedIncomingCallSnapshotController___onceToken != -1) {
    dispatch_once(&sharedIncomingCallSnapshotController___onceToken, &__block_literal_global_0);
  }
  id v2 = (void *)sharedIncomingCallSnapshotController___sharedSnapshotController;

  return v2;
}

void __92__PRUISPosterSnapshotController_IncomingCallAdditions__sharedIncomingCallSnapshotController__block_invoke()
{
  id v3 = (id)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"DECAF000-0000-0000-0000-000000000002"];
  v0 = +[PRUISPosterSnapshotFilesystemCache incomingCallSnapshotCache];
  v1 = [[PRUISPosterSnapshotController alloc] initWithCache:v0 instanceIdentifier:v3];
  id v2 = (void *)sharedIncomingCallSnapshotController___sharedSnapshotController;
  sharedIncomingCallSnapshotController___sharedSnapshotController = (uint64_t)v1;
}

@end