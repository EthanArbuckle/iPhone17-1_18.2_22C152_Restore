@interface TIWordSearch
+ (id)configureUserDictionaryObserver:(id)a3 previousObserver:(id)a4;
+ (id)mecabraLearningDictionaryDirectory;
+ (id)recipientRecords;
+ (id)sharedOperationQueue;
- (BOOL)addFacemarkCandidatesToResultSet:(id)a3 forInput:(id)a4;
- (BOOL)autoCorrects;
- (BOOL)isCancelled;
- (BOOL)shareVocabulary;
- (BOOL)shouldLearnAcceptedCandidate;
- (NSCache)candidatesCache;
- (TIInputMode)inputMode;
- (TIMecabraEnvironment)mecabraEnvironment;
- (TIMecabraWrapper)mecabraWrapper;
- (TIWordSearchOperationGetCandidates)operation;
- (__Mecabra)mecabra;
- (id)baseLayout;
- (id)cachedCandidatesForOperation:(id)a3;
- (id)candidatesCacheKeyForOperation:(id)a3;
- (id)candidatesForOperation:(id)a3;
- (id)contactObserver;
- (id)initTIWordSearchWithInputMode:(id)a3;
- (id)initTIWordSearchWithInputMode:(id)a3 mecabraWrapper:(id)a4;
- (id)mecabraCreationOptionsDictionary;
- (id)supplementalLexiconObserver;
- (id)uncachedCandidatesForOperation:(id)a3;
- (int)mecabraInputMethodType;
- (int)mecabraLanguage;
- (unint64_t)mecabraCreationOptions;
- (unsigned)nameReadingPairGenerationMode;
- (void)_addFacemarkCandidatesToResultSet:(id)a3 forInput:(id)a4;
- (void)adaptOfflineToParagraph:(id)a3 adaptationContext:(id)a4 timeStamp:(double)a5;
- (void)addContact:(id)a3 toVocabulary:(void *)a4 toReadingPairs:(id)a5;
- (void)adjustEnvironmentOnAction:(int64_t)a3;
- (void)cancel;
- (void)clearCache;
- (void)clearLearningDictionary;
- (void)clearLeftDocumentContext;
- (void)clearObservers;
- (void)commitPunctuationSurface:(id)a3;
- (void)commitSurface:(id)a3;
- (void)completeOperationsInQueue;
- (void)contactStoreDidChange:(id)a3;
- (void)dealloc;
- (void)declareEndOfSentence;
- (void)dynamicDictionariesRemoved:(id)a3;
- (void)flushDynamicData;
- (void)handleMemoryPressureLevel:(unint64_t)a3 excessMemoryInBytes:(unint64_t)a4;
- (void)insertTopSupplementalCandidateSurroundingCursorToFrontOfResultSet:(id)a3;
- (void)keyboardActivityDidTransition:(id)a3;
- (void)lastAcceptedCandidateCorrected;
- (void)performAccept:(void *)a3 isPartial:(BOOL)a4;
- (void)performOperationAsync:(id)a3;
- (void)performOperationAsync:(id)a3 withBackgroundActivityAssertion:(BOOL)a4;
- (void)releaseBackgroundActivityAssertion;
- (void)resetMecabraEnvironment;
- (void)resetPreviousWord;
- (void)revertInlineCandidate;
- (void)saveLearningDictionary;
- (void)setAutoCorrects:(BOOL)a3;
- (void)setCandidatesCache:(id)a3;
- (void)setContactObserver:(id)a3;
- (void)setDebuggingLogEnabled:(BOOL)a3;
- (void)setDisablePersonalData:(BOOL)a3;
- (void)setKeyboardLayout:(id)a3;
- (void)setLanguageModelAdaptationContext:(id)a3;
- (void)setLanguageModelAdaptationContextWithClientIdentifier:(id)a3 recipientIdentifier:(id)a4;
- (void)setLeftDocumentContext:(id)a3 rightDocumentContext:(id)a4;
- (void)setMecabraEnvironment:(id)a3;
- (void)setMecabraTextContentType:(int)a3;
- (void)setMecabraWrapper:(id)a3;
- (void)setOperation:(id)a3;
- (void)setShouldLearnAcceptedCandidate:(BOOL)a3;
- (void)setSupplementalLexiconObserver:(id)a3;
- (void)updateAddressBook;
- (void)updateDictionaryPaths;
- (void)updateMecabraState;
- (void)updateSupplementalLexicon;
- (void)updateUserWordEntries;
@end

@implementation TIWordSearch

- (void).cxx_destruct
{
  objc_storeStrong(&self->_contactObserver, 0);
  objc_storeStrong(&self->_supplementalLexiconObserver, 0);
  objc_storeStrong((id *)&self->_candidatesCache, 0);
  objc_storeStrong((id *)&self->_operation, 0);
  objc_storeStrong((id *)&self->_mecabraWrapper, 0);
  objc_storeStrong((id *)&self->_mecabraEnvironment, 0);
  objc_storeStrong((id *)&self->_inputMode, 0);
  objc_storeStrong(&self->_dictionaryUpdateObserver, 0);

  objc_storeStrong(&self->_userDictionaryObserver, 0);
}

- (void)setContactObserver:(id)a3
{
}

- (id)contactObserver
{
  return self->_contactObserver;
}

- (void)setSupplementalLexiconObserver:(id)a3
{
}

- (id)supplementalLexiconObserver
{
  return self->_supplementalLexiconObserver;
}

- (void)setCandidatesCache:(id)a3
{
}

- (void)setShouldLearnAcceptedCandidate:(BOOL)a3
{
  self->_shouldLearnAcceptedCandidate = a3;
}

- (BOOL)shouldLearnAcceptedCandidate
{
  return self->_shouldLearnAcceptedCandidate;
}

- (void)setAutoCorrects:(BOOL)a3
{
  self->_autoCorrects = a3;
}

- (BOOL)autoCorrects
{
  return self->_autoCorrects;
}

- (void)setOperation:(id)a3
{
}

- (TIWordSearchOperationGetCandidates)operation
{
  return (TIWordSearchOperationGetCandidates *)objc_getProperty(self, a2, 56, 1);
}

- (void)setMecabraEnvironment:(id)a3
{
}

- (TIInputMode)inputMode
{
  return (TIInputMode *)objc_getProperty(self, a2, 32, 1);
}

- (void)setKeyboardLayout:(id)a3
{
  id v4 = a3;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  v9 = __34__TIWordSearch_setKeyboardLayout___block_invoke;
  v10 = &unk_1E6E2E220;
  v11 = self;
  id v12 = v4;
  id v5 = v4;
  v6 = +[NSBlockOperation blockOperationWithBlock:&v7];
  -[TIWordSearch performOperationAsync:](self, "performOperationAsync:", v6, v7, v8, v9, v10, v11);
}

void __34__TIWordSearch_setKeyboardLayout___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) mecabraEnvironment];
  [v2 setKeyboardLayout:*(void *)(a1 + 40)];
}

- (id)baseLayout
{
  id v2 = [(TIWordSearch *)self mecabraEnvironment];
  v3 = [v2 baseLayout];

  return v3;
}

