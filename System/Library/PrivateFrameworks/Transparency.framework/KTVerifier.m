@interface KTVerifier
+ (id)getUIStatusPriority:(unint64_t)a3;
- (BOOL)clearPeerCache:(id)a3 error:(id *)a4;
- (BOOL)ignoreFailure:(id)a3 uuid:(id)a4 error:(id *)a5;
- (BOOL)ignoreFailureForResults:(id)a3 error:(id *)a4;
- (BOOL)markFailureSeenForResults:(id)a3 error:(id *)a4;
- (KTVerifier)initWithApplication:(id)a3;
- (NSString)applicationIdentifier;
- (NSXPCConnection)connection;
- (TransparencyApplication)application;
- (id)unimplementedError:(id)a3;
- (id)urisFromResults:(id)a3;
- (id)validateEnrollmentUri:(id)a3 accountKey:(id)a4 loggableData:(id)a5 insertResponse:(id)a6 error:(id *)a7;
- (id)validateEnrollmentUri:(id)a3 accountKey:(id)a4 loggableData:(id)a5 queryRequest:(id)a6 insertResponse:(id)a7 error:(id *)a8;
- (id)validatePeerUri:(id)a3 accountKey:(id)a4 loggableDatas:(id)a5 queryRequest:(id)a6 queryResponse:(id)a7 error:(id *)a8;
- (id)validatePeerUri:(id)a3 accountKey:(id)a4 loggableDatas:(id)a5 queryResponse:(id)a6 error:(id *)a7;
- (unint64_t)getDisplayStatusForResults:(id)a3 isSelfOptedIn:(BOOL)a4;
- (void)batchQuery:(id)a3 userInitiated:(BOOL)a4 block:(id)a5;
- (void)clearLogClientConfiguration:(id)a3;
- (void)clearPublicKeyStoreState:(id)a3;
- (void)clearState:(id)a3;
- (void)configurationBagFetch:(id)a3;
- (void)convertToSelfRequest:(id)a3 serverDatas:(id)a4 syncedDatas:(id)a5 accountKey:(id)a6 queryRequest:(id)a7 queryResponse:(id)a8 updateCompletionBlock:(id)a9;
- (void)convertToSelfRequest:(id)a3 serverDatas:(id)a4 syncedDatas:(id)a5 accountKey:(id)a6 queryResponse:(id)a7 updateCompletionBlock:(id)a8;
- (void)convertToSelfRequest:(id)a3 serverDatas:(id)a4 syncedDatas:(id)a5 queryRequest:(id)a6 queryResponse:(id)a7 updateCompletionBlock:(id)a8;
- (void)convertToSelfRequest:(id)a3 serverDatas:(id)a4 syncedDatas:(id)a5 queryResponse:(id)a6 updateCompletionBlock:(id)a7;
- (void)copyApplicationState:(id)a3;
- (void)copyApplicationTranscript:(id)a3;
- (void)copyDaemonState:(id)a3;
- (void)copyDataStoreStatistics:(id)a3;
- (void)copyDeviceStatus:(id)a3 complete:(id)a4;
- (void)copyKeyStoreState:(id)a3;
- (void)copyKeyStoreStateFromDisk:(id)a3;
- (void)copyLogClientConfiguration:(id)a3;
- (void)forceApplicationConfig:(id)a3;
- (void)forceApplicationKeysFetch:(id)a3;
- (void)forceCloudConfigUpdate:(id)a3;
- (void)forceConfigUpdate:(id)a3;
- (void)forceDutyCycle:(id)a3;
- (void)forceValidateUUID:(id)a3 uri:(id)a4 block:(id)a5;
- (void)forceValidateUUID:(id)a3 uri:(id)a4 completionBlock:(id)a5;
- (void)getCachedValidatePeerResults:(id)a3 completionBlock:(id)a4;
- (void)getValidatePeerResult:(id)a3 uuid:(id)a4 completionBlock:(id)a5;
- (void)getValidatePeerResult:(id)a3 uuid:(id)a4 fetchNow:(BOOL)a5 completionBlock:(id)a6;
- (void)initiateQueryForUris:(id)a3 completionBlock:(id)a4;
- (void)invokeXPCAsynchronousCallWithBlock:(id)a3 failureBlock:(id)a4;
- (void)invokeXPCSynchronousCallWithBlock:(id)a3 failureBlock:(id)a4;
- (void)resetRequestToPending:(id)a3 block:(id)a4;
- (void)setApplication:(id)a3;
- (void)validateEnrollmentResult:(id)a3 uuid:(id)a4 completionBlock:(id)a5;
- (void)validateEnrollmentUri:(id)a3 accountKey:(id)a4 loggableData:(id)a5 insertResponse:(id)a6 promiseCompletionBlock:(id)a7;
- (void)validatePeerResult:(id)a3 uuid:(id)a4 completionBlock:(id)a5;
- (void)validatePeerUri:(id)a3 accountKey:(id)a4 loggableDatas:(id)a5 queryResponse:(id)a6 promiseCompletionBlock:(id)a7;
- (void)validatePeers:(id)a3 fetchNow:(BOOL)a4 completionBlock:(id)a5;
- (void)validateSelfResult:(id)a3 uuid:(id)a4 syncedDatas:(id)a5 completionBlock:(id)a6;
@end

@implementation KTVerifier

- (KTVerifier)initWithApplication:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = +[TransparencyApplication applicationValueForIdentifier:v5];

  if (v6)
  {
    v14.receiver = self;
    v14.super_class = (Class)KTVerifier;
    v7 = [(KTVerifier *)&v14 init];
    v8 = v7;
    if (v7)
    {
      objc_storeStrong((id *)&v7->_applicationIdentifier, a3);
      v9 = [[TransparencyApplication alloc] initWithIdentifier:v8->_applicationIdentifier];
      application = v8->_application;
      v8->_application = v9;
    }
    self = v8;
    v11 = self;
  }
  else
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_8);
    }
    v12 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v5;
      _os_log_impl(&dword_226345000, v12, OS_LOG_TYPE_ERROR, "Unknown application identifier: %@", buf, 0xCu);
    }
    v11 = 0;
  }

  return v11;
}

- (id)unimplementedError:(id)a3
{
  return +[TransparencyError unimplementedError:a3];
}

uint64_t __34__KTVerifier_initWithApplication___block_invoke()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

- (void)invokeXPCAsynchronousCallWithBlock:(id)a3 failureBlock:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __62__KTVerifier_invokeXPCAsynchronousCallWithBlock_failureBlock___block_invoke;
  v11[3] = &unk_26479EF68;
  id v12 = v6;
  id v13 = v5;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __62__KTVerifier_invokeXPCAsynchronousCallWithBlock_failureBlock___block_invoke_12;
  v9[3] = &unk_26479E748;
  id v10 = v12;
  id v7 = v12;
  id v8 = v5;
  +[TransparencyXPCConnection invokeXPCAsynchronousCallWithBlock:v11 errorHandler:v9];
}

void __62__KTVerifier_invokeXPCAsynchronousCallWithBlock_failureBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_10_0);
    }
    v9 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      v11 = v7;
      _os_log_impl(&dword_226345000, v9, OS_LOG_TYPE_ERROR, "Unknown invokeXPCAsynchronousCallWithBlock error: %@", (uint8_t *)&v10, 0xCu);
    }
    id v8 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    id v8 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v8();
}

