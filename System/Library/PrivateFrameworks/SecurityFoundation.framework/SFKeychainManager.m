@interface SFKeychainManager
@end

@implementation SFKeychainManager

uint64_t __36___SFKeychainManager_defaultManager__block_invoke()
{
  defaultManager_defaultManager = [[_SFKeychainManager alloc] initManager];
  return MEMORY[0x1F41817F8]();
}

uint64_t __46___SFKeychainManager_defaultOverCommitManager__block_invoke()
{
  defaultOverCommitManager_defaultOverCommitManager = [[_SFKeychainManager alloc] initOverCommitManager];
  return MEMORY[0x1F41817F8]();
}

void __70___SFKeychainManager_setKey_forIdentifier_accessPolicy_resultHandler___block_invoke(uint64_t a1)
{
  CFDictionaryRef v2 = [*(id *)(a1 + 32) _symmetricKeyAttributesForIdentifier:*(void *)(a1 + 40) accessPolicy:*(void *)(a1 + 48) key:*(void *)(a1 + 56)];
  OSStatus v3 = SecItemAdd(v2, 0);
  if (*(void *)(a1 + 64))
  {
    OSStatus v4 = v3;
    v5 = [*(id *)(a1 + 32) keychainReplyQueue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __70___SFKeychainManager_setKey_forIdentifier_accessPolicy_resultHandler___block_invoke_2;
    v6[3] = &unk_1E6379660;
    OSStatus v8 = v4;
    id v7 = *(id *)(a1 + 64);
    dispatch_async(v5, v6);
  }
}

void __70___SFKeychainManager_setKey_forIdentifier_accessPolicy_resultHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(int *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  if (v1)
  {
    id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v1 userInfo:0];
    (*(void (**)(uint64_t, void, id))(v2 + 16))(v2, 0, v5);
  }
  else
  {
    OSStatus v3 = *(void (**)(uint64_t, uint64_t, void))(v2 + 16);
    uint64_t v4 = *(void *)(a1 + 32);
    v3(v4, 1, 0);
  }
}

uint64_t __67___SFKeychainManager_setIdentity_forIdentifier_accessPolicy_error___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) generateAttributesForIdentityAndAddToKeychain:*(void *)(a1 + 40) forIdentifier:*(void *)(a1 + 48) accessPolicy:*(void *)(a1 + 56)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8);
  if (result)
  {
    *(unsigned char *)(v3 + 24) = 0;
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:(int)result userInfo:0];
    return MEMORY[0x1F41817F8]();
  }
  else
  {
    *(unsigned char *)(v3 + 24) = 1;
  }
  return result;
}

void __75___SFKeychainManager_setIdentity_forIdentifier_accessPolicy_resultHandler___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) generateAttributesForIdentityAndAddToKeychain:*(void *)(a1 + 40) forIdentifier:*(void *)(a1 + 48) accessPolicy:*(void *)(a1 + 56)];
  if (*(void *)(a1 + 64))
  {
    int v3 = v2;
    uint64_t v4 = [*(id *)(a1 + 32) keychainReplyQueue];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __75___SFKeychainManager_setIdentity_forIdentifier_accessPolicy_resultHandler___block_invoke_2;
    v5[3] = &unk_1E6379660;
    int v7 = v3;
    id v6 = *(id *)(a1 + 64);
    dispatch_async(v4, v5);
  }
}

void __75___SFKeychainManager_setIdentity_forIdentifier_accessPolicy_resultHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(int *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  if (v1)
  {
    id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v1 userInfo:0];
    (*(void (**)(uint64_t, void, id))(v2 + 16))(v2, 0, v5);
  }
  else
  {
    int v3 = *(void (**)(uint64_t, uint64_t, void))(v2 + 16);
    uint64_t v4 = *(void *)(a1 + 32);
    v3(v4, 1, 0);
  }
}

void __63___SFKeychainManager_keyForIdentifier_specifier_resultHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _symmetricKeyAttributesForIdentifier:*(void *)(a1 + 40) accessPolicy:0 key:0];
  [v2 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F3BC70]];
  CFTypeRef result = 0;
  OSStatus v3 = SecItemCopyMatching((CFDictionaryRef)v2, &result);
  uint64_t v4 = (void *)result;
  id v5 = [*(id *)(a1 + 32) keychainReplyQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63___SFKeychainManager_keyForIdentifier_specifier_resultHandler___block_invoke_2;
  block[3] = &unk_1E63796D8;
  id v8 = v4;
  OSStatus v11 = v3;
  id v9 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 56);
  id v6 = v4;
  dispatch_async(v5, block);
}

