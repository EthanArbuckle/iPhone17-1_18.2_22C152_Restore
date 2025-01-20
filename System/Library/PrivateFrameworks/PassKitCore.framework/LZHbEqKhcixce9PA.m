@interface LZHbEqKhcixce9PA
+ (id)sharedInstance;
- (BOOL)l7UrdRfCzeduYqtA:(id)a3;
- (LZHbEqKhcixce9PA)initWithServiceName:(id)a3;
- (id)BFzukpKGO3cStNGp:(id)a3;
- (void)JI0A3nkqsab9cUj8:(id)a3 completion:(id)a4;
- (void)QeMnG23X94qgz7jT:(id)a3 hostChallenge:(id)a4 challengeResponse:(id)a5 seid:(id)a6 nonce:(id)a7 completion:(id)a8;
- (void)Z8aAH7stm0EYhyxg:(id)a3 xz5EHXEN4FjlhJbi:(id)a4 uhVTXyAfCFn7u0Ue:(id)a5 EQUjQp7JcQbqcPcD:(id)a6 A5wDLa5TFdFZlz3A:(id)a7 TJKMyOe6zn5PdGIr:(id)a8 eCqgGM0WcnHOslnr:(unint64_t)a9 eCszfxdv3kUXvhgV:(unint64_t)a10 uWp4aZpP2vLhc04Q:(id)a11 QZYtNpvp0hKd248p:(id)a12 oCwPYmtRv8s31KUH:(id)a13 completion:(id)a14;
- (void)ZfE6lVphNUVrZcKx:(id)a3 completion:(id)a4;
- (void)evrtH713YbFfEOzk:(id)a3 completion:(id)a4;
- (void)llNEghuIdfPH7O8I:(BOOL)a3 all:(BOOL)a4 pregeneration:(BOOL)a5 workflowID:(id)a6 completion:(id)a7;
- (void)llNEghuIdfPH7O8I:(BOOL)a3 all:(BOOL)a4 workflowID:(id)a5 completion:(id)a6;
- (void)ofLBc0SV56ddaijH:(id)a3 i7D0Lridvo8oYoNd:(id)a4 completion:(id)a5;
- (void)uTtwJoGUgL3N0GVz;
- (void)updateRavioliWithCompletion:(id)a3;
- (void)vffg4lwI2HftPvpO:(id)a3;
@end

@implementation LZHbEqKhcixce9PA

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedInstance_reference;
  return v2;
}

void __34__LZHbEqKhcixce9PA_sharedInstance__block_invoke()
{
  v0 = [[LZHbEqKhcixce9PA alloc] initWithServiceName:@"com.apple.asd.scoring"];
  v1 = (void *)sharedInstance_reference;
  sharedInstance_reference = (uint64_t)v0;
}

- (LZHbEqKhcixce9PA)initWithServiceName:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)LZHbEqKhcixce9PA;
  v5 = [(LZHbEqKhcixce9PA *)&v20 init];
  if (v5)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    disconnectionCallbacks = v5->_disconnectionCallbacks;
    v5->_disconnectionCallbacks = v6;

    dispatch_queue_t v8 = dispatch_queue_create("com.apple.asd.interrupt", 0);
    syncQueue = v5->_syncQueue;
    v5->_syncQueue = (OS_dispatch_queue *)v8;

    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:v4 options:4096];
    connection = v5->_connection;
    v5->_connection = (NSXPCConnection *)v10;

    v12 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE2EA6E8];
    [(NSXPCConnection *)v5->_connection setRemoteObjectInterface:v12];

    objc_initWeak(&location, v5);
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    v16 = __40__LZHbEqKhcixce9PA_initWithServiceName___block_invoke;
    v17 = &unk_1E56D7E48;
    objc_copyWeak(&v18, &location);
    [(NSXPCConnection *)v5->_connection setInterruptionHandler:&v14];
    [(NSXPCConnection *)v5->_connection resume];
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v5;
}

