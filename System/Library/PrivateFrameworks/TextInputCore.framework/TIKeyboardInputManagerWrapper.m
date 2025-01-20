@interface TIKeyboardInputManagerWrapper
- (NSString)cachedContextChangeTrigger;
- (TIClientProxy)clientProxy;
- (TIKeyboardInputManagerBase)inputManager;
- (TIKeyboardInputManagerLogging)logger;
- (TIKeyboardInputManagerWrapper)init;
- (id)generateInlineCompletions:(id)a3 withPrefix:(id)a4;
- (void)_updateKeyboardOutput:(id)a3 withSecureCandidatePayload:(id)a4 keyboardState:(id)a5;
- (void)acceptSecureCandidate:(id)a3 keyboardState:(id)a4 completion:(id)a5;
- (void)acceptingCandidateWithTrigger:(id)a3;
- (void)addSupplementalLexicon:(id)a3 completionHandler:(id)a4;
- (void)adjustPhraseBoundaryInForwardDirection:(BOOL)a3 granularity:(int)a4 keyboardState:(id)a5 completionHandler:(id)a6;
- (void)adjustPhraseBoundaryInForwardDirection:(BOOL)a3 keyboardState:(id)a4 completionHandler:(id)a5;
- (void)candidateRejected:(id)a3;
- (void)changingContextWithTrigger:(id)a3;
- (void)generateAutocorrectionsWithKeyboardState:(id)a3 candidateRange:(_NSRange)a4 completionHandler:(id)a5;
- (void)generateAutocorrectionsWithKeyboardState:(id)a3 candidateRange:(_NSRange)a4 requestToken:(id)a5 completionHandler:(id)a6;
- (void)generateAutocorrectionsWithKeyboardState:(id)a3 completionHandler:(id)a4;
- (void)generateCandidatesWithKeyboardState:(id)a3 candidateRange:(_NSRange)a4 completionHandler:(id)a5;
- (void)generateCandidatesWithKeyboardState:(id)a3 candidateRange:(_NSRange)a4 requestToken:(id)a5 completionHandler:(id)a6;
- (void)generateRefinementsForCandidate:(id)a3 keyboardState:(id)a4 completionHandler:(id)a5;
- (void)generateReplacementsForString:(id)a3 keyLayout:(id)a4 continuation:(id)a5;
- (void)handleAcceptedCandidate:(id)a3 acceptedSecureCandidate:(id)a4 keyboardState:(id)a5 completionHandler:(id)a6;
- (void)handleAcceptedCandidate:(id)a3 keyboardState:(id)a4 completionHandler:(id)a5;
- (void)handleKeyboardInput:(id)a3 acceptedSecureCandidate:(id)a4 keyboardState:(id)a5 completionHandler:(id)a6;
- (void)handleKeyboardInput:(id)a3 keyboardState:(id)a4 completionHandler:(id)a5;
- (void)handleKeyboardState:(id)a3;
- (void)handleKeyboardState:(id)a3 withInputEvent:(id)a4;
- (void)lastAcceptedCandidateCorrected;
- (void)logDiscoverabilityEvent:(int)a3 userInfo:(id)a4;
- (void)performHitTestForTouchEvent:(id)a3 keyboardState:(id)a4 continuation:(id)a5;
- (void)performHitTestForTouchEvents:(id)a3 keyboardState:(id)a4 continuation:(id)a5;
- (void)registerLearning:(id)a3 fullCandidate:(id)a4 keyboardState:(id)a5 mode:(id)a6;
- (void)registerLearningForCompletion:(id)a3 fullCompletion:(id)a4 context:(id)a5 prefix:(id)a6 mode:(id)a7;
- (void)removeSupplementalLexiconWithIdentifier:(unint64_t)a3;
- (void)setCachedContextChangeTrigger:(id)a3;
- (void)setClientProxy:(id)a3;
- (void)setInputManager:(id)a3;
- (void)setLogger:(id)a3;
- (void)setOriginalInput:(id)a3;
- (void)skipHitTestForTouchEvent:(id)a3 keyboardState:(id)a4;
- (void)skipHitTestForTouchEvents:(id)a3 keyboardState:(id)a4;
- (void)smartSelectionForTextInDocument:(id)a3 inRange:(_NSRange)a4 language:(id)a5 tokenizedRanges:(id)a6 options:(unint64_t)a7 completion:(id)a8;
- (void)stickerWithIdentifier:(id)a3 stickerRoles:(id)a4 completionHandler:(id)a5;
- (void)syncToKeyboardState:(id)a3 completionHandler:(id)a4;
- (void)textAccepted:(id)a3;
- (void)textAccepted:(id)a3 completionHandler:(id)a4;
- (void)updateAnalyticsForRejectedSuggestion:(id)a3 keyboardState:(id)a4;
- (void)writeTypologyLogWithCompletionHandler:(id)a3;
@end

@implementation TIKeyboardInputManagerWrapper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedContextChangeTrigger, 0);
  objc_storeStrong((id *)&self->_clientProxy, 0);

  objc_storeStrong((id *)&self->_inputManager, 0);
}

- (void)setCachedContextChangeTrigger:(id)a3
{
}

- (NSString)cachedContextChangeTrigger
{
  return self->_cachedContextChangeTrigger;
}

- (void)setClientProxy:(id)a3
{
}

- (TIClientProxy)clientProxy
{
  return self->_clientProxy;
}

- (void)setInputManager:(id)a3
{
}

- (TIKeyboardInputManagerBase)inputManager
{
  return self->_inputManager;
}

- (void)stickerWithIdentifier:(id)a3 stickerRoles:(id)a4 completionHandler:(id)a5
{
  id v17 = a3;
  id v8 = a4;
  v9 = (void (**)(id, void *))a5;
  if (_os_feature_enabled_impl())
  {
    int v10 = _os_feature_enabled_impl();
  }
  else
  {
    v11 = [MEMORY[0x1E4F1CA20] currentLocale];
    v12 = [v11 languageCode];

    v13 = [(TIKeyboardInputManagerBase *)self->_inputManager inputMode];
    v14 = [v13 languageWithRegion];

    if (_os_feature_enabled_impl() && [v12 hasPrefix:@"en"]) {
      int v10 = [v14 hasPrefix:@"en"];
    }
    else {
      int v10 = 0;
    }
  }
  if (v17 && v10)
  {
    v15 = objc_alloc_init(TIStickerCandidateGenerator);
    v16 = [(TIStickerCandidateGenerator *)v15 keyboardStickerWithIdentifier:v17 roles:v8];
    v9[2](v9, v16);
  }
  else
  {
    v9[2](v9, 0);
  }
}

- (void)removeSupplementalLexiconWithIdentifier:(unint64_t)a3
{
  kdebug_trace();
  kac_get_log();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (const void *)((unint64_t)self ^ 0xF);
  os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v5, (const void *)((unint64_t)self ^ 0xF));
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v8 = v7;
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1E3F0E000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v8, "kbdManager.removeSupplementalLexicon", (const char *)&unk_1E41704BE, buf, 2u);
    }
  }

  v9 = +[TITransientLexiconManager sharedInstance];
  int v10 = [v9 supplementalLexicons];
  [v10 removeLexiconWithIdentifier:a3];

  kdebug_trace();
  kac_get_log();
  v11 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v11, v6);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v13 = v12;
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)v14 = 0;
      _os_signpost_emit_with_name_impl(&dword_1E3F0E000, v11, OS_SIGNPOST_INTERVAL_END, v13, "kbdManager.removeSupplementalLexicon", (const char *)&unk_1E41704BE, v14, 2u);
    }
  }
}

- (void)addSupplementalLexicon:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  os_signpost_id_t v7 = (void (**)(void))a4;
  kdebug_trace();
  kac_get_log();
  os_signpost_id_t v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = (const void *)((unint64_t)self ^ 0xE);
  os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v8, (const void *)((unint64_t)self ^ 0xE));
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v11 = v10;
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1E3F0E000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v11, "kbdManager.addSupplementalLexicon", (const char *)&unk_1E41704BE, buf, 2u);
    }
  }

  os_signpost_id_t v12 = +[TITransientLexiconManager sharedInstance];
  os_signpost_id_t v13 = [v12 ensureSupplementalLexicons];
  [v13 addLexicon:v6];

  if (v7) {
    v7[2](v7);
  }
  kdebug_trace();
  kac_get_log();
  v14 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v15 = os_signpost_id_make_with_pointer(v14, v9);
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v16 = v15;
    if (os_signpost_enabled(v14))
    {
      *(_WORD *)id v17 = 0;
      _os_signpost_emit_with_name_impl(&dword_1E3F0E000, v14, OS_SIGNPOST_INTERVAL_END, v16, "kbdManager.addSupplementalLexicon", (const char *)&unk_1E41704BE, v17, 2u);
    }
  }
}

- (void)writeTypologyLogWithCompletionHandler:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  v5 = [(TIKeyboardInputManagerWrapper *)self inputManager];
  [v5 storeLanguageModelDynamicDataIncludingCache];

  id v6 = [(TIKeyboardInputManagerWrapper *)self inputManager];
  [v6 clearHumanReadableTrace];

  os_signpost_id_t v7 = [(TIKeyboardInputManagerWrapper *)self logger];
  id v9 = [v7 writeToFile];

  os_signpost_id_t v8 = [v9 objectAtIndexedSubscript:0];
  v4[2](v4, v8);
}

