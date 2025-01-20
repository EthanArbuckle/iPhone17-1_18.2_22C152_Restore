@interface SRUIFSpeechRequestHandler
- (OS_dispatch_group)_currentSpeechRequestGroup;
- (SRUIFSpeechRequestHandler)initWithDelegate:(id)a3;
- (SRUIFSpeechRequestHandlerDelegate)delegate;
- (id)currentSpeechRequestDispatchGroup;
- (id)prepareForNewSpeechRequest;
- (void)_continuePendingSpeechRequest;
- (void)_performOnCurrentSpeechDipatchGroup:(id)a3;
- (void)_setCurrentSpeechRequestGroup:(id)a3;
- (void)cancelSpeechRequest;
- (void)discardCurrentSpeechGroup;
- (void)nonSpeechRequestWillBegin;
- (void)setDelegate:(id)a3;
- (void)speechRecordingDidFail;
- (void)speechRecordingWillBegin;
- (void)startSpeechRequestWithSpeechFileAtURL:(id)a3 completion:(id)a4;
- (void)startSpeechRequestWithSpeechRequestOptions:(id)a3 instrumentationTurn:(id)a4 isInitialBringUp:(BOOL)a5 completion:(id)a6;
- (void)stopSpeechRequest;
- (void)stopSpeechRequestWithOptions:(id)a3;
- (void)updateSpeechRequestOptions:(id)a3;
@end

@implementation SRUIFSpeechRequestHandler

- (SRUIFSpeechRequestHandler)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SRUIFSpeechRequestHandler;
  v5 = [(SRUIFSpeechRequestHandler *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (void)startSpeechRequestWithSpeechRequestOptions:(id)a3 instrumentationTurn:(id)a4 isInitialBringUp:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  v12 = (void (**)(id, void))a6;
  v13 = [(SRUIFSpeechRequestHandler *)self _currentSpeechRequestGroup];
  if (v13)
  {
    v14 = [(SRUIFSpeechRequestHandler *)self delegate];
    v15 = [v14 connectionForSpeechRequestHandler:self];

    v16 = (os_log_t *)MEMORY[0x263F28348];
    v17 = (void *)*MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      v18 = v17;
      v19 = [v11 turnIdentifier];
      int v29 = 136315394;
      v30 = "-[SRUIFSpeechRequestHandler startSpeechRequestWithSpeechRequestOptions:instrumentationTurn:isInitialBringUp:completion:]";
      __int16 v31 = 2112;
      v32 = v19;
      _os_log_impl(&dword_225FBA000, v18, OS_LOG_TYPE_DEFAULT, "%s #instrumentation Setting turn identifier for speech request %@", (uint8_t *)&v29, 0x16u);
    }
    v20 = [v11 turnIdentifier];
    [v10 setTurnIdentifier:v20];

    if (([v15 isRecording] & 1) == 0)
    {
      v21 = [v15 startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions:v10];
      continuePendingRequest = (void (**)(void))self->_continuePendingRequest;
      if (continuePendingRequest) {
        continuePendingRequest[2]();
      }
      self->_sendContextBeforeContinuingSpeechRequest = 0;
      if (v15)
      {
        v24 = *v16;
        if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEFAULT))
        {
          int v29 = 136315394;
          v30 = "-[SRUIFSpeechRequestHandler startSpeechRequestWithSpeechRequestOptions:instrumentationTurn:isInitialBrin"
                "gUp:completion:]";
          __int16 v31 = 1024;
          LODWORD(v32) = v7;
          _os_log_impl(&dword_225FBA000, v24, OS_LOG_TYPE_DEFAULT, "%s Captured pending speech request dispatch block. Is Initial Bring up %{BOOL}d", (uint8_t *)&v29, 0x12u);
        }
        v25 = (void *)MEMORY[0x22A643DA0](v21);
        id v26 = self->_continuePendingRequest;
        self->_continuePendingRequest = v25;

        self->_sendContextBeforeContinuingSpeechRequest = !v7;
        if (v12) {
          v12[2](v12, 0);
        }
      }
      else
      {
        if (v21) {
          v21[2](v21);
        }
        id v27 = self->_continuePendingRequest;
        self->_continuePendingRequest = 0;

        if (v12)
        {
          v28 = [MEMORY[0x263F28508] errorWithCode:2510 description:@"No AFConnection." underlyingError:0];
          ((void (**)(id, void *))v12)[2](v12, v28);
        }
      }
      goto LABEL_17;
    }
    if (v12)
    {
      v21 = [MEMORY[0x263F28508] errorWithCode:2510 description:@"AFConnection is already recording." underlyingError:0];
      ((void (**)(id, void (**)(void)))v12)[2](v12, v21);
LABEL_17:
    }
