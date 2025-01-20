@interface SVXClientServiceConnection
- (AFInstanceContext)instanceContext;
- (SVXClientActivationServicing)activationService;
- (SVXClientAudioPowerServicing)inputAudioPowerService;
- (SVXClientAudioPowerServicing)outputAudioPowerService;
- (SVXClientAudioSystemServicing)audioSystemService;
- (SVXClientDeviceServicing)deviceService;
- (SVXClientKeepAliveServicing)keepAliveService;
- (SVXClientServiceConnection)initWithComponents:(unint64_t)a3 delegate:(id)a4;
- (SVXClientServiceConnection)initWithComponents:(unint64_t)a3 instanceContext:(id)a4 delegate:(id)a5;
- (SVXClientServiceConnection)initWithQueuePerformer:(id)a3 activationService:(id)a4 audioSystemService:(id)a5 deviceService:(id)a6 inputAudioPowerService:(id)a7 outputAudioPowerService:(id)a8 sessionService:(id)a9 speechSynthesisService:(id)a10 keepAliveService:(id)a11 instanceContext:(id)a12 connectionFactory:(id)a13 delegate:(id)a14;
- (SVXClientServiceConnection)initWithQueuePerformer:(id)a3 activationService:(id)a4 audioSystemService:(id)a5 deviceService:(id)a6 inputAudioPowerService:(id)a7 outputAudioPowerService:(id)a8 sessionService:(id)a9 speechSynthesisService:(id)a10 keepAliveService:(id)a11 instanceContext:(id)a12 delegate:(id)a13;
- (SVXClientSessionServicing)sessionService;
- (SVXClientSpeechSynthesisServicing)speechSynthesisService;
- (SVXPerforming)performer;
- (id)_clientServiceWithErrorHandler:(id)a3;
- (id)_connection;
- (void)_cleanUpComponents;
- (void)_cleanUpConnection;
- (void)_clientServiceDidChange:(BOOL)a3;
- (void)_invalidate;
- (void)activateWithContext:(id)a3 completion:(id)a4;
- (void)cancelPendingSpeechSynthesisRequest:(id)a3;
- (void)connectionInterrupted;
- (void)connectionInvalidated;
- (void)deactivateWithContext:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)enqueueSpeechSynthesisRequest:(id)a3 completion:(id)a4;
- (void)fetchAlarmAndTimerFiringContextWithCompletion:(id)a3;
- (void)fetchAudioPowerWithType:(int64_t)a3 completion:(id)a4;
- (void)fetchSessionActivityStateWithCompletion:(id)a3;
- (void)fetchSessionStateWithCompletion:(id)a3;
- (void)getClientServiceUsingBlock:(id)a3 errorHandler:(id)a4;
- (void)getInstanceInfoWithCompletion:(id)a3;
- (void)handleSpeechSynthesisSynthesizedBufferForHandlerUUID:(id)a3 audioChunkData:(id)a4 audioChunkIndex:(unint64_t)a5 reply:(id)a6;
- (void)invalidate;
- (void)notifyAudioSessionDidBecomeActive:(BOOL)a3 activationContext:(id)a4 deactivationContext:(id)a5;
- (void)notifyAudioSessionWillBecomeActive:(BOOL)a3 activationContext:(id)a4 deactivationContext:(id)a5;
- (void)notifyDidActivateWithContext:(id)a3;
- (void)notifyDidChangeSessionStateFrom:(int64_t)a3 to:(int64_t)a4;
- (void)notifyDidDeactivateWithContext:(id)a3;
- (void)notifyDidEndUpdateAudioPowerWithType:(int64_t)a3;
- (void)notifyDidNotActivateWithContext:(id)a3 error:(id)a4;
- (void)notifySessionDidBecomeActiveWithActivationContext:(id)a3 turnID:(id)a4;
- (void)notifySessionDidResignActiveWithDeactivationContext:(id)a3;
- (void)notifySessionDidStartSoundWithID:(int64_t)a3;
- (void)notifySessionDidStopSoundWithID:(int64_t)a3 error:(id)a4;
- (void)notifySessionWillBecomeActiveWithActivationContext:(id)a3 turnID:(id)a4;
- (void)notifySessionWillPresentFeedbackWithDialogIdentifier:(id)a3;
- (void)notifySessionWillResignActiveWithOptions:(unint64_t)a3 duration:(double)a4;
- (void)notifySessionWillStartSoundWithID:(int64_t)a3;
- (void)notifyWillActivateWithContext:(id)a3;
- (void)notifyWillBeginUpdateAudioPowerWithType:(int64_t)a3 wrapper:(id)a4;
- (void)notifyWillChangeSessionStateFrom:(int64_t)a3 to:(int64_t)a4;
- (void)notifyWillDeactivateWithContext:(id)a3;
- (void)performManualEndpointing;
- (void)pingWithReply:(id)a3;
- (void)preheatWithActivationSource:(int64_t)a3;
- (void)prepareForDeviceSetupWithContext:(id)a3 completion:(id)a4;
- (void)prewarmRequest:(id)a3;
- (void)prewarmWithContext:(id)a3 completion:(id)a4;
- (void)requestPermissionToActivateWithContext:(id)a3 completion:(id)a4;
- (void)setDeviceSetupContext:(id)a3;
- (void)stopSpeechSynthesisRequest:(id)a3;
- (void)synthesizeRequest:(id)a3 handlerUUID:(id)a4 completion:(id)a5;
- (void)transitToAutomaticEndpointingWithTimestamp:(unint64_t)a3;
@end

@implementation SVXClientServiceConnection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceContext, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_connectionFactory, 0);
  objc_storeStrong((id *)&self->_keepAliveService, 0);
  objc_storeStrong((id *)&self->_audioSystemService, 0);
  objc_storeStrong((id *)&self->_deviceService, 0);
  objc_storeStrong((id *)&self->_speechSynthesisService, 0);
  objc_storeStrong((id *)&self->_outputAudioPowerService, 0);
  objc_storeStrong((id *)&self->_inputAudioPowerService, 0);
  objc_storeStrong((id *)&self->_activationService, 0);
  objc_storeStrong((id *)&self->_sessionService, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_queuePerformer, 0);
}

- (AFInstanceContext)instanceContext
{
  return self->_instanceContext;
}

- (void)_cleanUpComponents
{
  activationService = self->_activationService;
  self->_activationService = 0;

  audioSystemService = self->_audioSystemService;
  self->_audioSystemService = 0;

  deviceService = self->_deviceService;
  self->_deviceService = 0;

  inputAudioPowerService = self->_inputAudioPowerService;
  self->_inputAudioPowerService = 0;

  outputAudioPowerService = self->_outputAudioPowerService;
  self->_outputAudioPowerService = 0;

  sessionService = self->_sessionService;
  self->_sessionService = 0;

  speechSynthesisService = self->_speechSynthesisService;
  self->_speechSynthesisService = 0;

  keepAliveService = self->_keepAliveService;
  self->_keepAliveService = 0;
}

- (void)_cleanUpConnection
{
  connection = self->_connection;
  if (connection)
  {
    [(NSXPCConnection *)connection setExportedObject:0];
    [(NSXPCConnection *)self->_connection invalidate];
    v4 = self->_connection;
    self->_connection = 0;
  }
}

- (void)connectionInvalidated
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[SVXClientServiceConnection connectionInvalidated]";
    _os_log_error_impl(&dword_220062000, v3, OS_LOG_TYPE_ERROR, "%s ", buf, 0xCu);
  }
  queuePerformer = self->_queuePerformer;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __51__SVXClientServiceConnection_connectionInvalidated__block_invoke;
  v5[3] = &unk_2645548A0;
  v5[4] = self;
  [(SVXQueuePerformer *)queuePerformer performBlock:v5];
}