- (void)logDiscoverabilityEvent:(int)a3 userInfo:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = [(TIKeyboardInputManagerWrapper *)self inputManager];
  [v7 logDiscoverabilityEvent:v4 userInfo:v6];
}

- (void)lastAcceptedCandidateCorrected
{
  kdebug_trace();
  kac_get_log();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = (const void *)((unint64_t)self ^ 0xD);
  os_signpost_id_t v5 = os_signpost_id_make_with_pointer(v3, (const void *)((unint64_t)self ^ 0xD));
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v6 = v5;
    if (os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1E3F0E000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v6, "kbdManager.lastAcceptedCorrected", (const char *)&unk_1E41704BE, buf, 2u);
    }
  }

  id v7 = [(TIKeyboardInputManagerWrapper *)self inputManager];
  [v7 lastAcceptedCandidateCorrected];

  os_signpost_id_t v8 = [(TIKeyboardInputManagerWrapper *)self logger];
  [v8 logReceivedLastAcceptedCandidateCorrected];

  kdebug_trace();
  kac_get_log();
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v9, v4);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v11 = v10;
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)os_signpost_id_t v12 = 0;
      _os_signpost_emit_with_name_impl(&dword_1E3F0E000, v9, OS_SIGNPOST_INTERVAL_END, v11, "kbdManager.lastAcceptedCorrected", (const char *)&unk_1E41704BE, v12, 2u);
    }
  }
}

- (void)registerLearningForCompletion:(id)a3 fullCompletion:(id)a4 context:(id)a5 prefix:(id)a6 mode:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  kdebug_trace();
  kac_get_log();
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  v18 = (const void *)((unint64_t)self ^ 0xC);
  os_signpost_id_t v19 = os_signpost_id_make_with_pointer(v17, (const void *)((unint64_t)self ^ 0xC));
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v20 = v19;
    if (os_signpost_enabled(v17))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1E3F0E000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v20, "kbdManager.candidateRejected", (const char *)&unk_1E41704BE, buf, 2u);
    }
  }

  v21 = [(TIKeyboardInputManagerWrapper *)self inputManager];
  [v21 registerLearningForCompletion:v12 fullCompletion:v13 context:v14 prefix:v15 mode:v16];

  kdebug_trace();
  kac_get_log();
  v22 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v23 = os_signpost_id_make_with_pointer(v22, v18);
  if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v24 = v23;
    if (os_signpost_enabled(v22))
    {
      *(_WORD *)v25 = 0;
      _os_signpost_emit_with_name_impl(&dword_1E3F0E000, v22, OS_SIGNPOST_INTERVAL_END, v24, "kbdManager.candidateRejected", (const char *)&unk_1E41704BE, v25, 2u);
    }
  }
}

- (void)registerLearning:(id)a3 fullCandidate:(id)a4 keyboardState:(id)a5 mode:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  kdebug_trace();
  kac_get_log();
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  id v15 = (const void *)((unint64_t)self ^ 0xC);
  os_signpost_id_t v16 = os_signpost_id_make_with_pointer(v14, (const void *)((unint64_t)self ^ 0xC));
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v17 = v16;
    if (os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1E3F0E000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v17, "kbdManager.candidateRejected", (const char *)&unk_1E41704BE, buf, 2u);
    }
  }

  v18 = [(TIKeyboardInputManagerWrapper *)self inputManager];
  [v18 registerLearning:v10 fullCandidate:v11 keyboardState:v12 mode:v13];

  kdebug_trace();
  kac_get_log();
  os_signpost_id_t v19 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v20 = os_signpost_id_make_with_pointer(v19, v15);
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v21 = v20;
    if (os_signpost_enabled(v19))
    {
      *(_WORD *)v22 = 0;
      _os_signpost_emit_with_name_impl(&dword_1E3F0E000, v19, OS_SIGNPOST_INTERVAL_END, v21, "kbdManager.candidateRejected", (const char *)&unk_1E41704BE, v22, 2u);
    }
  }
}

- (void)candidateRejected:(id)a3
{
  id v4 = a3;
  kdebug_trace();
  kac_get_log();
  os_signpost_id_t v5 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v6 = (const void *)((unint64_t)self ^ 0xC);
  os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v5, (const void *)((unint64_t)self ^ 0xC));
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v8 = v7;
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1E3F0E000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v8, "kbdManager.candidateRejected", (const char *)&unk_1E41704BE, buf, 2u);
    }
  }

  id v9 = [(TIKeyboardInputManagerWrapper *)self inputManager];
  [v9 candidateRejected:v4];

  id v10 = [(TIKeyboardInputManagerWrapper *)self logger];
  [v10 logReceivedCandidateRejected:v4];

  kdebug_trace();
  kac_get_log();
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v11, v6);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v13 = v12;
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)id v14 = 0;
      _os_signpost_emit_with_name_impl(&dword_1E3F0E000, v11, OS_SIGNPOST_INTERVAL_END, v13, "kbdManager.candidateRejected", (const char *)&unk_1E41704BE, v14, 2u);
    }
  }
}

- (void)textAccepted:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  os_signpost_id_t v7 = (void (**)(id, void *))a4;
  kdebug_trace();
  kac_get_log();
  os_signpost_id_t v8 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = (const void *)((unint64_t)self ^ 0xB);
  os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v8, (const void *)((unint64_t)self ^ 0xB));
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v11 = v10;
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1E3F0E000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v11, "kbdManager.textAccepted", (const char *)&unk_1E41704BE, buf, 2u);
    }
  }

  os_signpost_id_t v12 = [(TIKeyboardInputManagerWrapper *)self inputManager];
  [v12 textAccepted:v6 fromPredictiveInputBar:0 withInput:0];

  os_signpost_id_t v13 = [(TIKeyboardInputManagerWrapper *)self logger];
  [v13 logReceivedTextAccepted:v6];

  id v14 = [(TIKeyboardInputManagerWrapper *)self inputManager];
  id v15 = [v14 keyboardConfiguration];

  kdebug_trace();
  kac_get_log();
  os_signpost_id_t v16 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v17 = os_signpost_id_make_with_pointer(v16, v9);
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v18 = v17;
    if (os_signpost_enabled(v16))
    {
      *(_WORD *)os_signpost_id_t v19 = 0;
      _os_signpost_emit_with_name_impl(&dword_1E3F0E000, v16, OS_SIGNPOST_INTERVAL_END, v18, "kbdManager.textAccepted", (const char *)&unk_1E41704BE, v19, 2u);
    }
  }

  if (v7) {
    v7[2](v7, v15);
  }
}

- (void)textAccepted:(id)a3
{
}

- (void)setOriginalInput:(id)a3
{
  id v4 = a3;
  kdebug_trace();
  kac_get_log();
  os_signpost_id_t v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = (const void *)((unint64_t)self ^ 0xA);
  os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v5, (const void *)((unint64_t)self ^ 0xA));
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v8 = v7;
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1E3F0E000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v8, "kbdManager.setOriginalInput", (const char *)&unk_1E41704BE, buf, 2u);
    }
  }

  id v9 = [(TIKeyboardInputManagerWrapper *)self inputManager];
  [v9 setOriginalInput:v4];

  os_signpost_id_t v10 = [(TIKeyboardInputManagerWrapper *)self logger];
  [v10 logReceivedSetOriginalInput:v4];

  kdebug_trace();
  kac_get_log();
  os_signpost_id_t v11 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v11, v6);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v13 = v12;
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)id v14 = 0;
      _os_signpost_emit_with_name_impl(&dword_1E3F0E000, v11, OS_SIGNPOST_INTERVAL_END, v13, "kbdManager.setOriginalInput", (const char *)&unk_1E41704BE, v14, 2u);
    }
  }
}

- (void)adjustPhraseBoundaryInForwardDirection:(BOOL)a3 granularity:(int)a4 keyboardState:(id)a5 completionHandler:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  BOOL v8 = a3;
  id v10 = a5;
  os_signpost_id_t v11 = (void (**)(id, void *))a6;
  kdebug_trace();
  kac_get_log();
  os_signpost_id_t v12 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v13 = (const void *)((unint64_t)self ^ 9);
  os_signpost_id_t v14 = os_signpost_id_make_with_pointer(v12, (const void *)((unint64_t)self ^ 9));
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v15 = v14;
    if (os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1E3F0E000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v15, "kbdManager.adjustPhraseBoundary.granular", (const char *)&unk_1E41704BE, buf, 2u);
    }
  }

  [(TIKeyboardInputManagerWrapper *)self handleKeyboardState:v10];
  os_signpost_id_t v16 = [(TIKeyboardInputManagerWrapper *)self logger];
  if (v16) {
    os_signpost_id_t v17 = (void *)[v10 copy];
  }
  else {
    os_signpost_id_t v17 = 0;
  }

  os_signpost_id_t v18 = [(TIKeyboardInputManagerWrapper *)self inputManager];
  [v18 syncToKeyboardState:v10];

  os_signpost_id_t v19 = [(TIKeyboardInputManagerWrapper *)self inputManager];
  [v19 adjustPhraseBoundaryInForwardDirection:v8 granularity:v7];

  os_signpost_id_t v20 = [(TIKeyboardInputManagerWrapper *)self inputManager];
  os_signpost_id_t v21 = [v20 keyboardConfiguration];

  v11[2](v11, v21);
  v22 = [(TIKeyboardInputManagerWrapper *)self logger];
  [v22 logKeyboardConfig:v21 forAdjustedPhraseBoundaryInForwardDirection:v8 granularity:v7 keyboardState:v17];

  kdebug_trace();
  kac_get_log();
  os_signpost_id_t v23 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v24 = os_signpost_id_make_with_pointer(v23, v13);
  if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v25 = v24;
    if (os_signpost_enabled(v23))
    {
      *(_WORD *)v26 = 0;
      _os_signpost_emit_with_name_impl(&dword_1E3F0E000, v23, OS_SIGNPOST_INTERVAL_END, v25, "kbdManager.adjustPhraseBoundary.granular", (const char *)&unk_1E41704BE, v26, 2u);
    }
  }
}

