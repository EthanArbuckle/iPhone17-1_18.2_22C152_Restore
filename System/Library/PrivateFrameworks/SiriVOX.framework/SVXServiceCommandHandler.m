@interface SVXServiceCommandHandler
- (BOOL)isCommandUUFR:(id)a3;
- (SVXServiceCommandHandler)initWithModule:(id)a3;
- (SVXServiceCommandHandler)initWithModule:(id)a3 fallbackHandler:(id)a4 commandHandlerRegistryFactory:(id)a5 delayedActionStoreFactory:(id)a6;
- (id)fallbackModeProvider;
- (void)_handleCommand:(id)a3 taskTracker:(id)a4 completion:(id)a5;
- (void)_reset;
- (void)handleCommand:(id)a3 taskTracker:(id)a4 completion:(id)a5;
- (void)handleResult:(id)a3 forCommand:(id)a4 completion:(id)a5;
- (void)reset;
- (void)startWithModuleInstanceProvider:(id)a3 platformDependencies:(id)a4;
- (void)stopWithModuleInstanceProvider:(id)a3;
@end

@implementation SVXServiceCommandHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackModeProvider, 0);
  objc_storeStrong((id *)&self->_transactions, 0);
  objc_storeStrong((id *)&self->_delayedActionStore, 0);
  objc_storeStrong((id *)&self->_handlerRegistry, 0);
  objc_storeStrong((id *)&self->_delayedActionStoreFactory, 0);
  objc_storeStrong((id *)&self->_commandHandlerRegistryFactory, 0);
  objc_storeStrong((id *)&self->_fallbackHandler, 0);

  objc_storeStrong((id *)&self->_module, 0);
}

- (void)handleResult:(id)a3 forCommand:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  v42[2] = __63__SVXServiceCommandHandler_handleResult_forCommand_completion___block_invoke;
  v42[3] = &unk_2645547D8;
  id v11 = v10;
  id v44 = v11;
  id v12 = v9;
  id v43 = v12;
  v13 = (void *)MEMORY[0x223C65C40](v42);
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __63__SVXServiceCommandHandler_handleResult_forCommand_completion___block_invoke_2;
  v39[3] = &unk_2645547D8;
  id v14 = v11;
  id v41 = v14;
  id v15 = v12;
  id v40 = v15;
  v16 = (void *)MEMORY[0x223C65C40](v39);
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __63__SVXServiceCommandHandler_handleResult_forCommand_completion___block_invoke_3;
  v36[3] = &unk_264552020;
  id v17 = v14;
  id v37 = v15;
  id v38 = v17;
  id v18 = v15;
  v19 = (void *)MEMORY[0x223C65C40](v36);
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __63__SVXServiceCommandHandler_handleResult_forCommand_completion___block_invoke_4;
  v34[3] = &unk_264552048;
  id v35 = v17;
  id v20 = v17;
  v21 = (void *)MEMORY[0x223C65C40](v34);
  v22 = [(SVXModule *)self->_module performer];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __63__SVXServiceCommandHandler_handleResult_forCommand_completion___block_invoke_5;
  v28[3] = &unk_264552070;
  id v29 = v8;
  id v30 = v13;
  id v31 = v16;
  id v32 = v19;
  id v33 = v21;
  id v23 = v21;
  id v24 = v19;
  id v25 = v16;
  id v26 = v13;
  id v27 = v8;
  [v22 performBlock:v28];
}

void __63__SVXServiceCommandHandler_handleResult_forCommand_completion___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 40))
  {
    id v3 = objc_alloc_init(MEMORY[0x263F64828]);
    v2 = [*(id *)(a1 + 32) aceId];
    [v3 setRefId:v2];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __63__SVXServiceCommandHandler_handleResult_forCommand_completion___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 40))
  {
    id v3 = objc_alloc_init(MEMORY[0x263F64830]);
    v2 = [*(id *)(a1 + 32) aceId];
    [v3 setRefId:v2];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __63__SVXServiceCommandHandler_handleResult_forCommand_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  if (*(void *)(a1 + 40))
  {
    v5 = (objc_class *)MEMORY[0x263F64820];
    id v6 = a3;
    id v8 = objc_alloc_init(v5);
    [v8 setErrorCode:a2];
    [v8 setReason:v6];

    v7 = [*(id *)(a1 + 32) aceId];
    [v8 setRefId:v7];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __63__SVXServiceCommandHandler_handleResult_forCommand_completion___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __63__SVXServiceCommandHandler_handleResult_forCommand_completion___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleResultUsingIgnoredBlock:*(void *)(a1 + 40) successBlock:*(void *)(a1 + 48) failureBlock:*(void *)(a1 + 56) commandBlock:*(void *)(a1 + 64)];
}

