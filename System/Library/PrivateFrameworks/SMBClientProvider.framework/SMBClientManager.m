@interface SMBClientManager
+ (id)newManager;
- (id)addVolume:(id)a3 atServer:(id)a4 credentialType:(int64_t)a5 credential:(id)a6;
- (id)forgetVolume:(id)a3;
- (id)listenerForVolume:(id)a3 error:(id *)a4;
- (id)sharesAtServer:(id)a3 credentialType:(int64_t)a4 credential:(id)a5 error:(id *)a6;
- (id)volumes:(id *)a3;
- (void)addSMBServerOrShare:(id)a3 completionHandler:(id)a4;
- (void)addVolumes:(id)a3 atServer:(id)a4 credentialType:(int64_t)a5 credential:(id)a6 completionHandler:(id)a7;
- (void)credentialTypesForServer:(id)a3 completionHandler:(id)a4;
- (void)forgetVolume:(id)a3 completionHandler:(id)a4;
- (void)forgetVolume:(id)a3 withFlags:(unsigned int)a4 completionHandler:(id)a5;
- (void)listenerForVolume:(id)a3 completionHandler:(id)a4;
- (void)sharesAtServer:(id)a3 credentialType:(int64_t)a4 credential:(id)a5 completionHandler:(id)a6;
- (void)volumesWithCompletionHandler:(id)a3;
@end

@implementation SMBClientManager

+ (id)newManager
{
  v2 = (char *)[a1 newConnectionForService:@"machp://com.apple.filesystems.smbclientd"];
  if (v2)
  {
    v3 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26EB9AFE0];
    [*(id *)&v2[*MEMORY[0x263F522C0]] setRemoteObjectInterface:v3];
  }
  return v2;
}

- (id)volumes:(id *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SMBClientManager;
  v3 = [(LiveFSClient *)&v5 volumes:a3];
  return v3;
}

- (void)volumesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_super v5 = *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x263F522C0]);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __49__SMBClientManager_volumesWithCompletionHandler___block_invoke;
  v11[3] = &unk_264D505E8;
  id v6 = v4;
  id v12 = v6;
  v7 = [v5 remoteObjectProxyWithErrorHandler:v11];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __49__SMBClientManager_volumesWithCompletionHandler___block_invoke_2;
  v9[3] = &unk_264D50610;
  id v10 = v6;
  id v8 = v6;
  [v7 listVolumes:v9];
}

uint64_t __49__SMBClientManager_volumesWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __49__SMBClientManager_volumesWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)listenerForVolume:(id)a3 error:(id *)a4
{
  v6.receiver = self;
  v6.super_class = (Class)SMBClientManager;
  id v4 = [(LiveFSClient *)&v6 listenerForVolume:a3 error:a4];
  return v4;
}

- (void)listenerForVolume:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v7 = *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x263F522C0]);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __56__SMBClientManager_listenerForVolume_completionHandler___block_invoke;
  v14[3] = &unk_264D505E8;
  id v8 = v6;
  id v15 = v8;
  id v9 = a3;
  id v10 = [v7 remoteObjectProxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __56__SMBClientManager_listenerForVolume_completionHandler___block_invoke_2;
  v12[3] = &unk_264D50638;
  id v13 = v8;
  id v11 = v8;
  [v10 listenerForVolume:v9 reply:v12];
}

uint64_t __56__SMBClientManager_listenerForVolume_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __56__SMBClientManager_listenerForVolume_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)forgetVolume:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SMBClientManager;
  v3 = [(LiveFSClient *)&v5 forgetVolume:a3 withFlags:3];
  return v3;
}

- (void)forgetVolume:(id)a3 completionHandler:(id)a4
{
}

- (void)forgetVolume:(id)a3 withFlags:(unsigned int)a4 completionHandler:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  id v9 = *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x263F522C0]);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __61__SMBClientManager_forgetVolume_withFlags_completionHandler___block_invoke;
  v16[3] = &unk_264D505E8;
  id v10 = v8;
  id v17 = v10;
  id v11 = a3;
  id v12 = [v9 remoteObjectProxyWithErrorHandler:v16];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __61__SMBClientManager_forgetVolume_withFlags_completionHandler___block_invoke_2;
  v14[3] = &unk_264D505E8;
  id v15 = v10;
  id v13 = v10;
  [v12 ejectVolume:v11 usingFlags:v5 reply:v14];
}

