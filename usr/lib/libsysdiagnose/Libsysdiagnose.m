@interface Libsysdiagnose
+ (BOOL)cancelActiveSysdiagnoseWithError:(id *)a3;
+ (BOOL)isSysdiagnoseInProgressWithError:(id *)a3;
+ (BOOL)verifyReply:(id)a3 withExpectedType:(_xpc_type_s *)a4 forError:(id *)a5;
+ (id)createSysdiagnoseRequest:(id)a3;
+ (id)fetchDiagnosticIDFromDeviceSource:(unint64_t)a3 WithMaxCount:(unint64_t)a4 withError:(id *)a5;
+ (id)fetchRemoteDiagnosticIDsWithError:(id *)a3;
+ (id)getSysdiagnoseCrashLog;
+ (id)sendSysdiagnoseRequest:(id)a3 withMetrics:(id *)a4 withError:(id *)a5 withProgressHandler:(id)a6;
+ (id)setupConnection;
+ (id)sysdiagnoseWithMetadata:(id)a3 withError:(id *)a4;
+ (id)sysdiagnoseWithMetadata:(id)a3 withError:(id *)a4 andProgressHandler:(id)a5;
+ (id)sysdiagnoseWithMetadata:(id)a3 withError:(id *)a4 withProgressHandler:(id)a5;
+ (id)sysdiagnoseWithMetadata:(id)a3 withMetrics:(id *)a4 withError:(id *)a5;
+ (id)sysdiagnoseWithMetadata:(id)a3 withMetrics:(id *)a4 withError:(id *)a5 withProgressCallback:(id)a6;
+ (id)sysdiagnoseWithMetadata:(id)a3 withMetrics:(id *)a4 withError:(id *)a5 withProgressHandler:(id)a6;
+ (int)addErrorString:(id)a3 WithCode:(id)a4 forError:(id *)a5;
+ (void)createMetrics:(id *)a3 fromResponse:(id)a4;
+ (void)sysdiagnoseWithMetadata:(id)a3 onCompletion:(id)a4;
@end

@implementation Libsysdiagnose

+ (id)setupConnection
{
  v2 = dispatch_get_global_queue(33, 0);
  mach_service = xpc_connection_create_mach_service("com.apple.sysdiagnose.service.xpc", v2, 2uLL);
  xpc_connection_set_event_handler(mach_service, &__block_literal_global);
  xpc_connection_resume(mach_service);
  if (!mach_service)
  {
    v4 = _log_context;
    if (os_log_type_enabled((os_log_t)_log_context, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1D2C31000, v4, OS_LOG_TYPE_DEFAULT, "Connection failed", v6, 2u);
    }
  }

  return mach_service;
}

void __33__Libsysdiagnose_setupConnection__block_invoke(uint64_t a1, uint64_t a2)
{
  if (MEMORY[0x1D942B350](a2) == MEMORY[0x1E4F145A8])
  {
    v2 = _log_context;
    if (os_log_type_enabled((os_log_t)_log_context, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1D2C31000, v2, OS_LOG_TYPE_DEFAULT, "XPC connection to com.apple.sysdiagnose.service.xpc failed", v3, 2u);
    }
  }
}

+ (id)createSysdiagnoseRequest:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v4, "REQUEST_TYPE", 1uLL);
  uint64_t v5 = [v3 objectForKeyedSubscript:@"SDRequestSourceShell"];
  if (v5)
  {
    v6 = (void *)v5;
    v7 = [v3 objectForKeyedSubscript:@"verbose"];

    if (v7)
    {
      xpc_dictionary_set_fd(v4, "stdout", 1);
      xpc_dictionary_set_fd(v4, "stderr", 2);
    }
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v8 = [v3 allKeys];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v32;
    v29 = v8;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v32 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v31 + 1) + 8 * v12);
        v14 = [v3 objectForKey:v13];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          xpc_dictionary_set_BOOL(v4, (const char *)[v13 UTF8String], [v14 BOOLValue]);
          goto LABEL_21;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          xpc_dictionary_set_string(v4, (const char *)[v13 UTF8String], (const char *)[v14 UTF8String]);
          goto LABEL_21;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v15 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v14 requiringSecureCoding:1 error:0];
          if (v15)
          {
            uint64_t v16 = [v13 UTF8String];
            id v17 = v15;
            uint64_t v18 = [v17 bytes];
            size_t v19 = [v17 length];
            v20 = v4;
            v21 = (const char *)v16;
            v22 = (const void *)v18;
            v8 = v29;
            goto LABEL_19;
          }
          goto LABEL_20;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v15 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v14 requiringSecureCoding:1 error:0];
          if (v15)
          {
            uint64_t v23 = [v13 UTF8String];
            id v24 = v15;
            uint64_t v25 = [v24 bytes];
            size_t v19 = [v24 length];
            v20 = v4;
            v21 = (const char *)v23;
            v8 = v29;
            v22 = (const void *)v25;
LABEL_19:
            xpc_dictionary_set_data(v20, v21, v22, v19);
          }
