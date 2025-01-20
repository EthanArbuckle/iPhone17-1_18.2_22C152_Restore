@interface _LTDSELFLoggingProduction
+ (void)_sendEventWithContext:(id)a3 mtId:(id)a4 sessionId:(id)a5;
+ (void)appBackgroundedWithPayload:(id)a3 localePair:(id)a4 mtId:(id)a5 sessionId:(id)a6;
+ (void)cancelWithExists:(BOOL)a3 reason:(id)a4 qssSessionId:(id)a5 mtId:(id)a6 sessionId:(id)a7;
+ (void)endSuccessfullyWithExists:(BOOL)a3 qssSessionId:(id)a4 mtId:(id)a5 sessionId:(id)a6;
+ (void)endWithError:(id)a3 qssSessionId:(id)a4 mtId:(id)a5 sessionId:(id)a6;
+ (void)frameworkRequestResponseReceivedWithFrameworkRequestId:(id)a3 requestRoute:(int64_t)a4 mtId:(id)a5 sessionId:(id)a6 numberOfSentences:(unint64_t)a7;
+ (void)frameworkRequestSentWithFrameworkRequestId:(id)a3 qssSessionId:(id)a4 requestType:(int64_t)a5 requestRoute:(int64_t)a6 requestSize:(unint64_t)a7 mtId:(id)a8 sessionId:(id)a9;
+ (void)languageIdentificationCompletedWithInputSource:(int64_t)a3 topLocale:(id)a4 lowConfidenceLocales:(id)a5 mtId:(id)a6 sessionId:(id)a7;
+ (void)startTier1WithLinkId:(id)a3 appBundleId:(id)a4 mtId:(id)a5 sessionId:(id)a6;
+ (void)startWithTask:(int64_t)a3 inputMode:(int64_t)a4 invocationType:(int64_t)a5 interfaceMode:(int64_t)a6 explicitLanguageFilterEnabled:(BOOL)a7 onDevice:(BOOL)a8 mtId:(id)a9 sessionId:(id)a10 translateAppContext:(id)a11;
+ (void)translationTTSPlayed:(int64_t)a3 isAutoplayTranslation:(BOOL)a4 ttsPlaybackSpeed:(int64_t)a5 audioChannel:(int64_t)a6 mtId:(id)a7 sessionId:(id)a8;
+ (void)userDismissedTextBoxWithPayload:(id)a3 localePair:(id)a4 mtId:(id)a5 sessionId:(id)a6;
+ (void)userPressedNextButtonWithPayload:(id)a3 localePair:(id)a4 mtId:(id)a5 sessionId:(id)a6;
+ (void)userTimeoutWithPayload:(id)a3 localePair:(id)a4 mtId:(id)a5 sessionId:(id)a6;
@end

@implementation _LTDSELFLoggingProduction

+ (void)_sendEventWithContext:(id)a3 mtId:(id)a4 sessionId:(id)a5
{
  v7 = (objc_class *)MEMORY[0x263F6E3A8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init(v7);
  v12 = objc_msgSend(MEMORY[0x263F6E3A0], "lt_initWithMtId:sessionId:", v9, v8);

  [v11 setEventMetadata:v12];
  [v11 setInvocationContext:v10];

  v13 = [MEMORY[0x263F6C818] sharedAnalytics];
  v14 = [v13 defaultMessageStream];
  v15 = objc_msgSend(v9, "ltd_safeUUID");

  [v14 emitMessage:v11 isolatedStreamUUID:v15];
  v16 = _LTOSLogSELFLogging();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    +[_LTDSELFLoggingProduction _sendEventWithContext:mtId:sessionId:](v16);
  }
}

+ (void)startWithTask:(int64_t)a3 inputMode:(int64_t)a4 invocationType:(int64_t)a5 interfaceMode:(int64_t)a6 explicitLanguageFilterEnabled:(BOOL)a7 onDevice:(BOOL)a8 mtId:(id)a9 sessionId:(id)a10 translateAppContext:(id)a11
{
  BOOL v11 = a8;
  BOOL v12 = a7;
  v17 = (objc_class *)MEMORY[0x263F6E3D0];
  id v18 = a11;
  id v19 = a10;
  id v20 = a9;
  id v22 = objc_alloc_init(v17);
  v21 = objc_msgSend(MEMORY[0x263F6E3E8], "lt_initWithTask:inputMode:invocationType:explicitLanguageFilterEnabled:onDevice:translateAppContext:", a3, a4, a5, v12, v11, v18);

  [v22 setStartedOrChanged:v21];
  [a1 _sendEventWithContext:v22 mtId:v20 sessionId:v19];
}

