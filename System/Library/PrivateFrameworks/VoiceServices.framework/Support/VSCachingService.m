@interface VSCachingService
+ (id)standardService;
- (NSLock)threadLock;
- (NSMutableArray)inMemoryCaches;
- (OS_dispatch_queue)cachingQueue;
- (VSCachingService)initWithCache:(id)a3 shortTermMemory:(id)a4;
- (VSShortTermCache)shortTermCache;
- (VSSpeechCache)cacheStore;
- (id)_inMemoryCacheForHash:(id)a3;
- (id)_onDiskCacheForHash:(id)a3;
- (id)compressAudio:(id)a3;
- (id)compressStreamAudio:(id)a3;
- (id)inMemoryCacheForHash:(id)a3;
- (id)onDiskCacheForHash:(id)a3;
- (id)popShortTermCacheForHash:(id)a3;
- (id)shortTermCacheForHash:(id)a3;
- (void)_enqueueCacheWithHash:(id)a3 audioObject:(id)a4 timingInfo:(id)a5 voiceKey:(id)a6 voiceResourceKey:(id)a7 completion:(id)a8;
- (void)enqueueShortTermCacheWithHash:(id)a3 audio:(id)a4 timingInfo:(id)a5 voiceKey:(id)a6 voiceResourceKey:(id)a7 completion:(id)a8;
- (void)fetchCacheForTask:(id)a3;
- (void)setCacheStore:(id)a3;
- (void)setCachingQueue:(id)a3;
- (void)setInMemoryCaches:(id)a3;
- (void)setShortTermCache:(id)a3;
- (void)setThreadLock:(id)a3;
@end

@implementation VSCachingService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachingQueue, 0);
  objc_storeStrong((id *)&self->_shortTermCache, 0);
  objc_storeStrong((id *)&self->_cacheStore, 0);
  objc_storeStrong((id *)&self->_inMemoryCaches, 0);
  objc_storeStrong((id *)&self->_threadLock, 0);
}

- (void)setCachingQueue:(id)a3
{
}

- (OS_dispatch_queue)cachingQueue
{
  return self->_cachingQueue;
}

- (void)setShortTermCache:(id)a3
{
}

- (VSShortTermCache)shortTermCache
{
  return self->_shortTermCache;
}

- (void)setCacheStore:(id)a3
{
}

- (VSSpeechCache)cacheStore
{
  return self->_cacheStore;
}

- (void)setInMemoryCaches:(id)a3
{
}

- (NSMutableArray)inMemoryCaches
{
  return self->_inMemoryCaches;
}

- (void)setThreadLock:(id)a3
{
}

- (NSLock)threadLock
{
  return self->_threadLock;
}

- (id)popShortTermCacheForHash:(id)a3
{
  id v4 = a3;
  v5 = [(VSCachingService *)self shortTermCacheForHash:v4];
  if (v5)
  {
    v6 = [(VSCachingService *)self shortTermCache];
    [v6 removeObjectForKey:v4];
  }
  return v5;
}

- (id)shortTermCacheForHash:(id)a3
{
  id v4 = a3;
  v5 = [(VSCachingService *)self shortTermCache];
  v6 = [v5 objectForKey:v4];

  return v6;
}

- (void)enqueueShortTermCacheWithHash:(id)a3 audio:(id)a4 timingInfo:(id)a5 voiceKey:(id)a6 voiceResourceKey:(id)a7 completion:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  v20 = [[VSSpeechCacheAudio alloc] initWithKey:v19 audio:v18 wordTimingInfo:v17 voiceKey:v16 voiceResourceKey:v15];

  v21 = [(VSCachingService *)self shortTermCache];
  [v21 setObject:v20 forKey:v19 timeToLive:10.0];

  v22 = [(VSCachingService *)self cachingQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __104__VSCachingService_enqueueShortTermCacheWithHash_audio_timingInfo_voiceKey_voiceResourceKey_completion___block_invoke;
  block[3] = &unk_2647DCE90;
  id v25 = v14;
  id v23 = v14;
  dispatch_async(v22, block);
}

