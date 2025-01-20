@interface CSVTUIKeywordDetector
- (CSVTUIKeywordDetector)initWithAsset:(id)a3;
- (id)analyze:(id)a3;
- (id)triggeredUtterance:(id)a3;
- (unint64_t)_sampleLengthFrom:(unsigned int)a3 To:(unsigned int)a4;
- (void)reset;
@end

@implementation CSVTUIKeywordDetector

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioBuffer, 0);

  objc_storeStrong((id *)&self->_keywordAnalyzer, 0);
}

- (unint64_t)_sampleLengthFrom:(unsigned int)a3 To:(unsigned int)a4
{
  unsigned int v4 = -a3;
  if (a3 > a4) {
    unsigned int v4 = ~a3;
  }
  return v4 + a4;
}

- (id)triggeredUtterance:(id)a3
{
  unsigned int v4 = [a3 objectForKeyedSubscript:*MEMORY[0x263F38220]];
  unsigned int v5 = [v4 unsignedIntValue];

  unint64_t extraSamplesAtStart = self->_extraSamplesAtStart;
  if (extraSamplesAtStart <= v5) {
    uint64_t v7 = v5 - extraSamplesAtStart;
  }
  else {
    uint64_t v7 = 0;
  }
  v8 = (void *)[(CSAudioCircularBuffer *)self->_audioBuffer copySamplesFrom:[(CSAudioCircularBuffer *)self->_audioBuffer sampleCount]- [(CSVTUIKeywordDetector *)self _sampleLengthFrom:v7 To:[(CSAudioCircularBuffer *)self->_audioBuffer sampleCount]] to:[(CSAudioCircularBuffer *)self->_audioBuffer sampleCount]];
  v9 = objc_msgSend(v8, "dataForChannel:", objc_msgSend(MEMORY[0x263F38018], "channelForProcessedInput"));

  return v9;
}

- (id)analyze:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 length];
  unsigned int v6 = [MEMORY[0x263F38018] inputRecordingBytesPerFrame];
  audioBuffer = self->_audioBuffer;
  unint64_t v8 = v5 / v6;
  id v9 = v4;
  -[CSAudioCircularBuffer addSamples:numSamples:](audioBuffer, "addSamples:numSamples:", [v9 bytes], v8);
  v10 = [(SSRTriggerPhraseDetectorNDAPI *)self->_keywordAnalyzer analyzeWavData:v9 numSamples:v8];
  v11 = v10;
  if (v10)
  {
    [v10 bestScore];
    float v13 = v12;
    float lastKeywordScore = self->_lastKeywordScore;
    BOOL v15 = lastKeywordScore >= v13 && lastKeywordScore >= self->_keywordThreshold;
    BOOL v17 = lastKeywordScore >= v13;
    v16 = [MEMORY[0x263EFF9A0] dictionary];
    v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "bestStart"));
    [v16 setObject:v18 forKey:*MEMORY[0x263F38220]];

    v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "bestEnd"));
    [v16 setObject:v19 forKey:*MEMORY[0x263F38200]];

    v20 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "samplesFed"));
    [v16 setObject:v20 forKey:*MEMORY[0x263F381F0]];

    *(float *)&double v21 = self->_lastKeywordScore;
    v22 = [NSNumber numberWithFloat:v21];
    [v16 setObject:v22 forKey:*MEMORY[0x263F38218]];

    v23 = [NSNumber numberWithBool:v15];
    [v16 setObject:v23 forKey:*MEMORY[0x263F381C8]];

    v24 = [NSNumber numberWithBool:v17];
    [v16 setObject:v24 forKey:*MEMORY[0x263F381C0]];

    v25 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "phId"));
    [v16 setObject:v25 forKey:*MEMORY[0x263F381B0]];

    self->_float lastKeywordScore = v13;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)reset
{
  self->_float lastKeywordScore = -10000.0;
  [(SSRTriggerPhraseDetectorNDAPI *)self->_keywordAnalyzer reset];
  audioBuffer = self->_audioBuffer;

  [(CSAudioCircularBuffer *)audioBuffer reset];
}

- (CSVTUIKeywordDetector)initWithAsset:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)CSVTUIKeywordDetector;
  unint64_t v5 = [(CSVTUIKeywordDetector *)&v28 init];
  if (!v5) {
    goto LABEL_5;
  }
  if (!v4)
  {
    v25 = *MEMORY[0x263F37FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v30 = "-[CSVTUIKeywordDetector initWithAsset:]";
      _os_log_error_impl(&dword_21C8A5000, v25, OS_LOG_TYPE_ERROR, "%s Cannot create CSVTUIKeywordDetector since there is no asset available", buf, 0xCu);
    }
    goto LABEL_11;
  }
  unsigned int v6 = [v4 resourcePath];
  uint64_t v7 = [v6 stringByAppendingPathComponent:@"config.txt"];
  unint64_t v8 = [[SSRTriggerPhraseDetectorNDAPI alloc] initWithConfigPath:v7 resourcePath:v6 phId:0];
  keywordAnalyzer = v5->_keywordAnalyzer;
  v5->_keywordAnalyzer = v8;

  if (!v5->_keywordAnalyzer)
  {
    v26 = *MEMORY[0x263F37FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v30 = "-[CSVTUIKeywordDetector initWithAsset:]";
      _os_log_error_impl(&dword_21C8A5000, v26, OS_LOG_TYPE_ERROR, "%s Cannot create CSVTUIKeywordDetector since we cannot initialize NDAPI", buf, 0xCu);
    }

LABEL_11:
    v24 = 0;
    goto LABEL_12;
  }
  v10 = [MEMORY[0x263F38020] decodeConfigFrom:v4];
  [v10 threshold];
  v5->_keywordThreshold = v11;
  float v12 = [MEMORY[0x263F380F8] decodeConfigFrom:v4 forFirstPassSource:0];
  [v12 preTriggerAudioTime];
  float v14 = v13;
  [MEMORY[0x263F38018] inputRecordingSampleRate];
  v5->_unint64_t extraSamplesAtStart = (unint64_t)(float)(v14 * v15);
  id v16 = objc_alloc(MEMORY[0x263F37FC0]);
  [MEMORY[0x263F38018] inputRecordingDurationInSecs];
  int v18 = v17;
  [MEMORY[0x263F38018] inputRecordingSampleRate];
  LODWORD(v20) = v19;
  LODWORD(v21) = v18;
  uint64_t v22 = [v16 initWithNumChannels:1 recordingDuration:v21 samplingRate:v20];
  audioBuffer = v5->_audioBuffer;
  v5->_audioBuffer = (CSAudioCircularBuffer *)v22;

  [(CSVTUIKeywordDetector *)v5 reset];
LABEL_5:
  v24 = v5;
LABEL_12:

  return v24;
}

@end