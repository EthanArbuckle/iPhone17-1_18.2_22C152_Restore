@interface SSRLoggingAggregator
- (SSRLoggingAggregator)initWithEvent:(id)a3 locale:(id)a4 configVersion:(id)a5;
- (double)retrainingWaitTime;
- (double)speakerRecognitionWaitTime;
- (float)voiceProfileUpdateScoreMSE;
- (unint64_t)speakerRecognitionPSRProcessingStatus;
- (unint64_t)speakerRecognitionProcessingStatus;
- (unint64_t)speakerRecognitionSATProcessingStatus;
- (unint64_t)voiceProfileDiscardedUtteranceCount;
- (unint64_t)voiceProfilePrunedUtteranceCount;
- (unint64_t)voiceProfilePruningFailureReasonCode;
- (unint64_t)voiceProfileRetainedUtteranceCount;
- (unint64_t)voiceProfileRetrainingFailureReasonCode;
- (void)appendVoiceProfileDiscardedImplicitUtteranceScoreWith:(float)a3;
- (void)appendVoiceProfileExplicitUtteranceScoreWith:(float)a3;
- (void)appendVoiceProfileFailedExplicitUtteranceScoreWith:(float)a3;
- (void)appendVoiceProfileImplicitUtteranceScoreWith:(float)a3;
- (void)pushAnalytics;
- (void)pushAnalyticsWithLazyBlock:(id)a3;
- (void)setRetrainingWaitTime:(double)a3;
- (void)setSpeakerRecognitionPSRProcessingStatus:(unint64_t)a3;
- (void)setSpeakerRecognitionProcessingStatus:(unint64_t)a3;
- (void)setSpeakerRecognitionSATProcessingStatus:(unint64_t)a3;
- (void)setSpeakerRecognitionWaitTime:(double)a3;
- (void)setVoiceProfileDiscardedUtteranceCount:(unint64_t)a3;
- (void)setVoiceProfilePrunedUtteranceCount:(unint64_t)a3;
- (void)setVoiceProfilePruningFailureReasonCode:(unint64_t)a3;
- (void)setVoiceProfileRetainedUtteranceCount:(unint64_t)a3;
- (void)setVoiceProfileRetrainingFailureReasonCode:(unint64_t)a3;
- (void)setVoiceProfileUpdateScoreMSE:(float)a3;
- (void)setvoiceProfilePrunedUtteranceCount:(unint64_t)a3;
@end

@implementation SSRLoggingAggregator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventContext, 0);

  objc_storeStrong((id *)&self->_eventString, 0);
}

- (void)setSpeakerRecognitionSATProcessingStatus:(unint64_t)a3
{
  self->_speakerRecognitionSATProcessingStatus = a3;
}

- (unint64_t)speakerRecognitionSATProcessingStatus
{
  return self->_speakerRecognitionSATProcessingStatus;
}

- (void)setSpeakerRecognitionPSRProcessingStatus:(unint64_t)a3
{
  self->_speakerRecognitionPSRProcessingStatus = a3;
}

- (unint64_t)speakerRecognitionPSRProcessingStatus
{
  return self->_speakerRecognitionPSRProcessingStatus;
}

- (double)speakerRecognitionWaitTime
{
  return self->_speakerRecognitionWaitTime;
}

- (unint64_t)speakerRecognitionProcessingStatus
{
  return self->_speakerRecognitionProcessingStatus;
}

- (double)retrainingWaitTime
{
  return self->_retrainingWaitTime;
}

- (unint64_t)voiceProfileRetrainingFailureReasonCode
{
  return self->_voiceProfileRetrainingFailureReasonCode;
}

- (unint64_t)voiceProfileRetainedUtteranceCount
{
  return self->_voiceProfileRetainedUtteranceCount;
}

- (void)setVoiceProfilePrunedUtteranceCount:(unint64_t)a3
{
  self->_voiceProfilePrunedUtteranceCount = a3;
}

- (unint64_t)voiceProfilePrunedUtteranceCount
{
  return self->_voiceProfilePrunedUtteranceCount;
}

