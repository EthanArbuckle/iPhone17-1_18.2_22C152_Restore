@interface SVXClientSpeechSynthesisService
- (BOOL)_handleSynthesizedBufferForHandlerUUID:(id)a3 audioChunkData:(id)a4 audioChunkIndex:(unint64_t)a5;
- (SVXClientSpeechSynthesisService)initWithClientServiceProvider:(id)a3 analytics:(id)a4 performer:(id)a5;
- (void)_addAudioChunkHandler:(id)a3 forUUID:(id)a4;
- (void)_removeAudioChunkHandlerForUUID:(id)a3;
- (void)cancelPendingRequest:(id)a3;
- (void)enqueueRequest:(id)a3 completion:(id)a4;
- (void)handleSynthesizedBufferForHandlerUUID:(id)a3 audioChunkData:(id)a4 audioChunkIndex:(unint64_t)a5 reply:(id)a6;
- (void)prewarmRequest:(id)a3;
- (void)stopRequest:(id)a3;
- (void)synthesizeRequest:(id)a3 audioChunkHandler:(id)a4 completion:(id)a5;
- (void)synthesizeRequest:(id)a3 completion:(id)a4;
@end

@implementation SVXClientSpeechSynthesisService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioChunkHandlersByUUID, 0);
  objc_storeStrong((id *)&self->_clientServiceProvider, 0);

  objc_storeStrong((id *)&self->_performer, 0);
}

- (BOOL)_handleSynthesizedBufferForHandlerUUID:(id)a3 audioChunkData:(id)a4 audioChunkIndex:(unint64_t)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = (os_log_t *)MEMORY[0x263F28348];
  v11 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    int v18 = 136315906;
    v19 = "-[SVXClientSpeechSynthesisService _handleSynthesizedBufferForHandlerUUID:audioChunkData:audioChunkIndex:]";
    __int16 v20 = 2112;
    id v21 = v8;
    __int16 v22 = 2048;
    unint64_t v23 = a5;
    __int16 v24 = 2112;
    id v25 = v9;
    _os_log_debug_impl(&dword_220062000, v11, OS_LOG_TYPE_DEBUG, "%s handlerUUID = %@, audioChunkIndex = %tu, audioChunkData = %@", (uint8_t *)&v18, 0x2Au);
    if (v8) {
      goto LABEL_3;
    }
  }
  else if (v8)
  {
LABEL_3:
    uint64_t v12 = [(NSMutableDictionary *)self->_audioChunkHandlersByUUID objectForKey:v8];
    v13 = (void *)v12;
    BOOL v14 = v12 != 0;
    if (v12)
    {
      (*(void (**)(uint64_t, id, unint64_t))(v12 + 16))(v12, v9, a5);
    }
    else
    {
      v15 = *v10;
      if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR))
      {
        int v18 = 136315138;
        v19 = "-[SVXClientSpeechSynthesisService _handleSynthesizedBufferForHandlerUUID:audioChunkData:audioChunkIndex:]";
        _os_log_error_impl(&dword_220062000, v15, OS_LOG_TYPE_ERROR, "%s Audio chunk handler is nil.", (uint8_t *)&v18, 0xCu);
      }
    }

    goto LABEL_12;
  }
  v16 = *v10;
  if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR))
  {
    int v18 = 136315138;
    v19 = "-[SVXClientSpeechSynthesisService _handleSynthesizedBufferForHandlerUUID:audioChunkData:audioChunkIndex:]";
    _os_log_error_impl(&dword_220062000, v16, OS_LOG_TYPE_ERROR, "%s Audio chunk handler UUID is nil.", (uint8_t *)&v18, 0xCu);
  }
  BOOL v14 = 0;
LABEL_12:

  return v14;
}

- (void)_removeAudioChunkHandlerForUUID:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315394;
    v7 = "-[SVXClientSpeechSynthesisService _removeAudioChunkHandlerForUUID:]";
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_debug_impl(&dword_220062000, v5, OS_LOG_TYPE_DEBUG, "%s handlerUUID = %@", (uint8_t *)&v6, 0x16u);
  }
  [(NSMutableDictionary *)self->_audioChunkHandlersByUUID removeObjectForKey:v4];
}

