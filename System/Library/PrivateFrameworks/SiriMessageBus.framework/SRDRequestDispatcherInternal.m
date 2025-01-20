@interface SRDRequestDispatcherInternal
- (BOOL)implementsCommand:(id)a3 forDomain:(id)a4;
- (BOOL)sessionExistsForAssistantId:(id)a3;
- (SRDRequestDispatcherInternal)init;
- (SRDRequestDispatcherInternal)initWithRequestDispatcherServiceHelper:(id)a3 bridgeConnectionListeners:(id)a4;
- (id)commandsForDomain:(id)a3;
- (id)domains;
- (void)announceNotificationHandlingStateUpdatedWithAssistantId:(id)a3 toState:(int64_t)a4;
- (void)cancelRequestWithAssistantId:(id)a3 requestId:(id)a4 reason:(int64_t)a5;
- (void)endDictationSessionWithAssistantId:(id)a3;
- (void)endSessionWithAssistantId:(id)a3 withDelay:(BOOL)a4;
- (void)handleCommand:(id)a3 executionContextInfo:(id)a4 reply:(id)a5;
- (void)pauseDictationRecognitionWithAssistantId:(id)a3 requestId:(id)a4;
- (void)postTestResultCandidateWithAssistantId:(id)a3 requestId:(id)a4 rcId:(id)a5 recognitionSausage:(id)a6;
- (void)postTestResultSelectedWithAssistantId:(id)a3 requestId:(id)a4 rcId:(id)a5;
- (void)prewarmWithAssistantId:(id)a3 languageCode:(id)a4 prewarmOptions:(unint64_t)a5 sharedUserId:(id)a6;
- (void)requestCompletedWithAssistantId:(id)a3 requestId:(id)a4;
- (void)resumeDictationRecognitionWithAssistantId:(id)a3 requestId:(id)a4 prefixText:(id)a5 postfixText:(id)a6 selectedText:(id)a7;
- (void)sendMultiUserInfoWithDeviceAssistantId:(id)a3 multiUserInfo:(id)a4 isRMVEnabled:(BOOL)a5;
- (void)startCorrectionSpeechRequestWithAssistantId:(id)a3 requestId:(id)a4 inputOrigin:(id)a5 utterance:(id)a6 previousUtterance:(id)a7 requestContextData:(id)a8;
- (void)startDirectActionRequestWithAssistantId:(id)a3 requestId:(id)a4 inputOrigin:(id)a5 directAction:(id)a6 requestExecutionParameters:(id)a7 requestContextData:(id)a8;
- (void)startLocalRequestWithAssistantId:(id)a3 requestId:(id)a4 inputOrigin:(id)a5 requestContextData:(id)a6;
- (void)startSessionWithConfiguration:(id)a3;
- (void)startSpeechDictationSessionWithAssistantId:(id)a3 languageCode:(id)a4 recognitionOnDevice:(BOOL)a5;
- (void)startSpeechRequestWithAssistantId:(id)a3 requestId:(id)a4 inputOrigin:(id)a5 location:(id)a6 asrOnServer:(BOOL)a7 requestContextData:(id)a8;
- (void)startTestSpeechRequestWithAssistantId:(id)a3 requestId:(id)a4 enableASR:(BOOL)a5 inputOrigin:(id)a6 location:(id)a7 jitContext:(id)a8 overrideModelPath:(id)a9 requestContextData:(id)a10;
- (void)startTextRequestWithAssistantId:(id)a3 requestId:(id)a4 inputOrigin:(id)a5 utterance:(id)a6 requestContextData:(id)a7;
- (void)startUnderstandingDictationRequestWithAssistantId:(id)a3 requestId:(id)a4 inputOrigin:(id)a5 dictationOptions:(id)a6;
- (void)startUnderstandingDictationSessionWithAssistantId:(id)a3 languageCode:(id)a4 understandingOnDevice:(BOOL)a5;
- (void)startUnderstandingOnServerRequestWithAssistantId:(id)a3 requestId:(id)a4 inputOrigin:(id)a5;
- (void)startUnderstandingOnServerTextRequestWithAssistantId:(id)a3 requestId:(id)a4 inputOrigin:(id)a5 utterance:(id)a6 requestContextData:(id)a7;
- (void)updateVoiceCommandContextWithAssistantId:(id)a3 requestId:(id)a4 prefixText:(id)a5 postfixText:(id)a6 selectedText:(id)a7 disambiguationActive:(id)a8 cursorInVisibleText:(id)a9 favorCommandSuppression:(id)a10 abortCommandSuppression:(id)a11 undoEvent:(id)a12;
@end