- (void)smartSelectionForTextInDocument:(id)a3 inRange:(_NSRange)a4 language:(id)a5 tokenizedRanges:(id)a6 options:(unint64_t)a7 completion:(id)a8
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v22 = (void (**)(id, uint64_t, void))a8;
  id v15 = a6;
  id v16 = a5;
  id v17 = a3;
  os_signpost_id_t v18 = [(TIKeyboardInputManagerWrapper *)self inputManager];
  uint64_t v19 = objc_msgSend(v18, "smartSelectionRangeForTextInDocument:inRange:language:tokenizedRanges:options:", v17, location, length, v16, v15, a7);
  uint64_t v21 = v20;

  v22[2](v22, v19, v21);
}

- (void)adjustPhraseBoundaryInForwardDirection:(BOOL)a3 keyboardState:(id)a4 completionHandler:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  kdebug_trace();
  kac_get_log();
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v11 = (const void *)((unint64_t)self ^ 8);
  os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v10, (const void *)((unint64_t)self ^ 8));
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v13 = v12;
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1E3F0E000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v13, "kbdManager.adjustPhraseBoundary", (const char *)&unk_1E41704BE, buf, 2u);
    }
  }

  [(TIKeyboardInputManagerWrapper *)self adjustPhraseBoundaryInForwardDirection:v6 granularity:0 keyboardState:v8 completionHandler:v9];
  kdebug_trace();
  kac_get_log();
  os_signpost_id_t v14 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v15 = os_signpost_id_make_with_pointer(v14, v11);
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v16 = v15;
    if (os_signpost_enabled(v14))
    {
      *(_WORD *)id v17 = 0;
      _os_signpost_emit_with_name_impl(&dword_1E3F0E000, v14, OS_SIGNPOST_INTERVAL_END, v16, "kbdManager.adjustPhraseBoundary", (const char *)&unk_1E41704BE, v17, 2u);
    }
  }
}

- (void)skipHitTestForTouchEvents:(id)a3 keyboardState:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(TIKeyboardInputManagerWrapper *)self handleKeyboardState:v7];
  id v8 = [(TIKeyboardInputManagerWrapper *)self logger];
  if (v8) {
    id v9 = (void *)[v7 copy];
  }
  else {
    id v9 = 0;
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        os_signpost_id_t v16 = [(TIKeyboardInputManagerWrapper *)self inputManager];
        [v16 skipHitTestForTouchEvent:v15 keyboardState:v7];

        id v17 = [(TIKeyboardInputManagerWrapper *)self logger];
        [v17 logReceivedSkipHitTestForTouchEvent:v15 forKeyboardState:v9];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }
}

- (void)skipHitTestForTouchEvent:(id)a3 keyboardState:(id)a4
{
  id v11 = a4;
  id v6 = a3;
  [(TIKeyboardInputManagerWrapper *)self handleKeyboardState:v11];
  id v7 = [(TIKeyboardInputManagerWrapper *)self logger];
  if (v7) {
    id v8 = (void *)[v11 copy];
  }
  else {
    id v8 = 0;
  }

  id v9 = [(TIKeyboardInputManagerWrapper *)self inputManager];
  [v9 skipHitTestForTouchEvent:v6 keyboardState:v11];

  id v10 = [(TIKeyboardInputManagerWrapper *)self logger];
  [v10 logReceivedSkipHitTestForTouchEvent:v6 forKeyboardState:v8];
}

- (void)performHitTestForTouchEvents:(id)a3 keyboardState:(id)a4 continuation:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t))a5;
  kdebug_trace();
  kac_get_log();
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = (const void *)((unint64_t)self ^ 7);
  os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v11, (const void *)((unint64_t)self ^ 7));
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v14 = v13;
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1E3F0E000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v14, "kbdManager.performHitTest", (const char *)&unk_1E41704BE, buf, 2u);
    }
  }

  [(TIKeyboardInputManagerWrapper *)self handleKeyboardState:v9];
  uint64_t v15 = [(TIKeyboardInputManagerWrapper *)self logger];
  if (v15) {
    os_signpost_id_t v16 = (void *)[v9 copy];
  }
  else {
    os_signpost_id_t v16 = 0;
  }

  if ((unint64_t)[v8 count] >= 2)
  {
    unint64_t v17 = 1;
    do
    {
      long long v18 = [v8 objectAtIndexedSubscript:v17 - 1];
      long long v19 = [(TIKeyboardInputManagerWrapper *)self inputManager];
      [v19 skipHitTestForTouchEvent:v18 keyboardState:v9];

      long long v20 = [(TIKeyboardInputManagerWrapper *)self logger];
      [v20 logReceivedSkipHitTestForTouchEvent:v18 forKeyboardState:v16];

      ++v17;
    }
    while (v17 < [v8 count]);
  }
  long long v21 = [(TIKeyboardInputManagerWrapper *)self inputManager];
  v22 = [v8 lastObject];
  uint64_t v23 = [v21 performHitTestForTouchEvent:v22 keyboardState:v9];

  v10[2](v10, v23);
  os_signpost_id_t v24 = [(TIKeyboardInputManagerWrapper *)self logger];
  os_signpost_id_t v25 = [v8 lastObject];
  [v24 logHitKeyCode:v23 forTouchEvent:v25 keyboardState:v16];

  kdebug_trace();
  kac_get_log();
  v26 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v27 = os_signpost_id_make_with_pointer(v26, v12);
  if (v27 - 1 < 0xFFFFFFFFFFFFFFFELL)
  {
    os_signpost_id_t v28 = v27;
    if (os_signpost_enabled(v26))
    {
      *(_WORD *)v29 = 0;
      _os_signpost_emit_with_name_impl(&dword_1E3F0E000, v26, OS_SIGNPOST_INTERVAL_END, v28, "kbdManager.performHitTest", (const char *)&unk_1E41704BE, v29, 2u);
    }
  }
}

- (void)performHitTestForTouchEvent:(id)a3 keyboardState:(id)a4 continuation:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t))a5;
  kdebug_trace();
  kac_get_log();
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = (const void *)((unint64_t)self ^ 7);
  os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v11, (const void *)((unint64_t)self ^ 7));
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v14 = v13;
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1E3F0E000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v14, "kbdManager.performHitTest", (const char *)&unk_1E41704BE, buf, 2u);
    }
  }

  [(TIKeyboardInputManagerWrapper *)self handleKeyboardState:v9];
  uint64_t v15 = [(TIKeyboardInputManagerWrapper *)self logger];
  if (v15) {
    os_signpost_id_t v16 = (void *)[v9 copy];
  }
  else {
    os_signpost_id_t v16 = 0;
  }

  unint64_t v17 = [(TIKeyboardInputManagerWrapper *)self inputManager];
  uint64_t v18 = [v17 performHitTestForTouchEvent:v8 keyboardState:v9];

  v10[2](v10, v18);
  long long v19 = [(TIKeyboardInputManagerWrapper *)self logger];
  [v19 logHitKeyCode:v18 forTouchEvent:v8 keyboardState:v16];

  kdebug_trace();
  kac_get_log();
  long long v20 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v21 = os_signpost_id_make_with_pointer(v20, v12);
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v22 = v21;
    if (os_signpost_enabled(v20))
    {
      *(_WORD *)uint64_t v23 = 0;
      _os_signpost_emit_with_name_impl(&dword_1E3F0E000, v20, OS_SIGNPOST_INTERVAL_END, v22, "kbdManager.performHitTest", (const char *)&unk_1E41704BE, v23, 2u);
    }
  }
}

