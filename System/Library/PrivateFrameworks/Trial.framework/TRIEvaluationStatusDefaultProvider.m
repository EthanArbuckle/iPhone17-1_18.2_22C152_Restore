@interface TRIEvaluationStatusDefaultProvider
- (BOOL)enumerateActiveBMLTWithError:(id *)a3 block:(id)a4;
- (BOOL)enumerateActiveEvaluationsForMLRuntimeWithError:(id *)a3 block:(id)a4;
- (TRIEvaluationStatusDefaultProvider)init;
- (id)enumerateStatusOfEvaluationsForMLRuntimeWithCursor:(id)a3 error:(id *)a4 block:(id)a5;
- (id)syncProxyWithErrorHandler:(id)a3;
@end

@implementation TRIEvaluationStatusDefaultProvider

- (TRIEvaluationStatusDefaultProvider)init
{
  v21.receiver = self;
  v21.super_class = (Class)TRIEvaluationStatusDefaultProvider;
  v2 = [(TRIEvaluationStatusDefaultProvider *)&v21 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEFE1190];
    v4 = (void *)MEMORY[0x19F3AD060]();
    id v5 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v6 = objc_opt_class();
    v7 = objc_msgSend(v5, "initWithObjects:", v6, objc_opt_class(), 0);
    [v3 setClasses:v7 forSelector:sel_activeEvaluationsForMLRuntimeWithCompletion_ argumentIndex:0 ofReply:1];

    v8 = (void *)MEMORY[0x19F3AD060]();
    id v9 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v10 = objc_opt_class();
    v11 = objc_msgSend(v9, "initWithObjects:", v10, objc_opt_class(), 0);
    [v3 setClasses:v11 forSelector:sel_activeEvaluationsForBMLTWithCompletion_ argumentIndex:0 ofReply:1];

    v12 = (void *)MEMORY[0x19F3AD060]();
    id v13 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v14 = objc_opt_class();
    v15 = objc_msgSend(v13, "initWithObjects:", v14, objc_opt_class(), 0);
    [v3 setClasses:v15 forSelector:sel_evaluationHistoryRecordsForMLRuntimeWithLimit_newerThanDate_completion_ argumentIndex:0 ofReply:1];

    id v16 = objc_alloc(MEMORY[0x1E4F93BC0]);
    v17 = TRILogCategory_ClientFramework();
    uint64_t v18 = [v16 initWithServiceName:@"com.apple.trial.status" allowlistedServerInterface:v3 allowlistedClientInterface:0 serverInitiatedRequestHandler:0 allowSystemToUserConnection:1 interruptionHandler:&__block_literal_global_0 invalidationHandler:&__block_literal_global_85 logHandle:v17];
    clientHelper = v2->_clientHelper;
    v2->_clientHelper = (_PASXPCClientHelper *)v18;
  }
  return v2;
}

- (id)syncProxyWithErrorHandler:(id)a3
{
  return (id)[(_PASXPCClientHelper *)self->_clientHelper synchronousRemoteObjectProxyWithErrorHandler:a3];
}

