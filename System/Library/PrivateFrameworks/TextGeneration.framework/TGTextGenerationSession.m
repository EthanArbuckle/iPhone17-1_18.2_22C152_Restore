@interface TGTextGenerationSession
+ (id)defaultTextGeneration;
+ (id)workQueue;
- (NSMutableDictionary)callbackByExecutionUUID;
- (NSMutableDictionary)operationByExecutionUUID;
- (NSMutableDictionary)outputStreamByExecutionUUID;
- (NSUUID)uuid;
- (OS_dispatch_queue)workQueue;
- (TGITextGenerationInference)textGeneration;
- (TGITextGenerationInferenceSession)tgdSession;
- (TGTextGenerationConfiguration)configuration;
- (TGTextGenerationSession)init;
- (TGTextGenerationSession)initWithConfiguration:(id)a3;
- (TGTextGenerationSession)initWithConfiguration:(id)a3 textGeneration:(id)a4;
- (TGTextGenerationSessionDelegate)delegate;
- (id)enqueueOperationSync:(id)a3;
- (id)executionUUIDForOperation:(id)a3;
- (void)cancelOperation:(id)a3;
- (void)createTgdSessionSync;
- (void)didStartOperationWithExecutionUUID:(id)a3;
- (void)enqueueOperation:(id)a3;
- (void)executeOperation:(id)a3 callback:(id)a4;
- (void)operation:(id)a3 didUpdateOutputStream:(id)a4;
- (void)operationWithExecutionUUID:(id)a3 didFailWithError:(id)a4;
- (void)operationWithExecutionUUID:(id)a3 didFinishWithOutputs:(id)a4;
- (void)operationWithExecutionUUID:(id)a3 didStreamOutput:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setTgdSession:(id)a3;
@end

@implementation TGTextGenerationSession

+ (id)workQueue
{
  if (workQueue_onceToken != -1) {
    dispatch_once(&workQueue_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)workQueue_workQueue;
  return v2;
}

void __36__TGTextGenerationSession_workQueue__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.text-generation", 0);
  v1 = (void *)workQueue_workQueue;
  workQueue_workQueue = (uint64_t)v0;

  v2 = workQueue_workQueue;
  v3 = dispatch_get_global_queue(33, 0);
  dispatch_set_target_queue(v2, v3);
}

+ (id)defaultTextGeneration
{
  if (defaultTextGeneration_onceToken != -1) {
    dispatch_once(&defaultTextGeneration_onceToken, &__block_literal_global_3_0);
  }
  v2 = (void *)defaultTextGeneration_textGeneration;
  return v2;
}

uint64_t __48__TGTextGenerationSession_defaultTextGeneration__block_invoke()
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2050000000;
  dispatch_queue_t v0 = (void *)getTGITextGenerationInferenceClass_softClass;
  uint64_t v11 = getTGITextGenerationInferenceClass_softClass;
  if (!getTGITextGenerationInferenceClass_softClass)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __getTGITextGenerationInferenceClass_block_invoke;
    v7[3] = &unk_265533FF8;
    v7[4] = &v8;
    __getTGITextGenerationInferenceClass_block_invoke((uint64_t)v7);
    dispatch_queue_t v0 = (void *)v9[3];
  }
  v1 = v0;
  _Block_object_dispose(&v8, 8);
  id v2 = [v1 alloc];
  v3 = +[TGTextGenerationSession workQueue];
  uint64_t v4 = [v2 initWithWorkQueue:v3];
  v5 = (void *)defaultTextGeneration_textGeneration;
  defaultTextGeneration_textGeneration = v4;

  return [(id)defaultTextGeneration_textGeneration start];
}

- (TGTextGenerationSession)init
{
  v3 = +[TGTextGenerationConfiguration defaultConfiguration];
  uint64_t v4 = [(id)objc_opt_class() defaultTextGeneration];
  v5 = [(TGTextGenerationSession *)self initWithConfiguration:v3 textGeneration:v4];

  return v5;
}

- (TGTextGenerationSession)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() defaultTextGeneration];
  v6 = [(TGTextGenerationSession *)self initWithConfiguration:v4 textGeneration:v5];

  return v6;
}

