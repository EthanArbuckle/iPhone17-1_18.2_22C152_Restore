@interface SVXClientServiceServerConnection
- (NSString)description;
- (NSUUID)uuid;
- (SVXClientServiceServerConnection)initWithXPCConnection:(id)a3 performer:(id)a4 delegate:(id)a5;
- (void)_cleanUpXPCConnection;
- (void)_connectionInterrupted;
- (void)_connectionInvalidated;
- (void)_performBlockAfterConfigure:(id)a3;
- (void)activateWithContext:(id)a3 completion:(id)a4;
- (void)audioPowerDidEndUpdateForType:(int64_t)a3;
- (void)audioPowerWillBeginUpdateForType:(int64_t)a3 wrapper:(id)a4;
- (void)audioSessionDidBecomeActive:(BOOL)a3 activationContext:(id)a4 deactivationContext:(id)a5;
- (void)audioSessionWillBecomeActive:(BOOL)a3 activationContext:(id)a4 deactivationContext:(id)a5;
- (void)cancelPendingSpeechSynthesisRequest:(id)a3;
- (void)configureWithDeviceSetupManager:(id)a3 sessionManager:(id)a4 speechSynthesizer:(id)a5 synthesisManager:(id)a6;
- (void)deactivateWithContext:(id)a3 completion:(id)a4;
- (void)enqueueSpeechSynthesisRequest:(id)a3 completion:(id)a4;
- (void)fetchAlarmAndTimerFiringContextWithCompletion:(id)a3;
- (void)fetchAudioPowerWithType:(int64_t)a3 completion:(id)a4;
- (void)fetchSessionActivityStateWithCompletion:(id)a3;
- (void)fetchSessionStateWithCompletion:(id)a3;
- (void)getInstanceInfoWithCompletion:(id)a3;
- (void)invalidate;
- (void)performManualEndpointing;
- (void)pingWithReply:(id)a3;
- (void)preheatWithActivationSource:(int64_t)a3;
- (void)prepareForDeviceSetupWithContext:(id)a3 completion:(id)a4;
- (void)prewarmRequest:(id)a3;
- (void)prewarmWithContext:(id)a3 completion:(id)a4;
- (void)sessionDidBecomeActiveWithActivationContext:(id)a3 turnID:(id)a4;
- (void)sessionDidChangeFromState:(int64_t)a3 toState:(int64_t)a4;
- (void)sessionDidResignActiveWithDeactivationContext:(id)a3;
- (void)sessionDidStartSoundWithID:(int64_t)a3;
- (void)sessionDidStopSoundWithID:(int64_t)a3 error:(id)a4;
- (void)sessionManager:(id)a3 didActivateWithContext:(id)a4;
- (void)sessionManager:(id)a3 didDeactivateWithContext:(id)a4;
- (void)sessionManager:(id)a3 didNotActivateWithContext:(id)a4 error:(id)a5;
- (void)sessionManager:(id)a3 willActivateWithContext:(id)a4;
- (void)sessionManager:(id)a3 willDeactivateWithContext:(id)a4;
- (void)sessionWillBecomeActiveWithActivationContext:(id)a3 turnID:(id)a4;
- (void)sessionWillChangeFromState:(int64_t)a3 toState:(int64_t)a4;
- (void)sessionWillPresentFeedbackWithDialogIdentifier:(id)a3;
- (void)sessionWillResignActiveWithOptions:(unint64_t)a3 duration:(double)a4;
- (void)sessionWillStartSoundWithID:(int64_t)a3;
- (void)setDeviceSetupContext:(id)a3;
- (void)stopSpeechSynthesisRequest:(id)a3;
- (void)synthesizeRequest:(id)a3 handlerUUID:(id)a4 completion:(id)a5;
- (void)transitToAutomaticEndpointingWithTimestamp:(unint64_t)a3;
@end

@implementation SVXClientServiceServerConnection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_synthesisManager, 0);
  objc_storeStrong((id *)&self->_speechSynthesizer, 0);
  objc_storeStrong((id *)&self->_sessionManager, 0);
  objc_storeStrong((id *)&self->_deviceSetupManager, 0);
  objc_storeStrong((id *)&self->_pendingBlocksAfterConfigure, 0);
  objc_storeStrong((id *)&self->_audioServicesUtils, 0);
  objc_storeStrong((id *)&self->_instanceInfoSupplier, 0);
  objc_storeStrong((id *)&self->_remoteDelegateSupplier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_performer, 0);

  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)_cleanUpXPCConnection
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
  {
    v4 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
    {
      int v7 = 136315394;
      v8 = "-[SVXClientServiceServerConnection _cleanUpXPCConnection]";
      __int16 v9 = 2112;
      v10 = self;
      _os_log_debug_impl(&dword_220062000, v4, OS_LOG_TYPE_DEBUG, "%s %@", (uint8_t *)&v7, 0x16u);
      xpcConnection = self->_xpcConnection;
    }
    [(NSXPCConnection *)xpcConnection setExportedObject:0];
    [(NSXPCConnection *)self->_xpcConnection invalidate];
    v5 = self->_xpcConnection;
    self->_xpcConnection = 0;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained clientServiceServerConnectionDidInvalidate:self];
  }
}

- (void)_connectionInvalidated
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    int v7 = "-[SVXClientServiceServerConnection _connectionInvalidated]";
    __int16 v8 = 2112;
    __int16 v9 = self;
    _os_log_error_impl(&dword_220062000, v3, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
  }
  performer = self->_performer;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __58__SVXClientServiceServerConnection__connectionInvalidated__block_invoke;
  v5[3] = &unk_2645548A0;
  v5[4] = self;
  [(SVXPerforming *)performer performBlock:v5];
}

uint64_t __58__SVXClientServiceServerConnection__connectionInvalidated__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cleanUpXPCConnection];
}

- (void)_connectionInterrupted
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    int v7 = "-[SVXClientServiceServerConnection _connectionInterrupted]";
    __int16 v8 = 2112;
    __int16 v9 = self;
    _os_log_error_impl(&dword_220062000, v3, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
  }
  performer = self->_performer;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __58__SVXClientServiceServerConnection__connectionInterrupted__block_invoke;
  v5[3] = &unk_2645548A0;
  v5[4] = self;
  [(SVXPerforming *)performer performBlock:v5];
}

uint64_t __58__SVXClientServiceServerConnection__connectionInterrupted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cleanUpXPCConnection];
}

- (void)_performBlockAfterConfigure:(id)a3
{
  v4 = (void (**)(void))a3;
  v5 = v4;
  if (v4)
  {
    if (self->_isConfigured)
    {
      v6 = v4[2];
    }
    else
    {
      pendingBlocksAfterConfigure = self->_pendingBlocksAfterConfigure;
      if (pendingBlocksAfterConfigure)
      {
        id v8 = objc_alloc(MEMORY[0x263F285B8]);
        v10[0] = MEMORY[0x263EF8330];
        v10[1] = 3221225472;
        v10[2] = __64__SVXClientServiceServerConnection__performBlockAfterConfigure___block_invoke;
        v10[3] = &unk_264554480;
        uint64_t v11 = v5;
        __int16 v9 = (void *)[v8 initWithBlock:v10];
        [(NSMutableArray *)pendingBlocksAfterConfigure addObject:v9];

        goto LABEL_7;
      }
      v6 = v4[2];
    }
    v6();
  }
LABEL_7:
}

uint64_t __64__SVXClientServiceServerConnection__performBlockAfterConfigure___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 == 0);
}

- (void)audioSessionDidBecomeActive:(BOOL)a3 activationContext:(id)a4 deactivationContext:(id)a5
{
  BOOL v6 = a3;
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    v19 = "-[SVXClientServiceServerConnection audioSessionDidBecomeActive:activationContext:deactivationContext:]";
    __int16 v20 = 1024;
    BOOL v21 = v6;
    __int16 v22 = 2112;
    id v23 = v8;
    __int16 v24 = 2112;
    id v25 = v9;
    _os_log_debug_impl(&dword_220062000, v10, OS_LOG_TYPE_DEBUG, "%s flag = %d, activationContext = %@, deactivationContext = %@", buf, 0x26u);
  }
  performer = self->_performer;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __102__SVXClientServiceServerConnection_audioSessionDidBecomeActive_activationContext_deactivationContext___block_invoke;
  v14[3] = &unk_2645549E0;
  BOOL v17 = v6;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v12 = v9;
  id v13 = v8;
  [(SVXPerforming *)performer performBlock:v14];
}

void __102__SVXClientServiceServerConnection_audioSessionDidBecomeActive_activationContext_deactivationContext___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) remoteServiceDelegateWithConnection:*(void *)(*(void *)(a1 + 32) + 8) errorHandler:&__block_literal_global_73];
  [v2 notifyAudioSessionDidBecomeActive:*(unsigned __int8 *)(a1 + 56) activationContext:*(void *)(a1 + 40) deactivationContext:*(void *)(a1 + 48)];
}

void __102__SVXClientServiceServerConnection_audioSessionDidBecomeActive_activationContext_deactivationContext___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    v5 = "-[SVXClientServiceServerConnection audioSessionDidBecomeActive:activationContext:deactivationContext:]_block_invoke_2";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_220062000, v3, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)audioSessionWillBecomeActive:(BOOL)a3 activationContext:(id)a4 deactivationContext:(id)a5
{
  BOOL v6 = a3;
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    v19 = "-[SVXClientServiceServerConnection audioSessionWillBecomeActive:activationContext:deactivationContext:]";
    __int16 v20 = 1024;
    BOOL v21 = v6;
    __int16 v22 = 2112;
    id v23 = v8;
    __int16 v24 = 2112;
    id v25 = v9;
    _os_log_debug_impl(&dword_220062000, v10, OS_LOG_TYPE_DEBUG, "%s flag = %d, activationContext = %@, deactivationContext = %@", buf, 0x26u);
  }
  performer = self->_performer;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __103__SVXClientServiceServerConnection_audioSessionWillBecomeActive_activationContext_deactivationContext___block_invoke;
  v14[3] = &unk_2645549E0;
  BOOL v17 = v6;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v12 = v9;
  id v13 = v8;
  [(SVXPerforming *)performer performBlock:v14];
}

