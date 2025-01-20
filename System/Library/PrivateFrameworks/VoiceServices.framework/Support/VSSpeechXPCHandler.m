@interface VSSpeechXPCHandler
+ (BOOL)isSiriClientBundleIdentifier:(id)a3;
- (AFAudioPowerUpdater)audioPowerUpdater;
- (BOOL)isSpeaking;
- (NSString)connectionIdentifier;
- (OS_dispatch_queue)audioPowerUpdateQueue;
- (OS_os_transaction)synthesizerTransaction;
- (VSHHManagementClient)hubManagementClient;
- (VSHMHomeManager)homeManager;
- (VSSpeechXPCHandler)initWithConnection:(id)a3;
- (id)_delegate;
- (void)audioRequest:(id)a3 didReportInstrumentMetrics:(id)a4 error:(id)a5;
- (void)audioRequest:(id)a3 didStopAtEnd:(BOOL)a4 error:(id)a5;
- (void)audioRequestDidStart:(id)a3;
- (void)beginAudioPowerUpdateWithReply:(id)a3;
- (void)cachePresynthesizedAudioRequest:(id)a3;
- (void)cleanUnusedAssets:(id)a3;
- (void)continueSpeechRequest:(id)a3;
- (void)dealloc;
- (void)endAudioPowerUpdate;
- (void)estimateDurationWithRequest:(id)a3 reply:(id)a4;
- (void)forwardStreamObject:(id)a3;
- (void)getAllVoiceSubscriptionsWithReply:(id)a3;
- (void)getFootprintsForVoiceName:(id)a3 languageCode:(id)a4 reply:(id)a5;
- (void)getLocalVoiceResourcesReply:(id)a3;
- (void)getLocalVoicesForLanguage:(id)a3 reply:(id)a4;
- (void)getSpeechIsActiveForConnectionReply:(id)a3;
- (void)getSpeechIsActiveReply:(id)a3;
- (void)getSubscribedVoiceAssetsWithClientID:(id)a3 forAccessoryID:(id)a4 reply:(id)a5;
- (void)getVoiceInfoForLanguageCode:(id)a3 name:(id)a4 footprint:(int64_t)a5 gender:(int64_t)a6 type:(int64_t)a7 reply:(id)a8;
- (void)getVoiceNamesForLanguage:(id)a3 reply:(id)a4;
- (void)getVoiceResourceForLanguage:(id)a3 reply:(id)a4;
- (void)invalidate;
- (void)invokeDaemon:(id)a3;
- (void)killDaemon;
- (void)pauseSpeechRequest:(id)a3 atMark:(int64_t)a4;
- (void)performLanguageFallBackIfNeededWithRequest:(id)a3;
- (void)preprocessRequestBeforeSynthesis:(id)a3;
- (void)prewarmIfNeededWithRequest:(id)a3 reply:(id)a4;
- (void)queryPhaticCapabilityWithRequest:(id)a3 reply:(id)a4;
- (void)setAudioPowerUpdateQueue:(id)a3;
- (void)setAudioPowerUpdater:(id)a3;
- (void)setConnectionIdentifier:(id)a3;
- (void)setHomeManager:(id)a3;
- (void)setHubManagementClient:(id)a3;
- (void)setSubscribedVoiceAssets:(id)a3 withClientID:(id)a4 forAccessoryID:(id)a5;
- (void)setSynthesizerTransaction:(id)a3;
- (void)speechRequest:(id)a3 didReceiveTimingInfo:(id)a4;
- (void)speechRequest:(id)a3 didReportInstrumentMetrics:(id)a4;
- (void)speechRequest:(id)a3 didStartWithMark:(int64_t)a4 forRange:(_NSRange)a5;
- (void)speechRequest:(id)a3 didStopWithSuccess:(BOOL)a4 phonemesSpoken:(id)a5 error:(id)a6;
- (void)speechRequestDidContinue:(id)a3;
- (void)speechRequestDidPause:(id)a3;
- (void)speechRequestDidStart:(id)a3;
- (void)startPhonemesRequest:(id)a3 phonemeSystem:(int64_t)a4 reply:(id)a5;
- (void)startPresynthesizedAudioRequest:(id)a3;
- (void)startSpeechRequest:(id)a3 reply:(id)a4;
- (void)startSynthesisRequest:(id)a3;
- (void)stopPresynthesizedAudioRequest:(id)a3;
- (void)stopSpeechRequest:(id)a3 atMark:(int64_t)a4;
- (void)synthesisRequest:(id)a3 didFinishWithInstrumentMetrics:(id)a4 error:(id)a5;
- (void)synthesisRequest:(id)a3 didGenerateAudioChunk:(id)a4;
- (void)synthesisRequest:(id)a3 didReceiveTimingInfo:(id)a4;
- (void)triggerCellularDownloadedVoiceAssets:(id)a3 withClientID:(id)a4;
- (void)updateWithConnectionIdentifier:(id)a3 keepActive:(BOOL)a4;
@end

@implementation VSSpeechXPCHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synthesizerTransaction, 0);
  objc_storeStrong((id *)&self->_audioPowerUpdater, 0);
  objc_storeStrong((id *)&self->_audioPowerUpdateQueue, 0);
  objc_storeStrong((id *)&self->_homeManager, 0);
  objc_storeStrong((id *)&self->_hubManagementClient, 0);
  objc_storeStrong((id *)&self->_connectionIdentifier, 0);
  objc_destroyWeak((id *)&self->_connection);
}

- (void)setSynthesizerTransaction:(id)a3
{
}

- (OS_os_transaction)synthesizerTransaction
{
  return self->_synthesizerTransaction;
}

- (void)setAudioPowerUpdater:(id)a3
{
}

- (void)setAudioPowerUpdateQueue:(id)a3
{
}

- (void)setHomeManager:(id)a3
{
}

- (VSHMHomeManager)homeManager
{
  return self->_homeManager;
}

- (void)setHubManagementClient:(id)a3
{
}

- (VSHHManagementClient)hubManagementClient
{
  return self->_hubManagementClient;
}

- (void)setConnectionIdentifier:(id)a3
{
}

- (NSString)connectionIdentifier
{
  return self->_connectionIdentifier;
}

- (void)killDaemon
{
  v2 = VSGetLogDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_226CB1000, v2, OS_LOG_TYPE_DEFAULT, "Received killDaemon, shutting down", v3, 2u);
  }

  exit(0);
}

- (void)invokeDaemon:(id)a3
{
  v3 = (void (**)(id, void))a3;
  v4 = VSGetLogDefault();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_226CB1000, v4, OS_LOG_TYPE_DEFAULT, "Received invokeDaemon, I'm listening", v6, 2u);
  }

  if (v3)
  {
    uint64_t v5 = getpid();
    v3[2](v3, v5);
  }
}

- (void)forwardStreamObject:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [v3 streamId];

  uint64_t v5 = VSGetLogDefault();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7 = [v3 streamId];
      int v9 = 138412546;
      id v10 = v3;
      __int16 v11 = 2112;
      v12 = v7;
      _os_log_impl(&dword_226CB1000, v6, OS_LOG_TYPE_INFO, "Enqueue stream object %@, streamId: %@", (uint8_t *)&v9, 0x16u);
    }
    v6 = +[VSInlineStreamService sharedService];
    v8 = [v3 streamId];
    [v6 enqueueStreamId:v8 withObject:v3];
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v9 = 138412290;
    id v10 = v3;
    _os_log_error_impl(&dword_226CB1000, v6, OS_LOG_TYPE_ERROR, "Ignore stream object with nil stream ID: %@", (uint8_t *)&v9, 0xCu);
  }
}

