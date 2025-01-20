@interface SVXServiceCommandHandlerUIAddViews
+ (Class)supportedCommandClass;
- (BOOL)isCommandUUFR:(id)a3;
- (BOOL)shouldDependOnCommand:(id)a3;
- (NSString)identifier;
- (SVXServiceCommandHandlerUIAddViews)initWithModule:(id)a3 instrumentationUtils:(id)a4 dialogTransformer:(id)a5 aceViewHandler:(id)a6 expressionParserProvider:(id)a7;
- (SVXServiceCommandHandlerUIAddViews)initWithSpeechSynthesizer:(id)a3 module:(id)a4 instrumentationUtils:(id)a5 modeProvider:(id)a6 dialogTransformer:(id)a7 synthesisResultConverter:(id)a8;
- (void)handleCommand:(id)a3 withContext:(id)a4 taskTracker:(id)a5 completion:(id)a6;
- (void)prepareToHandleCommand:(id)a3 completion:(id)a4;
@end

@implementation SVXServiceCommandHandlerUIAddViews

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_expressionParserProvider, 0);
  objc_storeStrong((id *)&self->_dialogTransformer, 0);
  objc_storeStrong((id *)&self->_aceViewHandler, 0);
  objc_storeStrong((id *)&self->_instrumentationUtils, 0);

  objc_storeStrong((id *)&self->_module, 0);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)handleCommand:(id)a3 withContext:(id)a4 taskTracker:(id)a5 completion:(id)a6
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v40 = a6;
  uint64_t v13 = mach_absolute_time();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v37 = [MEMORY[0x263F08690] currentHandler];
    [v37 handleFailureInMethod:a2, self, @"SVXServiceCommandHandlerUIAddViews.m", 120, @"Invalid parameter not satisfying: %@", @"[command isKindOfClass:[SAUIAddViews class]]" object file lineNumber description];
  }
  id v14 = v10;
  v15 = objc_msgSend(v14, "af_dialogPhase");
  unsigned int v16 = [v15 isExpository];

  if ((v16 & 1) == 0) {
    kdebug_trace();
  }
  v17 = [v12 context];
  v53[0] = MEMORY[0x263EF8330];
  v53[1] = 3221225472;
  v53[2] = __87__SVXServiceCommandHandlerUIAddViews_handleCommand_withContext_taskTracker_completion___block_invoke;
  v53[3] = &unk_264554098;
  uint64_t v55 = v13;
  id v18 = v14;
  id v54 = v18;
  uint64_t v19 = [v17 mutatedCopyWithMutator:v53];

  v38 = (void *)v19;
  v43 = [v12 beginChildWithContext:v19];
  objc_opt_class();
  v42 = v11;
  v39 = v18;
  if (objc_opt_isKindOfClass()) {
    v20 = v11;
  }
  else {
    v20 = v18;
  }
  id v21 = v20;
  v22 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    v23 = v22;
    v24 = [v21 patternId];
    v25 = [v21 patternType];
    *(_DWORD *)buf = 136315906;
    v58 = "-[SVXServiceCommandHandlerUIAddViews handleCommand:withContext:taskTracker:completion:]";
    __int16 v59 = 2112;
    id v60 = v21;
    __int16 v61 = 2112;
    v62 = v24;
    __int16 v63 = 2112;
    v64 = v25;
    _os_log_impl(&dword_220062000, v23, OS_LOG_TYPE_INFO, "%s preparedAddViews = %@, patternId = %@, patternType = %@", buf, 0x2Au);
  }
  instrumentationUtils = self->_instrumentationUtils;
  v41 = v12;
  v27 = [v12 instrumentationContext];
  [(SVXInstrumentationUtilities *)instrumentationUtils emitPatternExecutedEvent:v27 addViews:v21];

  v28 = dispatch_group_create();
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  v29 = [v21 views];
  uint64_t v30 = [v29 countByEnumeratingWithState:&v49 objects:v56 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v31; ++i)
      {
        if (*(void *)v50 != v32) {
          objc_enumerationMutation(v29);
        }
        uint64_t v34 = *(void *)(*((void *)&v49 + 1) + 8 * i);
        dispatch_group_enter(v28);
        aceViewHandler = self->_aceViewHandler;
        v47[0] = MEMORY[0x263EF8330];
        v47[1] = 3221225472;
        v47[2] = __87__SVXServiceCommandHandlerUIAddViews_handleCommand_withContext_taskTracker_completion___block_invoke_30;
        v47[3] = &unk_264553140;
        v48 = v28;
        [(SVXAceViewHandler *)aceViewHandler handleAceView:v34 isExpository:v16 taskTracker:v43 completion:v47];
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v49 objects:v56 count:16];
    }
    while (v31);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __87__SVXServiceCommandHandlerUIAddViews_handleCommand_withContext_taskTracker_completion___block_invoke_2;
  block[3] = &unk_264553B00;
  id v46 = v40;
  id v36 = v40;
  dispatch_group_notify(v28, MEMORY[0x263EF83A0], block);
}

void __87__SVXServiceCommandHandlerUIAddViews_handleCommand_withContext_taskTracker_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  [v4 setTimestamp:v3];
  id v5 = [*(id *)(a1 + 32) dialogPhase];
  [v4 setDialogPhase:v5];
}

