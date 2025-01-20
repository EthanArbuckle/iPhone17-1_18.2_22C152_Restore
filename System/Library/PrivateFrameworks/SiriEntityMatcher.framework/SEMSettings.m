@interface SEMSettings
+ (BOOL)isUserVaultEnabled;
+ (BOOL)useMediaThresholdFiltering;
+ (BOOL)useSensitiveLogging;
+ (id)defaultSettings;
+ (void)disableOverrideAcceptAllSets;
+ (void)enableOverrideAcceptAllSets;
- (BOOL)_isSiriUODSupported;
- (BOOL)isAssistantEnabled;
- (BOOL)isEvaluationEnabled;
- (BOOL)isSupportedDevicePlatform:(unsigned __int8)a3;
- (BOOL)isVanillaContainersEnabled;
- (SEMLocalization)localization;
- (SEMSettings)initWithLocalization:(id)a3 assistantEnabled:(BOOL)a4;
- (id).cxx_construct;
- (void)refresh;
- (void)setEvaluationEnabled:(BOOL)a3;
@end

@implementation SEMSettings

+ (id)defaultSettings
{
  id v2 = objc_alloc((Class)objc_opt_class());
  v6 = objc_msgSend_defaultLocalization(SEMLocalization, v3, v4, v5);
  uint64_t isAssistantEnabled = objc_msgSend_isAssistantEnabled(SEMAssistantSettingsBridge, v7, v8, v9);
  v12 = objc_msgSend_initWithLocalization_assistantEnabled_(v2, v11, (uint64_t)v6, isAssistantEnabled);

  return v12;
}

+ (BOOL)useSensitiveLogging
{
  id v2 = (void *)xpc_copy_entitlements_for_self();
  BOOL v3 = xpc_dictionary_get_BOOL(v2, "com.apple.siri.inference.EntityMatcher.useSensitiveLogging");

  return v3;
}

+ (BOOL)useMediaThresholdFiltering
{
  sub_25C81EEE4();
  return HIDWORD(v2) & 1;
}

- (SEMSettings)initWithLocalization:(id)a3 assistantEnabled:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SEMSettings;
  uint64_t v8 = [(SEMSettings *)&v11 init];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_localization, a3);
    atomic_store(a4, (unsigned __int8 *)&v9->_assistantEnabled);
  }

  return v9;
}

- (void)refresh
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  BOOL v3 = qword_26B3549D8;
  if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315138;
    objc_super v11 = "-[SEMSettings refresh]";
    _os_log_impl(&dword_25C7CA000, v3, OS_LOG_TYPE_INFO, "%s Refreshing localization and enablement options", (uint8_t *)&v10, 0xCu);
  }
  objc_msgSend_refresh(self->_localization, v4, v5, v6);
  atomic_store(objc_msgSend_isAssistantEnabled(SEMAssistantSettingsBridge, v7, v8, v9), (unsigned __int8 *)&self->_assistantEnabled);
}

- (BOOL)isAssistantEnabled
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_assistantEnabled);
  return v2 & 1;
}

- (BOOL)isEvaluationEnabled
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if ((objc_msgSend_isCustomerInstall(SEMAssistantSettingsBridge, a2, v2, v3) & 1) == 0)
  {
    uint64_t v5 = (void *)CFPreferencesCopyAppValue(@"Evaluation Enabled", @"com.apple.SiriEntityMatcher");
    if (v5)
    {
      if (objc_opt_respondsToSelector())
      {
        char v4 = objc_msgSend_BOOLValue(v5, v6, v7, v8);
LABEL_10:

        return v4;
      }
      uint64_t v9 = qword_26B3549D8;
      if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
      {
        int v11 = 136315650;
        uint64_t v12 = "_BOOLValueForKey";
        __int16 v13 = 2112;
        v14 = v5;
        __int16 v15 = 2112;
        v16 = @"Evaluation Enabled";
        _os_log_error_impl(&dword_25C7CA000, v9, OS_LOG_TYPE_ERROR, "%s value %@ for key %@ should respond to -BOOLValue", (uint8_t *)&v11, 0x20u);
      }

      uint64_t v5 = 0;
    }
    char v4 = 0;
    goto LABEL_10;
  }
  return 0;
}

