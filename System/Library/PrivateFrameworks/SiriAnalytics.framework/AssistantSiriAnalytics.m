@interface AssistantSiriAnalytics
+ (id)derivedIdentifierForComponentName:(int)a3 fromSourceIdentifier:(id)a4;
+ (id)sharedAnalytics;
+ (id)sharedStream;
+ (void)derivedIdentifierForComponent:(int)a3 fromSourceIdentifier:(id)a4 completion:(id)a5;
- (AssistantSiriAnalytics)init;
- (BOOL)clientMessageStream:(id)a3 shouldEmitMessage:(id)a4 timestamp:(unint64_t)a5 isolatedStreamUUID:(id)a6;
- (void)createTag:(id)a3 completion:(id)a4;
- (void)sensitiveCondition:(int)a3 endedAt:(unint64_t)a4 completion:(id)a5;
- (void)sensitiveCondition:(int)a3 startedAt:(unint64_t)a4 completion:(id)a5;
@end

@implementation AssistantSiriAnalytics

- (void).cxx_destruct
{
}

- (void)createTag:(id)a3 completion:(id)a4
{
  remoteService = self->_remoteService;
  id v6 = a4;
  id v7 = [a3 shim];
  [(SiriAnalyticsRemoteService *)remoteService createTag:v7 completion:v6];
}

- (void)sensitiveCondition:(int)a3 endedAt:(unint64_t)a4 completion:(id)a5
{
}

- (void)sensitiveCondition:(int)a3 startedAt:(unint64_t)a4 completion:(id)a5
{
}

- (BOOL)clientMessageStream:(id)a3 shouldEmitMessage:(id)a4 timestamp:(unint64_t)a5 isolatedStreamUUID:(id)a6
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v8 = v7;
  if (self->_isInternalInstall || ![v7 isProvisional])
  {
    BOOL v10 = 1;
  }
  else
  {
    if (SiriAnalyticsLoggingInit_once != -1) {
      dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
    }
    v9 = SiriAnalyticsLogContextAssistant;
    if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextAssistant, OS_LOG_TYPE_INFO))
    {
      int v12 = 136315394;
      v13 = "-[AssistantSiriAnalytics clientMessageStream:shouldEmitMessage:timestamp:isolatedStreamUUID:]";
      __int16 v14 = 2112;
      v15 = v8;
      _os_log_impl(&dword_1A2B39000, v9, OS_LOG_TYPE_INFO, "%s Dropping provisional message: %@ for seed/customer images.", (uint8_t *)&v12, 0x16u);
    }
    BOOL v10 = 0;
  }

  return v10;
}

