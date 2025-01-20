@interface RERelevanceEngineLogger
- (RERelevanceEngineLogger)init;
- (void)addLoggable:(id)a3;
- (void)collectLogs:(id)a3 completion:(id)a4;
- (void)enumerateLoggables:(id)a3;
- (void)removeLoggable:(id)a3;
@end

@implementation RERelevanceEngineLogger

- (void)addLoggable:(id)a3
{
}

- (RERelevanceEngineLogger)init
{
  v8.receiver = self;
  v8.super_class = (Class)RERelevanceEngineLogger;
  v2 = [(RERelevanceEngineLogger *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    loggables = v2->_loggables;
    v2->_loggables = (REObserverStore *)v3;

    uint64_t v5 = RECreateSharedQueue(@"DiagnosticLogs");
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

- (void)enumerateLoggables:(id)a3
{
  id v4 = a3;
  loggables = self->_loggables;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__RERelevanceEngineLogger_enumerateLoggables___block_invoke;
  v7[3] = &unk_2644C0840;
  id v8 = v4;
  id v6 = v4;
  [(REObserverStore *)loggables enumerateObserversWithBlock:v7];
}

uint64_t __46__RERelevanceEngineLogger_enumerateLoggables___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)collectLogs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x263EFF980] array];
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __50__RERelevanceEngineLogger_collectLogs_completion___block_invoke;
  v32[3] = &unk_2644BCC60;
  id v9 = v8;
  id v33 = v9;
  [(RERelevanceEngineLogger *)self enumerateLoggables:v32];
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__30;
  v30 = __Block_byref_object_dispose__30;
  id v31 = 0;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __50__RERelevanceEngineLogger_collectLogs_completion___block_invoke_23;
  v20[3] = &unk_2644C0890;
  id v24 = v6;
  v25 = &v26;
  v22 = self;
  id v23 = v7;
  id v21 = v9;
  id v10 = v6;
  id v11 = v7;
  id v12 = v9;
  v13 = (void *)MEMORY[0x223C31700](v20);
  uint64_t v14 = MEMORY[0x223C31700]();
  v15 = (void *)v27[5];
  v27[5] = v14;

  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__RERelevanceEngineLogger_collectLogs_completion___block_invoke_5;
  block[3] = &unk_2644BCBC0;
  id v19 = v13;
  id v17 = v13;
  dispatch_async(queue, block);

  _Block_object_dispose(&v26, 8);
}

uint64_t __50__RERelevanceEngineLogger_collectLogs_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void __50__RERelevanceEngineLogger_collectLogs_completion___block_invoke_23(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count])
  {
    v2 = [*(id *)(a1 + 32) lastObject];
    [*(id *)(a1 + 32) removeLastObject];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __50__RERelevanceEngineLogger_collectLogs_completion___block_invoke_2;
    v11[3] = &unk_2644C0868;
    id v3 = v2;
    id v12 = v3;
    id v4 = *(id *)(a1 + 56);
    uint64_t v5 = *(void *)(a1 + 64);
    id v13 = v4;
    uint64_t v14 = v5;
    id v6 = (void (**)(void, void))MEMORY[0x223C31700](v11);
    if (objc_opt_respondsToSelector())
    {
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __50__RERelevanceEngineLogger_collectLogs_completion___block_invoke_3;
      v9[3] = &unk_2644BC948;
      v9[4] = *(void *)(a1 + 40);
      id v10 = v6;
      [v3 collectLoggableState:v9];
    }
    else
    {
      v6[2](v6, 0);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = 0;
  }
}

void __50__RERelevanceEngineLogger_collectLogs_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = [MEMORY[0x263F089D8] string];
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  id v6 = RELogHeader(v5);
  [v3 appendString:v6];

  [v3 appendString:@"\n\n"];
  uint64_t v7 = REVerboseDescriptionForExportedObject(*(void **)(a1 + 32));
  [v3 appendString:v7];

  if ([v8 length])
  {
    [v3 appendString:@"\n"];
    [v3 appendString:v8];
  }
  [v3 appendString:@"\n\n"];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) + 16))();
}

void __50__RERelevanceEngineLogger_collectLogs_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__RERelevanceEngineLogger_collectLogs_completion___block_invoke_4;
  v7[3] = &unk_2644BCCD0;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __50__RERelevanceEngineLogger_collectLogs_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __50__RERelevanceEngineLogger_collectLogs_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeLoggable:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_loggables, 0);
}

@end