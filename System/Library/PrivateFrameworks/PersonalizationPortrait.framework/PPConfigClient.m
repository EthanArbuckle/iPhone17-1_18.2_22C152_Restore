@interface PPConfigClient
+ (id)sharedInstance;
- (PPConfigClient)init;
- (id)_synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (id)readableTrialTreatmentsMappingWithError:(id *)a3;
- (id)variantNameWithError:(id *)a3;
- (unint64_t)assetVersionWithError:(id *)a3;
@end

@implementation PPConfigClient

- (void).cxx_destruct
{
}

- (id)readableTrialTreatmentsMappingWithError:(id *)a3
{
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__3461;
  v22 = __Block_byref_object_dispose__3462;
  id v23 = 0;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__3461;
  v16 = __Block_byref_object_dispose__3462;
  id v17 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__PPConfigClient_readableTrialTreatmentsMappingWithError___block_invoke;
  v11[3] = &unk_1E550E5F8;
  v11[4] = &v18;
  v11[5] = &v12;
  v5 = (void *)MEMORY[0x192F975A0](v11, a2);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58__PPConfigClient_readableTrialTreatmentsMappingWithError___block_invoke_2;
  v10[3] = &unk_1E550E648;
  v10[4] = &v18;
  v10[5] = &v12;
  v6 = (void *)MEMORY[0x192F975A0](v10);
  v7 = [(PPConfigClient *)self _synchronousRemoteObjectProxyWithErrorHandler:v5];
  [v7 readableTrialTreatmentsMappingWithCompletion:v6];

  if (a3) {
    *a3 = (id) v13[5];
  }
  id v8 = (id)v19[5];

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);

  return v8;
}

void __58__PPConfigClient_readableTrialTreatmentsMappingWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

void __58__PPConfigClient_readableTrialTreatmentsMappingWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

- (id)variantNameWithError:(id *)a3
{
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__3461;
  v22 = __Block_byref_object_dispose__3462;
  id v23 = 0;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__3461;
  v16 = __Block_byref_object_dispose__3462;
  id v17 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __39__PPConfigClient_variantNameWithError___block_invoke;
  v11[3] = &unk_1E550E5F8;
  v11[4] = &v18;
  v11[5] = &v12;
  id v5 = (void *)MEMORY[0x192F975A0](v11, a2);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __39__PPConfigClient_variantNameWithError___block_invoke_2;
  v10[3] = &unk_1E550E850;
  v10[4] = &v18;
  v10[5] = &v12;
  id v6 = (void *)MEMORY[0x192F975A0](v10);
  uint64_t v7 = [(PPConfigClient *)self _synchronousRemoteObjectProxyWithErrorHandler:v5];
  [v7 variantNameWithCompletion:v6];

  if (a3) {
    *a3 = (id) v13[5];
  }
  id v8 = (id)v19[5];

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);

  return v8;
}

void __39__PPConfigClient_variantNameWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

void __39__PPConfigClient_variantNameWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

- (unint64_t)assetVersionWithError:(id *)a3
{
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__3461;
  v16 = __Block_byref_object_dispose__3462;
  id v17 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __40__PPConfigClient_assetVersionWithError___block_invoke;
  v11[3] = &unk_1E550E5F8;
  v11[4] = &v18;
  v11[5] = &v12;
  id v5 = (void *)MEMORY[0x192F975A0](v11, a2);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __40__PPConfigClient_assetVersionWithError___block_invoke_2;
  v10[3] = &unk_1E550E620;
  v10[4] = &v18;
  v10[5] = &v12;
  id v6 = (void *)MEMORY[0x192F975A0](v10);
  uint64_t v7 = [(PPConfigClient *)self _synchronousRemoteObjectProxyWithErrorHandler:v5];
  [v7 assetVersionWithCompletion:v6];

  if (a3) {
    *a3 = (id) v13[5];
  }
  unint64_t v8 = v19[3];

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);
  return v8;
}

void __40__PPConfigClient_assetVersionWithError___block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0x7FFFFFFFFFFFFFFFLL;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
}

void __40__PPConfigClient_assetVersionWithError___block_invoke_2(uint64_t a1, uint64_t a2, id obj)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (id)_synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  return [(PPXPCClientHelper *)self->_clientHelper synchronousRemoteObjectProxyWithErrorHandler:a3];
}

- (PPConfigClient)init
{
  v8.receiver = self;
  v8.super_class = (Class)PPConfigClient;
  v2 = [(PPConfigClient *)&v8 init];
  if (v2)
  {
    id v3 = [PPXPCClientHelper alloc];
    uint64_t v4 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDA7AA08];
    uint64_t v5 = [(PPXPCClientHelper *)v3 initWithServiceName:@"com.apple.proactive.PersonalizationPortrait.Config" allowedServerInterface:v4 allowedClientInterface:0 clientExportedObject:0 interruptionHandler:&__block_literal_global_3469 invalidationHandler:&__block_literal_global_64];
    clientHelper = v2->_clientHelper;
    v2->_clientHelper = (PPXPCClientHelper *)v5;
  }
  return v2;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__PPConfigClient_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken2_3483 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken2_3483, block);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_3484;
  return v2;
}

void __32__PPConfigClient_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x192F97350]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_3484;
  sharedInstance__pasExprOnceResult_3484 = v1;
}

@end