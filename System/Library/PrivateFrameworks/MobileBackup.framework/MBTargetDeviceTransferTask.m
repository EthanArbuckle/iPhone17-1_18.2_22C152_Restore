@interface MBTargetDeviceTransferTask
- (BOOL)_startWithError:(id *)a3;
- (MBTargetDeviceTransferTask)initWithFileTransferSession:(id)a3;
- (id)keychainTransferCompletionHandler;
- (id)preflightCompletionHandler;
- (int64_t)taskType;
- (void)_cancel;
- (void)_finishKeychainTransferWithError:(id)a3 completionHandler:(id)a4;
- (void)_finishWithError:(id)a3;
- (void)cancel;
- (void)manager:(id)a3 didFinishDeviceTransferWithError:(id)a4;
- (void)manager:(id)a3 didUpdateDeviceTransferProgress:(id)a4;
- (void)setKeychainTransferCompletionHandler:(id)a3;
- (void)setPreflightCompletionHandler:(id)a3;
- (void)start;
- (void)startDataTransferWithPreflightInfo:(id)a3 completionHandler:(id)a4;
- (void)startKeychainDataImportWithKeychainInfo:(id)a3 completionHandler:(id)a4;
- (void)startKeychainDataTransferWithCompletionHandler:(id)a3;
- (void)startKeychainTransferWithCompletionHandler:(id)a3;
- (void)startPreflightWithCompletionHandler:(id)a3;
@end

@implementation MBTargetDeviceTransferTask

- (int64_t)taskType
{
  return 2;
}

- (MBTargetDeviceTransferTask)initWithFileTransferSession:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MBTargetDeviceTransferTask;
  return [(MBDeviceTransferTask *)&v4 initWithFileTransferSession:a3];
}

- (BOOL)_startWithError:(id *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v5 = [(MBDeviceTransferTask *)self queue];
  dispatch_assert_queue_V2(v5);

  v6 = MBGetDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = self;
    _os_log_impl(&dword_1DD9AE000, v6, OS_LOG_TYPE_DEFAULT, "%@: Starting the device transfer task", buf, 0xCu);
    _MBLog(@"DEFAULT", (uint64_t)"%@: Starting the device transfer task", v7, v8, v9, v10, v11, v12, (uint64_t)self);
  }

  v13 = objc_opt_new();
  v14 = [(MBDeviceTransferTask *)self fileTransferSession];
  [v13 setFileTransferSession:v14];

  v15 = [(MBDeviceTransferTask *)self manager];
  if (!v15) {
    -[MBTargetDeviceTransferTask _startWithError:]();
  }
  v16 = v15;
  char v17 = objc_msgSend(v15, "startDeviceTransferWithTaskType:sessionInfo:error:", -[MBTargetDeviceTransferTask taskType](self, "taskType"), v13, a3);

  return v17;
}

- (void)start
{
  v2.receiver = self;
  v2.super_class = (Class)MBTargetDeviceTransferTask;
  [(MBDeviceTransferTask *)&v2 start];
}

- (void)_cancel
{
}

- (void)cancel
{
  v2.receiver = self;
  v2.super_class = (Class)MBTargetDeviceTransferTask;
  [(MBDeviceTransferTask *)&v2 cancel];
}

- (void)_finishWithError:(id)a3
{
  id v4 = a3;
  v5 = [(MBDeviceTransferTask *)self queue];
  dispatch_assert_queue_V2(v5);

  [(MBDeviceTransferTask *)self setProgressHandler:0];
  [(MBTargetDeviceTransferTask *)self setKeychainTransferCompletionHandler:0];
  v6.receiver = self;
  v6.super_class = (Class)MBTargetDeviceTransferTask;
  [(MBDeviceTransferTask *)&v6 _finishWithError:v4];
}

