@interface SLDCollaborationHandshakeService
+ (id)remoteObjectProtocol;
+ (id)sharedService;
+ (void)setupInterface:(id)a3;
- (BOOL)_connection:(id)a3 hasPermissionForFileURL:(id)a4;
- (BOOL)_doesMetadata:(id)a3 containAllOf:(id)a4;
- (BOOL)_doesMetadata:(id)a3 containAnyOf:(id)a4;
- (BOOL)_fileURLHasFileProvider:(id)a3 error:(id *)a4;
- (BOOL)allowsConnection:(id)a3;
- (OS_dispatch_queue)privateSerialQueue;
- (SLDCollaborationHandshakeService)init;
- (SLDProcessVerifier)processVerifier;
- (SLDTaskManager)taskManager;
- (SLPersonIdentityGenerator)personIdentityGenerator;
- (SLSWActionDispatcher)actionDispatcher;
- (id)_removeIdentities:(id)a3 fromMetadata:(id)a4;
- (id)_updateMetadata:(id)a3 withNewIdentities:(id)a4;
- (id)addParticipantHandles:(id)a3 withFileURL:(id)a4 sandboxTokenData:(id)a5 metadata:(id)a6 reply:(id)a7;
- (id)addParticipantHandles:(id)a3 withMetadata:(id)a4 reply:(id)a5;
- (id)generateProofForIdentity:(id)a3 collaborationIdentifier:(id)a4 reply:(id)a5;
- (id)removeParticipantIdentities:(id)a3 withFileURL:(id)a4 sandboxTokenData:(id)a5 metadata:(id)a6 reply:(id)a7;
- (id)removeParticipantIdentities:(id)a3 withMetadata:(id)a4 reply:(id)a5;
- (id)startCollaborationWithFileURL:(id)a3 sandboxTokenData:(id)a4 metadata:(id)a5 participants:(id)a6 reply:(id)a7;
- (id)startCollaborationWithMetadata:(id)a3 participants:(id)a4 reply:(id)a5;
- (id)verifySourceBundleIdentifierFromMetadata:(id)a3 reply:(id)a4;
- (int64_t)_acquireSandboxHandleData:(id)a3 ForFileProviderDocumentURL:(id)a4 clientConnection:(id)a5 error:(id *)a6;
- (void)_localPersonIdentityForDocumentIdentifier:(id)a3 completion:(id)a4;
- (void)_personIdentitiesForHandles:(id)a3 documentIdentifier:(id)a4 completion:(id)a5;
- (void)_releaseSandboxHandle:(int64_t)a3;
- (void)_sendActionUpdateParticipantsWithFileURL:(id)a3 metadata:(id)a4 addedIdentities:(id)a5 removedIdentities:(id)a6 completion:(id)a7;
- (void)_sendActionUpdateParticipantsWithMetadata:(id)a3 addedIdentities:(id)a4 removedIdentities:(id)a5 completion:(id)a6;
- (void)prepareConnectionWithReply:(id)a3;
- (void)setActionDispatcher:(id)a3;
- (void)setProcessVerifier:(id)a3;
- (void)setTaskManager:(id)a3;
@end

@implementation SLDCollaborationHandshakeService

+ (id)remoteObjectProtocol
{
  return &unk_1EEC46478;
}

+ (id)sharedService
{
  if (sharedService_onceToken_2 != -1) {
    dispatch_once(&sharedService_onceToken_2, &__block_literal_global_8);
  }
  v2 = (void *)sharedService_sService_2;
  return v2;
}

uint64_t __49__SLDCollaborationHandshakeService_sharedService__block_invoke()
{
  v0 = objc_alloc_init(SLDCollaborationHandshakeService);
  uint64_t v1 = sharedService_sService_2;
  sharedService_sService_2 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (SLDCollaborationHandshakeService)init
{
  v15.receiver = self;
  v15.super_class = (Class)SLDCollaborationHandshakeService;
  v2 = [(SLDCollaborationHandshakeService *)&v15 init];
  if (v2)
  {
    v3 = SLDGlobalWorkloop();
    dispatch_queue_t v4 = dispatch_queue_create_with_target_V2("com.apple.sociallayerd.SLDCollaborationHandshakeService", 0, v3);
    privateSerialQueue = v2->_privateSerialQueue;
    v2->_privateSerialQueue = (OS_dispatch_queue *)v4;

    v6 = [[SLDTaskManager alloc] initWithSerialQueue:v2->_privateSerialQueue];
    taskManager = v2->_taskManager;
    v2->_taskManager = v6;

    v8 = [[SLSWActionDispatcher alloc] initWithQueue:v2->_privateSerialQueue];
    actionDispatcher = v2->_actionDispatcher;
    v2->_actionDispatcher = v8;

    v10 = [[SLPersonIdentityGenerator alloc] initWithQueue:v2->_privateSerialQueue];
    personIdentityGenerator = v2->_personIdentityGenerator;
    v2->_personIdentityGenerator = v10;

    v12 = objc_alloc_init(SLDProcessVerifier);
    processVerifier = v2->_processVerifier;
    v2->_processVerifier = v12;
  }
  return v2;
}

- (BOOL)allowsConnection:(id)a3
{
  id v3 = a3;
  if ((SLDConnectionIsEntitledForCollaborationHandshake(v3) & 1) != 0
    || (SLDConnectionHasLegacyHighlightsEntitlement(v3) & 1) != 0)
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = SLDaemonLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SLDCollaborationHandshakeService allowsConnection:]();
    }

    BOOL v4 = 0;
  }

  return v4;
}

+ (void)setupInterface:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = objc_msgSend(v3, "setWithObjects:", v5, objc_opt_class(), 0);
  [v4 setClasses:v6 forSelector:sel_removeParticipantIdentities_withMetadata_reply_ argumentIndex:0 ofReply:0];

  v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setClasses:v9 forSelector:sel_removeParticipantIdentities_withFileURL_sandboxTokenData_metadata_reply_ argumentIndex:0 ofReply:0];
}

- (void)prepareConnectionWithReply:(id)a3
{
}

- (id)generateProofForIdentity:(id)a3 collaborationIdentifier:(id)a4 reply:(id)a5
{
  v46[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8
    && ([v8 publicKeys], (v11 = objc_claimAutoreleasedReturnValue()) != 0)
    && ([v8 publicKeys],
        v12 = objc_claimAutoreleasedReturnValue(),
        uint64_t v13 = [v12 count],
        v12,
        v11,
        v13))
  {
    v40[0] = 0;
    v40[1] = v40;
    v40[2] = 0x2020000000;
    char v41 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __91__SLDCollaborationHandshakeService_generateProofForIdentity_collaborationIdentifier_reply___block_invoke_2;
    aBlock[3] = &unk_1E58A9158;
    v39 = v40;
    id v38 = v10;
    v14 = _Block_copy(aBlock);
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __91__SLDCollaborationHandshakeService_generateProofForIdentity_collaborationIdentifier_reply___block_invoke_3;
    v35[3] = &unk_1E58A8A28;
    id v15 = v14;
    id v36 = v15;
    v16 = _Block_copy(v35);
    uint64_t v27 = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    v29 = __91__SLDCollaborationHandshakeService_generateProofForIdentity_collaborationIdentifier_reply___block_invoke_38;
    v30 = &unk_1E58A8AC8;
    v31 = self;
    id v32 = v8;
    id v33 = v9;
    id v17 = v15;
    id v34 = v17;
    v18 = _Block_copy(&v27);
    v19 = [(SLDCollaborationHandshakeService *)self taskManager];
    v20 = [v19 startAggregateTask:v18 withTimeout:v16 cancellationHandler:15.0];

    _Block_object_dispose(v40, 8);
  }
  else
  {
    v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v45 = *MEMORY[0x1E4F28228];
    v46[0] = @"Cannot generate proof without an identity or public keys";
    v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:&v45 count:1];
    v23 = [v21 errorWithDomain:@"com.apple.sociallayerd.SLDCollaborationHandshakeService" code:2 userInfo:v22];

    v24 = [(SLDCollaborationHandshakeService *)self privateSerialQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __91__SLDCollaborationHandshakeService_generateProofForIdentity_collaborationIdentifier_reply___block_invoke;
    block[3] = &unk_1E58A8AA0;
    id v43 = v23;
    id v44 = v10;
    id v25 = v23;
    dispatch_async(v24, block);

    v20 = objc_opt_new();
  }

  return v20;
}

uint64_t __91__SLDCollaborationHandshakeService_generateProofForIdentity_collaborationIdentifier_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __91__SLDCollaborationHandshakeService_generateProofForIdentity_collaborationIdentifier_reply___block_invoke_2(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24))
  {
    uint64_t v1 = result;
    result = (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
    *(unsigned char *)(*(void *)(*(void *)(v1 + 40) + 8) + 24) = 1;
  }
  return result;
}

void __91__SLDCollaborationHandshakeService_generateProofForIdentity_collaborationIdentifier_reply___block_invoke_3(uint64_t a1, int a2)
{
  id v4 = SLDaemonLogHandle();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
  if (a2)
  {
    if (v5) {
      __91__SLDCollaborationHandshakeService_generateProofForIdentity_collaborationIdentifier_reply___block_invoke_3_cold_1();
    }

    v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.sociallayerd.SLDCollaborationHandshakeService" code:2 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    if (v5) {
      __91__SLDCollaborationHandshakeService_generateProofForIdentity_collaborationIdentifier_reply___block_invoke_3_cold_2();
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __91__SLDCollaborationHandshakeService_generateProofForIdentity_collaborationIdentifier_reply___block_invoke_38(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  v6 = [*(id *)(a1 + 32) personIdentityGenerator];
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __91__SLDCollaborationHandshakeService_generateProofForIdentity_collaborationIdentifier_reply___block_invoke_2_39;
  v10[3] = &unk_1E58A9180;
  id v11 = v5;
  id v12 = *(id *)(a1 + 56);
  id v9 = v5;
  [v6 generateProofForIdentity:v7 documentIdentifier:v8 completionHandler:v10];
}

void __91__SLDCollaborationHandshakeService_generateProofForIdentity_collaborationIdentifier_reply___block_invoke_2_39(uint64_t a1, void *a2, void *a3)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  if (!v5 || v6)
  {
    uint64_t v7 = SLDaemonLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __91__SLDCollaborationHandshakeService_generateProofForIdentity_collaborationIdentifier_reply___block_invoke_2_39_cold_1();
    }

    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v9 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v11 = *MEMORY[0x1E4F28228];
      v12[0] = @"generating proof with SLPersonIdentityGenerator";
      id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
      id v8 = [v9 errorWithDomain:@"com.apple.sociallayerd.SLDCollaborationHandshakeService" code:2 userInfo:v10];
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (id)verifySourceBundleIdentifierFromMetadata:(id)a3 reply:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = SLDaemonLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v45 = "-[SLDCollaborationHandshakeService verifySourceBundleIdentifierFromMetadata:reply:]";
    __int16 v46 = 2112;
    id v47 = v6;
    _os_log_impl(&dword_19BE17000, v8, OS_LOG_TYPE_DEFAULT, "%s metadata: %@", buf, 0x16u);
  }

  id v9 = [v6 sourceProcessData];
  id v10 = [v6 localIdentifier];
  uint64_t v11 = +[SLDProcessVerifier tagDataFromString:v10];

  if (v9)
  {
    id v12 = [(SLDCollaborationHandshakeService *)self processVerifier];
    id v39 = 0;
    id v13 = [v12 verifyData:v9 tag:v11 error:&v39];
    id v14 = v39;

    if (v13)
    {
      id v15 = [(SLDCollaborationHandshakeService *)self actionDispatcher];
      id v35 = 0;
      v16 = [v15 bundleIDForProcess:v13 error:&v35];
      id v17 = v35;

      id v18 = 0;
      if (!v16)
      {
        if (v17)
        {
          id v18 = v17;
        }
        else
        {
          id v25 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v40 = *MEMORY[0x1E4F28228];
          char v41 = @"[SLDCollaborationHandshakeService] verifySourceBundleIdentifierFromMetadata: failed to verify source process.";
          v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
          id v18 = [v25 errorWithDomain:@"com.apple.sociallayerd.SLDCollaborationHandshakeService" code:1 userInfo:v30];
        }
      }
      v26 = [(SLDCollaborationHandshakeService *)self privateSerialQueue];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __83__SLDCollaborationHandshakeService_verifySourceBundleIdentifierFromMetadata_reply___block_invoke_2;
      v31[3] = &unk_1E58A91A8;
      id v33 = v18;
      id v34 = v7;
      id v32 = v16;
      id v27 = v18;
      id v28 = v16;
      dispatch_async(v26, v31);

      v24 = objc_opt_new();
      goto LABEL_14;
    }
  }
  else
  {
    id v14 = 0;
  }
  v19 = SLDaemonLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    -[SLDCollaborationHandshakeService verifySourceBundleIdentifierFromMetadata:reply:]((uint64_t)v9, v6);
  }

  v20 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v42 = *MEMORY[0x1E4F28228];
  id v43 = @"[SLDCollaborationHandshakeService] verifySourceBundleIdentifierFromMetadata: failed to verify source process.";
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
  v22 = [v20 errorWithDomain:@"com.apple.sociallayerd.SLDCollaborationHandshakeService" code:1 userInfo:v21];

  v23 = [(SLDCollaborationHandshakeService *)self privateSerialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__SLDCollaborationHandshakeService_verifySourceBundleIdentifierFromMetadata_reply___block_invoke;
  block[3] = &unk_1E58A8AA0;
  id v37 = v22;
  id v38 = v7;
  id v13 = v22;
  dispatch_async(v23, block);

  v24 = objc_opt_new();
  id v17 = v38;
LABEL_14:

  return v24;
}

