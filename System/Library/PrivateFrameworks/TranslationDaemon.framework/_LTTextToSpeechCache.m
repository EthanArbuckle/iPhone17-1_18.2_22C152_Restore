@interface _LTTextToSpeechCache
- (_LTTextToSpeechCache)init;
- (id)audioDataForKey:(id)a3;
- (void)cacheAudioData:(id)a3 forKey:(id)a4;
- (void)clear;
@end

@implementation _LTTextToSpeechCache

- (_LTTextToSpeechCache)init
{
  v9.receiver = self;
  v9.super_class = (Class)_LTTextToSpeechCache;
  v2 = [(_LTTextToSpeechCache *)&v9 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.translation.tts-cache", 0);
    cacheQueue = v2->_cacheQueue;
    v2->_cacheQueue = (OS_dispatch_queue *)v3;

    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    cache = v2->_cache;
    v2->_cache = (NSMutableDictionary *)v5;

    v7 = v2;
  }

  return v2;
}

- (void)cacheAudioData:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (_LTPreferencesDebugDisableTTSCache())
  {
    v8 = _LTOSLogTTS();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[_LTTextToSpeechCache cacheAudioData:forKey:](v8);
    }
  }
  else
  {
    objc_initWeak(&location, self);
    cacheQueue = self->_cacheQueue;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __46___LTTextToSpeechCache_cacheAudioData_forKey___block_invoke;
    v10[3] = &unk_2655470C0;
    objc_copyWeak(&v13, &location);
    id v11 = v7;
    id v12 = v6;
    dispatch_async(cacheQueue, v10);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

- (id)audioDataForKey:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__11;
  v18 = __Block_byref_object_dispose__11;
  id v19 = 0;
  cacheQueue = self->_cacheQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40___LTTextToSpeechCache_audioDataForKey___block_invoke;
  block[3] = &unk_265548230;
  id v13 = &v14;
  block[4] = self;
  id v6 = v4;
  id v12 = v6;
  dispatch_sync(cacheQueue, block);
  id v7 = _LTOSLogTTS();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    if (v15[5]) {
      v8 = @"HIT";
    }
    else {
      v8 = @"MISS";
    }
    *(_DWORD *)buf = 138543362;
    v21 = v8;
    _os_log_impl(&dword_2600DC000, v7, OS_LOG_TYPE_INFO, "TTS cache request: %{public}@", buf, 0xCu);
  }
  id v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

- (void)clear
{
  objc_initWeak(&location, self);
  cacheQueue = self->_cacheQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __29___LTTextToSpeechCache_clear__block_invoke;
  v4[3] = &unk_265545E20;
  objc_copyWeak(&v5, &location);
  dispatch_async(cacheQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_cacheQueue, 0);
}

- (void)cacheAudioData:(os_log_t)log forKey:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2600DC000, log, OS_LOG_TYPE_DEBUG, "Not saving data to TTS cache since debug setting to disable TTS cache is set", v1, 2u);
}

@end