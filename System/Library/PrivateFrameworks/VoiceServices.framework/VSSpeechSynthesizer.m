@interface VSSpeechSynthesizer
+ (BOOL)playVoicePreviewForLanguageCode:(id)a3 voiceName:(id)a4 previewType:(int64_t)a5 completion:(id)a6;
+ (VSSpeechSynthesizer)sharedInstance;
+ (id)characterClassCountForUtterance:(id)a3 language:(id)a4;
+ (id)errorWithReason:(id)a3;
+ (id)validateAudioCachingRequest:(id)a3;
+ (id)validateAudioRequest:(id)a3;
+ (id)validatePrewarmRequest:(id)a3;
+ (id)validateRequest:(id)a3;
+ (void)stopPlayingVoicePreview;
- (AFAudioPowerUpdater)audioPowerUpdater;
- (BOOL)STS_isSpeaking;
- (BOOL)continueSpeakingWithError:(id *)a3;
- (BOOL)getAveragePower:(float *)a3 andPeakPower:(float *)a4;
- (BOOL)isSpeaking;
- (BOOL)isSystemSpeaking;
- (BOOL)keepActive;
- (BOOL)pauseSpeakingAtNextBoundary:(int64_t)a3 synchronously:(BOOL)a4 error:(id *)a5;
- (BOOL)queryPhaticCapability:(id)a3;
- (BOOL)stopSpeakingAtNextBoundary:(int64_t)a3 synchronously:(BOOL)a4 error:(id *)a5;
- (BOOL)stopSpeakingPresynthesizedAudioSynchronously:(BOOL)a3 error:(id *)a4;
- (NSMutableDictionary)durationRequests;
- (NSMutableDictionary)stsRequestMapping;
- (NSString)language;
- (NSString)voice;
- (NSUUID)accessoryID;
- (OS_dispatch_queue)audioPowerUpdaterQueue;
- (SiriTTSDaemonSession)proxySession;
- (SiriTTSPreviewRequest)isPlayingPreview;
- (VSSpeechSynthesizer)init;
- (VSSpeechSynthesizer)initWithAccessoryID:(id)a3;
- (VSSpeechSynthesizerDelegate)delegate;
- (double)STS_estimateDurationOfRequest:(id)a3;
- (double)estimateDurationOfRequest:(id)a3;
- (float)maximumRate;
- (float)minimumRate;
- (float)pitch;
- (float)rate;
- (float)volume;
- (id)STS_prewarmRequest:(id)a3;
- (id)STS_signalInlineStreaming:(id)a3;
- (id)STS_startSpeakingAudioRequest:(id)a3;
- (id)STS_startSpeakingRequest:(id)a3;
- (id)STS_startSynthesizingRequest:(id)a3;
- (id)_continueSpeakingRequest;
- (id)_pauseSpeakingRequestAtNextBoundary:(int64_t)a3 synchronously:(BOOL)a4;
- (id)_stopSpeakingPresynthesizedAudioRequest:(id)a3 synchronously:(BOOL)a4;
- (id)_stopSpeakingRequest:(id)a3 atNextBoundary:(int64_t)a4 synchronously:(BOOL)a5;
- (id)availableFootprintsForVoice:(id)a3 languageCode:(id)a4;
- (id)availableLanguageCodes;
- (id)availableVoicesForLanguageCode:(id)a3;
- (id)cachePresynthesizedAudioRequest:(id)a3;
- (id)errorFromSTSError:(id)a3;
- (id)initForInputFeedback;
- (id)prewarmIfNeededWithRequest:(id)a3;
- (id)speechString;
- (id)startSpeakingPresynthesizedAudioRequest:(id)a3;
- (id)startSpeakingRequest:(id)a3;
- (id)startSynthesizingRequest:(id)a3;
- (void)STS_cancelAudioRequest:(id)a3;
- (void)STS_cancelRequest:(id)a3;
- (void)STS_downloadedVoicesMatching:(id)a3 reply:(id)a4;
- (void)STS_estimateDurationOfRequest:(id)a3 completion:(id)a4;
- (void)STS_forwardStreamObject:(id)a3;
- (void)STS_getSynthesisVoiceMatching:(id)a3 reply:(id)a4;
- (void)STS_queryPhaticCapabilityWithRequest:(id)a3 reply:(id)a4;
- (void)STS_subscribeVoices:(id)a3;
- (void)STS_subscribedVoices:(id)a3;
- (void)STS_subscribedVoicesWithClientID:(id)a3 reply:(id)a4;
- (void)STS_textToPhonemesWithRequest:(id)a3 phonemeSystem:(int64_t)a4 completion:(id)a5;
- (void)_setDelegate:(id)a3;
- (void)beginAudioPowerUpdateWithReply:(id)a3;
- (void)cancelAudioRequest:(id)a3;
- (void)cancelRequest:(id)a3;
- (void)cleanUnusedAssets:(id)a3;
- (void)connection:(id)a3 invalidatedWithError:(id)a4;
- (void)connection:(id)a3 presynthesizedAudioRequest:(id)a4 didStopAtEnd:(BOOL)a5 error:(id)a6;
- (void)connection:(id)a3 presynthesizedAudioRequest:(id)a4 successWithInstrumentMetrics:(id)a5 error:(id)a6;
- (void)connection:(id)a3 presynthesizedAudioRequestDidStart:(id)a4;
- (void)connection:(id)a3 speechRequest:(id)a4 didGenerateAudioChunk:(id)a5;
- (void)connection:(id)a3 speechRequest:(id)a4 didReceiveTimingInfo:(id)a5;
- (void)connection:(id)a3 speechRequest:(id)a4 didStopAtEnd:(BOOL)a5 phonemesSpoken:(id)a6 error:(id)a7;
- (void)connection:(id)a3 speechRequest:(id)a4 successWithInstrumentMetrics:(id)a5;
- (void)connection:(id)a3 speechRequest:(id)a4 willSpeakMark:(int64_t)a5 inRange:(_NSRange)a6;
- (void)connection:(id)a3 speechRequestDidContinue:(id)a4;
- (void)connection:(id)a3 speechRequestDidPause:(id)a4;
- (void)connection:(id)a3 speechRequestDidStart:(id)a4;
- (void)connection:(id)a3 synthesisRequest:(id)a4 didFinishWithInstrumentMetrics:(id)a5 error:(id)a6;
- (void)endAudioPowerUpdate;
- (void)estimateDurationOfRequest:(id)a3 completion:(id)a4;
- (void)forwardStreamObject:(id)a3;
- (void)getAllAutoDownloadedVoiceAssets:(id)a3;
- (void)getAutoDownloadedVoiceAssets:(id)a3;
- (void)getLocalVoiceAssets:(id)a3;
- (void)getLocalVoiceAssetsForLanguage:(id)a3 reply:(id)a4;
- (void)getLocalVoiceResources:(id)a3;
- (void)getVoiceInfoForLanguageCode:(id)a3 name:(id)a4 footprint:(int64_t)a5 gender:(int64_t)a6 type:(int64_t)a7 reply:(id)a8;
- (void)getVoiceInfoForLanguageCode:(id)a3 name:(id)a4 type:(int64_t)a5 footprint:(int64_t)a6 reply:(id)a7;
- (void)getVoiceResourceForLanguage:(id)a3 reply:(id)a4;
- (void)invokeDaemon:(id)a3;
- (void)killDaemon;
- (void)playVoicePreviewForLanguageCode:(id)a3 voiceName:(id)a4 previewType:(int64_t)a5 completion:(id)a6;
- (void)setAccessoryID:(id)a3;
- (void)setAudioPowerUpdater:(id)a3;
- (void)setAudioPowerUpdaterQueue:(id)a3;
- (void)setAutoDownloadedVoiceAssets:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDurationRequests:(id)a3;
- (void)setIsPlayingPreview:(id)a3;
- (void)setKeepActive:(BOOL)a3;
- (void)setLanguage:(id)a3;
- (void)setPitch:(float)a3;
- (void)setProxySession:(id)a3;
- (void)setRate:(float)a3;
- (void)setStsRequestMapping:(id)a3;
- (void)setVoice:(id)a3;
- (void)setVolume:(float)a3;
- (void)stopPlayingVoicePreview;
- (void)textToPhonemesWithRequest:(id)a3 phonemeSystem:(int64_t)a4 completion:(id)a5;
- (void)triggerCellularDownloadedVoiceAssets:(id)a3;
@end

@implementation VSSpeechSynthesizer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioPowerUpdater, 0);
  objc_storeStrong((id *)&self->_audioPowerUpdaterQueue, 0);
  objc_storeStrong((id *)&self->_stsRequestMapping, 0);
  objc_storeStrong((id *)&self->_proxySession, 0);
  objc_storeStrong((id *)&self->_durationRequests, 0);
  objc_storeStrong((id *)&self->_accessoryID, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_voice, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_clientBundleIdentifier, 0);
}

- (void)setIsPlayingPreview:(id)a3
{
  self->_isPlayingPreview = (SiriTTSPreviewRequest *)a3;
}

- (SiriTTSPreviewRequest)isPlayingPreview
{
  return self->_isPlayingPreview;
}

- (void)setAudioPowerUpdater:(id)a3
{
}

- (AFAudioPowerUpdater)audioPowerUpdater
{
  return self->_audioPowerUpdater;
}

- (void)setAudioPowerUpdaterQueue:(id)a3
{
}

- (OS_dispatch_queue)audioPowerUpdaterQueue
{
  return self->_audioPowerUpdaterQueue;
}

- (void)setStsRequestMapping:(id)a3
{
}

- (NSMutableDictionary)stsRequestMapping
{
  return self->_stsRequestMapping;
}

- (void)setProxySession:(id)a3
{
}

- (SiriTTSDaemonSession)proxySession
{
  return self->_proxySession;
}

- (void)setDurationRequests:(id)a3
{
}

- (NSMutableDictionary)durationRequests
{
  return self->_durationRequests;
}

- (void)setAccessoryID:(id)a3
{
}

- (NSUUID)accessoryID
{
  return self->_accessoryID;
}

- (void)setLanguage:(id)a3
{
}

- (NSString)language
{
  return self->_language;
}

- (void)setVoice:(id)a3
{
}

- (NSString)voice
{
  return self->_voice;
}

- (void)setVolume:(float)a3
{
  self->_volume = a3;
}

- (float)volume
{
  return self->_volume;
}

- (void)setPitch:(float)a3
{
  self->_pitch = a3;
}

- (float)pitch
{
  return self->_pitch;
}

- (void)setRate:(float)a3
{
  self->_rate = a3;
}

- (float)rate
{
  return self->_rate;
}

- (VSSpeechSynthesizerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VSSpeechSynthesizerDelegate *)WeakRetained;
}

- (id)availableFootprintsForVoice:(id)a3 languageCode:(id)a4
{
  return [(VSSpeechConnection *)self->_xpcConnection availableFootprintsForVoice:a3 languageCode:a4];
}

- (id)availableLanguageCodes
{
  if (+[VSFeatureFlags useSiriTTSServiceV2])
  {
    v2 = [MEMORY[0x263F74E48] availableLanguages];
  }
  else
  {
    v2 = VSPreferencesCopyAvailableOutputLanguageIdentifiers();
  }
  v3 = v2;
  v4 = [v2 allObjects];

  return v4;
}

- (id)availableVoicesForLanguageCode:(id)a3
{
  id v4 = a3;
  if (+[VSFeatureFlags useSiriTTSServiceV2])
  {
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    v6 = (void *)[objc_alloc(MEMORY[0x263F74EA0]) initWithLanguage:v4 name:0];
    v7 = [MEMORY[0x263EFF980] array];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __54__VSSpeechSynthesizer_availableVoicesForLanguageCode___block_invoke;
    v13[3] = &unk_2640E8AA0;
    id v8 = v7;
    id v14 = v8;
    dispatch_semaphore_t v15 = v5;
    v9 = v5;
    [(VSSpeechSynthesizer *)self STS_downloadedVoicesMatching:v6 reply:v13];
    dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_semaphore_t v10 = v15;
    id v11 = v8;
  }
  else
  {
    id v11 = [(VSSpeechConnection *)self->_xpcConnection availableVoicesForLanguageCode:v4];
  }

  return v11;
}

void __54__VSSpeechSynthesizer_availableVoicesForLanguageCode___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(a1 + 32);
        v9 = [*(id *)(*((void *)&v10 + 1) + 8 * v7) name];
        [v8 addObject:v9];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)getVoiceInfoForLanguageCode:(id)a3 name:(id)a4 type:(int64_t)a5 footprint:(int64_t)a6 reply:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  if (+[VSFeatureFlags useSiriTTSServiceV2])
  {
    uint64_t v15 = (void *)[objc_alloc(MEMORY[0x263F74EA0]) initWithLanguage:v12 name:v13];
    [v15 setFootprint:a6];
    [v15 setType:a5];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __77__VSSpeechSynthesizer_getVoiceInfoForLanguageCode_name_type_footprint_reply___block_invoke;
    v16[3] = &unk_2640E8A78;
    id v17 = v14;
    [(VSSpeechSynthesizer *)self STS_getSynthesisVoiceMatching:v15 reply:v16];
  }
  else
  {
    [(VSSpeechConnection *)self->_xpcConnection getVoiceInfoForLanguageCode:v12 name:v13 footprint:a6 gender:0 type:a5 reply:v14];
  }
}

uint64_t __77__VSSpeechSynthesizer_getVoiceInfoForLanguageCode_name_type_footprint_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getVoiceInfoForLanguageCode:(id)a3 name:(id)a4 footprint:(int64_t)a5 gender:(int64_t)a6 type:(int64_t)a7 reply:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a8;
  if (+[VSFeatureFlags useSiriTTSServiceV2])
  {
    id v17 = (void *)[objc_alloc(MEMORY[0x263F74EA0]) initWithLanguage:v14 name:v15];
    [v17 setFootprint:a5];
    [v17 setType:a7];
    [(VSSpeechSynthesizer *)self STS_getSynthesisVoiceMatching:v17 reply:v16];
  }
  else
  {
    xpcConnection = self->_xpcConnection;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __84__VSSpeechSynthesizer_getVoiceInfoForLanguageCode_name_footprint_gender_type_reply___block_invoke;
    v19[3] = &unk_2640E8A50;
    id v20 = v16;
    [(VSSpeechConnection *)xpcConnection getVoiceInfoForLanguageCode:v14 name:v15 footprint:a5 gender:a6 type:a7 reply:v19];
  }
}

uint64_t __84__VSSpeechSynthesizer_getVoiceInfoForLanguageCode_name_footprint_gender_type_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getAllAutoDownloadedVoiceAssets:(id)a3
{
  id v4 = a3;
  if (+[VSFeatureFlags useSiriTTSServiceV2]) {
    [(VSSpeechSynthesizer *)self STS_subscribedVoicesWithClientID:0 reply:v4];
  }
  else {
    [(VSSpeechConnection *)self->_xpcConnection getAllVoiceSubscriptionsWithReply:v4];
  }
}

- (void)getAutoDownloadedVoiceAssets:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  if (+[VSFeatureFlags useSiriTTSServiceV2])
  {
    [(VSSpeechSynthesizer *)self STS_subscribedVoices:v4];
  }
  else
  {
    clientBundleIdentifier = self->_clientBundleIdentifier;
    if (clientBundleIdentifier)
    {
      [(VSSpeechConnection *)self->_xpcConnection getSubscribedVoiceAssetsWithClientID:clientBundleIdentifier forAccessoryID:self->_accessoryID reply:v4];
    }
    else
    {
      uint64_t v6 = VSGetLogDefault();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v7 = 0;
        _os_log_error_impl(&dword_20CABC000, v6, OS_LOG_TYPE_ERROR, "Ignore get voice subscription due to null clientId.", v7, 2u);
      }

      v4[2](v4, 0);
    }
  }
}

- (void)triggerCellularDownloadedVoiceAssets:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = a3;
  uint64_t v3 = [obj countByEnumeratingWithState:&v22 objects:v38 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v23;
    *(void *)&long long v4 = 138544642;
    long long v18 = v4;
    do
    {
      uint64_t v7 = 0;
      uint64_t v20 = v5;
      do
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v22 + 1) + 8 * v7);
        v9 = VSGetLogDefault();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = v6;
          clientBundleIdentifier = self->_clientBundleIdentifier;
          id v12 = [v8 languages];
          id v13 = [v12 firstObject];
          uint64_t v14 = [v8 gender];
          uint64_t v15 = [v8 type];
          uint64_t v16 = [v8 footprint];
          id v17 = [v8 name];
          *(_DWORD *)buf = v18;
          v27 = clientBundleIdentifier;
          uint64_t v6 = v10;
          uint64_t v5 = v20;
          __int16 v28 = 2114;
          v29 = v13;
          __int16 v30 = 2048;
          uint64_t v31 = v14;
          __int16 v32 = 2048;
          uint64_t v33 = v15;
          __int16 v34 = 2048;
          uint64_t v35 = v16;
          __int16 v36 = 2114;
          v37 = v17;
          _os_log_impl(&dword_20CABC000, v9, OS_LOG_TYPE_DEFAULT, "Request to download with cellular, client: %{public}@, language: %{public}@, gender: %ld, type: %ld, footprint: %ld, name: %{public}@", buf, 0x3Eu);
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [obj countByEnumeratingWithState:&v22 objects:v38 count:16];
    }
    while (v5);
  }
  -[VSSpeechConnection triggerCellularDownloadedVoiceAssets:withClientID:](self->_xpcConnection, "triggerCellularDownloadedVoiceAssets:withClientID:", obj, self->_clientBundleIdentifier, v18);
}