LABEL_18:

    goto LABEL_19;
  }
  v22 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    -[SRUIFSpeechRequestHandler startSpeechRequestWithSpeechRequestOptions:instrumentationTurn:isInitialBringUp:completion:](v22);
    if (!v12) {
      goto LABEL_19;
    }
    goto LABEL_9;
  }
  if (v12)
  {
LABEL_9:
    v15 = [MEMORY[0x263F28508] errorWithCode:2510 description:@"No speech request dispatch group." underlyingError:0];
    ((void (**)(id, void *))v12)[2](v12, v15);
    goto LABEL_18;
  }
LABEL_19:
}

- (void)startSpeechRequestWithSpeechFileAtURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(SRUIFSpeechRequestHandler *)self _currentSpeechRequestGroup];
  v9 = v8;
  if (v8) {
    dispatch_group_enter(v8);
  }
  objc_initWeak(&location, self);
  id v10 = [(SRUIFSpeechRequestHandler *)self delegate];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __78__SRUIFSpeechRequestHandler_startSpeechRequestWithSpeechFileAtURL_completion___block_invoke;
  v14[3] = &unk_2647859F8;
  objc_copyWeak(&v18, &location);
  id v11 = v9;
  v15 = v11;
  id v12 = v6;
  id v16 = v12;
  id v13 = v7;
  id v17 = v13;
  [v10 sendContextForSpeechRequestContinuationWithCompletion:v14];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

uint64_t __78__SRUIFSpeechRequestHandler_startSpeechRequestWithSpeechFileAtURL_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v10 = WeakRetained;
  if (WeakRetained)
  {
    v3 = *(void **)(a1 + 32);
    id v4 = [WeakRetained _currentSpeechRequestGroup];

    if (v3 == v4)
    {
      v5 = [v10 delegate];
      id v6 = [v5 connectionForSpeechRequestHandler:v10];
      [v6 startSpeechRequestWithSpeechFileAtURL:*(void *)(a1 + 40)];

      uint64_t v7 = *(void *)(a1 + 48);
      if (v7) {
        (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
      }
    }
  }
  objc_super v8 = *(NSObject **)(a1 + 32);
  if (v8) {
    dispatch_group_leave(v8);
  }
  return MEMORY[0x270F9A758]();
}

- (void)speechRecordingWillBegin
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    BOOL sendContextBeforeContinuingSpeechRequest = self->_sendContextBeforeContinuingSpeechRequest;
    *(_DWORD *)buf = 136315394;
    v9 = "-[SRUIFSpeechRequestHandler speechRecordingWillBegin]";
    __int16 v10 = 1024;
    BOOL v11 = sendContextBeforeContinuingSpeechRequest;
    _os_log_impl(&dword_225FBA000, v3, OS_LOG_TYPE_DEFAULT, "%s Should send context before speech request continuation: %{BOOL}d", buf, 0x12u);
  }
  if (self->_sendContextBeforeContinuingSpeechRequest)
  {
    objc_initWeak((id *)buf, self);
    v5 = [(SRUIFSpeechRequestHandler *)self delegate];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __53__SRUIFSpeechRequestHandler_speechRecordingWillBegin__block_invoke;
    v6[3] = &unk_264785A20;
    objc_copyWeak(&v7, (id *)buf);
    [v5 sendContextForSpeechRequestContinuationWithCompletion:v6];

    objc_destroyWeak(&v7);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    [(SRUIFSpeechRequestHandler *)self _continuePendingSpeechRequest];
  }
}

void __53__SRUIFSpeechRequestHandler_speechRecordingWillBegin__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _continuePendingSpeechRequest];
}

- (void)speechRecordingDidFail
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    v5 = "-[SRUIFSpeechRequestHandler speechRecordingDidFail]";
    _os_log_impl(&dword_225FBA000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v4, 0xCu);
  }
  [(SRUIFSpeechRequestHandler *)self _continuePendingSpeechRequest];
}

- (void)_continuePendingSpeechRequest
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v3 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    id continuePendingRequest = self->_continuePendingRequest;
    v5 = v3;
    uint64_t v6 = (void *)MEMORY[0x22A643DA0](continuePendingRequest);
    int v9 = 136315394;
    __int16 v10 = "-[SRUIFSpeechRequestHandler _continuePendingSpeechRequest]";
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    _os_log_impl(&dword_225FBA000, v5, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v9, 0x16u);
  }
  id v7 = (void (**)(void))self->_continuePendingRequest;
  if (v7)
  {
    v7[2]();
    id v8 = self->_continuePendingRequest;
    self->_id continuePendingRequest = 0;

    self->_BOOL sendContextBeforeContinuingSpeechRequest = 0;
  }
}

