@interface VSServerTTSClient
+ (BOOL)shouldUseServerTTSForRequest:(id)a3;
- (void)ospreyStartStreamingRequest:(id)a3 dataHandler:(id)a4 metaInfoHandler:(id)a5 completion:(id)a6;
- (void)ospreyStartSynthesisRequest:(id)a3 responseHandler:(id)a4 completion:(id)a5;
@end

@implementation VSServerTTSClient

+ (BOOL)shouldUseServerTTSForRequest:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263F84E90] standardInstance];
  int v5 = [v4 disableServerTTS];

  if (!v5)
  {
    v9 = [MEMORY[0x263F84E90] standardInstance];
    int v10 = [v9 forceServerTTS];

    if (v10)
    {
      v6 = VSGetLogDefault();
      BOOL v8 = 1;
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
        goto LABEL_31;
      }
      LOWORD(v29) = 0;
      v11 = "forceServerTTS is enabled by user default, force server TTS";
LABEL_12:
      _os_log_impl(&dword_226CB1000, v6, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v29, 2u);
      goto LABEL_31;
    }
    if ([v3 forceServerTTS])
    {
      v6 = VSGetLogDefault();
      BOOL v8 = 1;
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
        goto LABEL_31;
      }
      LOWORD(v29) = 0;
      v11 = "forceServerTTS is enabled by speech request, force server TTS";
      goto LABEL_12;
    }
    v12 = +[VSSpeechCache defaultCacheStore];
    int v13 = [v12 isPreinstalledCacheAvailableForRequest:v3];

    if (v13)
    {
      v6 = VSGetLogDefault();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
        goto LABEL_5;
      }
      LOWORD(v29) = 0;
      v7 = "Preinstalled cache is found, disable server TTS";
      goto LABEL_4;
    }
    v14 = [MEMORY[0x263F84E40] sharedManager];
    v15 = [v3 languageCode];
    v16 = [v3 voiceName];
    v6 = objc_msgSend(v14, "selectVoiceForLang:name:type:gender:footprint:", v15, v16, objc_msgSend(v3, "voiceType"), objc_msgSend(v3, "gender"), objc_msgSend(v3, "footprint"));

    v17 = [v6 voiceData];
    if ([v17 type] == 4)
    {
      char v18 = [MEMORY[0x263F84E48] isNeuralFallbackCondition];

      if ((v18 & 1) == 0)
      {
        v19 = VSGetLogDefault();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          LOWORD(v29) = 0;
          _os_log_impl(&dword_226CB1000, v19, OS_LOG_TYPE_INFO, "Neural voice is found on device without fallback condition, disable server TTS", (uint8_t *)&v29, 2u);
        }
        goto LABEL_29;
      }
    }
    else
    {
    }
    v20 = +[VSCachingService standardService];
    v21 = [v3 text];
    v22 = [v20 shortTermCacheForHash:v21];

    if (v22)
    {
      v19 = VSGetLogDefault();
      BOOL v8 = 1;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        LOWORD(v29) = 0;
        _os_log_impl(&dword_226CB1000, v19, OS_LOG_TYPE_INFO, "Short term cache is found for the text, use server TTS", (uint8_t *)&v29, 2u);
      }
      goto LABEL_30;
    }
    if (![v3 canUseServerTTS]) {
      goto LABEL_5;
    }
    v23 = +[VSSiriServerConfiguration defaultConfig];
    v24 = [v23 allowedAppID];
    v25 = [v3 clientBundleIdentifier];
    char v26 = [v24 containsObject:v25];

    if (v26)
    {
      BOOL v8 = 1;
      goto LABEL_31;
    }
    v19 = VSGetLogDefault();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v27 = [v3 clientBundleIdentifier];
      int v29 = 138543362;
      v30 = v27;
      _os_log_impl(&dword_226CB1000, v19, OS_LOG_TYPE_INFO, "Server TTS is disabled since '%{public}@' is not in the list of allowed apps", (uint8_t *)&v29, 0xCu);
    }
LABEL_29:
    BOOL v8 = 0;
