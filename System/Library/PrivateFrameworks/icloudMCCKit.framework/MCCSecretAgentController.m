@interface MCCSecretAgentController
- (MCCSecretAgentController)init;
- (MCCSecretAgentController)initWithAgentXPCEndpoint:(id)a3;
- (MCCSecretAgentController)initWithCallbackListener:(id)a3;
- (void)clearAllUserOverridesWithTimestamp:(double)a3 completion:(id)a4;
- (void)createWebRule:(id)a3 completion:(id)a4;
- (void)fetchSigningAndEncryptingStatusForEmailAddress:(id)a3 completion:(id)a4;
- (void)fetchSigningAndEncrytionMessagesStatusForEmailAddress:(id)a3 completion:(id)a4;
- (void)generateCertificateWithContext:(id)a3 completion:(id)a4;
- (void)getBlackPearlVersionWithCompletion:(id)a3;
- (void)getIABCategoryID:(id)a3 completion:(id)a4;
- (void)invokeModelDownloadWithCompletion:(id)a3;
- (void)isModelReadyWithCompletion:(id)a3;
- (void)isPersonalDomain:(id)a3 completion:(id)a4;
- (void)listCertificatesForEmail:(id)a3 completion:(id)a4;
- (void)listCertificatesWithCompletion:(id)a3;
- (void)notifyWebRule:(id)a3 completion:(id)a4;
- (void)pingWithcompletion:(id)a3;
- (void)predictCommerceEmailWithContext:(id)a3 completion:(id)a4;
- (void)refreshCertificateWithContext:(id)a3 certId:(id)a4 completion:(id)a5;
- (void)registerCategoryRulesCallback;
- (void)registerCategoryRulesCallbackListener:(id)a3 completion:(id)a4;
- (void)sendPendingRulesWithType:(id)a3 completion:(id)a4;
- (void)setEncryptIsEnabled:(BOOL)a3 forEmailAddress:(id)a4 completion:(id)a5;
- (void)setSignIsEnabled:(BOOL)a3 forEmailAddress:(id)a4 completion:(id)a5;
- (void)setSigningAndEncrytingStatusTo:(BOOL)a3 forEmailAddress:(id)a4 completion:(id)a5;
- (void)syncRecategorizationRules:(id)a3 completion:(id)a4;
- (void)syncToWeb:(id)a3;
- (void)updateCertificateDefaultsForEmailAddress:(id)a3 certInfo:(id)a4 completion:(id)a5;
@end

@implementation MCCSecretAgentController

- (MCCSecretAgentController)init
{
  return [(MCCSecretAgentController *)self initWithAgentXPCEndpoint:0];
}

- (MCCSecretAgentController)initWithCallbackListener:(id)a3
{
  id v5 = a3;
  v6 = [(MCCSecretAgentController *)self initWithAgentXPCEndpoint:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_callbackListener, a3);
    [(NSXPCListener *)v7->_callbackListener resume];
  }

  return v7;
}

- (MCCSecretAgentController)initWithAgentXPCEndpoint:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MCCSecretAgentController;
  id v5 = [(MCCSecretAgentController *)&v9 init];
  if (v5)
  {
    v6 = [[MCCSecretAgentConnection alloc] initWithListenerEndpoint:v4];
    agentConnection = v5->_agentConnection;
    v5->_agentConnection = v6;
  }
  return v5;
}

- (void)generateCertificateWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy_;
  v22[4] = __Block_byref_object_dispose_;
  v8 = self;
  v23 = v8;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __70__MCCSecretAgentController_generateCertificateWithContext_completion___block_invoke;
  v19[3] = &unk_2655BA960;
  v21 = v22;
  id v9 = v7;
  id v20 = v9;
  v10 = (void *)MEMORY[0x263E5DC10](v19);
  agentConnection = v8->_agentConnection;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __70__MCCSecretAgentController_generateCertificateWithContext_completion___block_invoke_2;
  v17[3] = &unk_2655BA988;
  id v12 = v10;
  id v18 = v12;
  v13 = [(MCCSecretAgentConnection *)agentConnection remoteObjectProxyWithErrorHandler:v17];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __70__MCCSecretAgentController_generateCertificateWithContext_completion___block_invoke_1;
  v15[3] = &unk_2655BA988;
  id v14 = v12;
  id v16 = v14;
  [v13 generateCertificateWithContext:v6 completion:v15];

  _Block_object_dispose(v22, 8);
}

void __70__MCCSecretAgentController_generateCertificateWithContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
  }
}

void __70__MCCSecretAgentController_generateCertificateWithContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _MCCLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __70__MCCSecretAgentController_generateCertificateWithContext_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __70__MCCSecretAgentController_generateCertificateWithContext_completion___block_invoke_1(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = _MCCLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl(&dword_262BBA000, v4, OS_LOG_TYPE_DEFAULT, "Remote secret agent genenrateCertificate call with error: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)listCertificatesWithCompletion:(id)a3
{
  id v4 = a3;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy_;
  void v19[4] = __Block_byref_object_dispose_;
  int v5 = self;
  id v20 = v5;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __59__MCCSecretAgentController_listCertificatesWithCompletion___block_invoke;
  v16[3] = &unk_2655BA9B0;
  id v18 = v19;
  id v6 = v4;
  id v17 = v6;
  uint64_t v7 = (void *)MEMORY[0x263E5DC10](v16);
  agentConnection = v5->_agentConnection;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __59__MCCSecretAgentController_listCertificatesWithCompletion___block_invoke_2;
  v14[3] = &unk_2655BA988;
  id v9 = v7;
  id v15 = v9;
  v10 = [(MCCSecretAgentConnection *)agentConnection remoteObjectProxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __59__MCCSecretAgentController_listCertificatesWithCompletion___block_invoke_3;
  v12[3] = &unk_2655BA9D8;
  id v11 = v9;
  id v13 = v11;
  [v10 listCertificatesWithCompletion:v12];

  _Block_object_dispose(v19, 8);
}

void __59__MCCSecretAgentController_listCertificatesWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v9, v5);
  }
}

