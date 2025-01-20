@interface LiveFSUSBLocalStorageClient
+ (id)newManager;
- (id)getConnectionForVolume:(id)a3 withError:(id *)a4;
- (id)getVolumeName:(id)a3 withError:(id *)a4;
- (id)loadVolumes:(id)a3 ofType:(id)a4 withError:(id *)a5;
- (id)removeAllVirtualDisks;
- (void)loadVolume:(id)a3 ofType:(id)a4 withReply:(id)a5;
@end

@implementation LiveFSUSBLocalStorageClient

+ (id)newManager
{
  return (id)[a1 newConnectionForService:@"machp://com.apple.filesystems.localLiveFiles"];
}

- (id)getConnectionForVolume:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  if (a4) {
    *a4 = 0;
  }
  id v14 = 0;
  v7 = [(LiveFSClient *)self listenerForVolume:v6 error:&v14];
  id v8 = v14;
  if (v8)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      -[LiveFSUSBLocalStorageClient getConnectionForVolume:withError:]();
      if (a4) {
        goto LABEL_6;
      }
    }
    else if (a4)
    {
LABEL_6:
      v9 = 0;
      *a4 = v8;
      goto LABEL_10;
    }
    v9 = 0;
  }
  else
  {
    v9 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithListenerEndpoint:v7];
    v10 = [MEMORY[0x263F52270] interfaceForListeners];
    [v9 setRemoteObjectInterface:v10];

    v11 = [MEMORY[0x263F522B8] exportedClientInterface];
    [v9 setExportedInterface:v11];

    v12 = objc_opt_new();
    [v9 setExportedObject:v12];

    [v9 resume];
  }
LABEL_10:

  return v9;
}

- (id)getVolumeName:(id)a3 withError:(id *)a4
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x3032000000;
  v45 = __Block_byref_object_copy_;
  v46 = __Block_byref_object_dispose_;
  id v47 = 0;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = __Block_byref_object_copy_;
  v40 = __Block_byref_object_dispose_;
  id v41 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy_;
  v34 = __Block_byref_object_dispose_;
  id v35 = 0;
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __55__LiveFSUSBLocalStorageClient_getVolumeName_withError___block_invoke;
  v29[3] = &unk_264910D68;
  v29[4] = &v42;
  id v6 = [v4 remoteObjectProxyWithErrorHandler:v29];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __55__LiveFSUSBLocalStorageClient_getVolumeName_withError___block_invoke_4;
  v25[3] = &unk_264910D90;
  v27 = &v42;
  v28 = &v36;
  v7 = v5;
  v26 = v7;
  [v6 getRootFileHandleWithError:v25];
  dispatch_time_t v8 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v7, v8))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[LiveFSUSBLocalStorageClient getVolumeName:withError:]();
    }
    uint64_t v9 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:60 userInfo:0];
    v10 = (void *)v43[5];
    v43[5] = v9;
  }
  if (v43[5])
  {
    v11 = (void *)v31[5];
    v31[5] = @"Untitled";

    id v12 = (id)v31[5];
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = v37[5];
      *(_DWORD *)buf = 136315394;
      v49 = "-[LiveFSUSBLocalStorageClient getVolumeName:withError:]";
      __int16 v50 = 2112;
      uint64_t v51 = v13;
      _os_log_impl(&dword_22C12F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s: got rootFH(%@), about to get volume name", buf, 0x16u);
    }
    uint64_t v14 = v37[5];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __55__LiveFSUSBLocalStorageClient_getVolumeName_withError___block_invoke_13;
    v21[3] = &unk_264910DB8;
    v23 = &v42;
    v24 = &v30;
    v15 = v7;
    v22 = v15;
    [v6 otherAttributeOf:v14 named:@"_S_f_vol_name" requestID:-1 reply:v21];
    dispatch_time_t v16 = dispatch_time(0, 5000000000);
    if (dispatch_semaphore_wait(v15, v16))
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[LiveFSUSBLocalStorageClient getVolumeName:withError:]();
      }
      uint64_t v17 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:60 userInfo:0];
      v18 = (void *)v43[5];
      v43[5] = v17;
    }
    if (v43[5])
    {
      v19 = (void *)v31[5];
      v31[5] = @"Untitled";
    }
    id v12 = (id)v31[5];
  }
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);

  return v12;
}