uint64_t __62__KTVerifier_invokeXPCAsynchronousCallWithBlock_failureBlock___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __62__KTVerifier_invokeXPCAsynchronousCallWithBlock_failureBlock___block_invoke_12(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)invokeXPCSynchronousCallWithBlock:(id)a3 failureBlock:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __61__KTVerifier_invokeXPCSynchronousCallWithBlock_failureBlock___block_invoke;
  v11[3] = &unk_26479EF68;
  id v12 = v6;
  id v13 = v5;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __61__KTVerifier_invokeXPCSynchronousCallWithBlock_failureBlock___block_invoke_16;
  v9[3] = &unk_26479E748;
  id v10 = v12;
  id v7 = v12;
  id v8 = v5;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:v11 errorHandler:v9];
}

void __61__KTVerifier_invokeXPCSynchronousCallWithBlock_failureBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_15);
    }
    v9 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      v11 = v7;
      _os_log_impl(&dword_226345000, v9, OS_LOG_TYPE_ERROR, "Unknown invokeXPCSynchronousCallWithBlock error: %@", (uint8_t *)&v10, 0xCu);
    }
    id v8 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    id v8 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v8();
}

uint64_t __61__KTVerifier_invokeXPCSynchronousCallWithBlock_failureBlock___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __61__KTVerifier_invokeXPCSynchronousCallWithBlock_failureBlock___block_invoke_16(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)validatePeerUri:(id)a3 accountKey:(id)a4 loggableDatas:(id)a5 queryResponse:(id)a6 error:(id *)a7
{
  return [(KTVerifier *)self validatePeerUri:a3 accountKey:a4 loggableDatas:a5 queryRequest:0 queryResponse:a6 error:a7];
}

- (id)validatePeerUri:(id)a3 accountKey:(id)a4 loggableDatas:(id)a5 queryRequest:(id)a6 queryResponse:(id)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x3032000000;
  v49[3] = __Block_byref_object_copy__3;
  v49[4] = __Block_byref_object_dispose__3;
  v50 = 0;
  v50 = self->_applicationIdentifier;
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__3;
  v47 = __Block_byref_object_dispose__3;
  id v48 = 0;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__3;
  v41 = __Block_byref_object_dispose__3;
  id v42 = 0;
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __88__KTVerifier_validatePeerUri_accountKey_loggableDatas_queryRequest_queryResponse_error___block_invoke;
  v28[3] = &unk_26479EFB8;
  id v19 = v14;
  id v29 = v19;
  v34 = v49;
  id v20 = v15;
  id v30 = v20;
  id v21 = v16;
  id v31 = v21;
  id v22 = v17;
  id v32 = v22;
  id v23 = v18;
  id v33 = v23;
  v35 = &v37;
  v36 = &v43;
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __88__KTVerifier_validatePeerUri_accountKey_loggableDatas_queryRequest_queryResponse_error___block_invoke_2_22;
  v27[3] = &unk_26479EB08;
  v27[4] = &v37;
  [(KTVerifier *)self invokeXPCSynchronousCallWithBlock:v28 failureBlock:v27];
  if (a8)
  {
    v24 = (void *)v38[5];
    if (v24) {
      *a8 = v24;
    }
  }
  id v25 = (id)v44[5];

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v43, 8);

  _Block_object_dispose(v49, 8);

  return v25;
}

void __88__KTVerifier_validatePeerUri_accountKey_loggableDatas_queryRequest_queryResponse_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_18);
  }
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_INFO, "Sending synchronous validatePeerUri", buf, 2u);
  }
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 56);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __88__KTVerifier_validatePeerUri_accountKey_loggableDatas_queryRequest_queryResponse_error___block_invoke_19;
  v11[3] = &unk_26479EF90;
  long long v12 = *(_OWORD *)(a1 + 80);
  [v3 validatePeerUri:v7 application:v6 accountKey:v8 loggableDatas:v9 queryRequest:v10 queryResponse:v5 promiseCompletionBlock:v11];
}

uint64_t __88__KTVerifier_validatePeerUri_accountKey_loggableDatas_queryRequest_queryResponse_error___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

void __88__KTVerifier_validatePeerUri_accountKey_loggableDatas_queryRequest_queryResponse_error___block_invoke_19(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v9 = a4;
  if (v9) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a4);
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

void __88__KTVerifier_validatePeerUri_accountKey_loggableDatas_queryRequest_queryResponse_error___block_invoke_2_22(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

- (id)validateEnrollmentUri:(id)a3 accountKey:(id)a4 loggableData:(id)a5 insertResponse:(id)a6 error:(id *)a7
{
  return [(KTVerifier *)self validateEnrollmentUri:a3 accountKey:a4 loggableData:a5 queryRequest:0 insertResponse:a6 error:a7];
}

- (id)validateEnrollmentUri:(id)a3 accountKey:(id)a4 loggableData:(id)a5 queryRequest:(id)a6 insertResponse:(id)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x3032000000;
  v48[3] = __Block_byref_object_copy__3;
  v48[4] = __Block_byref_object_dispose__3;
  id v49 = 0;
  id v49 = [(KTVerifier *)self applicationIdentifier];
  uint64_t v42 = 0;
  uint64_t v43 = &v42;
  uint64_t v44 = 0x3032000000;
  uint64_t v45 = __Block_byref_object_copy__3;
  v46 = __Block_byref_object_dispose__3;
  id v47 = 0;
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x3032000000;
  uint64_t v39 = __Block_byref_object_copy__3;
  v40 = __Block_byref_object_dispose__3;
  id v41 = 0;
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __94__KTVerifier_validateEnrollmentUri_accountKey_loggableData_queryRequest_insertResponse_error___block_invoke;
  v27[3] = &unk_26479EFB8;
  id v19 = v14;
  id v28 = v19;
  id v33 = v48;
  id v20 = v15;
  id v29 = v20;
  id v21 = v16;
  id v30 = v21;
  id v22 = v17;
  id v31 = v22;
  id v23 = v18;
  id v32 = v23;
  v34 = &v36;
  v35 = &v42;
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __94__KTVerifier_validateEnrollmentUri_accountKey_loggableData_queryRequest_insertResponse_error___block_invoke_2_26;
  v26[3] = &unk_26479EB08;
  v26[4] = &v36;
  [(KTVerifier *)self invokeXPCSynchronousCallWithBlock:v27 failureBlock:v26];
  if (a8) {
    *a8 = (id) v37[5];
  }
  id v24 = (id)v43[5];

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);

  _Block_object_dispose(v48, 8);

  return v24;
}

void __94__KTVerifier_validateEnrollmentUri_accountKey_loggableData_queryRequest_insertResponse_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_24_1);
  }
  id v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_INFO, "Sending synchronous validateEnrollmentUri", buf, 2u);
  }
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 56);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __94__KTVerifier_validateEnrollmentUri_accountKey_loggableData_queryRequest_insertResponse_error___block_invoke_25;
  v11[3] = &unk_26479EF90;
  long long v12 = *(_OWORD *)(a1 + 80);
  [v3 validateEnrollmentUri:v7 application:v6 accountKey:v8 loggableData:v9 queryRequest:v10 queryResponse:v5 promiseCompletionBlock:v11];
}

uint64_t __94__KTVerifier_validateEnrollmentUri_accountKey_loggableData_queryRequest_insertResponse_error___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

void __94__KTVerifier_validateEnrollmentUri_accountKey_loggableData_queryRequest_insertResponse_error___block_invoke_25(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v9 = a4;
  if (v9) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a4);
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