void __59__MCCSecretAgentController_listCertificatesWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _MCCLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __59__MCCSecretAgentController_listCertificatesWithCompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __59__MCCSecretAgentController_listCertificatesWithCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = _MCCLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = v5;
    __int16 v10 = 2114;
    id v11 = v6;
    _os_log_impl(&dword_262BBA000, v7, OS_LOG_TYPE_DEFAULT, "Remote secret agent listCertificates call results %@ with error: %{public}@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)listCertificatesForEmail:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy_;
  v22[4] = __Block_byref_object_dispose_;
  int v8 = self;
  v23 = v8;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __64__MCCSecretAgentController_listCertificatesForEmail_completion___block_invoke;
  v19[3] = &unk_2655BA9B0;
  v21 = v22;
  id v9 = v7;
  id v20 = v9;
  __int16 v10 = (void *)MEMORY[0x263E5DC10](v19);
  agentConnection = v8->_agentConnection;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __64__MCCSecretAgentController_listCertificatesForEmail_completion___block_invoke_2;
  v17[3] = &unk_2655BA988;
  id v12 = v10;
  id v18 = v12;
  id v13 = [(MCCSecretAgentConnection *)agentConnection remoteObjectProxyWithErrorHandler:v17];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __64__MCCSecretAgentController_listCertificatesForEmail_completion___block_invoke_4;
  v15[3] = &unk_2655BA9D8;
  id v14 = v12;
  id v16 = v14;
  [v13 listCertificatesForEmail:v6 completion:v15];

  _Block_object_dispose(v22, 8);
}

void __64__MCCSecretAgentController_listCertificatesForEmail_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v9, v5);
  }
}

void __64__MCCSecretAgentController_listCertificatesForEmail_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _MCCLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __64__MCCSecretAgentController_listCertificatesForEmail_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __64__MCCSecretAgentController_listCertificatesForEmail_completion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = _MCCLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = v5;
    __int16 v10 = 2114;
    id v11 = v6;
    _os_log_impl(&dword_262BBA000, v7, OS_LOG_TYPE_DEFAULT, "Remote secret agent listCertificatesForEmail call results %@ with error: %{public}@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchSigningAndEncryptingStatusForEmailAddress:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy_;
  v22[4] = __Block_byref_object_dispose_;
  int v8 = self;
  v23 = v8;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __86__MCCSecretAgentController_fetchSigningAndEncryptingStatusForEmailAddress_completion___block_invoke;
  v19[3] = &unk_2655BAA00;
  v21 = v22;
  id v9 = v7;
  id v20 = v9;
  __int16 v10 = (void *)MEMORY[0x263E5DC10](v19);
  agentConnection = v8->_agentConnection;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __86__MCCSecretAgentController_fetchSigningAndEncryptingStatusForEmailAddress_completion___block_invoke_2;
  v17[3] = &unk_2655BA988;
  id v12 = v10;
  id v18 = v12;
  id v13 = [(MCCSecretAgentConnection *)agentConnection remoteObjectProxyWithErrorHandler:v17];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __86__MCCSecretAgentController_fetchSigningAndEncryptingStatusForEmailAddress_completion___block_invoke_6;
  v15[3] = &unk_2655BAA28;
  id v14 = v12;
  id v16 = v14;
  [v13 fetchSigningAndEncryptingStatusForEmailAddress:v6 completion:v15];

  _Block_object_dispose(v22, 8);
}

void __86__MCCSecretAgentController_fetchSigningAndEncryptingStatusForEmailAddress_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);
  }
}

void __86__MCCSecretAgentController_fetchSigningAndEncryptingStatusForEmailAddress_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _MCCLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __86__MCCSecretAgentController_fetchSigningAndEncryptingStatusForEmailAddress_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __86__MCCSecretAgentController_fetchSigningAndEncryptingStatusForEmailAddress_completion___block_invoke_6(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = _MCCLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __86__MCCSecretAgentController_fetchSigningAndEncryptingStatusForEmailAddress_completion___block_invoke_6_cold_1(a2, (uint64_t)v5, v6);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchSigningAndEncrytionMessagesStatusForEmailAddress:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy_;
  v22[4] = __Block_byref_object_dispose_;
  id v8 = self;
  v23 = v8;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __93__MCCSecretAgentController_fetchSigningAndEncrytionMessagesStatusForEmailAddress_completion___block_invoke;
  v19[3] = &unk_2655BAA50;
  v21 = v22;
  id v9 = v7;
  id v20 = v9;
  __int16 v10 = (void *)MEMORY[0x263E5DC10](v19);
  agentConnection = v8->_agentConnection;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __93__MCCSecretAgentController_fetchSigningAndEncrytionMessagesStatusForEmailAddress_completion___block_invoke_2;
  v17[3] = &unk_2655BA988;
  id v12 = v10;
  id v18 = v12;
  id v13 = [(MCCSecretAgentConnection *)agentConnection remoteObjectProxyWithErrorHandler:v17];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __93__MCCSecretAgentController_fetchSigningAndEncrytionMessagesStatusForEmailAddress_completion___block_invoke_8;
  v15[3] = &unk_2655BAA78;
  id v14 = v12;
  id v16 = v14;
  [v13 fetchSigningAndEncrytionMessagesStatusForEmailAddress:v6 completion:v15];

  _Block_object_dispose(v22, 8);
}

void __93__MCCSecretAgentController_fetchSigningAndEncrytionMessagesStatusForEmailAddress_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v9, v5);
  }
}

void __93__MCCSecretAgentController_fetchSigningAndEncrytionMessagesStatusForEmailAddress_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _MCCLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __93__MCCSecretAgentController_fetchSigningAndEncrytionMessagesStatusForEmailAddress_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __93__MCCSecretAgentController_fetchSigningAndEncrytionMessagesStatusForEmailAddress_completion___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = _MCCLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __93__MCCSecretAgentController_fetchSigningAndEncrytionMessagesStatusForEmailAddress_completion___block_invoke_8_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setEncryptIsEnabled:(BOOL)a3 forEmailAddress:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy_;
  v24[4] = __Block_byref_object_dispose_;
  __int16 v10 = self;
  v25 = v10;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __75__MCCSecretAgentController_setEncryptIsEnabled_forEmailAddress_completion___block_invoke;
  v21[3] = &unk_2655BA960;
  v23 = v24;
  id v11 = v9;
  id v22 = v11;
  id v12 = (void *)MEMORY[0x263E5DC10](v21);
  agentConnection = v10->_agentConnection;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __75__MCCSecretAgentController_setEncryptIsEnabled_forEmailAddress_completion___block_invoke_2;
  v19[3] = &unk_2655BA988;
  id v14 = v12;
  id v20 = v14;
  id v15 = [(MCCSecretAgentConnection *)agentConnection remoteObjectProxyWithErrorHandler:v19];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __75__MCCSecretAgentController_setEncryptIsEnabled_forEmailAddress_completion___block_invoke_9;
  v17[3] = &unk_2655BA988;
  id v16 = v14;
  id v18 = v16;
  [v15 setEncryptIsEnabled:v6 forEmailAddress:v8 completion:v17];

  _Block_object_dispose(v24, 8);
}

void __75__MCCSecretAgentController_setEncryptIsEnabled_forEmailAddress_completion___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
  }
}

