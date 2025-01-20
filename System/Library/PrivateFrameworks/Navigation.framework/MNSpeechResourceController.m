@interface MNSpeechResourceController
- (BOOL)_createDurationCacheIfNecessary;
- (BOOL)cache:(id)a3 withDisclosure:(unint64_t)a4 andReport:(id *)a5;
- (BOOL)speak:(id)a3 withDisclosure:(unint64_t)a4 andReport:(id *)a5;
- (BOOL)speaking;
- (BOOL)stopSpeakingAndReport:(id *)a3;
- (MNSpeechControllerDelegate)delegate;
- (MNSpeechResourceController)initWithLanguage:(id)a3;
- (double)_estimateDurationForUtterance:(id)a3;
- (double)_volumeFromUserPreference;
- (double)durationOf:(id)a3;
- (id)_speechRequestForUtterance:(id)a3 withLanguage:(id)a4 andVoiceName:(id)a5 andAudioSessionID:(unsigned int)a6 andPrivacySensitive:(BOOL)a7;
- (id)_synthesisRequestForUtterance:(id)a3 withLanguage:(id)a4 andVoiceName:(id)a5 andPrivacySensitive:(BOOL)a6;
- (void)_addDurationToCache:(double)a3 forUtterance:(id)a4;
- (void)_audioSessionInterruption:(id)a3;
- (void)_cachingTimeoutOccurred:(id)a3;
- (void)_cancelTimer;
- (void)_createTimerForUtterance:(id)a3 andIsCaching:(BOOL)a4;
- (void)_markVoiceForDownloadingWithLanguage:(id)a3 andVoiceName:(id)a4 andGender:(int64_t)a5;
- (void)_mediaSessionServicesWereReset:(id)a3;
- (void)_prepareSynthesizerWithLanguage:(id)a3 andVoiceName:(id)a4 andGender:(int64_t)a5 andAudioSessionID:(unsigned int)a6;
- (void)_registerForObservation;
- (void)_speakingTimeoutOccurred:(id)a3;
- (void)_updateEstimatorWithDuration:(double)a3 andUtterance:(id)a4;
- (void)_warmUpTTSForLanguage:(id)a3 andVoiceName:(id)a4 andGender:(int64_t)a5 andAudioSessionID:(unsigned int)a6;
- (void)dealloc;
- (void)didFinishSpeakingRequest:(id)a3 metrics:(id)a4 withError:(id)a5;
- (void)didFinishSynthesisRequest:(id)a3 withInstrumentMetrics:(id)a4 error:(id)a5;
- (void)didStartSpeakingRequest:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation MNSpeechResourceController

- (MNSpeechResourceController)initWithLanguage:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![v4 length])
  {
    v10 = GetAudioLogForMNSpeechResourceControllerCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B542B000, v10, OS_LOG_TYPE_ERROR, "⒮ Invalid language", buf, 2u);
    }
    v13 = 0;
    goto LABEL_13;
  }
  v18.receiver = self;
  v18.super_class = (Class)MNSpeechResourceController;
  v5 = [(MNSpeechResourceController *)&v18 init];
  if (v5)
  {
    v6 = v5;
    v7 = (SiriTTSDaemonSession *)objc_alloc_init(MEMORY[0x1E4FA4F30]);
    session = v6->_session;
    v6->_session = v7;

    v9 = [MEMORY[0x1E4F4E9F0] sharedInstance];
    v6->_unsigned int audioSessionID = [v9 opaqueSessionID];

    v10 = [MEMORY[0x1E4F4E420] outputVoice];
    id v11 = [v10 languageCode];
    if (v11 == v4)
    {
      v12 = [v10 name];
    }
    else
    {
      v12 = 0;
    }

    uint64_t v14 = [v10 gender];
    v15 = GetAudioLogForMNSpeechResourceControllerCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      unsigned int audioSessionID = v6->_audioSessionID;
      *(_DWORD *)buf = 67109890;
      unsigned int v20 = audioSessionID;
      __int16 v21 = 2112;
      id v22 = v4;
      __int16 v23 = 2112;
      v24 = v12;
      __int16 v25 = 1024;
      int v26 = v14;
      _os_log_impl(&dword_1B542B000, v15, OS_LOG_TYPE_INFO, "ⓢ On init : AVAudioSession id : %d, Language : '%@', Voice Name : '%@', Voice Gender : %d", buf, 0x22u);
    }

    [(MNSpeechResourceController *)v6 _prepareSynthesizerWithLanguage:v4 andVoiceName:v12 andGender:v14 andAudioSessionID:v6->_audioSessionID];
    [(MNSpeechResourceController *)v6 _registerForObservation];
    self = v6;

    v13 = self;
LABEL_13:

    goto LABEL_14;
  }
  v13 = 0;
LABEL_14:

  return v13;
}