uint64_t __51__SVXClientServiceConnection_connectionInvalidated__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 24) || !*(void *)(v2 + 88))
  {
    v3 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[SVXClientServiceConnection connectionInvalidated]_block_invoke";
      _os_log_impl(&dword_220062000, v3, OS_LOG_TYPE_DEFAULT, "%s Invalidate", buf, 0xCu);
      uint64_t v2 = *(void *)(a1 + 32);
    }
    return [(id)v2 _invalidate];
  }
  else
  {
    v5 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[SVXClientServiceConnection connectionInvalidated]_block_invoke";
      _os_log_impl(&dword_220062000, v5, OS_LOG_TYPE_DEFAULT, "%s KeepAlive", buf, 0xCu);
      uint64_t v2 = *(void *)(a1 + 32);
    }
    [(id)v2 _cleanUpConnection];
    uint64_t v6 = *(void *)(a1 + 32);
    v7 = *(void **)(v6 + 88);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __51__SVXClientServiceConnection_connectionInvalidated__block_invoke_28;
    v8[3] = &unk_2645539C0;
    v8[4] = v6;
    return [v7 connectWithCompletion:v8];
  }
}

void __51__SVXClientServiceConnection_connectionInvalidated__block_invoke_28(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 8);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__SVXClientServiceConnection_connectionInvalidated__block_invoke_2;
  v7[3] = &unk_2645548C8;
  id v8 = v3;
  uint64_t v9 = v4;
  id v6 = v3;
  [v5 performBlock:v7];
}

uint64_t __51__SVXClientServiceConnection_connectionInvalidated__block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *MEMORY[0x263F28348];
  uint64_t v4 = *MEMORY[0x263F28348];
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315394;
      v7 = "-[SVXClientServiceConnection connectionInvalidated]_block_invoke_2";
      __int16 v8 = 2112;
      uint64_t v9 = v2;
      _os_log_error_impl(&dword_220062000, v3, OS_LOG_TYPE_ERROR, "%s Failed KeepAlive (error = %@)", (uint8_t *)&v6, 0x16u);
    }
    return [*(id *)(a1 + 40) _invalidate];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      v7 = "-[SVXClientServiceConnection connectionInvalidated]_block_invoke";
      _os_log_impl(&dword_220062000, v3, OS_LOG_TYPE_DEFAULT, "%s Done KeepAlive", (uint8_t *)&v6, 0xCu);
    }
    return [*(id *)(a1 + 40) _clientServiceDidChange:1];
  }
}

- (void)connectionInterrupted
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[SVXClientServiceConnection connectionInterrupted]";
    _os_log_error_impl(&dword_220062000, v3, OS_LOG_TYPE_ERROR, "%s ", buf, 0xCu);
  }
  queuePerformer = self->_queuePerformer;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __51__SVXClientServiceConnection_connectionInterrupted__block_invoke;
  v5[3] = &unk_2645548A0;
  v5[4] = self;
  [(SVXQueuePerformer *)queuePerformer performBlock:v5];
}

uint64_t __51__SVXClientServiceConnection_connectionInterrupted__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _cleanUpConnection];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _clientServiceDidChange:0];
}

- (id)_connection
{
  connection = self->_connection;
  if (!connection)
  {
    uint64_t v4 = [(SVXXPCConnectionFactory *)self->_connectionFactory createWithMachServiceName:@"com.apple.SiriVOXService.client" options:0];
    v5 = self->_connection;
    self->_connection = v4;

    int v6 = self->_connection;
    v7 = [(SVXQueuePerformer *)self->_queuePerformer queue];
    [(NSXPCConnection *)v6 _setQueue:v7];

    uint64_t v8 = self->_connection;
    uint64_t v9 = SVXClientServiceCreateXPCInterface();
    [(NSXPCConnection *)v8 setRemoteObjectInterface:v9];

    [(NSXPCConnection *)self->_connection setExportedObject:self];
    uint64_t v10 = self->_connection;
    uint64_t v11 = SVXClientServiceDelegateCreateXPCInterface();
    [(NSXPCConnection *)v10 setExportedInterface:v11];

    objc_initWeak(&location, self);
    v12 = self->_connection;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __41__SVXClientServiceConnection__connection__block_invoke;
    v17[3] = &unk_264554968;
    objc_copyWeak(&v18, &location);
    [(NSXPCConnection *)v12 setInterruptionHandler:v17];
    v13 = self->_connection;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __41__SVXClientServiceConnection__connection__block_invoke_2;
    v15[3] = &unk_264554968;
    objc_copyWeak(&v16, &location);
    [(NSXPCConnection *)v13 setInvalidationHandler:v15];
    [(NSXPCConnection *)self->_connection resume];
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }

  return connection;
}

void __41__SVXClientServiceConnection__connection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained connectionInterrupted];
}

void __41__SVXClientServiceConnection__connection__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained connectionInvalidated];
}

- (void)_clientServiceDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  -[SVXClientActivationService clientServiceDidChange:](self->_activationService, "clientServiceDidChange:");
  [(SVXClientAudioSystemService *)self->_audioSystemService clientServiceDidChange:v3];
  [(SVXClientDeviceService *)self->_deviceService clientServiceDidChange:v3];
  [(SVXClientAudioPowerService *)self->_inputAudioPowerService clientServiceDidChange:v3];
  [(SVXClientAudioPowerService *)self->_outputAudioPowerService clientServiceDidChange:v3];
  [(SVXClientSessionService *)self->_sessionService clientServiceDidChange:v3];
  [(SVXClientSpeechSynthesisService *)self->_speechSynthesisService clientServiceDidChange:v3];
  keepAliveService = self->_keepAliveService;

  [(SVXClientKeepAliveService *)keepAliveService clientServiceDidChange:v3];
}

- (id)_clientServiceWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = (void (**)(void, void))v4;
  if (!self->_isInvalid)
  {
    int v6 = [(SVXClientServiceConnection *)self _connection];
    v7 = [v6 remoteObjectProxyWithErrorHandler:v5];
    goto LABEL_5;
  }
  if (v4)
  {
    int v6 = [MEMORY[0x263F087E8] errorWithDomain:@"SiriVOXErrorDomain" code:6 userInfo:0];
    ((void (**)(void, void *))v5)[2](v5, v6);
    v7 = 0;
LABEL_5:

    goto LABEL_7;
  }
  v7 = 0;
LABEL_7:

  return v7;
}

- (void)_invalidate
{
  if (!self->_isInvalid)
  {
    self->_isInvalid = 1;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained clientServiceConnectionDidInvalidate:self];
  }
  [(SVXClientServiceConnection *)self _cleanUpComponents];

  [(SVXClientServiceConnection *)self _cleanUpConnection];
}

- (void)getClientServiceUsingBlock:(id)a3 errorHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queuePerformer = self->_queuePerformer;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __70__SVXClientServiceConnection_getClientServiceUsingBlock_errorHandler___block_invoke;
  v11[3] = &unk_264551F08;
  v11[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  [(SVXQueuePerformer *)queuePerformer performBlock:v11];
}

void __70__SVXClientServiceConnection_getClientServiceUsingBlock_errorHandler___block_invoke(void *a1)
{
  if (*(unsigned char *)(a1[4] + 24))
  {
    uint64_t v1 = a1[5];
    if (v1)
    {
      id v4 = [MEMORY[0x263F087E8] errorWithDomain:@"SiriVOXErrorDomain" code:6 userInfo:0];
      (*(void (**)(uint64_t, id))(v1 + 16))(v1, v4);
    }
  }
  else
  {
    uint64_t v2 = a1[6];
    if (v2)
    {
      BOOL v3 = *(void (**)(void))(v2 + 16);
      v3();
    }
  }
}

- (void)handleSpeechSynthesisSynthesizedBufferForHandlerUUID:(id)a3 audioChunkData:(id)a4 audioChunkIndex:(unint64_t)a5 reply:(id)a6
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v14 = 136315906;
    v15 = "-[SVXClientServiceConnection handleSpeechSynthesisSynthesizedBufferForHandlerUUID:audioChunkData:audioChunkIndex:reply:]";
    __int16 v16 = 2112;
    id v17 = v10;
    __int16 v18 = 2048;
    unint64_t v19 = a5;
    __int16 v20 = 2112;
    id v21 = v11;
    _os_log_impl(&dword_220062000, v13, OS_LOG_TYPE_INFO, "%s handlerUUID = %@, audioChunkIndex = %tu, audioChunkData = %@", (uint8_t *)&v14, 0x2Au);
  }
  [(SVXClientSpeechSynthesisService *)self->_speechSynthesisService handleSynthesizedBufferForHandlerUUID:v10 audioChunkData:v11 audioChunkIndex:a5 reply:v12];
}