LABEL_20:

          goto LABEL_21;
        }
        v26 = _log_context;
        if (os_log_type_enabled((os_log_t)_log_context, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D2C31000, v26, OS_LOG_TYPE_DEFAULT, "Undefined type in the metadata", buf, 2u);
        }
LABEL_21:

        ++v12;
      }
      while (v10 != v12);
      uint64_t v27 = [v8 countByEnumeratingWithState:&v31 objects:v35 count:16];
      uint64_t v10 = v27;
    }
    while (v27);
  }

  return v4;
}

+ (int)addErrorString:(id)a3 WithCode:(id)a4 forError:(id *)a5
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v11 = *MEMORY[0x1E4F28568];
  v12[0] = v7;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  if (a5)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"libsysdiagnoseError" code:[v8 intValue] userInfo:v9];
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    LODWORD(a5) = [v8 intValue];
  }

  return (int)a5;
}

+ (void)createMetrics:(id *)a3 fromResponse:(id)a4
{
  uint64_t v5 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v6 = a4;
  id v7 = objc_alloc_init(v5);
  applier[0] = MEMORY[0x1E4F143A8];
  applier[1] = 3221225472;
  applier[2] = __45__Libsysdiagnose_createMetrics_fromResponse___block_invoke;
  applier[3] = &unk_1E695B8E8;
  id v8 = v7;
  id v11 = v8;
  xpc_dictionary_apply(v6, applier);

  id v9 = (id)[v8 count];
  if (v9) {
    id v9 = (id)[v8 copy];
  }
  *a3 = v9;
}

uint64_t __45__Libsysdiagnose_createMetrics_fromResponse___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (MEMORY[0x1D942B350]() == MEMORY[0x1E4F14598])
  {
    id v6 = [NSString stringWithUTF8String:a2];
    id v7 = [NSNumber numberWithDouble:xpc_double_get_value(v5)];
    [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];
  }
  return 1;
}

+ (BOOL)verifyReply:(id)a3 withExpectedType:(_xpc_type_s *)a4 forError:(id *)a5
{
  id v7 = a3;
  id v8 = v7;
  if (!v7)
  {
    +[Libsysdiagnose addErrorString:@"xpc connection returned a null object" WithCode:&unk_1F29F1E30 forError:a5];
    goto LABEL_9;
  }
  id v9 = (_xpc_type_s *)MEMORY[0x1D942B350](v7);
  if (v9 == a4)
  {
    BOOL v11 = 1;
  }
  else
  {
    if (v9 == (_xpc_type_s *)MEMORY[0x1E4F145A8])
    {
      uint64_t v12 = [NSString stringWithFormat:@"%s", xpc_dictionary_get_string(v8, (const char *)*MEMORY[0x1E4F14530])];
      +[Libsysdiagnose addErrorString:v12 WithCode:&unk_1F29F1E48 forError:a5];

      goto LABEL_9;
    }
    uint64_t v10 = _log_context;
    BOOL v11 = 0;
    if (os_log_type_enabled((os_log_t)_log_context, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D2C31000, v10, OS_LOG_TYPE_DEFAULT, "unrecognized message event.", buf, 2u);
LABEL_9:
      BOOL v11 = 0;
    }
  }

  return v11;
}

