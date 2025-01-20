@interface TMPreferences
- (BOOL)NTPUseServicePort;
- (BOOL)areTimeZonePopupsEnabled;
- (BOOL)isAppleTV;
- (BOOL)isAutomaticTimeEnabled;
- (BOOL)isAutomaticTimeZoneEnabled;
- (BOOL)isMac;
- (BOOL)isWatch;
- (BOOL)shouldAlertWhenIslanded;
- (BOOL)shouldAllowTimeTool;
- (BOOL)shouldClamp;
- (BOOL)shouldCorrectOnWake;
- (BOOL)shouldFetchOnWake;
- (BOOL)shouldPowerAssertionsBeOptional;
- (BOOL)shouldUseFilesystemTimestamp;
- (BOOL)supportsBasebandAPTimeSync;
- (NSString)NTPServerAddress;
- (NSString)NTPServerPort;
- (NSString)providerName;
- (TMPreferences)init;
- (TMPreferences)initWithDefaults:(id)a3;
- (double)NTPBurstRetryInterval;
- (double)NTPSchedulingInterval;
- (double)NTPUnsetSchedulingInterval;
- (double)NTPWantedThreshold;
- (double)RTCFrequencyNoiseDensity;
- (double)RTCFrequencyTolerance;
- (double)RTCMachSyncInterval;
- (double)RTCWakeUncertainty;
- (double)basebandWantedThreshold;
- (double)settimeofdayThreshold;
- (id)description;
- (int64_t)NTPBurstRetryAttempts;
- (int64_t)NTPServicePortMaxRetries;
- (int64_t)commandHistorySizeKey;
- (void)dealloc;
- (void)setAccurateThresholds:(BOOL)a3;
- (void)setAutomaticTimeEnabled:(BOOL)a3;
- (void)setAutomaticTimeZoneEnabled:(BOOL)a3;
- (void)setNTPUseServicePort:(BOOL)a3;
@end

@implementation TMPreferences

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TMPreferences;
  [(TMPreferences *)&v3 dealloc];
}

- (TMPreferences)initWithDefaults:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TMPreferences;
  v4 = [(TMPreferences *)&v6 init];
  if (v4)
  {
    _CFPreferencesSetFileProtectionClass();
    v4->_defaults = (NSUserDefaults *)a3;
    sub_1000153D4((id *)&v4->super.isa);
  }
  return v4;
}

- (TMPreferences)init
{
  objc_super v3 = +[NSUserDefaults standardUserDefaults];

  return [(TMPreferences *)self initWithDefaults:v3];
}

- (BOOL)isAppleTV
{
  v2 = (const void *)MGCopyAnswer();
  if (!v2) {
    return 0;
  }
  objc_super v3 = v2;
  BOOL v4 = CFEqual(v2, @"AppleTV") != 0;
  CFRelease(v3);
  return v4;
}

- (BOOL)isMac
{
  return 0;
}

- (BOOL)supportsBasebandAPTimeSync
{
  v2 = (const void *)MGCopyAnswer();
  objc_super v3 = v2;
  if (v2) {
    CFRelease(v2);
  }
  return v3 != 0;
}

- (BOOL)isWatch
{
  id v2 = (id)MGCopyAnswer();

  return [v2 isEqualToString:@"Watch"];
}

- (void)setAccurateThresholds:(BOOL)a3
{
  id v3 = (id)a3;
  id v5 = [(NSUserDefaults *)self->_defaults objectForKey:@"ForceAccurateTime"];
  if (v5)
  {
    id v3 = [v5 BOOLValue];
    objc_super v6 = qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
    {
      v7 = "disabled";
      if (v3) {
        v7 = "enabled";
      }
      *(_DWORD *)buf = 136315138;
      v17 = (void *)v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Forcing accurate thresholds to be %s, from defaults.", buf, 0xCu);
    }
  }
  v8 = qword_1000338F8;
  if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
  {
    v9 = "inaccurate";
    if (v3) {
      v9 = "accurate";
    }
    *(_DWORD *)buf = 136315138;
    v17 = (void *)v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Setting thresholds to be %s", buf, 0xCu);
  }
  v14[0] = @"BBTimeWantedThreshold";
  if (v3)
  {
    unsigned int v10 = [(TMPreferences *)self supportsBasebandAPTimeSync];
    double v11 = INFINITY;
    if (v10) {
      double v11 = 0.048;
    }
  }
  else
  {
    double v11 = INFINITY;
  }
  v15[0] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v11, v14[0]);
  v15[1] = &off_10002C278;
  v14[1] = @"NtpTimeWantedThreshold";
  v14[2] = @"CorrectTimeOnWake";
  v15[2] = +[NSNumber numberWithBool:v3];
  v12 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];
  v13 = qword_1000338F8;
  if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Registering these thresholds: %@", buf, 0xCu);
  }
  [(NSUserDefaults *)self->_defaults registerDefaults:v12];
}

- (id)description
{
  id v2 = [(NSUserDefaults *)self->_defaults dictionaryRepresentation];

  return [(NSDictionary *)v2 description];
}

- (NSString)NTPServerPort
{
  return [(NSUserDefaults *)self->_defaults stringForKey:@"NtpTimeServerPort"];
}

