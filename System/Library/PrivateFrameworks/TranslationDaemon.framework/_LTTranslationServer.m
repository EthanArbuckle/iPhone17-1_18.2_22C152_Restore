@interface _LTTranslationServer
- (_LTTranslationServer)init;
- (id)_effectiveGroupIDForContext:(id)a3;
- (id)_engineForContext:(id)a3 error:(id *)a4;
- (id)_modalitiesPerLocale;
- (id)_offlineEngineForContext:(id)a3 error:(id *)a4;
- (id)_onlineEngineForContext:(id)a3 error:(id *)a4;
- (id)startSpeechTranslationWithContext:(id)a3 delegate:(id)a4;
- (id)startTextToSpeechTranslationWithContext:(id)a3 text:(id)a4 delegate:(id)a5;
- (void)_cancelPendingSpeechOperations;
- (void)_cleanUpForContextIfNeeded:(id)a3;
- (void)_deleteHotfix:(id)a3;
- (void)_downloadAssetForLanguagePair:(id)a3 userInitiated:(BOOL)a4 completion:(id)a5;
- (void)_getAssetSize:(id)a3;
- (void)_logStateSoon;
- (void)_markPendingSpeechSessionIfNeededWithContext:(id)a3 effectiveSessionID:(id)a4;
- (void)_modalitiesPerLocale;
- (void)_offlineLanguageStatus:(id)a3;
- (void)_purgeAllAssetsExcludingConfig:(BOOL)a3 completion:(id)a4;
- (void)_purgeAssetForLanguagePair:(id)a3 userInitiated:(BOOL)a4 completion:(id)a5;
- (void)_removePendingSpeechSessionID:(id)a3;
- (void)_speechSessionCompleted;
- (void)_updateAllAssets:(id)a3;
- (void)_updateHotfix:(id)a3;
- (void)addSpeechAudioData:(id)a3;
- (void)additionalLikelyPreferredLocalesForLocale:(id)a3 completion:(id)a4;
- (void)attemptToCancelRequestsWithSessionID:(id)a3;
- (void)autoDetectSpeechUnsupportedPairsWithCompletion:(id)a3;
- (void)availableLocalePairsForTask:(int64_t)a3 completion:(id)a4;
- (void)cancelExistingSessions;
- (void)cancelSpeechSession;
- (void)cancelSpeechSessionWithID:(id)a3;
- (void)cleanup;
- (void)cleanupOfflineEngine;
- (void)clearCaches;
- (void)configInfoForLocale:(id)a3 otherLocale:(id)a4 completion:(id)a5;
- (void)endAudio;
- (void)installedLocales:(id)a3;
- (void)installedLocalesForTask:(int64_t)a3 completion:(id)a4;
- (void)languageAssetsWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)languageForText:(id)a3 completion:(id)a4;
- (void)languagesForText:(id)a3 completion:(id)a4;
- (void)languagesForText:(id)a3 usingModel:(unint64_t)a4 completion:(id)a5;
- (void)languagesForText:(id)a3 usingModel:(unint64_t)a4 strategy:(unint64_t)a5 completion:(id)a6;
- (void)modalitiesPerLocaleWithCompletion:(id)a3;
- (void)notifyOfMemoryPressure;
- (void)onDeviceModeEnabled:(id)a3;
- (void)onDeviceModeSupported:(id)a3;
- (void)preheatWithContext:(id)a3 completion:(id)a4;
- (void)registerActivity:(int64_t)a3;
- (void)scheduleAssetCleanupWork:(id)a3;
- (void)selfLoggingEventWithData:(id)a3;
- (void)selfLoggingInvocationCancelledForIDs:(id)a3;
- (void)selfLoggingInvocationDidError:(id)a3 invocationId:(id)a4;
- (void)selfLoggingLanguageIdentificationCompletedWithLIDData:(id)a3;
- (void)setLanguageAssets:(id)a3 options:(unint64_t)a4 progress:(id)a5 completion:(id)a6;
- (void)shouldPresentSystemFirstUseConsent:(id)a3;
- (void)speak:(id)a3 withContext:(id)a4 delegate:(id)a5 completion:(id)a6;
- (void)startInstallRequest:(id)a3 delegate:(id)a4;
- (void)startLoggingRequest:(id)a3;
- (void)task:(int64_t)a3 isSupportedInCountry:(id)a4 completion:(id)a5;
- (void)textStreamingConfigurationWithCompletion:(id)a3;
- (void)translateParagraphs:(id)a3 withContext:(id)a4 paragraphResult:(id)a5 completion:(id)a6;
- (void)translateSentence:(id)a3 withContext:(id)a4 completion:(id)a5;
@end

@implementation _LTTranslationServer

