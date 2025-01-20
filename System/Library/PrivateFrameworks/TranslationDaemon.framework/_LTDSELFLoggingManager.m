@interface _LTDSELFLoggingManager
+ (void)initialize;
- (_LTDSELFLoggingManager)init;
- (_LTDSELFLoggingSessionIdProvider)sessionIdProvider;
- (id)sendFrameworkRequestWithInvocationId:(id)a3 qssSessionId:(id)a4 requestType:(int64_t)a5 requestRoute:(int64_t)a6 requestSize:(unint64_t)a7;
- (void)_invocationStartTier1WithInvocationId:(id)a3 linkId:(id)a4 appBundleId:(id)a5;
- (void)init;
- (void)invocationAppBackgroundedWithInvocationId:(id)a3 payload:(id)a4 localePair:(id)a5;
- (void)invocationCancelWithInvocationId:(id)a3 reason:(id)a4 qssSessionId:(id)a5;
- (void)invocationEndSuccessfullyWithInvocationId:(id)a3 qssSessionId:(id)a4;
- (void)invocationEndWithInvocationId:(id)a3 error:(id)a4 qssSessionId:(id)a5;
- (void)invocationLanguageIdentificationCompletedWithInputSource:(id)a3 inputSource:(int64_t)a4 topLocale:(id)a5 lowConfidenceLocales:(id)a6;
- (void)invocationStartWithInvocationId:(id)a3 task:(int64_t)a4 inputMode:(int64_t)a5 invocationType:(int64_t)a6 translateAppContext:(id)a7;
- (void)invocationTranslationTTSPlayedWithInvocationId:(id)a3 sourceOrTargetLanguage:(int64_t)a4 isAutoplayTranslation:(BOOL)a5 ttsPlaybackSpeed:(int64_t)a6 audioChannel:(int64_t)a7;
- (void)invocationUserEndedTypingEndedReasonTimeoutWithInvocationId:(id)a3 payload:(id)a4 localePair:(id)a5;
- (void)invocationUserEndedTypingReasonNextButtonPressedWithInvocationId:(id)a3 payload:(id)a4 localePair:(id)a5;
- (void)invocationUserEndedTypingReasonTextBoxDismissedWithInvocationId:(id)a3 payload:(id)a4 localePair:(id)a5;
- (void)selfLoggingEventWithData:(id)a3;
- (void)selfLoggingLanguageIdentificationCompletedWithLIDData:(id)a3;
- (void)sendSpeechTranslationFrameworkRequestSentWithInvocationId:(id)a3 qssSessionId:(id)a4 requestRoute:(int64_t)a5 payloadSizeInBytes:(unint64_t)a6;
@end

@implementation _LTDSELFLoggingManager

+ (void)initialize
{
  v6[1] = *MEMORY[0x263EF8340];
  self;
  id v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == a1)
  {
    v6[0] = objc_opt_class();
    uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
    v5 = (void *)_endpoints;
    _endpoints = v4;
  }
}

- (_LTDSELFLoggingManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)_LTDSELFLoggingManager;
  v2 = [(_LTDSELFLoggingManager *)&v8 init];
  if (v2)
  {
    id v3 = objc_alloc_init(_LTDSELFLoggingSessionIdProvider);
    sessionIdProvider = v2->_sessionIdProvider;
    v2->_sessionIdProvider = v3;

    v5 = _LTOSLogSELFLogging();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[_LTDSELFLoggingManager init]();
    }
    v6 = v2;
  }

  return v2;
}

