@interface SEFidoKeyService
+ (id)shared;
- (BOOL)deleteFidoKeyFor:(id)a3 usingSession:(id)a4 withSessionSEID:(id)a5 error:(id *)a6;
- (id)checkFidoKeyPresence:(id)a3 usingSession:(id)a4 withSessionSEID:(id)a5 error:(id *)a6;
- (id)checkMultipleFidoKeyPresence:(id)a3 usingSession:(id)a4 withSessionSEID:(id)a5 error:(id *)a6;
- (id)createFidoKeyForRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 challenge:(id)a5 usingSession:(id)a6 withSessionSEID:(id)a7 error:(id *)a8;
- (id)createFidoKeyForRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 challenge:(id)a5 usingSession:(id)a6 withSessionSEID:(id)a7 externalizedAuth:(id)a8 error:(id *)a9;
- (id)signMultipleWithFidoKeysFor:(id)a3 challenges:(id)a4 forEndpointIdentifiers:(id)a5 usingSession:(id)a6 withSessionSEID:(id)a7 externalizedAuth:(id)a8 error:(id *)a9;
- (id)signWithFidoKeyFor:(id)a3 challenge:(id)a4 forNFCKeyWithIdentifier:(id)a5 usingSession:(id)a6 withSessionSEID:(id)a7 externalizedAuth:(id)a8 error:(id *)a9;
- (id)verifyWithFidoKeyFor:(id)a3 signedChallenge:(id)a4 usingSession:(id)a5 withSessionSEID:(id)a6 error:(id *)a7;
@end

@implementation SEFidoKeyService

+ (id)shared
{
  if (shared_onceToken != -1) {
    dispatch_once(&shared_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)shared_singleton;
  return v2;
}

uint64_t __26__SEFidoKeyService_shared__block_invoke()
{
  shared_singleton = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (id)createFidoKeyForRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 challenge:(id)a5 usingSession:(id)a6 withSessionSEID:(id)a7 externalizedAuth:(id)a8 error:(id *)a9
{
  return [(SEFidoKeyService *)self createFidoKeyForRelyingParty:a3 relyingPartyAccountHash:a4 challenge:a5 usingSession:a6 withSessionSEID:a7 error:a9];
}

- (id)createFidoKeyForRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 challenge:(id)a5 usingSession:(id)a6 withSessionSEID:(id)a7 error:(id *)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__2;
  v36 = __Block_byref_object_dispose__2;
  id v37 = 0;
  +[SESClient sharedClient]();
  v18 = (id *)objc_claimAutoreleasedReturnValue();
  v19 = (id *)(v33 + 5);
  id obj = (id)v33[5];
  v20 = -[SESClient synchronousRemoteObjectProxyWithError:](v18, &obj);
  objc_storeStrong(v19, obj);

  if (v20 && !v33[5])
  {
    uint64_t v25 = 0;
    v26 = &v25;
    uint64_t v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__2;
    v29 = __Block_byref_object_dispose__2;
    id v30 = 0;
    if (v16)
    {
      v22 = +[SEProxy withSession:v16 seid:v17];
    }
    else
    {
      v22 = 0;
    }
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __118__SEFidoKeyService_createFidoKeyForRelyingParty_relyingPartyAccountHash_challenge_usingSession_withSessionSEID_error___block_invoke;
    v24[3] = &unk_264219748;
    v24[4] = &v25;
    v24[5] = &v32;
    [v20 createFiDOKeyForRelyingParty:v13 relyingPartyAccountHash:v14 challenge:v15 usingProxy:v22 callback:v24];
    if (v16) {

    }
    if (a8) {
      *a8 = (id) v33[5];
    }
    id v21 = (id)v26[5];
    _Block_object_dispose(&v25, 8);
  }
  else if (a8)
  {
    SESEnsureError();
    id v21 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v21 = 0;
  }

  _Block_object_dispose(&v32, 8);
  return v21;
}

void __118__SEFidoKeyService_createFidoKeyForRelyingParty_relyingPartyAccountHash_challenge_usingSession_withSessionSEID_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)checkFidoKeyPresence:(id)a3 usingSession:(id)a4 withSessionSEID:(id)a5 error:(id *)a6
{
  v24[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  v24[0] = v10;
  id v11 = (void *)MEMORY[0x263EFF8C0];
  id v12 = a5;
  id v13 = a4;
  id v14 = [v11 arrayWithObjects:v24 count:1];
  id v15 = [(SEFidoKeyService *)self checkMultipleFidoKeyPresence:v14 usingSession:v13 withSessionSEID:v12 error:a6];

  if ([v15 count] == 1
    && ([v15 objectAtIndexedSubscript:0],
        id v16 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v16,
        (isKindOfClass & 1) != 0))
  {
    v18 = SESDefaultLogObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = [v15 objectAtIndexedSubscript:0];
      int v22 = 138412290;
      v23 = v19;
      _os_log_impl(&dword_2146ED000, v18, OS_LOG_TYPE_INFO, "Single Check Presence %@", (uint8_t *)&v22, 0xCu);
    }
    v20 = [v15 objectAtIndexedSubscript:0];
  }
  else if (a6)
  {
    SESEnsureError();
    v20 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)signWithFidoKeyFor:(id)a3 challenge:(id)a4 forNFCKeyWithIdentifier:(id)a5 usingSession:(id)a6 withSessionSEID:(id)a7 externalizedAuth:(id)a8 error:(id *)a9
{
  v38[1] = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  uint64_t v34 = v15;
  v38[0] = v15;
  id v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:1];
  id v37 = v16;
  int v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v37 count:1];
  if (v17)
  {
    id v36 = v17;
    v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v36 count:1];
  }
  else
  {
    v23 = 0;
  }
  id v35 = 0;
  v24 = [(SEFidoKeyService *)self signMultipleWithFidoKeysFor:v21 challenges:v22 forEndpointIdentifiers:v23 usingSession:v18 withSessionSEID:v19 externalizedAuth:v20 error:&v35];
  id v25 = v35;
  if (v17) {

  }
  if ([v24 count] == 1)
  {
    v26 = [v24 objectAtIndexedSubscript:0];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    v28 = [v24 objectAtIndexedSubscript:0];
    if (isKindOfClass) {
      goto LABEL_17;
    }
    objc_opt_class();
    char v29 = objc_opt_isKindOfClass();

    if (v29)
    {
      id v30 = a9;
      if (a9)
      {
        v31 = [v24 objectAtIndexedSubscript:0];
LABEL_13:
        v28 = 0;
        *id v30 = v31;
        goto LABEL_17;
      }
    }
    else
    {
      v28 = a9;
      if (!a9) {
        goto LABEL_17;
      }
      uint64_t v32 = SESDefaultLogObject();
      SESCreateAndLogError();
      *a9 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v30 = a9;
    if (a9)
    {
      v31 = SESEnsureError();
      goto LABEL_13;
    }
  }
  v28 = 0;
LABEL_17:

  return v28;
}

