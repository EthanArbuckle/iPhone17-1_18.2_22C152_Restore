@interface WFWeatherConditions(NWMLocalizedUltravioletIndex)
- (id)nwm_localizedUltravioletIndexRiskDescription;
- (uint64_t)nwm_ultravioletIndexCategory;
@end

@implementation WFWeatherConditions(NWMLocalizedUltravioletIndex)

- (id)nwm_localizedUltravioletIndexRiskDescription
{
  unint64_t v1 = objc_msgSend(a1, "nwm_ultravioletIndexCategory");
  if (v1 > 4) {
    v2 = @"UV_INDEX_UNKNOWN";
  }
  else {
    v2 = off_264DEFCB8[v1];
  }

  return NWMUltravioletIndexLocalizedString(v2);
}

- (uint64_t)nwm_ultravioletIndexCategory
{
  unint64_t v1 = [a1 objectForKeyedSubscript:*MEMORY[0x263F86058]];
  v2 = v1;
  if (v1)
  {
    [v1 floatValue];
    if (v3 >= 0.0 && v3 < 3.0)
    {
      uint64_t v9 = 0;
      goto LABEL_27;
    }
    if (v3 >= 3.0 && v3 < 6.0)
    {
      uint64_t v9 = 1;
      goto LABEL_27;
    }
    if (v3 >= 6.0 && v3 < 8.0)
    {
      uint64_t v9 = 2;
      goto LABEL_27;
    }
    if (v3 >= 8.0 && v3 < 11.0)
    {
      uint64_t v9 = 3;
      goto LABEL_27;
    }
    double v8 = v3;
  }
  else
  {
    double v8 = -1.0;
  }
  if (v8 >= 11.0) {
    uint64_t v9 = 4;
  }
  else {
    uint64_t v9 = 5;
  }
LABEL_27:

  return v9;
}

@end