uint64_t __83__SLDCollaborationHandshakeService_verifySourceBundleIdentifierFromMetadata_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __83__SLDCollaborationHandshakeService_verifySourceBundleIdentifierFromMetadata_reply___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)startCollaborationWithMetadata:(id)a3 participants:(id)a4 reply:(id)a5
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v38 = a4;
  id v39 = a5;
  id v9 = SLDaemonLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[SLDCollaborationHandshakeService startCollaborationWithMetadata:participants:reply:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2112;
    id v66 = v38;
    _os_log_impl(&dword_19BE17000, v9, OS_LOG_TYPE_DEFAULT, "%s metadata: %@ participants: %@", buf, 0x20u);
  }

  id v10 = [v8 sourceProcessData];
  uint64_t v11 = [v8 localIdentifier];
  id v37 = +[SLDProcessVerifier tagDataFromString:v11];

  if (v10)
  {
    id v12 = [(SLDCollaborationHandshakeService *)self processVerifier];
    id v62 = 0;
    id v13 = [v12 verifyData:v10 tag:v37 error:&v62];
    id v36 = v62;

    if (v13)
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      LOBYTE(v66) = 0;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke_2;
      aBlock[3] = &unk_1E58A91D0;
      v58 = buf;
      id v57 = v39;
      id v14 = _Block_copy(aBlock);
      v54[0] = MEMORY[0x1E4F143A8];
      v54[1] = 3221225472;
      v54[2] = __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke_3;
      v54[3] = &unk_1E58A8A28;
      id v15 = v14;
      id v55 = v15;
      id v35 = _Block_copy(v54);
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke_52;
      v52[3] = &unk_1E58A9248;
      v52[4] = self;
      id v16 = v15;
      id v53 = v16;
      id v17 = _Block_copy(v52);
      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      v49[2] = __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke_57;
      v49[3] = &unk_1E58A92C0;
      v49[4] = self;
      id v18 = v16;
      id v50 = v18;
      id v19 = v17;
      id v51 = v19;
      v20 = _Block_copy(v49);
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      void v46[2] = __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke_65;
      v46[3] = &unk_1E58A9310;
      v46[4] = self;
      id v47 = v38;
      id v21 = v20;
      id v48 = v21;
      v22 = _Block_copy(v46);
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke_70;
      void v40[3] = &unk_1E58A9388;
      id v41 = v8;
      id v23 = v22;
      id v44 = v23;
      id v24 = v18;
      id v45 = v24;
      uint64_t v42 = self;
      id v25 = v13;
      id v43 = v25;
      v26 = _Block_copy(v40);
      id v27 = [(SLDCollaborationHandshakeService *)self taskManager];
      id v28 = [v27 startAggregateTask:v26 withTimeout:v35 cancellationHandler:15.0];

      _Block_object_dispose(buf, 8);
      goto LABEL_10;
    }
  }
  else
  {
    id v36 = 0;
  }
  v29 = SLDaemonLogHandle();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
    -[SLDCollaborationHandshakeService startCollaborationWithMetadata:participants:reply:]((uint64_t)v10, v8);
  }

  v30 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v63 = *MEMORY[0x1E4F28228];
  v64 = @"[SLDCollaborationHandshakeService] startCollaborationWithMetadata: failed to verify source process.";
  v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v64 forKeys:&v63 count:1];
  id v32 = [v30 errorWithDomain:@"com.apple.sociallayerd.SLDCollaborationHandshakeService" code:1 userInfo:v31];

  id v33 = [(SLDCollaborationHandshakeService *)self privateSerialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke;
  block[3] = &unk_1E58A8AA0;
  id v60 = v32;
  id v61 = v39;
  id v25 = v32;
  dispatch_async(v33, block);

  id v28 = objc_opt_new();
LABEL_10:

  return v28;
}

uint64_t __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, *(void *)(a1 + 32));
}

uint64_t __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke_2(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24))
  {
    uint64_t v1 = result;
    result = (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
    *(unsigned char *)(*(void *)(*(void *)(v1 + 40) + 8) + 24) = 1;
  }
  return result;
}

void __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke_3(uint64_t a1, int a2)
{
  id v4 = SLDaemonLogHandle();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
  if (a2)
  {
    if (v5) {
      __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke_3_cold_1();
    }

    id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.sociallayerd.SLDCollaborationHandshakeService" code:2 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    if (v5) {
      __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke_3_cold_2();
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke_52(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = *(void **)(a1 + 32);
  id v15 = a6;
  id v16 = a5;
  id v17 = [v14 taskManager];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke_2_53;
  v22[3] = &unk_1E58A9220;
  id v18 = *(void **)(a1 + 40);
  v22[4] = *(void *)(a1 + 32);
  id v23 = v13;
  id v24 = v11;
  id v25 = v12;
  id v26 = v18;
  id v19 = v12;
  id v20 = v11;
  id v21 = v13;
  [v17 startSubtask:v22 withProgress:v16 timer:v15];
}

void __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke_2_53(uint64_t a1)
{
  v2 = SLDaemonLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19BE17000, v2, OS_LOG_TYPE_DEFAULT, "[SLDCollaborationHandshakeService] startCollaborationWithMetadata: starting _SWUpdateCollaborationParticipantsAction", buf, 2u);
  }

  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  BOOL v5 = [*(id *)(a1 + 48) allValues];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke_54;
  v7[3] = &unk_1E58A91F8;
  id v6 = *(void **)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v6;
  id v9 = *(id *)(a1 + 48);
  id v11 = *(id *)(a1 + 64);
  id v10 = *(id *)(a1 + 56);
  [v3 _sendActionUpdateParticipantsWithMetadata:v4 addedIdentities:v5 removedIdentities:MEMORY[0x1E4F1CBF0] completion:v7];
}

void __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke_54(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = SLDaemonLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_19BE17000, v3, OS_LOG_TYPE_DEFAULT, "[SLDCollaborationHandshakeService] startCollaborationWithMetadata: success. Replying to client with shareURL and updatedMetadata", v6, 2u);
    }

    uint64_t v4 = [*(id *)(a1 + 32) _updateMetadata:*(void *)(a1 + 40) withNewIdentities:*(void *)(a1 + 48)];
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    BOOL v5 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v5();
  }
}

void __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke_57(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = *(void **)(a1 + 32);
  id v15 = a6;
  id v16 = a5;
  id v17 = [v14 taskManager];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke_2_58;
  v22[3] = &unk_1E58A9298;
  id v18 = *(void **)(a1 + 40);
  v22[4] = *(void *)(a1 + 32);
  id v23 = v13;
  id v26 = v18;
  id v24 = v11;
  id v27 = *(id *)(a1 + 48);
  id v25 = v12;
  id v19 = v12;
  id v20 = v11;
  id v21 = v13;
  [v17 startSubtask:v22 withProgress:v16 timer:v15];
}

void __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke_2_58(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = SLDaemonLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19BE17000, v10, OS_LOG_TYPE_DEFAULT, "[SLDCollaborationHandshakeService] startCollaborationWithFileURL: starting _localPersonIdentityForDocumentIdentifier", buf, 2u);
  }

  id v11 = *(void **)(a1 + 32);
  id v12 = [*(id *)(a1 + 40) collaborationIdentifier];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke_59;
  v16[3] = &unk_1E58A9270;
  id v22 = v9;
  id v17 = *(id *)(a1 + 40);
  id v23 = *(id *)(a1 + 64);
  id v18 = *(id *)(a1 + 48);
  id v24 = *(id *)(a1 + 72);
  id v19 = *(id *)(a1 + 56);
  id v20 = v7;
  id v21 = v8;
  id v13 = v8;
  id v14 = v7;
  id v15 = v9;
  [v11 _localPersonIdentityForDocumentIdentifier:v12 completion:v16];
}

void __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke_59(void *a1, void *a2, void *a3, void *a4)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v7 && v8 && !v9)
  {
    id v11 = SLDaemonLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v15 = 0;
      _os_log_impl(&dword_19BE17000, v11, OS_LOG_TYPE_DEFAULT, "[SLDCollaborationHandshakeService] _startCollaborationWithMetadata: Generated local identity.", v15, 2u);
    }

    (*(void (**)(void))(a1[9] + 16))();
    id v10 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:a1[5]];
    [v10 setObject:v7 forKeyedSubscript:v8];
    (*(void (**)(void))(a1[11] + 16))();
  }
  else
  {
    (*(void (**)(void))(a1[9] + 16))();
    if (!v10)
    {
      id v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = *MEMORY[0x1E4F28228];
      v17[0] = @"Could not generate person identities.";
      id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
      id v10 = [v12 errorWithDomain:@"com.apple.sociallayerd.SLDCollaborationHandshakeService" code:1 userInfo:v13];
    }
    id v14 = SLDaemonLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke_59_cold_1((uint64_t)a1);
    }

    (*(void (**)(void))(a1[10] + 16))();
  }
}

void __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke_65(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = *(void **)(a1 + 32);
  id v12 = a5;
  id v13 = a4;
  id v14 = [v11 taskManager];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke_2_66;
  v19[3] = &unk_1E58A9220;
  id v15 = *(void **)(a1 + 40);
  v19[4] = *(void *)(a1 + 32);
  id v20 = v15;
  id v21 = v10;
  id v16 = *(id *)(a1 + 48);
  id v22 = v9;
  id v23 = v16;
  id v17 = v9;
  id v18 = v10;
  [v14 startSubtask:v19 withProgress:v13 timer:v12];
}

void __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke_2_66(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = *(void **)(a1 + 32);
  id v11 = [*(id *)(a1 + 40) allObjects];
  id v12 = [*(id *)(a1 + 48) collaborationIdentifier];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke_3_67;
  v16[3] = &unk_1E58A92E8;
  id v21 = v9;
  id v22 = *(id *)(a1 + 64);
  id v17 = *(id *)(a1 + 56);
  id v18 = *(id *)(a1 + 48);
  id v19 = v7;
  id v20 = v8;
  id v13 = v8;
  id v14 = v7;
  id v15 = v9;
  [v10 _personIdentitiesForHandles:v11 documentIdentifier:v12 completion:v16];
}

void __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke_3_67(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = SLDaemonLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v5 = 0;
    _os_log_impl(&dword_19BE17000, v4, OS_LOG_TYPE_DEFAULT, "[SLDCollaborationHandshakeService] startCollaborationWithMetadata: Generated remote identities.", v5, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
}

void __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke_70(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__9;
  v28[4] = __Block_byref_object_dispose__9;
  id v29 = 0;
  id v10 = [MEMORY[0x1E4F3BE28] actionWithMetadata:*(void *)(a1 + 32)];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke_72;
  v21[3] = &unk_1E58A9338;
  id v27 = v28;
  id v24 = *(id *)(a1 + 56);
  id v11 = v7;
  id v22 = v11;
  id v12 = v8;
  id v23 = v12;
  id v13 = v9;
  id v25 = v13;
  id v26 = *(id *)(a1 + 64);
  [v10 setResponseHandlerBlock:v21];
  id v14 = [*(id *)(a1 + 40) actionDispatcher];
  uint64_t v15 = *(void *)(a1 + 48);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  void v17[2] = __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke_78;
  v17[3] = &unk_1E58A9360;
  id v20 = v28;
  id v16 = v13;
  id v18 = v16;
  id v19 = *(id *)(a1 + 64);
  [v14 dispatchAction:v10 withAssertionForProcess:v15 completion:v17];

  _Block_object_dispose(v28, 8);
}

void __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke_72(void *a1, void *a2)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [*(id *)(*(void *)(a1[9] + 8) + 40) invalidate];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = v4;
  if ([v5 success]
    && ([v5 updatedMetadata], (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0)
    && (id v7 = (void *)v6,
        [v5 url],
        id v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        v8))
  {
    id v9 = SLDaemonLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v18 = 0;
      _os_log_impl(&dword_19BE17000, v9, OS_LOG_TYPE_DEFAULT, "[SLDCollaborationHandshakeService] startCollaborationWithMetadata: finished start action, moving on to adding participants.", v18, 2u);
    }

    uint64_t v10 = a1[6];
    id v11 = [v5 url];
    id v12 = [v5 updatedMetadata];
    (*(void (**)(uint64_t, id, void *, void, void))(v10 + 16))(v10, v11, v12, a1[4], a1[5]);
  }
  else
  {
    (*(void (**)(void))(a1[7] + 16))();
    id v13 = [v3 error];
    id v14 = v13;
    if (v13)
    {
      id v11 = v13;
    }
    else
    {
      uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v19 = *MEMORY[0x1E4F28228];
      v20[0] = @"startCollaborationWithMetadata start action failed.";
      id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
      id v11 = [v15 errorWithDomain:@"com.apple.sociallayerd.SLDCollaborationHandshakeService" code:1 userInfo:v16];
    }
    id v17 = SLDaemonLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke_72_cold_1();
    }

    (*(void (**)(void))(a1[8] + 16))();
  }
}

void __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke_78(void *a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
  if (v7)
  {
    [*(id *)(*(void *)(a1[6] + 8) + 40) invalidate];
    (*(void (**)(void))(a1[4] + 16))();
    (*(void (**)(void))(a1[5] + 16))();
  }
  else
  {
    id v8 = SLDaemonLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = [v6 isValid];
      uint64_t v10 = @"NO";
      if (v9) {
        uint64_t v10 = @"YES";
      }
      int v11 = 138412546;
      id v12 = v6;
      __int16 v13 = 2112;
      id v14 = v10;
      _os_log_impl(&dword_19BE17000, v8, OS_LOG_TYPE_DEFAULT, "[SLDCollaborationHandshakeService] action dispatcher successfully sent the start collaboration action to the app. Waiting for our response handler to be called. Assertion: %@ isValid: %@", (uint8_t *)&v11, 0x16u);
    }
  }
}