uint64_t __104__VSCachingService_enqueueShortTermCacheWithHash_audio_timingInfo_voiceKey_voiceResourceKey_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)fetchCacheForTask:(id)a3
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 speechCache];

  if (!v5)
  {
    v6 = [(VSCachingService *)self cacheStore];
    v7 = [v4 request];
    v8 = [v7 text];
    v9 = [v4 request];
    v10 = [v9 languageCode];
    v11 = [v4 request];
    v12 = [v11 voiceName];
    v13 = [v6 preinstalledCacheForText:v8 language:v10 name:v12];
    [v4 setSpeechCache:v13];

    id v14 = [v4 speechCache];

    if (v14)
    {
      id v15 = VSGetLogDefault();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = [v4 speechCache];
        id v17 = [v16 key];
        int v59 = 138412290;
        v60 = v17;
        _os_log_impl(&dword_226CB1000, v15, OS_LOG_TYPE_DEFAULT, "Preinstalled cached synthesis %@ is found.", (uint8_t *)&v59, 0xCu);
      }
      id v18 = [v4 instrumentMetrics];
      [v18 setIsCacheHitFromDisk:1];

      id v19 = [v4 speechCache];
      v20 = [v19 voiceKey];
      v21 = [v4 instrumentMetrics];
      [v21 setVoiceAssetKey:v20];

      v22 = [v4 speechCache];
      id v23 = [v22 voiceResourceKey];
      v24 = [v4 instrumentMetrics];
      [v24 setVoiceResourceAssetKey:v23];
    }
    id v25 = [MEMORY[0x263F84E90] standardInstance];
    char v26 = [v25 disableCache];

    if ((v26 & 1) == 0)
    {
      v27 = [v4 taskHash];
      v28 = [v4 speechCache];

      if (!v28)
      {
        v29 = [(VSCachingService *)self _inMemoryCacheForHash:v27];
        [v4 setSpeechCache:v29];

        v30 = [v4 speechCache];

        if (v30)
        {
          v31 = VSGetLogDefault();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            v32 = [v4 speechCache];
            v33 = [v32 key];
            int v59 = 138412290;
            v60 = v33;
            _os_log_impl(&dword_226CB1000, v31, OS_LOG_TYPE_DEFAULT, "In-memory cached synthesis %@ is found.", (uint8_t *)&v59, 0xCu);
          }
          v34 = [v4 instrumentMetrics];
          [v34 setIsCacheHitFromMemory:1];
        }
      }
      v35 = [v4 speechCache];

      if (!v35)
      {
        v36 = [(VSCachingService *)self _onDiskCacheForHash:v27];
        [v4 setSpeechCache:v36];

        v37 = [v4 speechCache];

        if (v37)
        {
          v38 = VSGetLogDefault();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            v39 = [v4 speechCache];
            v40 = [v39 key];
            int v59 = 138412290;
            v60 = v40;
            _os_log_impl(&dword_226CB1000, v38, OS_LOG_TYPE_DEFAULT, "On-disk cached synthesis %@ is found.", (uint8_t *)&v59, 0xCu);
          }
          v41 = [v4 instrumentMetrics];
          [v41 setIsCacheHitFromDisk:1];
        }
      }
      v42 = [v4 speechCache];

      if (!v42)
      {
        v43 = [v4 request];
        v44 = [v43 text];
        v45 = [(VSCachingService *)self popShortTermCacheForHash:v44];
        [v4 setSpeechCache:v45];

        v46 = [v4 speechCache];

        if (v46)
        {
          v47 = VSGetLogDefault();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            v48 = [v4 request];
            v49 = [v48 logText];
            int v59 = 138412290;
            v60 = v49;
            _os_log_impl(&dword_226CB1000, v47, OS_LOG_TYPE_DEFAULT, "Short-term cached synthesis is found for text '%@'", (uint8_t *)&v59, 0xCu);
          }
        }
      }
      v50 = [v4 speechCache];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        v52 = [v4 speechCache];
        v53 = [v4 timingInfos];

        if (!v53)
        {
          v54 = [v52 timingInfos];
          [v4 setTimingInfos:v54];
        }
        v55 = [v52 audio];
        [v55 duration];
        double v57 = v56;
        v58 = [v4 instrumentMetrics];
        [v58 setAudioDuration:v57];
      }
    }
  }
}

