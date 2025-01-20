@interface LTOfflineSpeechSynthesizer
@end

@implementation LTOfflineSpeechSynthesizer

void __49___LTOfflineSpeechSynthesizer_speak_withContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = _LTOSLogTTS();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_2600DC000, v3, OS_LOG_TYPE_INFO, "Received offline TTS metrics:%@ ", (uint8_t *)&v4, 0xCu);
  }
}

void __49___LTOfflineSpeechSynthesizer_speak_withContext___block_invoke_9(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = WeakRetained + 32;
    if (v3)
    {
      [v3 asbd];
      *uint64_t v6 = v18;
      v5[3] = v19;
      *((void *)v5 + 8) = v20;
      [v3 asbd];
      if (v17 == 1819304813)
      {
        v7 = (void *)*((void *)v5 + 9);
        v8 = [v3 audioData];
        [v7 addObject:v8];

        goto LABEL_10;
      }
      [v3 asbd];
      if (v16 == 1869641075)
      {
        v9 = (void *)*((void *)v5 + 9);
        v10 = (void *)*((void *)v5 + 11);
        v11 = [v3 audioData];
        uint64_t v12 = [v3 packetCount];
        v13 = [v3 packetDescriptions];
        v14 = [v10 extractAudioChunksFromOpusWithData:v11 packetCount:v12 packetDescriptions:v13];
        [v9 addObjectsFromArray:v14];

        goto LABEL_10;
      }
    }
    else
    {
      *((void *)WeakRetained + 8) = 0;
      *uint64_t v6 = 0u;
      *((_OWORD *)WeakRetained + 3) = 0u;
    }
    v15 = _LTOSLogTTS();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      __49___LTOfflineSpeechSynthesizer_speak_withContext___block_invoke_9_cold_1(v15);
    }
  }
LABEL_10:
}

void __49___LTOfflineSpeechSynthesizer_speak_withContext___block_invoke_11(uint64_t a1, void *a2)
{
  id v5 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  int v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained[10] addObjectsFromArray:v5];
  }
}

void __49___LTOfflineSpeechSynthesizer_speak_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = _LTOSLogTTS();
    uint64_t v6 = v5;
    if (v3)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __49___LTOfflineSpeechSynthesizer_speak_withContext___block_invoke_2_cold_1((uint64_t)v3, v6);
      }
    }
    else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2600DC000, v6, OS_LOG_TYPE_INFO, "Finished offline TTS, successfully", buf, 2u);
    }
    if (WeakRetained[1])
    {
      dispatch_time_t v7 = dispatch_time(0, 300000000);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __49___LTOfflineSpeechSynthesizer_speak_withContext___block_invoke_13;
      block[3] = &unk_265547500;
      block[4] = WeakRetained;
      id v9 = *(id *)(a1 + 32);
      id v10 = v3;
      dispatch_after(v7, MEMORY[0x263EF83A0], block);
    }
  }
}

void __49___LTOfflineSpeechSynthesizer_speak_withContext___block_invoke_13(void *a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v2 = a1[4];
  uint64_t v3 = *(void *)(v2 + 80);
  if (v3)
  {
    int v4 = [MEMORY[0x263F1C1C8] wordTimingInfoFromSiriTTSService:v3 text:a1[5]];
    uint64_t v2 = a1[4];
  }
  else
  {
    int v4 = (void *)MEMORY[0x263EFFA68];
  }
  long long v5 = *(_OWORD *)(v2 + 48);
  long long v24 = *(_OWORD *)(v2 + 32);
  long long v25 = v5;
  uint64_t v26 = *(void *)(v2 + 64);
  if (*(_DWORD *)(v2 + 40) == 1869641075)
  {
    uint64_t v6 = *(void **)(v2 + 88);
    uint64_t v7 = *(void *)(v2 + 72);
    id v23 = 0;
    long long v8 = *(_OWORD *)(v2 + 48);
    *(_OWORD *)buf = *(_OWORD *)(v2 + 32);
    long long v28 = v8;
    uint64_t v29 = *(void *)(v2 + 64);
    id v9 = [v6 decodeTo48KHzPCMFromChunks:v7 from:buf outError:&v23];
    id v10 = v23;
    v11 = *(void **)(a1[4] + 88);
    if (v11)
    {
      [v11 get48khzPCMDescription];
    }
    else
    {
      uint64_t v29 = 0;
      *(_OWORD *)buf = 0u;
      long long v28 = 0u;
    }
    long long v24 = *(_OWORD *)buf;
    long long v25 = v28;
    uint64_t v26 = v29;
    if (v10)
    {
      v14 = _LTOSLogTTS();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        __49___LTOfflineSpeechSynthesizer_speak_withContext___block_invoke_13_cold_1((uint64_t)v10, v14);
      }
    }
  }
  else
  {
    id v12 = objc_alloc_init(MEMORY[0x263EFF990]);
    v13 = *(void **)(a1[4] + 72);
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __49___LTOfflineSpeechSynthesizer_speak_withContext___block_invoke_16;
    v21[3] = &unk_2655474D8;
    id v9 = v12;
    id v22 = v9;
    [v13 enumerateObjectsUsingBlock:v21];
    id v10 = v22;
  }

  v15 = _LTOSLogTTS();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    int v16 = v15;
    uint64_t v17 = [v9 length];
    *(_DWORD *)buf = 134217984;
    *(void *)&buf[4] = v17;
    _os_log_impl(&dword_2600DC000, v16, OS_LOG_TYPE_INFO, "Converted to %ld bytes", buf, 0xCu);
  }
  long long v18 = [_LTAudioData alloc];
  *(_OWORD *)buf = v24;
  long long v28 = v25;
  uint64_t v29 = v26;
  long long v19 = [(_LTAudioData *)v18 initWithASBD:buf rawData:v9 wordTimingInfo:v4];
  (*(void (**)(void, _LTAudioData *, void, uint64_t))(*(void *)(a1[4] + 8) + 16))(*(void *)(a1[4] + 8), v19, a1[6], v20);
}

uint64_t __49___LTOfflineSpeechSynthesizer_speak_withContext___block_invoke_16(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendData:a2];
}

void __49___LTOfflineSpeechSynthesizer_speak_withContext___block_invoke_9_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2600DC000, log, OS_LOG_TYPE_ERROR, "Unsupported audio format from TTS", v1, 2u);
}

void __49___LTOfflineSpeechSynthesizer_speak_withContext___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2600DC000, a2, OS_LOG_TYPE_ERROR, "Encountered error when speaking TTS: %@", (uint8_t *)&v2, 0xCu);
}

void __49___LTOfflineSpeechSynthesizer_speak_withContext___block_invoke_13_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2600DC000, a2, OS_LOG_TYPE_ERROR, "Decoding to PCM 48kHz failed: %@", (uint8_t *)&v2, 0xCu);
}

@end