- (void)_addAudioChunkHandler:(id)a3 forUUID:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = v7;
  if (v6 && v7)
  {
    if (!self->_audioChunkHandlersByUUID)
    {
      id v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      audioChunkHandlersByUUID = self->_audioChunkHandlersByUUID;
      self->_audioChunkHandlersByUUID = v9;
    }
    v11 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
    {
      int v14 = 136315394;
      v15 = "-[SVXClientSpeechSynthesisService _addAudioChunkHandler:forUUID:]";
      __int16 v16 = 2112;
      v17 = v8;
      _os_log_debug_impl(&dword_220062000, v11, OS_LOG_TYPE_DEBUG, "%s handlerUUID = %@", (uint8_t *)&v14, 0x16u);
    }
    uint64_t v12 = self->_audioChunkHandlersByUUID;
    v13 = (void *)MEMORY[0x223C65C40](v6);
    [(NSMutableDictionary *)v12 setObject:v13 forKey:v8];
  }
}

- (void)stopRequest:(id)a3
{
  id v4 = a3;
  clientServiceProvider = self->_clientServiceProvider;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__SVXClientSpeechSynthesisService_stopRequest___block_invoke;
  v7[3] = &unk_2645531B8;
  id v8 = v4;
  id v6 = v4;
  [(SVXClientServiceProviding *)clientServiceProvider getClientServiceUsingBlock:v7 errorHandler:&__block_literal_global_9];
}

uint64_t __47__SVXClientSpeechSynthesisService_stopRequest___block_invoke(uint64_t a1, void *a2)
{
  return [a2 stopSpeechSynthesisRequest:*(void *)(a1 + 32)];
}

void __47__SVXClientSpeechSynthesisService_stopRequest___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    v5 = "-[SVXClientSpeechSynthesisService stopRequest:]_block_invoke_2";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_220062000, v3, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)cancelPendingRequest:(id)a3
{
  id v4 = a3;
  clientServiceProvider = self->_clientServiceProvider;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__SVXClientSpeechSynthesisService_cancelPendingRequest___block_invoke;
  v7[3] = &unk_2645531B8;
  id v8 = v4;
  id v6 = v4;
  [(SVXClientServiceProviding *)clientServiceProvider getClientServiceUsingBlock:v7 errorHandler:&__block_literal_global_7];
}

uint64_t __56__SVXClientSpeechSynthesisService_cancelPendingRequest___block_invoke(uint64_t a1, void *a2)
{
  return [a2 cancelPendingSpeechSynthesisRequest:*(void *)(a1 + 32)];
}

void __56__SVXClientSpeechSynthesisService_cancelPendingRequest___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    v5 = "-[SVXClientSpeechSynthesisService cancelPendingRequest:]_block_invoke_2";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_220062000, v3, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)enqueueRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  clientServiceProvider = self->_clientServiceProvider;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __61__SVXClientSpeechSynthesisService_enqueueRequest_completion___block_invoke;
  v13[3] = &unk_264552E30;
  id v14 = v6;
  v15 = self;
  id v16 = v7;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __61__SVXClientSpeechSynthesisService_enqueueRequest_completion___block_invoke_4;
  v11[3] = &unk_264553998;
  id v12 = v16;
  id v9 = v16;
  id v10 = v6;
  [(SVXClientServiceProviding *)clientServiceProvider getClientServiceUsingBlock:v13 errorHandler:v11];
}

void __61__SVXClientSpeechSynthesisService_enqueueRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __61__SVXClientSpeechSynthesisService_enqueueRequest_completion___block_invoke_2;
  v6[3] = &unk_264552C50;
  id v5 = *(id *)(a1 + 48);
  v6[4] = *(void *)(a1 + 40);
  id v7 = v5;
  [a2 enqueueSpeechSynthesisRequest:v4 completion:v6];
}

void __61__SVXClientSpeechSynthesisService_enqueueRequest_completion___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[SVXClientSpeechSynthesisService enqueueRequest:completion:]_block_invoke_4";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_error_impl(&dword_220062000, v4, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v7, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    id v6 = [[SVXSpeechSynthesisResult alloc] initWithType:4 utteranceInfo:0 error:v3];
    (*(void (**)(uint64_t, SVXSpeechSynthesisResult *))(v5 + 16))(v5, v6);
  }
}

void __61__SVXClientSpeechSynthesisService_enqueueRequest_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 40);
  if (v4)
  {
    uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 8);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __61__SVXClientSpeechSynthesisService_enqueueRequest_completion___block_invoke_3;
    v6[3] = &unk_2645547D8;
    id v8 = v4;
    id v7 = v3;
    [v5 performBlock:v6];
  }
}