- (void)revertInlineCandidate
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__TIWordSearch_revertInlineCandidate__block_invoke;
  v4[3] = &unk_1E6E2DE00;
  v4[4] = self;
  v3 = +[NSBlockOperation blockOperationWithBlock:v4];
  [(TIWordSearch *)self performOperationAsync:v3];
}

void __37__TIWordSearch_revertInlineCandidate__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) mecabraEnvironment];
  [v1 revertInlineCandidate];
}

- (void)setMecabraTextContentType:(int)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__TIWordSearch_setMecabraTextContentType___block_invoke;
  v5[3] = &unk_1E6E2B8D0;
  v5[4] = self;
  int v6 = a3;
  id v4 = +[NSBlockOperation blockOperationWithBlock:v5];
  [(TIWordSearch *)self performOperationAsync:v4];
}

void __42__TIWordSearch_setMecabraTextContentType___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) mecabraEnvironment];
  [v2 setTextContentType:v1];
}

- (void)resetMecabraEnvironment
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __39__TIWordSearch_resetMecabraEnvironment__block_invoke;
  v4[3] = &unk_1E6E2DE00;
  v4[4] = self;
  v3 = +[NSBlockOperation blockOperationWithBlock:v4];
  [(TIWordSearch *)self performOperationAsync:v3];
}

void __39__TIWordSearch_resetMecabraEnvironment__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) mecabraEnvironment];
  [v1 reset];
}

- (void)commitPunctuationSurface:(id)a3
{
  id v4 = a3;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  v9 = __41__TIWordSearch_commitPunctuationSurface___block_invoke;
  v10 = &unk_1E6E2E220;
  v11 = self;
  id v12 = v4;
  id v5 = v4;
  int v6 = +[NSBlockOperation blockOperationWithBlock:&v7];
  -[TIWordSearch performOperationAsync:](self, "performOperationAsync:", v6, v7, v8, v9, v10, v11);
}

void __41__TIWordSearch_commitPunctuationSurface___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) mecabraEnvironment];
  [v2 addPunctuationCandidateToContext:*(void *)(a1 + 40)];
}

- (void)commitSurface:(id)a3
{
  id v4 = a3;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  v9 = __30__TIWordSearch_commitSurface___block_invoke;
  v10 = &unk_1E6E2E220;
  v11 = self;
  id v12 = v4;
  id v5 = v4;
  int v6 = +[NSBlockOperation blockOperationWithBlock:&v7];
  -[TIWordSearch performOperationAsync:](self, "performOperationAsync:", v6, v7, v8, v9, v10, v11);
}

void __30__TIWordSearch_commitSurface___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) mecabraEnvironment];
  [v2 addStringCandidateToContext:*(void *)(a1 + 40)];
}

- (void)declareEndOfSentence
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __36__TIWordSearch_declareEndOfSentence__block_invoke;
  v4[3] = &unk_1E6E2DE00;
  v4[4] = self;
  v3 = +[NSBlockOperation blockOperationWithBlock:v4];
  [(TIWordSearch *)self performOperationAsync:v3];
}

void __36__TIWordSearch_declareEndOfSentence__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) mecabraEnvironment];
  [v1 declareEndOfSentence];
}

- (void)adjustEnvironmentOnAction:(int64_t)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__TIWordSearch_adjustEnvironmentOnAction___block_invoke;
  v5[3] = &unk_1E6E2B8A8;
  v5[4] = self;
  void v5[5] = a3;
  id v4 = +[NSBlockOperation blockOperationWithBlock:v5];
  [(TIWordSearch *)self performOperationAsync:v4];
}

void __42__TIWordSearch_adjustEnvironmentOnAction___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) mecabraEnvironment];
  [v2 adjustEnvironmentOnAction:*(void *)(a1 + 40)];
}

- (void)clearLeftDocumentContext
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40__TIWordSearch_clearLeftDocumentContext__block_invoke;
  v4[3] = &unk_1E6E2DE00;
  v4[4] = self;
  v3 = +[NSBlockOperation blockOperationWithBlock:v4];
  [(TIWordSearch *)self performOperationAsync:v3];
}

void __40__TIWordSearch_clearLeftDocumentContext__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v1 = [*(id *)(a1 + 32) mecabraEnvironment];
  [v1 setLeftDocumentContext:&stru_1F3F7A998];

  if (TICanLogMessageAtLevel_onceToken != -1) {
    dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
  }
  if (TICanLogMessageAtLevel_logLevel >= 2)
  {
    id v2 = TIOSLogFacility();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      v3 = objc_msgSend(NSString, "stringWithFormat:", @"%s [Environment] Clear left context", "-[TIWordSearch clearLeftDocumentContext]_block_invoke");
      *(_DWORD *)buf = 138412290;
      id v5 = v3;
      _os_log_debug_impl(&dword_1E3F0E000, v2, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
  }
}

- (void)setLeftDocumentContext:(id)a3 rightDocumentContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __60__TIWordSearch_setLeftDocumentContext_rightDocumentContext___block_invoke;
  v11[3] = &unk_1E6E2B880;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v8 = v7;
  id v9 = v6;
  v10 = +[NSBlockOperation blockOperationWithBlock:v11];
  [(TIWordSearch *)self performOperationAsync:v10];
}

void __60__TIWordSearch_setLeftDocumentContext_rightDocumentContext___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  v3 = [*(id *)(a1 + 32) mecabraEnvironment];
  [v3 setLeftDocumentContext:v2];

  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = [*(id *)(a1 + 32) mecabraEnvironment];
  [v5 setRightDocumentContext:v4];

  if (TICanLogMessageAtLevel_onceToken != -1) {
    dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
  }
  if (TICanLogMessageAtLevel_logLevel >= 2)
  {
    id v6 = TIOSLogFacility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      id v7 = NSString;
      id v8 = [*(id *)(a1 + 32) mecabraEnvironment];
      id v9 = [v8 leftDocumentContext];
      v10 = [*(id *)(a1 + 32) mecabraEnvironment];
      v11 = [v10 rightDocumentContext];
      id v12 = [v7 stringWithFormat:@"%s [Environment] Set left context: %@, Right context: %@", "-[TIWordSearch setLeftDocumentContext:rightDocumentContext:]_block_invoke", v9, v11];
      *(_DWORD *)buf = 138412290;
      v14 = v12;
      _os_log_debug_impl(&dword_1E3F0E000, v6, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
  }
}

- (void)flushDynamicData
{
  if ([(TIWordSearch *)self mecabra])
  {
    uint64_t v4 = [[TIWordSearchOperationFlushDynamicData alloc] initWithWordSearch:self];
    v3 = +[TIWordSearch sharedOperationQueue];
    [v3 addOperation:v4];
  }
}

- (void)adaptOfflineToParagraph:(id)a3 adaptationContext:(id)a4 timeStamp:(double)a5
{
  id v11 = a3;
  id v8 = a4;
  if ([(TIWordSearch *)self mecabra])
  {
    id v9 = [[TIWordSearchOperationAdaptOffline alloc] initWithWordSearch:self paragraph:v11 adaptationContext:v8 timeStamp:a5];
    v10 = +[TIWordSearch sharedOperationQueue];
    [v10 addOperation:v9];
  }
}