- (void)_prepareSynthesizerWithLanguage:(id)a3 andVoiceName:(id)a4 andGender:(int64_t)a5 andAudioSessionID:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  objc_storeStrong((id *)&self->_cachedVoiceLanguage, a3);
  objc_storeStrong((id *)&self->_cachedVoiceName, a4);
  self->_int64_t cachedVoiceGender = a5;
  v13 = GetAudioLogForMNSpeechResourceControllerCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    cachedVoiceLanguage = self->_cachedVoiceLanguage;
    cachedVoiceName = self->_cachedVoiceName;
    int64_t cachedVoiceGender = self->_cachedVoiceGender;
    int v17 = 138412802;
    objc_super v18 = cachedVoiceLanguage;
    __int16 v19 = 2112;
    unsigned int v20 = cachedVoiceName;
    __int16 v21 = 1024;
    int v22 = cachedVoiceGender;
    _os_log_impl(&dword_1B542B000, v13, OS_LOG_TYPE_INFO, "ⓢ Caching language %@, name %@, and gender %d", (uint8_t *)&v17, 0x1Cu);
  }

  [(MNSpeechResourceController *)self _warmUpTTSForLanguage:self->_cachedVoiceLanguage andVoiceName:self->_cachedVoiceName andGender:self->_cachedVoiceGender andAudioSessionID:v6];
  [(MNSpeechResourceController *)self _markVoiceForDownloadingWithLanguage:self->_cachedVoiceLanguage andVoiceName:self->_cachedVoiceName andGender:self->_cachedVoiceGender];
}

- (void)_warmUpTTSForLanguage:(id)a3 andVoiceName:(id)a4 andGender:(int64_t)a5 andAudioSessionID:(unsigned int)a6
{
  v7 = [(MNSpeechResourceController *)self _synthesisRequestForUtterance:@"prewarm kick" withLanguage:a3 andVoiceName:a4 andPrivacySensitive:0];
  v8 = GetAudioLogForMNSpeechResourceControllerCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B542B000, v8, OS_LOG_TYPE_INFO, "Ⓢ Attempting to prewarm SiriTTSDaemonSession", buf, 2u);
  }

  [(SiriTTSDaemonSession *)self->_session setKeepActive:1];
  session = self->_session;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __93__MNSpeechResourceController__warmUpTTSForLanguage_andVoiceName_andGender_andAudioSessionID___block_invoke;
  v11[3] = &unk_1E60FB548;
  id v12 = v7;
  v13 = self;
  id v10 = v7;
  [(SiriTTSDaemonSession *)session prewarmWithRequest:v10 didFinish:v11];
}

void __93__MNSpeechResourceController__warmUpTTSForLanguage_andVoiceName_andGender_andAudioSessionID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = GetAudioLogForMNSpeechResourceControllerCategory();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v8 = 138412546;
      uint64_t v9 = v6;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_ERROR, "⒮    Error submitting prewarm request (this is a problem in SiriTTSDaemonSession): %@ - %@", (uint8_t *)&v8, 0x16u);
    }

    [*(id *)(*(void *)(a1 + 40) + 8) setKeepActive:0];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138412290;
      uint64_t v9 = v7;
      _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_INFO, "Ⓢ    Prewarm request succeeded: %@", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)_markVoiceForDownloadingWithLanguage:(id)a3 andVoiceName:(id)a4 andGender:(int64_t)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = +[MNUserOptionsEngine sharedInstance];
  __int16 v10 = [v9 currentVoiceLanguage];
  int v11 = [v10 isEqualToString:v7];

  if (v11)
  {
    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4FA4F68]) initWithLanguage:v7 name:v8];
    v13 = GetAudioLogForMNSpeechResourceControllerCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v21 = v12;
      _os_log_impl(&dword_1B542B000, v13, OS_LOG_TYPE_INFO, "ⓢ Marking voice asset to auto-download %@", buf, 0xCu);
    }

    session = self->_session;
    __int16 v19 = v12;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __90__MNSpeechResourceController__markVoiceForDownloadingWithLanguage_andVoiceName_andGender___block_invoke;
    v17[3] = &unk_1E60F7A30;
    id v18 = v12;
    id v16 = v12;
    [(SiriTTSDaemonSession *)session subscribeWithVoices:v15 reply:v17];
  }
}

void __90__MNSpeechResourceController__markVoiceForDownloadingWithLanguage_andVoiceName_andGender___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v3 = GetAudioLogForMNSpeechResourceControllerCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v5 = 138412290;
      uint64_t v6 = v4;
      _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_INFO, "⒮    Error marking voice asset to auto-download %@", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)_registerForObservation
{
  id v3 = GetAudioLogForMNSpeechResourceControllerCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)int v5 = 0;
    _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_DEBUG, "ⓢ Registering for observeration", v5, 2u);
  }

  uint64_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:self selector:sel__audioSessionInterruption_ name:*MEMORY[0x1E4F4E830] object:0];
  [v4 addObserver:self selector:sel__mediaSessionServicesWereReset_ name:*MEMORY[0x1E4F4E8A0] object:0];
}

- (void)dealloc
{
  id v3 = GetAudioLogForMNSpeechResourceControllerCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_DEBUG, "ⓢ Deallocating", buf, 2u);
  }

  [(MNSpeechResourceController *)self _cancelTimer];
  v4.receiver = self;
  v4.super_class = (Class)MNSpeechResourceController;
  [(MNSpeechResourceController *)&v4 dealloc];
}

- (BOOL)speaking
{
  return self->_currentlySpeaking;
}

