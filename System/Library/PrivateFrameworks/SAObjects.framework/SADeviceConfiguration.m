@interface SADeviceConfiguration
+ (id)deviceConfiguration;
- (BOOL)hasAudioSessionActivationDelay;
- (BOOL)requiresResponse;
- (double)audioSessionActivationDelay;
- (double)audioSessionActivationDelayAboveMediaPlaybackVolumeThreshold;
- (double)initialInterstitialDelay;
- (double)initialInterstitialDelayForCarPlay;
- (double)initialInterstitialDelayForVoiceTriggerOneShotWithoutAudioDucking;
- (double)mediaPlaybackVolumeThresholdForAudioSessionActivationDelay;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAudioSessionActivationDelay:(double)a3;
- (void)setAudioSessionActivationDelayAboveMediaPlaybackVolumeThreshold:(double)a3;
- (void)setHasAudioSessionActivationDelay:(BOOL)a3;
- (void)setInitialInterstitialDelay:(double)a3;
- (void)setInitialInterstitialDelayForCarPlay:(double)a3;
- (void)setInitialInterstitialDelayForVoiceTriggerOneShotWithoutAudioDucking:(double)a3;
- (void)setMediaPlaybackVolumeThresholdForAudioSessionActivationDelay:(double)a3;
@end

@implementation SADeviceConfiguration

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"DeviceConfiguration";
}

+ (id)deviceConfiguration
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (double)audioSessionActivationDelay
{
  return AceObjectDoubleForProperty(self, @"audioSessionActivationDelay");
}

- (void)setAudioSessionActivationDelay:(double)a3
{
}

- (double)audioSessionActivationDelayAboveMediaPlaybackVolumeThreshold
{
  return AceObjectDoubleForProperty(self, @"audioSessionActivationDelayAboveMediaPlaybackVolumeThreshold");
}

- (void)setAudioSessionActivationDelayAboveMediaPlaybackVolumeThreshold:(double)a3
{
}

- (BOOL)hasAudioSessionActivationDelay
{
  return AceObjectBoolForProperty(self, @"hasAudioSessionActivationDelay");
}

- (void)setHasAudioSessionActivationDelay:(BOOL)a3
{
}

- (double)initialInterstitialDelay
{
  return AceObjectDoubleForProperty(self, @"initialInterstitialDelay");
}

- (void)setInitialInterstitialDelay:(double)a3
{
}

- (double)initialInterstitialDelayForCarPlay
{
  return AceObjectDoubleForProperty(self, @"initialInterstitialDelayForCarPlay");
}

- (void)setInitialInterstitialDelayForCarPlay:(double)a3
{
}

- (double)initialInterstitialDelayForVoiceTriggerOneShotWithoutAudioDucking
{
  return AceObjectDoubleForProperty(self, @"initialInterstitialDelayForVoiceTriggerOneShotWithoutAudioDucking");
}

- (void)setInitialInterstitialDelayForVoiceTriggerOneShotWithoutAudioDucking:(double)a3
{
}

- (double)mediaPlaybackVolumeThresholdForAudioSessionActivationDelay
{
  return AceObjectDoubleForProperty(self, @"mediaPlaybackVolumeThresholdForAudioSessionActivationDelay");
}

- (void)setMediaPlaybackVolumeThresholdForAudioSessionActivationDelay:(double)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end