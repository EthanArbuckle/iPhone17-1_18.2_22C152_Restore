@interface VTUIAudioHintPlayer
- (AFVoiceInfo)outputVoice;
- (BOOL)_hasValidHints;
- (BOOL)_systemLanguageMatchesSiriLanguage:(id)a3 siriLanguage:(id)a4;
- (BOOL)shouldSpeakAudioHint;
- (BOOL)useCompactHints;
- (NSArray)trainingPageAudioHintFiles;
- (NSArray)trainingPageAudioHintInstructions;
- (NSArray)trainingPageAudioHintPreviews;
- (NSString)language;
- (VTUIAudioHintPlayer)initWithLanguage:(id)a3;
- (VTUIAudioHintPlayer)initWithLanguage:(id)a3 isCompact:(BOOL)a4;
- (VTUISpeechSynthesizer)synth;
- (id)_audioHintPathForFileName:(id)a3;
- (id)_getTrainingPageAudioHintRequests;
- (void)_setupHints;
- (void)_timerFired;
- (void)cleanup;
- (void)setLanguage:(id)a3;
- (void)setOutputVoice:(id)a3;
- (void)setShouldSpeakAudioHint:(BOOL)a3;
- (void)setSynth:(id)a3;
- (void)setTrainingPageAudioHintFiles:(id)a3;
- (void)setTrainingPageAudioHintInstructions:(id)a3;
- (void)setTrainingPageAudioHintPreviews:(id)a3;
- (void)setUseCompactHints:(BOOL)a3;
- (void)speakAudioHint:(unint64_t)a3 completion:(id)a4;
- (void)speakConfirmationDialog:(id)a3;
- (void)updateIfNeededForUsesMultipleTriggers:(BOOL)a3;
@end

@implementation VTUIAudioHintPlayer

- (VTUIAudioHintPlayer)initWithLanguage:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VTUIAudioHintPlayer;
  v5 = [(VTUIAudioHintPlayer *)&v10 init];
  if (v5)
  {
    v5->isExclaveCapable = MGGetBoolAnswer();
    [(VTUIAudioHintPlayer *)v5 setLanguage:v4];
    v6 = objc_alloc_init(VTUISpeechSynthesizer);
    synth = v5->_synth;
    v5->_synth = v6;

    v8 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v12 = "-[VTUIAudioHintPlayer initWithLanguage:]";
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl(&dword_238878000, v8, OS_LOG_TYPE_DEFAULT, "%s Audio Hint language: %@", buf, 0x16u);
    }
  }

  return v5;
}

- (VTUIAudioHintPlayer)initWithLanguage:(id)a3 isCompact:(BOOL)a4
{
  self->_useCompactHints = a4;
  return [(VTUIAudioHintPlayer *)self initWithLanguage:a3];
}

- (void)setLanguage:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_storeStrong((id *)&self->_language, a3);
  v6 = [MEMORY[0x263F285A0] sharedPreferences];
  v7 = [v6 outputVoice];
  outputVoice = self->_outputVoice;
  self->_outputVoice = v7;

  if (!self->_outputVoice)
  {
    v9 = [MEMORY[0x263F286E0] voiceInfoForLanguageCode:self->_language];
    objc_super v10 = self->_outputVoice;
    self->_outputVoice = v9;
  }
  [(VTUIAudioHintPlayer *)self _setupHints];
  v11 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315394;
    uint64_t v15 = "-[VTUIAudioHintPlayer setLanguage:]";
    __int16 v16 = 2112;
    id v17 = v5;
    _os_log_impl(&dword_238878000, v11, OS_LOG_TYPE_DEFAULT, "%s Audio Hint language: %@", (uint8_t *)&v14, 0x16u);
  }
  if ([(VTUIAudioHintPlayer *)self _hasValidHints])
  {
    v12 = [MEMORY[0x263EFF960] _deviceLanguage];
    if ([(VTUIAudioHintPlayer *)self _systemLanguageMatchesSiriLanguage:v12 siriLanguage:self->_language])
    {
      BOOL v13 = !self->isExclaveCapable;
    }
    else
    {
      BOOL v13 = 0;
    }
    self->_shouldSpeakAudioHint = v13;
  }
  else
  {
    self->_shouldSpeakAudioHint = 0;
  }
}