- (BOOL)cache:(id)a3 withDisclosure:(unint64_t)a4 andReport:(id *)a5
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  __int16 v10 = GetAudioLogForMNSpeechResourceControllerCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[MNSpeechResourceController cache:withDisclosure:andReport:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 2048;
    unint64_t v32 = a4;
    _os_log_impl(&dword_1B542B000, v10, OS_LOG_TYPE_DEBUG, "%s : %@ : %lu", buf, 0x20u);
  }

  if (![v9 length])
  {
    int v17 = GetAudioLogForMNSpeechResourceControllerCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B542B000, v17, OS_LOG_TYPE_ERROR, "⒮ Invalid utterance", buf, 2u);
    }

    if (a5)
    {
      id v18 = (void *)MEMORY[0x1E4F28C58];
      v13 = NAVAudioErrorDomain();
      [v18 errorWithDomain:v13 code:3600 userInfo:0];
      BOOL v16 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
LABEL_19:
    BOOL v16 = 0;
    goto LABEL_20;
  }
  if (a4 < 2)
  {
    [(SiriTTSDaemonSession *)self->_session setKeepActive:1];
    __int16 v19 = GetAudioLogForMNSpeechResourceControllerCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138477827;
      *(void *)&uint8_t buf[4] = v9;
      _os_log_impl(&dword_1B542B000, v19, OS_LOG_TYPE_INFO, "Ⓢ Attempting to start caching '%{private}@'", buf, 0xCu);
    }

    v13 = (void *)[objc_alloc(MEMORY[0x1E4FA4F68]) initWithLanguage:self->_cachedVoiceLanguage name:self->_cachedVoiceName];
    unsigned int v20 = (void *)[objc_alloc(MEMORY[0x1E4FA4F60]) initWithText:v9 voice:v13];
    [v20 setPrivacySensitive:a4 == 0];
    objc_initWeak(&location, self);
    objc_initWeak(&from, v20);
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    unint64_t v32 = (unint64_t)__Block_byref_object_copy__14;
    v33 = __Block_byref_object_dispose__14;
    id v34 = 0;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __61__MNSpeechResourceController_cache_withDisclosure_andReport___block_invoke;
    v28[3] = &unk_1E60FB570;
    v28[4] = buf;
    [v20 setDidReportInstrument:v28];
    session = self->_session;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __61__MNSpeechResourceController_cache_withDisclosure_andReport___block_invoke_2;
    v25[3] = &unk_1E60FB598;
    objc_copyWeak(&v26, &location);
    objc_copyWeak(&v27, &from);
    v25[4] = buf;
    [(SiriTTSDaemonSession *)session synthesizeWithRequest:v20 didFinish:v25];
    uint64_t v22 = GetAudioLogForMNSpeechResourceControllerCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_1B542B000, v22, OS_LOG_TYPE_INFO, "Ⓢ    Synthesis request submitted", v24, 2u);
    }

    objc_storeStrong((id *)&self->_utterance, a3);
    [(MNSpeechResourceController *)self _createTimerForUtterance:v9 andIsCaching:1];
    objc_destroyWeak(&v27);
    objc_destroyWeak(&v26);
    _Block_object_dispose(buf, 8);

    objc_destroyWeak(&from);
    objc_destroyWeak(&location);

    BOOL v16 = 1;
    goto LABEL_18;
  }
  int v11 = GetAudioLogForMNSpeechResourceControllerCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = a4;
    _os_log_impl(&dword_1B542B000, v11, OS_LOG_TYPE_ERROR, "⒮ Invalid disclosure level: %lu", buf, 0xCu);
  }

  if (!a5) {
    goto LABEL_19;
  }
  uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
  v13 = NAVAudioErrorDomain();
  v35 = @"InvalidDisclosure";
  uint64_t v14 = [NSNumber numberWithUnsignedInteger:a4];
  v36[0] = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:&v35 count:1];
  *a5 = [v12 errorWithDomain:v13 code:3601 userInfo:v15];

  BOOL v16 = 0;
LABEL_18:

LABEL_20:
  return v16;
}

void __61__MNSpeechResourceController_cache_withDisclosure_andReport___block_invoke(uint64_t a1, void *a2)
{
}

void __61__MNSpeechResourceController_cache_withDisclosure_andReport___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v5 = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained didFinishSynthesisRequest:v5 withInstrumentMetrics:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) error:v4];
}

- (double)durationOf:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 length])
  {
    if (![(MNSpeechResourceController *)self _createDurationCacheIfNecessary])
    {
      id v5 = [(NSCache *)self->_durations objectForKey:v4];
      uint64_t v6 = v5;
      if (v5)
      {
        [v5 doubleValue];
        if (v7 > 0.0)
        {
          double v9 = v7;
          __int16 v10 = GetAudioLogForMNSpeechResourceControllerCategory();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            int v12 = 134218243;
            double v13 = v9;
            __int16 v14 = 2113;
            id v15 = v4;
            _os_log_impl(&dword_1B542B000, v10, OS_LOG_TYPE_INFO, "ⓢ Duration is using a cached value of %f for '%{private}@'", (uint8_t *)&v12, 0x16u);
          }

          goto LABEL_12;
        }
      }
    }
    [(MNSpeechResourceController *)self _estimateDurationForUtterance:v4];
    double v9 = v8;
    -[MNSpeechResourceController _addDurationToCache:forUtterance:](self, "_addDurationToCache:forUtterance:", v4);
    uint64_t v6 = GetAudioLogForMNSpeechResourceControllerCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v12 = 134218243;
      double v13 = v9;
      __int16 v14 = 2113;
      id v15 = v4;
      _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_INFO, "ⓢ Duration is using an estimated value of %f for '%{private}@'", (uint8_t *)&v12, 0x16u);
    }