- (void)startPreflightWithCompletionHandler:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = 0;
  atomic_compare_exchange_strong((atomic_uchar *volatile)&self->_startedPreflight, (unsigned __int8 *)&v5, 1u);
  if (v5) {
    -[MBTargetDeviceTransferTask startPreflightWithCompletionHandler:]();
  }
  objc_super v6 = v4;
  uint64_t v7 = MBGetDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_1DD9AE000, v7, OS_LOG_TYPE_DEFAULT, "%@: Starting the preflight", (uint8_t *)&buf, 0xCu);
    _MBLog(@"DEFAULT", (uint64_t)"%@: Starting the preflight", v8, v9, v10, v11, v12, v13, (uint64_t)self);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__2;
  v32 = __Block_byref_object_dispose__2;
  id v33 = 0;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__2;
  v27[4] = __Block_byref_object_dispose__2;
  id v28 = 0;
  v14 = dispatch_group_create();
  dispatch_group_enter(v14);
  v15 = [(MBDeviceTransferTask *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__MBTargetDeviceTransferTask_startPreflightWithCompletionHandler___block_invoke;
  block[3] = &unk_1E6D01448;
  block[4] = self;
  v25 = v27;
  v16 = v14;
  v24 = v16;
  p_long long buf = &buf;
  dispatch_async(v15, block);

  char v17 = [(MBDeviceTransferTask *)self queue];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __66__MBTargetDeviceTransferTask_startPreflightWithCompletionHandler___block_invoke_3;
  v19[3] = &unk_1E6D01470;
  uint64_t v21 = &buf;
  v22 = v27;
  v19[4] = self;
  id v20 = v6;
  id v18 = v6;
  dispatch_group_notify(v16, v17, v19);

  _Block_object_dispose(v27, 8);
  _Block_object_dispose(&buf, 8);
}

void __66__MBTargetDeviceTransferTask_startPreflightWithCompletionHandler___block_invoke(uint64_t a1)
{
  objc_super v2 = *(void **)(a1 + 32);
  id v11 = 0;
  char v3 = [v2 _handleCompletionWithError:&v11];
  id v4 = v11;
  id v5 = v11;
  if (v3)
  {
    if (([*(id *)(a1 + 32) started] & 1) == 0) {
      __66__MBTargetDeviceTransferTask_startPreflightWithCompletionHandler___block_invoke_cold_2();
    }
    uint64_t v6 = [*(id *)(a1 + 32) manager];
    if (!v6) {
      __66__MBTargetDeviceTransferTask_startPreflightWithCompletionHandler___block_invoke_cold_1();
    }
    uint64_t v7 = (void *)v6;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __66__MBTargetDeviceTransferTask_startPreflightWithCompletionHandler___block_invoke_2;
    v8[3] = &unk_1E6D01420;
    int8x16_t v10 = vextq_s8(*(int8x16_t *)(a1 + 48), *(int8x16_t *)(a1 + 48), 8uLL);
    id v9 = *(id *)(a1 + 40);
    [v7 startPreflightWithCompletionHandler:v8];
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v4);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
}

void __66__MBTargetDeviceTransferTask_startPreflightWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  int8x16_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __66__MBTargetDeviceTransferTask_startPreflightWithCompletionHandler___block_invoke_3(uint64_t *a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)(a1[7] + 8) + 40);
  if (*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    if (!v2)
    {
      char v3 = MBGetDefaultLog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v4 = a1[4];
        uint64_t v5 = *(void *)(*(void *)(a1[6] + 8) + 40);
        *(_DWORD *)long long buf = 138412546;
        uint64_t v22 = v4;
        __int16 v23 = 2112;
        uint64_t v24 = v5;
        _os_log_impl(&dword_1DD9AE000, v3, OS_LOG_TYPE_DEFAULT, "%@: Finished the preflight: %@", buf, 0x16u);
        _MBLog(@"DEFAULT", (uint64_t)"%@: Finished the preflight: %@", v6, v7, v8, v9, v10, v11, a1[4]);
      }
      goto LABEL_8;
    }
  }
  else if (!v2)
  {
    __66__MBTargetDeviceTransferTask_startPreflightWithCompletionHandler___block_invoke_3_cold_1();
  }
  char v3 = MBGetDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    uint64_t v12 = a1[4];
    uint64_t v13 = *(void *)(*(void *)(a1[7] + 8) + 40);
    *(_DWORD *)long long buf = 138412546;
    uint64_t v22 = v12;
    __int16 v23 = 2112;
    uint64_t v24 = v13;
    _os_log_impl(&dword_1DD9AE000, v3, OS_LOG_TYPE_ERROR, "%@: Failed the preflight: %@", buf, 0x16u);
    _MBLog(@"ERROR", (uint64_t)"%@: Failed the preflight: %@", v14, v15, v16, v17, v18, v19, a1[4]);
  }
