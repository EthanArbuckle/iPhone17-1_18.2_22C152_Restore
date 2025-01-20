@interface PREXPCServerHelper
+ (BOOL)checkForAndLogTrueBooleanEntitlement:(id)a3 connection:(id)a4 serviceName:(id)a5;
+ (BOOL)hasTrueBooleanEntitlement:(id)a3 connection:(id)a4;
+ (BOOL)shouldAcceptConnection:(id)a3 serviceName:(id)a4 whitelistedServerInterface:(id)a5 requestHandler:(id)a6 validateConnection:(id)a7 setupClientProxy:(id)a8 interruptionHandler:(id)a9 invalidationHandler:(id)a10;
@end

@implementation PREXPCServerHelper

+ (BOOL)checkForAndLogTrueBooleanEntitlement:(id)a3 connection:(id)a4 serviceName:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  BOOL v10 = +[PREXPCServerHelper hasTrueBooleanEntitlement:v7 connection:v8];
  if (!v10)
  {
    int __errnum = 0;
    v11 = procNameForPid([v8 processIdentifier], &__errnum);
    if ([v11 length])
    {
      v12 = pre_sv_xpc_handle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        *(void *)v24 = v11;
        *(_WORD *)&v24[8] = 2112;
        *(void *)&v24[10] = v9;
        *(_WORD *)&v24[18] = 2112;
        *(void *)&v24[20] = v7;
        v13 = "Connection from %@ to %@ is missing entitlement: %@";
        v14 = v12;
        uint32_t v15 = 32;
LABEL_10:
        _os_log_error_impl(&dword_235566000, v14, OS_LOG_TYPE_ERROR, v13, buf, v15);
      }
    }
    else
    {
      int v16 = __errnum;
      v12 = pre_sv_xpc_handle();
      BOOL v17 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
      if (v16)
      {
        if (v17)
        {
          int v18 = [v8 processIdentifier];
          v19 = strerror(__errnum);
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)v24 = v18;
          *(_WORD *)&v24[4] = 2112;
          *(void *)&v24[6] = v9;
          *(_WORD *)&v24[14] = 2080;
          *(void *)&v24[16] = v19;
          v13 = "Connection from %d to %@ failed entitlement check (proc_name error: %s).";
          v14 = v12;
          uint32_t v15 = 28;
          goto LABEL_10;
        }
      }
      else if (v17)
      {
        int v20 = [v8 processIdentifier];
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v24 = v20;
        *(_WORD *)&v24[4] = 2112;
        *(void *)&v24[6] = v9;
        v13 = "Connection from %d to %@ failed entitlement check.";
        v14 = v12;
        uint32_t v15 = 18;
        goto LABEL_10;
      }
    }
  }
  return v10;
}

