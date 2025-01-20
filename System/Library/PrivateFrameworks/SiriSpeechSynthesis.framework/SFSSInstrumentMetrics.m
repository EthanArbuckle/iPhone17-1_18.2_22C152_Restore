@interface SFSSInstrumentMetrics
- (BOOL)isSpeechRequest;
- (NSString)audioOutputRoute;
- (NSString)clientBundleIdentifier;
- (NSString)resourceAssetKey;
- (NSString)text;
- (NSString)voiceAssetKey;
- (double)audioDuration;
- (double)clockFactor;
- (double)playbackDuration;
- (double)speakLatency;
- (double)synthesisLatency;
- (id)description;
- (id)dictionaryMetrics;
- (int64_t)errorCode;
- (int64_t)requestCreatedTimestamp;
- (int64_t)sourceOfTTS;
- (int64_t)speakBeginTimestamp;
- (int64_t)speakEndTimestamp;
- (int64_t)synthesisBeginTimestamp;
- (int64_t)synthesisEndTimestamp;
- (void)setAudioDuration:(double)a3;
- (void)setAudioOutputRoute:(id)a3;
- (void)setClientBundleIdentifier:(id)a3;
- (void)setErrorCode:(int64_t)a3;
- (void)setIsSpeechRequest:(BOOL)a3;
- (void)setRequestCreatedTimestamp:(int64_t)a3;
- (void)setResourceAssetKey:(id)a3;
- (void)setSourceOfTTS:(int64_t)a3;
- (void)setSpeakBeginTimestamp:(int64_t)a3;
- (void)setSpeakEndTimestamp:(int64_t)a3;
- (void)setSynthesisBeginTimestamp:(int64_t)a3;
- (void)setSynthesisEndTimestamp:(int64_t)a3;
- (void)setText:(id)a3;
- (void)setVoiceAssetKey:(id)a3;
@end