@implementation SRDRequestDispatcherInternal

- (SRDRequestDispatcherInternal)initWithRequestDispatcherServiceHelper:(id)a3 bridgeConnectionListeners:(id)a4
{
  return (SRDRequestDispatcherInternal *)RequestDispatcher.init(requestDispatcherServiceHelper:bridgeConnectionListeners:)();
}

- (id)domains
{
  v2 = self;
  sub_1C9EE1BFC();

  v3 = (void *)sub_1C9F080E8();
  swift_bridgeObjectRelease();
  return v3;
}

- (id)commandsForDomain:(id)a3
{
  sub_1C9F07FE8();
  v4 = self;
  sub_1C9EE1FE0();

  swift_bridgeObjectRelease();
  v5 = (void *)sub_1C9F080E8();
  swift_bridgeObjectRelease();
  return v5;
}

- (BOOL)implementsCommand:(id)a3 forDomain:(id)a4
{
  sub_1C9F07FE8();
  sub_1C9F07FE8();
  v5 = self;
  sub_1C9EE23D4();
  char v7 = v6;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

- (void)handleCommand:(id)a3 executionContextInfo:(id)a4 reply:(id)a5
{
  v8 = _Block_copy(a5);
  if (v8)
  {
    *(void *)(swift_allocObject() + 16) = v8;
    v8 = sub_1C9EFB938;
  }
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  sub_1C9EE27FC();
  sub_1C9EFB8F0((uint64_t)v8);
}

- (void)cancelRequestWithAssistantId:(id)a3 requestId:(id)a4 reason:(int64_t)a5
{
  sub_1C9F07FE8();
  sub_1C9F07FE8();
  char v6 = self;
  sub_1C9EE3030();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)requestCompletedWithAssistantId:(id)a3 requestId:(id)a4
{
}

- (void)startSpeechRequestWithAssistantId:(id)a3 requestId:(id)a4 inputOrigin:(id)a5 location:(id)a6 asrOnServer:(BOOL)a7 requestContextData:(id)a8
{
  HIDWORD(v24) = a7;
  uint64_t v23 = sub_1C9F07FE8();
  uint64_t v12 = v11;
  uint64_t v13 = sub_1C9F07FE8();
  uint64_t v15 = v14;
  uint64_t v16 = sub_1C9F07FE8();
  uint64_t v18 = v17;
  id v19 = a6;
  id v20 = a8;
  v21 = self;
  sub_1C9EE4004(v23, v12, v13, v15, v16, v18, (uint64_t)a6, HIDWORD(v24), (uint64_t)v20, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31,
    v32,
    v33);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (BOOL)sessionExistsForAssistantId:(id)a3
{
  sub_1C9F07FE8();
  v4 = self;
  sub_1C9EE58C8();
  char v6 = v5;

  swift_bridgeObjectRelease();
  return v6 & 1;
}

- (void)prewarmWithAssistantId:(id)a3 languageCode:(id)a4 prewarmOptions:(unint64_t)a5 sharedUserId:(id)a6
{
  sub_1C9F07FE8();
  sub_1C9F07FE8();
  if (a6) {
    sub_1C9F07FE8();
  }
  v8 = self;
  sub_1C9EE5CF4();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)startSessionWithConfiguration:(id)a3
{
  id v4 = a3;
  char v5 = self;
  sub_1C9EE6410();
}

- (void)endSessionWithAssistantId:(id)a3 withDelay:(BOOL)a4
{
  sub_1C9F07FE8();
  char v5 = self;
  sub_1C9EE7200();

  swift_bridgeObjectRelease();
}

- (void)startLocalRequestWithAssistantId:(id)a3 requestId:(id)a4 inputOrigin:(id)a5 requestContextData:(id)a6
{
}

- (void)startTestSpeechRequestWithAssistantId:(id)a3 requestId:(id)a4 enableASR:(BOOL)a5 inputOrigin:(id)a6 location:(id)a7 jitContext:(id)a8 overrideModelPath:(id)a9 requestContextData:(id)a10
{
  HIDWORD(v29) = a5;
  id v12 = a9;
  uint64_t v28 = sub_1C9F07FE8();
  uint64_t v14 = v13;
  uint64_t v26 = sub_1C9F07FE8();
  uint64_t v16 = v15;
  uint64_t v25 = sub_1C9F07FE8();
  uint64_t v18 = v17;
  if (a8) {
    a8 = (id)sub_1C9F080F8();
  }
  if (a9)
  {
    uint64_t v19 = sub_1C9F07FE8();
    id v12 = v20;
  }
  else
  {
    uint64_t v19 = 0;
  }
  id v21 = a7;
  id v22 = a10;
  uint64_t v23 = self;
  sub_1C9EE93F0(v28, v14, v26, v16, HIDWORD(v29), v25, v18, (uint64_t)a7, (uint64_t)a8, v19, (uint64_t)v12, (uint64_t)v22, v24, v25, v26, (uint64_t)self, v28, v29, v30,
    v31,
    v32,
    v33,
    v34,
    v35);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)postTestResultCandidateWithAssistantId:(id)a3 requestId:(id)a4 rcId:(id)a5 recognitionSausage:(id)a6
{
}

- (void)postTestResultSelectedWithAssistantId:(id)a3 requestId:(id)a4 rcId:(id)a5
{
}

- (void)startUnderstandingOnServerRequestWithAssistantId:(id)a3 requestId:(id)a4 inputOrigin:(id)a5
{
}

- (void)startUnderstandingOnServerTextRequestWithAssistantId:(id)a3 requestId:(id)a4 inputOrigin:(id)a5 utterance:(id)a6 requestContextData:(id)a7
{
}

- (void)startTextRequestWithAssistantId:(id)a3 requestId:(id)a4 inputOrigin:(id)a5 utterance:(id)a6 requestContextData:(id)a7
{
}

- (void)startDirectActionRequestWithAssistantId:(id)a3 requestId:(id)a4 inputOrigin:(id)a5 directAction:(id)a6 requestExecutionParameters:(id)a7 requestContextData:(id)a8
{
  uint64_t v25 = sub_1C9F07FE8();
  uint64_t v12 = v11;
  uint64_t v13 = sub_1C9F07FE8();
  uint64_t v15 = v14;
  uint64_t v16 = sub_1C9F07FE8();
  uint64_t v18 = v17;
  if (a6)
  {
    uint64_t v19 = sub_1C9F07FE8();
    a6 = v20;
    if (a7)
    {
LABEL_3:
      uint64_t v21 = sub_1C9F07F78();
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v19 = 0;
    if (a7) {
      goto LABEL_3;
    }
  }
  uint64_t v21 = 0;
LABEL_6:
  id v22 = a8;
  uint64_t v23 = self;
  sub_1C9EF0320(v25, v12, v13, v15, v16, v18, v19, (uint64_t)a6, v21, (uint64_t)v22, (uint64_t)self, v25, v26, v27, v28, v29, v30, v31, v32,
    v33,
    v34);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)startCorrectionSpeechRequestWithAssistantId:(id)a3 requestId:(id)a4 inputOrigin:(id)a5 utterance:(id)a6 previousUtterance:(id)a7 requestContextData:(id)a8
{
  uint64_t v26 = sub_1C9F07FE8();
  uint64_t v11 = v10;
  uint64_t v24 = sub_1C9F07FE8();
  uint64_t v13 = v12;
  uint64_t v14 = sub_1C9F07FE8();
  uint64_t v16 = v15;
  uint64_t v17 = sub_1C9F07FE8();
  uint64_t v19 = v18;
  if (a7)
  {
    uint64_t v20 = sub_1C9F07FE8();
    a7 = v21;
  }
  else
  {
    uint64_t v20 = 0;
  }
  id v22 = a8;
  uint64_t v23 = self;
  sub_1C9EF1134(v26, v11, v24, v13, v14, v16, v17, v19, v20, (uint64_t)a7, (uint64_t)v22, v24, (uint64_t)self, v26, v27, v28, v29, v30, v31,
    v32,
    v33,
    v34,
    v35);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)startSpeechDictationSessionWithAssistantId:(id)a3 languageCode:(id)a4 recognitionOnDevice:(BOOL)a5
{
}

- (void)startUnderstandingDictationSessionWithAssistantId:(id)a3 languageCode:(id)a4 understandingOnDevice:(BOOL)a5
{
}

- (void)startUnderstandingDictationRequestWithAssistantId:(id)a3 requestId:(id)a4 inputOrigin:(id)a5 dictationOptions:(id)a6
{
}

- (void)endDictationSessionWithAssistantId:(id)a3
{
  sub_1C9F07FE8();
  id v4 = self;
  sub_1C9EF4B94();

  swift_bridgeObjectRelease();
}

- (void)pauseDictationRecognitionWithAssistantId:(id)a3 requestId:(id)a4
{
}

- (void)resumeDictationRecognitionWithAssistantId:(id)a3 requestId:(id)a4 prefixText:(id)a5 postfixText:(id)a6 selectedText:(id)a7
{
  uint64_t v24 = sub_1C9F07FE8();
  uint64_t v9 = v8;
  uint64_t v10 = sub_1C9F07FE8();
  uint64_t v12 = v11;
  uint64_t v13 = sub_1C9F07FE8();
  uint64_t v15 = v14;
  uint64_t v16 = sub_1C9F07FE8();
  uint64_t v18 = v17;
  uint64_t v19 = sub_1C9F07FE8();
  uint64_t v21 = v20;
  id v22 = self;
  sub_1C9EF5780(v24, v9, v10, v12, v13, v15, v16, v18, v19, v21, v23, v24, v25, v26, v27, v28, v29, v30, v31,
    v32,
    v33,
    v34);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)updateVoiceCommandContextWithAssistantId:(id)a3 requestId:(id)a4 prefixText:(id)a5 postfixText:(id)a6 selectedText:(id)a7 disambiguationActive:(id)a8 cursorInVisibleText:(id)a9 favorCommandSuppression:(id)a10 abortCommandSuppression:(id)a11 undoEvent:(id)a12
{
  *((void *)&v32 + 1) = a8;
  *(void *)&long long v32 = sub_1C9F07FE8();
  *(void *)&long long v34 = v16;
  uint64_t v31 = sub_1C9F07FE8();
  *((void *)&v33 + 1) = v17;
  if (a5)
  {
    uint64_t v30 = sub_1C9F07FE8();
    *(void *)&long long v33 = v18;
    if (a6) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v29 = 0;
    uint64_t v20 = 0;
    if (a7) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v30 = 0;
  *(void *)&long long v33 = 0;
  if (!a6) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v29 = sub_1C9F07FE8();
  uint64_t v20 = v19;
  if (a7)
  {
LABEL_4:
    uint64_t v21 = sub_1C9F07FE8();
    a7 = v22;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v21 = 0;
LABEL_8:
  uint64_t v23 = self;
  id v24 = a12;
  id v25 = a11;
  id v26 = a10;
  id v27 = a9;
  id v28 = *((id *)&v32 + 1);
  sub_1C9EF60CC(v32, v34, v31, *((uint64_t *)&v33 + 1), v30, v33, v29, v20, v21, (uint64_t)a7, (uint64_t)v28, (uint64_t)v27, (uint64_t)v26, (uint64_t)v25, (uint64_t)v24, (uint64_t)a7, v29, v30, (uint64_t)a9,
    v31,
    v32,
    v33,
    v34,
    v35);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)announceNotificationHandlingStateUpdatedWithAssistantId:(id)a3 toState:(int64_t)a4
{
  sub_1C9F07FE8();
  char v5 = self;
  sub_1C9EF6BD4();

  swift_bridgeObjectRelease();
}

- (void)sendMultiUserInfoWithDeviceAssistantId:(id)a3 multiUserInfo:(id)a4 isRMVEnabled:(BOOL)a5
{
  sub_1C9F07FE8();
  id v7 = a4;
  uint64_t v8 = self;
  sub_1C9EF748C();

  swift_bridgeObjectRelease();
}

- (SRDRequestDispatcherInternal)init
{
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  sub_1C9EFB940((uint64_t)self + OBJC_IVAR___SRDRequestDispatcherInternal_sessionUserId, &qword_1EBC7FD70);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___SRDRequestDispatcherInternal_serverFallbackDisablingUtils);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___SRDRequestDispatcherInternal_featureChecker);
  sub_1C9EFB940((uint64_t)self + OBJC_IVAR___SRDRequestDispatcherInternal_activeUserSessionObserver, (uint64_t *)&unk_1EA5CEC60);
}

@end