@interface PPXPCServerHelper
+ (BOOL)checkForAndLogTrueBooleanEntitlement:(id)a3 connection:(id)a4 serviceName:(id)a5;
+ (BOOL)hasTrueBooleanEntitlement:(id)a3 connection:(id)a4;
+ (BOOL)shouldAcceptConnection:(id)a3 serviceName:(id)a4 allowedServerInterface:(id)a5 allowedClientInterface:(id)a6 requestHandler:(id)a7 validateConnection:(id)a8 setupClientProxy:(id)a9 interruptionHandler:(id)a10 invalidationHandler:(id)a11;
@end

@implementation PPXPCServerHelper

+ (BOOL)checkForAndLogTrueBooleanEntitlement:(id)a3 connection:(id)a4 serviceName:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  BOOL v10 = +[PPXPCServerHelper hasTrueBooleanEntitlement:v7 connection:v8];
  if (!v10)
  {
    int __errnum = 0;
    v11 = procNameForPid([v8 processIdentifier], &__errnum);
    if ([v11 length] && (objc_msgSend(v11, "isEqualToString:", @"xctest") & 1) == 0)
    {
      v13 = pp_default_log_handle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412802;
        *(void *)v24 = v11;
        *(_WORD *)&v24[8] = 2112;
        *(void *)&v24[10] = v9;
        *(_WORD *)&v24[18] = 2112;
        *(void *)&v24[20] = v7;
        _os_log_fault_impl(&dword_1CA9A8000, v13, OS_LOG_TYPE_FAULT, "Connection from %@ to %@ is missing entitlement: %@", buf, 0x20u);
      }
      goto LABEL_10;
    }
    int v12 = __errnum;
    v13 = pp_xpc_server_log_handle();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (v12)
    {
      if (v14)
      {
        int v15 = [v8 processIdentifier];
        v16 = strerror(__errnum);
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v24 = v15;
        *(_WORD *)&v24[4] = 2112;
        *(void *)&v24[6] = v9;
        *(_WORD *)&v24[14] = 2080;
        *(void *)&v24[16] = v16;
        v17 = "Connection from %d to %@ failed entitlement check (proc_name error: %s).";
        v18 = v13;
        uint32_t v19 = 28;
LABEL_13:
        _os_log_error_impl(&dword_1CA9A8000, v18, OS_LOG_TYPE_ERROR, v17, buf, v19);
      }
    }
    else if (v14)
    {
      int v21 = [v8 processIdentifier];
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v24 = v21;
      *(_WORD *)&v24[4] = 2112;
      *(void *)&v24[6] = v9;
      v17 = "Connection from %d to %@ failed entitlement check.";
      v18 = v13;
      uint32_t v19 = 18;
      goto LABEL_13;
    }
LABEL_10:
  }
  return v10;
}

+ (BOOL)hasTrueBooleanEntitlement:(id)a3 connection:(id)a4
{
  id v5 = a3;
  v6 = (void *)MEMORY[0x1E4F93B28];
  if (a4) {
    [a4 auditToken];
  }
  else {
    memset(v10, 0, sizeof(v10));
  }
  id v7 = pp_xpc_server_log_handle();
  char v8 = [v6 taskWithAuditToken:v10 hasTrueBooleanEntitlement:v5 logHandle:v7];

  return v8;
}

+ (BOOL)shouldAcceptConnection:(id)a3 serviceName:(id)a4 allowedServerInterface:(id)a5 allowedClientInterface:(id)a6 requestHandler:(id)a7 validateConnection:(id)a8 setupClientProxy:(id)a9 interruptionHandler:(id)a10 invalidationHandler:(id)a11
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v39 = a5;
  id v38 = a6;
  id v40 = a7;
  v18 = (uint64_t (**)(id, id, void *))a8;
  uint32_t v19 = (void (**)(id, void *))a9;
  id v42 = a10;
  id v41 = a11;
  int v53 = 0;
  v20 = procNameForPid([v16 processIdentifier], &v53);
  if ([v20 length])
  {
    int v21 = pp_xpc_server_log_handle();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    int v22 = [v16 processIdentifier];
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v17;
    __int16 v55 = 2112;
    v56 = v20;
    __int16 v57 = 2048;
    v58 = (char *)v22;
    v23 = "New connection to %@ from %@ (%lu).";
LABEL_7:
    v28 = v21;
    uint32_t v29 = 32;
LABEL_8:
    _os_log_impl(&dword_1CA9A8000, v28, OS_LOG_TYPE_DEFAULT, v23, buf, v29);
    goto LABEL_9;
  }
  BOOL v24 = v53 == 0;
  int v21 = pp_xpc_server_log_handle();
  BOOL v25 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
  if (!v24)
  {
    if (!v25) {
      goto LABEL_9;
    }
    int v26 = [v16 processIdentifier];
    v27 = strerror(v53);
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v17;
    __int16 v55 = 2048;
    v56 = (void *)v26;
    __int16 v57 = 2080;
    v58 = v27;
    v23 = "New connection to %@ from unknown process (%lu) (proc_name error: %s).";
    goto LABEL_7;
  }
  if (v25)
  {
    int v35 = [v16 processIdentifier];
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v17;
    __int16 v55 = 2048;
    v56 = (void *)v35;
    v23 = "New connection to %@ from unknown process (%lu).";
    v28 = v21;
    uint32_t v29 = 22;
    goto LABEL_8;
  }