- (BOOL)enumerateActiveBMLTWithError:(id *)a3 block:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  v7 = (void (**)(id, void *, void *, unsigned char *))a4;
  if (!v7)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"TRIEvaluationStatusProvider.m", 135, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  if (+[TRIMisc unsafeFirstAuthenticationState])
  {
    *(void *)buf = 0;
    v44 = buf;
    uint64_t v45 = 0x3032000000;
    v46 = __Block_byref_object_copy__0;
    v47 = __Block_byref_object_dispose__0;
    id v48 = 0;
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __73__TRIEvaluationStatusDefaultProvider_enumerateActiveBMLTWithError_block___block_invoke;
    v42[3] = &unk_1E5969FC0;
    v42[4] = buf;
    v8 = (void *)MEMORY[0x19F3AD290](v42);
    id v9 = [(_PASXPCClientHelper *)self->_clientHelper synchronousRemoteObjectProxyWithErrorHandler:v8];
    uint64_t v36 = 0;
    v37 = &v36;
    uint64_t v38 = 0x3032000000;
    v39 = __Block_byref_object_copy__0;
    v40 = __Block_byref_object_dispose__0;
    id v41 = 0;
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__0;
    v34 = __Block_byref_object_dispose__0;
    id v35 = 0;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __73__TRIEvaluationStatusDefaultProvider_enumerateActiveBMLTWithError_block___block_invoke_2;
    v29[3] = &unk_1E596A150;
    v29[4] = &v30;
    v29[5] = &v36;
    [v9 activeEvaluationsForBMLTWithCompletion:v29];
    uint64_t v10 = (void *)*((void *)v44 + 5);
    if (v10)
    {
      if (a3)
      {
        id v11 = v10;
LABEL_7:
        BOOL v12 = 0;
        *a3 = v11;
LABEL_26:
        _Block_object_dispose(&v30, 8);

        _Block_object_dispose(&v36, 8);
        _Block_object_dispose(buf, 8);

        goto LABEL_27;
      }
    }
    else
    {
      uint64_t v14 = (void *)v37[5];
      if (v14)
      {
        char v28 = 0;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v15 = v14;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v49 count:16];
        if (v16)
        {
          uint64_t v17 = *(void *)v25;
LABEL_15:
          uint64_t v18 = 0;
          while (1)
          {
            if (*(void *)v25 != v17) {
              objc_enumerationMutation(v15);
            }
            v19 = *(void **)(*((void *)&v24 + 1) + 8 * v18);
            v20 = [v19 bmlt];
            objc_super v21 = [v19 factorsState];
            v7[2](v7, v20, v21, &v28);

            if (v28) {
              break;
            }
            if (v16 == ++v18)
            {
              uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v49 count:16];
              if (v16) {
                goto LABEL_15;
              }
              break;
            }
          }
        }

        BOOL v12 = 1;
        goto LABEL_26;
      }
      if (a3)
      {
        id v11 = (id) v31[5];
        goto LABEL_7;
      }
    }
    BOOL v12 = 0;
    goto LABEL_26;
  }
  id v13 = TRILogCategory_ClientFramework();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_19D909000, v13, OS_LOG_TYPE_ERROR, "cannot enumerate evaluations before class C locked", buf, 2u);
  }

  if (a3)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"TRIGeneralErrorDomain" code:5 userInfo:0];
    BOOL v12 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v12 = 0;
  }
LABEL_27:

  return v12;
}

void __73__TRIEvaluationStatusDefaultProvider_enumerateActiveBMLTWithError_block___block_invoke(uint64_t a1, void *a2)
{
}

void __73__TRIEvaluationStatusDefaultProvider_enumerateActiveBMLTWithError_block___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v10)
  {
    uint64_t v6 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    v7 = v10;
  }
  else
  {
    uint64_t v6 = (void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    v7 = v5;
  }
  id v8 = v7;
  id v9 = *v6;
  *uint64_t v6 = v8;
}