- (void)getVoiceInfoForLanguageCode:(id)a3 name:(id)a4 footprint:(int64_t)a5 gender:(int64_t)a6 type:(int64_t)a7 reply:(id)a8
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  uint64_t v13 = (char *)a3;
  id v14 = a4;
  v15 = (void (**)(id, void, void *))a8;
  v16 = VSGetLogDefault();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = [NSNumber numberWithLong:a6];
    *(_DWORD *)buf = 138543874;
    v45 = v13;
    __int16 v46 = 2112;
    id v47 = v14;
    __int16 v48 = 2112;
    v49 = v17;
    _os_log_impl(&dword_226CB1000, v16, OS_LOG_TYPE_INFO, "Begin getVoiceInfoForLanguageCode: %{public}@, %@, %@", buf, 0x20u);
  }
  if (v15)
  {
    if (!v13)
    {
      v21 = (void *)MEMORY[0x263F087E8];
      uint64_t v42 = *MEMORY[0x263F08320];
      v43 = @"Missing languageCode";
      v19 = [NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];
      v22 = [v21 errorWithDomain:@"VoiceServicesErrorDomain" code:100 userInfo:v19];
      v15[2](v15, 0, v22);
LABEL_18:

      goto LABEL_19;
    }
    v18 = [MEMORY[0x263F84E40] sharedManager];
    v19 = [v18 selectVoiceForLang:v13 name:v14 type:a7 gender:a6 footprint:a5];

    v20 = [v19 voiceData];
    if ([v20 footprint] == 1)
    {
    }
    else
    {
      if (!v14)
      {
LABEL_14:

        goto LABEL_15;
      }
      v23 = [v19 voiceData];
      v24 = [v23 name];
      char v25 = [v14 isEqual:v24];

      if (v25)
      {
LABEL_15:
        v39 = VSGetLogDefault();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          v40 = [v19 voiceData];
          *(_DWORD *)buf = 138412290;
          v45 = v40;
          _os_log_impl(&dword_226CB1000, v39, OS_LOG_TYPE_INFO, "End getVoiceInfoForLanguageCode: %@", buf, 0xCu);
        }
        v22 = [v19 voiceData];
        ((void (**)(id, void *, void *))v15)[2](v15, v22, 0);
        goto LABEL_18;
      }
    }
    v26 = [v19 voiceData];
    [v26 setGender:a6];

    v27 = [v19 voiceData];
    [v27 setName:v14];

    v28 = [v19 voiceData];
    [v28 setFootprint:1];

    v29 = [v19 voiceData];
    [v29 setType:1];

    v30 = [v19 voiceData];
    [v30 setContentVersion:&unk_26DADB048];

    v31 = [v19 voiceData];
    v32 = [v31 languages];
    v33 = [v32 firstObject];
    char v34 = [v33 isEqualToString:v13];

    if ((v34 & 1) == 0)
    {
      v35 = [MEMORY[0x263F84EA8] fallbackLanguageForLanguage:v13];
      v41 = v35;
      v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v41 count:1];
      v37 = [v19 voiceData];
      [v37 setLanguages:v36];
    }
    v20 = VSGetLogDefault();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v38 = [v19 voiceData];
      *(_DWORD *)buf = 136315394;
      v45 = "-[VSSpeechXPCHandler getVoiceInfoForLanguageCode:name:footprint:gender:type:reply:]";
      __int16 v46 = 2112;
      id v47 = v38;
      _os_log_impl(&dword_226CB1000, v20, OS_LOG_TYPE_INFO, "%s override voice info for server TTS platform, %@", buf, 0x16u);
    }
    goto LABEL_14;
  }
LABEL_19:
}

- (void)getVoiceResourceForLanguage:(id)a3 reply:(id)a4
{
  id v8 = a3;
  uint64_t v5 = (void (**)(id, void *))a4;
  if (v5)
  {
    if (v8)
    {
      v6 = [MEMORY[0x263F84E40] sharedManager];
      v7 = [v6 selectVoiceResourceAssetForLanguage:v8];
    }
    else
    {
      v7 = 0;
    }
    v5[2](v5, v7);
  }
}

- (void)triggerCellularDownloadedVoiceAssets:(id)a3 withClientID:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = VSGetLogDefault();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v24 = v5;
    _os_log_impl(&dword_226CB1000, v6, OS_LOG_TYPE_DEFAULT, "Preparing cellular download for %@", buf, 0xCu);
  }

  v7 = [MEMORY[0x263F84E40] sharedManager];
  [v7 cancelDownloads:triggerCellularDownloadedVoiceAssets_withClientID__previousDownloads completion:0];

  id v8 = [MEMORY[0x263F84E40] sharedManager];
  [v8 cancelDownloads:v5 completion:0];

  objc_storeStrong((id *)&triggerCellularDownloadedVoiceAssets_withClientID__previousDownloads, a3);
  int v9 = [MEMORY[0x263F84E40] downloadOptionsWithBattery:1];
  [v9 setAllowsCellularAccess:1];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v10 = v5;
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
        v15 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v16 = VSGetLogDefault();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v24 = v15;
          _os_log_impl(&dword_226CB1000, v16, OS_LOG_TYPE_DEFAULT, "Start cellular download for %@", buf, 0xCu);
        }

        v17 = [MEMORY[0x263F84E40] sharedManager];
        [v17 downloadVoiceAsset:v15 options:v9 progressUpdateHandler:0];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }
}

- (void)getAllVoiceSubscriptionsWithReply:(id)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  v28 = (void (**)(id, void *))a3;
  id v3 = [MEMORY[0x263F84E68] defaultInstance];
  v4 = [v3 subscribedVoicesForClientID:0 accessoryID:0];

  id v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = v4;
  uint64_t v31 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v31)
  {
    uint64_t v30 = *(void *)v38;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v38 != v30) {
          objc_enumerationMutation(obj);
        }
        uint64_t v32 = v6;
        v7 = *(void **)(*((void *)&v37 + 1) + 8 * v6);
        id v8 = [MEMORY[0x263F84E40] sharedManager];
        int v9 = [v8 voiceAssetsForSubscription:v7];

        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id v10 = v9;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v33 objects:v41 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v34;
          do
          {
            uint64_t v14 = 0;
            do
            {
              if (*(void *)v34 != v13) {
                objc_enumerationMutation(v10);
              }
              v15 = [*(id *)(*((void *)&v33 + 1) + 8 * v14) voiceData];
              v16 = [v7 voice];
              v17 = [v16 name];
              uint64_t v18 = [v17 length];

              if (v18)
              {
                long long v19 = [v7 voice];
                long long v20 = [v19 name];
                [v15 setName:v20];
              }
              long long v21 = [v7 voice];
              uint64_t v22 = [v21 type];

              if (v22)
              {
                v23 = [v7 voice];
                objc_msgSend(v15, "setType:", objc_msgSend(v23, "type"));
              }
              id v24 = objc_alloc(MEMORY[0x263F84ED8]);
              uint64_t v25 = [v7 clientID];
              v26 = [v7 accessoryID];
              v27 = (void *)[v24 initWithClient:v25 accessory:v26 voice:v15];

              [v5 addObject:v27];
              ++v14;
            }
            while (v12 != v14);
            uint64_t v12 = [v10 countByEnumeratingWithState:&v33 objects:v41 count:16];
          }
          while (v12);
        }

        uint64_t v6 = v32 + 1;
      }
      while (v32 + 1 != v31);
      uint64_t v31 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v31);
  }

  v28[2](v28, v5);
}

- (void)getSubscribedVoiceAssetsWithClientID:(id)a3 forAccessoryID:(id)a4 reply:(id)a5
{
  if (a5)
  {
    v7 = (void *)MEMORY[0x263F84E68];
    id v8 = (void (**)(id, void *))a5;
    id v9 = a4;
    id v10 = a3;
    uint64_t v11 = [v7 defaultInstance];
    uint64_t v12 = [v9 UUIDString];

    if (v12) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = &stru_26DAD0E18;
    }
    id v15 = [v11 subscribedVoicesForClientID:v10 accessoryID:v13];

    uint64_t v14 = [v15 valueForKey:@"voice"];
    v8[2](v8, v14);
  }
}