void __75__MCCSecretAgentController_setEncryptIsEnabled_forEmailAddress_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _MCCLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __75__MCCSecretAgentController_setEncryptIsEnabled_forEmailAddress_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __75__MCCSecretAgentController_setEncryptIsEnabled_forEmailAddress_completion___block_invoke_9(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = _MCCLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __75__MCCSecretAgentController_setEncryptIsEnabled_forEmailAddress_completion___block_invoke_9_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setSignIsEnabled:(BOOL)a3 forEmailAddress:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy_;
  v24[4] = __Block_byref_object_dispose_;
  __int16 v10 = self;
  v25 = v10;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __72__MCCSecretAgentController_setSignIsEnabled_forEmailAddress_completion___block_invoke;
  v21[3] = &unk_2655BA960;
  v23 = v24;
  id v11 = v9;
  id v22 = v11;
  id v12 = (void *)MEMORY[0x263E5DC10](v21);
  agentConnection = v10->_agentConnection;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __72__MCCSecretAgentController_setSignIsEnabled_forEmailAddress_completion___block_invoke_2;
  v19[3] = &unk_2655BA988;
  id v14 = v12;
  id v20 = v14;
  id v15 = [(MCCSecretAgentConnection *)agentConnection remoteObjectProxyWithErrorHandler:v19];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __72__MCCSecretAgentController_setSignIsEnabled_forEmailAddress_completion___block_invoke_10;
  v17[3] = &unk_2655BA988;
  id v16 = v14;
  id v18 = v16;
  [v15 setSignIsEnabled:v6 forEmailAddress:v8 completion:v17];

  _Block_object_dispose(v24, 8);
}

void __72__MCCSecretAgentController_setSignIsEnabled_forEmailAddress_completion___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
  }
}

void __72__MCCSecretAgentController_setSignIsEnabled_forEmailAddress_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _MCCLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __72__MCCSecretAgentController_setSignIsEnabled_forEmailAddress_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __72__MCCSecretAgentController_setSignIsEnabled_forEmailAddress_completion___block_invoke_10(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = _MCCLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __72__MCCSecretAgentController_setSignIsEnabled_forEmailAddress_completion___block_invoke_10_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setSigningAndEncrytingStatusTo:(BOOL)a3 forEmailAddress:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy_;
  v24[4] = __Block_byref_object_dispose_;
  __int16 v10 = self;
  v25 = v10;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __86__MCCSecretAgentController_setSigningAndEncrytingStatusTo_forEmailAddress_completion___block_invoke;
  v21[3] = &unk_2655BA960;
  v23 = v24;
  id v11 = v9;
  id v22 = v11;
  id v12 = (void *)MEMORY[0x263E5DC10](v21);
  agentConnection = v10->_agentConnection;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __86__MCCSecretAgentController_setSigningAndEncrytingStatusTo_forEmailAddress_completion___block_invoke_2;
  v19[3] = &unk_2655BA988;
  id v14 = v12;
  id v20 = v14;
  id v15 = [(MCCSecretAgentConnection *)agentConnection remoteObjectProxyWithErrorHandler:v19];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __86__MCCSecretAgentController_setSigningAndEncrytingStatusTo_forEmailAddress_completion___block_invoke_11;
  v17[3] = &unk_2655BA988;
  id v16 = v14;
  id v18 = v16;
  [v15 setSigningAndEncrytingStatusTo:v6 forEmailAddress:v8 completion:v17];

  _Block_object_dispose(v24, 8);
}

void __86__MCCSecretAgentController_setSigningAndEncrytingStatusTo_forEmailAddress_completion___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
  }
}

void __86__MCCSecretAgentController_setSigningAndEncrytingStatusTo_forEmailAddress_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _MCCLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __86__MCCSecretAgentController_setSigningAndEncrytingStatusTo_forEmailAddress_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __86__MCCSecretAgentController_setSigningAndEncrytingStatusTo_forEmailAddress_completion___block_invoke_11(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = _MCCLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __86__MCCSecretAgentController_setSigningAndEncrytingStatusTo_forEmailAddress_completion___block_invoke_11_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updateCertificateDefaultsForEmailAddress:(id)a3 certInfo:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy_;
  v25[4] = __Block_byref_object_dispose_;
  id v11 = self;
  v26 = v11;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __89__MCCSecretAgentController_updateCertificateDefaultsForEmailAddress_certInfo_completion___block_invoke;
  v22[3] = &unk_2655BA960;
  v24 = v25;
  id v12 = v10;
  id v23 = v12;
  id v13 = (void *)MEMORY[0x263E5DC10](v22);
  agentConnection = v11->_agentConnection;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __89__MCCSecretAgentController_updateCertificateDefaultsForEmailAddress_certInfo_completion___block_invoke_2;
  v20[3] = &unk_2655BA988;
  id v15 = v13;
  id v21 = v15;
  id v16 = [(MCCSecretAgentConnection *)agentConnection remoteObjectProxyWithErrorHandler:v20];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __89__MCCSecretAgentController_updateCertificateDefaultsForEmailAddress_certInfo_completion___block_invoke_12;
  v18[3] = &unk_2655BA988;
  id v17 = v15;
  id v19 = v17;
  [v16 updateCertificateDefaultsForEmailAddress:v8 certInfo:v9 completion:v18];

  _Block_object_dispose(v25, 8);
}

void __89__MCCSecretAgentController_updateCertificateDefaultsForEmailAddress_certInfo_completion___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
  }
}

void __89__MCCSecretAgentController_updateCertificateDefaultsForEmailAddress_certInfo_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _MCCLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __89__MCCSecretAgentController_updateCertificateDefaultsForEmailAddress_certInfo_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __89__MCCSecretAgentController_updateCertificateDefaultsForEmailAddress_certInfo_completion___block_invoke_12(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = _MCCLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __89__MCCSecretAgentController_updateCertificateDefaultsForEmailAddress_certInfo_completion___block_invoke_12_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)refreshCertificateWithContext:(id)a3 certId:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy_;
  v25[4] = __Block_byref_object_dispose_;
  id v11 = self;
  v26 = v11;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __76__MCCSecretAgentController_refreshCertificateWithContext_certId_completion___block_invoke;
  v22[3] = &unk_2655BA9B0;
  v24 = v25;
  id v12 = v10;
  id v23 = v12;
  id v13 = (void *)MEMORY[0x263E5DC10](v22);
  agentConnection = v11->_agentConnection;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __76__MCCSecretAgentController_refreshCertificateWithContext_certId_completion___block_invoke_2;
  v20[3] = &unk_2655BA988;
  id v15 = v13;
  id v21 = v15;
  id v16 = [(MCCSecretAgentConnection *)agentConnection remoteObjectProxyWithErrorHandler:v20];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __76__MCCSecretAgentController_refreshCertificateWithContext_certId_completion___block_invoke_13;
  v18[3] = &unk_2655BA9D8;
  id v17 = v15;
  id v19 = v17;
  [v16 refreshCertificateWithContext:v8 certId:v9 completion:v18];

  _Block_object_dispose(v25, 8);
}