- (void)setDisablePersonalData:(BOOL)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__TIWordSearch_setDisablePersonalData___block_invoke;
  v5[3] = &unk_1E6E2B6E0;
  v5[4] = self;
  BOOL v6 = a3;
  uint64_t v4 = +[NSBlockOperation blockOperationWithBlock:v5];
  [(TIWordSearch *)self performOperationAsync:v4];
}

void __39__TIWordSearch_setDisablePersonalData___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) mecabraEnvironment];
  [v2 setPrivateMode:*(unsigned __int8 *)(a1 + 40)];
}

- (void)updateDictionaryPaths
{
  v16[1] = *MEMORY[0x1E4F143B8];
  v3 = [(TIWordSearch *)self mecabraWrapper];
  uint64_t v4 = [v3 mecabraRef];
  id v5 = [(TIWordSearch *)self inputMode];
  v16[0] = v5;
  BOOL v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  id v7 = +[TIWordSearch sharedOperationQueue];
  id v8 = +[TIMecabraEnvironment loadMobileAssetContentsWhenMobileAssetChangesForMecabra:v4 inputModes:v6 onQueue:v7 oldMobileAssetChangeListener:self->_dictionaryUpdateObserver];
  id dictionaryUpdateObserver = self->_dictionaryUpdateObserver;
  self->_id dictionaryUpdateObserver = v8;

  v10 = TIAssetsOSLogFacility();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    id v11 = NSString;
    id v12 = [(TIWordSearch *)self inputMode];
    id v13 = [v11 stringWithFormat:@"%s updateDictionaryPaths for %@", "-[TIWordSearch updateDictionaryPaths]", v12];
    *(_DWORD *)buf = 138412290;
    uint64_t v15 = v13;
    _os_log_debug_impl(&dword_1E3F0E000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }
}

- (BOOL)shareVocabulary
{
  return 0;
}

- (void)updateAddressBook
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  if (self->_contactObserver)
  {
    id v5 = TIPersonalizationContactOSLogFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      BOOL v6 = [NSString stringWithFormat:@"%s %@:updateAddressBook - removing observer", "-[TIWordSearch updateAddressBook]", v4];
      *(_DWORD *)buf = 138412290;
      v26 = v6;
      _os_log_impl(&dword_1E3F0E000, v5, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }
    id v7 = +[TITransientLexiconManager sharedInstance];
    [v7 removeContactObserver:self->_contactObserver];
  }
  id v8 = self;
  objc_sync_enter(v8);
  id v9 = [(TIWordSearch *)v8 mecabraWrapper];
  v10 = [(TIWordSearch *)v8 mecabraEnvironment];
  objc_sync_exit(v8);

  objc_initWeak(&location, v8);
  id v11 = TIPersonalizationContactOSLogFacility();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = [NSString stringWithFormat:@"%s %@:updateAddressBook - adding observer", "-[TIWordSearch updateAddressBook]", v4];
    *(_DWORD *)buf = 138412290;
    v26 = v12;
    _os_log_impl(&dword_1E3F0E000, v11, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }
  id v13 = +[TITransientLexiconManager sharedInstance];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __33__TIWordSearch_updateAddressBook__block_invoke;
  v19[3] = &unk_1E6E2B858;
  id v20 = v4;
  id v14 = v4;
  objc_copyWeak(&v23, &location);
  id v21 = v10;
  id v22 = v9;
  id v15 = v9;
  id v16 = v10;
  v17 = [v13 addContactObserver:v19];
  id contactObserver = self->_contactObserver;
  self->_id contactObserver = v17;

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

void __33__TIWordSearch_updateAddressBook__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = TIPersonalizationContactOSLogFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = [NSString stringWithFormat:@"%s %@:updateAddressBook - processing %ld contacts", "-[TIWordSearch updateAddressBook]_block_invoke", *(void *)(a1 + 32), objc_msgSend(v3, "count")];
    *(_DWORD *)buf = 138412290;
    id v13 = v5;
    _os_log_impl(&dword_1E3F0E000, v4, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }
  BOOL v6 = (void *)[v3 copy];

  id v7 = _TIQueueBackground();
  objc_copyWeak(&v11, (id *)(a1 + 56));
  id v9 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  id v8 = v6;
  TIDispatchAsync();

  objc_destroyWeak(&v11);
}

void __33__TIWordSearch_updateAddressBook__block_invoke_117(id *a1)
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  if (WeakRetained)
  {
    id v3 = objc_opt_new();
    if ([WeakRetained shareVocabulary])
    {
      Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
      uint64_t v50 = 0;
      v51 = &v50;
      uint64_t v52 = 0x3032000000;
      v53 = __Block_byref_object_copy__10089;
      v54 = __Block_byref_object_dispose__10090;
      id v55 = 0;
      uint64_t v45 = MEMORY[0x1E4F143A8];
      uint64_t v46 = 3221225472;
      v47 = __33__TIWordSearch_updateAddressBook__block_invoke_118;
      v48 = &unk_1E6E2E248;
      v49 = &v50;
      TIDispatchSync();
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v5 = (id)v51[5];
      uint64_t v6 = [v5 countByEnumeratingWithState:&v41 objects:v58 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v42;
        do
        {
          uint64_t v9 = 0;
          do
          {
            if (*(void *)v42 != v8) {
              objc_enumerationMutation(v5);
            }
            LanguageWithRegion = (const void *)TIInputModeGetLanguageWithRegion();
            CFArrayAppendValue(Mutable, LanguageWithRegion);
            ++v9;
          }
          while (v7 != v9);
          uint64_t v7 = [v5 countByEnumeratingWithState:&v41 objects:v58 count:16];
        }
        while (v7);
      }

      uint64_t SharedVocabulary = LMVocabularyGetSharedVocabulary();
      LMVocabularyReset();
      LMVocabularySetLanguages();
      CFRelease(Mutable);
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v12 = a1[4];
      uint64_t v13 = [v12 countByEnumeratingWithState:&v37 objects:v57 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v38;
        do
        {
          uint64_t v16 = 0;
          do
          {
            if (*(void *)v38 != v15) {
              objc_enumerationMutation(v12);
            }
            v17 = [a1[4] objectForKeyedSubscript:*(void *)(*((void *)&v37 + 1) + 8 * v16)];
            [WeakRetained addContact:v17 toVocabulary:SharedVocabulary toReadingPairs:v3];

            ++v16;
          }
          while (v14 != v16);
          uint64_t v14 = [v12 countByEnumeratingWithState:&v37 objects:v57 count:16];
        }
        while (v14);
      }

      _Block_object_dispose(&v50, 8);
    }
    else
    {
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v18 = a1[4];
      uint64_t v19 = [v18 countByEnumeratingWithState:&v33 objects:v56 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v34;
        do
        {
          uint64_t v22 = 0;
          do
          {
            if (*(void *)v34 != v21) {
              objc_enumerationMutation(v18);
            }
            id v23 = [a1[4] objectForKeyedSubscript:*(void *)(*((void *)&v33 + 1) + 8 * v22)];
            TICreateNameReadingPairFromContactAndAppendToArray(v23, [WeakRetained nameReadingPairGenerationMode], a1[5], v3);

            ++v22;
          }
          while (v20 != v22);
          uint64_t v20 = [v18 countByEnumeratingWithState:&v33 objects:v56 count:16];
        }
        while (v20);
      }
    }
    v24 = +[TIWordSearch sharedOperationQueue];
    uint64_t v27 = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    v29 = __33__TIWordSearch_updateAddressBook__block_invoke_2;
    v30 = &unk_1E6E2E220;
    id v31 = a1[6];
    id v32 = v3;
    id v25 = v3;
    v26 = +[NSBlockOperation blockOperationWithBlock:&v27];
    objc_msgSend(v24, "addOperation:", v26, v27, v28, v29, v30);
  }
}