LABEL_8:

  uint64_t result = a1[5];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(void *)(*(void *)(a1[6] + 8) + 40), *(void *)(*(void *)(a1[7] + 8) + 40));
  }
  return result;
}

- (void)startKeychainTransferWithCompletionHandler:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = 0;
  atomic_compare_exchange_strong((atomic_uchar *volatile)&self->_startedKeychainTransfer, (unsigned __int8 *)&v5, 1u);
  if (v5) {
    -[MBTargetDeviceTransferTask startKeychainTransferWithCompletionHandler:]();
  }
  uint64_t v6 = v4;
  uint64_t v7 = MBGetDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v19 = self;
    _os_log_impl(&dword_1DD9AE000, v7, OS_LOG_TYPE_DEFAULT, "%@: Starting the keychain transfer", buf, 0xCu);
    _MBLog(@"DEFAULT", (uint64_t)"%@: Starting the keychain transfer", v8, v9, v10, v11, v12, v13, (uint64_t)self);
  }

  uint64_t v14 = [(MBDeviceTransferTask *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__MBTargetDeviceTransferTask_startKeychainTransferWithCompletionHandler___block_invoke;
  block[3] = &unk_1E6D00EB8;
  block[4] = self;
  id v17 = v6;
  id v15 = v6;
  dispatch_async(v14, block);
}

void __73__MBTargetDeviceTransferTask_startKeychainTransferWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v11 = 0;
  char v3 = [v2 _handleCompletionWithError:&v11];
  id v4 = v11;
  char v5 = *(void **)(a1 + 32);
  if (v3)
  {
    if (([v5 started] & 1) == 0) {
      __73__MBTargetDeviceTransferTask_startKeychainTransferWithCompletionHandler___block_invoke_cold_2();
    }
    uint64_t v6 = [*(id *)(a1 + 32) manager];
    if (!v6) {
      __73__MBTargetDeviceTransferTask_startKeychainTransferWithCompletionHandler___block_invoke_cold_1();
    }
    uint64_t v7 = (void *)v6;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __73__MBTargetDeviceTransferTask_startKeychainTransferWithCompletionHandler___block_invoke_2;
    v9[3] = &unk_1E6D01498;
    uint64_t v8 = *(void **)(a1 + 40);
    v9[4] = *(void *)(a1 + 32);
    id v10 = v8;
    [v7 startKeychainTransferWithCompletionHandler:v9];
  }
  else
  {
    [v5 _finishKeychainTransferWithError:v4 completionHandler:*(void *)(a1 + 40)];
  }
}

void __73__MBTargetDeviceTransferTask_startKeychainTransferWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__MBTargetDeviceTransferTask_startKeychainTransferWithCompletionHandler___block_invoke_3;
  block[3] = &unk_1E6D01210;
  char v5 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, block);
}