- (void)generateRefinementsForCandidate:(id)a3 keyboardState:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  kdebug_trace();
  kac_get_log();
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = (const void *)((unint64_t)self ^ 6);
  os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v11, (const void *)((unint64_t)self ^ 6));
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v14 = v13;
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1E3F0E000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v14, "kbdManager.generateRefinements", (const char *)&unk_1E41704BE, buf, 2u);
    }
  }

  [(TIKeyboardInputManagerWrapper *)self handleKeyboardState:v9];
  uint64_t v15 = [(TIKeyboardInputManagerWrapper *)self logger];
  if (v15) {
    os_signpost_id_t v16 = (void *)[v9 copy];
  }
  else {
    os_signpost_id_t v16 = 0;
  }

  unint64_t v17 = [(TIKeyboardInputManagerWrapper *)self inputManager];
  uint64_t v18 = [v17 generateRefinementsForCandidate:v8];

  v10[2](v10, v18);
  long long v19 = [(TIKeyboardInputManagerWrapper *)self logger];
  [v19 logRefinements:v18 forCandidate:v8 keyboardState:v16];

  kdebug_trace();
  kac_get_log();
  long long v20 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v21 = os_signpost_id_make_with_pointer(v20, v12);
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v22 = v21;
    if (os_signpost_enabled(v20))
    {
      *(_WORD *)uint64_t v23 = 0;
      _os_signpost_emit_with_name_impl(&dword_1E3F0E000, v20, OS_SIGNPOST_INTERVAL_END, v22, "kbdManager.generateRefinements", (const char *)&unk_1E41704BE, v23, 2u);
    }
  }
}

- (void)generateReplacementsForString:(id)a3 keyLayout:(id)a4 continuation:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  kdebug_trace();
  kac_get_log();
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = (const void *)((unint64_t)self ^ 5);
  os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v11, (const void *)((unint64_t)self ^ 5));
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v14 = v13;
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1E3F0E000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v14, "kbdManager.generateReplacements", (const char *)&unk_1E41704BE, buf, 2u);
    }
  }

  uint64_t v15 = [(TIKeyboardInputManagerWrapper *)self inputManager];
  os_signpost_id_t v16 = [v15 generateReplacementsForString:v8 keyLayout:v9];

  v10[2](v10, v16);
  unint64_t v17 = [(TIKeyboardInputManagerWrapper *)self logger];
  [v17 logReplacements:v16 forString:v8 keyLayout:v9];

  kdebug_trace();
  kac_get_log();
  uint64_t v18 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v19 = os_signpost_id_make_with_pointer(v18, v12);
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v20 = v19;
    if (os_signpost_enabled(v18))
    {
      *(_WORD *)os_signpost_id_t v21 = 0;
      _os_signpost_emit_with_name_impl(&dword_1E3F0E000, v18, OS_SIGNPOST_INTERVAL_END, v20, "kbdManager.generateReplacements", (const char *)&unk_1E41704BE, v21, 2u);
    }
  }
}

- (void)changingContextWithTrigger:(id)a3
{
  id v7 = a3;
  id v4 = [(TIKeyboardInputManagerWrapper *)self inputManager];
  int v5 = [v4 isMemberOfClass:objc_opt_class()];

  if (v5)
  {
    [(TIKeyboardInputManagerWrapper *)self setCachedContextChangeTrigger:v7];
  }
  else
  {
    id v6 = [(TIKeyboardInputManagerWrapper *)self inputManager];
    [v6 changingContextWithTrigger:v7];
  }
}

- (void)acceptingCandidateWithTrigger:(id)a3
{
  id v4 = a3;
  id v5 = [(TIKeyboardInputManagerWrapper *)self inputManager];
  [v5 acceptingCandidateWithTrigger:v4];
}

- (void)handleAcceptedCandidate:(id)a3 acceptedSecureCandidate:(id)a4 keyboardState:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  os_signpost_id_t v13 = (void (**)(id, void *, id))a6;
  kdebug_trace();
  kac_get_log();
  os_signpost_id_t v14 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = (const void *)((unint64_t)self ^ 4);
  os_signpost_id_t v16 = os_signpost_id_make_with_pointer(v14, (const void *)((unint64_t)self ^ 4));
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v17 = v16;
    if (os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1E3F0E000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v17, "kbdManager.acceptCandidate", (const char *)&unk_1E41704BE, buf, 2u);
    }
  }

  if (!v10)
  {
    id v19 = v11;
    int v20 = 0;
    goto LABEL_17;
  }
  int v18 = [v10 slotID];
  id v19 = v11;

  int v20 = 0;
  if (v11 == v10 || !v18) {
    goto LABEL_17;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v21 = v19;
    uint64_t v22 = [v21 proactivePredictedItem];
    id v19 = v21;
    if (v22)
    {
      uint64_t v23 = (void *)v22;
      os_signpost_id_t v24 = [v21 proactivePredictedItem];
      if ([v24 itemType] != 1)
      {

        id v19 = v21;
        goto LABEL_14;
      }
      [v21 proactivePredictedItem];
      v26 = id v25 = v11;
      os_signpost_id_t v27 = [v26 operationData];

      id v11 = v25;
      id v19 = v21;
      if (v27)
      {
        id v19 = [v21 candidateByReplacingWithCandidate:&stru_1F3F7A998];
        uint64_t v23 = v21;
LABEL_14:
      }
    }
  }
  int v20 = 1;
LABEL_17:
  [(TIKeyboardInputManagerWrapper *)self handleKeyboardState:v12];
  os_signpost_id_t v28 = [(TIKeyboardInputManagerWrapper *)self logger];
  v42 = v11;
  if (v28) {
    v29 = (void *)[v12 copy];
  }
  else {
    v29 = 0;
  }

  v30 = [(TIKeyboardInputManagerWrapper *)self inputManager];
  v31 = [v30 handleAcceptedCandidate:v19 keyboardState:v12];

  id v32 = objc_alloc_init(MEMORY[0x1E4FAE370]);
  [v32 setTextToCommit:v31];
  if (v20)
  {
    v33 = +[TIAppAutofillManager sharedInstance];
    v34 = [v33 secureCandidateRenderer];

    v35 = objc_msgSend(v34, "cachedPayloadForSecureCandidateSlotID:", objc_msgSend(v19, "slotID"));
    [(TIKeyboardInputManagerWrapper *)self _updateKeyboardOutput:v32 withSecureCandidatePayload:v35 keyboardState:v12];
  }
  v36 = [(TIKeyboardInputManagerWrapper *)self inputManager];
  v37 = [v36 keyboardConfiguration];

  v13[2](v13, v37, v32);
  v38 = [(TIKeyboardInputManagerWrapper *)self logger];
  [v38 logKeyboardConfig:v37 textToCommit:v31 forAcceptedCandidate:v19 keyboardState:v29];

  kdebug_trace();
  kac_get_log();
  v39 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v40 = os_signpost_id_make_with_pointer(v39, v15);
  if (v40 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v41 = v40;
    if (os_signpost_enabled(v39))
    {
      *(_WORD *)v43 = 0;
      _os_signpost_emit_with_name_impl(&dword_1E3F0E000, v39, OS_SIGNPOST_INTERVAL_END, v41, "kbdManager.acceptCandidate", (const char *)&unk_1E41704BE, v43, 2u);
    }
  }
}

- (void)handleAcceptedCandidate:(id)a3 keyboardState:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8 && [v8 slotID])
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __89__TIKeyboardInputManagerWrapper_handleAcceptedCandidate_keyboardState_completionHandler___block_invoke;
    v11[3] = &unk_1E6E298F0;
    v11[4] = self;
    id v12 = v8;
    id v13 = v9;
    id v14 = v10;
    [(TIKeyboardInputManagerWrapper *)self acceptSecureCandidate:v12 keyboardState:v13 completion:v11];
  }
  else
  {
    [(TIKeyboardInputManagerWrapper *)self updateAnalyticsForRejectedSuggestion:v8 keyboardState:v9];
    [(TIKeyboardInputManagerWrapper *)self handleAcceptedCandidate:v8 acceptedSecureCandidate:v8 keyboardState:v9 completionHandler:v10];
  }
}

uint64_t __89__TIKeyboardInputManagerWrapper_handleAcceptedCandidate_keyboardState_completionHandler___block_invoke(void *a1, uint64_t a2)
{
  v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  if (a2)
  {
    uint64_t v6 = a1[7];
    uint64_t v7 = a2;
  }
  else
  {
    [v3 updateAnalyticsForRejectedSuggestion:v4 keyboardState:a1[6]];
    v3 = (void *)a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    uint64_t v6 = a1[7];
    uint64_t v7 = v4;
  }

  return [v3 handleAcceptedCandidate:v4 acceptedSecureCandidate:v7 keyboardState:v5 completionHandler:v6];
}