+ (id)sendSysdiagnoseRequest:(id)a3 withMetrics:(id *)a4 withError:(id *)a5 withProgressHandler:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x3032000000;
  v59 = __Block_byref_object_copy_;
  v60 = __Block_byref_object_dispose_;
  id v61 = 0;
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x3032000000;
  v53 = __Block_byref_object_copy_;
  v54 = __Block_byref_object_dispose_;
  id v55 = 0;
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x3032000000;
  v48[3] = __Block_byref_object_copy__89;
  v48[4] = __Block_byref_object_dispose__90;
  id v49 = (id)[v11 copy];
  uint64_t v12 = [a1 setupConnection];
  if (v12)
  {
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
    dispatch_semaphore_t v41 = dispatch_semaphore_create(0);
    uint64_t v30 = 0;
    long long v31 = &v30;
    uint64_t v32 = 0x3032000000;
    long long v33 = __Block_byref_object_copy_;
    long long v34 = __Block_byref_object_dispose_;
    dispatch_semaphore_t v35 = dispatch_semaphore_create(0);
    uint64_t v26 = 0;
    uint64_t v27 = (double *)&v26;
    uint64_t v28 = 0x2020000000;
    uint64_t v29 = 0;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __83__Libsysdiagnose_sendSysdiagnoseRequest_withMetrics_withError_withProgressHandler___block_invoke;
    handler[3] = &unk_1E695B910;
    v22 = &v42;
    uint64_t v23 = &v26;
    id v21 = v11;
    id v24 = v48;
    uint64_t v25 = &v30;
    xpc_connection_set_event_handler(v12, handler);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __83__Libsysdiagnose_sendSysdiagnoseRequest_withMetrics_withError_withProgressHandler___block_invoke_97;
    v19[3] = &unk_1E695B938;
    v19[4] = &v42;
    v19[5] = &v50;
    v19[7] = &v36;
    v19[8] = a4;
    v19[6] = &v56;
    xpc_connection_send_message_with_reply(v12, v10, 0, v19);
    dispatch_semaphore_wait((dispatch_semaphore_t)v37[5], 0xFFFFFFFFFFFFFFFFLL);
    v13 = v31[5];
    dispatch_time_t v14 = dispatch_time(0xFFFFFFFFFFFFFFFELL, 1000000000);
    dispatch_semaphore_wait(v13, v14);
    if (v51[5])
    {
      if (v27[3] < 100.0)
      {
        v15 = _log_context;
        if (os_log_type_enabled((os_log_t)_log_context, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v18 = 0;
          _os_log_impl(&dword_1D2C31000, v15, OS_LOG_TYPE_DEFAULT, "Timed out waiting for progress updates.", v18, 2u);
        }
      }
    }
    if (a5) {
      *a5 = (id) v43[5];
    }
    if (a4) {
      *a4 = (id)[(id)v57[5] copy];
    }
    id v16 = (id)v51[5];

    _Block_object_dispose(&v26, 8);
    _Block_object_dispose(&v30, 8);

    _Block_object_dispose(&v36, 8);
    _Block_object_dispose(&v42, 8);
  }
  else
  {
    +[Libsysdiagnose addErrorString:@"Failed to create the xpc_connection" WithCode:&unk_1F29F1E30 forError:a5];
    id v16 = 0;
  }

  _Block_object_dispose(v48, 8);
  _Block_object_dispose(&v50, 8);

  _Block_object_dispose(&v56, 8);

  return v16;
}

void __83__Libsysdiagnose_sendSysdiagnoseRequest_withMetrics_withError_withProgressHandler___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1[5] + 8);
  id obj = *(id *)(v4 + 40);
  BOOL v5 = +[Libsysdiagnose verifyReply:v3 withExpectedType:MEMORY[0x1E4F14590] forError:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  if (v5)
  {
    *(double *)(*(void *)(a1[6] + 8) + 24) = xpc_dictionary_get_double(v3, (const char *)[@"percentage" UTF8String]);
    uint64_t uint64 = xpc_dictionary_get_uint64(v3, (const char *)[@"phase" UTF8String]);
    string = xpc_dictionary_get_string(v3, (const char *)[@"diagnosticID" UTF8String]);
    uint64_t v8 = *(void *)(a1[6] + 8);
    double v9 = *(double *)(v8 + 24);
    if (v9 >= 0.0)
    {
      if (a1[4])
      {
        uint64_t v12 = string;
        if (v9 > 100.0)
        {
          *(void *)(v8 + 24) = 0x4059000000000000;
          v13 = _log_context;
          if (os_log_type_enabled((os_log_t)_log_context, OS_LOG_TYPE_ERROR)) {
            __83__Libsysdiagnose_sendSysdiagnoseRequest_withMetrics_withError_withProgressHandler___block_invoke_cold_1(v13);
          }
        }
        id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        v15 = [NSNumber numberWithDouble:*(double *)(*(void *)(a1[6] + 8) + 24)];
        [v14 setObject:v15 forKey:@"percentage"];

        id v16 = [NSNumber numberWithUnsignedLongLong:uint64];
        [v14 setObject:v16 forKey:@"phase"];

        if (v12)
        {
          id v17 = [NSString stringWithUTF8String:v12];
          [v14 setObject:v17 forKey:@"diagnosticID"];
        }
        uint64_t v18 = *(void *)(*(void *)(a1[7] + 8) + 40);
        size_t v19 = (void *)[v14 copy];
        (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v19);

        double v9 = *(double *)(*(void *)(a1[6] + 8) + 24);
      }
      if (v9 >= 100.0) {
        dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1[8] + 8) + 40));
      }
    }
    else
    {
      id v10 = [NSString stringWithFormat:@"%s", xpc_dictionary_get_string(v3, "error")];
      uint64_t v11 = *(void *)(a1[5] + 8);
      id v20 = *(id *)(v11 + 40);
      +[Libsysdiagnose addErrorString:v10 WithCode:&unk_1F29F1E60 forError:&v20];
      objc_storeStrong((id *)(v11 + 40), v20);
    }
  }
}