void __40__LZHbEqKhcixce9PA_initWithServiceName___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained uTtwJoGUgL3N0GVz];
}

- (void)JI0A3nkqsab9cUj8:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_t v8 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_42];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__LZHbEqKhcixce9PA_JI0A3nkqsab9cUj8_completion___block_invoke_2;
  aBlock[3] = &unk_1E56D7E90;
  id v9 = v7;
  id v22 = v9;
  uint64_t v10 = _Block_copy(aBlock);
  v11 = [(LZHbEqKhcixce9PA *)self BFzukpKGO3cStNGp:v10];
  objc_initWeak(&location, self);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __48__LZHbEqKhcixce9PA_JI0A3nkqsab9cUj8_completion___block_invoke_3;
  v16[3] = &unk_1E56D7EB8;
  objc_copyWeak(&v19, &location);
  id v12 = v11;
  id v17 = v12;
  id v13 = v9;
  id v18 = v13;
  uint64_t v14 = _Block_copy(v16);
  uint64_t v15 = [v6 toDictionary];
  [v8 k0p7Rchr49btq6wB:v15 HY6FXG20397zwmVg:v14];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

uint64_t __48__LZHbEqKhcixce9PA_JI0A3nkqsab9cUj8_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __48__LZHbEqKhcixce9PA_JI0A3nkqsab9cUj8_completion___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v10 = a2;
  id v7 = a3;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ([WeakRetained l7UrdRfCzeduYqtA:*(void *)(a1 + 32)]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)QeMnG23X94qgz7jT:(id)a3 hostChallenge:(id)a4 challengeResponse:(id)a5 seid:(id)a6 nonce:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v26 = a4;
  id v15 = a5;
  id v25 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_45];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __91__LZHbEqKhcixce9PA_QeMnG23X94qgz7jT_hostChallenge_challengeResponse_seid_nonce_completion___block_invoke_2;
  aBlock[3] = &unk_1E56D7E90;
  id v19 = v17;
  id v33 = v19;
  objc_super v20 = _Block_copy(aBlock);
  v21 = [(LZHbEqKhcixce9PA *)self BFzukpKGO3cStNGp:v20];
  objc_initWeak(&location, self);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __91__LZHbEqKhcixce9PA_QeMnG23X94qgz7jT_hostChallenge_challengeResponse_seid_nonce_completion___block_invoke_3;
  v27[3] = &unk_1E56D7EE0;
  objc_copyWeak(&v30, &location);
  id v22 = v21;
  id v28 = v22;
  id v23 = v19;
  id v29 = v23;
  v24 = _Block_copy(v27);
  [v18 VE7BAlWGDSKrO5xc:v14 hostChallenge:v26 challengeResponse:v15 seid:v25 nonce:v16 HY6FXG20397zwmVg:v24];

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
}

uint64_t __91__LZHbEqKhcixce9PA_QeMnG23X94qgz7jT_hostChallenge_challengeResponse_seid_nonce_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __91__LZHbEqKhcixce9PA_QeMnG23X94qgz7jT_hostChallenge_challengeResponse_seid_nonce_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ([WeakRetained l7UrdRfCzeduYqtA:*(void *)(a1 + 32)]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)ZfE6lVphNUVrZcKx:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_48];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__LZHbEqKhcixce9PA_ZfE6lVphNUVrZcKx_completion___block_invoke_2;
  aBlock[3] = &unk_1E56D7E90;
  id v9 = v7;
  id v21 = v9;
  id v10 = _Block_copy(aBlock);
  v11 = [(LZHbEqKhcixce9PA *)self BFzukpKGO3cStNGp:v10];
  objc_initWeak(&location, self);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __48__LZHbEqKhcixce9PA_ZfE6lVphNUVrZcKx_completion___block_invoke_3;
  v15[3] = &unk_1E56D7F08;
  objc_copyWeak(&v18, &location);
  id v12 = v11;
  id v16 = v12;
  id v13 = v9;
  id v17 = v13;
  id v14 = _Block_copy(v15);
  [v8 f9MGfLOgnHPuKTrU:v6 HY6FXG20397zwmVg:v14];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

