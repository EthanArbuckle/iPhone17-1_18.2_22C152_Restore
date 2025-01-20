@interface NCBulletinActionRunner
- (BBAction)action;
- (BBBulletin)bulletin;
- (BBObserver)observer;
- (BOOL)responseWasSent;
- (BOOL)shouldForwardAction;
- (NCBulletinActionRunner)initWithAction:(id)a3 bulletin:(id)a4 observer:(id)a5;
- (void)executeAction:(id)a3 fromOrigin:(id)a4 endpoint:(id)a5 withParameters:(id)a6 completion:(id)a7;
- (void)executeSiriAction:(id)a3 completion:(id)a4;
- (void)setResponseWasSent:(BOOL)a3;
- (void)setShouldForwardAction:(BOOL)a3;
@end

@implementation NCBulletinActionRunner

- (NCBulletinActionRunner)initWithAction:(id)a3 bulletin:(id)a4 observer:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)NCBulletinActionRunner;
  v12 = [(NCBulletinActionRunner *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_observer, a5);
    objc_storeStrong((id *)&v13->_bulletin, a4);
    objc_storeStrong((id *)&v13->_action, a3);
    *(_WORD *)&v13->_shouldForwardAction = 1;
  }

  return v13;
}

- (void)executeAction:(id)a3 fromOrigin:(id)a4 endpoint:(id)a5 withParameters:(id)a6 completion:(id)a7
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  objc_super v15 = (__CFString *)a6;
  id v16 = a7;
  v17 = self;
  objc_sync_enter(v17);
  if ([v12 isSiriAction])
  {
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __86__NCBulletinActionRunner_executeAction_fromOrigin_endpoint_withParameters_completion___block_invoke;
    v40[3] = &unk_1E6A92578;
    v41 = v16;
    [(NCBulletinActionRunner *)v17 executeSiriAction:v12 completion:v40];
    v18 = v41;
  }
  else
  {
    v19 = (id *)MEMORY[0x1E4FB3750];
    if (v17->_responseWasSent)
    {
      v18 = (id)*MEMORY[0x1E4FB3750];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v20 = [v12 identifier];
        -[NCBulletinActionRunner executeAction:fromOrigin:endpoint:withParameters:completion:](v20, (uint64_t)v13, buf, v18);
      }
    }
    else
    {
      v17->_responseWasSent = 1;
      v21 = *v19;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        id v22 = [v12 identifier];
        uint64_t v23 = [(__CFString *)v15 count];
        v24 = @"{}";
        *(_DWORD *)buf = 138543875;
        id v45 = v22;
        if (v23) {
          v24 = v15;
        }
        __int16 v46 = 2114;
        id v47 = v13;
        __int16 v48 = 2113;
        v49 = v24;
        _os_log_impl(&dword_1D7C04000, v21, OS_LOG_TYPE_DEFAULT, "Sending response for action %{public}@ from origin %{public}@ with parameters %{private}@", buf, 0x20u);
      }
      v18 = [MEMORY[0x1E4F1CAD0] setWithObject:v17->_bulletin];
      v30 = [(BBBulletin *)v17->_bulletin sectionID];
      v25 = [(NCBulletinActionRunner *)v17 bulletin];
      v26 = [(NCBulletinActionRunner *)v17 action];
      v27 = [v25 responseForAction:v26];

      if (v27 && v17->_shouldForwardAction)
      {
        if (v15)
        {
          uint64_t v42 = *MEMORY[0x1E4F50CF8];
          v43 = v15;
          v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
          [v27 setContext:v28];
          [v27 setOriginID:v13];
          [v27 setEndpoint:v14];
        }
        objc_initWeak((id *)buf, v17->_observer);
        objc_initWeak(&location, v17);
        observer = v17->_observer;
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __86__NCBulletinActionRunner_executeAction_fromOrigin_endpoint_withParameters_completion___block_invoke_6;
        v31[3] = &unk_1E6A925A0;
        v32 = v15;
        id v33 = v12;
        objc_copyWeak(&v37, (id *)buf);
        v34 = v18;
        id v35 = v30;
        objc_copyWeak(&v38, &location);
        id v36 = v16;
        [(BBObserver *)observer sendResponse:v27 withCompletion:v31];

        objc_destroyWeak(&v38);
        objc_destroyWeak(&v37);

        objc_destroyWeak(&location);
        objc_destroyWeak((id *)buf);
      }
      else if ([v12 shouldDismissNotification])
      {
        [(BBObserver *)v17->_observer clearBulletins:v18 inSection:v30];
        if (v16) {
          (*((void (**)(id, uint64_t))v16 + 2))(v16, 1);
        }
      }
      else
      {
        [(NCBulletinActionRunner *)v17 setResponseWasSent:0];
      }
    }
  }

  objc_sync_exit(v17);
}