- (BOOL)shouldFetchOnWake
{
  return [(NSUserDefaults *)self->_defaults BOOLForKey:@"FetchTimeOnWake"];
}

- (BOOL)shouldCorrectOnWake
{
  return [(NSUserDefaults *)self->_defaults BOOLForKey:@"CorrectTimeOnWake"];
}

- (double)RTCMachSyncInterval
{
  [(NSUserDefaults *)self->_defaults doubleForKey:@"RTCMachSyncInterval"];
  return result;
}

- (double)RTCWakeUncertainty
{
  [(NSUserDefaults *)self->_defaults doubleForKey:@"RTCWakeUncertainty"];
  return result;
}

- (double)settimeofdayThreshold
{
  [(NSUserDefaults *)self->_defaults doubleForKey:@"SettimeofdayThreshold"];
  return result;
}

- (int64_t)commandHistorySizeKey
{
  return [(NSUserDefaults *)self->_defaults integerForKey:@"CommandHistorySize"];
}

- (double)NTPSchedulingInterval
{
  [(NSUserDefaults *)self->_defaults doubleForKey:@"NtpSchedulingInterval"];
  return result;
}

- (double)NTPBurstRetryInterval
{
  [(NSUserDefaults *)self->_defaults doubleForKey:@"NtpBurstRetryInterval"];
  return result;
}

- (int64_t)NTPBurstRetryAttempts
{
  return [(NSUserDefaults *)self->_defaults integerForKey:@"NtpBurstRetryAttempts"];
}

- (double)NTPUnsetSchedulingInterval
{
  [(NSUserDefaults *)self->_defaults doubleForKey:@"NtpUnsetSchedulingInterval"];
  return result;
}

- (BOOL)NTPUseServicePort
{
  return [(NSUserDefaults *)self->_defaults BOOLForKey:@"NtpUseServicePort"];
}

- (NSString)providerName
{
  return [(NSUserDefaults *)self->_defaults stringForKey:@"TimeProvider"];
}

- (double)basebandWantedThreshold
{
  [(NSUserDefaults *)self->_defaults doubleForKey:@"BBTimeWantedThreshold"];
  return result;
}

- (double)NTPWantedThreshold
{
  [(NSUserDefaults *)self->_defaults doubleForKey:@"NtpTimeWantedThreshold"];
  return result;
}

- (int64_t)NTPServicePortMaxRetries
{
  return [(NSUserDefaults *)self->_defaults integerForKey:@"NtpServicePortMaxRetries"];
}

- (BOOL)areTimeZonePopupsEnabled
{
  return [(NSUserDefaults *)self->_defaults BOOLForKey:@"TimeZonePopups"];
}

- (BOOL)shouldUseFilesystemTimestamp
{
  return [(NSUserDefaults *)self->_defaults BOOLForKey:@"UseFilesystemTimestamp"];
}

- (double)RTCFrequencyTolerance
{
  [(NSUserDefaults *)self->_defaults doubleForKey:@"RTCFrequencyTolerance"];
  return result;
}

- (double)RTCFrequencyNoiseDensity
{
  [(NSUserDefaults *)self->_defaults doubleForKey:@"RTCFrequencyNoiseDensity"];
  return result;
}

- (NSString)NTPServerAddress
{
  if (!os_variant_allows_internal_security_policies()
    || (double result = [(NSUserDefaults *)self->_defaults stringForKey:@"NtpTimeServer"]) == 0)
  {
    if (self) {
      return (NSString *)@"time.apple.com";
    }
    else {
      return 0;
    }
  }
  return result;
}

- (BOOL)shouldClamp
{
  id v3 = [(TMPreferences *)self NTPServerAddress];
  if (self) {
    CFStringRef v4 = @"time.apple.com";
  }
  else {
    CFStringRef v4 = 0;
  }

  return [(NSString *)v3 isEqualToString:v4];
}

- (BOOL)shouldAlertWhenIslanded
{
  return _os_variant_has_internal_ui("com.apple.timed", a2);
}

- (BOOL)shouldAllowTimeTool
{
  return os_variant_allows_internal_security_policies();
}

- (BOOL)shouldPowerAssertionsBeOptional
{
  return _os_variant_is_darwinos("com.apple.timed", a2);
}

- (BOOL)isAutomaticTimeEnabled
{
  BOOL v3 = [(NSUserDefaults *)self->_defaults BOOLForKey:@"TMAutomaticTimeOnlyEnabled"];
  if (v3) {
    LOBYTE(v3) = ![(NSUserDefaults *)self->_defaults BOOLForKey:@"DisableAutomaticTime"];
  }
  return v3;
}

- (void)setAutomaticTimeEnabled:(BOOL)a3
{
}

- (BOOL)isAutomaticTimeZoneEnabled
{
  BOOL v3 = [(NSUserDefaults *)self->_defaults BOOLForKey:@"TMAutomaticTimeZoneEnabled"];
  if (v3) {
    LOBYTE(v3) = ![(NSUserDefaults *)self->_defaults BOOLForKey:@"DisableAutomaticTime"];
  }
  return v3;
}

- (void)setAutomaticTimeZoneEnabled:(BOOL)a3
{
}

- (void)setNTPUseServicePort:(BOOL)a3
{
}

@end