- (void)notifyAudioSessionDidBecomeActive:(BOOL)a3 activationContext:(id)a4 deactivationContext:(id)a5
{
  BOOL v6 = a3;
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  id v10 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v11 = 136315906;
    id v12 = "-[SVXClientServiceConnection notifyAudioSessionDidBecomeActive:activationContext:deactivationContext:]";
    __int16 v13 = 1024;
    BOOL v14 = v6;
    __int16 v15 = 2112;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v9;
    _os_log_impl(&dword_220062000, v10, OS_LOG_TYPE_INFO, "%s flag = %d, activationContext = %@, deactivationContext = %@", (uint8_t *)&v11, 0x26u);
  }
  [(SVXClientAudioSystemService *)self->_audioSystemService handleAudioSessionDidBecomeActive:v6 activationContext:v8 deactivationContext:v9];
}

- (void)notifyAudioSessionWillBecomeActive:(BOOL)a3 activationContext:(id)a4 deactivationContext:(id)a5
{
  BOOL v6 = a3;
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  id v10 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v11 = 136315906;
    id v12 = "-[SVXClientServiceConnection notifyAudioSessionWillBecomeActive:activationContext:deactivationContext:]";
    __int16 v13 = 1024;
    BOOL v14 = v6;
    __int16 v15 = 2112;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v9;
    _os_log_impl(&dword_220062000, v10, OS_LOG_TYPE_INFO, "%s flag = %d, activationContext = %@, deactivationContext = %@", (uint8_t *)&v11, 0x26u);
  }
  [(SVXClientAudioSystemService *)self->_audioSystemService handleAudioSessionWillBecomeActive:v6 activationContext:v8 deactivationContext:v9];
}

- (void)notifyDidEndUpdateAudioPowerWithType:(int64_t)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v5 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    BOOL v6 = v5;
    if ((unint64_t)a3 > 2) {
      id v7 = @"(unknown)";
    }
    else {
      id v7 = off_264552C98[a3];
    }
    id v8 = v7;
    int v10 = 136315394;
    int v11 = "-[SVXClientServiceConnection notifyDidEndUpdateAudioPowerWithType:]";
    __int16 v12 = 2112;
    __int16 v13 = v8;
    _os_log_impl(&dword_220062000, v6, OS_LOG_TYPE_INFO, "%s type = %@", (uint8_t *)&v10, 0x16u);
  }
  if (a3 == 1)
  {
    uint64_t v9 = 48;
  }
  else
  {
    if (a3 != 2) {
      return;
    }
    uint64_t v9 = 56;
  }
  [*(id *)((char *)&self->super.isa + v9) handleDidEndUpdateAudioPower];
}

- (void)notifyWillBeginUpdateAudioPowerWithType:(int64_t)a3 wrapper:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    id v8 = v7;
    if ((unint64_t)a3 > 2) {
      uint64_t v9 = @"(unknown)";
    }
    else {
      uint64_t v9 = off_264552C98[a3];
    }
    int v10 = v9;
    int v13 = 136315650;
    uint64_t v14 = "-[SVXClientServiceConnection notifyWillBeginUpdateAudioPowerWithType:wrapper:]";
    __int16 v15 = 2112;
    id v16 = v10;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_220062000, v8, OS_LOG_TYPE_INFO, "%s type = %@, wrapper = %@", (uint8_t *)&v13, 0x20u);
  }
  if (a3 == 1)
  {
    uint64_t v11 = 48;
    goto LABEL_10;
  }
  if (a3 == 2)
  {
    uint64_t v11 = 56;
LABEL_10:
    __int16 v12 = (void *)[objc_alloc(MEMORY[0x263F28430]) initWithXPCWrapper:v6];
    [*(id *)((char *)&self->super.isa + v11) handleWillBeginUpdateAudioPowerWithProvider:v12];
  }
}

- (void)notifySessionDidResignActiveWithDeactivationContext:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v6 = 136315394;
    id v7 = "-[SVXClientServiceConnection notifySessionDidResignActiveWithDeactivationContext:]";
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_220062000, v5, OS_LOG_TYPE_INFO, "%s deactivationContext = %@", (uint8_t *)&v6, 0x16u);
  }
  [(SVXClientSessionService *)self->_sessionService handleDidResignActiveWithDeactivationContext:v4];
}

- (void)notifySessionWillResignActiveWithOptions:(unint64_t)a3 duration:(double)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v7 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    __int16 v8 = v7;
    id v9 = SVXSessionResignActiveOptionsGetNames(a3);
    int v10 = 136315650;
    uint64_t v11 = "-[SVXClientServiceConnection notifySessionWillResignActiveWithOptions:duration:]";
    __int16 v12 = 2112;
    int v13 = v9;
    __int16 v14 = 2048;
    double v15 = a4;
    _os_log_impl(&dword_220062000, v8, OS_LOG_TYPE_INFO, "%s options = %@, duration = %f", (uint8_t *)&v10, 0x20u);
  }
  [(SVXClientSessionService *)self->_sessionService handleWillResignActiveWithOptions:a3 duration:a4];
}

- (void)notifySessionDidBecomeActiveWithActivationContext:(id)a3 turnID:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v9 = 136315650;
    int v10 = "-[SVXClientServiceConnection notifySessionDidBecomeActiveWithActivationContext:turnID:]";
    __int16 v11 = 2112;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_220062000, v8, OS_LOG_TYPE_INFO, "%s activationContext = %@, turnID = %@", (uint8_t *)&v9, 0x20u);
  }
  [(SVXClientSessionService *)self->_sessionService handleDidBecomeActiveWithActivationContext:v6 turnID:v7];
}

- (void)notifySessionWillBecomeActiveWithActivationContext:(id)a3 turnID:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v9 = 136315650;
    int v10 = "-[SVXClientServiceConnection notifySessionWillBecomeActiveWithActivationContext:turnID:]";
    __int16 v11 = 2112;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_220062000, v8, OS_LOG_TYPE_INFO, "%s activationContext = %@, turnID = %@", (uint8_t *)&v9, 0x20u);
  }
  [(SVXClientSessionService *)self->_sessionService handleWillBecomeActiveWithActivationContext:v6 turnID:v7];
}

- (void)notifySessionDidStopSoundWithID:(int64_t)a3 error:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    __int16 v8 = v7;
    if ((unint64_t)a3 > 6) {
      int v9 = @"(unknown)";
    }
    else {
      int v9 = off_2645530B0[a3];
    }
    int v10 = v9;
    int v11 = 136315650;
    id v12 = "-[SVXClientServiceConnection notifySessionDidStopSoundWithID:error:]";
    __int16 v13 = 2112;
    id v14 = v10;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_220062000, v8, OS_LOG_TYPE_INFO, "%s soundID = %@, error = %@", (uint8_t *)&v11, 0x20u);
  }
  [(SVXClientSessionService *)self->_sessionService handleDidStopSoundWithID:a3 error:v6];
}

- (void)notifySessionDidStartSoundWithID:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v5 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    id v6 = v5;
    if ((unint64_t)a3 > 6) {
      id v7 = @"(unknown)";
    }
    else {
      id v7 = off_2645530B0[a3];
    }
    __int16 v8 = v7;
    int v9 = 136315394;
    int v10 = "-[SVXClientServiceConnection notifySessionDidStartSoundWithID:]";
    __int16 v11 = 2112;
    id v12 = v8;
    _os_log_impl(&dword_220062000, v6, OS_LOG_TYPE_INFO, "%s soundID = %@", (uint8_t *)&v9, 0x16u);
  }
  [(SVXClientSessionService *)self->_sessionService handleDidStartSoundWithID:a3];
}

- (void)notifySessionWillStartSoundWithID:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v5 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    id v6 = v5;
    if ((unint64_t)a3 > 6) {
      id v7 = @"(unknown)";
    }
    else {
      id v7 = off_2645530B0[a3];
    }
    __int16 v8 = v7;
    int v9 = 136315394;
    int v10 = "-[SVXClientServiceConnection notifySessionWillStartSoundWithID:]";
    __int16 v11 = 2112;
    id v12 = v8;
    _os_log_impl(&dword_220062000, v6, OS_LOG_TYPE_INFO, "%s soundID = %@", (uint8_t *)&v9, 0x16u);
  }
  [(SVXClientSessionService *)self->_sessionService handleWillStartSoundWithID:a3];
}

