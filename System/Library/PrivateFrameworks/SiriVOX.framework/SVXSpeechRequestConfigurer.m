@interface SVXSpeechRequestConfigurer
- (SVXSpeechRequestConfigurer)initWithConfigurationManager:(id)a3 voiceConfigurer:(id)a4;
- (id)speechRequestForContext:(id)a3 preferences:(id)a4;
@end

@implementation SVXSpeechRequestConfigurer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceConfigurer, 0);

  objc_storeStrong((id *)&self->_configurationManager, 0);
}

- (id)speechRequestForContext:(id)a3 preferences:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [(SVXSynthesisVoiceConfigurer *)self->_voiceConfigurer voiceForContext:v6 preferences:a4];
  v8 = [v6 request];
  v9 = (void *)[objc_alloc(MEMORY[0x263F74E80]) initWithText:&stru_26D1E1D80 voice:v7];
  v10 = [v8 speakableContext];
  [v9 setContextInfo:v10];

  uint64_t v11 = [v6 audioSessionID];
  if (!v11)
  {
    v12 = [v6 audioSessionAssertion];
    uint64_t v11 = [v12 audioSessionID];
    if (!v11)
    {
      v13 = [(SVXSpeechSynthesisConfigurationStateManager *)self->_configurationManager currentConfiguration];
      uint64_t v11 = [v13 audioSessionID];
    }
  }
  v14 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v16 = 136315394;
    v17 = "-[SVXSpeechRequestConfigurer speechRequestForContext:preferences:]";
    __int16 v18 = 2048;
    uint64_t v19 = v11;
    _os_log_impl(&dword_220062000, v14, OS_LOG_TYPE_INFO, "%s audioSessionID = %lu", (uint8_t *)&v16, 0x16u);
  }
  [v9 setAudioSessionId:v11];

  return v9;
}

- (SVXSpeechRequestConfigurer)initWithConfigurationManager:(id)a3 voiceConfigurer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SVXSpeechRequestConfigurer;
  v9 = [(SVXSpeechRequestConfigurer *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_configurationManager, a3);
    objc_storeStrong((id *)&v10->_voiceConfigurer, a4);
  }

  return v10;
}

@end