void __76__MCCSecretAgentController_refreshCertificateWithContext_certId_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v9, v5);
  }
}

void __76__MCCSecretAgentController_refreshCertificateWithContext_certId_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _MCCLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __76__MCCSecretAgentController_refreshCertificateWithContext_certId_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __76__MCCSecretAgentController_refreshCertificateWithContext_certId_completion___block_invoke_13(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = _MCCLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __76__MCCSecretAgentController_refreshCertificateWithContext_certId_completion___block_invoke_13_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)predictCommerceEmailWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy_;
  void v22[4] = __Block_byref_object_dispose_;
  uint64_t v8 = self;
  id v23 = v8;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __71__MCCSecretAgentController_predictCommerceEmailWithContext_completion___block_invoke;
  v19[3] = &unk_2655BAAA0;
  id v21 = v22;
  id v9 = v7;
  id v20 = v9;
  id v10 = (void *)MEMORY[0x263E5DC10](v19);
  agentConnection = v8->_agentConnection;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __71__MCCSecretAgentController_predictCommerceEmailWithContext_completion___block_invoke_2;
  v17[3] = &unk_2655BA988;
  id v12 = v10;
  id v18 = v12;
  id v13 = [(MCCSecretAgentConnection *)agentConnection synchronousRemoteObjectProxyWithErrorHandler:v17];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __71__MCCSecretAgentController_predictCommerceEmailWithContext_completion___block_invoke_15;
  v15[3] = &unk_2655BAAC8;
  id v14 = v12;
  id v16 = v14;
  [v13 predictCommerceEmailWithContext:v6 completion:v15];

  _Block_object_dispose(v22, 8);
}

void __71__MCCSecretAgentController_predictCommerceEmailWithContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v9, v5);
  }
}

void __71__MCCSecretAgentController_predictCommerceEmailWithContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _MCCLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __71__MCCSecretAgentController_predictCommerceEmailWithContext_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __71__MCCSecretAgentController_predictCommerceEmailWithContext_completion___block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    id v7 = _MCCLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __71__MCCSecretAgentController_predictCommerceEmailWithContext_completion___block_invoke_15_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)registerCategoryRulesCallback
{
  id v3 = [(NSXPCListener *)self->_callbackListener endpoint];
  [(MCCSecretAgentController *)self registerCategoryRulesCallbackListener:v3 completion:&__block_literal_global_0];
}

void __57__MCCSecretAgentController_registerCategoryRulesCallback__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  if (v3)
  {
    id v4 = _MCCLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __57__MCCSecretAgentController_registerCategoryRulesCallback__block_invoke_cold_1();
    }
  }
}

- (void)registerCategoryRulesCallbackListener:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy_;
  void v22[4] = __Block_byref_object_dispose_;
  uint64_t v8 = self;
  id v23 = v8;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __77__MCCSecretAgentController_registerCategoryRulesCallbackListener_completion___block_invoke;
  v19[3] = &unk_2655BAA00;
  id v21 = v22;
  id v9 = v7;
  id v20 = v9;
  id v10 = (void *)MEMORY[0x263E5DC10](v19);
  agentConnection = v8->_agentConnection;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __77__MCCSecretAgentController_registerCategoryRulesCallbackListener_completion___block_invoke_2;
  v17[3] = &unk_2655BA988;
  id v12 = v10;
  id v18 = v12;
  id v13 = [(MCCSecretAgentConnection *)agentConnection remoteObjectProxyWithErrorHandler:v17];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __77__MCCSecretAgentController_registerCategoryRulesCallbackListener_completion___block_invoke_16;
  v15[3] = &unk_2655BAA28;
  id v14 = v12;
  id v16 = v14;
  [v13 registerCategoryRulesCallbackListener:v6 completion:v15];

  _Block_object_dispose(v22, 8);
}

void __77__MCCSecretAgentController_registerCategoryRulesCallbackListener_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);
  }
}

void __77__MCCSecretAgentController_registerCategoryRulesCallbackListener_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _MCCLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __77__MCCSecretAgentController_registerCategoryRulesCallbackListener_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __77__MCCSecretAgentController_registerCategoryRulesCallbackListener_completion___block_invoke_16(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = _MCCLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __77__MCCSecretAgentController_registerCategoryRulesCallbackListener_completion___block_invoke_16_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)syncRecategorizationRules:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy_;
  void v22[4] = __Block_byref_object_dispose_;
  id v8 = self;
  id v23 = v8;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __65__MCCSecretAgentController_syncRecategorizationRules_completion___block_invoke;
  v19[3] = &unk_2655BAA00;
  id v21 = v22;
  id v9 = v7;
  id v20 = v9;
  id v10 = (void *)MEMORY[0x263E5DC10](v19);
  agentConnection = v8->_agentConnection;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __65__MCCSecretAgentController_syncRecategorizationRules_completion___block_invoke_2;
  v17[3] = &unk_2655BA988;
  id v12 = v10;
  id v18 = v12;
  id v13 = [(MCCSecretAgentConnection *)agentConnection remoteObjectProxyWithErrorHandler:v17];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __65__MCCSecretAgentController_syncRecategorizationRules_completion___block_invoke_17;
  v15[3] = &unk_2655BAA28;
  id v14 = v12;
  id v16 = v14;
  [v13 syncRecategorizationRules:v6 completion:v15];

  _Block_object_dispose(v22, 8);
}

void __65__MCCSecretAgentController_syncRecategorizationRules_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);
  }
}