- (void)notifySessionWillPresentFeedbackWithDialogIdentifier:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v6 = 136315394;
    id v7 = "-[SVXClientServiceConnection notifySessionWillPresentFeedbackWithDialogIdentifier:]";
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_220062000, v5, OS_LOG_TYPE_INFO, "%s dialogIdentifier = %@", (uint8_t *)&v6, 0x16u);
  }
  [(SVXClientSessionService *)self->_sessionService handleWillPresentFeedbackWithDialogIdentifier:v4];
}

- (void)notifyDidChangeSessionStateFrom:(int64_t)a3 to:(int64_t)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v7 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    __int16 v8 = v7;
    if ((unint64_t)a3 > 4) {
      id v9 = @"(unknown)";
    }
    else {
      id v9 = off_2645542F8[a3];
    }
    uint64_t v10 = v9;
    if ((unint64_t)a4 > 4) {
      __int16 v11 = @"(unknown)";
    }
    else {
      __int16 v11 = off_2645542F8[a4];
    }
    id v12 = v11;
    int v13 = 136315650;
    id v14 = "-[SVXClientServiceConnection notifyDidChangeSessionStateFrom:to:]";
    __int16 v15 = 2112;
    id v16 = v10;
    __int16 v17 = 2112;
    id v18 = v12;
    _os_log_impl(&dword_220062000, v8, OS_LOG_TYPE_INFO, "%s fromState = %@, toState = %@", (uint8_t *)&v13, 0x20u);
  }
  [(SVXClientSessionService *)self->_sessionService handleDidChangeStateFrom:a3 to:a4];
}

- (void)notifyWillChangeSessionStateFrom:(int64_t)a3 to:(int64_t)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v7 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    __int16 v8 = v7;
    if ((unint64_t)a3 > 4) {
      id v9 = @"(unknown)";
    }
    else {
      id v9 = off_2645542F8[a3];
    }
    uint64_t v10 = v9;
    if ((unint64_t)a4 > 4) {
      __int16 v11 = @"(unknown)";
    }
    else {
      __int16 v11 = off_2645542F8[a4];
    }
    id v12 = v11;
    int v13 = 136315650;
    id v14 = "-[SVXClientServiceConnection notifyWillChangeSessionStateFrom:to:]";
    __int16 v15 = 2112;
    id v16 = v10;
    __int16 v17 = 2112;
    id v18 = v12;
    _os_log_impl(&dword_220062000, v8, OS_LOG_TYPE_INFO, "%s fromState = %@, toState = %@", (uint8_t *)&v13, 0x20u);
  }
  [(SVXClientSessionService *)self->_sessionService handleWillChangeStateFrom:a3 to:a4];
}

- (void)notifyDidDeactivateWithContext:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v6 = 136315394;
    id v7 = "-[SVXClientServiceConnection notifyDidDeactivateWithContext:]";
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_220062000, v5, OS_LOG_TYPE_INFO, "%s context = %@", (uint8_t *)&v6, 0x16u);
  }
  [(SVXClientActivationService *)self->_activationService handleDidDeactivateWithContext:v4];
}

- (void)notifyWillDeactivateWithContext:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v6 = 136315394;
    id v7 = "-[SVXClientServiceConnection notifyWillDeactivateWithContext:]";
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_220062000, v5, OS_LOG_TYPE_INFO, "%s context = %@", (uint8_t *)&v6, 0x16u);
  }
  [(SVXClientActivationService *)self->_activationService handleWillDeactivateWithContext:v4];
}

- (void)notifyDidNotActivateWithContext:(id)a3 error:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v9 = 136315650;
    uint64_t v10 = "-[SVXClientServiceConnection notifyDidNotActivateWithContext:error:]";
    __int16 v11 = 2112;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_220062000, v8, OS_LOG_TYPE_INFO, "%s context = %@, error = %@", (uint8_t *)&v9, 0x20u);
  }
  [(SVXClientActivationService *)self->_activationService handleDidNotActivateWithContext:v6 error:v7];
}

- (void)notifyDidActivateWithContext:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v6 = 136315394;
    id v7 = "-[SVXClientServiceConnection notifyDidActivateWithContext:]";
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_220062000, v5, OS_LOG_TYPE_INFO, "%s context = %@", (uint8_t *)&v6, 0x16u);
  }
  [(SVXClientActivationService *)self->_activationService handleDidActivateWithContext:v4];
}

- (void)notifyWillActivateWithContext:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v6 = 136315394;
    id v7 = "-[SVXClientServiceConnection notifyWillActivateWithContext:]";
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_220062000, v5, OS_LOG_TYPE_INFO, "%s context = %@", (uint8_t *)&v6, 0x16u);
  }
  [(SVXClientActivationService *)self->_activationService handleWillActivateWithContext:v4];
}

- (void)requestPermissionToActivateWithContext:(id)a3 completion:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v9 = 136315394;
    uint64_t v10 = "-[SVXClientServiceConnection requestPermissionToActivateWithContext:completion:]";
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl(&dword_220062000, v8, OS_LOG_TYPE_INFO, "%s context = %@", (uint8_t *)&v9, 0x16u);
  }
  [(SVXClientActivationService *)self->_activationService handleRequestPermissionToActivateWithContext:v6 completion:v7];
}

- (void)getInstanceInfoWithCompletion:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void *, void))a3;
  v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v7 = 136315138;
    __int16 v8 = "-[SVXClientServiceConnection getInstanceInfoWithCompletion:]";
    _os_log_impl(&dword_220062000, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v7, 0xCu);
  }
  if (v4)
  {
    id v6 = [(AFInstanceContext *)self->_instanceContext info];
    v4[2](v4, v6, 0);
  }
}

- (void)prepareForDeviceSetupWithContext:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v16 = "-[SVXClientServiceConnection prepareForDeviceSetupWithContext:completion:]";
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_220062000, v8, OS_LOG_TYPE_INFO, "%s context = %@", buf, 0x16u);
  }
  queuePerformer = self->_queuePerformer;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __74__SVXClientServiceConnection_prepareForDeviceSetupWithContext_completion___block_invoke;
  v12[3] = &unk_264554788;
  id v13 = v6;
  id v14 = v7;
  v12[4] = self;
  id v10 = v6;
  id v11 = v7;
  [(SVXQueuePerformer *)queuePerformer performBlock:v12];
}

void __74__SVXClientServiceConnection_prepareForDeviceSetupWithContext_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __74__SVXClientServiceConnection_prepareForDeviceSetupWithContext_completion___block_invoke_2;
  v4[3] = &unk_264553998;
  id v5 = *(id *)(a1 + 48);
  BOOL v3 = [v2 _clientServiceWithErrorHandler:v4];
  [v3 prepareForDeviceSetupWithContext:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

void __74__SVXClientServiceConnection_prepareForDeviceSetupWithContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[SVXClientServiceConnection prepareForDeviceSetupWithContext:completion:]_block_invoke_2";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_220062000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)setDeviceSetupContext:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v11 = "-[SVXClientServiceConnection setDeviceSetupContext:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_220062000, v5, OS_LOG_TYPE_INFO, "%s context = %@", buf, 0x16u);
  }
  queuePerformer = self->_queuePerformer;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __52__SVXClientServiceConnection_setDeviceSetupContext___block_invoke;
  v8[3] = &unk_2645548C8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(SVXQueuePerformer *)queuePerformer performBlock:v8];
}

void __52__SVXClientServiceConnection_setDeviceSetupContext___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _clientServiceWithErrorHandler:&__block_literal_global_25];
  [v2 setDeviceSetupContext:*(void *)(a1 + 40)];
}

void __52__SVXClientServiceConnection_setDeviceSetupContext___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[SVXClientServiceConnection setDeviceSetupContext:]_block_invoke_2";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_220062000, v3, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)stopSpeechSynthesisRequest:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v11 = "-[SVXClientServiceConnection stopSpeechSynthesisRequest:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_220062000, v5, OS_LOG_TYPE_INFO, "%s request = %@", buf, 0x16u);
  }
  queuePerformer = self->_queuePerformer;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __57__SVXClientServiceConnection_stopSpeechSynthesisRequest___block_invoke;
  v8[3] = &unk_2645548C8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(SVXQueuePerformer *)queuePerformer performBlock:v8];
}

