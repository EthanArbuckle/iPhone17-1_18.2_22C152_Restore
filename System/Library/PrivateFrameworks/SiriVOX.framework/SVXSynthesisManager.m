@interface SVXSynthesisManager
- (SVXSynthesisManager)initWithModule:(id)a3;
- (SVXSynthesisManager)initWithPerformer:(id)a3 remoteDelegateSupplier:(id)a4;
- (id)_createGroup;
- (void)startWithModuleInstanceProvider:(id)a3 platformDependencies:(id)a4;
- (void)stopWithModuleInstanceProvider:(id)a3;
- (void)synthesizeRequest:(id)a3 xpcConnection:(id)a4 handlerUUID:(id)a5 completion:(id)a6;
@end

@implementation SVXSynthesisManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speechSynthesizer, 0);
  objc_storeStrong((id *)&self->_remoteDelegateSupplier, 0);

  objc_storeStrong((id *)&self->_performer, 0);
}

- (id)_createGroup
{
  dispatch_group_t v2 = dispatch_group_create();

  return v2;
}

- (void)synthesizeRequest:(id)a3 xpcConnection:(id)a4 handlerUUID:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a3;
  v14 = [(SVXSynthesisManager *)self _createGroup];
  speechSynthesizer = self->_speechSynthesizer;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __78__SVXSynthesisManager_synthesizeRequest_xpcConnection_handlerUUID_completion___block_invoke;
  v24[3] = &unk_2645535B8;
  id v25 = v11;
  id v26 = v14;
  v27 = self;
  id v28 = v10;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __78__SVXSynthesisManager_synthesizeRequest_xpcConnection_handlerUUID_completion___block_invoke_8;
  v20[3] = &unk_2645535E0;
  id v21 = v26;
  v22 = self;
  id v23 = v12;
  id v16 = v12;
  id v17 = v26;
  id v18 = v10;
  id v19 = v11;
  [(SVXSpeechSynthesizer *)speechSynthesizer synthesizeRequest:v13 audioChunkHandler:v24 taskTracker:0 analyticsContext:0 completion:v20];
}

void __78__SVXSynthesisManager_synthesizeRequest_xpcConnection_handlerUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [v3 audioChunkIndex];
  v5 = [v3 audioChunkData];

  uint64_t v6 = *(void *)(a1 + 32);
  if (v6)
  {
    v7 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      id v23 = "-[SVXSynthesisManager synthesizeRequest:xpcConnection:handlerUUID:completion:]_block_invoke";
      __int16 v24 = 2112;
      uint64_t v25 = v6;
      __int16 v26 = 2048;
      uint64_t v27 = v4;
      __int16 v28 = 2112;
      v29 = v5;
      _os_log_debug_impl(&dword_220062000, v7, OS_LOG_TYPE_DEBUG, "%s handlerUUID = %@, audioChunkIndex = %tu, audioChunkData = %@", buf, 0x2Au);
    }
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
    id v8 = objc_alloc(MEMORY[0x263F285B8]);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __78__SVXSynthesisManager_synthesizeRequest_xpcConnection_handlerUUID_completion___block_invoke_2;
    v20[3] = &unk_264553568;
    id v21 = *(id *)(a1 + 40);
    v9 = (void *)[v8 initWithBlock:v20];
    uint64_t v10 = *(void *)(a1 + 48);
    id v11 = *(void **)(v10 + 8);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __78__SVXSynthesisManager_synthesizeRequest_xpcConnection_handlerUUID_completion___block_invoke_2;
    v14[3] = &unk_264553590;
    v14[4] = v10;
    id v15 = *(id *)(a1 + 56);
    id v16 = v9;
    id v17 = *(id *)(a1 + 32);
    id v18 = v5;
    uint64_t v19 = v4;
    id v12 = v9;
    [v11 performBlock:v14];
  }
  else if (!v4)
  {
    id v13 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      id v23 = "-[SVXSynthesisManager synthesizeRequest:xpcConnection:handlerUUID:completion:]_block_invoke";
      _os_log_debug_impl(&dword_220062000, v13, OS_LOG_TYPE_DEBUG, "%s Not sending audio chunks to client because the handler UUID is nil.", buf, 0xCu);
    }
  }
}