uint64_t __61__SVXClientSpeechSynthesisService_enqueueRequest_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)synthesizeRequest:(id)a3 audioChunkHandler:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init(MEMORY[0x263F08C38]);
  performer = self->_performer;
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __82__SVXClientSpeechSynthesisService_synthesizeRequest_audioChunkHandler_completion___block_invoke;
  v27[3] = &unk_264554788;
  v27[4] = self;
  id v29 = v9;
  id v13 = v11;
  id v28 = v13;
  id v14 = v9;
  [(SVXPerforming *)performer performBlock:v27];
  clientServiceProvider = self->_clientServiceProvider;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __82__SVXClientSpeechSynthesisService_synthesizeRequest_audioChunkHandler_completion___block_invoke_2;
  v22[3] = &unk_264552C78;
  id v23 = v8;
  id v24 = v13;
  id v25 = self;
  id v26 = v10;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __82__SVXClientSpeechSynthesisService_synthesizeRequest_audioChunkHandler_completion___block_invoke_6;
  v19[3] = &unk_264553C40;
  v19[4] = self;
  id v20 = v24;
  id v21 = v26;
  id v16 = v26;
  id v17 = v24;
  id v18 = v8;
  [(SVXClientServiceProviding *)clientServiceProvider getClientServiceUsingBlock:v22 errorHandler:v19];
}

uint64_t __82__SVXClientSpeechSynthesisService_synthesizeRequest_audioChunkHandler_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addAudioChunkHandler:*(void *)(a1 + 48) forUUID:*(void *)(a1 + 40)];
}

void __82__SVXClientSpeechSynthesisService_synthesizeRequest_audioChunkHandler_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __82__SVXClientSpeechSynthesisService_synthesizeRequest_audioChunkHandler_completion___block_invoke_3;
  v7[3] = &unk_2645535E0;
  int8x16_t v6 = *(int8x16_t *)(a1 + 40);
  id v5 = (id)v6.i64[0];
  int8x16_t v8 = vextq_s8(v6, v6, 8uLL);
  id v9 = *(id *)(a1 + 56);
  [a2 synthesizeRequest:v4 handlerUUID:v5 completion:v7];
}

void __82__SVXClientSpeechSynthesisService_synthesizeRequest_audioChunkHandler_completion___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    id v17 = "-[SVXClientSpeechSynthesisService synthesizeRequest:audioChunkHandler:completion:]_block_invoke_6";
    __int16 v18 = 2112;
    id v19 = v3;
    _os_log_error_impl(&dword_220062000, v4, OS_LOG_TYPE_ERROR, "%s error = %@", buf, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  int8x16_t v6 = *(void **)(v5 + 8);
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  id v12 = __82__SVXClientSpeechSynthesisService_synthesizeRequest_audioChunkHandler_completion___block_invoke_5;
  id v13 = &unk_2645548C8;
  uint64_t v14 = v5;
  id v15 = *(id *)(a1 + 40);
  [v6 performBlock:&v10];
  uint64_t v7 = *(void *)(a1 + 48);
  if (v7)
  {
    int8x16_t v8 = [SVXSpeechSynthesisResult alloc];
    id v9 = -[SVXSpeechSynthesisResult initWithType:utteranceInfo:error:](v8, "initWithType:utteranceInfo:error:", 4, 0, v3, v10, v11, v12, v13, v14);
    (*(void (**)(uint64_t, SVXSpeechSynthesisResult *))(v7 + 16))(v7, v9);
  }
}

uint64_t __82__SVXClientSpeechSynthesisService_synthesizeRequest_audioChunkHandler_completion___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeAudioChunkHandlerForUUID:*(void *)(a1 + 40)];
}

{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __82__SVXClientSpeechSynthesisService_synthesizeRequest_audioChunkHandler_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 8);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __82__SVXClientSpeechSynthesisService_synthesizeRequest_audioChunkHandler_completion___block_invoke_4;
  v11[3] = &unk_2645548C8;
  void v11[4] = v4;
  id v12 = *(id *)(a1 + 40);
  [v5 performBlock:v11];
  int8x16_t v6 = *(void **)(a1 + 48);
  if (v6)
  {
    uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 8);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __82__SVXClientSpeechSynthesisService_synthesizeRequest_audioChunkHandler_completion___block_invoke_5;
    v8[3] = &unk_2645547D8;
    id v10 = v6;
    id v9 = v3;
    [v7 performBlock:v8];
  }
}

