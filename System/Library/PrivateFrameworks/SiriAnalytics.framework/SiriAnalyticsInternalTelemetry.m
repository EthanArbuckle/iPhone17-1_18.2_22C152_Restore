@interface SiriAnalyticsInternalTelemetry
- (SiriAnalyticsInternalTelemetry)initWithPreferences:(id)a3;
- (void)_trackLogicalClock:(id)a3 isDerivativeClock:(BOOL)a4;
- (void)trackAnyEventEmitted:(id)a3;
- (void)trackEmittedEvents:(id)a3;
- (void)trackEventEmitted:(id)a3;
- (void)trackFBFError:(int)a3 forEventData:(id)a4;
- (void)trackLogicalClock:(id)a3;
- (void)trackMessageStagedWithSuccess:(BOOL)a3;
- (void)trackMessageStreamProcessed:(int64_t)a3 timeToFirstMessage:(int64_t)a4 messageCount:(unint64_t)a5 processingReason:(id)a6 failureReason:(id)a7;
- (void)trackRuntimeBootstrapCompleteWithBootstrapTimeInNs:(unint64_t)a3;
- (void)trackRuntimeBootstrapWithKillSwitchEnabled:(BOOL)a3;
@end

@implementation SiriAnalyticsInternalTelemetry

- (void)trackRuntimeBootstrapCompleteWithBootstrapTimeInNs:(unint64_t)a3
{
}

id __85__SiriAnalyticsInternalTelemetry_trackRuntimeBootstrapCompleteWithBootstrapTimeInNs___block_invoke(uint64_t a1)
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v11[0] = @"hourOfDay";
  v2 = NSNumber;
  v3 = [MEMORY[0x1E4F1C9C8] date];
  v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v5 = [v4 components:32 fromDate:v3];
  uint64_t v6 = [v5 hour];

  v7 = [v2 numberWithInteger:v6];
  v11[1] = @"bootstrapTimeInNs";
  v12[0] = v7;
  v8 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 32)];
  v12[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];

  return v9;
}

- (void)trackRuntimeBootstrapWithKillSwitchEnabled:(BOOL)a3
{
}

id __77__SiriAnalyticsInternalTelemetry_trackRuntimeBootstrapWithKillSwitchEnabled___block_invoke(uint64_t a1)
{
  void v11[2] = *MEMORY[0x1E4F143B8];
  v10[0] = @"killSwitchEnabled";
  v1 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 32)];
  v10[1] = @"hourOfDay";
  v11[0] = v1;
  v2 = NSNumber;
  v3 = [MEMORY[0x1E4F1C9C8] date];
  v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v5 = [v4 components:32 fromDate:v3];
  uint64_t v6 = [v5 hour];

  v7 = [v2 numberWithInteger:v6];
  v11[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];

  return v8;
}

- (void)trackMessageStagedWithSuccess:(BOOL)a3
{
}

id __64__SiriAnalyticsInternalTelemetry_trackMessageStagedWithSuccess___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v4 = @"success";
  v1 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 32)];
  v5[0] = v1;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)trackFBFError:(int)a3 forEventData:(id)a4
{
  id v5 = a4;
  id v4 = v5;
  AnalyticsSendEventLazy();
}

id __61__SiriAnalyticsInternalTelemetry_trackFBFError_forEventData___block_invoke(uint64_t a1)
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"eventSize";
  v2 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "length"));
  v6[1] = @"errorEnum";
  v7[0] = v2;
  v3 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  v7[1] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (void)trackMessageStreamProcessed:(int64_t)a3 timeToFirstMessage:(int64_t)a4 messageCount:(unint64_t)a5 processingReason:(id)a6 failureReason:(id)a7
{
  id v8 = a6;
  id v11 = a7;
  id v9 = v11;
  id v10 = v8;
  AnalyticsSendEventLazy();
}

id __125__SiriAnalyticsInternalTelemetry_trackMessageStreamProcessed_timeToFirstMessage_messageCount_processingReason_failureReason___block_invoke(void *a1)
{
  v12[4] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v11[0] = @"processedInNanoseconds";
  v3 = [NSNumber numberWithLongLong:a1[6]];
  v12[0] = v3;
  v11[1] = @"timeToFirstMessage";
  id v4 = [NSNumber numberWithLongLong:a1[7]];
  v12[1] = v4;
  void v11[2] = @"messageCount";
  id v5 = [NSNumber numberWithUnsignedInteger:a1[8]];
  void v11[3] = @"reason";
  uint64_t v6 = a1[4];
  v12[2] = v5;
  void v12[3] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:4];
  id v8 = (void *)[v2 initWithDictionary:v7];

  uint64_t v9 = a1[5];
  if (v9) {
    [v8 setValue:v9 forKey:@"failureReason"];
  }
  return v8;
}

- (void)_trackLogicalClock:(id)a3 isDerivativeClock:(BOOL)a4
{
  id v5 = a3;
  id v4 = v5;
  AnalyticsSendEventLazy();
}

