@interface TUIKeyboardBackendController
+ (BOOL)_isSmartReplyEnabled;
+ (id)sharedInstance;
- (BOOL)hasActivePaths;
- (BOOL)shouldQueryCandidateMultiplexerForKeyboardState:(id)a3;
- (BOOL)waitingForContinuousPathCandidates;
- (NSHashTable)supplementalLexicons;
- (NSMutableSet)activePaths;
- (OS_dispatch_source)supplementalLexiconWatchdog;
- (TUIKeyboardBackendController)init;
- (TUIKeyboardBackendController)initWithInputManagerMux:(id)a3;
- (TUIKeyboardBackendController)initWithInputManagerMux:(id)a3 candidateMux:(id)a4;
- (TUIKeyboardCandidateMultiplexer)candidateMultiplexer;
- (TUIKeyboardCandidateReceiver)candidateReceiver;
- (TUIKeyboardInputManagerMux)inputManager;
- (id)configuredMultiplexer;
- (void)_restoreSupplementalLexiconsIfNeeded;
- (void)acceptingCandidateWithTrigger:(id)a3;
- (void)addUISupplementalLexicon:(id)a3;
- (void)adjustPhraseBoundaryInForwardDirection:(BOOL)a3 granularity:(int)a4 keyboardState:(id)a5 completionHandler:(id)a6;
- (void)applicationDidEnterBackground;
- (void)applicationWillEnterForeground;
- (void)candidateAccepted:(id)a3 keyboardState:(id)a4 candidateRquestToken:(id)a5 completionHandler:(id)a6;
- (void)candidateRejected:(id)a3;
- (void)changingContextWithTrigger:(id)a3;
- (void)generateAutocorrectionsWithKeyboardState:(id)a3 candidateRange:(_NSRange)a4 requestToken:(id)a5 completionHandler:(id)a6;
- (void)generateAutocorrectionsWithKeyboardState:(id)a3 completionHandler:(id)a4;
- (void)generateCandidatesWithKeyboardState:(id)a3 candidateRange:(_NSRange)a4 requestToken:(id)a5 completionHandler:(id)a6;
- (void)generateReplacementsForString:(id)a3 keyLayout:(id)a4 continuation:(id)a5;
- (void)handleAcceptedCandidate:(id)a3 keyboardState:(id)a4 completionHandler:(id)a5;
- (void)handleKeyboardInput:(id)a3 keyboardState:(id)a4 completionHandler:(id)a5;
- (void)lastAcceptedCandidateCorrected;
- (void)logDiscoverabilityEvent:(int)a3 userInfo:(id)a4;
- (void)performHitTestForTouchEvents:(id)a3 keyboardState:(id)a4 completionHandler:(id)a5;
- (void)removeUISupplementalLexicon:(id)a3;
- (void)resetPathState;
- (void)setCandidateMultiplexer:(id)a3;
- (void)setCandidateReceiver:(id)a3;
- (void)setInputManager:(id)a3;
- (void)setOriginalInput:(id)a3;
- (void)setSupplementalLexiconWatchdog:(id)a3;
- (void)setWaitingForContinuousPathCandidates:(BOOL)a3;
- (void)skipHitTestForTouchEvents:(id)a3 keyboardState:(id)a4;
- (void)smartSelectionForTextInDocument:(id)a3 inRange:(_NSRange)a4 language:(id)a5 tokenizedRanges:(id)a6 options:(unint64_t)a7 completion:(id)a8;
- (void)stickerWithIdentifier:(id)a3 stickerRoles:(id)a4 completionHandler:(id)a5;
- (void)syncToKeyboardState:(id)a3 completionHandler:(id)a4;
- (void)textAccepted:(id)a3 completionHandler:(id)a4;
- (void)updatePathStateWithTouchEvents:(id)a3;
- (void)writeTypologyLogWithCompletionHandler:(id)a3;
@end