- (id)startCollaborationWithFileURL:(id)a3 sandboxTokenData:(id)a4 metadata:(id)a5 participants:(id)a6 reply:(id)a7
{
  v80[2] = *(id *)MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v41 = a4;
  id v43 = a5;
  id v44 = (uint64_t (*)(uint64_t, uint64_t))a6;
  id v40 = a7;
  uint64_t v42 = [MEMORY[0x1E4F29268] currentConnection];
  __int16 v13 = SLDaemonLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[SLDCollaborationHandshakeService startCollaborationWithFileURL:sandboxTokenData:metadata:part"
                         "icipants:reply:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v43;
    *(_WORD *)&buf[22] = 2112;
    v78 = v44;
    _os_log_impl(&dword_19BE17000, v13, OS_LOG_TYPE_DEFAULT, "%s metadata: %@ participants: %@", buf, 0x20u);
  }

  id v14 = objc_opt_new();
  [v14 setTotalUnitCount:1];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  v78 = __Block_byref_object_copy__9;
  v79 = __Block_byref_object_dispose__9;
  v80[0] = 0;
  uint64_t v73 = 0;
  v74 = &v73;
  uint64_t v75 = 0x2020000000;
  int64_t v76 = 0;
  id v72 = 0;
  int64_t v15 = [(SLDCollaborationHandshakeService *)self _acquireSandboxHandleData:v41 ForFileProviderDocumentURL:v12 clientConnection:v42 error:&v72];
  objc_storeStrong(v80, v72);
  int64_t v76 = v15;
  if (v74[3] == -1)
  {
    uint64_t v33 = *(void *)&buf[8];
    id v34 = *(void **)(*(void *)&buf[8] + 40);
    if (v34)
    {
      id v35 = v34;
      id v36 = *(void **)(v33 + 40);
      *(void *)(v33 + 40) = v35;
    }
    else
    {
      uint64_t v37 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.sociallayerd.SLDCollaborationHandshakeService" code:3 userInfo:0];
      id v36 = *(void **)(*(void *)&buf[8] + 40);
      *(void *)(*(void *)&buf[8] + 40) = v37;
    }

    id v38 = [(SLDCollaborationHandshakeService *)self privateSerialQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke;
    block[3] = &unk_1E58A8FE8;
    id v70 = v40;
    v71 = buf;
    dispatch_async(v38, block);
  }
  else
  {
    v67[0] = 0;
    v67[1] = v67;
    v67[2] = 0x2020000000;
    char v68 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke_2;
    aBlock[3] = &unk_1E58A93B0;
    void aBlock[4] = self;
    v65 = &v73;
    id v66 = v67;
    id v64 = v40;
    id v16 = _Block_copy(aBlock);
    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke_3;
    v61[3] = &unk_1E58A8A28;
    id v17 = v16;
    id v62 = v17;
    id v18 = _Block_copy(v61);
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke_90;
    v58[3] = &unk_1E58A9428;
    v58[4] = self;
    id v19 = v12;
    id v59 = v19;
    id v20 = v17;
    id v60 = v20;
    id v21 = _Block_copy(v58);
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke_96;
    v55[3] = &unk_1E58A92C0;
    v55[4] = self;
    id v22 = v20;
    id v56 = v22;
    id v23 = v21;
    id v57 = v23;
    id v24 = _Block_copy(v55);
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke_99;
    v51[3] = &unk_1E58A94A0;
    v51[4] = self;
    v52 = v44;
    id v25 = v22;
    id v53 = v25;
    id v26 = v24;
    id v54 = v26;
    id v27 = _Block_copy(v51);
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke_102;
    v45[3] = &unk_1E58A9518;
    id v46 = v43;
    id v47 = v19;
    id v48 = self;
    id v28 = v27;
    id v49 = v28;
    id v29 = v25;
    id v50 = v29;
    v30 = _Block_copy(v45);
    v31 = [(SLDCollaborationHandshakeService *)self taskManager];
    uint64_t v32 = [v31 startAggregateTask:v30 withTimeout:v18 cancellationHandler:15.0];

    _Block_object_dispose(v67, 8);
    id v14 = (void *)v32;
  }
  _Block_object_dispose(&v73, 8);
  _Block_object_dispose(buf, 8);

  return v14;
}

uint64_t __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0, 0, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v9 = a2;
  id v7 = a3;
  id v8 = a4;
  [*(id *)(a1 + 32) _releaseSandboxHandle:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
}

void __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke_3(uint64_t a1, int a2)
{
  uint64_t v4 = SLDaemonLogHandle();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
  if (a2)
  {
    if (v5) {
      __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke_3_cold_1();
    }

    id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.sociallayerd.SLDCollaborationHandshakeService" code:2 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    if (v5) {
      __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke_3_cold_2();
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke_90(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = *(void **)(a1 + 32);
  id v15 = a6;
  id v16 = a5;
  id v17 = [v14 taskManager];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke_2_91;
  v23[3] = &unk_1E58A9400;
  id v18 = *(void **)(a1 + 40);
  v23[4] = *(void *)(a1 + 32);
  id v24 = v18;
  id v25 = v13;
  id v26 = v11;
  id v19 = *(id *)(a1 + 48);
  id v27 = v12;
  id v28 = v19;
  id v20 = v12;
  id v21 = v11;
  id v22 = v13;
  [v17 startSubtask:v23 withProgress:v16 timer:v15];
}

void __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke_2_91(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id v6 = SLDaemonLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19BE17000, v6, OS_LOG_TYPE_DEFAULT, "[SLDCollaborationHandshakeService] startCollaborationWithFileURL: starting _updateParticipantsWithFileURL", buf, 2u);
  }

  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  uint64_t v10 = [*(id *)(a1 + 56) allValues];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke_92;
  v13[3] = &unk_1E58A93D8;
  uint64_t v11 = *(void *)(a1 + 32);
  id v17 = v5;
  v13[4] = v11;
  id v14 = *(id *)(a1 + 48);
  id v15 = *(id *)(a1 + 56);
  id v18 = *(id *)(a1 + 72);
  id v16 = *(id *)(a1 + 64);
  id v12 = v5;
  [v7 _sendActionUpdateParticipantsWithFileURL:v8 metadata:v9 addedIdentities:v10 removedIdentities:MEMORY[0x1E4F1CBF0] completion:v13];
}

void __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke_92(uint64_t a1, int a2, void *a3)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  if (a2)
  {
    id v6 = SLDaemonLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_19BE17000, v6, OS_LOG_TYPE_DEFAULT, "[SLDCollaborationHandshakeService] startCollaborationWithFileURL: success. Replying with shareURL and updatedMetadata", v11, 2u);
    }

    id v7 = [*(id *)(a1 + 32) _updateMetadata:*(void *)(a1 + 40) withNewIdentities:*(void *)(a1 + 48)];
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  else
  {
    if (!v5)
    {
      uint64_t v8 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v12 = *MEMORY[0x1E4F28228];
      v13[0] = @"startCollaborationWithFileURL adding participants failed";
      uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
      id v5 = [v8 errorWithDomain:@"com.apple.sociallayerd.SLDCollaborationHandshakeService" code:1 userInfo:v9];
    }
    uint64_t v10 = SLDaemonLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke_92_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
}

void __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke_96(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = *(void **)(a1 + 32);
  id v15 = a6;
  id v16 = a5;
  id v17 = [v14 taskManager];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke_2_97;
  v22[3] = &unk_1E58A9298;
  id v18 = *(void **)(a1 + 40);
  v22[4] = *(void *)(a1 + 32);
  id v23 = v13;
  id v26 = v18;
  id v24 = v11;
  id v27 = *(id *)(a1 + 48);
  id v25 = v12;
  id v19 = v12;
  id v20 = v11;
  id v21 = v13;
  [v17 startSubtask:v22 withProgress:v16 timer:v15];
}

void __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke_2_97(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = SLDaemonLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19BE17000, v10, OS_LOG_TYPE_DEFAULT, "[SLDCollaborationHandshakeService] startCollaborationWithFileURL: starting _localPersonIdentityForDocumentIdentifier", buf, 2u);
  }

  id v11 = *(void **)(a1 + 32);
  id v12 = [*(id *)(a1 + 40) collaborationIdentifier];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke_98;
  v16[3] = &unk_1E58A9270;
  id v22 = v9;
  id v17 = *(id *)(a1 + 40);
  id v23 = *(id *)(a1 + 64);
  id v18 = *(id *)(a1 + 48);
  id v24 = *(id *)(a1 + 72);
  id v19 = *(id *)(a1 + 56);
  id v20 = v7;
  id v21 = v8;
  id v13 = v8;
  id v14 = v7;
  id v15 = v9;
  [v11 _localPersonIdentityForDocumentIdentifier:v12 completion:v16];
}

void __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke_98(void *a1, void *a2, void *a3, void *a4)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  if (v7 && v8 && !v9)
  {
    id v11 = SLDaemonLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v15 = 0;
      _os_log_impl(&dword_19BE17000, v11, OS_LOG_TYPE_DEFAULT, "[SLDCollaborationHandshakeService] _startCollaborationWithFileURL: Generated local identity.", v15, 2u);
    }

    (*(void (**)(void))(a1[9] + 16))();
    uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:a1[5]];
    [v10 setObject:v7 forKeyedSubscript:v8];
    (*(void (**)(void))(a1[11] + 16))();
  }
  else
  {
    (*(void (**)(void))(a1[9] + 16))();
    if (!v10)
    {
      id v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = *MEMORY[0x1E4F28228];
      v17[0] = @"Could not generate person identities.";
      id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
      uint64_t v10 = [v12 errorWithDomain:@"com.apple.sociallayerd.SLDCollaborationHandshakeService" code:1 userInfo:v13];
    }
    id v14 = SLDaemonLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke_98_cold_1((uint64_t)a1);
    }

    (*(void (**)(void))(a1[10] + 16))();
  }
}

void __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke_99(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = *(void **)(a1 + 32);
  id v12 = a5;
  id v13 = a4;
  id v14 = [v11 taskManager];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke_2_100;
  v18[3] = &unk_1E58A9478;
  id v15 = *(void **)(a1 + 40);
  v18[4] = *(void *)(a1 + 32);
  id v19 = v15;
  id v20 = v10;
  id v22 = *(id *)(a1 + 48);
  id v23 = *(id *)(a1 + 56);
  id v21 = v9;
  id v16 = v9;
  id v17 = v10;
  [v14 startSubtask:v18 withProgress:v13 timer:v12];
}

void __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke_2_100(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = *(void **)(a1 + 32);
  id v11 = [*(id *)(a1 + 40) allObjects];
  id v12 = [*(id *)(a1 + 48) collaborationIdentifier];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke_3_101;
  v16[3] = &unk_1E58A9450;
  id v21 = v9;
  id v22 = *(id *)(a1 + 64);
  id v23 = *(id *)(a1 + 72);
  id v17 = *(id *)(a1 + 56);
  id v18 = *(id *)(a1 + 48);
  id v19 = v7;
  id v20 = v8;
  id v13 = v8;
  id v14 = v7;
  id v15 = v9;
  [v10 _personIdentitiesForHandles:v11 documentIdentifier:v12 completion:v16];
}

void __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke_3_101(void *a1, void *a2, void *a3)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([v5 count])
  {
    id v7 = SLDaemonLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_19BE17000, v7, OS_LOG_TYPE_DEFAULT, "[SLDCollaborationHandshakeService] _startCollaborationWithFileURL: Generated remote identities.", (uint8_t *)&v11, 2u);
    }

    (*(void (**)(void))(a1[8] + 16))();
    (*(void (**)(void))(a1[10] + 16))();
  }
  else
  {
    (*(void (**)(void))(a1[8] + 16))();
    if (!v6)
    {
      id v8 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v13 = *MEMORY[0x1E4F28228];
      v14[0] = @"Could not generate person identities.";
      id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
      id v6 = [v8 errorWithDomain:@"com.apple.sociallayerd.SLDCollaborationHandshakeService" code:1 userInfo:v9];
    }
    id v10 = SLDaemonLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v6;
      _os_log_impl(&dword_19BE17000, v10, OS_LOG_TYPE_DEFAULT, "[SLDCollaborationHandshakeService] _startCollaborationWithFileURL Failed to generate identities. Error: %@", (uint8_t *)&v11, 0xCu);
    }

    (*(void (**)(void))(a1[9] + 16))();
  }
}

void __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke_102(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F3BE28] actionWithMetadata:*(void *)(a1 + 32)];
  id v11 = *(id *)(a1 + 56);
  id v10 = v5;
  id v12 = *(id *)(a1 + 64);
  id v8 = v6;
  id v9 = v5;
  SWPerformActionForDocumentURL();
}

void __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke_2_103(id *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [a1[4] privateSerialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke_3_104;
  block[3] = &unk_1E58A94C8;
  id v7 = v3;
  id v10 = a1[7];
  id v8 = a1[5];
  id v9 = a1[6];
  id v11 = a1[8];
  id v5 = v3;
  dispatch_async(v4, block);
}

void __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke_3_104(void *a1)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 4);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = *v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;
  if ([v4 success]
    && ([v4 url], (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0)
    && (id v6 = (void *)v5,
        [v4 updatedMetadata],
        id v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    id v8 = SLDaemonLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v17 = 0;
      _os_log_impl(&dword_19BE17000, v8, OS_LOG_TYPE_DEFAULT, "_SWStartCollaborationAction returned a shareURL and updatedMetadata.", v17, 2u);
    }

    uint64_t v9 = a1[7];
    id v10 = [v4 url];
    id v11 = [v4 updatedMetadata];
    (*(void (**)(uint64_t, id, void *, void, void))(v9 + 16))(v9, v10, v11, a1[5], a1[6]);
  }
  else
  {
    id v12 = [*v2 error];
    uint64_t v13 = v12;
    if (v12)
    {
      id v10 = v12;
    }
    else
    {
      id v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v18 = *MEMORY[0x1E4F28228];
      v19[0] = @"_SWStartCollaborationAction failed";
      id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
      id v10 = [v14 errorWithDomain:@"com.apple.sociallayerd.SLDCollaborationHandshakeService" code:1 userInfo:v15];
    }
    id v16 = SLDaemonLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke_3_104_cold_1(v2, (uint64_t)v10, v16);
    }

    (*(void (**)(void))(a1[8] + 16))();
  }
}

- (id)addParticipantHandles:(id)a3 withMetadata:(id)a4 reply:(id)a5
{
  v79[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = SLDaemonLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[SLDCollaborationHandshakeService addParticipantHandles:withMetadata:reply:]";
    _os_log_impl(&dword_19BE17000, v11, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
  }

  if ([v8 count])
  {
    id v12 = [v9 collaborationIdentifier];
    BOOL v13 = v12 == 0;

    if (v13)
    {
      uint64_t v37 = SLDaemonLogHandle();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
        -[SLDCollaborationHandshakeService addParticipantHandles:withMetadata:reply:](v37, v38, v39, v40, v41, v42, v43, v44);
      }

      id v45 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v76 = *MEMORY[0x1E4F28228];
      v77 = @"addParticipantHandles:withMetadata: cannot add participant handles because the metadata did not have a collaboration identifier";
      id v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v77 forKeys:&v76 count:1];
      id v47 = [v45 errorWithDomain:@"com.apple.sociallayerd.SLDCollaborationHandshakeService" code:2 userInfo:v46];

      id v48 = [(SLDCollaborationHandshakeService *)self privateSerialQueue];
      v67[0] = MEMORY[0x1E4F143A8];
      v67[1] = 3221225472;
      v67[2] = __77__SLDCollaborationHandshakeService_addParticipantHandles_withMetadata_reply___block_invoke_115;
      void v67[3] = &unk_1E58A8AA0;
      id v68 = v47;
      id v69 = v10;
      id v49 = v47;
      dispatch_async(v48, v67);

      id v23 = objc_opt_new();
    }
    else
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v74 = 0x2020000000;
      char v75 = 0;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __77__SLDCollaborationHandshakeService_addParticipantHandles_withMetadata_reply___block_invoke_2;
      aBlock[3] = &unk_1E58A9540;
      p_long long buf = &buf;
      id v65 = v10;
      id v14 = _Block_copy(aBlock);
      v62[0] = MEMORY[0x1E4F143A8];
      v62[1] = 3221225472;
      v62[2] = __77__SLDCollaborationHandshakeService_addParticipantHandles_withMetadata_reply___block_invoke_3;
      v62[3] = &unk_1E58A8A28;
      id v15 = v14;
      id v63 = v15;
      id v16 = _Block_copy(v62);
      v60[0] = MEMORY[0x1E4F143A8];
      v60[1] = 3221225472;
      v60[2] = __77__SLDCollaborationHandshakeService_addParticipantHandles_withMetadata_reply___block_invoke_117;
      v60[3] = &unk_1E58A9590;
      v60[4] = self;
      id v17 = v15;
      id v61 = v17;
      uint64_t v18 = _Block_copy(v60);
      uint64_t v51 = MEMORY[0x1E4F143A8];
      uint64_t v52 = 3221225472;
      id v53 = __77__SLDCollaborationHandshakeService_addParticipantHandles_withMetadata_reply___block_invoke_2_121;
      id v54 = &unk_1E58A9518;
      id v55 = self;
      id v56 = v8;
      id v57 = v9;
      id v19 = v18;
      id v58 = v19;
      id v20 = v17;
      id v59 = v20;
      id v21 = _Block_copy(&v51);
      id v22 = [(SLDCollaborationHandshakeService *)self taskManager];
      id v23 = [v22 startAggregateTask:v21 withTimeout:v16 cancellationHandler:15.0];

      _Block_object_dispose(&buf, 8);
    }
  }
  else
  {
    id v24 = SLDaemonLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[SLDCollaborationHandshakeService addParticipantHandles:withMetadata:reply:](v24, v25, v26, v27, v28, v29, v30, v31);
    }

    uint64_t v32 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v78 = *MEMORY[0x1E4F28228];
    v79[0] = @"addParticipantHandles:withMetadata: cannot add participant handles because no participants were provided.";
    uint64_t v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v79 forKeys:&v78 count:1];
    id v34 = [v32 errorWithDomain:@"com.apple.sociallayerd.SLDCollaborationHandshakeService" code:2 userInfo:v33];

    id v35 = [(SLDCollaborationHandshakeService *)self privateSerialQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77__SLDCollaborationHandshakeService_addParticipantHandles_withMetadata_reply___block_invoke;
    block[3] = &unk_1E58A8AA0;
    id v71 = v34;
    id v72 = v10;
    id v36 = v34;
    dispatch_async(v35, block);

    id v23 = objc_opt_new();
  }

  return v23;
}

