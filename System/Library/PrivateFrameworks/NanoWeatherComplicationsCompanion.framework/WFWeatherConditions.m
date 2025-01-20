@interface WFWeatherConditions
@end

@implementation WFWeatherConditions

void __80__WFWeatherConditions_NWMLocalizedWind___localizedWindspeed_withUnit_forLocale___block_invoke()
{
  id v2 = [MEMORY[0x263F08708] decimalDigitCharacterSet];
  uint64_t v0 = [v2 invertedSet];
  v1 = (void *)_localizedWindspeed_withUnit_forLocale__NonDecimalDigitCharacterSet;
  _localizedWindspeed_withUnit_forLocale__NonDecimalDigitCharacterSet = v0;
}

uint64_t __62__WFWeatherConditions_NWCPrecipitation__isTypeOfPrecipitation__block_invoke()
{
  objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", &unk_26EEA8450, &unk_26EEA8468, &unk_26EEA8480, &unk_26EEA8498, &unk_26EEA84B0, &unk_26EEA84C8, &unk_26EEA84E0, &unk_26EEA84F8, &unk_26EEA8510, &unk_26EEA8528, &unk_26EEA8540, &unk_26EEA8558, &unk_26EEA8570, &unk_26EEA8588, &unk_26EEA85A0, &unk_26EEA85B8, &unk_26EEA85D0,
    &unk_26EEA85E8,
    &unk_26EEA8600,
    &unk_26EEA8618,
    &unk_26EEA8630,
    &unk_26EEA8648,
    &unk_26EEA8660,
    &unk_26EEA8678,
    &unk_26EEA8690,
    &unk_26EEA86A8,
    &unk_26EEA86C0,
    &unk_26EEA86D8,
  isTypeOfPrecipitation_PrecipitationConditions = 0);

  return MEMORY[0x270F9A758]();
}

@end