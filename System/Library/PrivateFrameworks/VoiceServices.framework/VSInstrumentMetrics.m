@interface VSInstrumentMetrics
+ (BOOL)supportsSecureCoding;
+ (id)descriptionFormatter;
+ (id)stringOfSourceOfTTS:(int64_t)a3;
+ (id)vs_metricsFromSTSMetrics:(id)a3;
- (BOOL)canUseServerTTS;
- (BOOL)isCacheHitFromDisk;
- (BOOL)isCacheHitFromMemory;
- (BOOL)isServerStreamTTS;
- (BOOL)isServerTTS;
- (BOOL)isServerTTSRacing;
- (BOOL)isServerTimeout;
- (BOOL)isSpeechRequest;
- (BOOL)isSynthesisCached;
- (BOOL)isWarmStart;
- (BOOL)neuralAlignmentStall;
- (BOOL)neuralAudioClick;
- (BOOL)neuralFallback;
- (NSString)audioOutputRoute;
- (NSString)clientBundleIdentifier;
- (NSString)experimentIdentifier;
- (NSString)utterance;
- (NSString)voiceAssetKey;
- (NSString)voiceResourceAssetKey;
- (VSInstrumentMetrics)initWithCoder:(id)a3;
- (double)_clockFactor;
- (double)audioDuration;
- (double)audioQueueLatency;
- (double)cappedRealTimeFactor;
- (double)eagerRequestTimeGap;
- (double)realTimeFactor;
- (double)serverStreamFirstPacketLatency;
- (double)serverStreamLastPacketLatency;
- (double)serverStreamedAudioDuration;
- (double)timeToPlaybackLatency;
- (double)timeToSpeakLatency;
- (double)ttsSynthesisLatency;
- (id)description;
- (id)dictionaryMetrics;
- (int64_t)audioStartTimestampDiffs;
- (int64_t)eagerRequestCreatedTimestampDiffs;
- (int64_t)errorCode;
- (int64_t)promptCount;
- (int64_t)requestCreatedTimestamp;
- (int64_t)serverFirstPacketTimestamp;
- (int64_t)serverLastPacketTimestamp;
- (int64_t)sourceOfTTS;
- (int64_t)speechBeginTimestamp;
- (int64_t)speechEndTimestamp;
- (int64_t)speechEstimatedOutputBeginTimestamp;
- (int64_t)synthesisBeginTimestamp;
- (int64_t)synthesisEndTimestamp;
- (void)encodeWithCoder:(id)a3;
- (void)setAudioDuration:(double)a3;
- (void)setAudioOutputRoute:(id)a3;
- (void)setAudioStartTimestampDiffs:(int64_t)a3;
- (void)setCanUseServerTTS:(BOOL)a3;
- (void)setClientBundleIdentifier:(id)a3;
- (void)setEagerRequestCreatedTimestampDiffs:(int64_t)a3;
- (void)setErrorCode:(int64_t)a3;
- (void)setExperimentIdentifier:(id)a3;
- (void)setIsCacheHitFromDisk:(BOOL)a3;
- (void)setIsCacheHitFromMemory:(BOOL)a3;
- (void)setIsServerStreamTTS:(BOOL)a3;
- (void)setIsServerTTS:(BOOL)a3;
- (void)setIsServerTTSRacing:(BOOL)a3;
- (void)setIsServerTimeout:(BOOL)a3;
- (void)setIsSpeechRequest:(BOOL)a3;
- (void)setIsWarmStart:(BOOL)a3;
- (void)setNeuralAlignmentStall:(BOOL)a3;
- (void)setNeuralAudioClick:(BOOL)a3;
- (void)setNeuralFallback:(BOOL)a3;
- (void)setPromptCount:(int64_t)a3;
- (void)setRequestCreatedTimestamp:(int64_t)a3;
- (void)setServerFirstPacketTimestamp:(int64_t)a3;
- (void)setServerLastPacketTimestamp:(int64_t)a3;
- (void)setServerStreamedAudioDuration:(double)a3;
- (void)setSourceOfTTS:(int64_t)a3;
- (void)setSpeechBeginTimestamp:(int64_t)a3;
- (void)setSpeechEndTimestamp:(int64_t)a3;
- (void)setSynthesisBeginTimestamp:(int64_t)a3;
- (void)setSynthesisEndTimestamp:(int64_t)a3;
- (void)setUtterance:(id)a3;
- (void)setVoiceAssetKey:(id)a3;
- (void)setVoiceResourceAssetKey:(id)a3;
@end

