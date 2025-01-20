@interface SPPairingManager
- (FMXPCServiceDescription)serviceDescription;
- (FMXPCSession)session;
- (OS_dispatch_queue)queue;
- (SPPairingManager)init;
- (SPPairingManagerXPCProtocol)proxy;
- (id)remoteInterface;
- (void)allPairingErrorsWithCompletion:(id)a3;
- (void)alwaysBeaconWildStateWithCompletion:(id)a3;
- (void)currentBeaconingKeyWithCompletion:(id)a3;
- (void)dealloc;
- (void)finalizePairingWithSession:(id)a3 configuration:(id)a4 completion:(id)a5;
- (void)finalizePairingWithSession:(id)a3 name:(id)a4 roleId:(int64_t)a5 roleEmoji:(id)a6 keyStatus:(id)a7 collaborativeKey:(id)a8 signature:(id)a9 completion:(id)a10;
- (void)getLocalPairingDataWithCompletion:(id)a3;
- (void)getOfflineFindingInfoWithCurrentData:(id)a3 completion:(id)a4;
- (void)initiatePairingSessionWithCompletion:(id)a3;
- (void)invalidatePairingSession:(id)a3 completion:(id)a4;
- (void)setAlwaysBeaconWildState:(BOOL)a3 completion:(id)a4;
- (void)setProxy:(id)a3;
- (void)setQueue:(id)a3;
- (void)setServiceDescription:(id)a3;
- (void)setSession:(id)a3;
- (void)unpairUUID:(id)a3 force:(BOOL)a4 completion:(id)a5;
- (void)verifyPairingWithPairingSession:(id)a3 signature:(id)a4 attestation:(id)a5 systemPublicKey:(id)a6 refKeyPublicKey:(id)a7 systemVersion:(id)a8 vendorId:(int64_t)a9 productId:(int64_t)a10 ecid:(id)a11 chipId:(id)a12 serialNumber:(id)a13 collaborativeKey:(id)a14 completion:(id)a15;
@end

@implementation SPPairingManager

- (SPPairingManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)SPPairingManager;
  v2 = [(SPPairingManager *)&v11 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.icloud.searchpartyd.pairingmanager", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    id v6 = objc_alloc(MEMORY[0x1E4F61588]);
    v7 = [(SPPairingManager *)v2 remoteInterface];
    uint64_t v8 = [v6 initWithMachServiceName:@"com.apple.icloud.searchpartyd.pairingmanager" options:0 remoteObjectInterface:v7 interruptionHandler:0 invalidationHandler:0];
    serviceDescription = v2->_serviceDescription;
    v2->_serviceDescription = (FMXPCServiceDescription *)v8;
  }
  return v2;
}

- (void)dealloc
{
  v3 = [(SPPairingManager *)self session];
  [v3 invalidate];

  [(SPPairingManager *)self setSession:0];
  v4.receiver = self;
  v4.super_class = (Class)SPPairingManager;
  [(SPPairingManager *)&v4 dealloc];
}

- (SPPairingManagerXPCProtocol)proxy
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [(SPPairingManager *)self queue];
  dispatch_assert_queue_V2(v3);

  objc_super v4 = [(SPPairingManager *)self session];

  if (!v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F61590]);
    id v6 = [(SPPairingManager *)self serviceDescription];
    v7 = (void *)[v5 initWithServiceDescription:v6];
    [(SPPairingManager *)self setSession:v7];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [(SPPairingManager *)self serviceDescription];
      v9 = [v8 machService];
      int v14 = 138412290;
      v15 = v9;
      _os_log_impl(&dword_1B2FD8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "SPPairingManager: Establishing XPC connection to %@", (uint8_t *)&v14, 0xCu);
    }
    v10 = [(SPPairingManager *)self session];
    [v10 resume];
  }
  objc_super v11 = [(SPPairingManager *)self session];
  v12 = [v11 proxy];

  return (SPPairingManagerXPCProtocol *)v12;
}

