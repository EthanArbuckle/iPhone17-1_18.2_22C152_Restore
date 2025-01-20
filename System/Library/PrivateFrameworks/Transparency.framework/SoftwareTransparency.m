@interface SoftwareTransparency
+ (BOOL)retryable:(id)a3;
+ (id)tooManyRetries;
- (BOOL)gmEligibility;
- (NSXPCListenerEndpoint)endpoint;
- (NSXPCProxyCreating)proxyCreating;
- (SoftwareTransparency)initWithApplication:(unint64_t)a3;
- (id)connection;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (unint64_t)application;
- (void)clearAllCFUWithCompletion:(id)a3;
- (void)dailyWithCompletion:(id)a3;
- (void)postCFU:(id)a3 completion:(id)a4;
- (void)setApplication:(unint64_t)a3;
- (void)setEndpoint:(id)a3;
- (void)setProxyCreating:(id)a3;
- (void)sysdiagnoseInfo:(int)a3 completion:(id)a4;
- (void)sysdiagnoseInfoWithCompletion:(id)a3;
- (void)triggerConsistencyVerificationWithCompletion:(id)a3;
- (void)triggerMilestoneRefreshWithCompletion:(id)a3;
- (void)triggerPublicKeyBagRefreshWithCompletion:(id)a3;
- (void)verifyExpiringProofs:(id)a3 for:(id)a4 completion:(id)a5;
- (void)verifyExpiringProofs:(id)a3 for:(id)a4 counter:(int)a5 completion:(id)a6;
- (void)verifyProofs:(id)a3 for:(id)a4 completion:(id)a5;
- (void)waitStateMachineReadyWithCompletion:(id)a3;
@end

@implementation SoftwareTransparency

- (SoftwareTransparency)initWithApplication:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SoftwareTransparency;
  v4 = [(SoftwareTransparency *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_application = a3;
    v6 = v4;
  }

  return v5;
}

+ (BOOL)retryable:(id)a3
{
  id v3 = a3;
  if ([v3 code] == 4097)
  {
    v4 = [v3 domain];
    char v5 = [v4 isEqual:*MEMORY[0x263F07F70]];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

+ (id)tooManyRetries
{
  id v2 = objc_alloc(MEMORY[0x263F087E8]);
  id v3 = (void *)[v2 initWithDomain:*MEMORY[0x263F07F70] code:4097 userInfo:0];

  return v3;
}

- (id)connection
{
  id v3 = [(SoftwareTransparency *)self endpoint];

  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F08D68]);
    char v5 = [(SoftwareTransparency *)self endpoint];
    v6 = (void *)[v4 initWithListenerEndpoint:v5];

    v7 = +[SWTransparencyXPCInterface interface];
    [v6 setRemoteObjectInterface:v7];

    [v6 resume];
  }
  else
  {
    objc_super v8 = [(SoftwareTransparency *)self proxyCreating];

    if (v8) {
      [(SoftwareTransparency *)self proxyCreating];
    }
    else {
    v6 = +[TransparencyXPCConnection swTransparencyConnection];
    }
  }

  return v6;
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  char v5 = [(SoftwareTransparency *)self connection];
  v6 = [v5 remoteObjectProxyWithErrorHandler:v4];

  return v6;
}

- (void)verifyProofs:(id)a3 for:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __52__SoftwareTransparency_verifyProofs_for_completion___block_invoke;
  v10[3] = &unk_26479E6D0;
  id v11 = v8;
  id v9 = v8;
  [(SoftwareTransparency *)self verifyExpiringProofs:a3 for:a4 completion:v10];
}

void __52__SoftwareTransparency_verifyProofs_for_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, [a2 result], v5);
}