@implementation VSInstrumentMetrics

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_experimentIdentifier, 0);
  objc_storeStrong((id *)&self->_clientBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_audioOutputRoute, 0);
  objc_storeStrong((id *)&self->_voiceResourceAssetKey, 0);
  objc_storeStrong((id *)&self->_voiceAssetKey, 0);
  objc_storeStrong((id *)&self->_utterance, 0);
}

- (void)setIsCacheHitFromMemory:(BOOL)a3
{
  self->_isCacheHitFromMemory = a3;
}

- (BOOL)isCacheHitFromMemory
{
  return self->_isCacheHitFromMemory;
}

- (void)setIsCacheHitFromDisk:(BOOL)a3
{
  self->_isCacheHitFromDisk = a3;
}

- (BOOL)isCacheHitFromDisk
{
  return self->_isCacheHitFromDisk;
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

- (void)setPromptCount:(int64_t)a3
{
  self->_promptCount = a3;
}

- (int64_t)promptCount
{
  return self->_promptCount;
}

- (void)setNeuralFallback:(BOOL)a3
{
  self->_neuralFallback = a3;
}

- (BOOL)neuralFallback
{
  return self->_neuralFallback;
}

- (void)setNeuralAudioClick:(BOOL)a3
{
  self->_neuralAudioClick = a3;
}

- (BOOL)neuralAudioClick
{
  return self->_neuralAudioClick;
}

- (void)setNeuralAlignmentStall:(BOOL)a3
{
  self->_neuralAlignmentStall = a3;
}

- (BOOL)neuralAlignmentStall
{
  return self->_neuralAlignmentStall;
}

- (void)setCanUseServerTTS:(BOOL)a3
{
  self->_canUseServerTTS = a3;
}

- (BOOL)canUseServerTTS
{
  return self->_canUseServerTTS;
}

- (void)setIsServerTTSRacing:(BOOL)a3
{
  self->_isServerTTSRacing = a3;
}

- (BOOL)isServerTTSRacing
{
  return self->_isServerTTSRacing;
}

- (void)setIsServerTimeout:(BOOL)a3
{
  self->_isServerTimeout = a3;
}

- (BOOL)isServerTimeout
{
  return self->_isServerTimeout;
}

- (void)setIsServerStreamTTS:(BOOL)a3
{
  self->_isServerStreamTTS = a3;
}

- (BOOL)isServerStreamTTS
{
  return self->_isServerStreamTTS;
}

- (void)setIsServerTTS:(BOOL)a3
{
  self->_isServerTTS = a3;
}

- (BOOL)isServerTTS
{
  return self->_isServerTTS;
}

- (void)setIsWarmStart:(BOOL)a3
{
  self->_isWarmStart = a3;
}

- (BOOL)isWarmStart
{
  return self->_isWarmStart;
}

- (void)setAudioDuration:(double)a3
{
  self->_audioDuration = a3;
}

- (double)audioDuration
{
  return self->_audioDuration;
}

- (void)setServerStreamedAudioDuration:(double)a3
{
  self->_serverStreamedAudioDuration = a3;
}

- (double)serverStreamedAudioDuration
{
  return self->_serverStreamedAudioDuration;
}

- (void)setServerLastPacketTimestamp:(int64_t)a3
{
  self->_serverLastPacketTimestamp = a3;
}

- (int64_t)serverLastPacketTimestamp
{
  return self->_serverLastPacketTimestamp;
}

- (void)setServerFirstPacketTimestamp:(int64_t)a3
{
  self->_serverFirstPacketTimestamp = a3;
}

- (int64_t)serverFirstPacketTimestamp
{
  return self->_serverFirstPacketTimestamp;
}

- (void)setAudioStartTimestampDiffs:(int64_t)a3
{
  self->_audioStartTimestampDiffs = a3;
}

- (int64_t)audioStartTimestampDiffs
{
  return self->_audioStartTimestampDiffs;
}

- (void)setSpeechEndTimestamp:(int64_t)a3
{
  self->_speechEndTimestamp = a3;
}

- (int64_t)speechEndTimestamp
{
  return self->_speechEndTimestamp;
}

- (void)setSpeechBeginTimestamp:(int64_t)a3
{
  self->_speechBeginTimestamp = a3;
}

- (int64_t)speechBeginTimestamp
{
  return self->_speechBeginTimestamp;
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

- (void)setEagerRequestCreatedTimestampDiffs:(int64_t)a3
{
  self->_eagerRequestCreatedTimestampDiffs = a3;
}

- (int64_t)eagerRequestCreatedTimestampDiffs
{
  return self->_eagerRequestCreatedTimestampDiffs;
}

- (void)setRequestCreatedTimestamp:(int64_t)a3
{
  self->_requestCreatedTimestamp = a3;
}

- (int64_t)requestCreatedTimestamp
{
  return self->_requestCreatedTimestamp;
}

- (void)setExperimentIdentifier:(id)a3
{
}

- (NSString)experimentIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setClientBundleIdentifier:(id)a3
{
}

- (NSString)clientBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setAudioOutputRoute:(id)a3
{
}

- (NSString)audioOutputRoute
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setVoiceResourceAssetKey:(id)a3
{
}

- (NSString)voiceResourceAssetKey
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setVoiceAssetKey:(id)a3
{
}

- (NSString)voiceAssetKey
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setUtterance:(id)a3
{
}

- (NSString)utterance
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (id)dictionaryMetrics
{
  v49[30] = *MEMORY[0x263EF8340];
  v48[0] = @"character_count";
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSString length](self->_utterance, "length"));
  v47 = (void *)v3;
  voiceAssetKey = (__CFString *)self->_voiceAssetKey;
  voiceResourceAssetKey = self->_voiceResourceAssetKey;
  if (!voiceAssetKey) {
    voiceAssetKey = &stru_26C1B0528;
  }
  v49[0] = v3;
  v49[1] = voiceAssetKey;
  v48[1] = @"voice_asset_key";
  v48[2] = @"voice_resource_asset_key";
  if (voiceResourceAssetKey) {
    v6 = (__CFString *)voiceResourceAssetKey;
  }
  else {
    v6 = &stru_26C1B0528;
  }
  v49[2] = v6;
  v48[3] = @"is_warm_start";
  v46 = [NSNumber numberWithBool:self->_isWarmStart];
  v49[3] = v46;
  v48[4] = @"tts_synthesis_latency";
  v7 = NSNumber;
  [(VSInstrumentMetrics *)self ttsSynthesisLatency];
  v45 = objc_msgSend(v7, "numberWithDouble:");
  v49[4] = v45;
  v48[5] = @"tts_total_latency";
  v8 = NSNumber;
  [(VSInstrumentMetrics *)self timeToSpeakLatency];
  v44 = objc_msgSend(v8, "numberWithDouble:");
  v49[5] = v44;
  v48[6] = @"tts_and_playback_total_latency";
  v9 = NSNumber;
  [(VSInstrumentMetrics *)self timeToPlaybackLatency];
  v43 = objc_msgSend(v9, "numberWithDouble:");
  v49[6] = v43;
  v48[7] = @"audio_queue_latency";
  v10 = NSNumber;
  [(VSInstrumentMetrics *)self audioQueueLatency];
  v42 = objc_msgSend(v10, "numberWithDouble:");
  v49[7] = v42;
  v48[8] = @"audio_duration";
  v41 = [NSNumber numberWithDouble:self->_audioDuration];
  v49[8] = v41;
  v48[9] = @"is_speech_request";
  v40 = [NSNumber numberWithBool:self->_isSpeechRequest];
  v49[9] = v40;
  v48[10] = @"synthesis_to_speech_time_gap";
  v11 = NSNumber;
  [(VSInstrumentMetrics *)self eagerRequestTimeGap];
  v39 = objc_msgSend(v11, "numberWithDouble:");
  v49[10] = v39;
  v48[11] = @"is_synthesis_cached";
  v38 = objc_msgSend(NSNumber, "numberWithBool:", -[VSInstrumentMetrics isSynthesisCached](self, "isSynthesisCached"));
  v49[11] = v38;
  v48[12] = @"prompt_count";
  v37 = [NSNumber numberWithInteger:self->_promptCount];
  v49[12] = v37;
  v48[13] = @"source_of_tts";
  uint64_t v12 = [NSNumber numberWithInteger:self->_sourceOfTTS];
  v36 = (void *)v12;
  audioOutputRoute = (__CFString *)self->_audioOutputRoute;
  if (!audioOutputRoute) {
    audioOutputRoute = &stru_26C1B0528;
  }
  v49[13] = v12;
  v49[14] = audioOutputRoute;
  v48[14] = @"audio_output_route";
  v48[15] = @"error_code";
  uint64_t v14 = [NSNumber numberWithInteger:self->_errorCode];
  v35 = (void *)v14;
  clientBundleIdentifier = (__CFString *)self->_clientBundleIdentifier;
  experimentIdentifier = self->_experimentIdentifier;
  if (!clientBundleIdentifier) {
    clientBundleIdentifier = &stru_26C1B0528;
  }
  v49[15] = v14;
  v49[16] = clientBundleIdentifier;
  v48[16] = @"client_bundle_identifier";
  v48[17] = @"experiment_identifier";
  if (experimentIdentifier) {
    v17 = (__CFString *)experimentIdentifier;
  }
  else {
    v17 = &stru_26C1B0528;
  }
  v49[17] = v17;
  v48[18] = @"is_server_tts";
  v34 = [NSNumber numberWithBool:self->_isServerTTS];
  v49[18] = v34;
  v48[19] = @"is_server_stream_tts";
  v33 = [NSNumber numberWithBool:self->_isServerStreamTTS];
  v49[19] = v33;
  v48[20] = @"is_server_timeout";
  v32 = [NSNumber numberWithBool:self->_isServerTimeout];
  v49[20] = v32;
  v48[21] = @"can_use_server_tts";
  v18 = [NSNumber numberWithBool:self->_canUseServerTTS];
  v49[21] = v18;
  v48[22] = @"is_server_tts_racing";
  v19 = [NSNumber numberWithBool:self->_isServerTTSRacing];
  v49[22] = v19;
  v48[23] = @"server_first_packet_latency";
  v20 = NSNumber;
  [(VSInstrumentMetrics *)self serverStreamFirstPacketLatency];
  v21 = objc_msgSend(v20, "numberWithDouble:");
  v49[23] = v21;
  v48[24] = @"server_last_packet_latency";
  v22 = NSNumber;
  [(VSInstrumentMetrics *)self serverStreamLastPacketLatency];
  v23 = objc_msgSend(v22, "numberWithDouble:");
  v49[24] = v23;
  v48[25] = @"server_streamed_audio_duration";
  v24 = [NSNumber numberWithDouble:self->_serverStreamedAudioDuration];
  v49[25] = v24;
  v48[26] = @"real_time_factor";
  v25 = NSNumber;
  [(VSInstrumentMetrics *)self cappedRealTimeFactor];
  v26 = objc_msgSend(v25, "numberWithDouble:");
  v49[26] = v26;
  v48[27] = @"neural_alignment_stall";
  v27 = [NSNumber numberWithBool:self->_neuralAlignmentStall];
  v49[27] = v27;
  v48[28] = @"neural_audio_click";
  v28 = [NSNumber numberWithBool:self->_neuralAudioClick];
  v49[28] = v28;
  v48[29] = @"neural_fallback";
  v29 = [NSNumber numberWithBool:self->_neuralFallback];
  v49[29] = v29;
  v30 = [NSDictionary dictionaryWithObjects:v49 forKeys:v48 count:30];

  return v30;
}