- (_LTTranslationServer)init
{
  v19.receiver = self;
  v19.super_class = (Class)_LTTranslationServer;
  v2 = [(_LTTranslationServer *)&v19 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.translationd.server", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = [[_LTDTranslationOperationScheduler alloc] initWithQueue:v2->_queue];
    translationEngineScheduler = v2->_translationEngineScheduler;
    v2->_translationEngineScheduler = v5;

    v7 = objc_alloc_init(_LTTextToSpeechCache);
    ttsCache = v2->_ttsCache;
    v2->_ttsCache = v7;

    v9 = objc_alloc_init(_LTLoggingRequestHandler);
    logger = v2->_logger;
    v2->_logger = v9;

    v11 = objc_alloc_init(_LTActivityLogger);
    activityLogger = v2->_activityLogger;
    v2->_activityLogger = v11;

    v13 = objc_alloc_init(_LTDSELFLoggingManager);
    selfLoggingManager = v2->_selfLoggingManager;
    v2->_selfLoggingManager = v13;

    uint64_t v15 = [MEMORY[0x263EFF9C0] set];
    pendingSpeechSessionIDs = v2->_pendingSpeechSessionIDs;
    v2->_pendingSpeechSessionIDs = (NSMutableSet *)v15;

    [(_LTTranslationServer *)v2 _logStateSoon];
    v17 = v2;
  }

  return v2;
}

- (id)_offlineEngineForContext:(id)a3 error:(id *)a4
{
  v40[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (_LTPreferencesTranslationIsDisabled())
  {
    v7 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[_LTTranslationServer _offlineEngineForContext:error:]();
    }
    objc_msgSend(MEMORY[0x263F087E8], "lt_translationNotWorking");
    v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = objc_alloc_init(_LTOfflineAssetManager);
    v10 = [v6 localePair];
    id v36 = 0;
    v11 = [(_LTOfflineAssetManager *)v9 speechTranslationAssetInfoForLocalePair:v10 error:&v36];
    id v12 = v36;

    if (v11)
    {
      offlineCachedEngine = self->_offlineCachedEngine;
      v14 = [v6 localePair];
      LODWORD(offlineCachedEngine) = [(_LTTranslationEngine *)offlineCachedEngine translatesPair:v14];

      if (offlineCachedEngine)
      {
        uint64_t v15 = _LTOSLogTranslationEngine();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          v16 = v15;
          v17 = [v6 localePair];
          *(_DWORD *)buf = 138543362;
          v38 = v17;
          _os_log_impl(&dword_2600DC000, v16, OS_LOG_TYPE_INFO, "Reusing cached offline engine for locales: %{public}@", buf, 0xCu);
        }
        [(_LTTranslationServer *)self _updateOfflineEngineIdleTimer];
        v8 = self->_offlineCachedEngine;
      }
      else
      {
        v27 = self->_offlineCachedEngine;
        self->_offlineCachedEngine = 0;

        v28 = [_LTOfflineTranslationEngine alloc];
        v29 = [v6 localePair];
        v8 = [(_LTOfflineTranslationEngine *)v28 initWithLocalePair:v29 assetInfo:v11 selfLoggingManager:self->_selfLoggingManager];

        v30 = [v6 asrModelURLs];
        [(_LTTranslationEngine *)v8 setAsrModelURLs:v30];

        v31 = _LTOSLogTranslationEngine();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
          -[_LTTranslationServer _offlineEngineForContext:error:](v31);
        }
        v32 = [v6 mtModelURL];
        [(_LTTranslationEngine *)v8 setMtModelURL:v32];

        [(_LTTranslationEngine *)v8 setTtsCache:self->_ttsCache];
        objc_storeStrong((id *)&self->_offlineCachedEngine, v8);
        [(_LTTranslationServer *)self _updateOfflineEngineIdleTimer];
      }
    }
    else
    {
      v35 = v9;
      if (!v12
        || ([v12 domain],
            v18 = (__CFString *)objc_claimAutoreleasedReturnValue(),
            v18,
            v18 == @"LTTranslationDaemonErrorDomain"))
      {
        objc_super v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v34 = (void *)MEMORY[0x263F087E8];
        uint64_t v20 = *MEMORY[0x263F1C1D0];
        v39[0] = *MEMORY[0x263F08320];
        v21 = [v19 localizedStringForKey:@"GENERIC_FAILURE_ERROR_DESCRIPTION" value:&stru_270C008E8 table:0];
        v40[0] = v21;
        v39[1] = *MEMORY[0x263F08338];
        v22 = [v19 localizedStringForKey:@"OFFLINE_MODELS_UNAVAILABLE_ERROR_DESCRIPTION" value:&stru_270C008E8 table:0];
        v40[1] = v22;
        v23 = [NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:2];
        uint64_t v24 = [v34 errorWithDomain:v20 code:16 userInfo:v23];

        id v12 = (id)v24;
      }
      v25 = _LTOSLogAssets();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        -[_LTTranslationServer _offlineEngineForContext:error:](v25);
      }
      v9 = v35;
      if (a4) {
        *a4 = v12;
      }
      v26 = self->_offlineCachedEngine;
      self->_offlineCachedEngine = 0;

      [(_LTTranslationServer *)self _cancelOfflineEngineIdleTimer];
      v8 = 0;
    }
  }
  return v8;
}