uint64_t __77__SLDCollaborationHandshakeService_addParticipantHandles_withMetadata_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __77__SLDCollaborationHandshakeService_addParticipantHandles_withMetadata_reply___block_invoke_115(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __77__SLDCollaborationHandshakeService_addParticipantHandles_withMetadata_reply___block_invoke_2(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24))
  {
    uint64_t v1 = result;
    result = (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
    *(unsigned char *)(*(void *)(*(void *)(v1 + 40) + 8) + 24) = 1;
  }
  return result;
}

void __77__SLDCollaborationHandshakeService_addParticipantHandles_withMetadata_reply___block_invoke_3(uint64_t a1, int a2)
{
  id v4 = SLDaemonLogHandle();
  uint64_t v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __77__SLDCollaborationHandshakeService_addParticipantHandles_withMetadata_reply___block_invoke_3_cold_1();
    }

    id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.sociallayerd.SLDCollaborationHandshakeService" code:2 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_19BE17000, v5, OS_LOG_TYPE_DEFAULT, "[SLDCollaborationHandshakeService] addParticipantHandles:withMetadata: was cancelled by our client", v7, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __77__SLDCollaborationHandshakeService_addParticipantHandles_withMetadata_reply___block_invoke_117(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = *(void **)(a1 + 32);
  id v12 = a5;
  id v13 = a4;
  id v14 = [v11 taskManager];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __77__SLDCollaborationHandshakeService_addParticipantHandles_withMetadata_reply___block_invoke_2_118;
  v18[3] = &unk_1E58A8AC8;
  id v15 = *(void **)(a1 + 40);
  v18[4] = *(void *)(a1 + 32);
  id v19 = v10;
  id v20 = v9;
  id v21 = v15;
  id v16 = v9;
  id v17 = v10;
  [v14 startSubtask:v18 withProgress:v13 timer:v12];
}

void __77__SLDCollaborationHandshakeService_addParticipantHandles_withMetadata_reply___block_invoke_2_118(uint64_t a1)
{
  v2 = SLDaemonLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_19BE17000, v2, OS_LOG_TYPE_DEFAULT, "[SLDCollaborationHandshakeService] addParticipantHandles:withMetadata: starting _SWUpdateCollaborationParticipantsAction", buf, 2u);
  }

  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = [*(id *)(a1 + 48) allValues];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __77__SLDCollaborationHandshakeService_addParticipantHandles_withMetadata_reply___block_invoke_119;
  v7[3] = &unk_1E58A9568;
  id v6 = *(void **)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v6;
  id v9 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 56);
  [v3 _sendActionUpdateParticipantsWithMetadata:v4 addedIdentities:v5 removedIdentities:MEMORY[0x1E4F1CBF0] completion:v7];
}

void __77__SLDCollaborationHandshakeService_addParticipantHandles_withMetadata_reply___block_invoke_119(uint64_t a1, int a2)
{
  if (a2)
  {
    id v4 = [*(id *)(a1 + 32) _updateMetadata:*(void *)(a1 + 40) withNewIdentities:*(void *)(a1 + 48)];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v3();
  }
}

void __77__SLDCollaborationHandshakeService_addParticipantHandles_withMetadata_reply___block_invoke_2_121(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = *(void **)(a1 + 32);
  id v11 = [*(id *)(a1 + 40) allObjects];
  id v12 = [*(id *)(a1 + 48) collaborationIdentifier];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __77__SLDCollaborationHandshakeService_addParticipantHandles_withMetadata_reply___block_invoke_3_122;
  v16[3] = &unk_1E58A95B8;
  id v20 = v9;
  id v21 = *(id *)(a1 + 56);
  id v17 = *(id *)(a1 + 48);
  id v18 = v7;
  id v19 = v8;
  id v22 = *(id *)(a1 + 64);
  id v13 = v8;
  id v14 = v7;
  id v15 = v9;
  [v10 _personIdentitiesForHandles:v11 documentIdentifier:v12 completion:v16];
}

void __77__SLDCollaborationHandshakeService_addParticipantHandles_withMetadata_reply___block_invoke_3_122(void *a1, void *a2, void *a3)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([v5 count])
  {
    id v7 = SLDaemonLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_19BE17000, v7, OS_LOG_TYPE_DEFAULT, "[SLDCollaborationHandshakeService] addParticipantHandles:withMetadata: Generated remote identities.", (uint8_t *)&v11, 2u);
    }

    (*(void (**)(void))(a1[7] + 16))();
    (*(void (**)(void))(a1[8] + 16))();
  }
  else
  {
    (*(void (**)(void))(a1[7] + 16))();
    if (!v6)
    {
      id v8 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v13 = *MEMORY[0x1E4F28228];
      v14[0] = @"Could not generate person identities.";
      id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
      id v6 = [v8 errorWithDomain:@"com.apple.sociallayerd.SLDCollaborationHandshakeService" code:1 userInfo:v9];
    }
    id v10 = SLDaemonLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v6;
      _os_log_impl(&dword_19BE17000, v10, OS_LOG_TYPE_DEFAULT, "[SLDCollaborationHandshakeService] addParticipantHandles:withMetadata: Failed to generate identities. Error: %@", (uint8_t *)&v11, 0xCu);
    }

    (*(void (**)(void))(a1[9] + 16))();
  }
}

- (id)addParticipantHandles:(id)a3 withFileURL:(id)a4 sandboxTokenData:(id)a5 metadata:(id)a6 reply:(id)a7
{
  v89[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v51 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = [MEMORY[0x1E4F29268] currentConnection];
  id v17 = SLDaemonLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[SLDCollaborationHandshakeService addParticipantHandles:withFileURL:sandboxTokenData:metadata:reply:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v14;
    _os_log_impl(&dword_19BE17000, v17, OS_LOG_TYPE_DEFAULT, "%s metadata: %@", buf, 0x16u);
  }

  id v18 = objc_opt_new();
  [v18 setTotalUnitCount:1];
  id v19 = [v14 collaborationIdentifier];
  if (!v19
    || ([v14 collaborationIdentifier],
        id v20 = objc_claimAutoreleasedReturnValue(),
        BOOL v21 = [v20 length] == 0,
        v20,
        v19,
        v21))
  {
    uint64_t v31 = SLDaemonLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      -[SLDCollaborationHandshakeService addParticipantHandles:withFileURL:sandboxTokenData:metadata:reply:]();
    }

    uint64_t v32 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v88 = *MEMORY[0x1E4F28228];
    v89[0] = @"Missing collaboration identifier on the provided metadata.";
    uint64_t v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v89 forKeys:&v88 count:1];
    id v34 = [v32 errorWithDomain:@"com.apple.sociallayerd.SLDCollaborationHandshakeService" code:1 userInfo:v33];

    id v35 = [(SLDCollaborationHandshakeService *)self privateSerialQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __102__SLDCollaborationHandshakeService_addParticipantHandles_withFileURL_sandboxTokenData_metadata_reply___block_invoke;
    block[3] = &unk_1E58A8AA0;
    id v80 = v34;
    id v81 = v15;
    id v36 = v34;
    dispatch_async(v35, block);
  }
  else if ([v12 count])
  {
    *(void *)long long buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    v83 = __Block_byref_object_copy__9;
    v84 = __Block_byref_object_dispose__9;
    id v85 = 0;
    uint64_t v72 = 0;
    uint64_t v73 = &v72;
    uint64_t v74 = 0x2020000000;
    int64_t v75 = 0;
    id obj = 0;
    int64_t v22 = [(SLDCollaborationHandshakeService *)self _acquireSandboxHandleData:v51 ForFileProviderDocumentURL:v13 clientConnection:v16 error:&obj];
    objc_storeStrong(&v85, obj);
    int64_t v75 = v22;
    if (v73[3] == -1)
    {
      uint64_t v43 = *(void *)&buf[8];
      uint64_t v44 = *(void **)(*(void *)&buf[8] + 40);
      if (v44)
      {
        id v45 = v44;
        id v46 = *(void **)(v43 + 40);
        *(void *)(v43 + 40) = v45;
      }
      else
      {
        uint64_t v47 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.sociallayerd.SLDCollaborationHandshakeService" code:3 userInfo:0];
        id v46 = *(void **)(*(void *)&buf[8] + 40);
        *(void *)(*(void *)&buf[8] + 40) = v47;
      }

      id v48 = [(SLDCollaborationHandshakeService *)self privateSerialQueue];
      v68[0] = MEMORY[0x1E4F143A8];
      v68[1] = 3221225472;
      v68[2] = __102__SLDCollaborationHandshakeService_addParticipantHandles_withFileURL_sandboxTokenData_metadata_reply___block_invoke_2;
      v68[3] = &unk_1E58A8FE8;
      id v69 = v15;
      id v70 = buf;
      dispatch_async(v48, v68);
    }
    else
    {
      v66[0] = 0;
      v66[1] = v66;
      v66[2] = 0x2020000000;
      char v67 = 0;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __102__SLDCollaborationHandshakeService_addParticipantHandles_withFileURL_sandboxTokenData_metadata_reply___block_invoke_3;
      aBlock[3] = &unk_1E58A95E0;
      void aBlock[4] = self;
      id v64 = &v72;
      id v65 = v66;
      id v63 = v15;
      id v23 = _Block_copy(aBlock);
      v60[0] = MEMORY[0x1E4F143A8];
      v60[1] = 3221225472;
      v60[2] = __102__SLDCollaborationHandshakeService_addParticipantHandles_withFileURL_sandboxTokenData_metadata_reply___block_invoke_4;
      v60[3] = &unk_1E58A8A28;
      id v24 = v23;
      id v61 = v24;
      id v50 = _Block_copy(v60);
      v57[0] = MEMORY[0x1E4F143A8];
      v57[1] = 3221225472;
      v57[2] = __102__SLDCollaborationHandshakeService_addParticipantHandles_withFileURL_sandboxTokenData_metadata_reply___block_invoke_130;
      v57[3] = &unk_1E58A9630;
      v57[4] = self;
      id v58 = v13;
      id v25 = v24;
      id v59 = v25;
      uint64_t v26 = _Block_copy(v57);
      uint64_t v27 = [(SLDCollaborationHandshakeService *)self taskManager];
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __102__SLDCollaborationHandshakeService_addParticipantHandles_withFileURL_sandboxTokenData_metadata_reply___block_invoke_136;
      v52[3] = &unk_1E58A9518;
      v52[4] = self;
      id v53 = v12;
      id v54 = v14;
      id v28 = v26;
      id v55 = v28;
      id v29 = v25;
      id v56 = v29;
      uint64_t v30 = [v27 startAggregateTask:v52 withTimeout:v50 cancellationHandler:15.0];

      _Block_object_dispose(v66, 8);
      id v18 = (void *)v30;
    }
    _Block_object_dispose(&v72, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    uint64_t v37 = SLDaemonLogHandle();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      -[SLDCollaborationHandshakeService addParticipantHandles:withFileURL:sandboxTokenData:metadata:reply:]();
    }

    uint64_t v38 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v86 = *MEMORY[0x1E4F28228];
    v87 = @"There were no provided hashes to remove";
    uint64_t v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v87 forKeys:&v86 count:1];
    uint64_t v40 = [v38 errorWithDomain:@"com.apple.sociallayerd.SLDCollaborationHandshakeService" code:1 userInfo:v39];

    uint64_t v41 = [(SLDCollaborationHandshakeService *)self privateSerialQueue];
    v76[0] = MEMORY[0x1E4F143A8];
    v76[1] = 3221225472;
    v76[2] = __102__SLDCollaborationHandshakeService_addParticipantHandles_withFileURL_sandboxTokenData_metadata_reply___block_invoke_129;
    v76[3] = &unk_1E58A8AA0;
    id v77 = v40;
    id v78 = v15;
    id v42 = v40;
    dispatch_async(v41, v76);
  }
  return v18;
}

