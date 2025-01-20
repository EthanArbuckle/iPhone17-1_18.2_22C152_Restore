@interface TPSAppleArcadeValidation
- (void)validateWithCompletion:(id)a3;
@end

@implementation TPSAppleArcadeValidation

- (void)validateWithCompletion:(id)a3
{
  v4 = (void (**)(id, void, void *))a3;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  char v21 = 0;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__12;
  v18 = __Block_byref_object_dispose__12;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2050000000;
  v5 = (void *)getASDSubscriptionEntitlementsClass_softClass;
  uint64_t v26 = getASDSubscriptionEntitlementsClass_softClass;
  if (!getASDSubscriptionEntitlementsClass_softClass)
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __getASDSubscriptionEntitlementsClass_block_invoke;
    v22[3] = &unk_1E6E6AE20;
    v22[4] = &v23;
    __getASDSubscriptionEntitlementsClass_block_invoke((uint64_t)v22);
    v5 = (void *)v24[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v23, 8);
  id v19 = [v6 sharedInstance];
  v7 = (void *)v15[5];
  if (!v7)
  {
    v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    v4[2](v4, 0, v8);

    v7 = (void *)v15[5];
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51__TPSAppleArcadeValidation_validateWithCompletion___block_invoke;
  v10[3] = &unk_1E6E6C6C0;
  v12 = v20;
  v10[4] = self;
  v9 = v4;
  id v11 = v9;
  v13 = &v14;
  [v7 getSubscriptionEntitlementsForSegment:1 ignoreCaches:0 withResultHandler:v10];

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(v20, 8);
}

void __51__TPSAppleArcadeValidation_validateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v17 != v6) {
        objc_enumerationMutation(v3);
      }
      v8 = *(void **)(*((void *)&v16 + 1) + 8 * v7);
      v9 = objc_msgSend(v8, "offerID", (void)v16);
      if ([v9 hasPrefix:@"com.apple.arcade."])
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      }
      else
      {
        v10 = [v8 familyID];
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v10 isEqual:&unk_1F4022308];
      }
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v5) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  int v11 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  int v12 = [*(id *)(a1 + 32) BOOLValue];
  v13 = [MEMORY[0x1E4FAF480] targeting];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    __61__TPSTravelESimEligibilityValidation_validateWithCompletion___block_invoke_cold_1((id *)(a1 + 32), v11 == v12, v13);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
  v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = 0;
}

@end