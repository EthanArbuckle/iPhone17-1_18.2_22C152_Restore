@interface SESDCKSession
+ (id)getVehicleReports:(id *)a3;
+ (id)newInstance;
+ (id)pauseRangingForReaderIdentifier:(id)a3 durationInSec:(id)a4;
+ (id)requestAssertionForKeyID:(id)a3 withOptions:(id)a4 error:(id *)a5;
+ (id)resumeRangingForReaderIdentifier:(id)a3;
- (BOOL)getSignedMessage:(id)a3 authorization:(id)a4 reply:(id)a5;
- (BOOL)sendPassthroughMessage:(id)a3 error:(id *)a4;
- (BOOL)sendPassthroughMessage:(id)a3 reply:(id)a4;
- (BOOL)sendSignedPassthroughMessage:(id)a3 authorization:(id)a4 reply:(id)a5;
- (BOOL)supportsSecureRanging;
- (NSString)activeKeyIdentifier;
- (NSString)aid;
- (SESDCKSessionDelegate)delegate;
- (SESDCKSessionPassthroughDelegate)passthroughDelegate;
- (id)cancelRKEAction:(unint64_t)a3;
- (id)cancelRKEFunction:(id)a3;
- (id)disableBluetooth:(BOOL)a3;
- (id)getRKEActionsInProgress;
- (id)sendRKEAction:(unint64_t)a3 authorization:(id)a4;
- (id)sendRKEFunction:(id)a3 action:(id)a4 authorization:(id)a5;
- (id)setActiveKey:(id)a3;
- (id)setAuthorization:(id)a3;
- (id)setSecureElementToken:(id)a3;
- (id)vehicleState;
- (void)didEndUnexpectedly:(id)a3;
- (void)didReceivePassthroughMessage:(id)a3;
- (void)didStartSession:(id)a3;
- (void)endSession;
- (void)sendEvent:(id)a3;
- (void)sendRKEFunction:(id)a3 action:(id)a4 authorization:(id)a5 completion:(id)a6;
- (void)setDelegate:(id)a3;
- (void)setPassthroughDelegate:(id)a3;
@end

@implementation SESDCKSession

+ (id)newInstance
{
  return (id)objc_opt_new();
}

- (id)setActiveKey:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = SESDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_2146ED000, v5, OS_LOG_TYPE_INFO, "setActiveKey %@", (uint8_t *)&buf, 0xCu);
  }

  if ([(SESSession *)self state] == 1)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__6;
    v24 = __Block_byref_object_dispose__6;
    id v25 = 0;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __30__SESDCKSession_setActiveKey___block_invoke;
    v18[3] = &unk_2642194D8;
    v18[4] = &buf;
    v6 = [(SESSession *)self synchronousRemoteObjectProxyWithErrorHandler:v18];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __30__SESDCKSession_setActiveKey___block_invoke_2;
    v17[3] = &unk_2642194D8;
    v17[4] = &buf;
    [v6 setActiveKey:v4 reply:v17];

    aid = self->_aid;
    if (!v4 || *(void *)(*((void *)&buf + 1) + 40))
    {
      self->_aid = 0;

      BOOL v10 = 0;
      activeKeyIdentifier = self->_activeKeyIdentifier;
      self->_activeKeyIdentifier = 0;
    }
    else
    {
      self->_aid = (NSString *)@"A000000809434343444B417631";

      v8 = (NSString *)v4;
      activeKeyIdentifier = self->_activeKeyIdentifier;
      self->_activeKeyIdentifier = v8;
      BOOL v10 = 1;
    }

    self->_supportsSecureRanging = v10;
    v13 = *(void **)(*((void *)&buf + 1) + 40);
    if (v13)
    {
      v14 = SESDefaultLogObject();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = *(void *)(*((void *)&buf + 1) + 40);
        *(_DWORD *)v19 = 138412290;
        uint64_t v20 = v15;
        _os_log_impl(&dword_2146ED000, v14, OS_LOG_TYPE_ERROR, "%@", v19, 0xCu);
      }

      v13 = *(void **)(*((void *)&buf + 1) + 40);
    }
    id v12 = v13;
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    v11 = SESDefaultLogObject();
    SESCreateAndLogError();
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v12;
}

