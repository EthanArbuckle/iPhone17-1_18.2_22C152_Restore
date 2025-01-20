@interface SLCollaborationSigningController
- (BOOL)synchronous;
- (OS_dispatch_queue)targetSerialQueue;
- (SLCollaborationSigningController)initWithTargetSerialQueue:(id)a3 synchronous:(BOOL)a4;
- (SLRemoteTaskManager)taskManager;
- (id)taskServiceWithErrorHandler:(id)a3;
- (void)setSynchronous:(BOOL)a3;
- (void)setTargetSerialQueue:(id)a3;
- (void)setTaskManager:(id)a3;
- (void)signData:(id)a3 forCollaborationIdentifier:(id)a4 trackingPreventionSalt:(id)a5 timeout:(double)a6 completion:(id)a7;
- (void)signSourceProcessWithMetadata:(id)a3 timeout:(double)a4 completion:(id)a5;
@end

@implementation SLCollaborationSigningController

- (SLCollaborationSigningController)initWithTargetSerialQueue:(id)a3 synchronous:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = objc_opt_class();
  v15.receiver = self;
  v15.super_class = (Class)SLCollaborationSigningController;
  v9 = [(SLDServiceProxy *)&v15 initWithServiceClass:v8 targetSerialQueue:v7 delegate:0];
  if (v9)
  {
    v10 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = @"NO";
      *(_DWORD *)buf = 134218498;
      v17 = v9;
      __int16 v18 = 2112;
      if (v4) {
        v11 = @"YES";
      }
      id v19 = v7;
      __int16 v20 = 2112;
      v21 = v11;
      _os_log_impl(&dword_19BE17000, v10, OS_LOG_TYPE_INFO, "[%p] initWithTargetSerialQueue: %@ synchronous: %@", buf, 0x20u);
    }

    objc_storeStrong((id *)&v9->_targetSerialQueue, a3);
    v9->_synchronous = v4;
    v12 = [[SLRemoteTaskManager alloc] initWithDelegate:v9 targetSerialQueue:v9->_targetSerialQueue synchronous:v4];
    taskManager = v9->_taskManager;
    v9->_taskManager = v12;

    [(SLDServiceProxy *)v9 connect];
  }

  return v9;
}

- (void)signData:(id)a3 forCollaborationIdentifier:(id)a4 trackingPreventionSalt:(id)a5 timeout:(double)a6 completion:(id)a7
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__6;
  v39 = __Block_byref_object_dispose__6;
  id v40 = [MEMORY[0x1E4F29128] UUID];
  v16 = SLFrameworkLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    uint64_t v17 = v36[5];
    *(_DWORD *)buf = 136315650;
    v42 = "-[SLCollaborationSigningController signData:forCollaborationIdentifier:trackingPreventionSalt:timeout:completion:]";
    __int16 v43 = 2112;
    id v44 = v13;
    __int16 v45 = 2112;
    uint64_t v46 = v17;
    _os_log_impl(&dword_19BE17000, v16, OS_LOG_TYPE_INFO, "%s: identifier: %@ uuid: %@", buf, 0x20u);
  }

  __int16 v18 = [(SLCollaborationSigningController *)self taskManager];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __114__SLCollaborationSigningController_signData_forCollaborationIdentifier_trackingPreventionSalt_timeout_completion___block_invoke;
  v28[3] = &unk_1E58A8F18;
  id v19 = v12;
  id v29 = v19;
  id v20 = v13;
  id v30 = v20;
  id v21 = v14;
  id v31 = v21;
  v32 = self;
  v34 = &v35;
  id v33 = v15;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __114__SLCollaborationSigningController_signData_forCollaborationIdentifier_trackingPreventionSalt_timeout_completion___block_invoke_9;
  v25[3] = &unk_1E58A8C68;
  v27 = &v35;
  id v26 = v33;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __114__SLCollaborationSigningController_signData_forCollaborationIdentifier_trackingPreventionSalt_timeout_completion___block_invoke_14;
  v23[3] = &unk_1E58A8BC8;
  id v22 = v26;
  id v24 = v22;
  [v18 startTask:v28 withTimeout:v25 timeoutHandler:v23 errorHandler:a6];

  _Block_object_dispose(&v35, 8);
}

id __114__SLCollaborationSigningController_signData_forCollaborationIdentifier_trackingPreventionSalt_timeout_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __114__SLCollaborationSigningController_signData_forCollaborationIdentifier_trackingPreventionSalt_timeout_completion___block_invoke_2;
  v14[3] = &unk_1E58A8EF0;
  uint64_t v8 = *(void *)(a1 + 48);
  v14[4] = *(void *)(a1 + 56);
  id v15 = v5;
  long long v13 = *(_OWORD *)(a1 + 64);
  id v9 = (id)v13;
  long long v16 = v13;
  id v10 = v5;
  v11 = [a2 signData:v6 forCollaborationIdentifier:v7 trackingPreventionSalt:v8 reply:v14];

  return v11;
}

