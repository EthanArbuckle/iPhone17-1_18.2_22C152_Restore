@interface WiFiUsageDeviceSession
- (WiFiUsageDeviceSession)initWithInterfaceName:(id)a3 andCapabilities:(id)a4;
- (id)metricName;
- (void)displayStateDidChange:(BOOL)a3;
- (void)linkQualityDidChange:(id)a3;
- (void)systemWakeStateDidChange:(BOOL)a3 wokenByWiFi:(BOOL)a4;
@end

@implementation WiFiUsageDeviceSession

- (void)linkQualityDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)WiFiUsageDeviceSession;
  [(WiFiUsageSession *)&v9 linkQualityDidChange:a3];
  v4 = [MEMORY[0x1E4F1C9C8] date];
  v5 = [(WiFiUsageSession *)self sessionStartTime];
  [v4 timeIntervalSinceDate:v5];
  double v7 = v6;

  if (v7 > 86400.0)
  {
    v8 = [(WiFiUsageSession *)self sessionStartTime];
    NSLog(&cfstr_SSessionStarte.isa, "-[WiFiUsageDeviceSession linkQualityDidChange:]", v8, *(void *)&v7);

    [(WiFiUsageSession *)self sessionDidEnd];
    [(WiFiUsageSession *)self sessionDidStart];
  }
}

- (WiFiUsageDeviceSession)initWithInterfaceName:(id)a3 andCapabilities:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)WiFiUsageDeviceSession;
  result = [(WiFiUsageSession *)&v5 initWithSessionType:1 andInterfaceName:a3 andCapabilities:a4];
  result->_firstDisplayOn = 1;
  return result;
}

- (void)displayStateDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WiFiUsageDeviceSession;
  -[WiFiUsageSession displayStateDidChange:](&v9, sel_displayStateDidChange_);
  if (v3)
  {
    if (self->_firstDisplayOn)
    {
      if (![(WiFiUsageSession *)self isSessionActive])
      {
        NSLog(&cfstr_SDeviceSession.isa, "-[WiFiUsageDeviceSession displayStateDidChange:]");
        [(WiFiUsageSession *)self sessionDidStart];
      }
      self->_firstDisplayOn = 0;
    }
  }
  else
  {
    objc_super v5 = [MEMORY[0x1E4F1C9C8] date];
    double v6 = [(WiFiUsageSession *)self sessionStartTime];
    [v5 timeIntervalSinceDate:v6];
    double v8 = v7;

    if (v8 > 86400.0) {
      [(WiFiUsageSession *)self sessionDidEnd];
    }
  }
}

- (void)systemWakeStateDidChange:(BOOL)a3 wokenByWiFi:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  NSLog(&cfstr_SUIsawakeUWoke.isa, a2, "-[WiFiUsageDeviceSession systemWakeStateDidChange:wokenByWiFi:]", 52, a3, a4);
  v8.receiver = self;
  v8.super_class = (Class)WiFiUsageDeviceSession;
  [(WiFiUsageSession *)&v8 systemWakeStateDidChange:v5 wokenByWiFi:v4];
  if (v5)
  {
    if (![(WiFiUsageSession *)self isSessionActive])
    {
      NSLog(&cfstr_SDeviceSession.isa, "-[WiFiUsageDeviceSession systemWakeStateDidChange:wokenByWiFi:]");
      [(WiFiUsageSession *)self sessionDidStart];
    }
  }
  else
  {
    [(WiFiUsageSession *)self systemAwakeDuration];
    if (v7 > 86400.0) {
      [(WiFiUsageSession *)self sessionDidEnd];
    }
  }
}

- (id)metricName
{
  return @"com.apple.wifi.devicesession";
}

@end