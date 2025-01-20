@interface WFWeatherConditions(NWMLocalizedWind)
+ (id)_defaultWindSpeedWithUnit:()NWMLocalizedWind;
+ (id)_localizedWindspeed:()NWMLocalizedWind withUnit:forLocale:;
+ (id)nwm_localizedWindpeedUnit;
+ (uint64_t)_preferredWindSpeedUnitForLocale:()NWMLocalizedWind;
- (__CFString)nwm_localizedWindDirection;
- (double)_speedByConverting:()NWMLocalizedWind toUnit:;
- (id)_localizedWindDirectionAbbreviation:()NWMLocalizedWind;
- (id)nwm_localizedWindspeedWithUnit;
- (id)nwm_localizedWindspeedWithoutUnit;
- (id)nwm_windDirectionKey;
- (uint64_t)nwm_localizedWindDirectionAbbreviation;
- (uint64_t)nwm_localizedWindDirectionAbbreviationCompact;
- (unint64_t)_indexOfWindDirectionKeyForWindDirectionInDegrees:()NWMLocalizedWind keys:;
@end

@implementation WFWeatherConditions(NWMLocalizedWind)

+ (id)nwm_localizedWindpeedUnit
{
  v2 = [MEMORY[0x263EFF960] currentLocale];
  v3 = objc_msgSend(a1, "_localizedWindspeed:withUnit:forLocale:", objc_msgSend(a1, "_preferredWindSpeedUnitForLocale:", v2), v2, 0.0);
  v4 = [v3 componentsSeparatedByString:@" "];

  v5 = [v4 lastObject];

  return v5;
}

- (uint64_t)nwm_localizedWindDirectionAbbreviation
{
  return [a1 _localizedWindDirectionAbbreviation:0];
}

- (uint64_t)nwm_localizedWindDirectionAbbreviationCompact
{
  return [a1 _localizedWindDirectionAbbreviation:1];
}

- (__CFString)nwm_localizedWindDirection
{
  uint64_t v1 = objc_msgSend(a1, "nwm_windDirectionKey");
  if (v1)
  {
    v2 = (void *)v1;
    v3 = [NSString stringWithFormat:@"%@_LONG", v1];

    NWMWindLocalizedString(v3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &stru_26EEA3A40;
  }

  return v4;
}

- (id)nwm_localizedWindspeedWithUnit
{
  v2 = [a1 objectForKeyedSubscript:*MEMORY[0x263F86078]];
  v3 = [MEMORY[0x263EFF960] currentLocale];
  uint64_t v4 = [MEMORY[0x263F85F98] _preferredWindSpeedUnitForLocale:v3];
  [v2 doubleValue];
  objc_msgSend(a1, "_speedByConverting:toUnit:", v4);
  v5 = objc_msgSend(MEMORY[0x263F85F98], "_localizedWindspeed:withUnit:forLocale:", v4, v3);

  return v5;
}

- (id)nwm_localizedWindspeedWithoutUnit
{
  uint64_t v1 = objc_msgSend(a1, "nwm_localizedWindspeedWithUnit");
  v2 = [v1 componentsSeparatedByString:@" "];
  v3 = [v2 firstObject];

  return v3;
}

- (id)nwm_windDirectionKey
{
  v2 = [a1 objectForKeyedSubscript:*MEMORY[0x263F86070]];
  if (!v2) {
    goto LABEL_5;
  }
  if (!nwm_windDirectionKey_DirectionKeys)
  {
    nwm_windDirectionKey_DirectionKeys = (uint64_t)&unk_26EEA8808;
  }
  [v2 doubleValue];
  if (v3 >= 0.0)
  {
    uint64_t v5 = objc_msgSend(a1, "_indexOfWindDirectionKeyForWindDirectionInDegrees:keys:", nwm_windDirectionKey_DirectionKeys);
    uint64_t v4 = [(id)nwm_windDirectionKey_DirectionKeys objectAtIndexedSubscript:v5];
  }
  else
  {
LABEL_5:
    uint64_t v4 = 0;
  }

  return v4;
}

+ (id)_defaultWindSpeedWithUnit:()NWMLocalizedWind
{
  v2 = NSString;
  double v3 = +[NWCCBundle bundle];
  uint64_t v4 = [v3 localizedStringForKey:@"DEFAULT_WINDSPEED_UNIT" value:&stru_26EEA3A40 table:@"Wind"];
  uint64_t v5 = [v2 stringWithFormat:@"%.0f %@", *(void *)&a1, v4];

  return v5;
}

+ (id)_localizedWindspeed:()NWMLocalizedWind withUnit:forLocale:
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  UErrorCode pErrorCode = U_ZERO_ERROR;
  v7 = [a5 localeIdentifier];
  v8 = v7;
  if (v7)
  {
    [v7 cStringUsingEncoding:4];
    uameasfmt_open();
    uameasfmt_format();
    int32_t pDestLength = 0;
    u_strToUTF8(dest, 100, &pDestLength, src, -1, &pErrorCode);
    uameasfmt_close();
    if (_localizedWindspeed_withUnit_forLocale__onceToken != -1) {
      dispatch_once(&_localizedWindspeed_withUnit_forLocale__onceToken, &__block_literal_global_3);
    }
    v9 = [NSString stringWithCString:dest encoding:4];
    v10 = [v9 componentsSeparatedByCharactersInSet:_localizedWindspeed_withUnit_forLocale__NonDecimalDigitCharacterSet];
    v11 = [v10 componentsJoinedByString:&stru_26EEA3A40];

    v12 = [v9 stringByReplacingOccurrencesOfString:v11 withString:&stru_26EEA3A40];
    v13 = [MEMORY[0x263F08708] whitespaceCharacterSet];
    v14 = [v12 stringByTrimmingCharactersInSet:v13];

    v15 = [NSString stringWithFormat:@"%@ %@", v11, v14];
  }
  else
  {
    v15 = [a1 _defaultWindSpeedWithUnit:a2];
  }

  return v15;
}

