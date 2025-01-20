@interface SEMSandboxSettings
+ (BOOL)supportsSecureCoding;
+ (SEMSandboxSettings)sandboxSettingsWithLocale:(id)a3 error:(id *)a4;
+ (id)defaultSandboxSettings;
- (BOOL)isSupportedDevicePlatform:(unsigned __int8)a3;
- (BOOL)isVanillaContainersEnabled;
- (SEMSandboxSettings)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SEMSandboxSettings

+ (id)defaultSandboxSettings
{
  id v2 = objc_alloc((Class)objc_opt_class());
  v6 = objc_msgSend_defaultLocalization(SEMLocalization, v3, v4, v5);
  v8 = objc_msgSend_initWithLocalization_assistantEnabled_(v2, v7, (uint64_t)v6, 1);

  return v8;
}

+ (SEMSandboxSettings)sandboxSettingsWithLocale:(id)a3 error:(id *)a4
{
  v32[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v11 = objc_msgSend_supportedLanguageCodeFromLocale_(SEMLocalization, v6, (uint64_t)v5, v7);
  if (v11)
  {
    v12 = [SEMLocalization alloc];
    v15 = objc_msgSend_initWithSiriLanguageCode_(v12, v13, (uint64_t)v11, v14);
    id v16 = objc_alloc((Class)objc_opt_class());
    v18 = objc_msgSend_initWithLocalization_assistantEnabled_(v16, v17, (uint64_t)v15, 1);
  }
  else
  {
    v19 = (void *)MEMORY[0x263F087E8];
    uint64_t v31 = *MEMORY[0x263F08320];
    v20 = NSString;
    v21 = objc_msgSend_localeIdentifier(v5, v8, v9, v10);
    v24 = objc_msgSend_stringWithFormat_(v20, v22, @"Unsupported locale: %@", v23, v21);
    v32[0] = v24;
    v26 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v25, (uint64_t)v32, (uint64_t)&v31, 1);
    v28 = objc_msgSend_errorWithDomain_code_userInfo_(v19, v27, @"com.apple.siri.inference.EntityMatcher.sandbox", 4, v26);
    v29 = v28;
    if (a4 && v28) {
      *a4 = v28;
    }

    v18 = 0;
  }

  return (SEMSandboxSettings *)v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v8 = objc_msgSend_localization(self, v5, v6, v7);
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)v8, @"l");

  uint64_t v10 = NSNumber;
  uint64_t isAssistantEnabled = objc_msgSend_isAssistantEnabled(self, v11, v12, v13);
  objc_msgSend_numberWithBool_(v10, v15, isAssistantEnabled, v16);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v17, (uint64_t)v18, @"a");
}

- (SEMSandboxSettings)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, @"l");
  uint64_t v8 = objc_opt_class();
  uint64_t v10 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v9, v8, @"a");

  uint64_t v14 = objc_msgSend_BOOLValue(v10, v11, v12, v13);
  uint64_t v16 = (SEMSandboxSettings *)objc_msgSend_initWithLocalization_assistantEnabled_(self, v15, (uint64_t)v7, v14);

  return v16;
}

- (BOOL)isSupportedDevicePlatform:(unsigned __int8)a3
{
  return a3 != 0;
}

- (BOOL)isVanillaContainersEnabled
{
  return 1;
}

@end