void __94__KTVerifier_validateEnrollmentUri_accountKey_loggableData_queryRequest_insertResponse_error___block_invoke_2_26(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

- (void)validatePeerUri:(id)a3 accountKey:(id)a4 loggableDatas:(id)a5 queryResponse:(id)a6 promiseCompletionBlock:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = [(KTVerifier *)self applicationIdentifier];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __92__KTVerifier_validatePeerUri_accountKey_loggableDatas_queryResponse_promiseCompletionBlock___block_invoke;
  v27[3] = &unk_26479EFE0;
  id v28 = v12;
  id v29 = v17;
  id v30 = v13;
  id v31 = v14;
  id v32 = v15;
  id v33 = v16;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __92__KTVerifier_validatePeerUri_accountKey_loggableDatas_queryResponse_promiseCompletionBlock___block_invoke_29;
  v24[3] = &unk_26479E8D0;
  id v25 = v28;
  id v26 = v33;
  id v18 = v28;
  id v19 = v33;
  id v20 = v15;
  id v21 = v14;
  id v22 = v13;
  id v23 = v17;
  [(KTVerifier *)self invokeXPCAsynchronousCallWithBlock:v27 failureBlock:v24];
}

void __92__KTVerifier_validatePeerUri_accountKey_loggableDatas_queryResponse_promiseCompletionBlock___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_28);
  }
  id v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_INFO, "Sending validatePeerUri", buf, 2u);
  }
  [v3 validatePeerUri:a1[4] application:a1[5] accountKey:a1[6] loggableDatas:a1[7] queryRequest:0 queryResponse:a1[8] promiseCompletionBlock:a1[9]];
}

uint64_t __92__KTVerifier_validatePeerUri_accountKey_loggableDatas_queryResponse_promiseCompletionBlock___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __92__KTVerifier_validatePeerUri_accountKey_loggableDatas_queryResponse_promiseCompletionBlock___block_invoke_29(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0, a2);
}

- (void)validatePeerResult:(id)a3 uuid:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __54__KTVerifier_validatePeerResult_uuid_completionBlock___block_invoke;
  v17[3] = &unk_26479F030;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __54__KTVerifier_validatePeerResult_uuid_completionBlock___block_invoke_2_34;
  v14[3] = &unk_26479E8D0;
  id v15 = v18;
  id v16 = v20;
  id v11 = v18;
  id v12 = v20;
  id v13 = v9;
  [(KTVerifier *)self invokeXPCAsynchronousCallWithBlock:v17 failureBlock:v14];
}

void __54__KTVerifier_validatePeerResult_uuid_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_31);
  }
  id v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_INFO, "Sending validatePeerResult", buf, 2u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__KTVerifier_validatePeerResult_uuid_completionBlock___block_invoke_32;
  v7[3] = &unk_26479F008;
  id v8 = *(id *)(a1 + 48);
  [v3 validatePeerResult:v5 uuid:v6 fetchNow:0 completionBlock:v7];
}

uint64_t __54__KTVerifier_validatePeerResult_uuid_completionBlock___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

void __54__KTVerifier_validatePeerResult_uuid_completionBlock___block_invoke_32(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id v10 = [v6 uri];
  uint64_t v7 = [v6 succeed];
  uint64_t v8 = [v6 optedIn];
  id v9 = [v6 loggableDatas];

  (*(void (**)(uint64_t, id, uint64_t, uint64_t, void *, id))(v4 + 16))(v4, v10, v7, v8, v9, v5);
}

uint64_t __54__KTVerifier_validatePeerResult_uuid_completionBlock___block_invoke_2_34(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, void, void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0, 0, 0, a2);
}

- (void)getValidatePeerResult:(id)a3 uuid:(id)a4 fetchNow:(BOOL)a5 completionBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __66__KTVerifier_getValidatePeerResult_uuid_fetchNow_completionBlock___block_invoke;
  v20[3] = &unk_26479F058;
  id v21 = v10;
  id v22 = v11;
  BOOL v24 = a5;
  id v23 = v12;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __66__KTVerifier_getValidatePeerResult_uuid_fetchNow_completionBlock___block_invoke_37;
  v16[3] = &unk_26479F080;
  id v18 = self;
  id v19 = v23;
  id v17 = v21;
  id v13 = v21;
  id v14 = v23;
  id v15 = v11;
  [(KTVerifier *)self invokeXPCAsynchronousCallWithBlock:v20 failureBlock:v16];
}

void __66__KTVerifier_getValidatePeerResult_uuid_fetchNow_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_36_1);
  }
  uint64_t v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_INFO, "Sending validatePeerResult", v5, 2u);
  }
  [v3 validatePeerResult:*(void *)(a1 + 32) uuid:*(void *)(a1 + 40) fetchNow:*(unsigned __int8 *)(a1 + 56) completionBlock:*(void *)(a1 + 48)];
}

uint64_t __66__KTVerifier_getValidatePeerResult_uuid_fetchNow_completionBlock___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

void __66__KTVerifier_getValidatePeerResult_uuid_fetchNow_completionBlock___block_invoke_37(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 48);
  id v4 = a2;
  id v5 = [KTVerifierResult alloc];
  uint64_t v6 = *(void *)(a1 + 32);
  id v8 = [*(id *)(a1 + 40) applicationIdentifier];
  uint64_t v7 = [(KTVerifierResult *)v5 initWithUri:v6 application:v8];
  (*(void (**)(uint64_t, KTVerifierResult *, id))(v3 + 16))(v3, v7, v4);
}

- (void)getValidatePeerResult:(id)a3 uuid:(id)a4 completionBlock:(id)a5
{
}

- (void)validateSelfResult:(id)a3 uuid:(id)a4 syncedDatas:(id)a5 completionBlock:(id)a6
{
  id v10 = a6;
  id v11 = a3;
  NSStringFromSelector(a2);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  id v12 = [(KTVerifier *)self unimplementedError:v13];
  (*((void (**)(id, id, void, void, void, void *))a6 + 2))(v10, v11, 0, 0, 0, v12);
}

- (void)validateEnrollmentUri:(id)a3 accountKey:(id)a4 loggableData:(id)a5 insertResponse:(id)a6 promiseCompletionBlock:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = [(KTVerifier *)self applicationIdentifier];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __98__KTVerifier_validateEnrollmentUri_accountKey_loggableData_insertResponse_promiseCompletionBlock___block_invoke;
  v27[3] = &unk_26479EFE0;
  id v28 = v12;
  id v29 = v17;
  id v30 = v13;
  id v31 = v14;
  id v32 = v15;
  id v33 = v16;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __98__KTVerifier_validateEnrollmentUri_accountKey_loggableData_insertResponse_promiseCompletionBlock___block_invoke_41;
  v24[3] = &unk_26479E8D0;
  id v25 = v28;
  id v26 = v33;
  id v18 = v28;
  id v19 = v33;
  id v20 = v15;
  id v21 = v14;
  id v22 = v13;
  id v23 = v17;
  [(KTVerifier *)self invokeXPCAsynchronousCallWithBlock:v27 failureBlock:v24];
}

void __98__KTVerifier_validateEnrollmentUri_accountKey_loggableData_insertResponse_promiseCompletionBlock___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_40);
  }
  id v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_INFO, "Sending validateEnrollmentUri", buf, 2u);
  }
  [v3 validateEnrollmentUri:a1[4] application:a1[5] accountKey:a1[6] loggableData:a1[7] queryRequest:0 queryResponse:a1[8] promiseCompletionBlock:a1[9]];
}

uint64_t __98__KTVerifier_validateEnrollmentUri_accountKey_loggableData_insertResponse_promiseCompletionBlock___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __98__KTVerifier_validateEnrollmentUri_accountKey_loggableData_insertResponse_promiseCompletionBlock___block_invoke_41(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0, a2);
}