- (void)setSubscribedVoiceAssets:(id)a3 withClientID:(id)a4 forAccessoryID:(id)a5
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  id v52 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9 && ![(VSHHManagementClient *)self->_hubManagementClient isExistingAccessoryId:v9])
  {
    v41 = VSGetLogDefault();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v66 = v8;
      __int16 v67 = 2112;
      v68 = v9;
      _os_log_error_impl(&dword_226CB1000, v41, OS_LOG_TYPE_ERROR, "ignored client '%{public}@' setting auto-download for a non-existing accessoryId '%@'", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v43 = v9;
    uint64_t v10 = [v9 UUIDString];
    uint64_t v11 = (void *)v10;
    uint64_t v12 = &stru_26DAD0E18;
    if (v10) {
      uint64_t v12 = (__CFString *)v10;
    }
    uint64_t v13 = v12;

    uint64_t v14 = [MEMORY[0x263F84E68] defaultInstance];
    v44 = v13;
    id v45 = v8;
    id v15 = [v14 subscribedVoicesForClientID:v8 accessoryID:v13];

    __int16 v46 = [MEMORY[0x263EFF980] array];
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id obj = v15;
    uint64_t v16 = [obj countByEnumeratingWithState:&v61 objects:v73 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v50 = *(void *)v62;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v62 != v50) {
            objc_enumerationMutation(obj);
          }
          long long v19 = [*(id *)(*((void *)&v61 + 1) + 8 * i) voice];
          long long v57 = 0u;
          long long v58 = 0u;
          long long v59 = 0u;
          long long v60 = 0u;
          id v20 = v52;
          uint64_t v21 = [v20 countByEnumeratingWithState:&v57 objects:v72 count:16];
          if (v21)
          {
            uint64_t v22 = v21;
            uint64_t v23 = *(void *)v58;
            while (2)
            {
              for (uint64_t j = 0; j != v22; ++j)
              {
                if (*(void *)v58 != v23) {
                  objc_enumerationMutation(v20);
                }
                uint64_t v25 = [*(id *)(*((void *)&v57 + 1) + 8 * j) dictionaryRepresentation];
                v26 = [v19 dictionaryRepresentation];
                char v27 = [v25 isEqualToDictionary:v26];

                if (v27)
                {

                  goto LABEL_20;
                }
              }
              uint64_t v22 = [v20 countByEnumeratingWithState:&v57 objects:v72 count:16];
              if (v22) {
                continue;
              }
              break;
            }
          }

          [v46 addObject:v19];
LABEL_20:
        }
        uint64_t v17 = [obj countByEnumeratingWithState:&v61 objects:v73 count:16];
      }
      while (v17);
    }

    v28 = [MEMORY[0x263F84E68] defaultInstance];
    [v28 setSubscribedVoices:v52 forClientID:v45 accessoryID:v44];

    v51 = [MEMORY[0x263EFF980] array];
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v47 = v52;
    uint64_t v29 = [v47 countByEnumeratingWithState:&v53 objects:v71 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v49 = *(void *)v54;
      do
      {
        for (uint64_t k = 0; k != v30; ++k)
        {
          if (*(void *)v54 != v49) {
            objc_enumerationMutation(v47);
          }
          uint64_t v32 = *(void **)(*((void *)&v53 + 1) + 8 * k);
          long long v33 = NSString;
          long long v34 = [v32 languages];
          long long v35 = [v34 firstObject];
          long long v36 = [v32 name];
          long long v37 = objc_msgSend(MEMORY[0x263F84EC0], "typeStringFromType:", objc_msgSend(v32, "type"));
          long long v38 = objc_msgSend(MEMORY[0x263F84EC0], "footprintStringFromFootprint:", objc_msgSend(v32, "footprint"));
          long long v39 = [v33 stringWithFormat:@"%@:%@:%@:%@", v35, v36, v37, v38];
          [v51 addObject:v39];
        }
        uint64_t v30 = [v47 countByEnumeratingWithState:&v53 objects:v71 count:16];
      }
      while (v30);
    }

    long long v40 = VSGetLogDefault();
    v41 = v44;
    id v8 = v45;
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      id v66 = v45;
      __int16 v67 = 2112;
      v68 = v44;
      __int16 v69 = 2114;
      v70 = v51;
      _os_log_impl(&dword_226CB1000, v40, OS_LOG_TYPE_DEFAULT, "client '%{public}@' and accessory '%@' set auto download voice assets:%{public}@", buf, 0x20u);
    }

    uint64_t v42 = [[VSDownloadService alloc] initWithType:2];
    [(VSDownloadService *)v42 cancelDownloadForAssets:v46];
    [(VSDownloadService *)v42 updateVoicesAndVoiceResources];

    id v9 = v43;
  }
}

- (void)getLocalVoiceResourcesReply:(id)a3
{
  if (a3)
  {
    id v3 = (void *)MEMORY[0x263F84E40];
    v4 = (void (**)(id, id, void))a3;
    id v5 = [v3 sharedManager];
    id v6 = [v5 installedVoiceResources];

    v4[2](v4, v6, 0);
  }
}

- (void)getLocalVoicesForLanguage:(id)a3 reply:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (void (**)(id, void *, void))a4;
  if (v6)
  {
    v7 = [MEMORY[0x263EFF980] array];
    id v8 = [MEMORY[0x263F84E40] sharedManager];
    id v9 = [v8 installedAssetsForType:0 voicename:0 language:v5 gender:0 footprint:0];

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v17;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v14), "voiceData", (void)v16);
          [v7 addObject:v15];

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v12);
    }

    v6[2](v6, v7, 0);
  }
}

- (void)cleanUnusedAssets:(id)a3
{
  id v6 = (void (**)(id, void *))a3;
  [(VSHHManagementClient *)self->_hubManagementClient cleanUnknownAccessoriesPreferences];
  if ([MEMORY[0x263F84E20] useSiriTTSServiceV2])
  {
    v4 = 0;
  }
  else
  {
    id v5 = [MEMORY[0x263F84E40] sharedManager];
    v4 = [v5 cleanUnusedAssets];
  }
  if (v6) {
    v6[2](v6, v4);
  }
}

- (void)audioRequest:(id)a3 didStopAtEnd:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  id v11 = a3;
  id v8 = a5;
  id v9 = (void *)MEMORY[0x22A667AA0]();
  id v10 = [(VSSpeechXPCHandler *)self _delegate];
  [v10 audioRequest:v11 didStopAtEnd:v6 error:v8];
}

- (void)audioRequest:(id)a3 didReportInstrumentMetrics:(id)a4 error:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)MEMORY[0x22A667AA0]();
  id v11 = [(VSSpeechXPCHandler *)self _delegate];
  [v11 audioRequest:v12 didReportInstrumentMetrics:v8 error:v9];
}

- (void)audioRequestDidStart:(id)a3
{
  id v6 = a3;
  v4 = (void *)MEMORY[0x22A667AA0]();
  id v5 = [(VSSpeechXPCHandler *)self _delegate];
  [v5 audioRequestDidStart:v6];
}

- (void)synthesisRequest:(id)a3 didFinishWithInstrumentMetrics:(id)a4 error:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)MEMORY[0x22A667AA0]();
  id v11 = [(VSSpeechXPCHandler *)self _delegate];
  [v11 synthesisRequest:v12 didFinishWithInstrumentMetrics:v8 error:v9];
}

- (void)synthesisRequest:(id)a3 didGenerateAudioChunk:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = (void *)MEMORY[0x22A667AA0]();
  id v8 = [(VSSpeechXPCHandler *)self _delegate];
  [v8 synthesisRequest:v9 didGenerateAudioChunk:v6];
}

- (void)synthesisRequest:(id)a3 didReceiveTimingInfo:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = (void *)MEMORY[0x22A667AA0]();
  id v8 = [(VSSpeechXPCHandler *)self _delegate];
  [v8 synthesisRequest:v9 didReceiveTimingInfo:v6];
}

- (void)speechRequest:(id)a3 didReportInstrumentMetrics:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = (void *)MEMORY[0x22A667AA0]();
  id v8 = [(VSSpeechXPCHandler *)self _delegate];
  [v8 speechRequest:v9 didReportInstrumentMetrics:v6];
}

- (void)speechRequest:(id)a3 didReceiveTimingInfo:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(VSSpeechXPCHandler *)self _delegate];
  [v8 speechRequest:v7 didReceiveTimingInfo:v6];
}

