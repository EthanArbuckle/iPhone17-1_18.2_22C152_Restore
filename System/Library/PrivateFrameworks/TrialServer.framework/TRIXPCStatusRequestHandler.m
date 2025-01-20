@interface TRIXPCStatusRequestHandler
- (TRIXPCStatusRequestHandler)initWithPromise:(id)a3 auditToken:(id *)a4;
- (void)activeEvaluationsForBMLTWithCompletion:(id)a3;
- (void)activeEvaluationsForMLRuntimeWithCompletion:(id)a3;
- (void)bmltRecordsWithCompletion:(id)a3;
- (void)evaluationHistoryRecordsForMLRuntimeWithLimit:(unint64_t)a3 newerThanDate:(id)a4 completion:(id)a5;
- (void)experimentHistoryRecordsWithLimit:(unint64_t)a3 newerThanDate:(id)a4 privacyFilterPolicy:(unsigned __int8)a5 deploymentEnvironment:(int)a6 completion:(id)a7;
- (void)experimentRecordsWithDeploymentEnvironments:(id)a3 privacyFilterPolicy:(unsigned __int8)a4 completion:(id)a5;
- (void)rolloutAllocationStatusWithPrivacyFilterPolicy:(unsigned __int8)a3 completion:(id)a4;
- (void)rolloutRecordsWithCompletion:(id)a3;
@end

@implementation TRIXPCStatusRequestHandler

- (void)rolloutRecordsWithCompletion:(id)a3
{
  id v4 = a3;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __59__TRIXPCStatusRequestHandler_rolloutRecordsWithCompletion___block_invoke;
  v16[3] = &unk_1E6BB8F38;
  v16[4] = self;
  v5 = (void (**)(void, void))MEMORY[0x1E016EA80](v16);
  v5[2](v5, 0);
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  v11 = __59__TRIXPCStatusRequestHandler_rolloutRecordsWithCompletion___block_invoke_132;
  v12 = &unk_1E6BB9458;
  id v14 = v4;
  id v15 = v5;
  v13 = self;
  v6 = v5;
  id v7 = v4;
  v8 = (void *)MEMORY[0x1E016EA80](&v9);
  -[TRIXPCServerContextPromise addBlockToExecuteAfterPromiseFullfillment:](self->_promise, "addBlockToExecuteAfterPromiseFullfillment:", v8, v9, v10, v11, v12, v13);
}

void __59__TRIXPCStatusRequestHandler_rolloutRecordsWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = TRILogCategory_Server();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(_DWORD *)(*(void *)(a1 + 32) + 36);
    v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    v8 = (void *)v7;
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = "end";
    v11[0] = 67109890;
    v11[1] = v5;
    if (!a2) {
      uint64_t v10 = "begin";
    }
    __int16 v12 = 2114;
    uint64_t v13 = v7;
    __int16 v14 = 2048;
    uint64_t v15 = v9;
    __int16 v16 = 2080;
    v17 = v10;
    _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "(%d) %{public}@ %p: %s rolloutRecordsWithCompletion:", (uint8_t *)v11, 0x26u);
  }
}

- (void).cxx_destruct
{
}

void __131__TRIXPCStatusRequestHandler_experimentHistoryRecordsWithLimit_newerThanDate_privacyFilterPolicy_deploymentEnvironment_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = TRILogCategory_Server();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(_DWORD *)(*(void *)(a1 + 32) + 36);
    v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    uint64_t v8 = *(void *)(a1 + 32);
    if (a2) {
      uint64_t v9 = "end";
    }
    else {
      uint64_t v9 = "begin";
    }
    uint64_t v10 = TRIDeploymentEnvironment_EnumDescriptor();
    v11 = [v10 textFormatNameForValue:*(unsigned int *)(a1 + 40)];
    v12[0] = 67110146;
    v12[1] = v5;
    __int16 v13 = 2114;
    __int16 v14 = v7;
    __int16 v15 = 2048;
    uint64_t v16 = v8;
    __int16 v17 = 2080;
    uint64_t v18 = v9;
    __int16 v19 = 2112;
    v20 = v11;
    _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "(%d) %{public}@ %p: %s experimentHistoryRecordsWithLimit:newerThanDate:deploymentEnvironment:completion: with env %@", (uint8_t *)v12, 0x30u);
  }
}

- (void)experimentHistoryRecordsWithLimit:(unint64_t)a3 newerThanDate:(id)a4 privacyFilterPolicy:(unsigned __int8)a5 deploymentEnvironment:(int)a6 completion:(id)a7
{
  id v12 = a4;
  id v13 = a7;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __131__TRIXPCStatusRequestHandler_experimentHistoryRecordsWithLimit_newerThanDate_privacyFilterPolicy_deploymentEnvironment_completion___block_invoke;
  v26[3] = &unk_1E6BBE380;
  v26[4] = self;
  int v27 = a6;
  __int16 v14 = (void (**)(void, void))MEMORY[0x1E016EA80](v26);
  v14[2](v14, 0);
  promise = self->_promise;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __131__TRIXPCStatusRequestHandler_experimentHistoryRecordsWithLimit_newerThanDate_privacyFilterPolicy_deploymentEnvironment_completion___block_invoke_43;
  v19[3] = &unk_1E6BBE3F8;
  id v21 = v14;
  id v22 = v13;
  int v24 = a6;
  v19[4] = self;
  id v20 = v12;
  unint64_t v23 = a3;
  unsigned __int8 v25 = a5;
  id v16 = v12;
  id v17 = v13;
  uint64_t v18 = v14;
  [(TRIXPCServerContextPromise *)promise addBlockToExecuteAfterPromiseFullfillment:v19];
}

- (void)rolloutAllocationStatusWithPrivacyFilterPolicy:(unsigned __int8)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __88__TRIXPCStatusRequestHandler_rolloutAllocationStatusWithPrivacyFilterPolicy_completion___block_invoke;
  v8[3] = &unk_1E6BBE4C0;
  id v9 = v6;
  unsigned __int8 v10 = a3;
  id v7 = v6;
  [(TRIXPCStatusRequestHandler *)self rolloutRecordsWithCompletion:v8];
}

- (void)experimentRecordsWithDeploymentEnvironments:(id)a3 privacyFilterPolicy:(unsigned __int8)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __105__TRIXPCStatusRequestHandler_experimentRecordsWithDeploymentEnvironments_privacyFilterPolicy_completion___block_invoke;
  v24[3] = &unk_1E6BB8F38;
  v24[4] = self;
  unsigned __int8 v10 = (void (**)(void, void))MEMORY[0x1E016EA80](v24);
  v10[2](v10, 0);
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  id v17 = __105__TRIXPCStatusRequestHandler_experimentRecordsWithDeploymentEnvironments_privacyFilterPolicy_completion___block_invoke_81;
  uint64_t v18 = &unk_1E6BBE420;
  id v21 = v9;
  id v22 = v10;
  __int16 v19 = self;
  id v20 = v8;
  unsigned __int8 v23 = a4;
  id v11 = v8;
  id v12 = v10;
  id v13 = v9;
  __int16 v14 = (void *)MEMORY[0x1E016EA80](&v15);
  -[TRIXPCServerContextPromise addBlockToExecuteAfterPromiseFullfillment:](self->_promise, "addBlockToExecuteAfterPromiseFullfillment:", v14, v15, v16, v17, v18, v19);
}

void __105__TRIXPCStatusRequestHandler_experimentRecordsWithDeploymentEnvironments_privacyFilterPolicy_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = TRILogCategory_Server();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(_DWORD *)(*(void *)(a1 + 32) + 36);
    id v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    id v8 = (void *)v7;
    uint64_t v9 = *(void *)(a1 + 32);
    unsigned __int8 v10 = "end";
    v11[0] = 67109890;
    v11[1] = v5;
    if (!a2) {
      unsigned __int8 v10 = "begin";
    }
    __int16 v12 = 2114;
    uint64_t v13 = v7;
    __int16 v14 = 2048;
    uint64_t v15 = v9;
    __int16 v16 = 2080;
    id v17 = v10;
    _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "(%d) %{public}@ %p: %s experimentRecordsWithDeploymentEnvironments:completion:", (uint8_t *)v11, 0x26u);
  }
}

- (TRIXPCStatusRequestHandler)initWithPromise:(id)a3 auditToken:(id *)a4
{
  id v8 = a3;
  if (!v8)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"TRIXPCStatusService.m", 82, @"Invalid parameter not satisfying: %@", @"promise" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)TRIXPCStatusRequestHandler;
  uint64_t v9 = [(TRIXPCStatusRequestHandler *)&v14 init];
  unsigned __int8 v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_promise, a3);
    long long v11 = *(_OWORD *)&a4->var0[4];
    *(_OWORD *)v10->_auditToken.val = *(_OWORD *)a4->var0;
    *(_OWORD *)&v10->_auditToken.val[4] = v11;
  }

  return v10;
}