uint64_t __48__LZHbEqKhcixce9PA_ZfE6lVphNUVrZcKx_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __48__LZHbEqKhcixce9PA_ZfE6lVphNUVrZcKx_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v8 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ([WeakRetained l7UrdRfCzeduYqtA:*(void *)(a1 + 32)]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)vffg4lwI2HftPvpO:(id)a3
{
  id v4 = a3;
  id v5 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_51];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __37__LZHbEqKhcixce9PA_vffg4lwI2HftPvpO___block_invoke_2;
  aBlock[3] = &unk_1E56D7E90;
  id v6 = v4;
  id v18 = v6;
  id v7 = _Block_copy(aBlock);
  id v8 = [(LZHbEqKhcixce9PA *)self BFzukpKGO3cStNGp:v7];
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __37__LZHbEqKhcixce9PA_vffg4lwI2HftPvpO___block_invoke_3;
  v12[3] = &unk_1E56D7EE0;
  objc_copyWeak(&v15, &location);
  id v9 = v8;
  id v13 = v9;
  id v10 = v6;
  id v14 = v10;
  v11 = _Block_copy(v12);
  [v5 xs00laTiKIpDUzDP:v11];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

uint64_t __37__LZHbEqKhcixce9PA_vffg4lwI2HftPvpO___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __37__LZHbEqKhcixce9PA_vffg4lwI2HftPvpO___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ([WeakRetained l7UrdRfCzeduYqtA:*(void *)(a1 + 32)]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)Z8aAH7stm0EYhyxg:(id)a3 xz5EHXEN4FjlhJbi:(id)a4 uhVTXyAfCFn7u0Ue:(id)a5 EQUjQp7JcQbqcPcD:(id)a6 A5wDLa5TFdFZlz3A:(id)a7 TJKMyOe6zn5PdGIr:(id)a8 eCqgGM0WcnHOslnr:(unint64_t)a9 eCszfxdv3kUXvhgV:(unint64_t)a10 uWp4aZpP2vLhc04Q:(id)a11 QZYtNpvp0hKd248p:(id)a12 oCwPYmtRv8s31KUH:(id)a13 completion:(id)a14
{
  id v36 = a3;
  id v35 = a4;
  id v32 = a5;
  id v34 = a6;
  id v33 = a7;
  id v31 = a8;
  id v20 = a11;
  id v21 = a12;
  id v22 = a13;
  id v23 = a14;
  v24 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_53];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __218__LZHbEqKhcixce9PA_Z8aAH7stm0EYhyxg_xz5EHXEN4FjlhJbi_uhVTXyAfCFn7u0Ue_EQUjQp7JcQbqcPcD_A5wDLa5TFdFZlz3A_TJKMyOe6zn5PdGIr_eCqgGM0WcnHOslnr_eCszfxdv3kUXvhgV_uWp4aZpP2vLhc04Q_QZYtNpvp0hKd248p_oCwPYmtRv8s31KUH_completion___block_invoke_2;
  aBlock[3] = &unk_1E56D7E90;
  id v25 = v23;
  id v43 = v25;
  id v26 = _Block_copy(aBlock);
  v27 = [(LZHbEqKhcixce9PA *)self BFzukpKGO3cStNGp:v26];
  objc_initWeak(&location, self);
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __218__LZHbEqKhcixce9PA_Z8aAH7stm0EYhyxg_xz5EHXEN4FjlhJbi_uhVTXyAfCFn7u0Ue_EQUjQp7JcQbqcPcD_A5wDLa5TFdFZlz3A_TJKMyOe6zn5PdGIr_eCqgGM0WcnHOslnr_eCszfxdv3kUXvhgV_uWp4aZpP2vLhc04Q_QZYtNpvp0hKd248p_oCwPYmtRv8s31KUH_completion___block_invoke_3;
  v37[3] = &unk_1E56D7F30;
  objc_copyWeak(&v40, &location);
  id v28 = v27;
  id v38 = v28;
  id v29 = v25;
  id v39 = v29;
  id v30 = _Block_copy(v37);
  objc_msgSend(v24, "SOUWv5VjPwXYslMm:noUfOiGjp1iQmKZX:pPGyXmlDbN3mzzHm:iSOZt67ioKsVcqQZ:hjCrdFOLMJN0Cc5Q:lE40aye8U2u533Ka:JRuZv6Feh9qwrGmN:Wn0aIR2B54NCtGQc:B3l3lS18BITy5E4L:UywAszL6AB8Y6LTJ:uNao9X8A82jVmQkK:completion:", v36, v35, v32, v34, v33, a9, a10, v20, v21, v22, v30);

  objc_destroyWeak(&v40);
  objc_destroyWeak(&location);
}