void __57__SVXClientServiceConnection_stopSpeechSynthesisRequest___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _clientServiceWithErrorHandler:&__block_literal_global_23];
  [v2 stopSpeechSynthesisRequest:*(void *)(a1 + 40)];
}

void __57__SVXClientServiceConnection_stopSpeechSynthesisRequest___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[SVXClientServiceConnection stopSpeechSynthesisRequest:]_block_invoke_2";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_220062000, v3, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)cancelPendingSpeechSynthesisRequest:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v11 = "-[SVXClientServiceConnection cancelPendingSpeechSynthesisRequest:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_220062000, v5, OS_LOG_TYPE_INFO, "%s request = %@", buf, 0x16u);
  }
  queuePerformer = self->_queuePerformer;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __66__SVXClientServiceConnection_cancelPendingSpeechSynthesisRequest___block_invoke;
  v8[3] = &unk_2645548C8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(SVXQueuePerformer *)queuePerformer performBlock:v8];
}

void __66__SVXClientServiceConnection_cancelPendingSpeechSynthesisRequest___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _clientServiceWithErrorHandler:&__block_literal_global_21];
  [v2 cancelPendingSpeechSynthesisRequest:*(void *)(a1 + 40)];
}

void __66__SVXClientServiceConnection_cancelPendingSpeechSynthesisRequest___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[SVXClientServiceConnection cancelPendingSpeechSynthesisRequest:]_block_invoke_2";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_220062000, v3, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)enqueueSpeechSynthesisRequest:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v16 = "-[SVXClientServiceConnection enqueueSpeechSynthesisRequest:completion:]";
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_220062000, v8, OS_LOG_TYPE_INFO, "%s request = %@", buf, 0x16u);
  }
  queuePerformer = self->_queuePerformer;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __71__SVXClientServiceConnection_enqueueSpeechSynthesisRequest_completion___block_invoke;
  v12[3] = &unk_264554788;
  id v13 = v6;
  id v14 = v7;
  v12[4] = self;
  id v10 = v6;
  id v11 = v7;
  [(SVXQueuePerformer *)queuePerformer performBlock:v12];
}

void __71__SVXClientServiceConnection_enqueueSpeechSynthesisRequest_completion___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __71__SVXClientServiceConnection_enqueueSpeechSynthesisRequest_completion___block_invoke_2;
  v4[3] = &unk_264553998;
  id v5 = *(id *)(a1 + 48);
  id v3 = [v2 _clientServiceWithErrorHandler:v4];
  [v3 enqueueSpeechSynthesisRequest:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

void __71__SVXClientServiceConnection_enqueueSpeechSynthesisRequest_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[SVXClientServiceConnection enqueueSpeechSynthesisRequest:completion:]_block_invoke_2";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_error_impl(&dword_220062000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v7, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    id v6 = [[SVXSpeechSynthesisResult alloc] initWithType:4 utteranceInfo:0 error:v3];
    (*(void (**)(uint64_t, SVXSpeechSynthesisResult *))(v5 + 16))(v5, v6);
  }
}

- (void)synthesizeRequest:(id)a3 handlerUUID:(id)a4 completion:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v21 = "-[SVXClientServiceConnection synthesizeRequest:handlerUUID:completion:]";
    __int16 v22 = 2112;
    id v23 = v8;
    __int16 v24 = 2112;
    id v25 = v9;
    _os_log_impl(&dword_220062000, v11, OS_LOG_TYPE_INFO, "%s request = %@, handlerUUID = %@", buf, 0x20u);
  }
  queuePerformer = self->_queuePerformer;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __71__SVXClientServiceConnection_synthesizeRequest_handlerUUID_completion___block_invoke;
  v16[3] = &unk_264554918;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v9;
  id v14 = v8;
  id v15 = v10;
  [(SVXQueuePerformer *)queuePerformer performBlock:v16];
}

void __71__SVXClientServiceConnection_synthesizeRequest_handlerUUID_completion___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __71__SVXClientServiceConnection_synthesizeRequest_handlerUUID_completion___block_invoke_2;
  v4[3] = &unk_264553998;
  id v5 = *(id *)(a1 + 56);
  id v3 = [v2 _clientServiceWithErrorHandler:v4];
  [v3 synthesizeRequest:*(void *)(a1 + 40) handlerUUID:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

void __71__SVXClientServiceConnection_synthesizeRequest_handlerUUID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    id v8 = "-[SVXClientServiceConnection synthesizeRequest:handlerUUID:completion:]_block_invoke_2";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_error_impl(&dword_220062000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v7, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    id v6 = [[SVXSpeechSynthesisResult alloc] initWithType:4 utteranceInfo:0 error:v3];
    (*(void (**)(uint64_t, SVXSpeechSynthesisResult *))(v5 + 16))(v5, v6);
  }
}

- (void)prewarmRequest:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v11 = "-[SVXClientServiceConnection prewarmRequest:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_220062000, v5, OS_LOG_TYPE_INFO, "%s request = %@", buf, 0x16u);
  }
  queuePerformer = self->_queuePerformer;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __45__SVXClientServiceConnection_prewarmRequest___block_invoke;
  v8[3] = &unk_2645548C8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(SVXQueuePerformer *)queuePerformer performBlock:v8];
}

void __45__SVXClientServiceConnection_prewarmRequest___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _clientServiceWithErrorHandler:&__block_literal_global_18];
  [v2 prewarmRequest:*(void *)(a1 + 40)];
}

void __45__SVXClientServiceConnection_prewarmRequest___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[SVXClientServiceConnection prewarmRequest:]_block_invoke_2";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_220062000, v3, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)fetchAudioPowerWithType:(int64_t)a3 completion:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = v7;
    if ((unint64_t)a3 > 2) {
      id v9 = @"(unknown)";
    }
    else {
      id v9 = off_264552C98[a3];
    }
    id v10 = v9;
    *(_DWORD *)buf = 136315394;
    id v17 = "-[SVXClientServiceConnection fetchAudioPowerWithType:completion:]";
    __int16 v18 = 2112;
    id v19 = v10;
    _os_log_impl(&dword_220062000, v8, OS_LOG_TYPE_INFO, "%s type = %@", buf, 0x16u);
  }
  queuePerformer = self->_queuePerformer;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __65__SVXClientServiceConnection_fetchAudioPowerWithType_completion___block_invoke;
  v13[3] = &unk_264554650;
  v13[4] = self;
  id v14 = v6;
  int64_t v15 = a3;
  id v12 = v6;
  [(SVXQueuePerformer *)queuePerformer performBlock:v13];
}

void __65__SVXClientServiceConnection_fetchAudioPowerWithType_completion___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __65__SVXClientServiceConnection_fetchAudioPowerWithType_completion___block_invoke_2;
  v4[3] = &unk_264553998;
  id v2 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v3 = [v2 _clientServiceWithErrorHandler:v4];
  [v3 fetchAudioPowerWithType:*(void *)(a1 + 48) completion:*(void *)(a1 + 40)];
}

void __65__SVXClientServiceConnection_fetchAudioPowerWithType_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[SVXClientServiceConnection fetchAudioPowerWithType:completion:]_block_invoke_2";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_220062000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)prewarmWithContext:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v16 = "-[SVXClientServiceConnection prewarmWithContext:completion:]";
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_220062000, v8, OS_LOG_TYPE_INFO, "%s context = %@", buf, 0x16u);
  }
  queuePerformer = self->_queuePerformer;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __60__SVXClientServiceConnection_prewarmWithContext_completion___block_invoke;
  v12[3] = &unk_264554788;
  id v13 = v6;
  id v14 = v7;
  v12[4] = self;
  id v10 = v6;
  id v11 = v7;
  [(SVXQueuePerformer *)queuePerformer performBlock:v12];
}