- (void)_handleCommand:(id)a3 taskTracker:(id)a4 completion:(id)a5
{
  v27[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(SVXServiceCommandHandlerRegistry *)self->_handlerRegistry handlersForCommand:v8];
  if (![v11 count])
  {
    v27[0] = self->_fallbackHandler;
    uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:1];

    id v11 = (void *)v12;
  }
  objc_initWeak(&location, self);
  v13 = [SVXServiceCommandTransaction alloc];
  id v14 = [(SVXModule *)self->_module performer];
  id v15 = (void *)[(NSMutableSet *)self->_transactions copy];
  uint64_t v19 = MEMORY[0x263EF8330];
  uint64_t v20 = 3221225472;
  v21 = __66__SVXServiceCommandHandler__handleCommand_taskTracker_completion___block_invoke;
  v22 = &unk_264551FF8;
  objc_copyWeak(&v25, &location);
  id v16 = v8;
  id v23 = v16;
  id v17 = v10;
  id v24 = v17;
  id v18 = [(SVXServiceCommandTransaction *)v13 initWithPerformer:v14 command:v16 handlers:v11 taskTracker:v9 dependencies:v15 completion:&v19];

  -[NSMutableSet addObject:](self->_transactions, "addObject:", v18, v19, v20, v21, v22);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

void __66__SVXServiceCommandHandler__handleCommand_taskTracker_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 48);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained handleResult:v4 forCommand:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (void)_reset
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = (os_log_t *)MEMORY[0x263F28348];
  id v4 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    transactions = self->_transactions;
    id v6 = v4;
    *(_DWORD *)buf = 136315394;
    v22 = "-[SVXServiceCommandHandler _reset]";
    __int16 v23 = 2048;
    uint64_t v24 = [(NSMutableSet *)transactions count];
    _os_log_impl(&dword_220062000, v6, OS_LOG_TYPE_INFO, "%s Invalidating %tu transactions...", buf, 0x16u);
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v7 = self->_transactions;
  uint64_t v8 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v11++), "invalidate", (void)v16);
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  os_log_t v12 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_INFO))
  {
    v13 = self->_transactions;
    id v14 = v12;
    uint64_t v15 = [(NSMutableSet *)v13 count];
    *(_DWORD *)buf = 136315394;
    v22 = "-[SVXServiceCommandHandler _reset]";
    __int16 v23 = 2048;
    uint64_t v24 = v15;
    _os_log_impl(&dword_220062000, v14, OS_LOG_TYPE_INFO, "%s Removing %tu transactions...", buf, 0x16u);
  }
  [(NSMutableSet *)self->_transactions removeAllObjects];
  [(SVXServiceCommandDelayedActionStore *)self->_delayedActionStore removeAllActions];
}

- (void)stopWithModuleInstanceProvider:(id)a3
{
  id v4 = [(SVXModule *)self->_module performer];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __59__SVXServiceCommandHandler_stopWithModuleInstanceProvider___block_invoke;
  v5[3] = &unk_2645548A0;
  v5[4] = self;
  [v4 performBlock:v5];
}

void __59__SVXServiceCommandHandler_stopWithModuleInstanceProvider___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _reset];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 56);
  *(void *)(v4 + 56) = 0;

  uint64_t v6 = *(void *)(a1 + 32);
  v7 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = 0;
}