- (void)speechRequest:(id)a3 didStopWithSuccess:(BOOL)a4 phonemesSpoken:(id)a5 error:(id)a6
{
  BOOL v8 = a4;
  id v14 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = (void *)MEMORY[0x22A667AA0]();
  uint64_t v13 = [(VSSpeechXPCHandler *)self _delegate];
  [v13 speechRequest:v14 didStopWithSuccess:v8 phonemesSpoken:v10 error:v11];
}

- (void)speechRequest:(id)a3 didStartWithMark:(int64_t)a4 forRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v11 = a3;
  id v9 = (void *)MEMORY[0x22A667AA0]();
  id v10 = [(VSSpeechXPCHandler *)self _delegate];
  objc_msgSend(v10, "speechRequest:didStartWithMark:forRange:", v11, a4, location, length);
}

- (void)speechRequestDidContinue:(id)a3
{
  id v6 = a3;
  v4 = (void *)MEMORY[0x22A667AA0]();
  id v5 = [(VSSpeechXPCHandler *)self _delegate];
  [v5 speechRequestDidContinue:v6];
}

- (void)speechRequestDidPause:(id)a3
{
  id v6 = a3;
  v4 = (void *)MEMORY[0x22A667AA0]();
  id v5 = [(VSSpeechXPCHandler *)self _delegate];
  [v5 speechRequestDidPause:v6];
}

- (void)speechRequestDidStart:(id)a3
{
  id v6 = a3;
  v4 = (void *)MEMORY[0x22A667AA0]();
  id v5 = [(VSSpeechXPCHandler *)self _delegate];
  [v5 speechRequestDidStart:v6];
}

- (id)_delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  id v3 = [WeakRetained remoteObjectProxy];

  return v3;
}

- (void)getFootprintsForVoiceName:(id)a3 languageCode:(id)a4 reply:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void *))a5;
  if (v9)
  {
    id v10 = [MEMORY[0x263F84E40] sharedManager];
    id v21 = v7;
    id v11 = [v10 installedAssetsForType:0 voicename:v7 language:v8 gender:0 footprint:0];

    id v12 = [MEMORY[0x263EFF980] array];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v13 = v11;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v23;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v23 != v16) {
            objc_enumerationMutation(v13);
          }
          long long v18 = NSNumber;
          long long v19 = [*(id *)(*((void *)&v22 + 1) + 8 * v17) voiceData];
          id v20 = objc_msgSend(v18, "numberWithLong:", objc_msgSend(v19, "footprint"));
          [v12 addObject:v20];

          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v15);
    }

    v9[2](v9, v12);
    id v7 = v21;
  }
}

- (void)getVoiceNamesForLanguage:(id)a3 reply:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (void (**)(id, void *))a4;
  if (v6)
  {
    id v7 = [MEMORY[0x263EFF980] array];
    id v8 = [MEMORY[0x263F84E40] sharedManager];
    id v9 = [v8 installedAssetsForType:0 voicename:0 language:v5 gender:0 footprint:0];

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v14), "voiceData", (void)v17);
          uint64_t v16 = [v15 name];
          [v7 addObject:v16];

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v12);
    }

    v6[2](v6, v7);
  }
}

- (void)endAudioPowerUpdate
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = VSGetLogDefault();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    id v6 = "-[VSSpeechXPCHandler endAudioPowerUpdate]";
    _os_log_impl(&dword_226CB1000, v3, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v5, 0xCu);
  }

  v4 = [(VSSpeechXPCHandler *)self audioPowerUpdater];
  [v4 endUpdate];

  [(VSSpeechXPCHandler *)self setAudioPowerUpdater:0];
}

- (void)beginAudioPowerUpdateWithReply:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = VSGetLogDefault();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v11 = "-[VSSpeechXPCHandler beginAudioPowerUpdateWithReply:]";
    _os_log_impl(&dword_226CB1000, v5, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  if (v4)
  {
    id v6 = [(VSSpeechXPCHandler *)self audioPowerUpdater];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __53__VSSpeechXPCHandler_beginAudioPowerUpdateWithReply___block_invoke;
    v8[3] = &unk_2647DC848;
    id v9 = v4;
    [v6 createNewXPCWrapperWithCompletion:v8];

    uint64_t v7 = [(VSSpeechXPCHandler *)self audioPowerUpdater];
    [v7 beginUpdate];
  }
}

uint64_t __53__VSSpeechXPCHandler_beginAudioPowerUpdateWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (AFAudioPowerUpdater)audioPowerUpdater
{
  audioPowerUpdater = self->_audioPowerUpdater;
  if (!audioPowerUpdater)
  {
    id v4 = +[VSSpeechAudioPowerService sharedServices];
    id v5 = objc_alloc(MEMORY[0x263F28428]);
    id v6 = [(VSSpeechXPCHandler *)self audioPowerUpdateQueue];
    uint64_t v7 = (AFAudioPowerUpdater *)[v5 initWithProvider:v4 queue:v6 frequency:1 delegate:0];
    id v8 = self->_audioPowerUpdater;
    self->_audioPowerUpdater = v7;

    audioPowerUpdater = self->_audioPowerUpdater;
  }
  return audioPowerUpdater;
}

- (OS_dispatch_queue)audioPowerUpdateQueue
{
  audioPowerUpdateQueue = self->_audioPowerUpdateQueue;
  if (!audioPowerUpdateQueue)
  {
    id v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    id v5 = (OS_dispatch_queue *)dispatch_queue_create("VSAudioPowerUpdateQueue", v4);
    id v6 = self->_audioPowerUpdateQueue;
    self->_audioPowerUpdateQueue = v5;

    audioPowerUpdateQueue = self->_audioPowerUpdateQueue;
  }
  return audioPowerUpdateQueue;
}

- (void)startPhonemesRequest:(id)a3 phonemeSystem:(int64_t)a4 reply:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  [(VSSpeechXPCHandler *)self preprocessRequestBeforeSynthesis:v8];
  id v10 = [(VSSpeechSpeakTask *)[VSTextToPhonemesTask alloc] initWithRequest:v8];
  [(VSSpeechSpeakTask *)v10 setDelegate:self];
  [(VSTextToPhonemesTask *)v10 setReply:v9];
  uint64_t v11 = VSGetLogDefault();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = [v8 requestCreatedTimestamp];
    _os_log_impl(&dword_226CB1000, v11, OS_LOG_TYPE_DEFAULT, "Created phonemes task %llu", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v23 = 0x3032000000;
  long long v24 = __Block_byref_object_copy_;
  long long v25 = __Block_byref_object_dispose_;
  id v26 = (id)os_transaction_create();
  objc_initWeak(&location, v10);
  [(VSTextToPhonemesTask *)v10 setPhonemeSystem:a4];
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  uint64_t v16 = __63__VSSpeechXPCHandler_startPhonemesRequest_phonemeSystem_reply___block_invoke;
  long long v17 = &unk_2647DC820;
  p_long long buf = &buf;
  objc_copyWeak(&v20, &location);
  id v12 = v9;
  id v18 = v12;
  [(VSTextToPhonemesTask *)v10 setCompletionBlock:&v14];
  uint64_t v13 = +[VSSpeechTaskQueue mainDeviceQueue];
  [v13 addTask:v10];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
  _Block_object_dispose(&buf, 8);
}

void __63__VSSpeechXPCHandler_startPhonemesRequest_phonemeSystem_reply___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = [WeakRetained phonemes];
  id v6 = [v5 firstObject];
  uint64_t v7 = [WeakRetained error];
  (*(void (**)(uint64_t, void *, void *))(v4 + 16))(v4, v6, v7);
}