void __114__SLCollaborationSigningController_signData_forCollaborationIdentifier_trackingPreventionSalt_timeout_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) targetSerialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __114__SLCollaborationSigningController_signData_forCollaborationIdentifier_trackingPreventionSalt_timeout_completion___block_invoke_3;
  block[3] = &unk_1E58A8C18;
  id v13 = *(id *)(a1 + 40);
  id v14 = v6;
  long long v11 = *(_OWORD *)(a1 + 48);
  id v8 = (id)v11;
  long long v16 = v11;
  id v15 = v5;
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v7, block);
}

uint64_t __114__SLCollaborationSigningController_signData_forCollaborationIdentifier_trackingPreventionSalt_timeout_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(a1 + 32) isValid];
  if (result)
  {
    [*(id *)(a1 + 32) suppress];
    v3 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      uint64_t v5 = *(void *)(a1 + 40);
      int v6 = 138412546;
      uint64_t v7 = v4;
      __int16 v8 = 2112;
      uint64_t v9 = v5;
      _os_log_impl(&dword_19BE17000, v3, OS_LOG_TYPE_DEFAULT, "[SLCollaborationSigningController] signData:forCollaborationIdentifier: received response for request UUID: %@, error: %@", (uint8_t *)&v6, 0x16u);
    }

    return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  return result;
}

void __114__SLCollaborationSigningController_signData_forCollaborationIdentifier_trackingPreventionSalt_timeout_completion___block_invoke_9(uint64_t a1)
{
  v2 = SLFrameworkLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __114__SLCollaborationSigningController_signData_forCollaborationIdentifier_trackingPreventionSalt_timeout_completion___block_invoke_9_cold_1();
  }

  v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.SocialLayer.SLCollaborationSigningController" code:2 userInfo:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __114__SLCollaborationSigningController_signData_forCollaborationIdentifier_trackingPreventionSalt_timeout_completion___block_invoke_14(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)signSourceProcessWithMetadata:(id)a3 timeout:(double)a4 completion:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  id v29 = __Block_byref_object_copy__6;
  id v30 = __Block_byref_object_dispose__6;
  id v31 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v10 = SLFrameworkLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    long long v11 = [v8 localIdentifier];
    uint64_t v12 = v27[5];
    *(_DWORD *)buf = 136315650;
    id v33 = "-[SLCollaborationSigningController signSourceProcessWithMetadata:timeout:completion:]";
    __int16 v34 = 2112;
    uint64_t v35 = v11;
    __int16 v36 = 2112;
    uint64_t v37 = v12;
    _os_log_impl(&dword_19BE17000, v10, OS_LOG_TYPE_INFO, "%s: metadata local identifier: %@ uuid: %@", buf, 0x20u);
  }
  id v13 = [(SLCollaborationSigningController *)self taskManager];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __85__SLCollaborationSigningController_signSourceProcessWithMetadata_timeout_completion___block_invoke;
  v21[3] = &unk_1E58A8F90;
  id v14 = v8;
  id v22 = v14;
  v23 = self;
  v25 = &v26;
  id v24 = v9;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __85__SLCollaborationSigningController_signSourceProcessWithMetadata_timeout_completion___block_invoke_16;
  v18[3] = &unk_1E58A8C68;
  id v20 = &v26;
  id v19 = v24;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __85__SLCollaborationSigningController_signSourceProcessWithMetadata_timeout_completion___block_invoke_17;
  v16[3] = &unk_1E58A8BC8;
  id v15 = v19;
  id v17 = v15;
  [v13 startTask:v21 withTimeout:v18 timeoutHandler:v16 errorHandler:a4];

  _Block_object_dispose(&v26, 8);
}

id __85__SLCollaborationSigningController_signSourceProcessWithMetadata_timeout_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __85__SLCollaborationSigningController_signSourceProcessWithMetadata_timeout_completion___block_invoke_2;
  v10[3] = &unk_1E58A8F68;
  int v6 = *(void **)(a1 + 32);
  v10[4] = *(void *)(a1 + 40);
  id v11 = v5;
  uint64_t v14 = *(void *)(a1 + 56);
  id v12 = v6;
  id v13 = *(id *)(a1 + 48);
  id v7 = v5;
  id v8 = [a2 signSourceProcessWithMetadata:v6 reply:v10];

  return v8;
}