- (double)serverStreamLastPacketLatency
{
  int64_t serverLastPacketTimestamp = self->_serverLastPacketTimestamp;
  if (!serverLastPacketTimestamp) {
    return 0.0;
  }
  double v3 = (double)(serverLastPacketTimestamp - self->_synthesisBeginTimestamp);
  [(VSInstrumentMetrics *)self _clockFactor];
  return v4 * v3;
}

- (double)serverStreamFirstPacketLatency
{
  int64_t serverFirstPacketTimestamp = self->_serverFirstPacketTimestamp;
  if (!serverFirstPacketTimestamp) {
    return 0.0;
  }
  double v3 = (double)(serverFirstPacketTimestamp - self->_synthesisBeginTimestamp);
  [(VSInstrumentMetrics *)self _clockFactor];
  return v4 * v3;
}

- (double)cappedRealTimeFactor
{
  [(VSInstrumentMetrics *)self realTimeFactor];
  return fmin(v2, 999999999.0);
}

- (double)realTimeFactor
{
  double audioDuration = self->_audioDuration;
  [(VSInstrumentMetrics *)self ttsSynthesisLatency];
  return audioDuration / v3;
}

- (double)eagerRequestTimeGap
{
  double eagerRequestCreatedTimestampDiffs = (double)self->_eagerRequestCreatedTimestampDiffs;
  [(VSInstrumentMetrics *)self _clockFactor];
  return v3 * eagerRequestCreatedTimestampDiffs;
}

