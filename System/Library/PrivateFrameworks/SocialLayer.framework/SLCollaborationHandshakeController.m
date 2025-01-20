@interface SLCollaborationHandshakeController
- (BOOL)synchronous;
- (OS_dispatch_queue)targetSerialQueue;
- (SLCollaborationHandshakeController)initWithTargetSerialQueue:(id)a3 synchronous:(BOOL)a4;
- (SLRemoteTaskManager)taskManager;
- (id)_handshakeService;
- (id)_sandboxExtensionIssueFileURL:(id)a3 withAuditToken:(id *)a4;
- (id)taskServiceWithErrorHandler:(id)a3;
- (void)addParticipantHandles:(id)a3 withFileURL:(id)a4 metadata:(id)a5 timeout:(double)a6 completion:(id)a7;
- (void)addParticipantHandles:(id)a3 withMetadata:(id)a4 timeout:(double)a5 completion:(id)a6;
- (void)generateProofForIdentity:(id)a3 collaborationIdentifier:(id)a4 timeout:(double)a5 completion:(id)a6;
- (void)removeParticipantIdentities:(id)a3 withFileURL:(id)a4 metadata:(id)a5 timeout:(double)a6 completion:(id)a7;
- (void)removeParticipantIdentities:(id)a3 withMetadata:(id)a4 timeout:(double)a5 completion:(id)a6;
- (void)setSynchronous:(BOOL)a3;
- (void)setTargetSerialQueue:(id)a3;
- (void)setTaskManager:(id)a3;
- (void)startCollaborationWithFileURL:(id)a3 metadata:(id)a4 participants:(id)a5 timeout:(double)a6 completion:(id)a7;
- (void)startCollaborationWithMetadata:(id)a3 participants:(id)a4 timeout:(double)a5 completion:(id)a6;
- (void)verifySourceBundleIdentifierFromMetadata:(id)a3 timeout:(double)a4 completion:(id)a5;
@end

@implementation SLCollaborationHandshakeController

- (SLCollaborationHandshakeController)initWithTargetSerialQueue:(id)a3 synchronous:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = objc_opt_class();
  v15.receiver = self;
  v15.super_class = (Class)SLCollaborationHandshakeController;
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

- (void)startCollaborationWithMetadata:(id)a3 participants:(id)a4 timeout:(double)a5 completion:(id)a6
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__2;
  v33 = __Block_byref_object_dispose__2;
  id v34 = [MEMORY[0x1E4F29128] UUID];
  v13 = SLFrameworkLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = v30[5];
    *(_DWORD *)buf = 136315906;
    v36 = "-[SLCollaborationHandshakeController startCollaborationWithMetadata:participants:timeout:completion:]";
    __int16 v37 = 2112;
    id v38 = v10;
    __int16 v39 = 2112;
    id v40 = v11;
    __int16 v41 = 2112;
    uint64_t v42 = v14;
    _os_log_impl(&dword_19BE17000, v13, OS_LOG_TYPE_INFO, "%s: Metadata: %@, Participants: %@, requestUUID: %@", buf, 0x2Au);
  }

  objc_super v15 = [(SLCollaborationHandshakeController *)self taskManager];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __101__SLCollaborationHandshakeController_startCollaborationWithMetadata_participants_timeout_completion___block_invoke;
  v23[3] = &unk_1E58A8B78;
  id v16 = v10;
  id v24 = v16;
  id v17 = v11;
  id v25 = v17;
  v26 = self;
  v28 = &v29;
  id v27 = v12;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __101__SLCollaborationHandshakeController_startCollaborationWithMetadata_participants_timeout_completion___block_invoke_9;
  v21[3] = &unk_1E58A8BA0;
  id v22 = v27;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __101__SLCollaborationHandshakeController_startCollaborationWithMetadata_participants_timeout_completion___block_invoke_2_14;
  v19[3] = &unk_1E58A8BC8;
  id v18 = v22;
  id v20 = v18;
  [v15 startTask:v23 withTimeout:v21 timeoutHandler:v19 errorHandler:a5];

  _Block_object_dispose(&v29, 8);
}

id __101__SLCollaborationHandshakeController_startCollaborationWithMetadata_participants_timeout_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __101__SLCollaborationHandshakeController_startCollaborationWithMetadata_participants_timeout_completion___block_invoke_2;
  v13[3] = &unk_1E58A8B50;
  v13[4] = *(void *)(a1 + 48);
  id v14 = v5;
  long long v12 = *(_OWORD *)(a1 + 56);
  id v8 = (id)v12;
  long long v15 = v12;
  id v9 = v5;
  id v10 = [a2 startCollaborationWithMetadata:v6 participants:v7 reply:v13];

  return v10;
}

void __101__SLCollaborationHandshakeController_startCollaborationWithMetadata_participants_timeout_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = [*(id *)(a1 + 32) targetSerialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __101__SLCollaborationHandshakeController_startCollaborationWithMetadata_participants_timeout_completion___block_invoke_3;
  block[3] = &unk_1E58A8B28;
  id v17 = *(id *)(a1 + 40);
  id v18 = v9;
  long long v15 = *(_OWORD *)(a1 + 48);
  id v11 = (id)v15;
  long long v21 = v15;
  id v19 = v7;
  id v20 = v8;
  id v12 = v8;
  id v13 = v7;
  id v14 = v9;
  dispatch_async(v10, block);
}