- (TGTextGenerationSession)initWithConfiguration:(id)a3 textGeneration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)TGTextGenerationSession;
  uint64_t v8 = [(TGTextGenerationSession *)&v22 init];
  if (v8)
  {
    uint64_t v9 = +[TGTextGenerationSession workQueue];
    workQueue = v8->_workQueue;
    v8->_workQueue = (OS_dispatch_queue *)v9;

    uint64_t v11 = [v6 copy];
    configuration = v8->_configuration;
    v8->_configuration = (TGTextGenerationConfiguration *)v11;

    uint64_t v13 = [MEMORY[0x263F08C38] UUID];
    uuid = v8->_uuid;
    v8->_uuid = (NSUUID *)v13;

    objc_storeStrong((id *)&v8->_textGeneration, a4);
    uint64_t v15 = [MEMORY[0x263EFF9A0] dictionary];
    callbackByExecutionUUID = v8->_callbackByExecutionUUID;
    v8->_callbackByExecutionUUID = (NSMutableDictionary *)v15;

    uint64_t v17 = [MEMORY[0x263EFF9A0] dictionary];
    operationByExecutionUUID = v8->_operationByExecutionUUID;
    v8->_operationByExecutionUUID = (NSMutableDictionary *)v17;

    uint64_t v19 = [MEMORY[0x263EFF9A0] dictionary];
    outputStreamByExecutionUUID = v8->_outputStreamByExecutionUUID;
    v8->_outputStreamByExecutionUUID = (NSMutableDictionary *)v19;
  }
  return v8;
}

- (void)createTgdSessionSync
{
  v3 = [(TGTextGenerationSession *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(TGTextGenerationSession *)self tgdSession];

  if (!v4)
  {
    v5 = [(TGTextGenerationSession *)self textGeneration];
    id v6 = [(TGTextGenerationSession *)self uuid];
    id v7 = [(TGTextGenerationSession *)self configuration];
    uint64_t v8 = [v5 createSessionWithUUID:v6 configuration:v7];
    [(TGTextGenerationSession *)self setTgdSession:v8];

    id v9 = [(TGTextGenerationSession *)self tgdSession];
    [v9 setDelegate:self];
  }
}

- (id)executionUUIDForOperation:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(TGTextGenerationSession *)self workQueue];
  dispatch_assert_queue_V2(v5);

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [(TGTextGenerationSession *)self operationByExecutionUUID];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v12 = [(TGTextGenerationSession *)self operationByExecutionUUID];
        id v13 = [v12 objectForKeyedSubscript:v11];

        if (v13 == v4)
        {
          id v14 = v11;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  id v14 = 0;
LABEL_11:

  return v14;
}

- (id)enqueueOperationSync:(id)a3
{
  id v4 = a3;
  v5 = [(TGTextGenerationSession *)self workQueue];
  dispatch_assert_queue_V2(v5);

  [(TGTextGenerationSession *)self createTgdSessionSync];
  id v6 = [(TGTextGenerationSession *)self tgdSession];
  uint64_t v7 = [v6 enqueueOperation:v4];

  return v7;
}

- (void)executeOperation:(id)a3 callback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)[v6 copy];
  uint64_t v9 = [(TGTextGenerationSession *)self workQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __53__TGTextGenerationSession_executeOperation_callback___block_invoke;
  v13[3] = &unk_265533F80;
  v13[4] = self;
  id v14 = v6;
  id v15 = v8;
  id v16 = v7;
  id v10 = v8;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(v9, v13);
}

void __53__TGTextGenerationSession_executeOperation_callback___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) executionUUIDForOperation:*(void *)(a1 + 40)];
  if (v2)
  {
    v3 = _nlpDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __53__TGTextGenerationSession_executeOperation_callback___block_invoke_cold_1(v3);
    }

    id v4 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:17 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) enqueueOperationSync:*(void *)(a1 + 48)];
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = [*(id *)(a1 + 32) operationByExecutionUUID];
    [v6 setObject:v5 forKeyedSubscript:v4];

    id v7 = (void *)MEMORY[0x2611EC190](*(void *)(a1 + 56));
    uint64_t v8 = [*(id *)(a1 + 32) callbackByExecutionUUID];
    [v8 setObject:v7 forKeyedSubscript:v4];
  }
}

