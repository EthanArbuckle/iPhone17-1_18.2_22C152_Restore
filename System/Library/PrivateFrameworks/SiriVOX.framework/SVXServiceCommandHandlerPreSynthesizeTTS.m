@interface SVXServiceCommandHandlerPreSynthesizeTTS
+ (Class)supportedCommandClass;
- (BOOL)isCommandUUFR:(id)a3;
- (NSString)identifier;
- (SVXServiceCommandHandlerPreSynthesizeTTS)initWithSpeechSynthesizer:(id)a3 speechSynthesisUtils:(id)a4;
- (void)handleCommand:(id)a3 withContext:(id)a4 taskTracker:(id)a5 completion:(id)a6;
@end

@implementation SVXServiceCommandHandlerPreSynthesizeTTS

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_speechSynthesisUtils, 0);

  objc_storeStrong((id *)&self->_speechSynthesizer, 0);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)handleCommand:(id)a3 withContext:(id)a4 taskTracker:(id)a5 completion:(id)a6
{
  id v9 = a3;
  v10 = (void (**)(id, void *))a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v20 = [MEMORY[0x263F08690] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"SVXServiceCommandHandlerPreSynthesizeTTS.m", 57, @"Invalid parameter not satisfying: %@", @"[command isKindOfClass:[SAPreSynthesizeTTS class]]" object file lineNumber description];
  }
  id v11 = v9;
  v12 = [v11 dialogStrings];
  v13 = [v11 aceAudioData];
  v14 = [v11 streamIds];
  v15 = [v11 speakableContextInfo];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __93__SVXServiceCommandHandlerPreSynthesizeTTS_handleCommand_withContext_taskTracker_completion___block_invoke;
  v21[3] = &unk_2645534A0;
  id v16 = v14;
  id v22 = v16;
  id v17 = v13;
  id v23 = v17;
  v24 = self;
  id v18 = v15;
  id v25 = v18;
  [v12 enumerateObjectsUsingBlock:v21];
  if (v10)
  {
    v19 = +[SVXServiceCommandResult resultSuccess];
    v10[2](v10, v19);
  }
}

void __93__SVXServiceCommandHandlerPreSynthesizeTTS_handleCommand_withContext_taskTracker_completion___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a2;
  if ([v5 count] <= a3)
  {
    id v13 = 0;
  }
  else
  {
    id v13 = [*(id *)(a1 + 32) objectAtIndex:a3];
  }
  if ([*(id *)(a1 + 40) count] <= a3)
  {
    v7 = 0;
  }
  else
  {
    v7 = [*(id *)(a1 + 40) objectAtIndex:a3];
  }
  v8 = [*(id *)(*(void *)(a1 + 48) + 16) createAudioFromUIAudioData:v7];
  id v9 = [SVXSpeechSynthesisRequest alloc];
  uint64_t v10 = *(void *)(a1 + 56);
  if ([v13 length]) {
    id v11 = v13;
  }
  else {
    id v11 = 0;
  }
  v12 = [(SVXSpeechSynthesisRequest *)v9 initWithPriority:2 options:0 speakableText:v6 speakableContext:v10 localizationKey:0 presynthesizedAudio:v8 streamID:v11];

  [*(id *)(*(void *)(a1 + 48) + 8) synthesizeRequest:v12 audioChunkHandler:0 taskTracker:0 analyticsContext:0 completion:&__block_literal_global_9253];
}

void __93__SVXServiceCommandHandlerPreSynthesizeTTS_handleCommand_withContext_taskTracker_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = a2;
  if ([v2 type] == 4)
  {
    v3 = (void *)*MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      v5 = [v2 error];
      int v6 = 136315394;
      v7 = "-[SVXServiceCommandHandlerPreSynthesizeTTS handleCommand:withContext:taskTracker:completion:]_block_invoke_2";
      __int16 v8 = 2112;
      id v9 = v5;
      _os_log_error_impl(&dword_220062000, v4, OS_LOG_TYPE_ERROR, "%s PreSynthesis failed: %@", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (BOOL)isCommandUUFR:(id)a3
{
  return 0;
}

- (SVXServiceCommandHandlerPreSynthesizeTTS)initWithSpeechSynthesizer:(id)a3 speechSynthesisUtils:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)SVXServiceCommandHandlerPreSynthesizeTTS;
  id v9 = [(SVXServiceCommandHandlerPreSynthesizeTTS *)&v17 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_speechSynthesizer, a3);
    objc_storeStrong((id *)&v10->_speechSynthesisUtils, a4);
    id v11 = [NSString alloc];
    v12 = (objc_class *)[(id)objc_opt_class() supportedCommandClass];
    id v13 = NSStringFromClass(v12);
    uint64_t v14 = [v11 initWithFormat:@"com.apple.SiriVOXService.service-command.%@", v13];
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v14;
  }
  return v10;
}

+ (Class)supportedCommandClass
{
  return (Class)objc_opt_class();
}

@end