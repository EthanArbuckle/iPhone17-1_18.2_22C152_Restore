@interface AssistantSiriAnalyticsClockWatcher
- (AssistantSiriAnalyticsClockWatcher)init;
- (AssistantSiriAnalyticsClockWatcher)initWithInternalTelemetry:(id)a3 sensitiveConditionsObservers:(id)a4 clientMessageStream:(id)a5 preprocessor:(id)a6 metastore:(id)a7 scheduler:(id)a8 dataPolicyObserver:(id)a9;
- (void)_triggerDeviceFixedContextOnStreamUUID:(id)a3;
- (void)_triggerSiriAccountInformation;
- (void)whiteRose:(id)a3 derivativeClockCreated:(id)a4 rootClock:(id)a5;
- (void)whiteRose:(id)a3 rootClockCreated:(id)a4;
- (void)whiteRose:(id)a3 rootClockDestroyed:(id)a4 reason:(unint64_t)a5 completion:(id)a6;
- (void)whiteRose:(id)a3 willCreateRootClock:(id)a4 completion:(id)a5;
@end

@implementation AssistantSiriAnalyticsClockWatcher

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataPolicyObserver, 0);
  objc_storeStrong((id *)&self->_inactivityScheduler, 0);
  objc_storeStrong((id *)&self->_metastore, 0);
  objc_storeStrong((id *)&self->_preprocessor, 0);
  objc_storeStrong((id *)&self->_clientMessageStream, 0);
  objc_storeStrong((id *)&self->_sensitiveConditionsObservers, 0);
  objc_storeStrong((id *)&self->_internalTelemetry, 0);
}

- (void)_triggerSiriAccountInformation
{
  id v4 = objc_alloc_init(MEMORY[0x1E4FA03F0]);
  id v3 = objc_alloc_init(MEMORY[0x1E4FA0400]);
  [v4 setSiriAccountInformation:v3];

  [(SiriAnalyticsClientMessageStream *)self->_clientMessageStream resolvePartialMessage:v4];
}

- (void)_triggerDeviceFixedContextOnStreamUUID:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4FA03F0];
  id v5 = a3;
  id v12 = objc_alloc_init(v4);
  id v6 = objc_alloc_init(MEMORY[0x1E4FA03F8]);
  [v12 setDeviceFixedContext:v6];

  v7 = [v12 deviceFixedContext];
  v8 = [MEMORY[0x1E4F1C9C8] date];
  [v8 timeIntervalSince1970];
  objc_msgSend(v7, "setTimeIntervalSince1970:");

  v9 = [v12 deviceFixedContext];
  v10 = [MEMORY[0x1E4F28F80] processInfo];
  objc_msgSend(v9, "setIsLowPowerModeEnabled:", objc_msgSend(v10, "isLowPowerModeEnabled"));

  v11 = [v12 deviceFixedContext];
  [v11 setProgramCode:1];

  [(SiriAnalyticsClientMessageStream *)self->_clientMessageStream resolvePartialMessage:v12 isolatedStreamUUID:v5];
}

- (void)whiteRose:(id)a3 derivativeClockCreated:(id)a4 rootClock:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  v9 = SiriAnalyticsLogContextAssistant;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextAssistant, OS_LOG_TYPE_INFO))
  {
    int v15 = 136315650;
    v16 = "-[AssistantSiriAnalyticsClockWatcher whiteRose:derivativeClockCreated:rootClock:]";
    __int16 v17 = 2112;
    id v18 = v7;
    __int16 v19 = 2112;
    id v20 = v8;
    _os_log_impl(&dword_1A2B39000, v9, OS_LOG_TYPE_INFO, "%s Derivative clock created: %@ from parent: %@, triggering partial global dimension logging", (uint8_t *)&v15, 0x20u);
  }
  v10 = [v7 isolatedStreamUUID];
  [(AssistantSiriAnalyticsClockWatcher *)self _triggerDeviceFixedContextOnStreamUUID:v10];

  metastore = self->_metastore;
  id v12 = [v7 clockIdentifier];
  v13 = [v8 clockIdentifier];
  v14 = [v7 clockStatistics];
  -[SiriAnalyticsMetastore createClock:rootClockIdentifier:startedOn:](metastore, "createClock:rootClockIdentifier:startedOn:", v12, v13, [v14 startedOn]);
}

- (void)whiteRose:(id)a3 rootClockDestroyed:(id)a4 reason:(unint64_t)a5 completion:(id)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v24 = a6;
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  v10 = SiriAnalyticsLogContextAssistant;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextAssistant, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v31 = "-[AssistantSiriAnalyticsClockWatcher whiteRose:rootClockDestroyed:reason:completion:]";
    __int16 v32 = 2112;
    id v33 = v9;
    _os_log_impl(&dword_1A2B39000, v10, OS_LOG_TYPE_INFO, "%s Clock destroyed: %@", buf, 0x16u);
  }
  [(SiriAnalyticsInternalTelemetry *)self->_internalTelemetry trackLogicalClock:v9];
  metastore = self->_metastore;
  id v12 = [v9 clockIdentifier];
  v13 = [v9 clockStatistics];
  -[SiriAnalyticsMetastore endClock:endedOn:endedReason:](metastore, "endClock:endedOn:endedReason:", v12, [v13 endedOn], a5);

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v14 = [v9 derivativeClocks];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(v14);
        }
        __int16 v19 = self->_metastore;
        id v20 = [*(id *)(*((void *)&v25 + 1) + 8 * i) clockIdentifier];
        uint64_t v21 = [v9 clockStatistics];
        -[SiriAnalyticsMetastore endClock:endedOn:endedReason:](v19, "endClock:endedOn:endedReason:", v20, [v21 endedOn], a5);
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v16);
  }

  [(SiriAnalyticsMetastore *)self->_metastore checkpoint];
  inactivityScheduler = self->_inactivityScheduler;
  if (inactivityScheduler)
  {
    v23 = v24;
    if (a5 == 3)
    {
      [(SiriAnalyticsClockInactivityScheduler *)inactivityScheduler destroyInactivityTimer];
      [(SiriAnalyticsPreprocessor *)self->_preprocessor triggerWithReason:2 completion:v24];
    }
    else
    {
      [(SiriAnalyticsClockInactivityScheduler *)inactivityScheduler clockExpiredWithCompletion:v24];
    }
  }
  else
  {
    v23 = v24;
    (*((void (**)(id))v24 + 2))(v24);
  }
}