- (id)_onlineEngineForContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!_LTPreferencesTranslationIsDisabled())
  {
    v9 = _LTPreferencesSupportedLocalePairsForTask([v6 taskHint]);
    v10 = [v6 localePair];
    if ([v9 containsObject:v10])
    {
    }
    else
    {
      v11 = [v6 localePair];
      char v12 = [v11 isPassthrough];

      if ((v12 & 1) == 0)
      {
        v16 = _LTOSLogTranslationEngine();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          -[_LTTranslationServer _onlineEngineForContext:error:]();
        }
        v17 = (void *)MEMORY[0x263F087E8];
        v18 = [v6 localePair];
        objc_super v19 = objc_msgSend(v17, "lt_unsupporedLocalePairError:", v18);

        if (a4) {
          *a4 = v19;
        }

        v8 = 0;
        goto LABEL_16;
      }
    }
    onlineCachedEngine = self->_onlineCachedEngine;
    if (!onlineCachedEngine)
    {
      v14 = [[_LTOnlineTranslationEngine alloc] initWithSelfLoggingManager:self->_selfLoggingManager];
      [(_LTOnlineTranslationEngine *)v14 setTtsCache:self->_ttsCache];
      [(_LTOnlineTranslationEngine *)v14 setServerQueue:self->_queue];
      uint64_t v15 = self->_onlineCachedEngine;
      self->_onlineCachedEngine = (_LTTranslationEngine *)v14;

      onlineCachedEngine = self->_onlineCachedEngine;
    }
    v8 = onlineCachedEngine;
LABEL_16:

    goto LABEL_17;
  }
  v7 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[_LTTranslationServer _onlineEngineForContext:error:]();
  }
  objc_msgSend(MEMORY[0x263F087E8], "lt_translationNotWorking");
  v8 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:

  return v8;
}

- (id)_engineForContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([v6 route] == 1)
  {
    v7 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2600DC000, v7, OS_LOG_TYPE_INFO, "Creating offline engine", buf, 2u);
    }
    uint64_t v8 = [(_LTTranslationServer *)self _offlineEngineForContext:v6 error:a4];
LABEL_9:
    v10 = (_LTCombinedEngine *)v8;
    goto LABEL_23;
  }
  if ([v6 route] == 2)
  {
    v9 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_2600DC000, v9, OS_LOG_TYPE_INFO, "Creating online engine", v18, 2u);
    }
    uint64_t v8 = [(_LTTranslationServer *)self _onlineEngineForContext:v6 error:a4];
    goto LABEL_9;
  }
  v11 = [(_LTTranslationServer *)self _onlineEngineForContext:v6 error:a4];
  if (v11)
  {
    char v12 = [(_LTTranslationServer *)self _offlineEngineForContext:v6 error:a4];
    v13 = _LTOSLogTranslationEngine();
    v14 = v13;
    if (v12)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_2600DC000, v14, OS_LOG_TYPE_INFO, "Creating combined engine", v17, 2u);
      }
      v10 = objc_alloc_init(_LTCombinedEngine);
      [(_LTCombinedEngine *)v10 setOfflineEngine:v12];
      [(_LTCombinedEngine *)v10 setOnlineEngine:v11];
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[_LTTranslationServer _engineForContext:error:]();
      }
      v10 = v11;
    }
  }
  else
  {
    uint64_t v15 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[_LTTranslationServer _engineForContext:error:]();
    }
    v10 = 0;
  }

LABEL_23:
  return v10;
}

- (void)preheatWithContext:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  translationEngineScheduler = self->_translationEngineScheduler;
  v10 = [v7 sessionID];
  uint64_t v11 = [v7 route];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __54___LTTranslationServer_preheatWithContext_completion___block_invoke;
  v15[3] = &unk_265548328;
  id v16 = v7;
  v17 = self;
  id v18 = v8;
  SEL v19 = a2;
  id v12 = v8;
  id v13 = v7;
  id v14 = [(_LTDTranslationOperationScheduler *)translationEngineScheduler scheduleOperationWithGroupID:v10 route:v11 block:v15];
}