- (BOOL)isSynthesisCached
{
  return self->_isCacheHitFromDisk || self->_isCacheHitFromMemory;
}

- (double)ttsSynthesisLatency
{
  int64_t synthesisEndTimestamp = self->_synthesisEndTimestamp;
  if (!synthesisEndTimestamp) {
    return 0.0;
  }
  double v3 = (double)(synthesisEndTimestamp - self->_synthesisBeginTimestamp);
  [(VSInstrumentMetrics *)self _clockFactor];
  return v4 * v3;
}

- (double)audioQueueLatency
{
  double audioStartTimestampDiffs = (double)self->_audioStartTimestampDiffs;
  [(VSInstrumentMetrics *)self _clockFactor];
  return v3 * audioStartTimestampDiffs;
}

- (double)timeToPlaybackLatency
{
  int64_t speechEndTimestamp = self->_speechEndTimestamp;
  if (speechEndTimestamp)
  {
    double v4 = (double)(speechEndTimestamp - self->_requestCreatedTimestamp);
    [(VSInstrumentMetrics *)self _clockFactor];
    return fmax(-(self->_audioDuration - v4 * v5), 0.0);
  }
  else
  {
    [(VSInstrumentMetrics *)self timeToSpeakLatency];
  }
  return result;
}

- (double)timeToSpeakLatency
{
  int64_t speechBeginTimestamp = self->_speechBeginTimestamp;
  if (!speechBeginTimestamp) {
    return 0.0;
  }
  double v3 = (double)(speechBeginTimestamp - self->_requestCreatedTimestamp);
  [(VSInstrumentMetrics *)self _clockFactor];
  return v4 * v3;
}