uint64_t __101__SLCollaborationHandshakeController_startCollaborationWithMetadata_participants_timeout_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(a1 + 32) isValid];
  if (result)
  {
    [*(id *)(a1 + 32) suppress];
    v3 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
      uint64_t v5 = *(void *)(a1 + 40);
      int v6 = 138412546;
      uint64_t v7 = v4;
      __int16 v8 = 2112;
      uint64_t v9 = v5;
      _os_log_impl(&dword_19BE17000, v3, OS_LOG_TYPE_INFO, "[SLCollaborationHandshakeController] startCollaborationWithMetadata received response for request UUID: %@, error: %@", (uint8_t *)&v6, 0x16u);
    }

    return (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  return result;
}

void __101__SLCollaborationHandshakeController_startCollaborationWithMetadata_participants_timeout_completion___block_invoke_9(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.SocialLayer.SLCollaborationHandshakeController" code:2 userInfo:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __101__SLCollaborationHandshakeController_startCollaborationWithMetadata_participants_timeout_completion___block_invoke_2_14(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)startCollaborationWithFileURL:(id)a3 metadata:(id)a4 participants:(id)a5 timeout:(double)a6 completion:(id)a7
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = (char *)a5;
  id v15 = a7;
  uint64_t v41 = 0;
  uint64_t v42 = &v41;
  uint64_t v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__2;
  v45 = __Block_byref_object_dispose__2;
  id v46 = [MEMORY[0x1E4F29128] UUID];
  id v16 = SLFrameworkLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    uint64_t v17 = v42[5];
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "-[SLCollaborationHandshakeController startCollaborationWithFileURL:metadata:participants:timeout:completion:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v13;
    *(_WORD *)&buf[22] = 2112;
    v48 = v14;
    LOWORD(v49) = 2112;
    *(void *)((char *)&v49 + 2) = v17;
    _os_log_impl(&dword_19BE17000, v16, OS_LOG_TYPE_INFO, "%s: Metadata: %@, Participants: %@, requestUUID: %@", buf, 0x2Au);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x4010000000;
  v48 = "";
  long long v49 = 0u;
  long long v50 = 0u;
  id v18 = [(SLCollaborationHandshakeController *)self _handshakeService];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __109__SLCollaborationHandshakeController_startCollaborationWithFileURL_metadata_participants_timeout_completion___block_invoke;
  v40[3] = &unk_1E58A88B0;
  v40[4] = buf;
  [v18 prepareConnectionWithReply:v40];

  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3032000000;
  v38[3] = __Block_byref_object_copy__2;
  v38[4] = __Block_byref_object_dispose__2;
  long long v19 = *(_OWORD *)(*(void *)&buf[8] + 48);
  v37[0] = *(_OWORD *)(*(void *)&buf[8] + 32);
  v37[1] = v19;
  id v39 = [(SLCollaborationHandshakeController *)self _sandboxExtensionIssueFileURL:v12 withAuditToken:v37];
  id v20 = [(SLCollaborationHandshakeController *)self taskManager];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __109__SLCollaborationHandshakeController_startCollaborationWithFileURL_metadata_participants_timeout_completion___block_invoke_2;
  v29[3] = &unk_1E58A8BF0;
  id v21 = v12;
  id v30 = v21;
  v35 = v38;
  id v22 = v13;
  id v31 = v22;
  v23 = v14;
  v32 = v23;
  v33 = self;
  v36 = &v41;
  id v34 = v15;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __109__SLCollaborationHandshakeController_startCollaborationWithFileURL_metadata_participants_timeout_completion___block_invoke_17;
  v27[3] = &unk_1E58A8BA0;
  id v28 = v34;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __109__SLCollaborationHandshakeController_startCollaborationWithFileURL_metadata_participants_timeout_completion___block_invoke_2_18;
  v25[3] = &unk_1E58A8BC8;
  id v24 = v28;
  id v26 = v24;
  [v20 startTask:v29 withTimeout:v27 timeoutHandler:v25 errorHandler:a6];

  _Block_object_dispose(v38, 8);
  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v41, 8);
}

void __109__SLCollaborationHandshakeController_startCollaborationWithFileURL_metadata_participants_timeout_completion___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F29268] currentConnection];
  [v2 auditToken];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  long long v4 = v6;
  *(_OWORD *)(v3 + 32) = v5;
  *(_OWORD *)(v3 + 48) = v4;
}

id __109__SLCollaborationHandshakeController_startCollaborationWithFileURL_metadata_participants_timeout_completion___block_invoke_2(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1[9] + 8) + 40);
  uint64_t v7 = a1[4];
  uint64_t v8 = a1[5];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __109__SLCollaborationHandshakeController_startCollaborationWithFileURL_metadata_participants_timeout_completion___block_invoke_3;
  v14[3] = &unk_1E58A8B50;
  uint64_t v9 = a1[6];
  uint64_t v10 = (void *)a1[8];
  v14[4] = a1[7];
  id v15 = v5;
  uint64_t v17 = a1[10];
  id v16 = v10;
  id v11 = v5;
  id v12 = [a2 startCollaborationWithFileURL:v7 sandboxTokenData:v6 metadata:v8 participants:v9 reply:v14];

  return v12;
}

void __109__SLCollaborationHandshakeController_startCollaborationWithFileURL_metadata_participants_timeout_completion___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [*(id *)(a1 + 32) targetSerialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __109__SLCollaborationHandshakeController_startCollaborationWithFileURL_metadata_participants_timeout_completion___block_invoke_4;
  block[3] = &unk_1E58A8B28;
  id v17 = *(id *)(a1 + 40);
  id v18 = v9;
  long long v15 = *(_OWORD *)(a1 + 48);
  id v11 = (id)v15;
  long long v21 = v15;
  id v19 = v7;
  id v20 = v8;
  id v12 = v8;
  id v13 = v7;
  id v14 = v9;
  dispatch_async(v10, block);
}