void __85__SLCollaborationSigningController_signSourceProcessWithMetadata_timeout_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) targetSerialQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __85__SLCollaborationSigningController_signSourceProcessWithMetadata_timeout_completion___block_invoke_3;
  v10[3] = &unk_1E58A8F40;
  id v11 = *(id *)(a1 + 40);
  id v12 = v5;
  uint64_t v16 = *(void *)(a1 + 64);
  id v13 = *(id *)(a1 + 48);
  id v14 = v6;
  id v15 = *(id *)(a1 + 56);
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, v10);
}

uint64_t __85__SLCollaborationSigningController_signSourceProcessWithMetadata_timeout_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(a1 + 32) isValid];
  if (result)
  {
    [*(id *)(a1 + 32) suppress];
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = SLFrameworkLogHandle();
    id v5 = v4;
    if (v3)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
        uint64_t v7 = *(void *)(a1 + 56);
        int v8 = 138412546;
        uint64_t v9 = v6;
        __int16 v10 = 2112;
        uint64_t v11 = v7;
        _os_log_impl(&dword_19BE17000, v5, OS_LOG_TYPE_DEFAULT, "[SLCollaborationSigningController] signSourceProcessWithMetadata: received response for request UUID: %@, error: %@", (uint8_t *)&v8, 0x16u);
      }
    }
    else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      __85__SLCollaborationSigningController_signSourceProcessWithMetadata_timeout_completion___block_invoke_3_cold_1(a1, v5);
    }

    return (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  return result;
}

void __85__SLCollaborationSigningController_signSourceProcessWithMetadata_timeout_completion___block_invoke_16(uint64_t a1)
{
  v2 = SLFrameworkLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __85__SLCollaborationSigningController_signSourceProcessWithMetadata_timeout_completion___block_invoke_16_cold_1();
  }

  uint64_t v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.SocialLayer.SLCollaborationSigningController" code:2 userInfo:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __85__SLCollaborationSigningController_signSourceProcessWithMetadata_timeout_completion___block_invoke_17(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)taskServiceWithErrorHandler:(id)a3
{
  uint64_t v3 = [(SLDServiceProxy *)self synchronousRemoteServiceWithErrorHandler:a3];
  if (([v3 conformsToProtocol:&unk_1EEC3BE60] & 1) == 0)
  {

    uint64_t v3 = 0;
  }
  return v3;
}

- (OS_dispatch_queue)targetSerialQueue
{
  return self->_targetSerialQueue;
}

- (void)setTargetSerialQueue:(id)a3
{
}

- (SLRemoteTaskManager)taskManager
{
  return self->_taskManager;
}

- (void)setTaskManager:(id)a3
{
}

- (BOOL)synchronous
{
  return self->_synchronous;
}

- (void)setSynchronous:(BOOL)a3
{
  self->_synchronous = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskManager, 0);
  objc_storeStrong((id *)&self->_targetSerialQueue, 0);
}

void __114__SLCollaborationSigningController_signData_forCollaborationIdentifier_trackingPreventionSalt_timeout_completion___block_invoke_9_cold_1()
{
  OUTLINED_FUNCTION_0_4(*MEMORY[0x1E4F143B8]);
  int v2 = 138412290;
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_19BE17000, v1, OS_LOG_TYPE_ERROR, "[SLCollaborationSigningController] signData:forCollaborationIdentifier: request with UUID timed out: %@", (uint8_t *)&v2, 0xCu);
}

void __85__SLCollaborationSigningController_signSourceProcessWithMetadata_timeout_completion___block_invoke_3_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  id v5 = [*(id *)(a1 + 48) localIdentifier];
  uint64_t v6 = *(void *)(a1 + 56);
  int v7 = 138412802;
  uint64_t v8 = v4;
  __int16 v9 = 2112;
  __int16 v10 = v5;
  __int16 v11 = 2112;
  uint64_t v12 = v6;
  _os_log_error_impl(&dword_19BE17000, a2, OS_LOG_TYPE_ERROR, "[SLCollaborationSigningController] signSourceProcessWithMetadata: returned nil for request UUID: %@. This will prevent verification of the source process for collaboration identifier: %@, error: %@", (uint8_t *)&v7, 0x20u);
}

void __85__SLCollaborationSigningController_signSourceProcessWithMetadata_timeout_completion___block_invoke_16_cold_1()
{
  OUTLINED_FUNCTION_0_4(*MEMORY[0x1E4F143B8]);
  int v2 = 138412290;
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_19BE17000, v1, OS_LOG_TYPE_ERROR, "[SLCollaborationSigningController] signSourceProcessWithMetadata: request with UUID timed out: %@", (uint8_t *)&v2, 0xCu);
}

@end