- (void)enqueueOperation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[v4 copy];
  id v6 = [(TGTextGenerationSession *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__TGTextGenerationSession_enqueueOperation___block_invoke;
  block[3] = &unk_265533FA8;
  block[4] = self;
  id v10 = v4;
  id v11 = v5;
  id v7 = v5;
  id v8 = v4;
  dispatch_async(v6, block);
}

void __44__TGTextGenerationSession_enqueueOperation___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) executionUUIDForOperation:*(void *)(a1 + 40)];
  if (v2)
  {
    v3 = _nlpDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __53__TGTextGenerationSession_executeOperation_callback___block_invoke_cold_1(v3);
    }
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) enqueueOperationSync:*(void *)(a1 + 48)];
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = [*(id *)(a1 + 32) operationByExecutionUUID];
    [v6 setObject:v5 forKeyedSubscript:v4];
  }
}

- (void)cancelOperation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TGTextGenerationSession *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__TGTextGenerationSession_cancelOperation___block_invoke;
  v7[3] = &unk_265533FD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __43__TGTextGenerationSession_cancelOperation___block_invoke(uint64_t a1)
{
  id v2 = (uint64_t *)(a1 + 40);
  v3 = [*(id *)(a1 + 32) executionUUIDForOperation:*(void *)(a1 + 40)];
  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) tgdSession];
    [v4 cancelOperationWithExecutionUUID:v3];
  }
  else
  {
    uint64_t v5 = _nlpDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __43__TGTextGenerationSession_cancelOperation___block_invoke_cold_1(v2, v5);
    }
  }
}

- (void)operation:(id)a3 didUpdateOutputStream:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(TGTextGenerationSession *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__TGTextGenerationSession_operation_didUpdateOutputStream___block_invoke;
  block[3] = &unk_265533FA8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __59__TGTextGenerationSession_operation_didUpdateOutputStream___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 session:*(void *)(a1 + 32) operation:*(void *)(a1 + 40) didUpdateOutputStream:*(void *)(a1 + 48)];
  }
}

- (void)didStartOperationWithExecutionUUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TGTextGenerationSession *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __62__TGTextGenerationSession_didStartOperationWithExecutionUUID___block_invoke;
  v7[3] = &unk_265533FD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __62__TGTextGenerationSession_didStartOperationWithExecutionUUID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) operationByExecutionUUID];
  id v7 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  char v3 = v7;
  if (v7)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    char v5 = objc_opt_respondsToSelector();

    char v3 = v7;
    if (v5)
    {
      id v6 = [*(id *)(a1 + 32) delegate];
      [v6 session:*(void *)(a1 + 32) didStartOperation:v7];

      char v3 = v7;
    }
  }
}

- (void)operationWithExecutionUUID:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(TGTextGenerationSession *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__TGTextGenerationSession_operationWithExecutionUUID_didFailWithError___block_invoke;
  block[3] = &unk_265533FA8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __71__TGTextGenerationSession_operationWithExecutionUUID_didFailWithError___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) callbackByExecutionUUID];
  id v13 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (v13)
  {
    (*((void (**)(id, void, void))v13 + 2))(v13, 0, *(void *)(a1 + 48));
    char v3 = [*(id *)(a1 + 32) callbackByExecutionUUID];
    [v3 setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
  }
  id v4 = [*(id *)(a1 + 32) operationByExecutionUUID];
  char v5 = [v4 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) operationByExecutionUUID];
    [v6 setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];

    id v7 = [*(id *)(a1 + 32) outputStreamByExecutionUUID];
    id v8 = [v7 objectForKeyedSubscript:*(void *)(a1 + 40)];

    if (v8)
    {
      id v9 = [*(id *)(a1 + 32) outputStreamByExecutionUUID];
      [v9 setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
    }
    id v10 = [*(id *)(a1 + 32) delegate];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      id v12 = [*(id *)(a1 + 32) delegate];
      [v12 session:*(void *)(a1 + 32) didFailOperation:v5 error:*(void *)(a1 + 48)];
    }
  }
}

