@interface SESRKESession
+ (id)newInstance;
- (BOOL)continueExecutingRKEFunction:(id)a3 action:(id)a4 arbitraryData:(id)a5 readerIdentifier:(id)a6 error:(id *)a7;
- (BOOL)isPassiveEntryAvailable:(id)a3 isAvailable:(BOOL *)a4 error:(id *)a5;
- (BOOL)sendPassthroughMessage:(id)a3 readerIdentifier:(id)a4 error:(id *)a5;
- (NSString)activeKeyIdentifier;
- (SESRKESessionContinuationDelegate)continuationDelegate;
- (SESRKESessionDelegate)delegate;
- (id)cancelRKEFunction:(id)a3 readerIdentifier:(id)a4;
- (id)getVehicleReports:(id *)a3;
- (id)sign:(id)a3 readerIdentifier:(id)a4 error:(id *)a5;
- (void)didCreateKey:(id)a3 forVehicle:(id)a4;
- (void)didEndUnexpectedly:(id)a3;
- (void)didInvalidateWithError:(id)a3;
- (void)didReceiveContinuationRequestFor:(id)a3 actionIdentifier:(id)a4 arbitraryData:(id)a5 fromVehicle:(id)a6;
- (void)didReceivePassthroughMessage:(id)a3 fromVehicle:(id)a4;
- (void)didStartSession:(id)a3;
- (void)sendEvent:(id)a3 fromVehicle:(id)a4;
- (void)sendRKEFunction:(id)a3 action:(id)a4 readerIdentifier:(id)a5 authorization:(id)a6 isEnduring:(BOOL)a7 isHandlingExternal:(BOOL)a8 completion:(id)a9;
- (void)setContinuationDelegate:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SESRKESession

+ (id)newInstance
{
  return (id)objc_opt_new();
}

- (BOOL)isPassiveEntryAvailable:(id)a3 isAvailable:(BOOL *)a4 error:(id *)a5
{
  id v8 = a3;
  if ([(SESSession *)self state] == 1)
  {
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x2020000000;
    char v23 = 0;
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__11;
    v18 = __Block_byref_object_dispose__11;
    id v19 = 0;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __59__SESRKESession_isPassiveEntryAvailable_isAvailable_error___block_invoke;
    v13[3] = &unk_2642194D8;
    v13[4] = &v14;
    v9 = [(SESSession *)self synchronousRemoteObjectProxyWithErrorHandler:v13];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __59__SESRKESession_isPassiveEntryAvailable_isAvailable_error___block_invoke_2;
    v12[3] = &unk_264219EB0;
    v12[4] = &v20;
    v12[5] = &v14;
    [v9 isPassiveEntryAvailable:v8 reply:v12];

    if (a4) {
      *a4 = *((unsigned char *)v21 + 24);
    }
    if (a5) {
      *a5 = (id) v15[5];
    }
    LOBYTE(a5) = v15[5] == 0;
    _Block_object_dispose(&v14, 8);

    _Block_object_dispose(&v20, 8);
  }
  else if (a5)
  {
    v10 = SESDefaultLogObject();
    SESCreateAndLogError();
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a5) = 0;
  }

  return (char)a5;
}

void __59__SESRKESession_isPassiveEntryAvailable_isAvailable_error___block_invoke(uint64_t a1, void *a2)
{
}