void __103__SVXClientServiceServerConnection_audioSessionWillBecomeActive_activationContext_deactivationContext___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) remoteServiceDelegateWithConnection:*(void *)(*(void *)(a1 + 32) + 8) errorHandler:&__block_literal_global_71];
  [v2 notifyAudioSessionWillBecomeActive:*(unsigned __int8 *)(a1 + 56) activationContext:*(void *)(a1 + 40) deactivationContext:*(void *)(a1 + 48)];
}

void __103__SVXClientServiceServerConnection_audioSessionWillBecomeActive_activationContext_deactivationContext___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    v5 = "-[SVXClientServiceServerConnection audioSessionWillBecomeActive:activationContext:deactivationContext:]_block_invoke_2";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_220062000, v3, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)sessionDidResignActiveWithDeactivationContext:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v11 = "-[SVXClientServiceServerConnection sessionDidResignActiveWithDeactivationContext:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_debug_impl(&dword_220062000, v5, OS_LOG_TYPE_DEBUG, "%s deactivationContext = %@", buf, 0x16u);
  }
  performer = self->_performer;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __82__SVXClientServiceServerConnection_sessionDidResignActiveWithDeactivationContext___block_invoke;
  v8[3] = &unk_2645548C8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(SVXPerforming *)performer performBlock:v8];
}

void __82__SVXClientServiceServerConnection_sessionDidResignActiveWithDeactivationContext___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) remoteServiceDelegateWithConnection:*(void *)(*(void *)(a1 + 32) + 8) errorHandler:&__block_literal_global_69];
  [v2 notifySessionDidResignActiveWithDeactivationContext:*(void *)(a1 + 40)];
}

void __82__SVXClientServiceServerConnection_sessionDidResignActiveWithDeactivationContext___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    v5 = "-[SVXClientServiceServerConnection sessionDidResignActiveWithDeactivationContext:]_block_invoke_2";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_220062000, v3, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)sessionWillResignActiveWithOptions:(unint64_t)a3 duration:(double)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    id v9 = v7;
    uint64_t v10 = SVXSessionResignActiveOptionsGetNames(a3);
    *(_DWORD *)buf = 136315650;
    id v13 = "-[SVXClientServiceServerConnection sessionWillResignActiveWithOptions:duration:]";
    __int16 v14 = 2112;
    id v15 = v10;
    __int16 v16 = 2048;
    double v17 = a4;
    _os_log_debug_impl(&dword_220062000, v9, OS_LOG_TYPE_DEBUG, "%s options = %@, duration = %f", buf, 0x20u);
  }
  performer = self->_performer;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __80__SVXClientServiceServerConnection_sessionWillResignActiveWithOptions_duration___block_invoke;
  v11[3] = &unk_264554760;
  v11[4] = self;
  v11[5] = a3;
  *(double *)&v11[6] = a4;
  [(SVXPerforming *)performer performBlock:v11];
}

void __80__SVXClientServiceServerConnection_sessionWillResignActiveWithOptions_duration___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) remoteServiceDelegateWithConnection:*(void *)(*(void *)(a1 + 32) + 8) errorHandler:&__block_literal_global_67];
  [v2 notifySessionWillResignActiveWithOptions:*(void *)(a1 + 40) duration:*(double *)(a1 + 48)];
}

void __80__SVXClientServiceServerConnection_sessionWillResignActiveWithOptions_duration___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    v5 = "-[SVXClientServiceServerConnection sessionWillResignActiveWithOptions:duration:]_block_invoke_2";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_220062000, v3, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)sessionDidBecomeActiveWithActivationContext:(id)a3 turnID:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v16 = "-[SVXClientServiceServerConnection sessionDidBecomeActiveWithActivationContext:turnID:]";
    __int16 v17 = 2112;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_debug_impl(&dword_220062000, v8, OS_LOG_TYPE_DEBUG, "%s activationContext = %@, turnID = %@", buf, 0x20u);
  }
  performer = self->_performer;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __87__SVXClientServiceServerConnection_sessionDidBecomeActiveWithActivationContext_turnID___block_invoke;
  v12[3] = &unk_2645547B0;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [(SVXPerforming *)performer performBlock:v12];
}

void __87__SVXClientServiceServerConnection_sessionDidBecomeActiveWithActivationContext_turnID___block_invoke(void *a1)
{
  id v2 = [*(id *)(a1[4] + 32) remoteServiceDelegateWithConnection:*(void *)(a1[4] + 8) errorHandler:&__block_literal_global_65];
  [v2 notifySessionDidBecomeActiveWithActivationContext:a1[5] turnID:a1[6]];
}

void __87__SVXClientServiceServerConnection_sessionDidBecomeActiveWithActivationContext_turnID___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    v5 = "-[SVXClientServiceServerConnection sessionDidBecomeActiveWithActivationContext:turnID:]_block_invoke_2";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_220062000, v3, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)sessionWillBecomeActiveWithActivationContext:(id)a3 turnID:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v16 = "-[SVXClientServiceServerConnection sessionWillBecomeActiveWithActivationContext:turnID:]";
    __int16 v17 = 2112;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_debug_impl(&dword_220062000, v8, OS_LOG_TYPE_DEBUG, "%s activationContext = %@, turnID = %@", buf, 0x20u);
  }
  performer = self->_performer;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __88__SVXClientServiceServerConnection_sessionWillBecomeActiveWithActivationContext_turnID___block_invoke;
  v12[3] = &unk_2645547B0;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [(SVXPerforming *)performer performBlock:v12];
}

void __88__SVXClientServiceServerConnection_sessionWillBecomeActiveWithActivationContext_turnID___block_invoke(void *a1)
{
  id v2 = [*(id *)(a1[4] + 32) remoteServiceDelegateWithConnection:*(void *)(a1[4] + 8) errorHandler:&__block_literal_global_63];
  [v2 notifySessionWillBecomeActiveWithActivationContext:a1[5] turnID:a1[6]];
}

void __88__SVXClientServiceServerConnection_sessionWillBecomeActiveWithActivationContext_turnID___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    v5 = "-[SVXClientServiceServerConnection sessionWillBecomeActiveWithActivationContext:turnID:]_block_invoke_2";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_220062000, v3, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)sessionDidStopSoundWithID:(int64_t)a3 error:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    id v10 = v7;
    if ((unint64_t)a3 > 6) {
      id v11 = @"(unknown)";
    }
    else {
      id v11 = off_2645530B0[a3];
    }
    __int16 v12 = v11;
    *(_DWORD *)buf = 136315650;
    __int16 v17 = "-[SVXClientServiceServerConnection sessionDidStopSoundWithID:error:]";
    __int16 v18 = 2112;
    __int16 v19 = v12;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_debug_impl(&dword_220062000, v10, OS_LOG_TYPE_DEBUG, "%s soundID = %@, error = %@", buf, 0x20u);
  }
  performer = self->_performer;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __68__SVXClientServiceServerConnection_sessionDidStopSoundWithID_error___block_invoke;
  v13[3] = &unk_264554738;
  id v14 = v6;
  int64_t v15 = a3;
  v13[4] = self;
  id v9 = v6;
  [(SVXPerforming *)performer performBlock:v13];
}

void __68__SVXClientServiceServerConnection_sessionDidStopSoundWithID_error___block_invoke(void *a1)
{
  id v2 = [*(id *)(a1[4] + 32) remoteServiceDelegateWithConnection:*(void *)(a1[4] + 8) errorHandler:&__block_literal_global_61];
  [v2 notifySessionDidStopSoundWithID:a1[6] error:a1[5]];
}

void __68__SVXClientServiceServerConnection_sessionDidStopSoundWithID_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    v5 = "-[SVXClientServiceServerConnection sessionDidStopSoundWithID:error:]_block_invoke_2";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_220062000, v3, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)sessionDidStartSoundWithID:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v5 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    id v7 = v5;
    if ((unint64_t)a3 > 6) {
      uint64_t v8 = @"(unknown)";
    }
    else {
      uint64_t v8 = off_2645530B0[a3];
    }
    id v9 = v8;
    *(_DWORD *)buf = 136315394;
    __int16 v12 = "-[SVXClientServiceServerConnection sessionDidStartSoundWithID:]";
    __int16 v13 = 2112;
    id v14 = v9;
    _os_log_debug_impl(&dword_220062000, v7, OS_LOG_TYPE_DEBUG, "%s soundID = %@", buf, 0x16u);
  }
  performer = self->_performer;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __63__SVXClientServiceServerConnection_sessionDidStartSoundWithID___block_invoke;
  v10[3] = &unk_264554548;
  void v10[4] = self;
  v10[5] = a3;
  [(SVXPerforming *)performer performBlock:v10];
}

void __63__SVXClientServiceServerConnection_sessionDidStartSoundWithID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) remoteServiceDelegateWithConnection:*(void *)(*(void *)(a1 + 32) + 8) errorHandler:&__block_literal_global_59];
  [v2 notifySessionDidStartSoundWithID:*(void *)(a1 + 40)];
}

void __63__SVXClientServiceServerConnection_sessionDidStartSoundWithID___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    v5 = "-[SVXClientServiceServerConnection sessionDidStartSoundWithID:]_block_invoke_2";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_220062000, v3, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)sessionWillStartSoundWithID:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v5 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    id v7 = v5;
    if ((unint64_t)a3 > 6) {
      uint64_t v8 = @"(unknown)";
    }
    else {
      uint64_t v8 = off_2645530B0[a3];
    }
    id v9 = v8;
    *(_DWORD *)buf = 136315394;
    __int16 v12 = "-[SVXClientServiceServerConnection sessionWillStartSoundWithID:]";
    __int16 v13 = 2112;
    id v14 = v9;
    _os_log_debug_impl(&dword_220062000, v7, OS_LOG_TYPE_DEBUG, "%s soundID = %@", buf, 0x16u);
  }
  performer = self->_performer;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __64__SVXClientServiceServerConnection_sessionWillStartSoundWithID___block_invoke;
  v10[3] = &unk_264554548;
  void v10[4] = self;
  v10[5] = a3;
  [(SVXPerforming *)performer performBlock:v10];
}