- (void)cancelExistingSessions
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  dispatch_queue_t v3 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_2600DC000, v3, OS_LOG_TYPE_INFO, "Attempting to cancel any existing ASR or TTS sessions", (uint8_t *)&v11, 2u);
  }
  if (self->_speechSession)
  {
    v4 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      speechSession = self->_speechSession;
      id v6 = v4;
      id v7 = [(_LTServerSpeechSession *)speechSession sessionID];
      int v11 = 138543362;
      id v12 = v7;
      _os_log_impl(&dword_2600DC000, v6, OS_LOG_TYPE_INFO, "Cancel ongoing speech session: %{public}@", (uint8_t *)&v11, 0xCu);
    }
    [(_LTServerSpeechSession *)self->_speechSession cancel];
    id v8 = self->_speechSession;
    self->_speechSession = 0;
  }
  if (self->_speakSession)
  {
    v9 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_2600DC000, v9, OS_LOG_TYPE_INFO, "Cancel ongoing speak session", (uint8_t *)&v11, 2u);
    }
    [(_LTServerSpeakSession *)self->_speakSession cancel];
    speakSession = self->_speakSession;
    self->_speakSession = 0;
  }
}

- (void)_cancelPendingSpeechOperations
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  dispatch_queue_t v3 = [(NSMutableSet *)self->_pendingSpeechSessionIDs allObjects];
  uint64_t v4 = [v3 count];
  v5 = _LTOSLogSpeech();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = v6;
      *(_DWORD *)buf = 134218242;
      uint64_t v19 = [v3 count];
      __int16 v20 = 2114;
      v21 = v3;
      _os_log_impl(&dword_2600DC000, v7, OS_LOG_TYPE_DEFAULT, "Cancelling %zu sessionIDs for potentially pending speech requests: %{public}@", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2600DC000, v6, OS_LOG_TYPE_INFO, "No potentially pending speech requests sessionIDs were saved, so no need to cancel those requests", buf, 2u);
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = v3;
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
        -[_LTDTranslationOperationScheduler cancelOperationsWithGroupID:](self->_translationEngineScheduler, "cancelOperationsWithGroupID:", *(void *)(*((void *)&v13 + 1) + 8 * v12++), (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }

  [(NSMutableSet *)self->_pendingSpeechSessionIDs removeAllObjects];
}

- (void)translateSentence:(id)a3 withContext:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  objc_initWeak(&location, self);
  [(_LTTranslationServer *)self _cleanUpForContextIfNeeded:v10];
  translationEngineScheduler = self->_translationEngineScheduler;
  long long v13 = [v10 sessionID];
  uint64_t v14 = [v10 route];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __65___LTTranslationServer_translateSentence_withContext_completion___block_invoke;
  v19[3] = &unk_265548378;
  v19[4] = self;
  id v15 = v10;
  id v20 = v15;
  v23[1] = (id)a2;
  id v16 = v11;
  id v22 = v16;
  id v17 = v9;
  id v21 = v17;
  objc_copyWeak(v23, &location);
  id v18 = [(_LTDTranslationOperationScheduler *)translationEngineScheduler scheduleOperationWithGroupID:v13 route:v14 block:v19];

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
}

- (void)translateParagraphs:(id)a3 withContext:(id)a4 paragraphResult:(id)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  objc_initWeak(&location, self);
  [(_LTTranslationServer *)self _cleanUpForContextIfNeeded:v12];
  translationEngineScheduler = self->_translationEngineScheduler;
  id v16 = [v12 sessionID];
  uint64_t v17 = [v12 route];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  id v23[2] = __83___LTTranslationServer_translateParagraphs_withContext_paragraphResult_completion___block_invoke;
  v23[3] = &unk_2655483C8;
  id v18 = v11;
  id v24 = v18;
  id v19 = v12;
  id v25 = v19;
  v26 = self;
  v29[1] = (id)a2;
  id v20 = v14;
  id v27 = v20;
  id v21 = v13;
  id v28 = v21;
  objc_copyWeak(v29, &location);
  id v22 = [(_LTDTranslationOperationScheduler *)translationEngineScheduler scheduleOperationWithGroupID:v16 route:v17 block:v23];

  objc_destroyWeak(v29);
  objc_destroyWeak(&location);
}

- (void)textStreamingConfigurationWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65___LTTranslationServer_textStreamingConfigurationWithCompletion___block_invoke;
  block[3] = &unk_265545E48;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);
}