id __71__SiriAnalyticsInternalTelemetry__trackLogicalClock_isDerivativeClock___block_invoke(uint64_t a1)
{
  v15[4] = *MEMORY[0x1E4F143B8];
  v14[0] = @"isolated";
  id v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  v15[0] = v2;
  v14[1] = @"messageCount";
  v3 = NSNumber;
  id v4 = [*(id *)(a1 + 32) clockStatistics];
  id v5 = objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v4, "messagesEmitted"));
  v15[1] = v5;
  v14[2] = @"clockAge";
  uint64_t v6 = NSNumber;
  v7 = [*(id *)(a1 + 32) clockStatistics];
  id v8 = objc_msgSend(v6, "numberWithUnsignedLongLong:", objc_msgSend(v7, "clockAgeInNanoseconds"));
  v15[2] = v8;
  v14[3] = @"utilizationLifetime";
  uint64_t v9 = NSNumber;
  id v10 = [*(id *)(a1 + 32) clockStatistics];
  id v11 = objc_msgSend(v9, "numberWithUnsignedLongLong:", objc_msgSend(v10, "utilizationLifetimeInNanoseconds"));
  v15[3] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];

  return v12;
}

- (void)trackLogicalClock:(id)a3
{
  id v4 = a3;
  [(SiriAnalyticsInternalTelemetry *)self _trackLogicalClock:v4 isDerivativeClock:0];
  id v5 = [v4 derivativeClocks];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __52__SiriAnalyticsInternalTelemetry_trackLogicalClock___block_invoke;
  v6[3] = &unk_1E5ABF8D8;
  v6[4] = self;
  [v5 enumerateObjectsUsingBlock:v6];
}

uint64_t __52__SiriAnalyticsInternalTelemetry_trackLogicalClock___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _trackLogicalClock:a2 isDerivativeClock:1];
}

- (void)trackAnyEventEmitted:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  AnalyticsSendEventLazy();
}

id __55__SiriAnalyticsInternalTelemetry_trackAnyEventEmitted___block_invoke(uint64_t a1)
{
  v21[2] = *MEMORY[0x1E4F143B8];
  v20[0] = @"hourOfDay";
  id v2 = NSNumber;
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  id v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v5 = [v4 components:32 fromDate:v3];
  uint64_t v6 = [v5 hour];

  v7 = [v2 numberWithInteger:v6];
  v20[1] = @"byteSize";
  v21[0] = v7;
  id v8 = NSNumber;
  uint64_t v9 = [*(id *)(a1 + 32) payload];
  id v10 = objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v9, "length"));
  v21[1] = v10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
  v12 = (void *)[v11 mutableCopy];

  if (*(unsigned char *)(a1 + 40))
  {
    v13 = [*(id *)(a1 + 32) unwrap];
    uint64_t v14 = [v13 qualifiedMessageName];

    if (v14) {
      v15 = (__CFString *)v14;
    }
    else {
      v15 = @"unknown";
    }
  }
  else
  {
    v16 = NSString;
    unsigned int v17 = [*(id *)(a1 + 32) anyEventType] - 1;
    if (v17 > 0x6C) {
      v18 = @"UNKNOWN_EVENT";
    }
    else {
      v18 = off_1E5ABF988[v17];
    }
    v15 = [v16 stringWithFormat:@"anyEvent.%@", v18];
  }
  [v12 setObject:v15 forKey:@"messageType"];

  return v12;
}

- (void)trackEventEmitted:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  AnalyticsSendEventLazy();
}

id __52__SiriAnalyticsInternalTelemetry_trackEventEmitted___block_invoke(uint64_t a1)
{
  v18[2] = *MEMORY[0x1E4F143B8];
  v17[0] = @"hourOfDay";
  id v2 = NSNumber;
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  id v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v5 = [v4 components:32 fromDate:v3];
  uint64_t v6 = [v5 hour];

  v7 = [v2 numberWithInteger:v6];
  v17[1] = @"messageType";
  v18[0] = v7;
  id v8 = [*(id *)(a1 + 32) underlyingMessage];
  uint64_t v9 = [v8 qualifiedMessageName];
  v18[1] = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  id v11 = (void *)[v10 mutableCopy];

  if (*(unsigned char *)(a1 + 40))
  {
    v12 = [*(id *)(a1 + 32) storageRepresentation];
    v13 = NSNumber;
    uint64_t v14 = [v12 payload];
    v15 = objc_msgSend(v13, "numberWithUnsignedInteger:", objc_msgSend(v14, "length"));
    [v11 setObject:v15 forKey:@"byteSize"];
  }
  return v11;
}

- (void)trackEmittedEvents:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(SiriAnalyticsInternalTelemetry *)self trackEventEmitted:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (SiriAnalyticsInternalTelemetry)initWithPreferences:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SiriAnalyticsInternalTelemetry;
  uint64_t v5 = [(SiriAnalyticsInternalTelemetry *)&v8 init];
  if (v5)
  {
    if (SiriAnalyticsIsInternalInstall_onceToken != -1) {
      dispatch_once(&SiriAnalyticsIsInternalInstall_onceToken, &__block_literal_global_932);
    }
    int v6 = SiriAnalyticsIsInternalInstall_isInternal;
    v5->_isInternal = SiriAnalyticsIsInternalInstall_isInternal;
    if (v6 && [v4 simulateCustomerImage]) {
      v5->_isInternal = 0;
    }
  }

  return v5;
}

@end