uint64_t __86__NCBulletinActionRunner_executeAction_fromOrigin_endpoint_withParameters_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __86__NCBulletinActionRunner_executeAction_fromOrigin_endpoint_withParameters_completion___block_invoke_6(uint64_t a1, uint64_t a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v4 = [*(id *)(a1 + 32) objectForKey:@"NCNotificationActionDeferClearForNotificationSummaryKey"];
  v5 = v4;
  if (v4) {
    int v6 = [v4 BOOLValue];
  }
  else {
    int v6 = 0;
  }
  v7 = (void *)*MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(void **)(a1 + 40);
    id v9 = v7;
    id v10 = [v8 identifier];
    int v14 = 138543874;
    objc_super v15 = v10;
    __int16 v16 = 1024;
    int v17 = a2;
    __int16 v18 = 1024;
    int v19 = v6;
    _os_log_impl(&dword_1D7C04000, v9, OS_LOG_TYPE_DEFAULT, "Running completion block for sendResponse for action %{public}@ with success=%d \t deferClearForNotificationSummary=%{BOOL}d", (uint8_t *)&v14, 0x18u);
  }
  if (a2 && (([*(id *)(a1 + 40) shouldDismissNotification] ^ 1 | v6) & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    [WeakRetained clearBulletins:*(void *)(a1 + 48) inSection:*(void *)(a1 + 56)];
  }
  id v12 = objc_loadWeakRetained((id *)(a1 + 80));
  [v12 setResponseWasSent:0];

  uint64_t v13 = *(void *)(a1 + 64);
  if (v13) {
    (*(void (**)(uint64_t, uint64_t))(v13 + 16))(v13, a2);
  }
}

- (void)executeSiriAction:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4F9F950]);
  id v7 = objc_alloc(MEMORY[0x1E4F9F948]);
  v8 = [(NCBulletinActionRunner *)self bulletin];
  id v9 = (void *)[v7 initWithBBBulletin:v8];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__NCBulletinActionRunner_executeSiriAction_completion___block_invoke;
  v11[3] = &unk_1E6A92578;
  id v12 = v5;
  id v10 = v5;
  [v6 activateWithContext:v9 completion:v11];
}

uint64_t __55__NCBulletinActionRunner_executeSiriAction_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)shouldForwardAction
{
  return self->_shouldForwardAction;
}

- (void)setShouldForwardAction:(BOOL)a3
{
  self->_shouldForwardAction = a3;
}

- (BBAction)action
{
  return self->_action;
}

- (BBBulletin)bulletin
{
  return self->_bulletin;
}

- (BBObserver)observer
{
  return self->_observer;
}

- (BOOL)responseWasSent
{
  return self->_responseWasSent;
}

- (void)setResponseWasSent:(BOOL)a3
{
  self->_responseWasSent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observer, 0);
  objc_storeStrong((id *)&self->_bulletin, 0);

  objc_storeStrong((id *)&self->_action, 0);
}

- (void)executeAction:(uint8_t *)buf fromOrigin:(os_log_t)log endpoint:withParameters:completion:.cold.1(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1D7C04000, log, OS_LOG_TYPE_ERROR, "Tried to send response for action %{public}@ more than once. origin: %{public}@", buf, 0x16u);
}

@end