void __30__SESDCKSession_setActiveKey___block_invoke(uint64_t a1, void *a2)
{
}

void __30__SESDCKSession_setActiveKey___block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)setSecureElementToken:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = SESDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_2146ED000, v5, OS_LOG_TYPE_INFO, "setSecureElementToken", buf, 2u);
  }

  if ([(SESSession *)self state] == 1)
  {
    *(void *)long long buf = 0;
    v16 = buf;
    uint64_t v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__6;
    v19 = __Block_byref_object_dispose__6;
    id v20 = 0;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __39__SESDCKSession_setSecureElementToken___block_invoke;
    v14[3] = &unk_2642194D8;
    v14[4] = buf;
    v6 = [(SESSession *)self synchronousRemoteObjectProxyWithErrorHandler:v14];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __39__SESDCKSession_setSecureElementToken___block_invoke_2;
    v13[3] = &unk_2642194D8;
    v13[4] = buf;
    [v6 setSecureElementToken:v4 reply:v13];

    v7 = (void *)*((void *)v16 + 5);
    if (v7)
    {
      v8 = SESDefaultLogObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = *((void *)v16 + 5);
        *(_DWORD *)v21 = 138412290;
        uint64_t v22 = v9;
        _os_log_impl(&dword_2146ED000, v8, OS_LOG_TYPE_ERROR, "%@", v21, 0xCu);
      }

      v7 = (void *)*((void *)v16 + 5);
    }
    id v10 = v7;
    _Block_object_dispose(buf, 8);
  }
  else
  {
    v11 = SESDefaultLogObject();
    SESCreateAndLogError();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v10;
}

void __39__SESDCKSession_setSecureElementToken___block_invoke(uint64_t a1, void *a2)
{
}

void __39__SESDCKSession_setSecureElementToken___block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)setAuthorization:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = SESDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_2146ED000, v5, OS_LOG_TYPE_INFO, "setAuthorization", buf, 2u);
  }

  if ([(SESSession *)self state] == 1)
  {
    *(void *)long long buf = 0;
    v16 = buf;
    uint64_t v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__6;
    v19 = __Block_byref_object_dispose__6;
    id v20 = 0;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __34__SESDCKSession_setAuthorization___block_invoke;
    v14[3] = &unk_2642194D8;
    v14[4] = buf;
    v6 = [(SESSession *)self synchronousRemoteObjectProxyWithErrorHandler:v14];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __34__SESDCKSession_setAuthorization___block_invoke_2;
    v13[3] = &unk_2642194D8;
    v13[4] = buf;
    [v6 setAuthorization:v4 reply:v13];

    v7 = (void *)*((void *)v16 + 5);
    if (v7)
    {
      v8 = SESDefaultLogObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = *((void *)v16 + 5);
        *(_DWORD *)v21 = 138412290;
        uint64_t v22 = v9;
        _os_log_impl(&dword_2146ED000, v8, OS_LOG_TYPE_ERROR, "%@", v21, 0xCu);
      }

      v7 = (void *)*((void *)v16 + 5);
    }
    id v10 = v7;
    _Block_object_dispose(buf, 8);
  }
  else
  {
    v11 = SESDefaultLogObject();
    SESCreateAndLogError();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v10;
}

void __34__SESDCKSession_setAuthorization___block_invoke(uint64_t a1, void *a2)
{
}