- (id)prepareForNewSpeechRequest
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    int v9 = "-[SRUIFSpeechRequestHandler prepareForNewSpeechRequest]";
    _os_log_impl(&dword_225FBA000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v8, 0xCu);
  }
  int v4 = (OS_dispatch_group *)dispatch_group_create();
  currentSpeechRequestGroup = self->_currentSpeechRequestGroup;
  self->_currentSpeechRequestGroup = v4;

  uint64_t v6 = self->_currentSpeechRequestGroup;
  return v6;
}

- (id)currentSpeechRequestDispatchGroup
{
  return self->_currentSpeechRequestGroup;
}

- (void)stopSpeechRequestWithOptions:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v11 = "-[SRUIFSpeechRequestHandler stopSpeechRequestWithOptions:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_225FBA000, v5, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__SRUIFSpeechRequestHandler_stopSpeechRequestWithOptions___block_invoke;
  v7[3] = &unk_264785A48;
  objc_copyWeak(&v9, (id *)buf);
  id v6 = v4;
  id v8 = v6;
  [(SRUIFSpeechRequestHandler *)self _performOnCurrentSpeechDipatchGroup:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

void __58__SRUIFSpeechRequestHandler_stopSpeechRequestWithOptions___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = [WeakRetained delegate];
  id v4 = objc_loadWeakRetained(v2);
  v5 = [v3 connectionForSpeechRequestHandler:v4];
  [v5 stopSpeechWithOptions:*(void *)(a1 + 32)];
}

- (void)stopSpeechRequest
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[SRUIFSpeechRequestHandler stopSpeechRequest]";
    _os_log_impl(&dword_225FBA000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v6, 0xCu);
  }
  id v4 = [(SRUIFSpeechRequestHandler *)self delegate];
  v5 = [v4 connectionForSpeechRequestHandler:self];
  [v5 stopSpeech];
}

- (void)updateSpeechRequestOptions:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v11 = "-[SRUIFSpeechRequestHandler updateSpeechRequestOptions:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_225FBA000, v5, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__SRUIFSpeechRequestHandler_updateSpeechRequestOptions___block_invoke;
  v7[3] = &unk_264785A48;
  objc_copyWeak(&v9, (id *)buf);
  id v6 = v4;
  id v8 = v6;
  [(SRUIFSpeechRequestHandler *)self _performOnCurrentSpeechDipatchGroup:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

void __56__SRUIFSpeechRequestHandler_updateSpeechRequestOptions___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = [WeakRetained delegate];
  id v4 = objc_loadWeakRetained(v2);
  v5 = [v3 connectionForSpeechRequestHandler:v4];
  [v5 updateSpeechOptions:*(void *)(a1 + 32)];
}

- (void)_performOnCurrentSpeechDipatchGroup:(id)a3
{
  id v4 = a3;
  v5 = [(SRUIFSpeechRequestHandler *)self _currentSpeechRequestGroup];
  if (v5)
  {
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __65__SRUIFSpeechRequestHandler__performOnCurrentSpeechDipatchGroup___block_invoke;
    v7[3] = &unk_264785A70;
    objc_copyWeak(&v10, &location);
    dispatch_group_t v8 = v5;
    id v9 = v4;
    dispatch_group_notify(v8, MEMORY[0x263EF83A0], v7);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  else
  {
    id v6 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      -[SRUIFSpeechRequestHandler _performOnCurrentSpeechDipatchGroup:](v6);
    }
  }
}

void __65__SRUIFSpeechRequestHandler__performOnCurrentSpeechDipatchGroup___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = *(void **)(a1 + 32);
    id v5 = WeakRetained;
    id v4 = [WeakRetained _currentSpeechRequestGroup];

    id WeakRetained = v5;
    if (v3 == v4)
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      id WeakRetained = v5;
    }
  }
}