- (id)_onDiskCacheForHash:(id)a3
{
  id v4 = a3;
  v5 = [(VSCachingService *)self cacheStore];
  v6 = [v5 cacheDataForKey:v4];

  return v6;
}

- (id)onDiskCacheForHash:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263F84E90] standardInstance];
  char v6 = [v5 disableCache];

  if (v6)
  {
    v7 = 0;
  }
  else
  {
    v7 = [(VSCachingService *)self _onDiskCacheForHash:v4];
  }

  return v7;
}

- (id)_inMemoryCacheForHash:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(VSCachingService *)self threadLock];
  [v5 lock];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  char v6 = [(VSCachingService *)self inMemoryCaches];
  id v7 = (id)[v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v11 = [v10 key];
        int v12 = [v4 isEqualToString:v11];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  v13 = [(VSCachingService *)self threadLock];
  [v13 unlock];

  return v7;
}

- (id)inMemoryCacheForHash:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263F84E90] standardInstance];
  char v6 = [v5 disableCache];

  if (v6)
  {
    id v7 = 0;
  }
  else
  {
    id v7 = [(VSCachingService *)self _inMemoryCacheForHash:v4];
  }

  return v7;
}

- (void)_enqueueCacheWithHash:(id)a3 audioObject:(id)a4 timingInfo:(id)a5 voiceKey:(id)a6 voiceResourceKey:(id)a7 completion:(id)a8
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (v14 && v15 && v16)
  {
    uint64_t v20 = [MEMORY[0x263F84E90] standardInstance];
    int v21 = [v20 disableCache];

    if (v21)
    {
      v22 = VSGetLogDefault();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_226CB1000, v22, OS_LOG_TYPE_INFO, "Caching is disabled. Skipping caching.", buf, 2u);
      }
      goto LABEL_30;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v22 = VSGetLogDefault();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          id v25 = "Unrecognized audio object, skip caching";
          v27 = v22;
          uint32_t v28 = 2;
          goto LABEL_18;
        }
        goto LABEL_30;
      }
    }
    [v15 duration];
    double v24 = v23;
    if (v23 < 0.5)
    {
      v22 = VSGetLogDefault();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        double v48 = v24;
        id v25 = "Audio duration is too short: %.2f second, skip caching";
LABEL_15:
        v27 = v22;
        uint32_t v28 = 12;
LABEL_18:
        _os_log_error_impl(&dword_226CB1000, v27, OS_LOG_TYPE_ERROR, v25, buf, v28);
        goto LABEL_30;
      }
      goto LABEL_30;
    }
    char v26 = VSGetLogDefault();
    v22 = v26;
    if (v24 > 60.0)
    {
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        double v48 = v24;
        id v25 = "Audio duration is too long: %.2f second, skip caching";
        goto LABEL_15;
      }
LABEL_30:

      goto LABEL_31;
    }
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226CB1000, v22, OS_LOG_TYPE_INFO, "Compressing audio for caching.", buf, 2u);
    }

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v29 = [(VSCachingService *)self compressStreamAudio:v15];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v30 = 0;
        goto LABEL_27;
      }
      uint64_t v29 = [(VSCachingService *)self compressAudio:v15];
    }
    v30 = (void *)v29;
LABEL_27:
    v31 = VSGetLogDefault();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226CB1000, v31, OS_LOG_TYPE_INFO, "Audio compressed for caching.", buf, 2u);
    }

    v32 = [[VSSpeechCacheAudio alloc] initWithKey:v14 audio:v30 wordTimingInfo:v16 voiceKey:v17 voiceResourceKey:v18];
    v33 = [(VSCachingService *)self threadLock];
    [v33 lock];

    v34 = [(VSCachingService *)self inMemoryCaches];
    [v34 addObject:v32];

    v35 = [(VSCachingService *)self threadLock];
    [v35 unlock];

    v36 = [(VSCachingService *)self cachingQueue];
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __102__VSCachingService__enqueueCacheWithHash_audioObject_timingInfo_voiceKey_voiceResourceKey_completion___block_invoke;
    v38[3] = &unk_2647DCE68;
    id v39 = v14;
    id v40 = v30;
    id v41 = v16;
    id v42 = v17;
    id v43 = v18;
    v44 = self;
    v45 = v32;
    id v46 = v19;
    v37 = v32;
    v22 = v30;
    dispatch_async(v36, v38);

    goto LABEL_30;
  }