void __59__SESRKESession_isPassiveEntryAvailable_isAvailable_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (void)sendRKEFunction:(id)a3 action:(id)a4 readerIdentifier:(id)a5 authorization:(id)a6 isEnduring:(BOOL)a7 isHandlingExternal:(BOOL)a8 completion:(id)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a9;
  uint64_t v20 = SESDefaultLogObject();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67110402;
    *(_DWORD *)&buf[4] = [v15 unsignedIntValue];
    LOWORD(v30) = 1024;
    *(_DWORD *)((char *)&v30 + 2) = [v16 unsignedIntValue];
    HIWORD(v30) = 2112;
    uint64_t v31 = (uint64_t)v17;
    LOWORD(v32) = 1024;
    *(_DWORD *)((char *)&v32 + 2) = v18 != 0;
    HIWORD(v32) = 1024;
    LODWORD(v33) = v10;
    WORD2(v33) = 1024;
    *(_DWORD *)((char *)&v33 + 6) = v9;
    _os_log_impl(&dword_2146ED000, v20, OS_LOG_TYPE_INFO, "sendRKEFunction 0x%X rkeAction 0x%X readerIdentifier %@ authorization %d isEnduring %d isHandlingExternal %d", buf, 0x2Au);
  }

  if ([(SESSession *)self state] == 1)
  {
    *(void *)buf = 0;
    v30 = buf;
    uint64_t v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__11;
    *(void *)&long long v33 = __Block_byref_object_dispose__11;
    *((void *)&v33 + 1) = 0;
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __112__SESRKESession_sendRKEFunction_action_readerIdentifier_authorization_isEnduring_isHandlingExternal_completion___block_invoke;
    v26[3] = &unk_2642194D8;
    v26[4] = buf;
    v21 = [(SESSession *)self remoteObjectProxyWithErrorHandler:v26];
    objc_msgSend(v21, "sendRKEFunction:action:readerIdentifier:authorization:isEnduring:isHandlingExternal:completion:", objc_msgSend(v15, "unsignedShortValue"), objc_msgSend(v16, "unsignedCharValue"), v17, v18, v10, v9, v19);

    if (*((void *)v30 + 5))
    {
      uint64_t v22 = SESDefaultLogObject();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        uint64_t v23 = *((void *)v30 + 5);
        *(_DWORD *)v27 = 138412290;
        uint64_t v28 = v23;
        _os_log_impl(&dword_2146ED000, v22, OS_LOG_TYPE_ERROR, "%@", v27, 0xCu);
      }

      (*((void (**)(id, void, void))v19 + 2))(v19, 0, *((void *)v30 + 5));
    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    v24 = SESDefaultLogObject();
    v25 = SESCreateAndLogError();
    (*((void (**)(id, void, void *))v19 + 2))(v19, 0, v25);
  }
}

void __112__SESRKESession_sendRKEFunction_action_readerIdentifier_authorization_isEnduring_isHandlingExternal_completion___block_invoke(uint64_t a1, void *a2)
{
}

- (id)cancelRKEFunction:(id)a3 readerIdentifier:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = SESDefaultLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = [v6 unsignedIntValue];
    _os_log_impl(&dword_2146ED000, v8, OS_LOG_TYPE_INFO, "cancelRKEFunction 0x%X", buf, 8u);
  }

  if ([(SESSession *)self state] == 1)
  {
    *(void *)buf = 0;
    uint64_t v22 = buf;
    uint64_t v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__11;
    v25 = __Block_byref_object_dispose__11;
    id v26 = 0;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __52__SESRKESession_cancelRKEFunction_readerIdentifier___block_invoke;
    v18[3] = &unk_2642194D8;
    v18[4] = buf;
    BOOL v9 = [(SESSession *)self synchronousRemoteObjectProxyWithErrorHandler:v18];
    unsigned int v10 = [v6 unsignedShortValue];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __52__SESRKESession_cancelRKEFunction_readerIdentifier___block_invoke_2;
    v17[3] = &unk_2642194D8;
    v17[4] = buf;
    [v9 cancelRKEFunction:v10 readerIdentifier:v7 reply:v17];

    v11 = (void *)*((void *)v22 + 5);
    if (v11)
    {
      v12 = SESDefaultLogObject();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = *((void *)v22 + 5);
        *(_DWORD *)id v19 = 138412290;
        uint64_t v20 = v13;
        _os_log_impl(&dword_2146ED000, v12, OS_LOG_TYPE_ERROR, "%@", v19, 0xCu);
      }

      v11 = (void *)*((void *)v22 + 5);
    }
    id v14 = v11;
    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v15 = SESDefaultLogObject();
    SESCreateAndLogError();
    id v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v14;
}

void __52__SESRKESession_cancelRKEFunction_readerIdentifier___block_invoke(uint64_t a1, void *a2)
{
}

void __52__SESRKESession_cancelRKEFunction_readerIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
}