uint64_t __109__SLCollaborationHandshakeController_startCollaborationWithFileURL_metadata_participants_timeout_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(a1 + 32) isValid];
  if (result)
  {
    [*(id *)(a1 + 32) suppress];
    uint64_t v3 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
      uint64_t v5 = *(void *)(a1 + 40);
      int v6 = 138412546;
      uint64_t v7 = v4;
      __int16 v8 = 2112;
      uint64_t v9 = v5;
      _os_log_impl(&dword_19BE17000, v3, OS_LOG_TYPE_INFO, "[SLCollaborationHandshakeController] startCollaborationWithFileURL Received response for requestUUID: %@, error: %@", (uint8_t *)&v6, 0x16u);
    }

    return (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  return result;
}

void __109__SLCollaborationHandshakeController_startCollaborationWithFileURL_metadata_participants_timeout_completion___block_invoke_17(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.SocialLayer.SLCollaborationHandshakeController" code:2 userInfo:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __109__SLCollaborationHandshakeController_startCollaborationWithFileURL_metadata_participants_timeout_completion___block_invoke_2_18(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addParticipantHandles:(id)a3 withMetadata:(id)a4 timeout:(double)a5 completion:(id)a6
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v30 = 0;
  id v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__2;
  id v34 = __Block_byref_object_dispose__2;
  id v35 = [MEMORY[0x1E4F29128] UUID];
  id v13 = SLFrameworkLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = v31[5];
    *(_DWORD *)buf = 136315650;
    __int16 v37 = "-[SLCollaborationHandshakeController addParticipantHandles:withMetadata:timeout:completion:]";
    __int16 v38 = 2112;
    id v39 = v11;
    __int16 v40 = 2112;
    uint64_t v41 = v14;
    _os_log_impl(&dword_19BE17000, v13, OS_LOG_TYPE_INFO, "%s: Metadata: %@, requestUUID: %@", buf, 0x20u);
  }

  long long v15 = [(SLCollaborationHandshakeController *)self taskManager];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __92__SLCollaborationHandshakeController_addParticipantHandles_withMetadata_timeout_completion___block_invoke;
  v24[3] = &unk_1E58A8B78;
  id v16 = v10;
  id v25 = v16;
  id v17 = v11;
  id v26 = v17;
  id v27 = self;
  uint64_t v29 = &v30;
  id v28 = v12;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __92__SLCollaborationHandshakeController_addParticipantHandles_withMetadata_timeout_completion___block_invoke_20;
  v21[3] = &unk_1E58A8C68;
  v23 = &v30;
  id v22 = v28;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __92__SLCollaborationHandshakeController_addParticipantHandles_withMetadata_timeout_completion___block_invoke_21;
  v19[3] = &unk_1E58A8BC8;
  id v18 = v22;
  id v20 = v18;
  [v15 startTask:v24 withTimeout:v21 timeoutHandler:v19 errorHandler:a5];

  _Block_object_dispose(&v30, 8);
}

id __92__SLCollaborationHandshakeController_addParticipantHandles_withMetadata_timeout_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __92__SLCollaborationHandshakeController_addParticipantHandles_withMetadata_timeout_completion___block_invoke_2;
  v13[3] = &unk_1E58A8C40;
  v13[4] = *(void *)(a1 + 48);
  id v14 = v5;
  long long v12 = *(_OWORD *)(a1 + 56);
  id v8 = (id)v12;
  long long v15 = v12;
  id v9 = v5;
  id v10 = [a2 addParticipantHandles:v6 withMetadata:v7 reply:v13];

  return v10;
}

void __92__SLCollaborationHandshakeController_addParticipantHandles_withMetadata_timeout_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) targetSerialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __92__SLCollaborationHandshakeController_addParticipantHandles_withMetadata_timeout_completion___block_invoke_3;
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

uint64_t __92__SLCollaborationHandshakeController_addParticipantHandles_withMetadata_timeout_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(a1 + 32) isValid];
  if (result)
  {
    [*(id *)(a1 + 32) suppress];
    uint64_t v3 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      uint64_t v5 = *(void *)(a1 + 40);
      int v6 = 138412546;
      uint64_t v7 = v4;
      __int16 v8 = 2112;
      uint64_t v9 = v5;
      _os_log_impl(&dword_19BE17000, v3, OS_LOG_TYPE_INFO, "[SLCollaborationHandshakeController] addParticipantHandles received response for request UUID: %@, error: %@", (uint8_t *)&v6, 0x16u);
    }

    return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  return result;
}

