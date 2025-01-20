@interface RCPCoreAnalyticsBackedAnalyticsEventSender
- (void)sendEvent:(int64_t)a3;
@end

@implementation RCPCoreAnalyticsBackedAnalyticsEventSender

- (void)sendEvent:(int64_t)a3
{
  v3 = RCPLogPlayback();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A9051000, v3, OS_LOG_TYPE_DEFAULT, "sent analytics event", buf, 2u);
  }

  AnalyticsSendEventLazy();
}

id __56__RCPCoreAnalyticsBackedAnalyticsEventSender_sendEvent___block_invoke(uint64_t a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1 == 1)
  {
    v7 = @"state";
    v8 = @"playbackFinished";
    v2 = (void *)MEMORY[0x1E4F1C9E8];
    v3 = &v8;
    v4 = &v7;
    goto LABEL_5;
  }
  if (!v1)
  {
    v9 = @"state";
    v10[0] = @"recordingFinished";
    v2 = (void *)MEMORY[0x1E4F1C9E8];
    v3 = (__CFString **)v10;
    v4 = &v9;
LABEL_5:
    v5 = [v2 dictionaryWithObjects:v3 forKeys:v4 count:1];
    goto LABEL_7;
  }
  v5 = 0;
LABEL_7:
  return v5;
}

@end