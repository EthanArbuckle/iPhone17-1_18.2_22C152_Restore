@interface VSTextToPhonemesTask
- (BOOL)isSpeaking;
- (id)reply;
- (int64_t)phonemeSystem;
- (void)main;
- (void)setPhonemeSystem:(int64_t)a3;
- (void)setReply:(id)a3;
@end

@implementation VSTextToPhonemesTask

- (void).cxx_destruct
{
}

- (void)setReply:(id)a3
{
}

- (id)reply
{
  return self->_reply;
}

- (void)setPhonemeSystem:(int64_t)a3
{
  self->_phonemeSystem = a3;
}

- (int64_t)phonemeSystem
{
  return self->_phonemeSystem;
}

- (void)main
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v3 = VSGetLogDefault();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v14 = [(VSSpeechSpeakTask *)self instrumentMetrics];
    *(_DWORD *)buf = 134217984;
    uint64_t v20 = [v14 requestCreatedTimestamp];
    _os_log_debug_impl(&dword_226CB1000, v3, OS_LOG_TYPE_DEBUG, "Starting text to phonemes task %llu", buf, 0xCu);
  }
  [(VSSpeechSpeakTask *)self fetchVoiceAsset];
  v4 = [(VSSpeechSpeakTask *)self voiceSelection];

  if (v4)
  {
    v5 = (void *)MEMORY[0x263F84E60];
    v6 = [(VSSpeechSpeakTask *)self request];
    v7 = [v6 text];
    v8 = [(VSSpeechSpeakTask *)self voiceSelection];
    v9 = [v8 voicePath];
    id v17 = 0;
    v10 = objc_msgSend(v5, "generateTTSPhonemes:voicePath:phonemeSystem:error:", v7, v9, -[VSTextToPhonemesTask phonemeSystem](self, "phonemeSystem"), &v17);
    id v11 = v17;

    v18 = v10;
    v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v18 count:1];
    [(VSSpeechSpeakTask *)self setPhonemes:v12];

    [(VSSpeechSpeakTask *)self setError:v11];
  }
  v13 = VSGetLogDefault();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v15 = [(VSSpeechSpeakTask *)self instrumentMetrics];
    uint64_t v16 = [v15 requestCreatedTimestamp];
    *(_DWORD *)buf = 134217984;
    uint64_t v20 = v16;
    _os_log_debug_impl(&dword_226CB1000, v13, OS_LOG_TYPE_DEBUG, "Finished text to phonemes task %llu", buf, 0xCu);
  }
}

- (BOOL)isSpeaking
{
  return 0;
}

@end