void __131__TRIXPCStatusRequestHandler_experimentHistoryRecordsWithLimit_newerThanDate_privacyFilterPolicy_deploymentEnvironment_completion___block_invoke_43(uint64_t a1, void *a2, void *a3)
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v65[0] = MEMORY[0x1E4F143A8];
  v65[1] = 3221225472;
  v65[2] = __131__TRIXPCStatusRequestHandler_experimentHistoryRecordsWithLimit_newerThanDate_privacyFilterPolicy_deploymentEnvironment_completion___block_invoke_2;
  v65[3] = &unk_1E6BB8F60;
  id v66 = *(id *)(a1 + 48);
  uint64_t v7 = (void (**)(void))MEMORY[0x1E016EA80](v65);
  if (v5 && v6)
  {
    v63[0] = MEMORY[0x1E4F143A8];
    v63[1] = 3221225472;
    v63[2] = __131__TRIXPCStatusRequestHandler_experimentHistoryRecordsWithLimit_newerThanDate_privacyFilterPolicy_deploymentEnvironment_completion___block_invoke_48;
    v63[3] = &unk_1E6BB8FD8;
    id v64 = *(id *)(a1 + 56);
    id v8 = (void (**)(void, void, void))MEMORY[0x1E016EA80](v63);
    uint64_t v9 = *MEMORY[0x1E4FB04D8];
    uint64_t v10 = *(void *)(a1 + 32);
    long long v11 = *(_OWORD *)(v10 + 32);
    *(_OWORD *)buf = *(_OWORD *)(v10 + 16);
    *(_OWORD *)&buf[16] = v11;
    __int16 v12 = [MEMORY[0x1E4FB00E0] objectForEntitlement:v9 withAuditToken:buf];
    if (!v12)
    {
      v36 = TRILogCategory_Server();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        int v43 = *(_DWORD *)(*(void *)(a1 + 32) + 36);
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&buf[4] = v43;
        *(_WORD *)&buf[8] = 2114;
        *(void *)&buf[10] = v9;
        _os_log_error_impl(&dword_1DA291000, v36, OS_LOG_TYPE_ERROR, "experimentHistoryRecordsWithLimit: the calling process (pid %d) is missing entitlement \"%{public}@\".", buf, 0x12u);
      }

      uint64_t v13 = (void *)[[NSString alloc] initWithFormat:@"The calling process is missing entitlement \"%@\".", v9];
      ((void (**)(void, uint64_t, void *))v8)[2](v8, 3, v13);
      goto LABEL_39;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v37 = TRILogCategory_Server();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        int v44 = *(_DWORD *)(*(void *)(a1 + 32) + 36);
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&buf[4] = v44;
        *(_WORD *)&buf[8] = 2114;
        *(void *)&buf[10] = v9;
        _os_log_error_impl(&dword_1DA291000, v37, OS_LOG_TYPE_ERROR, "experimentHistoryRecordsWithLimit: the calling process (pid %d) has ill-typed value for entitlement \"%{public}@\" (expected array).", buf, 0x12u);
      }

      uint64_t v13 = (void *)[[NSString alloc] initWithFormat:@"The calling process has a value for entitlement \"%@\" which is not array-valued.", v9];
      ((void (**)(void, uint64_t, void *))v8)[2](v8, 3, v13);
      goto LABEL_39;
    }
    uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v12];
    objc_super v14 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 72)];
    char v15 = [v13 containsObject:v14];

    if ((v15 & 1) == 0)
    {
      v38 = TRILogCategory_Server();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        int v55 = *(_DWORD *)(*(void *)(a1 + 32) + 36);
        v45 = TRIDeploymentEnvironment_EnumDescriptor();
        v46 = [v45 textFormatNameForValue:*(unsigned int *)(a1 + 72)];
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&buf[4] = v55;
        *(_WORD *)&buf[8] = 2114;
        *(void *)&buf[10] = v46;
        _os_log_error_impl(&dword_1DA291000, v38, OS_LOG_TYPE_ERROR, "experimentHistoryRecordsWithLimit: the calling process (pid %d) is not entitled for access to %{public}@.", buf, 0x12u);
      }
      id v39 = [NSString alloc];
      TRIDeploymentEnvironment_EnumDescriptor();
      id v20 = (id)objc_claimAutoreleasedReturnValue();
      v40 = [v20 textFormatNameForValue:*(unsigned int *)(a1 + 72)];
      v41 = (void *)[v39 initWithFormat:@"The calling process is not entitled for access to %@.", v40];
      ((void (**)(void, uint64_t, void *))v8)[2](v8, 3, v41);

      goto LABEL_37;
    }
    if (*(void *)(a1 + 40))
    {
      if (*(void *)(a1 + 64))
      {
        v51 = objc_opt_new();
        v53 = [v5 experimentHistoryDatabase];
        os_log_t loga = *(os_log_t *)(a1 + 40);
        __int16 v16 = (void *)MEMORY[0x1E016E7F0]();
        id v17 = objc_alloc(MEMORY[0x1E4F1CAD0]);
        uint64_t v18 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 72)];
        __int16 v19 = objc_msgSend(v17, "initWithObjects:", v18, 0);

        v60[0] = MEMORY[0x1E4F143A8];
        v60[1] = 3221225472;
        v60[2] = __131__TRIXPCStatusRequestHandler_experimentHistoryRecordsWithLimit_newerThanDate_privacyFilterPolicy_deploymentEnvironment_completion___block_invoke_69;
        v60[3] = &unk_1E6BBE3A8;
        id v20 = v51;
        uint64_t v21 = *(void *)(a1 + 64);
        id v61 = v20;
        uint64_t v62 = v21;
        LOBYTE(v18) = [v53 enumerateRecordsNewerThanDate:loga matchingDeploymentEnvironments:v19 block:v60];

        if ((v18 & 1) == 0)
        {
          ((void (**)(void, uint64_t, __CFString *))v8)[2](v8, 12, @"The database query failed.");
          goto LABEL_36;
        }
        v52 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", objc_msgSend(v20, "count"));
        v54 = objc_opt_new();
        if ((int)[v52 intValue] >= 1)
        {
          id v22 = [v20 lastObject];
          uint64_t v23 = [v22 eventDate];

          v54 = (void *)v23;
        }
        char v24 = *(unsigned char *)(a1 + 76);
        if (v24)
        {
          v58[0] = MEMORY[0x1E4F143A8];
          v58[1] = 3221225472;
          v58[2] = __131__TRIXPCStatusRequestHandler_experimentHistoryRecordsWithLimit_newerThanDate_privacyFilterPolicy_deploymentEnvironment_completion___block_invoke_2_75;
          v58[3] = &__block_descriptor_33_e25_B24__0_8__NSDictionary_16l;
          char v59 = v24;
          unsigned __int8 v25 = [MEMORY[0x1E4F28F60] predicateWithBlock:v58];
          [v20 filterUsingPredicate:v25];
        }
        if (!*(_DWORD *)(a1 + 72))
        {
          uint64_t v26 = *MEMORY[0x1E4FB04E0];
          uint64_t v27 = *(void *)(a1 + 32);
          long long v28 = *(_OWORD *)(v27 + 32);
          *(_OWORD *)buf = *(_OWORD *)(v27 + 16);
          *(_OWORD *)&buf[16] = v28;
          v29 = [MEMORY[0x1E4FB00E0] objectForEntitlement:v26 withAuditToken:buf];
          if (v29)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              log = TRILogCategory_Server();
              if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
              {
                int v48 = *(_DWORD *)(*(void *)(a1 + 32) + 36);
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)&buf[4] = v48;
                *(_WORD *)&buf[8] = 2112;
                *(void *)&buf[10] = v26;
                _os_log_error_impl(&dword_1DA291000, log, OS_LOG_TYPE_ERROR, "experimentHistoryRecordsWithLimit: the calling process (pid %d) has ill-typed value for entitlement \"%@\" (expected array).", buf, 0x12u);
              }

              v47 = (void *)[[NSString alloc] initWithFormat:@"The calling process has a value for entitlement \"%@\" which is not array-valued.", v26];
              ((void (**)(void, uint64_t, void *))v8)[2](v8, 3, v47);

              goto LABEL_20;
            }
            v30 = (void *)MEMORY[0x1E4F28F60];
            v56[0] = MEMORY[0x1E4F143A8];
            v56[1] = 3221225472;
            v56[2] = __131__TRIXPCStatusRequestHandler_experimentHistoryRecordsWithLimit_newerThanDate_privacyFilterPolicy_deploymentEnvironment_completion___block_invoke_79;
            v56[3] = &unk_1E6BBE3D0;
            id v57 = v29;
            v31 = [v30 predicateWithBlock:v56];
            [v20 filterUsingPredicate:v31];
          }
        }
        uint64_t v32 = *(void *)(a1 + 56);
        if (v32) {
          (*(void (**)(uint64_t, void *, id, void *, void))(v32 + 16))(v32, v52, v20, v54, 0);
        }
LABEL_20:

LABEL_36:
        v40 = v61;
LABEL_37:

        goto LABEL_38;
      }
      uint64_t v42 = *(void *)(a1 + 56);
      if (v42)
      {
        id v20 = (id)objc_opt_new();
        (*(void (**)(uint64_t, void *, void, id, void))(v42 + 16))(v42, &unk_1F347BB70, MEMORY[0x1E4F1CBF0], v20, 0);
LABEL_38:
      }
    }
    else
    {
      ((void (**)(void, uint64_t, __CFString *))v8)[2](v8, 2, @"The 'date' parameter must be non-nil.");
    }
LABEL_39:

    v34 = v64;
    goto LABEL_40;
  }
  uint64_t v33 = *(void *)(a1 + 56);
  if (!v33) {
    goto LABEL_41;
  }
  v34 = objc_opt_new();
  v35 = [MEMORY[0x1E4F28C58] errorWithDomain:@"TRIGeneralErrorDomain" code:12 userInfo:0];
  (*(void (**)(uint64_t, void *, void, void *, void *))(v33 + 16))(v33, &unk_1F347BB70, MEMORY[0x1E4F1CBF0], v34, v35);

LABEL_40:
LABEL_41:
  if (v7) {
    v7[2](v7);
  }
}

