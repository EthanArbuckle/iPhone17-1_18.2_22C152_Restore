@interface SLDCollaborationSigningService
+ (id)remoteObjectProtocol;
+ (id)sharedService;
- (BOOL)allowsConnection:(id)a3;
- (OS_dispatch_queue)privateSerialQueue;
- (SLDCollaborationSigningService)init;
- (SLDTaskManager)taskManager;
- (SLPersonIdentityGenerator)personIdentityGenerator;
- (id)signData:(id)a3 forCollaborationIdentifier:(id)a4 trackingPreventionSalt:(id)a5 reply:(id)a6;
- (id)signSourceProcessWithMetadata:(id)a3 reply:(id)a4;
- (void)setTaskManager:(id)a3;
@end

@implementation SLDCollaborationSigningService

+ (id)remoteObjectProtocol
{
  return &unk_1EEC3BE60;
}

+ (id)sharedService
{
  if (sharedService_onceToken_0 != -1) {
    dispatch_once(&sharedService_onceToken_0, &__block_literal_global_1);
  }
  v2 = (void *)sharedService_sService_0;
  return v2;
}

uint64_t __47__SLDCollaborationSigningService_sharedService__block_invoke()
{
  v0 = objc_alloc_init(SLDCollaborationSigningService);
  uint64_t v1 = sharedService_sService_0;
  sharedService_sService_0 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (SLDCollaborationSigningService)init
{
  v11.receiver = self;
  v11.super_class = (Class)SLDCollaborationSigningService;
  v2 = [(SLDCollaborationSigningService *)&v11 init];
  if (v2)
  {
    v3 = SLDGlobalWorkloop();
    dispatch_queue_t v4 = dispatch_queue_create_with_target_V2("com.apple.sociallayerd.SLDCollaborationSigningService", 0, v3);
    privateSerialQueue = v2->_privateSerialQueue;
    v2->_privateSerialQueue = (OS_dispatch_queue *)v4;

    v6 = [[SLDTaskManager alloc] initWithSerialQueue:v2->_privateSerialQueue];
    taskManager = v2->_taskManager;
    v2->_taskManager = v6;

    v8 = [[SLPersonIdentityGenerator alloc] initWithQueue:v2->_privateSerialQueue];
    personIdentityGenerator = v2->_personIdentityGenerator;
    v2->_personIdentityGenerator = v8;
  }
  return v2;
}

- (BOOL)allowsConnection:(id)a3
{
  id v3 = a3;
  if ((SLDConnectionIsEntitledForCollaborationHandshake(v3) & 1) != 0
    || (SLDConnectionHasPublicEntitlement(v3) & 1) != 0
    || (SLDConnectionHasLegacyHighlightsEntitlement(v3) & 1) != 0)
  {
    BOOL v4 = 1;
  }
  else
  {
    v6 = SLDaemonLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SLDCollaborationSigningService allowsConnection:]((uint64_t)v3, v6, v7, v8, v9, v10, v11, v12);
    }

    BOOL v4 = 0;
  }

  return v4;
}

- (id)signData:(id)a3 forCollaborationIdentifier:(id)a4 trackingPreventionSalt:(id)a5 reply:(id)a6
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = SLDaemonLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "-[SLDCollaborationSigningService signData:forCollaborationIdentifier:trackingPreventionSalt:reply:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v11;
    _os_log_impl(&dword_19BE17000, v14, OS_LOG_TYPE_DEFAULT, "%s collaborationIdentifier: %@", buf, 0x16u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v42 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __99__SLDCollaborationSigningService_signData_forCollaborationIdentifier_trackingPreventionSalt_reply___block_invoke;
  aBlock[3] = &unk_1E58A8A00;
  v40 = buf;
  id v15 = v13;
  id v39 = v15;
  v16 = _Block_copy(aBlock);
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __99__SLDCollaborationSigningService_signData_forCollaborationIdentifier_trackingPreventionSalt_reply___block_invoke_2;
  v36[3] = &unk_1E58A8A28;
  id v17 = v16;
  id v37 = v17;
  v18 = _Block_copy(v36);
  uint64_t v27 = MEMORY[0x1E4F143A8];
  uint64_t v28 = 3221225472;
  v29 = __99__SLDCollaborationSigningService_signData_forCollaborationIdentifier_trackingPreventionSalt_reply___block_invoke_13;
  v30 = &unk_1E58A8A78;
  v31 = self;
  id v19 = v10;
  id v32 = v19;
  id v20 = v11;
  id v33 = v20;
  id v21 = v12;
  id v34 = v21;
  id v22 = v17;
  id v35 = v22;
  v23 = _Block_copy(&v27);
  v24 = [(SLDCollaborationSigningService *)self taskManager];
  v25 = [v24 startAggregateTask:v23 withTimeout:v18 cancellationHandler:15.0];

  _Block_object_dispose(buf, 8);
  return v25;
}

