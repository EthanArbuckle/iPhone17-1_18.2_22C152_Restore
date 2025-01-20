@interface RETrainingSimulationClient
- (BOOL)relevanceEngine:(id)a3 performCommand:(id)a4 withOptions:(id)a5;
- (BOOL)relevanceEngine:(id)a3 runActionOfElementWithDescription1:(id)a4;
- (NSString)targetProcessName;
- (RETrainingSimulationClient)initWithConnection:(id)a3 delegate:(id)a4;
- (RETrainingSimulationClient)initWithServiceName:(id)a3 delegate:(id)a4;
- (RETrainingSimulationClient)initWithTargetProcessName:(id)a3 delegate:(id)a4;
- (RETrainingSimulationClientDelegate)delegate;
- (id)availableRelevanceEngines;
- (id)diagnosticLogFileForRelevanceEngine:(id)a3;
- (id)fetchAllElementIdentifiersInRelevanceEngine:(id)a3;
- (id)fetchAllElementsInRelevanceEngine:(id)a3;
- (id)relevanceEngine:(id)a3 encodedObjectAtPath:(id)a4;
- (void)_handleInterruption;
- (void)_handleInvalidation;
- (void)availableRelevanceEngines;
- (void)availableRelevanceEnginesDidChange;
- (void)dealloc;
- (void)relevanceEngine:(id)a3 createElementFromDescription:(id)a4;
@end

@implementation RETrainingSimulationClient

- (RETrainingSimulationClient)initWithServiceName:(id)a3 delegate:(id)a4
{
  v6 = (objc_class *)MEMORY[0x263F08D68];
  id v7 = a4;
  id v8 = a3;
  v9 = (void *)[[v6 alloc] initWithServiceName:v8];

  v10 = [(RETrainingSimulationClient *)self initWithConnection:v9 delegate:v7];
  return v10;
}

- (RETrainingSimulationClient)initWithTargetProcessName:(id)a3 delegate:(id)a4
{
  id v7 = (__CFString *)a3;
  id v8 = a4;
  v9 = RETrainingSimulationMachServiceForProcessName(v7);
  v10 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:v9 options:0];
  v11 = [(RETrainingSimulationClient *)self initWithConnection:v10 delegate:v8];

  if (v11) {
    objc_storeStrong((id *)&v11->_targetProcessName, a3);
  }

  return v11;
}

- (RETrainingSimulationClient)initWithConnection:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v25.receiver = self;
  v25.super_class = (Class)RETrainingSimulationClient;
  v9 = [(RETrainingSimulationClient *)&v25 init];
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_delegate, v8);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.RelevanceEngine.TrainingSimulationClient", 0);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v11;

    objc_storeStrong((id *)&v10->_connection, a3);
    connection = v10->_connection;
    v14 = RETrainingSimulationServerInterface();
    [(NSXPCConnection *)connection setRemoteObjectInterface:v14];

    v15 = v10->_connection;
    v16 = RETrainingSimulationClientInterface();
    [(NSXPCConnection *)v15 setExportedInterface:v16];

    [(NSXPCConnection *)v10->_connection setExportedObject:v10];
    objc_initWeak(&location, v10);
    v17 = v10->_connection;
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __58__RETrainingSimulationClient_initWithConnection_delegate___block_invoke;
    v22[3] = &unk_2644BC638;
    objc_copyWeak(&v23, &location);
    [(NSXPCConnection *)v17 setInterruptionHandler:v22];
    v18 = v10->_connection;
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __58__RETrainingSimulationClient_initWithConnection_delegate___block_invoke_2;
    v20[3] = &unk_2644BC638;
    objc_copyWeak(&v21, &location);
    [(NSXPCConnection *)v18 setInvalidationHandler:v20];
    [(NSXPCConnection *)v10->_connection resume];
    objc_destroyWeak(&v21);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return v10;
}

void __58__RETrainingSimulationClient_initWithConnection_delegate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleInterruption];
}

void __58__RETrainingSimulationClient_initWithConnection_delegate___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleInvalidation];
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)RETrainingSimulationClient;
  [(RETrainingSimulationClient *)&v3 dealloc];
}

- (void)_handleInterruption
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__RETrainingSimulationClient__handleInterruption__block_invoke;
  block[3] = &unk_2644BC660;
  block[4] = self;
  dispatch_async(queue, block);
}

