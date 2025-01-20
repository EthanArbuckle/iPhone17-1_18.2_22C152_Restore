@interface SASProximitySession
- (BOOL)isConnected;
- (CUMessageSession)sharingMessageSession;
- (OS_dispatch_queue)actionQueue;
- (SASProximitySession)init;
- (SASProximitySessionDelegate)delegate;
- (SASProximitySessionTransport)transport;
- (id)actionFromData:(id)a3;
- (id)sendAction:(id)a3;
- (void)activate;
- (void)handleAction:(id)a3;
- (void)invalidate;
- (void)receivedAction:(id)a3 response:(id)a4;
- (void)setActionQueue:(id)a3;
- (void)setConnected:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setSharingMessageSession:(id)a3;
- (void)setTransport:(id)a3;
@end

@implementation SASProximitySession

- (SASProximitySession)init
{
  v5.receiver = self;
  v5.super_class = (Class)SASProximitySession;
  v2 = [(SASProximitySession *)&v5 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("Action Queue", 0);
    [(SASProximitySession *)v2 setActionQueue:v3];
  }
  return v2;
}

- (void)activate
{
  objc_initWeak(&location, self);
  uint64_t v5 = MEMORY[0x1E4F143A8];
  objc_copyWeak(&v6, &location);
  dispatch_queue_t v3 = [(SASProximitySession *)self transport];
  [v3 setReceivedDataBlock:&v5];

  v4 = [(SASProximitySession *)self transport];
  [v4 activate];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __31__SASProximitySession_activate__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained receivedAction:v6 response:v5];
}

- (void)invalidate
{
  id v2 = [(SASProximitySession *)self transport];
  [v2 invalidate];
}

- (void)setSharingMessageSession:(id)a3
{
  id v4 = a3;
  id v5 = [[SASProximitySessionSharingTransport alloc] initWithMessageSession:v4];

  [(SASProximitySession *)self setTransport:v5];
}

- (CUMessageSession)sharingMessageSession
{
  dispatch_queue_t v3 = [(SASProximitySession *)self transport];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = [(SASProximitySession *)self transport];
    id v6 = [v5 messageSession];
  }
  else
  {
    id v6 = 0;
  }
  return (CUMessageSession *)v6;
}

- (void)receivedAction:(id)a3 response:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, void *))a4;
  v7 = [(SASProximitySession *)self actionFromData:a3];
  v8 = +[SASLogging facility];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v24 = [(id)objc_opt_class() actionID];
    _os_log_impl(&dword_1DCC71000, v8, OS_LOG_TYPE_DEFAULT, "Received action from remote device (type %ld)", buf, 0xCu);
  }

  v9 = dispatch_get_global_queue(0, 0);
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __47__SASProximitySession_receivedAction_response___block_invoke;
  v18 = &unk_1E6CAB768;
  v19 = self;
  id v10 = v7;
  id v20 = v10;
  dispatch_async(v9, &v15);

  if (objc_msgSend(v10, "hasResponse", v15, v16, v17, v18, v19))
  {
    if (v6)
    {
      v11 = [v10 responsePayload];
      if (!v11)
      {
        v11 = [MEMORY[0x1E4F1C9B8] data];
      }
      v12 = +[SASLogging facility];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DCC71000, v12, OS_LOG_TYPE_DEFAULT, "Responding to remote device...", buf, 2u);
      }

      v21 = @"data";
      v22 = v11;
      v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      v6[2](v6, v13);
    }
    else
    {
      v11 = +[SASLogging facility];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DCC71000, v11, OS_LOG_TYPE_DEFAULT, "Unable to send response for action; no response handler!",
          buf,
          2u);
      }
    }
  }
  else if (v6)
  {
    v14 = +[SASLogging facility];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DCC71000, v14, OS_LOG_TYPE_DEFAULT, "Sending empty response to remote device...", buf, 2u);
    }

    v6[2](v6, (void *)MEMORY[0x1E4F1CC08]);
  }
}

uint64_t __47__SASProximitySession_receivedAction_response___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleAction:*(void *)(a1 + 40)];
}

- (id)sendAction:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__0;
  uint64_t v16 = __Block_byref_object_dispose__0;
  id v17 = 0;
  if ([(SASProximitySession *)self isConnected])
  {
    id v5 = [(SASProximitySession *)self actionQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __34__SASProximitySession_sendAction___block_invoke;
    block[3] = &unk_1E6CAB7B8;
    id v9 = v4;
    id v10 = self;
    v11 = &v12;
    dispatch_sync(v5, block);

    id v6 = (id)v13[5];
  }
  else
  {
    id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SASProximityErrorDomain" code:-1 userInfo:0];
  }
  _Block_object_dispose(&v12, 8);

  return v6;
}

void __34__SASProximitySession_sendAction___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  dispatch_queue_t v3 = [NSNumber numberWithUnsignedInt:1];
  [v2 setObject:v3 forKeyedSubscript:@"Version"];

  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend((id)objc_opt_class(), "actionID"));
  [v2 setObject:v4 forKeyedSubscript:@"Action"];

  id v5 = [*(id *)(a1 + 32) requestPayload];
  if (v5)
  {
    [v2 setObject:v5 forKeyedSubscript:@"Payload"];
    dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
    v7 = +[SASLogging facility];
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 134217984;
    uint64_t v18 = [(id)objc_opt_class() actionID];
    v8 = "Sending action (type %ld) with payload...";
  }
  else
  {
    dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
    v7 = +[SASLogging facility];
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 134217984;
    uint64_t v18 = [(id)objc_opt_class() actionID];
    v8 = "Sending action (type %ld)...";
  }
  _os_log_impl(&dword_1DCC71000, v7, OS_LOG_TYPE_DEFAULT, v8, buf, 0xCu);