void __65__MCCSecretAgentController_syncRecategorizationRules_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _MCCLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __65__MCCSecretAgentController_syncRecategorizationRules_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __65__MCCSecretAgentController_syncRecategorizationRules_completion___block_invoke_17(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = _MCCLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __65__MCCSecretAgentController_syncRecategorizationRules_completion___block_invoke_17_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)createWebRule:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy_;
  v23[4] = __Block_byref_object_dispose_;
  id v8 = self;
  v24 = v8;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __53__MCCSecretAgentController_createWebRule_completion___block_invoke;
  v20[3] = &unk_2655BAA00;
  id v22 = v23;
  id v9 = v7;
  id v21 = v9;
  id v10 = (void (**)(void, void, void))MEMORY[0x263E5DC10](v20);
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    agentConnection = v8->_agentConnection;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __53__MCCSecretAgentController_createWebRule_completion___block_invoke_22;
    v18[3] = &unk_2655BA988;
    id v12 = v10;
    id v19 = v12;
    id v13 = [(MCCSecretAgentConnection *)agentConnection synchronousRemoteObjectProxyWithErrorHandler:v18];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __53__MCCSecretAgentController_createWebRule_completion___block_invoke_23;
    v16[3] = &unk_2655BAA28;
    id v17 = v12;
    [v13 createWebRule:v6 completion:v16];

    id v14 = v19;
  }
  else
  {
    id v15 = _MCCLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[MCCSecretAgentController createWebRule:completion:](v15);
    }

    id v14 = [MEMORY[0x263F087E8] errorWithDomain:@"rules" code:10001 userInfo:0];
    ((void (**)(void, void, void *))v10)[2](v10, 0, v14);
  }

  _Block_object_dispose(v23, 8);
}

void __53__MCCSecretAgentController_createWebRule_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);
  }
}

void __53__MCCSecretAgentController_createWebRule_completion___block_invoke_22(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _MCCLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __53__MCCSecretAgentController_createWebRule_completion___block_invoke_22_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __53__MCCSecretAgentController_createWebRule_completion___block_invoke_23(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = _MCCLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __53__MCCSecretAgentController_createWebRule_completion___block_invoke_23_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)notifyWebRule:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy_;
  void v22[4] = __Block_byref_object_dispose_;
  id v8 = self;
  id v23 = v8;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __53__MCCSecretAgentController_notifyWebRule_completion___block_invoke;
  v19[3] = &unk_2655BAA00;
  id v21 = v22;
  id v9 = v7;
  id v20 = v9;
  id v10 = (void *)MEMORY[0x263E5DC10](v19);
  agentConnection = v8->_agentConnection;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __53__MCCSecretAgentController_notifyWebRule_completion___block_invoke_2;
  v17[3] = &unk_2655BA988;
  id v12 = v10;
  id v18 = v12;
  id v13 = [(MCCSecretAgentConnection *)agentConnection synchronousRemoteObjectProxyWithErrorHandler:v17];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __53__MCCSecretAgentController_notifyWebRule_completion___block_invoke_24;
  v15[3] = &unk_2655BAA28;
  id v14 = v12;
  id v16 = v14;
  [v13 notifyWebRule:v6 completion:v15];

  _Block_object_dispose(v22, 8);
}

void __53__MCCSecretAgentController_notifyWebRule_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);
  }
}

void __53__MCCSecretAgentController_notifyWebRule_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _MCCLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __53__MCCSecretAgentController_notifyWebRule_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __53__MCCSecretAgentController_notifyWebRule_completion___block_invoke_24(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = _MCCLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __53__MCCSecretAgentController_notifyWebRule_completion___block_invoke_24_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)sendPendingRulesWithType:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy_;
  void v22[4] = __Block_byref_object_dispose_;
  id v8 = self;
  id v23 = v8;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __64__MCCSecretAgentController_sendPendingRulesWithType_completion___block_invoke;
  v19[3] = &unk_2655BAA00;
  id v21 = v22;
  id v9 = v7;
  id v20 = v9;
  id v10 = (void *)MEMORY[0x263E5DC10](v19);
  agentConnection = v8->_agentConnection;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __64__MCCSecretAgentController_sendPendingRulesWithType_completion___block_invoke_2;
  v17[3] = &unk_2655BA988;
  id v12 = v10;
  id v18 = v12;
  id v13 = [(MCCSecretAgentConnection *)agentConnection synchronousRemoteObjectProxyWithErrorHandler:v17];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __64__MCCSecretAgentController_sendPendingRulesWithType_completion___block_invoke_25;
  v15[3] = &unk_2655BAA28;
  id v14 = v12;
  id v16 = v14;
  [v13 sendPendingRulesWithType:v6 completion:v15];

  _Block_object_dispose(v22, 8);
}

void __64__MCCSecretAgentController_sendPendingRulesWithType_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);
  }
}

void __64__MCCSecretAgentController_sendPendingRulesWithType_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _MCCLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __64__MCCSecretAgentController_sendPendingRulesWithType_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __64__MCCSecretAgentController_sendPendingRulesWithType_completion___block_invoke_25(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = _MCCLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __64__MCCSecretAgentController_sendPendingRulesWithType_completion___block_invoke_25_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)isModelReadyWithCompletion:(id)a3
{
  id v4 = a3;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy_;
  void v19[4] = __Block_byref_object_dispose_;
  uint64_t v5 = self;
  id v20 = v5;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __55__MCCSecretAgentController_isModelReadyWithCompletion___block_invoke;
  v16[3] = &unk_2655BAA00;
  id v18 = v19;
  id v6 = v4;
  id v17 = v6;
  uint64_t v7 = (void *)MEMORY[0x263E5DC10](v16);
  agentConnection = v5->_agentConnection;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __55__MCCSecretAgentController_isModelReadyWithCompletion___block_invoke_2;
  v14[3] = &unk_2655BA988;
  id v9 = v7;
  id v15 = v9;
  id v10 = [(MCCSecretAgentConnection *)agentConnection remoteObjectProxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __55__MCCSecretAgentController_isModelReadyWithCompletion___block_invoke_26;
  v12[3] = &unk_2655BAA28;
  id v11 = v9;
  id v13 = v11;
  [v10 isModelReadyWithCompletion:v12];

  _Block_object_dispose(v19, 8);
}

void __55__MCCSecretAgentController_isModelReadyWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);
  }
}

void __55__MCCSecretAgentController_isModelReadyWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _MCCLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __59__MCCSecretAgentController_listCertificatesWithCompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __55__MCCSecretAgentController_isModelReadyWithCompletion___block_invoke_26(uint64_t a1, int a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5)
  {
    id v6 = _MCCLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67109378;
      v7[1] = a2;
      __int16 v8 = 2114;
      id v9 = v5;
      _os_log_impl(&dword_262BBA000, v6, OS_LOG_TYPE_DEFAULT, "Remote secret agent listCertificates call results %d with error: %{public}@", (uint8_t *)v7, 0x12u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)invokeModelDownloadWithCompletion:(id)a3
{
  id v4 = a3;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy_;
  void v19[4] = __Block_byref_object_dispose_;
  id v5 = self;
  id v20 = v5;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __62__MCCSecretAgentController_invokeModelDownloadWithCompletion___block_invoke;
  v16[3] = &unk_2655BAA00;
  id v18 = v19;
  id v6 = v4;
  id v17 = v6;
  uint64_t v7 = (void *)MEMORY[0x263E5DC10](v16);
  agentConnection = v5->_agentConnection;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __62__MCCSecretAgentController_invokeModelDownloadWithCompletion___block_invoke_2;
  v14[3] = &unk_2655BA988;
  id v9 = v7;
  id v15 = v9;
  uint64_t v10 = [(MCCSecretAgentConnection *)agentConnection remoteObjectProxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __62__MCCSecretAgentController_invokeModelDownloadWithCompletion___block_invoke_27;
  v12[3] = &unk_2655BAA28;
  id v11 = v9;
  id v13 = v11;
  [v10 invokeModelDownloadWithCompletion:v12];

  _Block_object_dispose(v19, 8);
}

void __62__MCCSecretAgentController_invokeModelDownloadWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);
  }
}