- (void)setAutoDownloadedVoiceAssets:(id)a3
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (+[VSFeatureFlags useSiriTTSServiceV2])
  {
    [(VSSpeechSynthesizer *)self STS_subscribeVoices:v4];
    goto LABEL_42;
  }
  uint64_t v5 = VSGetLogEvent();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    clientBundleIdentifier = self->_clientBundleIdentifier;
    accessoryID = self->_accessoryID;
    id v8 = __52__VSSpeechSynthesizer_setAutoDownloadedVoiceAssets___block_invoke(v4);
    *(_DWORD *)buf = 138543874;
    v62 = clientBundleIdentifier;
    __int16 v63 = 2112;
    v64 = accessoryID;
    __int16 v65 = 2112;
    v66 = v8;
    _os_log_impl(&dword_20CABC000, v5, OS_LOG_TYPE_DEFAULT, "#VoiceSubscription, client: %{public}@, accessory: %@, requested voices: %@", buf, 0x20u);
  }
  if (self->_clientBundleIdentifier)
  {
    v40 = self;
    v9 = [MEMORY[0x263EFF980] array];
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v41 = v4;
    id v10 = v4;
    uint64_t v45 = [v10 countByEnumeratingWithState:&v55 objects:v60 count:16];
    if (!v45) {
      goto LABEL_36;
    }
    v43 = v9;
    uint64_t v44 = *(void *)v56;
    id v42 = v10;
    while (1)
    {
      for (uint64_t i = 0; i != v45; ++i)
      {
        if (*(void *)v56 != v44) {
          objc_enumerationMutation(v10);
        }
        id v12 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        long long v51 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        id v13 = v10;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v51 objects:v59 count:16];
        if (!v14)
        {

LABEL_33:
          [v9 addObject:v12];
          continue;
        }
        uint64_t v15 = v14;
        uint64_t v46 = i;
        char v47 = 0;
        uint64_t v16 = *(void *)v52;
        do
        {
          uint64_t v17 = 0;
          uint64_t v48 = v15;
          do
          {
            if (*(void *)v52 != v16) {
              objc_enumerationMutation(v13);
            }
            long long v18 = *(void **)(*((void *)&v51 + 1) + 8 * v17);
            if (v18 != v12)
            {
              v19 = [v12 languages];
              uint64_t v20 = [v19 firstObject];
              v50 = v18;
              if (v20)
              {
                v21 = (void *)v20;
                long long v22 = [v18 languages];
                long long v23 = [v22 firstObject];
                [v12 languages];
                uint64_t v24 = v16;
                long long v25 = v12;
                v27 = id v26 = v13;
                __int16 v28 = [v27 firstObject];
                int v49 = [v23 isEqualToString:v28];

                id v13 = v26;
                id v12 = v25;
                uint64_t v16 = v24;
                uint64_t v15 = v48;

                if (!v49) {
                  goto LABEL_28;
                }
              }
              else
              {
              }
              uint64_t v29 = [v12 name];
              if (!v29) {
                goto LABEL_45;
              }
              __int16 v30 = (void *)v29;
              uint64_t v31 = [v50 name];
              __int16 v32 = [v12 name];
              int v33 = [v31 isEqualToString:v32];

              if (v33)
              {
LABEL_45:
                if (![v12 type] || (uint64_t v34 = objc_msgSend(v50, "type"), v34 == objc_msgSend(v12, "type")))
                {
                  if (![v12 footprint]
                    || (uint64_t v35 = [v50 footprint], v35 == objc_msgSend(v12, "footprint")))
                  {
                    char v47 = 1;
                  }
                }
              }
            }
LABEL_28:
            ++v17;
          }
          while (v15 != v17);
          uint64_t v15 = [v13 countByEnumeratingWithState:&v51 objects:v59 count:16];
        }
        while (v15);

        id v10 = v42;
        v9 = v43;
        uint64_t i = v46;
        if ((v47 & 1) == 0) {
          goto LABEL_33;
        }
      }
      uint64_t v45 = [v13 countByEnumeratingWithState:&v55 objects:v60 count:16];
      if (!v45)
      {
LABEL_36:

        __int16 v36 = VSGetLogEvent();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          v37 = v40->_clientBundleIdentifier;
          v38 = v40->_accessoryID;
          uint64_t v39 = __52__VSSpeechSynthesizer_setAutoDownloadedVoiceAssets___block_invoke(v9);
          *(_DWORD *)buf = 138543874;
          v62 = v37;
          __int16 v63 = 2112;
          v64 = v38;
          __int16 v65 = 2112;
          v66 = v39;
          _os_log_impl(&dword_20CABC000, v36, OS_LOG_TYPE_DEFAULT, "#VoiceSubscription, client: %{public}@, accessory: %@, deduped voices: %@", buf, 0x20u);
        }
        [(VSSpeechConnection *)v40->_xpcConnection setSubscribedVoiceAssets:v9 withClientID:v40->_clientBundleIdentifier forAccessoryID:v40->_accessoryID];
        id v4 = v41;
        goto LABEL_41;
      }
    }
  }
  v9 = VSGetLogDefault();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_20CABC000, v9, OS_LOG_TYPE_ERROR, "Ignore voice subscription due to null clientId.", buf, 2u);
  }
LABEL_41:

LABEL_42:
}

id __52__VSSpeechSynthesizer_setAutoDownloadedVoiceAssets___block_invoke(void *a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v16 = [MEMORY[0x263EFF980] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = v1;
  uint64_t v2 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v15 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v6 = NSString;
        uint64_t v7 = [v5 languages];
        id v8 = [v7 firstObject];
        v9 = [v5 name];
        id v10 = +[VSVoiceAsset typeStringFromType:](VSVoiceAsset, "typeStringFromType:", [v5 type]);
        long long v11 = +[VSVoiceAsset footprintStringFromFootprint:](VSVoiceAsset, "footprintStringFromFootprint:", [v5 footprint]);
        id v12 = [v6 stringWithFormat:@"%@:%@:%@:%@", v8, v9, v10, v11];
        [v16 addObject:v12];
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v3);
  }

  return v16;
}

- (void)getVoiceResourceForLanguage:(id)a3 reply:(id)a4
{
}

- (void)getLocalVoiceResources:(id)a3
{
}

- (void)getLocalVoiceAssetsForLanguage:(id)a3 reply:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (+[VSFeatureFlags useSiriTTSServiceV2])
  {
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F74EA0]) initWithLanguage:v8 name:0];
    [(VSSpeechSynthesizer *)self STS_downloadedVoicesMatching:v7 reply:v6];
  }
  else
  {
    [(VSSpeechConnection *)self->_xpcConnection getLocalVoiceAssetsForLanguage:v8 reply:v6];
  }
}

- (void)getLocalVoiceAssets:(id)a3
{
  id v4 = a3;
  if (+[VSFeatureFlags useSiriTTSServiceV2]) {
    [(VSSpeechSynthesizer *)self STS_downloadedVoicesMatching:0 reply:v4];
  }
  else {
    [(VSSpeechConnection *)self->_xpcConnection getLocalVoiceAssetsForLanguage:0 reply:v4];
  }
}

- (void)cleanUnusedAssets:(id)a3
{
  id v4 = a3;
  if (!+[VSFeatureFlags useSiriTTSServiceV2]) {
    [(VSSpeechConnection *)self->_xpcConnection cleanUnusedAssets:v4];
  }
}

- (BOOL)getAveragePower:(float *)a3 andPeakPower:(float *)a4
{
  uint64_t v7 = [(VSSpeechSynthesizer *)self isPlayingPreview];

  if (v7) {
    return 0;
  }
  uint64_t v23 = 0;
  uint64_t v24 = (float *)&v23;
  uint64_t v25 = 0x2020000000;
  int v26 = -1024458752;
  uint64_t v19 = 0;
  long long v20 = (float *)&v19;
  uint64_t v21 = 0x2020000000;
  int v22 = -1024458752;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  proxySession = self->_proxySession;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __52__VSSpeechSynthesizer_getAveragePower_andPeakPower___block_invoke;
  v15[3] = &unk_2640E8A28;
  long long v17 = &v23;
  long long v18 = &v19;
  long long v11 = v9;
  id v16 = v11;
  [(SiriTTSDaemonSession *)proxySession getAudioPower:v15];
  dispatch_time_t v12 = dispatch_time(0, 500000000);
  intptr_t v13 = dispatch_semaphore_wait(v11, v12);
  *a3 = v24[6];
  *a4 = v20[6];
  BOOL v8 = v13 == 0;

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);
  return v8;
}

intptr_t __52__VSSpeechSynthesizer_getAveragePower_andPeakPower___block_invoke(uint64_t a1, float a2, float a3)
{
  *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  *(float *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)endAudioPowerUpdate
{
  [(AFAudioPowerUpdater *)self->_audioPowerUpdater endUpdate];
  audioPowerUpdaterQueue = self->_audioPowerUpdaterQueue;
  self->_audioPowerUpdaterQueue = 0;

  audioPowerUpdater = self->_audioPowerUpdater;
  self->_audioPowerUpdater = 0;
}

- (void)beginAudioPowerUpdateWithReply:(id)a3
{
  id v4 = a3;
  uint64_t v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  id v6 = (OS_dispatch_queue *)dispatch_queue_create("VSAudioPowerUpdateQueue", v5);
  audioPowerUpdaterQueue = self->_audioPowerUpdaterQueue;
  self->_audioPowerUpdaterQueue = v6;

  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x2050000000;
  BOOL v8 = (void *)getAFAudioPowerUpdaterClass_softClass;
  uint64_t v20 = getAFAudioPowerUpdaterClass_softClass;
  if (!getAFAudioPowerUpdaterClass_softClass)
  {
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __getAFAudioPowerUpdaterClass_block_invoke;
    v16[3] = &unk_2640E8AE0;
    void v16[4] = &v17;
    __getAFAudioPowerUpdaterClass_block_invoke((uint64_t)v16);
    BOOL v8 = (void *)v18[3];
  }
  dispatch_semaphore_t v9 = v8;
  _Block_object_dispose(&v17, 8);
  id v10 = (AFAudioPowerUpdater *)[[v9 alloc] initWithProvider:self queue:self->_audioPowerUpdaterQueue frequency:1 delegate:0];
  audioPowerUpdater = self->_audioPowerUpdater;
  self->_audioPowerUpdater = v10;

  [(AFAudioPowerUpdater *)self->_audioPowerUpdater beginUpdate];
  dispatch_time_t v12 = self->_audioPowerUpdater;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __54__VSSpeechSynthesizer_beginAudioPowerUpdateWithReply___block_invoke;
  v14[3] = &unk_2640E8A00;
  id v15 = v4;
  id v13 = v4;
  [(AFAudioPowerUpdater *)v12 createNewXPCWrapperWithCompletion:v14];
}

uint64_t __54__VSSpeechSynthesizer_beginAudioPowerUpdateWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)killDaemon
{
}

- (void)invokeDaemon:(id)a3
{
}

- (void)forwardStreamObject:(id)a3
{
  id v4 = a3;
  if (+[VSFeatureFlags useSiriTTSService]) {
    [(VSSpeechSynthesizer *)self STS_forwardStreamObject:v4];
  }
  else {
    [(VSSpeechConnection *)self->_xpcConnection forwardStreamObject:v4];
  }
}

- (void)connection:(id)a3 invalidatedWithError:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    BOOL v8 = VSGetLogDefault();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      identifier = self->_identifier;
      int v11 = 138412290;
      dispatch_time_t v12 = identifier;
      _os_log_impl(&dword_20CABC000, v8, OS_LOG_TYPE_INFO, "Notify daemon crash from: %@", (uint8_t *)&v11, 0xCu);
    }

    id v10 = objc_loadWeakRetained((id *)&self->_delegate);
    [v10 speechSynthesizer:self daemonDidCrashWithError:v5];
  }
}

- (void)connection:(id)a3 presynthesizedAudioRequest:(id)a4 successWithInstrumentMetrics:(id)a5 error:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    callbackQueue = self->_callbackQueue;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __96__VSSpeechSynthesizer_connection_presynthesizedAudioRequest_successWithInstrumentMetrics_error___block_invoke;
    v15[3] = &unk_2640E8938;
    void v15[4] = self;
    id v16 = v9;
    id v17 = v10;
    id v18 = v11;
    dispatch_async(callbackQueue, v15);
  }
}

void __96__VSSpeechSynthesizer_connection_presynthesizedAudioRequest_successWithInstrumentMetrics_error___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 64));
  [WeakRetained speechSynthesizer:a1[4] didFinishPresynthesizedAudioRequest:a1[5] withInstrumentMetrics:a1[6] error:a1[7]];
}

- (void)connection:(id)a3 presynthesizedAudioRequest:(id)a4 didStopAtEnd:(BOOL)a5 error:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  uint64_t v11 = [v9 stopHandler];
  dispatch_time_t v12 = (void *)v11;
  if (v11)
  {
    (*(void (**)(uint64_t))(v11 + 16))(v11);
    [v9 setStopHandler:0];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    callbackQueue = self->_callbackQueue;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __80__VSSpeechSynthesizer_connection_presynthesizedAudioRequest_didStopAtEnd_error___block_invoke;
    v16[3] = &unk_2640E89D8;
    void v16[4] = self;
    id v17 = v9;
    BOOL v19 = a5;
    id v18 = v10;
    dispatch_async(callbackQueue, v16);
  }
}

void __80__VSSpeechSynthesizer_connection_presynthesizedAudioRequest_didStopAtEnd_error___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
  [WeakRetained speechSynthesizer:*(void *)(a1 + 32) didStopPresynthesizedAudioRequest:*(void *)(a1 + 40) atEnd:*(unsigned __int8 *)(a1 + 56) error:*(void *)(a1 + 48)];
}

- (void)connection:(id)a3 presynthesizedAudioRequestDidStart:(id)a4
{
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    callbackQueue = self->_callbackQueue;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __69__VSSpeechSynthesizer_connection_presynthesizedAudioRequestDidStart___block_invoke;
    v9[3] = &unk_2640E8BA0;
    v9[4] = self;
    id v10 = v5;
    dispatch_async(callbackQueue, v9);
  }
}

void __69__VSSpeechSynthesizer_connection_presynthesizedAudioRequestDidStart___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
  [WeakRetained speechSynthesizer:*(void *)(a1 + 32) didStartPresynthesizedAudioRequest:*(void *)(a1 + 40)];
}

- (void)connection:(id)a3 synthesisRequest:(id)a4 didFinishWithInstrumentMetrics:(id)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  char v14 = [MEMORY[0x263F08D40] valueWithNonretainedObject:v11];
  id v15 = [(VSSpeechSynthesizer *)self durationRequests];
  id v16 = [v15 objectForKey:v14];

  if (v16)
  {
    id v17 = [v16 completion];
    ((void (**)(void, id, id, id))v17)[2](v17, v11, v12, v13);

    id v18 = [(VSSpeechSynthesizer *)self durationRequests];
    [v18 removeObjectForKey:v14];
  }
  else
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __88__VSSpeechSynthesizer_connection_synthesisRequest_didFinishWithInstrumentMetrics_error___block_invoke;
    block[3] = &unk_2640E89B0;
    id v21 = v10;
    int v22 = self;
    id v23 = v11;
    id v24 = v12;
    id v25 = v13;
    dispatch_async(queue, block);
  }
}

void __88__VSSpeechSynthesizer_connection_synthesisRequest_didFinishWithInstrumentMetrics_error___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v2 = VSGetLogDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    id v17 = "-[VSSpeechSynthesizer connection:synthesisRequest:didFinishWithInstrumentMetrics:error:]_block_invoke";
    __int16 v18 = 2112;
    uint64_t v19 = v3;
    _os_log_impl(&dword_20CABC000, v2, OS_LOG_TYPE_INFO, "%s, callback received in framework. %@", buf, 0x16u);
  }

  uint64_t v4 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32) == *(void *)(v4 + 32))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v4 + 64));
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      uint64_t v8 = *(void *)(a1 + 40);
      id v9 = *(NSObject **)(v8 + 24);
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __88__VSSpeechSynthesizer_connection_synthesisRequest_didFinishWithInstrumentMetrics_error___block_invoke_395;
      v12[3] = &unk_2640E8938;
      v12[4] = v8;
      id v13 = *(id *)(a1 + 48);
      id v14 = *(id *)(a1 + 56);
      id v15 = *(id *)(a1 + 64);
      dispatch_async(v9, v12);
    }
  }
  else
  {
    id v5 = VSGetLogDefault();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      id v11 = *(const char **)(*(void *)(a1 + 40) + 32);
      *(_DWORD *)buf = 138412546;
      id v17 = v11;
      __int16 v18 = 2112;
      uint64_t v19 = v10;
      _os_log_error_impl(&dword_20CABC000, v5, OS_LOG_TYPE_ERROR, "Current xpc connection %@ does not match %@", buf, 0x16u);
    }
  }
}