- (id)remoteInterface
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0B44170];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  objc_super v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
  id v5 = [v3 setWithArray:v4];
  [v2 setClasses:v5 forSelector:sel_allPairingErrorsWithCompletion_ argumentIndex:0 ofReply:1];

  return v2;
}

- (void)initiatePairingSessionWithCompletion:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    objc_super v11 = "-[SPPairingManager initiatePairingSessionWithCompletion:]";
    _os_log_impl(&dword_1B2FD8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "SPPairingManager: %{public}s", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  id v5 = [(SPPairingManager *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__SPPairingManager_initiatePairingSessionWithCompletion___block_invoke;
  void v7[3] = &unk_1E601C338;
  objc_copyWeak(&v9, (id *)buf);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

void __57__SPPairingManager_initiatePairingSessionWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = [WeakRetained userAgentProxy];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__SPPairingManager_initiatePairingSessionWithCompletion___block_invoke_2;
  v4[3] = &unk_1E601C310;
  id v5 = *(id *)(a1 + 32);
  [v3 initiatePairingSessionWithCompletion:v4];
}

void __57__SPPairingManager_initiatePairingSessionWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    v7 = [v5 identifier];
    int v8 = 138543362;
    id v9 = v7;
    _os_log_impl(&dword_1B2FD8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "SPPairingManager: Got pairing session with id - %{public}@", (uint8_t *)&v8, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)invalidatePairingSession:(id)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    uint64_t v16 = "-[SPPairingManager invalidatePairingSession:completion:]";
    _os_log_impl(&dword_1B2FD8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "SPPairingManager: %{public}s", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  int v8 = [(SPPairingManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__SPPairingManager_invalidatePairingSession_completion___block_invoke;
  block[3] = &unk_1E601B850;
  objc_copyWeak(&v14, (id *)buf);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

void __56__SPPairingManager_invalidatePairingSession_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = [WeakRetained userAgentProxy];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__SPPairingManager_invalidatePairingSession_completion___block_invoke_2;
  v5[3] = &unk_1E601B800;
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  [v3 invalidatePairingSession:v4 completion:v5];
}

void __56__SPPairingManager_invalidatePairingSession_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    id v5 = v3;
    _os_log_impl(&dword_1B2FD8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "SPPairingManager: Error invalidating pairing session - %{public}@", (uint8_t *)&v4, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)verifyPairingWithPairingSession:(id)a3 signature:(id)a4 attestation:(id)a5 systemPublicKey:(id)a6 refKeyPublicKey:(id)a7 systemVersion:(id)a8 vendorId:(int64_t)a9 productId:(int64_t)a10 ecid:(id)a11 chipId:(id)a12 serialNumber:(id)a13 collaborativeKey:(id)a14 completion:(id)a15
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  id v22 = a4;
  id v37 = a5;
  id v36 = a6;
  id v35 = a7;
  id v34 = a8;
  v23 = v22;
  id v33 = a11;
  v24 = self;
  id v25 = a12;
  id v26 = a13;
  id v27 = a14;
  id v28 = a15;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    v29 = [v21 identifier];
    *(_DWORD *)buf = 136446466;
    v43 = "-[SPPairingManager verifyPairingWithPairingSession:signature:attestation:systemPublicKey:refKeyPublicKey:syste"
          "mVersion:vendorId:productId:ecid:chipId:serialNumber:collaborativeKey:completion:]";
    __int16 v44 = 2114;
    v45 = v29;
    _os_log_impl(&dword_1B2FD8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "SPPairingManager: %{public}s, with session - %{public}@", buf, 0x16u);
  }
  objc_msgSend(v21, "setPayloadSignature:", v23, a14);
  [v21 setAttestation:v37];
  [v21 setSystemPublicKey:v36];
  [v21 setRefKeyPublicKey:v35];
  [v21 setCollaborativeKeyC1:v27];
  [v21 setSystemVersion:v34];
  [v21 setVendorId:a9];
  [v21 setProductId:a10];
  [v21 setEcid:v33];
  [v21 setChipId:v25];
  [v21 setSerialNumber:v26];
  objc_initWeak((id *)buf, v24);
  v30 = [(SPPairingManager *)v24 queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __192__SPPairingManager_verifyPairingWithPairingSession_signature_attestation_systemPublicKey_refKeyPublicKey_systemVersion_vendorId_productId_ecid_chipId_serialNumber_collaborativeKey_completion___block_invoke;
  block[3] = &unk_1E601B850;
  objc_copyWeak(&v41, (id *)buf);
  id v39 = v21;
  id v40 = v28;
  id v31 = v28;
  id v32 = v21;
  dispatch_async(v30, block);

  objc_destroyWeak(&v41);
  objc_destroyWeak((id *)buf);
}

void __192__SPPairingManager_verifyPairingWithPairingSession_signature_attestation_systemPublicKey_refKeyPublicKey_systemVersion_vendorId_productId_ecid_chipId_serialNumber_collaborativeKey_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = [WeakRetained userAgentProxy];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __192__SPPairingManager_verifyPairingWithPairingSession_signature_attestation_systemPublicKey_refKeyPublicKey_systemVersion_vendorId_productId_ecid_chipId_serialNumber_collaborativeKey_completion___block_invoke_2;
  v5[3] = &unk_1E601C310;
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  [v3 verifyPairingInfoUsing:v4 completion:v5];
}

uint64_t __192__SPPairingManager_verifyPairingWithPairingSession_signature_attestation_systemPublicKey_refKeyPublicKey_systemVersion_vendorId_productId_ecid_chipId_serialNumber_collaborativeKey_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)finalizePairingWithSession:(id)a3 name:(id)a4 roleId:(int64_t)a5 roleEmoji:(id)a6 keyStatus:(id)a7 collaborativeKey:(id)a8 signature:(id)a9 completion:(id)a10
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    v23 = [v16 identifier];
    *(_DWORD *)buf = 136446466;
    id v32 = "-[SPPairingManager finalizePairingWithSession:name:roleId:roleEmoji:keyStatus:collaborativeKey:signature:completion:]";
    __int16 v33 = 2114;
    id v34 = v23;
    _os_log_impl(&dword_1B2FD8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "@DEPRECATED SPPairingManager: %{public}s, with session - %{public}@", buf, 0x16u);
  }
  [v16 setKeyGenerationStatus:v19];
  [v16 setCollaborativeKeyC3:v20];
  [v16 setConfirmSignature:v21];
  [v16 updateName:v17 roleId:a5 roleEmoji:v18];
  objc_initWeak((id *)buf, self);
  v24 = [(SPPairingManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __117__SPPairingManager_finalizePairingWithSession_name_roleId_roleEmoji_keyStatus_collaborativeKey_signature_completion___block_invoke;
  block[3] = &unk_1E601B850;
  objc_copyWeak(&v30, (id *)buf);
  id v28 = v16;
  id v29 = v22;
  id v25 = v22;
  id v26 = v16;
  dispatch_async(v24, block);

  objc_destroyWeak(&v30);
  objc_destroyWeak((id *)buf);
}

void __117__SPPairingManager_finalizePairingWithSession_name_roleId_roleEmoji_keyStatus_collaborativeKey_signature_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = [WeakRetained userAgentProxy];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __117__SPPairingManager_finalizePairingWithSession_name_roleId_roleEmoji_keyStatus_collaborativeKey_signature_completion___block_invoke_2;
  v5[3] = &unk_1E601C310;
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  [v3 finalizePairingUsing:v4 completion:v5];
}