void __34__SESDCKSession_setAuthorization___block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)disableBluetooth:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v23 = *MEMORY[0x263EF8340];
  v5 = SESDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 67109120;
    *(_DWORD *)&buf[4] = v3;
    _os_log_impl(&dword_2146ED000, v5, OS_LOG_TYPE_INFO, "disableBluetooth %d", buf, 8u);
  }

  if ([(SESSession *)self state] == 1)
  {
    *(void *)long long buf = 0;
    v18 = buf;
    uint64_t v19 = 0x3032000000;
    id v20 = __Block_byref_object_copy__6;
    v21 = __Block_byref_object_dispose__6;
    id v22 = 0;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __34__SESDCKSession_disableBluetooth___block_invoke;
    v14[3] = &unk_2642194D8;
    v14[4] = buf;
    v6 = [(SESSession *)self synchronousRemoteObjectProxyWithErrorHandler:v14];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __34__SESDCKSession_disableBluetooth___block_invoke_2;
    v13[3] = &unk_2642194D8;
    v13[4] = buf;
    [v6 preArmActiveKey:v3 reply:v13];

    v7 = (void *)*((void *)v18 + 5);
    if (v7)
    {
      v8 = SESDefaultLogObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = *((void *)v18 + 5);
        *(_DWORD *)uint64_t v15 = 138412290;
        uint64_t v16 = v9;
        _os_log_impl(&dword_2146ED000, v8, OS_LOG_TYPE_ERROR, "%@", v15, 0xCu);
      }

      v7 = (void *)*((void *)v18 + 5);
    }
    id v10 = v7;
    _Block_object_dispose(buf, 8);
  }
  else
  {
    v11 = SESDefaultLogObject();
    SESCreateAndLogError();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v10;
}

void __34__SESDCKSession_disableBluetooth___block_invoke(uint64_t a1, void *a2)
{
}

void __34__SESDCKSession_disableBluetooth___block_invoke_2(uint64_t a1, void *a2)
{
}

- (void)sendRKEFunction:(id)a3 action:(id)a4 authorization:(id)a5 completion:(id)a6
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void (**)(id, void, void *))a6;
  v14 = SESDefaultLogObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 67109632;
    *(_DWORD *)&buf[4] = [v10 unsignedIntValue];
    LOWORD(v25) = 1024;
    *(_DWORD *)((char *)&v25 + 2) = [v11 unsignedIntValue];
    HIWORD(v25) = 1024;
    LODWORD(v26) = v12 != 0;
    _os_log_impl(&dword_2146ED000, v14, OS_LOG_TYPE_INFO, "sendRKEFunction 0x%X action 0x%X authorization %d", buf, 0x14u);
  }

  if ([(SESSession *)self state] == 1)
  {
    *(void *)long long buf = 0;
    id v25 = buf;
    uint64_t v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__6;
    v28 = __Block_byref_object_dispose__6;
    id v29 = 0;
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __65__SESDCKSession_sendRKEFunction_action_authorization_completion___block_invoke;
    v21[3] = &unk_2642194D8;
    uint8_t v21[4] = buf;
    uint64_t v15 = [(SESSession *)self remoteObjectProxyWithErrorHandler:v21];
    objc_msgSend(v15, "sendRKEFunction:action:authorization:completion:", objc_msgSend(v10, "unsignedShortValue"), objc_msgSend(v11, "unsignedCharValue"), v12, v13);

    if (*((void *)v25 + 5))
    {
      uint64_t v16 = SESDefaultLogObject();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = *((void *)v25 + 5);
        *(_DWORD *)id v22 = 138412290;
        uint64_t v23 = v17;
        _os_log_impl(&dword_2146ED000, v16, OS_LOG_TYPE_ERROR, "%@", v22, 0xCu);
      }

      v18 = SESEnsureError();
      v13[2](v13, 0, v18);
    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    uint64_t v19 = SESDefaultLogObject();
    id v20 = SESCreateAndLogError();
    v13[2](v13, 0, v20);
  }
}

void __65__SESDCKSession_sendRKEFunction_action_authorization_completion___block_invoke(uint64_t a1, void *a2)
{
}

