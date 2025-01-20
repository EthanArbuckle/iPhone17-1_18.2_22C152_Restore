@interface SURollbackController
- (BOOL)isRollingBack;
- (SUManagerCore)core;
- (SURollbackController)initWithCore:(id)a3;
- (id)availableRollback;
- (id)previousRollback;
- (void)rollbackCompleted:(id)a3 withError:(id)a4;
- (void)rollbackReadyForReboot:(id)a3;
- (void)rollbackStarted:(id)a3;
- (void)rollbackUpdateWithOptions:(id)a3 completion:(id)a4;
- (void)setCore:(id)a3;
- (void)setRollingBack:(BOOL)a3;
@end

@implementation SURollbackController

- (SURollbackController)initWithCore:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SURollbackController;
  v5 = [(SURollbackController *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_core, v4);
    v6->_rollingBack = 0;
  }

  return v6;
}

- (void)rollbackUpdateWithOptions:(id)a3 completion:(id)a4
{
  v6 = (SURollbackOptions *)a3;
  id v7 = a4;
  objc_super v8 = [(SURollbackController *)self core];
  v9 = [v8 workQueue];
  dispatch_assert_queue_V2(v9);

  v10 = +[SUPreferences sharedInstance];
  LODWORD(v9) = [v10 disableRollback];

  if (!v9)
  {
    v19 = [(SURollbackController *)self core];
    v18 = [v19 eligibleRollbackWithOptions:v6];

    if (v18)
    {
      if (!v6) {
        v6 = objc_alloc_init(SURollbackOptions);
      }
      v27 = [(SURollbackController *)self core];
      v28 = [v27 delegate];
      char v29 = objc_opt_respondsToSelector();

      if (v29)
      {
        v37 = [(SURollbackController *)self core];
        v38 = [v37 externWorkQueue];
        v41[0] = MEMORY[0x263EF8330];
        v41[1] = 3221225472;
        v41[2] = (uint64_t)__61__SURollbackController_rollbackUpdateWithOptions_completion___block_invoke;
        v41[3] = (uint64_t)&unk_26447D3B0;
        v41[4] = (uint64_t)self;
        id v42 = v18;
        v6 = v6;
        v43 = v6;
        id v44 = v7;
        dispatch_async(v38, v41);

        goto LABEL_13;
      }
      SULogInfo(@"Unable to rollback update because delegate callback not implemented", v30, v31, v32, v33, v34, v35, v36, v41[0]);
      uint64_t v39 = 91;
    }
    else
    {
      SULogInfo(@"Unable to rollback update. No eligible rollback found", v20, v21, v22, v23, v24, v25, v26, v41[0]);
      if (!v7) {
        goto LABEL_13;
      }
      uint64_t v39 = 89;
    }
    v40 = +[SUUtility errorWithCode:v39];
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v40);

    goto LABEL_13;
  }
  SULogInfo(@"Preventing rollback due to preferences", v11, v12, v13, v14, v15, v16, v17, v41[0]);
  if (v7)
  {
    v18 = +[SUUtility errorWithCode:88];
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v18);
LABEL_13:
  }
}

void __61__SURollbackController_rollbackUpdateWithOptions_completion___block_invoke(id *a1)
{
  v2 = [a1[4] core];
  v3 = [v2 delegate];
  id v4 = a1[5];
  id v5 = a1[6];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __61__SURollbackController_rollbackUpdateWithOptions_completion___block_invoke_2;
  v6[3] = &unk_26447F158;
  v6[4] = a1[4];
  id v9 = a1[7];
  id v7 = a1[5];
  id v8 = a1[6];
  [v3 rollbackReadyToStart:v4 options:v5 completion:v6];
}