- (void)getSpeechIsActiveForConnectionReply:(id)a3
{
  id v9 = (void (**)(id, BOOL))a3;
  uint64_t v4 = +[VSSpeechTaskQueue mainDeviceQueue];
  id v5 = [v4 currentTask];

  if ([v5 conformsToProtocol:&unk_26DADCB08])
  {
    id v6 = v5;
    if ([v6 isSpeaking])
    {
      uint64_t v7 = [v6 delegate];
      BOOL v8 = v7 == self;
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }
  if (v9) {
    v9[2](v9, v8);
  }
}

- (void)getSpeechIsActiveReply:(id)a3
{
  id v6 = (void (**)(id, uint64_t))a3;
  id v3 = +[VSSpeechTaskQueue mainDeviceQueue];
  uint64_t v4 = [v3 currentTask];

  if ([v4 conformsToProtocol:&unk_26DADCB08]) {
    uint64_t v5 = [v4 isSpeaking];
  }
  else {
    uint64_t v5 = 0;
  }
  if (v6) {
    v6[2](v6, v5);
  }
}

- (void)stopSpeechRequest:(id)a3 atMark:(int64_t)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = +[VSSpeechTaskQueue mainDeviceQueue];
  id v6 = [v4 accessoryID];

  if (v6)
  {
    uint64_t v7 = [v4 accessoryID];
    BOOL v8 = [v7 UUIDString];
    uint64_t v9 = +[VSSpeechTaskQueue parallelQueueWithIdentifier:v8];

    uint64_t v5 = (void *)v9;
  }
  id v10 = objc_msgSend(v5, "taskWithCreatedTimeStamp:", objc_msgSend(v4, "requestCreatedTimestamp"));
  if (v10)
  {
    [v5 cancelTask:v10];
  }
  else
  {
    uint64_t v11 = VSGetLogDefault();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 134217984;
      uint64_t v13 = [v4 requestCreatedTimestamp];
      _os_log_impl(&dword_226CB1000, v11, OS_LOG_TYPE_DEFAULT, "Ignore stopSpeechRequest. Cannot find task with associated request %llu.", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (void)continueSpeechRequest:(id)a3
{
  id v3 = a3;
  id v4 = +[VSSpeechTaskQueue mainDeviceQueue];
  uint64_t v5 = [v3 accessoryID];

  if (v5)
  {
    id v6 = [v3 accessoryID];
    uint64_t v7 = [v6 UUIDString];
    uint64_t v8 = +[VSSpeechTaskQueue parallelQueueWithIdentifier:v7];

    id v4 = (void *)v8;
  }
  uint64_t v9 = [v4 currentTask];
  uint64_t v10 = [v4 createdTimestampWithTask:v9];

  if (v3 && [v3 requestCreatedTimestamp] != v10)
  {
    uint64_t v11 = VSGetLogDefault();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v12 = 0;
      _os_log_impl(&dword_226CB1000, v11, OS_LOG_TYPE_DEFAULT, "Ignore continueSpeechRequest. Current request is different than requested request.", v12, 2u);
    }
  }
  else
  {
    [v4 resumeCurrentTask];
  }
}

- (void)pauseSpeechRequest:(id)a3 atMark:(int64_t)a4
{
  id v4 = a3;
  uint64_t v5 = +[VSSpeechTaskQueue mainDeviceQueue];
  id v6 = [v4 accessoryID];

  if (v6)
  {
    uint64_t v7 = [v4 accessoryID];
    uint64_t v8 = [v7 UUIDString];
    uint64_t v9 = +[VSSpeechTaskQueue parallelQueueWithIdentifier:v8];

    uint64_t v5 = (void *)v9;
  }
  uint64_t v10 = [v5 currentTask];
  uint64_t v11 = [v5 createdTimestampWithTask:v10];

  if (v4 && [v4 requestCreatedTimestamp] != v11)
  {
    int v12 = VSGetLogDefault();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl(&dword_226CB1000, v12, OS_LOG_TYPE_DEFAULT, "Ignore pauseSpeechRequest. Current request is different than requested request.", v13, 2u);
    }
  }
  else
  {
    [v5 suspendCurrentTask];
  }
}

- (void)startSynthesisRequest:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(VSSpeechXPCHandler *)self preprocessRequestBeforeSynthesis:v4];
  if (+[VSServerTTSClient shouldUseServerTTSForRequest:v4])
  {
    uint64_t v5 = [[VSSpeechServerTask alloc] initWithRequest:v4 shouldSpeak:0];
    [(VSSpeechServerTask *)v5 setDelegate:self];
    id v6 = VSGetLogDefault();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [(VSSpeechServerTask *)v5 instrumentMetrics];
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = [v7 requestCreatedTimestamp];
      _os_log_impl(&dword_226CB1000, v6, OS_LOG_TYPE_DEFAULT, "Created server synthesis task %llu", (uint8_t *)&buf, 0xCu);
    }
  }
  else
  {
    uint64_t v5 = [[VSSpeechSynthesisTask alloc] initWithRequest:v4];
    [(VSSpeechServerTask *)v5 setDelegate:self];
    id v6 = VSGetLogDefault();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [(VSSpeechServerTask *)v5 instrumentMetrics];
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = [v8 requestCreatedTimestamp];
      _os_log_impl(&dword_226CB1000, v6, OS_LOG_TYPE_DEFAULT, "Created synthesis task %llu", (uint8_t *)&buf, 0xCu);
    }
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy_;
  long long v24 = __Block_byref_object_dispose_;
  id v25 = (id)os_transaction_create();
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __44__VSSpeechXPCHandler_startSynthesisRequest___block_invoke;
  v18[3] = &unk_2647DC7F8;
  v18[4] = &buf;
  [(VSSpeechServerTask *)v5 setCompletionBlock:v18];
  uint64_t v9 = +[VSInlineStreamService sharedService];
  int v10 = [v9 hasInlineStreamRequestForSpeakRequest:v4];

  if (v10)
  {
    uint64_t v11 = VSGetLogDefault();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = [(VSSpeechServerTask *)v5 instrumentMetrics];
      uint64_t v13 = [v12 requestCreatedTimestamp];
      *(_DWORD *)long long v19 = 134217984;
      uint64_t v20 = v13;
      _os_log_impl(&dword_226CB1000, v11, OS_LOG_TYPE_DEFAULT, "Found matched inline streaming request, cancel synthesis task %llu", v19, 0xCu);
    }
    [(VSSpeechServerTask *)v5 cancel];
  }
  else
  {
    uint64_t v14 = [v4 accessoryID];

    if (v14)
    {
      uint64_t v15 = [v4 accessoryID];
      uint64_t v16 = [v15 UUIDString];
      long long v17 = +[VSSpeechTaskQueue parallelQueueWithIdentifier:v16];
      [v17 addTask:v5];
    }
    else
    {
      uint64_t v15 = +[VSSpeechTaskQueue mainDeviceQueue];
      [v15 addTask:v5];
    }
  }
  _Block_object_dispose(&buf, 8);
}

void __44__VSSpeechXPCHandler_startSynthesisRequest___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

- (void)stopPresynthesizedAudioRequest:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 accessoryID];

  if (v4)
  {
    uint64_t v5 = [v3 accessoryID];
    id v6 = [v5 UUIDString];
    uint64_t v7 = +[VSSpeechTaskQueue parallelQueueWithIdentifier:v6];
  }
  else
  {
    uint64_t v7 = +[VSSpeechTaskQueue mainDeviceQueue];
  }
  uint64_t v8 = objc_msgSend(v7, "taskWithCreatedTimeStamp:", objc_msgSend(v3, "requestCreatedTimestamp"));
  if (v8)
  {
    [v7 cancelTask:v8];
  }
  else
  {
    uint64_t v9 = VSGetLogDefault();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134217984;
      uint64_t v11 = [v3 requestCreatedTimestamp];
      _os_log_impl(&dword_226CB1000, v9, OS_LOG_TYPE_DEFAULT, "Ignore stopPresynthesizedAudioRequest. Cannot find task with associated request %llu.", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)cachePresynthesizedAudioRequest:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 identifier];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    id v6 = +[VSInlineStreamService sharedService];
    [v6 addInlineStreamRequest:v3];
  }
  else
  {
    id v6 = [MEMORY[0x263F84E18] audioDataFromPresynthesisRequest:v3];
    [v6 duration];
    if (v7 == 0.0)
    {
      int v10 = VSGetLogDefault();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 134217984;
        uint64_t v14 = [v3 requestCreatedTimestamp];
        _os_log_impl(&dword_226CB1000, v10, OS_LOG_TYPE_DEFAULT, "Cache #PresynthesizedRequest %llu skipped: no audio", (uint8_t *)&v13, 0xCu);
      }
    }
    else
    {
      uint64_t v8 = +[VSCachingService standardService];
      uint64_t v9 = [v3 text];
      [v8 enqueueShortTermCacheWithHash:v9 audio:v6 timingInfo:0 voiceKey:@"unknown:unknown:PresynthesizedAudio" voiceResourceKey:@"unknown:PresynthesizedAudio:unknown" completion:0];

      int v10 = VSGetLogDefault();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = [v3 requestCreatedTimestamp];
        uint64_t v12 = [v3 logText];
        int v13 = 134218242;
        uint64_t v14 = v11;
        __int16 v15 = 2112;
        uint64_t v16 = v12;
        _os_log_impl(&dword_226CB1000, v10, OS_LOG_TYPE_DEFAULT, "Cache #PresynthesizedRequest %llu with text: %@", (uint8_t *)&v13, 0x16u);
      }
    }
  }
}

