@interface SMTRequestContextDataMutating
- (BOOL)isDeviceLocked;
- (BOOL)isDeviceShowingLockScreen;
- (BOOL)isEyesFree;
- (BOOL)isInAmbient;
- (BOOL)isLiveActivitiesSupported;
- (BOOL)isSystemApertureEnabled;
- (BOOL)isTextToSpeechEnabled;
- (BOOL)isTriggerlessFollowup;
- (BOOL)isVoiceTriggerEnabled;
- (NSArray)bargeInModes;
- (NSArray)deviceRestrictions;
- (NSDateInterval)approximatePreviousTTSInterval;
- (NSDictionary)voiceTriggerEventInfo;
- (NSString)audioDestination;
- (NSString)audioSource;
- (NSString)responseMode;
- (unsigned)voiceAudioSessionId;
- (void)setApproximatePreviousTTSInterval:(id)a3;
- (void)setAudioDestination:(id)a3;
- (void)setAudioSource:(id)a3;
- (void)setBargeInModes:(id)a3;
- (void)setDeviceRestrictions:(id)a3;
- (void)setIsDeviceLocked:(BOOL)a3;
- (void)setIsDeviceShowingLockScreen:(BOOL)a3;
- (void)setIsEyesFree:(BOOL)a3;
- (void)setIsInAmbient:(BOOL)a3;
- (void)setIsLiveActivitiesSupported:(BOOL)a3;
- (void)setIsSystemApertureEnabled:(BOOL)a3;
- (void)setIsTextToSpeechEnabled:(BOOL)a3;
- (void)setIsTriggerlessFollowup:(BOOL)a3;
- (void)setIsVoiceTriggerEnabled:(BOOL)a3;
- (void)setResponseMode:(id)a3;
- (void)setVoiceAudioSessionId:(unsigned int)a3;
- (void)setVoiceTriggerEventInfo:(id)a3;
@end

@implementation SMTRequestContextDataMutating

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceTriggerEventInfo, 0);
  objc_storeStrong((id *)&self->_deviceRestrictions, 0);
  objc_storeStrong((id *)&self->_approximatePreviousTTSInterval, 0);
  objc_storeStrong((id *)&self->_bargeInModes, 0);
  objc_storeStrong((id *)&self->_responseMode, 0);
  objc_storeStrong((id *)&self->_audioDestination, 0);
  objc_storeStrong((id *)&self->_audioSource, 0);
}

- (void)setIsDeviceLocked:(BOOL)a3
{
  self->_isDeviceLocked = a3;
}

- (BOOL)isDeviceLocked
{
  return self->_isDeviceLocked;
}

- (void)setIsDeviceShowingLockScreen:(BOOL)a3
{
  self->_isDeviceShowingLockScreen = a3;
}

- (BOOL)isDeviceShowingLockScreen
{
  return self->_isDeviceShowingLockScreen;
}

- (void)setIsLiveActivitiesSupported:(BOOL)a3
{
  self->_isLiveActivitiesSupported = a3;
}

- (BOOL)isLiveActivitiesSupported
{
  return self->_isLiveActivitiesSupported;
}

- (void)setIsInAmbient:(BOOL)a3
{
  self->_isInAmbient = a3;
}

- (BOOL)isInAmbient
{
  return self->_isInAmbient;
}

- (void)setIsSystemApertureEnabled:(BOOL)a3
{
  self->_isSystemApertureEnabled = a3;
}

- (BOOL)isSystemApertureEnabled
{
  return self->_isSystemApertureEnabled;
}

- (void)setVoiceAudioSessionId:(unsigned int)a3
{
  self->_voiceAudioSessionId = a3;
}

- (unsigned)voiceAudioSessionId
{
  return self->_voiceAudioSessionId;
}

- (void)setVoiceTriggerEventInfo:(id)a3
{
}

- (NSDictionary)voiceTriggerEventInfo
{
  return self->_voiceTriggerEventInfo;
}

- (void)setDeviceRestrictions:(id)a3
{
}

- (NSArray)deviceRestrictions
{
  return self->_deviceRestrictions;
}

- (void)setApproximatePreviousTTSInterval:(id)a3
{
}

- (NSDateInterval)approximatePreviousTTSInterval
{
  return self->_approximatePreviousTTSInterval;
}

- (void)setBargeInModes:(id)a3
{
}

- (NSArray)bargeInModes
{
  return self->_bargeInModes;
}

- (void)setIsTriggerlessFollowup:(BOOL)a3
{
  self->_isTriggerlessFollowup = a3;
}

- (BOOL)isTriggerlessFollowup
{
  return self->_isTriggerlessFollowup;
}

- (void)setIsTextToSpeechEnabled:(BOOL)a3
{
  self->_isTextToSpeechEnabled = a3;
}

- (BOOL)isTextToSpeechEnabled
{
  return self->_isTextToSpeechEnabled;
}

- (void)setIsVoiceTriggerEnabled:(BOOL)a3
{
  self->_isVoiceTriggerEnabled = a3;
}

- (BOOL)isVoiceTriggerEnabled
{
  return self->_isVoiceTriggerEnabled;
}

- (void)setIsEyesFree:(BOOL)a3
{
  self->_isEyesFree = a3;
}

- (BOOL)isEyesFree
{
  return self->_isEyesFree;
}

- (void)setResponseMode:(id)a3
{
}

- (NSString)responseMode
{
  return self->_responseMode;
}

- (void)setAudioDestination:(id)a3
{
}

- (NSString)audioDestination
{
  return self->_audioDestination;
}

- (void)setAudioSource:(id)a3
{
}

- (NSString)audioSource
{
  return self->_audioSource;
}

@end