uint64_t __102__SLDCollaborationHandshakeService_addParticipantHandles_withFileURL_sandboxTokenData_metadata_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __102__SLDCollaborationHandshakeService_addParticipantHandles_withFileURL_sandboxTokenData_metadata_reply___block_invoke_129(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __102__SLDCollaborationHandshakeService_addParticipantHandles_withFileURL_sandboxTokenData_metadata_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void __102__SLDCollaborationHandshakeService_addParticipantHandles_withFileURL_sandboxTokenData_metadata_reply___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  [*(id *)(a1 + 32) _releaseSandboxHandle:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
}

void __102__SLDCollaborationHandshakeService_addParticipantHandles_withFileURL_sandboxTokenData_metadata_reply___block_invoke_4(uint64_t a1, int a2)
{
  id v4 = SLDaemonLogHandle();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
  if (a2)
  {
    if (v5) {
      __102__SLDCollaborationHandshakeService_addParticipantHandles_withFileURL_sandboxTokenData_metadata_reply___block_invoke_4_cold_1();
    }

    id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.sociallayerd.SLDCollaborationHandshakeService" code:2 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    if (v5) {
      __102__SLDCollaborationHandshakeService_addParticipantHandles_withFileURL_sandboxTokenData_metadata_reply___block_invoke_4_cold_2();
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __102__SLDCollaborationHandshakeService_addParticipantHandles_withFileURL_sandboxTokenData_metadata_reply___block_invoke_130(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  int v11 = *(void **)(a1 + 32);
  id v12 = a5;
  id v13 = a4;
  id v14 = [v11 taskManager];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __102__SLDCollaborationHandshakeService_addParticipantHandles_withFileURL_sandboxTokenData_metadata_reply___block_invoke_2_131;
  v18[3] = &unk_1E58A8A78;
  id v15 = *(void **)(a1 + 40);
  v18[4] = *(void *)(a1 + 32);
  id v19 = v15;
  id v20 = v10;
  id v21 = v9;
  id v22 = *(id *)(a1 + 48);
  id v16 = v9;
  id v17 = v10;
  [v14 startSubtask:v18 withProgress:v13 timer:v12];
}

void __102__SLDCollaborationHandshakeService_addParticipantHandles_withFileURL_sandboxTokenData_metadata_reply___block_invoke_2_131(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id v6 = SLDaemonLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_19BE17000, v6, OS_LOG_TYPE_DEFAULT, "[SLDCollaborationHandshakeService] startCollaborationWithFileURL: starting _updateParticipantsWithFileURL", buf, 2u);
  }

  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  id v10 = [*(id *)(a1 + 56) allValues];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __102__SLDCollaborationHandshakeService_addParticipantHandles_withFileURL_sandboxTokenData_metadata_reply___block_invoke_132;
  v13[3] = &unk_1E58A9608;
  uint64_t v11 = *(void *)(a1 + 32);
  id v16 = v5;
  v13[4] = v11;
  id v14 = *(id *)(a1 + 48);
  id v15 = *(id *)(a1 + 56);
  id v17 = *(id *)(a1 + 64);
  id v12 = v5;
  [v7 _sendActionUpdateParticipantsWithFileURL:v8 metadata:v9 addedIdentities:v10 removedIdentities:MEMORY[0x1E4F1CBF0] completion:v13];
}

void __102__SLDCollaborationHandshakeService_addParticipantHandles_withFileURL_sandboxTokenData_metadata_reply___block_invoke_132(uint64_t a1, int a2, void *a3)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  if (a2)
  {
    id v6 = [*(id *)(a1 + 32) _updateMetadata:*(void *)(a1 + 40) withNewIdentities:*(void *)(a1 + 48)];
    id v7 = SLDaemonLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_19BE17000, v7, OS_LOG_TYPE_DEFAULT, "[SLDCollaborationHandshakeService] addCollaborationParticipants: finished adding participants, and the full initiation flow.", v11, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    if (!v5)
    {
      uint64_t v8 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v12 = *MEMORY[0x1E4F28228];
      v13[0] = @"addCollaborationParticipants adding participants failed";
      uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
      id v5 = [v8 errorWithDomain:@"com.apple.sociallayerd.SLDCollaborationHandshakeService" code:1 userInfo:v9];
    }
    id v10 = SLDaemonLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __102__SLDCollaborationHandshakeService_addParticipantHandles_withFileURL_sandboxTokenData_metadata_reply___block_invoke_132_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

void __102__SLDCollaborationHandshakeService_addParticipantHandles_withFileURL_sandboxTokenData_metadata_reply___block_invoke_136(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = *(void **)(a1 + 32);
  uint64_t v11 = [*(id *)(a1 + 40) allObjects];
  uint64_t v12 = [*(id *)(a1 + 48) collaborationIdentifier];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __102__SLDCollaborationHandshakeService_addParticipantHandles_withFileURL_sandboxTokenData_metadata_reply___block_invoke_2_137;
  v16[3] = &unk_1E58A95B8;
  id v20 = v9;
  id v21 = *(id *)(a1 + 56);
  id v17 = *(id *)(a1 + 48);
  id v18 = v7;
  id v19 = v8;
  id v22 = *(id *)(a1 + 64);
  id v13 = v8;
  id v14 = v7;
  id v15 = v9;
  [v10 _personIdentitiesForHandles:v11 documentIdentifier:v12 completion:v16];
}

void __102__SLDCollaborationHandshakeService_addParticipantHandles_withFileURL_sandboxTokenData_metadata_reply___block_invoke_2_137(void *a1, void *a2, void *a3)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = SLDaemonLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_19BE17000, v7, OS_LOG_TYPE_DEFAULT, "[SLDCollaborationHandshakeService] _startCollaborationWithFileURL: Generated identities.", v11, 2u);
    }

    (*(void (**)(void))(a1[7] + 16))();
    (*(void (**)(void))(a1[8] + 16))();
  }
  else
  {
    (*(void (**)(void))(a1[7] + 16))();
    if (!v6)
    {
      id v8 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v12 = *MEMORY[0x1E4F28228];
      v13[0] = @"Could not generate person identities.";
      id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
      id v6 = [v8 errorWithDomain:@"com.apple.sociallayerd.SLDCollaborationHandshakeService" code:1 userInfo:v9];
    }
    id v10 = SLDaemonLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __102__SLDCollaborationHandshakeService_addParticipantHandles_withFileURL_sandboxTokenData_metadata_reply___block_invoke_2_137_cold_1();
    }

    (*(void (**)(void))(a1[9] + 16))();
  }
}

- (id)removeParticipantIdentities:(id)a3 withMetadata:(id)a4 reply:(id)a5
{
  v69[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = SLDaemonLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[SLDCollaborationHandshakeService removeParticipantIdentities:withMetadata:reply:]";
    _os_log_impl(&dword_19BE17000, v11, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
  }

  if ([v8 count])
  {
    uint64_t v12 = [v9 collaborationIdentifier];
    BOOL v13 = v12 == 0;

    if (v13)
    {
      id v34 = SLDaemonLogHandle();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        -[SLDCollaborationHandshakeService removeParticipantIdentities:withMetadata:reply:](v34, v35, v36, v37, v38, v39, v40, v41);
      }

      id v42 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v66 = *MEMORY[0x1E4F28228];
      char v67 = @"removeParticipantIdentities:withMetadata: cannot remove participant handles because the metadata did not have a collaboration identifier";
      uint64_t v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v67 forKeys:&v66 count:1];
      uint64_t v44 = [v42 errorWithDomain:@"com.apple.sociallayerd.SLDCollaborationHandshakeService" code:2 userInfo:v43];

      id v45 = [(SLDCollaborationHandshakeService *)self privateSerialQueue];
      v57[0] = MEMORY[0x1E4F143A8];
      v57[1] = 3221225472;
      v57[2] = __83__SLDCollaborationHandshakeService_removeParticipantIdentities_withMetadata_reply___block_invoke_144;
      v57[3] = &unk_1E58A8AA0;
      id v58 = v44;
      id v59 = v10;
      id v46 = v44;
      dispatch_async(v45, v57);

      id v20 = objc_opt_new();
    }
    else
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v64 = 0x2020000000;
      char v65 = 0;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __83__SLDCollaborationHandshakeService_removeParticipantIdentities_withMetadata_reply___block_invoke_2;
      aBlock[3] = &unk_1E58A9540;
      p_long long buf = &buf;
      id v55 = v10;
      id v14 = _Block_copy(aBlock);
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __83__SLDCollaborationHandshakeService_removeParticipantIdentities_withMetadata_reply___block_invoke_3;
      v52[3] = &unk_1E58A8A28;
      id v15 = v14;
      id v53 = v15;
      id v16 = _Block_copy(v52);
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __83__SLDCollaborationHandshakeService_removeParticipantIdentities_withMetadata_reply___block_invoke_145;
      v48[3] = &unk_1E58A8AC8;
      v48[4] = self;
      id v49 = v9;
      id v50 = v8;
      id v17 = v15;
      id v51 = v17;
      id v18 = _Block_copy(v48);
      id v19 = [(SLDCollaborationHandshakeService *)self taskManager];
      id v20 = [v19 startAggregateTask:v18 withTimeout:v16 cancellationHandler:15.0];

      _Block_object_dispose(&buf, 8);
    }
  }
  else
  {
    id v21 = SLDaemonLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[SLDCollaborationHandshakeService removeParticipantIdentities:withMetadata:reply:](v21, v22, v23, v24, v25, v26, v27, v28);
    }

    id v29 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v68 = *MEMORY[0x1E4F28228];
    v69[0] = @"removeParticipantIdentities:withMetadata: cannot remove participant handles because no participants were provided.";
    uint64_t v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v69 forKeys:&v68 count:1];
    uint64_t v31 = [v29 errorWithDomain:@"com.apple.sociallayerd.SLDCollaborationHandshakeService" code:2 userInfo:v30];

    uint64_t v32 = [(SLDCollaborationHandshakeService *)self privateSerialQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __83__SLDCollaborationHandshakeService_removeParticipantIdentities_withMetadata_reply___block_invoke;
    block[3] = &unk_1E58A8AA0;
    id v61 = v31;
    id v62 = v10;
    id v33 = v31;
    dispatch_async(v32, block);

    id v20 = objc_opt_new();
  }

  return v20;
}

uint64_t __83__SLDCollaborationHandshakeService_removeParticipantIdentities_withMetadata_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __83__SLDCollaborationHandshakeService_removeParticipantIdentities_withMetadata_reply___block_invoke_144(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __83__SLDCollaborationHandshakeService_removeParticipantIdentities_withMetadata_reply___block_invoke_2(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24))
  {
    uint64_t v1 = result;
    result = (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
    *(unsigned char *)(*(void *)(*(void *)(v1 + 40) + 8) + 24) = 1;
  }
  return result;
}

void __83__SLDCollaborationHandshakeService_removeParticipantIdentities_withMetadata_reply___block_invoke_3(uint64_t a1, int a2)
{
  id v4 = SLDaemonLogHandle();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
  if (a2)
  {
    if (v5) {
      __83__SLDCollaborationHandshakeService_removeParticipantIdentities_withMetadata_reply___block_invoke_3_cold_1();
    }

    id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.sociallayerd.SLDCollaborationHandshakeService" code:2 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    if (v5) {
      __83__SLDCollaborationHandshakeService_removeParticipantIdentities_withMetadata_reply___block_invoke_3_cold_2();
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __83__SLDCollaborationHandshakeService_removeParticipantIdentities_withMetadata_reply___block_invoke_145(uint64_t a1)
{
  v2 = SLDaemonLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_19BE17000, v2, OS_LOG_TYPE_DEFAULT, "[SLDCollaborationHandshakeService] removeParticipantIdentities:withMetadata: starting _SWUpdateCollaborationParticipantsAction", buf, 2u);
  }

  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  BOOL v5 = [*(id *)(a1 + 48) allObjects];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __83__SLDCollaborationHandshakeService_removeParticipantIdentities_withMetadata_reply___block_invoke_146;
  v6[3] = &unk_1E58A9568;
  v6[4] = *(void *)(a1 + 32);
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 56);
  [v3 _sendActionUpdateParticipantsWithMetadata:v4 addedIdentities:MEMORY[0x1E4F1CBF0] removedIdentities:v5 completion:v6];
}

void __83__SLDCollaborationHandshakeService_removeParticipantIdentities_withMetadata_reply___block_invoke_146(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = [*(id *)(a1 + 40) allObjects];
    id v6 = [v3 _removeIdentities:v4 fromMetadata:*(void *)(a1 + 48)];

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    BOOL v5 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v5();
  }
}

- (id)removeParticipantIdentities:(id)a3 withFileURL:(id)a4 sandboxTokenData:(id)a5 metadata:(id)a6 reply:(id)a7
{
  v83[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v48 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = [MEMORY[0x1E4F29268] currentConnection];
  id v17 = SLDaemonLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[SLDCollaborationHandshakeService removeParticipantIdentities:withFileURL:sandboxTokenData:metadata:reply:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v14;
    _os_log_impl(&dword_19BE17000, v17, OS_LOG_TYPE_DEFAULT, "%s metadata: %@", buf, 0x16u);
  }

  id v18 = objc_opt_new();
  [v18 setTotalUnitCount:1];
  id v19 = [v14 collaborationIdentifier];
  if (!v19
    || ([v14 collaborationIdentifier],
        id v20 = objc_claimAutoreleasedReturnValue(),
        BOOL v21 = [v20 length] == 0,
        v20,
        v19,
        v21))
  {
    id v29 = SLDaemonLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      -[SLDCollaborationHandshakeService removeParticipantIdentities:withFileURL:sandboxTokenData:metadata:reply:]();
    }

    uint64_t v30 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v82 = *MEMORY[0x1E4F28228];
    v83[0] = @"Missing collaboration identifier on the provided metadata.";
    uint64_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v83 forKeys:&v82 count:1];
    uint64_t v32 = [v30 errorWithDomain:@"com.apple.sociallayerd.SLDCollaborationHandshakeService" code:1 userInfo:v31];

    id v33 = [(SLDCollaborationHandshakeService *)self privateSerialQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __108__SLDCollaborationHandshakeService_removeParticipantIdentities_withFileURL_sandboxTokenData_metadata_reply___block_invoke;
    block[3] = &unk_1E58A8AA0;
    id v74 = v32;
    id v75 = v15;
    id v34 = v32;
    dispatch_async(v33, block);
  }
  else if ([v12 count])
  {
    *(void *)long long buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    id v77 = __Block_byref_object_copy__9;
    id v78 = __Block_byref_object_dispose__9;
    id v79 = 0;
    uint64_t v66 = 0;
    char v67 = &v66;
    uint64_t v68 = 0x2020000000;
    int64_t v69 = 0;
    id obj = 0;
    int64_t v22 = [(SLDCollaborationHandshakeService *)self _acquireSandboxHandleData:v48 ForFileProviderDocumentURL:v13 clientConnection:v16 error:&obj];
    objc_storeStrong(&v79, obj);
    int64_t v69 = v22;
    if (v67[3] == -1)
    {
      uint64_t v41 = *(void *)&buf[8];
      id v42 = *(void **)(*(void *)&buf[8] + 40);
      if (v42)
      {
        id v43 = v42;
        uint64_t v44 = *(void **)(v41 + 40);
        *(void *)(v41 + 40) = v43;
      }
      else
      {
        uint64_t v45 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.sociallayerd.SLDCollaborationHandshakeService" code:3 userInfo:0];
        uint64_t v44 = *(void **)(*(void *)&buf[8] + 40);
        *(void *)(*(void *)&buf[8] + 40) = v45;
      }

      id v46 = [(SLDCollaborationHandshakeService *)self privateSerialQueue];
      v62[0] = MEMORY[0x1E4F143A8];
      v62[1] = 3221225472;
      v62[2] = __108__SLDCollaborationHandshakeService_removeParticipantIdentities_withFileURL_sandboxTokenData_metadata_reply___block_invoke_2;
      v62[3] = &unk_1E58A8FE8;
      id v63 = v15;
      uint64_t v64 = buf;
      dispatch_async(v46, v62);
    }
    else
    {
      v60[0] = 0;
      v60[1] = v60;
      v60[2] = 0x2020000000;
      char v61 = 0;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __108__SLDCollaborationHandshakeService_removeParticipantIdentities_withFileURL_sandboxTokenData_metadata_reply___block_invoke_3;
      aBlock[3] = &unk_1E58A95E0;
      void aBlock[4] = self;
      id v58 = &v66;
      id v59 = v60;
      id v57 = v15;
      uint64_t v23 = _Block_copy(aBlock);
      v54[0] = MEMORY[0x1E4F143A8];
      v54[1] = 3221225472;
      v54[2] = __108__SLDCollaborationHandshakeService_removeParticipantIdentities_withFileURL_sandboxTokenData_metadata_reply___block_invoke_4;
      v54[3] = &unk_1E58A8A28;
      id v24 = v23;
      id v55 = v24;
      uint64_t v25 = _Block_copy(v54);
      uint64_t v26 = [(SLDCollaborationHandshakeService *)self taskManager];
      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      v49[2] = __108__SLDCollaborationHandshakeService_removeParticipantIdentities_withFileURL_sandboxTokenData_metadata_reply___block_invoke_148;
      v49[3] = &unk_1E58A8A78;
      v49[4] = self;
      id v50 = v13;
      id v51 = v14;
      id v52 = v12;
      id v27 = v24;
      id v53 = v27;
      uint64_t v28 = [v26 startAggregateTask:v49 withTimeout:v25 cancellationHandler:15.0];

      _Block_object_dispose(v60, 8);
      id v18 = (void *)v28;
    }
    _Block_object_dispose(&v66, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    uint64_t v35 = SLDaemonLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      -[SLDCollaborationHandshakeService removeParticipantIdentities:withFileURL:sandboxTokenData:metadata:reply:]();
    }

    uint64_t v36 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v80 = *MEMORY[0x1E4F28228];
    id v81 = @"There were no provided hashes to remove";
    uint64_t v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v81 forKeys:&v80 count:1];
    uint64_t v38 = [v36 errorWithDomain:@"com.apple.sociallayerd.SLDCollaborationHandshakeService" code:1 userInfo:v37];

    uint64_t v39 = [(SLDCollaborationHandshakeService *)self privateSerialQueue];
    v70[0] = MEMORY[0x1E4F143A8];
    v70[1] = 3221225472;
    v70[2] = __108__SLDCollaborationHandshakeService_removeParticipantIdentities_withFileURL_sandboxTokenData_metadata_reply___block_invoke_147;
    v70[3] = &unk_1E58A8AA0;
    id v71 = v38;
    id v72 = v15;
    id v40 = v38;
    dispatch_async(v39, v70);
  }
  return v18;
}