- (void)updateIfNeededForUsesMultipleTriggers:(BOOL)a3
{
  if (self->_useCompactHints != a3)
  {
    self->_useCompactHints = a3;
    [(VTUIAudioHintPlayer *)self _setupHints];
    if ([(VTUIAudioHintPlayer *)self _hasValidHints])
    {
      id v5 = [MEMORY[0x263EFF960] _deviceLanguage];
      if (-[VTUIAudioHintPlayer _systemLanguageMatchesSiriLanguage:siriLanguage:](self, "_systemLanguageMatchesSiriLanguage:siriLanguage:"))
      {
        BOOL v4 = !self->isExclaveCapable;
      }
      else
      {
        BOOL v4 = 0;
      }
      self->_shouldSpeakAudioHint = v4;
    }
    else
    {
      self->_shouldSpeakAudioHint = 0;
    }
  }
}

- (void)setOutputVoice:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_storeStrong((id *)&self->_outputVoice, a3);
  [(VTUIAudioHintPlayer *)self _setupHints];
  v6 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    objc_super v10 = "-[VTUIAudioHintPlayer setOutputVoice:]";
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl(&dword_238878000, v6, OS_LOG_TYPE_DEFAULT, "%s Audio Hint output voice: %@", (uint8_t *)&v9, 0x16u);
  }
  if ([(VTUIAudioHintPlayer *)self _hasValidHints])
  {
    v7 = [MEMORY[0x263EFF960] _deviceLanguage];
    if ([(VTUIAudioHintPlayer *)self _systemLanguageMatchesSiriLanguage:v7 siriLanguage:self->_language])
    {
      BOOL v8 = !self->isExclaveCapable;
    }
    else
    {
      BOOL v8 = 0;
    }
    self->_shouldSpeakAudioHint = v8;
  }
  else
  {
    self->_shouldSpeakAudioHint = 0;
  }
}

- (BOOL)_hasValidHints
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if ([(NSArray *)self->_trainingPageAudioHintPreviews count] > 4) {
    return 1;
  }
  if ([(NSArray *)self->_trainingPageAudioHintInstructions count] >= 5)
  {
    v3 = [(NSArray *)self->_trainingPageAudioHintInstructions objectAtIndexedSubscript:0];
    int v4 = [v3 isEqualToString:&stru_26EB8DDE0];

    if (!v4) {
      return 1;
    }
  }
  id v5 = *MEMORY[0x263F28348];
  BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT);
  BOOL result = 0;
  if (v6)
  {
    language = self->_language;
    int v9 = 136315394;
    objc_super v10 = "-[VTUIAudioHintPlayer _hasValidHints]";
    __int16 v11 = 2112;
    id v12 = language;
    _os_log_impl(&dword_238878000, v5, OS_LOG_TYPE_DEFAULT, "%s No valid audio hints for language %@", (uint8_t *)&v9, 0x16u);
    return 0;
  }
  return result;
}

- (BOOL)_systemLanguageMatchesSiriLanguage:(id)a3 siriLanguage:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a4;
  BOOL v6 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:a3];
  v7 = [v6 languageCode];
  BOOL v8 = [v6 countryCode];
  int v9 = (void *)[[NSString alloc] initWithFormat:@"%@-%@", v7, v8];
  objc_super v10 = [v6 scriptCode];
  __int16 v11 = (NSObject **)MEMORY[0x263F28348];
  id v12 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    v20 = "-[VTUIAudioHintPlayer _systemLanguageMatchesSiriLanguage:siriLanguage:]";
    __int16 v21 = 2112;
    v22 = v7;
    __int16 v23 = 2112;
    v24 = v10;
    __int16 v25 = 2112;
    v26 = v8;
    __int16 v27 = 2112;
    id v28 = v5;
    _os_log_impl(&dword_238878000, v12, OS_LOG_TYPE_DEFAULT, "%s System locale (language-scriptCode-countryCode): %@-%@-%@, Siri language: %@", buf, 0x34u);
  }
  if ([v5 isEqualToString:v9]) {
    goto LABEL_4;
  }
  if ([v7 isEqualToString:@"zh"]
    && [v10 isEqualToString:@"Hans"])
  {
    if ([v5 isEqualToString:@"zh-CN"])
    {
LABEL_4:
      char v13 = 1;
      goto LABEL_21;
    }
    int v14 = @"yue-CN";
LABEL_16:
    char v13 = [v5 isEqualToString:v14];
    goto LABEL_21;
  }
  if ([v7 isEqualToString:@"zh"]
    && (([v8 isEqualToString:@"MO"] & 1) != 0
     || [v8 isEqualToString:@"HK"]))
  {
    int v14 = @"zh-HK";
    goto LABEL_16;
  }
  if ([v7 isEqualToString:@"zh"]
    && [v10 isEqualToString:@"Hant"])
  {
    int v14 = @"zh-TW";
    goto LABEL_16;
  }
  if (v10)
  {
    uint64_t v15 = *v11;
    char v13 = 0;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "-[VTUIAudioHintPlayer _systemLanguageMatchesSiriLanguage:siriLanguage:]";
      _os_log_impl(&dword_238878000, v15, OS_LOG_TYPE_DEFAULT, "%s Not playing Audio Hint due to Siri language and system language mismatch", buf, 0xCu);
      char v13 = 0;
    }
  }
  else
  {
    __int16 v16 = [v5 componentsSeparatedByString:@"-"];
    id v17 = [v16 objectAtIndexedSubscript:0];

    char v13 = [v17 isEqualToString:v7];
  }