void __64__SVXClientServiceServerConnection_sessionWillStartSoundWithID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) remoteServiceDelegateWithConnection:*(void *)(*(void *)(a1 + 32) + 8) errorHandler:&__block_literal_global_57];
  [v2 notifySessionWillStartSoundWithID:*(void *)(a1 + 40)];
}

void __64__SVXClientServiceServerConnection_sessionWillStartSoundWithID___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    v5 = "-[SVXClientServiceServerConnection sessionWillStartSoundWithID:]_block_invoke_2";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_220062000, v3, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)sessionWillPresentFeedbackWithDialogIdentifier:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v11 = "-[SVXClientServiceServerConnection sessionWillPresentFeedbackWithDialogIdentifier:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_debug_impl(&dword_220062000, v5, OS_LOG_TYPE_DEBUG, "%s dialogIdentifier = %@", buf, 0x16u);
  }
  performer = self->_performer;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __83__SVXClientServiceServerConnection_sessionWillPresentFeedbackWithDialogIdentifier___block_invoke;
  v8[3] = &unk_2645548C8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(SVXPerforming *)performer performBlock:v8];
}

void __83__SVXClientServiceServerConnection_sessionWillPresentFeedbackWithDialogIdentifier___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) remoteServiceDelegateWithConnection:*(void *)(*(void *)(a1 + 32) + 8) errorHandler:&__block_literal_global_55];
  [v2 notifySessionWillPresentFeedbackWithDialogIdentifier:*(void *)(a1 + 40)];
}

void __83__SVXClientServiceServerConnection_sessionWillPresentFeedbackWithDialogIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    v5 = "-[SVXClientServiceServerConnection sessionWillPresentFeedbackWithDialogIdentifier:]_block_invoke_2";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_220062000, v3, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)sessionDidChangeFromState:(int64_t)a3 toState:(int64_t)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    id v9 = v7;
    if ((unint64_t)a3 > 4) {
      id v10 = @"(unknown)";
    }
    else {
      id v10 = off_2645542F8[a3];
    }
    id v11 = v10;
    if ((unint64_t)a4 > 4) {
      __int16 v12 = @"(unknown)";
    }
    else {
      __int16 v12 = off_2645542F8[a4];
    }
    id v13 = v12;
    *(_DWORD *)buf = 136315650;
    __int16 v16 = "-[SVXClientServiceServerConnection sessionDidChangeFromState:toState:]";
    __int16 v17 = 2112;
    __int16 v18 = v11;
    __int16 v19 = 2112;
    __int16 v20 = v13;
    _os_log_debug_impl(&dword_220062000, v9, OS_LOG_TYPE_DEBUG, "%s fromState = %@, toState = %@", buf, 0x20u);
  }
  performer = self->_performer;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __70__SVXClientServiceServerConnection_sessionDidChangeFromState_toState___block_invoke;
  v14[3] = &unk_264554760;
  v14[4] = self;
  void v14[5] = a3;
  v14[6] = a4;
  [(SVXPerforming *)performer performBlock:v14];
}

void __70__SVXClientServiceServerConnection_sessionDidChangeFromState_toState___block_invoke(void *a1)
{
  id v2 = [*(id *)(a1[4] + 32) remoteServiceDelegateWithConnection:*(void *)(a1[4] + 8) errorHandler:&__block_literal_global_53];
  [v2 notifyDidChangeSessionStateFrom:a1[5] to:a1[6]];
}

void __70__SVXClientServiceServerConnection_sessionDidChangeFromState_toState___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    v5 = "-[SVXClientServiceServerConnection sessionDidChangeFromState:toState:]_block_invoke_2";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_220062000, v3, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)sessionWillChangeFromState:(int64_t)a3 toState:(int64_t)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    id v9 = v7;
    if ((unint64_t)a3 > 4) {
      id v10 = @"(unknown)";
    }
    else {
      id v10 = off_2645542F8[a3];
    }
    id v11 = v10;
    if ((unint64_t)a4 > 4) {
      __int16 v12 = @"(unknown)";
    }
    else {
      __int16 v12 = off_2645542F8[a4];
    }
    id v13 = v12;
    *(_DWORD *)buf = 136315650;
    __int16 v16 = "-[SVXClientServiceServerConnection sessionWillChangeFromState:toState:]";
    __int16 v17 = 2112;
    __int16 v18 = v11;
    __int16 v19 = 2112;
    __int16 v20 = v13;
    _os_log_debug_impl(&dword_220062000, v9, OS_LOG_TYPE_DEBUG, "%s fromState = %@, toState = %@", buf, 0x20u);
  }
  performer = self->_performer;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __71__SVXClientServiceServerConnection_sessionWillChangeFromState_toState___block_invoke;
  v14[3] = &unk_264554760;
  v14[4] = self;
  void v14[5] = a3;
  v14[6] = a4;
  [(SVXPerforming *)performer performBlock:v14];
}

void __71__SVXClientServiceServerConnection_sessionWillChangeFromState_toState___block_invoke(void *a1)
{
  id v2 = [*(id *)(a1[4] + 32) remoteServiceDelegateWithConnection:*(void *)(a1[4] + 8) errorHandler:&__block_literal_global_51];
  [v2 notifyWillChangeSessionStateFrom:a1[5] to:a1[6]];
}

void __71__SVXClientServiceServerConnection_sessionWillChangeFromState_toState___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    v5 = "-[SVXClientServiceServerConnection sessionWillChangeFromState:toState:]_block_invoke_2";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_220062000, v3, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)audioPowerDidEndUpdateForType:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v5 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    id v7 = v5;
    if ((unint64_t)a3 > 2) {
      uint64_t v8 = @"(unknown)";
    }
    else {
      uint64_t v8 = off_264552C98[a3];
    }
    id v9 = v8;
    *(_DWORD *)buf = 136315394;
    __int16 v12 = "-[SVXClientServiceServerConnection audioPowerDidEndUpdateForType:]";
    __int16 v13 = 2112;
    uint64_t v14 = v9;
    _os_log_debug_impl(&dword_220062000, v7, OS_LOG_TYPE_DEBUG, "%s type = %@", buf, 0x16u);
  }
  performer = self->_performer;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __66__SVXClientServiceServerConnection_audioPowerDidEndUpdateForType___block_invoke;
  v10[3] = &unk_264554548;
  void v10[4] = self;
  v10[5] = a3;
  [(SVXPerforming *)performer performBlock:v10];
}

void __66__SVXClientServiceServerConnection_audioPowerDidEndUpdateForType___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) remoteServiceDelegateWithConnection:*(void *)(*(void *)(a1 + 32) + 8) errorHandler:&__block_literal_global_49];
  [v2 notifyDidEndUpdateAudioPowerWithType:*(void *)(a1 + 40)];
}

void __66__SVXClientServiceServerConnection_audioPowerDidEndUpdateForType___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    v5 = "-[SVXClientServiceServerConnection audioPowerDidEndUpdateForType:]_block_invoke_2";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_220062000, v3, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)audioPowerWillBeginUpdateForType:(int64_t)a3 wrapper:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    id v10 = v7;
    if ((unint64_t)a3 > 2) {
      id v11 = @"(unknown)";
    }
    else {
      id v11 = off_264552C98[a3];
    }
    __int16 v12 = v11;
    *(_DWORD *)buf = 136315650;
    __int16 v17 = "-[SVXClientServiceServerConnection audioPowerWillBeginUpdateForType:wrapper:]";
    __int16 v18 = 2112;
    __int16 v19 = v12;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_debug_impl(&dword_220062000, v10, OS_LOG_TYPE_DEBUG, "%s type = %@, wrapper = %@", buf, 0x20u);
  }
  performer = self->_performer;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __77__SVXClientServiceServerConnection_audioPowerWillBeginUpdateForType_wrapper___block_invoke;
  v13[3] = &unk_264554738;
  id v14 = v6;
  int64_t v15 = a3;
  v13[4] = self;
  id v9 = v6;
  [(SVXPerforming *)performer performBlock:v13];
}

void __77__SVXClientServiceServerConnection_audioPowerWillBeginUpdateForType_wrapper___block_invoke(void *a1)
{
  id v2 = [*(id *)(a1[4] + 32) remoteServiceDelegateWithConnection:*(void *)(a1[4] + 8) errorHandler:&__block_literal_global_47];
  [v2 notifyWillBeginUpdateAudioPowerWithType:a1[6] wrapper:a1[5]];
}

void __77__SVXClientServiceServerConnection_audioPowerWillBeginUpdateForType_wrapper___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    v5 = "-[SVXClientServiceServerConnection audioPowerWillBeginUpdateForType:wrapper:]_block_invoke_2";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_220062000, v3, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)sessionManager:(id)a3 didDeactivateWithContext:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a4;
  __int16 v6 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v12 = "-[SVXClientServiceServerConnection sessionManager:didDeactivateWithContext:]";
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_debug_impl(&dword_220062000, v6, OS_LOG_TYPE_DEBUG, "%s context = %@", buf, 0x16u);
  }
  performer = self->_performer;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __76__SVXClientServiceServerConnection_sessionManager_didDeactivateWithContext___block_invoke;
  v9[3] = &unk_2645548C8;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  [(SVXPerforming *)performer performBlock:v9];
}

void __76__SVXClientServiceServerConnection_sessionManager_didDeactivateWithContext___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) remoteServiceDelegateWithConnection:*(void *)(*(void *)(a1 + 32) + 8) errorHandler:&__block_literal_global_45];
  [v2 notifyDidDeactivateWithContext:*(void *)(a1 + 40)];
}