LABEL_12:

    goto LABEL_13;
  }
  double v9 = 0.0;
LABEL_13:

  return v9;
}

- (BOOL)speak:(id)a3 withDisclosure:(unint64_t)a4 andReport:(id *)a5
{
  v44[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  __int16 v10 = GetAudioLogForMNSpeechResourceControllerCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[MNSpeechResourceController speak:withDisclosure:andReport:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 2048;
    unint64_t v40 = a4;
    _os_log_impl(&dword_1B542B000, v10, OS_LOG_TYPE_DEBUG, "ⓢ %s : %@ : %lu", buf, 0x20u);
  }

  if (!GEOConfigGetBOOL())
  {
    if ([v9 length])
    {
      if (a4 < 2)
      {
        [(MNSpeechResourceController *)self stopSpeakingAndReport:0];
        [(SiriTTSDaemonSession *)self->_session setKeepActive:1];
        int v17 = [(MNSpeechResourceController *)self _speechRequestForUtterance:v9 withLanguage:self->_cachedVoiceLanguage andVoiceName:self->_cachedVoiceName andAudioSessionID:self->_audioSessionID andPrivacySensitive:a4 == 0];
        __int16 v25 = GetAudioLogForMNSpeechResourceControllerCategory();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218243;
          *(void *)&uint8_t buf[4] = v17;
          *(_WORD *)&buf[12] = 2113;
          *(void *)&buf[14] = v9;
          _os_log_impl(&dword_1B542B000, v25, OS_LOG_TYPE_DEFAULT, "Sending speech request (%p): \"%{private}@\"", buf, 0x16u);
        }

        objc_initWeak(&location, self);
        objc_initWeak(&from, v17);
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __61__MNSpeechResourceController_speak_withDisclosure_andReport___block_invoke;
        v34[3] = &unk_1E60FB5C0;
        objc_copyWeak(&v35, &location);
        objc_copyWeak(&v36, &from);
        [v17 setDidStartSpeaking:v34];
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&uint8_t buf[16] = 0x3032000000;
        unint64_t v40 = (unint64_t)__Block_byref_object_copy__14;
        v41 = __Block_byref_object_dispose__14;
        id v42 = 0;
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __61__MNSpeechResourceController_speak_withDisclosure_andReport___block_invoke_2;
        v33[3] = &unk_1E60FB570;
        v33[4] = buf;
        [v17 setDidReportInstrument:v33];
        self->_currentlySpeaking = 1;
        session = self->_session;
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __61__MNSpeechResourceController_speak_withDisclosure_andReport___block_invoke_3;
        v30[3] = &unk_1E60FB598;
        objc_copyWeak(&v31, &location);
        objc_copyWeak(&v32, &from);
        v30[4] = buf;
        [(SiriTTSDaemonSession *)session speakWithSpeechRequest:v17 didFinish:v30];
        id v27 = GetAudioLogForMNSpeechResourceControllerCategory();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v29 = 0;
          _os_log_impl(&dword_1B542B000, v27, OS_LOG_TYPE_INFO, "Ⓢ    Speech request submitted", v29, 2u);
        }

        objc_storeStrong((id *)&self->_onGoingRequest, v17);
        objc_storeStrong((id *)&self->_utterance, a3);
        [(MNSpeechResourceController *)self _createTimerForUtterance:v9 andIsCaching:0];
        objc_destroyWeak(&v32);
        objc_destroyWeak(&v31);
        _Block_object_dispose(buf, 8);

        objc_destroyWeak(&v36);
        objc_destroyWeak(&v35);
        objc_destroyWeak(&from);
        objc_destroyWeak(&location);
        goto LABEL_26;
      }
      id v18 = GetAudioLogForMNSpeechResourceControllerCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = a4;
        _os_log_impl(&dword_1B542B000, v18, OS_LOG_TYPE_ERROR, "⒮ Invalid disclosure level: %lu", buf, 0xCu);
      }

      if (a5)
      {
        __int16 v19 = (void *)MEMORY[0x1E4F28C58];
        int v17 = NAVAudioErrorDomain();
        v43 = @"InvalidDisclosure";
        unsigned int v20 = [NSNumber numberWithUnsignedInteger:a4];
        v44[0] = v20;
        __int16 v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:&v43 count:1];
        *a5 = [v19 errorWithDomain:v17 code:3601 userInfo:v21];

        BOOL v22 = 0;
LABEL_27:

        goto LABEL_28;
      }
    }
    else
    {
      uint64_t v23 = GetAudioLogForMNSpeechResourceControllerCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B542B000, v23, OS_LOG_TYPE_ERROR, "⒮ Invalid utterance", buf, 2u);
      }

      if (a5)
      {
        v24 = (void *)MEMORY[0x1E4F28C58];
        int v17 = NAVAudioErrorDomain();
        [v24 errorWithDomain:v17 code:3600 userInfo:0];
        BOOL v22 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_27;
      }
    }
    BOOL v22 = 0;
    goto LABEL_28;
  }
  int v11 = GetAudioLogForMNSpeechResourceControllerCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138477827;
    *(void *)&uint8_t buf[4] = @"ⓢ Debug Panel has the Mute Voice switch ON";
    _os_log_impl(&dword_1B542B000, v11, OS_LOG_TYPE_INFO, "%{private}@", buf, 0xCu);
  }

  int v12 = [(MNSpeechResourceController *)self delegate];
  char v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    __int16 v14 = [(MNSpeechResourceController *)self delegate];
    [v14 speechResourceController:self willStartSpeakingUtterance:v9];
  }
  id v15 = [(MNSpeechResourceController *)self delegate];
  char v16 = objc_opt_respondsToSelector();

  if (v16)
  {
    int v17 = [(MNSpeechResourceController *)self delegate];
    [v17 speechResourceController:self didFinishSpeakingUtterance:v9 withDuration:2.0];
LABEL_26:
    BOOL v22 = 1;
    goto LABEL_27;
  }
  BOOL v22 = 1;
