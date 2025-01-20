@interface SVXSpeechSynthesisUtils
- (BOOL)requestHasSpeakableContents:(id)a3;
- (SVXSpeechSynthesisUtils)init;
- (SVXSpeechSynthesisUtils)initWithLocaleFactory:(id)a3 sessionUtils:(id)a4;
- (id)createAudioFromUIAudioData:(id)a3;
- (id)createLocaleFromLanguageCode:(id)a3;
- (id)createPhaticPrompt;
- (id)getLocaleWithAllowsFallback:(BOOL)a3 preferences:(id)a4;
- (id)getOutputVoiceInfoWithAllowsFallback:(BOOL)a3 preferences:(id)a4;
- (int64_t)getGenderFromVoiceGender:(int64_t)a3;
@end

@implementation SVXSpeechSynthesisUtils

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionUtils, 0);

  objc_storeStrong((id *)&self->_localeFactory, 0);
}

- (id)createPhaticPrompt
{
  v2 = [[SVXSpeechSynthesisRequest alloc] initWithPriority:2 options:0 speakableText:@"\x1B\\mrk=play=phat\\"" speakableContext:0 localizationKey:0 presynthesizedAudio:0 streamID:0];

  return v2;
}

- (BOOL)requestHasSpeakableContents:(id)a3
{
  id v3 = a3;
  v4 = [v3 speakableText];
  uint64_t v5 = [v4 length];

  if (v5
    || ([v3 presynthesizedAudio],
        v6 = objc_claimAutoreleasedReturnValue(),
        [v6 data],
        v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 length],
        v7,
        v6,
        v8))
  {
    BOOL v9 = 1;
  }
  else
  {
    v11 = [v3 localizationKey];
    BOOL v9 = [v11 length] != 0;
  }
  return v9;
}

- (id)createAudioFromUIAudioData:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    v4 = [SVXSpeechSynthesisAudio alloc];
    uint64_t v5 = [v3 audioBuffer];
    v6 = [v3 decoderStreamDescription];
    v7 = SVXAudioStreamBasicDescriptionCreateFromUIAudioDescription(v6);
    uint64_t v8 = [v3 playerStreamDescription];

    BOOL v9 = SVXAudioStreamBasicDescriptionCreateFromUIAudioDescription(v8);
    v10 = [(SVXSpeechSynthesisAudio *)v4 initWithData:v5 decoderASBD:v7 playerASBD:v9];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)getOutputVoiceInfoWithAllowsFallback:(BOOL)a3 preferences:(id)a4
{
  BOOL v4 = a3;
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (!v6)
  {
    v21 = [MEMORY[0x263F08690] currentHandler];
    v22 = [NSString stringWithUTF8String:"-[SVXSpeechSynthesisUtils getOutputVoiceInfoWithAllowsFallback:preferences:]"];
    [v21 handleFailureInFunction:v22, @"SVXSpeechSynthesisUtils.m", 109, @"Invalid parameter not satisfying: %@", @"preferences != nil" file lineNumber description];
  }
  v7 = [v6 outputVoice];
  uint64_t v8 = [v7 languageCode];
  uint64_t v9 = [v8 length];

  if (!v9)
  {
    v10 = (os_log_t *)MEMORY[0x263F28348];
    v11 = *MEMORY[0x263F28348];
    BOOL v12 = os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR);
    if (v7)
    {
      if (v12)
      {
        *(_DWORD *)buf = 136315138;
        v24 = "-[SVXSpeechSynthesisUtils getOutputVoiceInfoWithAllowsFallback:preferences:]";
        v13 = "%s Output voice info does not have language code.";
        goto LABEL_17;
      }
    }
    else if (v12)
    {
      *(_DWORD *)buf = 136315138;
      v24 = "-[SVXSpeechSynthesisUtils getOutputVoiceInfoWithAllowsFallback:preferences:]";
      v13 = "%s Output voice info is nil.";
LABEL_17:
      _os_log_error_impl(&dword_220062000, v11, OS_LOG_TYPE_ERROR, v13, buf, 0xCu);
      if (!v4) {
        goto LABEL_18;
      }
      goto LABEL_9;
    }
    if (!v4)
    {
LABEL_18:
      uint64_t v18 = 0;
      v14 = v7;
LABEL_19:

      v7 = (void *)v18;
      goto LABEL_20;
    }
LABEL_9:
    v14 = [(SVXSessionUtils *)self->_sessionUtils getLanguageCodeWithAllowsFallback:1 preferences:v6];
    v15 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[SVXSpeechSynthesisUtils getOutputVoiceInfoWithAllowsFallback:preferences:]";
      __int16 v25 = 2112;
      uint64_t v26 = (uint64_t)v14;
      _os_log_impl(&dword_220062000, v15, OS_LOG_TYPE_INFO, "%s Siri language code is %@.", buf, 0x16u);
    }
    v16 = AFOutputVoiceLanguageForRecognitionLanguage();
    v17 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[SVXSpeechSynthesisUtils getOutputVoiceInfoWithAllowsFallback:preferences:]";
      __int16 v25 = 2112;
      uint64_t v26 = (uint64_t)v16;
      _os_log_impl(&dword_220062000, v17, OS_LOG_TYPE_INFO, "%s Output voice language code is %@.", buf, 0x16u);
    }
    uint64_t v18 = objc_msgSend(objc_alloc(MEMORY[0x263F286E0]), "initWithLanguageCode:gender:isCustom:name:footprint:contentVersion:masteredVersion:", v16, objc_msgSend(v7, "gender"), 1, 0, 0, 0, 0);

    v19 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[SVXSpeechSynthesisUtils getOutputVoiceInfoWithAllowsFallback:preferences:]";
      __int16 v25 = 2112;
      uint64_t v26 = v18;
      _os_log_impl(&dword_220062000, v19, OS_LOG_TYPE_INFO, "%s Resolved output voice info is %@.", buf, 0x16u);
    }

    goto LABEL_19;
  }