- (unint64_t)voiceProfileDiscardedUtteranceCount
{
  return self->_voiceProfileDiscardedUtteranceCount;
}

- (float)voiceProfileUpdateScoreMSE
{
  return self->_voiceProfileUpdateScoreMSE;
}

- (unint64_t)voiceProfilePruningFailureReasonCode
{
  return self->_voiceProfilePruningFailureReasonCode;
}

- (void)pushAnalytics
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v3 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    eventString = self->_eventString;
    int v6 = 136315394;
    v7 = "-[SSRLoggingAggregator pushAnalytics]";
    __int16 v8 = 2114;
    v9 = eventString;
    _os_log_impl(&dword_21C8A5000, v3, OS_LOG_TYPE_DEFAULT, "%s Sending Analytics Event - %{public}@", (uint8_t *)&v6, 0x16u);
  }
  v5 = (void *)[(NSMutableDictionary *)self->_eventContext copy];
  AnalyticsSendEvent();
}

- (void)setSpeakerRecognitionWaitTime:(double)a3
{
  self->_speakerRecognitionWaitTime = a3;
  id v4 = [NSNumber numberWithInt:(int)(a3 * 1000.0)];
  [(NSMutableDictionary *)self->_eventContext setObject:v4 forKeyedSubscript:@"speakerRecognitionWaitTimeMs"];
}

- (void)setSpeakerRecognitionProcessingStatus:(unint64_t)a3
{
  self->_speakerRecognitionProcessingStatus = a3;
  objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(NSMutableDictionary *)self->_eventContext setObject:v4 forKeyedSubscript:@"speakerRecognitionProcessingStatus"];
}

- (void)setRetrainingWaitTime:(double)a3
{
  self->_retrainingWaitTime = a3;
  id v4 = [NSNumber numberWithInt:(int)(a3 * 1000.0)];
  [(NSMutableDictionary *)self->_eventContext setObject:v4 forKeyedSubscript:@"retrainingWaitTimeMs"];
}

- (void)setVoiceProfileRetrainingFailureReasonCode:(unint64_t)a3
{
  self->_voiceProfileRetrainingFailureReasonCode = a3;
  objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(NSMutableDictionary *)self->_eventContext setObject:v4 forKeyedSubscript:@"TdPsrSATRetrainingTimedOut"];
}

- (void)appendVoiceProfileFailedExplicitUtteranceScoreWith:(float)a3
{
  v5 = NSString;
  unint64_t explicitFailedUtteranceIndex = self->explicitFailedUtteranceIndex;
  self->unint64_t explicitFailedUtteranceIndex = explicitFailedUtteranceIndex + 1;
  id v9 = [v5 stringWithFormat:@"%@.%d", @"profileUpdateFailedExplicitUttScore", explicitFailedUtteranceIndex];
  *(float *)&double v7 = a3;
  __int16 v8 = [NSNumber numberWithFloat:v7];
  [(NSMutableDictionary *)self->_eventContext setObject:v8 forKeyedSubscript:v9];
}

- (void)appendVoiceProfileDiscardedImplicitUtteranceScoreWith:(float)a3
{
  v5 = NSString;
  unint64_t implicitDiscardedUtteranceIndex = self->implicitDiscardedUtteranceIndex;
  self->unint64_t implicitDiscardedUtteranceIndex = implicitDiscardedUtteranceIndex + 1;
  id v9 = [v5 stringWithFormat:@"%@.%d", @"profileUpdateDiscardImplicitUttScore", implicitDiscardedUtteranceIndex];
  *(float *)&double v7 = a3;
  __int16 v8 = [NSNumber numberWithFloat:v7];
  [(NSMutableDictionary *)self->_eventContext setObject:v8 forKeyedSubscript:v9];
}

