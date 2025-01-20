@interface SSRRPISamplingXPCService
+ (id)_createConnection;
+ (id)getAudioIdWithRequestId:(id)a3 languageCode:(id)a4 date:(id)a5 error:(id *)a6;
+ (id)getRemoteObjectProxyWithConnection:(id)a3 errorHandler:(id)a4;
+ (unint64_t)getEnrollmentSelectionStatusWithLocale:(id)a3 error:(id *)a4;
+ (void)_invalidateConnection:(id)a3;
+ (void)markFinishStatusForAllWithCompletion:(id)a3;
+ (void)removeAllSamplingMetaDataWithCompletion:(id)a3;
+ (void)removeMappingOnAndBefore:(id)a3 completion:(id)a4;
+ (void)removeMappingWithLocale:(id)a3 date:(id)a4 completion:(id)a5;
+ (void)removeRequestIdToAudioIdMappingWithCompletion:(id)a3;
+ (void)updateStatus:(id)a3 languageCode:(id)a4 completion:(id)a5;
+ (void)writeIntoMappingWithRequestId:(id)a3 audioId:(id)a4 date:(id)a5 locale:(id)a6 completion:(id)a7;
@end

@implementation SSRRPISamplingXPCService

+ (id)getRemoteObjectProxyWithConnection:(id)a3 errorHandler:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = (void (**)(void, void))v7;
  if (v6)
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __76__SSRRPISamplingXPCService_getRemoteObjectProxyWithConnection_errorHandler___block_invoke;
    v18[3] = &unk_264428C58;
    id v9 = v7;
    id v20 = v9;
    id v21 = a1;
    id v10 = v6;
    id v19 = v10;
    v11 = [v10 remoteObjectProxyWithErrorHandler:v18];
    v12 = v11;
    if (v11)
    {
      id v13 = v11;
LABEL_11:

      goto LABEL_12;
    }
    v15 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v23 = "+[SSRRPISamplingXPCService getRemoteObjectProxyWithConnection:errorHandler:]";
      _os_log_error_impl(&dword_21C8A5000, v15, OS_LOG_TYPE_ERROR, "%s service cannot be created", buf, 0xCu);
      if (!v9) {
        goto LABEL_10;
      }
    }
    else if (!v9)
    {
LABEL_10:
      [a1 _invalidateConnection:v10];
      goto LABEL_11;
    }
    v16 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.speakerrecognition" code:1107 userInfo:&unk_26CD44DB0];
    (*((void (**)(id, void *))v9 + 2))(v9, v16);

    goto LABEL_10;
  }
  if (v7)
  {
    v14 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.speakerrecognition" code:1107 userInfo:&unk_26CD44D88];
    ((void (**)(void, void *))v8)[2](v8, v14);
  }
  v12 = 0;
LABEL_12:

  return v12;
}

uint64_t __76__SSRRPISamplingXPCService_getRemoteObjectProxyWithConnection_errorHandler___block_invoke(void *a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = a1[5];
    if (v3) {
      (*(void (**)(void))(v3 + 16))();
    }
  }
  v4 = (void *)a1[6];
  uint64_t v5 = a1[4];

  return [v4 _invalidateConnection:v5];
}

+ (id)_createConnection
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.ssr.rpisamplingservice" options:0];
  uint64_t v3 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CD46B88];
  [v2 setRemoteObjectInterface:v3];

  [v2 setInterruptionHandler:&__block_literal_global_585];
  [v2 setInvalidationHandler:&__block_literal_global_16];
  [v2 resume];

  return v2;
}

void __45__SSRRPISamplingXPCService__createConnection__block_invoke_14()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v0 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
  {
    int v1 = 136315138;
    v2 = "+[SSRRPISamplingXPCService _createConnection]_block_invoke";
    _os_log_error_impl(&dword_21C8A5000, v0, OS_LOG_TYPE_ERROR, "%s SSRRPISamplingXPC Services Invalidated", (uint8_t *)&v1, 0xCu);
  }
}

void __45__SSRRPISamplingXPCService__createConnection__block_invoke()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v0 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
  {
    int v1 = 136315138;
    v2 = "+[SSRRPISamplingXPCService _createConnection]_block_invoke";
    _os_log_error_impl(&dword_21C8A5000, v0, OS_LOG_TYPE_ERROR, "%s SSRRPISamplingXPC Services Interrupted", (uint8_t *)&v1, 0xCu);
  }
}

+ (void)_invalidateConnection:(id)a3
{
  id v3 = a3;
  [v3 setInvalidationHandler:0];
  [v3 invalidate];
}