- (void)startPresynthesizedAudioRequest:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 siriRequestId];
  if (v5)
  {
    id v6 = [v4 clientBundleIdentifier];
    BOOL v7 = +[VSSpeechXPCHandler isSiriClientBundleIdentifier:v6];

    if (!v7)
    {
      uint64_t v8 = VSGetLogDefault();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        id v21 = [v4 clientBundleIdentifier];
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v21;
        _os_log_fault_impl(&dword_226CB1000, v8, OS_LOG_TYPE_FAULT, "Unexpected client '%{public}@' sets Siri request ID.", (uint8_t *)&buf, 0xCu);
      }
      [v4 setSiriRequestId:0];
    }
  }
  uint64_t v9 = [v4 siriRequestId];

  if (v9)
  {
    int v10 = [VSSiriInstrumentation alloc];
    uint64_t v11 = [v4 siriRequestId];
    uint64_t v9 = [(VSSiriInstrumentation *)v10 initWithSiriRequestId:v11];

    uint64_t v12 = [v4 text];
    [(VSSiriInstrumentation *)v9 instrumentRequestReceivedWithText:v12 requestedVoiceType:0 requestedVoiceFootprint:0 isPrivate:0];
  }
  int v13 = [[VSSpeechPresynthesizedTask alloc] initWithRequest:v4];
  [(VSSpeechPresynthesizedTask *)v13 setDelegate:self];
  uint64_t v14 = VSGetLogDefault();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v15 = [(VSSpeechPresynthesizedTask *)v13 instrumentMetrics];
    uint64_t v16 = [v15 requestCreatedTimestamp];
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v16;
    _os_log_impl(&dword_226CB1000, v14, OS_LOG_TYPE_DEFAULT, "Created presynthesized task %llu", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy_;
  uint64_t v26 = __Block_byref_object_dispose_;
  id v27 = (id)os_transaction_create();
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __54__VSSpeechXPCHandler_startPresynthesizedAudioRequest___block_invoke;
  v22[3] = &unk_2647DC7F8;
  v22[4] = &buf;
  [(VSSpeechPresynthesizedTask *)v13 setCompletionBlock:v22];
  if (v9 && (objc_opt_respondsToSelector() & 1) != 0) {
    [(VSSpeechPresynthesizedTask *)v13 setSiriInstrumentation:v9];
  }
  uint64_t v17 = [v4 accessoryID];

  if (v17)
  {
    id v18 = [v4 accessoryID];
    long long v19 = [v18 UUIDString];
    uint64_t v20 = +[VSSpeechTaskQueue parallelQueueWithIdentifier:v19];
    [v20 addTask:v13];
  }
  else
  {
    id v18 = +[VSSpeechTaskQueue mainDeviceQueue];
    [v18 addTask:v13];
  }

  _Block_object_dispose(&buf, 8);
}

void __54__VSSpeechXPCHandler_startPresynthesizedAudioRequest___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

- (void)startSpeechRequest:(id)a3 reply:(id)a4
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  [(VSSpeechXPCHandler *)self preprocessRequestBeforeSynthesis:v6];
  uint64_t v8 = [v6 siriRequestId];

  if (v8)
  {
    uint64_t v9 = [VSSiriInstrumentation alloc];
    int v10 = [v6 siriRequestId];
    uint64_t v8 = [(VSSiriInstrumentation *)v9 initWithSiriRequestId:v10];

    uint64_t v11 = [v6 text];
    -[VSSiriInstrumentation instrumentRequestReceivedWithText:requestedVoiceType:requestedVoiceFootprint:isPrivate:](v8, "instrumentRequestReceivedWithText:requestedVoiceType:requestedVoiceFootprint:isPrivate:", v11, [v6 voiceType], objc_msgSend(v6, "footprint"), objc_msgSend(v6, "canUseServerTTS") ^ 1);
  }
  uint64_t v12 = [MEMORY[0x263F84E68] defaultInstance];
  int v13 = [MEMORY[0x263EFF910] date];
  [v12 setLastTTSRequestDate:v13];

  uint64_t v14 = [MEMORY[0x263F84E90] standardInstance];
  int v15 = [v14 disableInlineStreamTTS];

  if (v15)
  {
    uint64_t v16 = VSGetLogDefault();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_226CB1000, v16, OS_LOG_TYPE_DEFAULT, "Server Inline Streaming TTS is disabled in internal settings", (uint8_t *)&buf, 2u);
    }
  }
  uint64_t v17 = [MEMORY[0x263F84E90] standardInstance];
  int v18 = [v17 disableServerTTS];

  if (v18)
  {
    long long v19 = VSGetLogDefault();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_226CB1000, v19, OS_LOG_TYPE_DEFAULT, "Server TTS is disabled in internal settings", (uint8_t *)&buf, 2u);
    }
  }
  uint64_t v20 = +[VSInlineStreamService sharedService];
  id v21 = [v20 popInlineStreamRequestForSpeakRequest:v6];

  if (((v15 | v18) & 1) != 0 || !v21)
  {
    if (+[VSServerTTSClient shouldUseServerTTSForRequest:v6])
    {
      uint64_t v29 = [[VSSpeechServerTask alloc] initWithRequest:v6 shouldSpeak:1];
      [(VSSpeechServerTask *)v29 setDelegate:self];
      id v25 = v29;
      uint64_t v26 = VSGetLogDefault();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v30 = [(VSSpeechServerTask *)v25 instrumentMetrics];
        uint64_t v31 = [v30 requestCreatedTimestamp];
        LODWORD(buf) = 134217984;
        *(void *)((char *)&buf + 4) = v31;
        _os_log_impl(&dword_226CB1000, v26, OS_LOG_TYPE_DEFAULT, "Created server speak task %llu", (uint8_t *)&buf, 0xCu);
      }
    }
    else
    {
      uint64_t v32 = [[VSSpeechSpeakTask alloc] initWithRequest:v6];
      [(VSSpeechSpeakTask *)v32 setDelegate:self];
      id v25 = v32;
      uint64_t v26 = VSGetLogDefault();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        long long v33 = [(VSSpeechServerTask *)v25 instrumentMetrics];
        uint64_t v34 = [v33 requestCreatedTimestamp];
        LODWORD(buf) = 134217984;
        *(void *)((char *)&buf + 4) = v34;
        _os_log_impl(&dword_226CB1000, v26, OS_LOG_TYPE_DEFAULT, "Created speak task %llu", (uint8_t *)&buf, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v22 = [VSSiriInlineTTSStreamTask alloc];
    uint64_t v23 = [v21 identifier];
    uint64_t v24 = [(VSSiriInlineTTSStreamTask *)v22 initWithRequest:v6 withStreamID:v23];

    [(VSSiriInlineTTSStreamTask *)v24 setDelegate:self];
    id v25 = v24;
    uint64_t v26 = VSGetLogDefault();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      id v27 = [(VSSpeechServerTask *)v25 instrumentMetrics];
      uint64_t v28 = [v27 requestCreatedTimestamp];
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v28;
      _os_log_impl(&dword_226CB1000, v26, OS_LOG_TYPE_DEFAULT, "Created stream speak task %llu", (uint8_t *)&buf, 0xCu);
    }
  }

  if (v8 && (objc_opt_respondsToSelector() & 1) != 0) {
    [(VSSpeechServerTask *)v25 setSiriInstrumentation:v8];
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v47 = 0x3032000000;
  __int16 v48 = __Block_byref_object_copy_;
  uint64_t v49 = __Block_byref_object_dispose_;
  id v50 = (id)os_transaction_create();
  uint64_t v40 = MEMORY[0x263EF8330];
  uint64_t v41 = 3221225472;
  uint64_t v42 = __47__VSSpeechXPCHandler_startSpeechRequest_reply___block_invoke;
  uint64_t v43 = &unk_2647DC7D0;
  p_long long buf = &buf;
  id v35 = v7;
  id v44 = v35;
  [(VSSpeechServerTask *)v25 setCompletionBlock:&v40];
  long long v36 = objc_msgSend(v6, "accessoryID", v40, v41, v42, v43);

  if (v36)
  {
    long long v37 = [v6 accessoryID];
    long long v38 = [v37 UUIDString];
    long long v39 = +[VSSpeechTaskQueue parallelQueueWithIdentifier:v38];
    [v39 addTask:v25];
  }
  else
  {
    long long v37 = +[VSSpeechTaskQueue mainDeviceQueue];
    [v37 addTask:v25];
  }

  _Block_object_dispose(&buf, 8);
}