- (void)operationWithExecutionUUID:(id)a3 didFinishWithOutputs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(TGTextGenerationSession *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75__TGTextGenerationSession_operationWithExecutionUUID_didFinishWithOutputs___block_invoke;
  block[3] = &unk_265533FA8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __75__TGTextGenerationSession_operationWithExecutionUUID_didFinishWithOutputs___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) callbackByExecutionUUID];
  id v13 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (v13)
  {
    (*((void (**)(id, void, void))v13 + 2))(v13, *(void *)(a1 + 48), 0);
    char v3 = [*(id *)(a1 + 32) callbackByExecutionUUID];
    [v3 setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
  }
  id v4 = [*(id *)(a1 + 32) operationByExecutionUUID];
  char v5 = [v4 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) operationByExecutionUUID];
    [v6 setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];

    id v7 = [*(id *)(a1 + 32) outputStreamByExecutionUUID];
    id v8 = [v7 objectForKeyedSubscript:*(void *)(a1 + 40)];

    if (v8)
    {
      id v9 = [*(id *)(a1 + 32) outputStreamByExecutionUUID];
      [v9 setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
    }
    id v10 = [*(id *)(a1 + 32) delegate];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      id v12 = [*(id *)(a1 + 32) delegate];
      [v12 session:*(void *)(a1 + 32) didFinishOperation:v5 outputs:*(void *)(a1 + 48)];
    }
  }
}

- (void)operationWithExecutionUUID:(id)a3 didStreamOutput:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(TGTextGenerationSession *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__TGTextGenerationSession_operationWithExecutionUUID_didStreamOutput___block_invoke;
  block[3] = &unk_265533FA8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __70__TGTextGenerationSession_operationWithExecutionUUID_didStreamOutput___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) operationByExecutionUUID];
  id v9 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (v9)
  {
    char v3 = [*(id *)(a1 + 32) outputStreamByExecutionUUID];
    id v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 40)];

    if (!v4)
    {
      id v4 = objc_alloc_init(TGTextGenerationOutputStream);
      char v5 = [*(id *)(a1 + 32) outputStreamByExecutionUUID];
      [v5 setObject:v4 forKeyedSubscript:*(void *)(a1 + 40)];
    }
    [(TGTextGenerationOutputStream *)v4 addOutput:*(void *)(a1 + 48)];
    id v6 = [*(id *)(a1 + 32) delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = [*(id *)(a1 + 32) delegate];
      [v8 session:*(void *)(a1 + 32) operation:v9 didUpdateOutputStream:v4];
    }
  }
}

- (TGTextGenerationSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TGTextGenerationSessionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (TGTextGenerationConfiguration)configuration
{
  return (TGTextGenerationConfiguration *)objc_getProperty(self, a2, 16, 1);
}

- (TGITextGenerationInference)textGeneration
{
  return (TGITextGenerationInference *)objc_getProperty(self, a2, 24, 1);
}

- (TGITextGenerationInferenceSession)tgdSession
{
  return (TGITextGenerationInferenceSession *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTgdSession:(id)a3
{
}

- (NSMutableDictionary)callbackByExecutionUUID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (NSMutableDictionary)operationByExecutionUUID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (NSMutableDictionary)outputStreamByExecutionUUID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 64, 1);
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 72, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_outputStreamByExecutionUUID, 0);
  objc_storeStrong((id *)&self->_operationByExecutionUUID, 0);
  objc_storeStrong((id *)&self->_callbackByExecutionUUID, 0);
  objc_storeStrong((id *)&self->_tgdSession, 0);
  objc_storeStrong((id *)&self->_textGeneration, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __53__TGTextGenerationSession_executeOperation_callback___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_25EB62000, log, OS_LOG_TYPE_ERROR, "Identical operation is already enqueued", v1, 2u);
}

void __43__TGTextGenerationSession_cancelOperation___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_25EB62000, a2, OS_LOG_TYPE_ERROR, "Cannot cancel operation since the operation was not enqueued: %@", (uint8_t *)&v3, 0xCu);
}

@end