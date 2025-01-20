@interface PLModelingUtilities
+ (BOOL)alsCurveHigherThanDefault;
+ (BOOL)carrierBuild;
+ (BOOL)hasAOD;
+ (BOOL)internalBuild;
+ (BOOL)isARMMac;
+ (BOOL)isAppleTV;
+ (BOOL)isAppleVision;
+ (BOOL)isHeySiriAlwaysOn;
+ (BOOL)isHomePod;
+ (BOOL)isLowPowerModeSupported;
+ (BOOL)isMac;
+ (BOOL)isNarrowScreen;
+ (BOOL)isPercentageSupported;
+ (BOOL)isTVOS;
+ (BOOL)isWatch;
+ (BOOL)isiPad;
+ (BOOL)isiPhone;
+ (BOOL)isiPod;
+ (BOOL)shouldShowBatteryGraphs;
+ (BOOL)supportsSlowCharging;
+ (double)defaultBatteryEnergyCapacity;
+ (double)duetDiscretionaryBudget;
+ (double)getDefaultL0bThresholdForDeviceType;
+ (double)networkingEnergyWithBytes:(int)a3 withDuration:(double)a4;
+ (id)valueForMobileGestaltCapability:(id)a3;
@end

@implementation PLModelingUtilities

+ (BOOL)supportsSlowCharging
{
  char v2 = _os_feature_enabled_impl();
  return v2 & +[PLModelingUtilities isiPhone];
}

+ (BOOL)isiPhone
{
  if (isiPhone_once != -1) {
    dispatch_once(&isiPhone_once, &__block_literal_global_25);
  }
  return isiPhone_isiPhone_0;
}

+ (double)duetDiscretionaryBudget
{
  if (+[PLModelingUtilities isiPhone]) {
    return 280.0;
  }
  if (MGIsDeviceOneOfType())
  {
    uint64_t v3 = 0x4064000000000000;
    return *(double *)&v3;
  }
  if (MGIsDeviceOneOfType()) {
    goto LABEL_6;
  }
  if ((MGIsDeviceOneOfType() & 1) != 0
    || (MGIsDeviceOneOfType() & 1) != 0
    || (MGIsDeviceOneOfType() & 1) != 0
    || (MGIsDeviceOneOfType() & 1) != 0)
  {
    uint64_t v3 = 0x4054000000000000;
    return *(double *)&v3;
  }
  if (MGIsDeviceOneOfType())
  {
LABEL_6:
    uint64_t v3 = 0x404E000000000000;
    return *(double *)&v3;
  }
  if (MGIsDeviceOneOfType()) {
    return 110.0;
  }
  double v2 = 135.0;
  if ((MGIsDeviceOneOfType() & 1) == 0
    && (MGIsDeviceOneOfType() & 1) == 0
    && (MGIsDeviceOneOfType() & 1) == 0
    && (MGIsDeviceOneOfType() & 1) == 0
    && (MGIsDeviceOneOfType() & 1) == 0)
  {
    LODWORD(v9) = -1509831889;
    if ((MGIsDeviceOneOfType() & 1) == 0)
    {
      double v2 = 210.0;
      if ((MGIsDeviceOneOfType() & 1) == 0 && (MGIsDeviceOneOfType() & 1) == 0)
      {
        double v5 = 0.05;
        if (+[PLModelingUtilities isiPad])
        {
          double v6 = 0.01;
        }
        else
        {
          double v6 = 0.05;
        }
        BOOL v7 = +[PLModelingUtilities isWatch];
        if (!+[PLModelingUtilities isMac] && !v7) {
          double v5 = v6;
        }
        +[PLModelingUtilities defaultBatteryEnergyCapacity];
        return v5 * v8;
      }
    }
  }
  return v2;
}

+ (id)valueForMobileGestaltCapability:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__PLModelingUtilities_valueForMobileGestaltCapability___block_invoke;
  block[3] = &unk_1E62538C8;
  id v9 = v3;
  uint64_t v4 = valueForMobileGestaltCapability__once;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&valueForMobileGestaltCapability__once, block);
  }
  id v6 = (id)valueForMobileGestaltCapability__gestaltValue;

  return v6;
}

void __55__PLModelingUtilities_valueForMobileGestaltCapability___block_invoke()
{
  uint64_t v0 = MGCopyAnswerWithError();
  v1 = (void *)valueForMobileGestaltCapability__gestaltValue;
  valueForMobileGestaltCapability__gestaltValue = v0;
}