LABEL_21:

  return v13;
}

- (void)_setupHints
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v2 = +[VTUIStyle sharedStyle];
  v3 = [MEMORY[0x263EFF980] array];
  for (uint64_t i = 1; i != 6; ++i)
  {
    id v5 = objc_msgSend(NSString, "stringWithFormat:", @"AUDIO_INSTRUCTION_UTT%lu", i);
    BOOL v6 = +[VTUIStringsHelper sharedStringsHelper];
    v7 = [v2 VTUIDeviceSpecificString:v5];
    BOOL v8 = [v6 localizedAudioStringForKey:v7];

    if (v8) {
      [v3 addObject:v8];
    }
  }
  int v9 = +[VTUIStringsHelper sharedStringsHelper];
  objc_super v10 = [v9 localizedAudioStringForKey:@"AUDIO_INSTRUCTION_READY"];
  [v3 addObject:v10];

  __int16 v11 = [MEMORY[0x263EFF8C0] arrayWithArray:v3];
  trainingPageAudioHintInstructions = self->_trainingPageAudioHintInstructions;
  self->_trainingPageAudioHintInstructions = v11;

  char v13 = (os_log_t *)MEMORY[0x263F28348];
  int v14 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    language = self->_language;
    *(_DWORD *)buf = 136315394;
    v24 = "-[VTUIAudioHintPlayer _setupHints]";
    __int16 v25 = 2112;
    v26 = language;
    _os_log_impl(&dword_238878000, v14, OS_LOG_TYPE_DEFAULT, "%s Audio Hint language: %@", buf, 0x16u);
  }
  os_log_t v16 = *v13;
  if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
  {
    outputVoice = self->_outputVoice;
    uint64_t v18 = v16;
    v19 = [(AFVoiceInfo *)outputVoice description];
    *(_DWORD *)buf = 136315394;
    v24 = "-[VTUIAudioHintPlayer _setupHints]";
    __int16 v25 = 2112;
    v26 = v19;
    _os_log_impl(&dword_238878000, v18, OS_LOG_TYPE_DEFAULT, "%s Audio Hint outputVoice: %@", buf, 0x16u);
  }
  v20 = [(VTUIAudioHintPlayer *)self _getTrainingPageAudioHintRequests];
  trainingPageAudioHintPreviews = self->_trainingPageAudioHintPreviews;
  self->_trainingPageAudioHintPreviews = v20;
}

- (id)_getTrainingPageAudioHintRequests
{
  v3 = [MEMORY[0x263EFF980] array];
  for (uint64_t i = 1; i != 7; ++i)
  {
    id v5 = objc_alloc(MEMORY[0x263F74E98]);
    language = self->_language;
    v7 = [(AFVoiceInfo *)self->_outputVoice name];
    BOOL v8 = (void *)[v5 initWithLanguage:language name:v7];

    id v9 = objc_alloc(MEMORY[0x263F74E08]);
    objc_super v10 = objc_msgSend(NSNumber, "numberWithBool:", -[VTUIAudioHintPlayer useCompactHints](self, "useCompactHints"));
    __int16 v11 = (void *)[v9 initWithVoice:v8 dialogNumber:i useCompactHints:v10];

    if ([v11 isValid]) {
      [v3 addObject:v11];
    }
  }
  id v12 = [MEMORY[0x263EFF8C0] arrayWithArray:v3];

  return v12;
}