uint64_t __108__SLDCollaborationHandshakeService_removeParticipantIdentities_withFileURL_sandboxTokenData_metadata_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __108__SLDCollaborationHandshakeService_removeParticipantIdentities_withFileURL_sandboxTokenData_metadata_reply___block_invoke_147(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __108__SLDCollaborationHandshakeService_removeParticipantIdentities_withFileURL_sandboxTokenData_metadata_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void __108__SLDCollaborationHandshakeService_removeParticipantIdentities_withFileURL_sandboxTokenData_metadata_reply___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  [*(id *)(a1 + 32) _releaseSandboxHandle:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
}

void __108__SLDCollaborationHandshakeService_removeParticipantIdentities_withFileURL_sandboxTokenData_metadata_reply___block_invoke_4(uint64_t a1, int a2)
{
  uint64_t v4 = SLDaemonLogHandle();
  id v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __108__SLDCollaborationHandshakeService_removeParticipantIdentities_withFileURL_sandboxTokenData_metadata_reply___block_invoke_4_cold_1();
    }

    id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.sociallayerd.SLDCollaborationHandshakeService" code:2 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_19BE17000, v5, OS_LOG_TYPE_DEFAULT, "[SLDCollaborationHandshakeService] removeParticipantIdentities:withFileURL was cancelled by our client", v7, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __108__SLDCollaborationHandshakeService_removeParticipantIdentities_withFileURL_sandboxTokenData_metadata_reply___block_invoke_148(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id v6 = SLDaemonLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_19BE17000, v6, OS_LOG_TYPE_DEFAULT, "[SLDCollaborationHandshakeService] removeParticipantIdentities:withFileURL: starting _updateParticipantsWithFileURL", buf, 2u);
  }

  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  id v10 = [*(id *)(a1 + 56) allObjects];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __108__SLDCollaborationHandshakeService_removeParticipantIdentities_withFileURL_sandboxTokenData_metadata_reply___block_invoke_149;
  v13[3] = &unk_1E58A9608;
  uint64_t v11 = *(void *)(a1 + 32);
  id v16 = v5;
  v13[4] = v11;
  id v14 = *(id *)(a1 + 56);
  id v15 = *(id *)(a1 + 48);
  id v17 = *(id *)(a1 + 64);
  id v12 = v5;
  [v7 _sendActionUpdateParticipantsWithFileURL:v8 metadata:v9 addedIdentities:MEMORY[0x1E4F1CBF0] removedIdentities:v10 completion:v13];
}

void __108__SLDCollaborationHandshakeService_removeParticipantIdentities_withFileURL_sandboxTokenData_metadata_reply___block_invoke_149(uint64_t a1, int a2, void *a3)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  if (a2)
  {
    id v6 = SLDaemonLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl(&dword_19BE17000, v6, OS_LOG_TYPE_DEFAULT, "[SLDCollaborationHandshakeService] removeParticipantIdentities:withFileURL: finished removing participants.", v13, 2u);
    }

    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = [*(id *)(a1 + 40) allObjects];
    uint64_t v9 = [v7 _removeIdentities:v8 fromMetadata:*(void *)(a1 + 48)];

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    if (!v5)
    {
      id v10 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v14 = *MEMORY[0x1E4F28228];
      v15[0] = @"removeParticipantIdentities:withFileURL: removing participants failed";
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
      id v5 = [v10 errorWithDomain:@"com.apple.sociallayerd.SLDCollaborationHandshakeService" code:1 userInfo:v11];
    }
    id v12 = SLDaemonLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __108__SLDCollaborationHandshakeService_removeParticipantIdentities_withFileURL_sandboxTokenData_metadata_reply___block_invoke_149_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

- (void)_sendActionUpdateParticipantsWithMetadata:(id)a3 addedIdentities:(id)a4 removedIdentities:(id)a5 completion:(id)a6
{
  v62[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v40 = a5;
  id v12 = (void (**)(id, void, void *))a6;
  id v13 = [v10 sourceProcessData];
  uint64_t v14 = [v10 localIdentifier];
  uint64_t v39 = +[SLDProcessVerifier tagDataFromString:v14];

  if (v13)
  {
    id v15 = [(SLDCollaborationHandshakeService *)self processVerifier];
    id v54 = 0;
    id v16 = [v15 verifyData:v13 tag:v39 error:&v54];
    id v38 = v54;

    if (v16)
    {
      if (objc_msgSend(v11, "count", v38) || objc_msgSend(v40, "count"))
      {
        if ([v11 count]
          && [(SLDCollaborationHandshakeService *)self _doesMetadata:v10 containAnyOf:v11])
        {
          id v17 = SLDaemonLogHandle();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
            -[SLDCollaborationHandshakeService _sendActionUpdateParticipantsWithMetadata:addedIdentities:removedIdentities:completion:].cold.4((uint64_t)v11, v10);
          }

          id v18 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v57 = *MEMORY[0x1E4F28228];
          id v58 = @"_sendActionUpdateParticipantsWithMetadata: attempted to add identities which already exist in the metadata identity map.";
          id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v58 forKeys:&v57 count:1];
          id v20 = [v18 errorWithDomain:@"com.apple.sociallayerd.SLDCollaborationHandshakeService" code:1 userInfo:v19];

          v12[2](v12, 0, v20);
        }
        else if ([v40 count] {
               && ![(SLDCollaborationHandshakeService *)self _doesMetadata:v10 containAllOf:v40])
        }
        {
          uint64_t v30 = SLDaemonLogHandle();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
            -[SLDCollaborationHandshakeService _sendActionUpdateParticipantsWithMetadata:addedIdentities:removedIdentities:completion:]((uint64_t)v40, v10);
          }

          uint64_t v31 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v55 = *MEMORY[0x1E4F28228];
          id v56 = @"_sendActionUpdateParticipantsWithMetadata: attempted to remove some identities which do not exist in the metadata identity map.";
          uint64_t v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v56 forKeys:&v55 count:1];
          id v33 = [v31 errorWithDomain:@"com.apple.sociallayerd.SLDCollaborationHandshakeService" code:1 userInfo:v32];

          v12[2](v12, 0, v33);
        }
        else
        {
          v52[0] = 0;
          v52[1] = v52;
          v52[2] = 0x2020000000;
          char v53 = 0;
          aBlock[0] = MEMORY[0x1E4F143A8];
          aBlock[1] = 3221225472;
          aBlock[2] = __123__SLDCollaborationHandshakeService__sendActionUpdateParticipantsWithMetadata_addedIdentities_removedIdentities_completion___block_invoke;
          aBlock[3] = &unk_1E58A9658;
          id v51 = v52;
          id v50 = v12;
          id v24 = _Block_copy(aBlock);
          uint64_t v25 = (void *)[v10 copy];
          [v25 setHandleToIdentityMap:MEMORY[0x1E4F1CC08]];
          uint64_t v26 = [MEMORY[0x1E4F3BE38] actionWithMetadata:v25 addedIdentities:v11 removedIdentites:v40];
          v47[0] = 0;
          v47[1] = v47;
          v47[2] = 0x3032000000;
          v47[3] = __Block_byref_object_copy__9;
          v47[4] = __Block_byref_object_dispose__9;
          id v48 = 0;
          v44[0] = MEMORY[0x1E4F143A8];
          v44[1] = 3221225472;
          v44[2] = __123__SLDCollaborationHandshakeService__sendActionUpdateParticipantsWithMetadata_addedIdentities_removedIdentities_completion___block_invoke_2;
          v44[3] = &unk_1E58A9680;
          id v46 = v47;
          id v27 = v24;
          id v45 = v27;
          [v26 setResponseHandlerBlock:v44];
          uint64_t v28 = [(SLDCollaborationHandshakeService *)self actionDispatcher];
          v41[0] = MEMORY[0x1E4F143A8];
          v41[1] = 3221225472;
          v41[2] = __123__SLDCollaborationHandshakeService__sendActionUpdateParticipantsWithMetadata_addedIdentities_removedIdentities_completion___block_invoke_169;
          v41[3] = &unk_1E58A96A8;
          id v43 = v47;
          id v29 = v27;
          id v42 = v29;
          [v28 dispatchAction:v26 withAssertionForProcess:v16 completion:v41];

          _Block_object_dispose(v47, 8);
          _Block_object_dispose(v52, 8);
        }
      }
      else
      {
        id v34 = SLDaemonLogHandle();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
          -[SLDCollaborationHandshakeService _sendActionUpdateParticipantsWithMetadata:addedIdentities:removedIdentities:completion:]();
        }

        uint64_t v35 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v59 = *MEMORY[0x1E4F28228];
        id v60 = @"_sendActionUpdateParticipantsWithMetadata: there were no provided identities to remove/add.";
        uint64_t v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v60 forKeys:&v59 count:1];
        uint64_t v37 = [v35 errorWithDomain:@"com.apple.sociallayerd.SLDCollaborationHandshakeService" code:1 userInfo:v36];

        v12[2](v12, 0, v37);
      }
      goto LABEL_23;
    }
  }
  else
  {
    id v38 = 0;
  }
  BOOL v21 = SLDaemonLogHandle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
    -[SLDCollaborationHandshakeService _sendActionUpdateParticipantsWithMetadata:addedIdentities:removedIdentities:completion:]((uint64_t)v13, v10);
  }

  int64_t v22 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v61 = *MEMORY[0x1E4F28228];
  v62[0] = @"_sendActionUpdateParticipantsWithMetadata: failed to verify source process.";
  uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v62 forKeys:&v61 count:1];
  id v16 = [v22 errorWithDomain:@"com.apple.sociallayerd.SLDCollaborationHandshakeService" code:1 userInfo:v23];

  v12[2](v12, 0, v16);
LABEL_23:
}

uint64_t __123__SLDCollaborationHandshakeService__sendActionUpdateParticipantsWithMetadata_addedIdentities_removedIdentities_completion___block_invoke(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24))
  {
    uint64_t v1 = result;
    result = (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
    *(unsigned char *)(*(void *)(*(void *)(v1 + 40) + 8) + 24) = 1;
  }
  return result;
}

void __123__SLDCollaborationHandshakeService__sendActionUpdateParticipantsWithMetadata_addedIdentities_removedIdentities_completion___block_invoke_2(uint64_t a1, void *a2)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) invalidate];
  if ([v3 success])
  {
    uint64_t v4 = SLDaemonLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl(&dword_19BE17000, v4, OS_LOG_TYPE_DEFAULT, "_sendActionUpdateParticipantsWithMetadata: successfully added participants", v11, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v5 = [v3 error];
    id v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      uint64_t v8 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v12 = *MEMORY[0x1E4F28228];
      v13[0] = @"_updateParticipantsWithMetadata adding participants failed";
      uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
      id v7 = [v8 errorWithDomain:@"com.apple.sociallayerd.SLDCollaborationHandshakeService" code:1 userInfo:v9];
    }
    id v10 = SLDaemonLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __123__SLDCollaborationHandshakeService__sendActionUpdateParticipantsWithMetadata_addedIdentities_removedIdentities_completion___block_invoke_2_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __123__SLDCollaborationHandshakeService__sendActionUpdateParticipantsWithMetadata_addedIdentities_removedIdentities_completion___block_invoke_169(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  if (v7)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v8 = SLDaemonLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_19BE17000, v8, OS_LOG_TYPE_DEFAULT, "_sendActionUpdateParticipantsWithMetadata: action dispatcher successfully sent the update participants action to the app. Waiting for our response handler to be called", v9, 2u);
    }
  }
}

- (void)_sendActionUpdateParticipantsWithFileURL:(id)a3 metadata:(id)a4 addedIdentities:(id)a5 removedIdentities:(id)a6 completion:(id)a7
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = (void (**)(id, void, void *))a7;
  if (![v14 count] && !objc_msgSend(v15, "count"))
  {
    uint64_t v25 = SLDaemonLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[SLDCollaborationHandshakeService _sendActionUpdateParticipantsWithFileURL:metadata:addedIdentities:removedIdentities:completion:]();
    }

    id v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v32 = *MEMORY[0x1E4F28228];
    v33[0] = @"_sendActionUpdateParticipantsWithFileURL: there were no provided identities to remove/add.";
    id v19 = (void *)MEMORY[0x1E4F1C9E8];
    id v20 = (__CFString **)v33;
    BOOL v21 = &v32;
    goto LABEL_17;
  }
  if ([v14 count]
    && [(SLDCollaborationHandshakeService *)self _doesMetadata:v13 containAnyOf:v14])
  {
    id v17 = SLDaemonLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[SLDCollaborationHandshakeService _sendActionUpdateParticipantsWithFileURL:metadata:addedIdentities:removedIdentities:completion:]((uint64_t)v14, v13);
    }

    id v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v30 = *MEMORY[0x1E4F28228];
    uint64_t v31 = @"_sendActionUpdateParticipantsWithFileURL: attempted to add identities which already exist in the metadata identity map.";
    id v19 = (void *)MEMORY[0x1E4F1C9E8];
    id v20 = &v31;
    BOOL v21 = &v30;