LABEL_31:
}

void __102__VSCachingService__enqueueCacheWithHash_audioObject_timingInfo_voiceKey_voiceResourceKey_completion___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = [[VSSpeechCacheAudio alloc] initWithKey:*(void *)(a1 + 32) audio:*(void *)(a1 + 40) wordTimingInfo:*(void *)(a1 + 48) voiceKey:*(void *)(a1 + 56) voiceResourceKey:*(void *)(a1 + 64)];
  v3 = [*(id *)(a1 + 72) cacheStore];
  id v4 = [v3 addCache:v2];

  if (v4)
  {
    v5 = VSGetLogDefault();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      v11 = v4;
      _os_log_error_impl(&dword_226CB1000, v5, OS_LOG_TYPE_ERROR, "Can't add audio cache, error: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  char v6 = [*(id *)(a1 + 72) threadLock];
  [v6 lock];

  id v7 = [*(id *)(a1 + 72) inMemoryCaches];
  [v7 removeObject:*(void *)(a1 + 80)];

  uint64_t v8 = [*(id *)(a1 + 72) threadLock];
  [v8 unlock];

  uint64_t v9 = *(void *)(a1 + 88);
  if (v9) {
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v4);
  }
}

- (id)compressStreamAudio:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x263F84E58]);
  if (v3)
  {
    [v3 asbd];
  }
  else
  {
    uint64_t v37 = 0;
    memset(v36, 0, sizeof(v36));
  }
  v5 = (void *)[v4 initWithSourceASBD:v36];
  char v6 = [MEMORY[0x263EFF990] data];
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  uint64_t v35 = 0;
  id v7 = [MEMORY[0x263EFF990] data];
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = __Block_byref_object_copy__3456;
  v30 = __Block_byref_object_dispose__3457;
  id v31 = 0;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __40__VSCachingService_compressStreamAudio___block_invoke;
  v25[3] = &unk_2647DCDF0;
  v25[4] = &v26;
  [v5 setErrorHandler:v25];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __40__VSCachingService_compressStreamAudio___block_invoke_2;
  v21[3] = &unk_2647DCE18;
  id v8 = v6;
  id v22 = v8;
  double v24 = &v32;
  id v9 = v7;
  id v23 = v9;
  [v5 setOpusDataHandler:v21];
  [v5 beginEncoding];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __40__VSCachingService_compressStreamAudio___block_invoke_3;
  v18[3] = &unk_2647DCE40;
  id v10 = v5;
  id v19 = v10;
  uint64_t v20 = &v26;
  [v3 enumerateAudioWithBlock:v18];
  [v10 endEncoding];
  if (v27[5])
  {
    v11 = VSGetLogDefault();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = v27[5];
      *(_DWORD *)buf = 138412290;
      uint64_t v39 = v15;
      _os_log_error_impl(&dword_226CB1000, v11, OS_LOG_TYPE_ERROR, "Error converting stream audio during caching. %@", buf, 0xCu);
    }

    id v12 = 0;
  }
  else
  {
    id v12 = objc_alloc_init(MEMORY[0x263F84E18]);
    long long v13 = *(_OWORD *)(MEMORY[0x263F84EE8] + 16);
    v16[0] = *MEMORY[0x263F84EE8];
    v16[1] = v13;
    uint64_t v17 = *(void *)(MEMORY[0x263F84EE8] + 32);
    [v12 setAsbd:v16];
    [v12 setAudioData:v8];
    [v12 setPacketDescriptions:v9];
    [v12 setPacketCount:v33[3]];
  }

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

  return v12;
}

void __40__VSCachingService_compressStreamAudio___block_invoke(uint64_t a1, void *a2)
{
}

void __40__VSCachingService_compressStreamAudio___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = *(void **)(a1 + 32);
  id v8 = a4;
  [v7 appendData:a2];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += a3;
  [*(id *)(a1 + 40) appendData:v8];
}

