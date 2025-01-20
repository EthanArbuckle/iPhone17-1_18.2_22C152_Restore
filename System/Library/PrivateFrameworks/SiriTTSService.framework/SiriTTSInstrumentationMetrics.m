@interface SiriTTSInstrumentationMetrics
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (BOOL)isAudibleRequest;
- (BOOL)isServerTTSRacing;
- (BOOL)isWarmStart;
- (BOOL)minimizeDeviceUsage;
- (BOOL)neuralAlignmentStall;
- (BOOL)neuralAudioClick;
- (BOOL)neuralFallback;
- (BOOL)privacySensitive;
- (BOOL)synthesisQualityIssue;
- (BOOL)useHydraFrontend;
- (NSArray)encounteredIssues;
- (NSString)audioOutputRoute;
- (NSString)clientBundleIdentifier;
- (NSString)description;
- (NSString)experimentIdentifier;
- (NSString)utterance;
- (NSString)voiceAssetKey;
- (NSString)voiceResourceAssetKey;
- (SiriTTSInstrumentationMetrics)init;
- (SiriTTSInstrumentationMetrics)initWithCoder:(id)a3;
- (SiriTTSSynthesisResource)resource;
- (SiriTTSSynthesisVoice)voice;
- (double)audioDuration;
- (double)audioStartLatency;
- (double)eagerRequestGapInterval;
- (double)serverStreamedAudioDuration;
- (int64_t)deviceThermalState;
- (int64_t)errorCode;
- (int64_t)promptCount;
- (int64_t)sourceOfTTS;
- (unint64_t)requestCreatedTime;
- (unint64_t)serverFirstPacketTime;
- (unint64_t)serverLastPacketTime;
- (unint64_t)speechBeginTime;
- (unint64_t)speechEndTime;
- (unint64_t)speechEstimatedOutputBeginTime;
- (unint64_t)synthesisBeginTime;
- (unint64_t)synthesisEndTime;
- (void)encodeWithCoder:(id)a3;
- (void)setAudioDuration:(double)a3;
- (void)setAudioOutputRoute:(id)a3;
- (void)setAudioStartLatency:(double)a3;
- (void)setClientBundleIdentifier:(id)a3;
- (void)setDeviceThermalState:(int64_t)a3;
- (void)setEagerRequestGapInterval:(double)a3;
- (void)setEncounteredIssues:(id)a3;
- (void)setErrorCode:(int64_t)a3;
- (void)setExperimentIdentifier:(id)a3;
- (void)setIsAudibleRequest:(BOOL)a3;
- (void)setIsServerTTSRacing:(BOOL)a3;
- (void)setIsWarmStart:(BOOL)a3;
- (void)setMinimizeDeviceUsage:(BOOL)a3;
- (void)setNeuralAlignmentStall:(BOOL)a3;
- (void)setNeuralAudioClick:(BOOL)a3;
- (void)setNeuralFallback:(BOOL)a3;
- (void)setPrivacySensitive:(BOOL)a3;
- (void)setPromptCount:(int64_t)a3;
- (void)setRequestCreatedTime:(unint64_t)a3;
- (void)setResource:(id)a3;
- (void)setServerFirstPacketTime:(unint64_t)a3;
- (void)setServerLastPacketTime:(unint64_t)a3;
- (void)setServerStreamedAudioDuration:(double)a3;
- (void)setSourceOfTTS:(int64_t)a3;
- (void)setSpeechBeginTime:(unint64_t)a3;
- (void)setSpeechEndTime:(unint64_t)a3;
- (void)setSpeechEstimatedOutputBeginTime:(unint64_t)a3;
- (void)setSynthesisBeginTime:(unint64_t)a3;
- (void)setSynthesisEndTime:(unint64_t)a3;
- (void)setSynthesisQualityIssue:(BOOL)a3;
- (void)setUseHydraFrontend:(BOOL)a3;
- (void)setUtterance:(id)a3;
- (void)setVoice:(id)a3;
@end

@implementation SiriTTSInstrumentationMetrics

- (NSString)utterance
{
  return (NSString *)sub_19CE88280((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_19CE87F0C);
}

- (void)setUtterance:(id)a3
{
}

- (SiriTTSSynthesisVoice)voice
{
  v2 = sub_19CE87FB8();
  return (SiriTTSSynthesisVoice *)v2;
}

- (void)setVoice:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_19CE88050(a3);
}

- (SiriTTSSynthesisResource)resource
{
  v2 = sub_19CE88108();
  return (SiriTTSSynthesisResource *)v2;
}

- (void)setResource:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_19CE881A0(a3);
}