uint64_t __131__TRIXPCStatusRequestHandler_experimentHistoryRecordsWithLimit_newerThanDate_privacyFilterPolicy_deploymentEnvironment_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __131__TRIXPCStatusRequestHandler_experimentHistoryRecordsWithLimit_newerThanDate_privacyFilterPolicy_deploymentEnvironment_completion___block_invoke_48(uint64_t a1, uint64_t a2, void *a3)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    id v5 = (objc_class *)MEMORY[0x1E4F28C58];
    id v6 = a3;
    id v7 = [v5 alloc];
    uint64_t v12 = *MEMORY[0x1E4F28568];
    v13[0] = v6;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    uint64_t v9 = (void *)[v7 initWithDomain:@"TRIGeneralErrorDomain" code:a2 userInfo:v8];

    uint64_t v10 = *(void *)(a1 + 32);
    long long v11 = objc_opt_new();
    (*(void (**)(uint64_t, void *, void, void *, void *))(v10 + 16))(v10, &unk_1F347BB70, 0, v11, v9);
  }
}

unint64_t __131__TRIXPCStatusRequestHandler_experimentHistoryRecordsWithLimit_newerThanDate_privacyFilterPolicy_deploymentEnvironment_completion___block_invoke_69(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  [*(id *)(a1 + 32) addObject:a2];
  unint64_t result = [*(id *)(a1 + 32) count];
  if (result >= *(void *)(a1 + 40)) {
    *a3 = 1;
  }
  return result;
}

uint64_t __131__TRIXPCStatusRequestHandler_experimentHistoryRecordsWithLimit_newerThanDate_privacyFilterPolicy_deploymentEnvironment_completion___block_invoke_2_75(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = objc_msgSend(a2, "namespaces", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = (void *)MEMORY[0x1E4FB01B8];
        uint64_t v9 = [*(id *)(*((void *)&v12 + 1) + 8 * v7) name];
        LOBYTE(v8) = [v8 shouldPrivacyFilterNamespace:v9 policy:*(unsigned __int8 *)(a1 + 32)];

        if (v8)
        {
          uint64_t v10 = 0;
          goto LABEL_11;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  uint64_t v10 = 1;
LABEL_11:

  return v10;
}

uint64_t __131__TRIXPCStatusRequestHandler_experimentHistoryRecordsWithLimit_newerThanDate_privacyFilterPolicy_deploymentEnvironment_completion___block_invoke_79(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = objc_msgSend(a2, "namespaces", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(a1 + 32);
        uint64_t v9 = [*(id *)(*((void *)&v12 + 1) + 8 * v7) name];
        LOBYTE(v8) = [v8 containsObject:v9];

        if (v8)
        {
          uint64_t v10 = 1;
          goto LABEL_11;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  uint64_t v10 = 0;
LABEL_11:

  return v10;
}

void __105__TRIXPCStatusRequestHandler_experimentRecordsWithDeploymentEnvironments_privacyFilterPolicy_completion___block_invoke_81(uint64_t a1, void *a2, void *a3)
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v5 && v6)
  {
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __105__TRIXPCStatusRequestHandler_experimentRecordsWithDeploymentEnvironments_privacyFilterPolicy_completion___block_invoke_2;
    v55[3] = &unk_1E6BB8F60;
    id v56 = *(id *)(a1 + 56);
    id v45 = (id)MEMORY[0x1E016EA80](v55);
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __105__TRIXPCStatusRequestHandler_experimentRecordsWithDeploymentEnvironments_privacyFilterPolicy_completion___block_invoke_3;
    v53[3] = &unk_1E6BB8FD8;
    id v54 = *(id *)(a1 + 48);
    id v8 = (void (**)(void, void, void))MEMORY[0x1E016EA80](v53);
    uint64_t v9 = *MEMORY[0x1E4FB04D8];
    uint64_t v10 = *(void *)(a1 + 32);
    long long v11 = *(_OWORD *)(v10 + 32);
    *(_OWORD *)buf = *(_OWORD *)(v10 + 16);
    *(_OWORD *)&buf[16] = v11;
    long long v12 = [MEMORY[0x1E4FB00E0] objectForEntitlement:v9 withAuditToken:buf];
    uint64_t v13 = *(void *)(a1 + 32);
    long long v14 = *(_OWORD *)(v13 + 32);
    *(_OWORD *)buf = *(_OWORD *)(v13 + 16);
    *(_OWORD *)&buf[16] = v14;
    long long v15 = [MEMORY[0x1E4FB00E0] objectForEntitlement:@"com.apple.triald.internal" withAuditToken:buf];
    BOOL v16 = v15 == 0;

    if (v16)
    {
      if (!v12)
      {
        v35 = TRILogCategory_Server();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          int v41 = *(_DWORD *)(*(void *)(a1 + 32) + 36);
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&buf[4] = v41;
          *(_WORD *)&buf[8] = 2114;
          *(void *)&buf[10] = v9;
          _os_log_error_impl(&dword_1DA291000, v35, OS_LOG_TYPE_ERROR, "experimentRecordsWithDeploymentEnvironments: the calling process (pid %d) is missing entitlement \"%{public}@\".", buf, 0x12u);
        }

        long long v12 = (void *)[[NSString alloc] initWithFormat:@"The calling process is missing entitlement \"%@\".", v9];
        ((void (**)(void, uint64_t, void *))v8)[2](v8, 3, v12);
        goto LABEL_35;
      }
    }
    else
    {

      long long v12 = &unk_1F347B498;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v34 = TRILogCategory_Server();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        int v38 = *(_DWORD *)(*(void *)(a1 + 32) + 36);
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&buf[4] = v38;
        *(_WORD *)&buf[8] = 2114;
        *(void *)&buf[10] = v9;
        _os_log_error_impl(&dword_1DA291000, v34, OS_LOG_TYPE_ERROR, "experimentRecordsWithDeploymentEnvironments: the calling process (pid %d) has ill-typed value for entitlement \"%{public}@\" (expected array).", buf, 0x12u);
      }

      __int16 v19 = (void *)[[NSString alloc] initWithFormat:@"The calling process has a value for entitlement \"%@\" which is not array-valued.", v9];
      ((void (**)(void, uint64_t, void *))v8)[2](v8, 3, v19);
      goto LABEL_34;
    }
    __int16 v19 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v12];
    id v20 = *(void **)(a1 + 40);
    if (!v20)
    {
      ((void (**)(void, uint64_t, __CFString *))v8)[2](v8, 2, @"Parameter 'environments' must be non-nil.");
LABEL_34:

LABEL_35:
      v37 = v45;
      if (v45)
      {
        (*((void (**)(void))v45 + 2))();
        v37 = v45;
      }

      goto LABEL_38;
    }
    if (([v20 isSubsetOfSet:v19] & 1) == 0)
    {
      v36 = TRILogCategory_Server();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        uint64_t v42 = *(void *)(a1 + 40);
        int v43 = *(_DWORD *)(*(void *)(a1 + 32) + 36);
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&buf[4] = v43;
        *(_WORD *)&buf[8] = 2114;
        *(void *)&buf[10] = v42;
        _os_log_error_impl(&dword_1DA291000, v36, OS_LOG_TYPE_ERROR, "experimentRecordsWithDeploymentEnvironments: the calling process (pid %d) is not entitled for access to deployment environments %{public}@.", buf, 0x12u);
      }

      id v23 = (id)[[NSString alloc] initWithFormat:@"The calling process is not entitled for access to deployment environments %@.", *(void *)(a1 + 40)];
      ((void (**)(void, uint64_t, id))v8)[2](v8, 3, v23);
      goto LABEL_33;
    }
    uint64_t v21 = objc_opt_new();
    id v22 = [v5 experimentDatabase];
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __105__TRIXPCStatusRequestHandler_experimentRecordsWithDeploymentEnvironments_privacyFilterPolicy_completion___block_invoke_94;
    v50[3] = &unk_1E6BB9310;
    id v51 = *(id *)(a1 + 40);
    id v23 = v21;
    id v52 = v23;
    char v24 = [v22 enumerateExperimentRecordsWithBlock:v50];

    if (v24)
    {
      char v25 = *(unsigned char *)(a1 + 64);
      if (v25)
      {
        v48[0] = MEMORY[0x1E4F143A8];
        v48[1] = 3221225472;
        v48[2] = __105__TRIXPCStatusRequestHandler_experimentRecordsWithDeploymentEnvironments_privacyFilterPolicy_completion___block_invoke_2_97;
        v48[3] = &__block_descriptor_33_e25_B24__0_8__NSDictionary_16l;
        char v49 = v25;
        uint64_t v26 = [MEMORY[0x1E4F28F60] predicateWithBlock:v48];
        [v23 filterUsingPredicate:v26];
      }
      if ([*(id *)(a1 + 40) containsObject:&unk_1F347BB88])
      {
        uint64_t v27 = *MEMORY[0x1E4FB04E0];
        uint64_t v28 = *(void *)(a1 + 32);
        long long v29 = *(_OWORD *)(v28 + 32);
        *(_OWORD *)buf = *(_OWORD *)(v28 + 16);
        *(_OWORD *)&buf[16] = v29;
        v30 = [MEMORY[0x1E4FB00E0] objectForEntitlement:v27 withAuditToken:buf];
        if (v30)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            id v39 = TRILogCategory_Server();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            {
              int v44 = *(_DWORD *)(*(void *)(a1 + 32) + 36);
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)&buf[4] = v44;
              *(_WORD *)&buf[8] = 2112;
              *(void *)&buf[10] = v27;
              _os_log_error_impl(&dword_1DA291000, v39, OS_LOG_TYPE_ERROR, "experimentRecordsWithDeploymentEnvironments: the calling process (pid %d) has ill-typed value for entitlement \"%@\" (expected array).", buf, 0x12u);
            }

            v40 = (void *)[[NSString alloc] initWithFormat:@"The calling process has a value for entitlement \"%@\" which is not array-valued.", v27];
            ((void (**)(void, uint64_t, void *))v8)[2](v8, 3, v40);

            goto LABEL_32;
          }
          v31 = (void *)MEMORY[0x1E4F28F60];
          v46[0] = MEMORY[0x1E4F143A8];
          v46[1] = 3221225472;
          v46[2] = __105__TRIXPCStatusRequestHandler_experimentRecordsWithDeploymentEnvironments_privacyFilterPolicy_completion___block_invoke_98;
          v46[3] = &unk_1E6BBE3D0;
          id v47 = v30;
          uint64_t v32 = [v31 predicateWithBlock:v46];
          [v23 filterUsingPredicate:v32];
        }
      }
      uint64_t v33 = *(void *)(a1 + 48);
      if (v33) {
        (*(void (**)(uint64_t, id, void))(v33 + 16))(v33, v23, 0);
      }
    }
    else
    {
      ((void (**)(void, uint64_t, __CFString *))v8)[2](v8, 12, @"The database query failed.");
    }
