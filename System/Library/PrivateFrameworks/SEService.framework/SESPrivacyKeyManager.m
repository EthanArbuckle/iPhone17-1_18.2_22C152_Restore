@interface SESPrivacyKeyManager
+ (id)sharedManager;
- (BOOL)deletePrivacyKey:(id)a3 outError:(id *)a4;
- (id)createPrivacyKeyForGroupIdentifier:(id)a3 withOptions:(id)a4 outError:(id *)a5;
- (id)decryptPayload:(id)a3 withGroupIdentifier:(id)a4 outError:(id *)a5;
- (id)encryptData:(id)a3 scheme:(id)a4 recipientPublicKey:(id)a5 outError:(id *)a6;
- (id)privacyKeysForGroupIdentifier:(id)a3 privacyKeyIdentifier:(id)a4 outError:(id *)a5;
@end

@implementation SESPrivacyKeyManager

+ (id)sharedManager
{
  if (sharedManager_onceToken[0] != -1) {
    dispatch_once(sharedManager_onceToken, &__block_literal_global_7);
  }
  v2 = (void *)sharedManager_shared;
  return v2;
}

uint64_t __37__SESPrivacyKeyManager_sharedManager__block_invoke()
{
  sharedManager_shared = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (id)privacyKeysForGroupIdentifier:(id)a3 privacyKeyIdentifier:(id)a4 outError:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__10;
  v26 = __Block_byref_object_dispose__10;
  id v27 = 0;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__10;
  v20 = __Block_byref_object_dispose__10;
  id v21 = 0;
  +[SESClient sharedClient]();
  v9 = (id *)objc_claimAutoreleasedReturnValue();
  v10 = (id *)(v17 + 5);
  id obj = (id)v17[5];
  v11 = -[SESClient synchronousRemoteObjectProxyWithError:](v9, &obj);
  objc_storeStrong(v10, obj);

  if (v11 && !v17[5])
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __84__SESPrivacyKeyManager_privacyKeysForGroupIdentifier_privacyKeyIdentifier_outError___block_invoke;
    v14[3] = &unk_264219440;
    v14[4] = &v22;
    v14[5] = &v16;
    [v11 privacyKeysForGroupIdentifier:v7 keyIdentifier:v8 completion:v14];
    if (a5) {
      *a5 = (id) v17[5];
    }
    id v12 = (id)v23[5];
  }
  else if (a5)
  {
    SESEnsureError();
    id v12 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v12 = 0;
  }

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v12;
}

void __84__SESPrivacyKeyManager_privacyKeysForGroupIdentifier_privacyKeyIdentifier_outError___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (id)createPrivacyKeyForGroupIdentifier:(id)a3 withOptions:(id)a4 outError:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__10;
  v26 = __Block_byref_object_dispose__10;
  id v27 = 0;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__10;
  v20 = __Block_byref_object_dispose__10;
  id v21 = 0;
  +[SESClient sharedClient]();
  uint64_t v9 = (id *)objc_claimAutoreleasedReturnValue();
  v10 = (id *)(v17 + 5);
  id obj = (id)v17[5];
  id v11 = -[SESClient synchronousRemoteObjectProxyWithError:](v9, &obj);
  objc_storeStrong(v10, obj);

  if (v11 && !v17[5])
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __80__SESPrivacyKeyManager_createPrivacyKeyForGroupIdentifier_withOptions_outError___block_invoke;
    v14[3] = &unk_264219E00;
    v14[4] = &v22;
    v14[5] = &v16;
    [v11 createPrivacyKeyForGroupIdentifier:v7 withOptions:v8 completion:v14];
    if (a5) {
      *a5 = (id) v17[5];
    }
    id v12 = (id)v23[5];
  }
  else if (a5)
  {
    SESEnsureError();
    id v12 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v12 = 0;
  }

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v12;
}

void __80__SESPrivacyKeyManager_createPrivacyKeyForGroupIdentifier_withOptions_outError___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)deletePrivacyKey:(id)a3 outError:(id *)a4
{
  id v5 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__10;
  v17 = __Block_byref_object_dispose__10;
  id v18 = 0;
  +[SESClient sharedClient]();
  id v6 = (id *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = (id *)(v14 + 5);
  id obj = (id)v14[5];
  id v8 = -[SESClient synchronousRemoteObjectProxyWithError:](v6, &obj);
  objc_storeStrong(v7, obj);

  if (v8 && !v14[5])
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __50__SESPrivacyKeyManager_deletePrivacyKey_outError___block_invoke;
    v11[3] = &unk_2642194D8;
    v11[4] = &v13;
    [v8 deletePrivacyKey:v5 completion:v11];
    if (a4) {
      *a4 = (id) v14[5];
    }
    BOOL v9 = v14[5] == 0;
  }
  else if (a4)
  {
    SESEnsureError();
    BOOL v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v9 = 0;
  }

  _Block_object_dispose(&v13, 8);
  return v9;
}

void __50__SESPrivacyKeyManager_deletePrivacyKey_outError___block_invoke(uint64_t a1, void *a2)
{
}

- (id)decryptPayload:(id)a3 withGroupIdentifier:(id)a4 outError:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__10;
  v26 = __Block_byref_object_dispose__10;
  id v27 = 0;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__10;
  v20 = __Block_byref_object_dispose__10;
  id v21 = 0;
  +[SESClient sharedClient]();
  BOOL v9 = (id *)objc_claimAutoreleasedReturnValue();
  v10 = (id *)(v17 + 5);
  id obj = (id)v17[5];
  id v11 = -[SESClient synchronousRemoteObjectProxyWithError:](v9, &obj);
  objc_storeStrong(v10, obj);

  if (v11 && !v17[5])
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __68__SESPrivacyKeyManager_decryptPayload_withGroupIdentifier_outError___block_invoke;
    v14[3] = &unk_264219528;
    v14[4] = &v22;
    v14[5] = &v16;
    [v11 decryptPayload:v7 withGroupIdentifier:v8 completion:v14];
    if (a5) {
      *a5 = (id) v17[5];
    }
    id v12 = (id)v23[5];
  }
  else if (a5)
  {
    SESEnsureError();
    id v12 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v12 = 0;
  }

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v12;
}

void __68__SESPrivacyKeyManager_decryptPayload_withGroupIdentifier_outError___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (id)encryptData:(id)a3 scheme:(id)a4 recipientPublicKey:(id)a5 outError:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__10;
  v29 = __Block_byref_object_dispose__10;
  id v30 = 0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__10;
  v23 = __Block_byref_object_dispose__10;
  id v24 = 0;
  +[SESClient sharedClient]();
  id v12 = (id *)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = (id *)(v20 + 5);
  id obj = (id)v20[5];
  v14 = -[SESClient synchronousRemoteObjectProxyWithError:](v12, &obj);
  objc_storeStrong(v13, obj);

  if (v14 && !v20[5])
  {
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __71__SESPrivacyKeyManager_encryptData_scheme_recipientPublicKey_outError___block_invoke;
    v17[3] = &unk_264219B88;
    v17[4] = &v25;
    v17[5] = &v19;
    [v14 encryptPayload:v9 encryptionScheme:v10 recipientPublicKey:v11 completion:v17];
    if (a6) {
      *a6 = (id) v20[5];
    }
    id v15 = (id)v26[5];
  }
  else if (a6)
  {
    SESEnsureError();
    id v15 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v15 = 0;
  }

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v15;
}

void __71__SESPrivacyKeyManager_encryptData_scheme_recipientPublicKey_outError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

@end