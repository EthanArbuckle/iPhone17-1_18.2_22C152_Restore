@interface _LTCombinedEngine
- (BOOL)translatesPair:(id)a3;
- (_LTCombinedEngine)init;
- (_LTSpeechTranslationResultsBuffer)offlineDelegateBuffer;
- (_LTTranslationEngine)offlineEngine;
- (_LTTranslationEngine)onlineEngine;
- (void)addSpeechAudioData:(id)a3;
- (void)cancelSpeechTranslation:(BOOL)a3;
- (void)endAudio;
- (void)endpoint;
- (void)hybridEndpointerFoundEndpoint;
- (void)preheatAsynchronously:(BOOL)a3 withContext:(id)a4;
- (void)serverEndpointerFeatures:(id)a3 locale:(id)a4;
- (void)setLanguagesRecognized:(id)a3 context:(id)a4;
- (void)setOfflineDelegateBuffer:(id)a3;
- (void)setOfflineEngine:(id)a3;
- (void)setOnlineEngine:(id)a3;
- (void)speak:(id)a3 withContext:(id)a4 completion:(id)a5;
- (void)speechRecognitionResult:(id)a3;
- (void)startSpeechTranslationWithContext:(id)a3 delegate:(id)a4;
- (void)startTextToSpeechTranslationWithContext:(id)a3 text:(id)a4 delegate:(id)a5;
- (void)translate:(id)a3 withContext:(id)a4 paragraphResult:(id)a5 completion:(id)a6;
- (void)translateSentence:(id)a3 withContext:(id)a4 completion:(id)a5;
- (void)translationDidFinishWithError:(id)a3;
- (void)translatorDidTranslate:(id)a3;
@end

@implementation _LTCombinedEngine

- (_LTCombinedEngine)init
{
  v6.receiver = self;
  v6.super_class = (Class)_LTCombinedEngine;
  v2 = [(_LTCombinedEngine *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_translationEnded = 0;
    v4 = v2;
  }

  return v3;
}

- (BOOL)translatesPair:(id)a3
{
  id v4 = a3;
  v5 = [(_LTCombinedEngine *)self offlineEngine];
  if ([v5 translatesPair:v4])
  {
    char v6 = 1;
  }
  else
  {
    v7 = [(_LTCombinedEngine *)self onlineEngine];
    char v6 = [v7 translatesPair:v4];
  }
  return v6;
}

- (void)preheatAsynchronously:(BOOL)a3 withContext:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = [(_LTCombinedEngine *)self offlineEngine];
  [v7 preheatAsynchronously:v4 withContext:v6];

  id v8 = [(_LTCombinedEngine *)self onlineEngine];
  [v8 preheatAsynchronously:v4 withContext:v6];
}

- (void)addSpeechAudioData:(id)a3
{
  id v4 = a3;
  v5 = [(_LTCombinedEngine *)self offlineEngine];
  [v5 addSpeechAudioData:v4];

  id v6 = [(_LTCombinedEngine *)self onlineEngine];
  [v6 addSpeechAudioData:v4];
}

- (void)endAudio
{
  v3 = [(_LTCombinedEngine *)self offlineEngine];
  [v3 endAudio];

  id v4 = [(_LTCombinedEngine *)self onlineEngine];
  [v4 endAudio];
}

- (void)setLanguagesRecognized:(id)a3 context:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  v7 = [(_LTCombinedEngine *)self offlineEngine];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    v9 = [(_LTCombinedEngine *)self offlineEngine];
    [v9 setLanguagesRecognized:v13 context:v6];
  }
  v10 = [(_LTCombinedEngine *)self onlineEngine];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    v12 = [(_LTCombinedEngine *)self onlineEngine];
    [v12 setLanguagesRecognized:v13 context:v6];
  }
}

- (void)startTextToSpeechTranslationWithContext:(id)a3 text:(id)a4 delegate:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  char v11 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[_LTCombinedEngine startTextToSpeechTranslationWithContext:text:delegate:](v11);
  }
  objc_storeWeak((id *)&self->_delegate, v8);
  self->_onlineTranslationStarted = 0;
  v12 = objc_alloc_init(_LTSpeechTranslationResultsBuffer);
  offlineDelegateBuffer = self->_offlineDelegateBuffer;
  self->_offlineDelegateBuffer = v12;

  [(_LTSpeechTranslationResultsBuffer *)self->_offlineDelegateBuffer setDelegate:v8];
  v14 = [(_LTCombinedEngine *)self onlineEngine];
  [v14 startTextToSpeechTranslationWithContext:v10 text:v9 delegate:self];

  v15 = [(_LTCombinedEngine *)self offlineEngine];
  [v15 startTextToSpeechTranslationWithContext:v10 text:v9 delegate:self->_offlineDelegateBuffer];
}

