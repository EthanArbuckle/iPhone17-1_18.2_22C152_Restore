@interface SOSVoiceUtterance
+ (id)_localizedStringForKey:(id)a3 forLocalization:(id)a4 tableName:(id)a5;
+ (id)localizedStringForKey:(id)a3 forLocalization:(id)a4;
+ (id)silentUtterance;
- (NSString)localizedMessageInVoiceLanguage;
- (NSString)messageKey;
- (NSString)precomposedLocalizedMessageString;
- (NSString)voiceLanguage;
- (SOSVoiceUtterance)initWithLocalizedMessageString:(id)a3 voiceLanguage:(id)a4;
- (SOSVoiceUtterance)initWithLocalizedMessageString:(id)a3 voiceLanguage:(id)a4 volume:(float)a5 rateMultiplier:(float)a6;
- (SOSVoiceUtterance)initWithMessageKey:(id)a3 voiceLanguage:(id)a4;
- (SOSVoiceUtterance)initWithMessageKey:(id)a3 voiceLanguage:(id)a4 volume:(float)a5 rateMultiplier:(float)a6;
- (float)rateMultiplier;
- (float)volume;
- (id)_voiceOverAttributes;
- (id)attributedSpeechString;
- (id)avSpeechUtterance;
- (id)description;
- (id)voice;
- (void)setPrecomposedLocalizedMessageString:(id)a3;
- (void)setRateMultiplier:(float)a3;
- (void)setVolume:(float)a3;
@end

@implementation SOSVoiceUtterance

- (SOSVoiceUtterance)initWithMessageKey:(id)a3 voiceLanguage:(id)a4 volume:(float)a5 rateMultiplier:(float)a6
{
  id v11 = a3;
  id v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SOSVoiceUtterance;
  v13 = [(SOSVoiceUtterance *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_messageKey, a3);
    objc_storeStrong((id *)&v14->_voiceLanguage, a4);
    v14->_volume = a5;
    v14->_rateMultiplier = a6;
  }

  return v14;
}

- (SOSVoiceUtterance)initWithMessageKey:(id)a3 voiceLanguage:(id)a4
{
  LODWORD(v4) = 1.0;
  LODWORD(v5) = 1.0;
  return [(SOSVoiceUtterance *)self initWithMessageKey:a3 voiceLanguage:a4 volume:v4 rateMultiplier:v5];
}

- (SOSVoiceUtterance)initWithLocalizedMessageString:(id)a3 voiceLanguage:(id)a4 volume:(float)a5 rateMultiplier:(float)a6
{
  id v11 = a3;
  *(float *)&double v12 = a5;
  *(float *)&double v13 = a6;
  v14 = [(SOSVoiceUtterance *)self initWithMessageKey:&stru_1F0C40F10 voiceLanguage:a4 volume:v12 rateMultiplier:v13];
  v15 = v14;
  if (v14) {
    objc_storeStrong((id *)&v14->_precomposedLocalizedMessageString, a3);
  }

  return v15;
}

- (SOSVoiceUtterance)initWithLocalizedMessageString:(id)a3 voiceLanguage:(id)a4
{
  LODWORD(v4) = 1.0;
  LODWORD(v5) = 1.0;
  return [(SOSVoiceUtterance *)self initWithLocalizedMessageString:a3 voiceLanguage:a4 volume:v4 rateMultiplier:v5];
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  double v5 = [(SOSVoiceUtterance *)self messageKey];
  v6 = [(SOSVoiceUtterance *)self voiceLanguage];
  [(SOSVoiceUtterance *)self volume];
  double v8 = v7;
  [(SOSVoiceUtterance *)self rateMultiplier];
  double v10 = v9;
  id v11 = [(SOSVoiceUtterance *)self precomposedLocalizedMessageString];
  double v12 = [v3 stringWithFormat:@"<%@ %p messageKey=%@ voiceLanguage=%@ volume=%0.3f rateMultiplier=%0.3f precomposedLMS=\"%@\">", v4, self, v5, v6, *(void *)&v8, *(void *)&v10, v11];

  return v12;
}

+ (id)silentUtterance
{
  v2 = (void *)[objc_alloc((Class)objc_opt_class()) initWithLocalizedMessageString:&stru_1F0C40F10 voiceLanguage:&stru_1F0C40F10];

  return v2;
}

- (NSString)localizedMessageInVoiceLanguage
{
  v3 = [(SOSVoiceUtterance *)self precomposedLocalizedMessageString];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = [(SOSVoiceUtterance *)self messageKey];
    if (v6)
    {
      float v7 = objc_opt_class();
      double v8 = [(SOSVoiceUtterance *)self voiceLanguage];
      id v5 = [v7 localizedStringForKey:v6 forLocalization:v8];
    }
    else
    {
      id v5 = 0;
    }
  }

  return (NSString *)v5;
}

