@interface WFWeatherConditions(NWMLocalizedDescription)
+ (id)nwm_localizedDescriptionForConditionCode:()NWMLocalizedDescription timeOfDay:;
+ (id)nwm_localizedDescriptionShortForConditionCode:()NWMLocalizedDescription timeOfDay:;
+ (id)nwm_localizedDescriptionShortKeyForConditionCode:()NWMLocalizedDescription timeOfDay:;
+ (id)nwm_localizedNoData;
+ (id)nwm_localizedNoDataRounded;
+ (uint64_t)_nwm_shortSuffixedKey:()NWMLocalizedDescription;
+ (uint64_t)nwm_localizedDescriptionKeyForConditionCode:()NWMLocalizedDescription timeOfDay:;
- (id)nwm_localizedDescription;
- (id)nwm_localizedDescriptionForTimeOfDay:()NWMLocalizedDescription;
- (id)nwm_localizedDescriptionShort;
- (id)nwm_localizedDescriptionShortForTimeOfDay:()NWMLocalizedDescription;
- (uint64_t)nw_timeOfDay;
- (uint64_t)nwm_localizedDescriptionKey;
- (uint64_t)nwm_localizedDescriptionKeyForTimeOfDay:()NWMLocalizedDescription;
@end

@implementation WFWeatherConditions(NWMLocalizedDescription)

- (uint64_t)nwm_localizedDescriptionKeyForTimeOfDay:()NWMLocalizedDescription
{
  v4 = [a1 objectForKeyedSubscript:*MEMORY[0x263F85FB0]];
  uint64_t v5 = [v4 unsignedIntegerValue];

  v6 = (void *)MEMORY[0x263F85F98];

  return objc_msgSend(v6, "nwm_localizedDescriptionKeyForConditionCode:timeOfDay:", v5, a3);
}

+ (id)nwm_localizedDescriptionForConditionCode:()NWMLocalizedDescription timeOfDay:
{
  v1 = objc_msgSend(a1, "nwm_localizedDescriptionKeyForConditionCode:timeOfDay:");
  v2 = NWMConditionsLocalizedString(v1);

  return v2;
}

+ (id)nwm_localizedDescriptionShortForConditionCode:()NWMLocalizedDescription timeOfDay:
{
  v1 = objc_msgSend(a1, "nwm_localizedDescriptionShortKeyForConditionCode:timeOfDay:");
  v2 = NWMConditionsLocalizedString(v1);

  return v2;
}

+ (uint64_t)nwm_localizedDescriptionKeyForConditionCode:()NWMLocalizedDescription timeOfDay:
{
  v4 = @"-Day";
  if (a4 == 1) {
    v4 = @"-Night";
  }
  return [(__CFString *)NWWFWeatherConditionsDescriptionKeys[a3] stringByAppendingString:v4];
}

+ (id)nwm_localizedDescriptionShortKeyForConditionCode:()NWMLocalizedDescription timeOfDay:
{
  v1 = objc_msgSend(a1, "nwm_localizedDescriptionKeyForConditionCode:timeOfDay:");
  v2 = objc_msgSend(MEMORY[0x263F85F98], "_nwm_shortSuffixedKey:", v1);

  return v2;
}

+ (id)nwm_localizedNoData
{
  return NWMConditionsLocalizedString(@"NO_DATA");
}

+ (id)nwm_localizedNoDataRounded
{
  return NWMConditionsLocalizedString(@"NO_DATA_ROUNDED");
}

- (id)nwm_localizedDescriptionForTimeOfDay:()NWMLocalizedDescription
{
  v1 = objc_msgSend(a1, "nwm_localizedDescriptionKeyForTimeOfDay:");
  v2 = NWMConditionsLocalizedString(v1);

  return v2;
}

- (id)nwm_localizedDescriptionShortForTimeOfDay:()NWMLocalizedDescription
{
  v1 = objc_msgSend(a1, "nwm_localizedDescriptionKeyForTimeOfDay:");
  v2 = objc_msgSend(MEMORY[0x263F85F98], "_nwm_shortSuffixedKey:", v1);
  v3 = NWMConditionsLocalizedString(v2);

  return v3;
}

+ (uint64_t)_nwm_shortSuffixedKey:()NWMLocalizedDescription
{
  return [a3 stringByAppendingString:@"-Short"];
}

- (id)nwm_localizedDescription
{
  v1 = objc_msgSend(a1, "nwm_localizedDescriptionKey");
  v2 = NWMConditionsLocalizedString(v1);

  return v2;
}

- (uint64_t)nwm_localizedDescriptionKey
{
  uint64_t v2 = objc_msgSend(a1, "nw_timeOfDay");

  return objc_msgSend(a1, "nwm_localizedDescriptionKeyForTimeOfDay:", v2);
}

- (id)nwm_localizedDescriptionShort
{
  v1 = (void *)MEMORY[0x263F85F98];
  uint64_t v2 = objc_msgSend(a1, "nwm_localizedDescriptionKey");
  v3 = objc_msgSend(v1, "_nwm_shortSuffixedKey:", v2);

  v4 = NWMConditionsLocalizedString(v3);

  return v4;
}

- (uint64_t)nw_timeOfDay
{
  uint64_t v2 = [MEMORY[0x263EFF8F0] currentCalendar];
  v3 = [a1 objectForKeyedSubscript:*MEMORY[0x263F85FE0]];
  v4 = [v2 dateFromComponents:v3];

  uint64_t v5 = [a1 objectForKeyedSubscript:*MEMORY[0x263F86030]];
  uint64_t v6 = [a1 objectForKeyedSubscript:*MEMORY[0x263F86040]];
  v7 = (void *)v6;
  if (v4) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8 || v5 == 0)
  {
    uint64_t v10 = 1;
  }
  else
  {
    [v4 timeIntervalSinceReferenceDate];
    double v12 = v11;
    [v7 timeIntervalSinceReferenceDate];
    double v14 = v13;
    [v5 timeIntervalSinceReferenceDate];
    BOOL v16 = v12 <= v14;
    if (v12 >= v15) {
      BOOL v16 = 1;
    }
    BOOL v17 = v12 > v15;
    if (v12 >= v14) {
      BOOL v17 = 0;
    }
    if (v14 > v15) {
      BOOL v16 = v17;
    }
    uint64_t v10 = !v16;
  }

  return v10;
}

@end