- (BOOL)enumerateActiveEvaluationsForMLRuntimeWithError:(id *)a3 block:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  v7 = (void (**)(id, void *, void *, unsigned char *))a4;
  if (!v7)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"TRIEvaluationStatusProvider.m", 187, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  if (+[TRIMisc unsafeFirstAuthenticationState])
  {
    *(void *)buf = 0;
    v44 = buf;
    uint64_t v45 = 0x3032000000;
    v46 = __Block_byref_object_copy__0;
    v47 = __Block_byref_object_dispose__0;
    id v48 = 0;
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __92__TRIEvaluationStatusDefaultProvider_enumerateActiveEvaluationsForMLRuntimeWithError_block___block_invoke;
    v42[3] = &unk_1E5969FC0;
    v42[4] = buf;
    id v8 = (void *)MEMORY[0x19F3AD290](v42);
    id v9 = [(_PASXPCClientHelper *)self->_clientHelper synchronousRemoteObjectProxyWithErrorHandler:v8];
    uint64_t v36 = 0;
    v37 = &v36;
    uint64_t v38 = 0x3032000000;
    v39 = __Block_byref_object_copy__0;
    v40 = __Block_byref_object_dispose__0;
    id v41 = 0;
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__0;
    v34 = __Block_byref_object_dispose__0;
    id v35 = 0;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __92__TRIEvaluationStatusDefaultProvider_enumerateActiveEvaluationsForMLRuntimeWithError_block___block_invoke_2;
    v29[3] = &unk_1E596A150;
    v29[4] = &v30;
    v29[5] = &v36;
    [v9 activeEvaluationsForMLRuntimeWithCompletion:v29];
    id v10 = (void *)*((void *)v44 + 5);
    if (v10)
    {
      if (a3)
      {
        id v11 = v10;
LABEL_7:
        BOOL v12 = 0;
        *a3 = v11;
LABEL_26:
        _Block_object_dispose(&v30, 8);

        _Block_object_dispose(&v36, 8);
        _Block_object_dispose(buf, 8);

        goto LABEL_27;
      }
    }
    else
    {
      uint64_t v14 = (void *)v37[5];
      if (v14)
      {
        char v28 = 0;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v15 = v14;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v49 count:16];
        if (v16)
        {
          uint64_t v17 = *(void *)v25;
LABEL_15:
          uint64_t v18 = 0;
          while (1)
          {
            if (*(void *)v25 != v17) {
              objc_enumerationMutation(v15);
            }
            v19 = *(void **)(*((void *)&v24 + 1) + 8 * v18);
            v20 = [v19 eval];
            objc_super v21 = [v19 factorsState];
            v7[2](v7, v20, v21, &v28);

            if (v28) {
              break;
            }
            if (v16 == ++v18)
            {
              uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v49 count:16];
              if (v16) {
                goto LABEL_15;
              }
              break;
            }
          }
        }

        BOOL v12 = 1;
        goto LABEL_26;
      }
      if (a3)
      {
        id v11 = (id) v31[5];
        goto LABEL_7;
      }
    }
    BOOL v12 = 0;
    goto LABEL_26;
  }
  id v13 = TRILogCategory_ClientFramework();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_19D909000, v13, OS_LOG_TYPE_ERROR, "cannot enumerate evaluations before class C locked", buf, 2u);
  }

  if (a3)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"TRIGeneralErrorDomain" code:5 userInfo:0];
    BOOL v12 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v12 = 0;
  }
LABEL_27:

  return v12;
}

void __92__TRIEvaluationStatusDefaultProvider_enumerateActiveEvaluationsForMLRuntimeWithError_block___block_invoke(uint64_t a1, void *a2)
{
}

void __92__TRIEvaluationStatusDefaultProvider_enumerateActiveEvaluationsForMLRuntimeWithError_block___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v10)
  {
    uint64_t v6 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    v7 = v10;
  }
  else
  {
    uint64_t v6 = (void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    v7 = v5;
  }
  id v8 = v7;
  id v9 = *v6;
  *uint64_t v6 = v8;
}