void __88__VSSpeechSynthesizer_connection_synthesisRequest_didFinishWithInstrumentMetrics_error___block_invoke_395(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 64));
  [WeakRetained speechSynthesizer:a1[4] didFinishSynthesisRequest:a1[5] withInstrumentMetrics:a1[6] error:a1[7]];
}

- (void)connection:(id)a3 speechRequest:(id)a4 didGenerateAudioChunk:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __70__VSSpeechSynthesizer_connection_speechRequest_didGenerateAudioChunk___block_invoke;
  v15[3] = &unk_2640E8938;
  id v16 = v8;
  id v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

void __70__VSSpeechSynthesizer_connection_speechRequest_didGenerateAudioChunk___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32) == *(void *)(v1 + 32) && (*(_WORD *)(v1 + 48) & 0x40) != 0)
  {
    uint64_t v3 = *(NSObject **)(v1 + 24);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __70__VSSpeechSynthesizer_connection_speechRequest_didGenerateAudioChunk___block_invoke_2;
    block[3] = &unk_2640E88C0;
    void block[4] = v1;
    id v5 = *(id *)(a1 + 48);
    id v6 = *(id *)(a1 + 56);
    dispatch_async(v3, block);
  }
}

void __70__VSSpeechSynthesizer_connection_speechRequest_didGenerateAudioChunk___block_invoke_2(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 64));
  [WeakRetained speechSynthesizer:a1[4] withSynthesisRequest:a1[5] didGenerateAudioChunk:a1[6]];
}

- (void)connection:(id)a3 speechRequest:(id)a4 willSpeakMark:(int64_t)a5 inRange:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  id v10 = a3;
  id v11 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__VSSpeechSynthesizer_connection_speechRequest_willSpeakMark_inRange___block_invoke;
  block[3] = &unk_2640E8988;
  id v16 = v10;
  id v17 = self;
  NSUInteger v19 = location;
  NSUInteger v20 = length;
  id v18 = v11;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(queue, block);
}

void __70__VSSpeechSynthesizer_connection_speechRequest_willSpeakMark_inRange___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32) == *(void *)(v1 + 32) && (*(_WORD *)(v1 + 48) & 0x20) != 0)
  {
    uint64_t v2 = *(NSObject **)(v1 + 24);
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __70__VSSpeechSynthesizer_connection_speechRequest_willSpeakMark_inRange___block_invoke_2;
    v3[3] = &unk_2640E8960;
    v3[4] = v1;
    long long v5 = *(_OWORD *)(a1 + 56);
    id v4 = *(id *)(a1 + 48);
    dispatch_async(v2, v3);
  }
}

void __70__VSSpeechSynthesizer_connection_speechRequest_willSpeakMark_inRange___block_invoke_2(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 64));
  objc_msgSend(WeakRetained, "speechSynthesizer:willSpeakRangeOfSpeechString:forRequest:", a1[4], a1[6], a1[7], a1[5]);
}

- (void)connection:(id)a3 speechRequest:(id)a4 didReceiveTimingInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __69__VSSpeechSynthesizer_connection_speechRequest_didReceiveTimingInfo___block_invoke;
  v15[3] = &unk_2640E8938;
  id v16 = v8;
  id v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

void __69__VSSpeechSynthesizer_connection_speechRequest_didReceiveTimingInfo___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32) == *(void *)(v1 + 32))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v1 + 64));
    char v4 = objc_opt_respondsToSelector();

    if (v4)
    {
      uint64_t v5 = *(void *)(a1 + 40);
      id v6 = *(NSObject **)(v5 + 24);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __69__VSSpeechSynthesizer_connection_speechRequest_didReceiveTimingInfo___block_invoke_2;
      block[3] = &unk_2640E88C0;
      void block[4] = v5;
      id v8 = *(id *)(a1 + 48);
      id v9 = *(id *)(a1 + 56);
      dispatch_async(v6, block);
    }
  }
}

void __69__VSSpeechSynthesizer_connection_speechRequest_didReceiveTimingInfo___block_invoke_2(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 64));
  [WeakRetained speechSynthesizer:a1[4] withRequest:a1[5] didReceiveTimingInfo:a1[6]];
}

- (void)connection:(id)a3 speechRequest:(id)a4 successWithInstrumentMetrics:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __77__VSSpeechSynthesizer_connection_speechRequest_successWithInstrumentMetrics___block_invoke;
  v15[3] = &unk_2640E8938;
  id v16 = v8;
  id v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

void __77__VSSpeechSynthesizer_connection_speechRequest_successWithInstrumentMetrics___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32) == *(void *)(v1 + 32) && (*(_WORD *)(v1 + 48) & 4) != 0)
  {
    uint64_t v3 = *(NSObject **)(v1 + 24);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __77__VSSpeechSynthesizer_connection_speechRequest_successWithInstrumentMetrics___block_invoke_2;
    block[3] = &unk_2640E88C0;
    void block[4] = v1;
    id v5 = *(id *)(a1 + 48);
    id v6 = *(id *)(a1 + 56);
    dispatch_async(v3, block);
  }
}

void __77__VSSpeechSynthesizer_connection_speechRequest_successWithInstrumentMetrics___block_invoke_2(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 64));
  [WeakRetained speechSynthesizer:a1[4] didFinishSpeakingRequest:a1[5] withInstrumentMetrics:a1[6]];
}

- (void)connection:(id)a3 speechRequest:(id)a4 didStopAtEnd:(BOOL)a5 phonemesSpoken:(id)a6 error:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  uint64_t v16 = [v13 stopHandler];
  id v17 = (void *)v16;
  if (v16)
  {
    (*(void (**)(uint64_t))(v16 + 16))(v16);
    [v13 setStopHandler:0];
  }
  queue = self->_queue;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __82__VSSpeechSynthesizer_connection_speechRequest_didStopAtEnd_phonemesSpoken_error___block_invoke;
  v23[3] = &unk_2640E8910;
  id v24 = v12;
  id v25 = self;
  BOOL v29 = a5;
  id v26 = v13;
  id v27 = v14;
  id v28 = v15;
  id v19 = v15;
  id v20 = v14;
  id v21 = v13;
  id v22 = v12;
  dispatch_async(queue, v23);
}

void __82__VSSpeechSynthesizer_connection_speechRequest_didStopAtEnd_phonemesSpoken_error___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v2 = VSGetLogDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    id v15 = "-[VSSpeechSynthesizer connection:speechRequest:didStopAtEnd:phonemesSpoken:error:]_block_invoke";
    __int16 v16 = 2112;
    uint64_t v17 = v3;
    _os_log_impl(&dword_20CABC000, v2, OS_LOG_TYPE_INFO, "%s, callback received in framework. %@", buf, 0x16u);
  }

  uint64_t v4 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32) == *(void *)(v4 + 32))
  {
    if ((*(_WORD *)(v4 + 48) & 2) != 0)
    {
      id v6 = *(NSObject **)(v4 + 24);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __82__VSSpeechSynthesizer_connection_speechRequest_didStopAtEnd_phonemesSpoken_error___block_invoke_393;
      block[3] = &unk_2640E88E8;
      void block[4] = v4;
      id v10 = *(id *)(a1 + 48);
      char v13 = *(unsigned char *)(a1 + 72);
      id v11 = *(id *)(a1 + 56);
      id v12 = *(id *)(a1 + 64);
      dispatch_async(v6, block);
    }
  }
  else
  {
    id v5 = VSGetLogDefault();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      id v8 = *(const char **)(*(void *)(a1 + 40) + 32);
      *(_DWORD *)buf = 138412546;
      id v15 = v8;
      __int16 v16 = 2112;
      uint64_t v17 = v7;
      _os_log_error_impl(&dword_20CABC000, v5, OS_LOG_TYPE_ERROR, "Current xpc connection %@ does not match %@", buf, 0x16u);
    }
  }
}

void __82__VSSpeechSynthesizer_connection_speechRequest_didStopAtEnd_phonemesSpoken_error___block_invoke_393(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
  [WeakRetained speechSynthesizer:*(void *)(a1 + 32) didFinishSpeakingRequest:*(void *)(a1 + 40) successfully:*(unsigned __int8 *)(a1 + 64) phonemesSpoken:*(void *)(a1 + 48) withError:*(void *)(a1 + 56)];
}

- (void)connection:(id)a3 speechRequestDidContinue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__VSSpeechSynthesizer_connection_speechRequestDidContinue___block_invoke;
  block[3] = &unk_2640E88C0;
  id v12 = v6;
  char v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __59__VSSpeechSynthesizer_connection_speechRequestDidContinue___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32) == *(void *)(v1 + 32) && (*(_WORD *)(v1 + 48) & 0x10) != 0)
  {
    uint64_t v2 = *(NSObject **)(v1 + 24);
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __59__VSSpeechSynthesizer_connection_speechRequestDidContinue___block_invoke_2;
    v3[3] = &unk_2640E8BA0;
    v3[4] = v1;
    id v4 = *(id *)(a1 + 48);
    dispatch_async(v2, v3);
  }
}

void __59__VSSpeechSynthesizer_connection_speechRequestDidContinue___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
  [WeakRetained speechSynthesizer:*(void *)(a1 + 32) didContinueSpeakingRequest:*(void *)(a1 + 40)];
}

- (void)connection:(id)a3 speechRequestDidPause:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 pauseHandler];
  id v9 = (void *)v8;
  if (v8)
  {
    (*(void (**)(uint64_t))(v8 + 16))(v8);
    [v7 setPauseHandler:0];
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__VSSpeechSynthesizer_connection_speechRequestDidPause___block_invoke;
  block[3] = &unk_2640E88C0;
  id v14 = v6;
  id v15 = self;
  id v16 = v7;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(queue, block);
}

void __56__VSSpeechSynthesizer_connection_speechRequestDidPause___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32) == *(void *)(v1 + 32) && (*(_WORD *)(v1 + 48) & 8) != 0)
  {
    uint64_t v2 = *(NSObject **)(v1 + 24);
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __56__VSSpeechSynthesizer_connection_speechRequestDidPause___block_invoke_2;
    v3[3] = &unk_2640E8BA0;
    v3[4] = v1;
    id v4 = *(id *)(a1 + 48);
    dispatch_async(v2, v3);
  }
}

void __56__VSSpeechSynthesizer_connection_speechRequestDidPause___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
  [WeakRetained speechSynthesizer:*(void *)(a1 + 32) didPauseSpeakingRequest:*(void *)(a1 + 40)];
}

- (void)connection:(id)a3 speechRequestDidStart:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__VSSpeechSynthesizer_connection_speechRequestDidStart___block_invoke;
  block[3] = &unk_2640E88C0;
  id v12 = v6;
  char v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __56__VSSpeechSynthesizer_connection_speechRequestDidStart___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32) == *(void *)(v1 + 32) && (*(_WORD *)(v1 + 48) & 1) != 0)
  {
    uint64_t v2 = *(NSObject **)(v1 + 24);
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __56__VSSpeechSynthesizer_connection_speechRequestDidStart___block_invoke_2;
    v3[3] = &unk_2640E8BA0;
    v3[4] = v1;
    id v4 = *(id *)(a1 + 48);
    dispatch_async(v2, v3);
  }
}

void __56__VSSpeechSynthesizer_connection_speechRequestDidStart___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
  [WeakRetained speechSynthesizer:*(void *)(a1 + 32) didStartSpeakingRequest:*(void *)(a1 + 40)];
}

- (void)textToPhonemesWithRequest:(id)a3 phonemeSystem:(int64_t)a4 completion:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = (void (**)(id, __CFString *, void *))a5;
  if (+[VSFeatureFlags useSiriTTSService])
  {
    [(VSSpeechSynthesizer *)self STS_textToPhonemesWithRequest:v8 phonemeSystem:a4 completion:v9];
  }
  else
  {
    id v10 = +[VSSpeechSynthesizer validateRequest:v8];
    if (v10)
    {
      id v11 = VSGetLogDefault();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        clientBundleIdentifier = self->_clientBundleIdentifier;
        *(_DWORD *)buf = 138543874;
        id v20 = clientBundleIdentifier;
        __int16 v21 = 2112;
        id v22 = v8;
        __int16 v23 = 2112;
        id v24 = v10;
        _os_log_error_impl(&dword_20CABC000, v11, OS_LOG_TYPE_ERROR, "Invalid #TTPRequest from client %{public}@: %@, error: %@", buf, 0x20u);
      }

      if (v9) {
        v9[2](v9, &stru_26C1B0528, v10);
      }
    }
    else
    {
      queue = self->_queue;
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __74__VSSpeechSynthesizer_textToPhonemesWithRequest_phonemeSystem_completion___block_invoke;
      v14[3] = &unk_2640E8898;
      id v15 = v8;
      id v16 = self;
      int64_t v18 = a4;
      uint64_t v17 = v9;
      dispatch_async(queue, v14);
    }
  }
}

void __74__VSSpeechSynthesizer_textToPhonemesWithRequest_phonemeSystem_completion___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) setRequestCreatedTimestamp:mach_absolute_time()];
  uint64_t v2 = VSGetLogDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) requestCreatedTimestamp];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    *(_DWORD *)buf = 134218242;
    uint64_t v12 = v3;
    __int16 v13 = 2114;
    uint64_t v14 = v4;
    _os_log_impl(&dword_20CABC000, v2, OS_LOG_TYPE_DEFAULT, "Start #TTPRequest %llu from client %{public}@", buf, 0x16u);
  }

  id v5 = *(void **)(a1 + 32);
  id v6 = *(void **)(*(void *)(a1 + 40) + 32);
  uint64_t v7 = *(void *)(a1 + 56);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __74__VSSpeechSynthesizer_textToPhonemesWithRequest_phonemeSystem_completion___block_invoke_392;
  v8[3] = &unk_2640E8870;
  id v9 = v5;
  id v10 = *(id *)(a1 + 48);
  [v6 startPhonemesRequest:v9 phonemeSystem:v7 reply:v8];
}

void __74__VSSpeechSynthesizer_textToPhonemesWithRequest_phonemeSystem_completion___block_invoke_392(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = VSGetLogDefault();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412290;
      uint64_t v13 = (uint64_t)v6;
      _os_log_error_impl(&dword_20CABC000, v8, OS_LOG_TYPE_ERROR, "Error #TTPRequest %@", (uint8_t *)&v12, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [*(id *)(a1 + 32) requestCreatedTimestamp];
    id v10 = [*(id *)(a1 + 32) logText];
    int v12 = 134218498;
    uint64_t v13 = v9;
    __int16 v14 = 2112;
    id v15 = v5;
    __int16 v16 = 2114;
    uint64_t v17 = v10;
    _os_log_impl(&dword_20CABC000, v8, OS_LOG_TYPE_DEFAULT, "#TTPRequest %llu Received phonemes: %@, for text: %{public}@", (uint8_t *)&v12, 0x20u);
  }
  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(uint64_t, id, id))(v11 + 16))(v11, v5, v6);
  }
}

- (void)estimateDurationOfRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (+[VSFeatureFlags useSiriTTSServiceV2])
  {
    [(VSSpeechSynthesizer *)self STS_estimateDurationOfRequest:v6 completion:v7];
  }
  else
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __60__VSSpeechSynthesizer_estimateDurationOfRequest_completion___block_invoke;
    block[3] = &unk_2640E8E28;
    id v10 = v6;
    uint64_t v11 = self;
    id v12 = v7;
    dispatch_sync(queue, block);
  }
}

void __60__VSSpeechSynthesizer_estimateDurationOfRequest_completion___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = VSGetLogDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) logText];
    *(_DWORD *)buf = 138412290;
    id v10 = v3;
    _os_log_impl(&dword_20CABC000, v2, OS_LOG_TYPE_DEFAULT, "#EstimateDuration Request text: %@", buf, 0xCu);
  }
  [*(id *)(a1 + 32) setFootprint:1];
  [*(id *)(a1 + 32) setVoiceType:1];
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = *(void **)(*(void *)(a1 + 40) + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __60__VSSpeechSynthesizer_estimateDurationOfRequest_completion___block_invoke_387;
  v6[3] = &unk_2640E8848;
  id v7 = v4;
  id v8 = *(id *)(a1 + 48);
  [v5 estimateDurationWithRequest:v7 reply:v6];
}

void __60__VSSpeechSynthesizer_estimateDurationOfRequest_completion___block_invoke_387(uint64_t a1, void *a2, double a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  if (v5)
  {
    id v6 = VSGetLogDefault();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315394;
      uint64_t v11 = "-[VSSpeechSynthesizer estimateDurationOfRequest:completion:]_block_invoke";
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_error_impl(&dword_20CABC000, v6, OS_LOG_TYPE_ERROR, "Error %s, %@", (uint8_t *)&v10, 0x16u);
    }
  }
  id v7 = VSGetLogDefault();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [*(id *)(a1 + 32) logText];
    int v10 = 134218242;
    uint64_t v11 = *(const char **)&a3;
    __int16 v12 = 2112;
    id v13 = v8;
    _os_log_impl(&dword_20CABC000, v7, OS_LOG_TYPE_DEFAULT, "#EstimateDuration Received duration: %.2f, for text: %@", (uint8_t *)&v10, 0x16u);
  }
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, id, double))(v9 + 16))(v9, v5, a3);
  }
}