void __49__RETrainingSimulationClient__handleInterruption__block_invoke(uint64_t a1)
{
  v2 = RELogForDomain(10);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __49__RETrainingSimulationClient__handleInterruption__block_invoke_cold_1();
  }

  objc_super v3 = [*(id *)(a1 + 32) delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v5 = [*(id *)(a1 + 32) delegate];
    [v5 trainingSimulationClientWasInterrupted:*(void *)(a1 + 32)];
  }
}

- (void)_handleInvalidation
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__RETrainingSimulationClient__handleInvalidation__block_invoke;
  block[3] = &unk_2644BC660;
  block[4] = self;
  dispatch_async(queue, block);
}

void __49__RETrainingSimulationClient__handleInvalidation__block_invoke(uint64_t a1)
{
  v2 = RELogForDomain(10);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __49__RETrainingSimulationClient__handleInvalidation__block_invoke_cold_1();
  }

  [*(id *)(*(void *)(a1 + 32) + 16) setExportedObject:0];
  uint64_t v3 = *(void *)(a1 + 32);
  char v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = 0;

  v5 = [*(id *)(a1 + 32) delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [*(id *)(a1 + 32) delegate];
    [v7 trainingSimulationClientWasInvalidated:*(void *)(a1 + 32)];
  }
}

- (void)relevanceEngine:(id)a3 createElementFromDescription:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__23;
  v17 = __Block_byref_object_dispose__23;
  id v18 = 0;
  connection = self->_connection;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __75__RETrainingSimulationClient_relevanceEngine_createElementFromDescription___block_invoke;
  v12[3] = &unk_2644BFA38;
  v12[4] = &v13;
  v9 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v12];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __75__RETrainingSimulationClient_relevanceEngine_createElementFromDescription___block_invoke_2;
  v11[3] = &unk_2644BFA38;
  v11[4] = &v13;
  [v9 relevanceEngine:v6 createElementFromDescription:v7 completion:v11];
  if (v14[5])
  {
    v10 = RELogForDomain(10);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[RETrainingSimulationClient relevanceEngine:createElementFromDescription:]();
    }
  }
  _Block_object_dispose(&v13, 8);
}

void __75__RETrainingSimulationClient_relevanceEngine_createElementFromDescription___block_invoke(uint64_t a1, void *a2)
{
}

void __75__RETrainingSimulationClient_relevanceEngine_createElementFromDescription___block_invoke_2(uint64_t a1, void *a2)
{
}

- (BOOL)relevanceEngine:(id)a3 performCommand:(id)a4 withOptions:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v18 = 0;
  v19[0] = &v18;
  v19[1] = 0x3032000000;
  v19[2] = __Block_byref_object_copy__23;
  v19[3] = __Block_byref_object_dispose__23;
  id v20 = 0;
  connection = self->_connection;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __73__RETrainingSimulationClient_relevanceEngine_performCommand_withOptions___block_invoke;
  v17[3] = &unk_2644BFA38;
  v17[4] = &v18;
  v12 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v17];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __73__RETrainingSimulationClient_relevanceEngine_performCommand_withOptions___block_invoke_2;
  v16[3] = &unk_2644BFA38;
  v16[4] = &v18;
  [v12 relevanceEngine:v8 performCommand:v9 withOptions:v10 completion:v16];
  if (*(void *)(v19[0] + 40))
  {
    uint64_t v13 = RELogForDomain(10);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[RETrainingSimulationClient relevanceEngine:performCommand:withOptions:]((uint64_t)v9, (uint64_t)v19, v13);
    }

    BOOL v14 = *(void *)(v19[0] + 40) == 0;
  }
  else
  {
    BOOL v14 = 1;
  }

  _Block_object_dispose(&v18, 8);
  return v14;
}

void __73__RETrainingSimulationClient_relevanceEngine_performCommand_withOptions___block_invoke(uint64_t a1, void *a2)
{
}

void __73__RETrainingSimulationClient_relevanceEngine_performCommand_withOptions___block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)availableRelevanceEngines
{
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__23;
  v19 = __Block_byref_object_dispose__23;
  id v20 = 0;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__23;
  uint64_t v13 = __Block_byref_object_dispose__23;
  id v14 = 0;
  connection = self->_connection;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __55__RETrainingSimulationClient_availableRelevanceEngines__block_invoke;
  v8[3] = &unk_2644BFA38;
  v8[4] = &v9;
  uint64_t v3 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v8];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__RETrainingSimulationClient_availableRelevanceEngines__block_invoke_2;
  v7[3] = &unk_2644BFA60;
  v7[4] = &v15;
  v7[5] = &v9;
  [v3 availableRelevanceEngines:v7];
  if (v10[5])
  {
    char v4 = RELogForDomain(10);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[RETrainingSimulationClient availableRelevanceEngines]();
    }
  }
  id v5 = (id)v16[5];

  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v15, 8);

  return v5;
}

