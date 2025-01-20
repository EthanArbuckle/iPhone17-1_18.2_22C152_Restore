@interface SUICDefaultVoicePreviewer
- (SUICVoicePreviewingDelegate)delegate;
- (void)audioPowerUpdaterDidFire:(id)a3;
- (void)audioPowerUpdaterDidUpdate:(id)a3;
- (void)dealloc;
- (void)previewVoice:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)stopVoicePreview;
@end

@implementation SUICDefaultVoicePreviewer

- (void)previewVoice:(id)a3 completion:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v8 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v35 = "-[SUICDefaultVoicePreviewer previewVoice:completion:]";
    __int16 v36 = 2112;
    id v37 = v6;
    _os_log_impl(&dword_1A64CC000, v8, OS_LOG_TYPE_DEFAULT, "%s Requesting to play voice preview for : %@", buf, 0x16u);
  }
  [(NSTimer *)self->_outputAudioPowerUpdater invalidate];
  if (!self->previewSessions)
  {
    v9 = (SiriTTSServiceSession *)objc_alloc_init(MEMORY[0x1E4FA4F50]);
    session = self->_session;
    self->_session = v9;

    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    previewSessions = self->previewSessions;
    self->previewSessions = v11;
  }
  id v13 = objc_alloc_init(MEMORY[0x1E4F29128]);
  v14 = [v13 UUIDString];

  [(NSMutableSet *)self->previewSessions addObject:v14];
  id v15 = objc_alloc(MEMORY[0x1E4FA4F70]);
  v16 = [v6 languageCode];
  v17 = [v6 name];
  v18 = (void *)[v15 initWithLanguage:v16 name:v17];

  v19 = (void *)[objc_alloc(MEMORY[0x1E4FA4F40]) initWithVoice:v18 previewType:1];
  objc_storeStrong((id *)&self->_lastRequest, v19);
  v20 = self->_session;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __53__SUICDefaultVoicePreviewer_previewVoice_completion___block_invoke;
  v29[3] = &unk_1E5C59880;
  objc_copyWeak(&v32, &location);
  id v21 = v14;
  id v30 = v21;
  id v22 = v7;
  id v31 = v22;
  [(SiriTTSServiceSession *)v20 speakWithPreviewRequest:v19 didFinish:v29];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    v24 = (void *)MEMORY[0x1E4F1CB00];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __53__SUICDefaultVoicePreviewer_previewVoice_completion___block_invoke_3;
    v27[3] = &unk_1E5C598A8;
    objc_copyWeak(&v28, &location);
    v25 = [v24 scheduledTimerWithTimeInterval:1 repeats:v27 block:0.0166666667];
    outputAudioPowerUpdater = self->_outputAudioPowerUpdater;
    self->_outputAudioPowerUpdater = v25;

    objc_destroyWeak(&v28);
  }

  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);
}

void __53__SUICDefaultVoicePreviewer_previewVoice_completion___block_invoke(id *a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v15 = "-[SUICDefaultVoicePreviewer previewVoice:completion:]_block_invoke";
    __int16 v16 = 1024;
    BOOL v17 = v3 == 0;
    _os_log_impl(&dword_1A64CC000, v4, OS_LOG_TYPE_DEFAULT, "%s Successfully: %d", buf, 0x12u);
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__SUICDefaultVoicePreviewer_previewVoice_completion___block_invoke_5;
  v9[3] = &unk_1E5C59858;
  objc_copyWeak(&v13, a1 + 6);
  id v10 = a1[4];
  id v12 = a1[5];
  id v5 = v3;
  id v11 = v5;
  id v6 = (void (**)(void))MEMORY[0x1AD0BCD30](v9);
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    v6[2](v6);
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__SUICDefaultVoicePreviewer_previewVoice_completion___block_invoke_2;
    block[3] = &unk_1E5C593F8;
    v8 = v6;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  objc_destroyWeak(&v13);
}

uint64_t __53__SUICDefaultVoicePreviewer_previewVoice_completion___block_invoke_5(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    [WeakRetained[3] removeObject:*(void *)(a1 + 32)];
    uint64_t v3 = *(void *)(a1 + 48);
    if (v3) {
      (*(void (**)(uint64_t, BOOL, void))(v3 + 16))(v3, *(void *)(a1 + 40) == 0, 0);
    }
  }

  return MEMORY[0x1F41817F8]();
}

uint64_t __53__SUICDefaultVoicePreviewer_previewVoice_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __53__SUICDefaultVoicePreviewer_previewVoice_completion___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained audioPowerUpdaterDidFire:v3];
  }
  else {
    [v3 invalidate];
  }
}

- (void)audioPowerUpdaterDidFire:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  session = self->_session;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__SUICDefaultVoicePreviewer_audioPowerUpdaterDidFire___block_invoke;
  v7[3] = &unk_1E5C598F8;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [(SiriTTSServiceSession *)session getAudioPower:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __54__SUICDefaultVoicePreviewer_audioPowerUpdaterDidFire___block_invoke(uint64_t a1, float a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __54__SUICDefaultVoicePreviewer_audioPowerUpdaterDidFire___block_invoke_2;
    v9[3] = &unk_1E5C598D0;
    void v9[4] = WeakRetained;
    float v10 = a2;
    id v6 = (void (**)(void))MEMORY[0x1AD0BCD30](v9);
    if ([MEMORY[0x1E4F29060] isMainThread])
    {
      v6[2](v6);
    }
    else
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __54__SUICDefaultVoicePreviewer_audioPowerUpdaterDidFire___block_invoke_3;
      block[3] = &unk_1E5C593F8;
      id v8 = v6;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
    [v5 audioPowerUpdaterDidUpdate:*(void *)(a1 + 32)];
  }
  else
  {
    [*(id *)(a1 + 32) invalidate];
  }
}

void __54__SUICDefaultVoicePreviewer_audioPowerUpdaterDidFire___block_invoke_2(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) delegate];
  LODWORD(v2) = *(_DWORD *)(a1 + 40);
  [v3 voicePreviewerAudioOutputDidChangePowerLevel:v2];
}

uint64_t __54__SUICDefaultVoicePreviewer_audioPowerUpdaterDidFire___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)audioPowerUpdaterDidUpdate:(id)a3
{
  id v4 = a3;
  if (![(NSMutableSet *)self->previewSessions count]) {
    [v4 invalidate];
  }
}

- (void)stopVoicePreview
{
  if (self->_lastRequest) {
    -[SiriTTSServiceSession cancelWithRequest:](self->_session, "cancelWithRequest:");
  }
}

- (void)dealloc
{
  [(SUICDefaultVoicePreviewer *)self stopVoicePreview];
  v3.receiver = self;
  v3.super_class = (Class)SUICDefaultVoicePreviewer;
  [(SUICDefaultVoicePreviewer *)&v3 dealloc];
}

- (SUICVoicePreviewingDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SUICVoicePreviewingDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lastRequest, 0);
  objc_storeStrong((id *)&self->previewSessions, 0);
  objc_storeStrong((id *)&self->_session, 0);

  objc_storeStrong((id *)&self->_outputAudioPowerUpdater, 0);
}

@end