- (void)selfLoggingEventWithData:(id)a3
{
  id v4 = a3;
  v5 = [v4 invocationId];

  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x263F6EEE0]);
    v7 = [v4 invocationId];
    objc_super v8 = (void *)[v6 initWithNSUUID:v7];

    v9 = [v4 qssSessionId];

    if (v9)
    {
      id v10 = objc_alloc(MEMORY[0x263F6EEE0]);
      v11 = [v4 qssSessionId];
      v9 = (void *)[v10 initWithNSUUID:v11];
    }
    switch([v4 type])
    {
      case 1:
        v32 = [v4 startInvocationOptions];
        uint64_t v31 = [v32 task];
        v12 = [v4 startInvocationOptions];
        uint64_t v13 = [v12 inputMode];
        v14 = [v4 startInvocationOptions];
        uint64_t v15 = [v14 invocationType];
        v16 = [v4 startInvocationOptions];
        v17 = [v16 translateAppContext];
        [(_LTDSELFLoggingManager *)self invocationStartWithInvocationId:v8 task:v31 inputMode:v13 invocationType:v15 translateAppContext:v17];

        break;
      case 2:
        [(_LTDSELFLoggingManager *)self invocationEndSuccessfullyWithInvocationId:v8 qssSessionId:v9];
        break;
      case 3:
        v19 = [v4 invocationEndedError];
        [(_LTDSELFLoggingManager *)self invocationEndWithInvocationId:v8 error:v19 qssSessionId:v9];
        goto LABEL_23;
      case 4:
        v19 = [v4 invocationCancelledReason];
        [(_LTDSELFLoggingManager *)self invocationCancelWithInvocationId:v8 reason:v19 qssSessionId:v9];
        goto LABEL_23;
      case 5:
        v19 = [v4 translationPayload];
        v20 = [v4 translationLocalePair];
        [(_LTDSELFLoggingManager *)self invocationUserEndedTypingReasonTextBoxDismissedWithInvocationId:v8 payload:v19 localePair:v20];
        goto LABEL_22;
      case 6:
        v19 = [v4 translationPayload];
        v20 = [v4 translationLocalePair];
        [(_LTDSELFLoggingManager *)self invocationUserEndedTypingReasonNextButtonPressedWithInvocationId:v8 payload:v19 localePair:v20];
        goto LABEL_22;
      case 7:
        v19 = [v4 translationPayload];
        v20 = [v4 translationLocalePair];
        [(_LTDSELFLoggingManager *)self invocationUserEndedTypingEndedReasonTimeoutWithInvocationId:v8 payload:v19 localePair:v20];
        goto LABEL_22;
      case 8:
        v19 = [v4 translationPayload];
        v20 = [v4 translationLocalePair];
        [(_LTDSELFLoggingManager *)self invocationAppBackgroundedWithInvocationId:v8 payload:v19 localePair:v20];
        goto LABEL_22;
      case 9:
        v19 = [v4 translationTTSData];
        uint64_t v33 = [v19 sourceOrTargetLanguage];
        v21 = [v4 translationTTSData];
        uint64_t v22 = [v21 isAutoplayTranslation];
        v23 = [v4 translationTTSData];
        uint64_t v24 = [v23 playbackSpeed];
        v25 = [v4 translationTTSData];
        -[_LTDSELFLoggingManager invocationTranslationTTSPlayedWithInvocationId:sourceOrTargetLanguage:isAutoplayTranslation:ttsPlaybackSpeed:audioChannel:](self, "invocationTranslationTTSPlayedWithInvocationId:sourceOrTargetLanguage:isAutoplayTranslation:ttsPlaybackSpeed:audioChannel:", v8, v33, v22, v24, [v25 audioChannel]);

        goto LABEL_23;
      case 10:
        id v26 = objc_alloc(MEMORY[0x263F6EEE0]);
        v27 = [MEMORY[0x263F08C38] UUID];
        v19 = (void *)[v26 initWithNSUUID:v27];

        v28 = [v4 trustedClientIdentifier];
        v29 = v28;
        if (v28)
        {
          v30 = v28;
        }
        else
        {
          v30 = [v4 untrustedClientIdentifier];
        }
        v20 = v30;

        if (arc4random_uniform(0xAu))
        {

          v20 = @"redacted-3rd-party-bundle-id";
        }
        [(_LTDSELFLoggingManager *)self _invocationStartTier1WithInvocationId:v8 linkId:v19 appBundleId:v20];
LABEL_22:

LABEL_23:
        break;
      default:
        break;
    }
  }
  else
  {
    v18 = _LTOSLogSELFLogging();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[_LTDSELFLoggingManager selfLoggingEventWithData:]();
    }
  }
}

- (void)selfLoggingLanguageIdentificationCompletedWithLIDData:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F6EEE0];
  id v5 = a3;
  id v6 = [v4 alloc];
  v7 = [v5 invocationId];
  id v12 = (id)[v6 initWithNSUUID:v7];

  objc_super v8 = [v5 lowConfidenceLocales];
  v9 = [v8 _ltCompactMap:&__block_literal_global_14];

  uint64_t v10 = [v5 inputSource];
  v11 = [v5 topLocale];

  [(_LTDSELFLoggingManager *)self invocationLanguageIdentificationCompletedWithInputSource:v12 inputSource:v10 topLocale:v11 lowConfidenceLocales:v9];
}