uint64_t __73__MBTargetDeviceTransferTask_startKeychainTransferWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishKeychainTransferWithError:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)_finishKeychainTransferWithError:(id)a3 completionHandler:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, id))a4;
  id v8 = [(MBDeviceTransferTask *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = MBGetDefaultLog();
  id v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412546;
      uint64_t v25 = self;
      __int16 v26 = 2112;
      id v27 = v6;
      _os_log_impl(&dword_1DD9AE000, v10, OS_LOG_TYPE_ERROR, "%@: Failed the keychain transfer: %@", buf, 0x16u);
      _MBLog(@"ERROR", (uint64_t)"%@: Failed the keychain transfer: %@", v11, v12, v13, v14, v15, v16, (uint64_t)self);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v25 = self;
    _os_log_impl(&dword_1DD9AE000, v10, OS_LOG_TYPE_DEFAULT, "%@: Finished the keychain transfer", buf, 0xCu);
    _MBLog(@"DEFAULT", (uint64_t)"%@: Finished the keychain transfer", v17, v18, v19, v20, v21, v22, (uint64_t)self);
  }

  unsigned __int8 v23 = atomic_load((unsigned __int8 *)&self->_startedKeychainTransfer);
  if ((v23 & 1) == 0) {
    -[MBTargetDeviceTransferTask _finishKeychainTransferWithError:completionHandler:]();
  }
  if (v7) {
    v7[2](v7, v6);
  }
}

- (void)startKeychainDataTransferWithCompletionHandler:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = 0;
  atomic_compare_exchange_strong((atomic_uchar *volatile)&self->_startedKeychainDataTransfer, (unsigned __int8 *)&v5, 1u);
  if (v5) {
    -[MBTargetDeviceTransferTask startKeychainDataTransferWithCompletionHandler:]();
  }
  id v6 = v4;
  uint64_t v7 = MBGetDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_1DD9AE000, v7, OS_LOG_TYPE_DEFAULT, "%@: Starting the keychain data transfer", (uint8_t *)&buf, 0xCu);
    _MBLog(@"DEFAULT", (uint64_t)"%@: Starting the keychain data transfer", v8, v9, v10, v11, v12, v13, (uint64_t)self);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__2;
  v32 = __Block_byref_object_dispose__2;
  id v33 = 0;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__2;
  v27[4] = __Block_byref_object_dispose__2;
  id v28 = 0;
  uint64_t v14 = dispatch_group_create();
  dispatch_group_enter(v14);
  uint64_t v15 = [(MBDeviceTransferTask *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__MBTargetDeviceTransferTask_startKeychainDataTransferWithCompletionHandler___block_invoke;
  block[3] = &unk_1E6D01448;
  block[4] = self;
  uint64_t v25 = v27;
  uint64_t v16 = v14;
  uint64_t v24 = v16;
  p_long long buf = &buf;
  dispatch_async(v15, block);

  uint64_t v17 = [(MBDeviceTransferTask *)self queue];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __77__MBTargetDeviceTransferTask_startKeychainDataTransferWithCompletionHandler___block_invoke_3;
  v19[3] = &unk_1E6D01470;
  uint64_t v21 = &buf;
  uint64_t v22 = v27;
  v19[4] = self;
  id v20 = v6;
  id v18 = v6;
  dispatch_group_notify(v16, v17, v19);

  _Block_object_dispose(v27, 8);
  _Block_object_dispose(&buf, 8);
}

void __77__MBTargetDeviceTransferTask_startKeychainDataTransferWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v11 = 0;
  char v3 = [v2 _handleCompletionWithError:&v11];
  id v4 = v11;
  id v5 = v11;
  if (v3)
  {
    if (([*(id *)(a1 + 32) started] & 1) == 0) {
      __77__MBTargetDeviceTransferTask_startKeychainDataTransferWithCompletionHandler___block_invoke_cold_2();
    }
    uint64_t v6 = [*(id *)(a1 + 32) manager];
    if (!v6) {
      __77__MBTargetDeviceTransferTask_startKeychainDataTransferWithCompletionHandler___block_invoke_cold_1();
    }
    uint64_t v7 = (void *)v6;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __77__MBTargetDeviceTransferTask_startKeychainDataTransferWithCompletionHandler___block_invoke_2;
    v8[3] = &unk_1E6D014C0;
    int8x16_t v10 = vextq_s8(*(int8x16_t *)(a1 + 48), *(int8x16_t *)(a1 + 48), 8uLL);
    id v9 = *(id *)(a1 + 40);
    [v7 startKeychainDataTransferWithCompletionHandler:v8];
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v4);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
}