void __83__Libsysdiagnose_sendSysdiagnoseRequest_withMetrics_withError_withProgressHandler___block_invoke_97(void *a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1[4] + 8);
  id obj = *(id *)(v4 + 40);
  BOOL v5 = +[Libsysdiagnose verifyReply:v3 withExpectedType:MEMORY[0x1E4F14590] forError:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  if (!v5)
  {
    sleep(2u);
    id v14 = +[Libsysdiagnose getSysdiagnoseCrashLog];
    if (v14)
    {
      objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), v14);
      v15 = NSString;
      id v14 = v14;
      id v16 = [v15 stringWithFormat:@"XPC reply failed, found a latest sysdiagnose crash log in last 10 minutes at %s", [v14 UTF8String]];
      uint64_t v17 = *(void *)(a1[4] + 8);
      id v19 = *(id *)(v17 + 40);
      +[Libsysdiagnose addErrorString:v16 WithCode:&unk_1F29F1E60 forError:&v19];
      objc_storeStrong((id *)(v17 + 40), v19);
    }
    goto LABEL_10;
  }
  string = xpc_dictionary_get_string(v3, "path");
  if (!string)
  {
    [NSString stringWithFormat:@"%s", xpc_dictionary_get_string(v3, "error")];
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = *(void *)(a1[4] + 8);
    id v20 = *(id *)(v18 + 40);
    +[Libsysdiagnose addErrorString:v14 WithCode:&unk_1F29F1E60 forError:&v20];
    objc_storeStrong((id *)(v18 + 40), v20);
    goto LABEL_10;
  }
  id v7 = string;
  uint64_t v8 = [NSString stringWithUTF8String:string];
  uint64_t v9 = *(void *)(a1[5] + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  uint64_t v11 = _log_context;
  if (os_log_type_enabled((os_log_t)_log_context, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    id v24 = v7;
    _os_log_impl(&dword_1D2C31000, v11, OS_LOG_TYPE_DEFAULT, "xpc response: %{public}s\n", buf, 0xCu);
  }
  if (a1[8])
  {
    uint64_t v12 = *(void *)(a1[6] + 8);
    id v21 = *(id *)(v12 + 40);
    +[Libsysdiagnose createMetrics:&v21 fromResponse:v3];
    id v13 = v21;
    id v14 = *(id *)(v12 + 40);
    *(void *)(v12 + 40) = v13;
LABEL_10:
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1[7] + 8) + 40));
}

+ (id)sysdiagnoseWithMetadata:(id)a3 withMetrics:(id *)a4 withError:(id *)a5 withProgressCallback:(id)a6
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  if (!_log_context)
  {
    os_log_t v12 = os_log_create("com.apple.sysdiagnose", "libsysdiagnose");
    id v13 = (void *)_log_context;
    _log_context = (uint64_t)v12;
  }
  uint64_t v33 = 0;
  long long v34 = &v33;
  uint64_t v35 = 0x3032000000;
  uint64_t v36 = __Block_byref_object_copy_;
  v37 = __Block_byref_object_dispose_;
  id v38 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy_;
  long long v31 = __Block_byref_object_dispose_;
  id v32 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __85__Libsysdiagnose_sysdiagnoseWithMetadata_withMetrics_withError_withProgressCallback___block_invoke;
  v20[3] = &unk_1E695B960;
  id v25 = a1;
  id v14 = v10;
  id v21 = v14;
  uint64_t v23 = &v33;
  id v24 = &v27;
  uint64_t v26 = a4;
  id v15 = v11;
  id v22 = v15;
  _os_activity_initiate(&dword_1D2C31000, "libsysdiagnose call", OS_ACTIVITY_FLAG_DEFAULT, v20);

  if (a5)
  {
    *a5 = (id) v28[5];
  }
  else
  {
    id v16 = _log_context;
    if (os_log_type_enabled((os_log_t)_log_context, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = v28[5];
      *(_DWORD *)buf = 138412290;
      uint64_t v40 = v17;
      _os_log_impl(&dword_1D2C31000, v16, OS_LOG_TYPE_DEFAULT, "Libsysdiagnose error: %@", buf, 0xCu);
    }
  }
  id v18 = (id)v34[5];
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);

  return v18;
}

void __85__Libsysdiagnose_sysdiagnoseWithMetadata_withMetrics_withError_withProgressCallback___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 64) createSysdiagnoseRequest:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(a1 + 72);
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = +[Libsysdiagnose sendSysdiagnoseRequest:v2 withMetrics:v3 withError:&obj withProgressHandler:*(void *)(a1 + 40)];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v10 = *(void *)(v8 + 40);
    uint64_t v9 = (id *)(v8 + 40);
    if (!v10)
    {
      id v11 = 0;
      +[Libsysdiagnose addErrorString:@"Unknown error" WithCode:&unk_1F29F1E78 forError:&v11];
      objc_storeStrong(v9, v11);
    }
  }
}