void __33__TIWordSearch_updateAddressBook__block_invoke_118(uint64_t a1)
{
  id v5 = [MEMORY[0x1E4FAE2D8] sharedInputModeController];
  uint64_t v2 = [v5 enabledInputModeIdentifiers];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t __33__TIWordSearch_updateAddressBook__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) mecabraRef];
  uint64_t v3 = *(void *)(a1 + 40);

  return MEMORY[0x1F4180D40](v2, v3);
}

- (void)addContact:(id)a3 toVocabulary:(void *)a4 toReadingPairs:(id)a5
{
  id v15 = a3;
  id v7 = a5;
  uint64_t v8 = [v15 firstName];
  uint64_t v9 = [v15 lastName];
  if (!(v8 | v9)) {
    goto LABEL_17;
  }
  int v10 = [(TIWordSearch *)self nameReadingPairGenerationMode];
  id v11 = [(TIWordSearch *)self mecabraEnvironment];
  TICreateNameReadingPairFromContactAndAppendToArray(v15, v10, v11, v7);

  [v15 score];
  long double v13 = v12;
  if (v8 && v9)
  {
    if ((([(id)v8 _containsIdeographicCharacters] & 1) != 0
       || ([(id)v8 _containsHiraganaOrKatakana] & 1) != 0
       || [(id)v8 _containsKorean])
      && (([(id)v9 _containsIdeographicCharacters] & 1) != 0
       || ([(id)v9 _containsHiraganaOrKatakana] & 1) != 0
       || [(id)v8 _containsKorean]))
    {
      uint64_t v14 = [(id)v9 stringByAppendingString:v8];
      log10(v13);
      LMVocabularyAddLemma();
    }
  }
  else
  {
    if (!v9) {
      goto LABEL_15;
    }
    if (!v8)
    {
      log10(v12);
      LMVocabularyAddLemma();
    }
  }
  log10(v13);
  LMVocabularyAddLemma();
LABEL_15:
  if (v8)
  {
    log10(v13);
    LMVocabularyAddLemma();
  }
LABEL_17:
}

- (void)updateSupplementalLexicon
{
  uint64_t v3 = [(TIWordSearch *)self supplementalLexiconObserver];

  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v5 = [(TIWordSearch *)self supplementalLexiconObserver];
    [v4 removeObserver:v5];

    [(TIWordSearch *)self setSupplementalLexiconObserver:0];
  }
  uint64_t v6 = self;
  objc_sync_enter(v6);
  id v7 = [(TIWordSearch *)v6 mecabraWrapper];
  objc_sync_exit(v6);

  objc_initWeak(&location, v6);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __41__TIWordSearch_updateSupplementalLexicon__block_invoke;
  aBlock[3] = &unk_1E6E2B7D0;
  aBlock[4] = v6;
  objc_copyWeak(&v20, &location);
  id v19 = v7;
  id v8 = v7;
  uint64_t v9 = _Block_copy(aBlock);
  int v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = __41__TIWordSearch_updateSupplementalLexicon__block_invoke_3;
  v16[3] = &unk_1E6E2B808;
  id v17 = v9;
  id v11 = v9;
  long double v12 = [v10 addObserverForName:@"TIActiveLexiconDidChangeNotification" object:0 queue:0 usingBlock:v16];
  [(TIWordSearch *)v6 setSupplementalLexiconObserver:v12];

  long double v13 = +[TITransientLexiconManager sharedInstance];
  uint64_t v14 = [v13 supplementalLexicons];
  id v15 = [v14 activeLexicon];
  v11[2](v11, v15);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __41__TIWordSearch_updateSupplementalLexicon__block_invoke(id *a1, void *a2)
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v36 = v3;
  [v3 items];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v37 = [obj countByEnumeratingWithState:&v52 objects:v60 count:16];
  if (v37)
  {
    uint64_t v33 = *(void *)v53;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v53 != v33) {
          objc_enumerationMutation(obj);
        }
        uint64_t v39 = v5;
        uint64_t v6 = *(void **)(*((void *)&v52 + 1) + 8 * v5);
        uint64_t v7 = [a1[4] nameReadingPairGenerationMode];
        id v8 = [a1[4] mecabraEnvironment];
        uint64_t v9 = objc_msgSend(v6, "core_nameReadingPairsWithGenerationMode:mecabraEnvironment:", v7, v8);

        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        id v2 = v9;
        uint64_t v10 = [v2 countByEnumeratingWithState:&v48 objects:v59 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v49;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v49 != v12) {
                objc_enumerationMutation(v2);
              }
              uint64_t v14 = *(void *)(*((void *)&v48 + 1) + 8 * i);
              id v15 = [v4 objectForKeyedSubscript:v14];
              if (!v15)
              {
                id v15 = objc_opt_new();
                [v4 setObject:v15 forKeyedSubscript:v14];
              }
              uint64_t v16 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v6, "identifier"));
              [v15 addObject:v16];
            }
            uint64_t v11 = [v2 countByEnumeratingWithState:&v48 objects:v59 count:16];
          }
          while (v11);
        }

        uint64_t v5 = v39 + 1;
      }
      while (v39 + 1 != v37);
      uint64_t v37 = [obj countByEnumeratingWithState:&v52 objects:v60 count:16];
    }
    while (v37);
  }
  long long v38 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v17 = v4;
  uint64_t v40 = [v17 countByEnumeratingWithState:&v44 objects:v58 count:16];
  if (v40)
  {
    uint64_t v34 = *(void *)v45;
    do
    {
      for (uint64_t j = 0; j != v40; ++j)
      {
        if (*(void *)v45 != v34) {
          objc_enumerationMutation(v17);
        }
        id v19 = *(void **)(*((void *)&v44 + 1) + 8 * j);
        v56[0] = *MEMORY[0x1E4FBA730];
        id v20 = [v19 name];
        v57[0] = v20;
        v56[1] = *MEMORY[0x1E4FBA728];
        uint64_t v21 = [v19 reading];
        id v22 = v21;
        if (!v21)
        {
          id v2 = [MEMORY[0x1E4F1CA98] null];
          id v22 = v2;
        }
        v57[1] = v22;
        v56[2] = *MEMORY[0x1E4FBA718];
        id v23 = [v17 objectForKeyedSubscript:v19];
        v24 = [v23 allObjects];
        v57[2] = v24;
        v56[3] = *MEMORY[0x1E4FBA720];
        id v25 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v36, "searchPrefixCharacter"));
        v57[3] = v25;
        v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:v56 count:4];

        if (!v21) {
        [v38 addObject:v26];
        }
      }
      uint64_t v40 = [v17 countByEnumeratingWithState:&v44 objects:v58 count:16];
    }
    while (v40);
  }
  uint64_t v27 = v17;

  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  v29 = [(id)objc_opt_class() sharedOperationQueue];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __41__TIWordSearch_updateSupplementalLexicon__block_invoke_2;
  v41[3] = &unk_1E6E2E220;
  id v42 = a1[5];
  id v43 = v38;
  id v30 = v38;
  id v31 = +[NSBlockOperation blockOperationWithBlock:v41];
  [v29 addOperation:v31];
}