uint64_t __82__SVXClientSpeechSynthesisService_synthesizeRequest_audioChunkHandler_completion___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeAudioChunkHandlerForUUID:*(void *)(a1 + 40)];
}

- (void)synthesizeRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  clientServiceProvider = self->_clientServiceProvider;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __64__SVXClientSpeechSynthesisService_synthesizeRequest_completion___block_invoke;
  v13[3] = &unk_264552E30;
  id v14 = v6;
  id v15 = self;
  id v16 = v7;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __64__SVXClientSpeechSynthesisService_synthesizeRequest_completion___block_invoke_4;
  v11[3] = &unk_264553998;
  id v12 = v16;
  id v9 = v16;
  id v10 = v6;
  [(SVXClientServiceProviding *)clientServiceProvider getClientServiceUsingBlock:v13 errorHandler:v11];
}

void __64__SVXClientSpeechSynthesisService_synthesizeRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __64__SVXClientSpeechSynthesisService_synthesizeRequest_completion___block_invoke_2;
  v6[3] = &unk_264552C50;
  id v5 = *(id *)(a1 + 48);
  void v6[4] = *(void *)(a1 + 40);
  id v7 = v5;
  [a2 synthesizeRequest:v4 handlerUUID:0 completion:v6];
}

void __64__SVXClientSpeechSynthesisService_synthesizeRequest_completion___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    int8x16_t v8 = "-[SVXClientSpeechSynthesisService synthesizeRequest:completion:]_block_invoke_4";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_error_impl(&dword_220062000, v4, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v7, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    id v6 = [[SVXSpeechSynthesisResult alloc] initWithType:4 utteranceInfo:0 error:v3];
    (*(void (**)(uint64_t, SVXSpeechSynthesisResult *))(v5 + 16))(v5, v6);
  }
}

void __64__SVXClientSpeechSynthesisService_synthesizeRequest_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 40);
  if (v4)
  {
    uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 8);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __64__SVXClientSpeechSynthesisService_synthesizeRequest_completion___block_invoke_3;
    v6[3] = &unk_2645547D8;
    id v8 = v4;
    id v7 = v3;
    [v5 performBlock:v6];
  }
}

uint64_t __64__SVXClientSpeechSynthesisService_synthesizeRequest_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)prewarmRequest:(id)a3
{
  id v4 = a3;
  clientServiceProvider = self->_clientServiceProvider;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__SVXClientSpeechSynthesisService_prewarmRequest___block_invoke;
  v7[3] = &unk_2645531B8;
  id v8 = v4;
  id v6 = v4;
  [(SVXClientServiceProviding *)clientServiceProvider getClientServiceUsingBlock:v7 errorHandler:&__block_literal_global_5040];
}

uint64_t __50__SVXClientSpeechSynthesisService_prewarmRequest___block_invoke(uint64_t a1, void *a2)
{
  return [a2 prewarmRequest:*(void *)(a1 + 32)];
}

void __50__SVXClientSpeechSynthesisService_prewarmRequest___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[SVXClientSpeechSynthesisService prewarmRequest:]_block_invoke_2";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_220062000, v3, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v4, 0x16u);
  }
}

- (SVXClientSpeechSynthesisService)initWithClientServiceProvider:(id)a3 analytics:(id)a4 performer:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)SVXClientSpeechSynthesisService;
  id v10 = [(SVXClientSpeechSynthesisService *)&v13 init];
  uint64_t v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_performer, a5);
    objc_storeStrong((id *)&v11->_clientServiceProvider, a3);
  }

  return v11;
}

- (void)handleSynthesizedBufferForHandlerUUID:(id)a3 audioChunkData:(id)a4 audioChunkIndex:(unint64_t)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  performer = self->_performer;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __110__SVXClientSpeechSynthesisService_handleSynthesizedBufferForHandlerUUID_audioChunkData_audioChunkIndex_reply___block_invoke;
  v17[3] = &unk_264553878;
  v17[4] = self;
  id v18 = v10;
  id v20 = v12;
  unint64_t v21 = a5;
  id v19 = v11;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  [(SVXPerforming *)performer performBlock:v17];
}

uint64_t __110__SVXClientSpeechSynthesisService_handleSynthesizedBufferForHandlerUUID_audioChunkData_audioChunkIndex_reply___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _handleSynthesizedBufferForHandlerUUID:*(void *)(a1 + 40) audioChunkData:*(void *)(a1 + 48) audioChunkIndex:*(void *)(a1 + 64)];
  uint64_t result = *(void *)(a1 + 56);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

@end