- (void)invocationStartWithInvocationId:(id)a3 task:(int64_t)a4 inputMode:(int64_t)a5 invocationType:(int64_t)a6 translateAppContext:(id)a7
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v23 = a3;
  id v10 = a7;
  v11 = _LTOSLogSELFLogging();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[_LTDSELFLoggingManager invocationStartWithInvocationId:task:inputMode:invocationType:translateAppContext:](v11, v23);
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = (id)_endpoints;
  uint64_t v12 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v25;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v24 + 1) + 8 * v15);
        v17 = objc_msgSend(MEMORY[0x263EFFA40], "lt_appGroupDefaults");
        uint64_t v18 = objc_msgSend(v17, "lt_isOnDeviceOnly");
        v19 = [(_LTDSELFLoggingSessionIdProvider *)self->_sessionIdProvider sessionId];
        [v16 startWithTask:a4 inputMode:a5 invocationType:a6 interfaceMode:0 explicitLanguageFilterEnabled:0 onDevice:v18 mtId:v23 sessionId:v19 translateAppContext:v10];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v13);
  }
}

- (void)_invocationStartTier1WithInvocationId:(id)a3 linkId:(id)a4 appBundleId:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = _LTOSLogSELFLogging();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[_LTDSELFLoggingManager _invocationStartTier1WithInvocationId:linkId:appBundleId:](v11, v8);
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v12 = (id)_endpoints;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v19 + 1) + 8 * v16);
        uint64_t v18 = [(_LTDSELFLoggingSessionIdProvider *)self->_sessionIdProvider sessionId];
        [v17 startTier1WithLinkId:v9 appBundleId:v10 mtId:v8 sessionId:v18];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }
}

- (void)invocationEndSuccessfullyWithInvocationId:(id)a3 qssSessionId:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = _LTOSLogSELFLogging();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[_LTDSELFLoggingManager invocationEndSuccessfullyWithInvocationId:qssSessionId:](v8, v6);
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = (id)_endpoints;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v16 + 1) + 8 * v13);
        uint64_t v15 = [(_LTDSELFLoggingSessionIdProvider *)self->_sessionIdProvider sessionId];
        [v14 endSuccessfullyWithExists:1 qssSessionId:v7 mtId:v6 sessionId:v15];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }
}

- (void)invocationEndWithInvocationId:(id)a3 error:(id)a4 qssSessionId:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = _LTOSLogSELFLogging();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[_LTDSELFLoggingManager invocationEndWithInvocationId:error:qssSessionId:]((uint64_t)v9, v11, v8);
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v12 = (id)_endpoints;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v17 = *(void **)(*((void *)&v19 + 1) + 8 * v16);
        long long v18 = [(_LTDSELFLoggingSessionIdProvider *)self->_sessionIdProvider sessionId];
        [v17 endWithError:v9 qssSessionId:v10 mtId:v8 sessionId:v18];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }
}

- (void)invocationCancelWithInvocationId:(id)a3 reason:(id)a4 qssSessionId:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = _LTOSLogSELFLogging();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[_LTDSELFLoggingManager invocationCancelWithInvocationId:reason:qssSessionId:]((uint64_t)v9, v11, v8);
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v12 = (id)_endpoints;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v17 = *(void **)(*((void *)&v19 + 1) + 8 * v16);
        long long v18 = [(_LTDSELFLoggingSessionIdProvider *)self->_sessionIdProvider sessionId];
        [v17 cancelWithExists:1 reason:v9 qssSessionId:v10 mtId:v8 sessionId:v18];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }
}

- (void)invocationUserEndedTypingReasonTextBoxDismissedWithInvocationId:(id)a3 payload:(id)a4 localePair:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_msgSend(MEMORY[0x263EFFA40], "lt_appGroupDefaults");
  long long v21 = v9;
  if (objc_msgSend(v11, "lt_isOnDeviceOnly")) {
    id v12 = 0;
  }
  else {
    id v12 = v9;
  }
  id v13 = v12;

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v14 = (id)_endpoints;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v23;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v14);
        }
        long long v19 = *(void **)(*((void *)&v22 + 1) + 8 * v18);
        long long v20 = [(_LTDSELFLoggingSessionIdProvider *)self->_sessionIdProvider sessionId];
        [v19 userDismissedTextBoxWithPayload:v13 localePair:v10 mtId:v8 sessionId:v20];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v16);
  }
}