void __77__MBTargetDeviceTransferTask_startKeychainDataTransferWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  int8x16_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __77__MBTargetDeviceTransferTask_startKeychainDataTransferWithCompletionHandler___block_invoke_3(uint64_t *a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)(a1[7] + 8) + 40);
  if (*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    if (!v2)
    {
      char v3 = MBGetDefaultLog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v4 = a1[4];
        uint64_t v5 = *(void *)(*(void *)(a1[6] + 8) + 40);
        *(_DWORD *)long long buf = 138412546;
        uint64_t v22 = v4;
        __int16 v23 = 2112;
        uint64_t v24 = v5;
        _os_log_impl(&dword_1DD9AE000, v3, OS_LOG_TYPE_DEFAULT, "%@: Finished the keychain data transfer: %@", buf, 0x16u);
        _MBLog(@"DEFAULT", (uint64_t)"%@: Finished the keychain data transfer: %@", v6, v7, v8, v9, v10, v11, a1[4]);
      }
      goto LABEL_8;
    }
  }
  else if (!v2)
  {
    __77__MBTargetDeviceTransferTask_startKeychainDataTransferWithCompletionHandler___block_invoke_3_cold_1();
  }
  char v3 = MBGetDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    uint64_t v12 = a1[4];
    uint64_t v13 = *(void *)(*(void *)(a1[7] + 8) + 40);
    *(_DWORD *)long long buf = 138412546;
    uint64_t v22 = v12;
    __int16 v23 = 2112;
    uint64_t v24 = v13;
    _os_log_impl(&dword_1DD9AE000, v3, OS_LOG_TYPE_ERROR, "%@: Failed the keychain data transfer: %@", buf, 0x16u);
    _MBLog(@"ERROR", (uint64_t)"%@: Failed the keychain data transfer: %@", v14, v15, v16, v17, v18, v19, a1[4]);
  }
LABEL_8:

  uint64_t result = a1[5];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(void *)(*(void *)(a1[6] + 8) + 40), *(void *)(*(void *)(a1[7] + 8) + 40));
  }
  return result;
}

- (void)startKeychainDataImportWithKeychainInfo:(id)a3 completionHandler:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    -[MBTargetDeviceTransferTask startKeychainDataImportWithKeychainInfo:completionHandler:]();
  }
  char v8 = 0;
  atomic_compare_exchange_strong((atomic_uchar *volatile)&self->_startedKeychainDataImport, (unsigned __int8 *)&v8, 1u);
  if (v8) {
    -[MBTargetDeviceTransferTask startKeychainDataImportWithKeychainInfo:completionHandler:]();
  }
  uint64_t v9 = v7;
  uint64_t v10 = MBGetDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_1DD9AE000, v10, OS_LOG_TYPE_DEFAULT, "%@: Starting the keychain data import", (uint8_t *)&buf, 0xCu);
    _MBLog(@"DEFAULT", (uint64_t)"%@: Starting the keychain data import", v11, v12, v13, v14, v15, v16, (uint64_t)self);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__2;
  id v33 = __Block_byref_object_dispose__2;
  id v34 = 0;
  uint64_t v17 = dispatch_group_create();
  dispatch_group_enter(v17);
  uint64_t v18 = [(MBDeviceTransferTask *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__MBTargetDeviceTransferTask_startKeychainDataImportWithKeychainInfo_completionHandler___block_invoke;
  block[3] = &unk_1E6D014E8;
  block[4] = self;
  p_long long buf = &buf;
  uint64_t v19 = v17;
  id v27 = v19;
  id v20 = v6;
  id v28 = v20;
  dispatch_async(v18, block);

  uint64_t v21 = [(MBDeviceTransferTask *)self queue];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __88__MBTargetDeviceTransferTask_startKeychainDataImportWithKeychainInfo_completionHandler___block_invoke_3;
  v23[3] = &unk_1E6D01510;
  id v24 = v9;
  uint64_t v25 = &buf;
  v23[4] = self;
  id v22 = v9;
  dispatch_group_notify(v19, v21, v23);

  _Block_object_dispose(&buf, 8);
}

void __88__MBTargetDeviceTransferTask_startKeychainDataImportWithKeychainInfo_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v12 = 0;
  char v3 = [v2 _handleCompletionWithError:&v12];
  id v4 = v12;
  id v5 = v12;
  if (v3)
  {
    if (([*(id *)(a1 + 32) started] & 1) == 0) {
      __88__MBTargetDeviceTransferTask_startKeychainDataImportWithKeychainInfo_completionHandler___block_invoke_cold_2();
    }
    uint64_t v6 = [*(id *)(a1 + 32) manager];
    if (!v6) {
      __88__MBTargetDeviceTransferTask_startKeychainDataImportWithKeychainInfo_completionHandler___block_invoke_cold_1();
    }
    id v7 = (void *)v6;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __88__MBTargetDeviceTransferTask_startKeychainDataImportWithKeychainInfo_completionHandler___block_invoke_2;
    v9[3] = &unk_1E6D01238;
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v11 = *(void *)(a1 + 56);
    id v10 = *(id *)(a1 + 40);
    [v7 startKeychainDataImportWithKeychainInfo:v8 completionHandler:v9];
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v4);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
}