void __87__SVXServiceCommandHandlerUIAddViews_handleCommand_withContext_taskTracker_completion___block_invoke_30(uint64_t a1)
{
}

void __87__SVXServiceCommandHandlerUIAddViews_handleCommand_withContext_taskTracker_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    id v2 = +[SVXServiceCommandResult resultSuccess];
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
  }
}

- (void)prepareToHandleCommand:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"SVXServiceCommandHandlerUIAddViews.m", 102, @"Invalid parameter not satisfying: %@", @"[command isKindOfClass:[SAUIAddViews class]]" object file lineNumber description];
  }
  v9 = [(SVXDialogTransformer *)self->_dialogTransformer transformAddViews:v7];
  id v10 = [_SVXRemoteExpressionParsingService alloc];
  id v11 = objc_alloc_init(MEMORY[0x263F28460]);
  id v12 = [(_SVXRemoteExpressionParsingService *)v10 initWithAceHandler:v11];

  expressionParserProvider = self->_expressionParserProvider;
  id v14 = [(SVXModule *)self->_module preferences];
  v15 = [(_SVXAddViewsExpressionParserProvider *)expressionParserProvider getWithParsingService:v12 preferences:v14];

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __72__SVXServiceCommandHandlerUIAddViews_prepareToHandleCommand_completion___block_invoke;
  v18[3] = &unk_264553118;
  id v19 = v8;
  id v16 = v8;
  [v15 parseAddViews:v9 reply:v18];
}

uint64_t __72__SVXServiceCommandHandlerUIAddViews_prepareToHandleCommand_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BOOL)shouldDependOnCommand:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (BOOL)isCommandUUFR:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SVXServiceCommandHandlerUIAddViews.m", 92, @"Invalid parameter not satisfying: %@", @"[command isKindOfClass:[SAUIAddViews class]]" object file lineNumber description];
  }
  v6 = objc_msgSend(v5, "af_dialogPhase");
  id v7 = v6;
  if (v6) {
    int v8 = [v6 isExpository] ^ 1;
  }
  else {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (SVXServiceCommandHandlerUIAddViews)initWithModule:(id)a3 instrumentationUtils:(id)a4 dialogTransformer:(id)a5 aceViewHandler:(id)a6 expressionParserProvider:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v29 = a6;
  id v16 = a7;
  if (v13)
  {
    if (v14) {
      goto LABEL_3;
    }
LABEL_8:
    v26 = [MEMORY[0x263F08690] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"SVXServiceCommandHandlerUIAddViews.m", 73, @"Invalid parameter not satisfying: %@", @"instrumentationUtils != nil" object file lineNumber description];

    if (v15) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v25 = [MEMORY[0x263F08690] currentHandler];
  [v25 handleFailureInMethod:a2, self, @"SVXServiceCommandHandlerUIAddViews.m", 72, @"Invalid parameter not satisfying: %@", @"module != nil" object file lineNumber description];

  if (!v14) {
    goto LABEL_8;
  }
LABEL_3:
  if (v15) {
    goto LABEL_4;
  }
LABEL_9:
  v27 = [MEMORY[0x263F08690] currentHandler];
  [v27 handleFailureInMethod:a2, self, @"SVXServiceCommandHandlerUIAddViews.m", 74, @"Invalid parameter not satisfying: %@", @"dialogTransformer != nil" object file lineNumber description];

LABEL_4:
  v30.receiver = self;
  v30.super_class = (Class)SVXServiceCommandHandlerUIAddViews;
  v17 = [(SVXServiceCommandHandlerUIAddViews *)&v30 init];
  id v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_module, a3);
    objc_storeStrong((id *)&v18->_instrumentationUtils, a4);
    objc_storeStrong((id *)&v18->_dialogTransformer, a5);
    objc_storeStrong((id *)&v18->_aceViewHandler, a6);
    objc_storeStrong((id *)&v18->_expressionParserProvider, a7);
    id v19 = [NSString alloc];
    v20 = (objc_class *)[(id)objc_opt_class() supportedCommandClass];
    id v21 = NSStringFromClass(v20);
    uint64_t v22 = [v19 initWithFormat:@"com.apple.SiriVOXService.service-command.%@", v21];
    identifier = v18->_identifier;
    v18->_identifier = (NSString *)v22;
  }
  return v18;
}

- (SVXServiceCommandHandlerUIAddViews)initWithSpeechSynthesizer:(id)a3 module:(id)a4 instrumentationUtils:(id)a5 modeProvider:(id)a6 dialogTransformer:(id)a7 synthesisResultConverter:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  v20 = [[SVXAceViewHandler alloc] initWithModule:v18 instrumentationUtils:v17 modeProvider:v16 speechSynthesizer:v19 synthesisResultConverter:v14];

  id v21 = objc_alloc_init(_SVXAddViewsExpressionParserProvider);
  uint64_t v22 = [(SVXServiceCommandHandlerUIAddViews *)self initWithModule:v18 instrumentationUtils:v17 dialogTransformer:v15 aceViewHandler:v20 expressionParserProvider:v21];

  return v22;
}

+ (Class)supportedCommandClass
{
  return (Class)objc_opt_class();
}

@end