- (AssistantSiriAnalytics)init
{
  v9.receiver = self;
  v9.super_class = (Class)AssistantSiriAnalytics;
  v2 = [(AssistantSiriAnalytics *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.siri.analytics.assistant", v3);
    v5 = [[SiriAnalyticsRemoteService alloc] initWithMachServiceName:@"com.apple.siri.analytics.assistant"];
    remoteService = v2->_remoteService;
    v2->_remoteService = v5;

    id v7 = [[SiriAnalyticsClientMessageStream alloc] initWithQueue:v4 analyticsService:v2->_remoteService delegate:v2];
    [(SiriAnalyticsClient *)v2 setDefaultMessageStream:v7];
    if (SiriAnalyticsIsInternalInstall_onceToken != -1) {
      dispatch_once(&SiriAnalyticsIsInternalInstall_onceToken, &__block_literal_global_932);
    }
    v2->_isInternalInstall = SiriAnalyticsIsInternalInstall_isInternal;
  }
  return v2;
}

+ (id)derivedIdentifierForComponentName:(int)a3 fromSourceIdentifier:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = @"COMPONENTNAME_ORCHESTRATOR";
  switch(a3)
  {
    case 0:
      if (SiriAnalyticsLoggingInit_once != -1) {
        dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
      }
      id v7 = SiriAnalyticsLogContextAssistant;
      if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextAssistant, OS_LOG_TYPE_ERROR))
      {
        int v15 = 136315138;
        uint64_t v16 = "+[AssistantSiriAnalytics derivedIdentifierForComponentName:fromSourceIdentifier:]";
        _os_log_error_impl(&dword_1A2B39000, v7, OS_LOG_TYPE_ERROR, "%s Unknown component name provided", (uint8_t *)&v15, 0xCu);
      }
      v8 = 0;
      goto LABEL_77;
    case 1:
      goto LABEL_69;
    case 2:
      id v6 = @"COMPONENTNAME_UEI";
      goto LABEL_69;
    case 3:
      id v6 = @"COMPONENTNAME_FLOW";
      goto LABEL_69;
    case 4:
      id v6 = @"COMPONENTNAME_CAM";
      goto LABEL_69;
    case 5:
      id v6 = @"COMPONENTNAME_GRR";
      goto LABEL_69;
    case 6:
      id v6 = @"COMPONENTNAME_MODALITY";
      goto LABEL_69;
    case 7:
      id v6 = @"COMPONENTNAME_NLX";
      goto LABEL_69;
    case 8:
      id v6 = @"COMPONENTNAME_ASR";
      goto LABEL_69;
    case 9:
      id v6 = @"COMPONENTNAME_MH";
      goto LABEL_69;
    case 10:
      id v6 = @"COMPONENTNAME_IH";
      goto LABEL_69;
    case 11:
      id v6 = @"COMPONENTNAME_NONE";
      goto LABEL_69;
    case 12:
      id v6 = @"COMPONENTNAME_ANNOUNCE";
      goto LABEL_69;
    case 13:
      id v6 = @"COMPONENTNAME_TTS";
      goto LABEL_69;
    case 14:
      id v6 = @"COMPONENTNAME_CONVERSATION";
      goto LABEL_69;
    case 15:
      id v6 = @"COMPONENTNAME_REFERENCE_RESOLUTION";
      goto LABEL_69;
    case 16:
      id v6 = @"COMPONENTNAME_CURARE";
      goto LABEL_69;
    case 17:
      id v6 = @"COMPONENTNAME_HAL";
      goto LABEL_69;
    case 18:
      id v6 = @"COMPONENTNAME_NETWORK";
      goto LABEL_69;
    case 19:
      id v6 = @"COMPONENTNAME_PLUS";
      goto LABEL_69;
    case 20:
      id v6 = @"COMPONENTNAME_SIRI_STATES";
      goto LABEL_69;
    case 21:
      id v6 = @"COMPONENTNAME_POMMES";
      goto LABEL_69;
    case 22:
      id v6 = @"COMPONENTNAME_GROUP_ACTIVITY";
      goto LABEL_69;
    case 23:
      id v6 = @"COMPONENTNAME_CDA";
      goto LABEL_69;
    case 24:
      id v6 = @"COMPONENTNAME_PEGASUS";
      goto LABEL_69;
    case 25:
      id v6 = @"COMPONENTNAME_MWT";
      goto LABEL_69;
    case 26:
      id v6 = @"COMPONENTNAME_SUT";
      goto LABEL_69;
    case 27:
      id v6 = @"COMPONENTNAME_INFERENCE";
      goto LABEL_69;
    case 28:
      id v6 = @"COMPONENTNAME_RF";
      goto LABEL_69;
    case 29:
      id v6 = @"COMPONENTNAME_SIC";
      goto LABEL_69;
    case 30:
      id v6 = @"COMPONENTNAME_CAAR";
      goto LABEL_69;
    case 31:
      id v6 = @"COMPONENTNAME_SIRI_CORRECTIONS";
      goto LABEL_69;
    case 32:
      id v6 = @"COMPONENTNAME_SIRI_SUGGESTIONS";
      goto LABEL_69;
    case 33:
      id v6 = @"COMPONENTNAME_SIRI_SETUP";
      goto LABEL_69;
    case 34:
      id v6 = @"COMPONENTNAME_ACTIVATION";
      goto LABEL_69;
    case 35:
      id v6 = @"COMPONENTNAME_IA";
      goto LABEL_69;
    case 36:
      id v6 = @"COMPONENTNAME_NLG";
      goto LABEL_69;
    case 37:
      id v6 = @"COMPONENTNAME_TTM";
      goto LABEL_69;
    case 38:
      id v6 = @"COMPONENTNAME_IDENTITY";
      goto LABEL_69;
    case 39:
      id v6 = @"COMPONENTNAME_HOMEKIT";
      goto LABEL_69;
    case 40:
      id v6 = @"COMPONENTNAME_READ";
      goto LABEL_69;
    case 41:
      id v6 = @"COMPONENTNAME_RTS";
      goto LABEL_69;
    case 42:
      id v6 = @"COMPONENTNAME_NLROUTER";
      goto LABEL_69;
    case 43:
      id v6 = @"COMPONENTNAME_ORCH_SUBREQUEST";
      goto LABEL_69;
    case 44:
      id v6 = @"COMPONENTNAME_SIRI_SELF_REFLECTION";
      goto LABEL_69;
    case 45:
      id v6 = @"COMPONENTNAME_IF_REQUEST";
      goto LABEL_69;
    case 46:
      id v6 = @"COMPONENTNAME_TRACE";
      goto LABEL_69;
    case 47:
      id v6 = @"COMPONENTNAME_CACHE_MANAGER";
      goto LABEL_69;
    case 48:
      id v6 = @"COMPONENTNAME_PNR_ON_DEVICE";
      goto LABEL_69;
    case 49:
      id v6 = @"COMPONENTNAME_JOINT_RESOLVER";
      goto LABEL_69;
    case 50:
      id v6 = @"COMPONENTNAME_QUERY_DECORATION";
      goto LABEL_69;
    case 51:
      id v6 = @"COMPONENTNAME_PLAN_GENERATION";
      goto LABEL_69;
    case 52:
      id v6 = @"COMPONENTNAME_DIALOGENGINE";
      goto LABEL_69;
    case 53:
      id v6 = @"COMPONENTNAME_IF_SESSION";
      goto LABEL_69;
    case 54:
      id v6 = @"COMPONENTNAME_FEEDBACK_LEARNING";
      goto LABEL_69;
    case 55:
      id v6 = @"COMPONENTNAME_SEARCH_TOOL";
      goto LABEL_69;
    case 56:
      id v6 = @"COMPONENTNAME_GAT";
      goto LABEL_69;
    case 57:
      id v6 = @"COMPONENTNAME_RG";
      goto LABEL_69;
    case 58:
      id v6 = @"COMPONENTNAME_IF_EXECUTOR";
      goto LABEL_69;
    case 59:
      id v6 = @"COMPONENTNAME_IF_PLAN_RESOLUTION";
      goto LABEL_69;
    case 61:
      id v6 = @"COMPONENTNAME_IF_PLAN_GENERATION";
      goto LABEL_69;
    case 62:
      id v6 = @"COMPONENTNAME_GMS";
      goto LABEL_69;
    case 63:
      id v6 = @"COMPONENTNAME_CLOUDKIT";
      goto LABEL_69;
    default:
      id v6 = @"COMPONENTNAME_UNKNOWN";