@implementation TUIKeyboardBackendController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activePaths, 0);
  objc_storeStrong((id *)&self->_candidateMultiplexer, 0);
  objc_storeStrong((id *)&self->_inputManager, 0);
  objc_destroyWeak((id *)&self->_candidateReceiver);
  objc_storeStrong((id *)&self->_supplementalLexicons, 0);
  objc_storeStrong((id *)&self->_supplementalLexiconWatchdog, 0);
}

- (NSMutableSet)activePaths
{
  return self->_activePaths;
}

- (void)setCandidateMultiplexer:(id)a3
{
}

- (TUIKeyboardCandidateMultiplexer)candidateMultiplexer
{
  return (TUIKeyboardCandidateMultiplexer *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSupplementalLexiconWatchdog:(id)a3
{
}

- (OS_dispatch_source)supplementalLexiconWatchdog
{
  return self->_supplementalLexiconWatchdog;
}

- (void)setInputManager:(id)a3
{
}

- (TUIKeyboardInputManagerMux)inputManager
{
  return self->_inputManager;
}

- (void)setCandidateReceiver:(id)a3
{
}

- (TUIKeyboardCandidateReceiver)candidateReceiver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_candidateReceiver);
  return (TUIKeyboardCandidateReceiver *)WeakRetained;
}

- (NSHashTable)supplementalLexicons
{
  return self->_supplementalLexicons;
}

- (void)stickerWithIdentifier:(id)a3 stickerRoles:(id)a4 completionHandler:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [(TUIKeyboardBackendController *)self inputManager];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    v12 = [(TUIKeyboardBackendController *)self inputManager];
    [v12 stickerWithIdentifier:v13 stickerRoles:v8 completionHandler:v9];
  }
}

- (void)changingContextWithTrigger:(id)a3
{
  id v4 = a3;
  id v5 = [(TUIKeyboardBackendController *)self inputManager];
  [v5 changingContextWithTrigger:v4];
}

- (void)acceptingCandidateWithTrigger:(id)a3
{
  id v4 = a3;
  id v5 = [(TUIKeyboardBackendController *)self inputManager];
  [v5 acceptingCandidateWithTrigger:v4];
}

- (void)applicationWillEnterForeground
{
  self->_applicationIsInBackground = 0;
  [(TUIKeyboardBackendController *)self _restoreSupplementalLexiconsIfNeeded];
}

- (void)applicationDidEnterBackground
{
  self->_applicationIsInBackground = 1;
}

- (void)removeUISupplementalLexicon:(id)a3
{
  supplementalLexicons = self->_supplementalLexicons;
  id v5 = a3;
  [(NSHashTable *)supplementalLexicons removeObject:v5];
  id v7 = [(TUIKeyboardBackendController *)self inputManager];
  v6 = [v5 valueForKeyPath:@"_internal"];

  objc_msgSend(v7, "removeSupplementalLexiconWithIdentifier:", objc_msgSend(v6, "identifier"));
}

- (void)addUISupplementalLexicon:(id)a3
{
  id v4 = a3;
  supplementalLexicons = self->_supplementalLexicons;
  if (!supplementalLexicons)
  {
    v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    id v7 = self->_supplementalLexicons;
    self->_supplementalLexicons = v6;

    supplementalLexicons = self->_supplementalLexicons;
  }
  [(NSHashTable *)supplementalLexicons addObject:v4];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__TUIKeyboardBackendController_addUISupplementalLexicon___block_invoke;
  aBlock[3] = &unk_1E55941A8;
  aBlock[4] = self;
  id v8 = _Block_copy(aBlock);
  id v9 = [(TUIKeyboardBackendController *)self inputManager];
  v10 = [v4 valueForKeyPath:@"_internal"];
  [v9 addSupplementalLexicon:v10 completionHandler:v8];
}

