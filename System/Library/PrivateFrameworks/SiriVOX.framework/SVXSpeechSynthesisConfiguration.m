@interface SVXSpeechSynthesisConfiguration
+ (SVXSpeechSynthesisConfiguration)configurationWithAudioSessionID:(unsigned int)a3;
+ (SVXSpeechSynthesisConfiguration)configurationWithLocale:(id)a3;
+ (SVXSpeechSynthesisConfiguration)configurationWithOutputVoiceInfo:(id)a3;
- (AFVoiceInfo)outputVoiceInfo;
- (BOOL)isEqual:(id)a3;
- (NSLocale)locale;
- (SVXSpeechSynthesisConfiguration)initWithLocale:(id)a3 outputVoiceInfo:(id)a4 audioSessionID:(unsigned int)a5;
- (unsigned)audioSessionID;
@end

@implementation SVXSpeechSynthesisConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);

  objc_storeStrong((id *)&self->_outputVoiceInfo, 0);
}

- (unsigned)audioSessionID
{
  return self->_audioSessionID;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (AFVoiceInfo)outputVoiceInfo
{
  return self->_outputVoiceInfo;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SVXSpeechSynthesisConfiguration *)a3;
  if (self == v4)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(SVXSpeechSynthesisConfiguration *)v5 locale];
      locale = self->_locale;
      if (locale == v6 || [(NSLocale *)locale isEqual:v6])
      {
        v8 = [(SVXSpeechSynthesisConfiguration *)v5 outputVoiceInfo];
        outputVoiceInfo = self->_outputVoiceInfo;
        if (outputVoiceInfo == v8 || [(AFVoiceInfo *)outputVoiceInfo isEqual:v8])
        {
          unsigned int audioSessionID = self->_audioSessionID;
          BOOL v11 = audioSessionID == [(SVXSpeechSynthesisConfiguration *)v5 audioSessionID];
        }
        else
        {
          BOOL v11 = 0;
        }
      }
      else
      {
        BOOL v11 = 0;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (SVXSpeechSynthesisConfiguration)initWithLocale:(id)a3 outputVoiceInfo:(id)a4 audioSessionID:(unsigned int)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SVXSpeechSynthesisConfiguration;
  v10 = [(SVXSpeechSynthesisConfiguration *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    locale = v10->_locale;
    v10->_locale = (NSLocale *)v11;

    uint64_t v13 = [v9 copy];
    outputVoiceInfo = v10->_outputVoiceInfo;
    v10->_outputVoiceInfo = (AFVoiceInfo *)v13;

    v10->_unsigned int audioSessionID = a5;
  }

  return v10;
}

+ (SVXSpeechSynthesisConfiguration)configurationWithAudioSessionID:(unsigned int)a3
{
  v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithLocale:0 outputVoiceInfo:0 audioSessionID:*(void *)&a3];

  return (SVXSpeechSynthesisConfiguration *)v3;
}

+ (SVXSpeechSynthesisConfiguration)configurationWithOutputVoiceInfo:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithLocale:0 outputVoiceInfo:v3 audioSessionID:0];

  return (SVXSpeechSynthesisConfiguration *)v4;
}

+ (SVXSpeechSynthesisConfiguration)configurationWithLocale:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithLocale:v3 outputVoiceInfo:0 audioSessionID:0];

  return (SVXSpeechSynthesisConfiguration *)v4;
}

@end