LABEL_28:

  return v22;
}

void __61__MNSpeechResourceController_speak_withDisclosure_andReport___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained didStartSpeakingRequest:v2];
}

void __61__MNSpeechResourceController_speak_withDisclosure_andReport___block_invoke_2(uint64_t a1, void *a2)
{
}

void __61__MNSpeechResourceController_speak_withDisclosure_andReport___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v5 = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained didFinishSpeakingRequest:v5 metrics:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) withError:v4];
}

- (BOOL)stopSpeakingAndReport:(id *)a3
{
  [(MNSpeechResourceController *)self _cancelTimer];
  if ([(MNSpeechResourceController *)self speaking])
  {
    [(SiriTTSDaemonSession *)self->_session setKeepActive:0];
    if (self->_onGoingRequest)
    {
      id v4 = GetAudioLogForMNSpeechResourceControllerCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B542B000, v4, OS_LOG_TYPE_INFO, "Ⓢ Attempting to immediately stop current speech", buf, 2u);
      }

      [(SiriTTSDaemonSession *)self->_session cancelWithRequest:self->_onGoingRequest];
    }
    else
    {
      self->_currentlySpeaking = 0;
      utterance = self->_utterance;
      self->_utterance = 0;

      uint64_t v6 = GetAudioLogForMNSpeechResourceControllerCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)__int16 v10 = 0;
        _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_INFO, "Ⓢ No speech currently in progress", v10, 2u);
      }
    }
    double v7 = GetAudioLogForMNSpeechResourceControllerCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_DEBUG, "Ⓢ    Stop speaking request was successful", v9, 2u);
    }
  }
  return 1;
}

- (id)_synthesisRequestForUtterance:(id)a3 withLanguage:(id)a4 andVoiceName:(id)a5 andPrivacySensitive:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  if (GEOConfigGetBOOL())
  {
    int v12 = GetAudioLogForMNSpeechResourceControllerCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v16 = 138477827;
      int v17 = @"ⓢ Debug Panel has the Disable Server TTS switch ON";
      _os_log_impl(&dword_1B542B000, v12, OS_LOG_TYPE_INFO, "%{private}@", (uint8_t *)&v16, 0xCu);
    }

    BOOL v6 = 1;
  }
  char v13 = (void *)[objc_alloc(MEMORY[0x1E4FA4F68]) initWithLanguage:v10 name:v9];

  __int16 v14 = (void *)[objc_alloc(MEMORY[0x1E4FA4F60]) initWithText:v11 voice:v13];
  [v14 setPrivacySensitive:v6];

  return v14;
}

- (id)_speechRequestForUtterance:(id)a3 withLanguage:(id)a4 andVoiceName:(id)a5 andAudioSessionID:(unsigned int)a6 andPrivacySensitive:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v8 = *(void *)&a6;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  if (GEOConfigGetBOOL())
  {
    id v15 = GetAudioLogForMNSpeechResourceControllerCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v20 = 138477827;
      __int16 v21 = @"ⓢ Debug Panel has the Disable Server TTS switch ON";
      _os_log_impl(&dword_1B542B000, v15, OS_LOG_TYPE_INFO, "%{private}@", (uint8_t *)&v20, 0xCu);
    }

    BOOL v7 = 1;
  }
  int v16 = (void *)[objc_alloc(MEMORY[0x1E4FA4F68]) initWithLanguage:v13 name:v12];

  int v17 = (void *)[objc_alloc(MEMORY[0x1E4FA4F58]) initWithText:v14 voice:v16];
  [v17 setAudioSessionId:v8];
  [v17 setPrivacySensitive:v7];
  [(MNSpeechResourceController *)self _volumeFromUserPreference];
  *(float *)&double v18 = v18;
  [v17 setPlaybackVolume:v18];

  return v17;
}