- (void)invocationUserEndedTypingReasonNextButtonPressedWithInvocationId:(id)a3 payload:(id)a4 localePair:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_msgSend(MEMORY[0x263EFFA40], "lt_appGroupDefaults");
  long long v21 = v9;
  if (objc_msgSend(v11, "lt_isOnDeviceOnly")) {
    id v12 = 0;
  }
  else {
    id v12 = v9;
  }
  id v13 = v12;

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v14 = (id)_endpoints;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v23;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v14);
        }
        long long v19 = *(void **)(*((void *)&v22 + 1) + 8 * v18);
        long long v20 = [(_LTDSELFLoggingSessionIdProvider *)self->_sessionIdProvider sessionId];
        [v19 userPressedNextButtonWithPayload:v13 localePair:v10 mtId:v8 sessionId:v20];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v16);
  }
}

- (void)invocationUserEndedTypingEndedReasonTimeoutWithInvocationId:(id)a3 payload:(id)a4 localePair:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_msgSend(MEMORY[0x263EFFA40], "lt_appGroupDefaults");
  long long v21 = v9;
  if (objc_msgSend(v11, "lt_isOnDeviceOnly")) {
    id v12 = 0;
  }
  else {
    id v12 = v9;
  }
  id v13 = v12;

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v14 = (id)_endpoints;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v23;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v14);
        }
        long long v19 = *(void **)(*((void *)&v22 + 1) + 8 * v18);
        long long v20 = [(_LTDSELFLoggingSessionIdProvider *)self->_sessionIdProvider sessionId];
        [v19 userTimeoutWithPayload:v13 localePair:v10 mtId:v8 sessionId:v20];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v16);
  }
}

- (void)invocationAppBackgroundedWithInvocationId:(id)a3 payload:(id)a4 localePair:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_msgSend(MEMORY[0x263EFFA40], "lt_appGroupDefaults");
  long long v21 = v9;
  if (objc_msgSend(v11, "lt_isOnDeviceOnly")) {
    id v12 = 0;
  }
  else {
    id v12 = v9;
  }
  id v13 = v12;

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v14 = (id)_endpoints;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v23;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v14);
        }
        long long v19 = *(void **)(*((void *)&v22 + 1) + 8 * v18);
        long long v20 = [(_LTDSELFLoggingSessionIdProvider *)self->_sessionIdProvider sessionId];
        [v19 appBackgroundedWithPayload:v13 localePair:v10 mtId:v8 sessionId:v20];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v16);
  }
}

- (void)invocationTranslationTTSPlayedWithInvocationId:(id)a3 sourceOrTargetLanguage:(int64_t)a4 isAutoplayTranslation:(BOOL)a5 ttsPlaybackSpeed:(int64_t)a6 audioChannel:(int64_t)a7
{
  BOOL v17 = a5;
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v9 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v10 = (id)_endpoints;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v20 + 1) + 8 * v14);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v16 = [(_LTDSELFLoggingSessionIdProvider *)self->_sessionIdProvider sessionId];
          [v15 translationTTSPlayed:a4 isAutoplayTranslation:v17 ttsPlaybackSpeed:a6 audioChannel:a7 mtId:v9 sessionId:v16];
        }
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v12);
  }
}

- (void)invocationLanguageIdentificationCompletedWithInputSource:(id)a3 inputSource:(int64_t)a4 topLocale:(id)a5 lowConfidenceLocales:(id)a6
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = (id)_endpoints;
  uint64_t v13 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v21;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(obj);
        }
        BOOL v17 = *(void **)(*((void *)&v20 + 1) + 8 * v16);
        uint64_t v18 = [(_LTDSELFLoggingSessionIdProvider *)self->_sessionIdProvider sessionId];
        [v17 languageIdentificationCompletedWithInputSource:a4 topLocale:v11 lowConfidenceLocales:v12 mtId:v10 sessionId:v18];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v14);
  }
}