LABEL_30:

    goto LABEL_31;
  }
  v6 = VSGetLogDefault();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    LOWORD(v29) = 0;
    v7 = "disableServerTTS is enabled by user default, disable server TTS";
LABEL_4:
    _os_log_impl(&dword_226CB1000, v6, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v29, 2u);
  }
LABEL_5:
  BOOL v8 = 0;
LABEL_31:

  return v8;
}

- (void)ospreyStartStreamingRequest:(id)a3 dataHandler:(id)a4 metaInfoHandler:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  int v13 = +[OPTTSMutableTextToSpeechRequest requestFromVSRequest:v9];
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__3266;
  v32[4] = __Block_byref_object_dispose__3267;
  id v33 = (id)MEMORY[0x22A667CC0](v10);
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__3266;
  v30[4] = __Block_byref_object_dispose__3267;
  id v31 = (id)MEMORY[0x22A667CC0](v12);
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x4810000000;
  long long v27 = 0u;
  long long v28 = 0u;
  v26[3] = &unk_226D09AC3;
  uint64_t v29 = 0;
  v14 = +[OspreyTTSService sharedInstance];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __88__VSServerTTSClient_ospreyStartStreamingRequest_dataHandler_metaInfoHandler_completion___block_invoke;
  v23[3] = &unk_2647DCD08;
  v25 = v26;
  id v15 = v11;
  id v24 = v15;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __88__VSServerTTSClient_ospreyStartStreamingRequest_dataHandler_metaInfoHandler_completion___block_invoke_2;
  v18[3] = &unk_2647DCD30;
  v20 = v26;
  v21 = v32;
  v22 = v30;
  id v16 = v13;
  id v19 = v16;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __88__VSServerTTSClient_ospreyStartStreamingRequest_dataHandler_metaInfoHandler_completion___block_invoke_4;
  v17[3] = &unk_2647DCDF0;
  v17[4] = v30;
  [v14 streamTTS:v16 beginHandler:v23 chunkHandler:v18 endHandler:&__block_literal_global_3270 completion:v17];

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(v30, 8);

  _Block_object_dispose(v32, 8);
}

void __88__VSServerTTSClient_ospreyStartStreamingRequest_dataHandler_metaInfoHandler_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = objc_msgSend(v3, "decoder_description");
  [v4 audioStreamBasicDescription];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = v17;
  long long v7 = v16;
  *(_OWORD *)(v5 + 32) = v15;
  *(_OWORD *)(v5 + 48) = v7;
  *(void *)(v5 + 64) = v6;

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8)
  {
    id v9 = objc_msgSend(v3, "meta_info");
    id v10 = [v9 voice];
    id v11 = objc_msgSend(v10, "vs_voice");
    id v12 = objc_msgSend(v3, "meta_info");
    int v13 = [v12 resource];
    v14 = objc_msgSend(v13, "vs_voiceResource");
    objc_msgSend(v3, "streaming_playback_buffer_size_in_seconds");
    (*(void (**)(uint64_t, void *, void *))(v8 + 16))(v8, v11, v14);
  }
}

void __88__VSServerTTSClient_ospreyStartStreamingRequest_dataHandler_metaInfoHandler_completion___block_invoke_2(uint64_t a1, void *a2)
{
  v23[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = (void *)MEMORY[0x263F84E18];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = [v3 audio];
  long long v7 = *(_OWORD *)(v5 + 48);
  v20[0] = *(_OWORD *)(v5 + 32);
  v20[1] = v7;
  uint64_t v21 = *(void *)(v5 + 64);
  uint64_t v8 = [v4 audioDataWithASBD:v20 rawData:v6];

  if (v8)
  {
    id v9 = objc_msgSend(v3, "word_timing_info");
    id v10 = [*(id *)(a1 + 32) text];
    id v11 = +[OPTTSWordTimingInfo vs_wordTimingInfos:v9 withText:v10];

    uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (v12) {
      (*(void (**)(uint64_t, void *, void *))(v12 + 16))(v12, v8, v11);
    }
    goto LABEL_6;
  }
  uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
  v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = 0;

  uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (v15)
  {
    long long v16 = (void *)MEMORY[0x263F087E8];
    uint64_t v22 = *MEMORY[0x263F08320];
    v23[0] = @"Unable to process audio data.";
    uint64_t v17 = [NSDictionary dictionaryWithObjects:v23 forKeys:&v22 count:1];
    char v18 = [v16 errorWithDomain:@"ServerTTSErrorDomain" code:600 userInfo:v17];
    (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v18);

    uint64_t v19 = *(void *)(*(void *)(a1 + 56) + 8);
    id v11 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = 0;
LABEL_6:
  }
}

void __88__VSServerTTSClient_ospreyStartStreamingRequest_dataHandler_metaInfoHandler_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
    v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;
  }
}