- (double)_volumeFromUserPreference
{
  if ((GEOConfigGetBOOL() & 1) == 0) {
    GEOConfigGetInteger();
  }
  GEOConfigGetDouble();
  return result;
}

- (BOOL)_createDurationCacheIfNecessary
{
  durations = self->_durations;
  if (!durations)
  {
    id v4 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    id v5 = self->_durations;
    self->_durations = v4;
  }
  return durations == 0;
}

- (void)_addDurationToCache:(double)a3 forUtterance:(id)a4
{
  durations = self->_durations;
  BOOL v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithDouble:a3];
  [(NSCache *)durations setObject:v8 forKey:v7];
}

- (double)_estimateDurationForUtterance:(id)a3
{
  id v4 = objc_msgSend(a3, "_navigation_stripTagsFromSpokenString");
  id v5 = v4;
  unint64_t charactersSpokenCount = self->_charactersSpokenCount;
  if (charactersSpokenCount < 0x33)
  {
    if (objc_msgSend(v4, "_navigation_isCJK")) {
      double v8 = 0.2;
    }
    else {
      double v8 = 0.07;
    }
  }
  else
  {
    double v7 = self->_charactersSpokenDuration / (double)charactersSpokenCount;
    if (v7 > 0.4) {
      double v7 = 0.4;
    }
    double v8 = fmax(v7, 0.04);
  }
  double v9 = v8 * (double)(unint64_t)[v5 length];

  return v9;
}

- (void)_createTimerForUtterance:(id)a3 andIsCaching:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [(MNSpeechResourceController *)self durationOf:a3];
  double v7 = v6 * 1.5;
  double v8 = v6 + 2.0;
  if (v7 >= v8) {
    double v9 = v7;
  }
  else {
    double v9 = v8;
  }
  id v10 = GetAudioLogForMNSpeechResourceControllerCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v14 = 134217984;
    double v15 = v9;
    _os_log_impl(&dword_1B542B000, v10, OS_LOG_TYPE_INFO, "ⓢ Creating timer with timeout: %f", (uint8_t *)&v14, 0xCu);
  }

  [(MNSpeechResourceController *)self _cancelTimer];
  id v11 = &selRef__cachingTimeoutOccurred_;
  if (!v4) {
    id v11 = &selRef__speakingTimeoutOccurred_;
  }
  id v12 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:*v11 selector:0 userInfo:0 repeats:v9];
  timer = self->_timer;
  self->_timer = v12;
}

- (void)_cancelTimer
{
  if (self->_timer)
  {
    id v3 = GetAudioLogForMNSpeechResourceControllerCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_1B542B000, v3, OS_LOG_TYPE_DEBUG, "ⓢ Stopping timer", v5, 2u);
    }

    [(NSTimer *)self->_timer invalidate];
    timer = self->_timer;
    self->_timer = 0;
  }
}

- (void)_cachingTimeoutOccurred:(id)a3
{
  BOOL v4 = GetAudioLogForMNSpeechResourceControllerCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl(&dword_1B542B000, v4, OS_LOG_TYPE_ERROR, "⒮ Synthesizer could not cache within specified time", v11, 2u);
  }

  [(MNSpeechResourceController *)self _cancelTimer];
  [(SiriTTSDaemonSession *)self->_session setKeepActive:0];
  id v5 = [(MNSpeechResourceController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    double v7 = (void *)MEMORY[0x1E4F28C58];
    double v8 = NAVAudioErrorDomain();
    double v9 = [v7 errorWithDomain:v8 code:3605 userInfo:0];

    id v10 = [(MNSpeechResourceController *)self delegate];
    [v10 speechResourceController:self didTimeoutWhileSpeakingUtterance:self->_utterance withError:v9];
  }
}

- (void)_speakingTimeoutOccurred:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = GetAudioLogForMNSpeechResourceControllerCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    [v4 timeInterval];
    int v13 = 134217984;
    uint64_t v14 = v6;
    _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_ERROR, "⒮ Synthesizer could not speak within specified time (%.3f) or nothing was spoken", (uint8_t *)&v13, 0xCu);
  }

  [(MNSpeechResourceController *)self _cancelTimer];
  [(SiriTTSDaemonSession *)self->_session setKeepActive:0];
  double v7 = [(MNSpeechResourceController *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    double v9 = (void *)MEMORY[0x1E4F28C58];
    id v10 = NAVAudioErrorDomain();
    id v11 = [v9 errorWithDomain:v10 code:3609 userInfo:0];

    id v12 = [(MNSpeechResourceController *)self delegate];
    [v12 speechResourceController:self didTimeoutWhileSpeakingUtterance:self->_utterance withError:v11];
  }
}