+ (id)sysdiagnoseWithMetadata:(id)a3 withMetrics:(id *)a4 withError:(id *)a5 withProgressHandler:(id)a6
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  if (!_log_context)
  {
    os_log_t v12 = os_log_create("com.apple.sysdiagnose", "libsysdiagnose");
    id v13 = (void *)_log_context;
    _log_context = (uint64_t)v12;
  }
  uint64_t v33 = 0;
  long long v34 = &v33;
  uint64_t v35 = 0x3032000000;
  uint64_t v36 = __Block_byref_object_copy_;
  v37 = __Block_byref_object_dispose_;
  id v38 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy_;
  long long v31 = __Block_byref_object_dispose_;
  id v32 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __84__Libsysdiagnose_sysdiagnoseWithMetadata_withMetrics_withError_withProgressHandler___block_invoke;
  v20[3] = &unk_1E695B9B0;
  id v25 = a1;
  id v14 = v10;
  id v21 = v14;
  id v15 = v11;
  id v22 = v15;
  uint64_t v23 = &v33;
  uint64_t v26 = a4;
  id v24 = &v27;
  _os_activity_initiate(&dword_1D2C31000, "libsysdiagnose call", OS_ACTIVITY_FLAG_DEFAULT, v20);

  if (a5)
  {
    *a5 = (id) v28[5];
  }
  else
  {
    id v16 = _log_context;
    if (os_log_type_enabled((os_log_t)_log_context, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = v28[5];
      *(_DWORD *)buf = 138412290;
      uint64_t v40 = v17;
      _os_log_impl(&dword_1D2C31000, v16, OS_LOG_TYPE_DEFAULT, "Libsysdiagnose error: %@", buf, 0xCu);
    }
  }
  id v18 = (id)v34[5];
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);

  return v18;
}

void __84__Libsysdiagnose_sysdiagnoseWithMetadata_withMetrics_withError_withProgressHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 64) createSysdiagnoseRequest:*(void *)(a1 + 32)];
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__89;
  id v19 = __Block_byref_object_dispose__90;
  id v20 = (id)[*(id *)(a1 + 40) copy];
  if (v16[5])
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __84__Libsysdiagnose_sysdiagnoseWithMetadata_withMetrics_withError_withProgressHandler___block_invoke_2;
    v14[3] = &unk_1E695B988;
    v14[4] = &v15;
    uint64_t v3 = (void *)MEMORY[0x1D942B0D0](v14);
  }
  else
  {
    uint64_t v3 = 0;
  }
  uint64_t v4 = *(void *)(a1 + 72);
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v5 + 40);
  uint64_t v6 = +[Libsysdiagnose sendSysdiagnoseRequest:v2 withMetrics:v4 withError:&obj withProgressHandler:v3];
  objc_storeStrong((id *)(v5 + 40), obj);
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v11 = *(void *)(v9 + 40);
    id v10 = (id *)(v9 + 40);
    if (!v11)
    {
      id v12 = 0;
      +[Libsysdiagnose addErrorString:@"Unknown error" WithCode:&unk_1F29F1E78 forError:&v12];
      objc_storeStrong(v10, v12);
    }
  }
  _Block_object_dispose(&v15, 8);
}

void __84__Libsysdiagnose_sysdiagnoseWithMetadata_withMetrics_withError_withProgressHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v3 = [a2 objectForKeyedSubscript:@"percentage"];
  [v3 doubleValue];
  (*(void (**)(uint64_t))(v2 + 16))(v2);
}

+ (id)sysdiagnoseWithMetadata:(id)a3 withMetrics:(id *)a4 withError:(id *)a5
{
  return +[Libsysdiagnose sysdiagnoseWithMetadata:a3 withMetrics:a4 withError:a5 withProgressHandler:0];
}

+ (id)sysdiagnoseWithMetadata:(id)a3 withError:(id *)a4
{
  return +[Libsysdiagnose sysdiagnoseWithMetadata:a3 withMetrics:0 withError:a4 withProgressHandler:0];
}

+ (void)sysdiagnoseWithMetadata:(id)a3 onCompletion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = dispatch_get_global_queue(21, 0);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__Libsysdiagnose_sysdiagnoseWithMetadata_onCompletion___block_invoke;
  v10[3] = &unk_1E695B9D8;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, v10);
}

void __55__Libsysdiagnose_sysdiagnoseWithMetadata_onCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v6 = 0;
  id v3 = +[Libsysdiagnose sysdiagnoseWithMetadata:v2 withMetrics:0 withError:&v6 withProgressHandler:0];
  id v4 = v6;
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, void *, id))(v5 + 16))(v5, v3, v4);
  }
}