- (void)ospreyStartSynthesisRequest:(id)a3 responseHandler:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = +[OPTTSMutableTextToSpeechRequest requestFromVSRequest:v7];
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__3266;
  void v18[4] = __Block_byref_object_dispose__3267;
  id v19 = (id)MEMORY[0x22A667CC0](v9);
  id v11 = +[OspreyTTSService sharedInstance];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __76__VSServerTTSClient_ospreyStartSynthesisRequest_responseHandler_completion___block_invoke;
  v14[3] = &unk_2647DCCE0;
  uint64_t v17 = v18;
  id v12 = v7;
  id v15 = v12;
  id v13 = v8;
  id v16 = v13;
  [v11 roundTripTTS:v10 responseHandler:v14];

  _Block_object_dispose(v18, 8);
}

void __76__VSServerTTSClient_ospreyStartSynthesisRequest_responseHandler_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    id v11 = (void *)MEMORY[0x263F84E18];
    id v12 = objc_msgSend(v5, "decoder_description");
    id v13 = v12;
    if (v12)
    {
      [v12 audioStreamBasicDescription];
    }
    else
    {
      uint64_t v29 = 0;
      long long v27 = 0u;
      long long v28 = 0u;
    }
    v14 = objc_msgSend(v5, "audio", v27, v28, v29);
    id v10 = [v11 audioDataWithASBD:&v27 rawData:v14];

    if (v10)
    {
      id v15 = objc_msgSend(v5, "word_timing_info");
      id v16 = [*(id *)(a1 + 32) utterance];
      uint64_t v17 = +[OPTTSWordTimingInfo vs_wordTimingInfos:v15 withText:v16];

      uint64_t v18 = *(void *)(a1 + 40);
      if (v18) {
        (*(void (**)(uint64_t, void *, void *))(v18 + 16))(v18, v10, v17);
      }
      uint64_t v19 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      if (v19)
      {
        (*(void (**)(uint64_t, void))(v19 + 16))(v19, 0);
        uint64_t v20 = *(void *)(*(void *)(a1 + 48) + 8);
        uint64_t v21 = *(void **)(v20 + 40);
        *(void *)(v20 + 40) = 0;
      }
    }
    else
    {
      uint64_t v22 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      if (!v22)
      {
        id v10 = 0;
        goto LABEL_17;
      }
      v23 = (void *)MEMORY[0x263F087E8];
      uint64_t v30 = *MEMORY[0x263F08320];
      id v31 = @"Unable to process audio data.";
      id v24 = [NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
      v25 = [v23 errorWithDomain:@"ServerTTSErrorDomain" code:600 userInfo:v24];
      (*(void (**)(uint64_t, void *))(v22 + 16))(v22, v25);

      uint64_t v26 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v17 = *(void **)(v26 + 40);
      *(void *)(v26 + 40) = 0;
    }

LABEL_17:
    goto LABEL_18;
  }
  id v7 = VSGetLogDefault();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    id v33 = "-[VSServerTTSClient ospreyStartSynthesisRequest:responseHandler:completion:]_block_invoke";
    __int16 v34 = 2112;
    id v35 = v6;
    _os_log_error_impl(&dword_226CB1000, v7, OS_LOG_TYPE_ERROR, "%s, %@", buf, 0x16u);
  }

  uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v8)
  {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v6);
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = 0;
    goto LABEL_17;
  }
LABEL_18:
}

@end