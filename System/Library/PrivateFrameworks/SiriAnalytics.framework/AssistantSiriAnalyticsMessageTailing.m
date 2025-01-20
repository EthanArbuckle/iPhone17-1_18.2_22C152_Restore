@interface AssistantSiriAnalyticsMessageTailing
- (AssistantSiriAnalyticsMessageTailing)init;
- (AssistantSiriAnalyticsMessageTailing)initWithPreferences:(id)a3;
- (void)_tailMessage:(id)a3;
- (void)_tailMessage:(id)a3 timestamp:(unint64_t)a4 messageUUID:(id)a5 clockIdentifier:(id)a6;
- (void)_tailMessages:(id)a3;
- (void)tailAnyEvents:(id)a3;
- (void)tailMessage:(id)a3;
- (void)tailMessage:(id)a3 timestamp:(unint64_t)a4 messageUUID:(id)a5 clockIdentifier:(id)a6;
- (void)tailMessages:(id)a3;
@end

@implementation AssistantSiriAnalyticsMessageTailing

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageTailingQueue, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
}

- (void)_tailMessage:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  v4 = (void *)SiriAnalyticsLogContextMessageTailing;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextMessageTailing, OS_LOG_TYPE_DEBUG))
  {
    v5 = v4;
    v6 = objc_opt_class();
    id v7 = v6;
    v8 = [v3 formattedJsonBody];
    int v9 = 136315650;
    v10 = "-[AssistantSiriAnalyticsMessageTailing _tailMessage:]";
    __int16 v11 = 2112;
    v12 = v6;
    __int16 v13 = 2112;
    v14 = v8;
    _os_log_debug_impl(&dword_1A2B39000, v5, OS_LOG_TYPE_DEBUG, "%s %@ %@", (uint8_t *)&v9, 0x20u);
  }
}

- (void)tailMessage:(id)a3
{
  id v4 = a3;
  messageTailingQueue = self->_messageTailingQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__AssistantSiriAnalyticsMessageTailing_tailMessage___block_invoke;
  v7[3] = &unk_1E5AC0530;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(messageTailingQueue, v7);
}

uint64_t __52__AssistantSiriAnalyticsMessageTailing_tailMessage___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _tailMessage:*(void *)(a1 + 40)];
}

- (void)_tailMessage:(id)a3 timestamp:(unint64_t)a4 messageUUID:(id)a5 clockIdentifier:(id)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  v12 = (void *)SiriAnalyticsLogContextMessageTailing;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextMessageTailing, OS_LOG_TYPE_DEBUG))
  {
    __int16 v13 = NSNumber;
    v14 = v12;
    uint64_t v15 = [v13 numberWithUnsignedLongLong:a4];
    v16 = objc_opt_class();
    id v17 = v16;
    v18 = [v9 formattedJsonBody];
    int v19 = 136316418;
    v20 = "-[AssistantSiriAnalyticsMessageTailing _tailMessage:timestamp:messageUUID:clockIdentifier:]";
    __int16 v21 = 2112;
    v22 = v15;
    __int16 v23 = 2112;
    id v24 = v11;
    __int16 v25 = 2112;
    v26 = v16;
    __int16 v27 = 2112;
    id v28 = v10;
    __int16 v29 = 2112;
    v30 = v18;
    _os_log_debug_impl(&dword_1A2B39000, v14, OS_LOG_TYPE_DEBUG, "%s %@ <%@> : %@<%@> %@", (uint8_t *)&v19, 0x3Eu);
  }
}

- (void)tailMessage:(id)a3 timestamp:(unint64_t)a4 messageUUID:(id)a5 clockIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  messageTailingQueue = self->_messageTailingQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__AssistantSiriAnalyticsMessageTailing_tailMessage_timestamp_messageUUID_clockIdentifier___block_invoke;
  block[3] = &unk_1E5AC0600;
  block[4] = self;
  id v18 = v10;
  id v20 = v12;
  unint64_t v21 = a4;
  id v19 = v11;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(messageTailingQueue, block);
}

uint64_t __90__AssistantSiriAnalyticsMessageTailing_tailMessage_timestamp_messageUUID_clockIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _tailMessage:*(void *)(a1 + 40) timestamp:*(void *)(a1 + 64) messageUUID:*(void *)(a1 + 48) clockIdentifier:*(void *)(a1 + 56)];
}