void __57__TUIKeyboardBackendController_addUISupplementalLexicon___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F29268] currentConnection];

  if (v2)
  {
    if (!*(void *)(*(void *)(a1 + 32) + 8))
    {
      v3 = [MEMORY[0x1E4F29268] currentConnection];
      int v4 = [v3 processIdentifier];

      dispatch_source_t v5 = dispatch_source_create(MEMORY[0x1E4F14470], v4, 0x80000000uLL, MEMORY[0x1E4F14428]);
      uint64_t v6 = *(void *)(a1 + 32);
      id v7 = *(void **)(v6 + 8);
      *(void *)(v6 + 8) = v5;

      uint64_t v8 = *(void *)(a1 + 32);
      id v9 = *(NSObject **)(v8 + 8);
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __57__TUIKeyboardBackendController_addUISupplementalLexicon___block_invoke_2;
      handler[3] = &unk_1E55941A8;
      handler[4] = v8;
      dispatch_source_set_event_handler(v9, handler);
      dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 8));
    }
  }
}

uint64_t __57__TUIKeyboardBackendController_addUISupplementalLexicon___block_invoke_2(uint64_t a1)
{
  dispatch_source_cancel(*(dispatch_source_t *)(*(void *)(a1 + 32) + 8));
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  *(void *)(v2 + 8) = 0;

  *(unsigned char *)(*(void *)(a1 + 32) + 17) = 1;
  int v4 = *(void **)(a1 + 32);
  return [v4 _restoreSupplementalLexiconsIfNeeded];
}

- (void)adjustPhraseBoundaryInForwardDirection:(BOOL)a3 granularity:(int)a4 keyboardState:(id)a5 completionHandler:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  BOOL v8 = a3;
  id v10 = a6;
  id v11 = a5;
  id v12 = [(TUIKeyboardBackendController *)self inputManager];
  [v12 adjustPhraseBoundaryInForwardDirection:v8 granularity:v7 keyboardState:v11 completionHandler:v10];
}

- (void)writeTypologyLogWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(TUIKeyboardBackendController *)self inputManager];
  [v5 writeTypologyLogWithCompletionHandler:v4];
}

- (void)logDiscoverabilityEvent:(int)a3 userInfo:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = [(TUIKeyboardBackendController *)self inputManager];
  [v7 logDiscoverabilityEvent:v4 userInfo:v6];
}

- (void)lastAcceptedCandidateCorrected
{
  id v2 = [(TUIKeyboardBackendController *)self inputManager];
  [v2 lastAcceptedCandidateCorrected];
}

- (void)candidateRejected:(id)a3
{
  id v4 = a3;
  id v5 = [(TUIKeyboardBackendController *)self inputManager];
  [v5 candidateRejected:v4];
}

- (void)textAccepted:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(TUIKeyboardBackendController *)self inputManager];
  [v8 textAccepted:v7 completionHandler:v6];
}

- (void)setOriginalInput:(id)a3
{
  id v4 = a3;
  id v5 = [(TUIKeyboardBackendController *)self inputManager];
  [v5 setOriginalInput:v4];
}

- (void)candidateAccepted:(id)a3 keyboardState:(id)a4 candidateRquestToken:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [(TUIKeyboardBackendController *)self candidateMultiplexer];
  [v14 candidateAccepted:v13 keyboardState:v12 candidateRequestToken:v11];

  id v15 = [(TUIKeyboardBackendController *)self inputManager];
  [v15 textAccepted:v13 completionHandler:v10];
}

- (void)generateReplacementsForString:(id)a3 keyLayout:(id)a4 continuation:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(TUIKeyboardBackendController *)self inputManager];
  [v11 generateReplacementsForString:v10 keyLayout:v9 continuation:v8];
}

- (void)handleAcceptedCandidate:(id)a3 keyboardState:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(TUIKeyboardBackendController *)self inputManager];
  [v11 handleAcceptedCandidate:v10 keyboardState:v9 completionHandler:v8];
}

- (void)generateCandidatesWithKeyboardState:(id)a3 candidateRange:(_NSRange)a4 requestToken:(id)a5 completionHandler:(id)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  id v14 = [(TUIKeyboardBackendController *)self inputManager];
  objc_msgSend(v14, "generateCandidatesWithKeyboardState:candidateRange:requestToken:completionHandler:", v13, location, length, v12, v11);
}