uint64_t __218__LZHbEqKhcixce9PA_Z8aAH7stm0EYhyxg_xz5EHXEN4FjlhJbi_uhVTXyAfCFn7u0Ue_EQUjQp7JcQbqcPcD_A5wDLa5TFdFZlz3A_TJKMyOe6zn5PdGIr_eCqgGM0WcnHOslnr_eCszfxdv3kUXvhgV_uWp4aZpP2vLhc04Q_QZYtNpvp0hKd248p_oCwPYmtRv8s31KUH_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __218__LZHbEqKhcixce9PA_Z8aAH7stm0EYhyxg_xz5EHXEN4FjlhJbi_uhVTXyAfCFn7u0Ue_EQUjQp7JcQbqcPcD_A5wDLa5TFdFZlz3A_TJKMyOe6zn5PdGIr_eCqgGM0WcnHOslnr_eCszfxdv3kUXvhgV_uWp4aZpP2vLhc04Q_QZYtNpvp0hKd248p_oCwPYmtRv8s31KUH_completion___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6)
{
  id v14 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ([WeakRetained l7UrdRfCzeduYqtA:*(void *)(a1 + 32)]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)updateRavioliWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_56];
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__LZHbEqKhcixce9PA_updateRavioliWithCompletion___block_invoke_2;
  aBlock[3] = &unk_1E56D7E90;
  id v6 = v4;
  id v16 = v6;
  id v7 = _Block_copy(aBlock);
  id v8 = [(LZHbEqKhcixce9PA *)self BFzukpKGO3cStNGp:v7];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __48__LZHbEqKhcixce9PA_updateRavioliWithCompletion___block_invoke_3;
  v11[3] = &unk_1E56D7F58;
  objc_copyWeak(&v14, &location);
  id v9 = v8;
  id v12 = v9;
  id v10 = v6;
  id v13 = v10;
  [v5 k4eQYhyzyebbQqys:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

uint64_t __48__LZHbEqKhcixce9PA_updateRavioliWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __48__LZHbEqKhcixce9PA_updateRavioliWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ([WeakRetained l7UrdRfCzeduYqtA:*(void *)(a1 + 32)]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)llNEghuIdfPH7O8I:(BOOL)a3 all:(BOOL)a4 workflowID:(id)a5 completion:(id)a6
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v7 = (void *)MEMORY[0x1E4F28C58];
  id v8 = NSString;
  id v9 = kCoreASErrorDomainCA;
  id v10 = a6;
  id v11 = [v8 stringWithUTF8String:v9];
  uint64_t v14 = *MEMORY[0x1E4F28568];
  v15[0] = @"Not implemented";
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  id v13 = [v7 errorWithDomain:v11 code:-27006 userInfo:v12];
  (*((void (**)(id, void *))a6 + 2))(v10, v13);
}