void __55__RETrainingSimulationClient_availableRelevanceEngines__block_invoke(uint64_t a1, void *a2)
{
}

void __55__RETrainingSimulationClient_availableRelevanceEngines__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (BOOL)relevanceEngine:(id)a3 runActionOfElementWithDescription1:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__23;
  v19 = __Block_byref_object_dispose__23;
  id v20 = 0;
  connection = self->_connection;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __81__RETrainingSimulationClient_relevanceEngine_runActionOfElementWithDescription1___block_invoke;
  v14[3] = &unk_2644BFA38;
  v14[4] = &v15;
  uint64_t v9 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v14];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __81__RETrainingSimulationClient_relevanceEngine_runActionOfElementWithDescription1___block_invoke_2;
  v13[3] = &unk_2644BFA88;
  v13[4] = &v21;
  v13[5] = &v15;
  [v9 relevanceEngine:v6 runActionOfElementWithDescription1:v7 completion:v13];
  if (v16[5])
  {
    id v10 = RELogForDomain(10);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[RETrainingSimulationClient availableRelevanceEngines]();
    }
  }
  char v11 = *((unsigned char *)v22 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v11;
}

void __81__RETrainingSimulationClient_relevanceEngine_runActionOfElementWithDescription1___block_invoke(uint64_t a1, void *a2)
{
}

void __81__RETrainingSimulationClient_relevanceEngine_runActionOfElementWithDescription1___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (id)fetchAllElementIdentifiersInRelevanceEngine:(id)a3
{
  id v4 = a3;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__23;
  v22 = __Block_byref_object_dispose__23;
  id v23 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__23;
  v16 = __Block_byref_object_dispose__23;
  id v17 = 0;
  connection = self->_connection;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __74__RETrainingSimulationClient_fetchAllElementIdentifiersInRelevanceEngine___block_invoke;
  v11[3] = &unk_2644BFA38;
  v11[4] = &v12;
  id v6 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __74__RETrainingSimulationClient_fetchAllElementIdentifiersInRelevanceEngine___block_invoke_2;
  v10[3] = &unk_2644BFA60;
  v10[4] = &v18;
  v10[5] = &v12;
  [v6 fetchAllElementIdentifiersInRelevanceEngine:v4 completion:v10];
  if (v13[5])
  {
    id v7 = RELogForDomain(10);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[RETrainingSimulationClient availableRelevanceEngines]();
    }
  }
  id v8 = (id)v19[5];

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);

  return v8;
}

void __74__RETrainingSimulationClient_fetchAllElementIdentifiersInRelevanceEngine___block_invoke(uint64_t a1, void *a2)
{
}

void __74__RETrainingSimulationClient_fetchAllElementIdentifiersInRelevanceEngine___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)fetchAllElementsInRelevanceEngine:(id)a3
{
  id v4 = a3;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__23;
  v22 = __Block_byref_object_dispose__23;
  id v23 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__23;
  v16 = __Block_byref_object_dispose__23;
  id v17 = 0;
  connection = self->_connection;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __64__RETrainingSimulationClient_fetchAllElementsInRelevanceEngine___block_invoke;
  v11[3] = &unk_2644BFA38;
  v11[4] = &v12;
  id v6 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __64__RETrainingSimulationClient_fetchAllElementsInRelevanceEngine___block_invoke_2;
  v10[3] = &unk_2644BFA60;
  v10[4] = &v18;
  v10[5] = &v12;
  [v6 fetchAllElementsInRelevanceEngine:v4 completion:v10];
  if (v13[5])
  {
    uint64_t v7 = RELogForDomain(10);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[RETrainingSimulationClient availableRelevanceEngines]();
    }
  }
  id v8 = (id)v19[5];

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);

  return v8;
}

void __64__RETrainingSimulationClient_fetchAllElementsInRelevanceEngine___block_invoke(uint64_t a1, void *a2)
{
}