- (void)startWithModuleInstanceProvider:(id)a3 platformDependencies:(id)a4
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SVXServiceCommandDelayedActionStoreProvider *)self->_delayedActionStoreFactory create];
  delayedActionStore = self->_delayedActionStore;
  self->_delayedActionStore = v8;

  uint64_t v10 = [v6 sessionManager];
  v66 = v6;
  uint64_t v11 = [v6 speechSynthesizer];
  v65 = v7;
  v67 = (void *)v11;
  v68 = (void *)v10;
  if (![v7 count])
  {
    id v12 = 0;
    goto LABEL_23;
  }
  id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id v13 = v7;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v71 objects:v79 count:16];
  if (!v14)
  {

    goto LABEL_23;
  }
  uint64_t v15 = v14;
  long long v16 = 0;
  uint64_t v17 = *(void *)v72;
  long long v18 = (os_log_t *)MEMORY[0x263F28340];
  do
  {
    for (uint64_t i = 0; i != v15; ++i)
    {
      if (*(void *)v72 != v17) {
        objc_enumerationMutation(v13);
      }
      uint64_t v20 = *(void **)(*((void *)&v71 + 1) + 8 * i);
      if ([v20 type] == 1)
      {
        v21 = [v20 serviceCommandHandler];
        if (v21) {
          [v12 addObject:v21];
        }
      }
      else
      {
        if ([v20 type] != 4) {
          continue;
        }
        if (v16)
        {
          v22 = *v18;
          if (os_log_type_enabled(*v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            v78 = "-[SVXServiceCommandHandler startWithModuleInstanceProvider:platformDependencies:]";
            _os_log_error_impl(&dword_220062000, v22, OS_LOG_TYPE_ERROR, "%s More than one platform dependency of type SVXPlatformDependencyTypeSiriModesManager has been provided. Will pick the last one in the array.", buf, 0xCu);
          }
        }
        [v20 siriModesManager];
        long long v16 = v21 = v16;
      }
    }
    uint64_t v15 = [v13 countByEnumeratingWithState:&v71 objects:v79 count:16];
  }
  while (v15);

  if (v16)
  {
    __int16 v23 = [v16 modeProvider];
    uint64_t v11 = (uint64_t)v67;
    goto LABEL_24;
  }
  uint64_t v11 = (uint64_t)v67;
LABEL_23:
  __int16 v23 = self->_fallbackModeProvider;
  long long v16 = 0;
LABEL_24:
  uint64_t v24 = objc_alloc_init(SVXInstrumentationUtilities);
  uint64_t v25 = [[SVXDialogTransformer alloc] initWithModeProvider:v23];
  id v26 = objc_alloc_init(SVXSpeechSynthesisResultConverter);
  v69 = v24;
  v64 = v23;
  id v27 = [[SVXServiceCommandHandlerUIAddViews alloc] initWithSpeechSynthesizer:v11 module:self->_module instrumentationUtils:v24 modeProvider:v23 dialogTransformer:v25 synthesisResultConverter:v26];
  v28 = objc_alloc_init(SVXSpeechSynthesisUtils);
  id v29 = [[SVXServiceCommandHandlerUISayIt alloc] initWithSpeechSynthesizer:v11 module:self->_module instrumentationUtils:v24 synthesisResultConverter:v26 speechSynthesisUtils:v28];
  v76[0] = v27;
  v76[1] = v29;
  [MEMORY[0x263EFF8C0] arrayWithObjects:v76 count:2];
  v31 = uint64_t v30 = v11;
  v60 = v28;
  v57 = [[SVXServiceCommandHandlerPreSynthesizeTTS alloc] initWithSpeechSynthesizer:v30 speechSynthesisUtils:v28];
  v75[0] = v57;
  v58 = (void *)v31;
  v63 = v25;
  v56 = [[SVXServiceCommandHandlerUIAddDialogs alloc] initWithHandlers:v31 dialogTransformer:v25];
  v75[1] = v56;
  v75[2] = v27;
  v61 = v27;
  v55 = [[SVXServiceCommandHandlerUICloseAssistant alloc] initWithSessionManager:v68];
  v75[3] = v55;
  id v32 = [SVXServiceCommandHandlerUIDelayedActionCancelCommand alloc];
  id v33 = self->_delayedActionStore;
  v54 = [(SVXModule *)self->_module performer];
  v53 = [(SVXServiceCommandHandlerUIDelayedActionCancelCommand *)v32 initWithDelayedActionStore:v33 performer:v54];
  v75[4] = v53;
  v34 = [SVXServiceCommandHandlerUIDelayedActionCommand alloc];
  id v35 = self->_delayedActionStore;
  v52 = [(SVXModule *)self->_module performer];
  v51 = [(SVXServiceCommandHandlerUIDelayedActionCommand *)v34 initWithDelayedActionStore:v35 sessionManager:v68 performer:v52];
  v75[5] = v51;
  v36 = [SVXServiceCommandHandlerUIRepeatIt alloc];
  v50 = [(SVXModule *)self->_module performer];
  v62 = v26;
  id v37 = [(SVXServiceCommandHandlerUIRepeatIt *)v36 initWithSpeechSynthesizer:v30 performer:v50 instrumentationUtils:v69 synthesisResultConverter:v26];
  v75[6] = v37;
  v75[7] = v29;
  v59 = v29;
  id v38 = [SVXServiceCommandHandlerUIShowRequestHandlingStatus alloc];
  v39 = [(SVXModule *)self->_module performer];
  id v40 = [(SVXServiceCommandHandlerUIShowRequestHandlingStatus *)v38 initWithSessionManager:v68 performer:v39];
  v75[8] = v40;
  id v41 = [[SVXServiceCommandHandlerClientCoordinationPhoneCall alloc] initWithSessionManager:v68];
  v75[9] = v41;
  v42 = [[_SVXServiceCommandHandlerSmsPlayAudio alloc] initWithSessionManager:v68 module:self->_module];
  v75[10] = v42;
  id v43 = [[_SVXServiceCommandHandlerPlayVoiceMail alloc] initWithSessionManager:v68 module:self->_module];
  v75[11] = v43;
  id v44 = [MEMORY[0x263EFF8C0] arrayWithObjects:v75 count:12];

  if ([v12 count])
  {
    id v45 = [v44 arrayByAddingObjectsFromArray:v12];
  }
  else
  {
    id v45 = v44;
  }
  v46 = v45;
  v47 = [(SVXServiceCommandHandlerRegistryProvider *)self->_commandHandlerRegistryFactory createWithHandlers:v45];
  handlerRegistry = self->_handlerRegistry;
  self->_handlerRegistry = v47;

  v49 = [(SVXModule *)self->_module performer];
  v70[0] = MEMORY[0x263EF8330];
  v70[1] = 3221225472;
  v70[2] = __81__SVXServiceCommandHandler_startWithModuleInstanceProvider_platformDependencies___block_invoke;
  v70[3] = &unk_2645548A0;
  v70[4] = self;
  [v49 performBlock:v70];
}