- (double)estimateDurationOfRequest:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (+[VSFeatureFlags useSiriTTSServiceV2])
  {
    [(VSSpeechSynthesizer *)self STS_estimateDurationOfRequest:v4];
    double v6 = v5;
  }
  else
  {
    id v7 = VSGetLogDefault();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v4 logText];
      int v26 = 138412290;
      double v27 = *(double *)&v8;
      _os_log_impl(&dword_20CABC000, v7, OS_LOG_TYPE_DEFAULT, "#RoughEstimateDuration Request utterance: %@", (uint8_t *)&v26, 0xCu);
    }
    uint64_t v9 = [v4 languageCode];
    uint64_t v10 = [&unk_26C1BAFD0 objectForKeyedSubscript:v9];
    if (v10) {
      goto LABEL_9;
    }
    if ((unint64_t)[(__CFString *)v9 length] >= 3)
    {
      uint64_t v11 = -[__CFString substringWithRange:](v9, "substringWithRange:", 0, 2);

      uint64_t v9 = (__CFString *)v11;
    }
    uint64_t v10 = [&unk_26C1BAFD0 objectForKeyedSubscript:v9];
    if (v10)
    {
LABEL_9:
      __int16 v12 = (void *)v10;
    }
    else
    {

      uint64_t v9 = @"generic";
      __int16 v12 = &unk_26C1BAB18;
    }
    id v13 = [v4 text];
    uint64_t v14 = [v4 languageCode];
    id v15 = +[VSSpeechSynthesizer characterClassCountForUtterance:v13 language:v14];

    __int16 v16 = [v15 firstObject];
    [v16 doubleValue];
    double v6 = v17 / 1000.0;
    if ((unint64_t)[v15 count] >= 2)
    {
      unint64_t v18 = 1;
      do
      {
        id v19 = [v15 objectAtIndexedSubscript:v18];
        double v20 = (double)(unint64_t)[v19 unsignedIntegerValue];
        __int16 v21 = [v12 objectAtIndexedSubscript:v18 - 1];
        [v21 doubleValue];
        double v6 = v6 + v20 * v22;

        ++v18;
      }
      while (v18 < [v15 count]);
    }
    __int16 v23 = VSGetLogDefault();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      id v24 = [v4 logText];
      int v26 = 134218498;
      double v27 = v6;
      __int16 v28 = 2112;
      BOOL v29 = v9;
      __int16 v30 = 2112;
      uint64_t v31 = v24;
      _os_log_impl(&dword_20CABC000, v23, OS_LOG_TYPE_DEFAULT, "#RoughEstimateDuration calculated duration: %.2f, using %@ locale, for text: %@", (uint8_t *)&v26, 0x20u);
    }
  }

  return v6;
}

- (id)_continueSpeakingRequest
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(VSSpeechConnection *)self->_xpcConnection currentRequest];
  id v4 = VSGetLogDefault();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      uint64_t v6 = [v3 requestCreatedTimestamp];
      clientBundleIdentifier = self->_clientBundleIdentifier;
      int v10 = 134218242;
      uint64_t v11 = v6;
      __int16 v12 = 2114;
      id v13 = clientBundleIdentifier;
      _os_log_impl(&dword_20CABC000, v4, OS_LOG_TYPE_DEFAULT, "Resume #SpeechRequest %llu from client %{public}@", (uint8_t *)&v10, 0x16u);
    }

    [(VSSpeechConnection *)self->_xpcConnection continueSpeechRequest:v3];
  }
  else
  {
    if (v5)
    {
      id v8 = self->_clientBundleIdentifier;
      int v10 = 138543362;
      uint64_t v11 = (uint64_t)v8;
      _os_log_impl(&dword_20CABC000, v4, OS_LOG_TYPE_DEFAULT, "Resume #SpeechRequest from client %{public}@ was ignored, no request to resume", (uint8_t *)&v10, 0xCu);
    }
  }
  return 0;
}

- (float)maximumRate
{
  return 4.0;
}

- (float)minimumRate
{
  return 0.5;
}

- (id)speechString
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__2824;
  int v10 = __Block_byref_object_dispose__2825;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __35__VSSpeechSynthesizer_speechString__block_invoke;
  v5[3] = &unk_2640E8820;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __35__VSSpeechSynthesizer_speechString__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 32) currentRequest];
  id v3 = [v5 text];
  id v4 = v3;
  if (!v3)
  {
    uint64_t v1 = [v5 attributedText];
    id v4 = [v1 string];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v4);
  if (!v3)
  {
  }
}

- (BOOL)isSystemSpeaking
{
  if (+[VSFeatureFlags useSiriTTSService])
  {
    return [(VSSpeechSynthesizer *)self STS_isSpeaking];
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v8 = &v7;
    uint64_t v9 = 0x2020000000;
    char v10 = 0;
    queue = self->_queue;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __39__VSSpeechSynthesizer_isSystemSpeaking__block_invoke;
    v6[3] = &unk_2640E8820;
    void v6[4] = self;
    v6[5] = &v7;
    dispatch_sync(queue, v6);
    char v5 = *((unsigned char *)v8 + 24);
    _Block_object_dispose(&v7, 8);
    return v5;
  }
}

uint64_t __39__VSSpeechSynthesizer_isSystemSpeaking__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 32) isSystemSpeaking];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)isSpeaking
{
  if (+[VSFeatureFlags useSiriTTSService])
  {
    return [(VSSpeechSynthesizer *)self STS_isSpeaking];
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v8 = &v7;
    uint64_t v9 = 0x2020000000;
    char v10 = 0;
    queue = self->_queue;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __33__VSSpeechSynthesizer_isSpeaking__block_invoke;
    v6[3] = &unk_2640E8820;
    void v6[4] = self;
    v6[5] = &v7;
    dispatch_sync(queue, v6);
    char v5 = *((unsigned char *)v8 + 24);
    _Block_object_dispose(&v7, 8);
    return v5;
  }
}

uint64_t __33__VSSpeechSynthesizer_isSpeaking__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 32) isSystemSpeakingOnBehalfOfCurrentConnection];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)continueSpeakingWithError:(id *)a3
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__2824;
  __int16 v12 = __Block_byref_object_dispose__2825;
  id v13 = 0;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__VSSpeechSynthesizer_continueSpeakingWithError___block_invoke;
  v7[3] = &unk_2640E8820;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(queue, v7);
  if (a3) {
    *a3 = (id) v9[5];
  }
  BOOL v5 = v9[5] == 0;
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __49__VSSpeechSynthesizer_continueSpeakingWithError___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _continueSpeakingRequest];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)pauseSpeakingAtNextBoundary:(int64_t)a3 synchronously:(BOOL)a4 error:(id *)a5
{
  uint64_t v11 = 0;
  __int16 v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__2824;
  id v15 = __Block_byref_object_dispose__2825;
  id v16 = 0;
  queue = self->_queue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __71__VSSpeechSynthesizer_pauseSpeakingAtNextBoundary_synchronously_error___block_invoke;
  v9[3] = &unk_2640E87D0;
  v9[4] = self;
  void v9[5] = &v11;
  v9[6] = a3;
  BOOL v10 = a4;
  dispatch_sync(queue, v9);
  if (a5) {
    *a5 = (id) v12[5];
  }
  BOOL v7 = v12[5] == 0;
  _Block_object_dispose(&v11, 8);

  return v7;
}

void __71__VSSpeechSynthesizer_pauseSpeakingAtNextBoundary_synchronously_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _pauseSpeakingRequestAtNextBoundary:*(void *)(a1 + 48) synchronously:*(unsigned __int8 *)(a1 + 56)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)stopSpeakingPresynthesizedAudioSynchronously:(BOOL)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (+[VSFeatureFlags useSiriTTSService])
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    BOOL v7 = [(NSMutableDictionary *)self->_stsRequestMapping allValues];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v24 != v10) {
            objc_enumerationMutation(v7);
          }
          [(SiriTTSDaemonSession *)self->_proxySession cancelWithRequest:*(void *)(*((void *)&v23 + 1) + 8 * i)];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v9);
    }

    return 1;
  }
  else
  {
    uint64_t v17 = 0;
    unint64_t v18 = &v17;
    uint64_t v19 = 0x3032000000;
    double v20 = __Block_byref_object_copy__2824;
    __int16 v21 = __Block_byref_object_dispose__2825;
    id v22 = 0;
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __74__VSSpeechSynthesizer_stopSpeakingPresynthesizedAudioSynchronously_error___block_invoke;
    block[3] = &unk_2640E87F8;
    void block[4] = self;
    void block[5] = &v17;
    BOOL v16 = a3;
    dispatch_sync(queue, block);
    if (a4) {
      *a4 = (id) v18[5];
    }
    BOOL v12 = v18[5] == 0;
    _Block_object_dispose(&v17, 8);
  }
  return v12;
}

void __74__VSSpeechSynthesizer_stopSpeakingPresynthesizedAudioSynchronously_error___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(id **)(a1 + 32);
  uint64_t v3 = [v2[4] currentAudioRequest];
  uint64_t v4 = [v2 _stopSpeakingPresynthesizedAudioRequest:v3 synchronously:*(unsigned __int8 *)(a1 + 48)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    BOOL v7 = VSGetLogDefault();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      int v9 = 138412290;
      uint64_t v10 = v8;
      _os_log_error_impl(&dword_20CABC000, v7, OS_LOG_TYPE_ERROR, "Error Stop #PresynthesizedAudioRequest %@", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (BOOL)stopSpeakingAtNextBoundary:(int64_t)a3 synchronously:(BOOL)a4 error:(id *)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (+[VSFeatureFlags useSiriTTSService])
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    int v9 = [(NSMutableDictionary *)self->_stsRequestMapping allValues];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v26 != v12) {
            objc_enumerationMutation(v9);
          }
          [(SiriTTSDaemonSession *)self->_proxySession cancelWithRequest:*(void *)(*((void *)&v25 + 1) + 8 * i)];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v11);
    }

    return 1;
  }
  else
  {
    uint64_t v19 = 0;
    double v20 = &v19;
    uint64_t v21 = 0x3032000000;
    id v22 = __Block_byref_object_copy__2824;
    long long v23 = __Block_byref_object_dispose__2825;
    id v24 = 0;
    queue = self->_queue;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __70__VSSpeechSynthesizer_stopSpeakingAtNextBoundary_synchronously_error___block_invoke;
    v17[3] = &unk_2640E87D0;
    v17[4] = self;
    v17[5] = &v19;
    v17[6] = a3;
    BOOL v18 = a4;
    dispatch_sync(queue, v17);
    if (a5) {
      *a5 = (id) v20[5];
    }
    BOOL v14 = v20[5] == 0;
    _Block_object_dispose(&v19, 8);
  }
  return v14;
}

void __70__VSSpeechSynthesizer_stopSpeakingAtNextBoundary_synchronously_error___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(id **)(a1 + 32);
  uint64_t v3 = [v2[4] currentRequest];
  uint64_t v4 = [v2 _stopSpeakingRequest:v3 atNextBoundary:*(void *)(a1 + 48) synchronously:*(unsigned __int8 *)(a1 + 56)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    BOOL v7 = VSGetLogDefault();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      int v9 = 138412290;
      uint64_t v10 = v8;
      _os_log_error_impl(&dword_20CABC000, v7, OS_LOG_TYPE_ERROR, "Error Stop #SpeechRequest %@", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)cancelAudioRequest:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (+[VSFeatureFlags useSiriTTSService])
  {
    [(VSSpeechSynthesizer *)self STS_cancelAudioRequest:v4];
  }
  else if (v4)
  {
    queue = self->_queue;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __42__VSSpeechSynthesizer_cancelAudioRequest___block_invoke;
    v8[3] = &unk_2640E8BA0;
    id v9 = v4;
    uint64_t v10 = self;
    dispatch_sync(queue, v8);
  }
  else
  {
    uint64_t v6 = VSGetLogDefault();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      clientBundleIdentifier = self->_clientBundleIdentifier;
      *(_DWORD *)buf = 138543362;
      uint64_t v12 = clientBundleIdentifier;
      _os_log_impl(&dword_20CABC000, v6, OS_LOG_TYPE_DEFAULT, "Cancel #PresynthesizedAudioRequest from client %{public}@ was ignored, no request to stop", buf, 0xCu);
    }
  }
}

uint64_t __42__VSSpeechSynthesizer_cancelAudioRequest___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v2 = VSGetLogDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) requestCreatedTimestamp];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    int v6 = 134218242;
    uint64_t v7 = v3;
    __int16 v8 = 2114;
    uint64_t v9 = v4;
    _os_log_impl(&dword_20CABC000, v2, OS_LOG_TYPE_DEFAULT, "Cancel #PresynthesizedAudioRequest %llu from client %{public}@", (uint8_t *)&v6, 0x16u);
  }

  return [*(id *)(*(void *)(a1 + 40) + 32) stopPresynthesizedAudioRequest:*(void *)(a1 + 32)];
}

- (void)cancelRequest:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (+[VSFeatureFlags useSiriTTSService])
  {
    [(VSSpeechSynthesizer *)self STS_cancelRequest:v4];
  }
  else if (v4)
  {
    queue = self->_queue;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __37__VSSpeechSynthesizer_cancelRequest___block_invoke;
    v8[3] = &unk_2640E8BA0;
    id v9 = v4;
    uint64_t v10 = self;
    dispatch_sync(queue, v8);
  }
  else
  {
    int v6 = VSGetLogDefault();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      clientBundleIdentifier = self->_clientBundleIdentifier;
      *(_DWORD *)buf = 138543362;
      uint64_t v12 = clientBundleIdentifier;
      _os_log_impl(&dword_20CABC000, v6, OS_LOG_TYPE_DEFAULT, "Cancel #SpeechRequest from client %{public}@ was ignored, no request to stop", buf, 0xCu);
    }
  }
}

uint64_t __37__VSSpeechSynthesizer_cancelRequest___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v2 = VSGetLogDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) requestCreatedTimestamp];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    int v6 = 134218242;
    uint64_t v7 = v3;
    __int16 v8 = 2114;
    uint64_t v9 = v4;
    _os_log_impl(&dword_20CABC000, v2, OS_LOG_TYPE_DEFAULT, "Cancel #SpeechRequest %llu from client %{public}@", (uint8_t *)&v6, 0x16u);
  }

  return [*(id *)(*(void *)(a1 + 40) + 32) stopSpeechRequest:*(void *)(a1 + 32) atMark:0];
}

- (id)cachePresynthesizedAudioRequest:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (+[VSFeatureFlags useSiriTTSService])
  {
    uint64_t v5 = [(VSSpeechSynthesizer *)self STS_signalInlineStreaming:v4];
  }
  else
  {
    uint64_t v5 = +[VSSpeechSynthesizer validateAudioCachingRequest:v4];
    if (v5)
    {
      int v6 = VSGetLogDefault();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v14 = v4;
        __int16 v15 = 2112;
        BOOL v16 = v5;
        _os_log_error_impl(&dword_20CABC000, v6, OS_LOG_TYPE_ERROR, "Invalid #AudioCachingRequest: %@, error: %@", buf, 0x16u);
      }

      id v7 = v5;
    }
    else
    {
      queue = self->_queue;
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __55__VSSpeechSynthesizer_cachePresynthesizedAudioRequest___block_invoke;
      v10[3] = &unk_2640E8BA0;
      id v11 = v4;
      uint64_t v12 = self;
      dispatch_sync(queue, v10);
    }
  }

  return v5;
}

uint64_t __55__VSSpeechSynthesizer_cachePresynthesizedAudioRequest___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) setRequestCreatedTimestamp:mach_absolute_time()];
  [*(id *)(a1 + 32) setClientBundleIdentifier:*(void *)(*(void *)(a1 + 40) + 8)];
  [*(id *)(a1 + 32) setAccessoryID:*(void *)(*(void *)(a1 + 40) + 88)];
  uint64_t v2 = VSGetLogDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) requestCreatedTimestamp];
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 134218242;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl(&dword_20CABC000, v2, OS_LOG_TYPE_DEFAULT, "Cache #PresynthesizedAudioRequest %llu: %@", (uint8_t *)&v6, 0x16u);
  }

  return [*(id *)(*(void *)(a1 + 40) + 32) cachePresynthesizedAudioRequest:*(void *)(a1 + 32)];
}

- (id)startSpeakingPresynthesizedAudioRequest:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (+[VSFeatureFlags useSiriTTSService])
  {
    uint64_t v5 = [(VSSpeechSynthesizer *)self STS_startSpeakingAudioRequest:v4];
  }
  else
  {
    uint64_t v5 = +[VSSpeechSynthesizer validateAudioRequest:v4];
    if (v5)
    {
      int v6 = VSGetLogDefault();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v14 = v4;
        __int16 v15 = 2112;
        BOOL v16 = v5;
        _os_log_error_impl(&dword_20CABC000, v6, OS_LOG_TYPE_ERROR, "Invalid #PresynthesizedAudioRequest: %@, error: %@", buf, 0x16u);
      }

      id v7 = v5;
    }
    else
    {
      queue = self->_queue;
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __63__VSSpeechSynthesizer_startSpeakingPresynthesizedAudioRequest___block_invoke;
      v10[3] = &unk_2640E8BA0;
      id v11 = v4;
      uint64_t v12 = self;
      dispatch_sync(queue, v10);
    }
  }

  return v5;
}