uint64_t __47__VSSpeechXPCHandler_startSpeechRequest_reply___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    uint64_t v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

- (void)estimateDurationWithRequest:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    [(VSSpeechXPCHandler *)self preprocessRequestBeforeSynthesis:v6];
    uint64_t v8 = [[VSDurationEstimationTask alloc] initWithRequest:v6];
    objc_initWeak(&location, v8);
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x3032000000;
    v21[3] = __Block_byref_object_copy_;
    v21[4] = __Block_byref_object_dispose_;
    id v22 = (id)os_transaction_create();
    uint64_t v14 = MEMORY[0x263EF8330];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __56__VSSpeechXPCHandler_estimateDurationWithRequest_reply___block_invoke;
    uint64_t v17 = &unk_2647DC820;
    objc_copyWeak(&v20, &location);
    id v18 = v7;
    long long v19 = v21;
    [(VSDurationEstimationTask *)v8 setCompletionBlock:&v14];
    uint64_t v9 = +[VSSpeechTaskQueue mainDeviceQueue];
    int v10 = [v6 accessoryID];

    if (v10)
    {
      uint64_t v11 = [v6 accessoryID];
      uint64_t v12 = [v11 UUIDString];
      uint64_t v13 = +[VSSpeechTaskQueue parallelQueueWithIdentifier:v12];

      uint64_t v9 = (void *)v13;
    }
    [v9 addTask:v8];

    objc_destroyWeak(&v20);
    _Block_object_dispose(v21, 8);

    objc_destroyWeak(&location);
  }
}

void __56__VSSpeechXPCHandler_estimateDurationWithRequest_reply___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v2 = *(void *)(a1 + 32);
  [WeakRetained estimatedDuration];
  double v4 = v3;
  uint64_t v5 = [WeakRetained error];
  (*(void (**)(uint64_t, void *, double))(v2 + 16))(v2, v5, v4);

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;
}

- (void)queryPhaticCapabilityWithRequest:(id)a3 reply:(id)a4
{
  uint64_t v6 = (void (**)(id, uint64_t))a4;
  if (v6)
  {
    uint64_t v17 = v6;
    id v7 = a3;
    [(VSSpeechXPCHandler *)self performLanguageFallBackIfNeededWithRequest:v7];
    uint64_t v8 = [MEMORY[0x263F84E40] sharedManager];
    uint64_t v9 = [v7 languageCode];
    int v10 = [v7 voiceName];
    uint64_t v11 = [v7 voiceType];
    uint64_t v12 = [v7 gender];
    uint64_t v13 = [v7 footprint];

    uint64_t v14 = [v8 selectVoiceForLang:v9 name:v10 type:v11 gender:v12 footprint:v13];

    if (v14)
    {
      uint64_t v15 = (void *)MEMORY[0x263F84E88];
      uint64_t v16 = [v14 voicePath];
      v17[2](v17, [v15 hasPhaticResponses:v16]);
    }
    else
    {
      ((void (*)(void))v17[2])();
    }

    uint64_t v6 = v17;
  }
}

- (void)prewarmIfNeededWithRequest:(id)a3 reply:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  uint64_t v8 = +[VSSpeechTaskQueue mainDeviceQueue];
  uint64_t v9 = [v8 currentTask];

  if (v9)
  {
    int v10 = VSGetLogDefault();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412546;
      uint64_t v14 = v9;
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl(&dword_226CB1000, v10, OS_LOG_TYPE_DEFAULT, "Find on-going task: %@, ignoring prewarm request: %@", (uint8_t *)&v13, 0x16u);
    }

    if (v7)
    {
      uint64_t v11 = [MEMORY[0x263F087E8] errorWithDomain:@"VoiceServicesErrorDomain" code:407 userInfo:0];
      v7[2](v7, v11);
    }
  }
  else
  {
    [(VSSpeechXPCHandler *)self performLanguageFallBackIfNeededWithRequest:v6];
    uint64_t v12 = +[VSPrewarmService sharedService];
    [v12 prewarmWithRequest:v6];

    if (v7) {
      v7[2](v7, 0);
    }
  }
}

- (void)updateWithConnectionIdentifier:(id)a3 keepActive:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = a3;
  uint64_t v8 = VSGetLogDefault();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v16 = 138543618;
    id v17 = v7;
    __int16 v18 = 1024;
    BOOL v19 = v4;
    _os_log_impl(&dword_226CB1000, v8, OS_LOG_TYPE_INFO, "Update with connection identifier: %{public}@, keepActive:%{BOOL}d", (uint8_t *)&v16, 0x12u);
  }

  objc_storeStrong((id *)&self->_connectionIdentifier, a3);
  synthesizerTransaction = self->_synthesizerTransaction;
  if (v4)
  {
    if (!synthesizerTransaction)
    {
      int v10 = VSGetLogDefault();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v16 = 138412290;
        id v17 = v7;
        _os_log_impl(&dword_226CB1000, v10, OS_LOG_TYPE_INFO, "Keep active session for '%@'", (uint8_t *)&v16, 0xCu);
      }

      [v7 UTF8String];
      uint64_t v11 = (OS_os_transaction *)os_transaction_create();
      uint64_t v12 = 1;
LABEL_12:
      uint64_t v14 = self->_synthesizerTransaction;
      self->_synthesizerTransaction = v11;

      __int16 v15 = +[VSPrewarmService sharedService];
      objc_msgSend(v15, "setActiveSessionCount:", objc_msgSend(v15, "activeSessionCount") + v12);
    }
  }
  else if (synthesizerTransaction)
  {
    int v13 = VSGetLogDefault();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412290;
      id v17 = v7;
      _os_log_impl(&dword_226CB1000, v13, OS_LOG_TYPE_INFO, "Remove active session for '%@'", (uint8_t *)&v16, 0xCu);
    }

    uint64_t v11 = 0;
    uint64_t v12 = -1;
    goto LABEL_12;
  }
}