+ (uint64_t)_preferredWindSpeedUnitForLocale:()NWMLocalizedWind
{
  id v3 = a3;
  if (v3)
  {
    if (!_preferredWindSpeedUnitForLocale__MPSCountries)
    {
      uint64_t v4 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"CN", @"JP", @"KR", @"RU", @"SE", @"TW", @"NO", @"FI", @"DK", @"UA", 0);
      uint64_t v5 = (void *)_preferredWindSpeedUnitForLocale__MPSCountries;
      _preferredWindSpeedUnitForLocale__MPSCountries = v4;
    }
    v6 = [v3 objectForKey:*MEMORY[0x263EFF4D0]];
    if (v6 && ([(id)_preferredWindSpeedUnitForLocale__MPSCountries containsObject:v6] & 1) != 0)
    {
      uint64_t v7 = 2304;
    }
    else
    {
      v8 = [v3 objectForKey:*MEMORY[0x263EFF560]];
      int v9 = [v8 BOOLValue];

      v10 = [v3 localeIdentifier];
      int v11 = [@"en_GB" isEqualToString:v10];

      if ((v9 & (v11 ^ 1)) != 0) {
        uint64_t v7 = 2305;
      }
      else {
        uint64_t v7 = 2306;
      }
    }
  }
  else
  {
    uint64_t v7 = 2305;
  }

  return v7;
}

- (unint64_t)_indexOfWindDirectionKeyForWindDirectionInDegrees:()NWMLocalizedWind keys:
{
  id v5 = a4;
  unint64_t v6 = [v5 count];
  unint64_t v7 = (unint64_t)((360.0 / (double)v6 * 0.5 + a1) / (360.0 / (double)v6));
  unint64_t v8 = [v5 count];

  return v7 % v8;
}

- (id)_localizedWindDirectionAbbreviation:()NWMLocalizedWind
{
  uint64_t v4 = objc_msgSend(a1, "nwm_windDirectionKey");
  if (v4)
  {
    id v5 = v4;
    if (a3 && [v4 length] == 3)
    {
      uint64_t v6 = [NSString stringWithFormat:@"%@_COMPACT", v5];

      id v5 = (void *)v6;
    }
    unint64_t v7 = NWMWindLocalizedString(v5);
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (double)_speedByConverting:()NWMLocalizedWind toUnit:
{
  if (a4 != 2305)
  {
    if (a4 == 2304) {
      double v4 = 0.278;
    }
    else {
      double v4 = 0.621;
    }
    a1 = a1 * v4;
  }
  return round(a1);
}

@end