+ (BOOL)isiPad
{
  if (isiPad_once != -1) {
    dispatch_once(&isiPad_once, &__block_literal_global_25);
  }
  return isiPad_isiPad_0;
}

void __29__PLModelingUtilities_isiPad__block_invoke()
{
  id v0 = +[PLModelingUtilities valueForMobileGestaltCapability:@"DeviceClass"];
  isiPad_isiPad_0 = [v0 isEqualToString:@"iPad"];
}

void __31__PLModelingUtilities_isiPhone__block_invoke()
{
  id v0 = +[PLModelingUtilities valueForMobileGestaltCapability:@"DeviceClass"];
  isiPhone_isiPhone_0 = [v0 isEqualToString:@"iPhone"];
}

+ (BOOL)isiPod
{
  if (isiPod_once != -1) {
    dispatch_once(&isiPod_once, &__block_literal_global_30);
  }
  return isiPod_isiPod_0;
}

void __29__PLModelingUtilities_isiPod__block_invoke()
{
  id v0 = +[PLModelingUtilities valueForMobileGestaltCapability:@"DeviceClass"];
  isiPod_isiPod_0 = [v0 isEqualToString:@"iPod"];
}

+ (BOOL)isWatch
{
  if (isWatch_once != -1) {
    dispatch_once(&isWatch_once, &__block_literal_global_35);
  }
  return isWatch_isWatch_0;
}

void __30__PLModelingUtilities_isWatch__block_invoke()
{
  id v0 = +[PLModelingUtilities valueForMobileGestaltCapability:@"DeviceClass"];
  isWatch_isWatch_0 = [v0 isEqualToString:@"Watch"];
}

+ (BOOL)isMac
{
  return 0;
}

+ (BOOL)isARMMac
{
  return 0;
}

+ (BOOL)isTVOS
{
  return 0;
}

+ (BOOL)isHomePod
{
  return 0;
}

+ (BOOL)isAppleTV
{
  if (isAppleTV_once != -1) {
    dispatch_once(&isAppleTV_once, &__block_literal_global_40_0);
  }
  return isAppleTV_isAppleTV_0;
}

void __32__PLModelingUtilities_isAppleTV__block_invoke()
{
  id v0 = +[PLModelingUtilities valueForMobileGestaltCapability:@"DeviceClass"];
  isAppleTV_isAppleTV_0 = [v0 isEqualToString:@"AppleTV"];
}

+ (BOOL)isAppleVision
{
  return 0;
}

+ (BOOL)shouldShowBatteryGraphs
{
  return MGIsDeviceOneOfType() ^ 1;
}

