@interface AXNumberPreferencesWithNonZeroDefaultValues
@end

@implementation AXNumberPreferencesWithNonZeroDefaultValues

void ___AXNumberPreferencesWithNonZeroDefaultValues_block_invoke()
{
  v3[16] = *MEMORY[0x1E4F143B8];
  v2[0] = kAXSRestingHomeButtonUnlockPreference;
  v2[1] = kAXSPreferredFontSizePreference;
  v3[0] = &unk_1EDFC0338;
  v3[1] = &unk_1EDFC04A0;
  v2[2] = kAXSVoiceOverTouchSpeakingRatePreference;
  v2[3] = kAXSVoiceOverTouchVolumePreference;
  v3[2] = &unk_1EDFC04B0;
  v3[3] = &unk_1EDFC04C0;
  v2[4] = kAXSVoiceOverTouchMediaDuckingModePreference;
  v2[5] = kAXSHoverTextTypingDisplayModePreference;
  v3[4] = &unk_1EDFC0350;
  v3[5] = &unk_1EDFC0368;
  v2[6] = kAXSHoverTextFontSizePreference;
  v2[7] = kAXSHoverTextBackgroundOpacityPreference;
  v3[6] = &unk_1EDFC04F0;
  v3[7] = &unk_1EDFC0500;
  v2[8] = kAXSForceTouchSensitivityPreference;
  v2[9] = kAXSForceTouchTimingPreference;
  v3[8] = &unk_1EDFC04D0;
  v3[9] = &unk_1EDFC0380;
  v2[10] = kAXSPointerSizeMultiplierPreference;
  v2[11] = kAXSPointerAutoHideDurationPreference;
  v3[10] = &unk_1EDFC04D0;
  v3[11] = &unk_1EDFC04E0;
  v2[12] = kAXSPointerStrokeColorWidthPreference;
  v2[13] = kAXSVoiceOverSpeakUnderPointerDelayPreference;
  v3[12] = &unk_1EDFC0510;
  v3[13] = &unk_1EDFC0520;
  v2[14] = kAXSPointerVoiceOverCursorOptionPreference;
  v2[15] = kAXSIsolatedTreeModeEnabledPreference;
  v3[14] = &unk_1EDFC0398;
  v3[15] = &unk_1EDFC0398;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:16];
  v1 = (void *)_AXNumberPreferencesWithNonZeroDefaultValues_NumberPreferencesWithNonZeroDefaultValues;
  _AXNumberPreferencesWithNonZeroDefaultValues_NumberPreferencesWithNonZeroDefaultValues = v0;
}

@end