- (id)verifyWithFidoKeyFor:(id)a3 signedChallenge:(id)a4 usingSession:(id)a5 withSessionSEID:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x3032000000;
  uint64_t v32 = __Block_byref_object_copy__2;
  v33 = __Block_byref_object_dispose__2;
  id v34 = 0;
  +[SESClient sharedClient]();
  id v15 = (id *)objc_claimAutoreleasedReturnValue();
  id v16 = (id *)(v30 + 5);
  id obj = (id)v30[5];
  id v17 = -[SESClient synchronousRemoteObjectProxyWithError:](v15, &obj);
  objc_storeStrong(v16, obj);

  if (v17 && !v30[5])
  {
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x3032000000;
    id v25 = __Block_byref_object_copy__2;
    v26 = __Block_byref_object_dispose__2;
    id v27 = 0;
    if (v13)
    {
      id v19 = +[SEProxy withSession:v13 seid:v14];
    }
    else
    {
      id v19 = 0;
    }
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __92__SEFidoKeyService_verifyWithFidoKeyFor_signedChallenge_usingSession_withSessionSEID_error___block_invoke;
    v21[3] = &unk_264219770;
    v21[4] = &v22;
    v21[5] = &v29;
    [v17 verifyWithFidoKeyFor:v11 signedChallenge:v12 usingProxy:v19 callback:v21];
    if (v13) {

    }
    if (a7) {
      *a7 = (id) v30[5];
    }
    id v18 = (id)v23[5];
    _Block_object_dispose(&v22, 8);
  }
  else if (a7)
  {
    SESEnsureError();
    id v18 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v18 = 0;
  }

  _Block_object_dispose(&v29, 8);
  return v18;
}

void __92__SEFidoKeyService_verifyWithFidoKeyFor_signedChallenge_usingSession_withSessionSEID_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (BOOL)deleteFidoKeyFor:(id)a3 usingSession:(id)a4 withSessionSEID:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__2;
  uint64_t v24 = __Block_byref_object_dispose__2;
  id v25 = 0;
  +[SESClient sharedClient]();
  id v12 = (id *)objc_claimAutoreleasedReturnValue();
  id v13 = (id *)(v21 + 5);
  id obj = (id)v21[5];
  id v14 = -[SESClient synchronousRemoteObjectProxyWithError:](v12, &obj);
  objc_storeStrong(v13, obj);

  if (v14 && !v21[5])
  {
    if (v10)
    {
      id v16 = +[SEProxy withSession:v10 seid:v11];
    }
    else
    {
      id v16 = 0;
    }
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __72__SEFidoKeyService_deleteFidoKeyFor_usingSession_withSessionSEID_error___block_invoke;
    v18[3] = &unk_2642194D8;
    v18[4] = &v20;
    [v14 deleteFiDOKeyFor:v9 usingProxy:v16 callback:v18];
    if (v10) {

    }
    if (a6) {
      *a6 = (id) v21[5];
    }
    BOOL v15 = v21[5] == 0;
  }
  else if (a6)
  {
    SESEnsureError();
    BOOL v15 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v15 = 0;
  }

  _Block_object_dispose(&v20, 8);
  return v15;
}

