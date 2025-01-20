@interface SSRSysdiagnoseFileHandler
+ (BOOL)_isDirectory:(id)a3;
+ (BOOL)personalizedSiriEnrollmentAudioLoggingEnabledFromRoot;
+ (id)fetchVoiceProfileFilePathsWithError:(id *)a3;
@end

@implementation SSRSysdiagnoseFileHandler

+ (BOOL)personalizedSiriEnrollmentAudioLoggingEnabledFromRoot
{
  if (personalizedSiriEnrollmentAudioLoggingEnabledFromRoot_onceToken != -1) {
    dispatch_once(&personalizedSiriEnrollmentAudioLoggingEnabledFromRoot_onceToken, &__block_literal_global_6235);
  }
  return personalizedSiriEnrollmentAudioLoggingEnabledFromRoot_audioLoggingEnabled;
}

void __82__SSRSysdiagnoseFileHandler_personalizedSiriEnrollmentAudioLoggingEnabledFromRoot__block_invoke()
{
  v0 = [NSDictionary dictionaryWithContentsOfFile:@"/Library/Managed Preferences/mobile/com.apple.voicetrigger.notbackedup.plist"];
  if (v0)
  {
    id v3 = v0;
    v1 = [v0 objectForKeyedSubscript:@"Personalized Siri Enrollment Audio Logging Enabled"];

    v0 = v3;
    if (v1)
    {
      v2 = [v3 objectForKeyedSubscript:@"Personalized Siri Enrollment Audio Logging Enabled"];
      personalizedSiriEnrollmentAudioLoggingEnabledFromRoot_audioLoggingEnabled = [v2 BOOLValue];

      v0 = v3;
    }
  }
}

+ (BOOL)_isDirectory:(id)a3
{
  BOOL v7 = 0;
  id v3 = (void *)MEMORY[0x263F08850];
  id v4 = a3;
  v5 = [v3 defaultManager];
  [v5 fileExistsAtPath:v4 isDirectory:&v7];

  return v7;
}

+ (id)fetchVoiceProfileFilePathsWithError:(id *)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  SSRLogInitIfNeeded();
  id v4 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v35 = "+[SSRSysdiagnoseFileHandler fetchVoiceProfileFilePathsWithError:]";
    _os_log_impl(&dword_21C8A5000, v4, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  if ((CSIsIOS() & 1) == 0)
  {
    v21 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v35 = "+[SSRSysdiagnoseFileHandler fetchVoiceProfileFilePathsWithError:]";
      _os_log_impl(&dword_21C8A5000, v21, OS_LOG_TYPE_DEFAULT, "%s Voice Profile copying is not supported in this platform yet", buf, 0xCu);
    }
    if (a3)
    {
      v22 = (void *)MEMORY[0x263F087E8];
      uint64_t v23 = 1301;
LABEL_29:
      [v22 errorWithDomain:@"com.apple.speakerrecognition" code:v23 userInfo:0];
      id v29 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_37;
    }
LABEL_30:
    id v29 = 0;
    goto LABEL_37;
  }
  if (!+[SSRSysdiagnoseFileHandler personalizedSiriEnrollmentAudioLoggingEnabledFromRoot])
  {
    v24 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v35 = "+[SSRSysdiagnoseFileHandler fetchVoiceProfileFilePathsWithError:]";
      _os_log_impl(&dword_21C8A5000, v24, OS_LOG_TYPE_DEFAULT, "%s The enrollment profile is not installed, we are not allowed to collect Voice Profile in sysdiagnose", buf, 0xCu);
    }
    if (a3)
    {
      v22 = (void *)MEMORY[0x263F087E8];
      uint64_t v23 = 1302;
      goto LABEL_29;
    }
    goto LABEL_30;
  }
  v5 = +[SSRVoiceProfileManager sharedInstance];
  v6 = v5;
  if (v5)
  {
    v28 = v5;
    v27 = [v5 SSRBasePathForAppDomain:@"com.apple.siri"];
    BOOL v7 = objc_msgSend(v27, "stringByReplacingOccurrencesOfString:withString:options:range:", @"/var/root/", @"/private/var/mobile/", 8, 0, objc_msgSend(v27, "length"));
    v8 = [MEMORY[0x263F08850] defaultManager];
    v9 = [v8 enumeratorAtPath:v7];

    id v29 = [MEMORY[0x263EFF980] array];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v31 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = [v7 stringByAppendingPathComponent:*(void *)(*((void *)&v30 + 1) + 8 * i)];
          if (!+[SSRSysdiagnoseFileHandler _isDirectory:v15])
          {
            v16 = [v15 pathExtension];
            if (([v16 isEqualToString:@"json"] & 1) == 0)
            {
              [v29 addObject:v15];
              v17 = *MEMORY[0x263F38100];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136315394;
                v35 = "+[SSRSysdiagnoseFileHandler fetchVoiceProfileFilePathsWithError:]";
                __int16 v36 = 2112;
                uint64_t v37 = (uint64_t)v15;
                _os_log_debug_impl(&dword_21C8A5000, v17, OS_LOG_TYPE_DEBUG, "%s added %@ into list", buf, 0x16u);
              }
            }
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v30 objects:v38 count:16];
      }
      while (v12);
    }

    v18 = (void *)*MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      v19 = v18;
      uint64_t v20 = [v29 count];
      *(_DWORD *)buf = 136315394;
      v35 = "+[SSRSysdiagnoseFileHandler fetchVoiceProfileFilePathsWithError:]";
      __int16 v36 = 2050;
      uint64_t v37 = v20;
      _os_log_impl(&dword_21C8A5000, v19, OS_LOG_TYPE_DEFAULT, "%s Send %{public}lu files under Voice Profile directory to sysdiagnose", buf, 0x16u);
    }
    v6 = v28;
  }
  else if (a3)
  {
    v25 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v35 = "+[SSRSysdiagnoseFileHandler fetchVoiceProfileFilePathsWithError:]";
      _os_log_impl(&dword_21C8A5000, v25, OS_LOG_TYPE_DEFAULT, "%s No Voice Profile available in device", buf, 0xCu);
    }
    [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.speakerrecognition" code:1301 userInfo:0];
    id v29 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v29 = 0;
  }

LABEL_37:

  return v29;
}

@end