- (void)validateEnrollmentResult:(id)a3 uuid:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __60__KTVerifier_validateEnrollmentResult_uuid_completionBlock___block_invoke;
  v17[3] = &unk_26479F030;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __60__KTVerifier_validateEnrollmentResult_uuid_completionBlock___block_invoke_44;
  v14[3] = &unk_26479E8D0;
  id v15 = v18;
  id v16 = v20;
  id v11 = v18;
  id v12 = v20;
  id v13 = v9;
  [(KTVerifier *)self invokeXPCAsynchronousCallWithBlock:v17 failureBlock:v14];
}

void __60__KTVerifier_validateEnrollmentResult_uuid_completionBlock___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_43);
  }
  id v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_INFO, "Sending validateEnrollmentResult", v5, 2u);
  }
  [v3 validateEnrollmentResult:a1[4] uuid:a1[5] completionBlock:a1[6]];
}

uint64_t __60__KTVerifier_validateEnrollmentResult_uuid_completionBlock___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __60__KTVerifier_validateEnrollmentResult_uuid_completionBlock___block_invoke_44(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, void, void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0, 0, 0, a2);
}

- (void)convertToSelfRequest:(id)a3 serverDatas:(id)a4 syncedDatas:(id)a5 queryResponse:(id)a6 updateCompletionBlock:(id)a7
{
}

- (void)convertToSelfRequest:(id)a3 serverDatas:(id)a4 syncedDatas:(id)a5 accountKey:(id)a6 queryResponse:(id)a7 updateCompletionBlock:(id)a8
{
}

- (void)convertToSelfRequest:(id)a3 serverDatas:(id)a4 syncedDatas:(id)a5 queryRequest:(id)a6 queryResponse:(id)a7 updateCompletionBlock:(id)a8
{
}

- (void)convertToSelfRequest:(id)a3 serverDatas:(id)a4 syncedDatas:(id)a5 accountKey:(id)a6 queryRequest:(id)a7 queryResponse:(id)a8 updateCompletionBlock:(id)a9
{
  id v12 = a9;
  id v13 = a3;
  NSStringFromSelector(a2);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  id v14 = [(KTVerifier *)self unimplementedError:v15];
  (*((void (**)(id, id, void *))a9 + 2))(v12, v13, v14);
}

- (void)forceValidateUUID:(id)a3 uri:(id)a4 block:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __42__KTVerifier_forceValidateUUID_uri_block___block_invoke;
  v16[3] = &unk_26479F030;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __42__KTVerifier_forceValidateUUID_uri_block___block_invoke_47;
  v14[3] = &unk_26479E748;
  id v15 = v19;
  id v11 = v19;
  id v12 = v9;
  id v13 = v8;
  [(KTVerifier *)self invokeXPCAsynchronousCallWithBlock:v16 failureBlock:v14];
}

void __42__KTVerifier_forceValidateUUID_uri_block___block_invoke(void *a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_46);
  }
  id v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = a1[4];
    int v6 = 138412290;
    uint64_t v7 = v5;
    _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_INFO, "Sending forceValidateUUID(%@)", (uint8_t *)&v6, 0xCu);
  }
  [v3 forceValidateUUID:a1[4] uri:a1[5] block:a1[6]];
}

uint64_t __42__KTVerifier_forceValidateUUID_uri_block___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __42__KTVerifier_forceValidateUUID_uri_block___block_invoke_47(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)forceValidateUUID:(id)a3 uri:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __52__KTVerifier_forceValidateUUID_uri_completionBlock___block_invoke;
  v17[3] = &unk_26479F030;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __52__KTVerifier_forceValidateUUID_uri_completionBlock___block_invoke_50;
  v14[3] = &unk_26479E8D0;
  id v15 = v19;
  id v16 = v20;
  id v11 = v19;
  id v12 = v20;
  id v13 = v8;
  [(KTVerifier *)self invokeXPCAsynchronousCallWithBlock:v17 failureBlock:v14];
}

void __52__KTVerifier_forceValidateUUID_uri_completionBlock___block_invoke(void *a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_49);
  }
  id v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = a1[4];
    int v6 = 138412290;
    uint64_t v7 = v5;
    _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_INFO, "Sending forceValidateUUID(%@)", (uint8_t *)&v6, 0xCu);
  }
  [v3 forceValidateUUID:a1[4] uri:a1[5] completionBlock:a1[6]];
}

uint64_t __52__KTVerifier_forceValidateUUID_uri_completionBlock___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __52__KTVerifier_forceValidateUUID_uri_completionBlock___block_invoke_50(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, void, void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0, 0, 0, a2);
}

- (void)resetRequestToPending:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __42__KTVerifier_resetRequestToPending_block___block_invoke;
  v12[3] = &unk_26479F0A8;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __42__KTVerifier_resetRequestToPending_block___block_invoke_53;
  v10[3] = &unk_26479E748;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(KTVerifier *)self invokeXPCAsynchronousCallWithBlock:v12 failureBlock:v10];
}

void __42__KTVerifier_resetRequestToPending_block___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_52_0);
  }
  id v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412290;
    uint64_t v7 = v5;
    _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_INFO, "Sending resetRequestToPending(%@)", (uint8_t *)&v6, 0xCu);
  }
  [v3 resetRequestToPending:*(void *)(a1 + 32) block:*(void *)(a1 + 40)];
}

uint64_t __42__KTVerifier_resetRequestToPending_block___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __42__KTVerifier_resetRequestToPending_block___block_invoke_53(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)clearState:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __25__KTVerifier_clearState___block_invoke;
  v8[3] = &unk_26479F0A8;
  v8[4] = self;
  id v9 = v4;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __25__KTVerifier_clearState___block_invoke_56;
  v6[3] = &unk_26479E748;
  id v7 = v9;
  id v5 = v9;
  [(KTVerifier *)self invokeXPCAsynchronousCallWithBlock:v8 failureBlock:v6];
}

void __25__KTVerifier_clearState___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_55);
  }
  id v4 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_INFO))
  {
    id v5 = *(void **)(a1 + 32);
    int v6 = v4;
    id v7 = [v5 applicationIdentifier];
    int v9 = 138543362;
    id v10 = v7;
    _os_log_impl(&dword_226345000, v6, OS_LOG_TYPE_INFO, "Sending clearApplicationState(%{public}@)", (uint8_t *)&v9, 0xCu);
  }
  uint64_t v8 = [*(id *)(a1 + 32) applicationIdentifier];
  [v3 clearApplicationState:v8 completionBlock:*(void *)(a1 + 40)];
}

uint64_t __25__KTVerifier_clearState___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __25__KTVerifier_clearState___block_invoke_56(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)forceConfigUpdate:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __32__KTVerifier_forceConfigUpdate___block_invoke;
  v8[3] = &unk_26479F0D0;
  id v9 = v4;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __32__KTVerifier_forceConfigUpdate___block_invoke_59;
  v6[3] = &unk_26479E748;
  id v7 = v9;
  id v5 = v9;
  [(KTVerifier *)self invokeXPCAsynchronousCallWithBlock:v8 failureBlock:v6];
}

void __32__KTVerifier_forceConfigUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_58);
  }
  id v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_INFO, "Sending forceConfigUpdate", v5, 2u);
  }
  [v3 forceConfigUpdate:*(void *)(a1 + 32)];
}

uint64_t __32__KTVerifier_forceConfigUpdate___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __32__KTVerifier_forceConfigUpdate___block_invoke_59(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)configurationBagFetch:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __36__KTVerifier_configurationBagFetch___block_invoke;
  v8[3] = &unk_26479F0D0;
  id v9 = v4;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __36__KTVerifier_configurationBagFetch___block_invoke_62;
  v6[3] = &unk_26479E748;
  id v7 = v9;
  id v5 = v9;
  [(KTVerifier *)self invokeXPCAsynchronousCallWithBlock:v8 failureBlock:v6];
}