- (void)generateAutocorrectionsWithKeyboardState:(id)a3 candidateRange:(_NSRange)a4 requestToken:(id)a5 completionHandler:(id)a6
{
  NSUInteger length = a4.length;
  NSUInteger v9 = a4.location;
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  BOOL v14 = [(TUIKeyboardBackendController *)self shouldQueryCandidateMultiplexerForKeyboardState:v11];
  id v15 = TUIBackendControllerLog();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
  if (v14)
  {
    if (v16)
    {
      LOWORD(location[0]) = 0;
      _os_log_debug_impl(&dword_18D47E000, v15, OS_LOG_TYPE_DEBUG, "Query candidate multiplexer", (uint8_t *)location, 2u);
    }

    v17 = [(TUIKeyboardBackendController *)self candidateReceiver];
    v18 = [(TUIKeyboardBackendController *)self candidateMultiplexer];
    [v18 setCandidateReceiver:v17];

    id v15 = [(TUIKeyboardBackendController *)self candidateMultiplexer];
    [v15 generateCandidatesForKeyboardState:v11 requestToken:v12];
  }
  else if (v16)
  {
    LOWORD(location[0]) = 0;
    _os_log_debug_impl(&dword_18D47E000, v15, OS_LOG_TYPE_DEBUG, "Skip query candidate multiplexer", (uint8_t *)location, 2u);
  }

  objc_initWeak(location, self);
  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  v25 = __119__TUIKeyboardBackendController_generateAutocorrectionsWithKeyboardState_candidateRange_requestToken_completionHandler___block_invoke;
  v26 = &unk_1E5593DD8;
  objc_copyWeak(&v30, location);
  v27 = self;
  id v28 = v12;
  id v29 = v13;
  id v19 = v13;
  id v20 = v12;
  v21 = _Block_copy(&v23);
  v22 = [(TUIKeyboardBackendController *)self inputManager];
  objc_msgSend(v22, "generateAutocorrectionsWithKeyboardState:candidateRange:requestToken:completionHandler:", v11, v9, length, v20, v21);

  objc_destroyWeak(&v30);
  objc_destroyWeak(location);
}

void __119__TUIKeyboardBackendController_generateAutocorrectionsWithKeyboardState_candidateRange_requestToken_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    [*(id *)(a1 + 32) setWaitingForContinuousPathCandidates:0];
    id v4 = [WeakRetained candidateMultiplexer];
    [v4 receiveExternalAutocorrectionUpdate:v6 requestToken:*(void *)(a1 + 40)];
  }
  uint64_t v5 = *(void *)(a1 + 48);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
  }
}

- (void)generateAutocorrectionsWithKeyboardState:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(TUIKeyboardBackendController *)self inputManager];
  [v8 generateAutocorrectionsWithKeyboardState:v7 completionHandler:v6];
}

- (void)handleKeyboardInput:(id)a3 keyboardState:(id)a4 completionHandler:(id)a5
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = [v8 touchEvent];
  id v12 = (void *)v11;
  if (v11)
  {
    v20[0] = v11;
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
    [(TUIKeyboardBackendController *)self updatePathStateWithTouchEvents:v13];
  }
  BOOL v14 = [v8 acceptedCandidate];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v15 = (void *)MEMORY[0x1E4FAE318];
    BOOL v16 = [v14 candidate];
    v17 = [v14 input];
    v18 = objc_msgSend(v15, "candidateWithCandidate:forInput:property:", v16, v17, objc_msgSend(v14, "candidateProperty"));
    [v8 setAcceptedCandidate:v18];
  }
  id v19 = [(TUIKeyboardBackendController *)self inputManager];
  [v19 handleKeyboardInput:v8 keyboardState:v10 completionHandler:v9];
}