void __72__SEFidoKeyService_deleteFidoKeyFor_usingSession_withSessionSEID_error___block_invoke(uint64_t a1, void *a2)
{
}

- (id)checkMultipleFidoKeyPresence:(id)a3 usingSession:(id)a4 withSessionSEID:(id)a5 error:(id *)a6
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000;
  uint64_t v31 = __Block_byref_object_copy__2;
  uint64_t v32 = __Block_byref_object_dispose__2;
  id v33 = 0;
  +[SESClient sharedClient]();
  id v12 = (id *)objc_claimAutoreleasedReturnValue();
  id v13 = (id *)(v29 + 5);
  id obj = (id)v29[5];
  id v14 = -[SESClient synchronousRemoteObjectProxyWithError:](v12, &obj);
  objc_storeStrong(v13, obj);

  if (v14 && !v29[5])
  {
    uint64_t v21 = 0;
    uint64_t v22 = &v21;
    uint64_t v23 = 0x3032000000;
    uint64_t v24 = __Block_byref_object_copy__2;
    id v25 = __Block_byref_object_dispose__2;
    id v26 = 0;
    if (v10)
    {
      id v16 = +[SEProxy withSession:v10 seid:v11];
    }
    else
    {
      id v16 = 0;
    }
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __84__SEFidoKeyService_checkMultipleFidoKeyPresence_usingSession_withSessionSEID_error___block_invoke;
    v20[3] = &unk_264219440;
    v20[4] = &v21;
    v20[5] = &v28;
    [v14 checkMultipleFidoKeyPresence:v9 usingProxy:v16 callback:v20];
    if (v10) {

    }
    id v17 = SESDefaultLogObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = v22[5];
      *(_DWORD *)buf = 138412290;
      uint64_t v35 = v18;
      _os_log_impl(&dword_2146ED000, v17, OS_LOG_TYPE_INFO, "Multiple Check Presence %@", buf, 0xCu);
    }

    id v15 = (id)v22[5];
    _Block_object_dispose(&v21, 8);
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

  _Block_object_dispose(&v28, 8);
  return v15;
}

void __84__SEFidoKeyService_checkMultipleFidoKeyPresence_usingSession_withSessionSEID_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)signMultipleWithFidoKeysFor:(id)a3 challenges:(id)a4 forEndpointIdentifiers:(id)a5 usingSession:(id)a6 withSessionSEID:(id)a7 externalizedAuth:(id)a8 error:(id *)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  uint64_t v34 = 0;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x3032000000;
  id v37 = __Block_byref_object_copy__2;
  v38 = __Block_byref_object_dispose__2;
  id v39 = 0;
  +[SESClient sharedClient]();
  uint64_t v20 = (id *)objc_claimAutoreleasedReturnValue();
  uint64_t v21 = (id *)(v35 + 5);
  id obj = (id)v35[5];
  uint64_t v22 = -[SESClient synchronousRemoteObjectProxyWithError:](v20, &obj);
  objc_storeStrong(v21, obj);

  if (v22 && !v35[5])
  {
    uint64_t v27 = 0;
    uint64_t v28 = &v27;
    uint64_t v29 = 0x3032000000;
    uint64_t v30 = __Block_byref_object_copy__2;
    uint64_t v31 = __Block_byref_object_dispose__2;
    id v32 = 0;
    if (v17)
    {
      uint64_t v24 = +[SEProxy withSession:v17 seid:v18];
    }
    else
    {
      uint64_t v24 = 0;
    }
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __134__SEFidoKeyService_signMultipleWithFidoKeysFor_challenges_forEndpointIdentifiers_usingSession_withSessionSEID_externalizedAuth_error___block_invoke;
    v26[3] = &unk_264219440;
    v26[4] = &v27;
    v26[5] = &v34;
    [v22 signMultipleWithFidoKeysFor:v14 challenges:v15 forEndpointIdentifiers:v16 externalizedAuth:v19 usingProxy:v24 callback:v26];
    if (v17) {

    }
    id v23 = (id)v28[5];
    _Block_object_dispose(&v27, 8);
  }
  else if (a9)
  {
    SESEnsureError();
    id v23 = 0;
    *a9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v23 = 0;
  }

  _Block_object_dispose(&v34, 8);
  return v23;
}

void __134__SEFidoKeyService_signMultipleWithFidoKeysFor_challenges_forEndpointIdentifiers_usingSession_withSessionSEID_externalizedAuth_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

@end