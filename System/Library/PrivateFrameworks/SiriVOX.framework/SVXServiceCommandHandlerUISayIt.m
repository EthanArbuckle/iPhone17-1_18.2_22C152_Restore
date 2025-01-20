@interface SVXServiceCommandHandlerUISayIt
+ (Class)supportedCommandClass;
- (BOOL)isCommandUUFR:(id)a3;
- (BOOL)shouldDependOnCommand:(id)a3;
- (NSString)identifier;
- (SVXServiceCommandHandlerUISayIt)initWithSpeechSynthesizer:(id)a3 module:(id)a4 instrumentationUtils:(id)a5 synthesisResultConverter:(id)a6 speechSynthesisUtils:(id)a7;
- (SVXServiceCommandHandlerUISayIt)initWithSpeechSynthesizer:(id)a3 module:(id)a4 instrumentationUtils:(id)a5 synthesisResultConverter:(id)a6 speechSynthesisUtils:(id)a7 utteranceParserProvider:(id)a8 expressionParsingServiceProvider:(id)a9 parseableExpressionFactory:(id)a10 sayItChildTaskFactory:(id)a11 afUtilities:(id)a12;
- (void)handleCommand:(id)a3 withContext:(id)a4 taskTracker:(id)a5 completion:(id)a6;
- (void)prepareToHandleCommand:(id)a3 completion:(id)a4;
@end

@implementation SVXServiceCommandHandlerUISayIt

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_speechSynthesisUtils, 0);
  objc_storeStrong((id *)&self->_synthesisResultConverter, 0);
  objc_storeStrong((id *)&self->_afUtilities, 0);
  objc_storeStrong((id *)&self->_sayItChildTaskFactory, 0);
  objc_storeStrong((id *)&self->_parseableExpressionFactory, 0);
  objc_storeStrong((id *)&self->_expressionParsingServiceProvider, 0);
  objc_storeStrong((id *)&self->_utteranceParserProvider, 0);
  objc_storeStrong((id *)&self->_instrumentationUtils, 0);
  objc_storeStrong((id *)&self->_module, 0);

  objc_storeStrong((id *)&self->_speechSynthesizer, 0);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)handleCommand:(id)a3 withContext:(id)a4 taskTracker:(id)a5 completion:(id)a6
{
  v58[1] = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v42 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v39 = [MEMORY[0x263F08690] currentHandler];
    [v39 handleFailureInMethod:a2, self, @"SVXServiceCommandHandlerUISayIt.m", 165, @"Invalid parameter not satisfying: %@", @"[command isKindOfClass:[SAUISayIt class]]" object file lineNumber description];
  }
  id v14 = v11;
  kdebug_trace();
  sayItChildTaskFactory = self->_sayItChildTaskFactory;
  v16 = [(SVXModule *)self->_module preferences];
  v41 = -[SVXSayItChildTaskProvider createWithCommand:taskTracker:listenAfterSpeakingDisabled:](sayItChildTaskFactory, "createWithCommand:taskTracker:listenAfterSpeakingDisabled:", v14, v13, [v16 listenAfterSpeakingDisabled]);

  uint64_t v17 = [v14 dialogIdentifier];
  BOOL v18 = [(SVXAFUtilitiesWrapper *)self->_afUtilities af_IsInternalInstall];
  uint64_t v19 = 0;
  if (v18)
  {
    if (v17) {
      v20 = (__CFString *)v17;
    }
    else {
      v20 = &stru_26D1E1D80;
    }
    v57 = @"dialogIdentifier";
    v58[0] = v20;
    uint64_t v19 = [NSDictionary dictionaryWithObjects:v58 forKeys:&v57 count:1];
  }
  v40 = (void *)v19;
  v21 = v13;
  objc_opt_class();
  v43 = v12;
  v44 = (void *)v17;
  if (objc_opt_isKindOfClass())
  {
    id v22 = v12;
  }
  else
  {
    id v22 = [v14 message];
  }
  v23 = v22;
  v24 = (os_log_t *)MEMORY[0x263F28348];
  v25 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v54 = "-[SVXServiceCommandHandlerUISayIt handleCommand:withContext:taskTracker:completion:]";
    __int16 v55 = 2112;
    v56 = v23;
    _os_log_impl(&dword_220062000, v25, OS_LOG_TYPE_INFO, "%s preparedSpeakableText = %@", buf, 0x16u);
  }
  speechSynthesisUtils = self->_speechSynthesisUtils;
  v27 = [v14 audioData];
  v28 = [(SVXSpeechSynthesisUtils *)speechSynthesisUtils createAudioFromUIAudioData:v27];

  v29 = *v24;
  if (os_log_type_enabled(*v24, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v54 = "-[SVXServiceCommandHandlerUISayIt handleCommand:withContext:taskTracker:completion:]";
    __int16 v55 = 2112;
    v56 = v28;
    _os_log_impl(&dword_220062000, v29, OS_LOG_TYPE_INFO, "%s presynthesizedAudio = %@", buf, 0x16u);
  }
  instrumentationUtils = self->_instrumentationUtils;
  v31 = [v21 instrumentationContext];
  v32 = [v21 context];
  v33 = [v32 dialogPhase];
  [(SVXInstrumentationUtilities *)instrumentationUtils emitUUFRSaid:v31 dialogIdentifier:v44 dialogPhase:v33];

  v34 = -[SVXSpeechSynthesisRequest initWithPriority:options:speakableText:speakableContext:localizationKey:presynthesizedAudio:streamID:]([SVXSpeechSynthesisRequest alloc], "initWithPriority:options:speakableText:speakableContext:localizationKey:presynthesizedAudio:streamID:", 2, [v14 canUseServerTTS], v23, 0, 0, v28, 0);
  speechSynthesizer = self->_speechSynthesizer;
  v50[0] = MEMORY[0x263EF8330];
  v50[1] = 3221225472;
  v50[2] = __84__SVXServiceCommandHandlerUISayIt_handleCommand_withContext_taskTracker_completion___block_invoke;
  v50[3] = &unk_2645548C8;
  v51 = v34;
  id v52 = v14;
  v45[0] = MEMORY[0x263EF8330];
  v45[1] = 3221225472;
  v45[2] = __84__SVXServiceCommandHandlerUISayIt_handleCommand_withContext_taskTracker_completion___block_invoke_41;
  v45[3] = &unk_264553630;
  v46 = v51;
  id v47 = v14;
  v48 = self;
  id v49 = v42;
  v36 = v51;
  id v37 = v42;
  id v38 = v14;
  [(SVXSpeechSynthesizer *)speechSynthesizer enqueueRequest:v36 languageCode:0 voiceName:0 gender:0 audioSessionID:0 preparation:v50 finalization:v45 taskTracker:v41 analyticsContext:v40];
}