- (id)cancelRKEFunction:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = SESDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 67109120;
    *(_DWORD *)&buf[4] = [v4 unsignedIntValue];
    _os_log_impl(&dword_2146ED000, v5, OS_LOG_TYPE_INFO, "cancelRKEFunction 0x%X", buf, 8u);
  }

  if ([(SESSession *)self state] == 1)
  {
    *(void *)long long buf = 0;
    uint64_t v19 = buf;
    uint64_t v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__6;
    id v22 = __Block_byref_object_dispose__6;
    id v23 = 0;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __35__SESDCKSession_cancelRKEFunction___block_invoke;
    v15[3] = &unk_2642194D8;
    uint8_t v15[4] = buf;
    v6 = [(SESSession *)self synchronousRemoteObjectProxyWithErrorHandler:v15];
    unsigned int v7 = [v4 unsignedShortValue];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __35__SESDCKSession_cancelRKEFunction___block_invoke_2;
    v14[3] = &unk_2642194D8;
    v14[4] = buf;
    [v6 cancelRKEFunction:v7 reply:v14];

    v8 = (void *)*((void *)v19 + 5);
    if (v8)
    {
      uint64_t v9 = SESDefaultLogObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v10 = *((void *)v19 + 5);
        *(_DWORD *)uint64_t v16 = 138412290;
        uint64_t v17 = v10;
        _os_log_impl(&dword_2146ED000, v9, OS_LOG_TYPE_ERROR, "%@", v16, 0xCu);
      }

      v8 = (void *)*((void *)v19 + 5);
    }
    id v11 = v8;
    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v12 = SESDefaultLogObject();
    SESCreateAndLogError();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v11;
}

void __35__SESDCKSession_cancelRKEFunction___block_invoke(uint64_t a1, void *a2)
{
}

void __35__SESDCKSession_cancelRKEFunction___block_invoke_2(uint64_t a1, void *a2)
{
}

- (BOOL)sendPassthroughMessage:(id)a3 error:(id *)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  unsigned int v7 = SESDefaultLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_2146ED000, v7, OS_LOG_TYPE_INFO, "sendPassthroughMessage", buf, 2u);
  }

  if ([(SESSession *)self state] == 1)
  {
    if ((unint64_t)[v6 length] < 0x10000)
    {
      *(void *)long long buf = 0;
      v18 = buf;
      uint64_t v19 = 0x3032000000;
      uint64_t v20 = __Block_byref_object_copy__6;
      v21 = __Block_byref_object_dispose__6;
      id v22 = 0;
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __46__SESDCKSession_sendPassthroughMessage_error___block_invoke;
      v16[3] = &unk_2642194D8;
      uint8_t v16[4] = buf;
      uint64_t v10 = [(SESSession *)self synchronousRemoteObjectProxyWithErrorHandler:v16];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __46__SESDCKSession_sendPassthroughMessage_error___block_invoke_2;
      v15[3] = &unk_2642194D8;
      uint8_t v15[4] = buf;
      [v10 sendPassthroughMessage:v6 reply:v15];

      id v11 = v18;
      if (*((void *)v18 + 5))
      {
        id v12 = SESDefaultLogObject();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          uint64_t v13 = *((void *)v18 + 5);
          *(_DWORD *)id v23 = 138412290;
          uint64_t v24 = v13;
          _os_log_impl(&dword_2146ED000, v12, OS_LOG_TYPE_ERROR, "%@", v23, 0xCu);
        }

        id v11 = v18;
      }
      if (a4)
      {
        *a4 = *((id *)v11 + 5);
        id v11 = v18;
      }
      LOBYTE(a4) = *((void *)v11 + 5) == 0;
      _Block_object_dispose(buf, 8);
    }
    else if (a4)
    {
      v8 = SESDefaultLogObject();
      [v6 length];
      SESCreateAndLogError();
      *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_9:
      LOBYTE(a4) = 0;
    }
  }
  else if (a4)
  {
    uint64_t v9 = SESDefaultLogObject();
    SESCreateAndLogError();
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }

  return (char)a4;
}

void __46__SESDCKSession_sendPassthroughMessage_error___block_invoke(uint64_t a1, void *a2)
{
}

void __46__SESDCKSession_sendPassthroughMessage_error___block_invoke_2(uint64_t a1, void *a2)
{
}

+ (id)pauseRangingForReaderIdentifier:(id)a3 durationInSec:(id)a4
{
  return 0;
}

+ (id)resumeRangingForReaderIdentifier:(id)a3
{
  return 0;
}

+ (id)getVehicleReports:(id *)a3
{
  return +[SESSessionManager getVehicleReports:a3];
}

+ (id)requestAssertionForKeyID:(id)a3 withOptions:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = +[SESSessionManager sharedInstance];
  id v13 = 0;
  uint64_t v10 = [v9 startDCKAssertionForKeyIdentifier:v8 withOptions:v7 error:&v13];

  id v11 = v13;
  if (a5) {
    *a5 = v11;
  }

  return v10;
}