uint64_t __61__SMBClientManager_forgetVolume_withFlags_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __61__SMBClientManager_forgetVolume_withFlags_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)addVolume:(id)a3 atServer:(id)a4 credentialType:(int64_t)a5 credential:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy_;
  v31 = __Block_byref_object_dispose_;
  id v32 = 0;
  BOOL v13 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
  if (v13) {
    -[SMBClientManager addVolume:atServer:credentialType:credential:](v13, v14, v15, v16, v17, v18, v19, v20);
  }
  v21 = *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x263F522C0]);
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __65__SMBClientManager_addVolume_atServer_credentialType_credential___block_invoke;
  v26[3] = &unk_264D50660;
  v26[4] = &v27;
  v22 = [v21 synchronousRemoteObjectProxyWithErrorHandler:v26];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __65__SMBClientManager_addVolume_atServer_credentialType_credential___block_invoke_2;
  v25[3] = &unk_264D50660;
  v25[4] = &v27;
  [v22 addVolume:v10 atServer:v11 credentialType:a5 credential:v12 reply:v25];
  id v23 = (id)v28[5];
  _Block_object_dispose(&v27, 8);

  return v23;
}

void __65__SMBClientManager_addVolume_atServer_credentialType_credential___block_invoke(uint64_t a1, void *a2)
{
}

void __65__SMBClientManager_addVolume_atServer_credentialType_credential___block_invoke_2(uint64_t a1, void *a2)
{
}

- (void)addSMBServerOrShare:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v7 = *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x263F522C0]);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __58__SMBClientManager_addSMBServerOrShare_completionHandler___block_invoke;
  v11[3] = &unk_264D505E8;
  id v12 = v6;
  id v8 = v6;
  id v9 = a3;
  id v10 = [v7 remoteObjectProxyWithErrorHandler:v11];
  [v10 addSMBServerOrShare:v9 completionHandler:v8];
}

uint64_t __58__SMBClientManager_addSMBServerOrShare_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addVolumes:(id)a3 atServer:(id)a4 credentialType:(int64_t)a5 credential:(id)a6 completionHandler:(id)a7
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v37 = a4;
  id v38 = a6;
  id v12 = a7;
  uint64_t v71 = 0;
  v72 = &v71;
  uint64_t v73 = 0x2020000000;
  int v74 = 0;
  uint64_t v67 = 0;
  v68 = &v67;
  uint64_t v69 = 0x2020000000;
  int v70 = 0;
  v34 = v11;
  int v70 = [v11 count];
  uint64_t v61 = 0;
  v62 = &v61;
  uint64_t v63 = 0x3032000000;
  v64 = __Block_byref_object_copy_;
  v65 = __Block_byref_object_dispose_;
  id v66 = 0;
  uint64_t v55 = 0;
  v56 = &v55;
  uint64_t v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__41;
  v59 = __Block_byref_object_dispose__42;
  id v32 = v12;
  id v60 = (id)MEMORY[0x23EC95750](v12);
  BOOL v13 = objc_opt_new();
  uint64_t v14 = objc_opt_new();
  v33 = objc_opt_new();
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[SMBClientManager addVolumes:atServer:credentialType:credential:completionHandler:]();
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[SMBClientManager addVolumes:atServer:credentialType:credential:completionHandler:]((uint64_t)v11, v15, v16, v17, v18, v19, v20, v21);
  }
  if ([v11 count] < 0)
  {
    uint64_t v29 = v56[5];
    v24 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:34 userInfo:0];
    (*(void (**)(uint64_t, void *, void *, void *))(v29 + 16))(v29, v14, v13, v24);
  }
  else
  {
    if (!*((_DWORD *)v68 + 6))
    {
      (*(void (**)(void))(v56[5] + 16))();
      goto LABEL_25;
    }
    v22 = *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x263F522C0]);
    v51[0] = MEMORY[0x263EF8330];
    v51[1] = 3221225472;
    v51[2] = __84__SMBClientManager_addVolumes_atServer_credentialType_credential_completionHandler___block_invoke;
    v51[3] = &unk_264D50688;
    id v23 = v33;
    id v52 = v23;
    v53 = &v71;
    v54 = &v61;
    v24 = [v22 remoteObjectProxyWithErrorHandler:v51];
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id obj = v11;
    uint64_t v25 = [obj countByEnumeratingWithState:&v47 objects:v77 count:16];
    if (v25)
    {
      uint64_t v26 = *(void *)v48;
      while (2)
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v48 != v26) {
            objc_enumerationMutation(obj);
          }
          uint64_t v28 = *(void *)(*((void *)&v47 + 1) + 8 * i);
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            -[SMBClientManager addVolumes:atServer:credentialType:credential:completionHandler:](buf, v28, &v76);
          }
          [v23 lock];
          if (*((_DWORD *)v72 + 6))
          {
            uint64_t v30 = v56[5];
            if (v30)
            {
              (*(void (**)(uint64_t, void *, void *, uint64_t))(v30 + 16))(v30, v14, v13, v62[5]);
              v31 = (void *)v56[5];
              v56[5] = 0;
            }
            [v23 unlock];
            goto LABEL_22;
          }
          [v23 unlock];
          v39[0] = MEMORY[0x263EF8330];
          v39[1] = 3221225472;
          v39[2] = __84__SMBClientManager_addVolumes_atServer_credentialType_credential_completionHandler___block_invoke_47;
          v39[3] = &unk_264D506B0;
          v39[4] = v28;
          v43 = &v67;
          id v40 = v23;
          v44 = &v71;
          v45 = &v55;
          id v41 = v14;
          id v42 = v13;
          v46 = &v61;
          [v24 addVolume:v28 atServer:v37 credentialType:a5 credential:v38 reply:v39];
        }
        uint64_t v25 = [obj countByEnumeratingWithState:&v47 objects:v77 count:16];
        if (v25) {
          continue;
        }
        break;
      }
    }
