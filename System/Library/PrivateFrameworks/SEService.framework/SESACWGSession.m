@interface SESACWGSession
+ (id)newInstance;
+ (id)pauseRangingForReaderIdentifier:(id)a3 durationInSec:(double)a4 withAppletIdentifier:(id)a5;
+ (id)resumeRangingForReaderIdentifier:(id)a3 withAppletIdentifier:(id)a4;
- (BOOL)supportsSecureRanging;
- (NSString)activeKeyIdentifier;
- (NSString)aid;
- (SESACWGSessionDelegate)delegate;
- (id)disableBluetooth:(BOOL)a3;
- (id)setActiveKey:(id)a3;
- (id)setSecureElementToken:(id)a3;
- (void)didEndUnexpectedly:(id)a3;
- (void)didStartSession:(id)a3;
- (void)endSession;
- (void)sendEvent:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SESACWGSession

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
    v23 = __Block_byref_object_copy__4;
    v24 = __Block_byref_object_dispose__4;
    id v25 = 0;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __31__SESACWGSession_setActiveKey___block_invoke;
    v18[3] = &unk_2642194D8;
    v18[4] = &buf;
    v6 = [(SESSession *)self synchronousRemoteObjectProxyWithErrorHandler:v18];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __31__SESACWGSession_setActiveKey___block_invoke_2;
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
      self->_aid = (NSString *)@"A000000909ACCE5501";

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

void __31__SESACWGSession_setActiveKey___block_invoke(uint64_t a1, void *a2)
{
}

void __31__SESACWGSession_setActiveKey___block_invoke_2(uint64_t a1, void *a2)
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
    v18 = __Block_byref_object_copy__4;
    v19 = __Block_byref_object_dispose__4;
    id v20 = 0;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __40__SESACWGSession_setSecureElementToken___block_invoke;
    v14[3] = &unk_2642194D8;
    v14[4] = buf;
    v6 = [(SESSession *)self synchronousRemoteObjectProxyWithErrorHandler:v14];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __40__SESACWGSession_setSecureElementToken___block_invoke_2;
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

void __40__SESACWGSession_setSecureElementToken___block_invoke(uint64_t a1, void *a2)
{
}

void __40__SESACWGSession_setSecureElementToken___block_invoke_2(uint64_t a1, void *a2)
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
    id v20 = __Block_byref_object_copy__4;
    v21 = __Block_byref_object_dispose__4;
    id v22 = 0;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __35__SESACWGSession_disableBluetooth___block_invoke;
    v14[3] = &unk_2642194D8;
    v14[4] = buf;
    v6 = [(SESSession *)self synchronousRemoteObjectProxyWithErrorHandler:v14];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __35__SESACWGSession_disableBluetooth___block_invoke_2;
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

void __35__SESACWGSession_disableBluetooth___block_invoke(uint64_t a1, void *a2)
{
}

void __35__SESACWGSession_disableBluetooth___block_invoke_2(uint64_t a1, void *a2)
{
}

+ (id)pauseRangingForReaderIdentifier:(id)a3 durationInSec:(double)a4 withAppletIdentifier:(id)a5
{
  return +[SESSessionManager pauseRangingForReaderIdentifier:a3 durationInSec:a5 withAppletIdentifier:a4];
}

+ (id)resumeRangingForReaderIdentifier:(id)a3 withAppletIdentifier:(id)a4
{
  return +[SESSessionManager resumeRangingForReaderIdentifier:a3 withAppletIdentifier:a4];
}

- (void)didStartSession:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SESACWGSession;
  [(SESSession *)&v3 didStartSession:a3];
}

- (void)didEndUnexpectedly:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SESACWGSession;
  [(SESSession *)&v3 didEndUnexpectedly:a3];
}

- (void)endSession
{
  v3.receiver = self;
  v3.super_class = (Class)SESACWGSession;
  [(SESSession *)&v3 endSession];
  [(SESACWGSession *)self sendEvent:&unk_26C56DCD8];
}

- (void)sendEvent:(id)a3
{
  id v4 = a3;
  if ([(SESSession *)self state] == 1)
  {
    v5 = [(SESSession *)self queue];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __28__SESACWGSession_sendEvent___block_invoke;
    v7[3] = &unk_264219888;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(v5, v7);
  }
  else
  {
    v6 = SESDefaultLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_2146ED000, v6, OS_LOG_TYPE_INFO, "Dropping event while no active session", buf, 2u);
    }
  }
}

void __28__SESACWGSession_sendEvent___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 sesSession:*(void *)(a1 + 32) event:*(void *)(a1 + 40)];
}

- (SESACWGSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SESACWGSessionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
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
  objc_destroyWeak((id *)&self->_delegate);
}

@end