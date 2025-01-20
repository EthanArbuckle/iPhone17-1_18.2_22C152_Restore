@interface CACSpeechRecognizer
- (BOOL)isListening;
- (BOOL)isSpeechRecognizerOpen;
- (BOOL)numberMode;
- (BOOL)preventRecognizedTextFeedback;
- (BOOL)requestCloseMatchResults;
- (BOOL)spellingMode;
- (NSString)name;
- (__RXLanguageObject)rxLanguageModel;
- (id)languageModel;
- (unint64_t)recognizerFlags;
- (void)closeSpeechRecognizer;
- (void)dealloc;
- (void)openSpeechRecognizer;
- (void)setCommandInfo:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLanguageModel:(id)a3;
- (void)setName:(id)a3;
- (void)setNumberMode:(BOOL)a3;
- (void)setPreventRecognizedTextFeedback:(BOOL)a3;
- (void)setRecognizerFlags:(unint64_t)a3;
- (void)setRequestCloseMatchResults:(BOOL)a3;
- (void)setSpellingMode:(BOOL)a3;
- (void)startListening;
- (void)stopListening;
@end

@implementation CACSpeechRecognizer

- (void)dealloc
{
  RXRelease(self->_recognizer);
  v3.receiver = self;
  v3.super_class = (Class)CACSpeechRecognizer;
  [(CACSpeechRecognizer *)&v3 dealloc];
}

- (void)setDelegate:(id)a3
{
}

- (id)languageModel
{
  v2 = self;
  objc_sync_enter(v2);
  objc_super v3 = v2->_languageModel;
  objc_sync_exit(v2);

  return v3;
}

- (void)closeSpeechRecognizer
{
  obj = self;
  objc_sync_enter(obj);
  [(CACSpeechRecognizer *)obj stopListening];
  RXRelease(obj->_rxLanguageModel);
  obj->_rxLanguageModel = 0;
  [(CACSpeechRecognizer *)obj setLanguageModel:0];
  RXRelease(obj->_recognizer);
  obj->_recognizer = 0;
  objc_sync_exit(obj);
}

- (BOOL)isSpeechRecognizerOpen
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2->_recognizer != 0;
  objc_sync_exit(v2);

  return v3;
}

- (void)setLanguageModel:(id)a3
{
  v4 = (CACLanguageModel *)a3;
  obj = self;
  objc_sync_enter(obj);
  languageModel = obj->_languageModel;
  obj->_languageModel = v4;

  objc_sync_exit(obj);
}

- (void)openSpeechRecognizer
{
  BOOL v3 = +[CACSpeechSystem speechSystem];
  uint64_t v4 = [v3 recognitionSystemRef];

  if (v4)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __43__CACSpeechRecognizer_openSpeechRecognizer__block_invoke;
    block[3] = &unk_264D12110;
    block[4] = self;
    block[5] = v4;
    dispatch_sync((dispatch_queue_t)sRXAPIDispatchQueue, block);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __43__CACSpeechRecognizer_openSpeechRecognizer__block_invoke_4;
    v5[3] = &unk_264D115D0;
    v5[4] = self;
    dispatch_async((dispatch_queue_t)sRXAPIDispatchQueue, v5);
  }
}

uint64_t __43__CACSpeechRecognizer_openSpeechRecognizer__block_invoke(uint64_t a1)
{
  uint64_t result = RXRecognizerCreate();
  *(void *)(*(void *)(a1 + 32) + 16) = result;
  return result;
}

uint64_t __43__CACSpeechRecognizer_openSpeechRecognizer__block_invoke_2(uint64_t a1, const void *a2)
{
  if (a2)
  {
    uint64_t v4 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
    v5 = *(void **)(a1 + 32);
    v6 = [v5 name];
    [v4 registerSignPostBeginProcessingForSpeechRecognizer:v5 message:v6];

    CFRetain(a2);
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __43__CACSpeechRecognizer_openSpeechRecognizer__block_invoke_3;
  v8[3] = &unk_264D12110;
  v8[4] = *(void *)(a1 + 32);
  v8[5] = a2;
  dispatch_async((dispatch_queue_t)sRXAPIDispatchQueue, v8);
  return +[CACSpeechSystem stopPreventingDisplayDimming];
}

void __43__CACSpeechRecognizer_openSpeechRecognizer__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  [WeakRetained speechRecognizer:*(void *)(a1 + 32) didRecognizeRXResult:*(void *)(a1 + 40)];

  BOOL v3 = *(const void **)(a1 + 40);
  RXRelease(v3);
}