@implementation SFSSInstrumentMetrics

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_audioOutputRoute, 0);
  objc_storeStrong((id *)&self->_resourceAssetKey, 0);
  objc_storeStrong((id *)&self->_voiceAssetKey, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

- (void)setIsSpeechRequest:(BOOL)a3
{
  self->_isSpeechRequest = a3;
}

- (BOOL)isSpeechRequest
{
  return self->_isSpeechRequest;
}

- (void)setSourceOfTTS:(int64_t)a3
{
  self->_sourceOfTTS = a3;
}

- (int64_t)sourceOfTTS
{
  return self->_sourceOfTTS;
}

- (void)setErrorCode:(int64_t)a3
{
  self->_errorCode = a3;
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (void)setAudioDuration:(double)a3
{
  self->_audioDuration = a3;
}

- (double)audioDuration
{
  return self->_audioDuration;
}

- (void)setSpeakEndTimestamp:(int64_t)a3
{
  self->_speakEndTimestamp = a3;
}

- (int64_t)speakEndTimestamp
{
  return self->_speakEndTimestamp;
}

- (void)setSpeakBeginTimestamp:(int64_t)a3
{
  self->_speakBeginTimestamp = a3;
}

- (int64_t)speakBeginTimestamp
{
  return self->_speakBeginTimestamp;
}

- (void)setSynthesisEndTimestamp:(int64_t)a3
{
  self->_synthesisEndTimestamp = a3;
}

- (int64_t)synthesisEndTimestamp
{
  return self->_synthesisEndTimestamp;
}

- (void)setSynthesisBeginTimestamp:(int64_t)a3
{
  self->_synthesisBeginTimestamp = a3;
}

- (int64_t)synthesisBeginTimestamp
{
  return self->_synthesisBeginTimestamp;
}

- (void)setRequestCreatedTimestamp:(int64_t)a3
{
  self->_requestCreatedTimestamp = a3;
}

- (int64_t)requestCreatedTimestamp
{
  return self->_requestCreatedTimestamp;
}

- (void)setClientBundleIdentifier:(id)a3
{
}

- (NSString)clientBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAudioOutputRoute:(id)a3
{
}

- (NSString)audioOutputRoute
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setResourceAssetKey:(id)a3
{
}

- (NSString)resourceAssetKey
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setVoiceAssetKey:(id)a3
{
}

- (NSString)voiceAssetKey
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setText:(id)a3
{
}

- (NSString)text
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (id)dictionaryMetrics
{
  v24[12] = *MEMORY[0x263EF8340];
  text = (__CFString *)self->_text;
  voiceAssetKey = self->_voiceAssetKey;
  if (!text) {
    text = &stru_26DEBFAF8;
  }
  v23[0] = @"text";
  v23[1] = @"voice_asset_key";
  if (voiceAssetKey) {
    v5 = (__CFString *)voiceAssetKey;
  }
  else {
    v5 = &stru_26DEBFAF8;
  }
  v24[0] = text;
  v24[1] = v5;
  resourceAssetKey = (__CFString *)self->_resourceAssetKey;
  if (!resourceAssetKey) {
    resourceAssetKey = &stru_26DEBFAF8;
  }
  v24[2] = resourceAssetKey;
  v23[2] = @"resource_asset_key";
  v23[3] = @"is_speech_request";
  v7 = [NSNumber numberWithBool:self->_isSpeechRequest];
  v24[3] = v7;
  v23[4] = @"error_code";
  v8 = [NSNumber numberWithInteger:self->_errorCode];
  v24[4] = v8;
  v23[5] = @"source_of_tts";
  v9 = [NSNumber numberWithInteger:self->_sourceOfTTS];
  v24[5] = v9;
  v23[6] = @"speak_latency";
  v10 = NSNumber;
  [(SFSSInstrumentMetrics *)self speakLatency];
  v11 = objc_msgSend(v10, "numberWithDouble:");
  v24[6] = v11;
  v23[7] = @"synthesis_latency";
  v12 = NSNumber;
  [(SFSSInstrumentMetrics *)self synthesisLatency];
  v13 = objc_msgSend(v12, "numberWithDouble:");
  v24[7] = v13;
  v23[8] = @"playback_duration";
  v14 = NSNumber;
  [(SFSSInstrumentMetrics *)self playbackDuration];
  v15 = objc_msgSend(v14, "numberWithDouble:");
  v24[8] = v15;
  v23[9] = @"audio_duration";
  uint64_t v16 = [NSNumber numberWithDouble:self->_audioDuration];
  v17 = (void *)v16;
  audioOutputRoute = (__CFString *)self->_audioOutputRoute;
  clientBundleIdentifier = self->_clientBundleIdentifier;
  if (!audioOutputRoute) {
    audioOutputRoute = &stru_26DEBFAF8;
  }
  v24[9] = v16;
  v24[10] = audioOutputRoute;
  v23[10] = @"audio_output_route";
  v23[11] = @"client_bundle_identifier";
  if (clientBundleIdentifier) {
    v20 = (__CFString *)clientBundleIdentifier;
  }
  else {
    v20 = &stru_26DEBFAF8;
  }
  v24[11] = v20;
  v21 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:12];

  return v21;
}

- (double)playbackDuration
{
  int64_t speakEndTimestamp = self->_speakEndTimestamp;
  if (!speakEndTimestamp) {
    return 0.0;
  }
  double v3 = (double)(speakEndTimestamp - self->_speakBeginTimestamp);
  [(SFSSInstrumentMetrics *)self clockFactor];
  return v4 * v3;
}

- (double)speakLatency
{
  int64_t speakBeginTimestamp = self->_speakBeginTimestamp;
  if (!speakBeginTimestamp) {
    return 0.0;
  }
  double v3 = (double)(speakBeginTimestamp - self->_requestCreatedTimestamp);
  [(SFSSInstrumentMetrics *)self clockFactor];
  return v4 * v3;
}

- (double)synthesisLatency
{
  int64_t synthesisEndTimestamp = self->_synthesisEndTimestamp;
  if (!synthesisEndTimestamp) {
    return 0.0;
  }
  double v3 = (double)(synthesisEndTimestamp - self->_synthesisBeginTimestamp);
  [(SFSSInstrumentMetrics *)self clockFactor];
  return v4 * v3;
}

- (id)description
{
  v2 = [(SFSSInstrumentMetrics *)self dictionaryMetrics];
  double v3 = [v2 description];

  return v3;
}

- (double)clockFactor
{
  if (clockFactor_onceToken != -1) {
    dispatch_once(&clockFactor_onceToken, &__block_literal_global_105);
  }
  return *(double *)&clockFactor_clockToSeconds;
}

double __36__SFSSInstrumentMetrics_clockFactor__block_invoke()
{
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  LODWORD(v1) = info.denom;
  LODWORD(v0) = info.numer;
  double result = (double)v0 / (double)v1 / 1000000000.0;
  clockFactor_clockToSeconds = *(void *)&result;
  return result;
}

@end