+ (void)startTier1WithLinkId:(id)a3 appBundleId:(id)a4 mtId:(id)a5 sessionId:(id)a6
{
  id v9 = (objc_class *)MEMORY[0x263F6E3A8];
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_alloc_init(v9);
  v15 = objc_msgSend(MEMORY[0x263F6E3A0], "lt_initWithMtId:sessionId:", v11, v10);

  [v14 setEventMetadata:v15];
  v16 = objc_msgSend(MEMORY[0x263F6E3F0], "lt_initWithLinkId:appBundleId:", v13, v12);

  [v14 setInvocationStartedTier1:v16];
  v17 = [MEMORY[0x263F6C818] sharedAnalytics];
  id v18 = [v17 defaultMessageStream];
  id v19 = objc_msgSend(v11, "ltd_safeUUID");

  [v18 emitMessage:v14 isolatedStreamUUID:v19];
  id v20 = _LTOSLogSELFLogging();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    +[_LTDSELFLoggingProduction startTier1WithLinkId:appBundleId:mtId:sessionId:](v20);
  }
}

+ (void)endSuccessfullyWithExists:(BOOL)a3 qssSessionId:(id)a4 mtId:(id)a5 sessionId:(id)a6
{
  BOOL v8 = a3;
  id v10 = (objc_class *)MEMORY[0x263F6E3D0];
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v15 = objc_alloc_init(v10);
  id v14 = objc_msgSend(MEMORY[0x263F6E3D8], "lt_initWithExists:qssSessionId:", v8, v13);

  [v15 setEnded:v14];
  [a1 _sendEventWithContext:v15 mtId:v12 sessionId:v11];
}

+ (void)endWithError:(id)a3 qssSessionId:(id)a4 mtId:(id)a5 sessionId:(id)a6
{
  id v10 = (objc_class *)MEMORY[0x263F6E3D0];
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v16 = objc_alloc_init(v10);
  id v15 = objc_msgSend(MEMORY[0x263F6E3E0], "lt_initWithWithError:qssSessionId:", v14, v13);

  [v16 setFailed:v15];
  [a1 _sendEventWithContext:v16 mtId:v12 sessionId:v11];
}

+ (void)cancelWithExists:(BOOL)a3 reason:(id)a4 qssSessionId:(id)a5 mtId:(id)a6 sessionId:(id)a7
{
  BOOL v10 = a3;
  id v12 = (objc_class *)MEMORY[0x263F6E3D0];
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v18 = objc_alloc_init(v12);
  v17 = objc_msgSend(MEMORY[0x263F6E3C8], "lt_initWithExists:reason:qssSessionId:", v10, v16, v15);

  [v18 setCancelled:v17];
  [a1 _sendEventWithContext:v18 mtId:v14 sessionId:v13];
}

+ (void)userDismissedTextBoxWithPayload:(id)a3 localePair:(id)a4 mtId:(id)a5 sessionId:(id)a6
{
  id v9 = (objc_class *)MEMORY[0x263F6E3A8];
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_alloc_init(v9);
  id v15 = objc_msgSend(MEMORY[0x263F6E3A0], "lt_initWithMtId:sessionId:", v11, v10);

  [v14 setEventMetadata:v15];
  id v16 = objc_msgSend(MEMORY[0x263F6E390], "lt_initWithPayload:localePair:", v13, v12);

  [v14 setAppTextBoxDismissed:v16];
  v17 = [MEMORY[0x263F6C818] sharedAnalytics];
  id v18 = [v17 defaultMessageStream];
  id v19 = objc_msgSend(v11, "ltd_safeUUID");

  [v18 emitMessage:v14 isolatedStreamUUID:v19];
  id v20 = _LTOSLogSELFLogging();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    +[_LTDSELFLoggingProduction userDismissedTextBoxWithPayload:localePair:mtId:sessionId:](v20);
  }
}