LABEL_22:
  }
LABEL_25:

  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&v61, 8);

  _Block_object_dispose(&v67, 8);
  _Block_object_dispose(&v71, 8);
}

void __84__SMBClientManager_addVolumes_atServer_credentialType_credential_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [*(id *)(a1 + 32) lock];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __84__SMBClientManager_addVolumes_atServer_credentialType_credential_completionHandler___block_invoke_cold_1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
  }
  [*(id *)(a1 + 32) unlock];
}

void __84__SMBClientManager_addVolumes_atServer_credentialType_credential_completionHandler___block_invoke_47(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __84__SMBClientManager_addVolumes_atServer_credentialType_credential_completionHandler___block_invoke_47_cold_1((uint64_t)v3, a1);
  }
  [*(id *)(a1 + 40) lock];
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)) {
    goto LABEL_4;
  }
  if (v3) {
    [*(id *)(a1 + 56) setObject:v3 forKey:*(void *)(a1 + 32)];
  }
  else {
    [*(id *)(a1 + 48) addObject:*(void *)(a1 + 32)];
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
  int v8 = *(_DWORD *)(v7 + 24) - 1;
  *(_DWORD *)(v7 + 24) = v8;
  if (!v8)
  {
LABEL_4:
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
    if (v4)
    {
      (*(void (**)(uint64_t, void, void, void))(v4 + 16))(v4, *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40));
      uint64_t v5 = *(void *)(*(void *)(a1 + 80) + 8);
      uint64_t v6 = *(void **)(v5 + 40);
      *(void *)(v5 + 40) = 0;
    }
  }
  [*(id *)(a1 + 40) unlock];
}

- (id)sharesAtServer:(id)a3 credentialType:(int64_t)a4 credential:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy_;
  v36 = __Block_byref_object_dispose_;
  id v37 = 0;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = __Block_byref_object_copy_;
  uint64_t v30 = __Block_byref_object_dispose_;
  id v31 = 0;
  BOOL v12 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
  if (v12) {
    -[SMBClientManager sharesAtServer:credentialType:credential:error:](v12, v13, v14, v15, v16, v17, v18, v19);
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[SMBClientManager sharesAtServer:credentialType:credential:error:]((uint64_t)v10);
  }
  uint64_t v20 = *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x263F522C0]);
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __67__SMBClientManager_sharesAtServer_credentialType_credential_error___block_invoke;
  v25[3] = &unk_264D50660;
  v25[4] = &v32;
  uint64_t v21 = [v20 synchronousRemoteObjectProxyWithErrorHandler:v25];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __67__SMBClientManager_sharesAtServer_credentialType_credential_error___block_invoke_2;
  v24[3] = &unk_264D506D8;
  v24[4] = &v26;
  v24[5] = &v32;
  [v21 sharesAtServer:v10 credentialType:a4 credential:v11 reply:v24];
  if (a6) {
    *a6 = (id) v33[5];
  }
  id v22 = (id)v27[5];
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  return v22;
}