void __64__RETrainingSimulationClient_fetchAllElementsInRelevanceEngine___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)diagnosticLogFileForRelevanceEngine:(id)a3
{
  id v4 = a3;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__23;
  v22 = __Block_byref_object_dispose__23;
  id v23 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__23;
  v16 = __Block_byref_object_dispose__23;
  id v17 = 0;
  connection = self->_connection;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __66__RETrainingSimulationClient_diagnosticLogFileForRelevanceEngine___block_invoke;
  v11[3] = &unk_2644BFA38;
  v11[4] = &v12;
  id v6 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v11];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __66__RETrainingSimulationClient_diagnosticLogFileForRelevanceEngine___block_invoke_2;
  v10[3] = &unk_2644BFAB0;
  v10[4] = &v18;
  v10[5] = &v12;
  [v6 gatherDiagnosticLogsForRelevanceEngine:v4 completion:v10];
  if (v13[5])
  {
    uint64_t v7 = RELogForDomain(10);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[RETrainingSimulationClient availableRelevanceEngines]();
    }
  }
  id v8 = (id)v19[5];

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);

  return v8;
}

void __66__RETrainingSimulationClient_diagnosticLogFileForRelevanceEngine___block_invoke(uint64_t a1, void *a2)
{
}

void __66__RETrainingSimulationClient_diagnosticLogFileForRelevanceEngine___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    id obj = *(id *)(v7 + 40);
    uint64_t v8 = [NSURL URLByResolvingBookmarkData:a2 options:0 relativeToURL:0 bookmarkDataIsStale:0 error:&obj];
    objc_storeStrong((id *)(v7 + 40), obj);
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
}

- (id)relevanceEngine:(id)a3 encodedObjectAtPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  char v24 = __Block_byref_object_copy__23;
  objc_super v25 = __Block_byref_object_dispose__23;
  id v26 = 0;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__23;
  v19 = __Block_byref_object_dispose__23;
  id v20 = 0;
  connection = self->_connection;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __66__RETrainingSimulationClient_relevanceEngine_encodedObjectAtPath___block_invoke;
  v14[3] = &unk_2644BFA38;
  v14[4] = &v15;
  uint64_t v9 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v14];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __66__RETrainingSimulationClient_relevanceEngine_encodedObjectAtPath___block_invoke_2;
  v13[3] = &unk_2644BFAD8;
  v13[4] = &v21;
  [v9 relevanceEngine:v6 encodedObjectAtPath:v7 completion:v13];
  if (v16[5])
  {
    id v10 = RELogForDomain(10);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[RETrainingSimulationClient availableRelevanceEngines]();
    }
  }
  id v11 = (id)v22[5];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v11;
}

void __66__RETrainingSimulationClient_relevanceEngine_encodedObjectAtPath___block_invoke(uint64_t a1, void *a2)
{
}

void __66__RETrainingSimulationClient_relevanceEngine_encodedObjectAtPath___block_invoke_2(uint64_t a1, void *a2)
{
}

- (void)availableRelevanceEnginesDidChange
{
  uint64_t v3 = [(RETrainingSimulationClient *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(RETrainingSimulationClient *)self delegate];
    [v5 availableRelevanceEnginesDidChangeForTrainingSimulationClient:self];
  }
}

- (NSString)targetProcessName
{
  return self->_targetProcessName;
}

- (RETrainingSimulationClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (RETrainingSimulationClientDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_targetProcessName, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __49__RETrainingSimulationClient__handleInterruption__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_21E6E6000, v0, v1, "Training Simulation connection (%@) was interrupted", v2, v3, v4, v5, v6);
}

void __49__RETrainingSimulationClient__handleInvalidation__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_21E6E6000, v0, v1, "Training Simulation connection (%@) was invalidated", v2, v3, v4, v5, v6);
}

- (void)relevanceEngine:createElementFromDescription:.cold.1()
{
  OUTLINED_FUNCTION_1_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_21E6E6000, v0, v1, "Unable to create element: %@", v2, v3, v4, v5, v6);
}

- (void)relevanceEngine:(uint64_t)a1 performCommand:(uint64_t)a2 withOptions:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(*(void *)a2 + 40);
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_21E6E6000, log, OS_LOG_TYPE_ERROR, "Unable to perform command %@: %@", (uint8_t *)&v4, 0x16u);
}

- (void)availableRelevanceEngines
{
  OUTLINED_FUNCTION_1_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_21E6E6000, v0, v1, "Unable to access engines: %@", v2, v3, v4, v5, v6);
}

@end