- (void)verifyExpiringProofs:(id)a3 for:(id)a4 completion:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void *, void *))a5;
  if ([(SoftwareTransparency *)self gmEligibility])
  {
    [(SoftwareTransparency *)self verifyExpiringProofs:v14 for:v8 counter:1 completion:v9];
  }
  else
  {
    v10 = [SWTransparencyExpiringVerificationResult alloc];
    id v11 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:0.0];
    v12 = [(SWTransparencyExpiringVerificationResult *)v10 initWithResult:1 expiry:v11];

    v13 = [MEMORY[0x263F087E8] errorWithDomain:@"TransparencyErrorInterface" code:-398 userInfo:0];
    v9[2](v9, v12, v13);
  }
}

- (void)verifyExpiringProofs:(id)a3 for:(id)a4 counter:(int)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = (void (**)(void, void, void))v12;
  if (a5 < 5)
  {
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __68__SoftwareTransparency_verifyExpiringProofs_for_counter_completion___block_invoke;
    v19[3] = &unk_26479E6F8;
    v19[4] = self;
    id v15 = v12;
    id v22 = v15;
    id v16 = v10;
    id v20 = v16;
    id v17 = v11;
    id v21 = v17;
    int v23 = a5;
    v18 = [(SoftwareTransparency *)self remoteObjectProxyWithErrorHandler:v19];
    [v18 verifyProofs:v16 forObject:v17 completion:v15];
  }
  else
  {
    id v14 = [(id)objc_opt_class() tooManyRetries];
    ((void (**)(void, void, void *))v13)[2](v13, 0, v14);
  }
}

void __68__SoftwareTransparency_verifyExpiringProofs_for_counter_completion___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if ([(id)objc_opt_class() retryable:v6])
  {
    [*(id *)(a1 + 32) verifyExpiringProofs:*(void *)(a1 + 40) for:*(void *)(a1 + 48) counter:(*(_DWORD *)(a1 + 64) + 1) completion:*(void *)(a1 + 56)];
  }
  else
  {
    id v3 = [SWTransparencyExpiringVerificationResult alloc];
    uint64_t v4 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:0.0];
    id v5 = [(SWTransparencyExpiringVerificationResult *)v3 initWithResult:1 expiry:v4];

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)sysdiagnoseInfoWithCompletion:(id)a3
{
}

- (void)sysdiagnoseInfo:(int)a3 completion:(id)a4
{
  id v6 = a4;
  v7 = (void (**)(void, void, void))v6;
  if (a3 < 5)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __51__SoftwareTransparency_sysdiagnoseInfo_completion___block_invoke;
    v11[3] = &unk_26479E720;
    v11[4] = self;
    id v9 = v6;
    id v12 = v9;
    int v13 = a3;
    id v10 = [(SoftwareTransparency *)self remoteObjectProxyWithErrorHandler:v11];
    [v10 sysdiagnoseInfoWithCompletion:v9];
  }
  else
  {
    id v8 = [(id)objc_opt_class() tooManyRetries];
    ((void (**)(void, void, void *))v7)[2](v7, 0, v8);
  }
}

void __51__SoftwareTransparency_sysdiagnoseInfo_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([(id)objc_opt_class() retryable:v3]) {
    [*(id *)(a1 + 32) sysdiagnoseInfo:(*(_DWORD *)(a1 + 48) + 1) completion:*(void *)(a1 + 40)];
  }
  else {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)triggerMilestoneRefreshWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(SoftwareTransparency *)self connection];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __62__SoftwareTransparency_triggerMilestoneRefreshWithCompletion___block_invoke;
  v8[3] = &unk_26479E748;
  id v9 = v4;
  id v6 = v4;
  v7 = [v5 remoteObjectProxyWithErrorHandler:v8];
  [v7 triggerMilestoneRefreshWithCompletion:v6];
}

uint64_t __62__SoftwareTransparency_triggerMilestoneRefreshWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)triggerPublicKeyBagRefreshWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(SoftwareTransparency *)self connection];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __65__SoftwareTransparency_triggerPublicKeyBagRefreshWithCompletion___block_invoke;
  v8[3] = &unk_26479E748;
  id v9 = v4;
  id v6 = v4;
  v7 = [v5 remoteObjectProxyWithErrorHandler:v8];
  [v7 triggerPublicKeybagRefreshWithCompletion:v6];
}

