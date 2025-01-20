@interface SVXSpeechSynthesisConfigurationStateManager
- (BOOL)updateConfiguration:(id)a3;
- (SVXClientAudioSystemServicing)clientAudioSystemServicing;
- (SVXSpeechSynthesisConfiguration)currentConfiguration;
- (void)setClientAudioSystemServicing:(id)a3;
@end

@implementation SVXSpeechSynthesisConfigurationStateManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientAudioSystemServicing, 0);

  objc_storeStrong((id *)&self->_currentConfiguration, 0);
}

- (void)setClientAudioSystemServicing:(id)a3
{
}

- (SVXClientAudioSystemServicing)clientAudioSystemServicing
{
  return self->_clientAudioSystemServicing;
}

- (SVXSpeechSynthesisConfiguration)currentConfiguration
{
  return self->_currentConfiguration;
}

- (BOOL)updateConfiguration:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(SVXSpeechSynthesisConfiguration *)self->_currentConfiguration locale];
  v6 = [v4 locale];
  v7 = v6;
  if (v6 && ([v6 isEqual:v5] & 1) == 0)
  {
    v24 = *MEMORY[0x263F28348];
    int v8 = 1;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v29 = "-[SVXSpeechSynthesisConfigurationStateManager updateConfiguration:]";
      __int16 v30 = 2112;
      unint64_t v31 = (unint64_t)v5;
      __int16 v32 = 2112;
      unint64_t v33 = (unint64_t)v7;
      _os_log_impl(&dword_220062000, v24, OS_LOG_TYPE_INFO, "%s locale changed from %@ to %@.", buf, 0x20u);
    }
  }
  else
  {
    int v8 = 0;
  }
  v9 = [(SVXSpeechSynthesisConfiguration *)self->_currentConfiguration outputVoiceInfo];
  v10 = [v4 outputVoiceInfo];
  v11 = v10;
  if (v10 && ([v10 isEqual:v9] & 1) == 0)
  {
    v25 = *MEMORY[0x263F28348];
    int v12 = 1;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v29 = "-[SVXSpeechSynthesisConfigurationStateManager updateConfiguration:]";
      __int16 v30 = 2112;
      unint64_t v31 = (unint64_t)v9;
      __int16 v32 = 2112;
      unint64_t v33 = (unint64_t)v11;
      _os_log_impl(&dword_220062000, v25, OS_LOG_TYPE_INFO, "%s outputVoiceInfo changed from %@ to %@.", buf, 0x20u);
    }
  }
  else
  {
    int v12 = 0;
  }
  uint64_t v13 = [(SVXSpeechSynthesisConfiguration *)self->_currentConfiguration audioSessionID];
  uint64_t v14 = [v4 audioSessionID];
  if (!v14 || (uint64_t v15 = v14, v14 == v13))
  {
    uint64_t v15 = v13;
    if ((v8 | v12) != 1)
    {
      BOOL v23 = 0;
      goto LABEL_25;
    }
  }
  else
  {
    v27 = v5;
    int v16 = v8;
    v17 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v29 = "-[SVXSpeechSynthesisConfigurationStateManager updateConfiguration:]";
      __int16 v30 = 2048;
      unint64_t v31 = v13;
      __int16 v32 = 2048;
      unint64_t v33 = v15;
      _os_log_impl(&dword_220062000, v17, OS_LOG_TYPE_INFO, "%s audioSessionID changed from %lu to %lu.", buf, 0x20u);
    }
    int v8 = v16;
    v5 = v27;
  }
  if (v8) {
    v18 = v7;
  }
  else {
    v18 = v5;
  }
  v19 = [SVXSpeechSynthesisConfiguration alloc];
  if (v12) {
    v20 = v11;
  }
  else {
    v20 = v9;
  }
  v21 = [(SVXSpeechSynthesisConfiguration *)v19 initWithLocale:v18 outputVoiceInfo:v20 audioSessionID:v15];
  currentConfiguration = self->_currentConfiguration;
  self->_currentConfiguration = v21;

  BOOL v23 = 1;
LABEL_25:

  return v23;
}

@end