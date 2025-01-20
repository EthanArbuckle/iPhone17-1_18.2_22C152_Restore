@interface SSRTriggerPhraseDetectorQuasar
- (SSRTriggerPhraseDetectorQuasar)initWithLocale:(id)a3 configPath:(id)a4 resourcePath:(id)a5;
- (id)analyzeWavData:(id)a3 numSamples:(unint64_t)a4;
- (id)endAudio;
- (void)reset;
@end

@implementation SSRTriggerPhraseDetectorQuasar

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);

  objc_storeStrong((id *)&self->_syncRecognizer, 0);
}

- (id)endAudio
{
  v13[1] = *MEMORY[0x263EF8340];
  v2 = [(_EARSyncSpeechRecognizer *)self->_syncRecognizer resultsWithEndedAudio];
  v3 = [v2 firstObject];
  v4 = v3;
  if (v3)
  {
    v5 = [v3 tokens];
    v6 = (void *)[v5 count];

    if (v6)
    {
      v12 = @"best_score";
      v7 = NSNumber;
      v8 = [v4 tokens];
      v9 = [v8 objectAtIndexedSubscript:0];
      [v9 confidence];
      v10 = objc_msgSend(v7, "numberWithDouble:");
      v13[0] = v10;
      v6 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)analyzeWavData:(id)a3 numSamples:(unint64_t)a4
{
  v18[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [(_EARSyncSpeechRecognizer *)self->_syncRecognizer resultsWithAddedAudio:v6 numberOfSamples:a4 taskName:&stru_26CD357C0];
  v8 = [v7 firstObject];
  v9 = v8;
  if (v8)
  {
    v10 = [v8 tokens];
    v11 = (void *)[v10 count];

    if (v11)
    {
      v17 = @"best_score";
      v12 = NSNumber;
      v13 = [v9 tokens];
      v14 = [v13 objectAtIndexedSubscript:0];
      [v14 confidence];
      v15 = objc_msgSend(v12, "numberWithDouble:");
      v18[0] = v15;
      v11 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)reset
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[SSRTriggerPhraseDetectorQuasar reset]";
    _os_log_impl(&dword_21C8A5000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  LODWORD(v5) = 120;
  LOBYTE(v4) = 0;
  [(_EARSyncSpeechRecognizer *)self->_syncRecognizer resetWithSamplingRate:16000 language:self->_locale taskType:@"Dictation" userId:&stru_26CD357C0 sessionId:&stru_26CD357C0 deviceId:&stru_26CD357C0 farField:v4 audioSource:@"Second Pass" maxAudioBufferSizeSeconds:v5];
}

- (SSRTriggerPhraseDetectorQuasar)initWithLocale:(id)a3 configPath:(id)a4 resourcePath:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SSRTriggerPhraseDetectorQuasar;
  v12 = [(SSRTriggerPhraseDetectorQuasar *)&v18 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_locale, a3);
    uint64_t v14 = [objc_alloc(MEMORY[0x263F3B420]) initWithConfiguration:v10];
    syncRecognizer = v13->_syncRecognizer;
    v13->_syncRecognizer = (_EARSyncSpeechRecognizer *)v14;
  }
  v16 = v13;

  return v16;
}

@end