- (id)_audioHintPathForFileName:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (os_log_t *)MEMORY[0x263F28348];
  BOOL v6 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    BOOL v8 = NSStringFromSelector(a2);
    int v13 = 136315650;
    int v14 = "-[VTUIAudioHintPlayer _audioHintPathForFileName:]";
    __int16 v15 = 2112;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v4;
    _os_log_impl(&dword_238878000, v7, OS_LOG_TYPE_DEFAULT, "%s %@: Finding path for filename: %@", (uint8_t *)&v13, 0x20u);
  }
  id v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  objc_super v10 = [v9 pathForResource:v4 ofType:@"opx"];
  if (!v10)
  {
    __int16 v11 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315394;
      int v14 = "-[VTUIAudioHintPlayer _audioHintPathForFileName:]";
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl(&dword_238878000, v11, OS_LOG_TYPE_DEFAULT, "%s No audio hint file %@", (uint8_t *)&v13, 0x16u);
    }
  }

  return v10;
}

- (void)cleanup
{
  [(VTUISpeechSynthesizer *)self->_synth stopSpeaking];
  [(NSTimer *)self->_timer invalidate];
  timer = self->_timer;
  self->_timer = 0;
}

- (void)speakConfirmationDialog:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, id))a3;
  [(NSTimer *)self->_timer invalidate];
  id v5 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel__timerFired selector:0 userInfo:0 repeats:3.0];
  timer = self->_timer;
  self->_timer = v5;

  [MEMORY[0x263F85AF8] requestPhraseSpotterBypassing:1 timeout:3.0];
  v7 = (os_log_t *)MEMORY[0x263F28398];
  BOOL v8 = *MEMORY[0x263F28398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28398], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v25 = "-[VTUIAudioHintPlayer speakConfirmationDialog:]";
    __int16 v26 = 2048;
    uint64_t v27 = 0x4008000000000000;
    _os_log_impl(&dword_238878000, v8, OS_LOG_TYPE_DEFAULT, "%s requestPhraseSpotterBypassing for %f seconds", buf, 0x16u);
  }
  if (self->_shouldSpeakAudioHint)
  {
    if ([(NSArray *)self->_trainingPageAudioHintPreviews count] == 5)
    {
      id v9 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        __int16 v25 = "-[VTUIAudioHintPlayer speakConfirmationDialog:]";
        _os_log_impl(&dword_238878000, v9, OS_LOG_TYPE_DEFAULT, "%s Locale only has training dialogs without a confirmation dialog", buf, 0xCu);
      }
      id v10 = objc_alloc(MEMORY[0x263F087E8]);
      id v11 = (id)[v10 initWithDomain:*MEMORY[0x263F28730] code:0 userInfo:0];
      v4[2](v4, v11);
    }
    else
    {
      if ([(NSArray *)self->_trainingPageAudioHintPreviews count] == 6)
      {
        id v12 = [(NSArray *)self->_trainingPageAudioHintPreviews lastObject];
        objc_msgSend(v12, "setUseCompactHints:", -[VTUIAudioHintPlayer useCompactHints](self, "useCompactHints"));
        synth = self->_synth;
        v21[0] = MEMORY[0x263EF8330];
        v21[1] = 3221225472;
        v21[2] = __47__VTUIAudioHintPlayer_speakConfirmationDialog___block_invoke;
        v21[3] = &unk_264D4C9A0;
        v22 = v12;
        __int16 v23 = v4;
        id v11 = v12;
        [(VTUISpeechSynthesizer *)synth speak:v11 completion:v21];

        int v14 = v22;
      }
      else
      {
        __int16 v15 = [(NSArray *)self->_trainingPageAudioHintInstructions lastObject];
        id v16 = self->_synth;
        language = self->_language;
        v18[0] = MEMORY[0x263EF8330];
        v18[1] = 3221225472;
        v18[2] = __47__VTUIAudioHintPlayer_speakConfirmationDialog___block_invoke_67;
        v18[3] = &unk_264D4C9A0;
        uint64_t v19 = v15;
        v20 = v4;
        id v11 = v15;
        [(VTUISpeechSynthesizer *)v16 speak:v11 language:language completion:v18];

        int v14 = v19;
      }
    }
  }
}