void __62__MCCSecretAgentController_invokeModelDownloadWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _MCCLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __59__MCCSecretAgentController_listCertificatesWithCompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __62__MCCSecretAgentController_invokeModelDownloadWithCompletion___block_invoke_27(uint64_t a1, int a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5)
  {
    id v6 = _MCCLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67109378;
      v7[1] = a2;
      __int16 v8 = 2114;
      id v9 = v5;
      _os_log_impl(&dword_262BBA000, v6, OS_LOG_TYPE_DEFAULT, "Remote secret agent listCertificates call results %d with error: %{public}@", (uint8_t *)v7, 0x12u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)syncToWeb:(id)a3
{
  agentConnection = self->_agentConnection;
  id v4 = a3;
  id v5 = [(MCCSecretAgentConnection *)agentConnection remoteObjectProxyWithErrorHandler:&__block_literal_global_29];
  [v5 syncToWeb:v4];
}

void __38__MCCSecretAgentController_syncToWeb___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = _MCCLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __38__MCCSecretAgentController_syncToWeb___block_invoke_cold_1();
  }
}

- (void)getIABCategoryID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy_;
  void v21[4] = __Block_byref_object_dispose_;
  __int16 v8 = self;
  id v22 = v8;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __56__MCCSecretAgentController_getIABCategoryID_completion___block_invoke;
  v18[3] = &unk_2655BAB30;
  id v20 = v21;
  id v9 = v7;
  id v19 = v9;
  uint64_t v10 = (void *)MEMORY[0x263E5DC10](v18);
  agentConnection = v8->_agentConnection;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __56__MCCSecretAgentController_getIABCategoryID_completion___block_invoke_2;
  v16[3] = &unk_2655BA988;
  id v12 = v10;
  id v17 = v12;
  id v13 = [(MCCSecretAgentConnection *)agentConnection synchronousRemoteObjectProxyWithErrorHandler:v16];
  if (v13)
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __56__MCCSecretAgentController_getIABCategoryID_completion___block_invoke_31;
    v14[3] = &unk_2655BAB58;
    id v15 = v12;
    [v13 getIABCategoryID:v6 completion:v14];
  }
  _Block_object_dispose(v21, 8);
}

void __56__MCCSecretAgentController_getIABCategoryID_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);
  }
}

void __56__MCCSecretAgentController_getIABCategoryID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _MCCLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __56__MCCSecretAgentController_getIABCategoryID_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __56__MCCSecretAgentController_getIABCategoryID_completion___block_invoke_31(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = _MCCLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __56__MCCSecretAgentController_getIABCategoryID_completion___block_invoke_31_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)isPersonalDomain:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy_;
  void v21[4] = __Block_byref_object_dispose_;
  id v8 = self;
  id v22 = v8;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __56__MCCSecretAgentController_isPersonalDomain_completion___block_invoke;
  v18[3] = &unk_2655BAA00;
  id v20 = v21;
  id v9 = v7;
  id v19 = v9;
  uint64_t v10 = (void *)MEMORY[0x263E5DC10](v18);
  agentConnection = v8->_agentConnection;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __56__MCCSecretAgentController_isPersonalDomain_completion___block_invoke_2;
  v16[3] = &unk_2655BA988;
  id v12 = v10;
  id v17 = v12;
  id v13 = [(MCCSecretAgentConnection *)agentConnection remoteObjectProxyWithErrorHandler:v16];
  if (v13)
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __56__MCCSecretAgentController_isPersonalDomain_completion___block_invoke_32;
    v14[3] = &unk_2655BAA28;
    id v15 = v12;
    [v13 isPersonalDomain:v6 completion:v14];
  }
  _Block_object_dispose(v21, 8);
}

void __56__MCCSecretAgentController_isPersonalDomain_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);
  }
}

void __56__MCCSecretAgentController_isPersonalDomain_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _MCCLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __56__MCCSecretAgentController_isPersonalDomain_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __56__MCCSecretAgentController_isPersonalDomain_completion___block_invoke_32(uint64_t a1, int a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5)
  {
    id v6 = _MCCLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67109378;
      v7[1] = a2;
      __int16 v8 = 2114;
      id v9 = v5;
      _os_log_impl(&dword_262BBA000, v6, OS_LOG_TYPE_DEFAULT, "Remote secret agent isPersonalDomain call results %d with error: %{public}@", (uint8_t *)v7, 0x12u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getBlackPearlVersionWithCompletion:(id)a3
{
  id v4 = a3;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy_;
  void v19[4] = __Block_byref_object_dispose_;
  id v5 = self;
  id v20 = v5;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __63__MCCSecretAgentController_getBlackPearlVersionWithCompletion___block_invoke;
  v16[3] = &unk_2655BAAA0;
  id v18 = v19;
  id v6 = v4;
  id v17 = v6;
  uint64_t v7 = (void *)MEMORY[0x263E5DC10](v16);
  agentConnection = v5->_agentConnection;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __63__MCCSecretAgentController_getBlackPearlVersionWithCompletion___block_invoke_2;
  v14[3] = &unk_2655BA988;
  id v9 = v7;
  id v15 = v9;
  uint64_t v10 = [(MCCSecretAgentConnection *)agentConnection synchronousRemoteObjectProxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __63__MCCSecretAgentController_getBlackPearlVersionWithCompletion___block_invoke_33;
  v12[3] = &unk_2655BAAC8;
  id v11 = v9;
  id v13 = v11;
  [v10 getBlackPearlVersionWithCompletion:v12];

  _Block_object_dispose(v19, 8);
}

void __63__MCCSecretAgentController_getBlackPearlVersionWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v9, v5);
  }
}

