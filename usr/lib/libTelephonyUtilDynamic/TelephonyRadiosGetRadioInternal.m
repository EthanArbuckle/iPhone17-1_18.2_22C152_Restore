@interface TelephonyRadiosGetRadioInternal
@end

@implementation TelephonyRadiosGetRadioInternal

uint64_t ___TelephonyRadiosGetRadioInternal_block_invoke()
{
  if (TelephonyCapabilitiesGetHardwareModel_sOnce != -1) {
    dispatch_once(&TelephonyCapabilitiesGetHardwareModel_sOnce, &__block_literal_global_5);
  }

  return _TelephonyRadiosDetermineRadio((uint64_t)&sTelephonyCapabilitiesHardwareModelInfo);
}

@end