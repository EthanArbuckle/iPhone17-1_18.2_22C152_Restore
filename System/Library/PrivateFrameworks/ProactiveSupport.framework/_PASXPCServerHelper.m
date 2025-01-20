@interface _PASXPCServerHelper
+ (BOOL)checkForAndLogTrueBooleanEntitlement:(id)a3 connection:(id)a4 serviceName:(id)a5 logHandle:(id)a6;
+ (BOOL)checkForAndLogTrueBooleanEntitlement:(id)a3 connection:(id)a4 serviceName:(id)a5 logHandle:(id)a6 shouldGenerateCrashReport:(BOOL)a7;
+ (BOOL)hasTrueBooleanEntitlement:(id)a3 connection:(id)a4 logHandle:(id)a5;
+ (BOOL)shouldAcceptConnection:(id)a3 serviceName:(id)a4 whitelistedServerInterface:(id)a5 whitelistedClientInterface:(id)a6 requestHandler:(id)a7 validateConnection:(id)a8 setupClientProxy:(id)a9 interruptionHandler:(id)a10 invalidationHandler:(id)a11 logHandle:(id)a12;
@end

@implementation _PASXPCServerHelper

+ (BOOL)checkForAndLogTrueBooleanEntitlement:(id)a3 connection:(id)a4 serviceName:(id)a5 logHandle:(id)a6 shouldGenerateCrashReport:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v14 = a6;
  BOOL v15 = +[_PASXPCServerHelper hasTrueBooleanEntitlement:v11 connection:v12 logHandle:v14];
  if (!v15)
  {
    int __errnum = 0;
    v16 = procNameForPid([v12 processIdentifier], &__errnum);
    if ([v16 length] && (objc_msgSend(v16, "isEqualToString:", @"xctest") & 1) == 0)
    {
      if (v7)
      {
        if (v14)
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412802;
            *(void *)v28 = v16;
            *(_WORD *)&v28[8] = 2112;
            *(void *)&v28[10] = v13;
            *(_WORD *)&v28[18] = 2112;
            *(void *)&v28[20] = v11;
            _os_log_fault_impl(&dword_1A32C4000, v14, OS_LOG_TYPE_FAULT, "Connection from %@ to %@ is missing entitlement: %@", buf, 0x20u);
          }
          if (_PASEvaluateLogFaultAndProbCrashCriteria()) {
            abort();
          }
        }
      }
      else if (v14 && os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        *(void *)v28 = v16;
        *(_WORD *)&v28[8] = 2112;
        *(void *)&v28[10] = v13;
        *(_WORD *)&v28[18] = 2112;
        *(void *)&v28[20] = v11;
        _os_log_error_impl(&dword_1A32C4000, v14, OS_LOG_TYPE_ERROR, "Connection from %@ to %@ is missing entitlement: %@", buf, 0x20u);
      }
      goto LABEL_17;
    }
    if (__errnum)
    {
      if (v14)
      {
        v17 = v14;
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          int v18 = [v12 processIdentifier];
          int v19 = __errnum;
          v20 = strerror(__errnum);
          *(_DWORD *)buf = 67110146;
          *(_DWORD *)v28 = v18;
          *(_WORD *)&v28[4] = 2112;
          *(void *)&v28[6] = v13;
          *(_WORD *)&v28[14] = 2112;
          *(void *)&v28[16] = v11;
          *(_WORD *)&v28[24] = 1024;
          *(_DWORD *)&v28[26] = v19;
          __int16 v29 = 2080;
          v30 = v20;
          v21 = "Connection from %d to %@ is missing entitlement: %@ (proc_name error: [%i] %s).";
          v22 = v17;
          uint32_t v23 = 44;
LABEL_23:
          _os_log_error_impl(&dword_1A32C4000, v22, OS_LOG_TYPE_ERROR, v21, buf, v23);
          goto LABEL_16;
        }
        goto LABEL_16;
      }
    }
    else if (v14)
    {
      v17 = v14;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        int v25 = [v12 processIdentifier];
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v28 = v25;
        *(_WORD *)&v28[4] = 2112;
        *(void *)&v28[6] = v13;
        *(_WORD *)&v28[14] = 2112;
        *(void *)&v28[16] = v11;
        v21 = "Connection from %d to %@ is missing entitlement: %@";
        v22 = v17;
        uint32_t v23 = 28;
        goto LABEL_23;
      }
LABEL_16:
    }
LABEL_17:
  }
  return v15;
}

+ (BOOL)checkForAndLogTrueBooleanEntitlement:(id)a3 connection:(id)a4 serviceName:(id)a5 logHandle:(id)a6
{
  return [a1 checkForAndLogTrueBooleanEntitlement:a3 connection:a4 serviceName:a5 logHandle:a6 shouldGenerateCrashReport:1];
}

