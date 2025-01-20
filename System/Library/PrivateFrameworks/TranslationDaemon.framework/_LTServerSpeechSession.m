@interface _LTServerSpeechSession
- (NSUUID)sessionID;
- (_LTDSELFLoggingManager)selfLoggingManager;
- (_LTHybridEndpointer)endpointer;
- (_LTLanguageDetector)languageDetector;
- (_LTServerSpeechSession)initWithEngine:(id)a3 delegate:(id)a4 selfLoggingManager:(id)a5;
- (_LTSpeechTranslationDelegate)delegate;
- (_LTTranslationEngine)engine;
- (id)completionHandler;
- (void)_startSpeechTranslationWithContext:(id)a3;
- (void)_translateSpeechAudioData:(id)a3;
- (void)addSpeechAudioData:(id)a3;
- (void)cancel;
- (void)delegateTranslationDidFinishWithError:(id)a3;
- (void)endAudio;
- (void)hybridEndpointerFoundEndpoint;
- (void)languageDetectionCompleted;
- (void)languageDetectionResult:(id)a3;
- (void)serverEndpointerFeatures:(id)a3 locale:(id)a4;
- (void)setCompletionHandler:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEngine:(id)a3;
- (void)setSelfLoggingManager:(id)a3;
- (void)setSessionID:(id)a3;
- (void)speechActivityDetected;
- (void)speechRecognitionResult:(id)a3;
- (void)startSpeechTranslationWithContext:(id)a3;
- (void)startTextToSpeechTranslationWithContext:(id)a3 text:(id)a4;
- (void)translationDidFinishWithError:(id)a3;
- (void)translatorDidTranslate:(id)a3;
@end

@implementation _LTServerSpeechSession

- (_LTServerSpeechSession)initWithEngine:(id)a3 delegate:(id)a4 selfLoggingManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)_LTServerSpeechSession;
  v12 = [(_LTServerSpeechSession *)&v22 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_engine, a3);
    objc_storeStrong((id *)&v13->_delegate, a4);
    objc_storeStrong((id *)&v13->_selfLoggingManager, a5);
    v14 = objc_alloc_init(_LTHybridEndpointer);
    endpointer = v13->_endpointer;
    v13->_endpointer = v14;

    dispatch_queue_t v16 = dispatch_queue_create("com.apple.translation.session", 0);
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v16;

    v18 = [[_LTLanguageDetector alloc] initWithSelfLoggingManager:v13->_selfLoggingManager];
    languageDetector = v13->_languageDetector;
    v13->_languageDetector = v18;

    v20 = v13;
  }

  return v13;
}

- (void)startSpeechTranslationWithContext:(id)a3
{
  id v10 = a3;
  *(_WORD *)&self->_expectFinalLidResult = 0;
  self->_translationFinished = 0;
  atomic_store(0, (unsigned __int8 *)&self->_speechActivityDetected);
  translationError = self->_translationError;
  self->_translationError = 0;

  objc_storeStrong((id *)&self->_context, a3);
  if ([v10 enableVAD])
  {
    v6 = [[_LTSpeechActivityDetector alloc] initWithDelegate:self];
    speechDetector = self->_speechDetector;
    self->_speechDetector = v6;

    v8 = [[_LTSpeechDataQueue alloc] initForSeconds:_LTPreferencesVADAudioCacheMaxDuration()];
    cache = self->_cache;
    self->_cache = v8;
  }
  else
  {
    atomic_store(1u, (unsigned __int8 *)&self->_speechActivityDetected);
    [(_LTServerSpeechSession *)self _startSpeechTranslationWithContext:v10];
  }
}

- (void)_startSpeechTranslationWithContext:(id)a3
{
  id v4 = a3;
  if ([v4 autodetectLanguage])
  {
    self->_expectFinalLidResult = 1;
    [(_LTLanguageDetector *)self->_languageDetector startLanguageDetectionWithContext:v4 delegate:self];
  }
  [(_LTHybridEndpointer *)self->_endpointer startEndpointingWithContext:v4 delegate:self];
  [(_LTTranslationEngine *)self->_engine startSpeechTranslationWithContext:v4 delegate:self];
}

- (void)startTextToSpeechTranslationWithContext:(id)a3 text:(id)a4
{
  v6 = (_LTTranslationContext *)a3;
  *(_WORD *)&self->_expectFinalLidResult = 0;
  self->_translationFinished = 0;
  translationError = self->_translationError;
  self->_translationError = 0;
  id v10 = a4;

  context = self->_context;
  self->_context = v6;
  id v9 = v6;

  [(_LTTranslationEngine *)self->_engine startTextToSpeechTranslationWithContext:v9 text:v10 delegate:self];
}