uint64_t __117__SPPairingManager_finalizePairingWithSession_name_roleId_roleEmoji_keyStatus_collaborativeKey_signature_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)finalizePairingWithSession:(id)a3 configuration:(id)a4 completion:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    objc_super v11 = [v8 identifier];
    *(_DWORD *)buf = 136446466;
    id v20 = "-[SPPairingManager finalizePairingWithSession:configuration:completion:]";
    __int16 v21 = 2114;
    id v22 = v11;
    _os_log_impl(&dword_1B2FD8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "SPPairingManager: %{public}s, with session - %{public}@", buf, 0x16u);
  }
  [v8 updateWithConfiguration:v9];
  objc_initWeak((id *)buf, self);
  id v12 = [(SPPairingManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__SPPairingManager_finalizePairingWithSession_configuration_completion___block_invoke;
  block[3] = &unk_1E601B850;
  objc_copyWeak(&v18, (id *)buf);
  id v16 = v8;
  id v17 = v10;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(v12, block);

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);
}

void __72__SPPairingManager_finalizePairingWithSession_configuration_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = [WeakRetained userAgentProxy];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __72__SPPairingManager_finalizePairingWithSession_configuration_completion___block_invoke_2;
  v5[3] = &unk_1E601C310;
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  [v3 finalizePairingUsing:v4 completion:v5];
}