- (void)generateCandidatesWithKeyboardState:(id)a3 candidateRange:(_NSRange)a4 requestToken:(id)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  kdebug_trace();
  kac_get_log();
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v12, (const void *)((unint64_t)self ^ 3));
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v14 = v13;
    if (os_signpost_enabled(v12))
    {
      LOWORD(buf[0]) = 0;
      _os_signpost_emit_with_name_impl(&dword_1E3F0E000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "kbdManager.generateCandidates", (const char *)&unk_1E41704BE, (uint8_t *)buf, 2u);
    }
  }

  [(TIKeyboardInputManagerWrapper *)self handleKeyboardState:v9];
  uint64_t v15 = [(TIKeyboardInputManagerWrapper *)self logger];
  if (v15) {
    os_signpost_id_t v16 = (void *)[v9 copy];
  }
  else {
    os_signpost_id_t v16 = 0;
  }

  objc_initWeak(buf, self);
  os_signpost_id_t v17 = [TIStreamingCandidateHandler alloc];
  int v18 = [(TIKeyboardInputManagerWrapper *)self clientProxy];
  id v19 = [(TIKeyboardInputManagerWrapper *)self logger];
  inputManager = self->_inputManager;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __115__TIKeyboardInputManagerWrapper_generateCandidatesWithKeyboardState_candidateRange_requestToken_completionHandler___block_invoke;
  v27[3] = &unk_1E6E298C8;
  objc_copyWeak(&v31, buf);
  id v29 = v10;
  id v30 = v11;
  id v28 = v16;
  id v21 = v10;
  id v22 = v16;
  id v23 = v11;
  os_signpost_id_t v24 = [(TIStreamingCandidateHandler *)v17 initWithClientProxy:v18 keyboardState:v22 requestToken:v21 logger:v19 inputManager:inputManager candidateResultSetHandler:v27];

  id v25 = [(TIKeyboardInputManagerWrapper *)self inputManager];
  objc_msgSend(v25, "generateCandidatesWithKeyboardState:candidateRange:candidateHandler:", v9, a4.location, a4.length, v24);

  objc_destroyWeak(&v31);
  objc_destroyWeak(buf);
}

void __115__TIKeyboardInputManagerWrapper_generateCandidatesWithKeyboardState_candidateRange_requestToken_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t WeakRetained = (unint64_t)objc_loadWeakRetained((id *)(a1 + 56));
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  kdebug_trace();
  kac_get_log();
  uint64_t v5 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, (const void *)(WeakRetained ^ 3));
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v7 = v6;
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)id v12 = 0;
      _os_signpost_emit_with_name_impl(&dword_1E3F0E000, v5, OS_SIGNPOST_INTERVAL_END, v7, "kbdManager.generateCandidates", (const char *)&unk_1E41704BE, v12, 2u);
    }
  }

  id v8 = [(id)WeakRetained logger];
  id v9 = [(id)WeakRetained inputManager];
  id v10 = [v9 humanReadableTrace];
  [v8 logCandidateResultSet:v3 trace:v10 forKeyboardState:*(void *)(a1 + 32) requestToken:*(void *)(a1 + 40)];

  id v11 = [(id)WeakRetained inputManager];
  [v11 clearHumanReadableTrace];
}

- (void)generateCandidatesWithKeyboardState:(id)a3 candidateRange:(_NSRange)a4 completionHandler:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  id v10 = a5;
  kdebug_trace();
  kac_get_log();
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v11, (const void *)((unint64_t)self ^ 3));
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v13 = v12;
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1E3F0E000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v13, "kbdManager.generateCandidates", (const char *)&unk_1E41704BE, buf, 2u);
    }
  }

  [(TIKeyboardInputManagerWrapper *)self handleKeyboardState:v9];
  os_signpost_id_t v14 = [(TIKeyboardInputManagerWrapper *)self logger];
  if (v14) {
    uint64_t v15 = (void *)[v9 copy];
  }
  else {
    uint64_t v15 = 0;
  }

  os_signpost_id_t v16 = [TIAccumulatingCandidateHandler alloc];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __102__TIKeyboardInputManagerWrapper_generateCandidatesWithKeyboardState_candidateRange_completionHandler___block_invoke;
  v21[3] = &unk_1E6E298A0;
  id v22 = v15;
  id v23 = v10;
  v21[4] = self;
  id v17 = v15;
  id v18 = v10;
  id v19 = [(TIAccumulatingCandidateHandler *)v16 initWithResultSetHandlerBlock:v21];
  int v20 = [(TIKeyboardInputManagerWrapper *)self inputManager];
  objc_msgSend(v20, "generateCandidatesWithKeyboardState:candidateRange:candidateHandler:", v9, location, length, v19);
}

void __102__TIKeyboardInputManagerWrapper_generateCandidatesWithKeyboardState_candidateRange_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  kdebug_trace();
  kac_get_log();
  uint64_t v4 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v5 = os_signpost_id_make_with_pointer(v4, (const void *)(*(void *)(a1 + 32) ^ 3));
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v6 = v5;
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)id v11 = 0;
      _os_signpost_emit_with_name_impl(&dword_1E3F0E000, v4, OS_SIGNPOST_INTERVAL_END, v6, "kbdManager.generateCandidates", (const char *)&unk_1E41704BE, v11, 2u);
    }
  }

  os_signpost_id_t v7 = [*(id *)(a1 + 32) logger];
  id v8 = [*(id *)(a1 + 32) inputManager];
  id v9 = [v8 humanReadableTrace];
  [v7 logCandidateResultSet:v3 trace:v9 forKeyboardState:*(void *)(a1 + 40) requestToken:0];

  id v10 = [*(id *)(a1 + 32) inputManager];
  [v10 clearHumanReadableTrace];
}

- (id)generateInlineCompletions:(id)a3 withPrefix:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(TIKeyboardInputManagerWrapper *)self inputManager];
  id v9 = [v8 generateInlineCompletions:v7 withPrefix:v6];

  id v10 = [(TIKeyboardInputManagerWrapper *)self inputManager];
  [v10 clearHumanReadableTrace];

  return v9;
}

- (void)generateAutocorrectionsWithKeyboardState:(id)a3 candidateRange:(_NSRange)a4 requestToken:(id)a5 completionHandler:(id)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  kdebug_trace();
  kac_get_log();
  os_signpost_id_t v13 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v14 = os_signpost_id_make_with_pointer(v13, (const void *)((unint64_t)self ^ 1));
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v15 = v14;
    if (os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1E3F0E000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v15, "kbdManager.generateAutocorrections", (const char *)&unk_1E41704BE, buf, 2u);
    }
  }

  [(TIKeyboardInputManagerWrapper *)self handleKeyboardState:v10];
  os_signpost_id_t v16 = [(TIKeyboardInputManagerWrapper *)self logger];
  if (v16) {
    id v17 = (void *)[v10 copy];
  }
  else {
    id v17 = 0;
  }

  id v18 = [TIStreamingCandidateHandler alloc];
  id v19 = [(TIKeyboardInputManagerWrapper *)self clientProxy];
  int v20 = [(TIKeyboardInputManagerWrapper *)self logger];
  inputManager = self->_inputManager;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __120__TIKeyboardInputManagerWrapper_generateAutocorrectionsWithKeyboardState_candidateRange_requestToken_completionHandler___block_invoke;
  v29[3] = &unk_1E6E29878;
  id v32 = v10;
  id v33 = v12;
  v29[4] = self;
  id v30 = v17;
  id v31 = v11;
  id v22 = v10;
  id v23 = v11;
  id v24 = v17;
  id v25 = v12;
  v26 = [(TIStreamingCandidateHandler *)v18 initWithClientProxy:v19 keyboardState:v24 requestToken:v23 logger:v20 inputManager:inputManager candidateHandler:v29];

  os_signpost_id_t v27 = [(TIKeyboardInputManagerWrapper *)self inputManager];
  objc_msgSend(v27, "generateAutocorrectionsWithKeyboardState:candidateRange:candidateHandler:", v22, location, length, v26);
}

void __120__TIKeyboardInputManagerWrapper_generateAutocorrectionsWithKeyboardState_candidateRange_requestToken_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  kdebug_trace();
  kac_get_log();
  uint64_t v4 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v5 = os_signpost_id_make_with_pointer(v4, (const void *)(*(void *)(a1 + 32) ^ 1));
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v6 = v5;
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)id v12 = 0;
      _os_signpost_emit_with_name_impl(&dword_1E3F0E000, v4, OS_SIGNPOST_INTERVAL_END, v6, "kbdManager.generateAutocorrections", (const char *)&unk_1E41704BE, v12, 2u);
    }
  }

  id v7 = [*(id *)(a1 + 32) logger];
  id v8 = [*(id *)(a1 + 32) inputManager];
  id v9 = [v8 humanReadableTrace];
  [v7 logAutocorrections:v3 trace:v9 forKeyboardState:*(void *)(a1 + 40) requestToken:*(void *)(a1 + 48)];

  id v10 = [*(id *)(a1 + 32) inputManager];
  [v10 candidatesOfferedFeedback:v3 keyboardState:*(void *)(a1 + 56)];

  id v11 = [*(id *)(a1 + 32) inputManager];
  [v11 clearHumanReadableTrace];
}

- (void)generateAutocorrectionsWithKeyboardState:(id)a3 candidateRange:(_NSRange)a4 completionHandler:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  id v10 = a5;
  kdebug_trace();
  kac_get_log();
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v11, (const void *)((unint64_t)self ^ 1));
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v13 = v12;
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1E3F0E000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v13, "kbdManager.generateAutocorrections", (const char *)&unk_1E41704BE, buf, 2u);
    }
  }

  [(TIKeyboardInputManagerWrapper *)self handleKeyboardState:v9];
  os_signpost_id_t v14 = [(TIKeyboardInputManagerWrapper *)self logger];
  if (v14) {
    os_signpost_id_t v15 = (void *)[v9 copy];
  }
  else {
    os_signpost_id_t v15 = 0;
  }

  os_signpost_id_t v16 = [TIAccumulatingCandidateHandler alloc];
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  id v24 = __107__TIKeyboardInputManagerWrapper_generateAutocorrectionsWithKeyboardState_candidateRange_completionHandler___block_invoke;
  id v25 = &unk_1E6E29850;
  v26 = self;
  id v27 = v15;
  id v28 = v9;
  id v29 = v10;
  id v17 = v9;
  id v18 = v15;
  id v19 = v10;
  int v20 = [(TIAccumulatingCandidateHandler *)v16 initWithHandlerBlock:&v22];
  id v21 = [(TIKeyboardInputManagerWrapper *)self inputManager];
  objc_msgSend(v21, "generateAutocorrectionsWithKeyboardState:candidateRange:candidateHandler:", v17, location, length, v20);
}