void __76__SVXClientServiceServerConnection_sessionManager_didDeactivateWithContext___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    id v5 = "-[SVXClientServiceServerConnection sessionManager:didDeactivateWithContext:]_block_invoke_2";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_220062000, v3, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)sessionManager:(id)a3 willDeactivateWithContext:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a4;
  __int16 v6 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v12 = "-[SVXClientServiceServerConnection sessionManager:willDeactivateWithContext:]";
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_debug_impl(&dword_220062000, v6, OS_LOG_TYPE_DEBUG, "%s context = %@", buf, 0x16u);
  }
  performer = self->_performer;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __77__SVXClientServiceServerConnection_sessionManager_willDeactivateWithContext___block_invoke;
  v9[3] = &unk_2645548C8;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  [(SVXPerforming *)performer performBlock:v9];
}

void __77__SVXClientServiceServerConnection_sessionManager_willDeactivateWithContext___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) remoteServiceDelegateWithConnection:*(void *)(*(void *)(a1 + 32) + 8) errorHandler:&__block_literal_global_43];
  [v2 notifyWillDeactivateWithContext:*(void *)(a1 + 40)];
}

void __77__SVXClientServiceServerConnection_sessionManager_willDeactivateWithContext___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    id v5 = "-[SVXClientServiceServerConnection sessionManager:willDeactivateWithContext:]_block_invoke_2";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_220062000, v3, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)sessionManager:(id)a3 didNotActivateWithContext:(id)a4 error:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  id v9 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v17 = "-[SVXClientServiceServerConnection sessionManager:didNotActivateWithContext:error:]";
    __int16 v18 = 2112;
    id v19 = v7;
    __int16 v20 = 2112;
    id v21 = v8;
    _os_log_debug_impl(&dword_220062000, v9, OS_LOG_TYPE_DEBUG, "%s context = %@, error = %@", buf, 0x20u);
  }
  performer = self->_performer;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __83__SVXClientServiceServerConnection_sessionManager_didNotActivateWithContext_error___block_invoke;
  v13[3] = &unk_2645547B0;
  v13[4] = self;
  id v14 = v7;
  id v15 = v8;
  id v11 = v8;
  id v12 = v7;
  [(SVXPerforming *)performer performBlock:v13];
}

void __83__SVXClientServiceServerConnection_sessionManager_didNotActivateWithContext_error___block_invoke(void *a1)
{
  id v2 = [*(id *)(a1[4] + 32) remoteServiceDelegateWithConnection:*(void *)(a1[4] + 8) errorHandler:&__block_literal_global_41];
  [v2 notifyDidNotActivateWithContext:a1[5] error:a1[6]];
}

void __83__SVXClientServiceServerConnection_sessionManager_didNotActivateWithContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    id v5 = "-[SVXClientServiceServerConnection sessionManager:didNotActivateWithContext:error:]_block_invoke_2";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_220062000, v3, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)sessionManager:(id)a3 didActivateWithContext:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a4;
  __int16 v6 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v12 = "-[SVXClientServiceServerConnection sessionManager:didActivateWithContext:]";
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_debug_impl(&dword_220062000, v6, OS_LOG_TYPE_DEBUG, "%s context = %@", buf, 0x16u);
  }
  performer = self->_performer;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __74__SVXClientServiceServerConnection_sessionManager_didActivateWithContext___block_invoke;
  v9[3] = &unk_2645548C8;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  [(SVXPerforming *)performer performBlock:v9];
}

void __74__SVXClientServiceServerConnection_sessionManager_didActivateWithContext___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) remoteServiceDelegateWithConnection:*(void *)(*(void *)(a1 + 32) + 8) errorHandler:&__block_literal_global_39];
  [v2 notifyDidActivateWithContext:*(void *)(a1 + 40)];
}

void __74__SVXClientServiceServerConnection_sessionManager_didActivateWithContext___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    id v5 = "-[SVXClientServiceServerConnection sessionManager:didActivateWithContext:]_block_invoke_2";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_220062000, v3, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)sessionManager:(id)a3 willActivateWithContext:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a4;
  __int16 v6 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v12 = "-[SVXClientServiceServerConnection sessionManager:willActivateWithContext:]";
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_debug_impl(&dword_220062000, v6, OS_LOG_TYPE_DEBUG, "%s context = %@", buf, 0x16u);
  }
  performer = self->_performer;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __75__SVXClientServiceServerConnection_sessionManager_willActivateWithContext___block_invoke;
  v9[3] = &unk_2645548C8;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  [(SVXPerforming *)performer performBlock:v9];
}

void __75__SVXClientServiceServerConnection_sessionManager_willActivateWithContext___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) remoteServiceDelegateWithConnection:*(void *)(*(void *)(a1 + 32) + 8) errorHandler:&__block_literal_global_37];
  [v2 notifyWillActivateWithContext:*(void *)(a1 + 40)];
}

void __75__SVXClientServiceServerConnection_sessionManager_willActivateWithContext___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    id v5 = "-[SVXClientServiceServerConnection sessionManager:willActivateWithContext:]_block_invoke_2";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_220062000, v3, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)prepareForDeviceSetupWithContext:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v16 = "-[SVXClientServiceServerConnection prepareForDeviceSetupWithContext:completion:]";
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_debug_impl(&dword_220062000, v8, OS_LOG_TYPE_DEBUG, "%s context = %@", buf, 0x16u);
  }
  performer = self->_performer;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __80__SVXClientServiceServerConnection_prepareForDeviceSetupWithContext_completion___block_invoke;
  v12[3] = &unk_264554788;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [(SVXPerforming *)performer performBlock:v12];
}

void __80__SVXClientServiceServerConnection_prepareForDeviceSetupWithContext_completion___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __80__SVXClientServiceServerConnection_prepareForDeviceSetupWithContext_completion___block_invoke_2;
  v3[3] = &unk_264554570;
  v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 _performBlockAfterConfigure:v3];
}

void __80__SVXClientServiceServerConnection_prepareForDeviceSetupWithContext_completion___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = *(void **)(*(void *)(a1 + 32) + 72);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __80__SVXClientServiceServerConnection_prepareForDeviceSetupWithContext_completion___block_invoke_3;
    v9[3] = &unk_2645546F0;
    id v10 = *(id *)(a1 + 48);
    [v4 prepareForSetupWithContext:v3 completion:v9];
    id v5 = v10;
LABEL_7:

    return;
  }
  id v6 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    id v12 = "-[SVXClientServiceServerConnection prepareForDeviceSetupWithContext:completion:]_block_invoke";
    __int16 v13 = 2112;
    uint64_t v14 = v8;
    _os_log_error_impl(&dword_220062000, v6, OS_LOG_TYPE_ERROR, "%s %@ is not configured or already invalidated.", buf, 0x16u);
  }
  uint64_t v7 = *(void *)(a1 + 48);
  if (v7)
  {
    id v5 = [MEMORY[0x263F087E8] errorWithDomain:@"SiriVOXErrorDomain" code:6 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v5);
    goto LABEL_7;
  }
}

void __80__SVXClientServiceServerConnection_prepareForDeviceSetupWithContext_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    int v9 = 136315650;
    id v10 = "-[SVXClientServiceServerConnection prepareForDeviceSetupWithContext:completion:]_block_invoke_3";
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_debug_impl(&dword_220062000, v7, OS_LOG_TYPE_DEBUG, "%s flow = %@, error = %@", (uint8_t *)&v9, 0x20u);
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);
  }
}

- (void)setDeviceSetupContext:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v11 = "-[SVXClientServiceServerConnection setDeviceSetupContext:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_debug_impl(&dword_220062000, v5, OS_LOG_TYPE_DEBUG, "%s context = %@", buf, 0x16u);
  }
  performer = self->_performer;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __58__SVXClientServiceServerConnection_setDeviceSetupContext___block_invoke;
  v8[3] = &unk_2645548C8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(SVXPerforming *)performer performBlock:v8];
}

void __58__SVXClientServiceServerConnection_setDeviceSetupContext___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __58__SVXClientServiceServerConnection_setDeviceSetupContext___block_invoke_2;
  v2[3] = &unk_264554678;
  v2[4] = v1;
  id v3 = *(id *)(a1 + 40);
  [v1 _performBlockAfterConfigure:v2];
}

void __58__SVXClientServiceServerConnection_setDeviceSetupContext___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (a2)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = (void *)v3[9];
    id v8 = [v3 uuid];
    objc_msgSend(v5, "setContext:forUUID:", v4);
  }
  else
  {
    id v6 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      id v10 = "-[SVXClientServiceServerConnection setDeviceSetupContext:]_block_invoke_2";
      __int16 v11 = 2112;
      uint64_t v12 = v7;
      _os_log_error_impl(&dword_220062000, v6, OS_LOG_TYPE_ERROR, "%s %@ is not configured or already invalidated.", buf, 0x16u);
    }
  }
}

- (void)stopSpeechSynthesisRequest:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v11 = "-[SVXClientServiceServerConnection stopSpeechSynthesisRequest:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_debug_impl(&dword_220062000, v5, OS_LOG_TYPE_DEBUG, "%s request = %@", buf, 0x16u);
  }
  performer = self->_performer;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __63__SVXClientServiceServerConnection_stopSpeechSynthesisRequest___block_invoke;
  v8[3] = &unk_2645548C8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(SVXPerforming *)performer performBlock:v8];
}

void __63__SVXClientServiceServerConnection_stopSpeechSynthesisRequest___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __63__SVXClientServiceServerConnection_stopSpeechSynthesisRequest___block_invoke_2;
  v2[3] = &unk_264554678;
  v2[4] = v1;
  id v3 = *(id *)(a1 + 40);
  [v1 _performBlockAfterConfigure:v2];
}

void __63__SVXClientServiceServerConnection_stopSpeechSynthesisRequest___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = *(void **)(*(void *)(a1 + 32) + 88);
    [v4 stopRequest:v3 withInterruptionBehavior:1];
  }
  else
  {
    id v5 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 136315394;
      id v8 = "-[SVXClientServiceServerConnection stopSpeechSynthesisRequest:]_block_invoke_2";
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      _os_log_error_impl(&dword_220062000, v5, OS_LOG_TYPE_ERROR, "%s %@ is not configured or already invalidated.", (uint8_t *)&v7, 0x16u);
    }
  }
}

