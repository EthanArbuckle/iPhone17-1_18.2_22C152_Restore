@interface _SVXServiceCommandHandlerPlayVoiceMail
+ (Class)supportedCommandClass;
- (BOOL)isCommandUUFR:(id)a3;
- (NSString)identifier;
- (_SVXServiceCommandHandlerPlayVoiceMail)initWithSessionManager:(id)a3 module:(id)a4;
- (_SVXServiceCommandHandlerPlayVoiceMail)initWithSessionManager:(id)a3 module:(id)a4 playVoicemailExpressionParserProvider:(id)a5 audioFileDecoder:(id)a6 voicemailMarkAsReadHandler:(id)a7;
- (void)handleCommand:(id)a3 withContext:(id)a4 taskTracker:(id)a5 completion:(id)a6;
@end

@implementation _SVXServiceCommandHandlerPlayVoiceMail

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_voiceMailMarkAsReadHandler, 0);
  objc_storeStrong((id *)&self->_audioFileDecoder, 0);
  objc_storeStrong((id *)&self->_playVoicemailExpressionParserProvider, 0);
  objc_storeStrong((id *)&self->_module, 0);

  objc_storeStrong((id *)&self->_sessionManager, 0);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)handleCommand:(id)a3 withContext:(id)a4 taskTracker:(id)a5 completion:(id)a6
{
  id v8 = a3;
  id v9 = a6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v8;
    v11 = [v10 targetDevice];
    v12 = [_SVXRemoteExpressionParsingService alloc];
    id v13 = objc_alloc_init(MEMORY[0x263F28460]);
    v14 = [(_SVXRemoteExpressionParsingService *)v12 initWithAceHandler:v13];

    playVoicemailExpressionParserProvider = self->_playVoicemailExpressionParserProvider;
    v16 = [(SVXModule *)self->_module preferences];
    v17 = [(SVXPlayVoicemailExpressionParserProvider *)playVoicemailExpressionParserProvider getWithParsingService:v14 preferences:v16];

    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __91___SVXServiceCommandHandlerPlayVoiceMail_handleCommand_withContext_taskTracker_completion___block_invoke;
    v20[3] = &unk_264552BF8;
    v20[4] = self;
    id v21 = v10;
    id v22 = v21;
    id v23 = v11;
    id v24 = v9;
    id v18 = v11;
    [v17 parsePlayVoicemail:v21 reply:v20];
  }
  else if (v9)
  {
    v19 = +[SVXServiceCommandResult resultIgnored];
    (*((void (**)(id, void *))v9 + 2))(v9, v19);
  }
}

- (BOOL)isCommandUUFR:(id)a3
{
  return 0;
}

- (_SVXServiceCommandHandlerPlayVoiceMail)initWithSessionManager:(id)a3 module:(id)a4 playVoicemailExpressionParserProvider:(id)a5 audioFileDecoder:(id)a6 voicemailMarkAsReadHandler:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v28 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v13)
  {
    if (v14) {
      goto LABEL_3;
    }
  }
  else
  {
    v25 = [MEMORY[0x263F08690] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"_SVXServiceCommandHandlerPlayVoiceMail.m", 57, @"Invalid parameter not satisfying: %@", @"sessionManager != nil" object file lineNumber description];

    if (v14) {
      goto LABEL_3;
    }
  }
  v26 = [MEMORY[0x263F08690] currentHandler];
  [v26 handleFailureInMethod:a2, self, @"_SVXServiceCommandHandlerPlayVoiceMail.m", 58, @"Invalid parameter not satisfying: %@", @"module != nil" object file lineNumber description];

LABEL_3:
  v29.receiver = self;
  v29.super_class = (Class)_SVXServiceCommandHandlerPlayVoiceMail;
  v17 = [(_SVXServiceCommandHandlerPlayVoiceMail *)&v29 init];
  id v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_sessionManager, a3);
    objc_storeStrong((id *)&v18->_module, a4);
    objc_storeStrong((id *)&v18->_playVoicemailExpressionParserProvider, a5);
    objc_storeStrong((id *)&v18->_audioFileDecoder, a6);
    objc_storeStrong((id *)&v18->_voiceMailMarkAsReadHandler, a7);
    id v19 = [NSString alloc];
    v20 = (objc_class *)[(id)objc_opt_class() supportedCommandClass];
    id v21 = NSStringFromClass(v20);
    uint64_t v22 = [v19 initWithFormat:@"com.apple.SiriVOXService.service-command.%@", v21];
    identifier = v18->_identifier;
    v18->_identifier = (NSString *)v22;
  }
  return v18;
}

- (_SVXServiceCommandHandlerPlayVoiceMail)initWithSessionManager:(id)a3 module:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(SVXPlayVoicemailExpressionParserProvider);
  id v9 = objc_alloc_init(SVXAudioFileDecoder);
  id v10 = objc_alloc_init(SVXVoiceMailMarkAsReadHandler);
  v11 = [(_SVXServiceCommandHandlerPlayVoiceMail *)self initWithSessionManager:v7 module:v6 playVoicemailExpressionParserProvider:v8 audioFileDecoder:v9 voicemailMarkAsReadHandler:v10];

  return v11;
}

+ (Class)supportedCommandClass
{
  return (Class)objc_opt_class();
}

@end