+ (double)defaultBatteryEnergyCapacity
{
  if (MGIsDeviceOneOfType()) {
    return 7449.0;
  }
  if (MGIsDeviceOneOfType()) {
    return 11080.0;
  }
  if (MGIsDeviceOneOfType()) {
    return 6176.0;
  }
  if (MGIsDeviceOneOfType()) {
    return 10480.0;
  }
  if (MGIsDeviceOneOfType()) {
    return 6484.0;
  }
  if (MGIsDeviceOneOfType()) {
    return 11100.0;
  }
  if (MGIsDeviceOneOfType()) {
    return 6870.0;
  }
  if (MGIsDeviceOneOfType()) {
    return 5608.6;
  }
  if (MGIsDeviceOneOfType()) {
    return 5427.2;
  }
  if (MGIsDeviceOneOfType()) {
    return 5173.9;
  }
  if (MGIsDeviceOneOfType()) {
    return 26700.0;
  }
  if (MGIsDeviceOneOfType()) {
    return 38500.0;
  }
  if (MGIsDeviceOneOfType()) {
    return 19120.0;
  }
  if (MGIsDeviceOneOfType()) {
    return 23120.0;
  }
  if (MGIsDeviceOneOfType()) {
    return 27900.0;
  }
  if (MGIsDeviceOneOfType()) {
    return 31590.0;
  }
  if (MGIsDeviceOneOfType()) {
    return 42500.0;
  }
  if (MGIsDeviceOneOfType()) {
    return 31590.0;
  }
  double v3 = 28570.0;
  if (MGIsDeviceOneOfType()) {
    return v3;
  }
  if (MGIsDeviceOneOfType()) {
    return 36210.0;
  }
  if (MGIsDeviceOneOfType()) {
    return 28370.0;
  }
  if (MGIsDeviceOneOfType()) {
    return 36636.0;
  }
  double v4 = 19020.0;
  if (MGIsDeviceOneOfType()) {
    return v4;
  }
  if (MGIsDeviceOneOfType()) {
    return 29620.0;
  }
  char v5 = MGIsDeviceOneOfType();
  double result = 31590.0;
  if ((v5 & 1) == 0)
  {
    char v6 = MGIsDeviceOneOfType();
    double result = 28570.0;
    if ((v6 & 1) == 0)
    {
      double v3 = 28650.0;
      if (MGIsDeviceOneOfType()) {
        return v3;
      }
      if (MGIsDeviceOneOfType())
      {
        return 28760.0;
      }
      else if (MGIsDeviceOneOfType())
      {
        return 41160.0;
      }
      else
      {
        char v7 = MGIsDeviceOneOfType();
        double result = 28650.0;
        if ((v7 & 1) == 0)
        {
          char v8 = MGIsDeviceOneOfType();
          double result = 19020.0;
          if ((v8 & 1) == 0)
          {
            if (MGIsDeviceOneOfType())
            {
              return 28990.0;
            }
            else if (MGIsDeviceOneOfType())
            {
              return 36730.0;
            }
            else if (MGIsDeviceOneOfType())
            {
              return 3975.0;
            }
            else if (MGIsDeviceOneOfType())
            {
              return 10030.0;
            }
            else if (MGIsDeviceOneOfType())
            {
              return 12060.0;
            }
            else if (MGIsDeviceOneOfType())
            {
              return 11160.0;
            }
            else if (MGIsDeviceOneOfType())
            {
              return 11920.0;
            }
            else if (MGIsDeviceOneOfType())
            {
              return 11750.0;
            }
            else if (MGIsDeviceOneOfType())
            {
              return 15100.0;
            }
            else if (MGIsDeviceOneOfType())
            {
              return 6960.0;
            }
            else if (MGIsDeviceOneOfType())
            {
              return 8670.0;
            }
            else
            {
              double v4 = 10960.0;
              if (MGIsDeviceOneOfType()) {
                return v4;
              }
              char v9 = MGIsDeviceOneOfType();
              double result = 10960.0;
              if ((v9 & 1) == 0)
              {
                if (MGIsDeviceOneOfType())
                {
                  return 14620.0;
                }
                else if (MGIsDeviceOneOfType())
                {
                  return 12129.0;
                }
                else if (MGIsDeviceOneOfType())
                {
                  return 17024.0;
                }
                else if (MGIsDeviceOneOfType())
                {
                  return 9467.0;
                }
                else if (MGIsDeviceOneOfType())
                {
                  return 12563.0;
                }
                else if (MGIsDeviceOneOfType())
                {
                  return 7909.0;
                }
                else if (MGIsDeviceOneOfType())
                {
                  return 12823.0;
                }
                else if (MGIsDeviceOneOfType())
                {
                  return 16872.0;
                }
                else if (MGIsDeviceOneOfType())
                {
                  return 12449.0;
                }
                else if (MGIsDeviceOneOfType())
                {
                  return 17070.0;
                }
                else if (MGIsDeviceOneOfType())
                {
                  return 12872.0;
                }
                else if (MGIsDeviceOneOfType())
                {
                  return 17305.0;
                }
                else if (MGIsDeviceOneOfType())
                {
                  return 13162.0;
                }
                else if (MGIsDeviceOneOfType())
                {
                  return 17181.0;
                }
                else if (MGIsDeviceOneOfType())
                {
                  return 14052.0;
                }
                else if (MGIsDeviceOneOfType())
                {
                  return 18260.0;
                }
                else if (MGIsDeviceOneOfType())
                {
                  return 14006.0;
                }
                else if (MGIsDeviceOneOfType())
                {
                  return 18089.0;
                }
                else
                {
                  BOOL v10 = +[PLModelingUtilities isiPad];
                  double result = 7000.0;
                  if (v10) {
                    return 19120.0;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

+ (BOOL)internalBuild
{
  if (internalBuild_onceToken_0 != -1) {
    dispatch_once(&internalBuild_onceToken_0, &__block_literal_global_156);
  }
  return internalBuild_result_0;
}

uint64_t __36__PLModelingUtilities_internalBuild__block_invoke()
{
  uint64_t result = os_variant_has_internal_diagnostics();
  internalBuild_result_0 = result;
  return result;
}

+ (BOOL)carrierBuild
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__PLModelingUtilities_carrierBuild__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (carrierBuild_onceToken_0 != -1) {
    dispatch_once(&carrierBuild_onceToken_0, block);
  }
  return carrierBuild_carrierBuild_0;
}

void __35__PLModelingUtilities_carrierBuild__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) internalBuild])
  {
    carrierBuild_carrierBuild_0 = 0;
  }
  else
  {
    CFBooleanRef v1 = (const __CFBoolean *)MGCopyAnswer();
    carrierBuild_carrierBuild_0 = CFBooleanGetValue(v1) != 0;
    CFRelease(v1);
  }
}

+ (double)getDefaultL0bThresholdForDeviceType
{
  if (MGIsDeviceOneOfType()) {
    return 110.4;
  }
  if (MGIsDeviceOneOfType()) {
    return 132.25;
  }
  int v3 = MGIsDeviceOneOfType();
  double result = 115.0;
  if (v3) {
    return 155.25;
  }
  return result;
}

+ (BOOL)alsCurveHigherThanDefault
{
  +[PLModelingUtilities getDefaultL0bThresholdForDeviceType];
  double v3 = v2;
  double v4 = (void *)CFPreferencesCopyValue(@"BKALSUserPreferences", @"com.apple.backboardd", @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3E0]);
  char v5 = v4;
  if (v4)
  {
    char v6 = [v4 objectForKeyedSubscript:@"L0b"];
    char v7 = v6;
    if (v6)
    {
      [v6 doubleValue];
      BOOL v9 = v8 > v3;
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

+ (double)networkingEnergyWithBytes:(int)a3 withDuration:(double)a4
{
  return 0.0;
}

+ (BOOL)isPercentageSupported
{
  return 1;
}

+ (BOOL)isLowPowerModeSupported
{
  if (isLowPowerModeSupported_onceToken != -1) {
    dispatch_once(&isLowPowerModeSupported_onceToken, &__block_literal_global_196);
  }
  return isLowPowerModeSupported__retValue;
}

void __46__PLModelingUtilities_isLowPowerModeSupported__block_invoke()
{
  CFStringRef v0 = (const __CFString *)MGCopyAnswer();
  CFStringRef v1 = v0;
  if (!v0) {
    isLowPowerModeSupported__retValue = 0;
  }
  isLowPowerModeSupported__retValue = CFEqual(v0, @"iPhone");
  if (_os_feature_enabled_impl())
  {
    BOOL v2 = +[PLModelingUtilities isiPad]
      || +[PLModelingUtilities isiPod];
    isLowPowerModeSupported__retValue |= v2;
  }
  CFRelease(v1);
}

+ (BOOL)isNarrowScreen
{
  if (isNarrowScreen_onceToken != -1) {
    dispatch_once(&isNarrowScreen_onceToken, &__block_literal_global_203);
  }
  return isNarrowScreen__retValue;
}

uint64_t __37__PLModelingUtilities_isNarrowScreen__block_invoke()
{
  uint64_t result = MGIsDeviceOneOfType();
  if (result) {
    isNarrowScreen__retValue = 1;
  }
  return result;
}

+ (BOOL)isHeySiriAlwaysOn
{
  if (isHeySiriAlwaysOn_onceToken != -1) {
    dispatch_once(&isHeySiriAlwaysOn_onceToken, &__block_literal_global_213);
  }
  return isHeySiriAlwaysOn__retValue;
}

uint64_t __40__PLModelingUtilities_isHeySiriAlwaysOn__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  isHeySiriAlwaysOn__retValue = result;
  return result;
}

+ (BOOL)hasAOD
{
  if (hasAOD_onceToken_0 != -1) {
    dispatch_once(&hasAOD_onceToken_0, &__block_literal_global_218_0);
  }
  return hasAOD_result_0;
}

uint64_t __29__PLModelingUtilities_hasAOD__block_invoke()
{
  uint64_t result = +[PLModelingUtilities isiPhone];
  if (result) {
    uint64_t result = MGGetBoolAnswer();
  }
  hasAOD_result_0 = result;
  return result;
}

@end