- (void)cancelSpeechRequest
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v3 = (os_log_t *)MEMORY[0x263F28348];
  id v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315138;
    id v13 = "-[SRUIFSpeechRequestHandler cancelSpeechRequest]";
    _os_log_impl(&dword_225FBA000, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v12, 0xCu);
  }
  id v5 = [(SRUIFSpeechRequestHandler *)self delegate];
  [v5 speechRequestHandlerWillCancelSpeechRequest:self];

  id v6 = [(SRUIFSpeechRequestHandler *)self delegate];
  id v7 = [v6 connectionForSpeechRequestHandler:self];

  dispatch_group_t v8 = [(SRUIFSpeechRequestHandler *)self delegate];
  int v9 = [v8 speechRequestHandlerShouldRollBackRequestForSpeechCancellation:self];

  if (v9)
  {
    id v10 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315138;
      id v13 = "-[SRUIFSpeechRequestHandler cancelSpeechRequest]";
      _os_log_impl(&dword_225FBA000, v10, OS_LOG_TYPE_DEFAULT, "%s Delegate specified a rollback is necessary", (uint8_t *)&v12, 0xCu);
    }
    [v7 rollbackRequest];
  }
  [v7 cancelRequest];
  __int16 v11 = [(SRUIFSpeechRequestHandler *)self delegate];
  [v11 speechRequestHandlerDidCancelSpeechRequest:self];
}

- (void)discardCurrentSpeechGroup
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[SRUIFSpeechRequestHandler discardCurrentSpeechGroup]";
    _os_log_impl(&dword_225FBA000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  id v4 = self->_currentSpeechRequestGroup;
  if (v4)
  {
    speechRequestGroupGraveyard = self->_speechRequestGroupGraveyard;
    if (!speechRequestGroupGraveyard)
    {
      id v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
      id v7 = self->_speechRequestGroupGraveyard;
      self->_speechRequestGroupGraveyard = v6;

      speechRequestGroupGraveyard = self->_speechRequestGroupGraveyard;
    }
    if (([(NSMutableSet *)speechRequestGroupGraveyard containsObject:v4] & 1) == 0)
    {
      [(NSMutableSet *)self->_speechRequestGroupGraveyard addObject:v4];
      objc_initWeak((id *)buf, self);
      uint64_t v8 = MEMORY[0x263EF8330];
      uint64_t v9 = 3221225472;
      id v10 = __54__SRUIFSpeechRequestHandler_discardCurrentSpeechGroup__block_invoke;
      __int16 v11 = &unk_264785A48;
      objc_copyWeak(&v13, (id *)buf);
      int v12 = v4;
      dispatch_group_notify((dispatch_group_t)v12, MEMORY[0x263EF83A0], &v8);

      objc_destroyWeak(&v13);
      objc_destroyWeak((id *)buf);
    }
    [(SRUIFSpeechRequestHandler *)self _continuePendingSpeechRequest];
    [(SRUIFSpeechRequestHandler *)self _setCurrentSpeechRequestGroup:0];
  }
}

void __54__SRUIFSpeechRequestHandler_discardCurrentSpeechGroup__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    [WeakRetained[3] removeObject:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

- (void)nonSpeechRequestWillBegin
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = [(SRUIFSpeechRequestHandler *)self delegate];
  id v4 = [v3 connectionForSpeechRequestHandler:self];

  if ([v4 isRecording])
  {
    id v5 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      id v7 = "-[SRUIFSpeechRequestHandler nonSpeechRequestWillBegin]";
      _os_log_impl(&dword_225FBA000, v5, OS_LOG_TYPE_DEFAULT, "%s Request will begin while recording is ongoing. Cancelling speech request", (uint8_t *)&v6, 0xCu);
    }
    [(SRUIFSpeechRequestHandler *)self cancelSpeechRequest];
  }
}

- (OS_dispatch_group)_currentSpeechRequestGroup
{
  return self->_currentSpeechRequestGroup;
}

- (void)_setCurrentSpeechRequestGroup:(id)a3
{
}

- (SRUIFSpeechRequestHandlerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SRUIFSpeechRequestHandlerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentSpeechRequestGroup, 0);
  objc_storeStrong((id *)&self->_speechRequestGroupGraveyard, 0);
  objc_storeStrong(&self->_continuePendingRequest, 0);
}

- (void)startSpeechRequestWithSpeechRequestOptions:(os_log_t)log instrumentationTurn:isInitialBringUp:completion:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "-[SRUIFSpeechRequestHandler startSpeechRequestWithSpeechRequestOptions:instrumentationTurn:isInitialBringUp:completion:]";
  _os_log_error_impl(&dword_225FBA000, log, OS_LOG_TYPE_ERROR, "%s couldn't find a speech request dispatch group", (uint8_t *)&v1, 0xCu);
}

- (void)_performOnCurrentSpeechDipatchGroup:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "-[SRUIFSpeechRequestHandler _performOnCurrentSpeechDipatchGroup:]";
  _os_log_error_impl(&dword_225FBA000, log, OS_LOG_TYPE_ERROR, "%s Speech Request Dispatch Group nil.", (uint8_t *)&v1, 0xCu);
}

@end