- (void)smartSelectionForTextInDocument:(id)a3 inRange:(_NSRange)a4 language:(id)a5 tokenizedRanges:(id)a6 options:(unint64_t)a7 completion:(id)a8
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v15 = a8;
  id v16 = a6;
  id v17 = a5;
  id v18 = a3;
  id v19 = [(TUIKeyboardBackendController *)self inputManager];
  objc_msgSend(v19, "smartSelectionForTextInDocument:inRange:language:tokenizedRanges:options:completion:", v18, location, length, v17, v16, a7, v15);
}

- (void)skipHitTestForTouchEvents:(id)a3 keyboardState:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(TUIKeyboardBackendController *)self updatePathStateWithTouchEvents:v7];
  id v8 = [(TUIKeyboardBackendController *)self inputManager];
  [v8 skipHitTestForTouchEvents:v7 keyboardState:v6];
}

- (void)performHitTestForTouchEvents:(id)a3 keyboardState:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [(TUIKeyboardBackendController *)self updatePathStateWithTouchEvents:v10];
  id v11 = [(TUIKeyboardBackendController *)self inputManager];
  [v11 performHitTestForTouchEvents:v10 keyboardState:v9 continuation:v8];
}

- (void)syncToKeyboardState:(id)a3 completionHandler:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  [(TUIKeyboardBackendController *)self resetPathState];
  id v7 = [(TUIKeyboardBackendController *)self inputManager];
  [v7 syncToKeyboardState:v10 completionHandler:v6];

  id v8 = [(TUIKeyboardBackendController *)self candidateMultiplexer];

  if (v8)
  {
    id v9 = [(TUIKeyboardBackendController *)self candidateMultiplexer];
    [v9 syncToKeyboardState:v10];
  }
}

- (BOOL)shouldQueryCandidateMultiplexerForKeyboardState:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [(TUIKeyboardBackendController *)self hasActivePaths];
  BOOL v5 = [(TUIKeyboardBackendController *)self waitingForContinuousPathCandidates];
  id v6 = [(TUIKeyboardBackendController *)self candidateMultiplexer];
  if (v6) {
    int v7 = !v4 && !v5;
  }
  else {
    int v7 = 0;
  }

  id v8 = TUISmartReplyLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    if (v7) {
      id v10 = "YES";
    }
    else {
      id v10 = "NO";
    }
    id v11 = [(TUIKeyboardBackendController *)self candidateMultiplexer];
    int v15 = 136316162;
    id v16 = "-[TUIKeyboardBackendController shouldQueryCandidateMultiplexerForKeyboardState:]";
    if (v11) {
      id v12 = "YES";
    }
    else {
      id v12 = "NO";
    }
    id v18 = v10;
    if (v4) {
      id v13 = "YES";
    }
    else {
      id v13 = "NO";
    }
    __int16 v17 = 2080;
    if (v5) {
      BOOL v14 = "YES";
    }
    else {
      BOOL v14 = "NO";
    }
    __int16 v19 = 2080;
    id v20 = v12;
    __int16 v21 = 2080;
    v22 = v13;
    __int16 v23 = 2080;
    uint64_t v24 = v14;
    _os_log_debug_impl(&dword_18D47E000, v8, OS_LOG_TYPE_DEBUG, "%s => %s (hasCandidateMux=%s, hasActivePaths=%s, waitingForCPCandidates=%s)", (uint8_t *)&v15, 0x34u);
  }
  return v7;
}

