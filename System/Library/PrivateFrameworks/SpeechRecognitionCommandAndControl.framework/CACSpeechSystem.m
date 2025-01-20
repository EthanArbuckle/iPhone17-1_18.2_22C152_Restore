@interface CACSpeechSystem
+ (BOOL)isSpeechSystemServerRunning;
+ (id)rxContextDictionaryForLanguageModel:(id)a3;
+ (id)speechSystem;
+ (id)valueFromRXContextKey:(id)a3 rxLanguageObject:(__RXLanguageObject *)a4;
+ (void)closeSpeechSystem;
+ (void)initialize;
+ (void)recognizeString:(id)a3;
+ (void)startPreventingDisplayDimming;
+ (void)stopPreventingDisplayDimming;
- (BOOL)supportsSpellingMode;
- (NSString)recognitionLocaleIdentifier;
- (__CFLocale)currentLocaleRef;
- (__RXLanguageObject)createRXLanguageObjectRefFromCACLanguageModel:(id)a3;
- (__RXLanguageObject)createRXLanguageObjectRefFromCACLanguageModel:(id)a3 ignoreBuiltInLMTable:(BOOL)a4;
- (__RXRecognitionSystem)recognitionSystemRef;
- (__RXVocabulary)currentRXVocabularyRef;
- (id)initLocaleIdentifer:(id)a3 microphoneIdentifier:(id)a4;
- (id)resultLanguageModelFromRXLanguageObject:(__RXLanguageObject *)a3;
- (void)_close;
- (void)rxRecognitionSystemReset;
- (void)setAdditionalContextStrings:(id)a3;
- (void)setLeadingContextString:(id)a3;
- (void)setRxRecognitionSystemResetMode:(int)a3;
- (void)setSecureFieldFocused:(BOOL)a3;
@end

@implementation CACSpeechSystem

+ (void)initialize
{
  if (initialize_onceToken != -1) {
    dispatch_once(&initialize_onceToken, &__block_literal_global_18);
  }
}

uint64_t __29__CACSpeechSystem_initialize__block_invoke()
{
  sRXAPIDispatchQueue = (uint64_t)dispatch_queue_create("com.apple.speech.RXAPIDispatchQueue", 0);
  return MEMORY[0x270F9A758]();
}

+ (id)rxContextDictionaryForLanguageModel:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x263EFF9A0] dictionary];
  [v4 setObject:v3 forKey:@"LanguageModel"];
  v5 = [v3 identifier];

  if (v5)
  {
    v6 = [v3 identifier];
    [v4 setObject:v6 forKey:@"Identifier"];
  }
  return v4;
}

+ (id)valueFromRXContextKey:(id)a3 rxLanguageObject:(__RXLanguageObject *)a4
{
  id v4 = a3;
  v5 = (void *)RXObjectCopyProperty();
  v6 = [v5 objectForKey:v4];

  return v6;
}

+ (id)speechSystem
{
  id v2 = a1;
  objc_sync_enter(v2);
  if (!sCACSpeechSystem)
  {
    id v3 = [CACSpeechSystem alloc];
    id v4 = +[CACPreferences sharedPreferences];
    v5 = [v4 bestLocaleIdentifier];
    uint64_t v6 = [(CACSpeechSystem *)v3 initLocaleIdentifer:v5 microphoneIdentifier:0];
    v7 = (void *)sCACSpeechSystem;
    sCACSpeechSystem = v6;
  }
  objc_sync_exit(v2);

  v8 = (void *)sCACSpeechSystem;
  return v8;
}

+ (void)closeSpeechSystem
{
  id obj = a1;
  objc_sync_enter(obj);
  if (sCACSpeechSystem) {
    dispatch_sync((dispatch_queue_t)sRXAPIDispatchQueue, &__block_literal_global_15);
  }
  objc_sync_exit(obj);
}