void __55__LiveFSUSBLocalStorageClient_getVolumeName_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __55__LiveFSUSBLocalStorageClient_getVolumeName_withError___block_invoke_cold_1((uint64_t)v3);
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  dispatch_semaphore_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __55__LiveFSUSBLocalStorageClient_getVolumeName_withError___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  unint64_t v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (!v6 || v8)
  {
    if (!(v6 | v8))
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
        __55__LiveFSUSBLocalStorageClient_getVolumeName_withError___block_invoke_4_cold_1();
      }
      uint64_t v9 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:22 userInfo:0];
      uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
      v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __55__LiveFSUSBLocalStorageClient_getVolumeName_withError___block_invoke_13(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  unint64_t v6 = v5;
  if (!a2)
  {
    if (v5)
    {
      id v7 = v5;
      if ([v7 bytes])
      {
        uint64_t v8 = [v7 bytes];
        uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v10 = *(void **)(v9 + 40);
        *(void *)(v9 + 40) = 0;

        uint64_t v11 = [[NSString alloc] initWithUTF8String:v8];
        uint64_t v12 = *(void *)(a1 + 48);
LABEL_9:
        uint64_t v15 = *(void *)(v12 + 8);
        dispatch_time_t v16 = *(void **)(v15 + 40);
        *(void *)(v15 + 40) = v11;

        goto LABEL_10;
      }
    }
  }
  uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = @"Untitled";

  if (a2 != 2)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __55__LiveFSUSBLocalStorageClient_getVolumeName_withError___block_invoke_13_cold_1(a2);
    }
    uint64_t v11 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:a2 userInfo:0];
    uint64_t v12 = *(void *)(a1 + 40);
    goto LABEL_9;
  }
LABEL_10:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)loadVolumes:(id)a3 ofType:(id)a4 withError:(id *)a5
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy_;
  v29 = __Block_byref_object_dispose_;
  id v30 = 0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  id v24 = 0;
  uint64_t v10 = livefs_std_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[LiveFSUSBLocalStorageClient loadVolumes:ofType:withError:]();
  }

  uint64_t v11 = *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x263F522C0]);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __60__LiveFSUSBLocalStorageClient_loadVolumes_ofType_withError___block_invoke;
  v18[3] = &unk_264910D68;
  v18[4] = &v25;
  uint64_t v12 = [v11 synchronousRemoteObjectProxyWithErrorHandler:v18];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __60__LiveFSUSBLocalStorageClient_loadVolumes_ofType_withError___block_invoke_2;
  v17[3] = &unk_264910DE0;
  v17[4] = &v25;
  v17[5] = &v19;
  [v12 addDisk:v8 fileSystemType:v9 reply:v17];
  if (v26[5] || ![(id)v20[5] count])
  {
    if (a5) {
      *a5 = (id) v26[5];
    }
  }
  else
  {
    uint64_t v13 = livefs_std_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v16 = v20[5];
      *(_DWORD *)buf = 136315906;
      uint64_t v32 = "-[LiveFSUSBLocalStorageClient loadVolumes:ofType:withError:]";
      __int16 v33 = 2112;
      id v34 = v8;
      __int16 v35 = 2112;
      id v36 = v9;
      __int16 v37 = 2112;
      uint64_t v38 = v16;
      _os_log_debug_impl(&dword_22C12F000, v13, OS_LOG_TYPE_DEBUG, "%s:finish:%@:%@:%@", buf, 0x2Au);
    }
  }
  id v14 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v14;
}

void __60__LiveFSUSBLocalStorageClient_loadVolumes_ofType_withError___block_invoke(uint64_t a1, void *a2)
{
}

void __60__LiveFSUSBLocalStorageClient_loadVolumes_ofType_withError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (void)loadVolume:(id)a3 ofType:(id)a4 withReply:(id)a5
{
  id v8 = a5;
  uint64_t v9 = *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x263F522C0]);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __59__LiveFSUSBLocalStorageClient_loadVolume_ofType_withReply___block_invoke;
  v14[3] = &unk_264910E08;
  id v15 = v8;
  id v10 = v8;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = [v9 remoteObjectProxyWithErrorHandler:v14];
  [v13 addDisk:v12 fileSystemType:v11 reply:v10];
}