+ (void)removeMappingOnAndBefore:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [a1 _createConnection];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __64__SSRRPISamplingXPCService_removeMappingOnAndBefore_completion___block_invoke;
  v15[3] = &unk_26442A4B0;
  id v9 = v7;
  id v16 = v9;
  id v10 = [a1 getRemoteObjectProxyWithConnection:v8 errorHandler:v15];
  if (v10)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __64__SSRRPISamplingXPCService_removeMappingOnAndBefore_completion___block_invoke_2;
    v11[3] = &unk_264428C58;
    id v13 = v9;
    id v14 = a1;
    id v12 = v8;
    [v10 removeMappingOnAndBefore:v6 completion:v11];
  }
}

uint64_t __64__SSRRPISamplingXPCService_removeMappingOnAndBefore_completion___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3) {
      (*(void (**)(void))(v3 + 16))();
    }
  }

  return MEMORY[0x270F9A758]();
}

uint64_t __64__SSRRPISamplingXPCService_removeMappingOnAndBefore_completion___block_invoke_2(void *a1)
{
  uint64_t v2 = a1[5];
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = (void *)a1[6];
  uint64_t v4 = a1[4];

  return [v3 _invalidateConnection:v4];
}

+ (void)markFinishStatusForAllWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 _createConnection];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __65__SSRRPISamplingXPCService_markFinishStatusForAllWithCompletion___block_invoke;
  v12[3] = &unk_26442A4B0;
  id v6 = v4;
  id v13 = v6;
  id v7 = [a1 getRemoteObjectProxyWithConnection:v5 errorHandler:v12];
  if (v7)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __65__SSRRPISamplingXPCService_markFinishStatusForAllWithCompletion___block_invoke_2;
    v8[3] = &unk_264428C58;
    id v10 = v6;
    id v11 = a1;
    id v9 = v5;
    [v7 markFinishStatusForAllWithCompletion:v8];
  }
}

uint64_t __65__SSRRPISamplingXPCService_markFinishStatusForAllWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3) {
      (*(void (**)(void))(v3 + 16))();
    }
  }

  return MEMORY[0x270F9A758]();
}

uint64_t __65__SSRRPISamplingXPCService_markFinishStatusForAllWithCompletion___block_invoke_2(void *a1)
{
  uint64_t v2 = a1[5];
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = (void *)a1[6];
  uint64_t v4 = a1[4];

  return [v3 _invalidateConnection:v4];
}

+ (void)removeAllSamplingMetaDataWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 _createConnection];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __68__SSRRPISamplingXPCService_removeAllSamplingMetaDataWithCompletion___block_invoke;
  v12[3] = &unk_26442A4B0;
  id v6 = v4;
  id v13 = v6;
  id v7 = [a1 getRemoteObjectProxyWithConnection:v5 errorHandler:v12];
  if (v7)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __68__SSRRPISamplingXPCService_removeAllSamplingMetaDataWithCompletion___block_invoke_2;
    v8[3] = &unk_264428CA8;
    id v10 = v6;
    id v11 = a1;
    id v9 = v5;
    [v7 removeAllSamplingMetaDataWithCompletion:v8];
  }
}

uint64_t __68__SSRRPISamplingXPCService_removeAllSamplingMetaDataWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3) {
      (*(void (**)(void))(v3 + 16))();
    }
  }

  return MEMORY[0x270F9A758]();
}

uint64_t __68__SSRRPISamplingXPCService_removeAllSamplingMetaDataWithCompletion___block_invoke_2(void *a1)
{
  uint64_t v2 = a1[5];
  if (v2) {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, 0);
  }
  uint64_t v3 = (void *)a1[6];
  uint64_t v4 = a1[4];

  return [v3 _invalidateConnection:v4];
}

+ (void)removeRequestIdToAudioIdMappingWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 _createConnection];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __74__SSRRPISamplingXPCService_removeRequestIdToAudioIdMappingWithCompletion___block_invoke;
  v12[3] = &unk_26442A4B0;
  id v6 = v4;
  id v13 = v6;
  id v7 = [a1 getRemoteObjectProxyWithConnection:v5 errorHandler:v12];
  if (v7)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __74__SSRRPISamplingXPCService_removeRequestIdToAudioIdMappingWithCompletion___block_invoke_2;
    v8[3] = &unk_264428CA8;
    id v10 = v6;
    id v11 = a1;
    id v9 = v5;
    [v7 removeRequestIdToAudioIdMappingWithCompletion:v8];
  }
}

uint64_t __74__SSRRPISamplingXPCService_removeRequestIdToAudioIdMappingWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3) {
      (*(void (**)(void))(v3 + 16))();
    }
  }

  return MEMORY[0x270F9A758]();
}