void __36__CACSpeechSystem_closeSpeechSystem__block_invoke()
{
  [(id)sCACSpeechSystem _close];
  v0 = (void *)sCACSpeechSystem;
  sCACSpeechSystem = 0;
}

+ (BOOL)isSpeechSystemServerRunning
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__CACSpeechSystem_isSpeechSystemServerRunning__block_invoke;
  block[3] = &unk_264D12030;
  block[4] = &v5;
  dispatch_sync((dispatch_queue_t)sRXAPIDispatchQueue, block);
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __46__CACSpeechSystem_isSpeechSystemServerRunning__block_invoke(uint64_t a1)
{
  uint64_t v2 = sCACSpeechSystem;
  if (sCACSpeechSystem)
  {
    id v4 = +[CACSpeechSystem speechSystem];
    [v4 recognitionSystemRef];
  }
  id v3 = (void *)RXObjectCopyProperty();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 BOOLValue];

  if (v2)
  {
  }
}

+ (void)recognizeString:(id)a3
{
  id v4 = a3;
  id v5 = a1;
  objc_sync_enter(v5);
  if (sCACSpeechSystem)
  {
    id v6 = (id)sCACSpeechSystem;
    uint64_t v7 = sRXAPIDispatchQueue;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __35__CACSpeechSystem_recognizeString___block_invoke;
    v9[3] = &unk_264D117C0;
    id v10 = v6;
    id v11 = v4;
    id v8 = v6;
    dispatch_async(v7, v9);
  }
  objc_sync_exit(v5);
}

uint64_t __35__CACSpeechSystem_recognizeString___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) recognitionSystemRef];
  return RXObjectSetProperty();
}

+ (void)startPreventingDisplayDimming
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_238377000, a2, OS_LOG_TYPE_ERROR, "Error in idle timer assertion: %@", (uint8_t *)&v2, 0xCu);
}

uint64_t __48__CACSpeechSystem_startPreventingDisplayDimming__block_invoke(uint64_t a1)
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:*(void *)(a1 + 32) selector:sel_stopPreventingDisplayDimming object:0];
  int v2 = *(void **)(a1 + 32);
  return [v2 performSelector:sel_stopPreventingDisplayDimming withObject:0 afterDelay:10.0];
}

+ (void)stopPreventingDisplayDimming
{
  id obj = a1;
  objc_sync_enter(obj);
  if (sActiveIdleTimerAssertion)
  {
    [(id)sActiveIdleTimerAssertion invalidate];
    int v2 = (void *)sActiveIdleTimerAssertion;
    sActiveIdleTimerAssertion = 0;
  }
  objc_sync_exit(obj);
}

- (id)initLocaleIdentifer:(id)a3 microphoneIdentifier:(id)a4
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CACSpeechSystem;
  id v6 = [(CACSpeechSystem *)&v16 init];
  if (v6)
  {
    uint64_t v7 = +[CACPreferences sharedPreferences];
    uint64_t v8 = [v7 bestLocaleIdentifier];
    recognitionLocaleIdentifier = v6->_recognitionLocaleIdentifier;
    v6->_recognitionLocaleIdentifier = (NSString *)v8;

    id v10 = sRXAPIDispatchQueue;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __60__CACSpeechSystem_initLocaleIdentifer_microphoneIdentifier___block_invoke;
    v13[3] = &unk_264D117C0;
    id v14 = v5;
    id v6 = v6;
    v15 = v6;
    dispatch_sync(v10, v13);
    if (!v6->_recognitionSystemRef)
    {
      id v11 = CACLogRecognition();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[CACSpeechSystem initLocaleIdentifer:microphoneIdentifier:](v11);
      }

      id v6 = 0;
    }
  }
  return v6;
}

