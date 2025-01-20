@interface SVXServiceCommandHandlerUIRepeatIt
+ (Class)supportedCommandClass;
- (BOOL)isCommandUUFR:(id)a3;
- (BOOL)shouldDependOnCommand:(id)a3;
- (NSString)identifier;
- (SVXServiceCommandHandlerUIRepeatIt)initWithSpeechSynthesizer:(id)a3 performer:(id)a4 instrumentationUtils:(id)a5 synthesisResultConverter:(id)a6;
- (void)handleCommand:(id)a3 withContext:(id)a4 taskTracker:(id)a5 completion:(id)a6;
- (void)speechSynthesizerWillStartRequest:(id)a3 taskTracker:(id)a4;
@end

@implementation SVXServiceCommandHandlerUIRepeatIt

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_synthesisResultConverter, 0);
  objc_storeStrong((id *)&self->_lastStartedRequest, 0);
  objc_storeStrong((id *)&self->_instrumentationUtils, 0);
  objc_storeStrong((id *)&self->_performer, 0);

  objc_storeStrong((id *)&self->_speechSynthesizer, 0);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)speechSynthesizerWillStartRequest:(id)a3 taskTracker:(id)a4
{
  id v5 = a3;
  v6 = [v5 speakableText];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    performer = self->_performer;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __84__SVXServiceCommandHandlerUIRepeatIt_speechSynthesizerWillStartRequest_taskTracker___block_invoke;
    v9[3] = &unk_2645548C8;
    v9[4] = self;
    id v10 = v5;
    [(SVXPerforming *)performer performBlock:v9];
  }
}

uint64_t __84__SVXServiceCommandHandlerUIRepeatIt_speechSynthesizerWillStartRequest_taskTracker___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 32) = [*(id *)(a1 + 40) copy];

  return MEMORY[0x270F9A758]();
}

- (void)handleCommand:(id)a3 withContext:(id)a4 taskTracker:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v20 = [MEMORY[0x263F08690] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"SVXServiceCommandHandlerUIRepeatIt.m", 76, @"Invalid parameter not satisfying: %@", @"[command isKindOfClass:[SAUIRepeatIt class]]" object file lineNumber description];
  }
  id v13 = v10;
  kdebug_trace();
  v14 = [v13 contingency];
  performer = self->_performer;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __87__SVXServiceCommandHandlerUIRepeatIt_handleCommand_withContext_taskTracker_completion___block_invoke;
  v21[3] = &unk_264553C68;
  v21[4] = self;
  id v22 = v14;
  id v23 = v11;
  id v24 = v13;
  id v25 = v12;
  id v16 = v12;
  id v17 = v13;
  id v18 = v11;
  id v19 = v14;
  [(SVXPerforming *)performer performBlock:v21];
}

void __87__SVXServiceCommandHandlerUIRepeatIt_handleCommand_withContext_taskTracker_completion___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  v2 = *(void **)(*(void *)(a1 + 32) + 32);
  if (v2)
  {
    v3 = (SVXSpeechSynthesisRequest *)[v2 copy];
  }
  else
  {
    if (!*(void *)(a1 + 40)) {
      goto LABEL_9;
    }
    v3 = [[SVXSpeechSynthesisRequest alloc] initWithPriority:2 options:1 speakableText:*(void *)(a1 + 40) speakableContext:0 localizationKey:0 presynthesizedAudio:0 streamID:0];
  }
  v4 = v3;
  if (v3)
  {
    id v5 = [*(id *)(a1 + 48) context];
    v6 = [v5 dialogPhase];

    uint64_t v7 = (void *)*MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      v8 = v7;
      v9 = [(SVXSpeechSynthesisRequest *)v4 speakableText];
      *(_DWORD *)buf = 136315650;
      v27 = "-[SVXServiceCommandHandlerUIRepeatIt handleCommand:withContext:taskTracker:completion:]_block_invoke";
      __int16 v28 = 2112;
      v29 = v9;
      __int16 v30 = 2112;
      v31 = v6;
      _os_log_impl(&dword_220062000, v8, OS_LOG_TYPE_INFO, "%s speakableText = %@ dialogPhase = %@", buf, 0x20u);
    }
    id v10 = *(void **)(*(void *)(a1 + 32) + 24);
    id v11 = [*(id *)(a1 + 48) instrumentationContext];
    [v10 emitUUFRSaid:v11 dialogIdentifier:0 dialogPhase:v6];

    id v12 = *(void **)(*(void *)(a1 + 32) + 8);
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __87__SVXServiceCommandHandlerUIRepeatIt_handleCommand_withContext_taskTracker_completion___block_invoke_15;
    v23[3] = &unk_2645548C8;
    id v24 = v4;
    id v25 = *(id *)(a1 + 56);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __87__SVXServiceCommandHandlerUIRepeatIt_handleCommand_withContext_taskTracker_completion___block_invoke_17;
    v18[3] = &unk_264553630;
    id v19 = v24;
    id v20 = *(id *)(a1 + 56);
    id v13 = *(id *)(a1 + 64);
    uint64_t v21 = *(void *)(a1 + 32);
    id v22 = v13;
    uint64_t v14 = *(void *)(a1 + 48);
    v15 = v24;
    [v12 enqueueRequest:v15 languageCode:0 voiceName:0 gender:0 audioSessionID:0 preparation:v23 finalization:v18 taskTracker:v14 analyticsContext:0];

    return;
  }