uint64_t __43__CACSpeechRecognizer_openSpeechRecognizer__block_invoke_4(uint64_t result)
{
  if (*(void *)(*(void *)(result + 32) + 16))
  {
    uint64_t v1 = result;
    [NSNumber numberWithInt:20];
    RXObjectSetProperty();
    *(void *)(*(void *)(v1 + 32) + 24) = [*(id *)(*(void *)(v1 + 32) + 32) createRXLanguageObjectRef];
    RXObjectSetProperty();
    RXObjectSetProperty();
    RXObjectSetProperty();
    return RXObjectSetProperty();
  }
  return result;
}

- (void)startListening
{
  v2 = self;
  objc_sync_enter(v2);
  if (![(CACSpeechRecognizer *)v2 isSpeechRecognizerOpen]) {
    [(CACSpeechRecognizer *)v2 openSpeechRecognizer];
  }
  if (v2->_recognizer && !v2->_isListening)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __37__CACSpeechRecognizer_startListening__block_invoke;
    block[3] = &unk_264D115D0;
    block[4] = v2;
    dispatch_async((dispatch_queue_t)sRXAPIDispatchQueue, block);
    v2->_isListening = 1;
    v2->_waitingForResponse = 0;
  }
  objc_sync_exit(v2);
}

uint64_t __37__CACSpeechRecognizer_startListening__block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 16);
  if (result) {
    return RXObjectSetProperty();
  }
  return result;
}

- (void)stopListening
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_recognizer && v2->_isListening)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __36__CACSpeechRecognizer_stopListening__block_invoke;
    block[3] = &unk_264D115D0;
    block[4] = v2;
    dispatch_async((dispatch_queue_t)sRXAPIDispatchQueue, block);
    v2->_waitingForResponse = 1;
    v2->_isListening = 0;
  }
  objc_sync_exit(v2);
}

uint64_t __36__CACSpeechRecognizer_stopListening__block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 16);
  if (result) {
    return RXObjectSetProperty();
  }
  return result;
}

- (BOOL)isListening
{
  return self->_isListening;
}

- (void)setCommandInfo:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_recognizer)
  {
    v6 = sRXAPIDispatchQueue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __38__CACSpeechRecognizer_setCommandInfo___block_invoke;
    v7[3] = &unk_264D117C0;
    v7[4] = v5;
    id v8 = v4;
    dispatch_async(v6, v7);
  }
  objc_sync_exit(v5);
}

uint64_t __38__CACSpeechRecognizer_setCommandInfo___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 16);
  if (result) {
    return RXObjectSetProperty();
  }
  return result;
}

- (BOOL)requestCloseMatchResults
{
  return self->_requestCloseMatchResults;
}

- (void)setRequestCloseMatchResults:(BOOL)a3
{
  if (self->_requestCloseMatchResults != a3)
  {
    self->_requestCloseMatchResults = a3;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __51__CACSpeechRecognizer_setRequestCloseMatchResults___block_invoke;
    block[3] = &unk_264D115D0;
    block[4] = self;
    dispatch_async((dispatch_queue_t)sRXAPIDispatchQueue, block);
  }
}

uint64_t __51__CACSpeechRecognizer_setRequestCloseMatchResults___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 16);
  if (result) {
    return RXObjectSetProperty();
  }
  return result;
}

- (BOOL)spellingMode
{
  return self->_spellingMode;
}

- (void)setSpellingMode:(BOOL)a3
{
  if (self->_spellingMode != a3)
  {
    self->_spellingMode = a3;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __39__CACSpeechRecognizer_setSpellingMode___block_invoke;
    block[3] = &unk_264D115D0;
    block[4] = self;
    dispatch_async((dispatch_queue_t)sRXAPIDispatchQueue, block);
  }
}

uint64_t __39__CACSpeechRecognizer_setSpellingMode___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 16);
  if (result) {
    return RXObjectSetProperty();
  }
  return result;
}

- (BOOL)numberMode
{
  return self->_numberMode;
}

- (void)setNumberMode:(BOOL)a3
{
  if (self->_numberMode != a3)
  {
    self->_numberMode = a3;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __37__CACSpeechRecognizer_setNumberMode___block_invoke;
    block[3] = &unk_264D115D0;
    block[4] = self;
    dispatch_async((dispatch_queue_t)sRXAPIDispatchQueue, block);
  }
}

uint64_t __37__CACSpeechRecognizer_setNumberMode___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 16);
  if (result) {
    return RXObjectSetProperty();
  }
  return result;
}

- (unint64_t)recognizerFlags
{
  return self->_recognizerFlags;
}

- (void)setRecognizerFlags:(unint64_t)a3
{
  self->_recognizerFlags = a3;
}

- (__RXLanguageObject)rxLanguageModel
{
  return self->_rxLanguageModel;
}

- (BOOL)preventRecognizedTextFeedback
{
  return self->_preventRecognizedTextFeedback;
}

- (void)setPreventRecognizedTextFeedback:(BOOL)a3
{
  self->_preventRecognizedTextFeedback = a3;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak(&self->_delegate);
  objc_storeStrong((id *)&self->_languageModel, 0);
}

@end