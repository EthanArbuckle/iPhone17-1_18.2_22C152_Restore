@interface PPInternalClient
+ (id)sharedInstance;
- (BOOL)setTrialUseDefaultFiles:(BOOL)a3 error:(id *)a4;
- (BOOL)trialOverridePath:(id)a3 namespaceName:(id)a4 factorName:(id)a5 error:(id *)a6;
- (PPInternalClient)init;
- (id)_synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (id)sysdiagnoseInformationWithError:(id *)a3;
@end

@implementation PPInternalClient

- (void).cxx_destruct
{
}

- (id)sysdiagnoseInformationWithError:(id *)a3
{
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  id v23 = 0;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__PPInternalClient_sysdiagnoseInformationWithError___block_invoke;
  v11[3] = &unk_1E550F638;
  v11[4] = &v18;
  v5 = (void *)MEMORY[0x192F975A0](v11, a2);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52__PPInternalClient_sysdiagnoseInformationWithError___block_invoke_2;
  v10[3] = &unk_1E550E850;
  v10[4] = &v12;
  v10[5] = &v18;
  v6 = (void *)MEMORY[0x192F975A0](v10);
  v7 = [(PPInternalClient *)self _synchronousRemoteObjectProxyWithErrorHandler:v5];
  [v7 sysdiagnoseInformationWithCompletion:v6];

  if (a3) {
    *a3 = (id) v19[5];
  }
  id v8 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);

  return v8;
}

void __52__PPInternalClient_sysdiagnoseInformationWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __52__PPInternalClient_sysdiagnoseInformationWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (BOOL)setTrialUseDefaultFiles:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  id v23 = 0;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __50__PPInternalClient_setTrialUseDefaultFiles_error___block_invoke;
  v13[3] = &unk_1E550F638;
  v13[4] = &v18;
  uint64_t v7 = (void *)MEMORY[0x192F975A0](v13, a2);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __50__PPInternalClient_setTrialUseDefaultFiles_error___block_invoke_2;
  v12[3] = &unk_1E550F660;
  v12[4] = &v14;
  v12[5] = &v18;
  id v8 = (void *)MEMORY[0x192F975A0](v12);
  uint64_t v9 = [(PPInternalClient *)self _synchronousRemoteObjectProxyWithErrorHandler:v7];
  [v9 setTrialUseDefaultFiles:v5 completion:v8];

  if (a4) {
    *a4 = (id) v19[5];
  }
  char v10 = *((unsigned char *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  return v10;
}

void __50__PPInternalClient_setTrialUseDefaultFiles_error___block_invoke(uint64_t a1, void *a2)
{
}

void __50__PPInternalClient_setTrialUseDefaultFiles_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)trialOverridePath:(id)a3 namespaceName:(id)a4 factorName:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  uint64_t v14 = v13;
  if (v12)
  {
    if (v13) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"PPInternalClient.m", 48, @"Invalid parameter not satisfying: %@", @"namespaceName" object file lineNumber description];

    if (v14) {
      goto LABEL_3;
    }
  }
  v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:a2, self, @"PPInternalClient.m", 49, @"Invalid parameter not satisfying: %@", @"factorName" object file lineNumber description];

LABEL_3:
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy_;
  v32 = __Block_byref_object_dispose_;
  id v33 = 0;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __69__PPInternalClient_trialOverridePath_namespaceName_factorName_error___block_invoke;
  v23[3] = &unk_1E550F638;
  v23[4] = &v28;
  v15 = (void *)MEMORY[0x192F975A0](v23);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __69__PPInternalClient_trialOverridePath_namespaceName_factorName_error___block_invoke_2;
  v22[3] = &unk_1E550F660;
  v22[4] = &v24;
  v22[5] = &v28;
  uint64_t v16 = (void *)MEMORY[0x192F975A0](v22);
  char v17 = [(PPInternalClient *)self _synchronousRemoteObjectProxyWithErrorHandler:v15];
  [v17 trialOverridePath:v11 namespaceName:v12 factorName:v14 completion:v16];

  if (a6) {
    *a6 = (id) v29[5];
  }
  char v18 = *((unsigned char *)v25 + 24);

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);

  return v18;
}

void __69__PPInternalClient_trialOverridePath_namespaceName_factorName_error___block_invoke(uint64_t a1, void *a2)
{
}

void __69__PPInternalClient_trialOverridePath_namespaceName_factorName_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (id)_synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  return [(PPXPCClientHelper *)self->_clientHelper synchronousRemoteObjectProxyWithErrorHandler:a3];
}

- (PPInternalClient)init
{
  v7.receiver = self;
  v7.super_class = (Class)PPInternalClient;
  v2 = [(PPInternalClient *)&v7 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDA7A888];
    v4 = [[PPXPCClientHelper alloc] initWithServiceName:@"com.apple.proactive.PersonalizationPortrait.Internal" allowedServerInterface:v3 allowedClientInterface:0 clientExportedObject:0 interruptionHandler:&__block_literal_global_359 invalidationHandler:&__block_literal_global_90];
    clientHelper = v2->_clientHelper;
    v2->_clientHelper = v4;
  }
  return v2;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__PPInternalClient_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken2 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken2, block);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_386;
  return v2;
}

void __34__PPInternalClient_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x192F97350]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_386;
  sharedInstance__pasExprOnceResult_386 = v1;
}

@end