LABEL_9:
  uint64_t v16 = *(void *)(a1 + 64);
  if (v16)
  {
    id v17 = +[SVXServiceCommandResult resultFailureWithErrorCode:0 reason:0];
    (*(void (**)(uint64_t))(v16 + 16))(v16);
  }
}

void __87__SVXServiceCommandHandlerUIRepeatIt_handleCommand_withContext_taskTracker_completion___block_invoke_15(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 136315650;
    v6 = "-[SVXServiceCommandHandlerUIRepeatIt handleCommand:withContext:taskTracker:completion:]_block_invoke";
    __int16 v7 = 2112;
    uint64_t v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    _os_log_impl(&dword_220062000, v2, OS_LOG_TYPE_INFO, "%s Begin TTS request %@ for %@.", (uint8_t *)&v5, 0x20u);
  }
}

void __87__SVXServiceCommandHandlerUIRepeatIt_handleCommand_withContext_taskTracker_completion___block_invoke_17(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = a1[4];
    uint64_t v6 = a1[5];
    int v9 = 136315906;
    uint64_t v10 = "-[SVXServiceCommandHandlerUIRepeatIt handleCommand:withContext:taskTracker:completion:]_block_invoke";
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    __int16 v13 = 2112;
    uint64_t v14 = v6;
    __int16 v15 = 2112;
    id v16 = v3;
    _os_log_impl(&dword_220062000, v4, OS_LOG_TYPE_INFO, "%s End TTS request %@ for %@ with result %@.", (uint8_t *)&v9, 0x2Au);
  }
  uint64_t v7 = a1[7];
  if (v7)
  {
    uint64_t v8 = [*(id *)(a1[6] + 40) toServiceCommandResult:v3];
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  }
}

- (BOOL)shouldDependOnCommand:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
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
  return 1;
}

- (SVXServiceCommandHandlerUIRepeatIt)initWithSpeechSynthesizer:(id)a3 performer:(id)a4 instrumentationUtils:(id)a5 synthesisResultConverter:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v23.receiver = self;
  v23.super_class = (Class)SVXServiceCommandHandlerUIRepeatIt;
  __int16 v15 = [(SVXServiceCommandHandlerUIRepeatIt *)&v23 init];
  id v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_speechSynthesizer, a3);
    [(SVXSpeechSynthesizer *)v16->_speechSynthesizer addListener:v16];
    objc_storeStrong((id *)&v16->_performer, a4);
    objc_storeStrong((id *)&v16->_instrumentationUtils, a5);
    objc_storeStrong((id *)&v16->_synthesisResultConverter, a6);
    id v17 = [NSString alloc];
    id v18 = (objc_class *)[(id)objc_opt_class() supportedCommandClass];
    id v19 = NSStringFromClass(v18);
    uint64_t v20 = [v17 initWithFormat:@"com.apple.SiriVOXService.service-command.%@", v19];
    identifier = v16->_identifier;
    v16->_identifier = (NSString *)v20;
  }
  return v16;
}

+ (Class)supportedCommandClass
{
  return (Class)objc_opt_class();
}

@end