void __92__SLCollaborationHandshakeController_addParticipantHandles_withMetadata_timeout_completion___block_invoke_20(uint64_t a1)
{
  id v2 = SLFrameworkLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __92__SLCollaborationHandshakeController_addParticipantHandles_withMetadata_timeout_completion___block_invoke_20_cold_1();
  }

  uint64_t v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.SocialLayer.SLCollaborationHandshakeController" code:2 userInfo:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __92__SLCollaborationHandshakeController_addParticipantHandles_withMetadata_timeout_completion___block_invoke_21(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addParticipantHandles:(id)a3 withFileURL:(id)a4 metadata:(id)a5 timeout:(double)a6 completion:(id)a7
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  uint64_t v42 = 0;
  uint64_t v43 = &v42;
  uint64_t v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__2;
  id v46 = __Block_byref_object_dispose__2;
  id v47 = [MEMORY[0x1E4F29128] UUID];
  long long v16 = SLFrameworkLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    id v17 = (const char *)v43[5];
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[SLCollaborationHandshakeController addParticipantHandles:withFileURL:metadata:timeout:completion:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v14;
    *(_WORD *)&buf[22] = 2112;
    long long v49 = v17;
    _os_log_impl(&dword_19BE17000, v16, OS_LOG_TYPE_INFO, "%s: Metadata: %@, requestUUID: %@", buf, 0x20u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x4010000000;
  long long v49 = "";
  long long v50 = 0u;
  long long v51 = 0u;
  id v18 = [(SLCollaborationHandshakeController *)self _handshakeService];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __100__SLCollaborationHandshakeController_addParticipantHandles_withFileURL_metadata_timeout_completion___block_invoke;
  v41[3] = &unk_1E58A88B0;
  v41[4] = buf;
  [v18 prepareConnectionWithReply:v41];

  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x3032000000;
  v39[3] = __Block_byref_object_copy__2;
  v39[4] = __Block_byref_object_dispose__2;
  long long v19 = *(_OWORD *)(*(void *)&buf[8] + 48);
  v38[0] = *(_OWORD *)(*(void *)&buf[8] + 32);
  v38[1] = v19;
  id v40 = [(SLCollaborationHandshakeController *)self _sandboxExtensionIssueFileURL:v13 withAuditToken:v38];
  id v20 = [(SLCollaborationHandshakeController *)self taskManager];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __100__SLCollaborationHandshakeController_addParticipantHandles_withFileURL_metadata_timeout_completion___block_invoke_2;
  v30[3] = &unk_1E58A8C90;
  id v21 = v12;
  id v31 = v21;
  id v22 = v13;
  id v32 = v22;
  v36 = v39;
  id v23 = v14;
  id v33 = v23;
  id v34 = self;
  __int16 v37 = &v42;
  id v35 = v15;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __100__SLCollaborationHandshakeController_addParticipantHandles_withFileURL_metadata_timeout_completion___block_invoke_23;
  v27[3] = &unk_1E58A8C68;
  uint64_t v29 = &v42;
  id v28 = v35;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __100__SLCollaborationHandshakeController_addParticipantHandles_withFileURL_metadata_timeout_completion___block_invoke_24;
  v25[3] = &unk_1E58A8BC8;
  id v24 = v28;
  id v26 = v24;
  [v20 startTask:v30 withTimeout:v27 timeoutHandler:v25 errorHandler:a6];

  _Block_object_dispose(v39, 8);
  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v42, 8);
}

void __100__SLCollaborationHandshakeController_addParticipantHandles_withFileURL_metadata_timeout_completion___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F29268] currentConnection];
  [v2 auditToken];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  long long v4 = v6;
  *(_OWORD *)(v3 + 32) = v5;
  *(_OWORD *)(v3 + 48) = v4;
}

id __100__SLCollaborationHandshakeController_addParticipantHandles_withFileURL_metadata_timeout_completion___block_invoke_2(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = a1[4];
  uint64_t v7 = a1[5];
  uint64_t v8 = *(void *)(*(void *)(a1[9] + 8) + 40);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __100__SLCollaborationHandshakeController_addParticipantHandles_withFileURL_metadata_timeout_completion___block_invoke_3;
  v14[3] = &unk_1E58A8C40;
  uint64_t v9 = a1[6];
  uint64_t v10 = (void *)a1[8];
  v14[4] = a1[7];
  id v15 = v5;
  uint64_t v17 = a1[10];
  id v16 = v10;
  id v11 = v5;
  id v12 = [a2 addParticipantHandles:v6 withFileURL:v7 sandboxTokenData:v8 metadata:v9 reply:v14];

  return v12;
}

void __100__SLCollaborationHandshakeController_addParticipantHandles_withFileURL_metadata_timeout_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) targetSerialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __100__SLCollaborationHandshakeController_addParticipantHandles_withFileURL_metadata_timeout_completion___block_invoke_4;
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

uint64_t __100__SLCollaborationHandshakeController_addParticipantHandles_withFileURL_metadata_timeout_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(a1 + 32) isValid];
  if (result)
  {
    [*(id *)(a1 + 32) suppress];
    uint64_t v3 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      uint64_t v5 = *(void *)(a1 + 40);
      int v6 = 138412546;
      uint64_t v7 = v4;
      __int16 v8 = 2112;
      uint64_t v9 = v5;
      _os_log_impl(&dword_19BE17000, v3, OS_LOG_TYPE_INFO, "[SLCollaborationHandshakeController] addParticipantHandles:withFileURL: received response for request UUID: %@, error: %@", (uint8_t *)&v6, 0x16u);
    }

    return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  return result;
}