uint64_t __74__SSRRPISamplingXPCService_removeRequestIdToAudioIdMappingWithCompletion___block_invoke_2(void *a1)
{
  uint64_t v2 = a1[5];
  if (v2) {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, 0);
  }
  uint64_t v3 = (void *)a1[6];
  uint64_t v4 = a1[4];

  return [v3 _invalidateConnection:v4];
}

+ (void)removeMappingWithLocale:(id)a3 date:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [a1 _createConnection];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __68__SSRRPISamplingXPCService_removeMappingWithLocale_date_completion___block_invoke;
  v18[3] = &unk_26442A4B0;
  id v12 = v10;
  id v19 = v12;
  id v13 = [a1 getRemoteObjectProxyWithConnection:v11 errorHandler:v18];
  if (v13)
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __68__SSRRPISamplingXPCService_removeMappingWithLocale_date_completion___block_invoke_2;
    v14[3] = &unk_264428C58;
    id v16 = v12;
    id v17 = a1;
    id v15 = v11;
    [v13 removeMappingWithLocale:v8 date:v9 completion:v14];
  }
}

uint64_t __68__SSRRPISamplingXPCService_removeMappingWithLocale_date_completion___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3) {
      (*(void (**)(void))(v3 + 16))();
    }
  }

  return MEMORY[0x270F9A758]();
}

uint64_t __68__SSRRPISamplingXPCService_removeMappingWithLocale_date_completion___block_invoke_2(void *a1)
{
  uint64_t v2 = a1[5];
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = (void *)a1[6];
  uint64_t v4 = a1[4];

  return [v3 _invalidateConnection:v4];
}

+ (void)writeIntoMappingWithRequestId:(id)a3 audioId:(id)a4 date:(id)a5 locale:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = [a1 _createConnection];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __89__SSRRPISamplingXPCService_writeIntoMappingWithRequestId_audioId_date_locale_completion___block_invoke;
  v24[3] = &unk_26442A4B0;
  id v18 = v16;
  id v25 = v18;
  id v19 = [a1 getRemoteObjectProxyWithConnection:v17 errorHandler:v24];
  if (v19)
  {
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __89__SSRRPISamplingXPCService_writeIntoMappingWithRequestId_audioId_date_locale_completion___block_invoke_2;
    v20[3] = &unk_264428C58;
    id v22 = v18;
    id v23 = a1;
    id v21 = v17;
    [v19 writeIntoMappingWithRequestId:v12 audioId:v13 date:v14 locale:v15 completion:v20];
  }
}

uint64_t __89__SSRRPISamplingXPCService_writeIntoMappingWithRequestId_audioId_date_locale_completion___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3) {
      (*(void (**)(void))(v3 + 16))();
    }
  }

  return MEMORY[0x270F9A758]();
}

uint64_t __89__SSRRPISamplingXPCService_writeIntoMappingWithRequestId_audioId_date_locale_completion___block_invoke_2(void *a1)
{
  uint64_t v2 = a1[5];
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = (void *)a1[6];
  uint64_t v4 = a1[4];

  return [v3 _invalidateConnection:v4];
}

+ (id)getAudioIdWithRequestId:(id)a3 languageCode:(id)a4 date:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = __Block_byref_object_copy_;
  v38 = __Block_byref_object_dispose_;
  id v39 = 0;
  id v13 = [a1 _createConnection];
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __76__SSRRPISamplingXPCService_getAudioIdWithRequestId_languageCode_date_error___block_invoke;
  v33[3] = &unk_264428C08;
  v33[4] = &v34;
  id v14 = [a1 getRemoteObjectProxyWithConnection:v13 errorHandler:v33];
  if (v14)
  {
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x3032000000;
    v30 = __Block_byref_object_copy_;
    v31 = __Block_byref_object_dispose_;
    id v32 = 0;
    dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
    uint64_t v20 = MEMORY[0x263EF8330];
    uint64_t v21 = 3221225472;
    id v22 = __76__SSRRPISamplingXPCService_getAudioIdWithRequestId_languageCode_date_error___block_invoke_2;
    id v23 = &unk_264428C80;
    id v25 = &v34;
    v26 = &v27;
    id v16 = v15;
    uint64_t v24 = v16;
    [v14 getAudioIdWithRequestId:v10 languageCode:v11 date:v12 completion:&v20];
    dispatch_time_t v17 = dispatch_time(0, 5000000000);
    if (dispatch_semaphore_wait(v16, v17))
    {
      if (a6)
      {
        objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"com.apple.speakerrecognition", 1108, &unk_26CD44D60, v20, v21, v22, v23);
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(a1, "_invalidateConnection:", v13, v20, v21, v22, v23);
      id v18 = 0;
    }
    else
    {
      if (a6) {
        *a6 = (id) v35[5];
      }
      objc_msgSend(a1, "_invalidateConnection:", v13, v20, v21, v22, v23);
      id v18 = (id)v28[5];
    }

    _Block_object_dispose(&v27, 8);
  }
  else
  {
    id v18 = 0;
    if (a6) {
      *a6 = (id) v35[5];
    }
  }

  _Block_object_dispose(&v34, 8);

  return v18;
}