uint64_t __72__SPPairingManager_finalizePairingWithSession_configuration_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)unpairUUID:(id)a3 force:(BOOL)a4 completion:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    id v19 = "-[SPPairingManager unpairUUID:force:completion:]";
    _os_log_impl(&dword_1B2FD8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "SPPairingManager: %{public}s", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  id v10 = [(SPPairingManager *)self queue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __48__SPPairingManager_unpairUUID_force_completion___block_invoke;
  v13[3] = &unk_1E601C360;
  objc_copyWeak(&v16, (id *)buf);
  BOOL v17 = a4;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);
}

void __48__SPPairingManager_unpairUUID_force_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = [WeakRetained userAgentProxy];
  uint64_t v4 = *(unsigned __int8 *)(a1 + 56);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__SPPairingManager_unpairUUID_force_completion___block_invoke_2;
  v6[3] = &unk_1E601B800;
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  [v3 unpairUUID:v5 force:v4 completion:v6];
}

void __48__SPPairingManager_unpairUUID_force_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v3;
    _os_log_impl(&dword_1B2FD8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "SPPairingManager: unpair completed. Error - %@", (uint8_t *)&v4, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getLocalPairingDataWithCompletion:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    id v11 = "-[SPPairingManager getLocalPairingDataWithCompletion:]";
    _os_log_impl(&dword_1B2FD8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "SPPairingManager: %{public}s", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  id v5 = [(SPPairingManager *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__SPPairingManager_getLocalPairingDataWithCompletion___block_invoke;
  void v7[3] = &unk_1E601C338;
  objc_copyWeak(&v9, (id *)buf);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

void __54__SPPairingManager_getLocalPairingDataWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained proxy];
  [v2 getLocalPairingDataWithCompletion:*(void *)(a1 + 32)];
}

- (void)currentBeaconingKeyWithCompletion:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    id v11 = "-[SPPairingManager currentBeaconingKeyWithCompletion:]";
    _os_log_impl(&dword_1B2FD8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "SPPairingManager: %{public}s", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  id v5 = [(SPPairingManager *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__SPPairingManager_currentBeaconingKeyWithCompletion___block_invoke;
  void v7[3] = &unk_1E601C338;
  objc_copyWeak(&v9, (id *)buf);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

void __54__SPPairingManager_currentBeaconingKeyWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained proxy];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__SPPairingManager_currentBeaconingKeyWithCompletion___block_invoke_2;
  v4[3] = &unk_1E601C388;
  id v5 = *(id *)(a1 + 32);
  [v3 currentBeaconingKeyWithCompletion:v4];
}

uint64_t __54__SPPairingManager_currentBeaconingKeyWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)allPairingErrorsWithCompletion:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    id v11 = "-[SPPairingManager allPairingErrorsWithCompletion:]";
    _os_log_impl(&dword_1B2FD8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "SPPairingManager: %{public}s", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  id v5 = [(SPPairingManager *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__SPPairingManager_allPairingErrorsWithCompletion___block_invoke;
  void v7[3] = &unk_1E601C338;
  objc_copyWeak(&v9, (id *)buf);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

void __51__SPPairingManager_allPairingErrorsWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained proxy];
  [v2 allPairingErrorsWithCompletion:*(void *)(a1 + 32)];
}

- (void)setAlwaysBeaconWildState:(BOOL)a3 completion:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    id v13 = "-[SPPairingManager setAlwaysBeaconWildState:completion:]";
    _os_log_impl(&dword_1B2FD8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "SPPairingManager: %{public}s", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__SPPairingManager_setAlwaysBeaconWildState_completion___block_invoke;
  v8[3] = &unk_1E601C3D8;
  v8[4] = self;
  objc_copyWeak(&v10, (id *)buf);
  BOOL v11 = a3;
  id v9 = v6;
  id v7 = v6;
  _os_activity_initiate(&dword_1B2FD8000, "SPPairingManager setAlwaysBeaconWildState:completion:", OS_ACTIVITY_FLAG_DEFAULT, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

void __56__SPPairingManager_setAlwaysBeaconWildState_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__SPPairingManager_setAlwaysBeaconWildState_completion___block_invoke_2;
  block[3] = &unk_1E601C3B0;
  objc_copyWeak(&v5, (id *)(a1 + 48));
  char v6 = *(unsigned char *)(a1 + 56);
  id v4 = *(id *)(a1 + 40);
  dispatch_async(v2, block);

  objc_destroyWeak(&v5);
}

void __56__SPPairingManager_setAlwaysBeaconWildState_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained proxy];
  [v2 setAlwaysBeaconWildState:*(unsigned __int8 *)(a1 + 48) completion:*(void *)(a1 + 32)];
}

- (void)alwaysBeaconWildStateWithCompletion:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    id v10 = "-[SPPairingManager alwaysBeaconWildStateWithCompletion:]";
    _os_log_impl(&dword_1B2FD8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "SPPairingManager: %{public}s", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __56__SPPairingManager_alwaysBeaconWildStateWithCompletion___block_invoke;
  activity_block[3] = &unk_1E601C400;
  activity_void block[4] = self;
  objc_copyWeak(&v8, (id *)buf);
  id v7 = v4;
  id v5 = v4;
  _os_activity_initiate(&dword_1B2FD8000, "SPPairingManager alwaysBeaconWildStateWithCompletion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

void __56__SPPairingManager_alwaysBeaconWildStateWithCompletion___block_invoke(id *a1)
{
  v2 = [a1[4] queue];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __56__SPPairingManager_alwaysBeaconWildStateWithCompletion___block_invoke_2;
  v3[3] = &unk_1E601C338;
  objc_copyWeak(&v5, a1 + 6);
  id v4 = a1[5];
  dispatch_async(v2, v3);

  objc_destroyWeak(&v5);
}

void __56__SPPairingManager_alwaysBeaconWildStateWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained proxy];
  [v2 alwaysBeaconWildStateWithCompletion:*(void *)(a1 + 32)];
}

- (void)getOfflineFindingInfoWithCurrentData:(id)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    id v16 = "-[SPPairingManager getOfflineFindingInfoWithCurrentData:completion:]";
    _os_log_impl(&dword_1B2FD8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "SPPairingManager: %{public}s", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  id v8 = [(SPPairingManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__SPPairingManager_getOfflineFindingInfoWithCurrentData_completion___block_invoke;
  block[3] = &unk_1E601B850;
  objc_copyWeak(&v14, (id *)buf);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

void __68__SPPairingManager_getOfflineFindingInfoWithCurrentData_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = [WeakRetained proxy];
  [v2 getOfflineFindingInfoWithCurrentData:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (FMXPCServiceDescription)serviceDescription
{
  return self->_serviceDescription;
}

- (void)setServiceDescription:(id)a3
{
}

- (FMXPCSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (void)setProxy:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_session, 0);

  objc_storeStrong((id *)&self->_serviceDescription, 0);
}

@end