- (void)addSpeechAudioData:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = atomic_load((unsigned __int8 *)&self->_speechActivityDetected);
  if (v5)
  {
    cache = self->_cache;
    if (cache)
    {
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __45___LTServerSpeechSession_addSpeechAudioData___block_invoke;
      v8[3] = &unk_265547FD8;
      v8[4] = self;
      [(_LTSpeechDataQueue *)cache consumeAll:v8];
      v7 = self->_cache;
      self->_cache = 0;
    }
    [(_LTServerSpeechSession *)self _translateSpeechAudioData:v4];
  }
  else
  {
    [(_LTSpeechActivityDetector *)self->_speechDetector addSpeechAudioData:v4];
    [(_LTSpeechDataQueue *)self->_cache addSpeechAudioData:v4];
  }
}

- (void)_translateSpeechAudioData:(id)a3
{
  id v4 = a3;
  -[_LTLanguageDetector addSpeechAudioData:](self->_languageDetector, "addSpeechAudioData:");
  [(_LTHybridEndpointer *)self->_endpointer addSpeechAudioData:v4];
  [(_LTTranslationEngine *)self->_engine addSpeechAudioData:v4];
}

- (void)endAudio
{
}

- (void)cancel
{
}

- (void)delegateTranslationDidFinishWithError:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (objc_opt_respondsToSelector()) {
    [(_LTSpeechTranslationDelegate *)self->_delegate translationDidFinishWithError:v5];
  }
  completionHandler = (void (**)(id, id))self->_completionHandler;
  if (completionHandler) {
    completionHandler[2](completionHandler, v5);
  }
}

- (void)speechActivityDetected
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_speechActivityDetected);
  if ((v2 & 1) == 0)
  {
    [(_LTServerSpeechSession *)self _startSpeechTranslationWithContext:self->_context];
    speechDetector = self->_speechDetector;
    self->_speechDetector = 0;

    if (objc_opt_respondsToSelector()) {
      [(_LTSpeechTranslationDelegate *)self->_delegate speechActivityDetected];
    }
    atomic_store(1u, (unsigned __int8 *)&self->_speechActivityDetected);
  }
}

- (void)languageDetectionResult:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [(_LTSpeechTranslationDelegate *)self->_delegate languageDetectionResult:v4];
  }
  if (objc_opt_respondsToSelector()) {
    [(_LTTranslationEngine *)self->_engine setLanguagesRecognized:v4 context:self->_context];
  }
  if ([v4 isFinal])
  {
    objc_initWeak(&location, self);
    queue = self->_queue;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __50___LTServerSpeechSession_languageDetectionResult___block_invoke;
    v6[3] = &unk_2655477F0;
    objc_copyWeak(&v7, &location);
    dispatch_async(queue, v6);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (void)languageDetectionCompleted
{
  if (objc_opt_respondsToSelector())
  {
    delegate = self->_delegate;
    [(_LTSpeechTranslationDelegate *)delegate languageDetectionCompleted];
  }
}

- (void)hybridEndpointerFoundEndpoint
{
}

- (void)serverEndpointerFeatures:(id)a3 locale:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  [(_LTHybridEndpointer *)self->_endpointer setServerEndpointerFeatures:v7 withLocale:v6];
  if (objc_opt_respondsToSelector()) {
    [(_LTSpeechTranslationDelegate *)self->_delegate serverEndpointerFeatures:v7 locale:v6];
  }
}

- (void)speechRecognitionResult:(id)a3
{
  id v4 = a3;
  -[_LTLanguageDetector addSpeechRecognitionResult:](self->_languageDetector, "addSpeechRecognitionResult:");
  if (objc_opt_respondsToSelector()) {
    [(_LTSpeechTranslationDelegate *)self->_delegate speechRecognitionResult:v4];
  }
}

- (void)translatorDidTranslate:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [(_LTSpeechTranslationDelegate *)self->_delegate translatorDidTranslate:v4];
  }
}

- (void)translationDidFinishWithError:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56___LTServerSpeechSession_translationDidFinishWithError___block_invoke;
  block[3] = &unk_2655477C8;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (NSUUID)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (_LTTranslationEngine)engine
{
  return self->_engine;
}

- (void)setEngine:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (_LTLanguageDetector)languageDetector
{
  return self->_languageDetector;
}

- (_LTHybridEndpointer)endpointer
{
  return self->_endpointer;
}

- (_LTSpeechTranslationDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (_LTDSELFLoggingManager)selfLoggingManager
{
  return self->_selfLoggingManager;
}

- (void)setSelfLoggingManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selfLoggingManager, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_endpointer, 0);
  objc_storeStrong((id *)&self->_languageDetector, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_engine, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_speechDetector, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_translationError, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end