void __41__TIWordSearch_updateSupplementalLexicon__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 userInfo];
  id v4 = [v3 objectForKeyedSubscript:@"TIActiveLexiconDidChangeUserInfo_ActiveLexicon"];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __41__TIWordSearch_updateSupplementalLexicon__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) mecabraRef];
  uint64_t v3 = *(void *)(a1 + 40);

  return MEMORY[0x1F4180D68](v2, v3);
}

- (unsigned)nameReadingPairGenerationMode
{
  return 0;
}

- (void)updateUserWordEntries
{
  uint64_t v3 = objc_opt_class();
  id v6 = [(TIWordSearch *)self mecabraWrapper];
  id v4 = [v3 configureUserDictionaryObserver:v6 previousObserver:self->_userDictionaryObserver];
  id userDictionaryObserver = self->_userDictionaryObserver;
  self->_id userDictionaryObserver = v4;
}

- (void)setLanguageModelAdaptationContext:(id)a3
{
  id v5 = a3;
  if ([(TIWordSearch *)self mecabra])
  {
    id v4 = [[TIWordSearchOperationSetLanguageModelAdaptationContext alloc] initWithWordSearch:self adaptationContext:v5];
    [(TIWordSearch *)self performOperationAsync:v4];
  }
}

- (void)setLanguageModelAdaptationContextWithClientIdentifier:(id)a3 recipientIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(TIWordSearch *)self mecabra])
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __90__TIWordSearch_setLanguageModelAdaptationContextWithClientIdentifier_recipientIdentifier___block_invoke;
    block[3] = &unk_1E6E2DE00;
    block[4] = self;
    if (-[TIWordSearch setLanguageModelAdaptationContextWithClientIdentifier:recipientIdentifier:]::dispatchOnce != -1) {
      dispatch_once(&-[TIWordSearch setLanguageModelAdaptationContextWithClientIdentifier:recipientIdentifier:]::dispatchOnce, block);
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __90__TIWordSearch_setLanguageModelAdaptationContextWithClientIdentifier_recipientIdentifier___block_invoke_2;
    aBlock[3] = &unk_1E6E2B780;
    id v18 = v6;
    id v8 = v7;
    id v19 = v8;
    id v20 = self;
    uint64_t v9 = (void (**)(void *, void))_Block_copy(aBlock);
    if ([v8 length])
    {
      uint64_t v10 = +[TIWordSearch recipientRecords];
      uint64_t v11 = [v10 objectForKey:v8];

      if (v11)
      {
        if ([v11 count]) {
          uint64_t v12 = v11;
        }
        else {
          uint64_t v12 = 0;
        }
        ((void (**)(void *, void *))v9)[2](v9, v12);
      }
      else
      {
        long double v13 = [MEMORY[0x1E4F1CAD0] setWithObject:v8];
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __90__TIWordSearch_setLanguageModelAdaptationContextWithClientIdentifier_recipientIdentifier___block_invoke_99;
        v14[3] = &unk_1E6E2B7A8;
        id v15 = v8;
        uint64_t v16 = v9;
        TIAddressBookFindRecordsMatchingRecipientsAsync(v13, v14);
      }
    }
    else
    {
      v9[2](v9, 0);
    }
  }
}

void __90__TIWordSearch_setLanguageModelAdaptationContextWithClientIdentifier_recipientIdentifier___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 addObserver:*(void *)(a1 + 32) selector:sel_contactStoreDidChange_ name:*MEMORY[0x1E4F1AF80] object:0];
}

void __90__TIWordSearch_setLanguageModelAdaptationContextWithClientIdentifier_recipientIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [[TILanguageModelAdaptationContext alloc] initWithClientIdentifier:*(void *)(a1 + 32) andRecipientRecord:v3];
  if (TICanLogMessageAtLevel_onceToken != -1) {
    dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
  }
  if (TICanLogMessageAtLevel_logLevel >= 2)
  {
    id v5 = TIOSLogFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      id v7 = [NSString stringWithFormat:@"%s Language model adaptation context = %@, recipient = %@ (%@)", "-[TIWordSearch setLanguageModelAdaptationContextWithClientIdentifier:recipientIdentifier:]_block_invoke_2", v4, *(void *)(a1 + 40), v3];
      *(_DWORD *)buf = 138412290;
      uint64_t v9 = v7;
      _os_log_debug_impl(&dword_1E3F0E000, v5, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
  }
  id v6 = [[TIWordSearchOperationSetLanguageModelAdaptationContext alloc] initWithWordSearch:*(void *)(a1 + 48) adaptationContext:v4];
  [*(id *)(a1 + 48) performOperationAsync:v6];
}

void __90__TIWordSearch_setLanguageModelAdaptationContextWithClientIdentifier_recipientIdentifier___block_invoke_99(uint64_t a1, void *a2)
{
  id v7 = [a2 objectForKey:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(a1 + 40);
  if ([v7 count]) {
    id v4 = v7;
  }
  else {
    id v4 = 0;
  }
  (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  id v5 = +[TIWordSearch recipientRecords];
  if (v7) {
    id v6 = v7;
  }
  else {
    id v6 = (id)MEMORY[0x1E4F1CC08];
  }
  [v5 setObject:v6 forKey:*(void *)(a1 + 32)];
}

- (void)contactStoreDidChange:(id)a3
{
  id v6 = a3;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    id v5 = +[TIWordSearch recipientRecords];
    [v5 removeAllObjects];
  }
  else
  {
    [(TIWordSearch *)self performSelectorOnMainThread:a2 withObject:v6 waitUntilDone:1];
  }
}

- (void)insertTopSupplementalCandidateSurroundingCursorToFrontOfResultSet:(id)a3
{
  id v4 = a3;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __82__TIWordSearch_insertTopSupplementalCandidateSurroundingCursorToFrontOfResultSet___block_invoke;
  id v15 = &unk_1E6E2E220;
  uint64_t v16 = self;
  id v5 = v4;
  id v17 = v5;
  id v6 = (void (**)(void))_Block_copy(&v12);
  id v7 = objc_msgSend(MEMORY[0x1E4F28F08], "currentQueue", v12, v13, v14, v15, v16);
  id v8 = +[TIWordSearch sharedOperationQueue];
  int v9 = [v7 isEqual:v8];

  if (v9)
  {
    v6[2](v6);
  }
  else
  {
    uint64_t v10 = [MEMORY[0x1E4F28B48] blockOperationWithBlock:v6];
    [(TIWordSearch *)self performOperationAsync:v10];

    uint64_t v11 = +[TIWordSearch sharedOperationQueue];
    [v11 waitUntilAllOperationsAreFinished];
  }
}

void __82__TIWordSearch_insertTopSupplementalCandidateSurroundingCursorToFrontOfResultSet___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) mecabraEnvironment];
  id v6 = [v2 findSupplementalLexiconCandidatesSurroundingCursor];

  if ([v6 count])
  {
    uint64_t v3 = [v6 firstObject];

    id v4 = MecabraCandidateGetSurface();
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4FAE3B8]) initWithMecabraCandidate:v3 input:v4];
    [*(id *)(a1 + 40) insertMecabraCandidate:v5 mecabraCandidateRef:v3 atIndex:0];
  }
}