void __61__SURollbackController_rollbackUpdateWithOptions_completion___block_invoke_2(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [*(id *)(a1 + 32) core];
  v10 = [v9 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__SURollbackController_rollbackUpdateWithOptions_completion___block_invoke_3;
  block[3] = &unk_26447F130;
  id v11 = *(id *)(a1 + 56);
  char v23 = a2;
  id v17 = v7;
  id v18 = v8;
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = *(void **)(a1 + 40);
  id v22 = v11;
  uint64_t v19 = v12;
  id v20 = v13;
  id v21 = *(id *)(a1 + 48);
  id v14 = v8;
  id v15 = v7;
  dispatch_async(v10, block);
}

void __61__SURollbackController_rollbackUpdateWithOptions_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 72);
  if (v2) {
    (*(void (**)(uint64_t, void, void, void))(v2 + 16))(v2, *(unsigned __int8 *)(a1 + 80), *(void *)(a1 + 32), *(void *)(a1 + 40));
  }
  if (*(unsigned char *)(a1 + 80))
  {
    v3 = +[SUPreferences sharedInstance];
    int v4 = [v3 fakeSplatInstalled];

    if (v4)
    {
      SULogInfo(@"%s: To rollback the fake splat...", v5, v6, v7, v8, v9, v10, v11, (uint64_t)"-[SURollbackController rollbackUpdateWithOptions:completion:]_block_invoke_3");
      uint64_t v12 = [*(id *)(a1 + 48) core];
      uint64_t v13 = [v12 workQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __61__SURollbackController_rollbackUpdateWithOptions_completion___block_invoke_4;
      block[3] = &unk_26447C8C8;
      id v14 = *(void **)(a1 + 56);
      void block[4] = *(void *)(a1 + 48);
      id v20 = v14;
      dispatch_async(v13, block);
    }
    else
    {
      id v15 = [*(id *)(a1 + 48) core];
      uint64_t v16 = [v15 engine];
      [v16 createBrainLoadLockAssertion:&__block_literal_global_22];

      id v18 = [*(id *)(a1 + 48) core];
      id v17 = [v18 engine];
      [v17 rollbackUpdateWithOptions:*(void *)(a1 + 64)];
    }
  }
}

void __61__SURollbackController_rollbackUpdateWithOptions_completion___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) rollbackStarted:*(void *)(a1 + 40)];
  uint64_t v2 = [*(id *)(a1 + 32) core];
  v3 = [v2 workQueue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __61__SURollbackController_rollbackUpdateWithOptions_completion___block_invoke_5;
  v5[3] = &unk_26447C8C8;
  int v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  dispatch_async(v3, v5);
}

uint64_t __61__SURollbackController_rollbackUpdateWithOptions_completion___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) rollbackCompleted:*(void *)(a1 + 40) withError:0];
}

void __61__SURollbackController_rollbackUpdateWithOptions_completion___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2) {
    SULogInfo(@"%s: Failed to create brain load lock assertion: %@", a2, a3, a4, a5, a6, a7, a8, (uint64_t)"-[SURollbackController rollbackUpdateWithOptions:completion:]_block_invoke_6");
  }
}

- (BOOL)isRollingBack
{
  v3 = [(SURollbackController *)self core];
  int v4 = [v3 workQueue];
  dispatch_assert_queue_V2(v4);

  return self->_rollingBack;
}

- (void)setRollingBack:(BOOL)a3
{
  uint64_t v5 = [(SURollbackController *)self core];
  id v6 = [v5 workQueue];
  dispatch_assert_queue_V2(v6);

  self->_rollingBack = a3;
}

- (void)rollbackStarted:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SURollbackController *)self core];
  id v6 = [v5 workQueue];
  dispatch_assert_queue_V2(v6);

  SULogInfo(@"Rollback Started: %@", v7, v8, v9, v10, v11, v12, v13, (uint64_t)v4);
  self->_rollingBack = 1;
  id v14 = [(SURollbackController *)self core];
  id v15 = [v14 delegate];
  char v16 = objc_opt_respondsToSelector();

  if (v16)
  {
    id v17 = [(SURollbackController *)self core];
    id v18 = [v17 externWorkQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __40__SURollbackController_rollbackStarted___block_invoke;
    block[3] = &unk_26447C8C8;
    void block[4] = self;
    id v20 = v4;
    dispatch_async(v18, block);
  }
}

void __40__SURollbackController_rollbackStarted___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) core];
  uint64_t v2 = [v3 delegate];
  [v2 rollbackDidStart:*(void *)(a1 + 40)];
}