void __100__SLCollaborationHandshakeController_addParticipantHandles_withFileURL_metadata_timeout_completion___block_invoke_23(uint64_t a1)
{
  id v2 = SLFrameworkLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __100__SLCollaborationHandshakeController_addParticipantHandles_withFileURL_metadata_timeout_completion___block_invoke_23_cold_1();
  }

  uint64_t v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.SocialLayer.SLCollaborationHandshakeController" code:2 userInfo:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __100__SLCollaborationHandshakeController_addParticipantHandles_withFileURL_metadata_timeout_completion___block_invoke_24(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeParticipantIdentities:(id)a3 withMetadata:(id)a4 timeout:(double)a5 completion:(id)a6
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v30 = 0;
  id v31 = &v30;
  uint64_t v32 = 0x3032000000;
  id v33 = __Block_byref_object_copy__2;
  id v34 = __Block_byref_object_dispose__2;
  id v35 = [MEMORY[0x1E4F29128] UUID];
  id v13 = SLFrameworkLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = v31[5];
    *(_DWORD *)buf = 136315650;
    __int16 v37 = "-[SLCollaborationHandshakeController removeParticipantIdentities:withMetadata:timeout:completion:]";
    __int16 v38 = 2112;
    id v39 = v11;
    __int16 v40 = 2112;
    uint64_t v41 = v14;
    _os_log_impl(&dword_19BE17000, v13, OS_LOG_TYPE_INFO, "%s: Metadata: %@, requestUUID: %@", buf, 0x20u);
  }

  id v15 = [(SLCollaborationHandshakeController *)self taskManager];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __98__SLCollaborationHandshakeController_removeParticipantIdentities_withMetadata_timeout_completion___block_invoke;
  v24[3] = &unk_1E58A8B78;
  id v16 = v10;
  id v25 = v16;
  id v17 = v11;
  id v26 = v17;
  id v27 = self;
  uint64_t v29 = &v30;
  id v28 = v12;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __98__SLCollaborationHandshakeController_removeParticipantIdentities_withMetadata_timeout_completion___block_invoke_25;
  v21[3] = &unk_1E58A8C68;
  id v23 = &v30;
  id v22 = v28;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __98__SLCollaborationHandshakeController_removeParticipantIdentities_withMetadata_timeout_completion___block_invoke_26;
  v19[3] = &unk_1E58A8BC8;
  id v18 = v22;
  id v20 = v18;
  [v15 startTask:v24 withTimeout:v21 timeoutHandler:v19 errorHandler:a5];

  _Block_object_dispose(&v30, 8);
}

id __98__SLCollaborationHandshakeController_removeParticipantIdentities_withMetadata_timeout_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __98__SLCollaborationHandshakeController_removeParticipantIdentities_withMetadata_timeout_completion___block_invoke_2;
  v13[3] = &unk_1E58A8C40;
  v13[4] = *(void *)(a1 + 48);
  id v14 = v5;
  long long v12 = *(_OWORD *)(a1 + 56);
  id v8 = (id)v12;
  long long v15 = v12;
  id v9 = v5;
  id v10 = [a2 removeParticipantIdentities:v6 withMetadata:v7 reply:v13];

  return v10;
}

void __98__SLCollaborationHandshakeController_removeParticipantIdentities_withMetadata_timeout_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) targetSerialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98__SLCollaborationHandshakeController_removeParticipantIdentities_withMetadata_timeout_completion___block_invoke_3;
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

uint64_t __98__SLCollaborationHandshakeController_removeParticipantIdentities_withMetadata_timeout_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(a1 + 32) isValid];
  if (result)
  {
    [*(id *)(a1 + 32) suppress];
    uint64_t v3 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      uint64_t v5 = *(void *)(a1 + 40);
      int v6 = 138412546;
      uint64_t v7 = v4;
      __int16 v8 = 2112;
      uint64_t v9 = v5;
      _os_log_impl(&dword_19BE17000, v3, OS_LOG_TYPE_INFO, "[SLCollaborationHandshakeController] removeParticipantIdentities received response for request UUID: %@, error: %@", (uint8_t *)&v6, 0x16u);
    }

    return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  return result;
}

void __98__SLCollaborationHandshakeController_removeParticipantIdentities_withMetadata_timeout_completion___block_invoke_25(uint64_t a1)
{
  id v2 = SLFrameworkLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __98__SLCollaborationHandshakeController_removeParticipantIdentities_withMetadata_timeout_completion___block_invoke_25_cold_1();
  }

  uint64_t v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.SocialLayer.SLCollaborationHandshakeController" code:2 userInfo:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __98__SLCollaborationHandshakeController_removeParticipantIdentities_withMetadata_timeout_completion___block_invoke_26(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeParticipantIdentities:(id)a3 withFileURL:(id)a4 metadata:(id)a5 timeout:(double)a6 completion:(id)a7
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  uint64_t v42 = 0;
  uint64_t v43 = &v42;
  uint64_t v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__2;
  id v46 = __Block_byref_object_dispose__2;
  id v47 = [MEMORY[0x1E4F29128] UUID];
  long long v16 = SLFrameworkLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    id v17 = (const char *)v43[5];
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[SLCollaborationHandshakeController removeParticipantIdentities:withFileURL:metadata:timeout:completion:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v14;
    *(_WORD *)&buf[22] = 2112;
    long long v49 = v17;
    _os_log_impl(&dword_19BE17000, v16, OS_LOG_TYPE_INFO, "%s: Metadata: %@, requestUUID: %@", buf, 0x20u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x4010000000;
  long long v49 = "";
  long long v50 = 0u;
  long long v51 = 0u;
  id v18 = [(SLCollaborationHandshakeController *)self _handshakeService];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __106__SLCollaborationHandshakeController_removeParticipantIdentities_withFileURL_metadata_timeout_completion___block_invoke;
  v41[3] = &unk_1E58A88B0;
  v41[4] = buf;
  [v18 prepareConnectionWithReply:v41];

  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x3032000000;
  v39[3] = __Block_byref_object_copy__2;
  v39[4] = __Block_byref_object_dispose__2;
  long long v19 = *(_OWORD *)(*(void *)&buf[8] + 48);
  v38[0] = *(_OWORD *)(*(void *)&buf[8] + 32);
  v38[1] = v19;
  id v40 = [(SLCollaborationHandshakeController *)self _sandboxExtensionIssueFileURL:v13 withAuditToken:v38];
  id v20 = [(SLCollaborationHandshakeController *)self taskManager];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __106__SLCollaborationHandshakeController_removeParticipantIdentities_withFileURL_metadata_timeout_completion___block_invoke_2;
  v30[3] = &unk_1E58A8C90;
  id v21 = v12;
  id v31 = v21;
  id v22 = v13;
  id v32 = v22;
  v36 = v39;
  id v23 = v14;
  id v33 = v23;
  id v34 = self;
  __int16 v37 = &v42;
  id v35 = v15;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __106__SLCollaborationHandshakeController_removeParticipantIdentities_withFileURL_metadata_timeout_completion___block_invoke_28;
  v27[3] = &unk_1E58A8C68;
  uint64_t v29 = &v42;
  id v28 = v35;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __106__SLCollaborationHandshakeController_removeParticipantIdentities_withFileURL_metadata_timeout_completion___block_invoke_29;
  v25[3] = &unk_1E58A8BC8;
  id v24 = v28;
  id v26 = v24;
  [v20 startTask:v30 withTimeout:v27 timeoutHandler:v25 errorHandler:a6];

  _Block_object_dispose(v39, 8);
  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v42, 8);
}