void __36__KTVerifier_configurationBagFetch___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_61);
  }
  id v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_INFO, "Sending configurationBagFetch", v5, 2u);
  }
  [v3 configurationBagFetch:*(void *)(a1 + 32)];
}

uint64_t __36__KTVerifier_configurationBagFetch___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __36__KTVerifier_configurationBagFetch___block_invoke_62(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)forceApplicationKeysFetch:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __40__KTVerifier_forceApplicationKeysFetch___block_invoke;
  v8[3] = &unk_26479F0A8;
  void v8[4] = self;
  id v9 = v4;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __40__KTVerifier_forceApplicationKeysFetch___block_invoke_65;
  v6[3] = &unk_26479E748;
  id v7 = v9;
  id v5 = v9;
  [(KTVerifier *)self invokeXPCAsynchronousCallWithBlock:v8 failureBlock:v6];
}

void __40__KTVerifier_forceApplicationKeysFetch___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_64);
  }
  id v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v6 = 0;
    _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_INFO, "Sending forceApplicationKeysFetch", v6, 2u);
  }
  id v5 = [*(id *)(a1 + 32) applicationIdentifier];
  [v3 forceApplicationKeysFetch:v5 block:*(void *)(a1 + 40)];
}

uint64_t __40__KTVerifier_forceApplicationKeysFetch___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __40__KTVerifier_forceApplicationKeysFetch___block_invoke_65(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)forceApplicationConfig:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __37__KTVerifier_forceApplicationConfig___block_invoke;
  v8[3] = &unk_26479F0A8;
  void v8[4] = self;
  id v9 = v4;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __37__KTVerifier_forceApplicationConfig___block_invoke_68;
  v6[3] = &unk_26479E748;
  id v7 = v9;
  id v5 = v9;
  [(KTVerifier *)self invokeXPCAsynchronousCallWithBlock:v8 failureBlock:v6];
}

void __37__KTVerifier_forceApplicationConfig___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_67);
  }
  id v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v6 = 0;
    _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_INFO, "Sending forceApplicationConfig", v6, 2u);
  }
  id v5 = [*(id *)(a1 + 32) applicationIdentifier];
  [v3 forceApplicationConfig:v5 block:*(void *)(a1 + 40)];
}

uint64_t __37__KTVerifier_forceApplicationConfig___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __37__KTVerifier_forceApplicationConfig___block_invoke_68(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)copyApplicationState:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __35__KTVerifier_copyApplicationState___block_invoke;
  v8[3] = &unk_26479F0A8;
  void v8[4] = self;
  id v9 = v4;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __35__KTVerifier_copyApplicationState___block_invoke_71;
  v6[3] = &unk_26479E748;
  id v7 = v9;
  id v5 = v9;
  [(KTVerifier *)self invokeXPCAsynchronousCallWithBlock:v8 failureBlock:v6];
}

void __35__KTVerifier_copyApplicationState___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_70);
  }
  id v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v6 = 0;
    _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_INFO, "Sending copyApplicationState", v6, 2u);
  }
  id v5 = [*(id *)(a1 + 32) applicationIdentifier];
  [v3 copyApplicationState:v5 block:*(void *)(a1 + 40)];
}

uint64_t __35__KTVerifier_copyApplicationState___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __35__KTVerifier_copyApplicationState___block_invoke_71(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)copyDataStoreStatistics:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __38__KTVerifier_copyDataStoreStatistics___block_invoke;
  v8[3] = &unk_26479F0D0;
  id v9 = v4;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __38__KTVerifier_copyDataStoreStatistics___block_invoke_74;
  v6[3] = &unk_26479E748;
  id v7 = v9;
  id v5 = v9;
  [(KTVerifier *)self invokeXPCAsynchronousCallWithBlock:v8 failureBlock:v6];
}

void __38__KTVerifier_copyDataStoreStatistics___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_73);
  }
  id v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_INFO, "Sending copyDataStoreStatistics", v5, 2u);
  }
  [v3 copyDataStoreStatistics:*(void *)(a1 + 32)];
}

uint64_t __38__KTVerifier_copyDataStoreStatistics___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __38__KTVerifier_copyDataStoreStatistics___block_invoke_74(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)copyKeyStoreState:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __32__KTVerifier_copyKeyStoreState___block_invoke;
  v8[3] = &unk_26479F0D0;
  id v9 = v4;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __32__KTVerifier_copyKeyStoreState___block_invoke_77;
  v6[3] = &unk_26479E748;
  id v7 = v9;
  id v5 = v9;
  [(KTVerifier *)self invokeXPCAsynchronousCallWithBlock:v8 failureBlock:v6];
}

void __32__KTVerifier_copyKeyStoreState___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_76);
  }
  id v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_INFO, "Sending copyKeyStoreState", v5, 2u);
  }
  [v3 copyKeyStoreState:*(void *)(a1 + 32)];
}

uint64_t __32__KTVerifier_copyKeyStoreState___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __32__KTVerifier_copyKeyStoreState___block_invoke_77(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)copyKeyStoreStateFromDisk:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __40__KTVerifier_copyKeyStoreStateFromDisk___block_invoke;
  v8[3] = &unk_26479F0D0;
  id v9 = v4;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __40__KTVerifier_copyKeyStoreStateFromDisk___block_invoke_80;
  v6[3] = &unk_26479E748;
  id v7 = v9;
  id v5 = v9;
  [(KTVerifier *)self invokeXPCAsynchronousCallWithBlock:v8 failureBlock:v6];
}

void __40__KTVerifier_copyKeyStoreStateFromDisk___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_79);
  }
  id v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_INFO, "Sending copyKeyStoreStateFromDisk", v5, 2u);
  }
  [v3 copyKeyStoreStateFromDisk:*(void *)(a1 + 32)];
}

uint64_t __40__KTVerifier_copyKeyStoreStateFromDisk___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __40__KTVerifier_copyKeyStoreStateFromDisk___block_invoke_80(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)forceDutyCycle:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __29__KTVerifier_forceDutyCycle___block_invoke;
  v8[3] = &unk_26479F0D0;
  id v9 = v4;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __29__KTVerifier_forceDutyCycle___block_invoke_83;
  v6[3] = &unk_26479E748;
  id v7 = v9;
  id v5 = v9;
  [(KTVerifier *)self invokeXPCAsynchronousCallWithBlock:v8 failureBlock:v6];
}

void __29__KTVerifier_forceDutyCycle___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_82);
  }
  id v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_INFO, "Sending runDutyCycle", v5, 2u);
  }
  [v3 runDutyCycle:*(void *)(a1 + 32)];
}

uint64_t __29__KTVerifier_forceDutyCycle___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __29__KTVerifier_forceDutyCycle___block_invoke_83(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)forceCloudConfigUpdate:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __37__KTVerifier_forceCloudConfigUpdate___block_invoke;
  v8[3] = &unk_26479F0D0;
  id v9 = v4;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __37__KTVerifier_forceCloudConfigUpdate___block_invoke_2_87;
  v6[3] = &unk_26479E748;
  id v7 = v9;
  id v5 = v9;
  [(KTVerifier *)self invokeXPCAsynchronousCallWithBlock:v8 failureBlock:v6];
}

void __37__KTVerifier_forceCloudConfigUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_85);
  }
  id v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_INFO, "Sending updateCloudConfigurationStore", buf, 2u);
  }
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __37__KTVerifier_forceCloudConfigUpdate___block_invoke_86;
  v5[3] = &unk_26479E748;
  id v6 = *(id *)(a1 + 32);
  [v3 updateCloudConfigurationStore:v5];
}

