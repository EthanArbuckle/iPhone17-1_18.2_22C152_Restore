@interface PREResponsesClient
+ (id)sharedInstance;
- (PREResponsesClient)init;
- (id)_remoteObjectProxy;
- (void)preResponseItemsForMessage:(id)a3 maximumResponses:(unint64_t)a4 conversationTurns:(id)a5 context:(id)a6 time:(id)a7 language:(id)a8 recipientHandles:(id)a9 modelFilePath:(id)a10 modelConfigPath:(id)a11 espressoBinFilePath:(id)a12 vocabFilePath:(id)a13 registerDisplayed:(BOOL)a14 includeCustomResponses:(BOOL)a15 includeResponsesToRobots:(BOOL)a16 completion:(id)a17;
- (void)predictForMessage:(id)a3 conversationTurns:(id)a4 language:(id)a5 plistPath:(id)a6 espressoBinPath:(id)a7 vocabPath:(id)a8 heads:(id)a9 completion:(id)a10;
- (void)registerResponse:(id)a3 position:(id)a4 isCanned:(BOOL)a5 isUsingQuickResponses:(BOOL)a6 locale:(id)a7 modelConfigPath:(id)a8 vocabPath:(id)a9;
@end

@implementation PREResponsesClient

- (void).cxx_destruct
{
}

- (void)registerResponse:(id)a3 position:(id)a4 isCanned:(BOOL)a5 isUsingQuickResponses:(BOOL)a6 locale:(id)a7 modelConfigPath:(id)a8 vocabPath:(id)a9
{
  BOOL v11 = a6;
  BOOL v12 = a5;
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a4;
  id v20 = a3;
  v21 = pre_responses_handle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA622000, v21, OS_LOG_TYPE_DEFAULT, "PREResponsesClient initiating call to suggestd - registerResponse", buf, 2u);
  }

  v22 = [(PREResponsesClient *)self _remoteObjectProxy];
  [v22 registerResponse:v20 position:v19 isCanned:v12 isUsingQuickResponses:v11 locale:v18 modelConfigPath:v17 vocabPath:v16];
}

- (void)predictForMessage:(id)a3 conversationTurns:(id)a4 language:(id)a5 plistPath:(id)a6 espressoBinPath:(id)a7 vocabPath:(id)a8 heads:(id)a9 completion:(id)a10
{
  id v17 = a10;
  id v18 = a9;
  id v19 = a8;
  id v20 = a7;
  id v21 = a6;
  id v22 = a5;
  id v23 = a4;
  id v24 = a3;
  v25 = pre_responses_handle();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA622000, v25, OS_LOG_TYPE_DEFAULT, "PREResponsesClient initiating call to suggestd - predictForMessage", buf, 2u);
  }

  v26 = [(PREResponsesClient *)self _remoteObjectProxy];
  [v26 predictForMessage:v24 conversationTurns:v23 language:v22 plistPath:v21 espressoBinPath:v20 vocabPath:v19 heads:v18 completion:v17];
}

- (void)preResponseItemsForMessage:(id)a3 maximumResponses:(unint64_t)a4 conversationTurns:(id)a5 context:(id)a6 time:(id)a7 language:(id)a8 recipientHandles:(id)a9 modelFilePath:(id)a10 modelConfigPath:(id)a11 espressoBinFilePath:(id)a12 vocabFilePath:(id)a13 registerDisplayed:(BOOL)a14 includeCustomResponses:(BOOL)a15 includeResponsesToRobots:(BOOL)a16 completion:(id)a17
{
  id v36 = a17;
  id v35 = a13;
  id v34 = a12;
  id v33 = a11;
  id v32 = a10;
  id v31 = a9;
  id v29 = a8;
  id v28 = a7;
  id v22 = a6;
  id v23 = a5;
  id v24 = a3;
  v25 = pre_responses_handle();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA622000, v25, OS_LOG_TYPE_DEFAULT, "PREResponsesClient initiating call to suggestd - preResponseItemsForMessage", buf, 2u);
  }

  v26 = [(PREResponsesClient *)self _remoteObjectProxy];
  BYTE2(v27) = a16;
  LOWORD(v27) = __PAIR16__(a15, a14);
  objc_msgSend(v26, "preResponseItemsForMessage:maximumResponses:conversationTurns:context:time:language:recipientHandles:modelFilePath:modelConfigPath:espressoBinFilePath:vocabFilePath:registerDisplayed:includeCustomResponses:includeResponsesToRobots:completion:", v24, a4, v23, v22, v28, v29, v31, v32, v33, v34, v35, v27, v36);
}

- (id)_remoteObjectProxy
{
  return [(PREXPCClientHelpers *)self->_clientHelpers remoteObjectProxy];
}

- (PREResponsesClient)init
{
  v17.receiver = self;
  v17.super_class = (Class)PREResponsesClient;
  v2 = [(PREResponsesClient *)&v17 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F24ECA60];
    v4 = (void *)MEMORY[0x1CB799590]();
    id v5 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v6 = objc_opt_class();
    v7 = objc_msgSend(v5, "initWithObjects:", v6, objc_opt_class(), 0);
    [v3 setClasses:v7 forSelector:sel_preResponseItemsForMessage_maximumResponses_conversationTurns_context_time_language_recipientHandles_modelFilePath_modelConfigPath_espressoBinFilePath_vocabFilePath_registerDisplayed_includeCustomResponses_includeResponsesToRobots_completion_ argumentIndex:0 ofReply:1];

    v8 = (void *)MEMORY[0x1CB799590]();
    id v9 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v9, "initWithObjects:", v10, v11, v12, objc_opt_class(), 0);
    [v3 setClasses:v13 forSelector:sel_predictForMessage_conversationTurns_language_plistPath_espressoBinPath_vocabPath_heads_completion_ argumentIndex:0 ofReply:1];

    v14 = [[PREXPCClientHelpers alloc] initWithServiceName:@"com.apple.proactive.experiments.responses" whitelistedServerInterface:v3 clientExportedObject:v2 interruptionHandler:&__block_literal_global_1974 invalidationHandler:&__block_literal_global_35];
    clientHelpers = v2->_clientHelpers;
    v2->_clientHelpers = v14;
  }
  return v2;
}

void __26__PREResponsesClient_init__block_invoke_33()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0 = pre_xpc_handle();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 138412290;
    v2 = @"com.apple.proactive.experiments.responses";
    _os_log_impl(&dword_1CA622000, v0, OS_LOG_TYPE_DEFAULT, "Connection to %@ invalidated.", (uint8_t *)&v1, 0xCu);
  }
}

void __26__PREResponsesClient_init__block_invoke()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0 = pre_xpc_handle();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    int v1 = 138412290;
    v2 = @"com.apple.proactive.experiments.responses";
    _os_log_error_impl(&dword_1CA622000, v0, OS_LOG_TYPE_ERROR, "Connection to %@ interrupted.", (uint8_t *)&v1, 0xCu);
  }
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__PREResponsesClient_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken8 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken8, block);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_1983;

  return v2;
}

void __36__PREResponsesClient_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB799590]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_1983;
  sharedInstance__pasExprOnceResult_1983 = v1;
}

@end