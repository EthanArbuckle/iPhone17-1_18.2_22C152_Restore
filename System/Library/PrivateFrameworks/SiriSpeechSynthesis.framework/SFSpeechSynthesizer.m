@interface SFSpeechSynthesizer
+ (id)getVoiceByName:(id)a3;
+ (id)supportedLocales;
+ (id)supportedVoicesByLocale:(id)a3;
+ (void)initialize;
- (BOOL)isVoiceAssetDownloaded;
- (NSLocale)locale;
- (SFSpeechSynthesisVoice)voice;
- (SFSpeechSynthesizer)init;
- (SFSpeechSynthesizer)initWithVoice:(id)a3;
- (id)startTaskWithRequest:(id)a3 completion:(id)a4;
- (id)startTaskWithRequest:(id)a3 delegate:(id)a4;
- (id)startTaskWithRequest:(id)a3 delegate:(id)a4 completion:(id)a5;
- (void)dealloc;
- (void)prewarm:(int64_t)a3;
@end

@implementation SFSpeechSynthesizer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voice, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_cacheTaskQueue, 0);
  objc_storeStrong((id *)&self->_deviceTaskQueue, 0);
  objc_storeStrong((id *)&self->_serverTaskQueue, 0);
}

- (BOOL)isVoiceAssetDownloaded
{
  return self->_isVoiceAssetDownloaded;
}

- (SFSpeechSynthesisVoice)voice
{
  return self->_voice;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)SFSpeechSynthesizer;
  [(SFSpeechSynthesizer *)&v2 dealloc];
}

- (id)startTaskWithRequest:(id)a3 delegate:(id)a4 completion:(id)a5
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(SFSpeechSynthesisVoice *)self->_voice gender];
  [v8 setGender:v11];

  v12 = [(SFSpeechSynthesisVoice *)self->_voice locale];
  v13 = [v12 localeIdentifier];
  [v8 setLocale:v13];

  v14 = [(SFSpeechSynthesisVoice *)self->_voice name];
  [v8 setVoiceName:v14];

  v15 = [MEMORY[0x263F086E0] mainBundle];
  v16 = [v15 bundleIdentifier];
  [v8 setClientBundleIdentifier:v16];

  v17 = [MEMORY[0x263F08C38] UUID];
  v18 = [v17 UUIDString];
  [v8 setRequestIdentifer:v18];

  [v8 setVoice:self->_voice];
  v19 = SFSSGetLogObject();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v63 = v8;
    _os_log_impl(&dword_22B575000, v19, OS_LOG_TYPE_INFO, "SpeakRequest: %@", buf, 0xCu);
  }

  if ([v8 useCache])
  {
    v20 = [v8 voiceName];
    v21 = [v8 text];
    v22 = +[SFSSCacheItem generateCacheKey:v20 text:v21];

    v23 = +[SFSSCachingService sharedInstance];
    v24 = [v23 objectForKey:v22];

    if (v24)
    {
      v25 = SFSSGetLogObject();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        v26 = [v8 requestIdentifer];
        *(_DWORD *)buf = 138412290;
        id v63 = v26;
        _os_log_impl(&dword_22B575000, v25, OS_LOG_TYPE_INFO, "Found request in cache: %@", buf, 0xCu);
      }
      if ([v8 type])
      {
        cacheTaskQueue = self->_cacheTaskQueue;
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __64__SFSpeechSynthesizer_startTaskWithRequest_delegate_completion___block_invoke_2;
        block[3] = &unk_26489EA10;
        v28 = &v58;
        v29 = (id *)&v57;
        uint64_t v57 = 0;
        id v58 = v10;
        dispatch_async(cacheTaskQueue, block);
        v30 = 0;
      }
      else
      {
        v47 = [[SFSSCacheTask alloc] initWithRequest:v8];
        [(SFSpeechSynthesisTask *)v47 setDelegate:v9];
        v48 = self->_cacheTaskQueue;
        v59[0] = MEMORY[0x263EF8330];
        v59[1] = 3221225472;
        v59[2] = __64__SFSpeechSynthesizer_startTaskWithRequest_delegate_completion___block_invoke;
        v59[3] = &unk_26489EA10;
        v28 = (id *)&v60;
        v30 = v47;
        v60 = v30;
        v29 = &v61;
        id v61 = v10;
        dispatch_async(v48, v59);
      }

      v46 = v30;
      goto LABEL_20;
    }
  }
  if ([v8 solutionType])
  {
    v31 = [(SFSpeechSynthesisVoice *)self->_voice voiceAsset];

    if (!v31)
    {
      v32 = +[SFSSAssetManager sharedInstance];
      v33 = [v32 getVoiceAssetByVoice:self->_voice];

      v34 = [(SFSpeechSynthesizer *)self voice];
      [v34 setVoiceAsset:v33];
    }
    v35 = [(SFSpeechSynthesisVoice *)self->_voice resourceAsset];

    if (!v35)
    {
      v36 = +[SFSSAssetManager sharedInstance];
      v37 = [v36 getResoruceAssetByVoice:self->_voice];

      v38 = [(SFSpeechSynthesizer *)self voice];
      [v38 setResourceAsset:v37];
    }
    v39 = [[SFSSDeviceTTSTask alloc] initWithRequest:v8];
    [(SFSpeechSynthesisTask *)v39 setDelegate:v9];
    deviceTaskQueue = self->_deviceTaskQueue;
    v50[0] = MEMORY[0x263EF8330];
    v50[1] = 3221225472;
    v50[2] = __64__SFSpeechSynthesizer_startTaskWithRequest_delegate_completion___block_invoke_4;
    v50[3] = &unk_26489EA10;
    v41 = (id *)&v51;
    v42 = v39;
    v51 = v42;
    v43 = &v52;
    id v52 = v10;
    v44 = v50;
  }
  else
  {
    v45 = [[SFSSServerTTSTask alloc] initWithRequest:v8];
    [(SFSpeechSynthesisTask *)v45 setDelegate:v9];
    deviceTaskQueue = self->_serverTaskQueue;
    v53[0] = MEMORY[0x263EF8330];
    v53[1] = 3221225472;
    v53[2] = __64__SFSpeechSynthesizer_startTaskWithRequest_delegate_completion___block_invoke_3;
    v53[3] = &unk_26489EA10;
    v41 = (id *)&v54;
    v42 = v45;
    v54 = v42;
    v43 = &v55;
    id v55 = v10;
    v44 = v53;
  }
  dispatch_async(deviceTaskQueue, v44);

  v46 = v42;