LABEL_7:

  id v9 = [*(id *)(a1 + 40) transport];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __34__SASProximitySession_sendAction___block_invoke_10;
  v13[3] = &unk_1E6CAB790;
  id v10 = *(id *)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 48);
  id v14 = v10;
  uint64_t v16 = v11;
  uint64_t v12 = v6;
  uint64_t v15 = v12;
  [v9 sendData:v2 response:v13];

  if ([*(id *)(a1 + 32) hasResponse]) {
    dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
  }
}

void __34__SASProximitySession_sendAction___block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = +[SASLogging facility];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v5;
    _os_log_impl(&dword_1DCC71000, v7, OS_LOG_TYPE_DEFAULT, "Receiving action response with error: %@", (uint8_t *)&v13, 0xCu);
  }

  if (v5)
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    id v9 = v5;
    id v10 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v9;
  }
  else
  {
    id v10 = [v6 objectForKeyedSubscript:@"data"];
    uint64_t v11 = +[SASLogging facility];
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_1DCC71000, v11, OS_LOG_TYPE_DEFAULT, "Received response from remote device", (uint8_t *)&v13, 2u);
      }

      [*(id *)(a1 + 32) setResponseFromData:v10];
    }
    else
    {
      if (v12)
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_1DCC71000, v11, OS_LOG_TYPE_DEFAULT, "Received null response from remote device", (uint8_t *)&v13, 2u);
      }
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (id)actionFromData:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"Action"];
  uint64_t v5 = [v4 unsignedIntegerValue];

  id v6 = [v3 objectForKeyedSubscript:@"Payload"];

  switch(v5)
  {
    case 1:
      v7 = SASProximityReadyAction;
      goto LABEL_15;
    case 2:
      v7 = SASProximityHandshakeAction;
      goto LABEL_15;
    case 3:
      v7 = SASProximityInformationAction;
      goto LABEL_15;
    case 4:
      v7 = SASProximityCompanionAuthRequestAction;
      goto LABEL_15;
    case 5:
      v7 = SASProximityAnisetteRequestAction;
      goto LABEL_15;
    case 6:
      v7 = SASProximityBackupAction;
      goto LABEL_15;
    case 7:
      v7 = SASProximityPasscodeValidationAction;
      goto LABEL_15;
    case 8:
      v7 = SASProximityFinishedAction;
      goto LABEL_15;
    case 9:
      v7 = SASProximityMigrationTransferPreparationAction;
      goto LABEL_15;
    case 10:
      v7 = SASProximityMigrationStartAction;
LABEL_15:
      id v9 = [(__objc2_class *)v7 actionFromDictionary:v6];
      break;
    default:
      uint64_t v8 = +[SASLogging facility];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 134217984;
        uint64_t v12 = v5;
        _os_log_impl(&dword_1DCC71000, v8, OS_LOG_TYPE_DEFAULT, "Received unknown action of type: %lu", (uint8_t *)&v11, 0xCu);
      }

      id v9 = 0;
      break;
  }

  return v9;
}

- (void)handleAction:(id)a3
{
  id v21 = a3;
  if ([(id)objc_opt_class() actionID] == 1)
  {
    id v4 = [(SASProximitySession *)self delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = [(SASProximitySession *)self delegate];
      [v6 ready];
    }
  }
  if ([(id)objc_opt_class() actionID] == 6)
  {
    v7 = [(SASProximitySession *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = [(SASProximitySession *)self delegate];
      [v9 receivedBackupAction:v21];
    }
  }
  if ([(id)objc_opt_class() actionID] == 8)
  {
    id v10 = [(SASProximitySession *)self delegate];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      uint64_t v12 = [(SASProximitySession *)self delegate];
      [v12 finishedWithError:0];
    }
  }
  if ([(id)objc_opt_class() actionID] == 9)
  {
    id v13 = v21;
    id v14 = [(SASProximitySession *)self delegate];
    char v15 = objc_opt_respondsToSelector();

    if (v15)
    {
      uint64_t v16 = [(SASProximitySession *)self delegate];
      id v17 = [v13 deviceName];
      [v16 prepareForMigrationToDevice:v17];
    }
  }
  if ([(id)objc_opt_class() actionID] == 10)
  {
    uint64_t v18 = [(SASProximitySession *)self delegate];
    char v19 = objc_opt_respondsToSelector();

    if (v19)
    {
      id v20 = [(SASProximitySession *)self delegate];
      [v20 startMigration];
    }
  }
}

- (SASProximitySessionDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (SASProximitySessionDelegate *)a3;
}

- (BOOL)isConnected
{
  return self->_connected;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (OS_dispatch_queue)actionQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setActionQueue:(id)a3
{
}

- (SASProximitySessionTransport)transport
{
  return (SASProximitySessionTransport *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTransport:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transport, 0);
  objc_storeStrong((id *)&self->_actionQueue, 0);
}

@end