void __67__SMBClientManager_sharesAtServer_credentialType_credential_error___block_invoke(uint64_t a1, void *a2)
{
}

void __67__SMBClientManager_sharesAtServer_credentialType_credential_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  int v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (void)sharesAtServer:(id)a3 credentialType:(int64_t)a4 credential:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x263F522C0]);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __79__SMBClientManager_sharesAtServer_credentialType_credential_completionHandler___block_invoke;
  v19[3] = &unk_264D505E8;
  id v12 = v10;
  id v20 = v12;
  id v13 = a5;
  id v14 = a3;
  uint64_t v15 = [v11 remoteObjectProxyWithErrorHandler:v19];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __79__SMBClientManager_sharesAtServer_credentialType_credential_completionHandler___block_invoke_2;
  v17[3] = &unk_264D50700;
  id v18 = v12;
  id v16 = v12;
  [v15 sharesAtServer:v14 credentialType:a4 credential:v13 reply:v17];
}

uint64_t __79__SMBClientManager_sharesAtServer_credentialType_credential_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __79__SMBClientManager_sharesAtServer_credentialType_credential_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)credentialTypesForServer:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  uint64_t v7 = *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x263F522C0]);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __63__SMBClientManager_credentialTypesForServer_completionHandler___block_invoke;
  v11[3] = &unk_264D505E8;
  id v12 = v6;
  id v8 = v6;
  id v9 = a3;
  id v10 = [v7 remoteObjectProxyWithErrorHandler:v11];
  [v10 SMBClientProtocolCredentialsForServer:v9 completionHandler:v8];
}

uint64_t __63__SMBClientManager_credentialTypesForServer_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addVolume:(uint64_t)a3 atServer:(uint64_t)a4 credentialType:(uint64_t)a5 credential:(uint64_t)a6 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)addVolumes:(void *)a3 atServer:credentialType:credential:completionHandler:.cold.1(uint8_t *buf, uint64_t a2, void *a3)
{
  *(_DWORD *)buf = 138412290;
  *a3 = a2;
  _os_log_error_impl(&dword_238915000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Iteration: '%@'", buf, 0xCu);
}

- (void)addVolumes:(uint64_t)a3 atServer:(uint64_t)a4 credentialType:(uint64_t)a5 credential:(uint64_t)a6 completionHandler:(uint64_t)a7 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)addVolumes:atServer:credentialType:credential:completionHandler:.cold.3()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_238915000, &_os_log_internal, OS_LOG_TYPE_ERROR, "addVolumes: starting", v0, 2u);
}

void __84__SMBClientManager_addVolumes_atServer_credentialType_credential_completionHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __84__SMBClientManager_addVolumes_atServer_credentialType_credential_completionHandler___block_invoke_47_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a2 + 32);
  int v3 = *(_DWORD *)(*(void *)(*(void *)(a2 + 64) + 8) + 24);
  int v4 = 138412802;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = v2;
  __int16 v8 = 1024;
  int v9 = v3;
  _os_log_error_impl(&dword_238915000, &_os_log_internal, OS_LOG_TYPE_ERROR, "addVolumes: multi calback got err %@ for mount %@, count was %d", (uint8_t *)&v4, 0x1Cu);
}

- (void)sharesAtServer:(uint64_t)a1 credentialType:credential:error:.cold.1(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v1 = 136315394;
  uint64_t v2 = "-[SMBClientManager sharesAtServer:credentialType:credential:error:]";
  __int16 v3 = 2112;
  uint64_t v4 = a1;
  _os_log_error_impl(&dword_238915000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: starting. server %@", (uint8_t *)&v1, 0x16u);
}

- (void)sharesAtServer:(uint64_t)a3 credentialType:(uint64_t)a4 credential:(uint64_t)a5 error:(uint64_t)a6 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end