- (BOOL)continueExecutingRKEFunction:(id)a3 action:(id)a4 arbitraryData:(id)a5 readerIdentifier:(id)a6 error:(id *)a7
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = SESDefaultLogObject();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)&buf[4] = [v12 unsignedIntValue];
    LOWORD(v25) = 1024;
    *(_DWORD *)((char *)&v25 + 2) = [v13 unsignedIntValue];
    HIWORD(v25) = 1024;
    LODWORD(v26) = v14 != 0;
    WORD2(v26) = 2112;
    *(void *)((char *)&v26 + 6) = v15;
    _os_log_impl(&dword_2146ED000, v16, OS_LOG_TYPE_INFO, "continueExecutingRKEFunction 0x%X rkeAction 0x%X arbitraryData %d readerIdentifier %@", buf, 0x1Eu);
  }

  if ([(SESSession *)self state] == 1)
  {
    *(void *)buf = 0;
    v25 = buf;
    *(void *)&long long v26 = 0x3032000000;
    *((void *)&v26 + 1) = __Block_byref_object_copy__11;
    uint64_t v27 = __Block_byref_object_dispose__11;
    id v28 = 0;
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __90__SESRKESession_continueExecutingRKEFunction_action_arbitraryData_readerIdentifier_error___block_invoke;
    v23[3] = &unk_2642194D8;
    v23[4] = buf;
    id v17 = [(SESSession *)self synchronousRemoteObjectProxyWithErrorHandler:v23];
    unsigned int v18 = [v12 unsignedShortValue];
    unsigned int v19 = [v13 unsignedCharValue];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __90__SESRKESession_continueExecutingRKEFunction_action_arbitraryData_readerIdentifier_error___block_invoke_2;
    v22[3] = &unk_2642194D8;
    v22[4] = buf;
    [v17 continueExecutingRKEFunction:v18 action:v19 arbitraryData:v14 readerIdentifier:v15 reply:v22];

    if (a7) {
      *a7 = *((id *)v25 + 5);
    }
    LOBYTE(a7) = *((void *)v25 + 5) == 0;
    _Block_object_dispose(buf, 8);
  }
  else if (a7)
  {
    uint64_t v20 = SESDefaultLogObject();
    SESCreateAndLogError();
    *a7 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a7) = 0;
  }

  return (char)a7;
}

void __90__SESRKESession_continueExecutingRKEFunction_action_arbitraryData_readerIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
}

void __90__SESRKESession_continueExecutingRKEFunction_action_arbitraryData_readerIdentifier_error___block_invoke_2(uint64_t a1, void *a2)
{
}

- (BOOL)sendPassthroughMessage:(id)a3 readerIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  unsigned int v10 = SESDefaultLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2146ED000, v10, OS_LOG_TYPE_INFO, "sendPassthroughMessage", buf, 2u);
  }

  if ([(SESSession *)self state] == 1)
  {
    if ((unint64_t)[v8 length] < 0x10000)
    {
      *(void *)buf = 0;
      v21 = buf;
      uint64_t v22 = 0x3032000000;
      uint64_t v23 = __Block_byref_object_copy__11;
      v24 = __Block_byref_object_dispose__11;
      id v25 = 0;
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __63__SESRKESession_sendPassthroughMessage_readerIdentifier_error___block_invoke;
      v19[3] = &unk_2642194D8;
      uint8_t v19[4] = buf;
      id v13 = [(SESSession *)self synchronousRemoteObjectProxyWithErrorHandler:v19];
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __63__SESRKESession_sendPassthroughMessage_readerIdentifier_error___block_invoke_2;
      v18[3] = &unk_2642194D8;
      v18[4] = buf;
      [v13 sendPassthroughMessage:v8 readerIdentifier:v9 reply:v18];

      id v14 = v21;
      if (*((void *)v21 + 5))
      {
        id v15 = SESDefaultLogObject();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          uint64_t v16 = *((void *)v21 + 5);
          *(_DWORD *)long long v26 = 138412290;
          uint64_t v27 = v16;
          _os_log_impl(&dword_2146ED000, v15, OS_LOG_TYPE_ERROR, "%@", v26, 0xCu);
        }

        id v14 = v21;
      }
      if (a5)
      {
        *a5 = *((id *)v14 + 5);
        id v14 = v21;
      }
      LOBYTE(a5) = *((void *)v14 + 5) == 0;
      _Block_object_dispose(buf, 8);
    }
    else if (a5)
    {
      v11 = SESDefaultLogObject();
      [v8 length];
      SESCreateAndLogError();
      *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_9:
      LOBYTE(a5) = 0;
    }
  }
  else if (a5)
  {
    id v12 = SESDefaultLogObject();
    SESCreateAndLogError();
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }

  return (char)a5;
}

void __63__SESRKESession_sendPassthroughMessage_readerIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
}