- (void)startSpeechTranslationWithContext:(id)a3 delegate:(id)a4
{
  p_delegate = &self->_delegate;
  id v7 = a4;
  id v8 = a3;
  objc_storeWeak((id *)p_delegate, v7);
  self->_onlineTranslationStarted = 0;
  id v9 = objc_alloc_init(_LTSpeechTranslationResultsBuffer);
  offlineDelegateBuffer = self->_offlineDelegateBuffer;
  self->_offlineDelegateBuffer = v9;

  [(_LTSpeechTranslationResultsBuffer *)self->_offlineDelegateBuffer setDelegate:v7];
  char v11 = [(_LTCombinedEngine *)self onlineEngine];
  [v11 startSpeechTranslationWithContext:v8 delegate:self];

  id v12 = [(_LTCombinedEngine *)self offlineEngine];
  [v12 startSpeechTranslationWithContext:v8 delegate:self->_offlineDelegateBuffer];
}

- (void)cancelSpeechTranslation:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(_LTCombinedEngine *)self onlineEngine];
  [v5 cancelSpeechTranslation:v3];

  id v6 = [(_LTCombinedEngine *)self offlineEngine];
  [v6 cancelSpeechTranslation:v3];
}

- (void)speak:(id)a3 withContext:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  onlineEngine = self->_onlineEngine;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __50___LTCombinedEngine_speak_withContext_completion___block_invoke;
  v15[3] = &unk_265545F88;
  objc_copyWeak(&v19, &location);
  id v12 = v8;
  id v16 = v12;
  id v13 = v9;
  id v17 = v13;
  id v14 = v10;
  id v18 = v14;
  [(_LTTranslationEngine *)onlineEngine speak:v12 withContext:v13 completion:v15];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (void)translate:(id)a3 withContext:(id)a4 paragraphResult:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v33 = a4;
  id v11 = a5;
  id v32 = a6;
  id v12 = [v10 _ltCompactMap:&__block_literal_global_0];
  id v13 = (void *)[v12 mutableCopy];

  id v14 = [MEMORY[0x263EFF9A0] dictionary];
  v62[0] = 0;
  v62[1] = v62;
  v62[2] = 0x2020000000;
  char v63 = 0;
  v60[0] = 0;
  v60[1] = v60;
  v60[2] = 0x3032000000;
  v60[3] = __Block_byref_object_copy__1;
  v60[4] = __Block_byref_object_dispose__1;
  id v61 = 0;
  v58[0] = 0;
  v58[1] = v58;
  v58[2] = 0x3032000000;
  v58[3] = __Block_byref_object_copy__1;
  v58[4] = __Block_byref_object_dispose__1;
  id v59 = 0;
  v15 = dispatch_group_create();
  dispatch_queue_t v16 = dispatch_queue_create("com.apple.translation.combined", 0);
  dispatch_group_enter(v15);
  id v17 = [(_LTCombinedEngine *)self offlineEngine];
  v52[0] = MEMORY[0x263EF8330];
  v52[1] = 3221225472;
  v52[2] = __70___LTCombinedEngine_translate_withContext_paragraphResult_completion___block_invoke_6;
  v52[3] = &unk_265545FF8;
  id v18 = v16;
  v53 = v18;
  v57 = v60;
  id v19 = v13;
  id v54 = v19;
  id v20 = v11;
  id v56 = v20;
  id v21 = v14;
  id v55 = v21;
  v49[0] = MEMORY[0x263EF8330];
  v49[1] = 3221225472;
  v49[2] = __70___LTCombinedEngine_translate_withContext_paragraphResult_completion___block_invoke_3;
  v49[3] = &unk_265546020;
  v51 = v58;
  v22 = v15;
  v50 = v22;
  [v17 translate:v10 withContext:v33 paragraphResult:v52 completion:v49];

  dispatch_group_enter(v22);
  v23 = [(_LTCombinedEngine *)self onlineEngine];
  v45[0] = MEMORY[0x263EF8330];
  v45[1] = 3221225472;
  v45[2] = __70___LTCombinedEngine_translate_withContext_paragraphResult_completion___block_invoke_4;
  v45[3] = &unk_265546070;
  v24 = v18;
  v46 = v24;
  id v25 = v19;
  id v47 = v25;
  id v26 = v20;
  id v48 = v26;
  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  v42[2] = __70___LTCombinedEngine_translate_withContext_paragraphResult_completion___block_invoke_6;
  v42[3] = &unk_265546020;
  v44 = v60;
  v27 = v22;
  v43 = v27;
  [v23 translate:v10 withContext:v33 paragraphResult:v45 completion:v42];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70___LTCombinedEngine_translate_withContext_paragraphResult_completion___block_invoke_7;
  block[3] = &unk_265546098;
  v39 = v62;
  v40 = v58;
  v41 = v60;
  id v35 = v25;
  id v36 = v21;
  id v37 = v32;
  id v38 = v26;
  id v28 = v26;
  id v29 = v21;
  id v30 = v25;
  id v31 = v32;
  dispatch_group_notify(v27, v24, block);

  _Block_object_dispose(v58, 8);
  _Block_object_dispose(v60, 8);

  _Block_object_dispose(v62, 8);
}