uint64_t __65__SoftwareTransparency_triggerPublicKeyBagRefreshWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)triggerConsistencyVerificationWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(SoftwareTransparency *)self connection];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __69__SoftwareTransparency_triggerConsistencyVerificationWithCompletion___block_invoke;
  v8[3] = &unk_26479E748;
  id v9 = v4;
  id v6 = v4;
  v7 = [v5 remoteObjectProxyWithErrorHandler:v8];
  [v7 triggerConsistencyVerificationWithCompletion:v6];
}

uint64_t __69__SoftwareTransparency_triggerConsistencyVerificationWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)postCFU:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SoftwareTransparency *)self connection];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __43__SoftwareTransparency_postCFU_completion___block_invoke;
  v11[3] = &unk_26479E748;
  id v12 = v6;
  id v9 = v6;
  id v10 = [v8 remoteObjectProxyWithErrorHandler:v11];
  [v10 postCFU:v7 completion:v9];
}

uint64_t __43__SoftwareTransparency_postCFU_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)clearAllCFUWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(SoftwareTransparency *)self connection];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __50__SoftwareTransparency_clearAllCFUWithCompletion___block_invoke;
  v8[3] = &unk_26479E748;
  id v9 = v4;
  id v6 = v4;
  id v7 = [v5 remoteObjectProxyWithErrorHandler:v8];
  [v7 clearAllCFUWithCompletion:v6];
}

uint64_t __50__SoftwareTransparency_clearAllCFUWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)waitStateMachineReadyWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(SoftwareTransparency *)self connection];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __60__SoftwareTransparency_waitStateMachineReadyWithCompletion___block_invoke;
  v8[3] = &unk_26479E748;
  id v9 = v4;
  id v6 = v4;
  id v7 = [v5 remoteObjectProxyWithErrorHandler:v8];
  [v7 waitStateMachineReadyWithCompletion:v6];
}

uint64_t __60__SoftwareTransparency_waitStateMachineReadyWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)dailyWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(SoftwareTransparency *)self connection];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __44__SoftwareTransparency_dailyWithCompletion___block_invoke;
  v8[3] = &unk_26479E748;
  id v9 = v4;
  id v6 = v4;
  id v7 = [v5 remoteObjectProxyWithErrorHandler:v8];
  [v7 dailyWithCompletion:v6];
}

uint64_t __44__SoftwareTransparency_dailyWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)gmEligibility
{
  if (gmEligibility_onceToken != -1) {
    dispatch_once(&gmEligibility_onceToken, &__block_literal_global_0);
  }
  return (gmEligibility_eligiable & 1) == 0;
}

void __37__SoftwareTransparency_gmEligibility__block_invoke()
{
  v0 = SecTaskCreateFromSelf(0);
  if (v0)
  {
    v1 = v0;
    id v2 = (__CFString *)SecTaskCopySigningIdentifier(v0, 0);
    CFRelease(v1);
    if ([(__CFString *)v2 isEqual:@"com.apple.networkserviceproxy"]) {
      os_eligibility_get_domain_answer();
    }
  }
}

- (unint64_t)application
{
  return self->_application;
}

- (void)setApplication:(unint64_t)a3
{
  self->_application = a3;
}

- (NSXPCListenerEndpoint)endpoint
{
  return (NSXPCListenerEndpoint *)objc_getProperty(self, a2, 16, 1);
}

- (void)setEndpoint:(id)a3
{
}

- (NSXPCProxyCreating)proxyCreating
{
  return (NSXPCProxyCreating *)objc_getProperty(self, a2, 24, 1);
}

- (void)setProxyCreating:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyCreating, 0);

  objc_storeStrong((id *)&self->_endpoint, 0);
}

@end