uint64_t __99__SLDCollaborationSigningService_signData_forCollaborationIdentifier_trackingPreventionSalt_reply___block_invoke(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24))
  {
    uint64_t v1 = result;
    result = (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
    *(unsigned char *)(*(void *)(*(void *)(v1 + 40) + 8) + 24) = 1;
  }
  return result;
}

void __99__SLDCollaborationSigningService_signData_forCollaborationIdentifier_trackingPreventionSalt_reply___block_invoke_2(uint64_t a1, int a2)
{
  BOOL v4 = SLDaemonLogHandle();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
  if (a2)
  {
    if (v5) {
      __99__SLDCollaborationSigningService_signData_forCollaborationIdentifier_trackingPreventionSalt_reply___block_invoke_2_cold_1(v4, v6, v7, v8, v9, v10, v11, v12);
    }

    id v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.sociallayerd.SLDCollaborationSigningService" code:2 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    if (v5) {
      __99__SLDCollaborationSigningService_signData_forCollaborationIdentifier_trackingPreventionSalt_reply___block_invoke_2_cold_2(v4);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __99__SLDCollaborationSigningService_signData_forCollaborationIdentifier_trackingPreventionSalt_reply___block_invoke_13(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  uint64_t v6 = [*(id *)(a1 + 32) personIdentityGenerator];
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __99__SLDCollaborationSigningService_signData_forCollaborationIdentifier_trackingPreventionSalt_reply___block_invoke_2_14;
  v11[3] = &unk_1E58A8A50;
  id v12 = v5;
  uint64_t v9 = *(void *)(a1 + 56);
  id v13 = *(id *)(a1 + 64);
  id v10 = v5;
  [v6 signData:v7 documentIdentifier:v8 trackingPreventionSalt:v9 completionHandler:v11];
}

void __99__SLDCollaborationSigningService_signData_forCollaborationIdentifier_trackingPreventionSalt_reply___block_invoke_2_14(uint64_t a1, void *a2, void *a3)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  if (!v5 || v6)
  {
    uint64_t v7 = SLDaemonLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __99__SLDCollaborationSigningService_signData_forCollaborationIdentifier_trackingPreventionSalt_reply___block_invoke_2_14_cold_1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
    }

    v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = *MEMORY[0x1E4F28228];
    v18[0] = @"Error signing data with SLPersonIdentityGenerator";
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    v16 = [v14 errorWithDomain:@"com.apple.sociallayerd.SLDCollaborationSigningService" code:2 userInfo:v15];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (id)signSourceProcessWithMetadata:(id)a3 reply:(id)a4
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v54 = a3;
  id v53 = a4;
  id v6 = [MEMORY[0x1E4F29268] currentConnection];
  uint64_t v7 = SLDaemonLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v54 localIdentifier];
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "-[SLDCollaborationSigningService signSourceProcessWithMetadata:reply:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2112;
    v79 = v8;
    _os_log_impl(&dword_19BE17000, v7, OS_LOG_TYPE_DEFAULT, "%s connection: %@, metadata identifier: %@", buf, 0x20u);
  }
  uint64_t v9 = (void *)MEMORY[0x1E4F963E8];
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v6, "processIdentifier"));
  id v73 = 0;
  uint64_t v11 = [v9 handleForIdentifier:v10 error:&v73];
  id v12 = v73;

  uint64_t v13 = [v11 identity];
  if (v13 && !v12)
  {
    if (v6)
    {
      [v6 auditToken];
      if (v11)
      {
LABEL_7:
        [v11 auditToken];
        goto LABEL_13;
      }
    }
    else
    {
      memset(v69, 0, 32);
      if (v11) {
        goto LABEL_7;
      }
    }
    memset(v68, 0, sizeof(v68));
LABEL_13:
    if (SLDAuditTokensAreEqual((uint64_t)v69, (uint64_t)v68))
    {
      id v21 = [v54 localIdentifier];
      BOOL v22 = v21 == 0;

      if (v22)
      {
        v23 = SLDaemonLogHandle();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          -[SLDCollaborationSigningService signSourceProcessWithMetadata:reply:](v23, v24, v25, v26, v27, v28, v29, v30);
        }
      }
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      LOBYTE(v79) = 0;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __70__SLDCollaborationSigningService_signSourceProcessWithMetadata_reply___block_invoke_31;
      aBlock[3] = &unk_1E58A8A00;
      v64 = buf;
      id v63 = v53;
      v31 = _Block_copy(aBlock);
      v60[0] = MEMORY[0x1E4F143A8];
      v60[1] = 3221225472;
      v60[2] = __70__SLDCollaborationSigningService_signSourceProcessWithMetadata_reply___block_invoke_2;
      v60[3] = &unk_1E58A8A28;
      id v32 = v31;
      id v61 = v32;
      id v33 = _Block_copy(v60);
      id v34 = objc_alloc_init(SLDProcessVerifier);
      v55[0] = MEMORY[0x1E4F143A8];
      v55[1] = 3221225472;
      v55[2] = __70__SLDCollaborationSigningService_signSourceProcessWithMetadata_reply___block_invoke_33;
      v55[3] = &unk_1E58A8AC8;
      id v56 = v54;
      id v35 = v34;
      v57 = v35;
      id v58 = v13;
      id v36 = v32;
      id v59 = v36;
      id v37 = _Block_copy(v55);
      v38 = [(SLDCollaborationSigningService *)self taskManager];
      id v20 = [v38 startAggregateTask:v37 withTimeout:v33 cancellationHandler:15.0];

      _Block_object_dispose(buf, 8);
    }
    else
    {
      id v39 = SLDaemonLogHandle();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        -[SLDCollaborationSigningService signSourceProcessWithMetadata:reply:](v39, v40, v41, v42, v43, v44, v45, v46);
      }

      v47 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v74 = *MEMORY[0x1E4F28228];
      v75 = @"signSourceProcessForMetadata: the audit token of the xpc connection does not match the audit token of the created process handle. Failing to sign the source process.";
      v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v75 forKeys:&v74 count:1];
      v49 = [v47 errorWithDomain:@"com.apple.sociallayerd.SLDCollaborationSigningService" code:2 userInfo:v48];

      v50 = [(SLDCollaborationSigningService *)self privateSerialQueue];
      v65[0] = MEMORY[0x1E4F143A8];
      v65[1] = 3221225472;
      v65[2] = __70__SLDCollaborationSigningService_signSourceProcessWithMetadata_reply___block_invoke_30;
      v65[3] = &unk_1E58A8AA0;
      id v66 = v49;
      id v67 = v53;
      id v51 = v49;
      dispatch_async(v50, v65);

      id v20 = objc_opt_new();
    }
    goto LABEL_22;
  }
  v14 = SLDaemonLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    -[SLDCollaborationSigningService signSourceProcessWithMetadata:reply:]((uint64_t)v12, v14);
  }

  id v15 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v76 = *MEMORY[0x1E4F28228];
  v77 = @"signSourceProcessForMetadata could not retrieve an RBSProcessHandle for NSXPCConnection";
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v77 forKeys:&v76 count:1];
  uint64_t v17 = [v15 errorWithDomain:@"com.apple.sociallayerd.SLDCollaborationSigningService" code:2 userInfo:v16];

  v18 = [(SLDCollaborationSigningService *)self privateSerialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__SLDCollaborationSigningService_signSourceProcessWithMetadata_reply___block_invoke;
  block[3] = &unk_1E58A8AA0;
  id v71 = v17;
  id v72 = v53;
  id v19 = v17;
  dispatch_async(v18, block);

  id v20 = objc_opt_new();
LABEL_22:

  return v20;
}

