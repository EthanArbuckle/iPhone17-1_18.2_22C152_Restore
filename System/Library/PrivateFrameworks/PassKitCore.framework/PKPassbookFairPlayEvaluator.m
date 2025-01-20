@interface PKPassbookFairPlayEvaluator
+ (void)_getLegacyFairPlayInfoWithAuditToken:(id *)a3 nonce:(id)a4 completion:(id)a5;
+ (void)getFairPlayInfoWithAuditToken:(id *)a3 nonce:(id)a4 completion:(id)a5;
- (PKPassbookFairPlayEvaluator)init;
@end

@implementation PKPassbookFairPlayEvaluator

- (PKPassbookFairPlayEvaluator)init
{
  return 0;
}

+ (void)getFairPlayInfoWithAuditToken:(id *)a3 nonce:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  os_log_t v9 = os_log_create("com.apple.passkit", "Provisioning.Add");
  Class v10 = (Class)getFairPlayPassbookProvisioningObjCClass[0]();
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __78__PKPassbookFairPlayEvaluator_getFairPlayInfoWithAuditToken_nonce_completion___block_invoke;
  v15[3] = &unk_1E56E0BD0;
  os_log_t v16 = v9;
  id v17 = v7;
  long long v11 = *(_OWORD *)&a3->var0[4];
  v14[0] = *(_OWORD *)a3->var0;
  v14[1] = v11;
  id v12 = v7;
  v13 = v9;
  [(objc_class *)v10 getProvisioningInfoWithAuditToken:v14 nonce:v8 completionHandler:v15];
}

void __78__PKPassbookFairPlayEvaluator_getFairPlayInfoWithAuditToken_nonce_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 length];
  id v8 = *(NSObject **)(a1 + 32);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v5 && v7)
  {
    if (v9)
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_INFO, "FairPlay: Returning modern blob", (uint8_t *)&v11, 2u);
    }
    Class v10 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (v9)
    {
      int v11 = 138412290;
      id v12 = v6;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_INFO, "FairPlay: Failed to get fairPlayInfo: %@", (uint8_t *)&v11, 0xCu);
    }
    Class v10 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v10();
}

+ (void)_getLegacyFairPlayInfoWithAuditToken:(id *)a3 nonce:(id)a4 completion:(id)a5
{
  uint64_t v7 = (void (**)(id, void *))a5;
  uint64_t v17 = 0;
  unsigned int v16 = 0;
  id v8 = a4;
  uint64_t v9 = [v8 bytes];
  uint64_t v10 = [v8 length];

  V0YaM92nP0Xx19HNvczPJ((uint64_t)a3, 32, v9, v10, (uint64_t)&v17, (uint64_t)&v16);
  int v12 = v11;
  uint64_t v13 = 0;
  uint64_t v14 = v17;
  if (!v12 && v17 && v16)
  {
    id v15 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    uint64_t v13 = (void *)[v15 initWithBytes:v17 length:v16];
    uint64_t v14 = v17;
  }
  if (v14) {
    jEHf8Xzsv8K(v14);
  }
  v7[2](v7, v13);
}

@end