LABEL_17:
    uint64_t v26 = [v19 dictionaryWithObjects:v20 forKeys:v21 count:1];
    uint64_t v23 = [v18 errorWithDomain:@"com.apple.sociallayerd.SLDCollaborationHandshakeService" code:1 userInfo:v26];

    v16[2](v16, 0, v23);
    goto LABEL_18;
  }
  if ([v15 count]
    && [(SLDCollaborationHandshakeService *)self _doesMetadata:v13 containAllOf:v15])
  {
    int64_t v22 = SLDaemonLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[SLDCollaborationHandshakeService _sendActionUpdateParticipantsWithFileURL:metadata:addedIdentities:removedIdentities:completion:]((uint64_t)v15, v13);
    }

    id v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v28 = *MEMORY[0x1E4F28228];
    id v29 = @"_sendActionUpdateParticipantsWithFileURL: attempted to remove some identities which do not exist in the metadata identity map.";
    id v19 = (void *)MEMORY[0x1E4F1C9E8];
    id v20 = &v29;
    BOOL v21 = &v28;
    goto LABEL_17;
  }
  uint64_t v23 = (void *)[v13 copy];
  [v23 setHandleToIdentityMap:MEMORY[0x1E4F1CC08]];
  id v24 = [MEMORY[0x1E4F3BE38] actionWithMetadata:v23 addedIdentities:v14 removedIdentites:v15];
  id v27 = v16;
  SWPerformActionForDocumentURL();

LABEL_18:
}

void __131__SLDCollaborationHandshakeService__sendActionUpdateParticipantsWithFileURL_metadata_addedIdentities_removedIdentities_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) privateSerialQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __131__SLDCollaborationHandshakeService__sendActionUpdateParticipantsWithFileURL_metadata_addedIdentities_removedIdentities_completion___block_invoke_2;
  v6[3] = &unk_1E58A9088;
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  dispatch_async(v4, v6);
}

void __131__SLDCollaborationHandshakeService__sendActionUpdateParticipantsWithFileURL_metadata_addedIdentities_removedIdentities_completion___block_invoke_2(uint64_t a1)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) success])
  {
    v2 = SLDaemonLogHandle();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_19BE17000, v2, OS_LOG_TYPE_DEFAULT, "_SWUpdateCollaborationParticipantsAction with a fileURL returned success.", v9, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v3 = [*(id *)(a1 + 32) error];
    uint64_t v4 = v3;
    if (v3)
    {
      id v5 = v3;
    }
    else
    {
      id v6 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v10 = *MEMORY[0x1E4F28228];
      v11[0] = @"_SWUpdateCollaborationParticipantsAction (with a fileURL) response was not successful.";
      id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
      id v5 = [v6 errorWithDomain:@"com.apple.sociallayerd.SLDCollaborationHandshakeService" code:1 userInfo:v7];
    }
    id v8 = SLDaemonLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __131__SLDCollaborationHandshakeService__sendActionUpdateParticipantsWithFileURL_metadata_addedIdentities_removedIdentities_completion___block_invoke_2_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (id)_updateMetadata:(id)a3 withNewIdentities:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v6 handleToIdentityMap];
  id v8 = (void *)[v7 mutableCopy];
  uint64_t v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  id v11 = v10;

  [v11 addEntriesFromDictionary:v5];
  id v12 = (void *)[v6 copy];

  id v13 = (void *)[v11 copy];
  [v12 setHandleToIdentityMap:v13];

  return v12;
}

- (id)_removeIdentities:(id)a3 fromMetadata:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)[v6 copy];
  id v8 = [v6 handleToIdentityMap];
  uint64_t v9 = (void *)[v8 mutableCopy];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v10 = v5;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = objc_msgSend(v9, "allKeysForObject:", *(void *)(*((void *)&v18 + 1) + 8 * i), (void)v18);
        if ([v15 count]) {
          [v9 removeObjectsForKeys:v15];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }

  id v16 = (void *)[v9 copy];
  [v7 setHandleToIdentityMap:v16];

  return v7;
}

- (BOOL)_doesMetadata:(id)a3 containAllOf:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [a3 handleToIdentityMap];
  id v7 = [v6 allValues];

  if ([v7 count])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          if (!objc_msgSend(v7, "containsObject:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15))
          {
            BOOL v13 = 0;
            goto LABEL_12;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    BOOL v13 = 1;
LABEL_12:
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)_doesMetadata:(id)a3 containAnyOf:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [a3 handleToIdentityMap];
  id v7 = [v6 allValues];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v8);
        }
        if (objc_msgSend(v7, "containsObject:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13))
        {
          LOBYTE(v9) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v9;
}

- (void)_localPersonIdentityForDocumentIdentifier:(id)a3 completion:(id)a4
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6 && [v6 length])
  {
    id v8 = [(SLDCollaborationHandshakeService *)self personIdentityGenerator];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __89__SLDCollaborationHandshakeService__localPersonIdentityForDocumentIdentifier_completion___block_invoke_2;
    v16[3] = &unk_1E58A96F8;
    id v17 = v7;
    id v9 = v7;
    [v8 generateLocalIdentityForDocumentIdentifier:v6 completionHandler:v16];

    id v10 = v17;
  }
  else
  {
    uint64_t v11 = SLDaemonLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[SLDCollaborationHandshakeService _localPersonIdentityForDocumentIdentifier:completion:]();
    }

    uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v21 = *MEMORY[0x1E4F28228];
    v22[0] = @"Missing collaboration identifier.";
    long long v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
    long long v14 = [v12 errorWithDomain:@"com.apple.sociallayerd.SLDCollaborationHandshakeService" code:1 userInfo:v13];

    long long v15 = [(SLDCollaborationHandshakeService *)self privateSerialQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __89__SLDCollaborationHandshakeService__localPersonIdentityForDocumentIdentifier_completion___block_invoke;
    block[3] = &unk_1E58A8AA0;
    id v19 = v14;
    id v20 = v7;
    id v10 = v7;
    id v9 = v14;
    dispatch_async(v15, block);
  }
}

uint64_t __89__SLDCollaborationHandshakeService__localPersonIdentityForDocumentIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, *(void *)(a1 + 32));
}

void __89__SLDCollaborationHandshakeService__localPersonIdentityForDocumentIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  id v6 = [v12 allKeys];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    id v8 = [v12 allKeys];
    id v9 = [v8 firstObject];

    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = [v12 objectForKeyedSubscript:v9];
    (*(void (**)(uint64_t, void *, void *, void))(v10 + 16))(v10, v11, v9, 0);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)_personIdentitiesForHandles:(id)a3 documentIdentifier:(id)a4 completion:(id)a5
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9 && [v9 length])
  {
    v27[0] = 0;
    v27[1] = v27;
    v27[2] = 0x3032000000;
    v27[3] = __Block_byref_object_copy__9;
    v27[4] = __Block_byref_object_dispose__9;
    id v28 = (id)MEMORY[0x1E4F1CC08];
    uint64_t v11 = SLDaemonLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19BE17000, v11, OS_LOG_TYPE_DEFAULT, "_personIdentitiesForHandles invoking SLPersonIdentityGenerator to generate identity hashes", buf, 2u);
    }

    id v12 = [SLPersonIdentityGenerator alloc];
    long long v13 = [(SLDCollaborationHandshakeService *)self privateSerialQueue];
    long long v14 = [(SLPersonIdentityGenerator *)v12 initWithQueue:v13];

    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __94__SLDCollaborationHandshakeService__personIdentitiesForHandles_documentIdentifier_completion___block_invoke_185;
    v21[3] = &unk_1E58A9720;
    uint64_t v25 = v27;
    id v22 = v8;
    uint64_t v23 = self;
    id v24 = v10;
    [(SLPersonIdentityGenerator *)v14 generatePersonIdentitiesForHandles:v22 documentIdentifier:v9 completionHandler:v21];

    _Block_object_dispose(v27, 8);
  }
  else
  {
    long long v15 = SLDaemonLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[SLDCollaborationHandshakeService _personIdentitiesForHandles:documentIdentifier:completion:]();
    }

    long long v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v32 = *MEMORY[0x1E4F28228];
    v33[0] = @"Missing collaboration identifier on the provided metadata.";
    id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:&v32 count:1];
    uint64_t v18 = [v16 errorWithDomain:@"com.apple.sociallayerd.SLDCollaborationHandshakeService" code:1 userInfo:v17];

    id v19 = [(SLDCollaborationHandshakeService *)self privateSerialQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __94__SLDCollaborationHandshakeService__personIdentitiesForHandles_documentIdentifier_completion___block_invoke;
    block[3] = &unk_1E58A8AA0;
    id v30 = v18;
    id v31 = v10;
    id v20 = v18;
    dispatch_async(v19, block);
  }
}

uint64_t __94__SLDCollaborationHandshakeService__personIdentitiesForHandles_documentIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), MEMORY[0x1E4F1CC08], *(void *)(a1 + 32));
}

void __94__SLDCollaborationHandshakeService__personIdentitiesForHandles_documentIdentifier_completion___block_invoke_185(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 count];
  if (v4 != [*(id *)(a1 + 32) count])
  {
    id v5 = SLDaemonLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __94__SLDCollaborationHandshakeService__personIdentitiesForHandles_documentIdentifier_completion___block_invoke_185_cold_1(v3, (id *)(a1 + 32));
    }
  }
  id v6 = SLDaemonLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_19BE17000, v6, OS_LOG_TYPE_DEFAULT, "_personIdentitiesForHandles received hashes from SLPersonIdentityGenerator", buf, 2u);
  }

  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v3;
  id v9 = v3;

  id v10 = [*(id *)(a1 + 40) privateSerialQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __94__SLDCollaborationHandshakeService__personIdentitiesForHandles_documentIdentifier_completion___block_invoke_186;
  v13[3] = &unk_1E58A8FE8;
  id v11 = *(id *)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 56);
  id v14 = v11;
  uint64_t v15 = v12;
  dispatch_async(v10, v13);
}

uint64_t __94__SLDCollaborationHandshakeService__personIdentitiesForHandles_documentIdentifier_completion___block_invoke_186(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), 0);
}

- (int64_t)_acquireSandboxHandleData:(id)a3 ForFileProviderDocumentURL:(id)a4 clientConnection:(id)a5 error:(id *)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (![v10 length])
  {
    long long v13 = SLDaemonLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[SLDCloudDocsService _acquireSandboxHandleData:ForFileProviderDocumentURL:clientConnection:error:]();
    }
    goto LABEL_7;
  }
  buf[0] = 0;
  objc_msgSend(v10, "getBytes:range:", buf, objc_msgSend(v10, "length") - 1, 1);
  if (buf[0])
  {
    long long v13 = SLDaemonLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[SLDCloudDocsService _acquireSandboxHandleData:ForFileProviderDocumentURL:clientConnection:error:]();
    }
LABEL_7:

LABEL_8:
    id v14 = SLDaemonLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[SLDCloudDocsService _acquireSandboxHandleData:ForFileProviderDocumentURL:clientConnection:error:]();
    }

    if (a6)
    {
      *a6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.sociallayerd.SLDCollaborationHandshakeService" code:3 userInfo:0];
    }
LABEL_12:
    int64_t v15 = -1;
    goto LABEL_13;
  }
  [v10 bytes];
  uint64_t v17 = sandbox_extension_consume();
  if (v17 == -1) {
    goto LABEL_8;
  }
  int64_t v15 = v17;
  if (![(SLDCollaborationHandshakeService *)self _connection:v12 hasPermissionForFileURL:v11])
  {
    id v22 = SLDaemonLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 134218498;
      uint64_t v25 = self;
      __int16 v26 = 2112;
      int64_t v27 = (int64_t)v11;
      __int16 v28 = 2112;
      id v29 = v12;
      _os_log_error_impl(&dword_19BE17000, v22, OS_LOG_TYPE_ERROR, "[%p] _acquireSandboxHandleData: acquired a sandbox handle for a file (%@), but the xpc connection (%@) does not have permission to access the file. Releasing sandbox handle.", buf, 0x20u);
    }

    if (a6)
    {
      *a6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.sociallayerd.SLDCollaborationHandshakeService" code:6 userInfo:0];
    }
    [(SLDCollaborationHandshakeService *)self _releaseSandboxHandle:v15];
    goto LABEL_12;
  }
  id v23 = 0;
  BOOL v18 = [(SLDCollaborationHandshakeService *)self _fileURLHasFileProvider:v11 error:&v23];
  id v19 = v23;
  id v20 = SLDaemonLogHandle();
  uint64_t v21 = v20;
  if (!v18)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 134218498;
      uint64_t v25 = self;
      __int16 v26 = 2112;
      int64_t v27 = (int64_t)v11;
      __int16 v28 = 2112;
      id v29 = v19;
      _os_log_error_impl(&dword_19BE17000, v21, OS_LOG_TYPE_ERROR, "[%p] _acquireSandboxHandleData: acquired a sandbox handle for a file (%@), but could not find a valid FPItem for that file. This file might not be managed by a FileProvider. Releasing sandbox handle. FileProvider error: %@", buf, 0x20u);
    }

    if (a6)
    {
      *a6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.sociallayerd.SLDCollaborationHandshakeService" code:4 userInfo:0];
    }
    [(SLDCollaborationHandshakeService *)self _releaseSandboxHandle:v15];

    goto LABEL_12;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134218498;
    uint64_t v25 = self;
    __int16 v26 = 2048;
    int64_t v27 = v15;
    __int16 v28 = 2112;
    id v29 = v11;
    _os_log_impl(&dword_19BE17000, v21, OS_LOG_TYPE_DEFAULT, "[%p] _acquireSandboxHandleData: acquired a new handle: %llu for file: %@", buf, 0x20u);
  }

LABEL_13:
  return v15;
}

- (BOOL)_fileURLHasFileProvider:(id)a3 error:(id *)a4
{
  id v5 = (void *)MEMORY[0x1E4F25D38];
  id v6 = a3;
  uint64_t v7 = [v5 defaultManager];
  id v8 = [v7 itemForURL:v6 error:a4];

  return v8 != 0;
}