- (void)didFinishSynthesisRequest:(id)a3 withInstrumentMetrics:(id)a4 error:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = GetAudioLogForMNSpeechResourceControllerCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    session = self->_session;
    *(_DWORD *)buf = 136316162;
    v30 = "-[MNSpeechResourceController didFinishSynthesisRequest:withInstrumentMetrics:error:]";
    __int16 v31 = 2112;
    id v32 = session;
    __int16 v33 = 2112;
    id v34 = v8;
    __int16 v35 = 2112;
    id v36 = v9;
    __int16 v37 = 2112;
    id v38 = v10;
    _os_log_impl(&dword_1B542B000, v11, OS_LOG_TYPE_DEBUG, "%s : %@ : %@ : %@ : %@", buf, 0x34u);
  }

  [(MNSpeechResourceController *)self _cancelTimer];
  [v9 audioDuration];
  double v14 = v13;
  uint64_t v15 = [v8 text];
  [(SiriTTSDaemonSession *)self->_session setKeepActive:0];
  if (v10)
  {
    uint64_t v16 = GetAudioLogForMNSpeechResourceControllerCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v30 = (const char *)v8;
      __int16 v31 = 2112;
      id v32 = (SiriTTSDaemonSession *)v10;
      _os_log_impl(&dword_1B542B000, v16, OS_LOG_TYPE_ERROR, "⒮    Error while processing synthesis request : %@ - %@", buf, 0x16u);
    }

    int v17 = [(MNSpeechResourceController *)self delegate];
    char v18 = objc_opt_respondsToSelector();

    if (v18)
    {
      if ([v10 code] == 1) {
        uint64_t v19 = 3604;
      }
      else {
        uint64_t v19 = 3603;
      }
      int v20 = (void *)MEMORY[0x1E4F28C58];
      __int16 v21 = NAVAudioErrorDomain();
      uint64_t v27 = *MEMORY[0x1E4F28A50];
      id v28 = v10;
      uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
      uint64_t v23 = [v20 errorWithDomain:v21 code:v19 userInfo:v22];

      v24 = [(MNSpeechResourceController *)self delegate];
      [v24 speechResourceController:self didFailWhileCachingUtterance:v15 withError:v23];

      goto LABEL_13;
    }
  }
  else
  {
    [(MNSpeechResourceController *)self _addDurationToCache:v15 forUtterance:v14];
    [(MNSpeechResourceController *)self _updateEstimatorWithDuration:v15 andUtterance:v14];
    __int16 v25 = [(MNSpeechResourceController *)self delegate];
    char v26 = objc_opt_respondsToSelector();

    if (v26)
    {
      uint64_t v23 = [(MNSpeechResourceController *)self delegate];
      [v23 speechResourceController:self didCacheUtterance:v15 withDuration:v14];
LABEL_13:
    }
  }
}

- (void)didStartSpeakingRequest:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = GetAudioLogForMNSpeechResourceControllerCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    session = self->_session;
    int v11 = 136315650;
    id v12 = "-[MNSpeechResourceController didStartSpeakingRequest:]";
    __int16 v13 = 2112;
    double v14 = session;
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_DEBUG, "%s : %@ : %@", (uint8_t *)&v11, 0x20u);
  }

  double v7 = [(MNSpeechResourceController *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(MNSpeechResourceController *)self delegate];
    id v10 = [v4 text];
    [v9 speechResourceController:self willStartSpeakingUtterance:v10];
  }
}

- (void)didFinishSpeakingRequest:(id)a3 metrics:(id)a4 withError:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(MNSpeechResourceController *)self _cancelTimer];
  self->_currentlySpeaking = 0;
  utterance = self->_utterance;
  self->_utterance = 0;

  [(SiriTTSDaemonSession *)self->_session setKeepActive:0];
  if (!v10)
  {
    [v9 audioDuration];
    double v19 = v18;
    int v20 = [v8 text];
    __int16 v21 = GetAudioLogForMNSpeechResourceControllerCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      id v35 = v8;
      __int16 v36 = 2048;
      double v37 = v19;
      _os_log_impl(&dword_1B542B000, v21, OS_LOG_TYPE_DEFAULT, "Finished speech request (%p) in %0.1fs seconds.", buf, 0x16u);
    }

    [(MNSpeechResourceController *)self _addDurationToCache:v20 forUtterance:v19];
    [(MNSpeechResourceController *)self _updateEstimatorWithDuration:v20 andUtterance:v19];
    uint64_t v22 = [(MNSpeechResourceController *)self delegate];
    char v23 = objc_opt_respondsToSelector();

    if ((v23 & 1) == 0) {
      goto LABEL_18;
    }
    v24 = [(MNSpeechResourceController *)self delegate];
    [v24 speechResourceController:self didFinishSpeakingUtterance:v20 withDuration:v19];
LABEL_17:

LABEL_18:
    goto LABEL_19;
  }
  uint64_t v12 = [v10 code];
  __int16 v13 = GetAudioLogForMNSpeechResourceControllerCategory();
  double v14 = v13;
  if (v12 == 1)
  {
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    *(_DWORD *)buf = 134218242;
    id v35 = v8;
    __int16 v36 = 2112;
    double v37 = *(double *)&v10;
    __int16 v15 = "Cancelled speech request (%p): %@.";
    id v16 = v14;
    os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
  }
  else
  {
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    *(_DWORD *)buf = 134218242;
    id v35 = v8;
    __int16 v36 = 2112;
    double v37 = *(double *)&v10;
    __int16 v15 = "Finished speech request (%p) with error: %@.";
    id v16 = v14;
    os_log_type_t v17 = OS_LOG_TYPE_ERROR;
  }
  _os_log_impl(&dword_1B542B000, v16, v17, v15, buf, 0x16u);