- (NSString)audioOutputRoute
{
  return (NSString *)sub_19CE88280((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_19CE882DC);
}

- (void)setAudioOutputRoute:(id)a3
{
}

- (NSString)clientBundleIdentifier
{
  return (NSString *)sub_19CE88280((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_19CE88438);
}

- (void)setClientBundleIdentifier:(id)a3
{
}

- (NSString)experimentIdentifier
{
  return (NSString *)sub_19CE88280((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_19CE884C8);
}

- (void)setExperimentIdentifier:(id)a3
{
}

- (unint64_t)requestCreatedTime
{
  return sub_19CE88564();
}

- (void)setRequestCreatedTime:(unint64_t)a3
{
}

- (double)eagerRequestGapInterval
{
  return sub_19CE8866C();
}

- (void)setEagerRequestGapInterval:(double)a3
{
}

- (unint64_t)synthesisBeginTime
{
  return sub_19CE8877C();
}

- (void)setSynthesisBeginTime:(unint64_t)a3
{
}

- (unint64_t)synthesisEndTime
{
  return sub_19CE88884();
}

- (void)setSynthesisEndTime:(unint64_t)a3
{
}

- (unint64_t)speechBeginTime
{
  return sub_19CE8898C();
}

- (void)setSpeechBeginTime:(unint64_t)a3
{
}

- (unint64_t)speechEndTime
{
  return sub_19CE88A94();
}

- (void)setSpeechEndTime:(unint64_t)a3
{
}

- (unint64_t)speechEstimatedOutputBeginTime
{
  return sub_19CE88B9C();
}

- (void)setSpeechEstimatedOutputBeginTime:(unint64_t)a3
{
}

- (double)audioStartLatency
{
  return sub_19CE88CA4();
}

- (void)setAudioStartLatency:(double)a3
{
}

- (unint64_t)serverFirstPacketTime
{
  return sub_19CE88DB4();
}

- (void)setServerFirstPacketTime:(unint64_t)a3
{
}

- (unint64_t)serverLastPacketTime
{
  return sub_19CE88EBC();
}

- (void)setServerLastPacketTime:(unint64_t)a3
{
}

- (double)serverStreamedAudioDuration
{
  return sub_19CE88FC4();
}

- (void)setServerStreamedAudioDuration:(double)a3
{
}

- (double)audioDuration
{
  return sub_19CE890D4();
}

- (void)setAudioDuration:(double)a3
{
}

- (BOOL)isWarmStart
{
  return sub_19CE891E8() & 1;
}

- (void)setIsWarmStart:(BOOL)a3
{
}

- (int64_t)sourceOfTTS
{
  return sub_19CE89334();
}

- (void)setSourceOfTTS:(int64_t)a3
{
}

- (BOOL)privacySensitive
{
  return sub_19CE89440() & 1;
}

- (void)setPrivacySensitive:(BOOL)a3
{
}

- (BOOL)minimizeDeviceUsage
{
  return sub_19CE8954C() & 1;
}

- (void)setMinimizeDeviceUsage:(BOOL)a3
{
}

- (int64_t)errorCode
{
  return sub_19CE89654();
}

- (void)setErrorCode:(int64_t)a3
{
}

- (NSArray)encounteredIssues
{
  sub_19CE8978C();
  v2 = (void *)sub_19CED5530();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setEncounteredIssues:(id)a3
{
  uint64_t v4 = sub_19CED5550();
  id v5 = self;
  sub_19CE8982C(v4);
}

- (BOOL)isServerTTSRacing
{
  return sub_19CE89910() & 1;
}

- (void)setIsServerTTSRacing:(BOOL)a3
{
}

- (int64_t)promptCount
{
  return sub_19CE89A18();
}

- (void)setPromptCount:(int64_t)a3
{
}

- (BOOL)neuralAlignmentStall
{
  return sub_19CE89B24() & 1;
}

- (void)setNeuralAlignmentStall:(BOOL)a3
{
}

- (BOOL)neuralAudioClick
{
  return sub_19CE89C30() & 1;
}

- (void)setNeuralAudioClick:(BOOL)a3
{
}

- (BOOL)synthesisQualityIssue
{
  return sub_19CE89D3C() & 1;
}

- (void)setSynthesisQualityIssue:(BOOL)a3
{
}

- (BOOL)useHydraFrontend
{
  return sub_19CE89E48() & 1;
}

- (void)setUseHydraFrontend:(BOOL)a3
{
}

- (BOOL)neuralFallback
{
  return sub_19CE89F54() & 1;
}

- (void)setNeuralFallback:(BOOL)a3
{
}

- (BOOL)isAudibleRequest
{
  return sub_19CE8A060() & 1;
}

- (void)setIsAudibleRequest:(BOOL)a3
{
}

- (int64_t)deviceThermalState
{
  return sub_19CE8A168();
}

- (void)setDeviceThermalState:(int64_t)a3
{
}

- (SiriTTSInstrumentationMetrics)init
{
  return (SiriTTSInstrumentationMetrics *)InstrumentationMetrics.init()();
}

+ (BOOL)supportsSecureCoding
{
  return static InstrumentationMetrics.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_19CE8A534();
}

- (SiriTTSInstrumentationMetrics)initWithCoder:(id)a3
{
  id v3 = a3;
  InstrumentationMetrics.init(coder:)();
  return result;
}

- (NSString)description
{
  return (NSString *)sub_19CE8DBF8(self, (uint64_t)a2, sub_19CE8BA64);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  OUTLINED_FUNCTION_139();
  OUTLINED_FUNCTION_139();
  OUTLINED_FUNCTION_139();
  swift_bridgeObjectRelease();
}

- (NSString)voiceAssetKey
{
  return (NSString *)sub_19CE8C568(self, (uint64_t)a2, (void (*)(void))InstrumentationMetrics.voiceAssetKey.getter);
}

- (NSString)voiceResourceAssetKey
{
  return (NSString *)sub_19CE8C568(self, (uint64_t)a2, (void (*)(void))InstrumentationMetrics.voiceResourceAssetKey.getter);
}

@end