- (void)whiteRose:(id)a3 rootClockCreated:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  id v6 = SiriAnalyticsLogContextAssistant;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextAssistant, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v16 = "-[AssistantSiriAnalyticsClockWatcher whiteRose:rootClockCreated:]";
    __int16 v17 = 2112;
    id v18 = v5;
    _os_log_impl(&dword_1A2B39000, v6, OS_LOG_TYPE_INFO, "%s Clock created: %@, triggering global dimension logging", buf, 0x16u);
  }
  [(SiriAnalyticsClockInactivityScheduler *)self->_inactivityScheduler clockCreated];
  [(AssistantSiriAnalyticsClockWatcher *)self _triggerDeviceFixedContextOnStreamUUID:0];
  [(AssistantSiriAnalyticsClockWatcher *)self _triggerSiriAccountInformation];
  if (v5)
  {
    metastore = self->_metastore;
    id v8 = [v5 clockIdentifier];
    id v9 = [v5 clockStatistics];
    -[SiriAnalyticsMetastore createClock:rootClockIdentifier:startedOn:](metastore, "createClock:rootClockIdentifier:startedOn:", v8, 0, [v9 startedOn]);
  }
  dataPolicyObserver = self->_dataPolicyObserver;
  v11 = [v5 clockIdentifier];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65__AssistantSiriAnalyticsClockWatcher_whiteRose_rootClockCreated___block_invoke;
  v13[3] = &unk_1E5AC05B0;
  id v14 = v5;
  id v12 = v5;
  [(SiriAnalyticsDataCollectionPolicyClockObserver *)dataPolicyObserver rootClockCreatedWithClockIdentifier:v11 completion:v13];
}

void __65__AssistantSiriAnalyticsClockWatcher_whiteRose_rootClockCreated___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  v2 = (void *)SiriAnalyticsLogContextAssistant;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextAssistant, OS_LOG_TYPE_INFO))
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = v2;
    id v5 = [v3 clockIdentifier];
    int v6 = 136315394;
    id v7 = "-[AssistantSiriAnalyticsClockWatcher whiteRose:rootClockCreated:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v5;
    _os_log_impl(&dword_1A2B39000, v4, OS_LOG_TYPE_INFO, "%s Finished checking data policy for: %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)whiteRose:(id)a3 willCreateRootClock:(id)a4 completion:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__AssistantSiriAnalyticsClockWatcher_whiteRose_willCreateRootClock_completion___block_invoke;
  aBlock[3] = &unk_1E5AC06A0;
  id v9 = v8;
  id v15 = v9;
  uint64_t v10 = (void (**)(void))_Block_copy(aBlock);
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  v11 = SiriAnalyticsLogContextAssistant;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextAssistant, OS_LOG_TYPE_INFO))
  {
    sensitiveConditionsObservers = self->_sensitiveConditionsObservers;
    *(_DWORD *)buf = 136315650;
    __int16 v17 = "-[AssistantSiriAnalyticsClockWatcher whiteRose:willCreateRootClock:completion:]";
    __int16 v18 = 2112;
    id v19 = v7;
    __int16 v20 = 2112;
    uint64_t v21 = sensitiveConditionsObservers;
    _os_log_impl(&dword_1A2B39000, v11, OS_LOG_TYPE_INFO, "%s Will create: %@, fetching sensitive conditions from %@", buf, 0x20u);
  }
  v13 = self->_sensitiveConditionsObservers;
  if (v13) {
    [(SiriAnalyticsSensitiveConditionsObservers *)v13 pollAllObserversWithCompletion:v10];
  }
  else {
    v10[2](v10);
  }
}

uint64_t __79__AssistantSiriAnalyticsClockWatcher_whiteRose_willCreateRootClock_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (AssistantSiriAnalyticsClockWatcher)initWithInternalTelemetry:(id)a3 sensitiveConditionsObservers:(id)a4 clientMessageStream:(id)a5 preprocessor:(id)a6 metastore:(id)a7 scheduler:(id)a8 dataPolicyObserver:(id)a9
{
  id v25 = a3;
  id v24 = a4;
  id v23 = a5;
  id v22 = a6;
  id v21 = a7;
  id v16 = a8;
  id v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)AssistantSiriAnalyticsClockWatcher;
  __int16 v18 = [(AssistantSiriAnalyticsClockWatcher *)&v26 init];
  id v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_internalTelemetry, a3);
    objc_storeStrong((id *)&v19->_sensitiveConditionsObservers, a4);
    objc_storeStrong((id *)&v19->_clientMessageStream, a5);
    objc_storeStrong((id *)&v19->_preprocessor, a6);
    objc_storeStrong((id *)&v19->_metastore, a7);
    objc_storeStrong((id *)&v19->_inactivityScheduler, a8);
    objc_storeStrong((id *)&v19->_dataPolicyObserver, a9);
  }

  return v19;
}

- (AssistantSiriAnalyticsClockWatcher)init
{
  return 0;
}

@end