void __63__MCCSecretAgentController_getBlackPearlVersionWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _MCCLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __63__MCCSecretAgentController_getBlackPearlVersionWithCompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __63__MCCSecretAgentController_getBlackPearlVersionWithCompletion___block_invoke_33(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    uint64_t v7 = _MCCLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __63__MCCSecretAgentController_getBlackPearlVersionWithCompletion___block_invoke_33_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)pingWithcompletion:(id)a3
{
  id v4 = a3;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy_;
  void v19[4] = __Block_byref_object_dispose_;
  id v5 = self;
  id v20 = v5;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __47__MCCSecretAgentController_pingWithcompletion___block_invoke;
  v16[3] = &unk_2655BAA00;
  id v18 = v19;
  id v6 = v4;
  id v17 = v6;
  uint64_t v7 = (void *)MEMORY[0x263E5DC10](v16);
  agentConnection = v5->_agentConnection;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __47__MCCSecretAgentController_pingWithcompletion___block_invoke_2;
  v14[3] = &unk_2655BA988;
  id v9 = v7;
  id v15 = v9;
  uint64_t v10 = [(MCCSecretAgentConnection *)agentConnection synchronousRemoteObjectProxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __47__MCCSecretAgentController_pingWithcompletion___block_invoke_34;
  v12[3] = &unk_2655BAA28;
  id v11 = v9;
  id v13 = v11;
  [v10 pingWithcompletion:v12];

  _Block_object_dispose(v19, 8);
}

void __47__MCCSecretAgentController_pingWithcompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);
  }
}

void __47__MCCSecretAgentController_pingWithcompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _MCCLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __47__MCCSecretAgentController_pingWithcompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __47__MCCSecretAgentController_pingWithcompletion___block_invoke_34(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = _MCCLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138543362;
      id v7 = v4;
      _os_log_impl(&dword_262BBA000, v5, OS_LOG_TYPE_DEFAULT, "Remote secret agent ping gave error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)clearAllUserOverridesWithTimestamp:(double)a3 completion:(id)a4
{
  id v6 = a4;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy_;
  void v21[4] = __Block_byref_object_dispose_;
  id v7 = self;
  id v22 = v7;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __74__MCCSecretAgentController_clearAllUserOverridesWithTimestamp_completion___block_invoke;
  v18[3] = &unk_2655BAA00;
  id v20 = v21;
  id v8 = v6;
  id v19 = v8;
  id v9 = (void *)MEMORY[0x263E5DC10](v18);
  agentConnection = v7->_agentConnection;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __74__MCCSecretAgentController_clearAllUserOverridesWithTimestamp_completion___block_invoke_2;
  v16[3] = &unk_2655BA988;
  id v11 = v9;
  id v17 = v11;
  id v12 = [(MCCSecretAgentConnection *)agentConnection remoteObjectProxyWithErrorHandler:v16];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __74__MCCSecretAgentController_clearAllUserOverridesWithTimestamp_completion___block_invoke_35;
  v14[3] = &unk_2655BAA28;
  id v13 = v11;
  id v15 = v13;
  [v12 clearAllUserOverridesWithTimestamp:v14 completion:a3];

  _Block_object_dispose(v21, 8);
}

void __74__MCCSecretAgentController_clearAllUserOverridesWithTimestamp_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);
  }
}

void __74__MCCSecretAgentController_clearAllUserOverridesWithTimestamp_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _MCCLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __74__MCCSecretAgentController_clearAllUserOverridesWithTimestamp_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __74__MCCSecretAgentController_clearAllUserOverridesWithTimestamp_completion___block_invoke_35(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = _MCCLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __74__MCCSecretAgentController_clearAllUserOverridesWithTimestamp_completion___block_invoke_35_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackListener, 0);
  objc_storeStrong((id *)&self->_agentConnection, 0);
}

void __70__MCCSecretAgentController_generateCertificateWithContext_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_262BBA000, v0, v1, "Initiation of remote secret agent service to generate cert returned an error: %{public}@", v2, v3, v4, v5, v6);
}

void __59__MCCSecretAgentController_listCertificatesWithCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_262BBA000, v0, v1, "Initiation of remote secret agent service to list certificates returned an error: %{public}@", v2, v3, v4, v5, v6);
}

void __64__MCCSecretAgentController_listCertificatesForEmail_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_262BBA000, v0, v1, "Initiation of remote secret agent service to list certificates for Email returned an error: %{public}@", v2, v3, v4, v5, v6);
}

void __86__MCCSecretAgentController_fetchSigningAndEncryptingStatusForEmailAddress_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_262BBA000, v0, v1, "Initiation of remote secret agent service to fetch SigningAndEncrypting Status returned an error: %{public}@", v2, v3, v4, v5, v6);
}

void __86__MCCSecretAgentController_fetchSigningAndEncryptingStatusForEmailAddress_completion___block_invoke_6_cold_1(char a1, uint64_t a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 67109378;
  v3[1] = a1 & 1;
  __int16 v4 = 2114;
  uint64_t v5 = a2;
  _os_log_error_impl(&dword_262BBA000, log, OS_LOG_TYPE_ERROR, "Remote secret agent fetchSigningAndEncryptingStatusForEmailAddress results %d with error: %{public}@", (uint8_t *)v3, 0x12u);
}

void __93__MCCSecretAgentController_fetchSigningAndEncrytionMessagesStatusForEmailAddress_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_262BBA000, v0, v1, "Initiation of remote secret agent service to fetch Sign and Encrypt Status returned an error: %{public}@", v2, v3, v4, v5, v6);
}

void __93__MCCSecretAgentController_fetchSigningAndEncrytionMessagesStatusForEmailAddress_completion___block_invoke_8_cold_1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_262BBA000, v1, OS_LOG_TYPE_ERROR, "Remote secret agent fetch Sign and Encrypt messages status call results %@ with error: %{public}@", v2, 0x16u);
}

void __75__MCCSecretAgentController_setEncryptIsEnabled_forEmailAddress_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_262BBA000, v0, v1, "Initiation of remote secret agent service to set encryption status returned an error: %{public}@", v2, v3, v4, v5, v6);
}

void __75__MCCSecretAgentController_setEncryptIsEnabled_forEmailAddress_completion___block_invoke_9_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_262BBA000, v0, v1, "Remote secret agent setEncryptisEnabled call with error: %{public}@", v2, v3, v4, v5, v6);
}

void __72__MCCSecretAgentController_setSignIsEnabled_forEmailAddress_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_262BBA000, v0, v1, "Initiation of remote secret agent service to set signing status returned an error: %{public}@", v2, v3, v4, v5, v6);
}

void __72__MCCSecretAgentController_setSignIsEnabled_forEmailAddress_completion___block_invoke_10_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_262BBA000, v0, v1, "Remote secret agent setSignIsEnabled call with error: %{public}@", v2, v3, v4, v5, v6);
}