+ (id)sysdiagnoseWithMetadata:(id)a3 withError:(id *)a4 andProgressHandler:(id)a5
{
  return +[Libsysdiagnose sysdiagnoseWithMetadata:a3 withMetrics:0 withError:a4 withProgressHandler:a5];
}

+ (id)sysdiagnoseWithMetadata:(id)a3 withError:(id *)a4 withProgressHandler:(id)a5
{
  return +[Libsysdiagnose sysdiagnoseWithMetadata:a3 withMetrics:0 withError:a4 withProgressCallback:a5];
}

+ (BOOL)isSysdiagnoseInProgressWithError:(id *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  int v22 = 0;
  size_t v21 = 4;
  *(void *)id v25 = 0x600000001;
  if (sysctl(v25, 2u, &v22, &v21, 0, 0) == -1)
  {
    id v20 = "sysctl(... kern.maxproc ...)";
LABEL_31:
    perror(v20);
    return 0;
  }
  uint64_t v5 = (char *)malloc_type_malloc(4 * v22, 0x100004052888210uLL);
  if (!v5)
  {
    id v20 = "malloc";
    goto LABEL_31;
  }
  id v6 = v5;
  int v7 = proc_listallpids(v5, 4 * v22);
  if (v7 == -1)
  {
    perror("proc_listallpids");
    goto LABEL_17;
  }
  if (v7 < 1)
  {
LABEL_17:
    free(v6);
    return 0;
  }
  uint64_t v8 = 0;
  uint64_t v9 = 4 * v7;
  while (1)
  {
    bzero(buffer, 0x400uLL);
    int v10 = *(_DWORD *)&v6[v8];
    proc_pidpath(v10, buffer, 0x400u);
    BOOL v11 = buffer[0] == 0x62696C2F7273752FLL && buffer[1] == 0x7379732F63657865;
    BOOL v12 = v11 && buffer[2] == 0x65736F6E67616964;
    if (v12 && v24 == 100) {
      break;
    }
    v8 += 4;
    if (v9 == v8) {
      goto LABEL_17;
    }
  }
  free(v6);
  if (v10 < 1) {
    return 0;
  }
  id v16 = [a1 setupConnection];
  if (v16)
  {
    xpc_object_t v17 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v17, "REQUEST_TYPE", 7uLL);
    xpc_object_t v18 = xpc_connection_send_message_with_reply_sync(v16, v17);
    if ([a1 verifyReply:v18 withExpectedType:MEMORY[0x1E4F14590] forError:a3]
      && xpc_dictionary_get_uint64(v18, "RESPONSE_TYPE") == 1)
    {
      string = xpc_dictionary_get_string(v18, "status");
      BOOL v14 = strcmp(string, "Running") == 0;
    }
    else
    {
      BOOL v14 = 0;
    }
  }
  else
  {
    +[Libsysdiagnose addErrorString:@"Failed to create the xpc_connection to sysdiagnose" WithCode:&unk_1F29F1E30 forError:a3];
    BOOL v14 = 0;
  }

  return v14;
}

+ (BOOL)cancelActiveSysdiagnoseWithError:(id *)a3
{
  uint64_t v5 = [a1 setupConnection];
  if (v5)
  {
    xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v6, "REQUEST_TYPE", 4uLL);
    xpc_object_t v7 = xpc_connection_send_message_with_reply_sync(v5, v6);
    if ([a1 verifyReply:v7 withExpectedType:MEMORY[0x1E4F14590] forError:a3]) {
      BOOL v8 = xpc_dictionary_get_uint64(v7, "RESPONSE_TYPE") == 1;
    }
    else {
      BOOL v8 = 0;
    }
  }
  else
  {
    +[Libsysdiagnose addErrorString:@"Failed to create the xpc_connection for cancellation" WithCode:&unk_1F29F1E30 forError:a3];
    BOOL v8 = 0;
  }

  return v8;
}