- (id)sendFrameworkRequestWithInvocationId:(id)a3 qssSessionId:(id)a4 requestType:(int64_t)a5 requestRoute:(int64_t)a6 requestSize:(unint64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  if (v12)
  {
    uint64_t v14 = [_LTDSELFLoggingFrameworkRequest alloc];
    uint64_t v15 = [(_LTDSELFLoggingFrameworkRequest *)v14 initWithInvocationId:v12 endpoints:_endpoints sessionIdProvider:self->_sessionIdProvider qssSessionId:v13 requestType:a5 requestRoute:a6 requestSize:a7];
  }
  else
  {
    uint64_t v16 = _LTOSLogSELFLogging();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[_LTDSELFLoggingManager sendFrameworkRequestWithInvocationId:qssSessionId:requestType:requestRoute:requestSize:]();
    }
    uint64_t v15 = 0;
  }

  return v15;
}

- (void)sendSpeechTranslationFrameworkRequestSentWithInvocationId:(id)a3 qssSessionId:(id)a4 requestRoute:(int64_t)a5 payloadSizeInBytes:(unint64_t)a6
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  long long v21 = v10;
  if (v10)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id obj = (id)_endpoints;
    uint64_t v12 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          BOOL v17 = (void *)[objc_alloc(MEMORY[0x263F6EEE0]) initWithNSUUID:v21];
          uint64_t v18 = [(_LTDSELFLoggingSessionIdProvider *)self->_sessionIdProvider sessionId];
          [v16 frameworkRequestSentWithFrameworkRequestId:0 qssSessionId:v11 requestType:2 requestRoute:a5 requestSize:a6 mtId:v17 sessionId:v18];
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v13);
    }
  }
  else
  {
    long long v19 = _LTOSLogSELFLogging();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      -[_LTDSELFLoggingManager sendSpeechTranslationFrameworkRequestSentWithInvocationId:qssSessionId:requestRoute:payloadSizeInBytes:]();
    }
  }
}

- (_LTDSELFLoggingSessionIdProvider)sessionIdProvider
{
  return self->_sessionIdProvider;
}

- (void).cxx_destruct
{
}

- (void)init
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2600DC000, v0, v1, "LTDSELFLoggingManager initialized", v2, v3, v4, v5, v6);
}

- (void)selfLoggingEventWithData:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2600DC000, v0, v1, "Attempt to send SELF logging event without invocation id", v2, v3, v4, v5, v6);
}

- (void)invocationStartWithInvocationId:(void *)a1 task:(void *)a2 inputMode:invocationType:translateAppContext:.cold.1(void *a1, void *a2)
{
  id v3 = a1;
  id v10 = [a2 formattedText];
  OUTLINED_FUNCTION_1_4(&dword_2600DC000, v4, v5, "Invocation start with type: %ld and invocationId %{public}@", v6, v7, v8, v9, 2u);
}

- (void)_invocationStartTier1WithInvocationId:(void *)a1 linkId:(void *)a2 appBundleId:.cold.1(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 formattedText];
  OUTLINED_FUNCTION_4(&dword_2600DC000, v5, v6, "Invocation start tier 1 with invocationId: %{public}@", v7, v8, v9, v10, 2u);
}

- (void)invocationEndSuccessfullyWithInvocationId:(void *)a1 qssSessionId:(void *)a2 .cold.1(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 formattedText];
  OUTLINED_FUNCTION_4(&dword_2600DC000, v5, v6, "Invocation end successfully for invocationId %{public}@", v7, v8, v9, v10, 2u);
}

- (void)invocationEndWithInvocationId:(uint64_t)a1 error:(void *)a2 qssSessionId:(void *)a3 .cold.1(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  uint64_t v5 = [a3 formattedText];
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_4(&dword_2600DC000, v6, v7, "Invocation end with error (%@) for invocationId %{public}@", v8, v9, v10, v11, v12);
}

- (void)invocationCancelWithInvocationId:(uint64_t)a1 reason:(void *)a2 qssSessionId:(void *)a3 .cold.1(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  uint64_t v5 = [a3 formattedText];
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_4(&dword_2600DC000, v6, v7, "Invocation cancelled with reason (%@) for invocationId %{public}@", v8, v9, v10, v11, v12);
}

- (void)sendFrameworkRequestWithInvocationId:qssSessionId:requestType:requestRoute:requestSize:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2600DC000, v0, v1, "Attempt to send SELF logging framework request events without invocation id", v2, v3, v4, v5, v6);
}

- (void)sendSpeechTranslationFrameworkRequestSentWithInvocationId:qssSessionId:requestRoute:payloadSizeInBytes:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2600DC000, v0, v1, "Attempt to send SELF logging framework request sent event without invocation id", v2, v3, v4, v5, v6);
}

@end