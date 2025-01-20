@interface TVRCTextInputSession
- (RPMessageable)messenger;
- (RTIInputSystemSourceSession)rtiSession;
- (TVRCTextInputSession)init;
- (id)rtiUpdatedHandler;
- (void)_activateWithCompletion:(id)a3;
- (void)_handleTextInputChange:(id)a3 started:(BOOL)a4;
- (void)_handleTextInputStarted:(id)a3;
- (void)_handleTextInputStopped:(id)a3;
- (void)_invalidate;
- (void)activateWithCompletion:(id)a3;
- (void)handleTextActionPayload:(id)a3;
- (void)invalidate;
- (void)performDocumentRequest:(id)a3 completion:(id)a4;
- (void)setMessenger:(id)a3;
- (void)setRtiUpdatedHandler:(id)a3;
@end

@implementation TVRCTextInputSession

- (TVRCTextInputSession)init
{
  v6.receiver = self;
  v6.super_class = (Class)TVRCTextInputSession;
  v2 = [(TVRCTextInputSession *)&v6 init];
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x263EF83A0]);
    v4 = v3;
  }

  return v3;
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(RPMessageable *)self->_messenger dispatchQueue];
  dispatchQueue = v5;
  if (!v5) {
    dispatchQueue = self->_dispatchQueue;
  }
  objc_storeStrong((id *)&self->_dispatchQueue, dispatchQueue);

  v7 = self->_dispatchQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __47__TVRCTextInputSession_activateWithCompletion___block_invoke;
  v9[3] = &unk_2647AF3A0;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, v9);
}

uint64_t __47__TVRCTextInputSession_activateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activateWithCompletion:*(void *)(a1 + 40)];
}

- (void)_activateWithCompletion:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = self->_messenger;
  if (v5)
  {
    objc_super v6 = _TVRCRemoteTextInputLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2266D3000, v6, OS_LOG_TYPE_DEFAULT, "Activate\n", buf, 2u);
    }

    uint64_t v18 = *MEMORY[0x263F62C98];
    v19 = &unk_26DA62DA8;
    v7 = [NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    messenger = self->_messenger;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __48__TVRCTextInputSession__activateWithCompletion___block_invoke;
    v17[3] = &unk_2647AF3C8;
    v17[4] = self;
    [(RPMessageable *)messenger registerEventID:@"_tiStarted" options:v7 handler:v17];
    v9 = self->_messenger;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __48__TVRCTextInputSession__activateWithCompletion___block_invoke_2;
    v16[3] = &unk_2647AF3C8;
    v16[4] = self;
    [(RPMessageable *)v9 registerEventID:@"_tiStopped" options:v7 handler:v16];
    id v10 = self->_messenger;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __48__TVRCTextInputSession__activateWithCompletion___block_invoke_3;
    v15[3] = &unk_2647AF3C8;
    v15[4] = self;
    [(RPMessageable *)v10 registerEventID:@"_tiC" options:v7 handler:v15];
    self->_started = 1;
    uint64_t v11 = *MEMORY[0x263F62C08];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __48__TVRCTextInputSession__activateWithCompletion___block_invoke_4;
    v13[3] = &unk_2647AF3F0;
    v13[4] = self;
    id v14 = v4;
    [(RPMessageable *)v5 sendRequestID:@"_tiStart" request:MEMORY[0x263EFFA78] destinationID:v11 options:0 responseHandler:v13];
  }
  else
  {
    v7 = RPErrorF();
    v12 = _TVRCRemoteTextInputLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v7;
      _os_log_impl(&dword_2266D3000, v12, OS_LOG_TYPE_DEFAULT, "### Activate failed: %@\n", buf, 0xCu);
    }

    if (v4) {
      (*((void (**)(id, void *))v4 + 2))(v4, v7);
    }
  }
}

uint64_t __48__TVRCTextInputSession__activateWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleTextInputStarted:a2];
}

uint64_t __48__TVRCTextInputSession__activateWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleTextInputStopped:a2];
}

uint64_t __48__TVRCTextInputSession__activateWithCompletion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleTextInputChange:a2 started:0];
}