void __47__VTUIAudioHintPlayer_speakConfirmationDialog___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *MEMORY[0x263F28398];
  BOOL v5 = os_log_type_enabled((os_log_t)*MEMORY[0x263F28398], OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v10 = 136315394;
      id v11 = "-[VTUIAudioHintPlayer speakConfirmationDialog:]_block_invoke";
      __int16 v12 = 2112;
      id v13 = v3;
      BOOL v8 = "%s Error speaking confirmation dialog %@";
LABEL_6:
      _os_log_impl(&dword_238878000, v4, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v10, 0x16u);
    }
  }
  else if (v5)
  {
    id v9 = *(void **)(a1 + 32);
    int v10 = 136315394;
    id v11 = "-[VTUIAudioHintPlayer speakConfirmationDialog:]_block_invoke";
    __int16 v12 = 2112;
    id v13 = v9;
    BOOL v8 = "%s Finished speaking confirmation dialog audioHintRequest %@";
    goto LABEL_6;
  }
  (*(void (**)(void, id, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v3, v6, v7);
}

void __47__VTUIAudioHintPlayer_speakConfirmationDialog___block_invoke_67(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *MEMORY[0x263F28398];
  BOOL v5 = os_log_type_enabled((os_log_t)*MEMORY[0x263F28398], OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v10 = 136315394;
      id v11 = "-[VTUIAudioHintPlayer speakConfirmationDialog:]_block_invoke";
      __int16 v12 = 2112;
      id v13 = v3;
      BOOL v8 = "%s Error speaking confirmation dialog %@";
LABEL_6:
      _os_log_impl(&dword_238878000, v4, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v10, 0x16u);
    }
  }
  else if (v5)
  {
    id v9 = *(void **)(a1 + 32);
    int v10 = 136315394;
    id v11 = "-[VTUIAudioHintPlayer speakConfirmationDialog:]_block_invoke";
    __int16 v12 = 2112;
    id v13 = v9;
    BOOL v8 = "%s Finished speaking confirmation dialog %@";
    goto LABEL_6;
  }
  (*(void (**)(void, id, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v3, v6, v7);
}

- (void)_timerFired
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  BOOL v3 = [(VTUISpeechSynthesizer *)self->_synth isSpeaking];
  id v4 = *MEMORY[0x263F28398];
  BOOL v5 = os_log_type_enabled((os_log_t)*MEMORY[0x263F28398], OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v10 = 136315394;
      id v11 = "-[VTUIAudioHintPlayer _timerFired]";
      __int16 v12 = 2048;
      uint64_t v13 = 0x4000000000000000;
      _os_log_impl(&dword_238878000, v4, OS_LOG_TYPE_DEFAULT, "%s requestPhraseSpotterBypassing for %f more seconds because synth is still speaking", (uint8_t *)&v10, 0x16u);
    }
    uint64_t v6 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel__timerFired selector:0 userInfo:0 repeats:2.0];
    timer = self->_timer;
    self->_timer = v6;

    BOOL v8 = (void *)MEMORY[0x263F85AF8];
    [(NSTimer *)self->_timer timeInterval];
    objc_msgSend(v8, "requestPhraseSpotterBypassing:timeout:", 1);
  }
  else
  {
    if (v5)
    {
      int v10 = 136315138;
      id v11 = "-[VTUIAudioHintPlayer _timerFired]";
      _os_log_impl(&dword_238878000, v4, OS_LOG_TYPE_DEFAULT, "%s Reenabling phrase spotter", (uint8_t *)&v10, 0xCu);
    }
    [(NSTimer *)self->_timer invalidate];
    id v9 = self->_timer;
    self->_timer = 0;
  }
}

- (void)speakAudioHint:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  if (self->_shouldSpeakAudioHint)
  {
    trainingPageAudioHintPreviews = self->_trainingPageAudioHintPreviews;
    if (trainingPageAudioHintPreviews && [(NSArray *)trainingPageAudioHintPreviews count] - 1 >= a3)
    {
      if ([(NSArray *)self->_trainingPageAudioHintPreviews count] <= a3)
      {
        int v10 = 0;
      }
      else
      {
        int v10 = [(NSArray *)self->_trainingPageAudioHintPreviews objectAtIndexedSubscript:a3];
        objc_msgSend(v10, "setUseCompactHints:", -[VTUIAudioHintPlayer useCompactHints](self, "useCompactHints"));
      }
      synth = self->_synth;
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __49__VTUIAudioHintPlayer_speakAudioHint_completion___block_invoke;
      v20[3] = &unk_264D4C9A0;
      __int16 v12 = &v21;
      __int16 v21 = v10;
      uint64_t v13 = &v22;
      id v22 = v6;
      id v14 = v10;
      [(VTUISpeechSynthesizer *)synth speak:v14 completion:v20];
      goto LABEL_14;
    }
    trainingPageAudioHintInstructions = self->_trainingPageAudioHintInstructions;
    if (trainingPageAudioHintInstructions && [(NSArray *)trainingPageAudioHintInstructions count] - 1 > a3)
    {
      if ([(NSArray *)self->_trainingPageAudioHintInstructions count] <= a3)
      {
        id v9 = 0;
      }
      else
      {
        id v9 = [(NSArray *)self->_trainingPageAudioHintInstructions objectAtIndexedSubscript:a3];
      }
      __int16 v15 = self->_synth;
      language = self->_language;
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __49__VTUIAudioHintPlayer_speakAudioHint_completion___block_invoke_68;
      v17[3] = &unk_264D4C9A0;
      __int16 v12 = &v18;
      id v18 = v9;
      uint64_t v13 = &v19;
      id v19 = v6;
      id v14 = v9;
      [(VTUISpeechSynthesizer *)v15 speak:v14 language:language completion:v17];
LABEL_14:
    }
  }
}