uint64_t __37__KTVerifier_forceCloudConfigUpdate___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __37__KTVerifier_forceCloudConfigUpdate___block_invoke_86(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __37__KTVerifier_forceCloudConfigUpdate___block_invoke_2_87(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)copyDeviceStatus:(id)a3 complete:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __40__KTVerifier_copyDeviceStatus_complete___block_invoke;
  v12[3] = &unk_26479F0A8;
  id v13 = v6;
  id v14 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __40__KTVerifier_copyDeviceStatus_complete___block_invoke_2_92;
  v10[3] = &unk_26479E748;
  id v11 = v14;
  id v8 = v14;
  id v9 = v6;
  [(KTVerifier *)self invokeXPCAsynchronousCallWithBlock:v12 failureBlock:v10];
}

void __40__KTVerifier_copyDeviceStatus_complete___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_89);
  }
  id v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v10 = v5;
    _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_INFO, "Sending copyDeviceStatus for %@", buf, 0xCu);
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __40__KTVerifier_copyDeviceStatus_complete___block_invoke_90;
  v7[3] = &unk_26479F0F8;
  uint64_t v6 = *(void *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  [v3 copyDeviceStatus:v6 complete:v7];
}

uint64_t __40__KTVerifier_copyDeviceStatus_complete___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __40__KTVerifier_copyDeviceStatus_complete___block_invoke_90(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __40__KTVerifier_copyDeviceStatus_complete___block_invoke_2_92(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)copyLogClientConfiguration:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __41__KTVerifier_copyLogClientConfiguration___block_invoke;
  v8[3] = &unk_26479F0D0;
  id v9 = v4;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __41__KTVerifier_copyLogClientConfiguration___block_invoke_95;
  v6[3] = &unk_26479E748;
  id v7 = v9;
  id v5 = v9;
  [(KTVerifier *)self invokeXPCAsynchronousCallWithBlock:v8 failureBlock:v6];
}

void __41__KTVerifier_copyLogClientConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_94);
  }
  id v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_INFO, "Sending copyLogClientConfiguration", v5, 2u);
  }
  [v3 copyLogClientConfiguration:*(void *)(a1 + 32)];
}

uint64_t __41__KTVerifier_copyLogClientConfiguration___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __41__KTVerifier_copyLogClientConfiguration___block_invoke_95(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)clearLogClientConfiguration:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __42__KTVerifier_clearLogClientConfiguration___block_invoke;
  v8[3] = &unk_26479F0D0;
  id v9 = v4;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__KTVerifier_clearLogClientConfiguration___block_invoke_98;
  v6[3] = &unk_26479E748;
  id v7 = v9;
  id v5 = v9;
  [(KTVerifier *)self invokeXPCAsynchronousCallWithBlock:v8 failureBlock:v6];
}

void __42__KTVerifier_clearLogClientConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_97);
  }
  id v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_INFO, "Sending copyLogClientConfiguration", v5, 2u);
  }
  [v3 clearLogClientConfiguration:*(void *)(a1 + 32)];
}

uint64_t __42__KTVerifier_clearLogClientConfiguration___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __42__KTVerifier_clearLogClientConfiguration___block_invoke_98(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)clearPublicKeyStoreState:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __39__KTVerifier_clearPublicKeyStoreState___block_invoke;
  v8[3] = &unk_26479F0A8;
  void v8[4] = self;
  id v9 = v4;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __39__KTVerifier_clearPublicKeyStoreState___block_invoke_101;
  v6[3] = &unk_26479E748;
  id v7 = v9;
  id v5 = v9;
  [(KTVerifier *)self invokeXPCAsynchronousCallWithBlock:v8 failureBlock:v6];
}

void __39__KTVerifier_clearPublicKeyStoreState___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_100);
  }
  id v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_INFO, "Sending clearPublicKeyStoreState", v6, 2u);
  }
  id v5 = [*(id *)(a1 + 32) applicationIdentifier];
  [v3 clearPublicKeyStoreState:v5 block:*(void *)(a1 + 40)];
}

uint64_t __39__KTVerifier_clearPublicKeyStoreState___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __39__KTVerifier_clearPublicKeyStoreState___block_invoke_101(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)copyDaemonState:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __30__KTVerifier_copyDaemonState___block_invoke;
  v8[3] = &unk_26479F0D0;
  id v9 = v4;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __30__KTVerifier_copyDaemonState___block_invoke_104;
  v6[3] = &unk_26479E748;
  id v7 = v9;
  id v5 = v9;
  [(KTVerifier *)self invokeXPCAsynchronousCallWithBlock:v8 failureBlock:v6];
}

void __30__KTVerifier_copyDaemonState___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_103);
  }
  id v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_INFO, "Sending copyDaemonState", v5, 2u);
  }
  [v3 copyDaemonState:*(void *)(a1 + 32)];
}

uint64_t __30__KTVerifier_copyDaemonState___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __30__KTVerifier_copyDaemonState___block_invoke_104(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)copyApplicationTranscript:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __40__KTVerifier_copyApplicationTranscript___block_invoke;
  v8[3] = &unk_26479F0A8;
  void v8[4] = self;
  id v9 = v4;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __40__KTVerifier_copyApplicationTranscript___block_invoke_107;
  v6[3] = &unk_26479E748;
  id v7 = v9;
  id v5 = v9;
  [(KTVerifier *)self invokeXPCAsynchronousCallWithBlock:v8 failureBlock:v6];
}

void __40__KTVerifier_copyApplicationTranscript___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_106);
  }
  id v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_INFO, "Sending copyApplicationTranscript", v6, 2u);
  }
  id v5 = [*(id *)(a1 + 32) applicationIdentifier];
  [v3 copyApplicationTranscript:v5 block:*(void *)(a1 + 40)];
}

uint64_t __40__KTVerifier_copyApplicationTranscript___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __40__KTVerifier_copyApplicationTranscript___block_invoke_107(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)ignoreFailure:(id)a3 uuid:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  BOOL v24 = __Block_byref_object_copy__3;
  id v25 = __Block_byref_object_dispose__3;
  id v26 = 0;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __39__KTVerifier_ignoreFailure_uuid_error___block_invoke;
  v17[3] = &unk_26479F120;
  id v10 = v8;
  id v18 = v10;
  id v11 = v9;
  id v19 = v11;
  id v20 = &v21;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __39__KTVerifier_ignoreFailure_uuid_error___block_invoke_2_111;
  v16[3] = &unk_26479EB08;
  void v16[4] = &v21;
  [(KTVerifier *)self invokeXPCSynchronousCallWithBlock:v17 failureBlock:v16];
  id v12 = v22;
  if (a5)
  {
    id v13 = (void *)v22[5];
    if (v13)
    {
      *a5 = v13;
      id v12 = v22;
    }
  }
  BOOL v14 = v12[5] == 0;

  _Block_object_dispose(&v21, 8);
  return v14;
}

void __39__KTVerifier_ignoreFailure_uuid_error___block_invoke(void *a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_109);
  }
  id v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = a1[4];
    uint64_t v6 = a1[5];
    *(_DWORD *)buf = 138412546;
    uint64_t v11 = v5;
    __int16 v12 = 2112;
    uint64_t v13 = v6;
    _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_INFO, "Sending synchronous ignoreFailure for %@, request id %@", buf, 0x16u);
  }
  uint64_t v7 = a1[4];
  uint64_t v8 = a1[5];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __39__KTVerifier_ignoreFailure_uuid_error___block_invoke_110;
  v9[3] = &unk_26479EB08;
  void v9[4] = a1[6];
  [v3 ignoreFailure:v7 uuid:v8 completionBlock:v9];
}