- (id)startTextToSpeechTranslationWithContext:(id)a3 text:(id)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [MEMORY[0x263F08C38] UUID];
  objc_initWeak(&location, self);
  [(_LTTranslationServer *)self _cleanUpForContextIfNeeded:v9];
  id v13 = [(_LTTranslationServer *)self _effectiveGroupIDForContext:v9];
  [(_LTTranslationServer *)self _markPendingSpeechSessionIfNeededWithContext:v9 effectiveSessionID:v13];
  translationEngineScheduler = self->_translationEngineScheduler;
  uint64_t v15 = [v9 route];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __78___LTTranslationServer_startTextToSpeechTranslationWithContext_text_delegate___block_invoke;
  v25[3] = &unk_265548418;
  objc_copyWeak(v32, &location);
  id v16 = v13;
  id v26 = v16;
  id v17 = v9;
  id v27 = v17;
  id v28 = self;
  v32[1] = (id)a2;
  id v18 = v11;
  id v29 = v18;
  id v19 = v12;
  id v30 = v19;
  id v20 = v10;
  id v31 = v20;
  id v21 = [(_LTDTranslationOperationScheduler *)translationEngineScheduler scheduleOperationWithGroupID:v16 route:v15 block:v25];
  id v22 = v31;
  id v23 = v19;

  objc_destroyWeak(v32);
  objc_destroyWeak(&location);

  return v23;
}

- (void)speak:(id)a3 withContext:(id)a4 delegate:(id)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  objc_initWeak(&location, self);
  [(_LTTranslationServer *)self _cleanUpForContextIfNeeded:v12];
  uint64_t v15 = [(_LTTranslationServer *)self _effectiveGroupIDForContext:v12];
  [(_LTTranslationServer *)self _markPendingSpeechSessionIfNeededWithContext:v12 effectiveSessionID:v15];
  translationEngineScheduler = self->_translationEngineScheduler;
  uint64_t v17 = [v12 route];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __62___LTTranslationServer_speak_withContext_delegate_completion___block_invoke;
  v24[3] = &unk_265548490;
  objc_copyWeak(v31, &location);
  id v18 = v15;
  id v25 = v18;
  id v19 = v12;
  id v26 = v19;
  id v27 = self;
  v31[1] = (id)a2;
  id v20 = v14;
  id v30 = v20;
  id v21 = v11;
  id v28 = v21;
  id v22 = v13;
  id v29 = v22;
  id v23 = [(_LTDTranslationOperationScheduler *)translationEngineScheduler scheduleOperationWithGroupID:v18 route:v17 block:v24];

  objc_destroyWeak(v31);
  objc_destroyWeak(&location);
}

- (id)startSpeechTranslationWithContext:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [MEMORY[0x263F08C38] UUID];
  objc_initWeak(&location, self);
  [(_LTTranslationServer *)self _cleanUpForContextIfNeeded:v7];
  id v10 = [(_LTTranslationServer *)self _effectiveGroupIDForContext:v7];
  [(_LTTranslationServer *)self _markPendingSpeechSessionIfNeededWithContext:v7 effectiveSessionID:v10];
  translationEngineScheduler = self->_translationEngineScheduler;
  uint64_t v12 = [v7 route];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __67___LTTranslationServer_startSpeechTranslationWithContext_delegate___block_invoke;
  v21[3] = &unk_2655484B8;
  objc_copyWeak(v27, &location);
  id v13 = v10;
  id v22 = v13;
  id v14 = v7;
  id v23 = v14;
  id v24 = self;
  id v15 = v8;
  id v25 = v15;
  v27[1] = (id)a2;
  id v16 = v9;
  id v26 = v16;
  id v17 = [(_LTDTranslationOperationScheduler *)translationEngineScheduler scheduleOperationWithGroupID:v13 route:v12 block:v21];
  id v18 = v26;
  id v19 = v16;

  objc_destroyWeak(v27);
  objc_destroyWeak(&location);

  return v19;
}

- (void)cancelSpeechSession
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __43___LTTranslationServer_cancelSpeechSession__block_invoke;
  v4[3] = &unk_265545E20;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)cancelSpeechSessionWithID:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50___LTTranslationServer_cancelSpeechSessionWithID___block_invoke;
  block[3] = &unk_265545C70;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_speechSessionCompleted
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __47___LTTranslationServer__speechSessionCompleted__block_invoke;
  v4[3] = &unk_265545E20;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)addSpeechAudioData:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __43___LTTranslationServer_addSpeechAudioData___block_invoke;
    block[3] = &unk_265545C70;
    objc_copyWeak(&v8, &location);
    id v7 = v4;
    dispatch_async(queue, block);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (void)endAudio
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __32___LTTranslationServer_endAudio__block_invoke;
  v4[3] = &unk_265545E20;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)autoDetectSpeechUnsupportedPairsWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71___LTTranslationServer_autoDetectSpeechUnsupportedPairsWithCompletion___block_invoke;
  block[3] = &unk_265545E48;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);
}