void __88__MBTargetDeviceTransferTask_startKeychainDataImportWithKeychainInfo_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __88__MBTargetDeviceTransferTask_startKeychainDataImportWithKeychainInfo_completionHandler___block_invoke_3(uint64_t *a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)(a1[6] + 8) + 40);
  char v3 = MBGetDefaultLog();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = a1[4];
      uint64_t v6 = *(void *)(*(void *)(a1[6] + 8) + 40);
      *(_DWORD *)long long buf = 138412546;
      uint64_t v22 = v5;
      __int16 v23 = 2112;
      uint64_t v24 = v6;
      _os_log_impl(&dword_1DD9AE000, v4, OS_LOG_TYPE_ERROR, "%@: Failed the keychain data import: %@", buf, 0x16u);
      _MBLog(@"ERROR", (uint64_t)"%@: Failed the keychain data import: %@", v7, v8, v9, v10, v11, v12, a1[4]);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = a1[4];
    *(_DWORD *)long long buf = 138412290;
    uint64_t v22 = v13;
    _os_log_impl(&dword_1DD9AE000, v4, OS_LOG_TYPE_DEFAULT, "%@: Finished the keychain data import", buf, 0xCu);
    _MBLog(@"DEFAULT", (uint64_t)"%@: Finished the keychain data import", v14, v15, v16, v17, v18, v19, a1[4]);
  }

  uint64_t result = a1[5];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(*(void *)(a1[6] + 8) + 40));
  }
  return result;
}