+ (void)userPressedNextButtonWithPayload:(id)a3 localePair:(id)a4 mtId:(id)a5 sessionId:(id)a6
{
  id v9 = (objc_class *)MEMORY[0x263F6E3A8];
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_alloc_init(v9);
  id v15 = objc_msgSend(MEMORY[0x263F6E3A0], "lt_initWithMtId:sessionId:", v11, v10);

  [v14 setEventMetadata:v15];
  id v16 = objc_msgSend(MEMORY[0x263F6E388], "lt_initWithPayload:localePair:", v13, v12);

  [v14 setAppNextButtonTapped:v16];
  v17 = [MEMORY[0x263F6C818] sharedAnalytics];
  id v18 = [v17 defaultMessageStream];
  id v19 = objc_msgSend(v11, "ltd_safeUUID");

  [v18 emitMessage:v14 isolatedStreamUUID:v19];
  id v20 = _LTOSLogSELFLogging();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    +[_LTDSELFLoggingProduction userPressedNextButtonWithPayload:localePair:mtId:sessionId:](v20);
  }
}

+ (void)userTimeoutWithPayload:(id)a3 localePair:(id)a4 mtId:(id)a5 sessionId:(id)a6
{
  id v9 = (objc_class *)MEMORY[0x263F6E3A8];
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_alloc_init(v9);
  id v15 = objc_msgSend(MEMORY[0x263F6E3A0], "lt_initWithMtId:sessionId:", v11, v10);

  [v14 setEventMetadata:v15];
  id v16 = objc_msgSend(MEMORY[0x263F6E398], "lt_initWithPayload:localePair:", v13, v12);

  [v14 setAppTimedOut:v16];
  v17 = [MEMORY[0x263F6C818] sharedAnalytics];
  id v18 = [v17 defaultMessageStream];
  id v19 = objc_msgSend(v11, "ltd_safeUUID");

  [v18 emitMessage:v14 isolatedStreamUUID:v19];
  id v20 = _LTOSLogSELFLogging();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    +[_LTDSELFLoggingProduction userTimeoutWithPayload:localePair:mtId:sessionId:](v20);
  }
}

+ (void)appBackgroundedWithPayload:(id)a3 localePair:(id)a4 mtId:(id)a5 sessionId:(id)a6
{
  id v9 = (objc_class *)MEMORY[0x263F6E3A8];
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_alloc_init(v9);
  id v15 = objc_msgSend(MEMORY[0x263F6E3A0], "lt_initWithMtId:sessionId:", v11, v10);

  [v14 setEventMetadata:v15];
  id v16 = objc_msgSend(MEMORY[0x263F6E378], "lt_initWithPayload:localePair:", v13, v12);

  [v14 setAppBackgrounded:v16];
  v17 = [MEMORY[0x263F6C818] sharedAnalytics];
  id v18 = [v17 defaultMessageStream];
  id v19 = objc_msgSend(v11, "ltd_safeUUID");

  [v18 emitMessage:v14 isolatedStreamUUID:v19];
  id v20 = _LTOSLogSELFLogging();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    +[_LTDSELFLoggingProduction appBackgroundedWithPayload:localePair:mtId:sessionId:](v20);
  }
}

+ (void)translationTTSPlayed:(int64_t)a3 isAutoplayTranslation:(BOOL)a4 ttsPlaybackSpeed:(int64_t)a5 audioChannel:(int64_t)a6 mtId:(id)a7 sessionId:(id)a8
{
  BOOL v11 = a4;
  id v13 = (objc_class *)MEMORY[0x263F6E3A8];
  id v14 = a8;
  id v15 = a7;
  id v16 = objc_alloc_init(v13);
  v17 = objc_msgSend(MEMORY[0x263F6E3A0], "lt_initWithMtId:sessionId:", v15, v14);

  [v16 setEventMetadata:v17];
  id v18 = objc_msgSend(MEMORY[0x263F6E410], "lt_initWithSourceOrTargetLanguage:isAutoplayTranslation:playbackSpeed:audioChannel:", a3, v11, a5, a6);
  [v16 setTranslationTTSPlayed:v18];

  id v19 = [MEMORY[0x263F6C818] sharedAnalytics];
  id v20 = [v19 defaultMessageStream];
  v21 = objc_msgSend(v15, "ltd_safeUUID");

  [v20 emitMessage:v16 isolatedStreamUUID:v21];
  id v22 = _LTOSLogSELFLogging();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
    +[_LTDSELFLoggingProduction translationTTSPlayed:isAutoplayTranslation:ttsPlaybackSpeed:audioChannel:mtId:sessionId:](v22);
  }
}