uint64_t __70__SLDCollaborationSigningService_signSourceProcessWithMetadata_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __70__SLDCollaborationSigningService_signSourceProcessWithMetadata_reply___block_invoke_30(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __70__SLDCollaborationSigningService_signSourceProcessWithMetadata_reply___block_invoke_31(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24))
  {
    uint64_t v1 = result;
    result = (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
    *(unsigned char *)(*(void *)(*(void *)(v1 + 40) + 8) + 24) = 1;
  }
  return result;
}

void __70__SLDCollaborationSigningService_signSourceProcessWithMetadata_reply___block_invoke_2(uint64_t a1, int a2)
{
  BOOL v4 = SLDaemonLogHandle();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
  if (a2)
  {
    if (v5) {
      __70__SLDCollaborationSigningService_signSourceProcessWithMetadata_reply___block_invoke_2_cold_1(v4, v6, v7, v8, v9, v10, v11, v12);
    }

    uint64_t v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.sociallayerd.SLDCollaborationSigningService" code:2 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    if (v5) {
      __70__SLDCollaborationSigningService_signSourceProcessWithMetadata_reply___block_invoke_2_cold_2(v4);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __70__SLDCollaborationSigningService_signSourceProcessWithMetadata_reply___block_invoke_33(uint64_t a1)
{
  v26[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) localIdentifier];
  id v3 = +[SLDProcessVerifier tagDataFromString:v2];

  BOOL v4 = *(void **)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v22 = 0;
  uint64_t v6 = [v4 signProcess:v5 tag:v3 error:&v22];
  id v7 = v22;
  uint64_t v8 = SLDaemonLogHandle();
  uint64_t v9 = v8;
  if (v7) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = v6 == 0;
  }
  if (v10)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __70__SLDCollaborationSigningService_signSourceProcessWithMetadata_reply___block_invoke_33_cold_1((uint64_t)v7, v9, v11, v12, v13, v14, v15, v16);
    }

    uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v25 = *MEMORY[0x1E4F28228];
    v26[0] = @"Error signing source process with SLDProcessVerifier";
    v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
    id v19 = [v17 errorWithDomain:@"com.apple.sociallayerd.SLDCollaborationSigningService" code:2 userInfo:v18];

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = [*(id *)(a1 + 32) localIdentifier];
      *(_DWORD *)buf = 138412290;
      uint64_t v24 = v21;
      _os_log_impl(&dword_19BE17000, v9, OS_LOG_TYPE_DEFAULT, "[SLDCollaborationSigningService] signSourceProcessForMetadata: successfully signed source process with collaboration local identifier: %@", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (OS_dispatch_queue)privateSerialQueue
{
  return self->_privateSerialQueue;
}

- (SLDTaskManager)taskManager
{
  return self->_taskManager;
}

- (void)setTaskManager:(id)a3
{
}

- (SLPersonIdentityGenerator)personIdentityGenerator
{
  return self->_personIdentityGenerator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personIdentityGenerator, 0);
  objc_storeStrong((id *)&self->_taskManager, 0);
  objc_storeStrong((id *)&self->_privateSerialQueue, 0);
}