LABEL_20:

  return v7;
}

- (id)getLocaleWithAllowsFallback:(BOOL)a3 preferences:(id)a4
{
  BOOL v4 = a3;
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (!v6)
  {
    v16 = [MEMORY[0x263F08690] currentHandler];
    v17 = [NSString stringWithUTF8String:"-[SVXSpeechSynthesisUtils getLocaleWithAllowsFallback:preferences:]"];
    [v16 handleFailureInFunction:v17, @"SVXSpeechSynthesisUtils.m", 95, @"Invalid parameter not satisfying: %@", @"preferences != nil" file lineNumber description];
  }
  v7 = [(SVXSessionUtils *)self->_sessionUtils getLanguageCodeWithAllowsFallback:v4 preferences:v6];
  uint64_t v8 = [(SVXSpeechSynthesisUtils *)self createLocaleFromLanguageCode:v7];
  if (!v8)
  {
    uint64_t v9 = (os_log_t *)MEMORY[0x263F28348];
    v10 = (void *)*MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
    {
      BOOL v12 = v10;
      uint64_t v13 = [(__CFString *)v7 length];
      v14 = @"nil";
      if (v13) {
        v14 = v7;
      }
      *(_DWORD *)buf = 136315394;
      v19 = "-[SVXSpeechSynthesisUtils getLocaleWithAllowsFallback:preferences:]";
      __int16 v20 = 2112;
      v21 = v14;
      _os_log_error_impl(&dword_220062000, v12, OS_LOG_TYPE_ERROR, "%s Locale is nil. (Siri language code is %@)", buf, 0x16u);

      if (v4) {
        goto LABEL_6;
      }
    }
    else if (v4)
    {
LABEL_6:
      uint64_t v8 = [MEMORY[0x263EFF960] currentLocale];
      v11 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v19 = "-[SVXSpeechSynthesisUtils getLocaleWithAllowsFallback:preferences:]";
        __int16 v20 = 2112;
        v21 = v8;
        _os_log_impl(&dword_220062000, v11, OS_LOG_TYPE_INFO, "%s Resolved locale is %@.", buf, 0x16u);
      }
      goto LABEL_12;
    }
    uint64_t v8 = 0;
  }
LABEL_12:

  return v8;
}

- (id)createLocaleFromLanguageCode:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 length])
  {
    uint64_t v5 = [(SVXNSLocaleFactory *)self->_localeFactory canonicalLocaleIdentifierFromString:v4];
    if (v5)
    {
      localeFactory = self->_localeFactory;
      id v7 = v5;
    }
    else
    {
      v10 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
      {
        int v12 = 136315394;
        uint64_t v13 = "-[SVXSpeechSynthesisUtils createLocaleFromLanguageCode:]";
        __int16 v14 = 2112;
        id v15 = v4;
        _os_log_error_impl(&dword_220062000, v10, OS_LOG_TYPE_ERROR, "%s Canonical locale identifier is nil, fallback to use language code %@ directly.", (uint8_t *)&v12, 0x16u);
      }
      localeFactory = self->_localeFactory;
      id v7 = v4;
    }
    uint64_t v9 = [(SVXNSLocaleFactory *)localeFactory localeWithLocaleIdentifier:v7];
  }
  else
  {
    uint64_t v8 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315138;
      uint64_t v13 = "-[SVXSpeechSynthesisUtils createLocaleFromLanguageCode:]";
      _os_log_error_impl(&dword_220062000, v8, OS_LOG_TYPE_ERROR, "%s No language code.", (uint8_t *)&v12, 0xCu);
    }
    uint64_t v9 = 0;
  }

  return v9;
}

- (int64_t)getGenderFromVoiceGender:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3) {
    return 0;
  }
  else {
    return a3;
  }
}

- (SVXSpeechSynthesisUtils)initWithLocaleFactory:(id)a3 sessionUtils:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SVXSpeechSynthesisUtils;
  uint64_t v9 = [(SVXSpeechSynthesisUtils *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_localeFactory, a3);
    objc_storeStrong((id *)&v10->_sessionUtils, a4);
  }

  return v10;
}

- (SVXSpeechSynthesisUtils)init
{
  id v3 = objc_alloc_init(SVXNSLocaleFactory);
  id v4 = objc_alloc_init(SVXSessionUtils);
  uint64_t v5 = [(SVXSpeechSynthesisUtils *)self initWithLocaleFactory:v3 sessionUtils:v4];

  return v5;
}

@end