+ (BOOL)hasTrueBooleanEntitlement:(id)a3 connection:(id)a4 logHandle:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (a4) {
    [a4 auditToken];
  }
  else {
    memset(v11, 0, sizeof(v11));
  }
  BOOL v9 = +[_PASEntitlement taskWithAuditToken:v11 hasTrueBooleanEntitlement:v7 logHandle:v8];

  return v9;
}

+ (BOOL)shouldAcceptConnection:(id)a3 serviceName:(id)a4 whitelistedServerInterface:(id)a5 whitelistedClientInterface:(id)a6 requestHandler:(id)a7 validateConnection:(id)a8 setupClientProxy:(id)a9 interruptionHandler:(id)a10 invalidationHandler:(id)a11 logHandle:(id)a12
{
  v66[2] = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v47 = a4;
  id v46 = a5;
  id v18 = a6;
  id v19 = a7;
  v20 = a8;
  v21 = (void (**)(id, void *))a9;
  id v22 = a10;
  id v23 = a11;
  v24 = a12;
  int v60 = 0;
  int v44 = [v17 processIdentifier];
  int v25 = procNameForPid(v44, &v60);
  v45 = v20;
  if ([v25 length])
  {
    if (v24 && os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v62 = v47;
      __int16 v63 = 2112;
      v64 = v25;
      __int16 v65 = 2048;
      v66[0] = v44;
      v26 = "New connection to %@ from %@ (%lu).";
      v27 = v24;
      uint32_t v28 = 32;
LABEL_5:
      _os_log_impl(&dword_1A32C4000, v27, OS_LOG_TYPE_DEFAULT, v26, buf, v28);
    }
  }
  else
  {
    int v29 = v60;
    if (v60)
    {
      if (v24)
      {
        v30 = v24;
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v31 = strerror(v29);
          *(_DWORD *)buf = 138413058;
          id v62 = v47;
          __int16 v63 = 2048;
          v64 = (void *)v44;
          __int16 v65 = 1024;
          LODWORD(v66[0]) = v29;
          WORD2(v66[0]) = 2080;
          *(void *)((char *)v66 + 6) = v31;
          _os_log_impl(&dword_1A32C4000, v30, OS_LOG_TYPE_DEFAULT, "New connection to %@ from unknown process (%lu) (proc_name error: [%i] %s).", buf, 0x26u);
        }

        v20 = v45;
      }
    }
    else if (v24 && os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v62 = v47;
      __int16 v63 = 2048;
      v64 = (void *)v44;
      v26 = "New connection to %@ from unknown process (%lu).";
      v27 = v24;
      uint32_t v28 = 22;
      goto LABEL_5;
    }
  }
  LODWORD(v20) = ((uint64_t (*)(NSObject *, id, void *))v20[2].isa)(v20, v17, v25);
  if (v20)
  {
    [v17 setExportedInterface:v46];
    [v17 setExportedObject:v19];
    id v41 = v19;
    char v40 = (char)v20;
    if (v18)
    {
      [v17 setRemoteObjectInterface:v18];
      if (!v21)
      {
LABEL_20:
        v54[0] = MEMORY[0x1E4F143A8];
        v54[1] = 3221225472;
        v54[2] = __213___PASXPCServerHelper_shouldAcceptConnection_serviceName_whitelistedServerInterface_whitelistedClientInterface_requestHandler_validateConnection_setupClientProxy_interruptionHandler_invalidationHandler_logHandle___block_invoke;
        v54[3] = &unk_1E5AEAB98;
        v33 = v24;
        v55 = v33;
        v20 = v24;
        id v34 = v47;
        id v56 = v34;
        id v35 = v18;
        id v36 = v25;
        id v57 = v36;
        int v59 = v44;
        id v58 = v22;
        [v17 setInterruptionHandler:v54];
        v48[0] = MEMORY[0x1E4F143A8];
        v48[1] = 3221225472;
        v48[2] = __213___PASXPCServerHelper_shouldAcceptConnection_serviceName_whitelistedServerInterface_whitelistedClientInterface_requestHandler_validateConnection_setupClientProxy_interruptionHandler_invalidationHandler_logHandle___block_invoke_5;
        v48[3] = &unk_1E5AEAB98;
        v49 = v33;
        id v37 = v34;
        v24 = v20;
        id v50 = v37;
        id v38 = v36;
        id v18 = v35;
        id v51 = v38;
        int v53 = v44;
        id v52 = v23;
        [v17 setInvalidationHandler:v48];
        [v17 resume];

        id v19 = v41;
        LOBYTE(v20) = v40;
        goto LABEL_21;
      }
      v32 = [v17 remoteObjectProxy];
      v21[2](v21, v32);
    }
    else
    {
      if (!v21) {
        goto LABEL_20;
      }
      v32 = [MEMORY[0x1E4F28B00] currentHandler];
      [v32 handleFailureInMethod:a2 object:a1 file:@"_PASXPCServerHelper.m" lineNumber:87 description:@"setupClientProxy shall be nil if whitelistedClientInterface is nil"];
    }

    goto LABEL_20;
  }
LABEL_21:

  return (char)v20;
}

@end