- (void)dynamicDictionariesRemoved:(id)a3
{
  [(TIWordSearch *)self completeOperationsInQueue];
  [(TIWordSearch *)self clearObservers];
  obuint64_t j = self;
  objc_sync_enter(obj);
  mecabraWrapper = obj->_mecabraWrapper;
  obj->_mecabraWrapper = 0;

  mecabraEnvironment = obj->_mecabraEnvironment;
  obj->_mecabraEnvironment = 0;

  objc_sync_exit(obj);
}

- (void)clearObservers
{
  if (self->_userDictionaryObserver)
  {
    uint64_t v3 = +[TIUserDictionaryServer sharedInstance];
    [v3 removeObserver:self->_userDictionaryObserver];

    id userDictionaryObserver = self->_userDictionaryObserver;
    self->_id userDictionaryObserver = 0;
  }
  if (self->_dictionaryUpdateObserver)
  {
    +[TIMecabraEnvironment removeMobileAssetListener:](TIMecabraEnvironment, "removeMobileAssetListener:");
    id dictionaryUpdateObserver = self->_dictionaryUpdateObserver;
    self->_id dictionaryUpdateObserver = 0;
  }
  if (self->_supplementalLexiconObserver)
  {
    id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 removeObserver:self->_supplementalLexiconObserver];

    id supplementalLexiconObserver = self->_supplementalLexiconObserver;
    self->_id supplementalLexiconObserver = 0;
  }
  if (self->_contactObserver)
  {
    id v8 = +[TITransientLexiconManager sharedInstance];
    [v8 removeContactObserver:self->_contactObserver];

    id contactObserver = self->_contactObserver;
    self->_id contactObserver = 0;
  }
}

- (void)saveLearningDictionary
{
  uint64_t v3 = [(TIWordSearch *)self mecabraWrapper];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38__TIWordSearch_saveLearningDictionary__block_invoke;
  v6[3] = &unk_1E6E2DE00;
  id v7 = v3;
  id v4 = v3;
  id v5 = +[NSBlockOperation blockOperationWithBlock:v6];
  [(TIWordSearch *)self performOperationAsync:v5 withBackgroundActivityAssertion:1];
}

uint64_t __38__TIWordSearch_saveLearningDictionary__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (TICanLogMessageAtLevel_onceToken != -1) {
    dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
  }
  id v2 = TIOSLogFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    id v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s Calling MecabraFlushDynamicData", "-[TIWordSearch saveLearningDictionary]_block_invoke");
    *(_DWORD *)buf = 138412290;
    id v6 = v4;
    _os_log_debug_impl(&dword_1E3F0E000, v2, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }
  [*(id *)(a1 + 32) mecabraRef];
  return MecabraFlushDynamicData();
}

- (void)completeOperationsInQueue
{
  id v2 = +[TIWordSearch sharedOperationQueue];
  [v2 cancelAllOperations];

  id v3 = +[TIWordSearch sharedOperationQueue];
  [v3 waitUntilAllOperationsAreFinished];
}

- (void)lastAcceptedCandidateCorrected
{
  if ([(TIWordSearch *)self mecabra])
  {
    id v3 = [[TIWordSearchOperationCancelLastAcceptedCandidate alloc] initWithWordSearch:self];
    [(TIWordSearch *)self performOperationAsync:v3];
  }
}

- (void)releaseBackgroundActivityAssertion
{
  id v2 = +[TIKeyboardAssertionManager sharedAssertionManager];
  [v2 releaseBackgroundActivityAssertion];
}

- (void)performOperationAsync:(id)a3 withBackgroundActivityAssertion:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v4)
  {
    uint64_t v7 = +[TIKeyboardAssertionManager sharedAssertionManager];
    [v7 retainBackgroundActivityAssertion];

    objc_initWeak(&location, self);
    id v8 = [v6 completionBlock];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __70__TIWordSearch_performOperationAsync_withBackgroundActivityAssertion___block_invoke;
    v23[3] = &unk_1E6E2B758;
    objc_copyWeak(&v25, &location);
    id v24 = v8;
    id v9 = v8;
    [v6 setCompletionBlock:v23];

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v10 = +[TIWordSearch sharedOperationQueue];
    uint64_t v11 = [v10 operations];

    uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void **)(*((void *)&v19 + 1) + 8 * v15);
          if ([v16 isMemberOfClass:objc_opt_class()])
          {
            id v17 = v16;
            if (([v17 isExecuting] & 1) == 0) {
              [v17 cancel];
            }
          }
          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v13);
    }
  }
  id v18 = +[TIWordSearch sharedOperationQueue];
  [v18 addOperation:v6];
}

uint64_t __70__TIWordSearch_performOperationAsync_withBackgroundActivityAssertion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained performSelectorOnMainThread:sel_releaseBackgroundActivityAssertion withObject:0 waitUntilDone:0];

  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    BOOL v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)performOperationAsync:(id)a3
{
}

- (void)resetPreviousWord
{
  id v3 = [[TIWordSearchOperationAcceptCandidate alloc] initWithWordSearch:self mecabraCandidate:0 isPartial:0];
  [(TIWordSearch *)self performOperationAsync:v3];
}

- (BOOL)isCancelled
{
  id v2 = [(TIWordSearch *)self operation];
  char v3 = [v2 isCancelled];

  return v3;
}

- (void)cancel
{
  char v3 = +[TIWordSearch sharedOperationQueue];
  [v3 cancelAllOperations];

  if ([(TIWordSearch *)self mecabra])
  {
    BOOL v4 = [(TIWordSearch *)self mecabra];
    MEMORY[0x1F4180AB8](v4);
  }
}

- (void)performAccept:(void *)a3 isPartial:(BOOL)a4
{
  BOOL v4 = a4;
  if ([(TIWordSearch *)self mecabra])
  {
    uint64_t v7 = [[TIWordSearchOperationContextAcceptCandidate alloc] initWithWordSearch:self mecabraCandidate:a3 isPartial:v4 isPrediction:0];
    -[TIWordSearch performOperationAsync:](self, "performOperationAsync:");
    if (!v4) {
      [(TIWordSearch *)self clearCache];
    }
  }
}

- (BOOL)addFacemarkCandidatesToResultSet:(id)a3 forInput:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v7 isEqualToString:@"^_^"] & 1) == 0
    && ([v7 isEqualToString:@"☺"] & 1) == 0
    && ([v7 isEqualToString:@"☻"] & 1) == 0
    && ([v7 isEqualToString:@"^_^"] & 1) == 0)
  {
    if (([v7 isEqualToString:@"……"] & 1) == 0
      && ![v7 isEqualToString:@"⋯⋯"])
    {
      BOOL v8 = 0;
      goto LABEL_9;
    }
    [v6 addSyntheticMecabraCandidateWithSurface:v7 input:v7];
  }
  [(TIWordSearch *)self _addFacemarkCandidatesToResultSet:v6 forInput:v7];
  BOOL v8 = 1;
LABEL_9:

  return v8;
}