- (id)_modalitiesPerLocale
{
  v2 = _LTPreferencesSupportedLocales(1);
  id v12 = 0;
  dispatch_queue_t v3 = +[_LTDConfigurationService asrConfigurationWithError:&v12];
  id v4 = v12;
  id v5 = v2;
  if (v4)
  {
    id v6 = _LTOSLogAssets();
    id v7 = v5;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      -[_LTTranslationServer _modalitiesPerLocale]();
      id v7 = v5;
    }
  }
  else
  {
    id v7 = [v3 locales];
  }
  id v8 = v5;
  id v9 = (void *)[objc_alloc(MEMORY[0x263F1C0F0]) initWithSupportedLocales:v8 asrLocales:v7 ttsLocales:v8];
  id v10 = _LTOSLogAssets();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[_LTTranslationServer _modalitiesPerLocale](v10);
  }

  return v9;
}

- (void)modalitiesPerLocaleWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58___LTTranslationServer_modalitiesPerLocaleWithCompletion___block_invoke;
  v7[3] = &unk_265547180;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (id)_effectiveGroupIDForContext:(id)a3
{
  id v3 = a3;
  id v4 = [v3 sessionID];
  if (v4 || ![v3 cancelOnCleanup])
  {
    id v6 = v4;
  }
  else
  {
    id v5 = [MEMORY[0x263F08C38] UUID];
    id v6 = [v5 UUIDString];
  }
  return v6;
}

- (void)_markPendingSpeechSessionIfNeededWithContext:(id)a3 effectiveSessionID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7 && [v6 cancelOnCleanup])
  {
    id v8 = _LTOSLogSpeech();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[_LTTranslationServer _markPendingSpeechSessionIfNeededWithContext:effectiveSessionID:]();
    }
    queue = self->_queue;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __88___LTTranslationServer__markPendingSpeechSessionIfNeededWithContext_effectiveSessionID___block_invoke;
    v10[3] = &unk_265548000;
    id v11 = v7;
    id v12 = self;
    dispatch_async(queue, v10);
  }
}

- (void)_removePendingSpeechSessionID:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v4)
  {
    id v5 = _LTOSLogSpeech();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = 138543362;
      id v7 = v4;
      _os_log_impl(&dword_2600DC000, v5, OS_LOG_TYPE_INFO, "Removing a pending speech sessionID since it's starting: %{public}@", (uint8_t *)&v6, 0xCu);
    }
    [(NSMutableSet *)self->_pendingSpeechSessionIDs removeObject:v4];
  }
}

- (void)_cleanUpForContextIfNeeded:(id)a3
{
  if ([a3 cleanUpExistingSpeechSession])
  {
    id v4 = _LTOSLogSpeech();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_2600DC000, v4, OS_LOG_TYPE_INFO, "Client requested performing a speech cleanup before translation", v5, 2u);
    }
    [(_LTTranslationServer *)self cleanup];
  }
}

- (void)registerActivity:(int64_t)a3
{
}

- (void)_logStateSoon
{
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __37___LTTranslationServer__logStateSoon__block_invoke;
  v13[3] = &unk_265545E20;
  objc_copyWeak(&v14, &location);
  id v3 = (void *)MEMORY[0x26120C050](v13);
  dispatch_time_t v4 = dispatch_time(0, 5000000000);
  dispatch_after(v4, (dispatch_queue_t)self->_queue, v3);
  id v5 = self->_queue;
  int v6 = (void *)MEMORY[0x263EFFA20];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __37___LTTranslationServer__logStateSoon__block_invoke_43;
  v10[3] = &unk_2655484E0;
  id v7 = v5;
  id v11 = v7;
  id v8 = v3;
  id v12 = v8;
  id v9 = (id)[v6 scheduledTimerWithTimeInterval:1 repeats:v10 block:10800.0];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)startLoggingRequest:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44___LTTranslationServer_startLoggingRequest___block_invoke;
  block[3] = &unk_265545C70;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)clearCaches
{
}

- (void)notifyOfMemoryPressure
{
}

- (void)cleanupOfflineEngine
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __44___LTTranslationServer_cleanupOfflineEngine__block_invoke;
  v4[3] = &unk_265545E20;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)cleanup
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __31___LTTranslationServer_cleanup__block_invoke;
  v4[3] = &unk_265545E20;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)attemptToCancelRequestsWithSessionID:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61___LTTranslationServer_attemptToCancelRequestsWithSessionID___block_invoke;
  block[3] = &unk_265545C70;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)shouldPresentSystemFirstUseConsent:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59___LTTranslationServer_shouldPresentSystemFirstUseConsent___block_invoke;
  block[3] = &unk_265545E48;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);
}