uint64_t __63__VSSpeechSynthesizer_startSpeakingPresynthesizedAudioRequest___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) setRequestCreatedTimestamp:mach_absolute_time()];
  [*(id *)(a1 + 32) setClientBundleIdentifier:*(void *)(*(void *)(a1 + 40) + 8)];
  uint64_t v2 = [*(id *)(a1 + 32) audioSessionID];
  if (v2)
  {
    [*(id *)(a1 + 32) setAudioSessionID:v2];
  }
  else
  {
    uint64_t v3 = [MEMORY[0x263EF93E0] sharedInstance];
    objc_msgSend(*(id *)(a1 + 32), "setAudioSessionID:", objc_msgSend(v3, "opaqueSessionID"));
  }
  [*(id *)(a1 + 32) setAccessoryID:*(void *)(*(void *)(a1 + 40) + 88)];
  id v4 = VSGetLogDefault();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [*(id *)(a1 + 32) requestCreatedTimestamp];
    uint64_t v6 = *(void *)(a1 + 32);
    int v8 = 134218242;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_20CABC000, v4, OS_LOG_TYPE_DEFAULT, "Start #PresynthesizedAudioRequest %llu: %@", (uint8_t *)&v8, 0x16u);
  }

  return [*(id *)(*(void *)(a1 + 40) + 32) startPresynthesizedAudioRequest:*(void *)(a1 + 32)];
}

- (id)startSpeakingRequest:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (+[VSFeatureFlags useSiriTTSService])
  {
    uint64_t v5 = [(VSSpeechSynthesizer *)self STS_startSpeakingRequest:v4];
  }
  else
  {
    uint64_t v5 = +[VSSpeechSynthesizer validateRequest:v4];
    if (v5)
    {
      uint64_t v6 = VSGetLogDefault();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v14 = v4;
        __int16 v15 = 2112;
        BOOL v16 = v5;
        _os_log_error_impl(&dword_20CABC000, v6, OS_LOG_TYPE_ERROR, "Invalid #SpeechRequest: %@, error: %@", buf, 0x16u);
      }

      id v7 = v5;
    }
    else
    {
      queue = self->_queue;
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __44__VSSpeechSynthesizer_startSpeakingRequest___block_invoke;
      v10[3] = &unk_2640E8BA0;
      id v11 = v4;
      uint64_t v12 = self;
      dispatch_sync(queue, v10);
    }
  }

  return v5;
}

uint64_t __44__VSSpeechSynthesizer_startSpeakingRequest___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  kdebug_trace();
  [*(id *)(a1 + 32) setRequestCreatedTimestamp:mach_absolute_time()];
  [*(id *)(a1 + 32) setClientBundleIdentifier:*(void *)(*(void *)(a1 + 40) + 8)];
  [*(id *)(a1 + 32) setAccessoryID:*(void *)(*(void *)(a1 + 40) + 88)];
  uint64_t v2 = [*(id *)(a1 + 32) audioSessionID];
  if (v2)
  {
    [*(id *)(a1 + 32) setAudioSessionID:v2];
  }
  else
  {
    uint64_t v3 = [MEMORY[0x263EF93E0] sharedInstance];
    objc_msgSend(*(id *)(a1 + 32), "setAudioSessionID:", objc_msgSend(v3, "opaqueSessionID"));
  }
  id v4 = VSGetLogDefault();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [*(id *)(a1 + 32) requestCreatedTimestamp];
    uint64_t v6 = [*(id *)(a1 + 32) clientBundleIdentifier];
    uint64_t v7 = *(void *)(a1 + 32);
    int v9 = 134218498;
    uint64_t v10 = v5;
    __int16 v11 = 2114;
    uint64_t v12 = v6;
    __int16 v13 = 2114;
    uint64_t v14 = v7;
    _os_log_impl(&dword_20CABC000, v4, OS_LOG_TYPE_DEFAULT, "Start #SpeechRequest %llu from client %{public}@, %{public}@", (uint8_t *)&v9, 0x20u);
  }
  return [*(id *)(*(void *)(a1 + 40) + 32) startSpeechRequest:*(void *)(a1 + 32)];
}

- (id)startSynthesizingRequest:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (+[VSFeatureFlags useSiriTTSService])
  {
    uint64_t v5 = [(VSSpeechSynthesizer *)self STS_startSynthesizingRequest:v4];
  }
  else
  {
    uint64_t v5 = +[VSSpeechSynthesizer validateRequest:v4];
    if (v5)
    {
      uint64_t v6 = VSGetLogDefault();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v14 = v4;
        __int16 v15 = 2112;
        BOOL v16 = v5;
        _os_log_error_impl(&dword_20CABC000, v6, OS_LOG_TYPE_ERROR, "Invalid #SynthesisRequest: %@, error: %@", buf, 0x16u);
      }

      id v7 = v5;
    }
    else
    {
      queue = self->_queue;
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __48__VSSpeechSynthesizer_startSynthesizingRequest___block_invoke;
      v10[3] = &unk_2640E8BA0;
      id v11 = v4;
      uint64_t v12 = self;
      dispatch_sync(queue, v10);
    }
  }

  return v5;
}

uint64_t __48__VSSpeechSynthesizer_startSynthesizingRequest___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  kdebug_trace();
  [*(id *)(a1 + 32) setRequestCreatedTimestamp:mach_absolute_time()];
  [*(id *)(a1 + 32) setClientBundleIdentifier:*(void *)(*(void *)(a1 + 40) + 8)];
  [*(id *)(a1 + 32) setAccessoryID:*(void *)(*(void *)(a1 + 40) + 88)];
  [*(id *)(a1 + 32) setShouldStreamAudioData:(*(unsigned __int16 *)(*(void *)(a1 + 40) + 48) >> 6) & 1];
  uint64_t v2 = VSGetLogDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) requestCreatedTimestamp];
    id v4 = [*(id *)(a1 + 32) clientBundleIdentifier];
    uint64_t v5 = *(void *)(a1 + 32);
    int v7 = 134218498;
    uint64_t v8 = v3;
    __int16 v9 = 2114;
    uint64_t v10 = v4;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    _os_log_impl(&dword_20CABC000, v2, OS_LOG_TYPE_DEFAULT, "Start #SynthesisRequest %llu from client %{public}@, %@", (uint8_t *)&v7, 0x20u);
  }
  return [*(id *)(*(void *)(a1 + 40) + 32) startSynthesisRequest:*(void *)(a1 + 32)];
}

- (BOOL)keepActive
{
  BOOL v3 = +[VSFeatureFlags useSiriTTSService];
  uint64_t v4 = 32;
  if (v3) {
    uint64_t v4 = 104;
  }
  uint64_t v5 = *(Class *)((char *)&self->super.isa + v4);
  return [v5 keepActive];
}

- (void)setKeepActive:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = +[VSFeatureFlags useSiriTTSService];
  uint64_t v6 = 32;
  if (v5) {
    uint64_t v6 = 104;
  }
  int v7 = *(Class *)((char *)&self->super.isa + v6);
  [v7 setKeepActive:v3];
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __35__VSSpeechSynthesizer_setDelegate___block_invoke;
  v7[3] = &unk_2640E8BA0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __35__VSSpeechSynthesizer_setDelegate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setDelegate:*(void *)(a1 + 40)];
}

- (id)_pauseSpeakingRequestAtNextBoundary:(int64_t)a3 synchronously:(BOOL)a4
{
  BOOL v4 = a4;
  userInfoValues[1] = *(void **)MEMORY[0x263EF8340];
  int v7 = [(VSSpeechConnection *)self->_xpcConnection currentRequest];
  id v8 = VSGetLogDefault();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      uint64_t v10 = [v7 requestCreatedTimestamp];
      clientBundleIdentifier = self->_clientBundleIdentifier;
      uint64_t v12 = [NSNumber numberWithInteger:a3];
      *(_DWORD *)buf = 134218754;
      *(void *)&uint8_t buf[4] = v10;
      __int16 v21 = 2114;
      id v22 = clientBundleIdentifier;
      __int16 v23 = 2112;
      id v24 = v12;
      __int16 v25 = 1024;
      BOOL v26 = v4;
      _os_log_impl(&dword_20CABC000, v8, OS_LOG_TYPE_DEFAULT, "Pause #SpeechRequest %llu from client %{public}@, boundary: %@, synchronously: %{BOOL}d", buf, 0x26u);
    }
    if (v4)
    {
      dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __73__VSSpeechSynthesizer__pauseSpeakingRequestAtNextBoundary_synchronously___block_invoke;
      v18[3] = &unk_2640E8B78;
      id v8 = v13;
      uint64_t v19 = v8;
      [v7 setPauseHandler:v18];
    }
    else
    {
      id v8 = 0;
    }
    [(VSSpeechConnection *)self->_xpcConnection pauseSpeechRequest:v7 atMark:a3 == 1];
    if (v8)
    {
      dispatch_time_t v15 = dispatch_time(0, 1000000000);
      if (dispatch_semaphore_wait(v8, v15))
      {
        *(void *)buf = *MEMORY[0x263EFFC48];
        userInfoValues[0] = @"pause request timeout";
        CFErrorRef v16 = CFErrorCreateWithUserInfoKeysAndValues(0, @"VSErrorDomain", -4004, (const void *const *)buf, (const void *const *)userInfoValues, 1);
        goto LABEL_13;
      }
    }
  }
  else if (v9)
  {
    id v14 = self->_clientBundleIdentifier;
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v14;
    _os_log_impl(&dword_20CABC000, v8, OS_LOG_TYPE_DEFAULT, "Pause #SpeechRequest from client %{public}@ was ignored, no request to pause", buf, 0xCu);
  }
  CFErrorRef v16 = 0;
LABEL_13:

  return v16;
}

intptr_t __73__VSSpeechSynthesizer__pauseSpeakingRequestAtNextBoundary_synchronously___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_stopSpeakingRequest:(id)a3 atNextBoundary:(int64_t)a4 synchronously:(BOOL)a5
{
  BOOL v5 = a5;
  userInfoValues[1] = *(void **)MEMORY[0x263EF8340];
  id v8 = a3;
  BOOL v9 = VSGetLogDefault();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      uint64_t v11 = [v8 requestCreatedTimestamp];
      clientBundleIdentifier = self->_clientBundleIdentifier;
      dispatch_semaphore_t v13 = [NSNumber numberWithInteger:a4];
      *(_DWORD *)buf = 134218754;
      *(void *)&uint8_t buf[4] = v11;
      __int16 v22 = 2114;
      __int16 v23 = clientBundleIdentifier;
      __int16 v24 = 2112;
      __int16 v25 = v13;
      __int16 v26 = 1024;
      BOOL v27 = v5;
      _os_log_impl(&dword_20CABC000, v9, OS_LOG_TYPE_DEFAULT, "Stop #SpeechRequest %llu from client %{public}@, boundary: %@, synchronously: %{BOOL}d", buf, 0x26u);
    }
    if (v5)
    {
      dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __73__VSSpeechSynthesizer__stopSpeakingRequest_atNextBoundary_synchronously___block_invoke;
      v19[3] = &unk_2640E8B78;
      BOOL v9 = v14;
      double v20 = v9;
      [v8 setStopHandler:v19];
    }
    else
    {
      BOOL v9 = 0;
    }
    [(VSSpeechConnection *)self->_xpcConnection stopSpeechRequest:v8 atMark:a4 == 1];
    if (v9)
    {
      dispatch_time_t v16 = dispatch_time(0, 1000000000);
      if (dispatch_semaphore_wait(v9, v16))
      {
        *(void *)buf = *MEMORY[0x263EFFC48];
        userInfoValues[0] = @"stop request timeout";
        CFErrorRef v17 = CFErrorCreateWithUserInfoKeysAndValues(0, @"VSErrorDomain", -4004, (const void *const *)buf, (const void *const *)userInfoValues, 1);
        goto LABEL_13;
      }
    }
  }
  else if (v10)
  {
    dispatch_time_t v15 = self->_clientBundleIdentifier;
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v15;
    _os_log_impl(&dword_20CABC000, v9, OS_LOG_TYPE_DEFAULT, "Stop #SpeechRequest from client %{public}@ was ignored, no request to stop", buf, 0xCu);
  }
  CFErrorRef v17 = 0;
LABEL_13:

  return v17;
}

intptr_t __73__VSSpeechSynthesizer__stopSpeakingRequest_atNextBoundary_synchronously___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_stopSpeakingPresynthesizedAudioRequest:(id)a3 synchronously:(BOOL)a4
{
  BOOL v4 = a4;
  userInfoValues[1] = *(void **)MEMORY[0x263EF8340];
  id v6 = a3;
  int v7 = VSGetLogDefault();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      uint64_t v9 = [v6 requestCreatedTimestamp];
      clientBundleIdentifier = self->_clientBundleIdentifier;
      *(_DWORD *)buf = 134218498;
      *(void *)&uint8_t buf[4] = v9;
      __int16 v19 = 2114;
      double v20 = clientBundleIdentifier;
      __int16 v21 = 1024;
      BOOL v22 = v4;
      _os_log_impl(&dword_20CABC000, v7, OS_LOG_TYPE_DEFAULT, "Stop #SpeechPresynthesizedAudioRequest %llu from client %{public}@, synchronously: %{BOOL}d", buf, 0x1Cu);
    }

    if (v4)
    {
      dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __77__VSSpeechSynthesizer__stopSpeakingPresynthesizedAudioRequest_synchronously___block_invoke;
      v16[3] = &unk_2640E8B78;
      int v7 = v11;
      CFErrorRef v17 = v7;
      [v6 setStopHandler:v16];

      [(VSSpeechConnection *)self->_xpcConnection stopPresynthesizedAudioRequest:v6];
      if (v7)
      {
        dispatch_time_t v12 = dispatch_time(0, 1000000000);
        if (dispatch_semaphore_wait(v7, v12))
        {
          *(void *)buf = *MEMORY[0x263EFFC48];
          userInfoValues[0] = @"stop presynthesized request timeout";
          CFErrorRef v13 = CFErrorCreateWithUserInfoKeysAndValues(0, @"VSErrorDomain", -4004, (const void *const *)buf, (const void *const *)userInfoValues, 1);
          goto LABEL_12;
        }
      }
    }
    else
    {
      [(VSSpeechConnection *)self->_xpcConnection stopPresynthesizedAudioRequest:v6];
      int v7 = 0;
    }
  }
  else if (v8)
  {
    dispatch_semaphore_t v14 = self->_clientBundleIdentifier;
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v14;
    _os_log_impl(&dword_20CABC000, v7, OS_LOG_TYPE_DEFAULT, "Stop #SpeechPresynthesizedAudioRequest from client %{public}@ was ignored, no request to stop", buf, 0xCu);
  }
  CFErrorRef v13 = 0;
LABEL_12:

  return v13;
}

intptr_t __77__VSSpeechSynthesizer__stopSpeakingPresynthesizedAudioRequest_synchronously___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    *(_WORD *)&self->_synthesizerFlags = *(_WORD *)&self->_synthesizerFlags & 0xFFFE | objc_opt_respondsToSelector() & 1;
    if (objc_opt_respondsToSelector()) {
      __int16 v5 = 2;
    }
    else {
      __int16 v5 = 0;
    }
    *(_WORD *)&self->_synthesizerFlags = *(_WORD *)&self->_synthesizerFlags & 0xFFFD | v5;
    if (objc_opt_respondsToSelector()) {
      __int16 v6 = 8;
    }
    else {
      __int16 v6 = 0;
    }
    *(_WORD *)&self->_synthesizerFlags = *(_WORD *)&self->_synthesizerFlags & 0xFFF7 | v6;
    if (objc_opt_respondsToSelector()) {
      __int16 v7 = 16;
    }
    else {
      __int16 v7 = 0;
    }
    *(_WORD *)&self->_synthesizerFlags = *(_WORD *)&self->_synthesizerFlags & 0xFFEF | v7;
    if (objc_opt_respondsToSelector()) {
      __int16 v8 = 32;
    }
    else {
      __int16 v8 = 0;
    }
    *(_WORD *)&self->_synthesizerFlags = *(_WORD *)&self->_synthesizerFlags & 0xFFDF | v8;
    if (objc_opt_respondsToSelector()) {
      __int16 v9 = 4;
    }
    else {
      __int16 v9 = 0;
    }
    *(_WORD *)&self->_synthesizerFlags = *(_WORD *)&self->_synthesizerFlags & 0xFFFB | v9;
    if (objc_opt_respondsToSelector()) {
      __int16 v10 = 64;
    }
    else {
      __int16 v10 = 0;
    }
    *(_WORD *)&self->_synthesizerFlags = *(_WORD *)&self->_synthesizerFlags & 0xFFBF | v10;
  }
}

- (BOOL)queryPhaticCapability:(id)a3
{
  id v4 = a3;
  if (+[VSFeatureFlags useSiriTTSServiceV2])
  {
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    uint64_t v12 = 0;
    CFErrorRef v13 = &v12;
    uint64_t v14 = 0x2020000000;
    char v15 = 0;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __45__VSSpeechSynthesizer_queryPhaticCapability___block_invoke;
    v9[3] = &unk_2640E87A0;
    dispatch_semaphore_t v11 = &v12;
    __int16 v6 = v5;
    __int16 v10 = v6;
    [(VSSpeechSynthesizer *)self STS_queryPhaticCapabilityWithRequest:v4 reply:v9];
    dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
    BOOL v7 = *((unsigned char *)v13 + 24) != 0;

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    BOOL v7 = [(VSSpeechConnection *)self->_xpcConnection queryPhaticCapabilityWithRequest:v4];
  }

  return v7;
}

