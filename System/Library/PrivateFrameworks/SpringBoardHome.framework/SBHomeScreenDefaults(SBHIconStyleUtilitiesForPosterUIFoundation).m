@interface SBHomeScreenDefaults(SBHIconStyleUtilitiesForPosterUIFoundation)
- (id)sbh_homeScreenConfiguration;
- (void)sbh_setHomeScreenConfiguration:()SBHIconStyleUtilitiesForPosterUIFoundation;
@end

@implementation SBHomeScreenDefaults(SBHIconStyleUtilitiesForPosterUIFoundation)

- (id)sbh_homeScreenConfiguration
{
  v2 = (void *)MEMORY[0x1D9484600]();
  v3 = [a1 iconUserInterfaceStyle];
  [a1 iconUserInterfaceStyleVariation];
  double v5 = v4;
  [a1 iconUserInterfaceStyleLuminance];
  double v7 = v6;
  [a1 iconUserInterfaceStyleSaturation];
  double v9 = v8;
  uint64_t v10 = _PUIHomeScreenStyleTypeFromSBIconUserInterfaceStyleType(v3);
  v11 = (void *)[objc_alloc((Class)getPUIStylePickerHomeScreenConfigurationClass()) initWithStyleType:v10 variation:v5 luminance:v7 saturation:v9];

  return v11;
}

- (void)sbh_setHomeScreenConfiguration:()SBHIconStyleUtilitiesForPosterUIFoundation
{
  id v4 = a3;
  double v5 = _SBIconUserInterfaceStyleTypeFromPUIHomeScreenStyleType([v4 styleType]);
  [a1 setIconUserInterfaceStyle:v5];

  [v4 luminance];
  objc_msgSend(a1, "setIconUserInterfaceStyleLuminance:");
  [v4 saturation];
  objc_msgSend(a1, "setIconUserInterfaceStyleSaturation:");
  [v4 variation];
  objc_msgSend(a1, "setIconUserInterfaceStyleVariation:");
  id v6 = [v4 accentColor];

  [a1 setIconTintColor:v6];
}

@end