void __60__CACSpeechSystem_initLocaleIdentifer_microphoneIdentifier___block_invoke(uint64_t a1)
{
  int v2 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:*(void *)(a1 + 32)];
  *(void *)(*(void *)(a1 + 40) + 8) = RXRecognitionSystemCreate();
  if (*(void *)(*(void *)(a1 + 40) + 8))
  {
    RXObjectSetProperty();
    RXObjectSetProperty();
    uint64_t v3 = [MEMORY[0x263F53C50] sharedConnection];
    int v4 = [v3 effectiveBoolValueForSetting:*MEMORY[0x263F53770]];

    if (v4 == 1)
    {
      RXObjectSetProperty();
      id v5 = CACLogRecognition();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v11 = 0;
        _os_log_impl(&dword_238377000, v5, OS_LOG_TYPE_DEFAULT, "Filtering profanity", v11, 2u);
      }
    }
    RXObjectSetProperty();
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = (void *)RXLocalesSupportingSpellingMode();
    int v8 = +[CACLocaleUtilities isLocaleIdentifier:v6 containedInLocaleIdentifiers:v7];

    if (v8)
    {
      v9 = (void *)RXObjectCopyProperty();
      if (v9)
      {
        id v10 = v9;
        LOBYTE(v8) = [v9 containsObject:@"SpellCC"];
        CFRelease(v10);
      }
      else
      {
        LOBYTE(v8) = 0;
      }
    }
    *(unsigned char *)(*(void *)(a1 + 40) + 48) = v8;
  }
}

uint64_t __60__CACSpeechSystem_initLocaleIdentifer_microphoneIdentifier___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  [v3 handleSRSystemBeginUtteranceWithID:a2];

  return +[CACSpeechSystem startPreventingDisplayDimming];
}

void __60__CACSpeechSystem_initLocaleIdentifer_microphoneIdentifier___block_invoke_3()
{
}

void __60__CACSpeechSystem_initLocaleIdentifer_microphoneIdentifier___block_invoke_4()
{
  v0 = CACLogRecognition();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v2 = 0;
    _os_log_impl(&dword_238377000, v0, OS_LOG_TYPE_DEFAULT, "Handling kRXRecognitionSystemProperty_ServerErrorCallback", v2, 2u);
  }

  v1 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  [v1 handleSRSystemServerError];
}

- (void)_close
{
  [(NSTimer *)self->_setLeadingContextStringDelayTimer invalidate];
  setLeadingContextStringDelayTimer = self->_setLeadingContextStringDelayTimer;
  self->_setLeadingContextStringDelayTimer = 0;

  [(NSTimer *)self->_setAdditionalContextStringsDelayTimer invalidate];
  setAdditionalContextStringsDelayTimer = self->_setAdditionalContextStringsDelayTimer;
  self->_setAdditionalContextStringsDelayTimer = 0;

  if (self->_recognitionSystemRef)
  {
    RXObjectSetProperty();
    RXObjectSetProperty();
    RXObjectSetProperty();
    RXRelease(self->_recognitionSystemRef);
    self->_recognitionSystemRef = 0;
  }
  currentLocaleRef = self->_currentLocaleRef;
  if (currentLocaleRef)
  {
    CFRelease(currentLocaleRef);
    self->_currentLocaleRef = 0;
  }
  currentRXVocabularyRef = self->_currentRXVocabularyRef;
  if (currentRXVocabularyRef)
  {
    RXRelease(currentRXVocabularyRef);
    self->_currentRXVocabularyRef = 0;
  }
  +[CACSpeechSystem stopPreventingDisplayDimming];
}

- (__CFLocale)currentLocaleRef
{
  result = self->_currentLocaleRef;
  if (!result)
  {
    int v4 = [(CACSpeechSystem *)self recognitionLocaleIdentifier];
    self->_currentLocaleRef = CFLocaleCreate(0, v4);

    return self->_currentLocaleRef;
  }
  return result;
}

- (__RXVocabulary)currentRXVocabularyRef
{
  result = self->_currentRXVocabularyRef;
  if (!result)
  {
    [(CACSpeechSystem *)self currentLocaleRef];
    result = (__RXVocabulary *)RXVocabularyCreateWithLocale();
    self->_currentRXVocabularyRef = result;
  }
  return result;
}