void __106__SLCollaborationHandshakeController_removeParticipantIdentities_withFileURL_metadata_timeout_completion___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F29268] currentConnection];
  [v2 auditToken];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  long long v4 = v6;
  *(_OWORD *)(v3 + 32) = v5;
  *(_OWORD *)(v3 + 48) = v4;
}

id __106__SLCollaborationHandshakeController_removeParticipantIdentities_withFileURL_metadata_timeout_completion___block_invoke_2(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = a1[4];
  uint64_t v7 = a1[5];
  uint64_t v8 = *(void *)(*(void *)(a1[9] + 8) + 40);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __106__SLCollaborationHandshakeController_removeParticipantIdentities_withFileURL_metadata_timeout_completion___block_invoke_3;
  v14[3] = &unk_1E58A8C40;
  uint64_t v9 = a1[6];
  uint64_t v10 = (void *)a1[8];
  v14[4] = a1[7];
  id v15 = v5;
  uint64_t v17 = a1[10];
  id v16 = v10;
  id v11 = v5;
  id v12 = [a2 removeParticipantIdentities:v6 withFileURL:v7 sandboxTokenData:v8 metadata:v9 reply:v14];

  return v12;
}

void __106__SLCollaborationHandshakeController_removeParticipantIdentities_withFileURL_metadata_timeout_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) targetSerialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __106__SLCollaborationHandshakeController_removeParticipantIdentities_withFileURL_metadata_timeout_completion___block_invoke_4;
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

uint64_t __106__SLCollaborationHandshakeController_removeParticipantIdentities_withFileURL_metadata_timeout_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(a1 + 32) isValid];
  if (result)
  {
    [*(id *)(a1 + 32) suppress];
    uint64_t v3 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      uint64_t v5 = *(void *)(a1 + 40);
      int v6 = 138412546;
      uint64_t v7 = v4;
      __int16 v8 = 2112;
      uint64_t v9 = v5;
      _os_log_impl(&dword_19BE17000, v3, OS_LOG_TYPE_INFO, "[SLCollaborationHandshakeController] removeParticipantIdentities:withFileURL: received response for request UUID: %@, error: %@", (uint8_t *)&v6, 0x16u);
    }

    return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  return result;
}

void __106__SLCollaborationHandshakeController_removeParticipantIdentities_withFileURL_metadata_timeout_completion___block_invoke_28(uint64_t a1)
{
  id v2 = SLFrameworkLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __106__SLCollaborationHandshakeController_removeParticipantIdentities_withFileURL_metadata_timeout_completion___block_invoke_28_cold_1();
  }

  uint64_t v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.SocialLayer.SLCollaborationHandshakeController" code:2 userInfo:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __106__SLCollaborationHandshakeController_removeParticipantIdentities_withFileURL_metadata_timeout_completion___block_invoke_29(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)generateProofForIdentity:(id)a3 collaborationIdentifier:(id)a4 timeout:(double)a5 completion:(id)a6
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v30 = 0;
  id v31 = &v30;
  uint64_t v32 = 0x3032000000;
  id v33 = __Block_byref_object_copy__2;
  id v34 = __Block_byref_object_dispose__2;
  id v35 = [MEMORY[0x1E4F29128] UUID];
  id v13 = SLFrameworkLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = v31[5];
    *(_DWORD *)buf = 136315906;
    __int16 v37 = "-[SLCollaborationHandshakeController generateProofForIdentity:collaborationIdentifier:timeout:completion:]";
    __int16 v38 = 2112;
    id v39 = v10;
    __int16 v40 = 2112;
    id v41 = v11;
    __int16 v42 = 2112;
    uint64_t v43 = v14;
    _os_log_impl(&dword_19BE17000, v13, OS_LOG_TYPE_INFO, "%s: identity: %@ documentIdentifier: %@ uuid: %@", buf, 0x2Au);
  }

  id v15 = [(SLCollaborationHandshakeController *)self taskManager];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __106__SLCollaborationHandshakeController_generateProofForIdentity_collaborationIdentifier_timeout_completion___block_invoke;
  v24[3] = &unk_1E58A8B78;
  id v16 = v10;
  id v25 = v16;
  id v17 = v11;
  id v26 = v17;
  id v27 = self;
  uint64_t v29 = &v30;
  id v28 = v12;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __106__SLCollaborationHandshakeController_generateProofForIdentity_collaborationIdentifier_timeout_completion___block_invoke_31;
  v21[3] = &unk_1E58A8C68;
  id v23 = &v30;
  id v22 = v28;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __106__SLCollaborationHandshakeController_generateProofForIdentity_collaborationIdentifier_timeout_completion___block_invoke_32;
  v19[3] = &unk_1E58A8BC8;
  id v18 = v22;
  id v20 = v18;
  [v15 startTask:v24 withTimeout:v21 timeoutHandler:v19 errorHandler:a5];

  _Block_object_dispose(&v30, 8);
}

