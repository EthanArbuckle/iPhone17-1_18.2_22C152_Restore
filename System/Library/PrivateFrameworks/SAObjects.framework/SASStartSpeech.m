@interface SASStartSpeech
+ (id)startSpeech;
- (BOOL)clearContext;
- (BOOL)disableAutoEndpointing;
- (BOOL)enablePartialResults;
- (BOOL)requiresResponse;
- (NSDictionary)voiceTriggerEventInfo;
- (NSNumber)isCarryDevice;
- (NSNumber)motionConfidence;
- (NSNumber)noiseReductionLevel;
- (NSString)audioDestination;
- (NSString)audioSource;
- (NSString)deviceIdentifier;
- (NSString)deviceModel;
- (NSString)dspStatus;
- (NSString)headsetAddress;
- (NSString)headsetId;
- (NSString)headsetName;
- (NSString)motionActivity;
- (NSString)origin;
- (NSString)turnId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int)codec;
- (void)setAudioDestination:(id)a3;
- (void)setAudioSource:(id)a3;
- (void)setClearContext:(BOOL)a3;
- (void)setCodec:(int)a3;
- (void)setDeviceIdentifier:(id)a3;
- (void)setDeviceModel:(id)a3;
- (void)setDisableAutoEndpointing:(BOOL)a3;
- (void)setDspStatus:(id)a3;
- (void)setEnablePartialResults:(BOOL)a3;
- (void)setHeadsetAddress:(id)a3;
- (void)setHeadsetId:(id)a3;
- (void)setHeadsetName:(id)a3;
- (void)setIsCarryDevice:(id)a3;
- (void)setMotionActivity:(id)a3;
- (void)setMotionConfidence:(id)a3;
- (void)setNoiseReductionLevel:(id)a3;
- (void)setOrigin:(id)a3;
- (void)setTurnId:(id)a3;
- (void)setVoiceTriggerEventInfo:(id)a3;
@end

@implementation SASStartSpeech

- (id)groupIdentifier
{
  return @"com.apple.ace.speech";
}

- (id)encodedClassName
{
  return @"StartSpeech";
}

+ (id)startSpeech
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)origin
{
  return (NSString *)[(AceObject *)self propertyForKey:@"origin"];
}

- (void)setOrigin:(id)a3
{
}

- (NSString)audioDestination
{
  return (NSString *)[(AceObject *)self propertyForKey:@"audioDestination"];
}

- (void)setAudioDestination:(id)a3
{
}

- (NSString)audioSource
{
  return (NSString *)[(AceObject *)self propertyForKey:@"audioSource"];
}

- (void)setAudioSource:(id)a3
{
}

- (BOOL)clearContext
{
  return AceObjectBoolForProperty(self, @"clearContext");
}

- (void)setClearContext:(BOOL)a3
{
}

- (int)codec
{
  id v2 = [(AceObject *)self propertyForKey:@"codec"];
  int v3 = SASCodecForString(v2);

  return v3;
}

- (void)setCodec:(int)a3
{
  stringForSASCodec(a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  AceObjectSetCopyingObjectForProperty(self, @"codec", v4);
}

- (NSString)deviceIdentifier
{
  return (NSString *)[(AceObject *)self propertyForKey:@"deviceIdentifier"];
}

- (void)setDeviceIdentifier:(id)a3
{
}

- (NSString)deviceModel
{
  return (NSString *)[(AceObject *)self propertyForKey:@"deviceModel"];
}

- (void)setDeviceModel:(id)a3
{
}

- (BOOL)disableAutoEndpointing
{
  return AceObjectBoolForProperty(self, @"disableAutoEndpointing");
}

- (void)setDisableAutoEndpointing:(BOOL)a3
{
}

- (NSString)dspStatus
{
  return (NSString *)[(AceObject *)self propertyForKey:@"dspStatus"];
}

- (void)setDspStatus:(id)a3
{
}

- (BOOL)enablePartialResults
{
  return AceObjectBoolForProperty(self, @"enablePartialResults");
}

- (void)setEnablePartialResults:(BOOL)a3
{
}

- (NSString)headsetAddress
{
  return (NSString *)[(AceObject *)self propertyForKey:@"headsetAddress"];
}

- (void)setHeadsetAddress:(id)a3
{
}

- (NSString)headsetId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"headsetId"];
}

- (void)setHeadsetId:(id)a3
{
}

- (NSString)headsetName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"headsetName"];
}

- (void)setHeadsetName:(id)a3
{
}

- (NSNumber)isCarryDevice
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"isCarryDevice"];
}

- (void)setIsCarryDevice:(id)a3
{
}

- (NSString)motionActivity
{
  return (NSString *)[(AceObject *)self propertyForKey:@"motionActivity"];
}

- (void)setMotionActivity:(id)a3
{
}

- (NSNumber)motionConfidence
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"motionConfidence"];
}

- (void)setMotionConfidence:(id)a3
{
}

- (NSNumber)noiseReductionLevel
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"noiseReductionLevel"];
}

- (void)setNoiseReductionLevel:(id)a3
{
}

- (NSString)turnId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"turnId"];
}

- (void)setTurnId:(id)a3
{
}

- (NSDictionary)voiceTriggerEventInfo
{
  return (NSDictionary *)[(AceObject *)self propertyForKey:@"voiceTriggerEventInfo"];
}

- (void)setVoiceTriggerEventInfo:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end