void __63___SFKeychainManager_keyForIdentifier_specifier_resultHandler___block_invoke_2(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 56);
  if (*(void *)(a1 + 32)) {
    BOOL v3 = v2 == 0;
  }
  else {
    BOOL v3 = 0;
  }
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = [SFTripleDESKey alloc];
      uint64_t v7 = *(void *)(a1 + 32);
      id v8 = objc_alloc_init(_SFTripleDESKeySpecifier);
      id v25 = 0;
      id v9 = [(_SFSymmetricKey *)v6 initWithData:v7 specifier:v8 error:&v25];
      id v10 = v25;

      uint64_t v11 = *(void *)(a1 + 48);
      if (v10)
      {
        v12 = +[_SFKeychainFetchResult fetchResultWithError:v10];
        (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);
LABEL_14:

        uint64_t v18 = *(void *)(a1 + 48);
        v19 = +[_SFKeychainFetchResult fetchResultWithError:v10];
        (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v19);

LABEL_21:
        return;
      }
      v20 = +[_SFKeychainFetchResult fetchResultWithValue:v9];
      (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v20);
      goto LABEL_19;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [_SFAESKey alloc];
      uint64_t v14 = *(void *)(a1 + 32);
      uint64_t v15 = *(void *)(a1 + 40);
      id v24 = 0;
      id v9 = [(_SFSymmetricKey *)v13 initWithData:v14 specifier:v15 error:&v24];
      id v16 = v24;
      if (v16)
      {
        id v10 = v16;
        uint64_t v17 = *(void *)(a1 + 48);
        v12 = +[_SFKeychainFetchResult fetchResultWithError:v16];
        (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v12);
        goto LABEL_14;
      }
      if (v9)
      {
        uint64_t v21 = *(void *)(a1 + 48);
        v20 = +[_SFKeychainFetchResult fetchResultWithValue:v9];
        (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v20);
LABEL_19:
      }
    }
    else
    {
      id v9 = 0;
    }
    uint64_t v22 = *(void *)(a1 + 48);
    id v10 = +[_SFKeychainFetchResult fetchResultWithValue:v9];
    (*(void (**)(uint64_t, id))(v22 + 16))(v22, v10);
    goto LABEL_21;
  }
  uint64_t v4 = *(void *)(a1 + 48);
  id v23 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v2 userInfo:0];
  id v5 = +[_SFKeychainFetchResult fetchResultWithError:v23];
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
}

void __44___SFKeychainManager_identityForIdentifier___block_invoke(void *a1)
{
  unsigned int v11 = 0;
  int v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v10 = 0;
  uint64_t v4 = [v2 findPrivateKeyWithIdentifier:v3 certificate:&v10 result:&v11];
  id v5 = v10;
  id v6 = (void *)a1[4];
  if (v4) {
    [v6 foundPrivateKey:v4 certificate:v5];
  }
  else {
  uint64_t v7 = [v6 publicKeyLookupWithIdentifier:a1[5] certificate:v5 result:v11];
  }
  uint64_t v8 = *(void *)(a1[6] + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

void __58___SFKeychainManager_identityForIdentifier_resultHandler___block_invoke(uint64_t a1)
{
  unsigned int v23 = 0;
  int v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v22 = 0;
  uint64_t v4 = [v2 findPrivateKeyWithIdentifier:v3 certificate:&v22 result:&v23];
  id v5 = v22;
  id v6 = *(void **)(a1 + 32);
  if (v4)
  {
    uint64_t v7 = [v6 foundPrivateKey:v4 certificate:v5];
    uint64_t v8 = [*(id *)(a1 + 32) keychainReplyQueue];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __58___SFKeychainManager_identityForIdentifier_resultHandler___block_invoke_2;
    v19[3] = &unk_1E6379750;
    id v9 = &v21;
    id v10 = *(id *)(a1 + 48);
    unsigned int v11 = &v20;
    v20 = v7;
    id v21 = v10;
    id v12 = v7;
    v13 = v19;
  }
  else
  {
    uint64_t v14 = [v6 publicKeyLookupWithIdentifier:*(void *)(a1 + 40) certificate:v5 result:v23];
    uint64_t v8 = [*(id *)(a1 + 32) keychainReplyQueue];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __58___SFKeychainManager_identityForIdentifier_resultHandler___block_invoke_3;
    v16[3] = &unk_1E6379750;
    id v9 = &v18;
    id v15 = *(id *)(a1 + 48);
    unsigned int v11 = &v17;
    uint64_t v17 = v14;
    id v18 = v15;
    id v12 = v14;
    v13 = v16;
  }
  dispatch_async(v8, v13);
}

uint64_t __58___SFKeychainManager_identityForIdentifier_resultHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __58___SFKeychainManager_identityForIdentifier_resultHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __61___SFKeychainManager_removeItemWithIdentifier_resultHandler___block_invoke(uint64_t a1)
{
  v28[4] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F3B980];
  v28[0] = *MEMORY[0x1E4F3B9A0];
  v28[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F3B998];
  v28[2] = *MEMORY[0x1E4F3B988];
  v28[3] = v3;
  [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:4];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    char v6 = 0;
    uint64_t v7 = *(void *)v22;
    uint64_t v8 = *MEMORY[0x1E4F3B788];
    uint64_t v9 = *MEMORY[0x1E4F3B978];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v12 = *(void *)(a1 + 32);
        v25[0] = v8;
        v25[1] = v9;
        v26[0] = v12;
        v26[1] = v11;
        CFDictionaryRef v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];
        OSStatus v14 = SecItemDelete(v13);
        v6 |= v14 == 0;
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v5);
  }
  else
  {
    OSStatus v14 = 0;
    char v6 = 0;
  }

  if (*(void *)(a1 + 48))
  {
    id v15 = [*(id *)(a1 + 40) keychainReplyQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61___SFKeychainManager_removeItemWithIdentifier_resultHandler___block_invoke_2;
    block[3] = &unk_1E63797A0;
    char v20 = v6 & 1;
    id v18 = *(id *)(a1 + 48);
    OSStatus v19 = v14;
    dispatch_async(v15, block);
  }
}

void __61___SFKeychainManager_removeItemWithIdentifier_resultHandler___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 44))
  {
    uint64_t v2 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v2();
  }
  else
  {
    id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:*(int *)(a1 + 40) userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

@end