- (__RXRecognitionSystem)recognitionSystemRef
{
  return self->_recognitionSystemRef;
}

- (__RXLanguageObject)createRXLanguageObjectRefFromCACLanguageModel:(id)a3
{
  return [(CACSpeechSystem *)self createRXLanguageObjectRefFromCACLanguageModel:a3 ignoreBuiltInLMTable:0];
}

- (__RXLanguageObject)createRXLanguageObjectRefFromCACLanguageModel:(id)a3 ignoreBuiltInLMTable:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [v6 objectForAttribute:kCACLanguageModelAttributeParameterIdentifier];
  if ([v7 length] && !v4)
  {
    int v8 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
    v9 = (__RXLanguageObject *)[v8 rxLanguageObjectForBuiltInLMIdentifier:v7];

    if (v9) {
      CFRetain(v9);
    }
    goto LABEL_35;
  }
  id v10 = [v6 objectForAttribute:*MEMORY[0x263F78C68]];
  int v11 = [v10 BOOLValue];

  if (v11)
  {
    [v6 identifier];
    +[CACSpeechSystem rxContextDictionaryForLanguageModel:v6];
    uint64_t v12 = RXPathCreate();
  }
  else
  {
    v13 = [v6 identifier];
    if ([v13 isEqualToString:*MEMORY[0x263F78BF8]])
    {
    }
    else
    {
      id v14 = [v6 identifier];
      int v15 = [v14 isEqualToString:*MEMORY[0x263F78C00]];

      if (!v15)
      {
        [v6 identifier];
        +[CACSpeechSystem rxContextDictionaryForLanguageModel:v6];
        uint64_t v12 = RXLanguageModelCreate();
        goto LABEL_12;
      }
    }
    [v6 identifier];
    [(CACSpeechSystem *)self currentRXVocabularyRef];
    +[CACSpeechSystem rxContextDictionaryForLanguageModel:v6];
    uint64_t v12 = RXAdLibCreate();
  }
LABEL_12:
  v9 = (__RXLanguageObject *)v12;
  objc_super v16 = [v6 objectForAttribute:*MEMORY[0x263F78C60]];
  int v17 = [v16 BOOLValue];

  if (v17) {
    RXObjectSetProperty();
  }
  v18 = [v6 objectForAttribute:kCACLanguageModelAttributeCommandIdentifier];
  if (v18) {
    RXObjectSetProperty();
  }
  v19 = [v6 objectForAttribute:kCACLanguageModelAttributeCustomCommands];
  int v20 = [v19 BOOLValue];

  if (v20) {
    RXObjectSetProperty();
  }
  v21 = [v6 children];
  uint64_t v22 = [v21 count];

  if (v22)
  {
    v33 = v18;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v23 = [v6 children];
    uint64_t v24 = [v23 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v35 != v26) {
            objc_enumerationMutation(v23);
          }
          v28 = [(CACSpeechSystem *)self createRXLanguageObjectRefFromCACLanguageModel:*(void *)(*((void *)&v34 + 1) + 8 * i) ignoreBuiltInLMTable:v4];
          if (v28)
          {
            v29 = v28;
            RXLanguageObjectAddObject();
            RXRelease(v29);
          }
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v25);
    }

    v18 = v33;
  }
  else
  {
    v30 = [v6 text];
    if ([v30 length])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v31 = [v30 string];

        v30 = (void *)v31;
      }
      [(CACSpeechSystem *)self currentRXVocabularyRef];
      [(CACSpeechSystem *)self currentLocaleRef];
      RXLanguageObjectAddPhraseAndAlternatives();
    }
  }
LABEL_35:

  return v9;
}