+ (BOOL)hasTrueBooleanEntitlement:(id)a3 connection:(id)a4
{
  v4 = [a4 valueForEntitlement:a3];
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0) {
    char v5 = [v4 BOOLValue];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

+ (BOOL)shouldAcceptConnection:(id)a3 serviceName:(id)a4 whitelistedServerInterface:(id)a5 requestHandler:(id)a6 validateConnection:(id)a7 setupClientProxy:(id)a8 interruptionHandler:(id)a9 invalidationHandler:(id)a10
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a4;
  id v35 = a5;
  id v36 = a6;
  BOOL v17 = (uint64_t (**)(id, id, void *))a7;
  id v34 = a8;
  id v37 = a9;
  id v18 = a10;
  int v48 = 0;
  v19 = procNameForPid([v15 processIdentifier], &v48);
  if ([v19 length])
  {
    int v20 = pre_sv_xpc_handle();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    int v21 = [v15 processIdentifier];
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v16;
    __int16 v50 = 2112;
    v51 = v19;
    __int16 v52 = 2048;
    v53 = (char *)v21;
    v22 = "New connection to %@ from %@ (%lu).";
LABEL_7:
    v27 = v20;
    uint32_t v28 = 32;
LABEL_8:
    _os_log_impl(&dword_235566000, v27, OS_LOG_TYPE_DEFAULT, v22, buf, v28);
    goto LABEL_9;
  }
  int v23 = v48;
  int v20 = pre_sv_xpc_handle();
  BOOL v24 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
  if (v23)
  {
    if (!v24) {
      goto LABEL_9;
    }
    int v25 = [v15 processIdentifier];
    v26 = strerror(v48);
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v16;
    __int16 v50 = 2048;
    v51 = (void *)v25;
    __int16 v52 = 2080;
    v53 = v26;
    v22 = "New connection to %@ from unknown process (%lu) (proc_name error: %s).";
    goto LABEL_7;
  }
  if (v24)
  {
    int v33 = [v15 processIdentifier];
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v16;
    __int16 v50 = 2048;
    v51 = (void *)v33;
    v22 = "New connection to %@ from unknown process (%lu).";
    v27 = v20;
    uint32_t v28 = 22;
    goto LABEL_8;
  }
LABEL_9:

  int v29 = v17[2](v17, v15, v19);
  if (v29)
  {
    [v15 setExportedInterface:v35];
    [v15 setExportedObject:v36];
    *(void *)buf = 0;
    objc_initWeak((id *)buf, v15);
    v43[0] = MEMORY[0x263EF8330];
    v43[1] = 3221225472;
    v43[2] = __175__PREXPCServerHelper_shouldAcceptConnection_serviceName_whitelistedServerInterface_requestHandler_validateConnection_setupClientProxy_interruptionHandler_invalidationHandler___block_invoke;
    v43[3] = &unk_264C5C790;
    objc_copyWeak(&v47, (id *)buf);
    id v30 = v16;
    id v44 = v30;
    id v31 = v19;
    id v45 = v31;
    id v46 = v37;
    [v15 setInterruptionHandler:v43];
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __175__PREXPCServerHelper_shouldAcceptConnection_serviceName_whitelistedServerInterface_requestHandler_validateConnection_setupClientProxy_interruptionHandler_invalidationHandler___block_invoke_5;
    v38[3] = &unk_264C5C790;
    objc_copyWeak(&v42, (id *)buf);
    id v39 = v30;
    id v40 = v31;
    id v41 = v18;
    [v15 setInvalidationHandler:v38];
    [v15 resume];

    objc_destroyWeak(&v42);
    objc_destroyWeak(&v47);
    objc_destroyWeak((id *)buf);
  }

  return v29;
}

void __175__PREXPCServerHelper_shouldAcceptConnection_serviceName_whitelistedServerInterface_requestHandler_validateConnection_setupClientProxy_interruptionHandler_invalidationHandler___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v3 = pre_sv_xpc_handle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      uint64_t v5 = *(void *)(a1 + 40);
      int v7 = 138412802;
      uint64_t v8 = v4;
      __int16 v9 = 2112;
      uint64_t v10 = v5;
      __int16 v11 = 2048;
      uint64_t v12 = (int)[WeakRetained processIdentifier];
      _os_log_impl(&dword_235566000, v3, OS_LOG_TYPE_DEFAULT, "Connection to %@ from %@ (%lu) was interrupted.", (uint8_t *)&v7, 0x20u);
    }
  }
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6) {
    (*(void (**)(void))(v6 + 16))();
  }
}

void __175__PREXPCServerHelper_shouldAcceptConnection_serviceName_whitelistedServerInterface_requestHandler_validateConnection_setupClientProxy_interruptionHandler_invalidationHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v3 = pre_sv_xpc_handle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      uint64_t v5 = *(void *)(a1 + 40);
      int v7 = 138412802;
      uint64_t v8 = v4;
      __int16 v9 = 2112;
      uint64_t v10 = v5;
      __int16 v11 = 2048;
      uint64_t v12 = (int)[WeakRetained processIdentifier];
      _os_log_impl(&dword_235566000, v3, OS_LOG_TYPE_DEFAULT, "Connection to %@ from %@ (%lu) was invalidated.", (uint8_t *)&v7, 0x20u);
    }
  }
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6) {
    (*(void (**)(void))(v6 + 16))();
  }
}

@end