- (id)enumerateStatusOfEvaluationsForMLRuntimeWithCursor:(id)a3 error:(id *)a4 block:(id)a5
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  id v8 = (void (**)(id, void *, void *, unsigned char *))a5;
  if (!v8)
  {
    long long v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"TRIEvaluationStatusProvider.m", 242, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x3032000000;
  v54 = __Block_byref_object_copy__0;
  v55 = __Block_byref_object_dispose__0;
  id v56 = 0;
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __101__TRIEvaluationStatusDefaultProvider_enumerateStatusOfEvaluationsForMLRuntimeWithCursor_error_block___block_invoke;
  v50[3] = &unk_1E5969FC0;
  v50[4] = &v51;
  v29 = (void *)MEMORY[0x19F3AD290](v50);
  uint64_t v30 = [(_PASXPCClientHelper *)self->_clientHelper synchronousRemoteObjectProxyWithErrorHandler:v29];
  if (v28) {
    [v28 date];
  }
  else {
  id v9 = [MEMORY[0x1E4F1C9C8] distantPast];
  }
  BOOL v10 = 0;
  while (!v10)
  {
    uint64_t v44 = 0;
    uint64_t v45 = &v44;
    uint64_t v46 = 0x3032000000;
    v47 = __Block_byref_object_copy__0;
    id v48 = __Block_byref_object_dispose__0;
    id v49 = 0;
    uint64_t v38 = 0;
    v39 = &v38;
    uint64_t v40 = 0x3032000000;
    id v41 = __Block_byref_object_copy__0;
    v42 = __Block_byref_object_dispose__0;
    id v43 = 0;
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __101__TRIEvaluationStatusDefaultProvider_enumerateStatusOfEvaluationsForMLRuntimeWithCursor_error_block___block_invoke_2;
    v37[3] = &unk_1E596A150;
    v37[4] = &v38;
    v37[5] = &v44;
    [v30 evaluationHistoryRecordsForMLRuntimeWithLimit:100 newerThanDate:v9 completion:v37];
    id v11 = (void *)v52[5];
    if (v11)
    {
      if (!a4) {
        goto LABEL_30;
      }
      id v12 = v11;
    }
    else
    {
      if (v45[5])
      {
        char v36 = 0;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id v14 = (id)v45[5];
        uint64_t v15 = [v14 countByEnumeratingWithState:&v32 objects:v57 count:16];
        if (v15)
        {
          uint64_t v16 = *(void *)v33;
LABEL_15:
          uint64_t v17 = 0;
          uint64_t v18 = v9;
          while (1)
          {
            if (*(void *)v33 != v16) {
              objc_enumerationMutation(v14);
            }
            v19 = *(void **)(*((void *)&v32 + 1) + 8 * v17);
            v20 = [v19 evaluation];
            objc_super v21 = [v19 status];
            v8[2](v8, v20, v21, &v36);

            v22 = [v19 status];
            id v9 = [v22 date];

            if (v36) {
              break;
            }
            ++v17;
            uint64_t v18 = v9;
            if (v15 == v17)
            {
              uint64_t v15 = [v14 countByEnumeratingWithState:&v32 objects:v57 count:16];
              if (v15) {
                goto LABEL_15;
              }
              break;
            }
          }
        }

        BOOL v10 = (unint64_t)[(id)v45[5] count] < 0x64 || v36 != 0;
        char v13 = 1;
        goto LABEL_31;
      }
      if (!a4)
      {
LABEL_30:
        BOOL v10 = 0;
        char v13 = 0;
        goto LABEL_31;
      }
      id v12 = (id) v39[5];
    }
    BOOL v10 = 0;
    char v13 = 0;
    *a4 = v12;
LABEL_31:
    _Block_object_dispose(&v38, 8);

    _Block_object_dispose(&v44, 8);
    if ((v13 & 1) == 0)
    {
      long long v24 = 0;
      goto LABEL_34;
    }
  }
  long long v25 = [TRIEvaluationStatusCursor alloc];
  [v9 timeIntervalSince1970];
  long long v24 = -[TRIEvaluationStatusCursor initWithSecondsFromEpoch:](v25, "initWithSecondsFromEpoch:");
LABEL_34:

  _Block_object_dispose(&v51, 8);
  return v24;
}

void __101__TRIEvaluationStatusDefaultProvider_enumerateStatusOfEvaluationsForMLRuntimeWithCursor_error_block___block_invoke(uint64_t a1, void *a2)
{
}

void __101__TRIEvaluationStatusDefaultProvider_enumerateStatusOfEvaluationsForMLRuntimeWithCursor_error_block___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v10)
  {
    uint64_t v6 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    v7 = v10;
  }
  else
  {
    uint64_t v6 = (void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    v7 = v5;
  }
  id v8 = v7;
  id v9 = *v6;
  *uint64_t v6 = v8;
}

- (void).cxx_destruct
{
}

@end