+ (void)languageIdentificationCompletedWithInputSource:(int64_t)a3 topLocale:(id)a4 lowConfidenceLocales:(id)a5 mtId:(id)a6 sessionId:(id)a7
{
  BOOL v11 = (objc_class *)MEMORY[0x263F6E3A8];
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = objc_alloc_init(v11);
  v17 = objc_msgSend(MEMORY[0x263F6E3A0], "lt_initWithMtId:sessionId:", v13, v12);

  [v16 setEventMetadata:v17];
  id v18 = objc_msgSend(MEMORY[0x263F6E3F8], "lt_initWithInputSource:topLocale:lowConfidenceLocales:", a3, v15, v14);

  [v16 setLanguageIdentificationCompleted:v18];
  id v19 = [MEMORY[0x263F6C818] sharedAnalytics];
  id v20 = [v19 defaultMessageStream];
  v21 = objc_msgSend(v13, "ltd_safeUUID");

  [v20 emitMessage:v16 isolatedStreamUUID:v21];
  id v22 = _LTOSLogSELFLogging();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
    +[_LTDSELFLoggingProduction languageIdentificationCompletedWithInputSource:topLocale:lowConfidenceLocales:mtId:sessionId:](v22);
  }
}

+ (void)frameworkRequestSentWithFrameworkRequestId:(id)a3 qssSessionId:(id)a4 requestType:(int64_t)a5 requestRoute:(int64_t)a6 requestSize:(unint64_t)a7 mtId:(id)a8 sessionId:(id)a9
{
  id v15 = (objc_class *)MEMORY[0x263F6E3A8];
  id v16 = a9;
  id v17 = a8;
  id v18 = a4;
  id v19 = a3;
  id v20 = objc_alloc_init(v15);
  v21 = objc_msgSend(MEMORY[0x263F6E3A0], "lt_initWithMtId:sessionId:", v17, v16);

  [v20 setEventMetadata:v21];
  id v22 = objc_msgSend(MEMORY[0x263F6E3C0], "lt_initWithFrameworkRequestId:qssSessionId:requestType:requestRoute:requestSize:", v19, v18, a5, a6, a7);

  [v20 setFrameworkRequestSent:v22];
  v23 = [MEMORY[0x263F6C818] sharedAnalytics];
  v24 = [v23 defaultMessageStream];
  v25 = objc_msgSend(v17, "ltd_safeUUID");

  [v24 emitMessage:v20 isolatedStreamUUID:v25];
  v26 = _LTOSLogSELFLogging();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
    +[_LTDSELFLoggingProduction frameworkRequestSentWithFrameworkRequestId:qssSessionId:requestType:requestRoute:requestSize:mtId:sessionId:](v26);
  }
}

+ (void)frameworkRequestResponseReceivedWithFrameworkRequestId:(id)a3 requestRoute:(int64_t)a4 mtId:(id)a5 sessionId:(id)a6 numberOfSentences:(unint64_t)a7
{
  BOOL v11 = (objc_class *)MEMORY[0x263F6E3A8];
  id v12 = a6;
  id v13 = a5;
  id v14 = a3;
  id v15 = objc_alloc_init(v11);
  id v16 = objc_msgSend(MEMORY[0x263F6E3A0], "lt_initWithMtId:sessionId:", v13, v12);

  [v15 setEventMetadata:v16];
  id v17 = objc_msgSend(MEMORY[0x263F6E3B8], "lt_initWithFrameworkRequestId:requestRoute:numberOfSentences:", v14, a4, a7);

  [v15 setFrameworkRequestResponseReceived:v17];
  id v18 = [MEMORY[0x263F6C818] sharedAnalytics];
  id v19 = [v18 defaultMessageStream];
  id v20 = objc_msgSend(v13, "ltd_safeUUID");

  [v19 emitMessage:v15 isolatedStreamUUID:v20];
  v21 = _LTOSLogSELFLogging();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
    +[_LTDSELFLoggingProduction frameworkRequestResponseReceivedWithFrameworkRequestId:requestRoute:mtId:sessionId:numberOfSentences:](v21);
  }
}