- (id)resultLanguageModelFromRXLanguageObject:(__RXLanguageObject *)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  BOOL v4 = +[CACSpeechSystem valueFromRXContextKey:@"LanguageModel" rxLanguageObject:a3];
  id v5 = (void *)[v4 copy];

  if (v5)
  {
    CFLocaleRef v6 = CFLocaleCreate(0, (CFLocaleIdentifier)[(CACSpeechSystem *)self recognitionLocaleIdentifier]);
    uint64_t v7 = (void *)RXObjectCopyPropertyWithLocale();
    [v5 setText:v7];
    if (RXLanguageObjectGetType() == 4)
    {
      int v8 = (void *)RXObjectCopyPropertyWithLocale();
      if ([v8 count] == 1)
      {
        v9 = [MEMORY[0x263EFF980] array];
        if ([v7 length])
        {
          CFLocaleRef v24 = v6;
          [v9 addObject:v7];
          long long v27 = 0u;
          long long v28 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          v23 = v8;
          id v10 = [v8 objectAtIndex:0];
          uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v26;
            do
            {
              for (uint64_t i = 0; i != v12; ++i)
              {
                if (*(void *)v26 != v13) {
                  objc_enumerationMutation(v10);
                }
                int v15 = *(void **)(*((void *)&v25 + 1) + 8 * i);
                if (([v15 isEqualToString:v7] & 1) == 0) {
                  [v9 addObject:v15];
                }
              }
              uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
            }
            while (v12);
          }

          int v8 = v23;
          CFLocaleRef v6 = v24;
        }
        else
        {
          objc_super v16 = [v8 objectAtIndex:0];
          [v9 addObjectsFromArray:v16];
        }
        int v17 = [v5 attributes];
        [v17 setObject:v9 forKey:kCACLanguageModelAttributeTextVariants];
      }
    }
    uint64_t Count = RXLanguageObjectGetCount();
    if (Count >= 1)
    {
      uint64_t v19 = Count;
      for (uint64_t j = 0; j != v19; ++j)
      {
        v21 = [(CACSpeechSystem *)self resultLanguageModelFromRXLanguageObject:RXLanguageObjectGetObjectAtIndex()];
        if (v21) {
          [v5 addChildLanguageModel:v21];
        }
      }
    }
    if (v6) {
      CFRelease(v6);
    }
  }
  return v5;
}

- (void)setLeadingContextString:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __43__CACSpeechSystem_setLeadingContextString___block_invoke;
  v6[3] = &unk_264D117C0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __43__CACSpeechSystem_setLeadingContextString___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  [*(id *)(*(void *)(a1 + 32) + 32) invalidate];
  uint64_t v3 = (void *)MEMORY[0x263EFFA20];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __43__CACSpeechSystem_setLeadingContextString___block_invoke_2;
  v8[3] = &unk_264D12098;
  id v4 = *(void **)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  id v9 = v4;
  uint64_t v5 = [v3 scheduledTimerWithTimeInterval:0 repeats:v8 block:0.5];
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v5;

  objc_sync_exit(v2);
}

void __43__CACSpeechSystem_setLeadingContextString___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  [*(id *)(*(void *)(a1 + 32) + 32) invalidate];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = 0;

  objc_sync_exit(v4);
  id v7 = sRXAPIDispatchQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __43__CACSpeechSystem_setLeadingContextString___block_invoke_3;
  v9[3] = &unk_264D117C0;
  int v8 = *(void **)(a1 + 40);
  void v9[4] = *(void *)(a1 + 32);
  id v10 = v8;
  dispatch_async(v7, v9);
}

uint64_t __43__CACSpeechSystem_setLeadingContextString___block_invoke_3(uint64_t result)
{
  if (*(void *)(*(void *)(result + 32) + 8)) {
    return MEMORY[0x270F76CF0](*(void *)(*(void *)(result + 32) + 8), *(void *)(result + 40));
  }
  return result;
}