- (void)preprocessRequestBeforeSynthesis:(id)a3
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(VSSpeechXPCHandler *)self performLanguageFallBackIfNeededWithRequest:v4];
  uint64_t v5 = [v4 text];

  if (!v5) {
    [v4 setText:&stru_26DAD0E18];
  }
  id v6 = [v4 text];
  id v7 = [v4 contextInfo];
  uint64_t v8 = objc_msgSend(v6, "vs_insertContextInfo:", v7);

  uint64_t v9 = objc_msgSend(v8, "vs_substituteAudioWithLocalPath");

  int v10 = [v4 languageCode];
  uint64_t v11 = objc_msgSend(v9, "vs_textifyEmojiWithLanguage:", v10);
  uint64_t v12 = [v11 precomposedStringWithCanonicalMapping];

  int v13 = [MEMORY[0x263F84E90] standardInstance];
  if ([v13 whisper])
  {
  }
  else
  {
    char v14 = [v4 shouldWhisper];

    if ((v14 & 1) == 0) {
      goto LABEL_7;
    }
  }
  uint64_t v15 = [@"\x1B\\mrk=emo=whisper\\"" stringByAppendingString:v12];

  uint64_t v12 = (void *)v15;
LABEL_7:
  int v16 = [MEMORY[0x263F84E90] standardInstance];
  int v17 = [v16 useSSMLInput];

  if (v17)
  {
    uint64_t v18 = objc_msgSend(v12, "vs_convertToSSML");

    BOOL v19 = VSGetLogDefault();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = [v4 logUtterance];
      int v52 = 138412290;
      double v53 = *(double *)&v20;
      _os_log_impl(&dword_226CB1000, v19, OS_LOG_TYPE_DEFAULT, "Use SSML input: %@", (uint8_t *)&v52, 0xCu);
    }
    uint64_t v12 = (void *)v18;
  }
  [v4 setUtterance:v12];
  id v21 = VSGetLogDefault();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    uint64_t v22 = [v4 requestCreatedTimestamp];
    uint64_t v23 = [v4 logUtterance];
    int v52 = 134218242;
    double v53 = *(double *)&v22;
    __int16 v54 = 2112;
    long long v55 = v23;
    _os_log_impl(&dword_226CB1000, v21, OS_LOG_TYPE_INFO, "Utterance to synthesize for request %llu: '%@'", (uint8_t *)&v52, 0x16u);
  }
  uint64_t v24 = [MEMORY[0x263F84E90] standardInstance];
  [v24 defaultVolume];
  float v26 = v25;

  if (v26 != 0.0)
  {
    id v27 = VSGetLogDefault();
    double v28 = v26;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      int v52 = 134217984;
      double v53 = v28;
      _os_log_impl(&dword_226CB1000, v27, OS_LOG_TYPE_DEFAULT, "Overwriting volume with internal default: %.3f", (uint8_t *)&v52, 0xCu);
    }

    [v4 setVolume:v28];
  }
  uint64_t v29 = [MEMORY[0x263F84E90] standardInstance];
  [v29 defaultRate];
  float v31 = v30;

  if (v31 != 0.0)
  {
    uint64_t v32 = VSGetLogDefault();
    double v33 = v31;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      int v52 = 134217984;
      double v53 = v33;
      _os_log_impl(&dword_226CB1000, v32, OS_LOG_TYPE_DEFAULT, "Overwriting rate with internal default: %.3f", (uint8_t *)&v52, 0xCu);
    }

    [v4 setRate:v33];
  }
  uint64_t v34 = [MEMORY[0x263F84E90] standardInstance];
  [v34 defaultPitch];
  float v36 = v35;

  if (v36 != 0.0)
  {
    long long v37 = VSGetLogDefault();
    double v38 = v36;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      int v52 = 134217984;
      double v53 = v38;
      _os_log_impl(&dword_226CB1000, v37, OS_LOG_TYPE_DEFAULT, "Overwriting pitch with internal default: %.3f", (uint8_t *)&v52, 0xCu);
    }

    [v4 setPitch:v38];
  }
  long long v39 = [v4 outputPath];

  if (v39)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    uint64_t v41 = [WeakRetained valueForEntitlement:@"com.apple.voiced.can-dump-audio"];

    if ((objc_opt_respondsToSelector() & 1) == 0 || ([v41 BOOLValue] & 1) == 0)
    {
      uint64_t v42 = VSGetLogDefault();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        LOWORD(v52) = 0;
        _os_log_impl(&dword_226CB1000, v42, OS_LOG_TYPE_INFO, "Process is not entitled for dumping audio. Ignore outputPath", (uint8_t *)&v52, 2u);
      }

      [v4 setOutputPath:0];
    }
  }
  uint64_t v43 = [v4 siriRequestId];
  if (v43)
  {
    id v44 = (void *)v43;
    id v45 = [v4 clientBundleIdentifier];
    BOOL v46 = +[VSSpeechXPCHandler isSiriClientBundleIdentifier:v45];

    if (!v46)
    {
      uint64_t v47 = VSGetLogDefault();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
      {
        uint64_t v51 = [v4 clientBundleIdentifier];
        int v52 = 138543362;
        double v53 = *(double *)&v51;
        _os_log_fault_impl(&dword_226CB1000, v47, OS_LOG_TYPE_FAULT, "Unexpected client '%{public}@' sets Siri request ID.", (uint8_t *)&v52, 0xCu);
      }
      [v4 setSiriRequestId:0];
    }
  }
  __int16 v48 = [MEMORY[0x263F84E90] standardInstance];
  int v49 = [v48 disableDeviceRacing];

  if (v49)
  {
    id v50 = VSGetLogDefault();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v52) = 0;
      _os_log_impl(&dword_226CB1000, v50, OS_LOG_TYPE_DEFAULT, "Overriding disableDeviceRacing with internal default", (uint8_t *)&v52, 2u);
    }

    [v4 setDisableDeviceRacing:1];
  }
}

- (void)performLanguageFallBackIfNeededWithRequest:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263F84EA8] availableLanguages];
  uint64_t v5 = [v3 languageCode];
  char v6 = [v4 containsObject:v5];

  if ((v6 & 1) == 0)
  {
    id v7 = (void *)MEMORY[0x263F84EA8];
    uint64_t v8 = [v3 languageCode];
    uint64_t v9 = [v7 fallbackLanguageForLanguage:v8];

    int v10 = VSGetLogDefault();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [v3 languageCode];
      int v12 = 138543618;
      int v13 = v11;
      __int16 v14 = 2114;
      uint64_t v15 = v9;
      _os_log_impl(&dword_226CB1000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ is not TTS language, fallback to %{public}@", (uint8_t *)&v12, 0x16u);
    }
    [v3 setLanguageCode:v9];
  }
}

- (void)invalidate
{
  id v3 = VSGetLogDefault();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_226CB1000, v3, OS_LOG_TYPE_DEFAULT, "Invalidate VSSpeechXPCHandler, cancelling all related tasks", v4, 2u);
  }

  +[VSSpeechTaskQueue cancelTasksWithDelegate:self];
}

- (BOOL)isSpeaking
{
  id v3 = +[VSSpeechTaskQueue mainDeviceQueue];
  id v4 = [v3 currentTask];
  uint64_t v5 = [v4 delegate];
  LOBYTE(self) = v5 == self;

  return (char)self;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  [WeakRetained invalidate];

  if (self->_synthesizerTransaction)
  {
    id v4 = +[VSPrewarmService sharedService];
    objc_msgSend(v4, "setActiveSessionCount:", objc_msgSend(v4, "activeSessionCount") - 1);
  }
  v5.receiver = self;
  v5.super_class = (Class)VSSpeechXPCHandler;
  [(VSSpeechXPCHandler *)&v5 dealloc];
}

- (VSSpeechXPCHandler)initWithConnection:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)VSSpeechXPCHandler;
  objc_super v5 = [(VSSpeechXPCHandler *)&v12 init];
  char v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_connection, v4);
    uint64_t v7 = +[VSHHManagementClient sharedInstance];
    hubManagementClient = v6->_hubManagementClient;
    v6->_hubManagementClient = (VSHHManagementClient *)v7;

    uint64_t v9 = +[VSHMHomeManager sharedInstance];
    homeManager = v6->_homeManager;
    v6->_homeManager = (VSHMHomeManager *)v9;
  }
  return v6;
}

+ (BOOL)isSiriClientBundleIdentifier:(id)a3
{
  uint64_t v3 = isSiriClientBundleIdentifier__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&isSiriClientBundleIdentifier__onceToken, &__block_literal_global_707);
  }
  char v5 = [(id)isSiriClientBundleIdentifier__siriClientBundleIdentifiers containsObject:v4];

  return v5;
}

uint64_t __51__VSSpeechXPCHandler_isSiriClientBundleIdentifier___block_invoke()
{
  isSiriClientBundleIdentifier__siriClientBundleIdentifiers = [MEMORY[0x263EFFA08] setWithArray:&unk_26DADB018];
  return MEMORY[0x270F9A758]();
}

@end