+ (void)_sendEventWithContext:(void *)a1 mtId:sessionId:.cold.1(void *a1)
{
  id v2 = a1;
  v3 = [(id)OUTLINED_FUNCTION_1_5() dictionaryRepresentation];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_4(&dword_2600DC000, v4, v5, "[Production] Invocation context event sent %{sensitive}@", v6, v7, v8, v9, v10);
}

+ (void)startTier1WithLinkId:(void *)a1 appBundleId:mtId:sessionId:.cold.1(void *a1)
{
  id v2 = a1;
  v3 = [(id)OUTLINED_FUNCTION_1_5() dictionaryRepresentation];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_4(&dword_2600DC000, v4, v5, "[Production] Invocation startedTier1 event sent %{sensitive}@", v6, v7, v8, v9, v10);
}

+ (void)userDismissedTextBoxWithPayload:(void *)a1 localePair:mtId:sessionId:.cold.1(void *a1)
{
  id v2 = a1;
  v3 = [(id)OUTLINED_FUNCTION_1_5() dictionaryRepresentation];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_4(&dword_2600DC000, v4, v5, "[Production] Invocation appTextBoxDismissed event sent %{sensitive}@", v6, v7, v8, v9, v10);
}

+ (void)userPressedNextButtonWithPayload:(void *)a1 localePair:mtId:sessionId:.cold.1(void *a1)
{
  id v2 = a1;
  v3 = [(id)OUTLINED_FUNCTION_1_5() dictionaryRepresentation];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_4(&dword_2600DC000, v4, v5, "[Production] Invocation appNextButtonTapped event sent %{sensitive}@", v6, v7, v8, v9, v10);
}

+ (void)userTimeoutWithPayload:(void *)a1 localePair:mtId:sessionId:.cold.1(void *a1)
{
  id v2 = a1;
  v3 = [(id)OUTLINED_FUNCTION_1_5() dictionaryRepresentation];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_4(&dword_2600DC000, v4, v5, "[Production] Invocation appTimedOut event sent %{sensitive}@", v6, v7, v8, v9, v10);
}

+ (void)appBackgroundedWithPayload:(void *)a1 localePair:mtId:sessionId:.cold.1(void *a1)
{
  id v2 = a1;
  v3 = [(id)OUTLINED_FUNCTION_1_5() dictionaryRepresentation];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_4(&dword_2600DC000, v4, v5, "[Production] Invocation appBackgrounded event sent %{sensitive}@", v6, v7, v8, v9, v10);
}

+ (void)translationTTSPlayed:(void *)a1 isAutoplayTranslation:ttsPlaybackSpeed:audioChannel:mtId:sessionId:.cold.1(void *a1)
{
  id v2 = a1;
  v3 = [(id)OUTLINED_FUNCTION_1_5() dictionaryRepresentation];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_4(&dword_2600DC000, v4, v5, "[Production] Invocation translationTTSPlayed request sent event sent %{sensitive}@", v6, v7, v8, v9, v10);
}

+ (void)languageIdentificationCompletedWithInputSource:(void *)a1 topLocale:lowConfidenceLocales:mtId:sessionId:.cold.1(void *a1)
{
  id v2 = a1;
  v3 = [(id)OUTLINED_FUNCTION_1_5() dictionaryRepresentation];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_4(&dword_2600DC000, v4, v5, "[Production] Invocation languageIdentificationCompleted event sent %{sensitive}@", v6, v7, v8, v9, v10);
}

+ (void)frameworkRequestSentWithFrameworkRequestId:(void *)a1 qssSessionId:requestType:requestRoute:requestSize:mtId:sessionId:.cold.1(void *a1)
{
  id v2 = a1;
  v3 = [(id)OUTLINED_FUNCTION_1_5() dictionaryRepresentation];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_4(&dword_2600DC000, v4, v5, "[Production] Invocation framework request sent event sent %{sensitive}@", v6, v7, v8, v9, v10);
}

+ (void)frameworkRequestResponseReceivedWithFrameworkRequestId:(void *)a1 requestRoute:mtId:sessionId:numberOfSentences:.cold.1(void *a1)
{
  id v2 = a1;
  v3 = [(id)OUTLINED_FUNCTION_1_5() dictionaryRepresentation];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_4(&dword_2600DC000, v4, v5, "[Production] Invocation framework request response received event sent %{sensitive}@", v6, v7, v8, v9, v10);
}

@end