- (void)startDataTransferWithPreflightInfo:(id)a3 completionHandler:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    -[MBTargetDeviceTransferTask startDataTransferWithPreflightInfo:completionHandler:]();
  }
  char v8 = 0;
  atomic_compare_exchange_strong((atomic_uchar *volatile)&self->_startedDataTransfer, (unsigned __int8 *)&v8, 1u);
  if (v8) {
    -[MBTargetDeviceTransferTask startDataTransferWithPreflightInfo:completionHandler:]();
  }
  uint64_t v9 = v7;
  uint64_t v10 = MBGetDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_1DD9AE000, v10, OS_LOG_TYPE_DEFAULT, "%@: Starting the data transfer", (uint8_t *)&buf, 0xCu);
    _MBLog(@"DEFAULT", (uint64_t)"%@: Starting the data transfer", v11, v12, v13, v14, v15, v16, (uint64_t)self);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__2;
  id v33 = __Block_byref_object_dispose__2;
  id v34 = 0;
  uint64_t v17 = dispatch_group_create();
  dispatch_group_enter(v17);
  uint64_t v18 = [(MBDeviceTransferTask *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__MBTargetDeviceTransferTask_startDataTransferWithPreflightInfo_completionHandler___block_invoke;
  block[3] = &unk_1E6D014E8;
  block[4] = self;
  p_long long buf = &buf;
  uint64_t v19 = v17;
  id v27 = v19;
  id v20 = v6;
  id v28 = v20;
  dispatch_async(v18, block);

  uint64_t v21 = [(MBDeviceTransferTask *)self queue];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __83__MBTargetDeviceTransferTask_startDataTransferWithPreflightInfo_completionHandler___block_invoke_3;
  v23[3] = &unk_1E6D01510;
  id v24 = v9;
  uint64_t v25 = &buf;
  v23[4] = self;
  id v22 = v9;
  dispatch_group_notify(v19, v21, v23);

  _Block_object_dispose(&buf, 8);
}

void __83__MBTargetDeviceTransferTask_startDataTransferWithPreflightInfo_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v12 = 0;
  char v3 = [v2 _handleCompletionWithError:&v12];
  id v4 = v12;
  id v5 = v12;
  if (v3)
  {
    if (([*(id *)(a1 + 32) started] & 1) == 0) {
      __83__MBTargetDeviceTransferTask_startDataTransferWithPreflightInfo_completionHandler___block_invoke_cold_2();
    }
    uint64_t v6 = [*(id *)(a1 + 32) manager];
    if (!v6) {
      __83__MBTargetDeviceTransferTask_startDataTransferWithPreflightInfo_completionHandler___block_invoke_cold_1();
    }
    id v7 = (void *)v6;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __83__MBTargetDeviceTransferTask_startDataTransferWithPreflightInfo_completionHandler___block_invoke_2;
    v9[3] = &unk_1E6D01238;
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v11 = *(void *)(a1 + 56);
    id v10 = *(id *)(a1 + 40);
    [v7 startDataTransferWithPreflightInfo:v8 completionHandler:v9];
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v4);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
}

void __83__MBTargetDeviceTransferTask_startDataTransferWithPreflightInfo_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __83__MBTargetDeviceTransferTask_startDataTransferWithPreflightInfo_completionHandler___block_invoke_3(uint64_t *a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)(a1[6] + 8) + 40);
  char v3 = MBGetDefaultLog();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = a1[4];
      uint64_t v6 = *(void *)(*(void *)(a1[6] + 8) + 40);
      *(_DWORD *)long long buf = 138412546;
      uint64_t v22 = v5;
      __int16 v23 = 2112;
      uint64_t v24 = v6;
      _os_log_impl(&dword_1DD9AE000, v4, OS_LOG_TYPE_ERROR, "%@: Failed the data transfer: %@", buf, 0x16u);
      _MBLog(@"ERROR", (uint64_t)"%@: Failed the data transfer: %@", v7, v8, v9, v10, v11, v12, a1[4]);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = a1[4];
    *(_DWORD *)long long buf = 138412290;
    uint64_t v22 = v13;
    _os_log_impl(&dword_1DD9AE000, v4, OS_LOG_TYPE_DEFAULT, "%@: Finished the data transfer", buf, 0xCu);
    _MBLog(@"DEFAULT", (uint64_t)"%@: Finished the data transfer", v14, v15, v16, v17, v18, v19, a1[4]);
  }

  uint64_t result = a1[5];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(*(void *)(a1[6] + 8) + 40));
  }
  return result;
}

- (void)manager:(id)a3 didFinishDeviceTransferWithError:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (![(MBDeviceTransferTask *)self finished])
  {
    uint64_t v6 = MBGetDefaultLog();
    uint64_t v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412546;
        uint64_t v21 = self;
        __int16 v22 = 2112;
        id v23 = v5;
        _os_log_impl(&dword_1DD9AE000, v7, OS_LOG_TYPE_ERROR, "%@: Failed the target transfer task: %@", buf, 0x16u);
        _MBLog(@"ERROR", (uint64_t)"%@: Failed the target transfer task: %@", v8, v9, v10, v11, v12, v13, (uint64_t)self);
      }
    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v21 = self;
      _os_log_impl(&dword_1DD9AE000, v7, OS_LOG_TYPE_DEFAULT, "%@: Finished the target transfer task", buf, 0xCu);
      _MBLog(@"DEFAULT", (uint64_t)"%@: Finished the target transfer task", v14, v15, v16, v17, v18, v19, (uint64_t)self);
    }

    [(MBTargetDeviceTransferTask *)self _finishWithError:v5];
  }
}