- (void)cancelPendingSpeechSynthesisRequest:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v11 = "-[SVXClientServiceServerConnection cancelPendingSpeechSynthesisRequest:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_debug_impl(&dword_220062000, v5, OS_LOG_TYPE_DEBUG, "%s request = %@", buf, 0x16u);
  }
  performer = self->_performer;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __72__SVXClientServiceServerConnection_cancelPendingSpeechSynthesisRequest___block_invoke;
  v8[3] = &unk_2645548C8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(SVXPerforming *)performer performBlock:v8];
}

void __72__SVXClientServiceServerConnection_cancelPendingSpeechSynthesisRequest___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __72__SVXClientServiceServerConnection_cancelPendingSpeechSynthesisRequest___block_invoke_2;
  v2[3] = &unk_264554678;
  v2[4] = v1;
  id v3 = *(id *)(a1 + 40);
  [v1 _performBlockAfterConfigure:v2];
}

void __72__SVXClientServiceServerConnection_cancelPendingSpeechSynthesisRequest___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = *(void **)(*(void *)(a1 + 32) + 88);
    [v4 cancelRequest:v3];
  }
  else
  {
    id v5 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 136315394;
      id v8 = "-[SVXClientServiceServerConnection cancelPendingSpeechSynthesisRequest:]_block_invoke_2";
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      _os_log_error_impl(&dword_220062000, v5, OS_LOG_TYPE_ERROR, "%s %@ is not configured or already invalidated.", (uint8_t *)&v7, 0x16u);
    }
  }
}

- (void)enqueueSpeechSynthesisRequest:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v16 = "-[SVXClientServiceServerConnection enqueueSpeechSynthesisRequest:completion:]";
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_debug_impl(&dword_220062000, v8, OS_LOG_TYPE_DEBUG, "%s request = %@", buf, 0x16u);
  }
  performer = self->_performer;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __77__SVXClientServiceServerConnection_enqueueSpeechSynthesisRequest_completion___block_invoke;
  v12[3] = &unk_264554788;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [(SVXPerforming *)performer performBlock:v12];
}

void __77__SVXClientServiceServerConnection_enqueueSpeechSynthesisRequest_completion___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __77__SVXClientServiceServerConnection_enqueueSpeechSynthesisRequest_completion___block_invoke_2;
  v3[3] = &unk_264554570;
  v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 _performBlockAfterConfigure:v3];
}

void __77__SVXClientServiceServerConnection_enqueueSpeechSynthesisRequest_completion___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = *(void **)(*(void *)(a1 + 32) + 88);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __77__SVXClientServiceServerConnection_enqueueSpeechSynthesisRequest_completion___block_invoke_3;
    v11[3] = &unk_2645546C8;
    id v12 = *(id *)(a1 + 48);
    [v4 enqueueRequest:v3 languageCode:0 voiceName:0 gender:0 audioSessionID:0 preparation:0 finalization:v11 taskTracker:0 analyticsContext:0];
    id v5 = v12;
LABEL_7:

    return;
  }
  id v6 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    id v14 = "-[SVXClientServiceServerConnection enqueueSpeechSynthesisRequest:completion:]_block_invoke";
    __int16 v15 = 2112;
    uint64_t v16 = v10;
    _os_log_error_impl(&dword_220062000, v6, OS_LOG_TYPE_ERROR, "%s %@ is not configured or already invalidated.", buf, 0x16u);
  }
  uint64_t v7 = *(void *)(a1 + 48);
  if (v7)
  {
    id v8 = [SVXSpeechSynthesisResult alloc];
    id v5 = [MEMORY[0x263F087E8] errorWithDomain:@"SiriVOXErrorDomain" code:6 userInfo:0];
    __int16 v9 = [(SVXSpeechSynthesisResult *)v8 initWithType:4 utteranceInfo:0 error:v5];
    (*(void (**)(uint64_t, SVXSpeechSynthesisResult *))(v7 + 16))(v7, v9);

    goto LABEL_7;
  }
}

void __77__SVXClientServiceServerConnection_enqueueSpeechSynthesisRequest_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315394;
    uint64_t v7 = "-[SVXClientServiceServerConnection enqueueSpeechSynthesisRequest:completion:]_block_invoke_3";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_debug_impl(&dword_220062000, v4, OS_LOG_TYPE_DEBUG, "%s result = %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)synthesizeRequest:(id)a3 handlerUUID:(id)a4 completion:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    id v21 = "-[SVXClientServiceServerConnection synthesizeRequest:handlerUUID:completion:]";
    __int16 v22 = 2112;
    id v23 = v8;
    __int16 v24 = 2112;
    id v25 = v9;
    _os_log_debug_impl(&dword_220062000, v11, OS_LOG_TYPE_DEBUG, "%s request = %@, handlerUUID = %@", buf, 0x20u);
  }
  performer = self->_performer;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __77__SVXClientServiceServerConnection_synthesizeRequest_handlerUUID_completion___block_invoke;
  v16[3] = &unk_264554918;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  [(SVXPerforming *)performer performBlock:v16];
}

void __77__SVXClientServiceServerConnection_synthesizeRequest_handlerUUID_completion___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __77__SVXClientServiceServerConnection_synthesizeRequest_handlerUUID_completion___block_invoke_2;
  v3[3] = &unk_2645546A0;
  v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  [v2 _performBlockAfterConfigure:v3];
}

void __77__SVXClientServiceServerConnection_synthesizeRequest_handlerUUID_completion___block_invoke_2(void *a1, int a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (a2)
  {
    uint64_t v4 = a1[4];
    uint64_t v3 = a1[5];
    id v5 = *(void **)(v4 + 96);
    uint64_t v6 = *(void *)(v4 + 8);
    uint64_t v7 = a1[6];
    uint64_t v8 = a1[7];
    [v5 synthesizeRequest:v3 xpcConnection:v6 handlerUUID:v7 completion:v8];
  }
  else
  {
    id v9 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = a1[4];
      int v15 = 136315394;
      uint64_t v16 = "-[SVXClientServiceServerConnection synthesizeRequest:handlerUUID:completion:]_block_invoke_2";
      __int16 v17 = 2112;
      uint64_t v18 = v14;
      _os_log_error_impl(&dword_220062000, v9, OS_LOG_TYPE_ERROR, "%s %@ is not configured or already invalidated.", (uint8_t *)&v15, 0x16u);
    }
    uint64_t v10 = a1[7];
    if (v10)
    {
      id v11 = [SVXSpeechSynthesisResult alloc];
      id v12 = [MEMORY[0x263F087E8] errorWithDomain:@"SiriVOXErrorDomain" code:6 userInfo:0];
      id v13 = [(SVXSpeechSynthesisResult *)v11 initWithType:4 utteranceInfo:0 error:v12];
      (*(void (**)(uint64_t, SVXSpeechSynthesisResult *))(v10 + 16))(v10, v13);
    }
  }
}

- (void)prewarmRequest:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v11 = "-[SVXClientServiceServerConnection prewarmRequest:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_debug_impl(&dword_220062000, v5, OS_LOG_TYPE_DEBUG, "%s request = %@", buf, 0x16u);
  }
  performer = self->_performer;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __51__SVXClientServiceServerConnection_prewarmRequest___block_invoke;
  v8[3] = &unk_2645548C8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(SVXPerforming *)performer performBlock:v8];
}

void __51__SVXClientServiceServerConnection_prewarmRequest___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __51__SVXClientServiceServerConnection_prewarmRequest___block_invoke_2;
  v2[3] = &unk_264554678;
  v2[4] = v1;
  id v3 = *(id *)(a1 + 40);
  [v1 _performBlockAfterConfigure:v2];
}

void __51__SVXClientServiceServerConnection_prewarmRequest___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = *(void **)(*(void *)(a1 + 32) + 88);
    [v4 prewarmRequest:v3];
  }
  else
  {
    id v5 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 136315394;
      uint64_t v8 = "-[SVXClientServiceServerConnection prewarmRequest:]_block_invoke_2";
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      _os_log_error_impl(&dword_220062000, v5, OS_LOG_TYPE_ERROR, "%s %@ is not configured or already invalidated.", (uint8_t *)&v7, 0x16u);
    }
  }
}

- (void)fetchAudioPowerWithType:(int64_t)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a4;
  int v7 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    __int16 v9 = v7;
    if ((unint64_t)a3 > 2) {
      uint64_t v10 = @"(unknown)";
    }
    else {
      uint64_t v10 = off_264552C98[a3];
    }
    uint64_t v11 = v10;
    *(_DWORD *)buf = 136315394;
    uint64_t v16 = "-[SVXClientServiceServerConnection fetchAudioPowerWithType:completion:]";
    __int16 v17 = 2112;
    uint64_t v18 = v11;
    _os_log_debug_impl(&dword_220062000, v9, OS_LOG_TYPE_DEBUG, "%s type = %@", buf, 0x16u);

    if (v6) {
      goto LABEL_3;
    }
  }
  else if (v6)
  {
LABEL_3:
    performer = self->_performer;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __71__SVXClientServiceServerConnection_fetchAudioPowerWithType_completion___block_invoke;
    v12[3] = &unk_264554650;
    v12[4] = self;
    int64_t v14 = a3;
    id v13 = v6;
    [(SVXPerforming *)performer performBlock:v12];
  }
}

void __71__SVXClientServiceServerConnection_fetchAudioPowerWithType_completion___block_invoke(void *a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __71__SVXClientServiceServerConnection_fetchAudioPowerWithType_completion___block_invoke_2;
  v3[3] = &unk_264554628;
  uint64_t v1 = a1[6];
  id v2 = (void *)a1[5];
  id v4 = (id)a1[4];
  uint64_t v6 = v1;
  id v5 = v2;
  [v4 _performBlockAfterConfigure:v3];
}