void __76__SSRRPISamplingXPCService_getAudioIdWithRequestId_languageCode_date_error___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

void __76__SSRRPISamplingXPCService_getAudioIdWithRequestId_languageCode_date_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (void)updateStatus:(id)a3 languageCode:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [a1 _createConnection];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __65__SSRRPISamplingXPCService_updateStatus_languageCode_completion___block_invoke;
  v18[3] = &unk_26442A4B0;
  id v12 = v10;
  id v19 = v12;
  id v13 = [a1 getRemoteObjectProxyWithConnection:v11 errorHandler:v18];
  if (v13)
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __65__SSRRPISamplingXPCService_updateStatus_languageCode_completion___block_invoke_2;
    v14[3] = &unk_264428C58;
    id v16 = v12;
    id v17 = a1;
    id v15 = v11;
    [v13 updateStatus:v8 languageCode:v9 completion:v14];
  }
}

uint64_t __65__SSRRPISamplingXPCService_updateStatus_languageCode_completion___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3) {
      (*(void (**)(void))(v3 + 16))();
    }
  }

  return MEMORY[0x270F9A758]();
}

uint64_t __65__SSRRPISamplingXPCService_updateStatus_languageCode_completion___block_invoke_2(void *a1)
{
  uint64_t v2 = a1[5];
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = (void *)a1[6];
  uint64_t v4 = a1[4];

  return [v3 _invalidateConnection:v4];
}

+ (unint64_t)getEnrollmentSelectionStatusWithLocale:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [a1 _createConnection];
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy_;
  id v32 = __Block_byref_object_dispose_;
  id v33 = 0;
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __73__SSRRPISamplingXPCService_getEnrollmentSelectionStatusWithLocale_error___block_invoke;
  v27[3] = &unk_264428C08;
  v27[4] = &v28;
  id v8 = [a1 getRemoteObjectProxyWithConnection:v7 errorHandler:v27];
  if (v8)
  {
    uint64_t v21 = 0;
    id v22 = &v21;
    uint64_t v23 = 0x3032000000;
    uint64_t v24 = __Block_byref_object_copy_;
    id v25 = __Block_byref_object_dispose_;
    id v26 = 0;
    dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
    uint64_t v14 = MEMORY[0x263EF8330];
    uint64_t v15 = 3221225472;
    id v16 = __73__SSRRPISamplingXPCService_getEnrollmentSelectionStatusWithLocale_error___block_invoke_2;
    id v17 = &unk_264428C30;
    id v19 = &v28;
    uint64_t v20 = &v21;
    id v10 = v9;
    id v18 = v10;
    [v8 getEnrollmentSelectionStatusWithLocale:v6 completion:&v14];
    dispatch_time_t v11 = dispatch_time(0, 5000000000);
    if (dispatch_semaphore_wait(v10, v11))
    {
      if (a4)
      {
        objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"com.apple.speakerrecognition", 1108, &unk_26CD44D38, v14, v15, v16, v17);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      if (a4) {
        *a4 = (id) v29[5];
      }
      if (v22[5])
      {
        objc_msgSend(a1, "_invalidateConnection:", v7, v14, v15, v16, v17);
        unint64_t v12 = [(id)v22[5] unsignedIntegerValue];
LABEL_13:

        _Block_object_dispose(&v21, 8);
        goto LABEL_14;
      }
    }
    objc_msgSend(a1, "_invalidateConnection:", v7, v14, v15, v16, v17);
    unint64_t v12 = 5;
    goto LABEL_13;
  }
  if (a4) {
    *a4 = (id) v29[5];
  }
  unint64_t v12 = 5;
LABEL_14:

  _Block_object_dispose(&v28, 8);
  return v12;
}

void __73__SSRRPISamplingXPCService_getEnrollmentSelectionStatusWithLocale_error___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

void __73__SSRRPISamplingXPCService_getEnrollmentSelectionStatusWithLocale_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end