LABEL_9:

  int v30 = v18[2](v18, v16, v20);
  if (v30)
  {
    [v16 setExportedInterface:v39];
    [v16 setExportedObject:v40];
    if (v38)
    {
      objc_msgSend(v16, "setRemoteObjectInterface:");
      if (!v19)
      {
LABEL_15:
        *(void *)buf = 0;
        objc_initWeak((id *)buf, v16);
        v48[0] = MEMORY[0x1E4F143A8];
        v48[1] = 3221225472;
        v48[2] = __193__PPXPCServerHelper_shouldAcceptConnection_serviceName_allowedServerInterface_allowedClientInterface_requestHandler_validateConnection_setupClientProxy_interruptionHandler_invalidationHandler___block_invoke;
        v48[3] = &unk_1E65D8328;
        objc_copyWeak(&v52, (id *)buf);
        id v32 = v17;
        id v49 = v32;
        id v33 = v20;
        id v50 = v33;
        id v51 = v42;
        [v16 setInterruptionHandler:v48];
        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = __193__PPXPCServerHelper_shouldAcceptConnection_serviceName_allowedServerInterface_allowedClientInterface_requestHandler_validateConnection_setupClientProxy_interruptionHandler_invalidationHandler___block_invoke_11;
        v43[3] = &unk_1E65D8328;
        objc_copyWeak(&v47, (id *)buf);
        id v44 = v32;
        id v45 = v33;
        id v46 = v41;
        [v16 setInvalidationHandler:v43];
        [v16 resume];

        objc_destroyWeak(&v47);
        objc_destroyWeak(&v52);
        objc_destroyWeak((id *)buf);
        goto LABEL_16;
      }
      v31 = [v16 remoteObjectProxy];
      v19[2](v19, v31);
    }
    else
    {
      if (!v19) {
        goto LABEL_15;
      }
      v31 = [MEMORY[0x1E4F28B00] currentHandler];
      [v31 handleFailureInMethod:a2 object:a1 file:@"PPXPCServerSupport.m" lineNumber:74 description:@"setupClientProxy shall be nil if allowedClientInterface is nil"];
    }

    goto LABEL_15;
  }
LABEL_16:

  return v30;
}

void __193__PPXPCServerHelper_shouldAcceptConnection_serviceName_allowedServerInterface_allowedClientInterface_requestHandler_validateConnection_setupClientProxy_interruptionHandler_invalidationHandler___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v3 = pp_xpc_server_log_handle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      uint64_t v5 = *(void *)(a1 + 40);
      int v6 = 138412802;
      uint64_t v7 = v4;
      __int16 v8 = 2112;
      uint64_t v9 = v5;
      __int16 v10 = 2048;
      uint64_t v11 = (int)[WeakRetained processIdentifier];
      _os_log_impl(&dword_1CA9A8000, v3, OS_LOG_TYPE_DEFAULT, "Connection to %@ from %@ (%lu) was interrupted.", (uint8_t *)&v6, 0x20u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __193__PPXPCServerHelper_shouldAcceptConnection_serviceName_allowedServerInterface_allowedClientInterface_requestHandler_validateConnection_setupClientProxy_interruptionHandler_invalidationHandler___block_invoke_11(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v3 = pp_xpc_server_log_handle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      uint64_t v5 = *(void *)(a1 + 40);
      int v6 = 138412802;
      uint64_t v7 = v4;
      __int16 v8 = 2112;
      uint64_t v9 = v5;
      __int16 v10 = 2048;
      uint64_t v11 = (int)[WeakRetained processIdentifier];
      _os_log_impl(&dword_1CA9A8000, v3, OS_LOG_TYPE_DEFAULT, "Connection to %@ from %@ (%lu) was invalidated.", (uint8_t *)&v6, 0x20u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

@end