+ (id)localizedStringForKey:(id)a3 forLocalization:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if ([v7 containsString:@"KAPPA"]) {
    double v8 = @"Localizable-kappa";
  }
  else {
    double v8 = 0;
  }
  float v9 = [a1 _localizedStringForKey:v7 forLocalization:v6 tableName:v8];

  return v9;
}

+ (id)_localizedStringForKey:(id)a3 forLocalization:(id)a4 tableName:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  double v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  [v10 _cfBundle];
  id v11 = (void *)CFBundleCopyLocalizedStringForLocalization();

  double v12 = sos_voice_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v14 = 138544130;
    id v15 = v7;
    __int16 v16 = 2114;
    v17 = v11;
    __int16 v18 = 2114;
    id v19 = v8;
    __int16 v20 = 2114;
    id v21 = v9;
    _os_log_impl(&dword_1B3A94000, v12, OS_LOG_TYPE_INFO, "stringToLocalize: %{public}@ localizedString: %{public}@ localization: %{public}@ table: %{public}@", (uint8_t *)&v14, 0x2Au);
  }

  return v11;
}

- (id)attributedSpeechString
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F28B18]);
  uint64_t v4 = [(SOSVoiceUtterance *)self localizedMessageInVoiceLanguage];
  id v5 = [(SOSVoiceUtterance *)self _voiceOverAttributes];
  id v6 = (void *)[v3 initWithString:v4 attributes:v5];

  id v7 = sos_voice_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412546;
    double v10 = v6;
    __int16 v11 = 2112;
    double v12 = self;
    _os_log_impl(&dword_1B3A94000, v7, OS_LOG_TYPE_INFO, "attributedSpeechString: %@, from %@", (uint8_t *)&v9, 0x16u);
  }

  return v6;
}

- (id)_voiceOverAttributes
{
  id v3 = [(SOSVoiceUtterance *)self voiceLanguage];
  [(SOSVoiceUtterance *)self rateMultiplier];
  float v5 = v4;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
  id v7 = v6;
  if (v3) {
    [v6 setObject:v3 forKey:@"AXSpeakTypingPayloadKeyLanguage"];
  }
  id v8 = NSNumber;
  [(SOSVoiceUtterance *)self volume];
  int v9 = objc_msgSend(v8, "numberWithFloat:");
  [v7 setObject:v9 forKey:@"AXSpeakTypingPayloadKeyVolume"];

  double v10 = [NSNumber numberWithDouble:v5 * 0.5];
  [v7 setObject:v10 forKey:@"AXSpeakTypingPayloadKeyRate"];

  return v7;
}

- (id)avSpeechUtterance
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F15490];
  float v4 = [(SOSVoiceUtterance *)self localizedMessageInVoiceLanguage];
  float v5 = [v3 speechUtteranceWithString:v4];

  id v6 = [(SOSVoiceUtterance *)self voice];
  [v5 setVoice:v6];

  [(SOSVoiceUtterance *)self volume];
  objc_msgSend(v5, "setVolume:");
  [(SOSVoiceUtterance *)self rateMultiplier];
  *(float *)&double v8 = v7 * 0.5;
  [v5 setRate:v8];
  int v9 = sos_voice_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    double v12 = v5;
    __int16 v13 = 2112;
    int v14 = self;
    _os_log_impl(&dword_1B3A94000, v9, OS_LOG_TYPE_DEFAULT, "avSpeechUtterance: %@, from %@", (uint8_t *)&v11, 0x16u);
  }

  return v5;
}

- (id)voice
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F15470];
  float v4 = [(SOSVoiceUtterance *)self voiceLanguage];
  float v5 = [v3 voiceWithLanguage:v4];

  id v6 = sos_voice_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    float v7 = [(SOSVoiceUtterance *)self voiceLanguage];
    int v9 = 138543618;
    double v10 = v5;
    __int16 v11 = 2114;
    double v12 = v7;
    _os_log_impl(&dword_1B3A94000, v6, OS_LOG_TYPE_DEFAULT, "Voice retrieved: %{public}@ for voiceLanguage: %{public}@", (uint8_t *)&v9, 0x16u);
  }

  return v5;
}

- (NSString)messageKey
{
  return self->_messageKey;
}

- (NSString)voiceLanguage
{
  return self->_voiceLanguage;
}

- (NSString)precomposedLocalizedMessageString
{
  return self->_precomposedLocalizedMessageString;
}

- (void)setPrecomposedLocalizedMessageString:(id)a3
{
}

- (float)volume
{
  return self->_volume;
}

- (void)setVolume:(float)a3
{
  self->_volume = a3;
}

- (float)rateMultiplier
{
  return self->_rateMultiplier;
}

- (void)setRateMultiplier:(float)a3
{
  self->_rateMultiplier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_precomposedLocalizedMessageString, 0);
  objc_storeStrong((id *)&self->_voiceLanguage, 0);

  objc_storeStrong((id *)&self->_messageKey, 0);
}

@end