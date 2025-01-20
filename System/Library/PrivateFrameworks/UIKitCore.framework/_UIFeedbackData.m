@interface _UIFeedbackData
- (BKSHIDHapticFeedbackRequest)hidRequest;
- (BOOL)canReuseCoreHapticsPlayer;
- (BOOL)disableEventUseVolumeEnvelope;
- (BOOL)isTransientHaptic;
- (CHHapticPattern)pattern;
- (NSURL)fileURL;
- (_UIFeedbackParameters)audioParameters;
- (_UIFeedbackParameters)hapticParameters;
- (double)effectiveDelay;
- (double)effectiveDuration;
- (float)intensity;
- (float)sharpness;
- (unint64_t)effectiveEnabledFeedbackTypes;
- (unint64_t)effectiveEventType;
- (unint64_t)fileFeedbackType;
- (unsigned)effectiveSystemSoundID;
- (void)_setAudioParameters:(id)a3;
- (void)_setCanReuseCoreHapticsPlayer:(BOOL)a3;
- (void)_setDisableEventUseVolumeEnvelope:(BOOL)a3;
- (void)_setEffectiveDelay:(double)a3;
- (void)_setEffectiveDuration:(double)a3;
- (void)_setEffectiveEnabledFeedbackTypes:(unint64_t)a3;
- (void)_setEffectiveEventType:(unint64_t)a3;
- (void)_setEffectiveSystemSoundID:(unsigned int)a3;
- (void)_setFileFeedbackType:(unint64_t)a3;
- (void)_setFileURL:(id)a3;
- (void)_setHIDRequest:(id)a3;
- (void)_setHapticParameters:(id)a3;
- (void)_setIntensity:(float)a3;
- (void)_setIsTransientHaptic:(BOOL)a3;
- (void)_setPattern:(id)a3;
- (void)_setSharpness:(float)a3;
@end

@implementation _UIFeedbackData

- (void)_setHapticParameters:(id)a3
{
}

- (void)_setEffectiveSystemSoundID:(unsigned int)a3
{
  self->_effectiveSystemSoundID = a3;
}

- (void)_setEffectiveEventType:(unint64_t)a3
{
  self->_effectiveEventType = a3;
}

- (void)_setEffectiveEnabledFeedbackTypes:(unint64_t)a3
{
  self->_effectiveEnabledFeedbackTypes = a3;
}

- (void)_setEffectiveDuration:(double)a3
{
  self->_effectiveDuration = a3;
}

- (void)_setEffectiveDelay:(double)a3
{
  self->_effectiveDelay = a3;
}

- (void)_setDisableEventUseVolumeEnvelope:(BOOL)a3
{
  self->_disableEventUseVolumeEnvelope = a3;
}

- (void)_setCanReuseCoreHapticsPlayer:(BOOL)a3
{
  self->_canReuseCoreHapticsPlayer = a3;
}

- (void)_setAudioParameters:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hidRequest, 0);
  objc_storeStrong((id *)&self->_pattern, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_audioParameters, 0);
  objc_storeStrong((id *)&self->_hapticParameters, 0);
}

- (_UIFeedbackParameters)hapticParameters
{
  return self->_hapticParameters;
}

- (_UIFeedbackParameters)audioParameters
{
  return self->_audioParameters;
}

- (CHHapticPattern)pattern
{
  return self->_pattern;
}

- (BOOL)isTransientHaptic
{
  return self->_isTransientHaptic;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (unint64_t)effectiveEventType
{
  return self->_effectiveEventType;
}

- (unint64_t)effectiveEnabledFeedbackTypes
{
  return self->_effectiveEnabledFeedbackTypes;
}

- (double)effectiveDelay
{
  return self->_effectiveDelay;
}

- (BOOL)canReuseCoreHapticsPlayer
{
  return self->_canReuseCoreHapticsPlayer;
}

- (double)effectiveDuration
{
  return self->_effectiveDuration;
}

- (unsigned)effectiveSystemSoundID
{
  return self->_effectiveSystemSoundID;
}

- (void)_setFileURL:(id)a3
{
}

- (unint64_t)fileFeedbackType
{
  return self->_fileFeedbackType;
}

- (void)_setFileFeedbackType:(unint64_t)a3
{
  self->_fileFeedbackType = a3;
}

- (void)_setPattern:(id)a3
{
}

- (BKSHIDHapticFeedbackRequest)hidRequest
{
  return self->_hidRequest;
}

- (void)_setHIDRequest:(id)a3
{
}

- (void)_setIsTransientHaptic:(BOOL)a3
{
  self->_isTransientHaptic = a3;
}

- (float)intensity
{
  return self->_intensity;
}

- (void)_setIntensity:(float)a3
{
  self->_intensity = a3;
}

- (float)sharpness
{
  return self->_sharpness;
}

- (void)_setSharpness:(float)a3
{
  self->_sharpness = a3;
}

- (BOOL)disableEventUseVolumeEnvelope
{
  return self->_disableEventUseVolumeEnvelope;
}

@end