- (int64_t)speechEstimatedOutputBeginTimestamp
{
  int64_t speechBeginTimestamp = self->_speechBeginTimestamp;
  double speechEndTimestamp = (double)self->_speechEndTimestamp;
  double audioDuration = self->_audioDuration;
  [(VSInstrumentMetrics *)self _clockFactor];
  double v6 = speechEndTimestamp - audioDuration / v5;
  if (v6 <= (double)speechBeginTimestamp) {
    return (uint64_t)(double)speechBeginTimestamp;
  }
  return (uint64_t)v6;
}

- (double)_clockFactor
{
  if (_clockFactor_onceToken != -1) {
    dispatch_once(&_clockFactor_onceToken, &__block_literal_global_193);
  }
  return *(double *)&_clockFactor_clockToSeconds;
}

double __35__VSInstrumentMetrics__clockFactor__block_invoke()
{
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  LODWORD(v1) = info.denom;
  LODWORD(v0) = info.numer;
  double result = (double)v0 / (double)v1 / 1000000000.0;
  _clockFactor_clockToSeconds = *(void *)&result;
  return result;
}

- (VSInstrumentMetrics)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)VSInstrumentMetrics;
  double v5 = [(VSInstrumentMetrics *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_utterance"];
    utterance = v5->_utterance;
    v5->_utterance = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_voiceAssetKey"];
    voiceAssetKey = v5->_voiceAssetKey;
    v5->_voiceAssetKey = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_voiceResourceAssetKey"];
    voiceResourceAssetKey = v5->_voiceResourceAssetKey;
    v5->_voiceResourceAssetKey = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_audioOutputRoute"];
    audioOutputRoute = v5->_audioOutputRoute;
    v5->_audioOutputRoute = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_clientBundleIdentifier"];
    clientBundleIdentifier = v5->_clientBundleIdentifier;
    v5->_clientBundleIdentifier = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_experimentIdentifier"];
    experimentIdentifier = v5->_experimentIdentifier;
    v5->_experimentIdentifier = (NSString *)v16;

    v5->_promptCount = [v4 decodeIntegerForKey:@"_promptCount"];
    v5->_sourceOfTTS = [v4 decodeIntegerForKey:@"_sourceOfTTS"];
    v5->_errorCode = [v4 decodeIntegerForKey:@"_errorCode"];
    v5->_requestCreatedTimestamp = [v4 decodeInt64ForKey:@"_requestCreatedTimestamp"];
    v5->_synthesisBeginTimestamp = [v4 decodeInt64ForKey:@"_synthesisBeginTimestamp"];
    v5->_int64_t synthesisEndTimestamp = [v4 decodeInt64ForKey:@"_synthesisEndTimestamp"];
    v5->_int64_t speechBeginTimestamp = [v4 decodeInt64ForKey:@"_speechBeginTimestamp"];
    v5->_double speechEndTimestamp = [v4 decodeInt64ForKey:@"_speechEndTimestamp"];
    v5->_double audioStartTimestampDiffs = [v4 decodeInt64ForKey:@"_audioStartTimestampDiffs"];
    v5->_int64_t serverFirstPacketTimestamp = [v4 decodeInt64ForKey:@"_serverFirstPacketTimestamp"];
    [v4 decodeDoubleForKey:@"_audioDuration"];
    v5->_double audioDuration = v18;
    [v4 decodeDoubleForKey:@"_serverStreamedAudioDuration"];
    v5->_serverStreamedAudioDuration = v19;
    v5->_isWarmStart = [v4 decodeBoolForKey:@"_isWarmStart"];
    v5->_isCacheHitFromDisk = [v4 decodeBoolForKey:@"_isCacheHitFromDisk"];
    v5->_isCacheHitFromMemory = [v4 decodeBoolForKey:@"_isCacheHitFromMemory"];
    v5->_isSpeechRequest = [v4 decodeBoolForKey:@"_isSpeechRequest"];
    v5->_canUseServerTTS = [v4 decodeBoolForKey:@"_canUseServerTTS"];
    v5->_isServerTTS = [v4 decodeBoolForKey:@"_isServerTTS"];
    v5->_isServerStreamTTS = [v4 decodeBoolForKey:@"_isServerStreamTTS"];
    v5->_isServerTimeout = [v4 decodeBoolForKey:@"_isServerTimeout"];
    v5->_isServerTTSRacing = [v4 decodeBoolForKey:@"_isServerTTSRacing"];
    v5->_neuralAlignmentStall = [v4 decodeBoolForKey:@"_neuralAlignmentStall"];
    v5->_neuralAudioClick = [v4 decodeBoolForKey:@"_neuralAudioClick"];
    v5->_neuralFallback = [v4 decodeBoolForKey:@"_neuralFallback"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  utterance = self->_utterance;
  id v5 = a3;
  [v5 encodeObject:utterance forKey:@"_utterance"];
  [v5 encodeObject:self->_voiceAssetKey forKey:@"_voiceAssetKey"];
  [v5 encodeObject:self->_voiceResourceAssetKey forKey:@"_voiceResourceAssetKey"];
  [v5 encodeObject:self->_audioOutputRoute forKey:@"_audioOutputRoute"];
  [v5 encodeObject:self->_clientBundleIdentifier forKey:@"_clientBundleIdentifier"];
  [v5 encodeObject:self->_experimentIdentifier forKey:@"_experimentIdentifier"];
  [v5 encodeInteger:self->_promptCount forKey:@"_promptCount"];
  [v5 encodeInteger:self->_sourceOfTTS forKey:@"_sourceOfTTS"];
  [v5 encodeInteger:self->_errorCode forKey:@"_errorCode"];
  [v5 encodeInt64:self->_requestCreatedTimestamp forKey:@"_requestCreatedTimestamp"];
  [v5 encodeInt64:self->_synthesisBeginTimestamp forKey:@"_synthesisBeginTimestamp"];
  [v5 encodeInt64:self->_synthesisEndTimestamp forKey:@"_synthesisEndTimestamp"];
  [v5 encodeInt64:self->_speechBeginTimestamp forKey:@"_speechBeginTimestamp"];
  [v5 encodeInt64:self->_speechEndTimestamp forKey:@"_speechEndTimestamp"];
  [v5 encodeInt64:self->_audioStartTimestampDiffs forKey:@"_audioStartTimestampDiffs"];
  [v5 encodeInt64:self->_serverFirstPacketTimestamp forKey:@"_serverFirstPacketTimestamp"];
  [v5 encodeDouble:@"_audioDuration" forKey:self->_audioDuration];
  [v5 encodeDouble:@"_serverStreamedAudioDuration" forKey:self->_serverStreamedAudioDuration];
  [v5 encodeBool:self->_isWarmStart forKey:@"_isWarmStart"];
  [v5 encodeBool:self->_isCacheHitFromDisk forKey:@"_isCacheHitFromDisk"];
  [v5 encodeBool:self->_isCacheHitFromMemory forKey:@"_isCacheHitFromMemory"];
  [v5 encodeBool:self->_isSpeechRequest forKey:@"_isSpeechRequest"];
  [v5 encodeBool:self->_canUseServerTTS forKey:@"_canUseServerTTS"];
  [v5 encodeBool:self->_isServerTTS forKey:@"_isServerTTS"];
  [v5 encodeBool:self->_isServerStreamTTS forKey:@"_isServerStreamTTS"];
  [v5 encodeBool:self->_isServerTimeout forKey:@"_isServerTimeout"];
  [v5 encodeBool:self->_isServerTTSRacing forKey:@"_isServerTTSRacing"];
  [v5 encodeBool:self->_neuralAlignmentStall forKey:@"_neuralAlignmentStall"];
  [v5 encodeBool:self->_neuralAudioClick forKey:@"_neuralAudioClick"];
  [v5 encodeBool:self->_neuralFallback forKey:@"_neuralFallback"];
}

- (id)description
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  double v3 = [MEMORY[0x263F089D8] stringWithString:@"{\n"];
  id v4 = [(VSInstrumentMetrics *)self dictionaryMetrics];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [&unk_26C1BA920 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(&unk_26C1BA920);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v10 = [v4 objectForKeyedSubscript:v9];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v11 = +[VSInstrumentMetrics descriptionFormatter];
          uint64_t v12 = [v11 stringFromNumber:v10];
          [v3 appendFormat:@"  \"%@\": %@,\n", v9, v12];
        }
        else
        {
          [v3 appendFormat:@"  \"%@\": \"%@\",\n", v9, v10];
        }
      }
      uint64_t v6 = [&unk_26C1BA920 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
  [v3 appendString:@"}"];

  return v3;
}

+ (id)stringOfSourceOfTTS:(int64_t)a3
{
  if ((unint64_t)a3 > 8) {
    return @"unknown";
  }
  else {
    return off_2640E7FB8[a3];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)descriptionFormatter
{
  if (descriptionFormatter_onceToken != -1) {
    dispatch_once(&descriptionFormatter_onceToken, &__block_literal_global);
  }
  double v2 = (void *)descriptionFormatter_formatter;
  return v2;
}

uint64_t __43__VSInstrumentMetrics_descriptionFormatter__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  unint64_t v1 = (void *)descriptionFormatter_formatter;
  descriptionFormatter_formatter = v0;

  [(id)descriptionFormatter_formatter setMinimumFractionDigits:0];
  double v2 = (void *)descriptionFormatter_formatter;
  return [v2 setMaximumFractionDigits:4];
}

+ (id)vs_metricsFromSTSMetrics:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(VSInstrumentMetrics);
  uint64_t v5 = [v3 utterance];
  [(VSInstrumentMetrics *)v4 setUtterance:v5];

  uint64_t v6 = [v3 voiceAssetKey];
  [(VSInstrumentMetrics *)v4 setVoiceAssetKey:v6];

  uint64_t v7 = [v3 voiceResourceAssetKey];
  [(VSInstrumentMetrics *)v4 setVoiceResourceAssetKey:v7];

  uint64_t v8 = [v3 audioOutputRoute];
  [(VSInstrumentMetrics *)v4 setAudioOutputRoute:v8];

  uint64_t v9 = [v3 clientBundleIdentifier];
  [(VSInstrumentMetrics *)v4 setClientBundleIdentifier:v9];

  uint64_t v10 = [v3 experimentIdentifier];
  [(VSInstrumentMetrics *)v4 setExperimentIdentifier:v10];

  -[VSInstrumentMetrics setRequestCreatedTimestamp:](v4, "setRequestCreatedTimestamp:", [v3 requestCreatedTime]);
  [v3 eagerRequestGapInterval];
  double v12 = v11;
  [(VSInstrumentMetrics *)v4 _clockFactor];
  [(VSInstrumentMetrics *)v4 setEagerRequestCreatedTimestampDiffs:(uint64_t)(v12 / v13)];
  -[VSInstrumentMetrics setSynthesisBeginTimestamp:](v4, "setSynthesisBeginTimestamp:", [v3 synthesisBeginTime]);
  -[VSInstrumentMetrics setSynthesisEndTimestamp:](v4, "setSynthesisEndTimestamp:", [v3 synthesisEndTime]);
  -[VSInstrumentMetrics setSpeechBeginTimestamp:](v4, "setSpeechBeginTimestamp:", [v3 speechBeginTime]);
  -[VSInstrumentMetrics setSpeechEndTimestamp:](v4, "setSpeechEndTimestamp:", [v3 speechEndTime]);
  [v3 audioStartLatency];
  double v15 = v14;
  [(VSInstrumentMetrics *)v4 _clockFactor];
  [(VSInstrumentMetrics *)v4 setAudioStartTimestampDiffs:(uint64_t)(v15 / v16)];
  -[VSInstrumentMetrics setServerFirstPacketTimestamp:](v4, "setServerFirstPacketTimestamp:", [v3 serverFirstPacketTime]);
  -[VSInstrumentMetrics setServerLastPacketTimestamp:](v4, "setServerLastPacketTimestamp:", [v3 serverLastPacketTime]);
  [v3 serverStreamedAudioDuration];
  -[VSInstrumentMetrics setServerStreamedAudioDuration:](v4, "setServerStreamedAudioDuration:");
  [v3 audioDuration];
  -[VSInstrumentMetrics setAudioDuration:](v4, "setAudioDuration:");
  -[VSInstrumentMetrics setIsWarmStart:](v4, "setIsWarmStart:", [v3 isWarmStart]);
  BOOL v17 = [v3 sourceOfTTS] == 5 || objc_msgSend(v3, "sourceOfTTS") == 3;
  [(VSInstrumentMetrics *)v4 setIsServerTTS:v17];
  -[VSInstrumentMetrics setIsServerStreamTTS:](v4, "setIsServerStreamTTS:", [v3 sourceOfTTS] == 5);
  -[VSInstrumentMetrics setIsServerTimeout:](v4, "setIsServerTimeout:", [v3 errorCode] == 602);
  -[VSInstrumentMetrics setIsServerTTSRacing:](v4, "setIsServerTTSRacing:", [v3 isServerTTSRacing]);
  -[VSInstrumentMetrics setCanUseServerTTS:](v4, "setCanUseServerTTS:", [v3 privacySensitive] ^ 1);
  -[VSInstrumentMetrics setNeuralAlignmentStall:](v4, "setNeuralAlignmentStall:", [v3 neuralAlignmentStall]);
  -[VSInstrumentMetrics setNeuralAudioClick:](v4, "setNeuralAudioClick:", [v3 neuralAudioClick]);
  -[VSInstrumentMetrics setNeuralFallback:](v4, "setNeuralFallback:", [v3 neuralFallback]);
  -[VSInstrumentMetrics setPromptCount:](v4, "setPromptCount:", [v3 promptCount]);
  -[VSInstrumentMetrics setErrorCode:](v4, "setErrorCode:", [v3 errorCode]);
  -[VSInstrumentMetrics setSourceOfTTS:](v4, "setSourceOfTTS:", [v3 sourceOfTTS]);
  -[VSInstrumentMetrics setIsCacheHitFromDisk:](v4, "setIsCacheHitFromDisk:", [v3 sourceOfTTS] == 8);

  return v4;
}

@end