- (void)appendVoiceProfileImplicitUtteranceScoreWith:(float)a3
{
  v5 = NSString;
  unint64_t implicitUtteranceIndex = self->implicitUtteranceIndex;
  self->unint64_t implicitUtteranceIndex = implicitUtteranceIndex + 1;
  id v9 = [v5 stringWithFormat:@"%@.%d", @"profileUpdateImplicitUttScore", implicitUtteranceIndex];
  *(float *)&double v7 = a3;
  __int16 v8 = [NSNumber numberWithFloat:v7];
  [(NSMutableDictionary *)self->_eventContext setObject:v8 forKeyedSubscript:v9];
}

- (void)appendVoiceProfileExplicitUtteranceScoreWith:(float)a3
{
  v5 = NSString;
  unint64_t explicitUtteranceIndex = self->explicitUtteranceIndex;
  self->unint64_t explicitUtteranceIndex = explicitUtteranceIndex + 1;
  id v9 = [v5 stringWithFormat:@"%@.%d", @"profileUpdateExplicitUttScore", explicitUtteranceIndex];
  *(float *)&double v7 = a3;
  __int16 v8 = [NSNumber numberWithFloat:v7];
  [(NSMutableDictionary *)self->_eventContext setObject:v8 forKeyedSubscript:v9];
}

- (void)setVoiceProfileRetainedUtteranceCount:(unint64_t)a3
{
  self->_voiceProfileRetainedUtteranceCount = a3;
  objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(NSMutableDictionary *)self->_eventContext setObject:v4 forKeyedSubscript:@"profileUpdateNumRetainedUttsPHS"];
}

- (void)setvoiceProfilePrunedUtteranceCount:(unint64_t)a3
{
  self->_voiceProfilePrunedUtteranceCount = a3;
  objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(NSMutableDictionary *)self->_eventContext setObject:v4 forKeyedSubscript:@"profileUpdateNumPrunedUttsPHS"];
}

- (void)setVoiceProfileDiscardedUtteranceCount:(unint64_t)a3
{
  self->_voiceProfileDiscardedUtteranceCount = a3;
  objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(NSMutableDictionary *)self->_eventContext setObject:v4 forKeyedSubscript:@"profileUpdateNumDiscardedUttsPHS"];
}

- (void)setVoiceProfileUpdateScoreMSE:(float)a3
{
  self->_voiceProfileUpdateScoreMSE = a3;
  objc_msgSend(NSNumber, "numberWithFloat:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(NSMutableDictionary *)self->_eventContext setObject:v4 forKeyedSubscript:@"profileUpdateScoreMSE"];
}

- (void)setVoiceProfilePruningFailureReasonCode:(unint64_t)a3
{
  self->_voiceProfilePruningFailureReasonCode = a3;
  objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(NSMutableDictionary *)self->_eventContext setObject:v4 forKeyedSubscript:@"profileUpdateFailCode"];
}

- (void)pushAnalyticsWithLazyBlock:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
    AnalyticsSendEventLazy();
  }
}

id __51__SSRLoggingAggregator_pushAnalyticsWithLazyBlock___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(void **)(*(void *)(a1 + 32) + 16);

  return v2;
}

- (SSRLoggingAggregator)initWithEvent:(id)a3 locale:(id)a4 configVersion:(id)a5
{
  id v8 = a3;
  id v9 = (__CFString *)a4;
  uint64_t v10 = (__CFString *)a5;
  v19.receiver = self;
  v19.super_class = (Class)SSRLoggingAggregator;
  v11 = [(SSRLoggingAggregator *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [@"com.apple.ssr" stringByAppendingFormat:@".%@", v8];
    eventString = v11->_eventString;
    v11->_eventString = (NSString *)v12;

    if (v9) {
      v14 = v9;
    }
    else {
      v14 = @"xx_XX";
    }
    [(NSMutableDictionary *)v11->_eventContext setObject:v14 forKeyedSubscript:@"locale"];
    if (v10) {
      v15 = v10;
    }
    else {
      v15 = @"unknown";
    }
    [(NSMutableDictionary *)v11->_eventContext setObject:v15 forKeyedSubscript:@"asset"];
    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    eventContext = v11->_eventContext;
    v11->_eventContext = v16;
  }
  return v11;
}

@end