void __107__TIKeyboardInputManagerWrapper_generateAutocorrectionsWithKeyboardState_candidateRange_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  kdebug_trace();
  kac_get_log();
  uint64_t v4 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v5 = os_signpost_id_make_with_pointer(v4, (const void *)(*(void *)(a1 + 32) ^ 1));
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v6 = v5;
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)os_signpost_id_t v12 = 0;
      _os_signpost_emit_with_name_impl(&dword_1E3F0E000, v4, OS_SIGNPOST_INTERVAL_END, v6, "kbdManager.generateAutocorrections", (const char *)&unk_1E41704BE, v12, 2u);
    }
  }

  id v7 = [*(id *)(a1 + 32) logger];
  id v8 = [*(id *)(a1 + 32) inputManager];
  id v9 = [v8 humanReadableTrace];
  [v7 logAutocorrections:v3 trace:v9 forKeyboardState:*(void *)(a1 + 40) requestToken:0];

  id v10 = [*(id *)(a1 + 32) inputManager];
  [v10 candidatesOfferedFeedback:v3 keyboardState:*(void *)(a1 + 48)];

  id v11 = [*(id *)(a1 + 32) inputManager];
  [v11 clearHumanReadableTrace];
}

- (void)generateAutocorrectionsWithKeyboardState:(id)a3 completionHandler:(id)a4
{
}

- (void)handleKeyboardInput:(id)a3 acceptedSecureCandidate:(id)a4 keyboardState:(id)a5 completionHandler:(id)a6
{
  v68[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v66 = (void (**)(id, void *, void *))a6;
  id v13 = [v10 acceptedCandidate];

  if (v13 == v11)
  {
    uint64_t v20 = 0;
  }
  else
  {
    [v10 setAcceptedCandidate:v11];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = v11;
      os_signpost_id_t v15 = [v14 proactivePredictedItem];
      if (v15)
      {
        os_signpost_id_t v16 = [v14 proactivePredictedItem];
        if ([v16 itemType] == 1)
        {
          id v17 = [v14 proactivePredictedItem];
          id v18 = [v17 operationData];
          BOOL v19 = v18 != 0;
        }
        else
        {
          BOOL v19 = 0;
        }
      }
      else
      {
        BOOL v19 = 0;
      }

      int v21 = !v19;
    }
    else
    {
      int v21 = 1;
    }
    uint64_t v22 = [v10 acceptedCandidate];
    uint64_t v23 = [v22 candidate];
    uint64_t v24 = [v23 length];

    if (v24 && v21)
    {
      id v25 = NSString;
      v26 = [v10 acceptedCandidate];
      id v27 = [v26 candidate];
      uint64_t v28 = [v10 string];
      id v29 = (void *)v28;
      id v30 = &stru_1F3F7A998;
      if (v28) {
        id v30 = (__CFString *)v28;
      }
      id v31 = [v25 stringWithFormat:@"%@%@", v27, v30];
      [v10 setString:v31];
    }
    else
    {
      [v10 setString:&stru_1F3F7A998];
    }
    id v32 = [(TIKeyboardInputManagerWrapper *)self inputManager];
    id v33 = [v10 acceptedCandidate];
    v34 = [v33 input];
    uint64_t v35 = [v32 deletionCountForString:v34];

    v36 = [v10 acceptedCandidate];
    uint64_t v37 = [v36 customInfoType];

    if (v37 == 4096) {
      uint64_t v20 = 0;
    }
    else {
      uint64_t v20 = v35;
    }
  }
  [(TIKeyboardInputManagerWrapper *)self handleKeyboardState:v12 withInputEvent:v10];
  v38 = [(TIKeyboardInputManagerWrapper *)self logger];
  if (v38) {
    v39 = (void *)[v12 copy];
  }
  else {
    v39 = 0;
  }

  os_signpost_id_t v40 = [(TIKeyboardInputManagerWrapper *)self inputManager];
  if ([v40 isHardwareKeyboardAutocorrectionEnabled])
  {
    os_signpost_id_t v41 = [v10 touchEvent];

    if (v41) {
      goto LABEL_28;
    }
    os_signpost_id_t v40 = [(TIKeyboardInputManagerWrapper *)self inputManager];
    [v40 addSynthesizedTouchToInput:v10 keyboardState:v12];
  }

LABEL_28:
  v42 = [v10 touchEvent];

  if (v42)
  {
    v43 = [(TIKeyboardInputManagerWrapper *)self inputManager];
    v44 = [v10 touchEvent];
    [v43 skipHitTestForTouchEvent:v44 keyboardState:v12];
  }
  v45 = [v10 acceptedCandidate];

  if (v45)
  {
    v46 = [(TIKeyboardInputManagerWrapper *)self inputManager];
    v47 = [v10 acceptedCandidate];
    objc_msgSend(v46, "textAccepted:fromPredictiveInputBar:withInput:", v47, objc_msgSend(v10, "isSynthesizedByAcceptingCandidate"), v10);
  }
  v48 = [(TIKeyboardInputManagerWrapper *)self inputManager];
  [v48 syncToKeyboardState:v12];

  v49 = [(TIKeyboardInputManagerWrapper *)self inputManager];
  v50 = [v49 handleKeyboardInput:v10];

  if (![v12 secureTextEntry]
    || ([v12 textInputTraits],
        v51 = objc_claimAutoreleasedReturnValue(),
        uint64_t v52 = [v51 keyboardAppearance],
        v51,
        v52 != 5))
  {
    v53 = +[TIAppAutofillManager sharedInstance];
    v54 = [v53 secureCandidateRenderer];

    if (v13 == v11)
    {
LABEL_42:
      if ([v12 needAutofill])
      {
        v58 = +[TIAppAutofillManager sharedInstance];
        v59 = [v58 secureCandidateRenderer];
        [v59 clearSecureCandidateCache];
      }
      else
      {
        [v54 clearSecureCandidateCache];
      }

      goto LABEL_46;
    }
    [v50 setDeletionCount:v20];
    if ([v11 customInfoType] == 1024)
    {
      v67 = @"AutofillSuggestedUsername";
      v55 = [v11 candidate];
      v68[0] = v55;
      uint64_t v56 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v68 forKeys:&v67 count:1];
    }
    else
    {
      if (([v11 customInfoType] & 0x800) != 0)
      {
        v57 = 0;
        goto LABEL_41;
      }
      v55 = [v10 acceptedCandidate];
      uint64_t v56 = objc_msgSend(v54, "cachedPayloadForSecureCandidateSlotID:", objc_msgSend(v55, "slotID"));
    }
    v57 = (void *)v56;

LABEL_41:
    [(TIKeyboardInputManagerWrapper *)self _updateKeyboardOutput:v50 withSecureCandidatePayload:v57 keyboardState:v12];

    goto LABEL_42;
  }
LABEL_46:
  v60 = [(TIKeyboardInputManagerWrapper *)self inputManager];
  v61 = [v60 keyboardConfiguration];

  v66[2](v66, v50, v61);
  v62 = [(TIKeyboardInputManagerWrapper *)self logger];
  v63 = [(TIKeyboardInputManagerWrapper *)self inputManager];
  v64 = [v63 humanReadableTrace];
  [v62 logKeyboardOutput:v50 keyboardConfiguration:v61 trace:v64 forKeyboardInput:v10 keyboardState:v39];

  v65 = [(TIKeyboardInputManagerWrapper *)self inputManager];
  [v65 clearHumanReadableTrace];
}

- (void)handleKeyboardInput:(id)a3 keyboardState:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 acceptedCandidate];
  id v12 = v11;
  if (v11 && [v11 slotID])
  {
    id v13 = [v8 acceptedCandidate];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __85__TIKeyboardInputManagerWrapper_handleKeyboardInput_keyboardState_completionHandler___block_invoke;
    v14[3] = &unk_1E6E29828;
    v14[4] = self;
    id v15 = v8;
    id v16 = v9;
    id v18 = v10;
    id v17 = v12;
    [(TIKeyboardInputManagerWrapper *)self acceptSecureCandidate:v13 keyboardState:v16 completion:v14];
  }
  else
  {
    [(TIKeyboardInputManagerWrapper *)self updateAnalyticsForRejectedSuggestion:v12 keyboardState:v9];
    [(TIKeyboardInputManagerWrapper *)self handleKeyboardInput:v8 acceptedSecureCandidate:v12 keyboardState:v9 completionHandler:v10];
  }
}

