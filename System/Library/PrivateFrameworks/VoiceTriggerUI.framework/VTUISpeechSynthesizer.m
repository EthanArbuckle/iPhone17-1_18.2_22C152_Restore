@interface VTUISpeechSynthesizer
- (BOOL)isSpeaking;
- (SiriTTSAudioHintRequest)audioHintRequest;
- (SiriTTSAudioRequest)audioRequest;
- (SiriTTSDaemonSession)ttsSession;
- (SiriTTSServiceSession)serviceSession;
- (SiriTTSSpeechRequest)speechRequest;
- (VTUISpeechSynthesizer)init;
- (id)speakAudioHintCompletion;
- (id)speakStringCompletion;
- (void)setAudioHintRequest:(id)a3;
- (void)setAudioRequest:(id)a3;
- (void)setServiceSession:(id)a3;
- (void)setSpeakAudioHintCompletion:(id)a3;
- (void)setSpeakStringCompletion:(id)a3;
- (void)setSpeechRequest:(id)a3;
- (void)setTtsSession:(id)a3;
- (void)speak:(id)a3 completion:(id)a4;
- (void)speak:(id)a3 language:(id)a4 completion:(id)a5;
- (void)stopSpeaking;
@end

@implementation VTUISpeechSynthesizer

- (VTUISpeechSynthesizer)init
{
  v8.receiver = self;
  v8.super_class = (Class)VTUISpeechSynthesizer;
  v2 = [(VTUISpeechSynthesizer *)&v8 init];
  if (v2)
  {
    v3 = (SiriTTSDaemonSession *)objc_alloc_init(MEMORY[0x263F74E28]);
    ttsSession = v2->_ttsSession;
    v2->_ttsSession = v3;

    v5 = (SiriTTSServiceSession *)objc_alloc_init(MEMORY[0x263F74E70]);
    serviceSession = v2->_serviceSession;
    v2->_serviceSession = v5;
  }
  return v2;
}

- (void)speak:(id)a3 language:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(VTUISpeechSynthesizer *)self stopSpeaking];
  v11 = _Block_copy(v10);
  id speakStringCompletion = self->_speakStringCompletion;
  self->_id speakStringCompletion = v11;

  v13 = (void *)[objc_alloc(MEMORY[0x263F74E98]) initWithLanguage:v9 name:0];
  v14 = (void *)[objc_alloc(MEMORY[0x263F74E80]) initWithText:v8 voice:v13];
  objc_initWeak(&location, v14);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __51__VTUISpeechSynthesizer_speak_language_completion___block_invoke;
  v17[3] = &unk_264D4C258;
  objc_copyWeak(&v18, &location);
  [v14 setDidStartSpeaking:v17];
  objc_storeStrong((id *)&self->_speechRequest, v14);
  ttsSession = self->_ttsSession;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __51__VTUISpeechSynthesizer_speak_language_completion___block_invoke_5;
  v16[3] = &unk_264D4CA90;
  v16[4] = self;
  [(SiriTTSDaemonSession *)ttsSession speakWithSpeechRequest:v14 didFinish:v16];
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __51__VTUISpeechSynthesizer_speak_language_completion___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v2 = (void *)*MEMORY[0x263F28398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28398], OS_LOG_TYPE_DEFAULT))
  {
    v3 = v2;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v5 = [WeakRetained text];
    int v6 = 136315394;
    v7 = "-[VTUISpeechSynthesizer speak:language:completion:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v5;
    _os_log_impl(&dword_238878000, v3, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v6, 0x16u);
  }
}

void __51__VTUISpeechSynthesizer_speak_language_completion___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    v4 = *MEMORY[0x263F28398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28398], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315394;
      id v9 = "-[VTUISpeechSynthesizer speak:language:completion:]_block_invoke";
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_238878000, v4, OS_LOG_TYPE_DEFAULT, "%s Speech synthesizer failed to speak TTS %@", (uint8_t *)&v8, 0x16u);
    }
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 16);
  if (v5)
  {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
    uint64_t v6 = *(void *)(a1 + 32);
    v7 = *(void **)(v6 + 16);
    *(void *)(v6 + 16) = 0;
  }
}