uint64_t __39__KTVerifier_ignoreFailure_uuid_error___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

void __39__KTVerifier_ignoreFailure_uuid_error___block_invoke_110(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

void __39__KTVerifier_ignoreFailure_uuid_error___block_invoke_2_111(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

- (void)batchQuery:(id)a3 userInitiated:(BOOL)a4 block:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __45__KTVerifier_batchQuery_userInitiated_block___block_invoke;
  v14[3] = &unk_26479F058;
  id v15 = v8;
  id v16 = self;
  BOOL v18 = a4;
  id v17 = v9;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __45__KTVerifier_batchQuery_userInitiated_block___block_invoke_2_116;
  v12[3] = &unk_26479E748;
  id v13 = v17;
  id v10 = v17;
  id v11 = v8;
  [(KTVerifier *)self invokeXPCAsynchronousCallWithBlock:v14 failureBlock:v12];
}

void __45__KTVerifier_batchQuery_userInitiated_block___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_113);
  }
  id v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_INFO, "Sending batchQuery", buf, 2u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = [*(id *)(a1 + 40) applicationIdentifier];
  uint64_t v7 = *(unsigned __int8 *)(a1 + 56);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __45__KTVerifier_batchQuery_userInitiated_block___block_invoke_114;
  v8[3] = &unk_26479F148;
  id v9 = *(id *)(a1 + 48);
  [v3 fetchBatchQuery:v5 application:v6 userInitiated:v7 completionHandler:v8];
}

uint64_t __45__KTVerifier_batchQuery_userInitiated_block___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __45__KTVerifier_batchQuery_userInitiated_block___block_invoke_114(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __45__KTVerifier_batchQuery_userInitiated_block___block_invoke_2_116(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)validatePeers:(id)a3 fetchNow:(BOOL)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __53__KTVerifier_validatePeers_fetchNow_completionBlock___block_invoke;
  v16[3] = &unk_26479F058;
  id v17 = v8;
  BOOL v18 = self;
  BOOL v20 = a4;
  id v19 = v9;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __53__KTVerifier_validatePeers_fetchNow_completionBlock___block_invoke_122;
  v12[3] = &unk_26479F170;
  id v13 = v17;
  uint64_t v14 = self;
  id v15 = v19;
  id v10 = v19;
  id v11 = v17;
  [(KTVerifier *)self invokeXPCAsynchronousCallWithBlock:v16 failureBlock:v12];
}

void __53__KTVerifier_validatePeers_fetchNow_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_118);
  }
  id v4 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = v4;
    uint64_t v7 = [v5 allKeys];
    id v8 = [v7 componentsJoinedByString:@", "];
    int v11 = 138412290;
    __int16 v12 = v8;
    _os_log_impl(&dword_226345000, v6, OS_LOG_TYPE_INFO, "Sending validatePeers for uris: %@", (uint8_t *)&v11, 0xCu);
  }
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = [*(id *)(a1 + 40) applicationIdentifier];
  [v3 validatePeers:v9 application:v10 fetchNow:*(unsigned __int8 *)(a1 + 56) completionBlock:*(void *)(a1 + 48)];
}

uint64_t __53__KTVerifier_validatePeers_fetchNow_completionBlock___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

void __53__KTVerifier_validatePeers_fetchNow_completionBlock___block_invoke_122(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v5 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * v8);
        id v10 = [KTVerifierResult alloc];
        int v11 = [*(id *)(a1 + 40) applicationIdentifier];
        __int16 v12 = [(KTVerifierResult *)v10 initWithUri:v9 application:v11 failure:v3];
        [v4 addObject:v12];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)getCachedValidatePeerResults:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __59__KTVerifier_getCachedValidatePeerResults_completionBlock___block_invoke;
  v14[3] = &unk_26479F030;
  id v15 = v6;
  long long v16 = self;
  id v17 = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __59__KTVerifier_getCachedValidatePeerResults_completionBlock___block_invoke_126;
  v10[3] = &unk_26479F170;
  id v11 = v15;
  __int16 v12 = self;
  id v13 = v17;
  id v8 = v17;
  id v9 = v15;
  [(KTVerifier *)self invokeXPCAsynchronousCallWithBlock:v14 failureBlock:v10];
}

void __59__KTVerifier_getCachedValidatePeerResults_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_125);
  }
  id v4 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void **)(a1 + 32);
    id v6 = v4;
    id v7 = [v5 componentsJoinedByString:@", "];
    int v10 = 138412290;
    id v11 = v7;
    _os_log_impl(&dword_226345000, v6, OS_LOG_TYPE_INFO, "Sending getCachedValidatePeerResults for uris: %@", (uint8_t *)&v10, 0xCu);
  }
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = [*(id *)(a1 + 40) applicationIdentifier];
  [v3 getCachedValidatePeerResults:v8 application:v9 completionBlock:*(void *)(a1 + 48)];
}

uint64_t __59__KTVerifier_getCachedValidatePeerResults_completionBlock___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

void __59__KTVerifier_getCachedValidatePeerResults_completionBlock___block_invoke_126(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v5 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * v8);
        int v10 = [KTVerifierResult alloc];
        id v11 = [*(id *)(a1 + 40) applicationIdentifier];
        uint64_t v12 = [(KTVerifierResult *)v10 initWithUri:v9 application:v11 failure:v3];
        [v4 addObject:v12];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)initiateQueryForUris:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __51__KTVerifier_initiateQueryForUris_completionBlock___block_invoke;
    v10[3] = &unk_26479F030;
    id v11 = v6;
    uint64_t v12 = self;
    id v13 = v7;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __51__KTVerifier_initiateQueryForUris_completionBlock___block_invoke_2_133;
    v8[3] = &unk_26479E748;
    id v9 = v13;
    [(KTVerifier *)self invokeXPCAsynchronousCallWithBlock:v10 failureBlock:v8];
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

void __51__KTVerifier_initiateQueryForUris_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_128);
  }
  id v4 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void **)(a1 + 32);
    id v6 = v4;
    id v7 = [v5 componentsJoinedByString:@","];
    *(_DWORD *)buf = 138412290;
    id v13 = v7;
    _os_log_impl(&dword_226345000, v6, OS_LOG_TYPE_INFO, "Sending initiateQueryForUris for %@", buf, 0xCu);
  }
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = [*(id *)(a1 + 40) applicationIdentifier];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __51__KTVerifier_initiateQueryForUris_completionBlock___block_invoke_132;
  v10[3] = &unk_26479E748;
  id v11 = *(id *)(a1 + 48);
  [v3 initiateQueryForUris:v8 application:v9 completionBlock:v10];
}

uint64_t __51__KTVerifier_initiateQueryForUris_completionBlock___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __51__KTVerifier_initiateQueryForUris_completionBlock___block_invoke_132(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __51__KTVerifier_initiateQueryForUris_completionBlock___block_invoke_2_133(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)urisFromResults:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF980] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "uri", (void)v12);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (BOOL)markFailureSeenForResults:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__3;
  BOOL v20 = __Block_byref_object_dispose__3;
  id v21 = 0;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __46__KTVerifier_markFailureSeenForResults_error___block_invoke;
  v13[3] = &unk_26479F120;
  v13[4] = self;
  id v7 = v6;
  id v14 = v7;
  long long v15 = &v16;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __46__KTVerifier_markFailureSeenForResults_error___block_invoke_2_137;
  v12[3] = &unk_26479EB08;
  void v12[4] = &v16;
  [(KTVerifier *)self invokeXPCSynchronousCallWithBlock:v13 failureBlock:v12];
  uint64_t v8 = v17;
  if (a4)
  {
    id v9 = (void *)v17[5];
    if (v9)
    {
      *a4 = v9;
      uint64_t v8 = v17;
    }
  }
  BOOL v10 = v8[5] == 0;

  _Block_object_dispose(&v16, 8);
  return v10;
}