- (void)rollbackCompleted:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SURollbackController *)self core];
  uint64_t v9 = [v8 workQueue];
  dispatch_assert_queue_V2(v9);

  self->_rollingBack = 0;
  uint64_t v10 = [MEMORY[0x263F77D98] sharedDevice];
  LODWORD(v9) = [v10 hasSemiSplatActive];

  if (v9)
  {
    SULogInfo(@"Rollback already applied, just proceed to reboot", v11, v12, v13, v14, v15, v16, v17, v43);
LABEL_6:
    SULogInfo(@"Rollback succeeded: %@. Informing clients", v11, v12, v13, v14, v15, v16, v17, (uint64_t)v6);
    if (v6
      || ([(SURollbackController *)self core],
          uint64_t v25 = objc_claimAutoreleasedReturnValue(),
          [v25 eligibleRollbackWithOptions:0],
          id v6 = (id)objc_claimAutoreleasedReturnValue(),
          v25,
          v6))
    {
      uint64_t v26 = [v6 productBuildVersion];
      SULogInfo(@"Adding %@ to rolledBackDescritor list", v27, v28, v29, v30, v31, v32, v33, (uint64_t)v26);

      uint64_t v34 = [(SURollbackController *)self core];
      uint64_t v35 = [v34 state];
      uint64_t v36 = [v6 productBuildVersion];
      [v35 addRolledBackBuildVersion:v36];

      v37 = [(SURollbackController *)self core];
      v38 = [v37 state];
      [v38 save];
    }
    uint64_t v39 = [(SURollbackController *)self core];
    v40 = [v39 delegate];
    char v41 = objc_opt_respondsToSelector();

    if (v41)
    {
      uint64_t v24 = [(SURollbackController *)self core];
      id v42 = [v24 externWorkQueue];
      v44[0] = MEMORY[0x263EF8330];
      v44[1] = 3221225472;
      v44[2] = __52__SURollbackController_rollbackCompleted_withError___block_invoke_2;
      v44[3] = &unk_26447C8C8;
      v44[4] = self;
      char v23 = &v45;
      id v6 = v6;
      id v45 = v6;
      dispatch_async(v42, v44);

      goto LABEL_11;
    }
    goto LABEL_12;
  }
  if (!v7) {
    goto LABEL_6;
  }
  SULogInfo(@"Rollback failed with error: %@", v11, v12, v13, v14, v15, v16, v17, (uint64_t)v7);
  id v18 = [(SURollbackController *)self core];
  uint64_t v19 = [v18 delegate];
  char v20 = objc_opt_respondsToSelector();

  if (v20)
  {
    id v21 = [(SURollbackController *)self core];
    id v22 = [v21 externWorkQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __52__SURollbackController_rollbackCompleted_withError___block_invoke;
    block[3] = &unk_26447CD70;
    void block[4] = self;
    char v23 = &v47;
    id v6 = v6;
    id v47 = v6;
    id v48 = v7;
    dispatch_async(v22, block);

    uint64_t v24 = v48;
LABEL_11:
  }
LABEL_12:
}

void __52__SURollbackController_rollbackCompleted_withError___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) core];
  uint64_t v2 = [v3 delegate];
  [v2 rollbackDidFail:*(void *)(a1 + 40) withError:*(void *)(a1 + 48)];
}

void __52__SURollbackController_rollbackCompleted_withError___block_invoke_2(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) core];
  uint64_t v2 = [v3 delegate];
  [v2 rollbackSucceeded:*(void *)(a1 + 40)];
}

- (void)rollbackReadyForReboot:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SURollbackController *)self core];
  id v6 = [v5 delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    uint64_t v8 = [(SURollbackController *)self core];
    uint64_t v9 = [v8 externWorkQueue];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __47__SURollbackController_rollbackReadyForReboot___block_invoke;
    v10[3] = &unk_26447C8C8;
    v10[4] = self;
    id v11 = v4;
    dispatch_async(v9, v10);
  }
}

void __47__SURollbackController_rollbackReadyForReboot___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) core];
  uint64_t v2 = [v3 delegate];
  [v2 rollbackReadyForReboot:*(void *)(a1 + 40)];
}

- (id)availableRollback
{
  id v3 = [(SURollbackController *)self core];
  id v4 = [v3 workQueue];
  dispatch_assert_queue_V2(v4);

  uint64_t v5 = [(SURollbackController *)self core];
  id v6 = [v5 engine];
  char v7 = [v6 availableRollback];

  return v7;
}

- (id)previousRollback
{
  id v3 = [(SURollbackController *)self core];
  id v4 = [v3 workQueue];
  dispatch_assert_queue_V2(v4);

  uint64_t v5 = [(SURollbackController *)self core];
  id v6 = [v5 engine];
  char v7 = [v6 previousRollback];

  return v7;
}

- (SUManagerCore)core
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_core);

  return (SUManagerCore *)WeakRetained;
}

- (void)setCore:(id)a3
{
}

- (void).cxx_destruct
{
}

@end