- (void)_addFacemarkCandidatesToResultSet:(id)a3 forInput:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(TIWordSearch *)self mecabra];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = (id)MecabraCreateFacemarkCandidates();
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(v6, "addMecabraFacemarkCandidate:forInput:", *(void *)(*((void *)&v13 + 1) + 8 * v12++), v7, (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (id)cachedCandidatesForOperation:(id)a3
{
  id v4 = a3;
  id v5 = [(TIWordSearch *)self candidatesCache];
  id v6 = [(TIWordSearch *)self candidatesCacheKeyForOperation:v4];

  id v7 = [v5 objectForKey:v6];

  return v7;
}

- (id)uncachedCandidatesForOperation:(id)a3
{
  return 0;
}

- (id)candidatesForOperation:(id)a3
{
  id v4 = a3;
  id v5 = [(TIWordSearch *)self candidatesCacheKeyForOperation:v4];
  id v6 = [(TIWordSearch *)self candidatesCache];
  id v7 = [v6 objectForKey:v5];

  if (!v7)
  {
    id v7 = [(TIWordSearch *)self uncachedCandidatesForOperation:v4];
    if (([v4 isCancelled] & 1) == 0)
    {
      if (v7)
      {
        [(TIWordSearch *)self clearCache];
        id v8 = [(TIWordSearch *)self candidatesCache];
        [v8 setObject:v7 forKey:v5];
      }
    }
  }

  return v7;
}

- (id)candidatesCacheKeyForOperation:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 inputString];
  id v5 = (void *)v4;
  if (v4) {
    id v6 = (__CFString *)v4;
  }
  else {
    id v6 = &stru_1F3F7A998;
  }
  int v7 = [v3 predictionEnabled];

  if (v7) {
    id v8 = @"-1";
  }
  else {
    id v8 = @"-0";
  }
  uint64_t v9 = [(__CFString *)v6 stringByAppendingString:v8];

  return v9;
}

- (NSCache)candidatesCache
{
  candidatesCache = self->_candidatesCache;
  if (!candidatesCache)
  {
    uint64_t v4 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    id v5 = self->_candidatesCache;
    self->_candidatesCache = v4;

    candidatesCache = self->_candidatesCache;
  }

  return candidatesCache;
}

- (void)handleMemoryPressureLevel:(unint64_t)a3 excessMemoryInBytes:(unint64_t)a4
{
  int v7 = +[TIKeyboardActivityController sharedController];
  uint64_t v8 = [v7 activityState];

  if (v8 == 3)
  {
    uint64_t v9 = [(TIWordSearch *)self mecabraWrapper];
    int v10 = a3 - 1;
    BOOL v11 = a3 - 1 >= 3;
    uint64_t v12 = (void *)MEMORY[0x1E4F28B48];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    void v16[2] = __62__TIWordSearch_handleMemoryPressureLevel_excessMemoryInBytes___block_invoke;
    v16[3] = &unk_1E6E2B730;
    if (v11) {
      int v13 = 0;
    }
    else {
      int v13 = v10 + 1;
    }
    int v19 = v13;
    id v17 = v9;
    unint64_t v18 = a4;
    id v14 = v9;
    long long v15 = [v12 blockOperationWithBlock:v16];
    [(TIWordSearch *)self performOperationAsync:v15 withBackgroundActivityAssertion:1];
  }
}

uint64_t __62__TIWordSearch_handleMemoryPressureLevel_excessMemoryInBytes___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) mecabraRef];
  uint64_t v3 = *(unsigned int *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 40);

  return MEMORY[0x1F4180CE8](v2, v3, v4);
}

- (void)keyboardActivityDidTransition:(id)a3
{
  id v4 = a3;
  if ([v4 toState] == 3)
  {
    id v5 = [(TIWordSearch *)self mecabraWrapper];
    id v6 = (void *)MEMORY[0x1E4F28B48];
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    BOOL v11 = __46__TIWordSearch_keyboardActivityDidTransition___block_invoke;
    uint64_t v12 = &unk_1E6E2E220;
    id v13 = v5;
    id v14 = v4;
    id v7 = v5;
    uint64_t v8 = [v6 blockOperationWithBlock:&v9];
    -[TIWordSearch performOperationAsync:withBackgroundActivityAssertion:](self, "performOperationAsync:withBackgroundActivityAssertion:", v8, 1, v9, v10, v11, v12);
  }
}

uint64_t __46__TIWordSearch_keyboardActivityDidTransition___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) mecabraRef];
  uint64_t v3 = [*(id *)(a1 + 40) excessMemoryInBytes];

  return MEMORY[0x1F4180CE8](v2, 0, v3);
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(TIWordSearch *)self clearObservers];
  id v4 = +[TIKeyboardActivityController sharedController];
  [v4 removeActivityObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)TIWordSearch;
  [(TIWordSearch *)&v5 dealloc];
}

- (id)initTIWordSearchWithInputMode:(id)a3 mecabraWrapper:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)TIWordSearch;
  uint64_t v9 = [(TIWordSearch *)&v15 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_inputMode, a3);
    [(TIWordSearch *)v10 setAutoCorrects:1];
    if (v8) {
      [(TIWordSearch *)v10 setMecabraWrapper:v8];
    }
    else {
      id v11 = [(TIWordSearch *)v10 mecabraWrapper];
    }
    uint64_t v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 addObserver:v10 selector:sel_dynamicDictionariesRemoved_ name:@"TIKeyboardInputManagerDynamicDictionariesRemovedNotification" object:0];

    id v13 = +[TIKeyboardActivityController sharedController];
    [v13 addActivityObserver:v10];

    TILanguageModelScheduleMaintenance();
  }

  return v10;
}

- (id)initTIWordSearchWithInputMode:(id)a3
{
  return [(TIWordSearch *)self initTIWordSearchWithInputMode:a3 mecabraWrapper:0];
}

- (id)mecabraCreationOptionsDictionary
{
  keys[1] = *(void **)MEMORY[0x1E4F143B8];
  keys[0] = *(void **)MEMORY[0x1E4FBA708];
  values = (void *)*MEMORY[0x1E4F1CFD0];
  CFDictionaryRef v2 = CFDictionaryCreate(0, (const void **)keys, (const void **)&values, 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);

  return v2;
}

- (unint64_t)mecabraCreationOptions
{
  return 0;
}

- (int)mecabraLanguage
{
  unsigned int v2 = [(TIWordSearch *)self mecabraInputMethodType] - 1;
  if (v2 > 0x11) {
    return -1;
  }
  else {
    return dword_1E4155B28[v2];
  }
}

- (int)mecabraInputMethodType
{
  return 0;
}

- (__Mecabra)mecabra
{
  unsigned int v2 = [(TIWordSearch *)self mecabraWrapper];
  uint64_t v3 = (__Mecabra *)[v2 mecabraRef];

  return v3;
}

- (void)setMecabraWrapper:(id)a3
{
  id v6 = (TIMecabraWrapper *)a3;
  objc_super v5 = self;
  objc_sync_enter(v5);
  if (v5->_mecabraWrapper != v6) {
    objc_storeStrong((id *)&v5->_mecabraWrapper, a3);
  }
  [(TIWordSearch *)v5 updateMecabraState];
  objc_sync_exit(v5);
}