void __84__SVXServiceCommandHandlerUISayIt_handleCommand_withContext_taskTracker_completion___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 136315650;
    v6 = "-[SVXServiceCommandHandlerUISayIt handleCommand:withContext:taskTracker:completion:]_block_invoke";
    __int16 v7 = 2112;
    uint64_t v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    _os_log_impl(&dword_220062000, v2, OS_LOG_TYPE_INFO, "%s Begin TTS request %@ for %@.", (uint8_t *)&v5, 0x20u);
  }
}

void __84__SVXServiceCommandHandlerUISayIt_handleCommand_withContext_taskTracker_completion___block_invoke_41(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = a1[4];
    uint64_t v6 = a1[5];
    int v9 = 136315906;
    uint64_t v10 = "-[SVXServiceCommandHandlerUISayIt handleCommand:withContext:taskTracker:completion:]_block_invoke";
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
    uint64_t v8 = [*(id *)(a1[6] + 72) toServiceCommandResult:v3];
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  }
}

- (void)prepareToHandleCommand:(id)a3 completion:(id)a4
{
  v37[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  uint64_t v8 = (void (**)(id, uint64_t, void))a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v29 = [MEMORY[0x263F08690] currentHandler];
    [v29 handleFailureInMethod:a2, self, @"SVXServiceCommandHandlerUISayIt.m", 115, @"Invalid parameter not satisfying: %@", @"[command isKindOfClass:[SAUISayIt class]]" object file lineNumber description];
  }
  id v9 = v7;
  uint64_t v10 = [v9 context];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v10, "svx_isDeferredExpressionContextObject"))
  {
    id v11 = objc_alloc(MEMORY[0x263EFF960]);
    uint64_t v12 = [(SVXModule *)self->_module preferences];
    __int16 v13 = [v12 languageCode];
    uint64_t v14 = (void *)[v11 initWithLocaleIdentifier:v13];

    __int16 v15 = [(SVXAFSpeakableUtteranceParserProvider *)self->_utteranceParserProvider getWithLocale:v14];
    id v16 = [v10 groupIdentifier];
    uint64_t v17 = +[_SVXSpeakableNamespaceDomainOccurrenceProvider providerForDomain:v16];

    [v15 registerProvider:v17 forNamespace:*MEMORY[0x263F28720]];
    BOOL v18 = [v9 message];
    id v36 = 0;
    id v19 = (id)[v15 parseStringWithFormat:v18 error:&v36];
    id v20 = v36;

    if (v20 || ![v17 count])
    {
      if (v8) {
        v8[2](v8, 1, 0);
      }
    }
    else
    {
      expressionParsingServiceProvider = self->_expressionParsingServiceProvider;
      id v22 = objc_alloc_init(MEMORY[0x263F28460]);
      v30 = [(_SVXRemoteExpressionParsingServiceProvider *)expressionParsingServiceProvider getWithAceHandler:v22];

      parseableExpressionFactory = self->_parseableExpressionFactory;
      v23 = [MEMORY[0x263F08C38] UUID];
      v24 = [v23 UUIDString];
      v25 = [v9 message];
      [(SVXSAUILParseableExpressionProvider *)parseableExpressionFactory createWithAceId:v24 context:v10 expressionString:v25];
      v26 = v32 = v14;

      v37[0] = v26;
      v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:1];
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __69__SVXServiceCommandHandlerUISayIt_prepareToHandleCommand_completion___block_invoke;
      v33[3] = &unk_264552FB0;
      id v34 = v26;
      v35 = v8;
      id v28 = v26;
      [v30 parseExpressions:v27 targetDevice:0 reply:v33];

      uint64_t v14 = v32;
    }
  }
  else if (v8)
  {
    v8[2](v8, 1, 0);
  }
}