id __106__SLCollaborationHandshakeController_generateProofForIdentity_collaborationIdentifier_timeout_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __106__SLCollaborationHandshakeController_generateProofForIdentity_collaborationIdentifier_timeout_completion___block_invoke_2;
  v13[3] = &unk_1E58A8CB8;
  v13[4] = *(void *)(a1 + 48);
  id v14 = v5;
  long long v12 = *(_OWORD *)(a1 + 56);
  id v8 = (id)v12;
  long long v15 = v12;
  id v9 = v5;
  id v10 = [a2 generateProofForIdentity:v6 collaborationIdentifier:v7 reply:v13];

  return v10;
}

void __106__SLCollaborationHandshakeController_generateProofForIdentity_collaborationIdentifier_timeout_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) targetSerialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __106__SLCollaborationHandshakeController_generateProofForIdentity_collaborationIdentifier_timeout_completion___block_invoke_3;
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

uint64_t __106__SLCollaborationHandshakeController_generateProofForIdentity_collaborationIdentifier_timeout_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(a1 + 32) isValid];
  if (result)
  {
    [*(id *)(a1 + 32) suppress];
    uint64_t v3 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      uint64_t v5 = *(void *)(a1 + 40);
      int v6 = 138412546;
      uint64_t v7 = v4;
      __int16 v8 = 2112;
      uint64_t v9 = v5;
      _os_log_impl(&dword_19BE17000, v3, OS_LOG_TYPE_DEFAULT, "[SLCollaborationHandshakeController] generateProofForIdentity:collaborationIdentifier: received response for request UUID: %@, error: %@", (uint8_t *)&v6, 0x16u);
    }

    return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  return result;
}

void __106__SLCollaborationHandshakeController_generateProofForIdentity_collaborationIdentifier_timeout_completion___block_invoke_31(uint64_t a1)
{
  id v2 = SLFrameworkLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __106__SLCollaborationHandshakeController_generateProofForIdentity_collaborationIdentifier_timeout_completion___block_invoke_31_cold_1();
  }

  uint64_t v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.SocialLayer.SLCollaborationHandshakeController" code:2 userInfo:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __106__SLCollaborationHandshakeController_generateProofForIdentity_collaborationIdentifier_timeout_completion___block_invoke_32(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)verifySourceBundleIdentifierFromMetadata:(id)a3 timeout:(double)a4 completion:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = __Block_byref_object_copy__2;
  uint64_t v30 = __Block_byref_object_dispose__2;
  id v31 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v10 = SLFrameworkLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    long long v11 = [v8 localIdentifier];
    uint64_t v12 = v27[5];
    *(_DWORD *)buf = 136315650;
    id v33 = "-[SLCollaborationHandshakeController verifySourceBundleIdentifierFromMetadata:timeout:completion:]";
    __int16 v34 = 2112;
    id v35 = v11;
    __int16 v36 = 2112;
    uint64_t v37 = v12;
    _os_log_impl(&dword_19BE17000, v10, OS_LOG_TYPE_INFO, "%s: local identifier: %@ uuid: %@", buf, 0x20u);
  }
  id v13 = [(SLCollaborationHandshakeController *)self taskManager];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __98__SLCollaborationHandshakeController_verifySourceBundleIdentifierFromMetadata_timeout_completion___block_invoke;
  v21[3] = &unk_1E58A8D08;
  id v14 = v8;
  id v22 = v14;
  id v23 = self;
  id v25 = &v26;
  id v24 = v9;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __98__SLCollaborationHandshakeController_verifySourceBundleIdentifierFromMetadata_timeout_completion___block_invoke_34;
  v18[3] = &unk_1E58A8C68;
  id v20 = &v26;
  id v19 = v24;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __98__SLCollaborationHandshakeController_verifySourceBundleIdentifierFromMetadata_timeout_completion___block_invoke_35;
  v16[3] = &unk_1E58A8BC8;
  id v15 = v19;
  id v17 = v15;
  [v13 startTask:v21 withTimeout:v18 timeoutHandler:v16 errorHandler:a4];

  _Block_object_dispose(&v26, 8);
}

id __98__SLCollaborationHandshakeController_verifySourceBundleIdentifierFromMetadata_timeout_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __98__SLCollaborationHandshakeController_verifySourceBundleIdentifierFromMetadata_timeout_completion___block_invoke_2;
  v12[3] = &unk_1E58A8CE0;
  uint64_t v6 = *(void *)(a1 + 32);
  v12[4] = *(void *)(a1 + 40);
  id v13 = v5;
  long long v11 = *(_OWORD *)(a1 + 48);
  id v7 = (id)v11;
  long long v14 = v11;
  id v8 = v5;
  id v9 = [a2 verifySourceBundleIdentifierFromMetadata:v6 reply:v12];

  return v9;
}