void __86__MCCSecretAgentController_setSigningAndEncrytingStatusTo_forEmailAddress_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_262BBA000, v0, v1, "Initiation of remote secret agent service to set SigningAndEncrypting status returned an error: %{public}@", v2, v3, v4, v5, v6);
}

void __86__MCCSecretAgentController_setSigningAndEncrytingStatusTo_forEmailAddress_completion___block_invoke_11_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_262BBA000, v0, v1, "Remote secret agent setSigningAndEncrytingStatusTo call with error: %{public}@", v2, v3, v4, v5, v6);
}

void __89__MCCSecretAgentController_updateCertificateDefaultsForEmailAddress_certInfo_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_262BBA000, v0, v1, "Initiation of remote secret agent service to update user defaults with certificates returned an error: %{public}@", v2, v3, v4, v5, v6);
}

void __89__MCCSecretAgentController_updateCertificateDefaultsForEmailAddress_certInfo_completion___block_invoke_12_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_262BBA000, v0, v1, "Remote secret agent updateCertificateDefaults call with error: %{public}@", v2, v3, v4, v5, v6);
}

void __76__MCCSecretAgentController_refreshCertificateWithContext_certId_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_262BBA000, v0, v1, "RefreshCertificate Initiation of remote secret agent service to refresh certificate returned an error: %{public}@", v2, v3, v4, v5, v6);
}

void __76__MCCSecretAgentController_refreshCertificateWithContext_certId_completion___block_invoke_13_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_262BBA000, v0, v1, "RefreshCertificate Remote secret agent refreshCertificate call with error: %{public}@", v2, v3, v4, v5, v6);
}

void __71__MCCSecretAgentController_predictCommerceEmailWithContext_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_262BBA000, v0, v1, "Predict commercial email: Initiation of remote secret agent service to predice commerce email returned an error: %{public}@", v2, v3, v4, v5, v6);
}

void __71__MCCSecretAgentController_predictCommerceEmailWithContext_completion___block_invoke_15_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_262BBA000, v0, v1, "Remote secret agent predict commerce call with error: %{public}@", v2, v3, v4, v5, v6);
}

void __57__MCCSecretAgentController_registerCategoryRulesCallback__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_262BBA000, v0, v1, "Remote secret agent register for rules callback with error: %{public}@", v2, v3, v4, v5, v6);
}

void __77__MCCSecretAgentController_registerCategoryRulesCallbackListener_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_262BBA000, v0, v1, "Failed to register rules callback with error: %{public}@", v2, v3, v4, v5, v6);
}

void __77__MCCSecretAgentController_registerCategoryRulesCallbackListener_completion___block_invoke_16_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_262BBA000, v0, v1, "Remote register-rules callback listener with error: %{public}@", v2, v3, v4, v5, v6);
}

void __65__MCCSecretAgentController_syncRecategorizationRules_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_262BBA000, v0, v1, "Failed to add recategorization sync-rule with error: %{public}@", v2, v3, v4, v5, v6);
}

void __65__MCCSecretAgentController_syncRecategorizationRules_completion___block_invoke_17_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_262BBA000, v0, v1, "Remote recategorization sync-rule with error: %{public}@", v2, v3, v4, v5, v6);
}

- (void)createWebRule:(os_log_t)log completion:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_262BBA000, log, OS_LOG_TYPE_ERROR, "Incorrect class presented to rule-create", v1, 2u);
}

void __53__MCCSecretAgentController_createWebRule_completion___block_invoke_22_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_262BBA000, v0, v1, "Failed to add web rule with error: %{public}@", v2, v3, v4, v5, v6);
}

void __53__MCCSecretAgentController_createWebRule_completion___block_invoke_23_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_262BBA000, v0, v1, "Remote add web rule with error: %{public}@", v2, v3, v4, v5, v6);
}

void __53__MCCSecretAgentController_notifyWebRule_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_262BBA000, v0, v1, "Failed to notify web rule with error: %{public}@", v2, v3, v4, v5, v6);
}

void __53__MCCSecretAgentController_notifyWebRule_completion___block_invoke_24_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_262BBA000, v0, v1, "Remote notify web rule with error: %{public}@", v2, v3, v4, v5, v6);
}

void __64__MCCSecretAgentController_sendPendingRulesWithType_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_262BBA000, v0, v1, "Failed to send pending rules with error: %{public}@", v2, v3, v4, v5, v6);
}

void __64__MCCSecretAgentController_sendPendingRulesWithType_completion___block_invoke_25_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_262BBA000, v0, v1, "Remote send pending rules error: %{public}@", v2, v3, v4, v5, v6);
}

void __38__MCCSecretAgentController_syncToWeb___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_262BBA000, v0, v1, "Initiation of remote secret agent service to sync recategorization rules returned an error: %{public}@", v2, v3, v4, v5, v6);
}

void __56__MCCSecretAgentController_getIABCategoryID_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_262BBA000, v0, v1, "Get IAB category domain: Initiation of remote secret agent service getIABCategoryID returned an error: %{public}@", v2, v3, v4, v5, v6);
}

void __56__MCCSecretAgentController_getIABCategoryID_completion___block_invoke_31_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_262BBA000, v0, v1, "Remote secret agent get IAB category call with error: %{public}@", v2, v3, v4, v5, v6);
}

void __56__MCCSecretAgentController_isPersonalDomain_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_262BBA000, v0, v1, "Initiation of remote secret agent service to check is personal domain returned an error: %{public}@", v2, v3, v4, v5, v6);
}

void __63__MCCSecretAgentController_getBlackPearlVersionWithCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_262BBA000, v0, v1, "Predict commercial email: Initiation of remote secret agent service to predice commerce email returned an error: %{public}@", v2, v3, v4, v5, v6);
}

void __63__MCCSecretAgentController_getBlackPearlVersionWithCompletion___block_invoke_33_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_262BBA000, v0, v1, "Remote secret agent get blackpearl version call with error: %{public}@", v2, v3, v4, v5, v6);
}

void __47__MCCSecretAgentController_pingWithcompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_262BBA000, v0, v1, "Tried to ping, returned an error: %{public}@", v2, v3, v4, v5, v6);
}

void __74__MCCSecretAgentController_clearAllUserOverridesWithTimestamp_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_262BBA000, v0, v1, "Failed to clearAllUserOverrides with error: %{public}@", v2, v3, v4, v5, v6);
}

void __74__MCCSecretAgentController_clearAllUserOverridesWithTimestamp_completion___block_invoke_35_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_262BBA000, v0, v1, "Remote clearAllUserOverrides with error: %{public}@", v2, v3, v4, v5, v6);
}

@end