- (void)languageForText:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __51___LTTranslationServer_languageForText_completion___block_invoke;
  v11[3] = &unk_265546F80;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, v11);
}

- (void)languagesForText:(id)a3 completion:(id)a4
{
}

- (void)languagesForText:(id)a3 usingModel:(unint64_t)a4 completion:(id)a5
{
}

- (void)languagesForText:(id)a3 usingModel:(unint64_t)a4 strategy:(unint64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  queue = self->_queue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __72___LTTranslationServer_languagesForText_usingModel_strategy_completion___block_invoke;
  v15[3] = &unk_265546BB0;
  unint64_t v18 = a4;
  unint64_t v19 = a5;
  id v16 = v10;
  id v17 = v11;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(queue, v15);
}

- (void)languageAssetsWithOptions:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __61___LTTranslationServer_languageAssetsWithOptions_completion___block_invoke;
  v9[3] = &unk_265546608;
  id v10 = v6;
  unint64_t v11 = a3;
  id v8 = v6;
  dispatch_async(queue, v9);
}

- (void)setLanguageAssets:(id)a3 options:(unint64_t)a4 progress:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  queue = self->_queue;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __70___LTTranslationServer_setLanguageAssets_options_progress_completion___block_invoke;
  v17[3] = &unk_265548508;
  id v18 = v10;
  id v19 = v11;
  id v20 = v12;
  unint64_t v21 = a4;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(queue, v17);
}

- (void)_offlineLanguageStatus:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47___LTTranslationServer__offlineLanguageStatus___block_invoke;
  block[3] = &unk_265545E48;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);
}

- (void)_downloadAssetForLanguagePair:(id)a3 userInitiated:(BOOL)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  queue = self->_queue;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __79___LTTranslationServer__downloadAssetForLanguagePair_userInitiated_completion___block_invoke;
  v14[3] = &unk_265548558;
  BOOL v18 = a4;
  id v16 = v10;
  SEL v17 = a2;
  id v15 = v9;
  id v12 = v10;
  id v13 = v9;
  dispatch_async(queue, v14);
}

- (void)_purgeAssetForLanguagePair:(id)a3 userInitiated:(BOOL)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  queue = self->_queue;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __76___LTTranslationServer__purgeAssetForLanguagePair_userInitiated_completion___block_invoke;
  v14[3] = &unk_265548558;
  BOOL v18 = a4;
  id v16 = v10;
  SEL v17 = a2;
  id v15 = v9;
  id v12 = v10;
  id v13 = v9;
  dispatch_async(queue, v14);
}

- (void)_purgeAllAssetsExcludingConfig:(BOOL)a3 completion:(id)a4
{
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66___LTTranslationServer__purgeAllAssetsExcludingConfig_completion___block_invoke;
  block[3] = &unk_265548580;
  BOOL v13 = a3;
  id v11 = v7;
  SEL v12 = a2;
  id v9 = v7;
  dispatch_async(queue, block);
}

- (void)_updateAllAssets:(id)a3
{
  id v5 = a3;
  queue = self->_queue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __41___LTTranslationServer__updateAllAssets___block_invoke;
  v8[3] = &unk_265546608;
  id v9 = v5;
  SEL v10 = a2;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)installedLocales:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41___LTTranslationServer_installedLocales___block_invoke;
  block[3] = &unk_265545E48;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);
}

- (void)installedLocalesForTask:(int64_t)a3 completion:(id)a4
{
  id v5 = a4;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59___LTTranslationServer_installedLocalesForTask_completion___block_invoke;
  block[3] = &unk_2655466A8;
  objc_copyWeak(&v10, &location);
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)startInstallRequest:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __53___LTTranslationServer_startInstallRequest_delegate___block_invoke;
  v11[3] = &unk_265548000;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, v11);
}

- (void)_getAssetSize:(id)a3
{
  id v5 = a3;
  queue = self->_queue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __38___LTTranslationServer__getAssetSize___block_invoke;
  v8[3] = &unk_265546608;
  id v9 = v5;
  SEL v10 = a2;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)availableLocalePairsForTask:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __63___LTTranslationServer_availableLocalePairsForTask_completion___block_invoke;
  v9[3] = &unk_265546608;
  id v10 = v6;
  int64_t v11 = a3;
  id v8 = v6;
  dispatch_async(queue, v9);
}

- (void)additionalLikelyPreferredLocalesForLocale:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __77___LTTranslationServer_additionalLikelyPreferredLocalesForLocale_completion___block_invoke;
  v11[3] = &unk_265547180;
  id v12 = v6;
  id v13 = v7;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, v11);
}

- (void)configInfoForLocale:(id)a3 otherLocale:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67___LTTranslationServer_configInfoForLocale_otherLocale_completion___block_invoke;
  block[3] = &unk_265548640;
  id v17 = v9;
  id v18 = v10;
  id v16 = v8;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  dispatch_async(queue, block);
}