void __63__SESRKESession_sendPassthroughMessage_readerIdentifier_error___block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)getVehicleReports:(id *)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v5 = SESDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2146ED000, v5, OS_LOG_TYPE_INFO, "getVehicleReports", buf, 2u);
  }

  if ([(SESSession *)self state] == 1)
  {
    *(void *)buf = 0;
    uint64_t v20 = buf;
    uint64_t v21 = 0x3032000000;
    uint64_t v22 = __Block_byref_object_copy__11;
    uint64_t v23 = __Block_byref_object_dispose__11;
    id v24 = 0;
    uint64_t v13 = 0;
    id v14 = &v13;
    uint64_t v15 = 0x3032000000;
    uint64_t v16 = __Block_byref_object_copy__11;
    id v17 = __Block_byref_object_dispose__11;
    id v18 = 0;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __35__SESRKESession_getVehicleReports___block_invoke;
    v12[3] = &unk_2642194D8;
    v12[4] = buf;
    id v6 = [(SESSession *)self synchronousRemoteObjectProxyWithErrorHandler:v12];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __35__SESRKESession_getVehicleReports___block_invoke_2;
    v11[3] = &unk_264219B88;
    v11[4] = &v13;
    v11[5] = buf;
    [v6 getVehicleReports:v11];

    if (*((void *)v20 + 5))
    {
      id v7 = SESDefaultLogObject();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        uint64_t v8 = *((void *)v20 + 5);
        *(_DWORD *)id v25 = 138412290;
        uint64_t v26 = v8;
        _os_log_impl(&dword_2146ED000, v7, OS_LOG_TYPE_ERROR, "%@", v25, 0xCu);
      }
    }
    if (a3) {
      *a3 = *((id *)v20 + 5);
    }
    a3 = (id *)(id)v14[5];
    _Block_object_dispose(&v13, 8);

    _Block_object_dispose(buf, 8);
  }
  else if (a3)
  {
    id v9 = SESDefaultLogObject();
    SESCreateAndLogError();
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    a3 = 0;
  }
  return a3;
}

void __35__SESRKESession_getVehicleReports___block_invoke(uint64_t a1, void *a2)
{
}

void __35__SESRKESession_getVehicleReports___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  unsigned int v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)sign:(id)a3 readerIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  unsigned int v10 = SESDefaultLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2146ED000, v10, OS_LOG_TYPE_INFO, "sign", buf, 2u);
  }

  if ([(SESSession *)self state] == 1)
  {
    id v11 = [v9 hexStringAsData];
    if (v11)
    {
      *(void *)buf = 0;
      uint64_t v27 = buf;
      uint64_t v28 = 0x3032000000;
      uint64_t v29 = __Block_byref_object_copy__11;
      v30 = __Block_byref_object_dispose__11;
      id v31 = 0;
      uint64_t v20 = 0;
      uint64_t v21 = &v20;
      uint64_t v22 = 0x3032000000;
      uint64_t v23 = __Block_byref_object_copy__11;
      id v24 = __Block_byref_object_dispose__11;
      id v25 = 0;
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __45__SESRKESession_sign_readerIdentifier_error___block_invoke;
      v19[3] = &unk_2642194D8;
      uint8_t v19[4] = buf;
      id v12 = [(SESSession *)self synchronousRemoteObjectProxyWithErrorHandler:v19];
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __45__SESRKESession_sign_readerIdentifier_error___block_invoke_2;
      v18[3] = &unk_264219ED8;
      v18[4] = &v20;
      void v18[5] = buf;
      [v12 sign:v8 readerIdentifier:v11 reply:v18];

      if (*((void *)v27 + 5))
      {
        uint64_t v13 = SESDefaultLogObject();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          uint64_t v14 = *((void *)v27 + 5);
          *(_DWORD *)v32 = 138412290;
          uint64_t v33 = v14;
          _os_log_impl(&dword_2146ED000, v13, OS_LOG_TYPE_ERROR, "%@", v32, 0xCu);
        }
      }
      if (a5) {
        *a5 = *((id *)v27 + 5);
      }
      id v15 = (id)v21[5];
      _Block_object_dispose(&v20, 8);

      _Block_object_dispose(buf, 8);
    }
    else
    {
      if (a5)
      {
        uint64_t v16 = SESDefaultLogObject();
        SESCreateAndLogError();
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      id v15 = 0;
    }
  }
  else
  {
    if (!a5)
    {
      id v15 = 0;
      goto LABEL_19;
    }
    id v11 = SESDefaultLogObject();
    SESCreateAndLogError();
    id v15 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_19:
  return v15;
}

void __45__SESRKESession_sign_readerIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
}

void __45__SESRKESession_sign_readerIdentifier_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  unsigned int v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (void)didStartSession:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SESRKESession;
  [(SESSession *)&v3 didStartSession:a3];
}