void __48__TVRCTextInputSession__activateWithCompletion___block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = _TVRCRemoteTextInputLog();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      int v15 = 138412290;
      id v16 = v9;
      _os_log_impl(&dword_2266D3000, v10, OS_LOG_TYPE_DEFAULT, "### TextInputStart failed: %@\n", (uint8_t *)&v15, 0xCu);
    }

    uint64_t v12 = *(void *)(a1 + 40);
    if (v12)
    {
      v13 = *(void (**)(void))(v12 + 16);
LABEL_10:
      v13();
    }
  }
  else
  {
    if (v11)
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_2266D3000, v10, OS_LOG_TYPE_DEFAULT, "TextInputStarted\n", (uint8_t *)&v15, 2u);
    }

    [*(id *)(a1 + 32) _handleTextInputChange:v7 started:1];
    uint64_t v14 = *(void *)(a1 + 40);
    if (v14)
    {
      v13 = *(void (**)(void))(v14 + 16);
      goto LABEL_10;
    }
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__TVRCTextInputSession_invalidate__block_invoke;
  block[3] = &unk_2647AEA98;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __34__TVRCTextInputSession_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)_invalidate
{
  v3 = _TVRCRemoteTextInputLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_2266D3000, v3, OS_LOG_TYPE_DEFAULT, "Invalidate\n", v7, 2u);
  }

  [(RPMessageable *)self->_messenger deregisterEventID:@"_tiStarted"];
  [(RPMessageable *)self->_messenger deregisterEventID:@"_tiStopped"];
  [(RPMessageable *)self->_messenger deregisterEventID:@"_tiC"];
  if (self->_started)
  {
    self->_started = 0;
    [(RPMessageable *)self->_messenger sendRequestID:@"_tiStop" request:MEMORY[0x263EFFA78] destinationID:*MEMORY[0x263F62C08] options:0 responseHandler:&__block_literal_global_7];
  }
  messenger = self->_messenger;
  self->_messenger = 0;

  [(RTIInputSystemSourceSession *)self->_rtiSession setPayloadDelegate:0];
  rtiSession = self->_rtiSession;
  self->_rtiSession = 0;

  id rtiUpdatedHandler = self->_rtiUpdatedHandler;
  self->_id rtiUpdatedHandler = 0;
}

void __35__TVRCTextInputSession__invalidate__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a4;
  v5 = _TVRCRemoteTextInputLog();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      int v10 = 138412290;
      id v11 = v4;
      id v7 = "### TextInputStop failed: %@\n";
      id v8 = v5;
      uint32_t v9 = 12;
LABEL_6:
      _os_log_impl(&dword_2266D3000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, v9);
    }
  }
  else if (v6)
  {
    LOWORD(v10) = 0;
    id v7 = "TextInputStopped\n";
    id v8 = v5;
    uint32_t v9 = 2;
    goto LABEL_6;
  }
}

- (void)_handleTextInputStarted:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  CFDataGetTypeID();
  v5 = CFDictionaryGetTypedValue();
  BOOL v6 = _TVRCRemoteTextInputLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = [v5 length];
    _os_log_impl(&dword_2266D3000, v6, OS_LOG_TYPE_DEFAULT, "RTI Started: %d bytes\n", (uint8_t *)v7, 8u);
  }

  [(TVRCTextInputSession *)self _handleTextInputChange:v4 started:1];
}

- (void)_handleTextInputStopped:(id)a3
{
  id v4 = _TVRCRemoteTextInputLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint32_t v9 = 0;
    _os_log_impl(&dword_2266D3000, v4, OS_LOG_TYPE_DEFAULT, "RTI Stopped\n", v9, 2u);
  }

  if (self->_rtiSession)
  {
    v5 = [MEMORY[0x263F63740] payloadWithData:0];
    [(RTIInputSystemSourceSession *)self->_rtiSession handleTextActionPayload:v5];
    [(RTIInputSystemSourceSession *)self->_rtiSession setPayloadDelegate:0];
    rtiSession = self->_rtiSession;
    self->_rtiSession = 0;

    uint64_t v7 = MEMORY[0x22A6592D0](self->_rtiUpdatedHandler);
    uint64_t v8 = (void *)v7;
    if (v7) {
      (*(void (**)(uint64_t))(v7 + 16))(v7);
    }
  }
}