- (void)translateSentence:(id)a3 withContext:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x2020000000;
  char v39 = 0;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = __Block_byref_object_copy__1;
  v36[4] = __Block_byref_object_dispose__1;
  id v37 = 0;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__1;
  v34[4] = __Block_byref_object_dispose__1;
  id v35 = 0;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__1;
  v32[4] = __Block_byref_object_dispose__1;
  id v33 = 0;
  id v11 = dispatch_group_create();
  id v12 = dispatch_queue_create("com.apple.translation.combined", 0);
  dispatch_group_enter(v11);
  id v13 = [(_LTCombinedEngine *)self offlineEngine];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __62___LTCombinedEngine_translateSentence_withContext_completion___block_invoke;
  v28[3] = &unk_2655460C0;
  id v30 = v36;
  id v31 = v34;
  id v14 = v11;
  id v29 = v14;
  [v13 translateSentence:v8 withContext:v9 completion:v28];

  dispatch_group_enter(v14);
  v15 = [(_LTCombinedEngine *)self onlineEngine];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __62___LTCombinedEngine_translateSentence_withContext_completion___block_invoke_2;
  v24[3] = &unk_2655460E8;
  v27 = v38;
  id v16 = v10;
  id v26 = v16;
  id v17 = v14;
  id v25 = v17;
  [v15 translateSentence:v8 withContext:v9 completion:v24];

  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __62___LTCombinedEngine_translateSentence_withContext_completion___block_invoke_3;
  v19[3] = &unk_265546110;
  id v20 = v16;
  id v21 = v38;
  v22 = v34;
  v23 = v32;
  id v18 = v16;
  dispatch_group_notify(v17, v12, v19);

  _Block_object_dispose(v32, 8);
  _Block_object_dispose(v34, 8);

  _Block_object_dispose(v36, 8);
  _Block_object_dispose(v38, 8);
}

- (void)endpoint
{
  [(_LTTranslationEngine *)self->_onlineEngine endpoint];
  offlineEngine = self->_offlineEngine;
  [(_LTTranslationEngine *)offlineEngine endpoint];
}

- (void)hybridEndpointerFoundEndpoint
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2600DC000, log, OS_LOG_TYPE_DEBUG, "HEP triggered", v1, 2u);
}

- (void)serverEndpointerFeatures:(id)a3 locale:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = objc_loadWeakRetained((id *)p_delegate);
    [v10 serverEndpointerFeatures:v11 locale:v6];
  }
}

- (void)speechRecognitionResult:(id)a3
{
  id v8 = a3;
  self->_onlineTranslationStarted = 1;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 speechRecognitionResult:v8];
  }
}

- (void)translatorDidTranslate:(id)a3
{
  id v8 = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 translatorDidTranslate:v8];
  }
}

- (void)translationDidFinishWithError:(id)a3
{
  id v4 = a3;
  v5 = _LTOSLogTranslationEngine();
  char v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[_LTCombinedEngine translationDidFinishWithError:]((uint64_t)v4, v6);
    }
    if (![(_LTSpeechTranslationResultsBuffer *)self->_offlineDelegateBuffer hasFailed])
    {
      id v7 = _LTOSLogTranslationEngine();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v13 = 0;
        _os_log_impl(&dword_2600DC000, v7, OS_LOG_TYPE_INFO, "Online translation failed, continue with offline", v13, 2u);
      }
      id v8 = [(_LTCombinedEngine *)self onlineEngine];
      [v8 cancelSpeechTranslation:0];

      [(_LTSpeechTranslationResultsBuffer *)self->_offlineDelegateBuffer stopBuffering];
      goto LABEL_12;
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2600DC000, v6, OS_LOG_TYPE_INFO, "Server translation finished successfully", buf, 2u);
  }
  self->_serverCompleted = 1;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v12 = objc_loadWeakRetained((id *)p_delegate);
    [v12 translationDidFinishWithError:v4];
  }
LABEL_12:
}

- (_LTTranslationEngine)offlineEngine
{
  return self->_offlineEngine;
}

- (void)setOfflineEngine:(id)a3
{
}

- (_LTTranslationEngine)onlineEngine
{
  return self->_onlineEngine;
}

- (void)setOnlineEngine:(id)a3
{
}

- (_LTSpeechTranslationResultsBuffer)offlineDelegateBuffer
{
  return self->_offlineDelegateBuffer;
}

- (void)setOfflineDelegateBuffer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offlineDelegateBuffer, 0);
  objc_storeStrong((id *)&self->_onlineEngine, 0);
  objc_storeStrong((id *)&self->_offlineEngine, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)startTextToSpeechTranslationWithContext:(os_log_t)log text:delegate:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2600DC000, log, OS_LOG_TYPE_DEBUG, "Starting combined translation", v1, 2u);
}

- (void)translationDidFinishWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2600DC000, a2, OS_LOG_TYPE_ERROR, "Server translation finished with error: %@", (uint8_t *)&v2, 0xCu);
}

@end