intptr_t __45__VSSpeechSynthesizer_queryPhaticCapability___block_invoke(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)prewarmIfNeededWithRequest:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (+[VSFeatureFlags useSiriTTSService])
  {
    dispatch_semaphore_t v5 = [(VSSpeechSynthesizer *)self STS_prewarmRequest:v4];
  }
  else
  {
    if (+[VSFeatureFlags lowInactiveMemory]
      && ![(VSSpeechSynthesizer *)self keepActive])
    {
      __int16 v6 = VSGetLogDefault();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_20CABC000, v6, OS_LOG_TYPE_FAULT, "VSSpeechSynthesizer keepActive must be true before prewarming.", buf, 2u);
      }
    }
    dispatch_semaphore_t v5 = +[VSSpeechSynthesizer validatePrewarmRequest:v4];
    if (v5)
    {
      BOOL v7 = VSGetLogDefault();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v15 = v4;
        __int16 v16 = 2112;
        CFErrorRef v17 = v5;
        _os_log_error_impl(&dword_20CABC000, v7, OS_LOG_TYPE_ERROR, "Invalid #PrewarmRequest: %@, error: %@", buf, 0x16u);
      }

      id v8 = v5;
    }
    else
    {
      queue = self->_queue;
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __50__VSSpeechSynthesizer_prewarmIfNeededWithRequest___block_invoke;
      v11[3] = &unk_2640E8BA0;
      id v12 = v4;
      CFErrorRef v13 = self;
      dispatch_sync(queue, v11);
    }
  }

  return v5;
}

void __50__VSSpeechSynthesizer_prewarmIfNeededWithRequest___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) setRequestCreatedTimestamp:mach_absolute_time()];
  [*(id *)(a1 + 32) setClientBundleIdentifier:*(void *)(*(void *)(a1 + 40) + 8)];
  [*(id *)(a1 + 32) setAccessoryID:*(void *)(*(void *)(a1 + 40) + 88)];
  uint64_t v2 = VSGetLogDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) requestCreatedTimestamp];
    id v4 = [*(id *)(a1 + 32) clientBundleIdentifier];
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218498;
    uint64_t v14 = v3;
    __int16 v15 = 2114;
    __int16 v16 = v4;
    __int16 v17 = 2112;
    uint64_t v18 = v5;
    _os_log_impl(&dword_20CABC000, v2, OS_LOG_TYPE_DEFAULT, "#PrewarmRequest %llu from client %{public}@, request: %@", buf, 0x20u);
  }
  uint64_t v6 = [*(id *)(a1 + 32) audioSessionID];
  if (v6)
  {
    [*(id *)(a1 + 32) setAudioSessionID:v6];
  }
  else
  {
    BOOL v7 = [MEMORY[0x263EF93E0] sharedInstance];
    objc_msgSend(*(id *)(a1 + 32), "setAudioSessionID:", objc_msgSend(v7, "opaqueSessionID"));
  }
  __int16 v9 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  __int16 v10 = *(void **)(v8 + 32);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __50__VSSpeechSynthesizer_prewarmIfNeededWithRequest___block_invoke_135;
  v11[3] = &unk_2640E8610;
  void v11[4] = v8;
  id v12 = v9;
  [v10 prewarmIfNeededWithRequest:v12 reply:v11];
}

void __50__VSSpeechSynthesizer_prewarmIfNeededWithRequest___block_invoke_135(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
    [v5 speechSynthesizer:*(void *)(a1 + 32) didFinishPrewarmRequest:*(void *)(a1 + 40) withError:v6];
  }
}

- (id)initForInputFeedback
{
  id result = [(VSSpeechSynthesizer *)self init];
  if (result) {
    *((_WORD *)result + 24) |= 0x80u;
  }
  return result;
}

- (void)STS_getSynthesisVoiceMatching:(id)a3 reply:(id)a4
{
  id v6 = a4;
  proxySession = self->_proxySession;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __59__VSSpeechSynthesizer_STS_getSynthesisVoiceMatching_reply___block_invoke;
  v9[3] = &unk_2640E8778;
  id v10 = v6;
  id v8 = v6;
  [(SiriTTSDaemonSession *)proxySession getSynthesisVoiceMatching:a3 reply:v9];
}

void __59__VSSpeechSynthesizer_STS_getSynthesisVoiceMatching_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    BOOL v7 = VSGetLogDefault();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v6;
      _os_log_error_impl(&dword_20CABC000, v7, OS_LOG_TYPE_ERROR, "Unable to get synthesis voice, error %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v8 = objc_alloc_init(VSVoiceAsset);
    __int16 v9 = [v5 language];
    id v12 = v9;
    id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v12 count:1];
    [(VSVoiceAsset *)v8 setLanguages:v10];

    dispatch_semaphore_t v11 = [v5 name];
    [(VSVoiceAsset *)v8 setName:v11];

    -[VSVoiceAsset setFootprint:](v8, "setFootprint:", [v5 footprint]);
    -[VSVoiceAsset setType:](v8, "setType:", [v5 type]);
    -[VSVoiceAsset setGender:](v8, "setGender:", [v5 gender]);
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)STS_downloadedVoicesMatching:(id)a3 reply:(id)a4
{
  id v6 = a4;
  proxySession = self->_proxySession;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __58__VSSpeechSynthesizer_STS_downloadedVoicesMatching_reply___block_invoke;
  v9[3] = &unk_2640E8750;
  id v10 = v6;
  id v8 = v6;
  [(SiriTTSDaemonSession *)proxySession downloadedVoicesMatching:a3 reply:v9];
}

void __58__VSSpeechSynthesizer_STS_downloadedVoicesMatching_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v2 = a2;
  uint64_t v3 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = v2;
  uint64_t v4 = [obj countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v15 + 1) + 8 * v7);
        __int16 v9 = objc_alloc_init(VSVoiceAsset);
        id v10 = [v8 language];
        uint64_t v19 = v10;
        dispatch_semaphore_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v19 count:1];
        [(VSVoiceAsset *)v9 setLanguages:v11];

        id v12 = [v8 name];
        [(VSVoiceAsset *)v9 setName:v12];

        -[VSVoiceAsset setType:](v9, "setType:", [v8 type]);
        -[VSVoiceAsset setFootprint:](v9, "setFootprint:", [v8 footprint]);
        -[VSVoiceAsset setGender:](v9, "setGender:", [v8 gender]);
        [(VSAssetBase *)v9 setStorage:3];
        [v3 addObject:v9];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [obj countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v5);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)STS_subscribedVoicesWithClientID:(id)a3 reply:(id)a4
{
  id v6 = a4;
  proxySession = self->_proxySession;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __62__VSSpeechSynthesizer_STS_subscribedVoicesWithClientID_reply___block_invoke;
  v9[3] = &unk_2640E8750;
  id v10 = v6;
  id v8 = v6;
  [(SiriTTSDaemonSession *)proxySession subscribedVoicesWithClientId:a3 reply:v9];
}

void __62__VSSpeechSynthesizer_STS_subscribedVoicesWithClientID_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v2 = a2;
  uint64_t v3 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v25;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(v4);
        }
        __int16 v9 = *(void **)(*((void *)&v24 + 1) + 8 * v8);
        id v10 = objc_alloc_init(VSVoiceAsset);
        dispatch_semaphore_t v11 = [v9 voice];
        id v12 = [v11 language];
        long long v28 = v12;
        CFErrorRef v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v28 count:1];
        [(VSVoiceAsset *)v10 setLanguages:v13];

        id v14 = [v9 voice];
        long long v15 = [v14 name];
        [(VSVoiceAsset *)v10 setName:v15];

        long long v16 = [v9 voice];
        -[VSVoiceAsset setType:](v10, "setType:", [v16 type]);

        long long v17 = [v9 voice];
        -[VSVoiceAsset setFootprint:](v10, "setFootprint:", [v17 footprint]);

        long long v18 = [v9 voice];
        -[VSVoiceAsset setGender:](v10, "setGender:", [v18 gender]);

        uint64_t v19 = [VSVoiceSubscription alloc];
        double v20 = [v9 clientId];
        uint64_t v21 = [v9 accessoryId];
        BOOL v22 = [(VSVoiceSubscription *)v19 initWithClient:v20 accessory:v21 voice:v10];

        [v3 addObject:v22];
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v6);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)STS_subscribedVoices:(id)a3
{
  id v4 = a3;
  proxySession = self->_proxySession;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__VSSpeechSynthesizer_STS_subscribedVoices___block_invoke;
  v7[3] = &unk_2640E8750;
  id v8 = v4;
  id v6 = v4;
  [(SiriTTSDaemonSession *)proxySession subscribedVoicesWithReply:v7];
}

void __44__VSSpeechSynthesizer_STS_subscribedVoices___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v2 = a2;
  uint64_t v3 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        __int16 v9 = *(void **)(*((void *)&v19 + 1) + 8 * v8);
        id v10 = objc_alloc_init(VSVoiceAsset);
        dispatch_semaphore_t v11 = [v9 voice];
        id v12 = [v11 language];
        __int16 v23 = v12;
        CFErrorRef v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v23 count:1];
        [(VSVoiceAsset *)v10 setLanguages:v13];

        id v14 = [v9 voice];
        long long v15 = [v14 name];
        [(VSVoiceAsset *)v10 setName:v15];

        long long v16 = [v9 voice];
        -[VSVoiceAsset setType:](v10, "setType:", [v16 type]);

        long long v17 = [v9 voice];
        -[VSVoiceAsset setFootprint:](v10, "setFootprint:", [v17 footprint]);

        [v3 addObject:v10];
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v6);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)STS_subscribeVoices:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(obj);
        }
        __int16 v9 = *(void **)(*((void *)&v17 + 1) + 8 * v8);
        id v10 = objc_alloc(MEMORY[0x263F74EA0]);
        dispatch_semaphore_t v11 = [v9 languages];
        id v12 = [v11 firstObject];
        CFErrorRef v13 = [v9 name];
        id v14 = (void *)[v10 initWithLanguage:v12 name:v13];

        objc_msgSend(v14, "setType:", objc_msgSend(v9, "type"));
        objc_msgSend(v14, "setFootprint:", objc_msgSend(v9, "footprint"));
        [v4 addObject:v14];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }

  [(SiriTTSDaemonSession *)self->_proxySession subscribeWithVoices:v4 reply:&__block_literal_global_129];
}

void __43__VSSpeechSynthesizer_STS_subscribeVoices___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  if (v2)
  {
    id v3 = VSGetLogDefault();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 138412290;
      id v5 = v2;
      _os_log_error_impl(&dword_20CABC000, v3, OS_LOG_TYPE_ERROR, "Unable to subscribe voice, error %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (void)STS_queryPhaticCapabilityWithRequest:(id)a3 reply:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (objc_class *)MEMORY[0x263F74EA0];
  id v8 = a3;
  id v9 = [v7 alloc];
  id v10 = [v8 languageCode];
  dispatch_semaphore_t v11 = [v8 voiceName];
  id v12 = (void *)[v9 initWithLanguage:v10 name:v11];

  objc_msgSend(v12, "setType:", objc_msgSend(v8, "voiceType"));
  uint64_t v13 = [v8 footprint];

  [v12 setFootprint:v13];
  proxySession = self->_proxySession;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __66__VSSpeechSynthesizer_STS_queryPhaticCapabilityWithRequest_reply___block_invoke;
  v16[3] = &unk_2640E8728;
  id v17 = v6;
  id v15 = v6;
  [(SiriTTSDaemonSession *)proxySession queryPhaticCapabilityWithVoice:v12 reply:v16];
}

uint64_t __66__VSSpeechSynthesizer_STS_queryPhaticCapabilityWithRequest_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)STS_isSpeaking
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __37__VSSpeechSynthesizer_STS_isSpeaking__block_invoke;
  v5[3] = &unk_2640E8820;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __37__VSSpeechSynthesizer_STS_isSpeaking__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 104);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __37__VSSpeechSynthesizer_STS_isSpeaking__block_invoke_2;
  v3[3] = &unk_2640E8C88;
  v3[4] = *(void *)(a1 + 40);
  return [v1 isSpeaking:v3];
}

uint64_t __37__VSSpeechSynthesizer_STS_isSpeaking__block_invoke_2(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)STS_cancelAudioRequest:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  stsRequestMapping = self->_stsRequestMapping;
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(a3, "requestCreatedTimestamp"));
  uint64_t v6 = [(NSMutableDictionary *)stsRequestMapping objectForKeyedSubscript:v5];

  if (v6)
  {
    [(SiriTTSDaemonSession *)self->_proxySession cancelWithRequest:v6];
  }
  else
  {
    uint64_t v7 = VSGetLogDefault();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      clientBundleIdentifier = self->_clientBundleIdentifier;
      int v9 = 138543362;
      id v10 = clientBundleIdentifier;
      _os_log_impl(&dword_20CABC000, v7, OS_LOG_TYPE_DEFAULT, "Cancel #PresynthesizedAudioRequest from client %{public}@ was ignored, no request to stop", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)STS_cancelRequest:(id)a3
{
  stsRequestMapping = self->_stsRequestMapping;
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(a3, "requestCreatedTimestamp"));
  id v7 = [(NSMutableDictionary *)stsRequestMapping objectForKeyedSubscript:v5];

  uint64_t v6 = v7;
  if (v7)
  {
    [(SiriTTSDaemonSession *)self->_proxySession cancelWithRequest:v7];
    uint64_t v6 = v7;
  }
}

- (void)STS_forwardStreamObject:(id)a3
{
}

- (id)STS_signalInlineStreaming:(id)a3
{
  int v4 = (objc_class *)MEMORY[0x263F74E40];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v7 = [v5 text];
  uint64_t v8 = [v5 identifier];

  int v9 = (void *)[v6 initWithText:v7 identifier:v8];
  [(SiriTTSDaemonSession *)self->_proxySession signalWithInlineStreaming:v9];

  return 0;
}

- (void)STS_textToPhonemesWithRequest:(id)a3 phonemeSystem:(int64_t)a4 completion:(id)a5
{
  id v8 = a5;
  int v9 = (objc_class *)MEMORY[0x263F74EA0];
  id v10 = a3;
  id v11 = [v9 alloc];
  id v12 = [v10 languageCode];
  uint64_t v13 = [v10 voiceName];
  id v14 = (void *)[v11 initWithLanguage:v12 name:v13];

  objc_msgSend(v14, "setType:", objc_msgSend(v10, "voiceType"));
  objc_msgSend(v14, "setFootprint:", objc_msgSend(v10, "footprint"));
  objc_msgSend(v14, "setGender:", objc_msgSend(v10, "gender"));
  id v15 = objc_alloc(MEMORY[0x263F74E58]);
  long long v16 = [v10 text];

  id v17 = (void *)[v15 initWithText:v16 voice:v14 phonemeSystem:a4];
  proxySession = self->_proxySession;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __78__VSSpeechSynthesizer_STS_textToPhonemesWithRequest_phonemeSystem_completion___block_invoke;
  v20[3] = &unk_2640E8700;
  id v21 = v8;
  id v19 = v8;
  [(SiriTTSDaemonSession *)proxySession textToPhonemeWithRequest:v17 didFinish:v20];
}

uint64_t __78__VSSpeechSynthesizer_STS_textToPhonemesWithRequest_phonemeSystem_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)STS_estimateDurationOfRequest:(id)a3 completion:(id)a4
{
  id v6 = (objc_class *)MEMORY[0x263F74EA0];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 alloc];
  id v10 = [v8 languageCode];
  id v11 = [v8 voiceName];
  id v15 = (id)[v9 initWithLanguage:v10 name:v11];

  id v12 = objc_alloc(MEMORY[0x263F74E88]);
  uint64_t v13 = [v8 text];

  id v14 = (void *)[v12 initWithText:v13 voice:v15];
  [(SiriTTSDaemonSession *)self->_proxySession estimateDurationWithRequest:v14 didFinish:v7];
}

- (double)STS_estimateDurationOfRequest:(id)a3
{
  char v3 = (objc_class *)MEMORY[0x263F74EA0];
  id v4 = a3;
  id v5 = [v3 alloc];
  id v6 = [v4 languageCode];
  id v7 = [v4 voiceName];
  id v8 = (void *)[v5 initWithLanguage:v6 name:v7];

  id v9 = objc_alloc(MEMORY[0x263F74E88]);
  id v10 = [v4 text];

  id v11 = (void *)[v9 initWithText:v10 voice:v8];
  [MEMORY[0x263F74E30] roughEstimationWithRequest:v11];
  double v13 = v12;

  return v13;
}