void __78__SVXSynthesisManager_synthesizeRequest_xpcConnection_handlerUUID_completion___block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = (os_log_t *)MEMORY[0x263F28348];
  v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v13 = "-[SVXSynthesisManager synthesizeRequest:xpcConnection:handlerUUID:completion:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_debug_impl(&dword_220062000, v5, OS_LOG_TYPE_DEBUG, "%s result = %@", buf, 0x16u);
  }
  if (*(void *)(a1 + 32))
  {
    uint64_t v6 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      id v13 = "-[SVXSynthesisManager synthesizeRequest:xpcConnection:handlerUUID:completion:]_block_invoke";
      _os_log_debug_impl(&dword_220062000, v6, OS_LOG_TYPE_DEBUG, "%s Waiting for pending audio chunks to be sent to the client and acknowledged by the client...", buf, 0xCu);
    }
    v7 = *(void **)(*(void *)(a1 + 40) + 8);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __78__SVXSynthesisManager_synthesizeRequest_xpcConnection_handlerUUID_completion___block_invoke_9;
    v9[3] = &unk_2645547D8;
    id v11 = *(id *)(a1 + 48);
    id v10 = v3;
    [v7 performBlock:v9 afterGroup:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 48);
    if (v8) {
      (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);
    }
  }
}

uint64_t __78__SVXSynthesisManager_synthesizeRequest_xpcConnection_handlerUUID_completion___block_invoke_9(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  dispatch_group_t v2 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    int v4 = 136315138;
    v5 = "-[SVXSynthesisManager synthesizeRequest:xpcConnection:handlerUUID:completion:]_block_invoke";
    _os_log_debug_impl(&dword_220062000, v2, OS_LOG_TYPE_DEBUG, "%s Finished waiting for pending audio chunks to be sent to the client and acknowledged by the client.", (uint8_t *)&v4, 0xCu);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

void __78__SVXSynthesisManager_synthesizeRequest_xpcConnection_handlerUUID_completion___block_invoke_2(uint64_t a1)
{
}

{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void v8[4];
  id v9;
  void v10[4];
  id v11;

  dispatch_group_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 16);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __78__SVXSynthesisManager_synthesizeRequest_xpcConnection_handlerUUID_completion___block_invoke_3;
  v10[3] = &unk_2645539C0;
  id v11 = *(id *)(a1 + 48);
  int v4 = [v3 remoteServiceDelegateWithConnection:v2 errorHandler:v10];
  v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 64);
  v7 = *(void *)(a1 + 72);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __78__SVXSynthesisManager_synthesizeRequest_xpcConnection_handlerUUID_completion___block_invoke_4;
  v8[3] = &unk_2645545B8;
  v9 = *(id *)(a1 + 48);
  [v4 handleSpeechSynthesisSynthesizedBufferForHandlerUUID:v5 audioChunkData:v6 audioChunkIndex:v7 reply:v8];
}

void __78__SVXSynthesisManager_synthesizeRequest_xpcConnection_handlerUUID_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    uint64_t v6 = "-[SVXSynthesisManager synthesizeRequest:xpcConnection:handlerUUID:completion:]_block_invoke_3";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_error_impl(&dword_220062000, v4, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v5, 0x16u);
  }
  [*(id *)(a1 + 32) invokeWithSignal:-4];
}

uint64_t __78__SVXSynthesisManager_synthesizeRequest_xpcConnection_handlerUUID_completion___block_invoke_4(uint64_t a1, int a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315394;
    __int16 v7 = "-[SVXSynthesisManager synthesizeRequest:xpcConnection:handlerUUID:completion:]_block_invoke";
    __int16 v8 = 1024;
    int v9 = a2;
    _os_log_debug_impl(&dword_220062000, v4, OS_LOG_TYPE_DEBUG, "%s handled = %d", (uint8_t *)&v6, 0x12u);
  }
  return [*(id *)(a1 + 32) invokeWithSignal:0];
}

- (void)stopWithModuleInstanceProvider:(id)a3
{
  self->_speechSynthesizer = 0;
  MEMORY[0x270F9A758]();
}

- (void)startWithModuleInstanceProvider:(id)a3 platformDependencies:(id)a4
{
  self->_speechSynthesizer = [a3 speechSynthesizer];

  MEMORY[0x270F9A758]();
}

- (SVXSynthesisManager)initWithModule:(id)a3
{
  int v4 = [a3 performer];
  int v5 = objc_alloc_init(SVXClientServiceRemoteDelegateSupplier);
  int v6 = [(SVXSynthesisManager *)self initWithPerformer:v4 remoteDelegateSupplier:v5];

  return v6;
}

- (SVXSynthesisManager)initWithPerformer:(id)a3 remoteDelegateSupplier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SVXSynthesisManager;
  int v9 = [(SVXSynthesisManager *)&v12 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_performer, a3);
    objc_storeStrong((id *)&v10->_remoteDelegateSupplier, a4);
  }

  return v10;
}

@end