- (void)task:(int64_t)a3 isSupportedInCountry:(id)a4 completion:(id)a5
{
  id v6 = a5;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61___LTTranslationServer_task_isSupportedInCountry_completion___block_invoke;
  block[3] = &unk_265545E48;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)_updateHotfix:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38___LTTranslationServer__updateHotfix___block_invoke;
  block[3] = &unk_265545E48;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);
}

- (void)_deleteHotfix:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38___LTTranslationServer__deleteHotfix___block_invoke;
  block[3] = &unk_265545E48;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);
}

- (void)onDeviceModeEnabled:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44___LTTranslationServer_onDeviceModeEnabled___block_invoke;
  block[3] = &unk_265545E48;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);
}

- (void)onDeviceModeSupported:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46___LTTranslationServer_onDeviceModeSupported___block_invoke;
  block[3] = &unk_265545E48;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);
}

- (void)selfLoggingEventWithData:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49___LTTranslationServer_selfLoggingEventWithData___block_invoke;
  block[3] = &unk_265545C70;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)selfLoggingLanguageIdentificationCompletedWithLIDData:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78___LTTranslationServer_selfLoggingLanguageIdentificationCompletedWithLIDData___block_invoke;
  block[3] = &unk_265545C70;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)selfLoggingInvocationCancelledForIDs:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61___LTTranslationServer_selfLoggingInvocationCancelledForIDs___block_invoke;
  block[3] = &unk_265545C70;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)selfLoggingInvocationDidError:(id)a3 invocationId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __67___LTTranslationServer_selfLoggingInvocationDidError_invocationId___block_invoke;
  v11[3] = &unk_2655470C0;
  objc_copyWeak(&v14, &location);
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)scheduleAssetCleanupWork:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  translationEngineScheduler = self->_translationEngineScheduler;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __49___LTTranslationServer_scheduleAssetCleanupWork___block_invoke;
  v8[3] = &unk_2655486B8;
  id v6 = v4;
  id v9 = v6;
  objc_copyWeak(&v10, &location);
  id v7 = [(_LTDTranslationOperationScheduler *)translationEngineScheduler scheduleOperationWithGroupID:0 route:1 block:v8];
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_offlineEngineIdleTimer, 0);
  objc_storeStrong((id *)&self->_selfLoggingManager, 0);
  objc_storeStrong((id *)&self->_activityLogger, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_pendingSpeechSessionIDs, 0);
  objc_storeStrong((id *)&self->_speakSession, 0);
  objc_storeStrong((id *)&self->_speechSession, 0);
  objc_storeStrong((id *)&self->_ttsCache, 0);
  objc_storeStrong((id *)&self->_translationEngineScheduler, 0);
  objc_storeStrong((id *)&self->_onlineCachedEngine, 0);
  objc_storeStrong((id *)&self->_offlineCachedEngine, 0);
}

- (void)_offlineEngineForContext:error:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_2600DC000, v0, v1, "Unable to create offline engine.", v2, v3, v4, v5, v6);
}

- (void)_offlineEngineForContext:(void *)a1 error:.cold.2(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)OUTLINED_FUNCTION_1_5() localePair];
  uint64_t v4 = [v3 identifier];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_4_5(&dword_2600DC000, v5, v6, "No asset info found for pair %{public}@", v7, v8, v9, v10, v11);
}

- (void)_offlineEngineForContext:(void *)a1 error:.cold.3(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)OUTLINED_FUNCTION_1_5() mtModelURL];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_4(&dword_2600DC000, v4, v5, "MT model URL: %{public}@", v6, v7, v8, v9, v10);
}

- (void)_onlineEngineForContext:error:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_2600DC000, v0, v1, "Unable to create online engine.", v2, v3, v4, v5, v6);
}

- (void)_onlineEngineForContext:error:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_2600DC000, v0, v1, "Unsupported language pair requested for online engine", v2, v3, v4, v5, v6);
}

- (void)_engineForContext:error:.cold.1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Could not create online engine: %@", v2, v3, v4, v5, v6);
}

- (void)_engineForContext:error:.cold.2()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Could not create offline engine, using online only: %@", v2, v3, v4, v5, v6);
}

- (void)_modalitiesPerLocale
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Failed to read ASR configuration locale identifiers %@", v2, v3, v4, v5, v6);
}

- (void)_markPendingSpeechSessionIfNeededWithContext:effectiveSessionID:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_1();
  _os_log_debug_impl(&dword_2600DC000, v0, OS_LOG_TYPE_DEBUG, "Will mark a speech session as pending: %{public}@", v1, 0xCu);
}

@end