- (id)STS_startSpeakingAudioRequest:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F74E00]);
  id v6 = [v4 audioData];
  [v5 setAudioData:v6];

  if (v4)
  {
    [v4 decoderStreamDescription];
  }
  else
  {
    uint64_t v30 = 0;
    long long v28 = 0u;
    long long v29 = 0u;
  }
  v26[0] = v28;
  v26[1] = v29;
  uint64_t v27 = v30;
  [v5 setAsbd:v26];
  id v7 = (void *)[objc_alloc(MEMORY[0x263F74E10]) initWithAudio:v5];
  objc_msgSend(v7, "setAudioSessionId:", objc_msgSend(v4, "audioSessionID"));
  objc_msgSend(v7, "setImmediate:", objc_msgSend(v4, "enqueue") ^ 1);
  id v8 = [v4 siriRequestId];
  [v7 setSiriRequestId:v8];

  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __53__VSSpeechSynthesizer_STS_startSpeakingAudioRequest___block_invoke;
  v24[3] = &unk_2640E8BA0;
  v24[4] = self;
  id v9 = v4;
  id v25 = v9;
  [v7 setDidStartSpeaking:v24];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __53__VSSpeechSynthesizer_STS_startSpeakingAudioRequest___block_invoke_3;
  v22[3] = &unk_2640E86D8;
  v22[4] = self;
  id v10 = v9;
  id v23 = v10;
  [v7 setDidReportInstrument:v22];
  proxySession = self->_proxySession;
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  long long v18 = __53__VSSpeechSynthesizer_STS_startSpeakingAudioRequest___block_invoke_4;
  id v19 = &unk_2640E8610;
  long long v20 = self;
  id v21 = v10;
  id v12 = v10;
  [(SiriTTSDaemonSession *)proxySession speakWithAudioRequest:v7 didFinish:&v16];
  objc_msgSend(v12, "setRequestCreatedTimestamp:", mach_absolute_time(), v16, v17, v18, v19, v20);
  stsRequestMapping = self->_stsRequestMapping;
  id v14 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v12, "requestCreatedTimestamp"));
  [(NSMutableDictionary *)stsRequestMapping setObject:v7 forKeyedSubscript:v14];

  return 0;
}

void __53__VSSpeechSynthesizer_STS_startSpeakingAudioRequest___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(NSObject **)(v4 + 24);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __53__VSSpeechSynthesizer_STS_startSpeakingAudioRequest___block_invoke_2;
    v6[3] = &unk_2640E8BA0;
    void v6[4] = v4;
    id v7 = *(id *)(a1 + 40);
    dispatch_async(v5, v6);
  }
}

void __53__VSSpeechSynthesizer_STS_startSpeakingAudioRequest___block_invoke_3(uint64_t a1, void *a2)
{
  id v7 = a2;
  char v3 = [*(id *)(a1 + 32) delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = +[VSInstrumentMetrics vs_metricsFromSTSMetrics:v7];
    id v6 = [*(id *)(a1 + 32) delegate];
    [v6 speechSynthesizer:*(void *)(a1 + 32) didFinishPresynthesizedAudioRequest:*(void *)(a1 + 40) withInstrumentMetrics:v5 error:0];
  }
}

void __53__VSSpeechSynthesizer_STS_startSpeakingAudioRequest___block_invoke_4(uint64_t a1, void *a2)
{
  id v11 = a2;
  char v3 = [*(id *)(a1 + 32) delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) delegate];
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = objc_msgSend(v6, "errorFromSTSError:");
    [v5 speechSynthesizer:v6 didStopPresynthesizedAudioRequest:v7 atEnd:v11 == 0 error:v8];
  }
  id v9 = [*(id *)(a1 + 32) stsRequestMapping];
  id v10 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(a1 + 40), "requestCreatedTimestamp"));
  [v9 setObject:0 forKeyedSubscript:v10];
}

void __53__VSSpeechSynthesizer_STS_startSpeakingAudioRequest___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 speechSynthesizer:*(void *)(a1 + 32) didStartPresynthesizedAudioRequest:*(void *)(a1 + 40)];
}

- (id)STS_startSpeakingRequest:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x263F74EA0]);
  id v6 = [v4 languageCode];
  uint64_t v7 = [v4 voiceName];
  id v8 = (void *)[v5 initWithLanguage:v6 name:v7];

  objc_msgSend(v8, "setType:", objc_msgSend(v4, "voiceType"));
  objc_msgSend(v8, "setFootprint:", objc_msgSend(v4, "footprint"));
  objc_msgSend(v8, "setGender:", objc_msgSend(v4, "gender"));
  id v9 = objc_alloc(MEMORY[0x263F74E78]);
  id v10 = [v4 text];
  id v11 = (void *)[v9 initWithText:v10 voice:v8];

  objc_msgSend(v11, "setPrivacySensitive:", objc_msgSend(v4, "canUseServerTTS") ^ 1);
  id v12 = [v4 siriRequestId];
  [v11 setSiriRequestId:v12];

  objc_msgSend(v11, "setImmediate:", objc_msgSend(v4, "shouldWaitCurrentSpeaking") ^ 1);
  objc_msgSend(v11, "setAudioSessionId:", objc_msgSend(v4, "audioSessionID"));
  double v13 = [v4 contextInfo];
  [v11 setContextInfo:v13];

  [v4 rate];
  *(float *)&double v14 = v14;
  [v11 setRate:v14];
  [v4 volume];
  *(float *)&double v15 = v15;
  [v11 setVolume:v15];
  [v4 pitch];
  *(float *)&double v16 = v16;
  [v11 setPitch:v16];
  objc_msgSend(v11, "setDisableCompactVoice:", objc_msgSend(v4, "disableCompactVoiceFallback"));
  objc_msgSend(v11, "setSynthesisProfile:", objc_msgSend(v4, "powerProfile"));
  uint64_t v17 = [v4 outputPath];
  [v11 setOutputPath:v17];

  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __48__VSSpeechSynthesizer_STS_startSpeakingRequest___block_invoke;
  v36[3] = &unk_2640E8BA0;
  v36[4] = self;
  id v18 = v4;
  id v37 = v18;
  [v11 setDidStartSpeaking:v36];
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __48__VSSpeechSynthesizer_STS_startSpeakingRequest___block_invoke_2;
  v34[3] = &unk_2640E86D8;
  v34[4] = self;
  id v19 = v18;
  id v35 = v19;
  [v11 setDidReportInstrument:v34];
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __48__VSSpeechSynthesizer_STS_startSpeakingRequest___block_invoke_3;
  v32[3] = &unk_2640E8688;
  v32[4] = self;
  id v20 = v19;
  id v33 = v20;
  [v11 setDidGenerateWordTimings:v32];
  proxySession = self->_proxySession;
  uint64_t v26 = MEMORY[0x263EF8330];
  uint64_t v27 = 3221225472;
  long long v28 = __48__VSSpeechSynthesizer_STS_startSpeakingRequest___block_invoke_4;
  long long v29 = &unk_2640E8610;
  uint64_t v30 = self;
  id v31 = v20;
  id v22 = v20;
  [(SiriTTSDaemonSession *)proxySession speakWithSpeechRequest:v11 didFinish:&v26];
  objc_msgSend(v22, "setRequestCreatedTimestamp:", mach_absolute_time(), v26, v27, v28, v29, v30);
  stsRequestMapping = self->_stsRequestMapping;
  long long v24 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v22, "requestCreatedTimestamp"));
  [(NSMutableDictionary *)stsRequestMapping setObject:v11 forKeyedSubscript:v24];

  return 0;
}

void __48__VSSpeechSynthesizer_STS_startSpeakingRequest___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 speechSynthesizer:*(void *)(a1 + 32) didStartSpeakingRequest:*(void *)(a1 + 40)];
  }
}

void __48__VSSpeechSynthesizer_STS_startSpeakingRequest___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  char v3 = [*(id *)(a1 + 32) delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = +[VSInstrumentMetrics vs_metricsFromSTSMetrics:v7];
    [v5 setIsSpeechRequest:1];
    id v6 = [*(id *)(a1 + 32) delegate];
    [v6 speechSynthesizer:*(void *)(a1 + 32) didFinishSpeakingRequest:*(void *)(a1 + 40) withInstrumentMetrics:v5];
  }
}

void __48__VSSpeechSynthesizer_STS_startSpeakingRequest___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  char v4 = [*(id *)(a1 + 32) delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [MEMORY[0x263EFF980] array];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v7 = v3;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v17 + 1) + 8 * v11);
          double v13 = objc_alloc_init(VSSpeechWordTimingInfo);
          objc_msgSend(v12, "startTime", (void)v17);
          -[VSSpeechWordTimingInfo setStartTime:](v13, "setStartTime:");
          uint64_t v14 = [v12 textRange];
          -[VSSpeechWordTimingInfo setTextRange:](v13, "setTextRange:", v14, v15);
          [v6 addObject:v13];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v9);
    }

    double v16 = [*(id *)(a1 + 32) delegate];
    [v16 speechSynthesizer:*(void *)(a1 + 32) withRequest:*(void *)(a1 + 40) didReceiveTimingInfo:v6];
  }
}

void __48__VSSpeechSynthesizer_STS_startSpeakingRequest___block_invoke_4(uint64_t a1, void *a2)
{
  id v11 = a2;
  id v3 = [*(id *)(a1 + 32) delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    char v5 = [*(id *)(a1 + 32) delegate];
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = objc_msgSend(v6, "errorFromSTSError:");
    [v5 speechSynthesizer:v6 didFinishSpeakingRequest:v7 successfully:v11 == 0 phonemesSpoken:0 withError:v8];
  }
  uint64_t v9 = [*(id *)(a1 + 32) stsRequestMapping];
  uint64_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(a1 + 40), "requestCreatedTimestamp"));
  [v9 setObject:0 forKeyedSubscript:v10];
}

- (id)STS_startSynthesizingRequest:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x263F74EA0]);
  id v6 = [v4 languageCode];
  uint64_t v7 = [v4 voiceName];
  uint64_t v8 = (void *)[v5 initWithLanguage:v6 name:v7];

  objc_msgSend(v8, "setType:", objc_msgSend(v4, "voiceType"));
  objc_msgSend(v8, "setFootprint:", objc_msgSend(v4, "footprint"));
  objc_msgSend(v8, "setGender:", objc_msgSend(v4, "gender"));
  id v9 = objc_alloc(MEMORY[0x263F74E88]);
  uint64_t v10 = [v4 text];
  id v11 = (void *)[v9 initWithText:v10 voice:v8];

  objc_msgSend(v11, "setPrivacySensitive:", objc_msgSend(v4, "canUseServerTTS") ^ 1);
  id v12 = [v4 contextInfo];
  [v11 setContextInfo:v12];

  [v4 rate];
  *(float *)&double v13 = v13;
  [v11 setRate:v13];
  [v4 volume];
  *(float *)&double v14 = v14;
  [v11 setVolume:v14];
  [v4 pitch];
  *(float *)&double v15 = v15;
  [v11 setPitch:v15];
  objc_msgSend(v11, "setDisableCompactVoice:", objc_msgSend(v4, "disableCompactVoiceFallback"));
  objc_msgSend(v11, "setSynthesisProfile:", objc_msgSend(v4, "powerProfile"));
  double v16 = [v4 outputPath];
  [v11 setOutputPath:v16];

  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = __Block_byref_object_copy__2824;
  v36[4] = __Block_byref_object_dispose__2825;
  id v37 = 0;
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __52__VSSpeechSynthesizer_STS_startSynthesizingRequest___block_invoke;
  v35[3] = &unk_2640E8638;
  v35[4] = v36;
  [v11 setDidReportInstrument:v35];
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __52__VSSpeechSynthesizer_STS_startSynthesizingRequest___block_invoke_2;
  v33[3] = &unk_2640E8660;
  v33[4] = self;
  id v17 = v4;
  id v34 = v17;
  [v11 setDidGenerateAudio:v33];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __52__VSSpeechSynthesizer_STS_startSynthesizingRequest___block_invoke_3;
  v31[3] = &unk_2640E8688;
  v31[4] = self;
  id v18 = v17;
  id v32 = v18;
  [v11 setDidGenerateWordTimings:v31];
  proxySession = self->_proxySession;
  uint64_t v24 = MEMORY[0x263EF8330];
  uint64_t v25 = 3221225472;
  uint64_t v26 = __52__VSSpeechSynthesizer_STS_startSynthesizingRequest___block_invoke_4;
  uint64_t v27 = &unk_2640E86B0;
  long long v28 = self;
  id v20 = v18;
  id v29 = v20;
  uint64_t v30 = v36;
  [(SiriTTSDaemonSession *)proxySession synthesizeWithRequest:v11 didFinish:&v24];
  objc_msgSend(v20, "setRequestCreatedTimestamp:", mach_absolute_time(), v24, v25, v26, v27, v28);
  stsRequestMapping = self->_stsRequestMapping;
  uint64_t v22 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v20, "requestCreatedTimestamp"));
  [(NSMutableDictionary *)stsRequestMapping setObject:v11 forKeyedSubscript:v22];

  _Block_object_dispose(v36, 8);
  return 0;
}

void __52__VSSpeechSynthesizer_STS_startSynthesizingRequest___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = +[VSInstrumentMetrics vs_metricsFromSTSMetrics:a2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __52__VSSpeechSynthesizer_STS_startSynthesizingRequest___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_alloc_init(VSAudioData);
    if (v3)
    {
      [v3 asbd];
    }
    else
    {
      uint64_t v14 = 0;
      long long v12 = 0u;
      long long v13 = 0u;
    }
    v10[0] = v12;
    v10[1] = v13;
    uint64_t v11 = v14;
    [(VSAudioData *)v6 setAsbd:v10];
    uint64_t v7 = [v3 audioData];
    [(VSAudioData *)v6 setAudioData:v7];

    -[VSAudioData setPacketCount:](v6, "setPacketCount:", [v3 packetCount]);
    uint64_t v8 = [v3 packetDescriptions];
    [(VSAudioData *)v6 setPacketDescriptions:v8];

    id v9 = [*(id *)(a1 + 32) delegate];
    [v9 speechSynthesizer:*(void *)(a1 + 32) withSynthesisRequest:*(void *)(a1 + 40) didGenerateAudioChunk:v6];
  }
}

void __52__VSSpeechSynthesizer_STS_startSynthesizingRequest___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [MEMORY[0x263EFF980] array];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v7 = v3;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v12 = *(void **)(*((void *)&v17 + 1) + 8 * v11);
          long long v13 = objc_alloc_init(VSSpeechWordTimingInfo);
          objc_msgSend(v12, "startTime", (void)v17);
          -[VSSpeechWordTimingInfo setStartTime:](v13, "setStartTime:");
          uint64_t v14 = [v12 textRange];
          -[VSSpeechWordTimingInfo setTextRange:](v13, "setTextRange:", v14, v15);
          [v6 addObject:v13];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v9);
    }

    double v16 = [*(id *)(a1 + 32) delegate];
    [v16 speechSynthesizer:*(void *)(a1 + 32) withRequest:*(void *)(a1 + 40) didReceiveTimingInfo:v6];
  }
}

void __52__VSSpeechSynthesizer_STS_startSynthesizingRequest___block_invoke_4(uint64_t a1, void *a2)
{
  id v12 = a2;
  id v3 = [*(id *)(a1 + 32) delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    char v5 = [*(id *)(a1 + 32) delegate];
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    uint64_t v9 = [v6 errorFromSTSError:v12];
    [v5 speechSynthesizer:v6 didFinishSynthesisRequest:v7 withInstrumentMetrics:v8 error:v9];
  }
  uint64_t v10 = [*(id *)(a1 + 32) stsRequestMapping];
  uint64_t v11 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(a1 + 40), "requestCreatedTimestamp"));
  [v10 setObject:0 forKeyedSubscript:v11];
}

- (id)STS_prewarmRequest:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x263F74EA0]);
  id v6 = [v4 languageCode];
  uint64_t v7 = [v4 voiceName];
  uint64_t v8 = (void *)[v5 initWithLanguage:v6 name:v7];

  objc_msgSend(v8, "setType:", objc_msgSend(v4, "voiceType"));
  objc_msgSend(v8, "setFootprint:", objc_msgSend(v4, "footprint"));
  objc_msgSend(v8, "setGender:", objc_msgSend(v4, "gender"));
  id v9 = objc_alloc(MEMORY[0x263F74E88]);
  uint64_t v10 = [v4 text];
  uint64_t v11 = (void *)[v9 initWithText:v10 voice:v8];

  objc_msgSend(v11, "setPrivacySensitive:", objc_msgSend(v4, "canUseServerTTS") ^ 1);
  objc_msgSend(v11, "setDisableCompactVoice:", objc_msgSend(v4, "disableCompactVoiceFallback"));
  objc_msgSend(v11, "setSynthesisProfile:", objc_msgSend(v4, "powerProfile"));
  proxySession = self->_proxySession;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __42__VSSpeechSynthesizer_STS_prewarmRequest___block_invoke;
  v15[3] = &unk_2640E8610;
  void v15[4] = self;
  id v16 = v4;
  id v13 = v4;
  [(SiriTTSDaemonSession *)proxySession prewarmWithRequest:v11 didFinish:v15];

  return 0;
}

void __42__VSSpeechSynthesizer_STS_prewarmRequest___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [*(id *)(a1 + 32) delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) delegate];
    [v5 speechSynthesizer:*(void *)(a1 + 32) didFinishPrewarmRequest:*(void *)(a1 + 40) withError:v6];
  }
}