LABEL_12:

  __int16 v25 = [(MNSpeechResourceController *)self delegate];
  char v26 = objc_opt_respondsToSelector();

  if (v26)
  {
    if ([v10 code] == 1) {
      uint64_t v27 = 3608;
    }
    else {
      uint64_t v27 = 3607;
    }
    id v28 = (void *)MEMORY[0x1E4F28C58];
    v29 = NAVAudioErrorDomain();
    uint64_t v32 = *MEMORY[0x1E4F28A50];
    id v33 = v10;
    v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
    int v20 = [v28 errorWithDomain:v29 code:v27 userInfo:v30];

    v24 = [(MNSpeechResourceController *)self delegate];
    __int16 v31 = [v8 text];
    [v24 speechResourceController:self didFailWhileSpeakingUtterance:v31 withError:v20];

    goto LABEL_17;
  }
LABEL_19:
}

- (void)_updateEstimatorWithDuration:(double)a3 andUtterance:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  double v7 = v6;
  BOOL v8 = a3 >= 1.0 && a3 <= 60.0;
  if (v8 && [v6 length])
  {
    id v9 = objc_msgSend(v7, "_navigation_stripTagsFromSpokenString");
    uint64_t v10 = [v9 length];

    unint64_t v11 = self->_charactersSpokenCount + v10;
    self->_unint64_t charactersSpokenCount = v11;
    double v12 = self->_charactersSpokenDuration + a3;
    self->_double charactersSpokenDuration = v12;
    if (v11 < 0x2711)
    {
      __int16 v13 = GetAudioLogForMNSpeechResourceControllerCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        unint64_t charactersSpokenCount = self->_charactersSpokenCount;
        double charactersSpokenDuration = self->_charactersSpokenDuration;
        int v19 = 134218240;
        unint64_t v20 = charactersSpokenCount;
        __int16 v21 = 2048;
        double v22 = charactersSpokenDuration;
        id v16 = "ⓢ Updated estimator: chars spoken %lu : duration %f";
        goto LABEL_12;
      }
    }
    else
    {
      self->_unint64_t charactersSpokenCount = v11 >> 1;
      self->_double charactersSpokenDuration = v12 * 0.5;
      __int16 v13 = GetAudioLogForMNSpeechResourceControllerCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        unint64_t v14 = self->_charactersSpokenCount;
        double v15 = self->_charactersSpokenDuration;
        int v19 = 134218240;
        unint64_t v20 = v14;
        __int16 v21 = 2048;
        double v22 = v15;
        id v16 = "ⓢ Updated estimator (clamped): chars spoken %lu : duration %f";
LABEL_12:
        _os_log_impl(&dword_1B542B000, v13, OS_LOG_TYPE_DEBUG, v16, (uint8_t *)&v19, 0x16u);
      }
    }
  }
}

- (void)_audioSessionInterruption:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKey:*MEMORY[0x1E4F4E868]];
  uint64_t v6 = [v5 integerValue];

  if (v6 == 1 && [(MNSpeechResourceController *)self speaking])
  {
    double v7 = GetAudioLogForMNSpeechResourceControllerCategory();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
    id v9 = (void *)MEMORY[0x1E4F4E858];
    if (v8)
    {
      uint64_t v10 = [v4 objectForKey:*MEMORY[0x1E4F4E858]];
      *(_DWORD *)buf = 138412290;
      uint64_t v23 = v10;
      _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_INFO, "ⓢ Media services were interrupted - %@", buf, 0xCu);
    }
    unint64_t v11 = self->_utterance;
    [(MNSpeechResourceController *)self stopSpeakingAndReport:0];
    double v12 = [(MNSpeechResourceController *)self delegate];
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      unint64_t v14 = (void *)MEMORY[0x1E4F28C58];
      double v15 = NAVAudioErrorDomain();
      id v16 = objc_msgSend(v4, "objectForKey:", *v9, *MEMORY[0x1E4F28A50]);
      __int16 v21 = v16;
      os_log_type_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
      double v18 = [v14 errorWithDomain:v15 code:0 userInfo:v17];

      int v19 = [(MNSpeechResourceController *)self delegate];
      [v19 speechResourceController:self wasInterruptedWhileSpeakingUtterance:v11 withError:v18];
    }
  }
}

- (void)_mediaSessionServicesWereReset:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend(MEMORY[0x1E4F4E9F0], "sharedInstance", a3);
  self->_unsigned int audioSessionID = [v4 opaqueSessionID];

  id v5 = GetAudioLogForMNSpeechResourceControllerCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    unsigned int audioSessionID = self->_audioSessionID;
    v7[0] = 67109120;
    v7[1] = audioSessionID;
    _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_INFO, "ⓢ Media services were reset. New session id: %d", (uint8_t *)v7, 8u);
  }
}

- (MNSpeechControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MNSpeechControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_durations, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_utterance, 0);
  objc_storeStrong((id *)&self->_cachedVoiceName, 0);
  objc_storeStrong((id *)&self->_cachedVoiceLanguage, 0);
  objc_storeStrong((id *)&self->_onGoingRequest, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end