- (void)didStartSession:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SESDCKSession;
  [(SESSession *)&v3 didStartSession:a3];
}

- (void)didEndUnexpectedly:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SESDCKSession;
  [(SESSession *)&v3 didEndUnexpectedly:a3];
}

- (void)endSession
{
  v3.receiver = self;
  v3.super_class = (Class)SESDCKSession;
  [(SESSession *)&v3 endSession];
  [(SESDCKSession *)self sendEvent:&unk_26C56DD00];
}

- (void)sendEvent:(id)a3
{
  id v4 = a3;
  if ([(SESSession *)self state] == 1)
  {
    v5 = [(SESSession *)self queue];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __27__SESDCKSession_sendEvent___block_invoke;
    v7[3] = &unk_264219888;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(v5, v7);
  }
  else
  {
    id v6 = SESDefaultLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_2146ED000, v6, OS_LOG_TYPE_INFO, "Dropping event while no active session", buf, 2u);
    }
  }
}

void __27__SESDCKSession_sendEvent___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 sesSession:*(void *)(a1 + 32) event:*(void *)(a1 + 40)];
}

- (void)didReceivePassthroughMessage:(id)a3
{
  id v4 = a3;
  if ([(SESSession *)self state] != 1)
  {
    id v7 = SESDefaultLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      id v8 = "Dropping passthrough message while no active session";
LABEL_8:
      _os_log_impl(&dword_2146ED000, v7, OS_LOG_TYPE_INFO, v8, buf, 2u);
    }
LABEL_9:

    goto LABEL_10;
  }
  v5 = [(SESDCKSession *)self passthroughDelegate];

  if (!v5)
  {
    id v7 = SESDefaultLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      id v8 = "Dropping passthrough message due to no delegate";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  id v6 = [(SESSession *)self queue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __46__SESDCKSession_didReceivePassthroughMessage___block_invoke;
  v9[3] = &unk_264219888;
  v9[4] = self;
  id v10 = v4;
  dispatch_async(v6, v9);

LABEL_10:
}

void __46__SESDCKSession_didReceivePassthroughMessage___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) passthroughDelegate];
  [v2 sesSession:*(void *)(a1 + 32) didReceivePassthroughMessage:*(void *)(a1 + 40)];
}

- (id)vehicleState
{
  return (id)MEMORY[0x263EFFA78];
}

- (id)sendRKEAction:(unint64_t)a3 authorization:(id)a4
{
  id v4 = SESDefaultLogObject();
  v5 = SESCreateAndLogError();

  return v5;
}

- (id)sendRKEFunction:(id)a3 action:(id)a4 authorization:(id)a5
{
  v5 = SESDefaultLogObject();
  id v6 = SESCreateAndLogError();

  return v6;
}

- (id)getRKEActionsInProgress
{
  return (id)MEMORY[0x263EFFA78];
}

- (id)cancelRKEAction:(unint64_t)a3
{
  objc_super v3 = SESDefaultLogObject();
  id v4 = SESCreateAndLogError();

  return v4;
}

- (BOOL)sendPassthroughMessage:(id)a3 reply:(id)a4
{
  return 0;
}

- (BOOL)sendSignedPassthroughMessage:(id)a3 authorization:(id)a4 reply:(id)a5
{
  return 0;
}

- (BOOL)getSignedMessage:(id)a3 authorization:(id)a4 reply:(id)a5
{
  return 0;
}

- (SESDCKSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SESDCKSessionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SESDCKSessionPassthroughDelegate)passthroughDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_passthroughDelegate);
  return (SESDCKSessionPassthroughDelegate *)WeakRetained;
}

- (void)setPassthroughDelegate:(id)a3
{
}

- (NSString)aid
{
  return self->_aid;
}

- (NSString)activeKeyIdentifier
{
  return self->_activeKeyIdentifier;
}

- (BOOL)supportsSecureRanging
{
  return self->_supportsSecureRanging;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeKeyIdentifier, 0);
  objc_storeStrong((id *)&self->_aid, 0);
  objc_destroyWeak((id *)&self->_passthroughDelegate);
  objc_destroyWeak((id *)&self->_delegate);
}

@end