- (void)tailAnyEvents:(id)a3
{
  id v4 = a3;
  messageTailingQueue = self->_messageTailingQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__AssistantSiriAnalyticsMessageTailing_tailAnyEvents___block_invoke;
  v7[3] = &unk_1E5AC0530;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(messageTailingQueue, v7);
}

void __54__AssistantSiriAnalyticsMessageTailing_tailAnyEvents___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v6), "unwrap", (void)v8);
        [*(id *)(a1 + 40) _tailMessage:v7];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)_tailMessages:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = a3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(obj);
        }
        long long v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        long long v9 = [v8 underlyingMessage];
        long long v10 = [v8 logicalTimestamp];
        uint64_t v11 = [v10 nanoSecondsSinceBoot];
        id v12 = [v8 messageUUID];
        uint64_t v13 = [v8 logicalTimestamp];
        id v14 = [v13 clockIdentifier];
        [(AssistantSiriAnalyticsMessageTailing *)self _tailMessage:v9 timestamp:v11 messageUUID:v12 clockIdentifier:v14];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }
}

- (void)tailMessages:(id)a3
{
  id v4 = a3;
  messageTailingQueue = self->_messageTailingQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__AssistantSiriAnalyticsMessageTailing_tailMessages___block_invoke;
  v7[3] = &unk_1E5AC0530;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(messageTailingQueue, v7);
}

uint64_t __53__AssistantSiriAnalyticsMessageTailing_tailMessages___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _tailMessages:*(void *)(a1 + 40)];
}

- (AssistantSiriAnalyticsMessageTailing)initWithPreferences:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (SiriAnalyticsIsInternalInstall_onceToken != -1) {
    dispatch_once(&SiriAnalyticsIsInternalInstall_onceToken, &__block_literal_global_932);
  }
  if (SiriAnalyticsIsInternalInstall_isInternal && ([v5 tailMessagesToOSLogEnabled] & 1) != 0)
  {
    v16.receiver = self;
    v16.super_class = (Class)AssistantSiriAnalyticsMessageTailing;
    id v6 = [(AssistantSiriAnalyticsMessageTailing *)&v16 init];
    id v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_preferences, a3);
      if (SiriAnalyticsLoggingInit_once != -1) {
        dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
      }
      id v8 = SiriAnalyticsLogContextMessageTailing;
      if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextMessageTailing, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        long long v18 = "-[AssistantSiriAnalyticsMessageTailing initWithPreferences:]";
        _os_log_debug_impl(&dword_1A2B39000, v8, OS_LOG_TYPE_DEBUG, "%s Adding message subscription for writing to syslog", buf, 0xCu);
      }
      long long v9 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
      dispatch_queue_t v10 = dispatch_queue_create("AssistantSiriAnalytics.message.tailing", v9);
      messageTailingQueue = v7->_messageTailingQueue;
      v7->_messageTailingQueue = (OS_dispatch_queue *)v10;
    }
    self = v7;
    id v12 = self;
  }
  else
  {
    if (SiriAnalyticsLoggingInit_once != -1) {
      dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
    }
    uint64_t v13 = (void *)SiriAnalyticsLogContextMessageTailing;
    if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextMessageTailing, OS_LOG_TYPE_DEBUG))
    {
      id v15 = v13;
      if (SiriAnalyticsIsInternalInstall_onceToken != -1) {
        dispatch_once(&SiriAnalyticsIsInternalInstall_onceToken, &__block_literal_global_932);
      }
      *(_DWORD *)buf = 136315650;
      long long v18 = "-[AssistantSiriAnalyticsMessageTailing initWithPreferences:]";
      __int16 v19 = 1024;
      int v20 = SiriAnalyticsIsInternalInstall_isInternal;
      __int16 v21 = 1024;
      int v22 = [v5 tailMessagesToOSLogEnabled];
      _os_log_debug_impl(&dword_1A2B39000, v15, OS_LOG_TYPE_DEBUG, "%s Not tailing messages to syslog (internal image: %d, tailing preference enabled:%d)", buf, 0x18u);
    }
    id v12 = 0;
  }

  return v12;
}

- (AssistantSiriAnalyticsMessageTailing)init
{
  return 0;
}

@end