void __71__SVXClientServiceServerConnection_fetchAudioPowerWithType_completion___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (a2)
  {
    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 80);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __71__SVXClientServiceServerConnection_fetchAudioPowerWithType_completion___block_invoke_3;
    v9[3] = &unk_264554600;
    uint64_t v4 = *(void *)(a1 + 48);
    id v10 = *(id *)(a1 + 40);
    [v3 fetchCurrentAudioPowerWithType:v4 completion:v9];
    id v5 = v10;
  }
  else
  {
    uint64_t v6 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      __int16 v12 = "-[SVXClientServiceServerConnection fetchAudioPowerWithType:completion:]_block_invoke";
      __int16 v13 = 2112;
      uint64_t v14 = v8;
      _os_log_error_impl(&dword_220062000, v6, OS_LOG_TYPE_ERROR, "%s %@ is not configured or already invalidated.", buf, 0x16u);
    }
    uint64_t v7 = *(void *)(a1 + 40);
    id v5 = [MEMORY[0x263F087E8] errorWithDomain:@"SiriVOXErrorDomain" code:6 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v5);
  }
}

void __71__SVXClientServiceServerConnection_fetchAudioPowerWithType_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315394;
    uint64_t v6 = "-[SVXClientServiceServerConnection fetchAudioPowerWithType:completion:]_block_invoke_3";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_debug_impl(&dword_220062000, v4, OS_LOG_TYPE_DEBUG, "%s wrapper = %@", (uint8_t *)&v5, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)transitToAutomaticEndpointingWithTimestamp:(unint64_t)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v9 = "-[SVXClientServiceServerConnection transitToAutomaticEndpointingWithTimestamp:]";
    __int16 v10 = 2048;
    unint64_t v11 = a3;
    _os_log_debug_impl(&dword_220062000, v5, OS_LOG_TYPE_DEBUG, "%s timestamp = %lld", buf, 0x16u);
  }
  performer = self->_performer;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __79__SVXClientServiceServerConnection_transitToAutomaticEndpointingWithTimestamp___block_invoke;
  v7[3] = &unk_264554548;
  v7[4] = self;
  v7[5] = a3;
  [(SVXPerforming *)performer performBlock:v7];
}

uint64_t __79__SVXClientServiceServerConnection_transitToAutomaticEndpointingWithTimestamp___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __79__SVXClientServiceServerConnection_transitToAutomaticEndpointingWithTimestamp___block_invoke_2;
  v3[3] = &unk_264554520;
  uint64_t v1 = *(void *)(a1 + 40);
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = v1;
  return [v4 _performBlockAfterConfigure:v3];
}

void __79__SVXClientServiceServerConnection_transitToAutomaticEndpointingWithTimestamp___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (a2)
  {
    id v3 = *(void **)(*(void *)(a1 + 32) + 80);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __79__SVXClientServiceServerConnection_transitToAutomaticEndpointingWithTimestamp___block_invoke_3;
    v6[3] = &__block_descriptor_40_e20_v16__0__SVXSession_8l;
    v6[4] = *(void *)(a1 + 40);
    [v3 getCurrentSessionUsingBlock:v6];
  }
  else
  {
    id v4 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      id v8 = "-[SVXClientServiceServerConnection transitToAutomaticEndpointingWithTimestamp:]_block_invoke";
      __int16 v9 = 2112;
      uint64_t v10 = v5;
      _os_log_error_impl(&dword_220062000, v4, OS_LOG_TYPE_ERROR, "%s %@ is not configured or already invalidated.", buf, 0x16u);
    }
  }
}

void __79__SVXClientServiceServerConnection_transitToAutomaticEndpointingWithTimestamp___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315394;
    uint64_t v6 = "-[SVXClientServiceServerConnection transitToAutomaticEndpointingWithTimestamp:]_block_invoke_3";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_debug_impl(&dword_220062000, v4, OS_LOG_TYPE_DEBUG, "%s session = %@", (uint8_t *)&v5, 0x16u);
  }
  [v3 transitSpeechToAutomaticEndpointingWithTimestamp:*(void *)(a1 + 32)];
}

- (void)performManualEndpointing
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v7 = "-[SVXClientServiceServerConnection performManualEndpointing]";
    _os_log_debug_impl(&dword_220062000, v3, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  performer = self->_performer;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __60__SVXClientServiceServerConnection_performManualEndpointing__block_invoke;
  v5[3] = &unk_2645548A0;
  v5[4] = self;
  [(SVXPerforming *)performer performBlock:v5];
}

uint64_t __60__SVXClientServiceServerConnection_performManualEndpointing__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __60__SVXClientServiceServerConnection_performManualEndpointing__block_invoke_2;
  v3[3] = &unk_2645545B8;
  void v3[4] = v1;
  return [v1 _performBlockAfterConfigure:v3];
}

void __60__SVXClientServiceServerConnection_performManualEndpointing__block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (a2)
  {
    id v3 = *(void **)(*(void *)(a1 + 32) + 80);
    [v3 getCurrentSessionUsingBlock:&__block_literal_global_13282];
  }
  else
  {
    id v4 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 136315394;
      __int16 v7 = "-[SVXClientServiceServerConnection performManualEndpointing]_block_invoke";
      __int16 v8 = 2112;
      uint64_t v9 = v5;
      _os_log_error_impl(&dword_220062000, v4, OS_LOG_TYPE_ERROR, "%s %@ is not configured or already invalidated.", (uint8_t *)&v6, 0x16u);
    }
  }
}

void __60__SVXClientServiceServerConnection_performManualEndpointing__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[SVXClientServiceServerConnection performManualEndpointing]_block_invoke_3";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_debug_impl(&dword_220062000, v3, OS_LOG_TYPE_DEBUG, "%s session = %@", (uint8_t *)&v4, 0x16u);
  }
  [v2 stopSpeech];
}

- (void)deactivateWithContext:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v16 = "-[SVXClientServiceServerConnection deactivateWithContext:completion:]";
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_debug_impl(&dword_220062000, v8, OS_LOG_TYPE_DEBUG, "%s context = %@", buf, 0x16u);
  }
  performer = self->_performer;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __69__SVXClientServiceServerConnection_deactivateWithContext_completion___block_invoke;
  v12[3] = &unk_264554788;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [(SVXPerforming *)performer performBlock:v12];
}

void __69__SVXClientServiceServerConnection_deactivateWithContext_completion___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __69__SVXClientServiceServerConnection_deactivateWithContext_completion___block_invoke_2;
  v3[3] = &unk_264554570;
  void v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 _performBlockAfterConfigure:v3];
}

uint64_t __69__SVXClientServiceServerConnection_deactivateWithContext_completion___block_invoke_2(void *a1, int a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (a2)
  {
    uint64_t v3 = a1[5];
    id v4 = *(void **)(a1[4] + 80);
    uint64_t v5 = a1[6];
    return [v4 deactivateWithContext:v3 completion:v5];
  }
  else
  {
    id v7 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = a1[4];
      int v9 = 136315394;
      id v10 = "-[SVXClientServiceServerConnection deactivateWithContext:completion:]_block_invoke_2";
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      _os_log_error_impl(&dword_220062000, v7, OS_LOG_TYPE_ERROR, "%s %@ is not configured or already invalidated.", (uint8_t *)&v9, 0x16u);
    }
    uint64_t result = a1[6];
    if (result) {
      return (*(uint64_t (**)(void))(result + 16))();
    }
  }
  return result;
}

- (void)activateWithContext:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  [(SVXAudioServicesUtils *)self->_audioServicesUtils audioServicesActivateWithTimeout];
  uint64_t v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v16 = "-[SVXClientServiceServerConnection activateWithContext:completion:]";
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_debug_impl(&dword_220062000, v8, OS_LOG_TYPE_DEBUG, "%s context = %@", buf, 0x16u);
  }
  performer = self->_performer;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __67__SVXClientServiceServerConnection_activateWithContext_completion___block_invoke;
  v12[3] = &unk_264554788;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [(SVXPerforming *)performer performBlock:v12];
}

void __67__SVXClientServiceServerConnection_activateWithContext_completion___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __67__SVXClientServiceServerConnection_activateWithContext_completion___block_invoke_2;
  v3[3] = &unk_264554570;
  void v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 _performBlockAfterConfigure:v3];
}

void __67__SVXClientServiceServerConnection_activateWithContext_completion___block_invoke_2(void *a1, int a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (a2)
  {
    uint64_t v3 = a1[5];
    id v4 = *(void **)(a1[4] + 80);
    uint64_t v5 = a1[6];
    [v4 activateWithContext:v3 completion:v5];
  }
  else
  {
    id v6 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = a1[4];
      int v10 = 136315394;
      id v11 = "-[SVXClientServiceServerConnection activateWithContext:completion:]_block_invoke_2";
      __int16 v12 = 2112;
      uint64_t v13 = v9;
      _os_log_error_impl(&dword_220062000, v6, OS_LOG_TYPE_ERROR, "%s %@ is not configured or already invalidated.", (uint8_t *)&v10, 0x16u);
    }
    uint64_t v7 = a1[6];
    if (v7)
    {
      uint64_t v8 = [MEMORY[0x263F087E8] errorWithDomain:@"SiriVOXErrorDomain" code:6 userInfo:0];
      (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
    }
  }
}

- (void)prewarmWithContext:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([(SVXAudioServicesUtils *)self->_audioServicesUtils shouldPrewarmAudioServicesActivate])
  {
    [(SVXAudioServicesUtils *)self->_audioServicesUtils audioServicesActivateWithTimeout];
  }
  uint64_t v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v16 = "-[SVXClientServiceServerConnection prewarmWithContext:completion:]";
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_debug_impl(&dword_220062000, v8, OS_LOG_TYPE_DEBUG, "%s context = %@", buf, 0x16u);
  }
  performer = self->_performer;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __66__SVXClientServiceServerConnection_prewarmWithContext_completion___block_invoke;
  v12[3] = &unk_264554788;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [(SVXPerforming *)performer performBlock:v12];
}

void __66__SVXClientServiceServerConnection_prewarmWithContext_completion___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __66__SVXClientServiceServerConnection_prewarmWithContext_completion___block_invoke_2;
  v3[3] = &unk_264554570;
  void v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 _performBlockAfterConfigure:v3];
}

