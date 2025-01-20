@interface WFPrivateAddressConfigManager
- (WFPrivateAddressConfigManager)init;
- (__SCPreferences)prefs;
- (id)privateAddressConfig;
- (void)dealloc;
- (void)setPrefs:(__SCPreferences *)a3;
@end

@implementation WFPrivateAddressConfigManager

- (WFPrivateAddressConfigManager)init
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v7.receiver = self;
  v7.super_class = (Class)WFPrivateAddressConfigManager;
  v2 = [(WFPrivateAddressConfigManager *)&v7 init];
  if (!v2)
  {
LABEL_9:

    return 0;
  }
  uint64_t v3 = SCPreferencesCreateWithOptions();
  v2->_prefs = (__SCPreferences *)v3;
  if (!v3)
  {
    v5 = WFLogForCategory(0);
    os_log_type_t v6 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "-[WFPrivateAddressConfigManager init]";
      _os_log_impl(&dword_226071000, v5, v6, "%s: failed to get SCPreferencesRef", buf, 0xCu);
    }

    goto LABEL_9;
  }
  return v2;
}

- (void)dealloc
{
  prefs = self->_prefs;
  if (prefs)
  {
    CFRelease(prefs);
    self->_prefs = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)WFPrivateAddressConfigManager;
  [(WFPrivateAddressConfigManager *)&v4 dealloc];
}

- (id)privateAddressConfig
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if ([(WFPrivateAddressConfigManager *)self prefs])
  {
    if (!SCPreferencesLock([(WFPrivateAddressConfigManager *)self prefs], 0))
    {
      SCPreferencesSynchronize([(WFPrivateAddressConfigManager *)self prefs]);
      SCPreferencesLock([(WFPrivateAddressConfigManager *)self prefs], 1u);
    }
    uint64_t v3 = SCPreferencesGetValue([(WFPrivateAddressConfigManager *)self prefs], @"List of scanned networks with private mac");
  }
  else
  {
    v5 = WFLogForCategory(0);
    os_log_type_t v6 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
    {
      int v7 = 136315138;
      v8 = "-[WFPrivateAddressConfigManager privateAddressConfig]";
      _os_log_impl(&dword_226071000, v5, v6, "%s: failed to get SCPreferencesRef", (uint8_t *)&v7, 0xCu);
    }

    uint64_t v3 = 0;
  }
  return v3;
}

- (__SCPreferences)prefs
{
  return self->_prefs;
}

- (void)setPrefs:(__SCPreferences *)a3
{
  self->_prefs = a3;
}

@end