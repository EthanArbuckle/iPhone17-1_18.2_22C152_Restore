@interface SRDRequestDispatcher
- (BOOL)implementsCommand:(id)a3 forDomain:(id)a4;
- (BOOL)sessionExistsForAssistantId:(id)a3;
- (SRDRequestDispatcher)initWithMock:(id)a3;
- (SRDRequestDispatcher)initWithRequestDispatcherServiceHelper:(id)a3;
- (SRDRequestDispatcher)initWithRequestDispatcherServiceHelper:(id)a3 bridgeConnectionListeners:(id)a4;
- (SRDRequestDispatcherInternal)underlyingObject;
- (id)commandsForDomain:(id)a3;
- (id)domains;
- (void)announceNotificationHandlingStateUpdatedWithAssistantId:(id)a3 toState:(int64_t)a4;
- (void)cancelRequestWithAssistantId:(id)a3 requestId:(id)a4 reason:(int64_t)a5;
- (void)endDictationSessionWithAssistantId:(id)a3;
- (void)endSessionWithAssistantId:(id)a3;
- (void)handleCommand:(id)a3 executionContextInfo:(id)a4 reply:(id)a5;
- (void)pauseDictationRecognitionWithAssistantId:(id)a3 requestId:(id)a4;
- (void)postTestResultCandidateWithAssistantId:(id)a3 requestId:(id)a4 rcId:(id)a5 recognitionSausage:(id)a6;
- (void)postTestResultSelectedWithAssistantId:(id)a3 requestId:(id)a4 rcId:(id)a5;
- (void)prewarmWithAssistantId:(id)a3 languageCode:(id)a4 prewarmOptions:(unint64_t)a5 sharedUserId:(id)a6;
- (void)requestCompletedWithAssistantId:(id)a3 requestId:(id)a4;
- (void)resumeDictationRecognitionWithAssistantId:(id)a3 requestId:(id)a4 prefixText:(id)a5 postfixText:(id)a6 selectedText:(id)a7;
- (void)startCorrectionSpeechRequestWithAssistantId:(id)a3 requestId:(id)a4 inputOrigin:(id)a5 utterance:(id)a6 previousUtterance:(id)a7 requestContextData:(id)a8;
- (void)startDirectActionRequestWithAssistantId:(id)a3 requestId:(id)a4 inputOrigin:(id)a5 utterance:(id)a6 directAction:(id)a7 requestExecutionParameters:(id)a8 requestContextData:(id)a9;
- (void)startLocalRequestWithAssistantId:(id)a3 requestId:(id)a4 inputOrigin:(id)a5 requestContextData:(id)a6;
- (void)startSessionWithConfiguration:(id)a3;
- (void)startSpeechDictationRequestWithAssistantId:(id)a3 requestId:(id)a4 inputOrigin:(id)a5 dictationOptions:(id)a6;
- (void)startSpeechDictationSessionWithAssistantId:(id)a3 languageCode:(id)a4 recognitionOnDevice:(BOOL)a5;
- (void)startSpeechRequestWithAssistantId:(id)a3 requestId:(id)a4 inputOrigin:(id)a5 location:(id)a6 asrOnServer:(BOOL)a7 requestContextData:(id)a8;
- (void)startTestSpeechRequestWithAssistantId:(id)a3 requestId:(id)a4 enableASR:(BOOL)a5 inputOrigin:(id)a6 location:(id)a7 jitContext:(id)a8 overrideModelPath:(id)a9 requestContextData:(id)a10;
- (void)startTextRequestWithAssistantId:(id)a3 requestId:(id)a4 inputOrigin:(id)a5 utterance:(id)a6 requestContextData:(id)a7;
- (void)startUnderstandingDictationRequestWithAssistantId:(id)a3 requestId:(id)a4 inputOrigin:(id)a5 dictationOptions:(id)a6;
- (void)startUnderstandingDictationSessionWithAssistantId:(id)a3 languageCode:(id)a4 understandingOnDevice:(BOOL)a5;
- (void)startUnderstandingOnServerRequestWithAssistantId:(id)a3 requestId:(id)a4 inputOrigin:(id)a5;
- (void)startUnderstandingOnServerTextRequestWithAssistantId:(id)a3 requestId:(id)a4 inputOrigin:(id)a5 utterance:(id)a6 requestContextData:(id)a7;
- (void)updateVoiceCommandContextWithAssistantId:(id)a3 requestId:(id)a4 prefixText:(id)a5 postfixText:(id)a6 selectedText:(id)a7 disambiguationActive:(id)a8 cursorInVisibleText:(id)a9 favorCommandSuppression:(id)a10 abortCommandSuppression:(id)a11;
- (void)updateVoiceCommandContextWithAssistantId:(id)a3 requestId:(id)a4 prefixText:(id)a5 postfixText:(id)a6 selectedText:(id)a7 disambiguationActive:(id)a8 cursorInVisibleText:(id)a9 favorCommandSuppression:(id)a10 abortCommandSuppression:(id)a11 undoEvent:(id)a12;
@end

@implementation SRDRequestDispatcher