void __60__SVXClientServiceConnection_prewarmWithContext_completion___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __60__SVXClientServiceConnection_prewarmWithContext_completion___block_invoke_2;
  v4[3] = &unk_264553998;
  id v5 = *(id *)(a1 + 48);
  id v3 = [v2 _clientServiceWithErrorHandler:v4];
  [v3 prewarmWithContext:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

void __60__SVXClientServiceConnection_prewarmWithContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[SVXClientServiceConnection prewarmWithContext:completion:]_block_invoke_2";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_220062000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(void))(v5 + 16))();
  }
}

- (void)preheatWithActivationSource:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v5 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v6 = v5;
    if ((unint64_t)a3 > 9) {
      id v7 = @"(unknown)";
    }
    else {
      id v7 = off_264553510[a3];
    }
    __int16 v8 = v7;
    *(_DWORD *)buf = 136315394;
    id v12 = "-[SVXClientServiceConnection preheatWithActivationSource:]";
    __int16 v13 = 2112;
    id v14 = v8;
    _os_log_impl(&dword_220062000, v6, OS_LOG_TYPE_INFO, "%s activationSource = %@", buf, 0x16u);
  }
  queuePerformer = self->_queuePerformer;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __58__SVXClientServiceConnection_preheatWithActivationSource___block_invoke;
  v10[3] = &unk_264554548;
  v10[4] = self;
  v10[5] = a3;
  [(SVXQueuePerformer *)queuePerformer performBlock:v10];
}

void __58__SVXClientServiceConnection_preheatWithActivationSource___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _clientServiceWithErrorHandler:&__block_literal_global_16];
  [v2 preheatWithActivationSource:*(void *)(a1 + 40)];
}

void __58__SVXClientServiceConnection_preheatWithActivationSource___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[SVXClientServiceConnection preheatWithActivationSource:]_block_invoke_2";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_220062000, v3, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)fetchAlarmAndTimerFiringContextWithCompletion:(id)a3
{
  id v4 = a3;
  queuePerformer = self->_queuePerformer;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __76__SVXClientServiceConnection_fetchAlarmAndTimerFiringContextWithCompletion___block_invoke;
  v7[3] = &unk_2645547D8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(SVXQueuePerformer *)queuePerformer performBlock:v7];
}

void __76__SVXClientServiceConnection_fetchAlarmAndTimerFiringContextWithCompletion___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __76__SVXClientServiceConnection_fetchAlarmAndTimerFiringContextWithCompletion___block_invoke_2;
  v4[3] = &unk_264553998;
  id v2 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v3 = [v2 _clientServiceWithErrorHandler:v4];
  [v3 fetchAlarmAndTimerFiringContextWithCompletion:*(void *)(a1 + 40)];
}

void __76__SVXClientServiceConnection_fetchAlarmAndTimerFiringContextWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[SVXClientServiceConnection fetchAlarmAndTimerFiringContextWithCompletion:]_block_invoke_2";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_220062000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)fetchSessionActivityStateWithCompletion:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v11 = "-[SVXClientServiceConnection fetchSessionActivityStateWithCompletion:]";
    _os_log_impl(&dword_220062000, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  queuePerformer = self->_queuePerformer;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __70__SVXClientServiceConnection_fetchSessionActivityStateWithCompletion___block_invoke;
  v8[3] = &unk_2645547D8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(SVXQueuePerformer *)queuePerformer performBlock:v8];
}

void __70__SVXClientServiceConnection_fetchSessionActivityStateWithCompletion___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __70__SVXClientServiceConnection_fetchSessionActivityStateWithCompletion___block_invoke_2;
  v4[3] = &unk_264553998;
  id v2 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v3 = [v2 _clientServiceWithErrorHandler:v4];
  [v3 fetchSessionActivityStateWithCompletion:*(void *)(a1 + 40)];
}

void __70__SVXClientServiceConnection_fetchSessionActivityStateWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[SVXClientServiceConnection fetchSessionActivityStateWithCompletion:]_block_invoke_2";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_220062000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)fetchSessionStateWithCompletion:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v11 = "-[SVXClientServiceConnection fetchSessionStateWithCompletion:]";
    _os_log_impl(&dword_220062000, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  queuePerformer = self->_queuePerformer;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __62__SVXClientServiceConnection_fetchSessionStateWithCompletion___block_invoke;
  v8[3] = &unk_2645547D8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(SVXQueuePerformer *)queuePerformer performBlock:v8];
}

void __62__SVXClientServiceConnection_fetchSessionStateWithCompletion___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __62__SVXClientServiceConnection_fetchSessionStateWithCompletion___block_invoke_2;
  v4[3] = &unk_264553998;
  id v2 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v3 = [v2 _clientServiceWithErrorHandler:v4];
  [v3 fetchSessionStateWithCompletion:*(void *)(a1 + 40)];
}

void __62__SVXClientServiceConnection_fetchSessionStateWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[SVXClientServiceConnection fetchSessionStateWithCompletion:]_block_invoke_2";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_220062000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)transitToAutomaticEndpointingWithTimestamp:(unint64_t)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v9 = "-[SVXClientServiceConnection transitToAutomaticEndpointingWithTimestamp:]";
    __int16 v10 = 2048;
    unint64_t v11 = a3;
    _os_log_debug_impl(&dword_220062000, v5, OS_LOG_TYPE_DEBUG, "%s timestamp = %lld", buf, 0x16u);
  }
  queuePerformer = self->_queuePerformer;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __73__SVXClientServiceConnection_transitToAutomaticEndpointingWithTimestamp___block_invoke;
  v7[3] = &unk_264554548;
  void v7[4] = self;
  void v7[5] = a3;
  [(SVXQueuePerformer *)queuePerformer performBlock:v7];
}

void __73__SVXClientServiceConnection_transitToAutomaticEndpointingWithTimestamp___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __73__SVXClientServiceConnection_transitToAutomaticEndpointingWithTimestamp___block_invoke_2;
  v4[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  void v4[4] = *(void *)(a1 + 40);
  id v3 = [v2 _clientServiceWithErrorHandler:v4];
  [v3 transitToAutomaticEndpointingWithTimestamp:*(void *)(a1 + 40)];
}

void __73__SVXClientServiceConnection_transitToAutomaticEndpointingWithTimestamp___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 136315650;
    id v7 = "-[SVXClientServiceConnection transitToAutomaticEndpointingWithTimestamp:]_block_invoke_2";
    __int16 v8 = 2112;
    id v9 = v3;
    __int16 v10 = 2048;
    uint64_t v11 = v5;
    _os_log_error_impl(&dword_220062000, v4, OS_LOG_TYPE_ERROR, "%s %@, timestamp = %lld", (uint8_t *)&v6, 0x20u);
  }
}

- (void)performManualEndpointing
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v7 = "-[SVXClientServiceConnection performManualEndpointing]";
    _os_log_impl(&dword_220062000, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  queuePerformer = self->_queuePerformer;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __54__SVXClientServiceConnection_performManualEndpointing__block_invoke;
  v5[3] = &unk_2645548A0;
  v5[4] = self;
  [(SVXQueuePerformer *)queuePerformer performBlock:v5];
}

void __54__SVXClientServiceConnection_performManualEndpointing__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _clientServiceWithErrorHandler:&__block_literal_global_621];
  [v1 performManualEndpointing];
}

void __54__SVXClientServiceConnection_performManualEndpointing__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[SVXClientServiceConnection performManualEndpointing]_block_invoke_2";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_220062000, v3, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)deactivateWithContext:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v16 = "-[SVXClientServiceConnection deactivateWithContext:completion:]";
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_220062000, v8, OS_LOG_TYPE_INFO, "%s context = %@", buf, 0x16u);
  }
  queuePerformer = self->_queuePerformer;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __63__SVXClientServiceConnection_deactivateWithContext_completion___block_invoke;
  v12[3] = &unk_264554788;
  id v13 = v6;
  id v14 = v7;
  v12[4] = self;
  id v10 = v6;
  id v11 = v7;
  [(SVXQueuePerformer *)queuePerformer performBlock:v12];
}

void __63__SVXClientServiceConnection_deactivateWithContext_completion___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __63__SVXClientServiceConnection_deactivateWithContext_completion___block_invoke_2;
  v4[3] = &unk_264553998;
  id v5 = *(id *)(a1 + 48);
  id v3 = [v2 _clientServiceWithErrorHandler:v4];
  [v3 deactivateWithContext:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

void __63__SVXClientServiceConnection_deactivateWithContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[SVXClientServiceConnection deactivateWithContext:completion:]_block_invoke_2";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_220062000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(void))(v5 + 16))();
  }
}