LABEL_20:

  return v46;
}

uint64_t __64__SFSpeechSynthesizer_startTaskWithRequest_delegate_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) start:*(void *)(a1 + 40)];
}

void __64__SFSpeechSynthesizer_startTaskWithRequest_delegate_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

uint64_t __64__SFSpeechSynthesizer_startTaskWithRequest_delegate_completion___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) start:*(void *)(a1 + 40)];
}

uint64_t __64__SFSpeechSynthesizer_startTaskWithRequest_delegate_completion___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) start:*(void *)(a1 + 40)];
}

- (id)startTaskWithRequest:(id)a3 delegate:(id)a4
{
  return [(SFSpeechSynthesizer *)self startTaskWithRequest:a3 delegate:a4 completion:0];
}

- (id)startTaskWithRequest:(id)a3 completion:(id)a4
{
  return [(SFSpeechSynthesizer *)self startTaskWithRequest:a3 delegate:0 completion:a4];
}

- (void)prewarm:(int64_t)a3
{
  if (!a3)
  {
    id v4 = +[SFSSOspreyTTSClient sharedInstance];
    [v4 prewarm];
  }
}

- (SFSpeechSynthesizer)initWithVoice:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = SFSSGetLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = [v5 name];
    *(_DWORD *)buf = 138412290;
    v20 = v7;
    _os_log_impl(&dword_22B575000, v6, OS_LOG_TYPE_INFO, "Init Synthesizer with voice: %@", buf, 0xCu);
  }
  v18.receiver = self;
  v18.super_class = (Class)SFSpeechSynthesizer;
  id v8 = [(SFSpeechSynthesizer *)&v18 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_voice, a3);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.speech.speechsynthesis.task.device", 0);
    deviceTaskQueue = v9->_deviceTaskQueue;
    v9->_deviceTaskQueue = (OS_dispatch_queue *)v10;

    v12 = MEMORY[0x263EF83A8];
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.speech.speechsynthesis.task.server", MEMORY[0x263EF83A8]);
    serverTaskQueue = v9->_serverTaskQueue;
    v9->_serverTaskQueue = (OS_dispatch_queue *)v13;

    dispatch_queue_t v15 = dispatch_queue_create("com.apple.speech.speechsynthesis.task.cache", v12);
    cacheTaskQueue = v9->_cacheTaskQueue;
    v9->_cacheTaskQueue = (OS_dispatch_queue *)v15;
  }
  return v9;
}

- (SFSpeechSynthesizer)init
{
  uint64_t v3 = [MEMORY[0x263EFF960] currentLocale];
  id v4 = +[SFSpeechSynthesisVoice getDefaultVoiceByLocale:v3];

  if (v4)
  {
    self = [(SFSpeechSynthesizer *)self initWithVoice:v4];
    id v5 = self;
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)getVoiceByName:(id)a3
{
  return +[SFSpeechSynthesisVoice getVoiceByName:a3];
}

+ (id)supportedVoicesByLocale:(id)a3
{
  return +[SFSpeechSynthesisVoice supportedVoicesByLocale:a3];
}

+ (id)supportedLocales
{
  return +[SFSpeechSynthesisVoice supportedLocales];
}

+ (void)initialize
{
}

@end