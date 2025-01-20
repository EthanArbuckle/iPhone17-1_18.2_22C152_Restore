@interface SVXAudioServicesUtils
- (BOOL)audioServicesActivateWithTimeout;
- (BOOL)shouldPrewarmAudioServicesActivate;
- (int)_activate;
@end

@implementation SVXAudioServicesUtils

- (int)_activate
{
  int inPropertyData = 1;
  return AudioServicesSetProperty(0x61637474u, 0, 0, 4u, &inPropertyData);
}

- (BOOL)audioServicesActivateWithTimeout
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3 = (os_log_t *)MEMORY[0x263F28348];
  v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v8 = 136315138;
    v9 = "-[SVXAudioServicesUtils audioServicesActivateWithTimeout]";
    _os_log_impl(&dword_220062000, v4, OS_LOG_TYPE_INFO, "%s Activating audio services with timeout...", (uint8_t *)&v8, 0xCu);
  }
  int v5 = [(SVXAudioServicesUtils *)self _activate];
  v6 = *v3;
  if (v5)
  {
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315394;
      v9 = "-[SVXAudioServicesUtils audioServicesActivateWithTimeout]";
      __int16 v10 = 1024;
      int v11 = v5;
      _os_log_error_impl(&dword_220062000, v6, OS_LOG_TYPE_ERROR, "%s Failed to activate audio services with timeout. (result = %d)", (uint8_t *)&v8, 0x12u);
    }
  }
  else if (os_log_type_enabled(*v3, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315138;
    v9 = "-[SVXAudioServicesUtils audioServicesActivateWithTimeout]";
    _os_log_impl(&dword_220062000, v6, OS_LOG_TYPE_INFO, "%s Activated audio services with timeout.", (uint8_t *)&v8, 0xCu);
  }
  return v5 == 0;
}

- (BOOL)shouldPrewarmAudioServicesActivate
{
  return MGGetProductType() != 1540760353;
}

@end