+ (id)fetchDiagnosticIDFromDeviceSource:(unint64_t)a3 WithMaxCount:(unint64_t)a4 withError:(id *)a5
{
  char v7 = a3;
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  BOOL v8 = [MEMORY[0x1E4F1CA48] array];
  if ((v7 & 1) == 0) {
    goto LABEL_22;
  }
  uint64_t v9 = (void *)MEMORY[0x1E4F1CB10];
  int v10 = [MEMORY[0x1E4F83948] sharedInstance];
  BOOL v11 = [v10 pathSubmission];
  BOOL v12 = [v11 stringByAppendingPathComponent:@"DiagnosticLogs/sysdiagnose"];
  id v13 = [v9 fileURLWithPath:v12 isDirectory:1];

  if (!v13) {
    goto LABEL_21;
  }
  BOOL v14 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:*MEMORY[0x1E4F1C628], *MEMORY[0x1E4F1C6E8], *MEMORY[0x1E4F1C700], 0];
  id v16 = [v14 enumeratorAtURL:v13 includingPropertiesForKeys:v15 options:7 errorHandler:&__block_literal_global_131];

  if (!v16) {
    goto LABEL_20;
  }
  v48 = v13;
  char v49 = v7;
  uint64_t v50 = a5;
  unint64_t v51 = a4;
  uint64_t v52 = v8;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v47 = v16;
  id v17 = v16;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v57 objects:v64 count:16];
  if (!v18)
  {
    id v20 = 0;
    goto LABEL_19;
  }
  uint64_t v19 = v18;
  id v20 = 0;
  uint64_t v21 = *(void *)v58;
  do
  {
    for (uint64_t i = 0; i != v19; ++i)
    {
      if (*(void *)v58 != v21) {
        objc_enumerationMutation(v17);
      }
      uint64_t v23 = *(void **)(*((void *)&v57 + 1) + 8 * i);
      __int16 v24 = [v23 lastPathComponent];
      if ([v24 containsString:@".tar"])
      {
      }
      else
      {
        id v25 = [v23 lastPathComponent];
        int v26 = [v25 containsString:@".tar.gz"];

        if (!v26) {
          continue;
        }
      }
      uint64_t v27 = [v23 lastPathComponent];
      uint64_t v28 = extractDiagnosticID(v27);

      if (v28)
      {
        [v52 addObject:v28];
        id v20 = (void *)v28;
      }
      else
      {
        id v20 = 0;
      }
    }
    uint64_t v19 = [v17 countByEnumeratingWithState:&v57 objects:v64 count:16];
  }
  while (v19);
LABEL_19:

  a4 = v51;
  BOOL v8 = v52;
  char v7 = v49;
  a5 = v50;
  id v16 = v47;
  id v13 = v48;
LABEL_20:

LABEL_21:
LABEL_22:
  if ((v7 & 2) != 0)
  {
    uint64_t v29 = +[Libsysdiagnose fetchRemoteDiagnosticIDsWithError:a5];
    uint64_t v30 = v29;
    if (v29 && [v29 count])
    {
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id v31 = v30;
      uint64_t v32 = [v31 countByEnumeratingWithState:&v53 objects:v63 count:16];
      if (v32)
      {
        uint64_t v33 = v32;
        long long v34 = 0;
        uint64_t v35 = *(void *)v54;
        do
        {
          uint64_t v36 = 0;
          v37 = v34;
          do
          {
            if (*(void *)v54 != v35) {
              objc_enumerationMutation(v31);
            }
            long long v34 = extractDiagnosticID(*(void **)(*((void *)&v53 + 1) + 8 * v36));

            if (v34) {
              [v8 addObject:v34];
            }
            ++v36;
            v37 = v34;
          }
          while (v33 != v36);
          uint64_t v33 = [v31 countByEnumeratingWithState:&v53 objects:v63 count:16];
        }
        while (v33);
      }
    }
  }
  if ([v8 count])
  {
    id v38 = [v8 sortedArrayUsingSelector:sel_localizedCaseInsensitiveCompare_];
    v39 = [v38 reverseObjectEnumerator];
    uint64_t v40 = [v39 allObjects];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v62 = v40;
      _os_log_impl(&dword_1D2C31000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Considering the following diagnosticIDs %@", buf, 0xCu);
    }
    unint64_t v41 = [v40 count];
    if (v41 >= a4) {
      unint64_t v42 = a4;
    }
    else {
      unint64_t v42 = v41;
    }
    if (a4) {
      unint64_t v43 = v42;
    }
    else {
      unint64_t v43 = v41;
    }
    uint64_t v44 = [MEMORY[0x1E4F28D60] indexSetWithIndexesInRange:0, v43];
    id v45 = [v40 objectsAtIndexes:v44];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D2C31000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Did not match any diagnosticIDs.", buf, 2u);
    }
    id v45 = v8;
  }

  return v45;
}

uint64_t __75__Libsysdiagnose_fetchDiagnosticIDFromDeviceSource_WithMaxCount_withError___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [a3 localizedDescription];
    int v6 = 138412290;
    char v7 = v4;
    _os_log_impl(&dword_1D2C31000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%@\n", (uint8_t *)&v6, 0xCu);
  }
  return 1;
}