- (void)setSecureFieldFocused:(BOOL)a3
{
  if (self->_recognitionSystemRef)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __41__CACSpeechSystem_setSecureFieldFocused___block_invoke;
    v3[3] = &unk_264D120C0;
    v3[4] = self;
    BOOL v4 = a3;
    dispatch_async((dispatch_queue_t)sRXAPIDispatchQueue, v3);
  }
}

uint64_t __41__CACSpeechSystem_setSecureFieldFocused___block_invoke(uint64_t a1)
{
  return MEMORY[0x270F76D20](*(void *)(*(void *)(a1 + 32) + 8), *(unsigned __int8 *)(a1 + 40));
}

- (void)setAdditionalContextStrings:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __47__CACSpeechSystem_setAdditionalContextStrings___block_invoke;
  v6[3] = &unk_264D117C0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __47__CACSpeechSystem_setAdditionalContextStrings___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  [*(id *)(*(void *)(a1 + 32) + 40) invalidate];
  id v3 = (void *)MEMORY[0x263EFFA20];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __47__CACSpeechSystem_setAdditionalContextStrings___block_invoke_2;
  v8[3] = &unk_264D12098;
  id v4 = *(void **)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  id v9 = v4;
  uint64_t v5 = [v3 scheduledTimerWithTimeInterval:0 repeats:v8 block:0.5];
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  objc_sync_exit(v2);
}

void __47__CACSpeechSystem_setAdditionalContextStrings___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  [*(id *)(*(void *)(a1 + 32) + 40) invalidate];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;

  objc_sync_exit(v4);
  id v7 = sRXAPIDispatchQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __47__CACSpeechSystem_setAdditionalContextStrings___block_invoke_3;
  v9[3] = &unk_264D117C0;
  int v8 = *(void **)(a1 + 40);
  void v9[4] = *(void *)(a1 + 32);
  id v10 = v8;
  dispatch_async(v7, v9);
}

uint64_t __47__CACSpeechSystem_setAdditionalContextStrings___block_invoke_3(uint64_t result)
{
  if (*(void *)(*(void *)(result + 32) + 8)) {
    return MEMORY[0x270F76CF8](*(void *)(*(void *)(result + 32) + 8), *(void *)(result + 40));
  }
  return result;
}

- (void)rxRecognitionSystemReset
{
  if (self->_recognitionSystemRef)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __43__CACSpeechSystem_rxRecognitionSystemReset__block_invoke;
    block[3] = &unk_264D115D0;
    block[4] = self;
    dispatch_async((dispatch_queue_t)sRXAPIDispatchQueue, block);
  }
}

uint64_t __43__CACSpeechSystem_rxRecognitionSystemReset__block_invoke(uint64_t a1)
{
  return MEMORY[0x270F76D10](*(void *)(*(void *)(a1 + 32) + 8));
}

- (void)setRxRecognitionSystemResetMode:(int)a3
{
  if (self->_recognitionSystemRef)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __51__CACSpeechSystem_setRxRecognitionSystemResetMode___block_invoke;
    v3[3] = &unk_264D120E8;
    v3[4] = self;
    int v4 = a3;
    dispatch_async((dispatch_queue_t)sRXAPIDispatchQueue, v3);
  }
}

uint64_t __51__CACSpeechSystem_setRxRecognitionSystemResetMode___block_invoke(uint64_t a1)
{
  return MEMORY[0x270F76D18](*(void *)(*(void *)(a1 + 32) + 8), *(unsigned int *)(a1 + 40));
}

- (NSString)recognitionLocaleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (BOOL)supportsSpellingMode
{
  return self->_supportsSpellingMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recognitionLocaleIdentifier, 0);
  objc_storeStrong((id *)&self->_setAdditionalContextStringsDelayTimer, 0);
  objc_storeStrong((id *)&self->_setLeadingContextStringDelayTimer, 0);
}

- (void)initLocaleIdentifer:(os_log_t)log microphoneIdentifier:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_238377000, log, OS_LOG_TYPE_ERROR, "RXRecognitionSystemCreate failed", v1, 2u);
}

@end