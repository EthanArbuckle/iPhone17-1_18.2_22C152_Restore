@interface LTHybridEndpointer
@end

@implementation LTHybridEndpointer

void __62___LTHybridEndpointer_setServerEndpointerFeatures_withLocale___block_invoke(void **a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  v3 = WeakRetained;
  if (!WeakRetained) {
    goto LABEL_25;
  }
  v4 = a1 + 4;
  v5 = a1[4];
  v6 = [WeakRetained[1] localePair];
  v7 = [v6 sourceLocale];

  if (v5 == v7)
  {
    v11 = _LTOSLogSpeech();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LOWORD(v30) = 0;
      _os_log_impl(&dword_2600DC000, v11, OS_LOG_TYPE_INFO, "Received server endpointer features for source locale", (uint8_t *)&v30, 2u);
    }
    objc_storeStrong(v3 + 6, a1[5]);
    if (v3[3] && v3[5])
    {
      id v12 = v3[4];
      v13 = _LTOSLogSpeech();
      BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
      if (v12)
      {
        if (v14)
        {
          id v15 = v3[4];
          v16 = v13;
          [v15 floatValue];
          int v30 = 134217984;
          double v31 = v17;
          _os_log_impl(&dword_2600DC000, v16, OS_LOG_TYPE_INFO, "Updating source endpointer threshold to %f", (uint8_t *)&v30, 0xCu);
        }
        id v19 = v3[3];
        id v18 = v3[4];
        goto LABEL_22;
      }
      if (v14)
      {
        LOWORD(v30) = 0;
        _os_log_impl(&dword_2600DC000, v13, OS_LOG_TYPE_INFO, "Re-request sampling rate for source endpointer", (uint8_t *)&v30, 2u);
      }
      id v29 = v3[3];
LABEL_32:
      [v29 requestSupportedWithSamplingRate:v3[18]];
    }
  }
  else
  {
    v8 = *v4;
    v9 = [v3[1] localePair];
    v10 = [v9 targetLocale];
    if (v8 != v10)
    {

      goto LABEL_23;
    }
    int v20 = [v3[1] autodetectLanguage];

    if (!v20)
    {
LABEL_23:
      v28 = _LTOSLogSpeech();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        __62___LTHybridEndpointer_setServerEndpointerFeatures_withLocale___block_invoke_cold_1(v4, v28);
      }
      goto LABEL_25;
    }
    v21 = _LTOSLogSpeech();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      LOWORD(v30) = 0;
      _os_log_impl(&dword_2600DC000, v21, OS_LOG_TYPE_INFO, "Received server endpointer features for target locale", (uint8_t *)&v30, 2u);
    }
    objc_storeStrong(v3 + 10, a1[5]);
    if (v3[7] && v3[9])
    {
      id v22 = v3[8];
      v23 = _LTOSLogSpeech();
      BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_INFO);
      if (v22)
      {
        if (v24)
        {
          id v25 = v3[8];
          v26 = v23;
          [v25 floatValue];
          int v30 = 134217984;
          double v31 = v27;
          _os_log_impl(&dword_2600DC000, v26, OS_LOG_TYPE_INFO, "Updating target endpointer threshold to %f", (uint8_t *)&v30, 0xCu);
        }
        id v19 = v3[7];
        id v18 = v3[8];
LABEL_22:
        [v18 floatValue];
        objc_msgSend(v19, "updateEndpointerThresholdWithValue:");
        goto LABEL_25;
      }
      if (v24)
      {
        LOWORD(v30) = 0;
        _os_log_impl(&dword_2600DC000, v23, OS_LOG_TYPE_INFO, "Re-request sampling rate for target endpointer", (uint8_t *)&v30, 2u);
      }
      id v29 = v3[7];
      goto LABEL_32;
    }
  }
LABEL_25:
}

void __42___LTHybridEndpointer_addSpeechAudioData___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    unint64_t v3 = (unint64_t)[*(id *)(a1 + 32) length] / *((void *)WeakRetained + 19);
    v4 = _LTOSLogSpeech();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v5 = 134217984;
      unint64_t v6 = v3;
      _os_log_impl(&dword_2600DC000, v4, OS_LOG_TYPE_INFO, "Adding audio samples %zu", (uint8_t *)&v5, 0xCu);
    }
    [*((id *)WeakRetained + 11) addAudio:*(void *)(a1 + 32) numSamples:v3];
  }
}

void __31___LTHybridEndpointer_endAudio__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = _LTOSLogSpeech();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)unint64_t v3 = 0;
      _os_log_impl(&dword_2600DC000, v2, OS_LOG_TYPE_INFO, "Sending end of audio to SPG", v3, 2u);
    }
    [WeakRetained[11] endAudio];
  }
}

void __54___LTHybridEndpointer_clientSilenceFeaturesAvailable___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  unint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    if (WeakRetained[3])
    {
      *((unsigned char *)WeakRetained + 104) = objc_msgSend(WeakRetained, "didEndpointWithFeatures:silenceFeatures:endpointer:", WeakRetained[6], *(void *)(a1 + 32));
      v4 = _LTOSLogSpeech();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        int v5 = *((unsigned __int8 *)v3 + 104);
        int v11 = 67109120;
        int v12 = v5;
        _os_log_impl(&dword_2600DC000, v4, OS_LOG_TYPE_INFO, "Endpointing decision from source endpointer %{BOOL}i", (uint8_t *)&v11, 8u);
      }
    }
    if (v3[7])
    {
      if (!*((unsigned char *)v3 + 104))
      {
        if ([v3[1] autodetectLanguage])
        {
          *((unsigned char *)v3 + 104) = [v3 didEndpointWithFeatures:v3[10] silenceFeatures:*(void *)(a1 + 32) endpointer:v3[7]];
          unint64_t v6 = _LTOSLogSpeech();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
          {
            int v7 = *((unsigned __int8 *)v3 + 104);
            int v11 = 67109120;
            int v12 = v7;
            _os_log_impl(&dword_2600DC000, v6, OS_LOG_TYPE_INFO, "Endpointing decision from target endpointer %{BOOL}i", (uint8_t *)&v11, 8u);
          }
        }
      }
    }
    if (*((unsigned char *)v3 + 104))
    {
      id v8 = objc_loadWeakRetained(v3 + 12);
      char v9 = objc_opt_respondsToSelector();

      if (v9)
      {
        id v10 = objc_loadWeakRetained(v3 + 12);
        [v10 hybridEndpointerFoundEndpoint];
      }
    }
  }
}

void __62___LTHybridEndpointer_setServerEndpointerFeatures_withLocale___block_invoke_cold_1(void **a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = *a1;
  unint64_t v3 = a2;
  v4 = [v2 localeIdentifier];
  int v5 = 138543362;
  unint64_t v6 = v4;
  _os_log_error_impl(&dword_2600DC000, v3, OS_LOG_TYPE_ERROR, "Unexpected locale %{public}@ for server endpointer features", (uint8_t *)&v5, 0xCu);
}

@end