uint64_t __66__SVXClientServiceServerConnection_prewarmWithContext_completion___block_invoke_2(void *a1, int a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (a2)
  {
    uint64_t v3 = a1[5];
    id v4 = *(void **)(a1[4] + 80);
    uint64_t v5 = a1[6];
    return [v4 prewarmWithContext:v3 completion:v5];
  }
  else
  {
    id v7 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = a1[4];
      int v9 = 136315394;
      id v10 = "-[SVXClientServiceServerConnection prewarmWithContext:completion:]_block_invoke_2";
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      _os_log_error_impl(&dword_220062000, v7, OS_LOG_TYPE_ERROR, "%s %@ is not configured or already invalidated.", (uint8_t *)&v9, 0x16u);
    }
    uint64_t result = a1[6];
    if (result) {
      return (*(uint64_t (**)(void))(result + 16))();
    }
  }
  return result;
}

- (void)preheatWithActivationSource:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if ([(SVXAudioServicesUtils *)self->_audioServicesUtils shouldPrewarmAudioServicesActivate])
  {
    [(SVXAudioServicesUtils *)self->_audioServicesUtils audioServicesActivateWithTimeout];
  }
  uint64_t v5 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    id v7 = v5;
    if ((unint64_t)a3 > 9) {
      uint64_t v8 = @"(unknown)";
    }
    else {
      uint64_t v8 = off_264553510[a3];
    }
    int v9 = v8;
    *(_DWORD *)buf = 136315394;
    uint64_t v12 = "-[SVXClientServiceServerConnection preheatWithActivationSource:]";
    __int16 v13 = 2112;
    id v14 = v9;
    _os_log_debug_impl(&dword_220062000, v7, OS_LOG_TYPE_DEBUG, "%s activationSource = %@", buf, 0x16u);
  }
  performer = self->_performer;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __64__SVXClientServiceServerConnection_preheatWithActivationSource___block_invoke;
  v10[3] = &unk_264554548;
  void v10[4] = self;
  v10[5] = a3;
  [(SVXPerforming *)performer performBlock:v10];
}

uint64_t __64__SVXClientServiceServerConnection_preheatWithActivationSource___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __64__SVXClientServiceServerConnection_preheatWithActivationSource___block_invoke_2;
  v3[3] = &unk_264554520;
  uint64_t v1 = *(void *)(a1 + 40);
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = v1;
  return [v4 _performBlockAfterConfigure:v3];
}

void __64__SVXClientServiceServerConnection_preheatWithActivationSource___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = *(void **)(*(void *)(a1 + 32) + 80);
    [v4 preheatWithActivationSource:v3];
  }
  else
  {
    uint64_t v5 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 136315394;
      uint64_t v8 = "-[SVXClientServiceServerConnection preheatWithActivationSource:]_block_invoke_2";
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      _os_log_error_impl(&dword_220062000, v5, OS_LOG_TYPE_ERROR, "%s %@ is not configured or already invalidated.", (uint8_t *)&v7, 0x16u);
    }
  }
}

- (void)fetchAlarmAndTimerFiringContextWithCompletion:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v10 = "-[SVXClientServiceServerConnection fetchAlarmAndTimerFiringContextWithCompletion:]";
    _os_log_debug_impl(&dword_220062000, v5, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
    if (!v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (v4)
  {
LABEL_3:
    performer = self->_performer;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __82__SVXClientServiceServerConnection_fetchAlarmAndTimerFiringContextWithCompletion___block_invoke;
    v7[3] = &unk_2645547D8;
    v7[4] = self;
    id v8 = v4;
    [(SVXPerforming *)performer performBlock:v7];
  }
LABEL_4:
}

void __82__SVXClientServiceServerConnection_fetchAlarmAndTimerFiringContextWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __82__SVXClientServiceServerConnection_fetchAlarmAndTimerFiringContextWithCompletion___block_invoke_2;
  v2[3] = &unk_2645544A8;
  v2[4] = v1;
  id v3 = *(id *)(a1 + 40);
  [v1 _performBlockAfterConfigure:v2];
}

void __82__SVXClientServiceServerConnection_fetchAlarmAndTimerFiringContextWithCompletion___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (a2)
  {
    id v3 = *(void **)(*(void *)(a1 + 32) + 80);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __82__SVXClientServiceServerConnection_fetchAlarmAndTimerFiringContextWithCompletion___block_invoke_3;
    v8[3] = &unk_2645544F8;
    id v9 = *(id *)(a1 + 40);
    [v3 fetchCurrentAlarmAndTimerFiringContextWithCompletion:v8];
    id v4 = v9;
  }
  else
  {
    uint64_t v5 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      uint64_t v11 = "-[SVXClientServiceServerConnection fetchAlarmAndTimerFiringContextWithCompletion:]_block_invoke";
      __int16 v12 = 2112;
      uint64_t v13 = v7;
      _os_log_error_impl(&dword_220062000, v5, OS_LOG_TYPE_ERROR, "%s %@ is not configured or already invalidated.", buf, 0x16u);
    }
    uint64_t v6 = *(void *)(a1 + 40);
    id v4 = [MEMORY[0x263F087E8] errorWithDomain:@"SiriVOXErrorDomain" code:6 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v4);
  }
}

void __82__SVXClientServiceServerConnection_fetchAlarmAndTimerFiringContextWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315394;
    uint64_t v6 = "-[SVXClientServiceServerConnection fetchAlarmAndTimerFiringContextWithCompletion:]_block_invoke_3";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_debug_impl(&dword_220062000, v4, OS_LOG_TYPE_DEBUG, "%s alarmAndTimerFiringContext = %@", (uint8_t *)&v5, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchSessionActivityStateWithCompletion:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v10 = "-[SVXClientServiceServerConnection fetchSessionActivityStateWithCompletion:]";
    _os_log_debug_impl(&dword_220062000, v5, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
    if (!v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (v4)
  {
LABEL_3:
    performer = self->_performer;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __76__SVXClientServiceServerConnection_fetchSessionActivityStateWithCompletion___block_invoke;
    v7[3] = &unk_2645547D8;
    v7[4] = self;
    id v8 = v4;
    [(SVXPerforming *)performer performBlock:v7];
  }
LABEL_4:
}

void __76__SVXClientServiceServerConnection_fetchSessionActivityStateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __76__SVXClientServiceServerConnection_fetchSessionActivityStateWithCompletion___block_invoke_2;
  v2[3] = &unk_2645544A8;
  v2[4] = v1;
  id v3 = *(id *)(a1 + 40);
  [v1 _performBlockAfterConfigure:v2];
}

void __76__SVXClientServiceServerConnection_fetchSessionActivityStateWithCompletion___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (a2)
  {
    id v3 = *(void **)(*(void *)(a1 + 32) + 80);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __76__SVXClientServiceServerConnection_fetchSessionActivityStateWithCompletion___block_invoke_3;
    v8[3] = &unk_2645544D0;
    id v9 = *(id *)(a1 + 40);
    [v3 fetchCurrentActivityStateWithCompletion:v8];
    id v4 = v9;
  }
  else
  {
    int v5 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      uint64_t v11 = "-[SVXClientServiceServerConnection fetchSessionActivityStateWithCompletion:]_block_invoke";
      __int16 v12 = 2112;
      uint64_t v13 = v7;
      _os_log_error_impl(&dword_220062000, v5, OS_LOG_TYPE_ERROR, "%s %@ is not configured or already invalidated.", buf, 0x16u);
    }
    uint64_t v6 = *(void *)(a1 + 40);
    id v4 = [MEMORY[0x263F087E8] errorWithDomain:@"SiriVOXErrorDomain" code:6 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v4);
  }
}

uint64_t __76__SVXClientServiceServerConnection_fetchSessionActivityStateWithCompletion___block_invoke_3(uint64_t a1, int a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315394;
    uint64_t v7 = "-[SVXClientServiceServerConnection fetchSessionActivityStateWithCompletion:]_block_invoke_3";
    __int16 v8 = 1024;
    int v9 = a2;
    _os_log_debug_impl(&dword_220062000, v4, OS_LOG_TYPE_DEBUG, "%s isActive = %d", (uint8_t *)&v6, 0x12u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchSessionStateWithCompletion:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v10 = "-[SVXClientServiceServerConnection fetchSessionStateWithCompletion:]";
    _os_log_debug_impl(&dword_220062000, v5, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
    if (!v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (v4)
  {
LABEL_3:
    performer = self->_performer;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __68__SVXClientServiceServerConnection_fetchSessionStateWithCompletion___block_invoke;
    v7[3] = &unk_2645547D8;
    v7[4] = self;
    id v8 = v4;
    [(SVXPerforming *)performer performBlock:v7];
  }
LABEL_4:
}

void __68__SVXClientServiceServerConnection_fetchSessionStateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __68__SVXClientServiceServerConnection_fetchSessionStateWithCompletion___block_invoke_2;
  v2[3] = &unk_2645544A8;
  v2[4] = v1;
  id v3 = *(id *)(a1 + 40);
  [v1 _performBlockAfterConfigure:v2];
}

void __68__SVXClientServiceServerConnection_fetchSessionStateWithCompletion___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (a2)
  {
    id v3 = *(void **)(*(void *)(a1 + 32) + 80);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __68__SVXClientServiceServerConnection_fetchSessionStateWithCompletion___block_invoke_3;
    v8[3] = &unk_264554480;
    id v9 = *(id *)(a1 + 40);
    [v3 fetchCurrentStateWithCompletion:v8];
    id v4 = v9;
  }
  else
  {
    int v5 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      uint64_t v11 = "-[SVXClientServiceServerConnection fetchSessionStateWithCompletion:]_block_invoke";
      __int16 v12 = 2112;
      uint64_t v13 = v7;
      _os_log_error_impl(&dword_220062000, v5, OS_LOG_TYPE_ERROR, "%s %@ is not configured or already invalidated.", buf, 0x16u);
    }
    uint64_t v6 = *(void *)(a1 + 40);
    id v4 = [MEMORY[0x263F087E8] errorWithDomain:@"SiriVOXErrorDomain" code:6 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v4);
  }
}