uint64_t __85__TIKeyboardInputManagerWrapper_handleKeyboardInput_keyboardState_completionHandler___block_invoke(void *a1, uint64_t a2)
{
  id v3 = (void *)a1[4];
  uint64_t v4 = a1[6];
  if (a2)
  {
    uint64_t v5 = a1[5];
    uint64_t v6 = a1[8];
    uint64_t v7 = a2;
  }
  else
  {
    [v3 updateAnalyticsForRejectedSuggestion:a1[7] keyboardState:a1[6]];
    id v3 = (void *)a1[4];
    uint64_t v5 = a1[5];
    uint64_t v4 = a1[6];
    uint64_t v7 = a1[7];
    uint64_t v6 = a1[8];
  }

  return [v3 handleKeyboardInput:v5 acceptedSecureCandidate:v7 keyboardState:v4 completionHandler:v6];
}

- (void)_updateKeyboardOutput:(id)a3 withSecureCandidatePayload:(id)a4 keyboardState:(id)a5
{
  id v50 = a3;
  id v7 = a4;
  id v8 = a5;
  if (v50 && v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = (id)[v7 mutableCopy];
      [v50 setCustomInfo:v9];
LABEL_5:

      goto LABEL_16;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = [v7 stickerIdentifier];

      if (v10)
      {
        [v50 setAcceptedCandidate:v7];
        [v50 setTextToCommit:&stru_1F3F7A998];
        goto LABEL_16;
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v7;
      uint64_t v11 = [v9 proactivePredictedItem];
      if (!v11) {
        goto LABEL_29;
      }
      id v12 = (void *)v11;
      id v13 = [v9 proactivePredictedItem];
      if ([v13 itemType] == 1)
      {
        id v14 = [v9 proactivePredictedItem];
        id v15 = [v14 operationData];

        if (!v15) {
          goto LABEL_29;
        }
        id v16 = [v9 proactivePredictedItem];
        id v17 = [v16 operationData];
        id v18 = [v17 objectForKey:@"bundleID"];
        int v19 = [v18 isEqualToString:@"com.apple.messages.currentLocation"];

        if (v19)
        {
          id v12 = [MEMORY[0x1E4F1CA60] dictionary];
          [v12 setObject:@"com.apple.messages.currentLocation" forKey:*MEMORY[0x1E4FAE8D8]];
          uint64_t v20 = [v9 proactivePredictedItem];
          int v21 = [v20 identifier];
          int v22 = [v21 isEqualToString:@"currentLocation"];

          if (v22)
          {
            [v50 setShouldSendCurrentLocation:1];
            uint64_t v23 = (void *)MEMORY[0x1E4FAE920];
          }
          else
          {
            id v31 = [v9 proactivePredictedItem];
            id v32 = [v31 identifier];
            int v33 = [v32 isEqualToString:@"requestLocation"];

            if (!v33)
            {
LABEL_25:
              [v50 setCustomInfo:v12];
LABEL_28:

LABEL_29:
              v36 = +[TIProactiveQuickTypeManager sharedInstance];
              int v37 = [v36 usePQT2Flow];

              uint64_t v38 = [v9 proactivePredictedItem];
              v39 = (void *)v38;
              if (v37)
              {
                if (!v38) {
                  goto LABEL_5;
                }
                os_signpost_id_t v40 = [v9 proactivePredictedItem];
                if (![v40 itemType])
                {
                  int v41 = [v8 needContactAutofill];

                  if (!v41) {
                    goto LABEL_5;
                  }
                  v39 = [v8 documentState];
                  os_signpost_id_t v40 = [v39 contextBeforeInput];
                  objc_msgSend(v50, "setDeletionCount:", objc_msgSend(v40, "length"));
                }
              }
              else
              {
                if (!v38) {
                  goto LABEL_5;
                }
                os_signpost_id_t v40 = [v9 proactivePredictedItem];
                if (![v40 itemType])
                {
                  v42 = [v9 proactivePredictedItem];
                  uint64_t v43 = [v42 trigger];
                  if (v43)
                  {
                    v44 = (void *)v43;
                    v49 = [v9 proactivePredictedItem];
                    v45 = [v49 trigger];
                    v46 = [v45 attributedString];
                    v47 = [v46 objectForKey:@"contextBeforeInput"];

                    if (!v47) {
                      goto LABEL_5;
                    }
                    v39 = [v9 proactivePredictedItem];
                    os_signpost_id_t v40 = [v39 trigger];
                    v42 = [v40 attributedString];
                    v48 = [v42 objectForKey:@"contextBeforeInput"];
                    objc_msgSend(v50, "setDeletionCount:", objc_msgSend(v48, "length"));
                  }
                }
              }

              goto LABEL_5;
            }
            uint64_t v23 = (void *)MEMORY[0x1E4FAE928];
          }
          v34 = [NSNumber numberWithBool:1];
          [v12 setObject:v34 forKey:*v23];

          goto LABEL_25;
        }
        uint64_t v24 = [v9 proactivePredictedItem];
        id v25 = [v24 operationData];
        v26 = [v25 objectForKey:@"bundleID"];
        int v27 = [v26 isEqualToString:@"com.apple.SafetyMonitorApp.SafetyMonitorMessages"];

        uint64_t v28 = [v9 proactivePredictedItem];
        id v12 = v28;
        if (v27)
        {
          id v29 = [v28 identifier];
          int v30 = [v29 isEqualToString:@"start check-in"];

          if (!v30) {
            goto LABEL_29;
          }
          id v12 = [MEMORY[0x1E4F1CA60] dictionary];
          [v12 setObject:@"com.apple.SafetyMonitorApp.SafetyMonitorMessages" forKey:*MEMORY[0x1E4FAE8D8]];
          goto LABEL_25;
        }
        id v13 = [v28 operationData];
        uint64_t v35 = (void *)[v13 mutableCopy];
        [v50 setCustomInfo:v35];
      }
      goto LABEL_28;
    }
  }
LABEL_16:
}

- (void)updateAnalyticsForRejectedSuggestion:(id)a3 keyboardState:(id)a4
{
  id v14 = a3;
  id v5 = a4;
  uint64_t v6 = +[TIAppAutofillManager sharedInstance];
  id v7 = [v6 secureCandidateRenderer];

  if (v14)
  {
    BOOL v8 = [v14 slotID] != 0;
    if (!v7) {
      goto LABEL_15;
    }
  }
  else
  {
    BOOL v8 = 0;
    if (!v7) {
      goto LABEL_15;
    }
  }
  id v9 = [v7 secureCandidateCache];
  if ([v9 count]) {
    char v10 = v8;
  }
  else {
    char v10 = 1;
  }
  if ((v10 & 1) == 0)
  {
    if ([v5 needAutofill])
    {
      uint64_t v11 = [v5 autofillMode];

      if (v11) {
        goto LABEL_15;
      }
    }
    else
    {
    }
    id v9 = +[TIProactiveQuickTypeManager sharedInstance];
    id v12 = [v7 secureCandidateCache];
    id v13 = [v12 allValues];
    [v9 suggestionNotAccepted:v13];
  }
LABEL_15:
}

- (void)acceptSecureCandidate:(id)a3 keyboardState:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = +[TIAppAutofillManager sharedInstance];
  id v12 = [v11 secureCandidateRenderer];

  if (!v8)
  {
    id v17 = 0;
    goto LABEL_34;
  }
  int v13 = [v8 slotID];
  id v14 = v8;
  id v15 = v14;
  if (v12) {
    BOOL v16 = v13 == 0;
  }
  else {
    BOOL v16 = 1;
  }
  if (v16)
  {
    id v17 = v14;
    goto LABEL_34;
  }
  id v18 = +[TIKeyboardSecureTouchManager sharedInstance];
  int v19 = [v9 eventAuthenticationMessage];
  [v18 touchEventWithAuthenticationMessage:v19];

  uint64_t v20 = +[TIKeyboardSecureTouchManager sharedInstance];
  int v21 = objc_msgSend(v20, "verifySlotID:", objc_msgSend(v15, "slotID"));

  if (v21) {
    [v12 cachedCandidateForSecureCandidate:v15];
  }
  else {
  id v17 = [MEMORY[0x1E4FAE318] candidateWithUnchangedInput:&stru_1F3F7A998];
  }

  v71 = [v17 candidate];
  if (![v71 length])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v22 = [v17 proactivePredictedItem];
      uint64_t v23 = [v22 value];

      v71 = (void *)v23;
    }
  }
  id v69 = v10;
  v70 = v9;
  v68 = v12;
  if ([v17 indexForMetrics])
  {
    if ([v17 indexForMetrics] != 1) {
      goto LABEL_20;
    }
    uint64_t v24 = [(TIKeyboardInputManagerBase *)self->_inputManager inputMode];
    id v25 = [v24 languageWithRegion];
    uint64_t v26 = [v17 proactiveTrigger];
    int v27 = v9;
    uint64_t v28 = (void *)v26;
    id v29 = [v27 textInputTraits];
    int v30 = [v29 textContentType];
    TIStatisticsLogProactiveSelectedSecond(v25, v28, v30, v71);
  }
  else
  {
    uint64_t v24 = [(TIKeyboardInputManagerBase *)self->_inputManager inputMode];
    id v25 = [v24 languageWithRegion];
    uint64_t v31 = [v17 proactiveTrigger];
    id v32 = v9;
    uint64_t v28 = (void *)v31;
    id v29 = [v32 textInputTraits];
    int v30 = [v29 textContentType];
    TIStatisticsLogProactiveSelectedFirst(v25, v28, v30, v71);
  }

  id v9 = v70;