LABEL_32:

LABEL_33:
    goto LABEL_34;
  }
  uint64_t v17 = *(void *)(a1 + 48);
  if (v17)
  {
    uint64_t v18 = [MEMORY[0x1E4F28C58] errorWithDomain:@"TRIGeneralErrorDomain" code:12 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v17 + 16))(v17, MEMORY[0x1E4F1CBF0], v18);
  }
LABEL_38:
}

uint64_t __105__TRIXPCStatusRequestHandler_experimentRecordsWithDeploymentEnvironments_privacyFilterPolicy_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __105__TRIXPCStatusRequestHandler_experimentRecordsWithDeploymentEnvironments_privacyFilterPolicy_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    id v5 = (objc_class *)MEMORY[0x1E4F28C58];
    id v6 = a3;
    id v7 = [v5 alloc];
    uint64_t v10 = *MEMORY[0x1E4F28568];
    v11[0] = v6;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    uint64_t v9 = (void *)[v7 initWithDomain:@"TRIGeneralErrorDomain" code:a2 userInfo:v8];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __105__TRIXPCStatusRequestHandler_experimentRecordsWithDeploymentEnvironments_privacyFilterPolicy_completion___block_invoke_94(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v18 = v3;
  id v5 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v3, "deploymentEnvironment"));
  LODWORD(v4) = [v4 containsObject:v5];

  if (v4)
  {
    id v17 = objc_alloc(MEMORY[0x1E4FB01F8]);
    uint64_t v6 = [v18 deploymentEnvironment];
    id v7 = [v18 experimentDeployment];
    id v8 = [v18 treatmentId];
    uint64_t v9 = [v18 factorPackSetId];
    uint64_t v10 = [v18 type];
    uint64_t v11 = [v18 status];
    long long v12 = [v18 startDate];
    uint64_t v13 = [v18 endDate];
    long long v14 = [v18 namespaces];
    LOBYTE(v16) = [v18 isShadow];
    long long v15 = (void *)[v17 initWithDeploymentEnvironment:v6 experimentDeployment:v7 treatmentId:v8 factorPackSetId:v9 type:v10 status:v11 startDate:v12 endDate:v13 namespaces:v14 isShadow:v16];

    [*(id *)(a1 + 40) addObject:v15];
  }
}

uint64_t __105__TRIXPCStatusRequestHandler_experimentRecordsWithDeploymentEnvironments_privacyFilterPolicy_completion___block_invoke_2_97(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = objc_msgSend(a2, "namespaces", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = (void *)MEMORY[0x1E4FB01B8];
        uint64_t v9 = [*(id *)(*((void *)&v12 + 1) + 8 * v7) name];
        LOBYTE(v8) = [v8 shouldPrivacyFilterNamespace:v9 policy:*(unsigned __int8 *)(a1 + 32)];

        if (v8)
        {
          uint64_t v10 = 0;
          goto LABEL_11;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  uint64_t v10 = 1;
LABEL_11:

  return v10;
}

uint64_t __105__TRIXPCStatusRequestHandler_experimentRecordsWithDeploymentEnvironments_privacyFilterPolicy_completion___block_invoke_98(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 deploymentEnvironment])
  {
    uint64_t v4 = 1;
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v5 = objc_msgSend(v3, "namespaces", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      while (2)
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(a1 + 32);
          uint64_t v11 = [*(id *)(*((void *)&v13 + 1) + 8 * v9) name];
          LOBYTE(v10) = [v10 containsObject:v11];

          if (v10)
          {
            uint64_t v4 = 1;
            goto LABEL_13;
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    uint64_t v4 = 0;
LABEL_13:
  }
  return v4;
}

- (void)activeEvaluationsForMLRuntimeWithCompletion:(id)a3
{
  id v4 = a3;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __74__TRIXPCStatusRequestHandler_activeEvaluationsForMLRuntimeWithCompletion___block_invoke;
  v16[3] = &unk_1E6BB8F38;
  v16[4] = self;
  uint64_t v5 = (void (**)(void, void))MEMORY[0x1E016EA80](v16);
  v5[2](v5, 0);
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __74__TRIXPCStatusRequestHandler_activeEvaluationsForMLRuntimeWithCompletion___block_invoke_99;
  long long v12 = &unk_1E6BB9458;
  id v14 = v4;
  id v15 = v5;
  long long v13 = self;
  uint64_t v6 = v5;
  id v7 = v4;
  uint64_t v8 = (void *)MEMORY[0x1E016EA80](&v9);
  -[TRIXPCServerContextPromise addBlockToExecuteAfterPromiseFullfillment:](self->_promise, "addBlockToExecuteAfterPromiseFullfillment:", v8, v9, v10, v11, v12, v13);
}

void __74__TRIXPCStatusRequestHandler_activeEvaluationsForMLRuntimeWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = TRILogCategory_Server();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(_DWORD *)(*(void *)(a1 + 32) + 36);
    uint64_t v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    uint64_t v8 = (void *)v7;
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = "end";
    v11[0] = 67109890;
    v11[1] = v5;
    if (!a2) {
      uint64_t v10 = "begin";
    }
    __int16 v12 = 2114;
    uint64_t v13 = v7;
    __int16 v14 = 2048;
    uint64_t v15 = v9;
    __int16 v16 = 2080;
    uint64_t v17 = v10;
    _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "(%d) %{public}@ %p: %s activeEvaluationsForMLRuntimeWithCompletion:", (uint8_t *)v11, 0x26u);
  }
}

void __74__TRIXPCStatusRequestHandler_activeEvaluationsForMLRuntimeWithCompletion___block_invoke_99(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v5 && v6)
  {
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __74__TRIXPCStatusRequestHandler_activeEvaluationsForMLRuntimeWithCompletion___block_invoke_2;
    v32[3] = &unk_1E6BB8F60;
    id v33 = *(id *)(a1 + 48);
    uint64_t v8 = (void (**)(void))MEMORY[0x1E016EA80](v32);
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __74__TRIXPCStatusRequestHandler_activeEvaluationsForMLRuntimeWithCompletion___block_invoke_3;
    v30[3] = &unk_1E6BB8FD8;
    id v31 = *(id *)(a1 + 40);
    uint64_t v9 = (void (**)(void, void, void))MEMORY[0x1E016EA80](v30);
    uint64_t v10 = (void *)MEMORY[0x1E4F93B28];
    uint64_t v11 = *(void *)(a1 + 32);
    __int16 v12 = TRILogCategory_Server();
    uint64_t v13 = *MEMORY[0x1E4FB0508];
    long long v14 = *(_OWORD *)(v11 + 32);
    v29[0] = *(_OWORD *)(v11 + 16);
    v29[1] = v14;
    LOBYTE(v10) = [v10 taskWithAuditToken:v29 hasTrueBooleanEntitlement:v13 logHandle:v12];

    if (v10)
    {
      uint64_t v15 = objc_opt_new();
      __int16 v16 = [v5 rolloutDatabase];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __74__TRIXPCStatusRequestHandler_activeEvaluationsForMLRuntimeWithCompletion___block_invoke_4;
      v27[3] = &unk_1E6BB8D18;
      id v17 = v15;
      id v28 = v17;
      char v18 = [v16 enumerateActiveRecordsWithVisibility:2 usingTransaction:0 block:v27];

      if (v18)
      {
        __int16 v19 = [v5 experimentDatabase];
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __74__TRIXPCStatusRequestHandler_activeEvaluationsForMLRuntimeWithCompletion___block_invoke_110;
        v25[3] = &unk_1E6BB8D40;
        id v20 = v17;
        id v26 = v20;
        char v21 = [v19 enumerateActiveExperimentRecordsWithVisibility:2 block:v25];

        if (v21)
        {
          uint64_t v22 = *(void *)(a1 + 40);
          if (v22) {
            (*(void (**)(uint64_t, id, void))(v22 + 16))(v22, v20, 0);
          }
        }
        else
        {
          ((void (**)(void, uint64_t, __CFString *))v9)[2](v9, 12, @"The experiment database query failed.");
        }
      }
      else
      {
        ((void (**)(void, uint64_t, __CFString *))v9)[2](v9, 12, @"The rollout database query failed.");
      }
    }
    else
    {
      id v17 = (id)[[NSString alloc] initWithFormat:@"The calling process is missing true-valued entitlement \"%@\".", v13];
      ((void (**)(void, uint64_t, id))v9)[2](v9, 3, v17);
    }

    if (v8) {
      v8[2](v8);
    }
  }
  else
  {
    uint64_t v23 = *(void *)(a1 + 40);
    if (v23)
    {
      char v24 = [MEMORY[0x1E4F28C58] errorWithDomain:@"TRIGeneralErrorDomain" code:12 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v23 + 16))(v23, 0, v24);
    }
  }
}