- (void)didEndUnexpectedly:(id)a3
{
  id v4 = a3;
  [(SESRKESession *)self didInvalidateWithError:v4];
  v5.receiver = self;
  v5.super_class = (Class)SESRKESession;
  [(SESSession *)&v5 didEndUnexpectedly:v4];
}

- (void)didInvalidateWithError:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(SESSession *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __40__SESRKESession_didInvalidateWithError___block_invoke;
  v7[3] = &unk_264219888;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __40__SESRKESession_didInvalidateWithError___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 sesSession:*(void *)(a1 + 32) didInvalidateWithError:*(void *)(a1 + 40)];
}

- (void)didCreateKey:(id)a3 forVehicle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SESSession *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__SESRKESession_didCreateKey_forVehicle___block_invoke;
  block[3] = &unk_264219F00;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __41__SESRKESession_didCreateKey_forVehicle___block_invoke(id *a1)
{
  id v5 = [a1[4] delegate];
  id v2 = a1[4];
  objc_super v3 = [a1[5] asHexString];
  id v4 = [a1[6] asHexString];
  [v5 sesSession:v2 didCreateKey:v3 forVehicle:v4];
}

- (void)sendEvent:(id)a3 fromVehicle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(SESSession *)self state] == 1)
  {
    id v8 = [(SESSession *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __39__SESRKESession_sendEvent_fromVehicle___block_invoke;
    block[3] = &unk_264219F00;
    block[4] = self;
    id v11 = v6;
    id v12 = v7;
    dispatch_async(v8, block);
  }
  else
  {
    id v9 = SESDefaultLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2146ED000, v9, OS_LOG_TYPE_INFO, "Dropping event while no active session", buf, 2u);
    }
  }
}

void __39__SESRKESession_sendEvent_fromVehicle___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) delegate];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 48) asHexString];
  [v5 sesSession:v2 event:v3 fromVehicle:v4];
}

- (void)didReceivePassthroughMessage:(id)a3 fromVehicle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(SESSession *)self state] == 1)
  {
    id v8 = [(SESSession *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __58__SESRKESession_didReceivePassthroughMessage_fromVehicle___block_invoke;
    block[3] = &unk_264219F00;
    block[4] = self;
    id v11 = v6;
    id v12 = v7;
    dispatch_async(v8, block);
  }
  else
  {
    id v9 = SESDefaultLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2146ED000, v9, OS_LOG_TYPE_INFO, "Dropping passthrough message while no active session", buf, 2u);
    }
  }
}

void __58__SESRKESession_didReceivePassthroughMessage_fromVehicle___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) delegate];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 48) asHexString];
  [v5 sesSession:v2 didReceivePassthroughMessage:v3 fromVehicle:v4];
}

- (void)didReceiveContinuationRequestFor:(id)a3 actionIdentifier:(id)a4 arbitraryData:(id)a5 fromVehicle:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([(SESSession *)self state] == 1)
  {
    uint64_t v14 = [(SESSession *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __93__SESRKESession_didReceiveContinuationRequestFor_actionIdentifier_arbitraryData_fromVehicle___block_invoke;
    block[3] = &unk_264219F28;
    block[4] = self;
    id v17 = v10;
    id v18 = v11;
    id v19 = v12;
    id v20 = v13;
    dispatch_async(v14, block);
  }
  else
  {
    id v15 = SESDefaultLogObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2146ED000, v15, OS_LOG_TYPE_INFO, "Dropping confirmation request while no active session", buf, 2u);
    }
  }
}

void __93__SESRKESession_didReceiveContinuationRequestFor_actionIdentifier_arbitraryData_fromVehicle___block_invoke(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) continuationDelegate];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  id v6 = [*(id *)(a1 + 64) asHexString];
  [v7 sesSession:v2 didReceiveContinuationRequestFor:v3 actionIdentifier:v4 arbitraryData:v5 fromVehicle:v6];
}

- (SESRKESessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SESRKESessionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SESRKESessionContinuationDelegate)continuationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_continuationDelegate);
  return (SESRKESessionContinuationDelegate *)WeakRetained;
}

- (void)setContinuationDelegate:(id)a3
{
}

- (NSString)activeKeyIdentifier
{
  return self->_activeKeyIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeKeyIdentifier, 0);
  objc_destroyWeak((id *)&self->_continuationDelegate);
  objc_destroyWeak((id *)&self->_delegate);
}

@end