- (void)evrtH713YbFfEOzk:(id)a3 completion:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1E4F28C58];
  id v6 = NSString;
  id v7 = kCoreASErrorDomainCA;
  id v8 = a4;
  id v9 = [v6 stringWithUTF8String:v7];
  uint64_t v12 = *MEMORY[0x1E4F28568];
  v13[0] = @"Not implemented";
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v11 = [v5 errorWithDomain:v9 code:-27006 userInfo:v10];
  (*((void (**)(id, void, void *))a4 + 2))(v8, 0, v11);
}

- (void)ofLBc0SV56ddaijH:(id)a3 i7D0Lridvo8oYoNd:(id)a4 completion:(id)a5
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = (void *)MEMORY[0x1E4F28C58];
  id v7 = NSString;
  id v8 = kCoreASErrorDomainCA;
  id v9 = a5;
  id v10 = [v7 stringWithUTF8String:v8];
  uint64_t v13 = *MEMORY[0x1E4F28568];
  v14[0] = @"Not implemented";
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  uint64_t v12 = [v6 errorWithDomain:v10 code:-27006 userInfo:v11];
  (*((void (**)(id, void, void *))a5 + 2))(v9, 0, v12);
}

- (void)llNEghuIdfPH7O8I:(BOOL)a3 all:(BOOL)a4 pregeneration:(BOOL)a5 workflowID:(id)a6 completion:(id)a7
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v8 = (void *)MEMORY[0x1E4F28C58];
  id v9 = NSString;
  id v10 = kCoreASErrorDomainCA;
  id v11 = a7;
  uint64_t v12 = [v9 stringWithUTF8String:v10];
  uint64_t v15 = *MEMORY[0x1E4F28568];
  v16[0] = @"Not implemented";
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
  uint64_t v14 = [v8 errorWithDomain:v12 code:-27006 userInfo:v13];
  (*((void (**)(id, void *))a7 + 2))(v11, v14);
}

- (id)BFzukpKGO3cStNGp:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F29128] UUID];
  id v6 = [v5 UUIDString];

  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__LZHbEqKhcixce9PA_BFzukpKGO3cStNGp___block_invoke;
  block[3] = &unk_1E56D7F80;
  block[4] = self;
  id v15 = v4;
  id v8 = v6;
  id v14 = v8;
  id v9 = v4;
  dispatch_sync(syncQueue, block);
  id v10 = v14;
  id v11 = v8;

  return v11;
}

void __37__LZHbEqKhcixce9PA_BFzukpKGO3cStNGp___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  id v3 = _Block_copy(*(const void **)(a1 + 48));
  [v2 setObject:v3 forKey:*(void *)(a1 + 40)];
}

- (BOOL)l7UrdRfCzeduYqtA:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__LZHbEqKhcixce9PA_l7UrdRfCzeduYqtA___block_invoke;
  block[3] = &unk_1E56D7FA8;
  id v9 = v4;
  id v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(syncQueue, block);
  LOBYTE(syncQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)syncQueue;
}

uint64_t __37__LZHbEqKhcixce9PA_l7UrdRfCzeduYqtA___block_invoke(void *a1)
{
  v2 = [*(id *)(a1[4] + 16) objectForKeyedSubscript:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v2 != 0;

  uint64_t v3 = a1[5];
  id v4 = *(void **)(a1[4] + 16);
  return [v4 removeObjectForKey:v3];
}

- (void)uTtwJoGUgL3N0GVz
{
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__LZHbEqKhcixce9PA_uTtwJoGUgL3N0GVz__block_invoke;
  block[3] = &unk_1E56D7FD0;
  block[4] = self;
  dispatch_sync(syncQueue, block);
}

void __36__LZHbEqKhcixce9PA_uTtwJoGUgL3N0GVz__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v3 = [NSString stringWithUTF8String:kCoreASErrorDomainCA];
  id v4 = [v2 errorWithDomain:v3 code:-31 userInfo:0];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "allValues", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * v9++) + 16))();
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_disconnectionCallbacks, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end