- (id)errorFromSTSError:(id)a3
{
  if (!a3)
  {
    uint64_t v7 = 0;
    goto LABEL_29;
  }
  id v3 = (void *)MEMORY[0x263F087E8];
  id v4 = a3;
  uint64_t v5 = [v4 code];
  uint64_t v6 = v5;
  if (v5 > 298)
  {
    if (v5 <= 399)
    {
      switch(v5)
      {
        case 299:
          uint64_t v6 = 452;
          break;
        case 300:
          uint64_t v6 = 601;
          break;
        case 301:
          uint64_t v6 = 602;
          break;
        case 302:
          uint64_t v6 = 603;
          break;
        default:
          goto LABEL_27;
      }
      goto LABEL_28;
    }
    switch(v5)
    {
      case 400:
        uint64_t v6 = 700;
        goto LABEL_28;
      case 401:
        uint64_t v6 = 701;
        goto LABEL_28;
      case 402:
        uint64_t v6 = 702;
        goto LABEL_28;
    }
LABEL_27:
    uint64_t v6 = -1;
    goto LABEL_28;
  }
  if (v5 > 99)
  {
    switch(v5)
    {
      case 100:
        uint64_t v6 = 401;
        goto LABEL_28;
      case 101:
        uint64_t v6 = 402;
        goto LABEL_28;
      case 200:
        uint64_t v6 = 450;
        goto LABEL_28;
    }
    goto LABEL_27;
  }
  if (v5 == -1 || !v5) {
    goto LABEL_28;
  }
  if (v5 != 1) {
    goto LABEL_27;
  }
  uint64_t v6 = 400;
LABEL_28:
  uint64_t v8 = [v4 userInfo];

  uint64_t v7 = [v3 errorWithDomain:@"VoiceServicesErrorDomain" code:v6 userInfo:v8];

LABEL_29:
  return v7;
}

- (VSSpeechSynthesizer)initWithAccessoryID:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)VSSpeechSynthesizer;
  uint64_t v5 = [(VSSpeechSynthesizer *)&v43 init];
  if (!v5) {
    goto LABEL_20;
  }
  dispatch_queue_t v6 = dispatch_queue_create("VSSpeechSynthesizer", 0);
  uint64_t v7 = (void *)*((void *)v5 + 2);
  *((void *)v5 + 2) = v6;

  dispatch_queue_t v8 = dispatch_queue_create("VSSpeechSynthesizerCallbackThread", 0);
  id v9 = (void *)*((void *)v5 + 3);
  *((void *)v5 + 3) = v8;

  dispatch_set_target_queue(*((dispatch_object_t *)v5 + 3), MEMORY[0x263EF83A0]);
  __asm { FMOV            V0.2S, #1.0 }
  *(void *)(v5 + 52) = _D0;
  *((_DWORD *)v5 + 15) = 1061997773;
  uint64_t v15 = [MEMORY[0x263F086E0] mainBundle];
  id v16 = [v15 preferredLocalizations];
  long long v17 = [v16 firstObject];

  if (v17) {
    long long v18 = v17;
  }
  else {
    long long v18 = @"en-US";
  }
  long long v19 = +[VSSpeechSynthesizerPreference fallbackLanguageForLanguage:v18];
  if (([(__CFString *)v17 isEqualToString:v19] & 1) == 0)
  {
    long long v20 = VSGetLogDefault();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v45 = v17;
      __int16 v46 = 2114;
      char v47 = v19;
      _os_log_impl(&dword_20CABC000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ is not TTS language, VSSpeechSynthesizer fallback to %{public}@", buf, 0x16u);
    }
  }
  objc_storeStrong((id *)v5 + 10, v19);
  id v21 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v22 = [v21 bundleIdentifier];
  id v23 = (void *)*((void *)v5 + 1);
  *((void *)v5 + 1) = v22;

  char v24 = [*((id *)v5 + 1) isEqualToString:@"com.apple.assistantd"];
  uint64_t v25 = (void *)*((void *)v5 + 1);
  if (v24)
  {
    uint64_t v26 = @"com.apple.AssistantServices";
LABEL_13:
    *((void *)v5 + 1) = v26;

    goto LABEL_14;
  }
  if ([v25 isEqualToString:@"com.apple.accessibility.axassetsd"])
  {
    uint64_t v25 = (void *)*((void *)v5 + 1);
    uint64_t v26 = @"com.apple.accessibility.AccessibilityUIServer";
    goto LABEL_13;
  }
LABEL_14:
  uint64_t v27 = [v4 copy];
  long long v28 = (void *)*((void *)v5 + 11);
  *((void *)v5 + 11) = v27;

  id v29 = [MEMORY[0x263F08AB0] processInfo];
  uint64_t v30 = NSString;
  id v31 = [v29 processName];
  uint64_t v32 = [v30 stringWithFormat:@"VSSpeechSynthesizer_%p@%@_%d", v5, v31, objc_msgSend(v29, "processIdentifier")];
  id v33 = (void *)*((void *)v5 + 5);
  *((void *)v5 + 5) = v32;

  id v34 = objc_alloc_init(VSSpeechConnection);
  id v35 = (void *)*((void *)v5 + 4);
  *((void *)v5 + 4) = v34;

  [*((id *)v5 + 4) setIdentifier:*((void *)v5 + 5)];
  [*((id *)v5 + 4) setDelegate:v5];
  id v36 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v37 = (void *)*((void *)v5 + 12);
  *((void *)v5 + 12) = v36;

  if (+[VSFeatureFlags useSiriTTSService])
  {
    if (*((void *)v5 + 11)) {
      id v38 = (id)[objc_alloc(MEMORY[0x263F74E20]) initWithAccessoryId:v4];
    }
    else {
      id v38 = objc_alloc_init(MEMORY[0x263F74E20]);
    }
    uint64_t v39 = (void *)*((void *)v5 + 13);
    *((void *)v5 + 13) = v38;

    uint64_t v40 = [MEMORY[0x263EFF9A0] dictionary];
    id v41 = (void *)*((void *)v5 + 14);
    *((void *)v5 + 14) = v40;
  }
LABEL_20:

  return (VSSpeechSynthesizer *)v5;
}

- (VSSpeechSynthesizer)init
{
  return [(VSSpeechSynthesizer *)self initWithAccessoryID:0];
}

- (void)stopPlayingVoicePreview
{
  proxySession = self->_proxySession;
  id v3 = [(VSSpeechSynthesizer *)self isPlayingPreview];
  [(SiriTTSDaemonSession *)proxySession cancelWithRequest:v3];
}

- (void)playVoicePreviewForLanguageCode:(id)a3 voiceName:(id)a4 previewType:(int64_t)a5 completion:(id)a6
{
  id v10 = a6;
  uint64_t v11 = (objc_class *)MEMORY[0x263F74EA0];
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = (void *)[[v11 alloc] initWithLanguage:v13 name:v12];

  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x263F74E68]) initWithVoice:v14 previewType:a5];
  [(VSSpeechSynthesizer *)self setIsPlayingPreview:v15];
  proxySession = self->_proxySession;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __88__VSSpeechSynthesizer_playVoicePreviewForLanguageCode_voiceName_previewType_completion___block_invoke;
  v18[3] = &unk_2640E85E8;
  void v18[4] = self;
  id v19 = v10;
  id v17 = v10;
  [(SiriTTSDaemonSession *)proxySession speakWithPreviewRequest:v15 didFinish:v18];
}

uint64_t __88__VSSpeechSynthesizer_playVoicePreviewForLanguageCode_voiceName_previewType_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setIsPlayingPreview:0];
  id v2 = *(uint64_t (**)(__n128))(*(void *)(a1 + 40) + 16);
  v3.n128_u64[0] = 0;
  return v2(v3);
}

{
  uint64_t result;

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

+ (id)characterClassCountForUtterance:(id)a3 language:(id)a4
{
  v32[6] = *MEMORY[0x263EF8340];
  id v4 = objc_msgSend(a3, "vs_textifyEmojiWithLanguage:", a4);
  objc_msgSend(v4, "vs_measurePauses");
  double v6 = v5;
  uint64_t v30 = objc_msgSend(v4, "vs_countPhoneticSyllables");
  uint64_t v7 = objc_msgSend(v4, "vs_removePhonetics");

  dispatch_queue_t v8 = objc_msgSend(v7, "vs_removeSpeechTags");

  uint64_t v9 = [v8 length];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = 0;
    unsigned int v31 = 0;
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    do
    {
      uint64_t v15 = [v8 characterAtIndex:v11];
      id v16 = [MEMORY[0x263F08708] whitespaceCharacterSet];
      char v17 = [v16 characterIsMember:v15];

      if ((v17 & 1) == 0)
      {
        long long v18 = [MEMORY[0x263F08708] punctuationCharacterSet];
        int v19 = [v18 characterIsMember:v15];

        if (v19)
        {
          uint64_t v14 = (v14 + 1);
        }
        else
        {
          long long v20 = [MEMORY[0x263F08708] decimalDigitCharacterSet];
          int v21 = [v20 characterIsMember:v15];

          if (v21)
          {
            uint64_t v13 = (v13 + 1);
          }
          else if (objc_msgSend(NSString, "vs_isCJKCharacter:", v15))
          {
            uint64_t v12 = (v12 + 1);
          }
          else
          {
            ++v31;
          }
        }
      }
      ++v11;
    }
    while (v10 != v11);
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t v13 = 0;
    uint64_t v12 = 0;
    unsigned int v31 = 0;
  }
  uint64_t v22 = [NSNumber numberWithUnsignedInteger:(unint64_t)(v6 * 1000.0)];
  v32[0] = v22;
  id v23 = [NSNumber numberWithUnsignedInteger:v30];
  v32[1] = v23;
  char v24 = [NSNumber numberWithInt:v14];
  v32[2] = v24;
  uint64_t v25 = [NSNumber numberWithInt:v13];
  v32[3] = v25;
  uint64_t v26 = [NSNumber numberWithInt:v12];
  v32[4] = v26;
  uint64_t v27 = [NSNumber numberWithInt:v31];
  void v32[5] = v27;
  long long v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:6];

  return v28;
}

+ (VSSpeechSynthesizer)sharedInstance
{
  if (sharedInstance_onceToken_2898 != -1) {
    dispatch_once(&sharedInstance_onceToken_2898, &__block_literal_global_2899);
  }
  id v2 = (void *)sharedInstance___sharedInstance;
  return (VSSpeechSynthesizer *)v2;
}

void __37__VSSpeechSynthesizer_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(VSSpeechSynthesizer);
  uint64_t v1 = (void *)sharedInstance___sharedInstance;
  sharedInstance___sharedInstance = (uint64_t)v0;
}

+ (void)stopPlayingVoicePreview
{
  id v2 = [a1 sharedInstance];
  [v2 stopPlayingVoicePreview];
}

+ (BOOL)playVoicePreviewForLanguageCode:(id)a3 voiceName:(id)a4 previewType:(int64_t)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = [a1 sharedInstance];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __88__VSSpeechSynthesizer_playVoicePreviewForLanguageCode_voiceName_previewType_completion___block_invoke;
  v16[3] = &unk_2640E85C0;
  id v17 = v10;
  id v14 = v10;
  [v13 playVoicePreviewForLanguageCode:v12 voiceName:v11 previewType:a5 completion:v16];

  return 1;
}

+ (id)validateAudioCachingRequest:(id)a3
{
  v29[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = v3;
  if (!v3)
  {
    uint64_t v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v28 = *MEMORY[0x263F08320];
    v29[0] = @"Request is nil.";
    id v10 = NSDictionary;
    id v11 = (__CFString **)v29;
    id v12 = &v28;
LABEL_5:
    double v6 = [v10 dictionaryWithObjects:v11 forKeys:v12 count:1];
    uint64_t v7 = v9;
    uint64_t v8 = 100;
    goto LABEL_6;
  }
  if ([v3 requestCreatedTimestamp])
  {
    double v5 = (void *)MEMORY[0x263F087E8];
    uint64_t v26 = *MEMORY[0x263F08320];
    uint64_t v27 = @"Request has been used before. Please make a new copy of it.";
    double v6 = [NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    uint64_t v7 = v5;
    uint64_t v8 = 101;
LABEL_6:
    uint64_t v13 = [v7 errorWithDomain:@"VoiceServicesErrorDomain" code:v8 userInfo:v6];

    goto LABEL_7;
  }
  uint64_t v15 = [v4 identifier];

  if (v15)
  {
    id v16 = [v4 text];
    uint64_t v17 = [v16 length];

    if (!v17)
    {
      uint64_t v9 = (void *)MEMORY[0x263F087E8];
      uint64_t v24 = *MEMORY[0x263F08320];
      uint64_t v25 = @"Missing text of inline streaming request.";
      id v10 = NSDictionary;
      id v11 = &v25;
      id v12 = &v24;
      goto LABEL_5;
    }
  }
  else
  {
    long long v18 = [v4 audioData];
    uint64_t v19 = [v18 length];

    if (!v19)
    {
      uint64_t v9 = (void *)MEMORY[0x263F087E8];
      uint64_t v20 = *MEMORY[0x263F08320];
      int v21 = @"Audio caching request must be either inline streaming or audio request.";
      id v10 = NSDictionary;
      id v11 = &v21;
      id v12 = &v20;
      goto LABEL_5;
    }
    if (([v4 hasValidAudio] & 1) == 0)
    {
      uint64_t v9 = (void *)MEMORY[0x263F087E8];
      uint64_t v22 = *MEMORY[0x263F08320];
      id v23 = @"Invalid audio request. Audio is invalid.";
      id v10 = NSDictionary;
      id v11 = &v23;
      id v12 = &v22;
      goto LABEL_5;
    }
  }
  uint64_t v13 = 0;
LABEL_7:

  return v13;
}

+ (id)validateAudioRequest:(id)a3
{
  v20[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = v3;
  if (!v3)
  {
    uint64_t v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v19 = *MEMORY[0x263F08320];
    v20[0] = @"Request is nil.";
    id v10 = NSDictionary;
    id v11 = (__CFString **)v20;
    id v12 = &v19;
LABEL_8:
    double v6 = [v10 dictionaryWithObjects:v11 forKeys:v12 count:1];
    uint64_t v7 = v9;
    uint64_t v8 = 100;
    goto LABEL_9;
  }
  if (![v3 requestCreatedTimestamp])
  {
    if ([v4 hasValidAudio])
    {
      uint64_t v13 = 0;
      goto LABEL_10;
    }
    uint64_t v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v15 = *MEMORY[0x263F08320];
    id v16 = @"Audio request has invalid audio data.";
    id v10 = NSDictionary;
    id v11 = &v16;
    id v12 = &v15;
    goto LABEL_8;
  }
  double v5 = (void *)MEMORY[0x263F087E8];
  uint64_t v17 = *MEMORY[0x263F08320];
  long long v18 = @"Request has been used before. Please make a new copy of it.";
  double v6 = [NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  uint64_t v7 = v5;
  uint64_t v8 = 101;
LABEL_9:
  uint64_t v13 = [v7 errorWithDomain:@"VoiceServicesErrorDomain" code:v8 userInfo:v6];

LABEL_10:
  return v13;
}

+ (id)validateRequest:(id)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = [a1 validatePrewarmRequest:v4];
  double v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    uint64_t v8 = [v4 text];

    if (v8)
    {
      id v7 = 0;
    }
    else
    {
      uint64_t v9 = (void *)MEMORY[0x263F087E8];
      uint64_t v12 = *MEMORY[0x263F08320];
      v13[0] = @"text is not set.";
      id v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
      id v7 = [v9 errorWithDomain:@"VoiceServicesErrorDomain" code:100 userInfo:v10];
    }
  }

  return v7;
}

+ (id)validatePrewarmRequest:(id)a3
{
  v21[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = v3;
  if (!v3)
  {
    id v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v20 = *MEMORY[0x263F08320];
    v21[0] = @"Request is nil.";
    id v11 = NSDictionary;
    uint64_t v12 = (__CFString **)v21;
    uint64_t v13 = &v20;
LABEL_7:
    id v7 = [v11 dictionaryWithObjects:v12 forKeys:v13 count:1];
    uint64_t v8 = v10;
    uint64_t v9 = 100;
    goto LABEL_8;
  }
  double v5 = [v3 languageCode];

  if (!v5)
  {
    id v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v18 = *MEMORY[0x263F08320];
    uint64_t v19 = @"language is not set.";
    id v11 = NSDictionary;
    uint64_t v12 = &v19;
    uint64_t v13 = &v18;
    goto LABEL_7;
  }
  if ([v4 requestCreatedTimestamp])
  {
    double v6 = (void *)MEMORY[0x263F087E8];
    uint64_t v16 = *MEMORY[0x263F08320];
    uint64_t v17 = @"Request has been used before. Please make a new copy of it.";
    id v7 = [NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    uint64_t v8 = v6;
    uint64_t v9 = 101;
LABEL_8:
    id v14 = [v8 errorWithDomain:@"VoiceServicesErrorDomain" code:v9 userInfo:v7];

    goto LABEL_9;
  }
  id v14 = 0;
LABEL_9:

  return v14;
}

+ (id)errorWithReason:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263F087E8];
  uint64_t v9 = *MEMORY[0x263F08338];
  v10[0] = a3;
  id v4 = NSDictionary;
  id v5 = a3;
  double v6 = [v4 dictionaryWithObjects:v10 forKeys:&v9 count:1];
  id v7 = [v3 errorWithDomain:@"VSSpeechSynthesizer" code:0 userInfo:v6];

  return v7;
}

@end