uint64_t __74__TRIXPCStatusRequestHandler_activeEvaluationsForMLRuntimeWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __74__TRIXPCStatusRequestHandler_activeEvaluationsForMLRuntimeWithCompletion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    id v5 = (objc_class *)MEMORY[0x1E4F28C58];
    id v6 = a3;
    id v7 = [v5 alloc];
    uint64_t v10 = *MEMORY[0x1E4F28568];
    v11[0] = v6;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    uint64_t v9 = (void *)[v7 initWithDomain:@"TRIGeneralErrorDomain" code:a2 userInfo:v8];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __74__TRIXPCStatusRequestHandler_activeEvaluationsForMLRuntimeWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 artifact];
  id v5 = [v4 rollout];
  char v6 = [v5 hasShadowEvaluation];

  if (v6)
  {
    id v7 = [v3 artifact];
    uint64_t v8 = [v7 rollout];
    uint64_t v9 = [v8 shadowEvaluation];
    int v10 = [v9 typeOneOfCase];

    if (v10 == 1)
    {
      id v11 = objc_alloc(MEMORY[0x1E4FB0230]);
      __int16 v12 = [v3 deployment];
      uint64_t v13 = (void *)[v11 initWithDeployment:v12];

      long long v14 = *(void **)(a1 + 32);
      id v15 = objc_alloc(MEMORY[0x1E4FB0188]);
      __int16 v16 = [v3 artifact];
      id v17 = [v16 rollout];
      char v18 = [v17 shadowEvaluation];
      __int16 v19 = [v18 mlRuntime];
      id v20 = (void *)[v15 initWithEval:v19 factorsState:v13];
      [v14 addObject:v20];
    }
  }
  else
  {
    char v21 = TRILogCategory_Server();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = [v3 deployment];
      uint64_t v23 = [v22 shortDesc];
      int v24 = 138412290;
      char v25 = v23;
      _os_log_error_impl(&dword_1DA291000, v21, OS_LOG_TYPE_ERROR, "Rollout deployment %@ is marked as shadow but has no shadowEvaluation.", (uint8_t *)&v24, 0xCu);
    }
  }
}

void __74__TRIXPCStatusRequestHandler_activeEvaluationsForMLRuntimeWithCompletion___block_invoke_110(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 artifact];
  id v5 = [v4 experiment];

  if (!v5 || ([v5 hasShadowEvaluation] & 1) == 0)
  {
    int v10 = TRILogCategory_Server();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v20 = [v3 experimentDeployment];
      char v21 = [v20 shortDesc];
      int v22 = 138543362;
      uint64_t v23 = v21;
      _os_log_error_impl(&dword_1DA291000, v10, OS_LOG_TYPE_ERROR, "Experiment deployment %{public}@ is marked as shadow but has no shadowEvaluation.", (uint8_t *)&v22, 0xCu);
    }
LABEL_9:

    goto LABEL_10;
  }
  char v6 = [v5 shadowEvaluation];
  int v7 = [v6 typeOneOfCase];

  if (v7 == 1)
  {
    uint64_t v8 = [v5 shadowEvaluation];
    int v9 = [v8 hasClientBackgroundMlTask];

    if (!v9)
    {
      id v11 = objc_alloc(MEMORY[0x1E4FB0100]);
      __int16 v12 = [v3 experimentDeployment];
      uint64_t v13 = [v3 treatmentId];
      long long v14 = (void *)[v11 initWithDeployment:v12 treatmentId:v13];

      id v15 = *(void **)(a1 + 32);
      id v16 = objc_alloc(MEMORY[0x1E4FB0188]);
      id v17 = [v5 shadowEvaluation];
      char v18 = [v17 mlRuntime];
      __int16 v19 = (void *)[v16 initWithEval:v18 factorsState:v14];
      [v15 addObject:v19];

      goto LABEL_10;
    }
    int v10 = TRILogCategory_Server();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_1DA291000, v10, OS_LOG_TYPE_DEFAULT, "Experiment is a BMLT and will not be included in MLRuntime Shadow Evaluation", (uint8_t *)&v22, 2u);
    }
    goto LABEL_9;
  }
LABEL_10:
}

- (void)evaluationHistoryRecordsForMLRuntimeWithLimit:(unint64_t)a3 newerThanDate:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __101__TRIXPCStatusRequestHandler_evaluationHistoryRecordsForMLRuntimeWithLimit_newerThanDate_completion___block_invoke;
  v24[3] = &unk_1E6BB8F38;
  v24[4] = self;
  int v10 = (void (**)(void, void))MEMORY[0x1E016EA80](v24);
  v10[2](v10, 0);
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  id v17 = __101__TRIXPCStatusRequestHandler_evaluationHistoryRecordsForMLRuntimeWithLimit_newerThanDate_completion___block_invoke_115;
  char v18 = &unk_1E6BBE470;
  id v21 = v9;
  id v22 = v10;
  __int16 v19 = self;
  id v20 = v8;
  unint64_t v23 = a3;
  id v11 = v8;
  __int16 v12 = v10;
  id v13 = v9;
  long long v14 = (void *)MEMORY[0x1E016EA80](&v15);
  -[TRIXPCServerContextPromise addBlockToExecuteAfterPromiseFullfillment:](self->_promise, "addBlockToExecuteAfterPromiseFullfillment:", v14, v15, v16, v17, v18, v19);
}

void __101__TRIXPCStatusRequestHandler_evaluationHistoryRecordsForMLRuntimeWithLimit_newerThanDate_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = TRILogCategory_Server();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(_DWORD *)(*(void *)(a1 + 32) + 36);
    char v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    id v8 = (void *)v7;
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = "end";
    v11[0] = 67109890;
    v11[1] = v5;
    if (!a2) {
      int v10 = "begin";
    }
    __int16 v12 = 2114;
    uint64_t v13 = v7;
    __int16 v14 = 2048;
    uint64_t v15 = v9;
    __int16 v16 = 2080;
    id v17 = v10;
    _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "(%d) %{public}@ %p: %s evaluationHistoryRecordsForMLRuntimeWithLimit:", (uint8_t *)v11, 0x26u);
  }
}

void __101__TRIXPCStatusRequestHandler_evaluationHistoryRecordsForMLRuntimeWithLimit_newerThanDate_completion___block_invoke_115(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v5 && v6)
  {
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __101__TRIXPCStatusRequestHandler_evaluationHistoryRecordsForMLRuntimeWithLimit_newerThanDate_completion___block_invoke_2;
    v30[3] = &unk_1E6BB8F60;
    id v31 = *(id *)(a1 + 56);
    id v8 = (void (**)(void))MEMORY[0x1E016EA80](v30);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __101__TRIXPCStatusRequestHandler_evaluationHistoryRecordsForMLRuntimeWithLimit_newerThanDate_completion___block_invoke_3;
    v28[3] = &unk_1E6BB8FD8;
    id v29 = *(id *)(a1 + 48);
    uint64_t v9 = (void (**)(void, void, void))MEMORY[0x1E016EA80](v28);
    int v10 = (void *)MEMORY[0x1E4F93B28];
    uint64_t v11 = *(void *)(a1 + 32);
    __int16 v12 = TRILogCategory_Server();
    uint64_t v13 = *MEMORY[0x1E4FB0508];
    long long v14 = *(_OWORD *)(v11 + 32);
    v27[0] = *(_OWORD *)(v11 + 16);
    v27[1] = v14;
    LOBYTE(v10) = [v10 taskWithAuditToken:v27 hasTrueBooleanEntitlement:v13 logHandle:v12];

    if (v10)
    {
      if (!*(void *)(a1 + 40))
      {
        ((void (**)(void, uint64_t, __CFString *))v9)[2](v9, 2, @"The 'date' parameter must be non-nil.");
LABEL_18:

        if (v8) {
          v8[2](v8);
        }

        goto LABEL_21;
      }
      if (!*(void *)(a1 + 64))
      {
        uint64_t v23 = *(void *)(a1 + 48);
        if (v23) {
          (*(void (**)(uint64_t, void, void))(v23 + 16))(v23, MEMORY[0x1E4F1CBF0], 0);
        }
        goto LABEL_18;
      }
      uint64_t v15 = objc_opt_new();
      __int16 v16 = [v5 evaluationHistoryDatabase];
      uint64_t v17 = *(void *)(a1 + 40);
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __101__TRIXPCStatusRequestHandler_evaluationHistoryRecordsForMLRuntimeWithLimit_newerThanDate_completion___block_invoke_4;
      v24[3] = &unk_1E6BBE448;
      id v18 = v15;
      uint64_t v19 = *(void *)(a1 + 64);
      id v25 = v18;
      uint64_t v26 = v19;
      LOBYTE(v17) = [v16 enumerateRecordsNewerThanDate:v17 block:v24];

      if (v17)
      {
        uint64_t v20 = *(void *)(a1 + 48);
        if (v20) {
          (*(void (**)(uint64_t, id, void))(v20 + 16))(v20, v18, 0);
        }
      }
      else
      {
        ((void (**)(void, uint64_t, __CFString *))v9)[2](v9, 12, @"The database query failed.");
      }
    }
    else
    {
      id v18 = (id)[[NSString alloc] initWithFormat:@"The calling process is missing true-valued entitlement \"%@\".", v13];
      ((void (**)(void, uint64_t, id))v9)[2](v9, 3, v18);
    }

    goto LABEL_18;
  }
  uint64_t v21 = *(void *)(a1 + 48);
  if (v21)
  {
    id v22 = [MEMORY[0x1E4F28C58] errorWithDomain:@"TRIGeneralErrorDomain" code:12 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v21 + 16))(v21, 0, v22);
  }