uint64_t __68__SVXClientServiceServerConnection_fetchSessionStateWithCompletion___block_invoke_3(uint64_t a1, unint64_t a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = v4;
    if (a2 > 4) {
      uint64_t v7 = @"(unknown)";
    }
    else {
      uint64_t v7 = off_2645542F8[a2];
    }
    id v8 = v7;
    int v9 = 136315394;
    uint64_t v10 = "-[SVXClientServiceServerConnection fetchSessionStateWithCompletion:]_block_invoke_3";
    __int16 v11 = 2112;
    __int16 v12 = v8;
    _os_log_debug_impl(&dword_220062000, v6, OS_LOG_TYPE_DEBUG, "%s currentState = %@", (uint8_t *)&v9, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)pingWithReply:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v10 = "-[SVXClientServiceServerConnection pingWithReply:]";
    _os_log_debug_impl(&dword_220062000, v5, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
    if (!v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (v4)
  {
LABEL_3:
    performer = self->_performer;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __50__SVXClientServiceServerConnection_pingWithReply___block_invoke;
    v7[3] = &unk_2645547D8;
    v7[4] = self;
    id v8 = v4;
    [(SVXPerforming *)performer performBlock:v7];
  }
LABEL_4:
}

void __50__SVXClientServiceServerConnection_pingWithReply___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __50__SVXClientServiceServerConnection_pingWithReply___block_invoke_2;
  v4[3] = &unk_2645544A8;
  id v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 _performBlockAfterConfigure:v4];
}

void __50__SVXClientServiceServerConnection_pingWithReply___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = *MEMORY[0x263F28348];
  id v4 = *MEMORY[0x263F28348];
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      int v8 = 136315138;
      int v9 = "-[SVXClientServiceServerConnection pingWithReply:]_block_invoke_2";
      _os_log_debug_impl(&dword_220062000, v3, OS_LOG_TYPE_DEBUG, "%s reply", (uint8_t *)&v8, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 136315394;
      int v9 = "-[SVXClientServiceServerConnection pingWithReply:]_block_invoke";
      __int16 v10 = 2112;
      uint64_t v11 = v7;
      _os_log_error_impl(&dword_220062000, v3, OS_LOG_TYPE_ERROR, "%s %@ is not configured or already invalidated.", (uint8_t *)&v8, 0x16u);
    }
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = [MEMORY[0x263F087E8] errorWithDomain:@"SiriVOXErrorDomain" code:6 userInfo:0];
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
  }
}

- (void)invalidate
{
  performer = self->_performer;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __46__SVXClientServiceServerConnection_invalidate__block_invoke;
  v3[3] = &unk_2645548A0;
  void v3[4] = self;
  [(SVXPerforming *)performer performBlock:v3];
}

void __46__SVXClientServiceServerConnection_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  *(unsigned char *)(*(void *)(a1 + 32) + 56) = 0;
  id v2 = *(void **)(a1 + 32);
  id v3 = (void *)v2[9];
  id v4 = [v2 uuid];
  [v3 setContext:0 forUUID:v4];

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 80), "removeActivationListener:");
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 80), "removeAudioPowerUpdateListener:");
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 80), "removeActivityListener:");
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = 0;

  uint64_t v7 = *(void *)(a1 + 32);
  int v8 = *(void **)(v7 + 80);
  *(void *)(v7 + 80) = 0;

  uint64_t v9 = *(void *)(a1 + 32);
  __int16 v10 = *(void **)(v9 + 72);
  *(void *)(v9 + 72) = 0;

  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = *(void **)(v11 + 96);
  *(void *)(v11 + 96) = 0;

  [*(id *)(a1 + 32) _cleanUpXPCConnection];
  uint64_t v13 = *(void **)(*(void *)(a1 + 32) + 64);
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)(a1 + 32);
    uint64_t v16 = *(void **)(v15 + 64);
    *(void *)(v15 + 64) = 0;

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v17 = v14;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v23;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v23 != v20) {
            objc_enumerationMutation(v17);
          }
          objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * v21++), "invokeWithSignal:", -3, (void)v22);
        }
        while (v19 != v21);
        uint64_t v19 = [v17 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v19);
    }
  }
}

- (void)configureWithDeviceSetupManager:(id)a3 sessionManager:(id)a4 speechSynthesizer:(id)a5 synthesisManager:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  performer = self->_performer;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __118__SVXClientServiceServerConnection_configureWithDeviceSetupManager_sessionManager_speechSynthesizer_synthesisManager___block_invoke;
  v19[3] = &unk_264554450;
  v19[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  [(SVXPerforming *)performer performBlock:v19];
}

void __118__SVXClientServiceServerConnection_configureWithDeviceSetupManager_sessionManager_speechSynthesizer_synthesisManager___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  *(unsigned char *)(*(void *)(a1 + 32) + 56) = 1;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 72), *(id *)(a1 + 40));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 80), *(id *)(a1 + 48));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 88), *(id *)(a1 + 56));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 96), *(id *)(a1 + 64));
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 80), "addActivationListener:");
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 80), "addAudioPowerUpdateListener:");
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 80), "addActivityListener:");
  id v2 = *(void **)(*(void *)(a1 + 32) + 64);
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 64);
    *(void *)(v4 + 64) = 0;

    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = v3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "invokeWithSignal:", 0, (void)v11);
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (void)getInstanceInfoWithCompletion:(id)a3
{
}

- (NSString)description
{
  id v3 = [NSString alloc];
  v10.receiver = self;
  v10.super_class = (Class)SVXClientServiceServerConnection;
  uint64_t v4 = [(SVXClientServiceServerConnection *)&v10 description];
  uuid = self->_uuid;
  xpcConnection = self->_xpcConnection;
  uint64_t v7 = [(SVXInstanceInfoSupplier *)self->_instanceInfoSupplier cacheInstanceInfo];
  uint64_t v8 = (void *)[v3 initWithFormat:@"%@ {uuid = %@, xpcConnection = %@, instanceInfo = %@}", v4, uuid, xpcConnection, v7];

  return (NSString *)v8;
}

- (SVXClientServiceServerConnection)initWithXPCConnection:(id)a3 performer:(id)a4 delegate:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
LABEL_8:
    v32 = [MEMORY[0x263F08690] currentHandler];
    [v32 handleFailureInMethod:a2, self, @"SVXClientServiceServerConnection.m", 58, @"Invalid parameter not satisfying: %@", @"performer != nil" object file lineNumber description];

    if (v12) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v31 = [MEMORY[0x263F08690] currentHandler];
  [v31 handleFailureInMethod:a2, self, @"SVXClientServiceServerConnection.m", 57, @"Invalid parameter not satisfying: %@", @"xpcConnection != nil" object file lineNumber description];

  if (!v11) {
    goto LABEL_8;
  }
LABEL_3:
  if (v12) {
    goto LABEL_4;
  }
LABEL_9:
  v33 = [MEMORY[0x263F08690] currentHandler];
  [v33 handleFailureInMethod:a2, self, @"SVXClientServiceServerConnection.m", 59, @"Invalid parameter not satisfying: %@", @"delegate != nil" object file lineNumber description];

LABEL_4:
  v39.receiver = self;
  v39.super_class = (Class)SVXClientServiceServerConnection;
  long long v13 = [(SVXClientServiceServerConnection *)&v39 init];
  if (v13)
  {
    long long v14 = (NSUUID *)objc_alloc_init(MEMORY[0x263F08C38]);
    uuid = v13->_uuid;
    v13->_uuid = v14;

    objc_storeStrong((id *)&v13->_xpcConnection, a3);
    xpcConnection = v13->_xpcConnection;
    id v17 = SVXClientServiceDelegateCreateXPCInterface();
    [(NSXPCConnection *)xpcConnection setRemoteObjectInterface:v17];

    [(NSXPCConnection *)v13->_xpcConnection setExportedObject:v13];
    id v18 = v13->_xpcConnection;
    uint64_t v19 = SVXClientServiceCreateXPCInterface();
    [(NSXPCConnection *)v18 setExportedInterface:v19];

    objc_initWeak(&location, v13);
    id v20 = v13->_xpcConnection;
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __77__SVXClientServiceServerConnection_initWithXPCConnection_performer_delegate___block_invoke;
    v36[3] = &unk_264554968;
    objc_copyWeak(&v37, &location);
    [(NSXPCConnection *)v20 setInterruptionHandler:v36];
    id v21 = v13->_xpcConnection;
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __77__SVXClientServiceServerConnection_initWithXPCConnection_performer_delegate___block_invoke_2;
    v34[3] = &unk_264554968;
    objc_copyWeak(&v35, &location);
    [(NSXPCConnection *)v21 setInvalidationHandler:v34];
    objc_storeStrong((id *)&v13->_performer, a4);
    objc_storeWeak((id *)&v13->_delegate, v12);
    id v22 = objc_alloc_init(SVXClientServiceRemoteDelegateSupplier);
    remoteDelegateSupplier = v13->_remoteDelegateSupplier;
    v13->_remoteDelegateSupplier = v22;

    long long v24 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    pendingBlocksAfterConfigure = v13->_pendingBlocksAfterConfigure;
    v13->_pendingBlocksAfterConfigure = v24;

    uint64_t v26 = objc_alloc_init(SVXAudioServicesUtils);
    audioServicesUtils = v13->_audioServicesUtils;
    v13->_audioServicesUtils = v26;

    v28 = [[SVXInstanceInfoSupplier alloc] initWithRemoteDelegateSupplier:v13->_remoteDelegateSupplier performer:v13->_performer];
    instanceInfoSupplier = v13->_instanceInfoSupplier;
    v13->_instanceInfoSupplier = v28;

    objc_destroyWeak(&v35);
    objc_destroyWeak(&v37);
    objc_destroyWeak(&location);
  }

  return v13;
}

void __77__SVXClientServiceServerConnection_initWithXPCConnection_performer_delegate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _connectionInterrupted];
}

void __77__SVXClientServiceServerConnection_initWithXPCConnection_performer_delegate___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _connectionInvalidated];
}

@end