void __98__SLCollaborationHandshakeController_verifySourceBundleIdentifierFromMetadata_timeout_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) targetSerialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98__SLCollaborationHandshakeController_verifySourceBundleIdentifierFromMetadata_timeout_completion___block_invoke_3;
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

uint64_t __98__SLCollaborationHandshakeController_verifySourceBundleIdentifierFromMetadata_timeout_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(a1 + 32) isValid];
  if (result)
  {
    [*(id *)(a1 + 32) suppress];
    uint64_t v3 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      uint64_t v5 = *(void *)(a1 + 40);
      int v6 = 138412546;
      uint64_t v7 = v4;
      __int16 v8 = 2112;
      uint64_t v9 = v5;
      _os_log_impl(&dword_19BE17000, v3, OS_LOG_TYPE_DEFAULT, "[SLCollaborationHandshakeController] verifySourceBundleIdentifierFromMetadata: received response for request UUID: %@, error: %@", (uint8_t *)&v6, 0x16u);
    }

    return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  return result;
}

void __98__SLCollaborationHandshakeController_verifySourceBundleIdentifierFromMetadata_timeout_completion___block_invoke_34(uint64_t a1)
{
  id v2 = SLFrameworkLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __98__SLCollaborationHandshakeController_verifySourceBundleIdentifierFromMetadata_timeout_completion___block_invoke_34_cold_1();
  }

  uint64_t v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.SocialLayer.SLCollaborationHandshakeController" code:2 userInfo:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __98__SLCollaborationHandshakeController_verifySourceBundleIdentifierFromMetadata_timeout_completion___block_invoke_35(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)taskServiceWithErrorHandler:(id)a3
{
  uint64_t v3 = [(SLDServiceProxy *)self synchronousRemoteServiceWithErrorHandler:a3];
  if (([v3 conformsToProtocol:&unk_1EEC46478] & 1) == 0)
  {

    uint64_t v3 = 0;
  }
  return v3;
}

- (id)_handshakeService
{
  id v2 = [(SLDServiceProxy *)self synchronousRemoteService];
  if (([v2 conformsToProtocol:&unk_1EEC46478] & 1) == 0)
  {

    id v2 = 0;
  }
  return v2;
}

- (id)_sandboxExtensionIssueFileURL:(id)a3 withAuditToken:(id *)a4
{
  id v5 = a3;
  int v6 = [v5 path];
  int v7 = [v5 hasDirectoryPath];

  if (v7)
  {
    uint64_t v8 = [v6 stringByAppendingString:@"/"];

    int v6 = (void *)v8;
  }
  id v9 = v6;
  [v9 fileSystemRepresentation];
  long long v13 = *(_OWORD *)a4->var0;
  long long v14 = *(_OWORD *)&a4->var0[4];
  uint64_t v10 = (const char *)sandbox_extension_issue_file_to_process();
  long long v11 = (void *)v10;
  if (v10)
  {
    long long v11 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:", v10, strlen(v10) + 1, 1, v13, v14);
  }

  return v11;
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

void __92__SLCollaborationHandshakeController_addParticipantHandles_withMetadata_timeout_completion___block_invoke_20_cold_1()
{
  OUTLINED_FUNCTION_0_4(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_4(&dword_19BE17000, v0, v1, "[SLCollaborationHandshakeController] addParticipantHandles request with UUID timed out: %@", v2, v3, v4, v5, v6);
}

void __100__SLCollaborationHandshakeController_addParticipantHandles_withFileURL_metadata_timeout_completion___block_invoke_23_cold_1()
{
  OUTLINED_FUNCTION_0_4(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_4(&dword_19BE17000, v0, v1, "[SLCollaborationHandshakeController] addParticipantHandles:withFileURL: request with UUID timed out: %@", v2, v3, v4, v5, v6);
}

void __98__SLCollaborationHandshakeController_removeParticipantIdentities_withMetadata_timeout_completion___block_invoke_25_cold_1()
{
  OUTLINED_FUNCTION_0_4(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_4(&dword_19BE17000, v0, v1, "[SLCollaborationHandshakeController] removeParticipantIdentities request with UUID timed out: %@", v2, v3, v4, v5, v6);
}

void __106__SLCollaborationHandshakeController_removeParticipantIdentities_withFileURL_metadata_timeout_completion___block_invoke_28_cold_1()
{
  OUTLINED_FUNCTION_0_4(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_4(&dword_19BE17000, v0, v1, "[SLCollaborationHandshakeController] removeParticipantIdentities:withFileURL: request with UUID timed out: %@", v2, v3, v4, v5, v6);
}

void __106__SLCollaborationHandshakeController_generateProofForIdentity_collaborationIdentifier_timeout_completion___block_invoke_31_cold_1()
{
  OUTLINED_FUNCTION_0_4(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_4(&dword_19BE17000, v0, v1, "[SLCollaborationHandshakeController] generateProofForIdentity:collaborationIdentifier: request with UUID timed out: %@", v2, v3, v4, v5, v6);
}

void __98__SLCollaborationHandshakeController_verifySourceBundleIdentifierFromMetadata_timeout_completion___block_invoke_34_cold_1()
{
  OUTLINED_FUNCTION_0_4(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_4(&dword_19BE17000, v0, v1, "[SLCollaborationHandshakeController] verifySourceBundleIdentifierFromMetadata: request with UUID timed out: %@", v2, v3, v4, v5, v6);
}

@end