LABEL_21:
}

uint64_t __101__TRIXPCStatusRequestHandler_evaluationHistoryRecordsForMLRuntimeWithLimit_newerThanDate_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __101__TRIXPCStatusRequestHandler_evaluationHistoryRecordsForMLRuntimeWithLimit_newerThanDate_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    id v5 = (objc_class *)MEMORY[0x1E4F28C58];
    id v6 = a3;
    id v7 = [v5 alloc];
    uint64_t v10 = *MEMORY[0x1E4F28568];
    v11[0] = v6;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    uint64_t v9 = (void *)[v7 initWithDomain:@"TRIGeneralErrorDomain" code:a2 userInfo:v8];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

unint64_t __101__TRIXPCStatusRequestHandler_evaluationHistoryRecordsForMLRuntimeWithLimit_newerThanDate_completion___block_invoke_4(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  [*(id *)(a1 + 32) addObject:a2];
  unint64_t result = [*(id *)(a1 + 32) count];
  if (result >= *(void *)(a1 + 40)) {
    *a3 = 1;
  }
  return result;
}

- (void)activeEvaluationsForBMLTWithCompletion:(id)a3
{
  id v4 = a3;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __69__TRIXPCStatusRequestHandler_activeEvaluationsForBMLTWithCompletion___block_invoke;
  v16[3] = &unk_1E6BB8F38;
  v16[4] = self;
  id v5 = (void (**)(void, void))MEMORY[0x1E016EA80](v16);
  v5[2](v5, 0);
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __69__TRIXPCStatusRequestHandler_activeEvaluationsForBMLTWithCompletion___block_invoke_117;
  __int16 v12 = &unk_1E6BB9458;
  id v14 = v4;
  id v15 = v5;
  uint64_t v13 = self;
  id v6 = v5;
  id v7 = v4;
  id v8 = (void *)MEMORY[0x1E016EA80](&v9);
  -[TRIXPCServerContextPromise addBlockToExecuteAfterPromiseFullfillment:](self->_promise, "addBlockToExecuteAfterPromiseFullfillment:", v8, v9, v10, v11, v12, v13);
}

void __69__TRIXPCStatusRequestHandler_activeEvaluationsForBMLTWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = TRILogCategory_Server();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(_DWORD *)(*(void *)(a1 + 32) + 36);
    id v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    id v8 = (void *)v7;
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = "end";
    v11[0] = 67109890;
    v11[1] = v5;
    if (!a2) {
      uint64_t v10 = "begin";
    }
    __int16 v12 = 2114;
    uint64_t v13 = v7;
    __int16 v14 = 2048;
    uint64_t v15 = v9;
    __int16 v16 = 2080;
    uint64_t v17 = v10;
    _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "(%d) %{public}@ %p: %s activeEvaluationsForBMLTWithCompletion:", (uint8_t *)v11, 0x26u);
  }
}

void __69__TRIXPCStatusRequestHandler_activeEvaluationsForBMLTWithCompletion___block_invoke_117(uint64_t a1, void *a2, void *a3)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v5 && v6)
  {
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __69__TRIXPCStatusRequestHandler_activeEvaluationsForBMLTWithCompletion___block_invoke_2;
    v41[3] = &unk_1E6BB8F60;
    id v42 = *(id *)(a1 + 48);
    id v8 = (void (**)(void))MEMORY[0x1E016EA80](v41);
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __69__TRIXPCStatusRequestHandler_activeEvaluationsForBMLTWithCompletion___block_invoke_3;
    v39[3] = &unk_1E6BB8FD8;
    id v40 = *(id *)(a1 + 40);
    uint64_t v9 = (void (**)(void, void, void))MEMORY[0x1E016EA80](v39);
    uint64_t v10 = (void *)MEMORY[0x1E4F93B28];
    uint64_t v11 = *(void *)(a1 + 32);
    __int16 v12 = TRILogCategory_Server();
    uint64_t v13 = *MEMORY[0x1E4FB0508];
    long long v14 = *(_OWORD *)(v11 + 32);
    *(_OWORD *)buf = *(_OWORD *)(v11 + 16);
    *(_OWORD *)&buf[16] = v14;
    LOBYTE(v10) = [v10 taskWithAuditToken:buf hasTrueBooleanEntitlement:v13 logHandle:v12];

    if (v10)
    {
      uint64_t v15 = objc_opt_new();
      __int16 v16 = [v5 experimentDatabase];
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __69__TRIXPCStatusRequestHandler_activeEvaluationsForBMLTWithCompletion___block_invoke_4;
      v37[3] = &unk_1E6BB8D40;
      id v17 = v15;
      id v38 = v17;
      char v18 = [v16 enumerateActiveExperimentRecordsWithVisibility:2 block:v37];

      if (v18)
      {
        uint64_t v19 = [v5 bmltDatabase];
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __69__TRIXPCStatusRequestHandler_activeEvaluationsForBMLTWithCompletion___block_invoke_122;
        v35[3] = &unk_1E6BBE498;
        id v34 = v17;
        id v36 = v34;
        char v20 = [v19 enumerateActiveTasksWithBlock:v35];

        if (v20)
        {
          uint64_t v21 = TRILogCategory_Server();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            id v22 = (objc_class *)objc_opt_class();
            uint64_t v23 = NSStringFromClass(v22);
            uint64_t v24 = *(void *)(a1 + 32);
            *(_DWORD *)buf = 138543874;
            *(void *)&buf[4] = v23;
            *(_WORD *)&buf[12] = 2048;
            *(void *)&buf[14] = v24;
            *(_WORD *)&buf[22] = 2114;
            *(void *)&buf[24] = v34;
            _os_log_impl(&dword_1DA291000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ %p: activeEvaluationsForBMLTWithCompletion: -> %{public}@", buf, 0x20u);
          }
          uint64_t v32 = objc_msgSend(MEMORY[0x1E4FB05A8], "metricWithName:integerValue:", @"bmlt_enumerated", objc_msgSend(v34, "count"));
          id v33 = [v5 client];
          id v25 = [v33 logger];
          uint64_t v26 = [v5 client];
          uint64_t v27 = [v26 trackingId];
          int v43 = v32;
          id v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
          [v25 logWithTrackingId:v27 metrics:v28 dimensions:0 trialSystemTelemetry:0];

          uint64_t v29 = *(void *)(a1 + 40);
          if (v29) {
            (*(void (**)(uint64_t, id, void))(v29 + 16))(v29, v34, 0);
          }
        }
        else
        {
          ((void (**)(void, uint64_t, __CFString *))v9)[2](v9, 12, @"The BMLT database query for active BMLTs failed.");
        }
      }
      else
      {
        ((void (**)(void, uint64_t, __CFString *))v9)[2](v9, 12, @"The experiment database query for BMLT failed.");
      }
    }
    else
    {
      id v17 = (id)[[NSString alloc] initWithFormat:@"The calling process is missing true-valued entitlement \"%@\".", v13];
      ((void (**)(void, uint64_t, id))v9)[2](v9, 3, v17);
    }

    if (v8) {
      v8[2](v8);
    }
  }
  else
  {
    uint64_t v30 = *(void *)(a1 + 40);
    if (v30)
    {
      id v31 = [MEMORY[0x1E4F28C58] errorWithDomain:@"TRIGeneralErrorDomain" code:12 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v30 + 16))(v30, 0, v31);
    }
  }
}

uint64_t __69__TRIXPCStatusRequestHandler_activeEvaluationsForBMLTWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __69__TRIXPCStatusRequestHandler_activeEvaluationsForBMLTWithCompletion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    id v5 = (objc_class *)MEMORY[0x1E4F28C58];
    id v6 = a3;
    id v7 = [v5 alloc];
    uint64_t v10 = *MEMORY[0x1E4F28568];
    v11[0] = v6;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    uint64_t v9 = (void *)[v7 initWithDomain:@"TRIGeneralErrorDomain" code:a2 userInfo:v8];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __69__TRIXPCStatusRequestHandler_activeEvaluationsForBMLTWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 artifact];
  id v5 = [v4 experiment];

  if (!v5 || ([v5 hasShadowEvaluation] & 1) == 0)
  {
    uint64_t v9 = TRILogCategory_Server();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    id v22 = [v3 experimentDeployment];
    uint64_t v23 = [v22 shortDesc];
    int v24 = 138543362;
    id v25 = v23;
    _os_log_error_impl(&dword_1DA291000, v9, OS_LOG_TYPE_ERROR, "Experiment deployment %{public}@ is marked as shadow but has no shadowEvaluation.", (uint8_t *)&v24, 0xCu);
    goto LABEL_12;
  }
  id v6 = [v5 shadowEvaluation];
  char v7 = [v6 hasClientBackgroundMlTask];

  if ((v7 & 1) == 0)
  {
    uint64_t v9 = TRILogCategory_Server();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_8;
    }
    id v22 = [v3 experimentDeployment];
    uint64_t v23 = [v22 shortDesc];
    int v24 = 138543362;
    id v25 = v23;
    _os_log_impl(&dword_1DA291000, v9, OS_LOG_TYPE_DEFAULT, "Experiment deployment %{public}@ is marked as shadow but it does not have ClientBackgroundMLTask.", (uint8_t *)&v24, 0xCu);
LABEL_12:

LABEL_13:
    goto LABEL_8;
  }
  id v8 = [v5 shadowEvaluation];
  uint64_t v9 = [v8 clientBackgroundMlTask];

  if ([v9 hasEndDate])
  {
    uint64_t v10 = [v9 endDate];
    uint64_t v11 = [v10 date];
    __int16 v12 = objc_opt_new();
    uint64_t v13 = [v11 compare:v12];

    if (v13 == -1)
    {
      id v22 = TRILogCategory_Server();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        int v24 = 138543362;
        id v25 = v9;
        _os_log_impl(&dword_1DA291000, v22, OS_LOG_TYPE_DEFAULT, "Hybrid-BMLT %{public}@ ended and will not be exposed to MLRuntime", (uint8_t *)&v24, 0xCu);
      }
      goto LABEL_13;
    }
  }
  id v14 = objc_alloc(MEMORY[0x1E4FB0100]);
  uint64_t v15 = [v3 experimentDeployment];
  __int16 v16 = [v3 treatmentId];
  id v17 = (void *)[v14 initWithDeployment:v15 treatmentId:v16];

  id v18 = objc_alloc(MEMORY[0x1E4FB0070]);
  uint64_t v19 = [v5 shadowEvaluation];
  char v20 = [v19 clientBackgroundMlTask];
  uint64_t v21 = (void *)[v18 initWithBmlt:v20 factorsState:v17];

  [*(id *)(a1 + 32) addObject:v21];
LABEL_8:
}

void __69__TRIXPCStatusRequestHandler_activeEvaluationsForBMLTWithCompletion___block_invoke_122(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 isExpired])
  {
    id v4 = TRILogCategory_Server();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [v3 bmltDeployment];
      id v6 = [v3 endDate];
      int v13 = 138543618;
      id v14 = v5;
      __int16 v15 = 2114;
      __int16 v16 = v6;
      _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "BMLT deployment %{public}@ ended %{public}@ and will not be exposed to MLRuntime", (uint8_t *)&v13, 0x16u);
    }
  }
  else
  {
    char v7 = [v3 artifact];
    id v8 = [v7 backgroundTask];

    id v9 = objc_alloc(MEMORY[0x1E4FB0080]);
    uint64_t v10 = [v3 bmltDeployment];
    uint64_t v11 = (void *)[v9 initWithDeployment:v10];

    __int16 v12 = (void *)[objc_alloc(MEMORY[0x1E4FB0070]) initWithBmlt:v8 factorsState:v11];
    [*(id *)(a1 + 32) addObject:v12];
  }
}

- (void)bmltRecordsWithCompletion:(id)a3
{
  id v4 = a3;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __56__TRIXPCStatusRequestHandler_bmltRecordsWithCompletion___block_invoke;
  v16[3] = &unk_1E6BB8F38;
  v16[4] = self;
  id v5 = (void (**)(void, void))MEMORY[0x1E016EA80](v16);
  v5[2](v5, 0);
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __56__TRIXPCStatusRequestHandler_bmltRecordsWithCompletion___block_invoke_129;
  __int16 v12 = &unk_1E6BB9458;
  id v14 = v4;
  id v15 = v5;
  int v13 = self;
  id v6 = v5;
  id v7 = v4;
  id v8 = (void *)MEMORY[0x1E016EA80](&v9);
  -[TRIXPCServerContextPromise addBlockToExecuteAfterPromiseFullfillment:](self->_promise, "addBlockToExecuteAfterPromiseFullfillment:", v8, v9, v10, v11, v12, v13);
}

void __56__TRIXPCStatusRequestHandler_bmltRecordsWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = TRILogCategory_Server();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(_DWORD *)(*(void *)(a1 + 32) + 36);
    id v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    id v8 = (void *)v7;
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = "end";
    v11[0] = 67109890;
    v11[1] = v5;
    if (!a2) {
      uint64_t v10 = "begin";
    }
    __int16 v12 = 2114;
    uint64_t v13 = v7;
    __int16 v14 = 2048;
    uint64_t v15 = v9;
    __int16 v16 = 2080;
    uint64_t v17 = v10;
    _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "(%d) %{public}@ %p: %s bmltRecordsWithCompletion:", (uint8_t *)v11, 0x26u);
  }
}

void __56__TRIXPCStatusRequestHandler_bmltRecordsWithCompletion___block_invoke_129(uint64_t a1, void *a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v5 && v6)
  {
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __56__TRIXPCStatusRequestHandler_bmltRecordsWithCompletion___block_invoke_2;
    v34[3] = &unk_1E6BB8F60;
    id v35 = *(id *)(a1 + 48);
    id v8 = (void (**)(void))MEMORY[0x1E016EA80](v34);
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __56__TRIXPCStatusRequestHandler_bmltRecordsWithCompletion___block_invoke_3;
    v32[3] = &unk_1E6BB8FD8;
    id v33 = *(id *)(a1 + 40);
    uint64_t v9 = (void (**)(void, void, void))MEMORY[0x1E016EA80](v32);
    uint64_t v10 = *MEMORY[0x1E4FB04D8];
    uint64_t v11 = *(void *)(a1 + 32);
    long long v12 = *(_OWORD *)(v11 + 32);
    *(_OWORD *)buf = *(_OWORD *)(v11 + 16);
    *(_OWORD *)&buf[16] = v12;
    uint64_t v13 = [MEMORY[0x1E4FB00E0] objectForEntitlement:v10 withAuditToken:buf];
    if (v13)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        __int16 v14 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v13];
        if ([v14 containsObject:&unk_1F347BB88])
        {
          uint64_t v15 = objc_opt_new();
          __int16 v16 = [v5 bmltDatabase];
          v30[0] = MEMORY[0x1E4F143A8];
          v30[1] = 3221225472;
          v30[2] = __56__TRIXPCStatusRequestHandler_bmltRecordsWithCompletion___block_invoke_130;
          v30[3] = &unk_1E6BBE498;
          id v17 = v15;
          id v31 = v17;
          char v18 = [v16 enumerateTaskRecordsWithBlock:v30];

          if (v18)
          {
            uint64_t v19 = *(void *)(a1 + 40);
            if (v19) {
              (*(void (**)(uint64_t, id, void))(v19 + 16))(v19, v17, 0);
            }
          }
          else
          {
            ((void (**)(void, uint64_t, __CFString *))v9)[2](v9, 12, @"The database query failed.");
          }
          uint64_t v26 = v31;
        }
        else
        {
          int v24 = TRIDeploymentEnvironment_EnumDescriptor();
          id v17 = [v24 textFormatNameForValue:0];

          id v25 = TRILogCategory_Server();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            int v29 = *(_DWORD *)(*(void *)(a1 + 32) + 36);
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)&buf[4] = v29;
            *(_WORD *)&buf[8] = 2112;
            *(void *)&buf[10] = v17;
            _os_log_error_impl(&dword_1DA291000, v25, OS_LOG_TYPE_ERROR, "bmltRecordsWithCompletion: the calling process (pid %d) is not entitled for access to deployment environment %@.", buf, 0x12u);
          }

          uint64_t v26 = (void *)[[NSString alloc] initWithFormat:@"The calling process is not entitled for access to deployment environments %@.", v17];
          ((void (**)(void, uint64_t, void *))v9)[2](v9, 3, v26);
        }
      }
      else
      {
        uint64_t v23 = TRILogCategory_Server();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          int v28 = *(_DWORD *)(*(void *)(a1 + 32) + 36);
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&buf[4] = v28;
          *(_WORD *)&buf[8] = 2114;
          *(void *)&buf[10] = v10;
          _os_log_error_impl(&dword_1DA291000, v23, OS_LOG_TYPE_ERROR, "bmltRecordsWithCompletion: the calling process (pid %d) has ill-typed value for entitlement \"%{public}@\" (expected array).", buf, 0x12u);
        }

        __int16 v14 = (void *)[[NSString alloc] initWithFormat:@"The calling process has a value for entitlement \"%@\" which is not array-valued.", v10];
        ((void (**)(void, uint64_t, void *))v9)[2](v9, 3, v14);
      }
    }
    else
    {
      id v22 = TRILogCategory_Server();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        int v27 = *(_DWORD *)(*(void *)(a1 + 32) + 36);
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&buf[4] = v27;
        *(_WORD *)&buf[8] = 2114;
        *(void *)&buf[10] = v10;
        _os_log_error_impl(&dword_1DA291000, v22, OS_LOG_TYPE_ERROR, "bmltRecordsWithCompletion: the calling process (pid %d) is missing entitlement \"%{public}@\".", buf, 0x12u);
      }

      __int16 v14 = (void *)[[NSString alloc] initWithFormat:@"The calling process is missing entitlement \"%@\".", v10];
      ((void (**)(void, uint64_t, void *))v9)[2](v9, 3, v14);
    }

    if (v8) {
      v8[2](v8);
    }
  }
  else
  {
    uint64_t v20 = *(void *)(a1 + 40);
    if (v20)
    {
      uint64_t v21 = [MEMORY[0x1E4F28C58] errorWithDomain:@"TRIGeneralErrorDomain" code:12 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v20 + 16))(v20, 0, v21);
    }
  }
}