uint64_t __40__VSCachingService_compressStreamAudio___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t result = [*(id *)(a1 + 32) encodeChunk:a2];
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    *a5 = 1;
  }
  return result;
}

- (id)compressAudio:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x263F84E58]);
  if (v3)
  {
    [v3 asbd];
  }
  else
  {
    uint64_t v34 = 0;
    memset(v33, 0, sizeof(v33));
  }
  v5 = (void *)[v4 initWithSourceASBD:v33];
  char v6 = [MEMORY[0x263EFF990] data];
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = 0;
  id v7 = [MEMORY[0x263EFF990] data];
  uint64_t v23 = 0;
  double v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = __Block_byref_object_copy__3456;
  v27 = __Block_byref_object_dispose__3457;
  id v28 = 0;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __34__VSCachingService_compressAudio___block_invoke;
  v22[3] = &unk_2647DCDF0;
  v22[4] = &v23;
  [v5 setErrorHandler:v22];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __34__VSCachingService_compressAudio___block_invoke_2;
  v18[3] = &unk_2647DCE18;
  id v8 = v6;
  id v19 = v8;
  int v21 = &v29;
  id v9 = v7;
  id v20 = v9;
  [v5 setOpusDataHandler:v18];
  [v5 beginEncoding];
  id v10 = [v3 audioData];
  [v5 encodeChunk:v10];

  [v5 endEncoding];
  if (v24[5])
  {
    v11 = VSGetLogDefault();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = v24[5];
      *(_DWORD *)buf = 138412290;
      uint64_t v36 = v15;
      _os_log_error_impl(&dword_226CB1000, v11, OS_LOG_TYPE_ERROR, "Error converting audio during caching. %@", buf, 0xCu);
    }

    id v12 = 0;
  }
  else
  {
    id v12 = objc_alloc_init(MEMORY[0x263F84E18]);
    long long v13 = *(_OWORD *)(MEMORY[0x263F84EE8] + 16);
    v16[0] = *MEMORY[0x263F84EE8];
    v16[1] = v13;
    uint64_t v17 = *(void *)(MEMORY[0x263F84EE8] + 32);
    [v12 setAsbd:v16];
    [v12 setAudioData:v8];
    [v12 setPacketDescriptions:v9];
    [v12 setPacketCount:v30[3]];
  }

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v12;
}

void __34__VSCachingService_compressAudio___block_invoke(uint64_t a1, void *a2)
{
}

void __34__VSCachingService_compressAudio___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = *(void **)(a1 + 32);
  id v8 = a4;
  [v7 appendData:a2];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += a3;
  [*(id *)(a1 + 40) appendData:v8];
}

- (VSCachingService)initWithCache:(id)a3 shortTermMemory:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)VSCachingService;
  id v9 = [(VSCachingService *)&v19 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_cacheStore, a3);
    v11 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    threadLock = v10->_threadLock;
    v10->_threadLock = v11;

    uint64_t v13 = [MEMORY[0x263EFF980] array];
    inMemoryCaches = v10->_inMemoryCaches;
    v10->_inMemoryCaches = (NSMutableArray *)v13;

    objc_storeStrong((id *)&v10->_shortTermCache, a4);
    uint64_t v15 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v16 = dispatch_queue_create("com.apple.voiced.cachingQueue", v15);
    cachingQueue = v10->_cachingQueue;
    v10->_cachingQueue = (OS_dispatch_queue *)v16;
  }
  return v10;
}

+ (id)standardService
{
  if (standardService_onceToken != -1) {
    dispatch_once(&standardService_onceToken, &__block_literal_global_3470);
  }
  v2 = (void *)standardService___standardService;
  return v2;
}

void __35__VSCachingService_standardService__block_invoke()
{
  v0 = [VSCachingService alloc];
  id v4 = +[VSSpeechCache defaultCacheStore];
  v1 = +[VSShortTermCache sharedInstance];
  uint64_t v2 = [(VSCachingService *)v0 initWithCache:v4 shortTermMemory:v1];
  id v3 = (void *)standardService___standardService;
  standardService___standardService = v2;
}

@end