- (void)manager:(id)a3 didUpdateDeviceTransferProgress:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (![(MBDeviceTransferTask *)self finished])
  {
    uint64_t v6 = MBGetDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v16 = v5;
      _os_log_impl(&dword_1DD9AE000, v6, OS_LOG_TYPE_DEFAULT, "Updated progress: %@", buf, 0xCu);
      _MBLog(@"DEFAULT", (uint64_t)"Updated progress: %@", v7, v8, v9, v10, v11, v12, (uint64_t)v5);
    }

    uint64_t v13 = [(MBDeviceTransferTask *)self progressHandler];

    if (v13)
    {
      uint64_t v14 = [(MBDeviceTransferTask *)self progressHandler];
      ((void (**)(void, id))v14)[2](v14, v5);
    }
  }
}

- (id)preflightCompletionHandler
{
  return self->_preflightCompletionHandler;
}

- (void)setPreflightCompletionHandler:(id)a3
{
}

- (id)keychainTransferCompletionHandler
{
  return self->_keychainTransferCompletionHandler;
}

- (void)setKeychainTransferCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_keychainTransferCompletionHandler, 0);
  objc_storeStrong(&self->_preflightCompletionHandler, 0);
}

- (void)_startWithError:.cold.1()
{
}

- (void)startPreflightWithCompletionHandler:.cold.1()
{
}

void __66__MBTargetDeviceTransferTask_startPreflightWithCompletionHandler___block_invoke_cold_1()
{
}

void __66__MBTargetDeviceTransferTask_startPreflightWithCompletionHandler___block_invoke_cold_2()
{
}

void __66__MBTargetDeviceTransferTask_startPreflightWithCompletionHandler___block_invoke_3_cold_1()
{
}

- (void)startKeychainTransferWithCompletionHandler:.cold.1()
{
}

void __73__MBTargetDeviceTransferTask_startKeychainTransferWithCompletionHandler___block_invoke_cold_1()
{
}

void __73__MBTargetDeviceTransferTask_startKeychainTransferWithCompletionHandler___block_invoke_cold_2()
{
}

- (void)_finishKeychainTransferWithError:completionHandler:.cold.1()
{
}

- (void)startKeychainDataTransferWithCompletionHandler:.cold.1()
{
}

void __77__MBTargetDeviceTransferTask_startKeychainDataTransferWithCompletionHandler___block_invoke_cold_1()
{
}

void __77__MBTargetDeviceTransferTask_startKeychainDataTransferWithCompletionHandler___block_invoke_cold_2()
{
}

void __77__MBTargetDeviceTransferTask_startKeychainDataTransferWithCompletionHandler___block_invoke_3_cold_1()
{
}

- (void)startKeychainDataImportWithKeychainInfo:completionHandler:.cold.1()
{
}

- (void)startKeychainDataImportWithKeychainInfo:completionHandler:.cold.2()
{
}

void __88__MBTargetDeviceTransferTask_startKeychainDataImportWithKeychainInfo_completionHandler___block_invoke_cold_1()
{
}

void __88__MBTargetDeviceTransferTask_startKeychainDataImportWithKeychainInfo_completionHandler___block_invoke_cold_2()
{
}

- (void)startDataTransferWithPreflightInfo:completionHandler:.cold.1()
{
}

- (void)startDataTransferWithPreflightInfo:completionHandler:.cold.2()
{
}

void __83__MBTargetDeviceTransferTask_startDataTransferWithPreflightInfo_completionHandler___block_invoke_cold_1()
{
}

void __83__MBTargetDeviceTransferTask_startDataTransferWithPreflightInfo_completionHandler___block_invoke_cold_2()
{
}

@end