+ (id)fetchRemoteDiagnosticIDsWithError:(id *)a3
{
  id v4 = [a1 setupConnection];
  if (v4)
  {
    xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v5, "REQUEST_TYPE", 9uLL);
    xpc_object_t v6 = xpc_connection_send_message_with_reply_sync(v4, v5);
    char v7 = v6;
    if (v6 && MEMORY[0x1D942B350](v6) == MEMORY[0x1E4F14590] && xpc_dictionary_get_uint64(v7, "RESPONSE_TYPE") == 1)
    {
      uint64_t v8 = xpc_dictionary_get_value(v7, "archive_list");
      uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
      if (v8)
      {
        size_t count = xpc_array_get_count(v8);
        if (count)
        {
          size_t v11 = count;
          for (size_t i = 0; i != v11; ++i)
          {
            string = xpc_array_get_string(v8, i);
            if (string)
            {
              BOOL v14 = [NSString stringWithUTF8String:string];
              [v9 addObject:v14];
            }
          }
        }
        id v15 = v9;
      }
      else
      {
        +[Libsysdiagnose addErrorString:@"sysdiagnose server returned malformed response" WithCode:&unk_1F29F1E30 forError:a3];
        id v15 = 0;
      }
    }
    else
    {
      +[Libsysdiagnose addErrorString:@"Couldn't get valid reply from sysdiagnose server" WithCode:&unk_1F29F1E30 forError:a3];
      id v15 = 0;
    }
  }
  else
  {
    +[Libsysdiagnose addErrorString:@"Failed to create the xpc_connection for fetching diagnosticIDs from remote device" WithCode:&unk_1F29F1E30 forError:a3];
    id v15 = 0;
  }

  return v15;
}

+ (id)getSysdiagnoseCrashLog
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/private/var/mobile/Library/Logs/CrashReporter/"];
  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:*MEMORY[0x1E4F1C6E8], *MEMORY[0x1E4F1C700], 0];
  uint64_t v27 = (void *)v2;
  xpc_object_t v5 = [v3 enumeratorAtURL:v2 includingPropertiesForKeys:v4 options:5 errorHandler:&__block_literal_global_153];

  uint64_t v30 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-600.0];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (!v7)
  {
    id v29 = 0;
    id v33 = 0;
    id v31 = 0;
    goto LABEL_25;
  }
  uint64_t v8 = v7;
  id v29 = 0;
  id v33 = 0;
  id v31 = 0;
  uint64_t v9 = *(void *)v37;
  uint64_t v28 = *MEMORY[0x1E4F1C540];
  int v10 = @"sysdiagnose";
  uint64_t v32 = *(void *)v37;
  do
  {
    uint64_t v11 = 0;
    uint64_t v34 = v8;
    do
    {
      if (*(void *)v37 != v9) {
        objc_enumerationMutation(v6);
      }
      BOOL v12 = *(void **)(*((void *)&v36 + 1) + 8 * v11);
      id v13 = [v12 absoluteString];
      BOOL v14 = [v13 lastPathComponent];
      if (([v14 containsString:v10] & 1) == 0) {
        goto LABEL_9;
      }
      id v15 = [v12 absoluteString];
      id v16 = [v15 lastPathComponent];
      if ([v16 containsString:@"sysdiagnose_helper"])
      {

LABEL_9:
LABEL_10:

        goto LABEL_19;
      }
      id v17 = v10;
      id v18 = v6;
      uint64_t v19 = [v12 absoluteString];
      int v20 = [v19 hasSuffix:@".ips"];

      if (!v20) {
        goto LABEL_17;
      }
      id v35 = 0;
      [v12 getResourceValue:&v35 forKey:v28 error:0];
      id v21 = v35;

      if ([v21 compare:v30] != 1)
      {
        id v33 = v21;
LABEL_17:
        id v6 = v18;
        uint64_t v9 = v32;
        int v10 = v17;
        goto LABEL_18;
      }
      id v6 = v18;
      int v10 = v17;
      if (!v31 || [v29 compare:v21] != 1)
      {
        id v22 = v12;

        id v23 = v21;
        id v13 = v29;
        id v33 = v23;
        id v29 = v23;
        id v31 = v22;
        uint64_t v9 = v32;
        uint64_t v8 = v34;
        goto LABEL_10;
      }
      id v33 = v21;
      uint64_t v9 = v32;
LABEL_18:
      uint64_t v8 = v34;
LABEL_19:
      ++v11;
    }
    while (v8 != v11);
    uint64_t v24 = [v6 countByEnumeratingWithState:&v36 objects:v40 count:16];
    uint64_t v8 = v24;
  }
  while (v24);
LABEL_25:

  id v25 = [v31 path];

  return v25;
}

uint64_t __40__Libsysdiagnose_getSysdiagnoseCrashLog__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [a3 localizedDescription];
    int v6 = 138412290;
    uint64_t v7 = v4;
    _os_log_impl(&dword_1D2C31000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%@\n", (uint8_t *)&v6, 0xCu);
  }
  return 1;
}

void __83__Libsysdiagnose_sendSysdiagnoseRequest_withMetrics_withError_withProgressHandler___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D2C31000, log, OS_LOG_TYPE_ERROR, "More than 100 progress reported", v1, 2u);
}

@end