uint64_t __59__LiveFSUSBLocalStorageClient_loadVolume_ofType_withReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)removeAllVirtualDisks
{
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  id v24 = 0;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy_;
  uint64_t v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  v2 = *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x263F522C0]);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __52__LiveFSUSBLocalStorageClient_removeAllVirtualDisks__block_invoke;
  v12[3] = &unk_264910D68;
  v12[4] = &v19;
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:v12];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __52__LiveFSUSBLocalStorageClient_removeAllVirtualDisks__block_invoke_2;
  v11[3] = &unk_264910E30;
  v11[4] = &v13;
  [v3 listVolumes:v11];
  uint64_t v4 = (void *)v20[5];
  if (!v4)
  {
    id v5 = (void *)v14[5];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __52__LiveFSUSBLocalStorageClient_removeAllVirtualDisks__block_invoke_3;
    v8[3] = &unk_264910E80;
    id v9 = v3;
    id v10 = &v19;
    [v5 enumerateKeysAndObjectsUsingBlock:v8];

    uint64_t v4 = (void *)v20[5];
  }
  id v6 = v4;
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);

  return v6;
}

void __52__LiveFSUSBLocalStorageClient_removeAllVirtualDisks__block_invoke(uint64_t a1, void *a2)
{
}

void __52__LiveFSUSBLocalStorageClient_removeAllVirtualDisks__block_invoke_2(uint64_t a1, void *a2)
{
}

void __52__LiveFSUSBLocalStorageClient_removeAllVirtualDisks__block_invoke_3(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    if ([v7 containsString:@"/var/mobile/"])
    {
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __52__LiveFSUSBLocalStorageClient_removeAllVirtualDisks__block_invoke_4;
      v9[3] = &unk_264910E58;
      id v8 = *(void **)(a1 + 32);
      v9[4] = *(void *)(a1 + 40);
      v9[5] = a4;
      [v8 ejectDisk:v7 usingFlags:1 reply:v9];
    }
  }
}

void __52__LiveFSUSBLocalStorageClient_removeAllVirtualDisks__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = livefs_std_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    id v7 = "-[LiveFSUSBLocalStorageClient removeAllVirtualDisks]_block_invoke_4";
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_22C12F000, v5, OS_LOG_TYPE_DEFAULT, "%s: eject got %@", (uint8_t *)&v6, 0x16u);
  }

  if (v4)
  {
    **(unsigned char **)(a1 + 40) = 1;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
}

- (void)getConnectionForVolume:withError:.cold.1()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  v0[0] = 136315650;
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_22C12F000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: Unable to get connection endpoint to volume %@ : %@", (uint8_t *)v0, 0x20u);
}

- (void)getVolumeName:withError:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  int v0 = 136315138;
  uint64_t v1 = "-[LiveFSUSBLocalStorageClient getVolumeName:withError:]";
  _os_log_error_impl(&dword_22C12F000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:timed out getting volume name.", (uint8_t *)&v0, 0xCu);
}

- (void)getVolumeName:withError:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  int v0 = 136315138;
  uint64_t v1 = "-[LiveFSUSBLocalStorageClient getVolumeName:withError:]";
  _os_log_error_impl(&dword_22C12F000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s:timed out getting root fh for the volume.", (uint8_t *)&v0, 0xCu);
}

void __55__LiveFSUSBLocalStorageClient_getVolumeName_withError___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v1 = 136315394;
  uint64_t v2 = "-[LiveFSUSBLocalStorageClient getVolumeName:withError:]_block_invoke";
  __int16 v3 = 2112;
  uint64_t v4 = a1;
  _os_log_error_impl(&dword_22C12F000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: connection error handler called: %@", (uint8_t *)&v1, 0x16u);
}

void __55__LiveFSUSBLocalStorageClient_getVolumeName_withError___block_invoke_4_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  int v0 = 136315138;
  int v1 = "-[LiveFSUSBLocalStorageClient getVolumeName:withError:]_block_invoke";
  _os_log_fault_impl(&dword_22C12F000, &_os_log_internal, OS_LOG_TYPE_FAULT, "%s: no error but also no fh", (uint8_t *)&v0, 0xCu);
}

void __55__LiveFSUSBLocalStorageClient_getVolumeName_withError___block_invoke_13_cold_1(int a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v1 = 136315394;
  uint64_t v2 = "-[LiveFSUSBLocalStorageClient getVolumeName:withError:]_block_invoke";
  __int16 v3 = 1024;
  int v4 = a1;
  _os_log_error_impl(&dword_22C12F000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: error getting volume name: %d", (uint8_t *)&v1, 0x12u);
}

- (void)loadVolumes:ofType:withError:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_22C12F000, v0, OS_LOG_TYPE_DEBUG, "%s:start:%@:%@", (uint8_t *)v1, 0x20u);
}

@end