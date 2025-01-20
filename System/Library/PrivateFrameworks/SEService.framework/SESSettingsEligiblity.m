@interface SESSettingsEligiblity
+ (BOOL)isApplicationInstalledOrPlaceholder:(id)a3;
+ (BOOL)isContactlessTCCServiceEligible;
+ (BOOL)isDefaultContactlessAppConfigurationEligible;
+ (BOOL)isSecureElementTCCServiceEligible;
@end

@implementation SESSettingsEligiblity

+ (BOOL)isDefaultContactlessAppConfigurationEligible
{
  return 0;
}

+ (BOOL)isSecureElementTCCServiceEligible
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v2 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.seserviced.contactlessCredential.settings"];
  v3 = v2;
  if (v2)
  {
    int v4 = [v2 BOOLForKey:@"shouldShowSecureElementTcc"];
    v5 = SESDefaultLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7[0] = 67109376;
      v7[1] = 1;
      __int16 v8 = 1024;
      int v9 = v4;
      _os_log_impl(&dword_2146ED000, v5, OS_LOG_TYPE_INFO, "SE TCC Pane: Platform eligible %d, Apps eligible: %d", (uint8_t *)v7, 0xEu);
    }
  }
  else
  {
    v5 = SESDefaultLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v7[0]) = 0;
      _os_log_impl(&dword_2146ED000, v5, OS_LOG_TYPE_DEBUG, "Unable to initialize user default suite for Settings Eligibility", (uint8_t *)v7, 2u);
    }
    LOBYTE(v4) = 0;
  }

  return v4;
}

+ (BOOL)isContactlessTCCServiceEligible
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v2 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.seserviced.contactlessCredential.settings"];
  v3 = v2;
  if (v2)
  {
    int v4 = [v2 BOOLForKey:@"shouldShowContactlessTcc"];
    v5 = SESDefaultLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7[0] = 67109376;
      v7[1] = 1;
      __int16 v8 = 1024;
      int v9 = v4;
      _os_log_impl(&dword_2146ED000, v5, OS_LOG_TYPE_INFO, "Contactless TCC Pane: Platform eligible %d, Apps eligible: %d", (uint8_t *)v7, 0xEu);
    }
  }
  else
  {
    v5 = SESDefaultLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v7[0]) = 0;
      _os_log_impl(&dword_2146ED000, v5, OS_LOG_TYPE_DEBUG, "Unable to initialize user default suite for Settings Eligibility", (uint8_t *)v7, 2u);
    }
    LOBYTE(v4) = 0;
  }

  return v4;
}

+ (BOOL)isApplicationInstalledOrPlaceholder:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v9 = 0;
  int v4 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:v3 allowPlaceholder:1 error:&v9];
  id v5 = v9;
  if (v5)
  {
    v6 = SESDefaultLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v11 = v5;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_impl(&dword_2146ED000, v6, OS_LOG_TYPE_ERROR, "Error %@ encountered when checking if %@ is installed", buf, 0x16u);
    }

    BOOL v7 = 0;
  }
  else
  {
    BOOL v7 = v4 != 0;
  }

  return v7;
}

@end