- (void)_handleTextInputChange:(id)a3 started:(BOOL)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  CFDataGetTypeID();
  uint64_t v7 = CFDictionaryGetTypedValue();
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x263F63740] payloadWithData:v7 version:CFDictionaryGetInt64Ranged()];
    if (v8)
    {
      if (!a4)
      {
        uint32_t v9 = _TVRCRemoteTextInputLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v16[0] = 67109120;
          v16[1] = [v7 length];
          _os_log_impl(&dword_2266D3000, v9, OS_LOG_TYPE_DEFAULT, "RTI Change remote: %d bytes\n", (uint8_t *)v16, 8u);
        }
      }
      rtiSession = self->_rtiSession;
      if (!rtiSession)
      {
        id v11 = (RTIInputSystemSourceSession *)objc_alloc_init(MEMORY[0x263F63750]);
        uint64_t v12 = self->_rtiSession;
        self->_rtiSession = v11;

        [(RTIInputSystemSourceSession *)self->_rtiSession setPayloadDelegate:self];
        uint64_t v13 = MEMORY[0x22A6592D0](self->_rtiUpdatedHandler);
        uint64_t v14 = (void *)v13;
        if (v13) {
          (*(void (**)(uint64_t))(v13 + 16))(v13);
        }

        rtiSession = self->_rtiSession;
      }
      [(RTIInputSystemSourceSession *)rtiSession handleTextActionPayload:v8];
    }
    else
    {
      int v15 = _TVRCRemoteTextInputLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v16[0]) = 0;
        _os_log_impl(&dword_2266D3000, v15, OS_LOG_TYPE_DEFAULT, "### TextInput change bad data\n", (uint8_t *)v16, 2u);
      }
    }
  }
}

- (void)handleTextActionPayload:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  _DWORD v7[2] = __48__TVRCTextInputSession_handleTextActionPayload___block_invoke;
  v7[3] = &unk_2647AF458;
  id v8 = v4;
  uint32_t v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __48__TVRCTextInputSession_handleTextActionPayload___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v3 = [*(id *)(a1 + 32) data];
  id v4 = *(void **)(a1 + 32);
  if (v4)
  {
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "version"));
    [v2 setObject:v5 forKeyedSubscript:@"_tiV"];
  }
  if (v3) {
    [v2 setObject:v3 forKeyedSubscript:@"_tiD"];
  }
  id v6 = _TVRCRemoteTextInputLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = [v3 length];
    _os_log_impl(&dword_2266D3000, v6, OS_LOG_TYPE_DEFAULT, "RTI event: %d bytes\n", (uint8_t *)v7, 8u);
  }

  [*(id *)(*(void *)(a1 + 40) + 24) sendEventID:@"_tiC" event:v2 destinationID:*MEMORY[0x263F62C08] options:0 completion:&__block_literal_global_38];
}

void __48__TVRCTextInputSession_handleTextActionPayload___block_invoke_35(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  if (v2)
  {
    v3 = _TVRCRemoteTextInputLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138412290;
      id v5 = v2;
      _os_log_impl(&dword_2266D3000, v3, OS_LOG_TYPE_DEFAULT, "### RTI send text change failed: %@\n", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (void)performDocumentRequest:(id)a3 completion:(id)a4
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _TVRCRemoteTextInputLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "No implementation for performDocumentRequest: %@\n", (uint8_t *)&v6, 0xCu);
  }
}

- (RPMessageable)messenger
{
  return self->_messenger;
}

- (void)setMessenger:(id)a3
{
}

- (RTIInputSystemSourceSession)rtiSession
{
  return self->_rtiSession;
}

- (id)rtiUpdatedHandler
{
  return self->_rtiUpdatedHandler;
}

- (void)setRtiUpdatedHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_rtiUpdatedHandler, 0);
  objc_storeStrong((id *)&self->_rtiSession, 0);
  objc_storeStrong((id *)&self->_messenger, 0);

  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end