- (void)activateWithContext:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v16 = "-[SVXClientServiceConnection activateWithContext:completion:]";
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_220062000, v8, OS_LOG_TYPE_INFO, "%s context = %@", buf, 0x16u);
  }
  queuePerformer = self->_queuePerformer;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __61__SVXClientServiceConnection_activateWithContext_completion___block_invoke;
  v12[3] = &unk_264554788;
  id v13 = v6;
  id v14 = v7;
  v12[4] = self;
  id v10 = v6;
  id v11 = v7;
  [(SVXQueuePerformer *)queuePerformer performBlock:v12];
}

void __61__SVXClientServiceConnection_activateWithContext_completion___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __61__SVXClientServiceConnection_activateWithContext_completion___block_invoke_2;
  v4[3] = &unk_264553998;
  id v5 = *(id *)(a1 + 48);
  id v3 = [v2 _clientServiceWithErrorHandler:v4];
  [v3 activateWithContext:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

void __61__SVXClientServiceConnection_activateWithContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[SVXClientServiceConnection activateWithContext:completion:]_block_invoke_2";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_220062000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)pingWithReply:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v11 = "-[SVXClientServiceConnection pingWithReply:]";
    _os_log_impl(&dword_220062000, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  queuePerformer = self->_queuePerformer;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __44__SVXClientServiceConnection_pingWithReply___block_invoke;
  v8[3] = &unk_2645547D8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(SVXQueuePerformer *)queuePerformer performBlock:v8];
}

void __44__SVXClientServiceConnection_pingWithReply___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __44__SVXClientServiceConnection_pingWithReply___block_invoke_2;
  v4[3] = &unk_264553998;
  id v2 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v3 = [v2 _clientServiceWithErrorHandler:v4];
  [v3 pingWithReply:*(void *)(a1 + 40)];
}

void __44__SVXClientServiceConnection_pingWithReply___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[SVXClientServiceConnection pingWithReply:]_block_invoke_2";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_220062000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)invalidate
{
  queuePerformer = self->_queuePerformer;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __40__SVXClientServiceConnection_invalidate__block_invoke;
  v3[3] = &unk_2645548A0;
  v3[4] = self;
  [(SVXQueuePerformer *)queuePerformer performBlock:v3];
}

uint64_t __40__SVXClientServiceConnection_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (SVXClientKeepAliveServicing)keepAliveService
{
  return (SVXClientKeepAliveServicing *)self->_keepAliveService;
}

- (SVXClientSessionServicing)sessionService
{
  return (SVXClientSessionServicing *)self->_sessionService;
}

- (SVXClientAudioSystemServicing)audioSystemService
{
  return (SVXClientAudioSystemServicing *)self->_audioSystemService;
}

- (SVXClientDeviceServicing)deviceService
{
  return (SVXClientDeviceServicing *)self->_deviceService;
}

- (SVXClientSpeechSynthesisServicing)speechSynthesisService
{
  return (SVXClientSpeechSynthesisServicing *)self->_speechSynthesisService;
}

- (SVXClientAudioPowerServicing)outputAudioPowerService
{
  return (SVXClientAudioPowerServicing *)self->_outputAudioPowerService;
}

- (SVXClientAudioPowerServicing)inputAudioPowerService
{
  return (SVXClientAudioPowerServicing *)self->_inputAudioPowerService;
}

- (SVXClientActivationServicing)activationService
{
  return (SVXClientActivationServicing *)self->_activationService;
}

- (SVXPerforming)performer
{
  return (SVXPerforming *)self->_queuePerformer;
}

- (SVXClientServiceConnection)initWithQueuePerformer:(id)a3 activationService:(id)a4 audioSystemService:(id)a5 deviceService:(id)a6 inputAudioPowerService:(id)a7 outputAudioPowerService:(id)a8 sessionService:(id)a9 speechSynthesisService:(id)a10 keepAliveService:(id)a11 instanceContext:(id)a12 connectionFactory:(id)a13 delegate:(id)a14
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v40 = a3;
  id v28 = a4;
  id v39 = a4;
  id v29 = a5;
  id v38 = a5;
  id v37 = a6;
  id v36 = a7;
  id v35 = a8;
  id v34 = a9;
  id v33 = a10;
  id v32 = a11;
  id v19 = a12;
  id v20 = a13;
  id v21 = a14;
  v43.receiver = self;
  v43.super_class = (Class)SVXClientServiceConnection;
  __int16 v22 = [(SVXClientServiceConnection *)&v43 init];
  if (v22)
  {
    v31 = v21;
    id v23 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v45 = "-[SVXClientServiceConnection initWithQueuePerformer:activationService:audioSystemService:deviceService:input"
            "AudioPowerService:outputAudioPowerService:sessionService:speechSynthesisService:keepAliveService:instanceCon"
            "text:connectionFactory:delegate:]";
      _os_log_impl(&dword_220062000, v23, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
    }
    objc_storeStrong((id *)&v22->_queuePerformer, a3);
    objc_storeStrong((id *)&v22->_activationService, v28);
    objc_storeStrong((id *)&v22->_audioSystemService, v29);
    objc_storeStrong((id *)&v22->_deviceService, a6);
    objc_storeStrong((id *)&v22->_inputAudioPowerService, a7);
    objc_storeStrong((id *)&v22->_outputAudioPowerService, a8);
    objc_storeStrong((id *)&v22->_sessionService, a9);
    objc_storeStrong((id *)&v22->_speechSynthesisService, a10);
    objc_storeStrong((id *)&v22->_keepAliveService, a11);
    if (v19)
    {
      __int16 v24 = (AFInstanceContext *)v19;
    }
    else
    {
      __int16 v24 = [MEMORY[0x263F28528] defaultContext];
    }
    instanceContext = v22->_instanceContext;
    v22->_instanceContext = v24;
    id v21 = v31;

    objc_storeStrong((id *)&v22->_connectionFactory, a13);
    objc_storeWeak((id *)&v22->_delegate, v31);
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __249__SVXClientServiceConnection_initWithQueuePerformer_activationService_audioSystemService_deviceService_inputAudioPowerService_outputAudioPowerService_sessionService_speechSynthesisService_keepAliveService_instanceContext_connectionFactory_delegate___block_invoke;
    v41[3] = &unk_2645539C0;
    v42 = v22;
    [(SVXClientServiceConnection *)v42 pingWithReply:v41];
  }
  return v22;
}

void __249__SVXClientServiceConnection_initWithQueuePerformer_activationService_audioSystemService_deviceService_inputAudioPowerService_outputAudioPowerService_sessionService_speechSynthesisService_keepAliveService_instanceContext_connectionFactory_delegate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = (void *)v4[1];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __249__SVXClientServiceConnection_initWithQueuePerformer_activationService_audioSystemService_deviceService_inputAudioPowerService_outputAudioPowerService_sessionService_speechSynthesisService_keepAliveService_instanceContext_connectionFactory_delegate___block_invoke_2;
  v7[3] = &unk_2645548C8;
  id v8 = v3;
  id v9 = v4;
  id v6 = v3;
  [v5 performBlock:v7];
}

uint64_t __249__SVXClientServiceConnection_initWithQueuePerformer_activationService_audioSystemService_deviceService_inputAudioPowerService_outputAudioPowerService_sessionService_speechSynthesisService_keepAliveService_instanceContext_connectionFactory_delegate___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 40) _clientServiceDidChange:*(void *)(a1 + 32) == 0];
}