LABEL_20:
  int v33 = +[TIProactiveQuickTypeManager sharedInstance];
  v34 = [(TIKeyboardInputManagerBase *)self->_inputManager inputMode];
  uint64_t v35 = [v34 languageWithRegion];
  v36 = [v9 textInputTraits];
  int v37 = [v36 textContentType];
  [v33 suggestionAccepted:v35 fieldType:v37];

  uint64_t v38 = [v17 proactiveTrigger];
  v39 = [v38 attributes];
  os_signpost_id_t v40 = [v39 objectForKeyedSubscript:@"subtype"];

  if ([v38 triggerSourceType] == 2
    || ([v40 isEqual:@"recent location"] & 1) != 0
    || [v40 isEqual:@"recent phone"])
  {
    if ([v38 triggerSourceType]) {
      BOOL v41 = [v38 triggerSourceType] == 1;
    }
    else {
      BOOL v41 = 1;
    }
    BOOL v64 = v41;
    objc_opt_class();
    v66 = v40;
    if (objc_opt_isKindOfClass()) {
      id v42 = v17;
    }
    else {
      id v42 = 0;
    }
    uint64_t v43 = [v17 proactiveTrigger];
    v44 = [v43 attributes];
    v45 = [v44 objectForKeyedSubscript:@"field"];
    v46 = v45;
    v67 = v38;
    v65 = v17;
    if (v45)
    {
      id v47 = v45;
    }
    else
    {
      v48 = [v17 proactiveTrigger];
      v49 = [v48 attributes];
      id v47 = [v49 objectForKeyedSubscript:@"type"];
    }
    id v50 = [v42 fromBundleId];
    id v9 = v70;
    v51 = [v70 clientIdentifier];
    uint64_t v52 = +[TIConnectionsMetricsTracker sharedInstance];
    uint64_t v53 = [v42 ageForConnectionsMetrics];
    v54 = [v70 textInputTraits];
    [v54 textContentType];
    uint64_t v56 = v55 = v42;
    BYTE1(v63) = !v64;
    LOBYTE(v63) = v64;
    objc_msgSend(v52, "trackPredictionEngagmentWithConversion:age:fieldType:resultType:fromBundleId:targetApp:linguistic:semantic:", 1, v53, v56, v47, v50, v51, v63);

    os_signpost_id_t v40 = v66;
    uint64_t v38 = v67;
    id v17 = v65;
  }

  id v12 = v68;
  id v10 = v69;
LABEL_34:
  if ([v8 customInfoType] == 64 || objc_msgSend(v8, "customInfoType") == 512)
  {
    v57 = +[TIAppAutofillManager sharedInstance];
    v76[0] = MEMORY[0x1E4F143A8];
    v76[1] = 3221225472;
    v76[2] = __80__TIKeyboardInputManagerWrapper_acceptSecureCandidate_keyboardState_completion___block_invoke;
    v76[3] = &unk_1E6E29800;
    id v79 = v10;
    id v77 = v17;
    id v78 = v8;
    [v57 shouldAcceptOneTimeCode:v78 completion:v76];
  }
  else if ([v8 customInfoType] == 1024)
  {
    v58 = +[TIAppAutofillManager sharedInstance];
    [v58 presentHideMyEmailUI:v8 keyboardState:v9 completion:v10];
  }
  else
  {
    if ([v9 needAutofill])
    {
      v59 = +[TIAppAutofillManager sharedInstance];
      v60 = [v59 secureCandidateRenderer];
      v61 = objc_msgSend(v60, "cachedPayloadForSecureCandidateSlotID:", objc_msgSend(v8, "slotID"));
    }
    else
    {
      v61 = objc_msgSend(v12, "cachedPayloadForSecureCandidateSlotID:", objc_msgSend(v8, "slotID"));
    }
    v62 = +[TIAppAutofillManager sharedInstance];
    v72[0] = MEMORY[0x1E4F143A8];
    v72[1] = 3221225472;
    v72[2] = __80__TIKeyboardInputManagerWrapper_acceptSecureCandidate_keyboardState_completion___block_invoke_2;
    v72[3] = &unk_1E6E29800;
    id v75 = v10;
    id v73 = v17;
    id v74 = v8;
    [v62 shouldAcceptAutofill:v74 withPayload:v61 completion:v72];
  }
}

uint64_t __80__TIKeyboardInputManagerWrapper_acceptSecureCandidate_keyboardState_completion___block_invoke(uint64_t a1, int a2)
{
  uint64_t v2 = 40;
  if (a2) {
    uint64_t v2 = 32;
  }
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + v2));
}

uint64_t __80__TIKeyboardInputManagerWrapper_acceptSecureCandidate_keyboardState_completion___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v2 = 40;
  if (a2) {
    uint64_t v2 = 32;
  }
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + v2));
}

- (void)syncToKeyboardState:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  kdebug_trace();
  kac_get_log();
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v8, self);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v10 = v9;
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1E3F0E000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v10, "kbdManager.syncState", (const char *)&unk_1E41704BE, buf, 2u);
    }
  }

  [(TIKeyboardInputManagerWrapper *)self handleKeyboardState:v6];
  uint64_t v11 = [(TIKeyboardInputManagerWrapper *)self logger];
  if (v11) {
    id v12 = (void *)[v6 copy];
  }
  else {
    id v12 = 0;
  }

  int v13 = [(TIKeyboardInputManagerWrapper *)self inputManager];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __71__TIKeyboardInputManagerWrapper_syncToKeyboardState_completionHandler___block_invoke;
  v24[3] = &unk_1E6E297D8;
  id v14 = v7;
  id v26 = v14;
  v24[4] = self;
  id v15 = v12;
  id v25 = v15;
  char v16 = [v13 syncToKeyboardState:v6 completionHandler:v24];

  if ((v16 & 1) == 0)
  {
    id v17 = [(TIKeyboardInputManagerWrapper *)self inputManager];
    [v17 syncToKeyboardState:v6];

    id v18 = [(TIKeyboardInputManagerWrapper *)self inputManager];
    int v19 = [v18 keyboardConfiguration];

    (*((void (**)(id, void *))v14 + 2))(v14, v19);
    uint64_t v20 = [(TIKeyboardInputManagerWrapper *)self logger];
    [v20 logKeyboardConfig:v19 forSyncToKeyboardState:v15];

    kdebug_trace();
    kac_get_log();
    int v21 = (id)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v22 = os_signpost_id_make_with_pointer(v21, self);
    if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v23 = v22;
      if (os_signpost_enabled(v21))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1E3F0E000, v21, OS_SIGNPOST_INTERVAL_END, v23, "kbdManager.syncState", (const char *)&unk_1E41704BE, buf, 2u);
      }
    }
  }
}

void __71__TIKeyboardInputManagerWrapper_syncToKeyboardState_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void (**)(uint64_t, id))(v3 + 16);
  id v5 = a2;
  v4(v3, v5);
  id v6 = [*(id *)(a1 + 32) logger];
  [v6 logKeyboardConfig:v5 forSyncToKeyboardState:*(void *)(a1 + 40)];

  kdebug_trace();
  kac_get_log();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v7, *(const void **)(a1 + 32));
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v9 = v8;
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)os_signpost_id_t v10 = 0;
      _os_signpost_emit_with_name_impl(&dword_1E3F0E000, v7, OS_SIGNPOST_INTERVAL_END, v9, "kbdManager.syncState", (const char *)&unk_1E41704BE, v10, 2u);
    }
  }
}

- (void)handleKeyboardState:(id)a3 withInputEvent:(id)a4
{
  id v4 = a3;
  uint64_t v5 = [v4 canSuggestSupplementalItemsForCurrentSelection];
  id v6 = +[TITransientLexiconManager sharedInstance];
  [v6 setSupplementalLexiconSearchEnabled:v5];

  id v9 = +[TITransientLexiconManager sharedInstance];
  id v7 = [v9 supplementalLexicons];
  uint64_t v8 = [v4 supplementalLexiconIdentifier];

  [v7 setActiveLexiconWithIdentifier:v8];
}

- (void)handleKeyboardState:(id)a3
{
}

- (void)setLogger:(id)a3
{
  id v4 = a3;
  id v5 = [(TIKeyboardInputManagerWrapper *)self inputManager];
  [v5 setInputManagerLogger:v4];
}

- (TIKeyboardInputManagerLogging)logger
{
  uint64_t v2 = [(TIKeyboardInputManagerWrapper *)self inputManager];
  uint64_t v3 = [v2 inputManagerLogger];

  return (TIKeyboardInputManagerLogging *)v3;
}

- (TIKeyboardInputManagerWrapper)init
{
  v6.receiver = self;
  v6.super_class = (Class)TIKeyboardInputManagerWrapper;
  uint64_t v2 = [(TIKeyboardInputManagerWrapper *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [[TIKeyboardInputManagerBase alloc] initWithInputMode:0 keyboardState:0];
    inputManager = v2->_inputManager;
    v2->_inputManager = v3;
  }
  return v2;
}

@end