- (BOOL)hasActivePaths
{
  id v2 = [(TUIKeyboardBackendController *)self activePaths];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (void)resetPathState
{
  BOOL v3 = [(TUIKeyboardBackendController *)self activePaths];
  [v3 removeAllObjects];

  [(TUIKeyboardBackendController *)self setWaitingForContinuousPathCandidates:0];
}

- (void)updatePathStateWithTouchEvents:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v25 = [(TUIKeyboardBackendController *)self hasActivePaths];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v27;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v26 + 1) + 8 * v9);
        uint64_t v11 = [v10 pathIndex];
        unsigned int v12 = [v10 continuousPathState];
        if (v12 <= 6)
        {
          if (((1 << v12) & 0x47) != 0)
          {
            id v13 = [(TUIKeyboardBackendController *)self activePaths];
            BOOL v14 = [NSNumber numberWithInteger:v11];
            [v13 removeObject:v14];
LABEL_11:

            goto LABEL_12;
          }
          if (((1 << v12) & 0x18) != 0)
          {
            id v13 = [(TUIKeyboardBackendController *)self activePaths];
            BOOL v14 = [NSNumber numberWithInteger:v11];
            [v13 addObject:v14];
            goto LABEL_11;
          }
          int v15 = [(TUIKeyboardBackendController *)self activePaths];
          id v16 = [NSNumber numberWithInteger:v11];
          [v15 removeObject:v16];

          __int16 v17 = [(TUIKeyboardBackendController *)self activePaths];
          uint64_t v18 = [v17 count];

          if (!v18) {
            [(TUIKeyboardBackendController *)self setWaitingForContinuousPathCandidates:1];
          }
        }
LABEL_12:
        ++v9;
      }
      while (v7 != v9);
      uint64_t v19 = [v5 countByEnumeratingWithState:&v26 objects:v34 count:16];
      uint64_t v7 = v19;
    }
    while (v19);
  }

  int v20 = [(TUIKeyboardBackendController *)self hasActivePaths];
  if (v25 != v20)
  {
    int v21 = v20;
    v22 = TUIBackendControllerLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      __int16 v23 = "NO";
      if (v25) {
        uint64_t v24 = "YES";
      }
      else {
        uint64_t v24 = "NO";
      }
      if (v21) {
        __int16 v23 = "YES";
      }
      *(_DWORD *)buf = 136315394;
      v31 = v24;
      __int16 v32 = 2080;
      v33 = v23;
      _os_log_debug_impl(&dword_18D47E000, v22, OS_LOG_TYPE_DEBUG, "hasActivePaths state changed from %s to %s", buf, 0x16u);
    }
  }
}

- (void)setWaitingForContinuousPathCandidates:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_waitingForContinuousPathCandidates != v3)
  {
    uint64_t v6 = TUIBackendControllerLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = "YES";
      if (self->_waitingForContinuousPathCandidates) {
        uint64_t v8 = "YES";
      }
      else {
        uint64_t v8 = "NO";
      }
      if (!v3) {
        uint64_t v7 = "NO";
      }
      int v9 = 136315394;
      id v10 = v8;
      __int16 v11 = 2080;
      unsigned int v12 = v7;
      _os_log_debug_impl(&dword_18D47E000, v6, OS_LOG_TYPE_DEBUG, "Changing _waitingForContinuousPathCandidate from %s to %s", (uint8_t *)&v9, 0x16u);
    }

    self->_waitingForContinuousPathCandidates = v3;
  }
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)waitingForContinuousPathCandidates
{
  id v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_waitingForContinuousPathCandidates;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)_restoreSupplementalLexiconsIfNeeded
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!self->_applicationIsInBackground && self->_needsRestoreSupplementalLexicons)
  {
    self->_needsRestoreSupplementalLexicons = 0;
    BOOL v3 = self->_supplementalLexicons;
    supplementalLexicons = self->_supplementalLexicons;
    self->_supplementalLexicons = 0;

    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = v3;
    uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          -[TUIKeyboardBackendController addUISupplementalLexicon:](self, "addUISupplementalLexicon:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
        }
        while (v7 != v9);
        uint64_t v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (TUIKeyboardBackendController)initWithInputManagerMux:(id)a3 candidateMux:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TUIKeyboardBackendController;
  uint64_t v9 = [(TUIKeyboardBackendController *)&v14 init];
  long long v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_inputManager, a3);
    objc_storeStrong((id *)&v10->_candidateMultiplexer, a4);
    [(TUIKeyboardInputManagerMux *)v10->_inputManager setCandidateMultiplexer:v10->_candidateMultiplexer];
    long long v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    activePaths = v10->_activePaths;
    v10->_activePaths = v11;

    v10->_lock._os_unfair_lock_opaque = 0;
    v10->_waitingForContinuousPathCandidates = 0;
  }

  return v10;
}