- (TIMecabraWrapper)mecabraWrapper
{
  unsigned int v2 = self;
  objc_sync_enter(v2);
  mecabraWrapper = v2->_mecabraWrapper;
  id v4 = mecabraWrapper;
  if (!mecabraWrapper)
  {
    uint64_t v5 = [(TIWordSearch *)v2 mecabraInputMethodType];
    id v6 = [(id)objc_opt_class() mecabraLearningDictionaryDirectory];
    uint64_t v7 = [(TIWordSearch *)v2 mecabraCreationOptions];
    id v8 = [(TIWordSearch *)v2 mecabraCreationOptionsDictionary];
    uint64_t v9 = [TIMecabraWrapper alloc];
    if (v8) {
      uint64_t v10 = [(TIMecabraWrapper *)v9 initWithInputMethodType:v5 learningDictionaryDirectoryURL:v6 creationOptionsDictionary:v8];
    }
    else {
      uint64_t v10 = [(TIMecabraWrapper *)v9 initWithInputMethodType:v5 learningDictionaryDirectoryURL:v6 creationOptions:v7];
    }
    id v11 = v2->_mecabraWrapper;
    v2->_mecabraWrapper = (TIMecabraWrapper *)v10;

    id v4 = v2->_mecabraWrapper;
  }
  uint64_t v12 = v4;
  objc_sync_exit(v2);

  if (!mecabraWrapper) {
    [(TIWordSearch *)v2 updateMecabraState];
  }

  return v12;
}

- (TIMecabraEnvironment)mecabraEnvironment
{
  unsigned int v2 = self;
  objc_sync_enter(v2);
  if (!v2->_mecabraEnvironment && v2->_mecabraWrapper)
  {
    uint64_t v3 = [TIMecabraEnvironment alloc];
    id v4 = [(TIWordSearch *)v2 mecabraWrapper];
    uint64_t v5 = -[TIMecabraEnvironment initWithMecabraEngine:language:](v3, "initWithMecabraEngine:language:", [v4 mecabraRef], -[TIWordSearch mecabraLanguage](v2, "mecabraLanguage"));
    mecabraEnvironment = v2->_mecabraEnvironment;
    v2->_mecabraEnvironment = (TIMecabraEnvironment *)v5;
  }
  objc_sync_exit(v2);

  uint64_t v7 = v2->_mecabraEnvironment;

  return v7;
}

- (void)clearLearningDictionary
{
  if ([(TIWordSearch *)self mecabra])
  {
    [(TIWordSearch *)self completeOperationsInQueue];
    uint64_t v3 = [(TIWordSearch *)self mecabra];
    MEMORY[0x1F4180BD0](v3);
  }
}

- (void)updateMecabraState
{
  [(TIWordSearch *)self updateSupplementalLexicon];

  [(TIWordSearch *)self updateAddressBook];
}

- (void)setDebuggingLogEnabled:(BOOL)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__TIWordSearch_setDebuggingLogEnabled___block_invoke;
  v5[3] = &unk_1E6E2B6E0;
  v5[4] = self;
  BOOL v6 = a3;
  uint64_t v3 = [MEMORY[0x1E4F28B48] blockOperationWithBlock:v5];
  id v4 = [(id)objc_opt_class() sharedOperationQueue];
  [v4 addOperation:v3];
}

uint64_t __39__TIWordSearch_setDebuggingLogEnabled___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) mecabra];
  uint64_t v3 = *(unsigned __int8 *)(a1 + 40);

  return MEMORY[0x1F4180D50](v2, v3);
}

- (void)clearCache
{
  id v2 = [(TIWordSearch *)self candidatesCache];
  [v2 removeAllObjects];
}

+ (id)recipientRecords
{
  if (+[TIWordSearch recipientRecords]::dispatchOnce != -1) {
    dispatch_once(&+[TIWordSearch recipientRecords]::dispatchOnce, &__block_literal_global_87);
  }
  id v2 = (void *)+[TIWordSearch recipientRecords]::__recipientRecords;

  return v2;
}

uint64_t __32__TIWordSearch_recipientRecords__block_invoke()
{
  v0 = [[TILRUDictionary alloc] initWithMaximumCapacity:10];
  uint64_t v1 = +[TIWordSearch recipientRecords]::__recipientRecords;
  +[TIWordSearch recipientRecords]::__recipientRecords = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)sharedOperationQueue
{
  if (+[TIWordSearch sharedOperationQueue]::__onceToken != -1) {
    dispatch_once(&+[TIWordSearch sharedOperationQueue]::__onceToken, &__block_literal_global_10144);
  }
  id v2 = (void *)+[TIWordSearch sharedOperationQueue]::__operationQueue;

  return v2;
}

void __36__TIWordSearch_sharedOperationQueue__block_invoke()
{
  if (!+[TIWordSearch sharedOperationQueue]::__operationQueue)
  {
    id v0 = objc_alloc_init(MEMORY[0x1E4F28F08]);
    uint64_t v1 = (void *)+[TIWordSearch sharedOperationQueue]::__operationQueue;
    +[TIWordSearch sharedOperationQueue]::__operationQueue = (uint64_t)v0;

    [(id)+[TIWordSearch sharedOperationQueue]::__operationQueue setMaxConcurrentOperationCount:1];
    id v2 = (void *)+[TIWordSearch sharedOperationQueue]::__operationQueue;
    [v2 setQualityOfService:25];
  }
}

+ (id)mecabraLearningDictionaryDirectory
{
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  UIKeyboardUserDirectory();
  uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFURLRef v4 = CFURLCreateWithFileSystemPath(v2, v3, kCFURLPOSIXPathStyle, 1u);

  return v4;
}

+ (id)configureUserDictionaryObserver:(id)a3 previousObserver:(id)a4
{
  id v5 = a3;
  if (a4)
  {
    id v6 = a4;
    uint64_t v7 = +[TIUserDictionaryServer sharedInstance];
    [v7 removeObserver:v6];
  }
  id v8 = [(id)objc_opt_class() sharedOperationQueue];
  uint64_t v9 = +[TIUserDictionaryServer sharedInstance];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __65__TIWordSearch_configureUserDictionaryObserver_previousObserver___block_invoke;
  v14[3] = &unk_1E6E2B708;
  id v15 = v8;
  id v16 = v5;
  id v10 = v5;
  id v11 = v8;
  uint64_t v12 = [v9 addObserver:v14];

  return v12;
}

void __65__TIWordSearch_configureUserDictionaryObserver_previousObserver___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 count])
  {
    uint64_t v6 = MEMORY[0x1E4F143A8];
    uint64_t v7 = 3221225472;
    id v8 = __65__TIWordSearch_configureUserDictionaryObserver_previousObserver___block_invoke_2;
    uint64_t v9 = &unk_1E6E2E220;
    CFURLRef v4 = *(void **)(a1 + 32);
    id v10 = *(id *)(a1 + 40);
    id v11 = v3;
    id v5 = +[NSBlockOperation blockOperationWithBlock:&v6];
    objc_msgSend(v4, "addOperation:", v5, v6, v7, v8, v9);
  }
}

uint64_t __65__TIWordSearch_configureUserDictionaryObserver_previousObserver___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) mecabraRef];
  uint64_t v3 = *(void *)(a1 + 40);

  return MEMORY[0x1F4180D70](v2, v3);
}

@end