uint64_t __56__TRIXPCStatusRequestHandler_bmltRecordsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __56__TRIXPCStatusRequestHandler_bmltRecordsWithCompletion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    id v5 = (objc_class *)MEMORY[0x1E4F28C58];
    id v6 = a3;
    id v7 = [v5 alloc];
    uint64_t v10 = *MEMORY[0x1E4F28568];
    v11[0] = v6;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    uint64_t v9 = (void *)[v7 initWithDomain:@"TRIGeneralErrorDomain" code:a2 userInfo:v8];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __56__TRIXPCStatusRequestHandler_bmltRecordsWithCompletion___block_invoke_130(uint64_t a1, void *a2)
{
  id v20 = a2;
  v2 = [v20 artifact];
  id v3 = [v2 backgroundTask];
  id v4 = [v3 selectedNamespace];
  if (v4)
  {
    id v5 = [v20 artifact];
    id v6 = [v5 backgroundTask];
    id v7 = [v6 selectedNamespace];
    id v8 = [v7 name];
  }
  else
  {
    id v8 = 0;
  }

  id v9 = objc_alloc(MEMORY[0x1E4FB01F0]);
  uint64_t v10 = [v20 bmltDeployment];
  uint64_t v11 = [v20 pluginId];
  long long v12 = [v20 activeFactorPackSetId];
  uint64_t v13 = [v20 activeTargetingRuleIndex];
  __int16 v14 = [v20 targetedFactorPackSetId];
  uint64_t v15 = [v20 targetedTargetingRuleIndex];
  uint64_t v16 = [v20 status];
  id v17 = [v20 endDate];
  char v18 = (void *)[v9 initWithBmltDeployment:v10 pluginId:v11 activeFactorPackSetId:v12 activeTargetingRuleIndex:v13 targetedFactorPackSetId:v14 targetedTargetingRuleIndex:v15 status:v16 endDate:v17 namespace:v8];

  [*(id *)(a1 + 32) addObject:v18];
}

void __59__TRIXPCStatusRequestHandler_rolloutRecordsWithCompletion___block_invoke_132(uint64_t a1, void *a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5 && v6)
  {
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __59__TRIXPCStatusRequestHandler_rolloutRecordsWithCompletion___block_invoke_2;
    v34[3] = &unk_1E6BB8F60;
    id v35 = *(id *)(a1 + 48);
    id v8 = (void (**)(void))MEMORY[0x1E016EA80](v34);
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __59__TRIXPCStatusRequestHandler_rolloutRecordsWithCompletion___block_invoke_3;
    v32[3] = &unk_1E6BB8FD8;
    id v33 = *(id *)(a1 + 40);
    id v9 = (void (**)(void, void, void))MEMORY[0x1E016EA80](v32);
    uint64_t v10 = *MEMORY[0x1E4FB04D8];
    uint64_t v11 = *(void *)(a1 + 32);
    long long v12 = *(_OWORD *)(v11 + 32);
    *(_OWORD *)buf = *(_OWORD *)(v11 + 16);
    *(_OWORD *)&buf[16] = v12;
    uint64_t v13 = [MEMORY[0x1E4FB00E0] objectForEntitlement:v10 withAuditToken:buf];
    if (v13)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        __int16 v14 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v13];
        if ([v14 containsObject:&unk_1F347BB88])
        {
          uint64_t v15 = objc_opt_new();
          uint64_t v16 = [v5 rolloutDatabase];
          v30[0] = MEMORY[0x1E4F143A8];
          v30[1] = 3221225472;
          v30[2] = __59__TRIXPCStatusRequestHandler_rolloutRecordsWithCompletion___block_invoke_133;
          v30[3] = &unk_1E6BB8D18;
          id v17 = v15;
          id v31 = v17;
          char v18 = [v16 enumerateRecordsUsingTransaction:0 block:v30];

          if (v18)
          {
            uint64_t v19 = *(void *)(a1 + 40);
            if (v19) {
              (*(void (**)(uint64_t, id, void))(v19 + 16))(v19, v17, 0);
            }
          }
          else
          {
            ((void (**)(void, uint64_t, __CFString *))v9)[2](v9, 12, @"The database query failed.");
          }
          uint64_t v26 = v31;
        }
        else
        {
          int v24 = TRIDeploymentEnvironment_EnumDescriptor();
          id v17 = [v24 textFormatNameForValue:0];

          id v25 = TRILogCategory_Server();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            int v29 = *(_DWORD *)(*(void *)(a1 + 32) + 36);
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)&buf[4] = v29;
            *(_WORD *)&buf[8] = 2112;
            *(void *)&buf[10] = v17;
            _os_log_error_impl(&dword_1DA291000, v25, OS_LOG_TYPE_ERROR, "rolloutRecordsWithCompletion: the calling process (pid %d) is not entitled for access to deployment environment %@.", buf, 0x12u);
          }

          uint64_t v26 = (void *)[[NSString alloc] initWithFormat:@"The calling process is not entitled for access to deployment environments %@.", v17];
          ((void (**)(void, uint64_t, void *))v9)[2](v9, 3, v26);
        }
      }
      else
      {
        uint64_t v23 = TRILogCategory_Server();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          int v28 = *(_DWORD *)(*(void *)(a1 + 32) + 36);
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&buf[4] = v28;
          *(_WORD *)&buf[8] = 2114;
          *(void *)&buf[10] = v10;
          _os_log_error_impl(&dword_1DA291000, v23, OS_LOG_TYPE_ERROR, "rolloutRecordsWithCompletion: the calling process (pid %d) has ill-typed value for entitlement \"%{public}@\" (expected array).", buf, 0x12u);
        }

        __int16 v14 = (void *)[[NSString alloc] initWithFormat:@"The calling process has a value for entitlement \"%@\" which is not array-valued.", v10];
        ((void (**)(void, uint64_t, void *))v9)[2](v9, 3, v14);
      }
    }
    else
    {
      id v22 = TRILogCategory_Server();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        int v27 = *(_DWORD *)(*(void *)(a1 + 32) + 36);
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&buf[4] = v27;
        *(_WORD *)&buf[8] = 2114;
        *(void *)&buf[10] = v10;
        _os_log_error_impl(&dword_1DA291000, v22, OS_LOG_TYPE_ERROR, "rolloutRecordsWithCompletion: the calling process (pid %d) is missing entitlement \"%{public}@\".", buf, 0x12u);
      }

      __int16 v14 = (void *)[[NSString alloc] initWithFormat:@"The calling process is missing entitlement \"%@\".", v10];
      ((void (**)(void, uint64_t, void *))v9)[2](v9, 3, v14);
    }

    if (v8) {
      v8[2](v8);
    }
  }
  else
  {
    uint64_t v20 = *(void *)(a1 + 40);
    if (v20)
    {
      uint64_t v21 = [MEMORY[0x1E4F28C58] errorWithDomain:@"TRIGeneralErrorDomain" code:12 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v20 + 16))(v20, 0, v21);
    }
  }
}

uint64_t __59__TRIXPCStatusRequestHandler_rolloutRecordsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __59__TRIXPCStatusRequestHandler_rolloutRecordsWithCompletion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    id v5 = (objc_class *)MEMORY[0x1E4F28C58];
    id v6 = a3;
    id v7 = [v5 alloc];
    uint64_t v10 = *MEMORY[0x1E4F28568];
    v11[0] = v6;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    id v9 = (void *)[v7 initWithDomain:@"TRIGeneralErrorDomain" code:a2 userInfo:v8];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __59__TRIXPCStatusRequestHandler_rolloutRecordsWithCompletion___block_invoke_133(uint64_t a1, uint64_t a2)
{
  id v3 = [MEMORY[0x1E4FB0200] partialRecordWithFullRecord:a2];
  [*(id *)(a1 + 32) addObject:v3];
}

void __88__TRIXPCStatusRequestHandler_rolloutAllocationStatusWithPrivacyFilterPolicy_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a3)
  {
    id v6 = objc_alloc(MEMORY[0x1E4FB00C8]);
    id v7 = [MEMORY[0x1E4FB0240] sharedSystemPaths];
    id v8 = (void *)[v6 initWithPaths:v7 factorsState:0];

    id v33 = [MEMORY[0x1E4F1CA48] array];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v30 = v5;
    id obj = v5;
    uint64_t v9 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
    if (!v9) {
      goto LABEL_23;
    }
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v43;
    uint64_t v31 = *(void *)v43;
    while (1)
    {
      uint64_t v12 = 0;
      uint64_t v32 = v10;
      do
      {
        if (*(void *)v43 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v42 + 1) + 8 * v12);
        __int16 v14 = objc_msgSend(v13, "activeFactorPackSetId", v30);

        if (v14)
        {
          uint64_t v37 = v12;
          uint64_t v15 = objc_opt_new();
          long long v38 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          id v36 = v13;
          uint64_t v16 = [v13 namespaces];
          uint64_t v17 = [v16 countByEnumeratingWithState:&v38 objects:v46 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v19 = *(void *)v39;
            int v20 = 1;
            do
            {
              for (uint64_t i = 0; i != v18; ++i)
              {
                if (*(void *)v39 != v19) {
                  objc_enumerationMutation(v16);
                }
                uint64_t v22 = *(void *)(*((void *)&v38 + 1) + 8 * i);
                v20 &= [MEMORY[0x1E4FB01B8] shouldPrivacyFilterNamespace:v22 policy:*(unsigned __int8 *)(a1 + 40)] ^ 1;
                uint64_t v23 = [v8 factorPackIdForRolloutWithNamespaceName:v22];
                [v15 setObject:v23 forKeyedSubscript:v22];
              }
              uint64_t v18 = [v16 countByEnumeratingWithState:&v38 objects:v46 count:16];
            }
            while (v18);

            uint64_t v11 = v31;
            uint64_t v10 = v32;
            if ((v20 & 1) == 0) {
              goto LABEL_20;
            }
          }
          else
          {
          }
          id v35 = objc_alloc(MEMORY[0x1E4FB0220]);
          int v24 = [v36 deployment];
          id v25 = [v24 rolloutId];
          uint64_t v26 = [v36 deployment];
          uint64_t v27 = [v26 deploymentId];
          int v28 = [v36 rampId];
          int v29 = (void *)[v35 initWithRolloutId:v25 deploymentId:v27 rampId:v28 factorPackIds:v15];
          [v33 addObject:v29];

LABEL_20:
          uint64_t v12 = v37;
        }
        ++v12;
      }
      while (v12 != v10);
      uint64_t v10 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
      if (!v10)
      {
LABEL_23:

        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
        id v5 = v30;
        goto LABEL_24;
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_24:
}

@end