- (SRDRequestDispatcher)initWithRequestDispatcherServiceHelper:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v7 = [(SRDRequestDispatcher *)self initWithRequestDispatcherServiceHelper:v5 bridgeConnectionListeners:v6];

  return v7;
}

- (SRDRequestDispatcher)initWithRequestDispatcherServiceHelper:(id)a3 bridgeConnectionListeners:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SRDRequestDispatcher;
  v8 = [(SRDRequestDispatcher *)&v12 init];
  if (v8)
  {
    v9 = [[SRDRequestDispatcherInternal alloc] initWithRequestDispatcherServiceHelper:v6 bridgeConnectionListeners:v7];
    underlyingObject = v8->_underlyingObject;
    v8->_underlyingObject = v9;
  }
  return v8;
}

- (SRDRequestDispatcher)initWithMock:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SRDRequestDispatcher;
  id v6 = [(SRDRequestDispatcher *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_underlyingObject, a3);
  }

  return v7;
}

- (void)cancelRequestWithAssistantId:(id)a3 requestId:(id)a4 reason:(int64_t)a5
{
}

- (id)commandsForDomain:(id)a3
{
  return [(SRDRequestDispatcherInternal *)self->_underlyingObject commandsForDomain:a3];
}

- (id)domains
{
  return [(SRDRequestDispatcherInternal *)self->_underlyingObject domains];
}

- (void)handleCommand:(id)a3 executionContextInfo:(id)a4 reply:(id)a5
{
}

- (BOOL)implementsCommand:(id)a3 forDomain:(id)a4
{
  return [(SRDRequestDispatcherInternal *)self->_underlyingObject implementsCommand:a3 forDomain:a4];
}

- (void)requestCompletedWithAssistantId:(id)a3 requestId:(id)a4
{
}

- (BOOL)sessionExistsForAssistantId:(id)a3
{
  return [(SRDRequestDispatcherInternal *)self->_underlyingObject sessionExistsForAssistantId:a3];
}

- (void)startSessionWithConfiguration:(id)a3
{
}

- (void)prewarmWithAssistantId:(id)a3 languageCode:(id)a4 prewarmOptions:(unint64_t)a5 sharedUserId:(id)a6
{
}

- (void)endSessionWithAssistantId:(id)a3
{
}

- (void)startSpeechRequestWithAssistantId:(id)a3 requestId:(id)a4 inputOrigin:(id)a5 location:(id)a6 asrOnServer:(BOOL)a7 requestContextData:(id)a8
{
}

- (void)startLocalRequestWithAssistantId:(id)a3 requestId:(id)a4 inputOrigin:(id)a5 requestContextData:(id)a6
{
}

- (void)startTestSpeechRequestWithAssistantId:(id)a3 requestId:(id)a4 enableASR:(BOOL)a5 inputOrigin:(id)a6 location:(id)a7 jitContext:(id)a8 overrideModelPath:(id)a9 requestContextData:(id)a10
{
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

- (void)startDirectActionRequestWithAssistantId:(id)a3 requestId:(id)a4 inputOrigin:(id)a5 utterance:(id)a6 directAction:(id)a7 requestExecutionParameters:(id)a8 requestContextData:(id)a9
{
}

- (void)startCorrectionSpeechRequestWithAssistantId:(id)a3 requestId:(id)a4 inputOrigin:(id)a5 utterance:(id)a6 previousUtterance:(id)a7 requestContextData:(id)a8
{
}

- (void)startSpeechDictationSessionWithAssistantId:(id)a3 languageCode:(id)a4 recognitionOnDevice:(BOOL)a5
{
}

- (void)startSpeechDictationRequestWithAssistantId:(id)a3 requestId:(id)a4 inputOrigin:(id)a5 dictationOptions:(id)a6
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
}

- (void)pauseDictationRecognitionWithAssistantId:(id)a3 requestId:(id)a4
{
}

- (void)resumeDictationRecognitionWithAssistantId:(id)a3 requestId:(id)a4 prefixText:(id)a5 postfixText:(id)a6 selectedText:(id)a7
{
}

- (void)updateVoiceCommandContextWithAssistantId:(id)a3 requestId:(id)a4 prefixText:(id)a5 postfixText:(id)a6 selectedText:(id)a7 disambiguationActive:(id)a8 cursorInVisibleText:(id)a9 favorCommandSuppression:(id)a10 abortCommandSuppression:(id)a11
{
}

- (void)updateVoiceCommandContextWithAssistantId:(id)a3 requestId:(id)a4 prefixText:(id)a5 postfixText:(id)a6 selectedText:(id)a7 disambiguationActive:(id)a8 cursorInVisibleText:(id)a9 favorCommandSuppression:(id)a10 abortCommandSuppression:(id)a11 undoEvent:(id)a12
{
}

- (void)announceNotificationHandlingStateUpdatedWithAssistantId:(id)a3 toState:(int64_t)a4
{
}

- (SRDRequestDispatcherInternal)underlyingObject
{
  return self->_underlyingObject;
}

- (void).cxx_destruct
{
}

@end