- (void)setEvaluationEnabled:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  CFPreferencesSetAppValue(@"Evaluation Enabled", v4, @"com.apple.SiriEntityMatcher");
}

- (BOOL)_isSiriUODSupported
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  char isSiriUODSupported = objc_msgSend_isSiriUODSupported(SEMAssistantSettingsBridge, a2, v2, v3);
  if ((isSiriUODSupported & 1) == 0)
  {
    uint64_t v5 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
    {
      int v7 = 136315138;
      uint64_t v8 = "-[SEMSettings _isSiriUODSupported]";
      _os_log_impl(&dword_25C7CA000, v5, OS_LOG_TYPE_INFO, "%s Siri Understanding on Device not supported", (uint8_t *)&v7, 0xCu);
    }
  }
  return isSiriUODSupported;
}

- (BOOL)isSupportedDevicePlatform:(unsigned __int8)a3
{
  uint64_t v4 = a3;
  uint64_t v20 = *MEMORY[0x263EF8340];
  if ((objc_msgSend_isAssistantEnabled(self, a2, a3, v3) & 1) == 0)
  {
    uint64_t v9 = qword_26B3549D8;
    int v8 = os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO);
    if (!v8) {
      return v8;
    }
    int v16 = 136315138;
    uint64_t v17 = "-[SEMSettings isSupportedDevicePlatform:]";
    _os_log_impl(&dword_25C7CA000, v9, OS_LOG_TYPE_INFO, "%s Siri Assistant is not enabled in settings", (uint8_t *)&v16, 0xCu);
    goto LABEL_14;
  }
  if (v4 < 2) {
    goto LABEL_14;
  }
  if (v4 != 3)
  {
    if (v4 == 2)
    {
      LOBYTE(v8) = 1;
      return v8;
    }
    int v10 = (id)qword_26B3549D8;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v14 = sub_25C7EB25C(v4, v11, v12, v13);
      int v16 = 136315394;
      uint64_t v17 = "-[SEMSettings isSupportedDevicePlatform:]";
      __int16 v18 = 2112;
      v19 = v14;
      _os_log_error_impl(&dword_25C7CA000, v10, OS_LOG_TYPE_ERROR, "%s Unexpected capability type: %@", (uint8_t *)&v16, 0x16u);
    }
LABEL_14:
    LOBYTE(v8) = 0;
    return v8;
  }
  LOBYTE(v8) = MEMORY[0x270F9A6D0](self, sel__isSiriUODSupported, v6, v7);
  return v8;
}

+ (BOOL)isUserVaultEnabled
{
  return 0;
}

- (BOOL)isVanillaContainersEnabled
{
  return MEMORY[0x270ED8070]("Cascade", "enableVanillaContainers");
}

+ (void)enableOverrideAcceptAllSets
{
  CFStringRef v3 = (const __CFString *)objc_msgSend_stringWithFormat_(NSString, a2, @"Accept %@", v2, @"*");
  uint64_t v4 = (const void *)MEMORY[0x263EFFA88];
  CFPreferencesSetAppValue(v3, v4, @"com.apple.SiriEntityMatcher");
}

+ (void)disableOverrideAcceptAllSets
{
  CFStringRef v3 = (const __CFString *)objc_msgSend_stringWithFormat_(NSString, a2, @"Accept %@", v2, @"*");
  CFPreferencesSetAppValue(v3, 0, @"com.apple.SiriEntityMatcher");
}

- (SEMLocalization)localization
{
  return (SEMLocalization *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((unsigned char *)self + 8) = 0;
  return self;
}

@end