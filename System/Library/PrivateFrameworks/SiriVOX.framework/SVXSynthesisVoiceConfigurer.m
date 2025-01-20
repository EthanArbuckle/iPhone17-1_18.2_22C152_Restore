@interface SVXSynthesisVoiceConfigurer
- (SVXSynthesisVoiceConfigurer)initWithConfigurationManager:(id)a3 speechSynthesisUtils:(id)a4 sessionUtils:(id)a5 voiceGenderConverter:(id)a6;
- (id)_determineLanguageCodeWithContext:(id)a3 outputVoiceInfo:(id)a4 preferences:(id)a5;
- (id)_determineVoiceNameWithContext:(id)a3 languageCode:(id)a4 outputVoiceInfo:(id)a5 gender:(int64_t)a6;
- (id)voiceForContext:(id)a3 preferences:(id)a4;
- (int64_t)_determineGenderWithContext:(id)a3 outputVoiceInfo:(id)a4 languageCode:(id)a5;
@end

@implementation SVXSynthesisVoiceConfigurer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceGenderConverter, 0);
  objc_storeStrong((id *)&self->_sessionUtils, 0);
  objc_storeStrong((id *)&self->_speechSynthesisUtils, 0);

  objc_storeStrong((id *)&self->_configurationManager, 0);
}

- (id)_determineVoiceNameWithContext:(id)a3 languageCode:(id)a4 outputVoiceInfo:(id)a5 gender:(int64_t)a6
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v10 = a3;
  v11 = (__CFString *)a4;
  id v12 = a5;
  if (v10)
  {
    v13 = [v10 voiceName];
  }
  else
  {
    v13 = 0;
  }
  if ([(__CFString *)v13 length])
  {
    v14 = v13;
    goto LABEL_16;
  }
  v15 = (os_log_t *)MEMORY[0x263F28348];
  v16 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    v17 = v16;
    v18 = [v12 description];
    int v31 = 136315906;
    v32 = "-[SVXSynthesisVoiceConfigurer _determineVoiceNameWithContext:languageCode:outputVoiceInfo:gender:]";
    __int16 v33 = 2112;
    v34 = v11;
    __int16 v35 = 2048;
    int64_t v36 = a6;
    __int16 v37 = 2112;
    int64_t v38 = (int64_t)v18;
    _os_log_impl(&dword_220062000, v17, OS_LOG_TYPE_DEFAULT, "%s languageCode: %@, gender: %ld, outputVoiceInfo: %@", (uint8_t *)&v31, 0x2Au);
  }
  v19 = [v12 languageCode];
  if ([v19 isEqualToString:v11])
  {
    int64_t v20 = [(SVXVoiceGenderConverter *)self->_voiceGenderConverter getSpeechGenderFromVoiceInfo:v12];

    if (v20 == a6)
    {
      v14 = [v12 name];

      v21 = *v15;
      if (os_log_type_enabled(*v15, OS_LOG_TYPE_DEFAULT))
      {
        int v31 = 136315906;
        v32 = "-[SVXSynthesisVoiceConfigurer _determineVoiceNameWithContext:languageCode:outputVoiceInfo:gender:]";
        __int16 v33 = 2112;
        v34 = v14;
        __int16 v35 = 2112;
        int64_t v36 = (int64_t)v11;
        __int16 v37 = 2048;
        int64_t v38 = a6;
        _os_log_impl(&dword_220062000, v21, OS_LOG_TYPE_DEFAULT, "%s Using voice name %@ for %@, %ld", (uint8_t *)&v31, 0x2Au);
      }
      goto LABEL_16;
    }
  }
  else
  {
  }
  v22 = AFOutputVoiceLanguageForRecognitionLanguage();
  int64_t v23 = [(SVXVoiceGenderConverter *)self->_voiceGenderConverter getAFVoiceGenderFromTTSAssetVoiceGender:a6];
  v24 = [MEMORY[0x263F28530] sharedInstance];
  v25 = [v24 voiceNamesForOutputLanguageCode:v22 gender:v23];
  v14 = [v25 firstObject];

  v26 = *v15;
  if (os_log_type_enabled(*v15, OS_LOG_TYPE_DEFAULT))
  {
    int v31 = 136316162;
    v32 = "-[SVXSynthesisVoiceConfigurer _determineVoiceNameWithContext:languageCode:outputVoiceInfo:gender:]";
    __int16 v33 = 2112;
    v34 = v14;
    __int16 v35 = 2112;
    int64_t v36 = (int64_t)v11;
    __int16 v37 = 2112;
    int64_t v38 = (int64_t)v22;
    __int16 v39 = 2048;
    int64_t v40 = a6;
    _os_log_impl(&dword_220062000, v26, OS_LOG_TYPE_DEFAULT, "%s Using fallback voice name %@ for language code: %@ outputLanguageCode: %@, %ld", (uint8_t *)&v31, 0x34u);
  }