void __69__SVXServiceCommandHandlerUISayIt_prepareToHandleCommand_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = [a3 firstObject];
  uint64_t v6 = v5;
  if (a2
    && ([v5 parseableExpression],
        id v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 isEqual:*(void *)(a1 + 32)],
        v7,
        v8))
  {
    uint64_t v9 = [v6 parsedOutput];
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v11 = (id)v9;
  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, uint64_t, id))(v10 + 16))(v10, a2, v11);
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

- (SVXServiceCommandHandlerUISayIt)initWithSpeechSynthesizer:(id)a3 module:(id)a4 instrumentationUtils:(id)a5 synthesisResultConverter:(id)a6 speechSynthesisUtils:(id)a7 utteranceParserProvider:(id)a8 expressionParsingServiceProvider:(id)a9 parseableExpressionFactory:(id)a10 sayItChildTaskFactory:(id)a11 afUtilities:(id)a12
{
  id v18 = a3;
  id v35 = a4;
  id v19 = a4;
  id v36 = a5;
  id v45 = a5;
  id v37 = a6;
  id v20 = a6;
  v21 = self;
  id v44 = v20;
  id v43 = a7;
  id v38 = a8;
  id v42 = a8;
  id v41 = a9;
  id v40 = a10;
  id v39 = a11;
  id v22 = a12;
  if (v18)
  {
    if (v19) {
      goto LABEL_3;
    }
  }
  else
  {
    v31 = [MEMORY[0x263F08690] currentHandler];
    [v31 handleFailureInMethod:a2, v21, @"SVXServiceCommandHandlerUISayIt.m", 81, @"Invalid parameter not satisfying: %@", @"speechSynthesizer != nil" object file lineNumber description];

    if (v19) {
      goto LABEL_3;
    }
  }
  v32 = [MEMORY[0x263F08690] currentHandler];
  [v32 handleFailureInMethod:a2, v21, @"SVXServiceCommandHandlerUISayIt.m", 82, @"Invalid parameter not satisfying: %@", @"module != nil" object file lineNumber description];

LABEL_3:
  v46.receiver = v21;
  v46.super_class = (Class)SVXServiceCommandHandlerUISayIt;
  v23 = [(SVXServiceCommandHandlerUISayIt *)&v46 init];
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_speechSynthesizer, a3);
    objc_storeStrong((id *)&v24->_module, v35);
    objc_storeStrong((id *)&v24->_instrumentationUtils, v36);
    objc_storeStrong((id *)&v24->_synthesisResultConverter, v37);
    objc_storeStrong((id *)&v24->_speechSynthesisUtils, a7);
    objc_storeStrong((id *)&v24->_utteranceParserProvider, v38);
    objc_storeStrong((id *)&v24->_expressionParsingServiceProvider, a9);
    objc_storeStrong((id *)&v24->_parseableExpressionFactory, a10);
    objc_storeStrong((id *)&v24->_sayItChildTaskFactory, a11);
    objc_storeStrong((id *)&v24->_afUtilities, a12);
    id v25 = [NSString alloc];
    v26 = (objc_class *)[(id)objc_opt_class() supportedCommandClass];
    v27 = NSStringFromClass(v26);
    uint64_t v28 = [v25 initWithFormat:@"com.apple.SiriVOXService.service-command.%@", v27];
    identifier = v24->_identifier;
    v24->_identifier = (NSString *)v28;
  }
  return v24;
}

- (SVXServiceCommandHandlerUISayIt)initWithSpeechSynthesizer:(id)a3 module:(id)a4 instrumentationUtils:(id)a5 synthesisResultConverter:(id)a6 speechSynthesisUtils:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v22 = objc_alloc_init(SVXAFSpeakableUtteranceParserProvider);
  id v16 = objc_alloc_init(_SVXRemoteExpressionParsingServiceProvider);
  uint64_t v17 = objc_alloc_init(SVXSAUILParseableExpressionProvider);
  id v18 = objc_alloc_init(SVXSayItChildTaskProvider);
  id v19 = objc_alloc_init(SVXAFUtilitiesWrapper);
  id v20 = [(SVXServiceCommandHandlerUISayIt *)self initWithSpeechSynthesizer:v15 module:v14 instrumentationUtils:v13 synthesisResultConverter:v12 speechSynthesisUtils:v11 utteranceParserProvider:v22 expressionParsingServiceProvider:v16 parseableExpressionFactory:v17 sayItChildTaskFactory:v18 afUtilities:v19];

  return v20;
}

+ (Class)supportedCommandClass
{
  return (Class)objc_opt_class();
}

@end