void __46__KTVerifier_markFailureSeenForResults_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_135_0);
  }
  id v4 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_INFO))
  {
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = v4;
    uint64_t v8 = [v5 urisFromResults:v6];
    id v9 = [v8 componentsJoinedByString:@","];
    *(_DWORD *)buf = 138412290;
    id v14 = v9;
    _os_log_impl(&dword_226345000, v7, OS_LOG_TYPE_INFO, "Sending synchronous markFailureSeenForUris for %@", buf, 0xCu);
  }
  uint64_t v10 = *(void *)(a1 + 40);
  id v11 = [*(id *)(a1 + 32) applicationIdentifier];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __46__KTVerifier_markFailureSeenForResults_error___block_invoke_136;
  v12[3] = &unk_26479EB08;
  void v12[4] = *(void *)(a1 + 48);
  [v3 markFailureSeenForResults:v10 application:v11 completionBlock:v12];
}

uint64_t __46__KTVerifier_markFailureSeenForResults_error___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

void __46__KTVerifier_markFailureSeenForResults_error___block_invoke_136(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

void __46__KTVerifier_markFailureSeenForResults_error___block_invoke_2_137(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

- (BOOL)ignoreFailureForResults:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__3;
  BOOL v20 = __Block_byref_object_dispose__3;
  id v21 = 0;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __44__KTVerifier_ignoreFailureForResults_error___block_invoke;
  v13[3] = &unk_26479F120;
  v13[4] = self;
  id v7 = v6;
  id v14 = v7;
  uint64_t v15 = &v16;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __44__KTVerifier_ignoreFailureForResults_error___block_invoke_2_141;
  v12[3] = &unk_26479EB08;
  void v12[4] = &v16;
  [(KTVerifier *)self invokeXPCSynchronousCallWithBlock:v13 failureBlock:v12];
  uint64_t v8 = v17;
  if (a4)
  {
    id v9 = (void *)v17[5];
    if (v9)
    {
      *a4 = v9;
      uint64_t v8 = v17;
    }
  }
  BOOL v10 = v8[5] == 0;

  _Block_object_dispose(&v16, 8);
  return v10;
}

void __44__KTVerifier_ignoreFailureForResults_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_139);
  }
  id v4 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_INFO))
  {
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = v4;
    uint64_t v8 = [v5 urisFromResults:v6];
    id v9 = [v8 componentsJoinedByString:@","];
    *(_DWORD *)buf = 138412290;
    id v14 = v9;
    _os_log_impl(&dword_226345000, v7, OS_LOG_TYPE_INFO, "Sending synchronous ignoreFailureForResults for %@", buf, 0xCu);
  }
  uint64_t v10 = *(void *)(a1 + 40);
  id v11 = [*(id *)(a1 + 32) applicationIdentifier];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __44__KTVerifier_ignoreFailureForResults_error___block_invoke_140;
  v12[3] = &unk_26479EB08;
  void v12[4] = *(void *)(a1 + 48);
  [v3 ignoreFailureForResults:v10 application:v11 completionBlock:v12];
}

uint64_t __44__KTVerifier_ignoreFailureForResults_error___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

void __44__KTVerifier_ignoreFailureForResults_error___block_invoke_140(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

void __44__KTVerifier_ignoreFailureForResults_error___block_invoke_2_141(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

+ (id)getUIStatusPriority:(unint64_t)a3
{
  if (a3 > 0xD) {
    return &unk_26DA15998;
  }
  else {
    return (id)qword_26479F1B0[a3];
  }
}

- (unint64_t)getDisplayStatusForResults:(id)a3 isSelfOptedIn:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = v5;
  if (v4)
  {
    if ([v5 count])
    {
      id v7 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v6, "count"));
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v8 = v6;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v20 != v11) {
              objc_enumerationMutation(v8);
            }
            long long v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "uiStatus", (void)v19));
            [v7 addObject:v13];
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v24 count:16];
        }
        while (v10);
      }

      id v14 = [v7 sortedArrayUsingComparator:&__block_literal_global_175];
      uint64_t v15 = [v14 objectAtIndexedSubscript:0];
      unint64_t v16 = [v15 unsignedIntValue];
    }
    else
    {
      if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1) {
        dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_170);
      }
      uint64_t v17 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
      if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_226345000, v17, OS_LOG_TYPE_ERROR, "Attempting to get display status for results, but no results were provided. Service is therefore unavailable.", buf, 2u);
      }
      unint64_t v16 = 0;
    }
  }
  else
  {
    unint64_t v16 = 1;
  }

  return v16;
}

uint64_t __55__KTVerifier_getDisplayStatusForResults_isSelfOptedIn___block_invoke()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __55__KTVerifier_getDisplayStatusForResults_isSelfOptedIn___block_invoke_172(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = +[KTVerifier getUIStatusPriority:](KTVerifier, "getUIStatusPriority:", [a2 unsignedIntValue]);
  unsigned int v6 = [v4 unsignedIntValue];

  id v7 = +[KTVerifier getUIStatusPriority:v6];
  uint64_t v8 = [v5 compare:v7];

  return v8;
}

- (BOOL)clearPeerCache:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  long long v20 = __Block_byref_object_copy__3;
  long long v21 = __Block_byref_object_dispose__3;
  id v22 = 0;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __35__KTVerifier_clearPeerCache_error___block_invoke;
  v13[3] = &unk_26479F120;
  id v7 = v6;
  id v14 = v7;
  uint64_t v15 = self;
  unint64_t v16 = &v17;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __35__KTVerifier_clearPeerCache_error___block_invoke_2_180;
  v12[3] = &unk_26479EB08;
  void v12[4] = &v17;
  [(KTVerifier *)self invokeXPCSynchronousCallWithBlock:v13 failureBlock:v12];
  uint64_t v8 = v18;
  if (a4)
  {
    uint64_t v9 = (void *)v18[5];
    if (v9)
    {
      *a4 = v9;
      uint64_t v8 = v18;
    }
  }
  BOOL v10 = v8[5] == 0;

  _Block_object_dispose(&v17, 8);
  return v10;
}

void __35__KTVerifier_clearPeerCache_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_178);
  }
  id v4 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_INFO))
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = v4;
    id v7 = [v5 componentsJoinedByString:@","];
    *(_DWORD *)buf = 138412290;
    long long v12 = v7;
    _os_log_impl(&dword_226345000, v6, OS_LOG_TYPE_INFO, "Sending synchronous clearPeerCache for %@", buf, 0xCu);
  }
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = [*(id *)(a1 + 40) applicationIdentifier];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __35__KTVerifier_clearPeerCache_error___block_invoke_179;
  v10[3] = &unk_26479EB08;
  void v10[4] = *(void *)(a1 + 48);
  [v3 clearPeerCache:v8 application:v9 completionBlock:v10];
}

uint64_t __35__KTVerifier_clearPeerCache_error___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

void __35__KTVerifier_clearPeerCache_error___block_invoke_179(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

void __35__KTVerifier_clearPeerCache_error___block_invoke_2_180(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

- (NSString)applicationIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 16, 1);
}

- (TransparencyApplication)application
{
  return (TransparencyApplication *)objc_getProperty(self, a2, 24, 1);
}

- (void)setApplication:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_application, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
}

@end