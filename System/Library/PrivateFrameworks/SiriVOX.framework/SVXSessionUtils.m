@interface SVXSessionUtils
- (id)getLanguageCodeWithAllowsFallback:(BOOL)a3 preferences:(id)a4;
@end

@implementation SVXSessionUtils

- (id)getLanguageCodeWithAllowsFallback:(BOOL)a3 preferences:(id)a4
{
  BOOL v4 = a3;
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a4;
  if (!v5)
  {
    v15 = [MEMORY[0x263F08690] currentHandler];
    v16 = [NSString stringWithUTF8String:"-[SVXSessionUtils getLanguageCodeWithAllowsFallback:preferences:]"];
    [v15 handleFailureInFunction:v16, @"SVXSessionUtils.m", 34, @"Invalid parameter not satisfying: %@", @"preferences != nil" file lineNumber description];
  }
  v6 = [v5 languageCode];
  if ([(__CFString *)v6 length])
  {
    v7 = v6;
    goto LABEL_19;
  }
  v8 = (os_log_t *)MEMORY[0x263F28348];
  v9 = *MEMORY[0x263F28348];
  if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    if (v4) {
      goto LABEL_7;
    }
LABEL_18:

    v7 = 0;
    goto LABEL_19;
  }
  *(_DWORD *)buf = 136315138;
  v18 = "-[SVXSessionUtils getLanguageCodeWithAllowsFallback:preferences:]";
  _os_log_error_impl(&dword_220062000, v9, OS_LOG_TYPE_ERROR, "%s Siri language code is nil.", buf, 0xCu);
  if (!v4) {
    goto LABEL_18;
  }
LABEL_7:
  v7 = [v5 bestSupportedLanguageCodeForLanguageCode:0];

  uint64_t v10 = [(__CFString *)v7 length];
  v11 = *v8;
  if (v10)
  {
    if (!os_log_type_enabled(*v8, OS_LOG_TYPE_INFO)) {
      goto LABEL_15;
    }
    *(_DWORD *)buf = 136315394;
    v18 = "-[SVXSessionUtils getLanguageCodeWithAllowsFallback:preferences:]";
    __int16 v19 = 2112;
    v20 = v7;
    v12 = "%s Best supported Siri language is %@.";
  }
  else
  {
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "-[SVXSessionUtils getLanguageCodeWithAllowsFallback:preferences:]";
      _os_log_error_impl(&dword_220062000, v11, OS_LOG_TYPE_ERROR, "%s Best supported Siri language is nil.", buf, 0xCu);
    }

    v11 = *v8;
    v7 = @"en-US";
    if (!os_log_type_enabled(*v8, OS_LOG_TYPE_INFO)) {
      goto LABEL_15;
    }
    *(_DWORD *)buf = 136315394;
    v18 = "-[SVXSessionUtils getLanguageCodeWithAllowsFallback:preferences:]";
    __int16 v19 = 2112;
    v20 = @"en-US";
    v12 = "%s Default Siri language is %@.";
  }
  _os_log_impl(&dword_220062000, v11, OS_LOG_TYPE_INFO, v12, buf, 0x16u);
LABEL_15:
  v13 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[SVXSessionUtils getLanguageCodeWithAllowsFallback:preferences:]";
    __int16 v19 = 2112;
    v20 = v7;
    _os_log_impl(&dword_220062000, v13, OS_LOG_TYPE_INFO, "%s Resolved Siri language code is %@.", buf, 0x16u);
  }
LABEL_19:

  return v7;
}

@end