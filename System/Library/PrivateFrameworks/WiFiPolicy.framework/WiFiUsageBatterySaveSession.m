@interface WiFiUsageBatterySaveSession
- (WiFiUsageBatterySaveSession)initWithInterfaceName:(id)a3 andCapabilities:(id)a4;
- (id)metricName;
- (void)updateWowState:(BOOL)a3 lpasState:(BOOL)a4 lowPowerState:(BOOL)a5 batterySaverState:(BOOL)a6;
@end

@implementation WiFiUsageBatterySaveSession

- (WiFiUsageBatterySaveSession)initWithInterfaceName:(id)a3 andCapabilities:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)WiFiUsageBatterySaveSession;
  result = [(WiFiUsageSession *)&v5 initWithSessionType:7 andInterfaceName:a3 andCapabilities:a4];
  result->_batterySaveMode = 0;
  return result;
}

- (void)updateWowState:(BOOL)a3 lpasState:(BOOL)a4 lowPowerState:(BOOL)a5 batterySaverState:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  BOOL v9 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a6)
  {
    if (!self->_batterySaveMode)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v13 = "-[WiFiUsageBatterySaveSession updateWowState:lpasState:lowPowerState:batterySaverState:]";
        _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: Battery save mode session started", buf, 0xCu);
      }
      [(WiFiUsageSession *)self sessionDidStart];
      self->_batterySaveMode = 1;
    }
  }
  else if (self->_batterySaveMode)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[WiFiUsageBatterySaveSession updateWowState:lpasState:lowPowerState:batterySaverState:]";
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: Battery save session ended", buf, 0xCu);
    }
    self->_batterySaveMode = 0;
    [(WiFiUsageSession *)self sessionDidEnd];
  }
  v11.receiver = self;
  v11.super_class = (Class)WiFiUsageBatterySaveSession;
  [(WiFiUsageSession *)&v11 updateWowState:v9 lpasState:v8 lowPowerState:v7 batterySaverState:v6];
}

- (id)metricName
{
  return @"com.apple.wifi.batterysavesession";
}

@end