- (SVXClientServiceConnection)initWithQueuePerformer:(id)a3 activationService:(id)a4 audioSystemService:(id)a5 deviceService:(id)a6 inputAudioPowerService:(id)a7 outputAudioPowerService:(id)a8 sessionService:(id)a9 speechSynthesisService:(id)a10 keepAliveService:(id)a11 instanceContext:(id)a12 delegate:(id)a13
{
  id v29 = a13;
  id v27 = a12;
  id v16 = a11;
  id v24 = a10;
  id v17 = a9;
  id v23 = a8;
  id v18 = a7;
  id v19 = a6;
  id v26 = a5;
  id v20 = a4;
  id v21 = a3;
  v31 = objc_alloc_init(SVXXPCConnectionFactory);
  id v33 = [(SVXClientServiceConnection *)self initWithQueuePerformer:v21 activationService:v20 audioSystemService:v26 deviceService:v19 inputAudioPowerService:v18 outputAudioPowerService:v23 sessionService:v17 speechSynthesisService:v24 keepAliveService:v16 instanceContext:v27 connectionFactory:v31 delegate:v29];

  return v33;
}

- (SVXClientServiceConnection)initWithComponents:(unint64_t)a3 instanceContext:(id)a4 delegate:(id)a5
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v52 = "-[SVXClientServiceConnection initWithComponents:instanceContext:delegate:]";
    __int16 v53 = 2048;
    unint64_t v54 = a3;
    _os_log_impl(&dword_220062000, v10, OS_LOG_TYPE_INFO, "%s components = %lu", buf, 0x16u);
  }
  id v11 = [[SVXQueuePerformer alloc] initWithIdentifier:@"Client Service Connection" qosClass:33 relativePriority:0 options:2];
  v50 = (void *)[objc_alloc(MEMORY[0x263F283F8]) initWithInstanceContext:v8];
  if ((a3 & 2) != 0)
  {
    id v14 = [SVXClientActivationService alloc];
    uint64_t v15 = [v9 clientServiceConnection:self performerForComponent:1];
    if (v15)
    {
      v49 = [(SVXClientActivationService *)v14 initWithClientServiceProvider:self analytics:v50 performer:v15];
    }
    else
    {
      id v19 = +[SVXQueuePerformer sharedMainQueuePerformer];
      v49 = [(SVXClientActivationService *)v14 initWithClientServiceProvider:self analytics:v50 performer:v19];
    }
    if ((a3 & 4) != 0)
    {
LABEL_5:
      uint64_t v12 = [SVXClientAudioSystemService alloc];
      id v13 = [v9 clientServiceConnection:self performerForComponent:2];
      if (v13)
      {
        v48 = [(SVXClientAudioSystemService *)v12 initWithClientServiceProvider:self analytics:v50 performer:v13];
      }
      else
      {
        id v16 = +[SVXQueuePerformer sharedMainQueuePerformer];
        v48 = [(SVXClientAudioSystemService *)v12 initWithClientServiceProvider:self analytics:v50 performer:v16];
      }
      if ((a3 & 8) != 0) {
        goto LABEL_11;
      }
LABEL_16:
      v47 = 0;
      goto LABEL_19;
    }
  }
  else
  {
    v49 = 0;
    if ((a3 & 4) != 0) {
      goto LABEL_5;
    }
  }
  v48 = 0;
  if ((a3 & 8) == 0) {
    goto LABEL_16;
  }
LABEL_11:
  id v17 = [SVXClientDeviceService alloc];
  id v18 = [v9 clientServiceConnection:self performerForComponent:3];
  if (v18)
  {
    v47 = [(SVXClientDeviceService *)v17 initWithClientServiceProvider:self analytics:v50 performer:v18];
  }
  else
  {
    id v20 = +[SVXQueuePerformer sharedMainQueuePerformer];
    v47 = [(SVXClientDeviceService *)v17 initWithClientServiceProvider:self analytics:v50 performer:v20];
  }
LABEL_19:
  if ((a3 & 0x10) == 0)
  {
    uint64_t v46 = 0;
    if ((a3 & 0x20) != 0) {
      goto LABEL_21;
    }
LABEL_31:
    v45 = 0;
    if ((a3 & 0x40) != 0) {
      goto LABEL_27;
    }
LABEL_32:
    id v28 = 0;
    if ((a3 & 0x80) == 0) {
      goto LABEL_37;
    }
LABEL_33:
    v30 = [SVXClientSpeechSynthesisService alloc];
    v31 = [v9 clientServiceConnection:self performerForComponent:7];
    if (v31)
    {
      id v32 = [(SVXClientSpeechSynthesisService *)v30 initWithClientServiceProvider:self analytics:v50 performer:v31];
    }
    else
    {
      +[SVXQueuePerformer sharedMainQueuePerformer];
      v42 = v11;
      v38 = id v37 = v8;
      id v32 = [(SVXClientSpeechSynthesisService *)v30 initWithClientServiceProvider:self analytics:v50 performer:v38];

      id v8 = v37;
      id v11 = v42;
    }

    if ((a3 & 0x100) != 0) {
      goto LABEL_38;
    }
LABEL_42:
    id v36 = 0;
    goto LABEL_45;
  }
  id v23 = [SVXClientAudioPowerService alloc];
  id v24 = [v9 clientServiceConnection:self performerForComponent:4];
  if (v24)
  {
    uint64_t v46 = [(SVXClientAudioPowerService *)v23 initWithType:1 clientServiceProvider:self analytics:v50 performer:v24];
  }
  else
  {
    id v29 = +[SVXQueuePerformer sharedMainQueuePerformer];
    uint64_t v46 = [(SVXClientAudioPowerService *)v23 initWithType:1 clientServiceProvider:self analytics:v50 performer:v29];
  }
  if ((a3 & 0x20) == 0) {
    goto LABEL_31;
  }
LABEL_21:
  id v21 = [SVXClientAudioPowerService alloc];
  __int16 v22 = [v9 clientServiceConnection:self performerForComponent:5];
  if (v22)
  {
    v45 = [(SVXClientAudioPowerService *)v21 initWithType:2 clientServiceProvider:self analytics:v50 performer:v22];
  }
  else
  {
    id v25 = +[SVXQueuePerformer sharedMainQueuePerformer];
    v45 = [(SVXClientAudioPowerService *)v21 initWithType:2 clientServiceProvider:self analytics:v50 performer:v25];
  }
  if ((a3 & 0x40) == 0) {
    goto LABEL_32;
  }
LABEL_27:
  id v26 = [SVXClientSessionService alloc];
  id v27 = [v9 clientServiceConnection:self performerForComponent:6];
  if (v27)
  {
    id v28 = [(SVXClientSessionService *)v26 initWithClientServiceProvider:self analytics:v50 performer:v27];
  }
  else
  {
    id v33 = +[SVXQueuePerformer sharedMainQueuePerformer];
    id v28 = [(SVXClientSessionService *)v26 initWithClientServiceProvider:self analytics:v50 performer:v33];
  }
  if ((a3 & 0x80) != 0) {
    goto LABEL_33;
  }
LABEL_37:
  id v32 = 0;
  if ((a3 & 0x100) == 0) {
    goto LABEL_42;
  }
LABEL_38:
  id v34 = [SVXClientKeepAliveService alloc];
  id v35 = [v9 clientServiceConnection:self performerForComponent:8];
  if (v35)
  {
    id v36 = [(SVXClientKeepAliveService *)v34 initWithClientServiceProvider:self analytics:v50 performer:v35];
  }
  else
  {
    +[SVXQueuePerformer sharedMainQueuePerformer];
    objc_super v43 = v11;
    v40 = id v39 = v8;
    id v36 = [(SVXClientKeepAliveService *)v34 initWithClientServiceProvider:self analytics:v50 performer:v40];

    id v8 = v39;
    id v11 = v43;
  }

LABEL_45:
  v44 = [(SVXClientServiceConnection *)self initWithQueuePerformer:v11 activationService:v49 audioSystemService:v48 deviceService:v47 inputAudioPowerService:v46 outputAudioPowerService:v45 sessionService:v28 speechSynthesisService:v32 keepAliveService:v36 instanceContext:v8 delegate:v9];

  return v44;
}

- (SVXClientServiceConnection)initWithComponents:(unint64_t)a3 delegate:(id)a4
{
  id v6 = (void *)MEMORY[0x263F28528];
  id v7 = a4;
  id v8 = [v6 currentContext];
  id v9 = [(SVXClientServiceConnection *)self initWithComponents:a3 instanceContext:v8 delegate:v7];

  return v9;
}

- (void)dealloc
{
  [(SVXClientServiceConnection *)self _invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SVXClientServiceConnection;
  [(SVXClientServiceConnection *)&v3 dealloc];
}

@end