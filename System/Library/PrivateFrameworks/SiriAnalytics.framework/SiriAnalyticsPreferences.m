@interface SiriAnalyticsPreferences
- (BOOL)killSwitchEnabled;
- (BOOL)simulateCustomerImage;
- (BOOL)tailMessagesToOSLogEnabled;
- (NSData)preprocessorBookmark;
- (SiriAnalyticsPreferences)init;
- (SiriAnalyticsPreferences)initWithPreferencesDomain:(__CFString *)a3;
- (double)unifiedStreamMaxAge;
- (double)unifiedStreamMaxAgeOrDefault;
- (id)pluginStateForBundleIdentifier:(id)a3;
- (id)pluginsState;
- (unint64_t)unifiedStreamMaxSize;
- (unint64_t)unifiedStreamMaxSizeOrDefault;
- (void)setKillSwitchEnabled:(BOOL)a3;
- (void)setPluginState:(id)a3 forBundleIdentifier:(id)a4;
- (void)setPluginsState:(id)a3;
- (void)setPreprocessorBookmark:(id)a3;
- (void)setUnifiedStreamMaxAge:(double)a3;
- (void)setUnifiedStreamMaxAgeOrDefault:(double)a3;
- (void)setUnifiedStreamMaxSize:(unint64_t)a3;
- (void)synchronize;
@end

@implementation SiriAnalyticsPreferences

- (void)setUnifiedStreamMaxAgeOrDefault:(double)a3
{
  self->_unifiedStreamMaxAgeOrDefault = a3;
}

- (void)synchronize
{
}

- (BOOL)simulateCustomerImage
{
  return CFPreferencesGetAppBooleanValue(@"Simulate Customer Image", self->_domain, 0) != 0;
}

- (void)setKillSwitchEnabled:(BOOL)a3
{
  if (a3) {
    v4 = (const void *)[NSNumber numberWithBool:1];
  }
  else {
    v4 = 0;
  }
  domain = self->_domain;
  CFPreferencesSetAppValue(@"Kill Switch", v4, domain);
}

- (BOOL)killSwitchEnabled
{
  return CFPreferencesGetAppBooleanValue(@"Kill Switch", self->_domain, 0) != 0;
}

- (void)setPluginsState:(id)a3
{
}

- (id)pluginsState
{
  v2 = (void *)CFPreferencesCopyAppValue(@"Plugins State", self->_domain);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v2];
  }
  else
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
  }
  v4 = (void *)v3;

  return v4;
}

- (void)setPluginState:(id)a3 forBundleIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SiriAnalyticsPreferences *)self pluginsState];
  [v8 setObject:v7 forKey:v6];

  [(SiriAnalyticsPreferences *)self setPluginsState:v8];
}

- (id)pluginStateForBundleIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(SiriAnalyticsPreferences *)self pluginsState];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (double)unifiedStreamMaxAgeOrDefault
{
  [(SiriAnalyticsPreferences *)self unifiedStreamMaxAge];
  if (result == 0.0) {
    return 604800.0;
  }
  return result;
}

- (void)setUnifiedStreamMaxAge:(double)a3
{
  id v4 = (const void *)[NSNumber numberWithInt:(int)a3];
  domain = self->_domain;
  CFPreferencesSetAppValue(@"Unified Stream Max Age", v4, domain);
}

- (double)unifiedStreamMaxAge
{
  return (double)CFPreferencesGetAppIntegerValue(@"Unified Stream Max Age", self->_domain, 0);
}

- (unint64_t)unifiedStreamMaxSizeOrDefault
{
  unint64_t result = [(SiriAnalyticsPreferences *)self unifiedStreamMaxSize];
  if (!result) {
    return 50;
  }
  return result;
}

- (void)setUnifiedStreamMaxSize:(unint64_t)a3
{
  id v4 = (const void *)[NSNumber numberWithInt:a3];
  domain = self->_domain;
  CFPreferencesSetAppValue(@"Unified Stream Max Size", v4, domain);
}

- (unint64_t)unifiedStreamMaxSize
{
  return CFPreferencesGetAppIntegerValue(@"Unified Stream Max Size", self->_domain, 0);
}

- (void)setPreprocessorBookmark:(id)a3
{
}

- (NSData)preprocessorBookmark
{
  v2 = (void *)CFPreferencesCopyAppValue(@"Preprocessor Bookmark", self->_domain);
  return (NSData *)v2;
}

- (BOOL)tailMessagesToOSLogEnabled
{
  return CFPreferencesGetAppBooleanValue(@"Tail to OSLog", self->_domain, 0) != 0;
}

- (SiriAnalyticsPreferences)initWithPreferencesDomain:(__CFString *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SiriAnalyticsPreferences;
  id v4 = [(SiriAnalyticsPreferences *)&v6 init];
  if (v4) {
    v4->_domain = (__CFString *)CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a3);
  }
  return v4;
}

- (SiriAnalyticsPreferences)init
{
  return [(SiriAnalyticsPreferences *)self initWithPreferencesDomain:@"com.apple.siri.analytics.assistant"];
}

@end