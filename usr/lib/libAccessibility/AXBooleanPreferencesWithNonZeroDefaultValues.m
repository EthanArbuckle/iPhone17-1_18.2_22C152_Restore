@interface AXBooleanPreferencesWithNonZeroDefaultValues
@end

@implementation AXBooleanPreferencesWithNonZeroDefaultValues

void ___AXBooleanPreferencesWithNonZeroDefaultValues_block_invoke()
{
  v2[20] = *MEMORY[0x1E4F143B8];
  v2[0] = @"AXSAirPodsSpatialAudioLockToDevice";
  v2[1] = kAXSAttentionAwarenessFeaturesEnabledPreference;
  v2[2] = kAXSDisplayFilterShowInitialAlertPreference;
  v2[3] = kAXSEarpieceNoiseCancellationPreference;
  v2[4] = kAXSPhoneLockToEndCallPreference;
  v2[5] = kAXSHearingAidRingtoneStreamingPreference;
  v2[6] = kAXSReduceMotionAutoplayMessagesEffectsPreference;
  v2[7] = kAXSReduceMotionAutoplayAnimatedImagesPreference;
  v2[8] = kAXSLowerCaseKeyboardEnabledPreference;
  v2[9] = kAXSAppSwitcherAutoSelectPreference;
  v2[10] = kAXSSwitchControlUseExtendedKeyboardPredictionsEnabledPreference;
  v2[11] = kAXSWebAccessibilityEventsEnabledPreference;
  v2[12] = kAXSAutomaticSubtitlesShowWhenMutedPreference;
  v2[13] = kAXSAutomaticSubtitlesShowOnSkipBackPreference;
  v2[14] = kAXSPointerAllowAppCustomizationEnabledPreference;
  v2[15] = kAXSPointerInertiaEnabledPreference;
  v2[16] = kAXSPointerEffectScalingEnabledPreference;
  v2[17] = kAXSPointerAutoHideEnabledPreference;
  v2[18] = kAXSPointerScaleWithZoomLevelEnabledPreference;
  v2[19] = kAXSForceTouchEnabledPreference;
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:20];
  v1 = (void *)_AXBooleanPreferencesWithNonZeroDefaultValues_BooleanPreferencesWithNonZeroDefaultValues;
  _AXBooleanPreferencesWithNonZeroDefaultValues_BooleanPreferencesWithNonZeroDefaultValues = v0;
}

@end