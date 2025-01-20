@interface SFSSDeviceTTSTask
- (SFSSDeviceTTSTask)initWithRequest:(id)a3;
- (SFSSTTSEngine)ttsEngine;
- (void)cancelTask;
- (void)setTtsEngine:(id)a3;
- (void)startTask:(id)a3;
@end

@implementation SFSSDeviceTTSTask

- (void).cxx_destruct
{
}

- (void)setTtsEngine:(id)a3
{
}

- (SFSSTTSEngine)ttsEngine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ttsEngine);
  return (SFSSTTSEngine *)WeakRetained;
}

- (void)cancelTask
{
  id v2 = [(SFSSDeviceTTSTask *)self ttsEngine];
  [v2 stopSynthesis];
}

- (void)startTask:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, void *))a3;
  objc_initWeak(&location, self);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ttsEngine);
  v6 = [(SFSpeechSynthesisTask *)self request];
  v7 = [v6 text];
  v8 = [(SFSpeechSynthesisTask *)self request];
  uint64_t v9 = [v8 isPrivate];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __31__SFSSDeviceTTSTask_startTask___block_invoke;
  v19[3] = &unk_26489EA38;
  objc_copyWeak(&v20, &location);
  v19[4] = self;
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  v16 = __31__SFSSDeviceTTSTask_startTask___block_invoke_17;
  v17 = &unk_26489EA60;
  objc_copyWeak(&v18, &location);
  v10 = [WeakRetained synthesizeText:v7 loggable:v9 synthesisBegin:v19 synthesisChunk:&v14 synthesisEnd:&__block_literal_global_1529];

  -[SFSpeechSynthesisTask handleSynthesisEnd:](self, "handleSynthesisEnd:", v10, v14, v15, v16, v17);
  v11 = SFSSGetLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = [(SFSpeechSynthesisTask *)self error];
    *(_DWORD *)buf = 138412290;
    v23 = v12;
    _os_log_impl(&dword_22B575000, v11, OS_LOG_TYPE_INFO, "Device tts complete. error=%@", buf, 0xCu);
  }
  v13 = [(SFSpeechSynthesisTask *)self error];
  v4[2](v4, v13);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

uint64_t __31__SFSSDeviceTTSTask_startTask___block_invoke(uint64_t a1)
{
  id v2 = SFSSGetLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22B575000, v2, OS_LOG_TYPE_INFO, "Received device tts begin.", buf, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = [WeakRetained ttsEngine];
  v5 = v4;
  if (v4)
  {
    [v4 asbd];
  }
  else
  {
    uint64_t v15 = 0;
    long long v13 = 0u;
    long long v14 = 0u;
  }
  v6 = objc_msgSend(*(id *)(a1 + 32), "request", v13, v14, v15);
  v7 = [v6 voice];
  v8 = [v7 voiceAsset];
  uint64_t v9 = [*(id *)(a1 + 32) request];
  v10 = [v9 voice];
  v11 = [v10 resourceAsset];
  [WeakRetained handleSynthesisBegin:0 asbd:&v13 audioPlaybackBufferDuration:v8 voiceAsset:v11 resourceAsset:0.0];

  return 0;
}

uint64_t __31__SFSSDeviceTTSTask_startTask___block_invoke_17(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = SFSSGetLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v8 = 0;
    _os_log_debug_impl(&dword_22B575000, v4, OS_LOG_TYPE_DEBUG, "Received device tts chunk.", v8, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = [v3 pcmData];

  [WeakRetained handleSynthesisChunks:v6];
  return 0;
}

uint64_t __31__SFSSDeviceTTSTask_startTask___block_invoke_18()
{
  v0 = SFSSGetLogObject();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl(&dword_22B575000, v0, OS_LOG_TYPE_INFO, "Received device tts end.", v2, 2u);
  }

  return 0;
}

- (SFSSDeviceTTSTask)initWithRequest:(id)a3
{
  id v4 = a3;
  v5 = SFSSGetLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22B575000, v5, OS_LOG_TYPE_INFO, "Init device tts task.", buf, 2u);
  }

  v15.receiver = self;
  v15.super_class = (Class)SFSSDeviceTTSTask;
  v6 = [(SFSpeechSynthesisTask *)&v15 initWithRequest:v4];
  if (v6)
  {
    v7 = +[SFSSTTSEngineFactory sharedInstance];
    v8 = [v4 voice];
    uint64_t v9 = [v8 voiceAsset];
    v10 = [v4 voice];
    v11 = [v10 resourceAsset];
    v12 = [v7 getEngineByVoiceAsset:v9 resourceAsset:v11];
    objc_storeWeak((id *)&v6->_ttsEngine, v12);

    long long v13 = [(SFSpeechSynthesisTask *)v6 instrumentMetrics];
    [v13 setSourceOfTTS:2];
  }
  return v6;
}

@end