LABEL_16:
  if ([(__CFString *)v14 isEqualToString:@"hattori"])
  {
    v27 = *MEMORY[0x263F28348];
    v28 = @"hiro";
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      int v31 = 136315394;
      v32 = "-[SVXSynthesisVoiceConfigurer _determineVoiceNameWithContext:languageCode:outputVoiceInfo:gender:]";
      __int16 v33 = 2112;
      v34 = @"hiro";
      _os_log_impl(&dword_220062000, v27, OS_LOG_TYPE_DEFAULT, "%s Old male voice name in ja-JP was used. Updating to %@", (uint8_t *)&v31, 0x16u);
    }
  }
  else
  {
    if (![(__CFString *)v14 isEqualToString:@"oren"]) {
      goto LABEL_24;
    }
    v29 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      int v31 = 136315394;
      v32 = "-[SVXSynthesisVoiceConfigurer _determineVoiceNameWithContext:languageCode:outputVoiceInfo:gender:]";
      __int16 v33 = 2112;
      v34 = @"hiro";
      _os_log_impl(&dword_220062000, v29, OS_LOG_TYPE_DEFAULT, "%s Old female voice name in ja-JP was used. Updating to %@", (uint8_t *)&v31, 0x16u);
    }
    v28 = @"sakura";
  }

  v14 = v28;
LABEL_24:

  return v14;
}

- (int64_t)_determineGenderWithContext:(id)a3 outputVoiceInfo:(id)a4 languageCode:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8
    || (int64_t v11 = -[SVXVoiceGenderConverter getSpeechGenderFromGender:](self->_voiceGenderConverter, "getSpeechGenderFromGender:", [v8 gender])) == 0)
  {
    int64_t v11 = [(SVXVoiceGenderConverter *)self->_voiceGenderConverter getSpeechGenderFromVoiceInfo:v9];
    if (!v11)
    {
      if ([MEMORY[0x263F286E0] defaultGenderForOutputVoiceLanguageCode:v10] == 1) {
        int64_t v11 = 1;
      }
      else {
        int64_t v11 = 2;
      }
    }
  }

  return v11;
}

- (id)_determineLanguageCodeWithContext:(id)a3 outputVoiceInfo:(id)a4 preferences:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    int64_t v11 = [v8 languageCode];
  }
  else
  {
    int64_t v11 = 0;
  }
  if (![v11 length])
  {
    uint64_t v12 = [v9 languageCode];

    int64_t v11 = (void *)v12;
  }
  if (![v11 length])
  {
    uint64_t v13 = [(SVXSessionUtils *)self->_sessionUtils getLanguageCodeWithAllowsFallback:1 preferences:v10];

    int64_t v11 = (void *)v13;
  }

  return v11;
}

- (id)voiceForContext:(id)a3 preferences:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a4;
  configurationManager = self->_configurationManager;
  id v8 = a3;
  id v9 = [(SVXSpeechSynthesisConfigurationStateManager *)configurationManager currentConfiguration];
  id v10 = [v9 outputVoiceInfo];
  int64_t v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = [(SVXSpeechSynthesisUtils *)self->_speechSynthesisUtils getOutputVoiceInfoWithAllowsFallback:1 preferences:v6];
  }
  uint64_t v13 = v12;

  v14 = [(SVXSynthesisVoiceConfigurer *)self _determineLanguageCodeWithContext:v8 outputVoiceInfo:v13 preferences:v6];
  int64_t v15 = [(SVXSynthesisVoiceConfigurer *)self _determineGenderWithContext:v8 outputVoiceInfo:v13 languageCode:v14];
  v16 = [(SVXSynthesisVoiceConfigurer *)self _determineVoiceNameWithContext:v8 languageCode:v14 outputVoiceInfo:v13 gender:v15];

  v17 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 136315906;
    v21 = "-[SVXSynthesisVoiceConfigurer voiceForContext:preferences:]";
    __int16 v22 = 2112;
    int64_t v23 = v16;
    __int16 v24 = 2112;
    v25 = v14;
    __int16 v26 = 2048;
    int64_t v27 = v15;
    _os_log_impl(&dword_220062000, v17, OS_LOG_TYPE_DEFAULT, "%s Voice name %@ for %@, %ld", (uint8_t *)&v20, 0x2Au);
  }
  v18 = (void *)[objc_alloc(MEMORY[0x263F74E98]) initWithLanguage:v14 name:v16];

  return v18;
}

- (SVXSynthesisVoiceConfigurer)initWithConfigurationManager:(id)a3 speechSynthesisUtils:(id)a4 sessionUtils:(id)a5 voiceGenderConverter:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SVXSynthesisVoiceConfigurer;
  int64_t v15 = [(SVXSynthesisVoiceConfigurer *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_configurationManager, a3);
    objc_storeStrong((id *)&v16->_speechSynthesisUtils, a4);
    objc_storeStrong((id *)&v16->_sessionUtils, a5);
    objc_storeStrong((id *)&v16->_voiceGenderConverter, a6);
  }

  return v16;
}

@end