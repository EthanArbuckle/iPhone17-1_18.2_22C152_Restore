@interface _SVXServiceCommandHandlerSmsPlayAudio
+ (Class)supportedCommandClass;
- (BOOL)isCommandUUFR:(id)a3;
- (NSString)identifier;
- (_SVXServiceCommandHandlerSmsPlayAudio)initWithSessionManager:(id)a3 module:(id)a4;
- (_SVXServiceCommandHandlerSmsPlayAudio)initWithSessionManager:(id)a3 module:(id)a4 expressionParserProvider:(id)a5;
- (void)handleCommand:(id)a3 withContext:(id)a4 taskTracker:(id)a5 completion:(id)a6;
@end

@implementation _SVXServiceCommandHandlerSmsPlayAudio

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_expressionParserProvider, 0);
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
    v11 = [_SVXRemoteExpressionParsingService alloc];
    id v12 = objc_alloc_init(MEMORY[0x263F28460]);
    v13 = [(_SVXRemoteExpressionParsingService *)v11 initWithAceHandler:v12];

    expressionParserProvider = self->_expressionParserProvider;
    v15 = [(SVXModule *)self->_module preferences];
    v16 = [(_SVXPlayAudioExpressionParserProvider *)expressionParserProvider getWithParsingService:v13 preferences:v15];

    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __90___SVXServiceCommandHandlerSmsPlayAudio_handleCommand_withContext_taskTracker_completion___block_invoke;
    v19[3] = &unk_264552718;
    v19[4] = self;
    id v20 = v10;
    id v21 = v9;
    id v17 = v10;
    [v16 parsePlayAudio:v17 reply:v19];
  }
  else if (v9)
  {
    v18 = +[SVXServiceCommandResult resultIgnored];
    (*((void (**)(id, void *))v9 + 2))(v9, v18);
  }
}

- (BOOL)isCommandUUFR:(id)a3
{
  return 0;
}

- (_SVXServiceCommandHandlerSmsPlayAudio)initWithSessionManager:(id)a3 module:(id)a4 expressionParserProvider:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
LABEL_8:
    v22 = [MEMORY[0x263F08690] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"_SVXServiceCommandHandlerSmsPlayAudio.m", 45, @"Invalid parameter not satisfying: %@", @"module != nil" object file lineNumber description];

    if (v12) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  id v21 = [MEMORY[0x263F08690] currentHandler];
  [v21 handleFailureInMethod:a2, self, @"_SVXServiceCommandHandlerSmsPlayAudio.m", 44, @"Invalid parameter not satisfying: %@", @"sessionManager != nil" object file lineNumber description];

  if (!v11) {
    goto LABEL_8;
  }
LABEL_3:
  if (v12) {
    goto LABEL_4;
  }
LABEL_9:
  v23 = [MEMORY[0x263F08690] currentHandler];
  [v23 handleFailureInMethod:a2, self, @"_SVXServiceCommandHandlerSmsPlayAudio.m", 46, @"Invalid parameter not satisfying: %@", @"expressionParserProvider != nil" object file lineNumber description];

LABEL_4:
  v24.receiver = self;
  v24.super_class = (Class)_SVXServiceCommandHandlerSmsPlayAudio;
  v13 = [(_SVXServiceCommandHandlerSmsPlayAudio *)&v24 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_sessionManager, a3);
    objc_storeStrong((id *)&v14->_module, a4);
    objc_storeStrong((id *)&v14->_expressionParserProvider, a5);
    id v15 = [NSString alloc];
    v16 = (objc_class *)[(id)objc_opt_class() supportedCommandClass];
    id v17 = NSStringFromClass(v16);
    uint64_t v18 = [v15 initWithFormat:@"com.apple.SiriVOXService.service-command.%@", v17];
    identifier = v14->_identifier;
    v14->_identifier = (NSString *)v18;
  }
  return v14;
}

- (_SVXServiceCommandHandlerSmsPlayAudio)initWithSessionManager:(id)a3 module:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(_SVXPlayAudioExpressionParserProvider);
  id v9 = [(_SVXServiceCommandHandlerSmsPlayAudio *)self initWithSessionManager:v7 module:v6 expressionParserProvider:v8];

  return v9;
}

+ (Class)supportedCommandClass
{
  return (Class)objc_opt_class();
}

@end