- (void)speak:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  [(VTUISpeechSynthesizer *)self stopSpeaking];
  id v9 = _Block_copy(v8);
  id speakAudioHintCompletion = self->_speakAudioHintCompletion;
  self->_id speakAudioHintCompletion = v9;

  objc_initWeak(&location, v7);
  objc_storeStrong((id *)&self->_audioHintRequest, a3);
  serviceSession = self->_serviceSession;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __42__VTUISpeechSynthesizer_speak_completion___block_invoke;
  v12[3] = &unk_264D4CAB8;
  objc_copyWeak(&v13, &location);
  v12[4] = self;
  [(SiriTTSServiceSession *)serviceSession speakWithAudioHintRequest:v7 didFinish:v12];
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __42__VTUISpeechSynthesizer_speak_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = *MEMORY[0x263F28398];
  BOOL v5 = os_log_type_enabled((os_log_t)*MEMORY[0x263F28398], OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v11 = 136315394;
      uint64_t v12 = "-[VTUISpeechSynthesizer speak:completion:]_block_invoke";
      __int16 v13 = 2112;
      uint64_t v14 = (uint64_t)v3;
      _os_log_impl(&dword_238878000, v4, OS_LOG_TYPE_DEFAULT, "%s Speech synthesizer failed to speak AudioHint Request %@", (uint8_t *)&v11, 0x16u);
    }
  }
  else if (v5)
  {
    uint64_t v6 = v4;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    int v11 = 136315394;
    uint64_t v12 = "-[VTUISpeechSynthesizer speak:completion:]_block_invoke";
    __int16 v13 = 2048;
    uint64_t v14 = [WeakRetained dialogNumber];
    _os_log_impl(&dword_238878000, v6, OS_LOG_TYPE_DEFAULT, "%s Finished speaking AudioHint Request - dialogNumber #%ld", (uint8_t *)&v11, 0x16u);
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v8)
  {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);
    uint64_t v9 = *(void *)(a1 + 32);
    __int16 v10 = *(void **)(v9 + 8);
    *(void *)(v9 + 8) = 0;
  }
}

- (void)stopSpeaking
{
  if (self->_audioRequest)
  {
    -[SiriTTSDaemonSession cancelWithRequest:](self->_ttsSession, "cancelWithRequest:");
    audioRequest = self->_audioRequest;
    self->_audioRequest = 0;
  }
  if (self->_speechRequest)
  {
    -[SiriTTSDaemonSession cancelWithRequest:](self->_ttsSession, "cancelWithRequest:");
    speechRequest = self->_speechRequest;
    self->_speechRequest = 0;
  }
  if (self->_audioHintRequest)
  {
    -[SiriTTSDaemonSession cancelWithRequest:](self->_ttsSession, "cancelWithRequest:");
    audioHintRequest = self->_audioHintRequest;
    self->_audioHintRequest = 0;
  }
  id speakAudioHintCompletion = (void (**)(id, void))self->_speakAudioHintCompletion;
  if (speakAudioHintCompletion)
  {
    speakAudioHintCompletion[2](speakAudioHintCompletion, 0);
    id v7 = self->_speakAudioHintCompletion;
    self->_id speakAudioHintCompletion = 0;
  }
  id speakStringCompletion = (void (**)(id, void))self->_speakStringCompletion;
  if (speakStringCompletion)
  {
    speakStringCompletion[2](speakStringCompletion, 0);
    id v9 = self->_speakStringCompletion;
    self->_id speakStringCompletion = 0;
  }
}

- (BOOL)isSpeaking
{
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  v4 = v3;
  if (self->_audioHintRequest)
  {
    serviceSession = self->_serviceSession;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __35__VTUISpeechSynthesizer_isSpeaking__block_invoke;
    v13[3] = &unk_264D4CAE0;
    uint64_t v15 = &v16;
    uint64_t v14 = v3;
    [(SiriTTSServiceSession *)serviceSession getAudioPower:v13];
  }
  if (self->_speechRequest)
  {
    ttsSession = self->_ttsSession;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __35__VTUISpeechSynthesizer_isSpeaking__block_invoke_2;
    v10[3] = &unk_264D4CB08;
    uint64_t v12 = &v16;
    int v11 = v4;
    [(SiriTTSDaemonSession *)ttsSession isSpeaking:v10];
  }
  dispatch_time_t v7 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(v4, v7);
  char v8 = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return v8;
}

intptr_t __35__VTUISpeechSynthesizer_isSpeaking__block_invoke(uint64_t a1, float a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2 > 0.0;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __35__VTUISpeechSynthesizer_isSpeaking__block_invoke_2(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)speakAudioHintCompletion
{
  return self->_speakAudioHintCompletion;
}

- (void)setSpeakAudioHintCompletion:(id)a3
{
}

- (id)speakStringCompletion
{
  return self->_speakStringCompletion;
}

- (void)setSpeakStringCompletion:(id)a3
{
}

- (SiriTTSDaemonSession)ttsSession
{
  return self->_ttsSession;
}

- (void)setTtsSession:(id)a3
{
}

- (SiriTTSServiceSession)serviceSession
{
  return self->_serviceSession;
}

- (void)setServiceSession:(id)a3
{
}

- (SiriTTSAudioRequest)audioRequest
{
  return self->_audioRequest;
}

- (void)setAudioRequest:(id)a3
{
}

- (SiriTTSSpeechRequest)speechRequest
{
  return self->_speechRequest;
}

- (void)setSpeechRequest:(id)a3
{
}

- (SiriTTSAudioHintRequest)audioHintRequest
{
  return self->_audioHintRequest;
}

- (void)setAudioHintRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioHintRequest, 0);
  objc_storeStrong((id *)&self->_speechRequest, 0);
  objc_storeStrong((id *)&self->_audioRequest, 0);
  objc_storeStrong((id *)&self->_serviceSession, 0);
  objc_storeStrong((id *)&self->_ttsSession, 0);
  objc_storeStrong(&self->_speakStringCompletion, 0);
  objc_storeStrong(&self->_speakAudioHintCompletion, 0);
}

@end