- (id)configuredMultiplexer
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(TUIKeyboardCandidateMultiplexer);
  [(TUIKeyboardCandidateMultiplexer *)v2 setEnableKbdSource:1];
  if (_os_feature_enabled_impl()
    && ((_os_feature_enabled_impl() & 1) != 0 || dyld_program_sdk_at_least()))
  {
    BOOL v3 = objc_alloc_init(TUIMathCompletionGenerator);
    [(TUIMathCompletionGenerator *)v3 setEnabled:1];
    [(TUIKeyboardCandidateMultiplexer *)v2 addGenerator:v3];
  }
  if ([(id)objc_opt_class() _isSmartReplyEnabled])
  {
    id v4 = TUISmartReplyLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315138;
      long long v13 = "-[TUIKeyboardBackendController configuredMultiplexer]";
      _os_log_impl(&dword_18D47E000, v4, OS_LOG_TYPE_DEFAULT, "%s Backend controller is installing the smart reply generator", (uint8_t *)&v12, 0xCu);
    }

    id v5 = +[TUISmartReplyGenerator sharedInstance];
    [v5 setEnabled:1];
    [(TUIKeyboardCandidateMultiplexer *)v2 addGenerator:v5];
  }
  if (_os_feature_enabled_impl())
  {
    uint64_t v6 = [MEMORY[0x1E4FB1910] sharedInputModeController];
    id v7 = [v6 currentInputMode];

    id v8 = [v7 primaryLanguage];
    uint64_t v9 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v8];
    long long v10 = [[TUITextEffectsGenerator alloc] initWithLocale:v9];
    [(TUITextEffectsGenerator *)v10 setEnabled:0];
    [(TUIKeyboardCandidateMultiplexer *)v2 addGenerator:v10];
  }
  return v2;
}

- (TUIKeyboardBackendController)initWithInputManagerMux:(id)a3
{
  id v4 = a3;
  if (_os_feature_enabled_impl())
  {
    id v5 = [(TUIKeyboardBackendController *)self configuredMultiplexer];
  }
  else
  {
    id v5 = 0;
  }
  uint64_t v6 = [(TUIKeyboardBackendController *)self initWithInputManagerMux:v4 candidateMux:v5];

  return v6;
}

- (TUIKeyboardBackendController)init
{
  BOOL v3 = +[TUIKeyboardInputManagerMux sharedInstance];
  if (_os_feature_enabled_impl())
  {
    id v4 = [(TUIKeyboardBackendController *)self configuredMultiplexer];
  }
  else
  {
    id v4 = 0;
  }
  id v5 = [(TUIKeyboardBackendController *)self initWithInputManagerMux:v3 candidateMux:v4];

  return v5;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_6737 != -1) {
    dispatch_once(&sharedInstance_onceToken_6737, &__block_literal_global_6);
  }
  id v2 = (void *)sharedInstance___instance_6738;
  return v2;
}

void __46__TUIKeyboardBackendController_sharedInstance__block_invoke()
{
  v0 = [TUIKeyboardBackendController alloc];
  id v3 = +[TUIKeyboardInputManagerMux sharedInstance];
  uint64_t v1 = [(TUIKeyboardBackendController *)v0 initWithInputManagerMux:v3];
  id v2 = (void *)sharedInstance___instance_6738;
  sharedInstance___instance_6738 = v1;
}

+ (BOOL)_isSmartReplyEnabled
{
  if (_isSmartReplyEnabled_onceToken != -1) {
    dispatch_once(&_isSmartReplyEnabled_onceToken, &__block_literal_global_6740);
  }
  return _isSmartReplyEnabled_enabled;
}

uint64_t __52__TUIKeyboardBackendController__isSmartReplyEnabled__block_invoke()
{
  char v0 = MGGetBoolAnswer();
  char v1 = _os_feature_enabled_impl();
  uint64_t result = _os_feature_enabled_impl();
  _isSmartReplyEnabled_enabled = v0 & (v1 | result);
  return result;
}

@end