void __49__VTUIAudioHintPlayer_speakAudioHint_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *MEMORY[0x263F28398];
  BOOL v5 = os_log_type_enabled((os_log_t)*MEMORY[0x263F28398], OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v10 = 136315394;
      id v11 = "-[VTUIAudioHintPlayer speakAudioHint:completion:]_block_invoke";
      __int16 v12 = 2112;
      id v13 = v3;
      BOOL v8 = "%s Error speaking audio hint %@";
LABEL_6:
      _os_log_impl(&dword_238878000, v4, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v10, 0x16u);
    }
  }
  else if (v5)
  {
    id v9 = *(void **)(a1 + 32);
    int v10 = 136315394;
    id v11 = "-[VTUIAudioHintPlayer speakAudioHint:completion:]_block_invoke";
    __int16 v12 = 2112;
    id v13 = v9;
    BOOL v8 = "%s Finished speaking audio hint request %@";
    goto LABEL_6;
  }
  (*(void (**)(void, id, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v3, v6, v7);
}

void __49__VTUIAudioHintPlayer_speakAudioHint_completion___block_invoke_68(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *MEMORY[0x263F28398];
  BOOL v5 = os_log_type_enabled((os_log_t)*MEMORY[0x263F28398], OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v10 = 136315394;
      id v11 = "-[VTUIAudioHintPlayer speakAudioHint:completion:]_block_invoke";
      __int16 v12 = 2112;
      id v13 = v3;
      BOOL v8 = "%s Error speaking audio hint %@";
LABEL_6:
      _os_log_impl(&dword_238878000, v4, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v10, 0x16u);
    }
  }
  else if (v5)
  {
    id v9 = *(void **)(a1 + 32);
    int v10 = 136315394;
    id v11 = "-[VTUIAudioHintPlayer speakAudioHint:completion:]_block_invoke";
    __int16 v12 = 2112;
    id v13 = v9;
    BOOL v8 = "%s Finished speaking audio hint with string %@";
    goto LABEL_6;
  }
  (*(void (**)(void, id, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v3, v6, v7);
}

- (NSString)language
{
  return self->_language;
}

- (AFVoiceInfo)outputVoice
{
  return self->_outputVoice;
}

- (BOOL)shouldSpeakAudioHint
{
  return self->_shouldSpeakAudioHint;
}

- (void)setShouldSpeakAudioHint:(BOOL)a3
{
  self->_shouldSpeakAudioHint = a3;
}

- (NSArray)trainingPageAudioHintInstructions
{
  return self->_trainingPageAudioHintInstructions;
}

- (void)setTrainingPageAudioHintInstructions:(id)a3
{
}

- (NSArray)trainingPageAudioHintFiles
{
  return self->_trainingPageAudioHintFiles;
}

- (void)setTrainingPageAudioHintFiles:(id)a3
{
}

- (NSArray)trainingPageAudioHintPreviews
{
  return self->_trainingPageAudioHintPreviews;
}

- (void)setTrainingPageAudioHintPreviews:(id)a3
{
}

- (VTUISpeechSynthesizer)synth
{
  return self->_synth;
}

- (void)setSynth:(id)a3
{
}

- (BOOL)useCompactHints
{
  return self->_useCompactHints;
}

- (void)setUseCompactHints:(BOOL)a3
{
  self->_useCompactHints = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synth, 0);
  objc_storeStrong((id *)&self->_trainingPageAudioHintPreviews, 0);
  objc_storeStrong((id *)&self->_trainingPageAudioHintFiles, 0);
  objc_storeStrong((id *)&self->_trainingPageAudioHintInstructions, 0);
  objc_storeStrong((id *)&self->_outputVoice, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_timer, 0);
}

@end