- (BOOL)_connection:(id)a3 hasPermissionForFileURL:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5
    && ([v5 auditToken], objc_msgSend(v6, "isFileURL"))
    && ([v6 path],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 length],
        v7,
        v8))
  {
    [v5 auditToken];
    id v9 = [v6 path];
    [v9 fileSystemRepresentation];
    BOOL v10 = sandbox_check_by_audit_token() == 0;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)_releaseSandboxHandle:(int64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v5 = sandbox_extension_release();
  id v6 = SLDaemonLogHandle();
  uint64_t v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SLDCollaborationHandshakeService _releaseSandboxHandle:]();
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134218240;
    id v9 = self;
    __int16 v10 = 2048;
    int64_t v11 = a3;
    _os_log_impl(&dword_19BE17000, v7, OS_LOG_TYPE_DEFAULT, "[%p] _releaseSandboxHandle: released handle: %lld", (uint8_t *)&v8, 0x16u);
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

- (SLDProcessVerifier)processVerifier
{
  return self->_processVerifier;
}

- (void)setProcessVerifier:(id)a3
{
}

- (SLSWActionDispatcher)actionDispatcher
{
  return self->_actionDispatcher;
}

- (void)setActionDispatcher:(id)a3
{
}

- (SLPersonIdentityGenerator)personIdentityGenerator
{
  return self->_personIdentityGenerator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personIdentityGenerator, 0);
  objc_storeStrong((id *)&self->_actionDispatcher, 0);
  objc_storeStrong((id *)&self->_processVerifier, 0);
  objc_storeStrong((id *)&self->_taskManager, 0);
  objc_storeStrong((id *)&self->_privateSerialQueue, 0);
}

- (void)allowsConnection:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_19BE17000, v0, v1, "[SLDCollaborationHandshakeService] connection does not have the proper entitlement and will not be allowed to access the service: %@", v2, v3, v4, v5, v6);
}

void __91__SLDCollaborationHandshakeService_generateProofForIdentity_collaborationIdentifier_reply___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_4(&dword_19BE17000, v0, v1, "[SLDCollaborationHandshakeService] generateIdentityProofForPublicKeys:collaborationIdentifier: timeout timer fired after %f seconds", v2, v3, v4, v5, v6);
}

void __91__SLDCollaborationHandshakeService_generateProofForIdentity_collaborationIdentifier_reply___block_invoke_3_cold_2()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2(&dword_19BE17000, v0, v1, "[SLDCollaborationHandshakeService] generateIdentityProofForPublicKeys:collaborationIdentifier: was cancelled", v2, v3, v4, v5, v6);
}

void __91__SLDCollaborationHandshakeService_generateProofForIdentity_collaborationIdentifier_reply___block_invoke_2_39_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19BE17000, v0, v1, "[SLDCollaborationHandshakeService] generateIdentityProofForPublicKeys:collaborationIdentifier: error generating proof with SLPersonIdentityGenerator. proof: %@ error: %@");
}

- (void)verifySourceBundleIdentifierFromMetadata:(uint64_t)a1 reply:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 localIdentifier];
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_0_0(&dword_19BE17000, v3, v4, "[SLDCollaborationHandshakeService] verifySourceBundleIdentifierFromMetadata: failed to verify source process from sealed box data: %@ localIdentifier: %@", v5, v6, v7, v8, 2u);
}

- (void)startCollaborationWithMetadata:(uint64_t)a1 participants:(void *)a2 reply:.cold.1(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 localIdentifier];
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_0_0(&dword_19BE17000, v3, v4, "[SLDCollaborationHandshakeService] startCollaborationWithMetadata: failed to verify source process from sealed box data: %@ localIdentifier: %@", v5, v6, v7, v8, 2u);
}

void __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_4(&dword_19BE17000, v0, v1, "[SLDCollaborationHandshakeService] performStartCollaborationActionWithMetadata timeout timer fired after %f seconds", v2, v3, v4, v5, v6);
}

void __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke_3_cold_2()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2(&dword_19BE17000, v0, v1, "[SLDCollaborationHandshakeService] performStartCollaborationActionWithMetadata was cancelled by our client", v2, v3, v4, v5, v6);
}

void __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke_59_cold_1(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) collaborationIdentifier];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_19BE17000, v2, v3, "[SLDCollaborationHandshakeService] _startCollaborationWithMetadata Failed to generate local identity for documentIdentifier %@.", v4, v5, v6, v7, v8);
}

void __86__SLDCollaborationHandshakeService_startCollaborationWithMetadata_participants_reply___block_invoke_72_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_19BE17000, v0, v1, "[SLDCollaborationHandshakeService] startCollaborationWithMetadata failed: %@", v2, v3, v4, v5, v6);
}

void __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_4(&dword_19BE17000, v0, v1, "[SLDCollaborationHandshakeService] _startCollaborationWithFileURL timeout timer fired after %f seconds", v2, v3, v4, v5, v6);
}

void __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke_3_cold_2()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2(&dword_19BE17000, v0, v1, "[SLDCollaborationHandshakeService] _startCollaborationWithFileURL was cancelled by our client", v2, v3, v4, v5, v6);
}

void __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke_92_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_19BE17000, v0, v1, "startCollaborationWithFileURL adding participants failed: %@", v2, v3, v4, v5, v6);
}

void __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke_98_cold_1(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) collaborationIdentifier];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_19BE17000, v2, v3, "[SLDCollaborationHandshakeService] _startCollaborationWithFileURL: Failed to generate local identity for documentIdentifier %@.", v4, v5, v6, v7, v8);
}

void __111__SLDCollaborationHandshakeService_startCollaborationWithFileURL_sandboxTokenData_metadata_participants_reply___block_invoke_3_104_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_1(&dword_19BE17000, a2, a3, "_SWStartCollaborationAction failed with response: %@. Error: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

- (void)addParticipantHandles:(uint64_t)a3 withMetadata:(uint64_t)a4 reply:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)addParticipantHandles:(uint64_t)a3 withMetadata:(uint64_t)a4 reply:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __77__SLDCollaborationHandshakeService_addParticipantHandles_withMetadata_reply___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_4(&dword_19BE17000, v0, v1, "[SLDCollaborationHandshakeService] addParticipantHandles:withMetadata: timeout timer fired after %f seconds", v2, v3, v4, v5, v6);
}

- (void)addParticipantHandles:withFileURL:sandboxTokenData:metadata:reply:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2(&dword_19BE17000, v0, v1, "removeCollaborationParticipantHashes:withFileURL: cannot update participants without a collaboration identifier on the target metadata", v2, v3, v4, v5, v6);
}

- (void)addParticipantHandles:withFileURL:sandboxTokenData:metadata:reply:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_19BE17000, v0, v1, "removeCollaborationParticipantHashes:withFileURL: unable to create SWPersonIdentities from provided hashes, or there were no provided hashes: %@", v2, v3, v4, v5, v6);
}

void __102__SLDCollaborationHandshakeService_addParticipantHandles_withFileURL_sandboxTokenData_metadata_reply___block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_4(&dword_19BE17000, v0, v1, "[SLDCollaborationHandshakeService] removeCollaborationParticipantHashes:withFileURL timeout timer fired after %f seconds", v2, v3, v4, v5, v6);
}

void __102__SLDCollaborationHandshakeService_addParticipantHandles_withFileURL_sandboxTokenData_metadata_reply___block_invoke_4_cold_2()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2(&dword_19BE17000, v0, v1, "[SLDCollaborationHandshakeService] removeCollaborationParticipantHashes:withFileURL was cancelled by our client", v2, v3, v4, v5, v6);
}

void __102__SLDCollaborationHandshakeService_addParticipantHandles_withFileURL_sandboxTokenData_metadata_reply___block_invoke_132_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_19BE17000, v0, v1, "addCollaborationParticipants adding participants failed: %@", v2, v3, v4, v5, v6);
}

void __102__SLDCollaborationHandshakeService_addParticipantHandles_withFileURL_sandboxTokenData_metadata_reply___block_invoke_2_137_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_19BE17000, v0, v1, "[SLDCollaborationHandshakeService] _startCollaborationWithFileURL Failed to generate identities. Error: %@", v2, v3, v4, v5, v6);
}

- (void)removeParticipantIdentities:(uint64_t)a3 withMetadata:(uint64_t)a4 reply:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)removeParticipantIdentities:(uint64_t)a3 withMetadata:(uint64_t)a4 reply:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __83__SLDCollaborationHandshakeService_removeParticipantIdentities_withMetadata_reply___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_4(&dword_19BE17000, v0, v1, "[SLDCollaborationHandshakeService] removeParticipantIdentities:withMetadata: timeout timer fired after %f seconds", v2, v3, v4, v5, v6);
}

void __83__SLDCollaborationHandshakeService_removeParticipantIdentities_withMetadata_reply___block_invoke_3_cold_2()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2(&dword_19BE17000, v0, v1, "[SLDCollaborationHandshakeService] removeParticipantIdentities:withMetadata: was cancelled by our client.", v2, v3, v4, v5, v6);
}

- (void)removeParticipantIdentities:withFileURL:sandboxTokenData:metadata:reply:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2(&dword_19BE17000, v0, v1, "removeParticipantIdentities:withFileURL: cannot update participants without a collaboration identifier on the target metadata", v2, v3, v4, v5, v6);
}

- (void)removeParticipantIdentities:withFileURL:sandboxTokenData:metadata:reply:.cold.2()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2(&dword_19BE17000, v0, v1, "removeParticipantIdentities:withFileURL: cannot remove participants because no participants were provided.", v2, v3, v4, v5, v6);
}

void __108__SLDCollaborationHandshakeService_removeParticipantIdentities_withFileURL_sandboxTokenData_metadata_reply___block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_4(&dword_19BE17000, v0, v1, "[SLDCollaborationHandshakeService] removeParticipantIdentities:withFileURL timeout timer fired after %f seconds", v2, v3, v4, v5, v6);
}

void __108__SLDCollaborationHandshakeService_removeParticipantIdentities_withFileURL_sandboxTokenData_metadata_reply___block_invoke_149_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_19BE17000, v0, v1, "removeParticipantIdentities:withFileURL: removing participants failed: %@", v2, v3, v4, v5, v6);
}

- (void)_sendActionUpdateParticipantsWithMetadata:(uint64_t)a1 addedIdentities:(void *)a2 removedIdentities:completion:.cold.1(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 localIdentifier];
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_0_0(&dword_19BE17000, v3, v4, "_sendActionUpdateParticipantsWithMetadata: failed to verify source process from sealed box data: %@ localIdentifier: %@", v5, v6, v7, v8, 2u);
}

- (void)_sendActionUpdateParticipantsWithMetadata:addedIdentities:removedIdentities:completion:.cold.2()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2(&dword_19BE17000, v0, v1, "_sendActionUpdateParticipantsWithMetadata: attempted to add/remove identities without any identities.", v2, v3, v4, v5, v6);
}

- (void)_sendActionUpdateParticipantsWithMetadata:(uint64_t)a1 addedIdentities:(void *)a2 removedIdentities:completion:.cold.3(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 handleToIdentityMap];
  uint64_t v3 = [v2 allValues];
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_9(&dword_19BE17000, v4, v5, "_sendActionUpdateParticipantsWithMetadata: attempted to remove some identities which do not exist in the metadata identity map. removedIdentities: %@ metadata identities: %@", v6, v7, v8, v9, 2u);
}

- (void)_sendActionUpdateParticipantsWithMetadata:(uint64_t)a1 addedIdentities:(void *)a2 removedIdentities:completion:.cold.4(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 handleToIdentityMap];
  uint64_t v3 = [v2 allValues];
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_9(&dword_19BE17000, v4, v5, "_sendActionUpdateParticipantsWithMetadata: attempted to add identities which already exist in the metadata identity map. addedIdentities: %@ metadata identities: %@", v6, v7, v8, v9, 2u);
}

void __123__SLDCollaborationHandshakeService__sendActionUpdateParticipantsWithMetadata_addedIdentities_removedIdentities_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_19BE17000, v0, v1, "_sendActionUpdateParticipantsWithMetadata: adding participants failed: %@", v2, v3, v4, v5, v6);
}

- (void)_sendActionUpdateParticipantsWithFileURL:metadata:addedIdentities:removedIdentities:completion:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2(&dword_19BE17000, v0, v1, "_sendActionUpdateParticipantsWithFileURL: attempted to add/remove identities without any identities.", v2, v3, v4, v5, v6);
}

- (void)_sendActionUpdateParticipantsWithFileURL:(uint64_t)a1 metadata:(void *)a2 addedIdentities:removedIdentities:completion:.cold.2(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 handleToIdentityMap];
  uint64_t v3 = [v2 allValues];
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_0_0(&dword_19BE17000, v4, v5, "_sendActionUpdateParticipantsWithFileURL: attempted to remove some identities which do not exist in the metadata identity map. removedIdentities: %@ metadata identities: %@", v6, v7, v8, v9, 2u);
}

- (void)_sendActionUpdateParticipantsWithFileURL:(uint64_t)a1 metadata:(void *)a2 addedIdentities:removedIdentities:completion:.cold.3(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 handleToIdentityMap];
  uint64_t v3 = [v2 allValues];
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_0_0(&dword_19BE17000, v4, v5, "_sendActionUpdateParticipantsWithFileURL: attempted to add identities which already exist in the metadata identity map. addedIdentities: %@ metadata identities: %@", v6, v7, v8, v9, 2u);
}

void __131__SLDCollaborationHandshakeService__sendActionUpdateParticipantsWithFileURL_metadata_addedIdentities_removedIdentities_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_19BE17000, v0, v1, "_SWUpdateCollaborationParticipantsAction with a fileURL failed. Error: %@", v2, v3, v4, v5, v6);
}

- (void)_localPersonIdentityForDocumentIdentifier:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_19BE17000, v0, v1, "_localPersonIdentityForDocumentIdentifier: cannot generate local identity without a document identifier. DocID: %@", v2, v3, v4, v5, v6);
}

- (void)_personIdentitiesForHandles:documentIdentifier:completion:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19BE17000, v0, v1, "_personIdentitiesForHandles: cannot generate identities without a document identifier or handles. DocID: %@ handles: %@");
}

void __94__SLDCollaborationHandshakeService__personIdentitiesForHandles_documentIdentifier_completion___block_invoke_185_cold_1(void *a1, id *a2)
{
  [a1 count];
  [*a2 count];
  OUTLINED_FUNCTION_0_0(&dword_19BE17000, v3, v4, "Received a different number of identities than expected. This may mean some recipients are on older software versions that do not support collaboration. Expected: %lu Actual: %lu", v5, v6, v7, v8, 0);
}

- (void)_releaseSandboxHandle:.cold.1()
{
  OUTLINED_FUNCTION_3();
  WORD2(v3) = 2048;
  HIWORD(v3) = v0;
  OUTLINED_FUNCTION_1(&dword_19BE17000, v0, v1, "[%p] _releaseSandboxHandle: unable to release sandbox extension handle: %lld. Sandbox extensions are a limited resource and this should be investigated!", v2, v3);
}

@end