uint64_t __81__SVXServiceCommandHandler_startWithModuleInstanceProvider_platformDependencies___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 56) = objc_alloc_init(MEMORY[0x263EFF9C0]);

  return MEMORY[0x270F9A758]();
}

- (id)fallbackModeProvider
{
  fallbackModeProvider = self->_fallbackModeProvider;
  if (!fallbackModeProvider)
  {
    uint64_t v4 = (MDFixedModeProvider *)[objc_alloc(MEMORY[0x263F713F8]) initWithFixedMode:1];
    v5 = self->_fallbackModeProvider;
    self->_fallbackModeProvider = v4;

    fallbackModeProvider = self->_fallbackModeProvider;
  }

  return fallbackModeProvider;
}

- (SVXServiceCommandHandler)initWithModule:(id)a3 fallbackHandler:(id)a4 commandHandlerRegistryFactory:(id)a5 delayedActionStoreFactory:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SVXServiceCommandHandler;
  uint64_t v15 = [(SVXServiceCommandHandler *)&v18 init];
  long long v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_module, a3);
    objc_storeStrong((id *)&v16->_fallbackHandler, a4);
    objc_storeStrong((id *)&v16->_commandHandlerRegistryFactory, a5);
    objc_storeStrong((id *)&v16->_delayedActionStoreFactory, a6);
  }

  return v16;
}

- (SVXServiceCommandHandler)initWithModule:(id)a3
{
  id v4 = a3;
  v5 = [SVXServiceCommandHandlerFallback alloc];
  id v6 = +[SVXServiceCommandResult resultIgnored];
  id v7 = [(SVXServiceCommandHandlerFallback *)v5 initWithResult:v6];
  uint64_t v8 = objc_alloc_init(SVXServiceCommandHandlerRegistryProvider);
  uint64_t v9 = objc_alloc_init(SVXServiceCommandDelayedActionStoreProvider);
  uint64_t v10 = [(SVXServiceCommandHandler *)self initWithModule:v4 fallbackHandler:v7 commandHandlerRegistryFactory:v8 delayedActionStoreFactory:v9];

  return v10;
}

- (void)handleCommand:(id)a3 taskTracker:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(SVXModule *)self->_module performer];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __65__SVXServiceCommandHandler_handleCommand_taskTracker_completion___block_invoke;
  v15[3] = &unk_264554918;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [v11 performBlock:v15];
}

uint64_t __65__SVXServiceCommandHandler_handleCommand_taskTracker_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleCommand:*(void *)(a1 + 40) taskTracker:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

- (BOOL)isCommandUUFR:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = -[SVXServiceCommandHandlerRegistry handlersForCommand:](self->_handlerRegistry, "handlersForCommand:", v4, 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * i) isCommandUUFR:v4])
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)reset
{
  id v3 = [(SVXModule *)self->_module performer];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __33__SVXServiceCommandHandler_reset__block_invoke;
  v4[3] = &unk_2645548A0;
  v4[4] = self;
  [v3 performBlock:v4];
}

uint64_t __33__SVXServiceCommandHandler_reset__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reset];
}

@end