- (void)allowsConnection:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __99__SLDCollaborationSigningService_signData_forCollaborationIdentifier_trackingPreventionSalt_reply___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __99__SLDCollaborationSigningService_signData_forCollaborationIdentifier_trackingPreventionSalt_reply___block_invoke_2_cold_2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_19BE17000, log, OS_LOG_TYPE_ERROR, "[SLDCollaborationSigningService] signData:forCollaborationIdentifier: was cancelled", v1, 2u);
}

void __99__SLDCollaborationSigningService_signData_forCollaborationIdentifier_trackingPreventionSalt_reply___block_invoke_2_14_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)signSourceProcessWithMetadata:(uint64_t)a1 reply:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  id v3 = "-[SLDCollaborationSigningService signSourceProcessWithMetadata:reply:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_19BE17000, a2, OS_LOG_TYPE_ERROR, "%s cannot sign source process, because RBSProcessIdentity could not be created. error: %@", (uint8_t *)&v2, 0x16u);
}

- (void)signSourceProcessWithMetadata:(uint64_t)a3 reply:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)signSourceProcessWithMetadata:(uint64_t)a3 reply:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __70__SLDCollaborationSigningService_signSourceProcessWithMetadata_reply___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __70__SLDCollaborationSigningService_signSourceProcessWithMetadata_reply___block_invoke_2_cold_2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_19BE17000, log, OS_LOG_TYPE_ERROR, "[SLDCollaborationSigningService] signSourceProcessForMetadata: was cancelled", v1, 2u);
}

void __70__SLDCollaborationSigningService_signSourceProcessWithMetadata_reply___block_invoke_33_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end