LABEL_69:
      objc_super v9 = (void *)MEMORY[0x1E4F29128];
      BOOL v10 = [@"SiriAnalytics.Component" dataUsingEncoding:4];
      v11 = [(__CFString *)v6 dataUsingEncoding:4];
      int v12 = objc_msgSend(v9, "sa_deterministicUUIDv5ForNamespace:name:", v10, v11);

      if (v12)
      {
        v8 = objc_msgSend(MEMORY[0x1E4F29128], "sa_deterministicUUIDv5ForNamespaceUUID:sourceUUID:", v12, v5);
      }
      else
      {
        if (SiriAnalyticsLoggingInit_once != -1) {
          dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
        }
        v13 = SiriAnalyticsLogContextAssistant;
        if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextAssistant, OS_LOG_TYPE_ERROR))
        {
          int v15 = 136315394;
          uint64_t v16 = "+[AssistantSiriAnalytics derivedIdentifierForComponentName:fromSourceIdentifier:]";
          __int16 v17 = 1024;
          int v18 = a3;
          _os_log_error_impl(&dword_1A2B39000, v13, OS_LOG_TYPE_ERROR, "%s ComponentName: %d did not map to a component identifier", (uint8_t *)&v15, 0x12u);
        }
        v8 = 0;
      }

LABEL_77:
      return v8;
  }
}

+ (void)derivedIdentifierForComponent:(int)a3 fromSourceIdentifier:(id)a4 completion:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __88__AssistantSiriAnalytics_derivedIdentifierForComponent_fromSourceIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E5AC0678;
  id v15 = v8;
  id v9 = v8;
  id v10 = a4;
  v11 = (void (**)(void *, void))_Block_copy(aBlock);
  int v12 = [a1 derivedIdentifierForComponent:v6 fromSourceIdentifier:v10];

  if (v12) {
    v13 = v12;
  }
  else {
    v13 = 0;
  }
  ((void (**)(void *, void *))v11)[2](v11, v13);
}

uint64_t __88__AssistantSiriAnalytics_derivedIdentifierForComponent_fromSourceIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

+ (id)sharedStream
{
  v2 = +[AssistantSiriAnalytics sharedAnalytics];
  v3 = [v2 defaultMessageStream];

  return v3;
}

+ (id)sharedAnalytics
{
  if (sharedAnalytics_onceToken != -1) {
    dispatch_once(&sharedAnalytics_onceToken, &__block_literal_global_1556);
  }
  v2 = (void *)sharedAnalytics_shared;
  return v2;
}

uint64_t __41__AssistantSiriAnalytics_sharedAnalytics__block_invoke()
{
  sharedAnalytics_shared = objc_alloc_init(AssistantSiriAnalytics);
  return MEMORY[0x1F41817F8]();
}

@end