void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;
  uint64_t v10;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xEu);
}

id WAImageForConditionNamed(uint64_t a1, uint64_t a2)
{
  return +[WeatherImageLoader conditionImageNamed:a1 style:a2];
}

id WAImageForLegacyConditionCode(uint64_t a1, unint64_t a2)
{
  if (a2 > 1)
  {
    uint64_t v4 = +[WeatherImageLoader conditionImageNameWithConditionIndex:a1];
    v2 = +[WeatherImageLoader conditionImageNamed:v4 style:a2];
  }
  else
  {
    v2 = WAMapsImageForLegacyConditionCode(a1, a2 == 1);
  }
  return v2;
}

id WAMapsImageForLegacyConditionCode(uint64_t a1, uint64_t a2)
{
  switch(a1)
  {
    case 0:
      uint64_t v3 = 1;
      goto LABEL_47;
    case 1:
      uint64_t v3 = 2;
      goto LABEL_47;
    case 2:
      uint64_t v3 = 3;
      goto LABEL_47;
    case 3:
      uint64_t v3 = 4;
      goto LABEL_47;
    case 4:
      uint64_t v3 = 5;
      goto LABEL_47;
    case 5:
      uint64_t v3 = 6;
      goto LABEL_47;
    case 6:
      uint64_t v3 = 7;
      goto LABEL_47;
    case 7:
      uint64_t v3 = 8;
      goto LABEL_47;
    case 8:
      uint64_t v3 = 9;
      goto LABEL_47;
    case 9:
      uint64_t v3 = 10;
      goto LABEL_47;
    case 10:
      uint64_t v3 = 11;
      goto LABEL_47;
    case 11:
      uint64_t v3 = 12;
      goto LABEL_47;
    case 12:
      uint64_t v3 = 13;
      goto LABEL_47;
    case 13:
      uint64_t v3 = 14;
      goto LABEL_47;
    case 14:
      uint64_t v3 = 15;
      goto LABEL_47;
    case 15:
      uint64_t v3 = 16;
      goto LABEL_47;
    case 16:
      uint64_t v3 = 17;
      goto LABEL_47;
    case 17:
      uint64_t v3 = 18;
      goto LABEL_47;
    case 18:
      uint64_t v3 = 19;
      goto LABEL_47;
    case 19:
      uint64_t v3 = 20;
      goto LABEL_47;
    case 20:
      uint64_t v3 = 21;
      goto LABEL_47;
    case 21:
      uint64_t v3 = 22;
      goto LABEL_47;
    case 22:
      uint64_t v3 = 23;
      goto LABEL_47;
    case 23:
      uint64_t v3 = 24;
      goto LABEL_47;
    case 24:
      uint64_t v3 = 25;
      goto LABEL_47;
    case 25:
      uint64_t v3 = 26;
      goto LABEL_47;
    case 26:
      uint64_t v3 = 27;
      goto LABEL_47;
    case 27:
      uint64_t v3 = 29;
      goto LABEL_36;
    case 28:
      uint64_t v3 = 29;
      goto LABEL_47;
    case 29:
      uint64_t v3 = 31;
      goto LABEL_36;
    case 30:
      uint64_t v3 = 31;
      goto LABEL_47;
    case 31:
    case 33:
      uint64_t v3 = 33;
LABEL_36:
      int v4 = 0;
      goto LABEL_48;
    case 32:
    case 34:
      uint64_t v3 = 33;
      goto LABEL_47;
    case 35:
      uint64_t v3 = 36;
      goto LABEL_47;
    case 36:
      uint64_t v3 = 37;
      goto LABEL_47;
    case 37:
      uint64_t v3 = 38;
      goto LABEL_47;
    case 38:
      uint64_t v3 = 39;
      goto LABEL_47;
    case 39:
    case 45:
      uint64_t v3 = 40;
      goto LABEL_47;
    case 40:
      uint64_t v3 = 41;
      goto LABEL_47;
    case 41:
    case 46:
      uint64_t v3 = 42;
      goto LABEL_47;
    case 42:
      uint64_t v3 = 43;
      goto LABEL_47;
    case 43:
      uint64_t v3 = 44;
      goto LABEL_47;
    case 47:
      uint64_t v3 = 45;
      goto LABEL_47;
    default:
      uint64_t v3 = 0;
LABEL_47:
      int v4 = 1;
LABEL_48:
      v5 = WAImageForConditionCode(v3, v4, a2);
      return v5;
  }
}

id WAMapsImageWithinBundle(void *a1, uint64_t a2)
{
  id v3 = a1;
  int v4 = v3;
  if (a2 == 1)
  {
    v5 = @"-black";
  }
  else
  {
    if (a2) {
      goto LABEL_6;
    }
    v5 = @"-white";
  }
  uint64_t v6 = [v3 stringByAppendingString:v5];

  int v4 = (void *)v6;
LABEL_6:
  v7 = (void *)MEMORY[0x263F1C6B0];
  v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v9 = [v7 imageNamed:v4 inBundle:v8];

  return v9;
}

id WAImageForConditionCode(uint64_t a1, int a2, uint64_t a3)
{
  int v4 = @"blowingsnow";
  switch(a1)
  {
    case 1:
      int v4 = @"tornado";
      break;
    case 2:
      int v4 = @"tropical_storm";
      break;
    case 3:
      int v4 = @"hurricane";
      break;
    case 4:
      v5 = @"severe_thunderstorm_night";
      uint64_t v6 = @"severe_thunderstorm_day";
      goto LABEL_27;
    case 5:
    case 38:
    case 39:
    case 45:
      v5 = @"scattered-thunderstorm-night";
      uint64_t v6 = @"scattered-thunderstorm-day";
      goto LABEL_27;
    case 6:
    case 7:
    case 8:
    case 9:
    case 11:
    case 36:
      v5 = @"mix-rainfall_night";
      uint64_t v6 = @"mix-rainfall_day";
      goto LABEL_27;
    case 10:
      v5 = @"drizzle_night";
      uint64_t v6 = @"drizzle_day";
      goto LABEL_27;
    case 12:
    case 13:
      v5 = @"rain_night";
      uint64_t v6 = @"rain_day";
      goto LABEL_27;
    case 14:
      int v4 = @"flurry";
      break;
    case 15:
    case 17:
    case 26:
    case 42:
      int v4 = @"flurry_snow_shower";
      break;
    case 16:
      break;
    case 18:
      v5 = @"hail_night";
      uint64_t v6 = @"hail_day";
      goto LABEL_27;
    case 19:
      v5 = @"sleet_night";
      uint64_t v6 = @"sleet_day";
      goto LABEL_27;
    case 20:
      int v4 = @"dust";
      break;
    case 21:
      v5 = @"fog_night";
      uint64_t v6 = @"fog_day";
      goto LABEL_27;
    case 22:
      int v4 = @"haze";
      break;
    case 23:
      int v4 = @"smoke";
      break;
    case 24:
    case 25:
      int v4 = @"breezy";
      break;
    case 27:
    case 29:
      v5 = @"mostly-cloudy_night";
      uint64_t v6 = @"mostly-cloudy_day";
      goto LABEL_27;
    case 31:
      v5 = @"partly-cloudy-night";
      uint64_t v6 = @"partly-cloudy-day";
      goto LABEL_27;
    case 33:
    case 35:
      v5 = @"clear-night";
      uint64_t v6 = @"mostly-sunny";
      goto LABEL_27;
    case 37:
      int v4 = @"hot";
      break;
    case 40:
      v5 = @"scattered-showers-night";
      uint64_t v6 = @"scattered-showers-day";
      goto LABEL_27;
    case 41:
      v5 = @"heavy-rain_night";
      uint64_t v6 = @"heavy-rain_day";
      goto LABEL_27;
    case 43:
    case 44:
      v5 = @"blizzard_night";
      uint64_t v6 = @"blizzard_day";
LABEL_27:
      if (a2) {
        v5 = v6;
      }
      int v4 = v5;
      break;
    default:
      int v4 = @"no_report";
      break;
  }
  v7 = WAMapsImageWithinBundle(v4, a3);

  return v7;
}

id WAImageForSunset(uint64_t a1)
{
  return +[WeatherImageLoader conditionImageNamed:@"sunset" style:a1];
}

id WAImageForSunrise(uint64_t a1)
{
  return +[WeatherImageLoader conditionImageNamed:@"sunrise" style:a1];
}

id WADetailColor()
{
  v0 = [MEMORY[0x263F1C550] labelColor];
  v1 = [v0 colorWithAlphaComponent:0.5];

  return v1;
}

uint64_t WAContentColor()
{
  return [MEMORY[0x263F1C550] labelColor];
}

uint64_t WADividerLineColor()
{
  return [MEMORY[0x263F1C550] separatorColor];
}

uint64_t _WAAirQualityIsAQI(void *a1)
{
  uint64_t v1 = _WAAirQualityIsAQI_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&_WAAirQualityIsAQI_onceToken, &__block_literal_global);
  }
  id v3 = (void *)_WAAirQualityIsAQI_AQICountries;
  int v4 = [v2 uppercaseString];

  uint64_t v5 = [v3 containsObject:v4];
  return v5;
}

uint64_t _WAAirQualityIsDAQI(void *a1)
{
  uint64_t v1 = _WAAirQualityIsDAQI_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&_WAAirQualityIsDAQI_onceToken, &__block_literal_global_146);
  }
  id v3 = (void *)_WAAirQualityIsDAQI_DAQICountries;
  int v4 = [v2 uppercaseString];

  uint64_t v5 = [v3 containsObject:v4];
  return v5;
}

uint64_t _WAAirQualityIsUBA(void *a1)
{
  uint64_t v1 = _WAAirQualityIsUBA_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&_WAAirQualityIsUBA_onceToken, &__block_literal_global_156);
  }
  id v3 = (void *)_WAAirQualityIsUBA_UBACountries;
  int v4 = [v2 uppercaseString];

  uint64_t v5 = [v3 containsObject:v4];
  return v5;
}

uint64_t WAAirQualityIsSignificantForCategory(unint64_t a1, void *a2)
{
  id v3 = a2;
  if (_WAAirQualityIsAQI(v3))
  {
    BOOL v4 = a1 > 2;
    goto LABEL_5;
  }
  if (_WAAirQualityIsDAQI(v3))
  {
    BOOL v4 = a1 > 6;
LABEL_5:
    uint64_t v5 = v4;
    goto LABEL_11;
  }
  unsigned int IsUBA = _WAAirQualityIsUBA(v3);
  if (a1 > 3) {
    uint64_t v5 = IsUBA;
  }
  else {
    uint64_t v5 = 0;
  }
LABEL_11:

  return v5;
}

id WAAirQualityDescriptionForCategory(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v5 = [v4 localizedStringForKey:@"WFAirQualityCategoryUnknown" value:&stru_26DADC2F0 table:@"WeatherFrameworkLocalizableStrings"];

  if (_WAAirQualityIsAQI(v3))
  {
    switch(a1)
    {
      case 1:
        goto LABEL_11;
      case 2:
        goto LABEL_10;
      case 3:
        uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v7 = v6;
        v8 = @"WFAirQualityCategoryUnhealthyForSensitiveGroups";
        goto LABEL_19;
      case 4:
        uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v7 = v6;
        v8 = @"WFAirQualityCategoryUnhealthy";
        goto LABEL_19;
      case 5:
        uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v7 = v6;
        v8 = @"WFAirQualityCategoryVeryUnhealthy";
        goto LABEL_19;
      case 6:
        uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v7 = v6;
        v8 = @"WFAirQualityCategoryHazardous";
        goto LABEL_19;
      default:
        break;
    }
  }
  else if (_WAAirQualityIsDAQI(v3))
  {
    switch(a1)
    {
      case 1:
      case 2:
      case 3:
        uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v7 = v6;
        v8 = @"WFAirQualityCategoryLow";
        goto LABEL_19;
      case 4:
      case 5:
      case 6:
        goto LABEL_10;
      case 7:
      case 8:
      case 9:
        uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v7 = v6;
        v8 = @"WFAirQualityCategoryHigh";
        goto LABEL_19;
      case 10:
        uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v7 = v6;
        v8 = @"WFAirQualityCategoryVeryHigh";
        goto LABEL_19;
      default:
        break;
    }
  }
  else if (_WAAirQualityIsUBA(v3))
  {
    switch(a1)
    {
      case 1:
        uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v7 = v6;
        v8 = @"WFAirQualityCategoryVeryGood";
        goto LABEL_19;
      case 2:
LABEL_11:
        uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v7 = v6;
        v8 = @"WFAirQualityCategoryGood";
        goto LABEL_19;
      case 3:
LABEL_10:
        uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v7 = v6;
        v8 = @"WFAirQualityCategoryModerate";
        goto LABEL_19;
      case 4:
        uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v7 = v6;
        v8 = @"WFAirQualityCategoryBad";
        goto LABEL_19;
      case 5:
        uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v7 = v6;
        v8 = @"WFAirQualityCategoryVeryBad";
LABEL_19:
        uint64_t v9 = [v6 localizedStringForKey:v8 value:&stru_26DADC2F0 table:@"WeatherFrameworkLocalizableStrings"];

        uint64_t v5 = (void *)v9;
        break;
      default:
        break;
    }
  }

  return v5;
}

id WAAirQualityLongDescriptionForCategory(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v5 = [v4 localizedStringForKey:@"WFAirQualityCategoryUnknown-Long" value:&stru_26DADC2F0 table:@"WeatherFrameworkLocalizableStrings"];

  if (_WAAirQualityIsAQI(v3))
  {
    switch(a1)
    {
      case 1:
        goto LABEL_11;
      case 2:
        goto LABEL_10;
      case 3:
        uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v7 = v6;
        v8 = @"WFAirQualityCategoryUnhealthyForSensitiveGroups-Long";
        goto LABEL_19;
      case 4:
        uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v7 = v6;
        v8 = @"WFAirQualityCategoryUnhealthy-Long";
        goto LABEL_19;
      case 5:
        uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v7 = v6;
        v8 = @"WFAirQualityCategoryVeryUnhealthy-Long";
        goto LABEL_19;
      case 6:
        uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v7 = v6;
        v8 = @"WFAirQualityCategoryHazardous-Long";
        goto LABEL_19;
      default:
        break;
    }
  }
  else if (_WAAirQualityIsDAQI(v3))
  {
    switch(a1)
    {
      case 1:
      case 2:
      case 3:
        uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v7 = v6;
        v8 = @"WFAirQualityCategoryLow-Long";
        goto LABEL_19;
      case 4:
      case 5:
      case 6:
        goto LABEL_10;
      case 7:
      case 8:
      case 9:
        uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v7 = v6;
        v8 = @"WFAirQualityCategoryHigh-Long";
        goto LABEL_19;
      case 10:
        uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v7 = v6;
        v8 = @"WFAirQualityCategoryVeryHigh-Long";
        goto LABEL_19;
      default:
        break;
    }
  }
  else if (_WAAirQualityIsUBA(v3))
  {
    switch(a1)
    {
      case 1:
        uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v7 = v6;
        v8 = @"WFAirQualityCategoryVeryGood-Long";
        goto LABEL_19;
      case 2:
LABEL_11:
        uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v7 = v6;
        v8 = @"WFAirQualityCategoryGood-Long";
        goto LABEL_19;
      case 3:
LABEL_10:
        uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v7 = v6;
        v8 = @"WFAirQualityCategoryModerate-Long";
        goto LABEL_19;
      case 4:
        uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v7 = v6;
        v8 = @"WFAirQualityCategoryBad-Long";
        goto LABEL_19;
      case 5:
        uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v7 = v6;
        v8 = @"WFAirQualityCategoryVeryBad-Long";
LABEL_19:
        uint64_t v9 = [v6 localizedStringForKey:v8 value:&stru_26DADC2F0 table:@"WeatherFrameworkLocalizableStrings"];

        uint64_t v5 = (void *)v9;
        break;
      default:
        break;
    }
  }

  return v5;
}

uint64_t WAHexStringFromColor(void *a1)
{
  Components = CGColorGetComponents((CGColorRef)[a1 CGColor]);
  float v2 = *Components * 255.0;
  unint64_t v3 = llroundf(v2);
  float v4 = Components[1] * 255.0;
  unint64_t v5 = llroundf(v4);
  float v6 = Components[2] * 255.0;
  return objc_msgSend(NSString, "stringWithFormat:", @"#%02lX%02lX%02lX", v3, v5, llroundf(v6));
}

id WAConditionsLineStringFromConditionCode(uint64_t a1)
{
  if (a1 <= 47)
  {
    unint64_t v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v1 = [v3 localizedStringForKey:*(&WeatherDescription + a1) value:&stru_26DADC2F0 table:@"WeatherFrameworkLocalizableStrings"];
  }
  else
  {
    uint64_t v1 = 0;
  }
  return v1;
}

__CFString *WASymbolGlyphFromConditionCode(uint64_t a1, int a2, int a3)
{
  if (a1 <= 47)
  {
    uint64_t v6 = 48;
    if (a2) {
      uint64_t v6 = 38;
    }
    uint64_t v7 = 49;
    if (a2) {
      uint64_t v7 = 40;
    }
    if (a1 != 38) {
      uint64_t v6 = a1;
    }
    if (v6 == 40) {
      uint64_t v6 = v7;
    }
    v8 = &SymbolGlyphs;
    if (a3) {
      v8 = &FilledSymbolGlyphs;
    }
    float v4 = v8[v6];
  }
  else
  {
    float v4 = 0;
  }
  return v4;
}

id WASymbolGlyphHexColorsFromConditionCode(void *a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v1 = WASymbolGlyphColorsFromConditionCode(a1);
  float v2 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = WAHexStringFromColor(*(void **)(*((void *)&v11 + 1) + 8 * i));
        objc_msgSend(v2, "addObject:", v8, (void)v11);
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithArray:v2];

  return v9;
}

id WASymbolGlyphColorsFromConditionCode(void *a1)
{
  id v1 = a1;
  float v2 = [MEMORY[0x263EFF980] array];
  if ([v1 isEqualToString:@"sun.max.fill"])
  {
    id v3 = [MEMORY[0x263F1C550] systemYellowColor];
    [v2 addObject:v3];
  }
  if ([v1 isEqualToString:@"cloud.sun.fill"])
  {
    uint64_t v4 = [MEMORY[0x263F1C550] systemWhiteColor];
    [v2 addObject:v4];

    uint64_t v5 = [MEMORY[0x263F1C550] systemYellowColor];
    [v2 addObject:v5];
  }
  if ([v1 isEqualToString:@"cloud.drizzle.fill"])
  {
    uint64_t v6 = [MEMORY[0x263F1C550] systemWhiteColor];
    [v2 addObject:v6];

    uint64_t v7 = [MEMORY[0x263F1C550] systemTealColor];
    [v2 addObject:v7];
  }
  if ([v1 isEqualToString:@"cloud.rain.fill"])
  {
    v8 = [MEMORY[0x263F1C550] systemWhiteColor];
    [v2 addObject:v8];

    uint64_t v9 = [MEMORY[0x263F1C550] systemTealColor];
    [v2 addObject:v9];
  }
  if ([v1 isEqualToString:@"cloud.sun.rain.fill"])
  {
    uint64_t v10 = [MEMORY[0x263F1C550] systemWhiteColor];
    [v2 addObject:v10];

    long long v11 = [MEMORY[0x263F1C550] systemYellowColor];
    [v2 addObject:v11];

    long long v12 = [MEMORY[0x263F1C550] systemTealColor];
    [v2 addObject:v12];
  }
  if ([v1 isEqualToString:@"cloud.moon.rain.fill"])
  {
    long long v13 = [MEMORY[0x263F1C550] systemWhiteColor];
    [v2 addObject:v13];

    long long v14 = [MEMORY[0x263F1C550] systemWhiteColor];
    [v2 addObject:v14];

    v15 = [MEMORY[0x263F1C550] systemTealColor];
    [v2 addObject:v15];
  }
  if ([v1 isEqualToString:@"cloud.sun.bolt.fill"])
  {
    uint64_t v16 = [MEMORY[0x263F1C550] systemWhiteColor];
    [v2 addObject:v16];

    v17 = [MEMORY[0x263F1C550] systemYellowColor];
    [v2 addObject:v17];

    v18 = [MEMORY[0x263F1C550] systemWhiteColor];
    [v2 addObject:v18];
  }
  if ([v1 isEqualToString:@"cloud.bolt.rain.fill"])
  {
    v19 = [MEMORY[0x263F1C550] systemWhiteColor];
    [v2 addObject:v19];

    v20 = [MEMORY[0x263F1C550] systemWhiteColor];
    [v2 addObject:v20];

    v21 = [MEMORY[0x263F1C550] systemTealColor];
    [v2 addObject:v21];
  }
  if (([v1 isEqualToString:@"sun.dust.fill"] & 1) != 0
    || [v1 isEqualToString:@"sun.haze.fill"])
  {
    v22 = [MEMORY[0x263F1C550] systemYellowColor];
    [v2 addObject:v22];
  }
  if ([v1 isEqualToString:@"thermometer.snowflake"])
  {
    v23 = [MEMORY[0x263F1C550] systemTealColor];
    [v2 addObject:v23];
  }
  if ([v1 isEqualToString:@"thermometer.sun"])
  {
    v24 = [MEMORY[0x263F1C550] systemRedColor];
    [v2 addObject:v24];

    v25 = [MEMORY[0x263F1C550] systemYellowColor];
    [v2 addObject:v25];
  }
  if (([v1 isEqualToString:@"sunrise.fill"] & 1) != 0
    || [v1 isEqualToString:@"sunset.fill"])
  {
    v26 = [MEMORY[0x263F1C550] systemYellowColor];
    [v2 addObject:v26];
  }
  v27 = [MEMORY[0x263EFF8C0] arrayWithArray:v2];

  return v27;
}

id WAConditionsLineStringFromCurrentForecasts(void *a1)
{
  uint64_t v1 = [a1 conditionCode];
  return WAConditionsLineStringFromConditionCode(v1);
}

id WAConditionsLine2StringFromHourlyForecasts(void *a1)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v1 = a1;
  if (WAConditionsLine2StringFromHourlyForecasts_onceToken != -1) {
    dispatch_once(&WAConditionsLine2StringFromHourlyForecasts_onceToken, &__block_literal_global_293);
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v2 = v1;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (!v3)
  {

    goto LABEL_35;
  }
  uint64_t v4 = v3;
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = *(void *)v34;
  do
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v34 != v10) {
        objc_enumerationMutation(v2);
      }
      long long v12 = *(void **)(*((void *)&v33 + 1) + 8 * i);
      uint64_t v13 = [v12 conditionCode];
      if (((0x1017FFF80001uLL >> v13) & 1) == 0)
      {
        uint64_t v14 = PrecipitationTypeMap[v13];
        if (!v7) {
          uint64_t v7 = PrecipitationTypeMap[v13];
        }
        if (v14 == 4) {
          uint64_t v15 = v9 + 1;
        }
        else {
          uint64_t v15 = v9;
        }
        if (v14 == 3) {
          uint64_t v16 = v5 + 1;
        }
        else {
          uint64_t v16 = v5;
        }
        if (v14 == 3) {
          uint64_t v15 = v9;
        }
        if (v14 == 2) {
          ++v8;
        }
        else {
          uint64_t v5 = v16;
        }
        if (v14 != 2) {
          uint64_t v9 = v15;
        }
      }
      v17 = [v12 temperature];
      [v17 temperatureForUnit:2];
      double v19 = v18;

      if (v19 < 0.0) {
        ++v6;
      }
    }
    uint64_t v4 = [v2 countByEnumeratingWithState:&v33 objects:v37 count:16];
  }
  while (v4);

  if (v8 >= 1 && v8 > v5) {
    goto LABEL_35;
  }
  if (v5 >= 1 && v5 > v8) {
    goto LABEL_32;
  }
  if (v9 < 1 || v9 <= v8 || v9 <= v5)
  {
    if (v7)
    {
      double v20 = ChanceOfRainWithHourlyForecasts(v2);
      if (v7 == 4) {
        goto LABEL_44;
      }
      if (v7 == 3) {
        goto LABEL_33;
      }
LABEL_36:
      v21 = @"CHANCE_OF_RAIN_WIDGET";
      goto LABEL_37;
    }
    if (v6)
    {
LABEL_32:
      double v20 = ChanceOfRainWithHourlyForecasts(v2);
LABEL_33:
      v21 = @"CHANCE_OF_SNOW";
      goto LABEL_37;
    }
LABEL_35:
    double v20 = ChanceOfRainWithHourlyForecasts(v2);
    goto LABEL_36;
  }
  double v20 = ChanceOfRainWithHourlyForecasts(v2);
LABEL_44:
  v21 = @"CHANCE_OF_HAIL";
LABEL_37:
  v22 = NSString;
  double v23 = v20 / 100.0;
  v24 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v25 = [v24 localizedStringForKey:@"DETAIL_FORMAT_STRING_WIDGET" value:&stru_26DADC2F0 table:@"WeatherFrameworkLocalizableStrings"];
  v26 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v27 = [v26 localizedStringForKey:v21 value:&stru_26DADC2F0 table:@"WeatherFrameworkLocalizableStrings"];
  v28 = (void *)WAConditionsLine2StringFromHourlyForecasts__percentFormatter;
  v29 = [NSNumber numberWithDouble:v23];
  v30 = [v28 stringFromNumber:v29];
  v31 = objc_msgSend(v22, "localizedStringWithFormat:", v25, v27, v30, (void)v33);

  return v31;
}

uint64_t __WAConditionsLine2StringFromHourlyForecasts_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08A30]);
  id v1 = (void *)WAConditionsLine2StringFromHourlyForecasts__percentFormatter;
  WAConditionsLine2StringFromHourlyForecasts__percentFormatter = (uint64_t)v0;

  [(id)WAConditionsLine2StringFromHourlyForecasts__percentFormatter setNumberStyle:3];
  id v2 = (void *)WAConditionsLine2StringFromHourlyForecasts__percentFormatter;
  return [v2 setMaximumFractionDigits:0];
}

id WAHourlyConditionsTimeLabelFont(int a1)
{
  if (a1) {
    uint64_t v1 = 32770;
  }
  else {
    uint64_t v1 = 0x8000;
  }
  id v2 = [MEMORY[0x263F1C660] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F1D280] addingSymbolicTraits:v1 options:2];
  uint64_t v3 = [MEMORY[0x263F1C658] fontWithDescriptor:v2 size:0.0];

  return v3;
}

id WAHourlyConditionsTemperatureLabelAttributesDictionary(int a1)
{
  v9[2] = *MEMORY[0x263EF8340];
  if (a1) {
    uint64_t v1 = 32770;
  }
  else {
    uint64_t v1 = 0x8000;
  }
  id v2 = [MEMORY[0x263F1C660] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F1D280] addingSymbolicTraits:v1 options:2];
  uint64_t v3 = [MEMORY[0x263F1C658] fontWithDescriptor:v2 size:0.0];
  uint64_t v4 = [MEMORY[0x263F1C550] labelColor];
  uint64_t v5 = *MEMORY[0x263F1C240];
  v8[0] = *MEMORY[0x263F1C238];
  v8[1] = v5;
  v9[0] = v3;
  v9[1] = v4;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];

  return v6;
}

void WASetupVibrancyOnView(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  uint64_t v5 = [v4 layer];
  [v5 setFilters:0];

  uint64_t v6 = [v3 effectConfig];

  id v7 = [v6 contentConfig];

  [v7 configureLayerView:v4];
}

id WATodayLoadSavedLastForecastModelFromPreferences(void *a1)
{
  if (a1)
  {
    uint64_t v1 = [a1 localWeatherCity];
    if (v1)
    {
      id v2 = objc_opt_new();
      id v3 = [v1 name];
      [v2 setDisplayName:v3];

      id v4 = [v1 timeZone];
      [v2 setTimeZone:v4];

      uint64_t v5 = [v1 location];
      [v2 setGeoLocation:v5];

      uint64_t v6 = [v1 ISO3166CountryAbbreviation];
      [v2 setCountryAbbreviation:v6];

      id v7 = [v1 weatherDisplayName];
      [v2 setWeatherDisplayName:v7];

      uint64_t v8 = [v1 weatherLocationName];
      [v2 setWeatherLocationName:v8];

      uint64_t v9 = objc_opt_new();
      uint64_t v10 = [v1 temperature];
      [v9 setTemperature:v10];

      long long v11 = [v1 feelsLike];
      [v9 setFeelsLike:v11];

      [v1 windSpeed];
      objc_msgSend(v9, "setWindSpeed:");
      [v1 windDirection];
      objc_msgSend(v9, "setWindDirection:");
      [v1 humidity];
      objc_msgSend(v9, "setHumidity:");
      [v1 dewPoint];
      objc_msgSend(v9, "setDewPoint:");
      [v1 visibility];
      objc_msgSend(v9, "setVisibility:");
      [v1 pressure];
      objc_msgSend(v9, "setPressure:");
      objc_msgSend(v9, "setPressureRising:", objc_msgSend(v1, "pressureRising"));
      objc_msgSend(v9, "setUVIndex:", objc_msgSend(v1, "uvIndex"));
      [v1 precipitationPast24Hours];
      *(float *)&double v12 = v12;
      [v9 setPrecipitationPast24Hours:v12];
      objc_msgSend(v9, "setConditionCode:", objc_msgSend(v1, "conditionCode"));
      objc_msgSend(v9, "setObservationTime:", objc_msgSend(v1, "observationTime"));
      uint64_t v13 = objc_opt_new();
      [v13 setLocation:v2];
      uint64_t v14 = [v1 airQualityIdx];
      objc_msgSend(v13, "setLocalizedAirQualityIndex:", objc_msgSend(v14, "unsignedIntegerValue"));

      uint64_t v15 = [v1 airQualityScaleCategory];
      [v13 setLocalizedAirQualityScaleCategory:v15];

      uint64_t v16 = [v1 airQualityCategory];
      objc_msgSend(v13, "setCategory:", objc_msgSend(v16, "unsignedIntegerValue"));

      v17 = objc_opt_new();
      [v17 setCurrentConditions:v9];
      double v18 = [v1 hourlyForecasts];
      [v17 setHourlyForecasts:v18];

      double v19 = [v1 dayForecasts];
      [v17 setDailyForecasts:v19];

      double v20 = [MEMORY[0x263EFF910] date];
      v21 = [v2 sunriseForDate:v20];
      [v17 setSunrise:v21];

      v22 = [MEMORY[0x263EFF910] date];
      double v23 = [v2 sunsetForDate:v22];
      [v17 setSunset:v23];

      [v17 setLocation:v2];
      [v17 setCity:v1];
      [v17 setAirQualityConditions:v13];
    }
    else
    {
      v17 = 0;
    }
  }
  else
  {
    v17 = 0;
  }
  return v17;
}

id WATodayLoadSavedFirstCityFromPreferences(void *a1)
{
  if (a1)
  {
    uint64_t v1 = [a1 loadSavedCities];
    id v2 = objc_msgSend(v1, "na_filter:", &__block_literal_global_318);
    id v3 = [v2 firstObject];

    if (v3)
    {
      id v4 = objc_opt_new();
      uint64_t v5 = [v3 name];
      [v4 setDisplayName:v5];

      uint64_t v6 = [v3 timeZone];
      [v4 setTimeZone:v6];

      id v7 = [v3 location];
      [v4 setGeoLocation:v7];

      uint64_t v8 = [v3 ISO3166CountryAbbreviation];
      [v4 setCountryAbbreviation:v8];

      uint64_t v9 = [v3 weatherDisplayName];
      [v4 setWeatherDisplayName:v9];

      uint64_t v10 = [v3 weatherLocationName];
      [v4 setWeatherLocationName:v10];

      long long v11 = objc_opt_new();
      double v12 = [v3 temperature];
      [v11 setTemperature:v12];

      uint64_t v13 = [v3 feelsLike];
      [v11 setFeelsLike:v13];

      [v3 windSpeed];
      objc_msgSend(v11, "setWindSpeed:");
      [v3 windDirection];
      objc_msgSend(v11, "setWindDirection:");
      [v3 humidity];
      objc_msgSend(v11, "setHumidity:");
      [v3 dewPoint];
      objc_msgSend(v11, "setDewPoint:");
      [v3 visibility];
      objc_msgSend(v11, "setVisibility:");
      [v3 pressure];
      objc_msgSend(v11, "setPressure:");
      objc_msgSend(v11, "setPressureRising:", objc_msgSend(v3, "pressureRising"));
      objc_msgSend(v11, "setUVIndex:", objc_msgSend(v3, "uvIndex"));
      [v3 precipitationPast24Hours];
      *(float *)&double v14 = v14;
      [v11 setPrecipitationPast24Hours:v14];
      objc_msgSend(v11, "setConditionCode:", objc_msgSend(v3, "conditionCode"));
      objc_msgSend(v11, "setObservationTime:", objc_msgSend(v3, "observationTime"));
      uint64_t v15 = objc_opt_new();
      [v15 setLocation:v4];
      uint64_t v16 = [v3 airQualityIdx];
      objc_msgSend(v15, "setLocalizedAirQualityIndex:", objc_msgSend(v16, "unsignedIntegerValue"));

      v17 = [v3 airQualityScaleCategory];
      [v15 setLocalizedAirQualityScaleCategory:v17];

      double v18 = [v3 airQualityCategory];
      objc_msgSend(v15, "setCategory:", objc_msgSend(v18, "unsignedIntegerValue"));

      double v19 = objc_opt_new();
      [v19 setCurrentConditions:v11];
      double v20 = [v3 hourlyForecasts];
      [v19 setHourlyForecasts:v20];

      v21 = [v3 dayForecasts];
      [v19 setDailyForecasts:v21];

      v22 = [MEMORY[0x263EFF910] date];
      double v23 = [v4 sunriseForDate:v22];
      [v19 setSunrise:v23];

      v24 = [MEMORY[0x263EFF910] date];
      v25 = [v4 sunsetForDate:v24];
      [v19 setSunset:v25];

      [v19 setLocation:v4];
      [v19 setCity:v3];
      [v19 setAirQualityConditions:v15];
    }
    else
    {
      double v19 = 0;
    }
  }
  else
  {
    double v19 = 0;
  }
  return v19;
}

uint64_t __WATodayLoadSavedFirstCityFromPreferences_block_invoke(uint64_t a1, void *a2)
{
  return [a2 isLocalWeatherCity] ^ 1;
}

id WANumberFormatterForDisplayingAQI()
{
  if (WANumberFormatterForDisplayingAQI_onceToken != -1) {
    dispatch_once(&WANumberFormatterForDisplayingAQI_onceToken, &__block_literal_global_320);
  }
  id v0 = (void *)WANumberFormatterForDisplayingAQI_aqiNumberFormatter;
  return v0;
}

uint64_t __WANumberFormatterForDisplayingAQI_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08A30]);
  uint64_t v1 = (void *)WANumberFormatterForDisplayingAQI_aqiNumberFormatter;
  WANumberFormatterForDisplayingAQI_aqiNumberFormatter = (uint64_t)v0;

  id v2 = (void *)WANumberFormatterForDisplayingAQI_aqiNumberFormatter;
  return [v2 setNumberStyle:1];
}

void sub_226D222B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_226D22464(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

void sub_226D225C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

void sub_226D2284C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_226D22EEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id WACityFromForecastModel(void *a1)
{
  id v1 = a1;
  uint64_t v2 = objc_opt_new();
  id v3 = [v1 location];
  id v4 = [v3 displayName];
  [v2 setName:v4];

  uint64_t v5 = [v1 location];
  uint64_t v6 = [v5 geoLocation];
  [v2 setLocation:v6];

  [v2 updateCityForModel:v1];
  return v2;
}

uint64_t WeatherCityListChanged(uint64_t a1, void *a2)
{
  return [a2 weatherPreferencesWereSynchronized];
}

id TWCFallbackURL()
{
  if (TWCFallbackURL_onceToken != -1) {
    dispatch_once(&TWCFallbackURL_onceToken, &__block_literal_global_2);
  }
  id v0 = (void *)TWCFallbackURL_TWCFallbackURL;
  return v0;
}

void __TWCFallbackURL_block_invoke()
{
  id v8 = [MEMORY[0x263F08BA0] componentsWithString:@"http://www.weather.com/wx/today/"];
  uint64_t v0 = [v8 queryItems];
  id v1 = (void *)v0;
  if (v0) {
    uint64_t v2 = (void *)v0;
  }
  else {
    uint64_t v2 = (void *)MEMORY[0x263EFFA68];
  }
  id v3 = [MEMORY[0x263F08BD0] queryItemWithName:@"par" value:@"apple_"];
  id v4 = [v2 arrayByAddingObject:v3];
  [v8 setQueryItems:v4];

  uint64_t v5 = [v8 URL];
  uint64_t v6 = [v5 absoluteString];
  id v7 = (void *)TWCFallbackURL_TWCFallbackURL;
  TWCFallbackURL_TWCFallbackURL = v6;
}

id TWCAttributionURLForTrafficParameter(void *a1)
{
  v29[3] = *MEMORY[0x263EF8340];
  id v1 = a1;
  if (TWCAttributionURLForTrafficParameter_onceToken != -1) {
    dispatch_once(&TWCAttributionURLForTrafficParameter_onceToken, &__block_literal_global_13);
  }
  uint64_t v2 = [MEMORY[0x263F1C408] sharedApplication];
  int v3 = [v2 canOpenURL:TWCAttributionURLForTrafficParameter_sTWCAppiPadURL];

  if (v3)
  {
    id v4 = (void *)TWCAttributionURLForTrafficParameter_sTWCAppiPadURL;
LABEL_7:
    id v7 = v4;
    goto LABEL_17;
  }
  uint64_t v5 = [MEMORY[0x263F1C408] sharedApplication];
  int v6 = [v5 canOpenURL:TWCAttributionURLForTrafficParameter_sTWCAppiPhoneURL];

  if (v6)
  {
    id v4 = (void *)TWCAttributionURLForTrafficParameter_sTWCAppiPhoneURL;
    goto LABEL_7;
  }
  id v8 = [MEMORY[0x263F08BA0] componentsWithString:@"http://www.weather.com/wx/today/"];
  if (![(__CFString *)v1 length])
  {

    id v1 = @"TWC";
  }
  uint64_t v9 = (void *)MEMORY[0x263F08BD0];
  uint64_t v10 = [@"apple_" stringByAppendingString:v1];
  long long v11 = [v9 queryItemWithName:@"par" value:v10];

  if (WAUserTemperatureUnit() == 1) {
    double v12 = @"e";
  }
  else {
    double v12 = @"m";
  }
  uint64_t v13 = [MEMORY[0x263F08BD0] queryItemWithName:@"units" value:v12];
  v27 = (void *)v13;
  double v14 = [MEMORY[0x263EFF960] currentLocale];
  uint64_t v15 = [v14 objectForKey:*MEMORY[0x263EFF4D0]];
  v28 = [v15 uppercaseString];

  uint64_t v16 = [v14 objectForKey:*MEMORY[0x263EFF508]];
  v17 = [v16 lowercaseString];

  double v18 = [NSString stringWithFormat:@"%@_%@", v17, v28];
  double v19 = [MEMORY[0x263F08BD0] queryItemWithName:@"locale" value:v18];
  uint64_t v20 = [v8 queryItems];
  v21 = (void *)v20;
  if (v20) {
    v22 = (void *)v20;
  }
  else {
    v22 = (void *)MEMORY[0x263EFFA68];
  }
  v29[0] = v11;
  v29[1] = v19;
  v29[2] = v13;
  double v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:3];
  v24 = [v22 arrayByAddingObjectsFromArray:v23];
  [v8 setQueryItems:v24];

  id v7 = [v8 URL];

LABEL_17:
  v25 = WALogForCategory(0);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
    TWCAttributionURLForTrafficParameter_cold_1(v7, v25);
  }

  return v7;
}

uint64_t __TWCAttributionURLForTrafficParameter_block_invoke()
{
  uint64_t v0 = [NSURL URLWithString:@"twcweather://now"];
  id v1 = (void *)TWCAttributionURLForTrafficParameter_sTWCAppiPhoneURL;
  TWCAttributionURLForTrafficParameter_sTWCAppiPhoneURL = v0;

  uint64_t v2 = [NSURL URLWithString:@"twc://now"];
  uint64_t v3 = TWCAttributionURLForTrafficParameter_sTWCAppiPadURL;
  TWCAttributionURLForTrafficParameter_sTWCAppiPadURL = v2;
  return MEMORY[0x270F9A758](v2, v3);
}

id WeatherChannelBaseURL()
{
  uint64_t v0 = +[WeatherInternalPreferences sharedInternalPreferences];
  id v1 = [v0 objectForKey:@"WeatherChannelBaseURL"];

  if (v1)
  {
    uint64_t v2 = (void *)[v1 copy];
  }
  else
  {
    uint64_t v3 = [NSString stringWithFormat:@"https://%@/v1/geocode", @"api.weather.com"];
    uint64_t v2 = (void *)[v3 copy];
  }
  return v2;
}

id WAAttributionString()
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v0 = +[WAProviderAttributionManager sharedManager];
  id v1 = [v0 providerName];

  uint64_t v2 = [v1 length];
  uint64_t v3 = WALogForCategory(0);
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_DWORD *)buf = 138412290;
      double v18 = v1;
      _os_log_impl(&dword_226D1D000, v3, OS_LOG_TYPE_DEFAULT, "WAAttributionString: we got a provider name: %@", buf, 0xCu);
    }

    uint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v3 = [v5 localizedStringForKey:@"WFAttributionSourceNameLocalizedAttributionString" value:&stru_26DADC2F0 table:@"WeatherFrameworkLocalizableStrings"];

    int v6 = NSString;
    id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v8 = [v7 localizedStringForKey:@"WFAttributionSourceProviderLocalizedAttributionString" value:&stru_26DADC2F0 table:@"WeatherFrameworkLocalizableStrings"];
    uint64_t v9 = objc_msgSend(v6, "stringWithFormat:", v8, v3);

    uint64_t v10 = [v9 rangeOfString:v3 options:1];
    uint64_t v12 = v11;
    uint64_t v13 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v9];
    if (v12)
    {
      uint64_t v14 = *MEMORY[0x263F1C258];
      uint64_t v15 = [NSURL URLWithString:@"https://weather.com/?par=apple_notificationcenter"];
      objc_msgSend(v13, "addAttribute:value:range:", v14, v15, v10, v12);

      objc_msgSend(v13, "addAttribute:value:range:", *MEMORY[0x263F1C2D8], MEMORY[0x263EFFA88], v10, v12);
    }
    else if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
    {
      WAAttributionString_cold_1((uint64_t)v3, (uint64_t)v9);
    }
  }
  else
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226D1D000, v3, OS_LOG_TYPE_DEFAULT, "WAAttributionString: No provider name, returning nil", buf, 2u);
    }
    uint64_t v13 = 0;
  }

  return v13;
}

id CardinalDirectionStringForIndex(unint64_t a1, int a2)
{
  if (a1 <= 0xF)
  {
    BOOL v4 = &unk_26DAEAA90;
    uint64_t v5 = (void *)__cardinalDirections;
    if (a2) {
      BOOL v4 = &unk_26DAEAA78;
    }
    __cardinalDirections = (uint64_t)v4;

    int v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v7 = [(id)__cardinalDirections objectAtIndexedSubscript:a1];
    uint64_t v2 = [v6 localizedStringForKey:v7 value:&stru_26DADC2F0 table:@"WeatherFrameworkLocalizableStrings"];
  }
  else
  {
    uint64_t v2 = 0;
  }
  return v2;
}

double WeatherRowDegreeOffset()
{
  return 0.0;
}

id WeatherFrameworkBundle()
{
  if (WeatherFrameworkBundle_onceToken != -1) {
    dispatch_once(&WeatherFrameworkBundle_onceToken, &__block_literal_global_5);
  }
  uint64_t v0 = (void *)__bundle;
  return v0;
}

uint64_t __WeatherFrameworkBundle_block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v1 = __bundle;
  __bundle = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

BOOL IsLoDPI()
{
  uint64_t v0 = [MEMORY[0x263F1C920] mainScreen];
  [v0 scale];
  BOOL v2 = v1 < 2.0;

  return v2;
}

uint64_t IsInternalInstall()
{
  if (IsInternalInstall_onceToken != -1) {
    dispatch_once(&IsInternalInstall_onceToken, &__block_literal_global_4);
  }
  return IsInternalInstall___isInternalInstall;
}

uint64_t __IsInternalInstall_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  IsInternalInstall___isInternalInstall = result;
  return result;
}

uint64_t IsTallDevice()
{
  if (IsTallDevice_onceToken != -1) {
    dispatch_once(&IsTallDevice_onceToken, &__block_literal_global_7);
  }
  return IsTallDevice___isTallDevice;
}

void __IsTallDevice_block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v1 = [v0 userInterfaceIdiom];

  if (!v1)
  {
    BOOL v2 = [MEMORY[0x263F1C920] mainScreen];
    [v2 bounds];
    CGFloat v4 = v3;
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;

    v11.origin.x = v4;
    v11.origin.y = v6;
    v11.size.width = v8;
    v11.size.height = v10;
    IsTallDevice___isTallDevice = CGRectGetHeight(v11) + -568.0 > -2.22044605e-16;
  }
}

uint64_t ShouldUseLargeiPadLayout()
{
  return objc_msgSend(MEMORY[0x263F581C8], "naui_shouldUseLargeiPadLayout");
}

uint64_t ShouldUseLargeiPadLayoutForSize()
{
  return objc_msgSend(MEMORY[0x263F581C8], "naui_shouldUseLargeiPadLayoutForSize:");
}

uint64_t IsPad()
{
  return objc_msgSend(MEMORY[0x263F581C8], "naui_isPad");
}

double GetDeviceWidth()
{
  uint64_t v0 = [MEMORY[0x263F1C920] mainScreen];
  [v0 _referenceBounds];
  double v2 = v1;

  return v2;
}

double GetDeviceHeight()
{
  uint64_t v0 = [MEMORY[0x263F1C920] mainScreen];
  [v0 _referenceBounds];
  double v2 = v1;

  return v2;
}

uint64_t SupportsLandscapeWeather()
{
  if (SupportsLandscapeWeather_onceToken != -1) {
    dispatch_once(&SupportsLandscapeWeather_onceToken, &__block_literal_global_11);
  }
  return SupportsLandscapeWeather_support;
}

uint64_t __SupportsLandscapeWeather_block_invoke()
{
  uint64_t result = objc_msgSend(MEMORY[0x263F581C8], "naui_isPad");
  SupportsLandscapeWeather_support = result;
  return result;
}

BOOL WAIsShortDevice()
{
  return GetDeviceHeight() < 667.0;
}

id TemperatureDegreeSign(int a1)
{
  double v1 = @"TEMP_UNIT_FAHRENHEIT";
  if (a1) {
    double v1 = @"TEMP_UNIT_CELSIUS";
  }
  double v2 = (void *)MEMORY[0x263F086E0];
  double v3 = v1;
  CGFloat v4 = [v2 bundleForClass:objc_opt_class()];
  double v5 = [v4 localizedStringForKey:v3 value:&stru_26DADC2F0 table:@"WeatherFrameworkLocalizableStrings"];

  return v5;
}

id TemperatureDegreeSignShort(int a1)
{
  double v1 = @"TEMP_UNIT_FAHRENHEIT_SHORT";
  if (a1) {
    double v1 = @"TEMP_UNIT_CELSIUS_SHORT";
  }
  double v2 = (void *)MEMORY[0x263F086E0];
  double v3 = v1;
  CGFloat v4 = [v2 bundleForClass:objc_opt_class()];
  double v5 = [v4 localizedStringForKey:v3 value:&stru_26DADC2F0 table:@"WeatherFrameworkLocalizableStrings"];

  return v5;
}

__CFString *PrecipitationDescription(void *a1)
{
  uint64_t v1 = [a1 precipitationForecast];
  double v2 = @"CHANCE_OF_RAIN";
  if (v1 == 4) {
    double v2 = @"CHANCE_OF_HAIL";
  }
  if (v1 == 3) {
    return @"CHANCE_OF_SNOW";
  }
  else {
    return v2;
  }
}

double SpecialTemperatureForCity(void *a1, __CFString **a2)
{
  id v3 = a1;
  CGFloat v4 = [v3 feelsLike];
  [v4 temperatureForUnit:WAUserTemperatureUnit()];
  double v6 = v5;

  [v3 windChill];
  double v8 = v7;
  [v3 heatIndex];
  float v10 = v9;

  if (*(double *)&CityMaxWindChillTemperature >= v8)
  {
    CGRect v11 = @"WIND_CHILL";
  }
  else
  {
    double v8 = v10;
    if (*(double *)&CityMinHeatIndexTemperature <= v10)
    {
      CGRect v11 = @"HEAT_INDEX";
    }
    else
    {
      CGRect v11 = @"FEELS_LIKE";
      double v8 = v6;
    }
  }
  *a2 = v11;
  return v8;
}

uint64_t WAUserTemperatureUnit()
{
  uint64_t v0 = [MEMORY[0x263F85F88] sharedObserver];
  uint64_t v1 = [v0 temperatureUnit];

  return v1;
}

double ChanceOfRainWithHourlyForecasts(void *a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v1 = a1;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v14 objects:v18 count:16];
  double v3 = 0.0;
  double v4 = 0.0;
  if (v2)
  {
    uint64_t v5 = v2;
    uint64_t v6 = *(void *)v15;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v1);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * v7) percentPrecipitation];
        double v4 = v4 + v8;
        double v3 = v3 + 1.0;
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v1 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
  double v9 = v4 / v3 / 10.0;
  if (v3 <= 0.0) {
    double v9 = 0.0;
  }
  double v10 = round(v9) * 10.0;
  double v11 = fmax(v10, 10.0);
  if (v4 <= 0.0) {
    double v12 = v10;
  }
  else {
    double v12 = v11;
  }

  return v12;
}

uint64_t TimeStringToIntValue(void *a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v1 = a1;
  if ((unint64_t)[v1 length] > 2)
  {
    double v4 = objc_msgSend(v1, "stringByReplacingOccurrencesOfString:withString:options:range:", @":", &stru_26DADC2F0, 0, 2, 1);
    uint64_t v3 = [v4 intValue];
  }
  else
  {
    uint64_t v2 = WALogForCategory(0);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      id v7 = v1;
      _os_log_impl(&dword_226D1D000, v2, OS_LOG_TYPE_DEFAULT, "Malformed Time String %@", (uint8_t *)&v6, 0xCu);
    }

    uint64_t v3 = 0;
  }

  return v3;
}

uint64_t IsPrecipitationCondition(unint64_t a1)
{
  unint64_t v1 = (0xEFE800070000uLL >> a1) & 1;
  if (a1 > 0x2F) {
    LODWORD(v1) = 0;
  }
  if (a1 - 3 >= 0xC) {
    unsigned int v2 = v1;
  }
  else {
    unsigned int v2 = 1;
  }
  if (a1 == 1) {
    return 1;
  }
  else {
    return v2;
  }
}

id WoeidFromLocationID(void *a1)
{
  id v1 = a1;
  unsigned int v2 = [v1 componentsSeparatedByString:@"|"];
  if ((unint64_t)[v2 count] < 2)
  {
    id v3 = v1;
  }
  else
  {
    id v3 = [v2 objectAtIndex:1];
  }
  double v4 = v3;

  return v4;
}

id WATemperatureStringFromString(void *a1, uint64_t a2)
{
  id v3 = (objc_class *)MEMORY[0x263F85F70];
  id v4 = a1;
  id v5 = [v3 alloc];
  [v4 doubleValue];
  double v7 = v6;

  uint64_t v8 = (void *)[v5 initWithTemperatureUnit:a2 value:v7];
  double v9 = WATemperatureString(v8);

  return v9;
}

id WATemperatureString(void *a1)
{
  id v1 = a1;
  uint64_t v2 = WAUserTemperatureUnit();
  id v3 = WATemperatureStringForOutputUnit(v1, v2);

  return v3;
}

__CFString *WATemperatureStringForOutputUnit(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = v3;
  if (a2)
  {
    if (v3)
    {
      uint64_t v5 = [v3 temperatureForUnit:a2];
      LODWORD(v5) = llround(v6);
      LocalizedDecimalString(v5);
      double v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      double v7 = @"--";
    }
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

id LocalizedDecimalString(uint64_t a1)
{
  uint64_t v2 = (void *)__decimalNumberFormatter;
  if (!__decimalNumberFormatter)
  {
    id v3 = objc_alloc_init(MEMORY[0x263F08A30]);
    id v4 = (void *)__decimalNumberFormatter;
    __decimalNumberFormatter = (uint64_t)v3;

    [(id)__decimalNumberFormatter setNumberStyle:1];
    uint64_t v2 = (void *)__decimalNumberFormatter;
  }
  uint64_t v5 = [NSNumber numberWithInt:a1];
  double v6 = [v2 stringFromNumber:v5];

  return v6;
}

BOOL WAIsChinaSKUAndSimplifiedChinese()
{
  uint64_t v0 = CPGetDeviceRegionCode();
  if ([v0 isEqualToString:@"CH"])
  {
    id v1 = [MEMORY[0x263EFF960] currentLocale];
    uint64_t v2 = [v1 localeIdentifier];

    BOOL v3 = ([v2 hasPrefix:@"zh-Hans"] & 1) != 0
      || [v2 hasPrefix:@"zh_CN"];
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

uint64_t WAIsPadAndChinaSKU()
{
  uint64_t result = objc_msgSend(MEMORY[0x263F581C8], "naui_isPad");
  if (result)
  {
    id v1 = CPGetDeviceRegionCode();
    uint64_t v2 = [v1 isEqualToString:@"CH"];

    return v2;
  }
  return result;
}

void WAPresentFirstUsageDialogIfNeeded()
{
  network_usage_policy_create_client();
  uint64_t v0 = dispatch_semaphore_create(0);
  int network_use_flow = perform_first_network_use_flow();
  if (network_use_flow)
  {
    int v2 = network_use_flow;
    BOOL v3 = WALogForCategory(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      WAPresentFirstUsageDialogIfNeeded_cold_1(v2, v3);
    }
  }
  else
  {
    dispatch_time_t v4 = dispatch_time(0, 60000000000);
    dispatch_semaphore_wait(v0, v4);
  }
  network_usage_policy_destroy_client();
}

intptr_t __WAPresentFirstUsageDialogIfNeeded_block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    BOOL v3 = WALogForCategory(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_226D1D000, v3, OS_LOG_TYPE_DEFAULT, "Presenting first usage dialog", v5, 2u);
    }
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t IsAllCapsMeridiemIndicatorRegion()
{
  if (IsAllCapsMeridiemIndicatorRegion_onceToken != -1) {
    dispatch_once(&IsAllCapsMeridiemIndicatorRegion_onceToken, &__block_literal_global_69);
  }
  return IsAllCapsMeridiemIndicatorRegion_isAllCapsLanguage;
}

void __IsAllCapsMeridiemIndicatorRegion_block_invoke()
{
  uint64_t v0 = [MEMORY[0x263EFF960] preferredLanguages];
  id v1 = [v0 objectAtIndex:0];

  if ([v1 hasPrefix:@"en"]) {
    IsAllCapsMeridiemIndicatorRegion_isAllCapsLanguage = 1;
  }
}

uint64_t IsUIRTL()
{
  if (IsUIRTL_onceToken != -1) {
    dispatch_once(&IsUIRTL_onceToken, &__block_literal_global_74);
  }
  return IsUIRTL_isUIRTL;
}

uint64_t __IsUIRTL_block_invoke()
{
  uint64_t result = [(id)*MEMORY[0x263F1D020] userInterfaceLayoutDirection];
  IsUIRTL_isUIRTL = result == 1;
  return result;
}

void ClearNumberRTL()
{
  gIsNumberRTL = 0;
  gIsNumberRTLSet = 0;
}

uint64_t IsNumberRTL()
{
  if ((gIsNumberRTLSet & 1) == 0)
  {
    uint64_t v0 = (void *)__percentNumberFormatter;
    if (!__percentNumberFormatter)
    {
      id v1 = objc_alloc_init(MEMORY[0x263F08A30]);
      int v2 = (void *)__percentNumberFormatter;
      __percentNumberFormatter = (uint64_t)v1;

      [(id)__percentNumberFormatter setNumberStyle:3];
      uint64_t v0 = (void *)__percentNumberFormatter;
    }
    gIsNumberRTL = 1;
    BOOL v3 = [v0 stringFromNumber:&unk_26DAEB018];
    uint64_t v4 = [v3 rangeOfString:@"%"];

    if (v4 != 0x7FFFFFFFFFFFFFFFLL) {
      gIsNumberRTL = 0;
    }
    gIsNumberRTLSet = 1;
  }
  return gIsNumberRTL;
}

uint64_t IsDynamicTypeLargeOrSmaller()
{
  uint64_t v0 = [MEMORY[0x263F1C408] sharedApplication];
  id v1 = [v0 preferredContentSizeCategory];

  if (([v1 isEqualToString:*MEMORY[0x263F1D178]] & 1) != 0
    || ([v1 isEqualToString:*MEMORY[0x263F1D198]] & 1) != 0
    || ([v1 isEqualToString:*MEMORY[0x263F1D188]] & 1) != 0)
  {
    uint64_t v2 = 1;
  }
  else
  {
    uint64_t v2 = [v1 isEqualToString:*MEMORY[0x263F1D180]];
  }

  return v2;
}

id FormatShortTime(void *a1, int a2, int a3)
{
  id v5 = a1;
  if (__timeFormatter)
  {
    if (a2)
    {
LABEL_3:
      double v6 = (void *)__formatStringWithMinutes;
      if (__formatStringWithMinutes) {
        goto LABEL_9;
      }
      double v7 = (void *)MEMORY[0x263F08790];
      uint64_t v8 = [MEMORY[0x263EFF960] currentLocale];
      double v9 = [v7 dateFormatFromTemplate:@"jmm" options:0 locale:v8];
      double v10 = &__formatStringWithMinutes;
      goto LABEL_8;
    }
  }
  else
  {
    id v11 = objc_alloc_init(MEMORY[0x263F08790]);
    double v12 = (void *)__timeFormatter;
    __timeFormatter = (uint64_t)v11;

    if (a2) {
      goto LABEL_3;
    }
  }
  double v6 = (void *)__formatStringWithoutMinutes;
  if (__formatStringWithoutMinutes) {
    goto LABEL_9;
  }
  uint64_t v13 = (void *)MEMORY[0x263F08790];
  uint64_t v8 = [MEMORY[0x263EFF960] currentLocale];
  double v9 = [v13 dateFormatFromTemplate:@"j" options:0 locale:v8];
  double v10 = &__formatStringWithoutMinutes;
LABEL_8:
  uint64_t v14 = [v9 copy];
  long long v15 = (void *)*v10;
  *double v10 = v14;

  double v6 = (void *)*v10;
LABEL_9:
  id v16 = v6;
  if (a3)
  {
    long long v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    double v18 = [v17 localizedStringForKey:@"STRING_TO_REMOVE_FROM_CONDENSED_TIME_FORMAT" value:&stru_26DADC2F0 table:@"WeatherFrameworkLocalizableStrings"];
    uint64_t v19 = [v16 stringByReplacingOccurrencesOfString:v18 withString:&stru_26DADC2F0];

    id v16 = (id)v19;
  }
  [(id)__timeFormatter setDateFormat:v16];
  uint64_t v20 = [(id)__timeFormatter stringFromDate:v5];

  return v20;
}

id TimeInRegionFormatFromFourDigitTime(void *a1, int a2)
{
  id v3 = a1;
  uint64_t v4 = [v3 length];
  if (v4 < 3)
  {
    uint64_t v14 = 0;
  }
  else
  {
    uint64_t v5 = v4 - 2;
    double v6 = objc_msgSend(v3, "substringWithRange:", v4 - 2, 2);
    double v7 = objc_msgSend(v3, "substringWithRange:", 0, v5);
    CFLocaleRef v8 = CFLocaleCopyCurrent();
    double v9 = (void *)__components;
    if (!__components)
    {
      id v10 = objc_alloc_init(MEMORY[0x263EFF918]);
      id v11 = (void *)__components;
      __components = (uint64_t)v10;

      double v9 = (void *)__components;
    }
    objc_msgSend(v9, "setHour:", (int)objc_msgSend(v7, "intValue"));
    objc_msgSend((id)__components, "setMinute:", (int)objc_msgSend(v6, "intValue"));
    double v12 = GetCurrentCalendar();
    uint64_t v13 = [v12 dateFromComponents:__components];
    uint64_t v14 = FormatShortTime(v13, 1, a2);

    if (v8) {
      CFRelease(v8);
    }
  }
  return v14;
}

id GetCurrentCalendar()
{
  uint64_t v0 = (void *)__currentCalendar;
  if (!__currentCalendar)
  {
    uint64_t v1 = [MEMORY[0x263EFF8F0] currentCalendar];
    uint64_t v2 = (void *)__currentCalendar;
    __currentCalendar = v1;

    uint64_t v0 = (void *)__currentCalendar;
  }
  return v0;
}

id WAUIFormattedTimeString(void *a1, void *a2)
{
  v30[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = (void *)[a1 mutableCopy];
  uint64_t v29 = *MEMORY[0x263F1D1E8];
  uint64_t v5 = *MEMORY[0x263F1D218];
  v26[0] = *MEMORY[0x263F1D220];
  v26[1] = v5;
  v27[0] = &unk_26DAEAF10;
  v27[1] = &unk_26DAEAF28;
  double v6 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];
  v28 = v6;
  double v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v28 count:1];
  v30[0] = v7;
  CFLocaleRef v8 = [NSDictionary dictionaryWithObjects:v30 forKeys:&v29 count:1];

  double v9 = [v3 fontDescriptor];
  id v10 = [v9 fontDescriptorByAddingAttributes:v8];

  id v11 = [MEMORY[0x263F1C658] fontWithDescriptor:v10 size:0.0];
  double v12 = [MEMORY[0x263EFF960] currentLocale];
  uint64_t v13 = [v12 languageCode];

  LOBYTE(v12) = [v13 isEqualToString:@"en"];
  uint64_t v14 = [v4 length];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __WAUIFormattedTimeString_block_invoke;
  v21[3] = &unk_2647E04E0;
  char v25 = (char)v12;
  id v15 = v4;
  id v22 = v15;
  id v23 = v11;
  id v24 = v3;
  id v16 = v3;
  id v17 = v11;
  objc_msgSend(v15, "enumerateAttributesInRange:options:usingBlock:", 0, v14, 0, v21);
  double v18 = v24;
  id v19 = v15;

  return v19;
}

void __WAUIFormattedTimeString_block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  v16[1] = *MEMORY[0x263EF8340];
  id v7 = a2;
  if (*(unsigned char *)(a1 + 56))
  {
    CFLocaleRef v8 = [*(id *)(a1 + 32) string];
    double v9 = objc_msgSend(v8, "substringWithRange:", a3, a4);

    id v10 = [MEMORY[0x263F08708] whitespaceCharacterSet];
    id v11 = [v9 stringByTrimmingCharactersInSet:v10];

    if (![v11 length])
    {
      objc_msgSend(*(id *)(a1 + 32), "deleteCharactersInRange:", a3, a4);
      goto LABEL_8;
    }
  }
  double v9 = [v7 objectForKeyedSubscript:*MEMORY[0x263EFF460]];
  int v12 = [v9 isEqualToString:@"a"];
  uint64_t v13 = 48;
  if (v12) {
    uint64_t v13 = 40;
  }
  id v11 = *(id *)(a1 + v13);
  uint64_t v15 = *MEMORY[0x263F1C238];
  v16[0] = v11;
  uint64_t v14 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
  objc_msgSend(*(id *)(a1 + 32), "setAttributes:range:", v14, a3, a4);

LABEL_8:
}

id WATimeInRegionFormat(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [a1 componentsSeparatedByString:@":"];
  if ((unint64_t)[v4 count] < 2)
  {
    id v16 = 0;
  }
  else
  {
    uint64_t v5 = [v4 objectAtIndex:0];
    double v6 = [v4 objectAtIndex:1];
    id v7 = (void *)__components;
    if (!__components)
    {
      id v8 = objc_alloc_init(MEMORY[0x263EFF918]);
      double v9 = (void *)__components;
      __components = (uint64_t)v8;

      id v7 = (void *)__components;
    }
    objc_msgSend(v7, "setHour:", (int)objc_msgSend(v5, "intValue"));
    objc_msgSend((id)__components, "setMinute:", (int)objc_msgSend(v6, "intValue"));
    if (gDateFormatter) {
      goto LABEL_6;
    }
    id v10 = objc_alloc_init(MEMORY[0x263F08790]);
    id v11 = (void *)gDateFormatter;
    gDateFormatter = (uint64_t)v10;

    [(id)gDateFormatter setDateStyle:0];
    [(id)gDateFormatter setTimeStyle:1];
    int v12 = [MEMORY[0x263EFF960] currentLocale];
    [(id)gDateFormatter setLocale:v12];

    if (gDateFormatter)
    {
LABEL_6:
      uint64_t v13 = GetCurrentCalendar();
      uint64_t v14 = [v13 dateFromComponents:__components];

      uint64_t v15 = [(id)gDateFormatter _attributedStringWithFieldsFromDate:v14];
      id v16 = WAUIFormattedTimeString(v15, v3);
    }
    else
    {
      id v16 = 0;
    }
  }
  return v16;
}

id WATimeInRegionFormatFromFourDigitTime(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  uint64_t v5 = [v4 substringToIndex:2];
  double v6 = [v4 substringFromIndex:2];

  id v7 = [NSString stringWithFormat:@"%@:%@", v5, v6];
  id v8 = WATimeInRegionFormat(v7, v3);

  return v8;
}

id WACondensedTimeInRegionFormat(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1 componentsSeparatedByString:@":"];
  if ((unint64_t)[v4 count] < 2)
  {
    uint64_t v20 = 0;
  }
  else
  {
    uint64_t v5 = [v4 objectAtIndex:0];
    double v6 = [v4 objectAtIndex:1];
    id v7 = (void *)__components;
    if (!__components)
    {
      id v8 = objc_alloc_init(MEMORY[0x263EFF918]);
      double v9 = (void *)__components;
      __components = (uint64_t)v8;

      id v7 = (void *)__components;
    }
    objc_msgSend(v7, "setHour:", (int)objc_msgSend(v5, "intValue"));
    objc_msgSend((id)__components, "setMinute:", (int)objc_msgSend(v6, "intValue"));
    if (gCondensedTimeFormatter) {
      goto LABEL_8;
    }
    if (!__formatStringWithoutMinutes)
    {
      id v10 = (void *)MEMORY[0x263F08790];
      id v11 = [MEMORY[0x263EFF960] currentLocale];
      int v12 = [v10 dateFormatFromTemplate:@"j" options:0 locale:v11];
      uint64_t v13 = [v12 copy];
      uint64_t v14 = (void *)__formatStringWithoutMinutes;
      __formatStringWithoutMinutes = v13;
    }
    id v15 = objc_alloc_init(MEMORY[0x263F08790]);
    id v16 = (void *)gCondensedTimeFormatter;
    gCondensedTimeFormatter = (uint64_t)v15;

    [(id)gCondensedTimeFormatter setDateFormat:__formatStringWithoutMinutes];
    if (gCondensedTimeFormatter)
    {
LABEL_8:
      id v17 = GetCurrentCalendar();
      double v18 = [v17 dateFromComponents:__components];

      id v19 = [(id)gCondensedTimeFormatter _attributedStringWithFieldsFromDate:v18];
      uint64_t v20 = WAUIFormattedTimeString(v19, v3);
    }
    else
    {
      uint64_t v20 = 0;
    }
  }
  return v20;
}

id weatherWeekdayFormatter()
{
  uint64_t v0 = (void *)gWeekdayFormatter;
  if (!gWeekdayFormatter)
  {
    id v1 = objc_alloc_init(MEMORY[0x263F08790]);
    uint64_t v2 = (void *)gWeekdayFormatter;
    gWeekdayFormatter = (uint64_t)v1;

    [(id)gWeekdayFormatter setDateStyle:0];
    [(id)gWeekdayFormatter setTimeStyle:0];
    id v3 = [MEMORY[0x263EFF960] autoupdatingCurrentLocale];
    [(id)gWeekdayFormatter setLocale:v3];

    [(id)gWeekdayFormatter setFormattingContext:2];
    uint64_t v0 = (void *)gWeekdayFormatter;
  }
  return v0;
}

id weekdayNameForDayOfWeekHelper(unint64_t a1, int a2)
{
  id v4 = weatherWeekdayFormatter();
  uint64_t v5 = v4;
  if (a2)
  {
    double v6 = (void *)gShortWeekdayNames;
    if (gShortWeekdayNames) {
      goto LABEL_7;
    }
    uint64_t v7 = [v4 shortStandaloneWeekdaySymbols];
    id v8 = &gShortWeekdayNames;
  }
  else
  {
    double v6 = (void *)gWeekdayNames;
    if (gWeekdayNames) {
      goto LABEL_7;
    }
    uint64_t v7 = [v4 standaloneWeekdaySymbols];
    id v8 = &gWeekdayNames;
  }
  double v9 = (void *)*v8;
  uint64_t *v8 = v7;

  double v6 = (void *)*v8;
LABEL_7:
  id v10 = v6;
  id v11 = v10;
  unint64_t v12 = 7;
  if (a1 < 7) {
    unint64_t v12 = a1;
  }
  if (v12 <= 1) {
    unint64_t v12 = 1;
  }
  uint64_t v13 = [v10 objectAtIndex:v12 - 1];

  return v13;
}

id shortWeekdayNameForDayOfWeek(unint64_t a1)
{
  return weekdayNameForDayOfWeekHelper(a1, 1);
}

id weekdayNameForDayOfWeek(unint64_t a1)
{
  return weekdayNameForDayOfWeekHelper(a1, 0);
}

id weekdayNameForDate(void *a1)
{
  id v1 = a1;
  uint64_t v2 = weatherWeekdayFormatter();
  id v3 = [v2 stringFromDate:v1];

  return v3;
}

id WAMonospacedFont(void *a1)
{
  v13[1] = *MEMORY[0x263EF8340];
  id v1 = [a1 fontDescriptor];
  uint64_t v12 = *MEMORY[0x263F1D1E8];
  uint64_t v2 = *MEMORY[0x263F1D218];
  v9[0] = *MEMORY[0x263F1D220];
  v9[1] = v2;
  v10[0] = &unk_26DAEAF40;
  v10[1] = &unk_26DAEAF58;
  id v3 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  id v11 = v3;
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v11 count:1];
  v13[0] = v4;
  uint64_t v5 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
  double v6 = [v1 fontDescriptorByAddingAttributes:v5];

  uint64_t v7 = [MEMORY[0x263F1C658] fontWithDescriptor:v6 size:0.0];

  return v7;
}

void WAWeatherUtilityResetForTimeChange()
{
  uint64_t v0 = (void *)__currentCalendar;
  __currentCalendar = 0;
}

id LocalizedPercentageString(double a1)
{
  int v1 = LODWORD(a1);
  uint64_t v2 = (void *)__percentNumberFormatter;
  if (!__percentNumberFormatter)
  {
    id v3 = objc_alloc_init(MEMORY[0x263F08A30]);
    id v4 = (void *)__percentNumberFormatter;
    __percentNumberFormatter = (uint64_t)v3;

    [(id)__percentNumberFormatter setNumberStyle:3];
    uint64_t v2 = (void *)__percentNumberFormatter;
  }
  LODWORD(a1) = v1;
  uint64_t v5 = [NSNumber numberWithFloat:a1];
  double v6 = [v2 stringFromNumber:v5];

  return v6;
}

uint64_t LocalizedPercentageSign()
{
  uint64_t v0 = (void *)__percentNumberFormatter;
  if (!__percentNumberFormatter)
  {
    id v1 = objc_alloc_init(MEMORY[0x263F08A30]);
    uint64_t v2 = (void *)__percentNumberFormatter;
    __percentNumberFormatter = (uint64_t)v1;

    [(id)__percentNumberFormatter setNumberStyle:3];
    uint64_t v0 = (void *)__percentNumberFormatter;
  }
  return [v0 percentSymbol];
}

void WeatherUtilityFunctionsLocaleChanged()
{
  uint64_t v0 = (void *)gDateFormatter;
  gDateFormatter = 0;

  id v1 = (void *)gCondensedTimeFormatter;
  gCondensedTimeFormatter = 0;

  uint64_t v2 = (void *)gWeekdayFormatter;
  gWeekdayFormatter = 0;

  id v3 = (void *)gWeekdayNames;
  gWeekdayNames = 0;

  id v4 = (void *)gShortWeekdayNames;
  gShortWeekdayNames = 0;

  uint64_t v5 = (void *)__components;
  __components = 0;

  double v6 = (void *)__currentCalendar;
  __currentCalendar = 0;

  uint64_t v7 = (void *)__percentNumberFormatter;
  __percentNumberFormatter = 0;

  id v8 = (void *)__decimalNumberFormatter;
  __decimalNumberFormatter = 0;

  double v9 = (void *)__timeFormatter;
  __timeFormatter = 0;

  id v10 = (void *)__formatStringWithoutMinutes;
  __formatStringWithoutMinutes = 0;

  id v11 = (void *)__formatStringWithMinutes;
  __formatStringWithMinutes = 0;

  gIsNumberRTL = 0;
  gIsNumberRTLSet = 0;
}

uint64_t Time24StringToInt(void *a1)
{
  id v1 = [a1 stringByReplacingOccurrencesOfString:@":" withString:&stru_26DADC2F0];
  int v2 = [v1 intValue];
  if (v2 >= 100) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = (v2 + 2400);
  }

  return v3;
}

uint64_t RemapSmallIconForDayOrNight(uint64_t result, int a2)
{
  if (a2)
  {
    uint64_t v2 = result - 27;
    if (unint64_t)(result - 27) < 7 && ((0x55u >> v2))
    {
      uint64_t v3 = &unk_226D6EF88;
      return v3[v2];
    }
  }
  else
  {
    uint64_t v2 = result - 28;
    if (unint64_t)(result - 28) < 7 && ((0x55u >> v2))
    {
      uint64_t v3 = &unk_226D6EFC0;
      return v3[v2];
    }
  }
  return result;
}

uint64_t RemapStringIndexForDayOrNight(uint64_t result, int a2)
{
  if (a2)
  {
    uint64_t v2 = result - 27;
    if (unint64_t)(result - 27) < 7 && ((0x55u >> v2))
    {
      uint64_t v3 = &unk_226D6EF88;
      return v3[v2];
    }
  }
  else
  {
    uint64_t v2 = result - 28;
    if (unint64_t)(result - 28) < 7 && ((0x55u >> v2))
    {
      uint64_t v3 = &unk_226D6EFC0;
      return v3[v2];
    }
  }
  return result;
}

float toRadians(float a1)
{
  return a1 * 0.0174532925;
}

float haversineDistance(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  [v4 coordinate];
  float v6 = v5;
  [v3 coordinate];
  float v8 = v7;
  [v4 coordinate];
  double v10 = v9;

  float v11 = v10;
  [v3 coordinate];
  double v13 = v12;

  float v14 = v13;
  float v15 = (float)(v8 - v6) * 0.0174532925;
  float v16 = (float)(v14 - v11) * 0.0174532925;
  *(float *)&double v13 = v6 * 0.0174532925;
  float v17 = v8 * 0.0174532925;
  float v18 = sinf(v15 * 0.5);
  float v19 = sinf(v16 * 0.5);
  *(float *)&double v13 = cosf(*(float *)&v13) * (float)(v19 * v19);
  float v20 = cosf(v17);
  long double v21 = atan2(sqrt((float)((float)(v20 * *(float *)&v13) + (float)(v18 * v18))), sqrt((float)(1.0 - (float)((float)(v20 * *(float *)&v13) + (float)(v18 * v18)))));
  *(float *)&long double v21 = v21 + v21;
  return *(float *)&v21 * 6371.0;
}

id FirstValidTWCLinkFromLinks(void *a1)
{
  id v1 = a1;
  uint64_t v5 = 0;
  float v6 = &v5;
  uint64_t v7 = 0x3032000000;
  float v8 = __Block_byref_object_copy_;
  double v9 = __Block_byref_object_dispose_;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __FirstValidTWCLinkFromLinks_block_invoke;
  v4[3] = &unk_2647E0508;
  v4[4] = &v5;
  [v1 enumerateObjectsUsingBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void sub_226D2D7A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __FirstValidTWCLinkFromLinks_block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if (objc_msgSend((id)*MEMORY[0x263F1D020], "canOpenURL:"))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

id SelectTWCLinkForCity(void *a1)
{
  id v1 = a1;
  id v2 = objc_opt_new();
  id v3 = [v1 deeplink];
  objc_msgSend(v2, "na_safeAddObject:", v3);

  id v4 = [v1 link];

  objc_msgSend(v2, "na_safeAddObject:", v4);
  uint64_t v5 = NSURL;
  float v6 = TWCFallbackURL();
  id v7 = [v5 URLWithString:v6];
  objc_msgSend(v2, "na_safeAddObject:", v7);

  float v8 = [MEMORY[0x263EFF9B0] orderedSetWithArray:v2];
  double v9 = FirstValidTWCLinkFromLinks(v8);

  return v9;
}

void OpenTWCLinksInOrder(void *a1)
{
  id v1 = a1;
  id v2 = [v1 firstObject];
  if (v2)
  {
    id v3 = (void *)*MEMORY[0x263F1D020];
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __OpenTWCLinksInOrder_block_invoke;
    v4[3] = &unk_2647E04B8;
    id v5 = v1;
    [v3 openURL:v2 withCompletionHandler:v4];
  }
}

void __OpenTWCLinksInOrder_block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id v3 = (id)[*(id *)(a1 + 32) mutableCopy];
    [v3 removeObjectAtIndex:0];
    OpenTWCLinksInOrder(v3);
  }
}

void OpenTWCLinkForCity(void *a1)
{
  id v1 = a1;
  id v8 = (id)objc_opt_new();
  uint64_t v2 = [v1 deeplink];
  objc_msgSend(v8, "na_safeAddObject:", v2);

  id v3 = [v1 link];

  objc_msgSend(v8, "na_safeAddObject:", v3);
  id v4 = NSURL;
  id v5 = TWCFallbackURL();
  float v6 = [v4 URLWithString:v5];
  objc_msgSend(v8, "na_safeAddObject:", v6);

  id v7 = [MEMORY[0x263EFF9B0] orderedSetWithArray:v8];
  OpenTWCLinksInOrder(v7);
}

uint64_t DateIsTodayInTimezone(void *a1, void *a2)
{
  id v3 = (void *)MEMORY[0x263EFF8F0];
  id v4 = a2;
  id v5 = a1;
  float v6 = [v3 currentCalendar];
  [v6 setTimeZone:v4];

  uint64_t v7 = [v6 isDateInToday:v5];
  return v7;
}

uint64_t DateIsYesterdayInTimezone(void *a1, void *a2)
{
  id v3 = (void *)MEMORY[0x263EFF8F0];
  id v4 = a2;
  id v5 = a1;
  float v6 = [v3 currentCalendar];
  [v6 setTimeZone:v4];

  uint64_t v7 = [v6 isDateInYesterday:v5];
  return v7;
}

BOOL DatesAreNotWithinSameHour(void *a1, void *a2)
{
  id v3 = (void *)MEMORY[0x263EFF8F0];
  id v4 = a2;
  id v5 = a1;
  float v6 = [v3 currentCalendar];
  uint64_t v7 = [v6 component:16 fromDate:v5];
  uint64_t v8 = [v6 component:32 fromDate:v5];

  uint64_t v9 = [v6 component:16 fromDate:v4];
  uint64_t v10 = [v6 component:32 fromDate:v4];

  BOOL v12 = v7 != v9 || v8 != v10;
  return v12;
}

id DateByAddingOneDay(void *a1)
{
  id v1 = (void *)MEMORY[0x263EFF8F0];
  id v2 = a1;
  id v3 = [v1 currentCalendar];
  id v4 = objc_alloc_init(MEMORY[0x263EFF918]);
  [v4 setDay:1];
  id v5 = [v3 dateByAddingComponents:v4 toDate:v2 options:0];

  return v5;
}

double TruncateValueToDecimalAccuracy(int a1, double a2)
{
  double v3 = __exp10((double)a1);
  return floor(a2 * v3 + 0.5) / v3;
}

uint64_t WFTemperatureUnitFromIsCelsiusValue(int a1)
{
  if (a1) {
    return 2;
  }
  else {
    return 1;
  }
}

uint64_t WAObjectIsEqual(void *a1, void *a2)
{
  if (a1 == a2) {
    return 1;
  }
  else {
    return [a1 isEqual:a2];
  }
}

BOOL WAFloatIsEqual(float a1, float a2)
{
  return vabds_f32(a1, a2) < 0.00000011921;
}

BOOL WADoubleIsEqual(double a1, double a2)
{
  return vabdd_f64(a1, a2) < 2.22044605e-16;
}

uint64_t CardinalDirectionFromAngle(double a1)
{
  double v1 = (a1 + 11.25) / 22.5;
  if ((uint64_t)v1 <= 0) {
    return -(-(uint64_t)v1 & 0xF);
  }
  else {
    return (uint64_t)v1 & 0xF;
  }
}

void sub_226D2F3D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_226D30A8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
  objc_destroyWeak(v16);
  _Block_object_dispose(&a16, 8);
  objc_destroyWeak((id *)(v17 - 40));
  _Unwind_Resume(a1);
}

void MigrateDataProtectionClassOfPath(void *a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v2 = v1;
  if (v1)
  {
    id v3 = v1;
    int v4 = open((const char *)[v3 fileSystemRepresentation], 0, 0);
    if ((v4 & 0x80000000) == 0)
    {
      int v5 = v4;
      int v6 = fcntl(v4, 64, 4);
      uint64_t v7 = WALogForCategory(0);
      BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      if (v6 == -1)
      {
        if (v8)
        {
          *(_DWORD *)buf = 138412290;
          id v11 = v3;
          uint64_t v9 = "Failed to Migrate Data Protection Class of %@";
          goto LABEL_8;
        }
      }
      else if (v8)
      {
        *(_DWORD *)buf = 138412290;
        id v11 = v3;
        uint64_t v9 = "Migrated Data Protection Class of %@";
LABEL_8:
        _os_log_impl(&dword_226D1D000, v7, OS_LOG_TYPE_DEFAULT, v9, buf, 0xCu);
      }

      close(v5);
    }
  }
}

id _WAWeatherIconCachePath()
{
  uint64_t v0 = (void *)_WAWeatherIconCachePath___cacheDirectoryPath;
  if (!_WAWeatherIconCachePath___cacheDirectoryPath)
  {
    id v1 = [MEMORY[0x263F1C408] sharedApplication];
    id v2 = [v1 userCachesDirectory];
    uint64_t v3 = [v2 stringByAppendingPathComponent:@"Weather/MiniIcons/"];
    int v4 = (void *)_WAWeatherIconCachePath___cacheDirectoryPath;
    _WAWeatherIconCachePath___cacheDirectoryPath = v3;

    uint64_t v0 = (void *)_WAWeatherIconCachePath___cacheDirectoryPath;
  }
  return v0;
}

void sub_226D322CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

id WATodayHeaderViewDegreeAttributedStringWithTemperatureObject(int a1, void *a2)
{
  v21[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __TemperatureFont_block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = 0x4045800000000000;
    if (TemperatureFont_onceToken != -1) {
      dispatch_once(&TemperatureFont_onceToken, block);
    }
    id v4 = (id)TemperatureFont_font;
    id v5 = objc_alloc(MEMORY[0x263F089B8]);
    uint64_t v6 = *MEMORY[0x263F1C238];
    uint64_t v20 = *MEMORY[0x263F1C238];
    v21[0] = v4;
    uint64_t v7 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
    BOOL v8 = (void *)[v5 initWithString:v3 attributes:v7];

    if (a1)
    {
      uint64_t v9 = [MEMORY[0x263F1C658] systemFontOfSize:18.0 weight:*MEMORY[0x263F1D328]];
      uint64_t v10 = *MEMORY[0x263F1C220];
      v18[0] = v6;
      v18[1] = v10;
      v19[0] = v9;
      id v11 = [NSNumber numberWithDouble:18.0];
      v19[1] = v11;
      uint64_t v12 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];

      double v13 = objc_msgSend(NSString, "stringWithFormat:", @"%C", 176);
      uint64_t v14 = [v3 rangeOfString:v13];
      objc_msgSend(v8, "addAttributes:range:", v12, v14, v15);
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

void __TemperatureFont_block_invoke(uint64_t a1)
{
  v14[3] = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x263F1C660];
  uint64_t v3 = *MEMORY[0x263F03A30];
  v14[0] = *MEMORY[0x263F03A58];
  uint64_t v4 = *MEMORY[0x263F03B60];
  v13[0] = v3;
  v13[1] = v4;
  uint64_t v11 = *MEMORY[0x263F03AB8];
  uint64_t v12 = &unk_26DAEAF88;
  id v5 = [NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  v14[1] = v5;
  void v13[2] = *MEMORY[0x263F03B28];
  uint64_t v6 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
  v14[2] = v6;
  uint64_t v7 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];
  BOOL v8 = [v2 fontDescriptorWithFontAttributes:v7];

  uint64_t v9 = [MEMORY[0x263F1C658] fontWithDescriptor:v8 size:0.0];
  uint64_t v10 = (void *)TemperatureFont_font;
  TemperatureFont_font = v9;
}

BOOL WATodayPadViewFormatForSize(double a1, double a2)
{
  if (a1 < a2) {
    a1 = a2;
  }
  return a1 >= 1366.0;
}

void sub_226D38748(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id WALogForCategory(uint64_t a1)
{
  if (WALogForCategory_onceToken != -1) {
    dispatch_once(&WALogForCategory_onceToken, &__block_literal_global_8);
  }
  id v2 = (void *)WALogForCategory_logObjects[a1];
  return v2;
}

uint64_t __WALogForCategory_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.weather", "Weather");
  id v1 = (void *)WALogForCategory_logObjects[0];
  WALogForCategory_logObjects[0] = (uint64_t)v0;

  os_log_t v2 = os_log_create("com.apple.weather", "WeatherData");
  uint64_t v3 = (void *)qword_26AD6CB80;
  qword_26AD6CB80 = (uint64_t)v2;

  os_log_t v4 = os_log_create("com.apple.weather", "DUET");
  id v5 = (void *)qword_26AD6CB88;
  qword_26AD6CB88 = (uint64_t)v4;

  os_log_t v6 = os_log_create("com.apple.weather", "Left-Of-Home");
  uint64_t v7 = (void *)qword_26AD6CB90;
  qword_26AD6CB90 = (uint64_t)v6;

  os_log_t v8 = os_log_create("com.apple.weather", "Location");
  uint64_t v9 = (void *)qword_26AD6CB98;
  qword_26AD6CB98 = (uint64_t)v8;

  os_log_t v10 = os_log_create("com.apple.weather", "Routing");
  uint64_t v11 = (void *)qword_26AD6CBC0;
  qword_26AD6CBC0 = (uint64_t)v10;

  os_log_t v12 = os_log_create("com.apple.weather", "Preferences");
  double v13 = (void *)qword_26AD6CBA0;
  qword_26AD6CBA0 = (uint64_t)v12;

  os_log_t v14 = os_log_create("com.apple.weather", "PrefsMigration");
  uint64_t v15 = (void *)qword_26AD6CBE8;
  qword_26AD6CBE8 = (uint64_t)v14;

  os_log_t v16 = os_log_create("com.apple.weather", "Reachability");
  uint64_t v17 = (void *)qword_26AD6CBA8;
  qword_26AD6CBA8 = (uint64_t)v16;

  os_log_t v18 = os_log_create("com.apple.weather", "Privacy");
  float v19 = (void *)qword_26AD6CBD8;
  qword_26AD6CBD8 = (uint64_t)v18;

  os_log_t v20 = os_log_create("com.apple.weather", "Search");
  long double v21 = (void *)qword_26AD6CBB0;
  qword_26AD6CBB0 = (uint64_t)v20;

  os_log_t v22 = os_log_create("com.apple.weather", "ORB");
  id v23 = (void *)qword_26AD6CBB8;
  qword_26AD6CBB8 = (uint64_t)v22;

  os_log_t v24 = os_log_create("com.apple.weather", "Today Notification Center");
  char v25 = (void *)qword_26AD6CBC8;
  qword_26AD6CBC8 = (uint64_t)v24;

  os_log_t v26 = os_log_create("com.apple.weather", "Watch");
  v27 = (void *)qword_26AD6CBD0;
  qword_26AD6CBD0 = (uint64_t)v26;

  os_log_t v28 = os_log_create("com.apple.weather", "Next Hour");
  uint64_t v29 = qword_26AD6CBE0;
  qword_26AD6CBE0 = (uint64_t)v28;
  return MEMORY[0x270F9A758](v28, v29);
}

uint64_t CityTimeDigitForTimeZone(void *a1)
{
  v22[2] = *MEMORY[0x263EF8340];
  id v1 = (void *)MEMORY[0x263EFF910];
  id v2 = a1;
  uint64_t v3 = [v1 date];
  if (CityTimeDigitForTimeZone_onceToken != -1) {
    dispatch_once(&CityTimeDigitForTimeZone_onceToken, &__block_literal_global_9);
  }
  uint64_t v4 = [v2 secondsFromGMT];

  id v5 = [NSNumber numberWithUnsignedInteger:v4];
  os_log_t v6 = [(id)CityTimeDigitForTimeZone___timeZoneCache objectForKey:v5];
  uint64_t v7 = [v6 objectForKey:@"ExpiryTime"];
  os_log_t v8 = [v6 objectForKey:@"TimeValue"];
  uint64_t v9 = [v8 integerValue];

  if (!v6 || ([v3 timeIntervalSinceDate:v7], v10 >= 0.0))
  {
    uint64_t v11 = [MEMORY[0x263EFFA18] timeZoneForSecondsFromGMT:v4];
    [(id)CityTimeDigitForTimeZone___currentTimeCalendar setTimeZone:v11];
    os_log_t v12 = [(id)CityTimeDigitForTimeZone___currentTimeCalendar components:96 fromDate:v3];
    uint64_t v13 = [v12 hour];
    os_log_t v20 = v7;
    os_log_t v14 = v3;
    uint64_t v9 = [v12 minute] + 100 * v13;
    uint64_t v15 = (void *)CityTimeDigitForTimeZone___timeZoneCache;
    v21[0] = @"TimeValue";
    os_log_t v16 = [NSNumber numberWithInteger:v9];
    v21[1] = @"ExpiryTime";
    v22[0] = v16;
    uint64_t v17 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:60.0];
    v22[1] = v17;
    os_log_t v18 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
    [v15 setObject:v18 forKey:v5];

    uint64_t v3 = v14;
    uint64_t v7 = v20;
  }
  return v9;
}

uint64_t __CityTimeDigitForTimeZone_block_invoke()
{
  uint64_t v0 = [MEMORY[0x263EFF8F0] currentCalendar];
  id v1 = (void *)CityTimeDigitForTimeZone___currentTimeCalendar;
  CityTimeDigitForTimeZone___currentTimeCalendar = v0;

  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v3 = CityTimeDigitForTimeZone___timeZoneCache;
  CityTimeDigitForTimeZone___timeZoneCache = (uint64_t)v2;
  return MEMORY[0x270F9A758](v2, v3);
}

void sub_226D3A56C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_226D3A694(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_226D3A780(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

void sub_226D3AD90(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

__CFString *LocalizedWeatherDescription(uint64_t a1, int a2, int a3)
{
  if (a1 == 3200)
  {
    uint64_t v3 = &stru_26DADC2F0;
  }
  else
  {
    uint64_t v7 = RemapSmallIconForDayOrNight(a1, a2);
    os_log_t v8 = *(&WeatherDescription + v7);
    if (!v8)
    {
      uint64_t v9 = @"ShowingNight";
      if (a2) {
        uint64_t v9 = @"Showing Day";
      }
      NSLog(&cfstr_WarningNullWea.isa, a1, v7, v9);
    }
    if (a3) {
      double v10 = @"%@-Leader";
    }
    else {
      double v10 = @"%@-Embedded";
    }
    uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", v10, v8);
    os_log_t v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v3 = [v12 localizedStringForKey:v11 value:&stru_26DADC2F0 table:@"WeatherFrameworkLocalizableStrings"];
  }
  return v3;
}

void sub_226D40A34(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_226D49D3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,id location,char a31)
{
  objc_destroyWeak(v31);
  _Block_object_dispose((const void *)(v32 - 192), 8);
  _Block_object_dispose(&a26, 8);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_226D4A5C0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t IsSunsetCondition(unint64_t a1)
{
  return (a1 < 0x25) & (0x1182800000uLL >> a1);
}

__CFString *NSStringFromWAUpdateStatus(unint64_t a1)
{
  if (a1 > 2) {
    return @"(Unknown WAUpdateStatus)";
  }
  else {
    return off_2647E0C20[a1];
  }
}

__CFString *NSStringFromWAUpdateErrorCode(unint64_t a1)
{
  if (a1 > 7) {
    return @"(Unknown WAUpdateErrorCode)";
  }
  else {
    return off_2647E0C38[a1];
  }
}

__CFString *NSStringFromWAWeatherDataAge(unint64_t a1)
{
  if (a1 > 2) {
    return @"(Unknown WAWeatherDataAge)";
  }
  else {
    return off_2647E0C78[a1];
  }
}

__CFString *NSStringFromWAWeatherPressureState(unint64_t a1)
{
  if (a1 > 2) {
    return @"(Unknown WAWeatherPressureState)";
  }
  else {
    return off_2647E0C90[a1];
  }
}

__CFString *NSStringFromWeatherConditionCode(uint64_t a1)
{
  if (a1 == 3200)
  {
    uint64_t v2 = @"(Unknown WeatherCondition)";
  }
  else
  {
    uint64_t v2 = *(&WeatherDescription + a1);
  }
  return v2;
}

id WAErrorWithCode(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = (void *)[a4 mutableCopy];
  double v10 = v9;
  if (v9) {
    id v11 = v9;
  }
  else {
    id v11 = (id)objc_opt_new();
  }
  os_log_t v12 = v11;

  if (v7) {
    [v12 setObject:v7 forKeyedSubscript:*MEMORY[0x263F08608]];
  }
  if (v8) {
    [v12 setObject:v8 forKeyedSubscript:@"kWAUpdateErrorCityKey"];
  }
  uint64_t v13 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.weather.errorDomain" code:a1 userInfo:v12];

  return v13;
}

id WASmallWeatherIconsMap()
{
  if (WASmallWeatherIconsMap_onceToken != -1) {
    dispatch_once(&WASmallWeatherIconsMap_onceToken, &__block_literal_global_12);
  }
  uint64_t v0 = (void *)WASmallWeatherIconsMap_s_smallWeatherIconsMap;
  return v0;
}

void __WASmallWeatherIconsMap_block_invoke()
{
  v218[43] = *MEMORY[0x263EF8340];
  v217[0] = @"blizzard-day";
  v216[0] = &unk_26DAEAAC0;
  v215[0] = @"WeatherMapColors";
  v215[1] = @"WeatherMapPadding";
  long long v130 = xmmword_226D6F2B0;
  v85 = [MEMORY[0x263F08D40] valueWithBytes:&v130 objCType:"{CGPoint=dd}"];
  v216[1] = v85;
  v84 = [NSDictionary dictionaryWithObjects:v216 forKeys:v215 count:2];
  v218[0] = v84;
  v217[1] = @"blizzard-night";
  v214[0] = &unk_26DAEAAD8;
  v213[0] = @"WeatherMapColors";
  v213[1] = @"WeatherMapPadding";
  long long v129 = xmmword_226D6F2B0;
  v83 = [MEMORY[0x263F08D40] valueWithBytes:&v129 objCType:"{CGPoint=dd}"];
  v214[1] = v83;
  v82 = [NSDictionary dictionaryWithObjects:v214 forKeys:v213 count:2];
  v218[1] = v82;
  v217[2] = @"blowingsnow";
  v212[0] = &unk_26DAEAAF0;
  v211[0] = @"WeatherMapColors";
  v211[1] = @"WeatherMapPadding";
  v128[1] = 0;
  v128[0] = 0;
  v81 = [MEMORY[0x263F08D40] valueWithBytes:v128 objCType:"{CGPoint=dd}"];
  v212[1] = v81;
  v80 = [NSDictionary dictionaryWithObjects:v212 forKeys:v211 count:2];
  v218[2] = v80;
  v217[3] = @"breezy";
  v210[0] = &unk_26DAEAB08;
  v209[0] = @"WeatherMapColors";
  v209[1] = @"WeatherMapPadding";
  v127[1] = 0;
  v127[0] = 0;
  v79 = [MEMORY[0x263F08D40] valueWithBytes:v127 objCType:"{CGPoint=dd}"];
  v210[1] = v79;
  v78 = [NSDictionary dictionaryWithObjects:v210 forKeys:v209 count:2];
  v218[3] = v78;
  v217[4] = @"clear-night";
  v208[0] = &unk_26DAEAB20;
  v207[0] = @"WeatherMapColors";
  v207[1] = @"WeatherMapPadding";
  v126[1] = 0;
  v126[0] = 0;
  v77 = [MEMORY[0x263F08D40] valueWithBytes:v126 objCType:"{CGPoint=dd}"];
  v208[1] = v77;
  v76 = [NSDictionary dictionaryWithObjects:v208 forKeys:v207 count:2];
  v218[4] = v76;
  v217[5] = @"drizzle-day";
  v206[0] = &unk_26DAEAB38;
  v205[0] = @"WeatherMapColors";
  v205[1] = @"WeatherMapPadding";
  long long v125 = xmmword_226D6F2B0;
  v75 = [MEMORY[0x263F08D40] valueWithBytes:&v125 objCType:"{CGPoint=dd}"];
  v206[1] = v75;
  v74 = [NSDictionary dictionaryWithObjects:v206 forKeys:v205 count:2];
  v218[5] = v74;
  v217[6] = @"drizzle-night";
  v204[0] = &unk_26DAEAB50;
  v203[0] = @"WeatherMapColors";
  v203[1] = @"WeatherMapPadding";
  long long v124 = xmmword_226D6F2B0;
  v73 = [MEMORY[0x263F08D40] valueWithBytes:&v124 objCType:"{CGPoint=dd}"];
  v204[1] = v73;
  v72 = [NSDictionary dictionaryWithObjects:v204 forKeys:v203 count:2];
  v218[6] = v72;
  v217[7] = @"dust";
  v202[0] = &unk_26DAEAB68;
  v201[0] = @"WeatherMapColors";
  v201[1] = @"WeatherMapPadding";
  v123[1] = 0;
  v123[0] = 0;
  v71 = [MEMORY[0x263F08D40] valueWithBytes:v123 objCType:"{CGPoint=dd}"];
  v202[1] = v71;
  v70 = [NSDictionary dictionaryWithObjects:v202 forKeys:v201 count:2];
  v218[7] = v70;
  v217[8] = @"flurry-snow-shower";
  v200[0] = &unk_26DAEAB80;
  v199[0] = @"WeatherMapColors";
  v199[1] = @"WeatherMapPadding";
  v122[1] = 0;
  v122[0] = 0;
  v69 = [MEMORY[0x263F08D40] valueWithBytes:v122 objCType:"{CGPoint=dd}"];
  v200[1] = v69;
  v68 = [NSDictionary dictionaryWithObjects:v200 forKeys:v199 count:2];
  v218[8] = v68;
  v217[9] = @"flurry";
  v198[0] = &unk_26DAEAB98;
  v197[0] = @"WeatherMapColors";
  v197[1] = @"WeatherMapPadding";
  v121[1] = 0;
  v121[0] = 0;
  v67 = [MEMORY[0x263F08D40] valueWithBytes:v121 objCType:"{CGPoint=dd}"];
  v198[1] = v67;
  v66 = [NSDictionary dictionaryWithObjects:v198 forKeys:v197 count:2];
  v218[9] = v66;
  v217[10] = @"fog-day";
  v196[0] = &unk_26DAEABB0;
  v195[0] = @"WeatherMapColors";
  v195[1] = @"WeatherMapPadding";
  long long v120 = xmmword_226D6F2C0;
  v65 = [MEMORY[0x263F08D40] valueWithBytes:&v120 objCType:"{CGPoint=dd}"];
  v196[1] = v65;
  v64 = [NSDictionary dictionaryWithObjects:v196 forKeys:v195 count:2];
  v218[10] = v64;
  v217[11] = @"fog-night";
  v194[0] = &unk_26DAEABC8;
  v193[0] = @"WeatherMapColors";
  v193[1] = @"WeatherMapPadding";
  long long v119 = xmmword_226D6F2C0;
  v63 = [MEMORY[0x263F08D40] valueWithBytes:&v119 objCType:"{CGPoint=dd}"];
  v194[1] = v63;
  v62 = [NSDictionary dictionaryWithObjects:v194 forKeys:v193 count:2];
  v218[11] = v62;
  v217[12] = @"hail-day";
  v192[0] = &unk_26DAEABE0;
  v191[0] = @"WeatherMapColors";
  v191[1] = @"WeatherMapPadding";
  long long v118 = xmmword_226D6F2B0;
  v61 = [MEMORY[0x263F08D40] valueWithBytes:&v118 objCType:"{CGPoint=dd}"];
  v192[1] = v61;
  v60 = [NSDictionary dictionaryWithObjects:v192 forKeys:v191 count:2];
  v218[12] = v60;
  v217[13] = @"hail-night";
  v190[0] = &unk_26DAEABF8;
  v189[0] = @"WeatherMapColors";
  v189[1] = @"WeatherMapPadding";
  long long v117 = xmmword_226D6F2B0;
  v59 = [MEMORY[0x263F08D40] valueWithBytes:&v117 objCType:"{CGPoint=dd}"];
  v190[1] = v59;
  v58 = [NSDictionary dictionaryWithObjects:v190 forKeys:v189 count:2];
  v218[13] = v58;
  v217[14] = @"haze";
  v188[0] = &unk_26DAEAC10;
  v187[0] = @"WeatherMapColors";
  v187[1] = @"WeatherMapPadding";
  v116[1] = 0;
  v116[0] = 0;
  v57 = [MEMORY[0x263F08D40] valueWithBytes:v116 objCType:"{CGPoint=dd}"];
  v188[1] = v57;
  v56 = [NSDictionary dictionaryWithObjects:v188 forKeys:v187 count:2];
  v218[14] = v56;
  v217[15] = @"heavy-rain-day";
  v186[0] = &unk_26DAEAC28;
  v185[0] = @"WeatherMapColors";
  v185[1] = @"WeatherMapPadding";
  long long v115 = xmmword_226D6F2B0;
  v55 = [MEMORY[0x263F08D40] valueWithBytes:&v115 objCType:"{CGPoint=dd}"];
  v186[1] = v55;
  v54 = [NSDictionary dictionaryWithObjects:v186 forKeys:v185 count:2];
  v218[15] = v54;
  v217[16] = @"heavy-rain-night";
  v184[0] = &unk_26DAEAC40;
  v183[0] = @"WeatherMapColors";
  v183[1] = @"WeatherMapPadding";
  long long v114 = xmmword_226D6F2B0;
  v86 = [MEMORY[0x263F08D40] valueWithBytes:&v114 objCType:"{CGPoint=dd}"];
  v184[1] = v86;
  v53 = [NSDictionary dictionaryWithObjects:v184 forKeys:v183 count:2];
  v218[16] = v53;
  v217[17] = @"hot";
  v182[0] = &unk_26DAEAC58;
  v181[0] = @"WeatherMapColors";
  v181[1] = @"WeatherMapPadding";
  v113[1] = 0;
  v113[0] = 0;
  v52 = [MEMORY[0x263F08D40] valueWithBytes:v113 objCType:"{CGPoint=dd}"];
  v182[1] = v52;
  v51 = [NSDictionary dictionaryWithObjects:v182 forKeys:v181 count:2];
  v218[17] = v51;
  v217[18] = @"hurricane";
  v180[0] = &unk_26DAEAC70;
  v179[0] = @"WeatherMapColors";
  v179[1] = @"WeatherMapPadding";
  v112[1] = 0;
  v112[0] = 0;
  v50 = [MEMORY[0x263F08D40] valueWithBytes:v112 objCType:"{CGPoint=dd}"];
  v180[1] = v50;
  v49 = [NSDictionary dictionaryWithObjects:v180 forKeys:v179 count:2];
  v218[18] = v49;
  v217[19] = @"ice";
  v178[0] = &unk_26DAEAC88;
  v177[0] = @"WeatherMapColors";
  v177[1] = @"WeatherMapPadding";
  v111[1] = 0;
  v111[0] = 0;
  v48 = [MEMORY[0x263F08D40] valueWithBytes:v111 objCType:"{CGPoint=dd}"];
  v178[1] = v48;
  v47 = [NSDictionary dictionaryWithObjects:v178 forKeys:v177 count:2];
  v218[19] = v47;
  v217[20] = @"mix-rainfall-day";
  v176[0] = &unk_26DAEACA0;
  v175[0] = @"WeatherMapColors";
  v175[1] = @"WeatherMapPadding";
  long long v110 = xmmword_226D6F2C0;
  v46 = [MEMORY[0x263F08D40] valueWithBytes:&v110 objCType:"{CGPoint=dd}"];
  v176[1] = v46;
  v45 = [NSDictionary dictionaryWithObjects:v176 forKeys:v175 count:2];
  v218[20] = v45;
  v217[21] = @"mix-rainfall-night";
  v174[0] = &unk_26DAEACB8;
  v173[0] = @"WeatherMapColors";
  v173[1] = @"WeatherMapPadding";
  long long v109 = xmmword_226D6F2C0;
  v44 = [MEMORY[0x263F08D40] valueWithBytes:&v109 objCType:"{CGPoint=dd}"];
  v174[1] = v44;
  v43 = [NSDictionary dictionaryWithObjects:v174 forKeys:v173 count:2];
  v218[21] = v43;
  v217[22] = @"mostly-cloudy-day";
  v172[0] = &unk_26DAEACD0;
  v171[0] = @"WeatherMapColors";
  v171[1] = @"WeatherMapPadding";
  v108[1] = 0;
  v108[0] = 0;
  v42 = [MEMORY[0x263F08D40] valueWithBytes:v108 objCType:"{CGPoint=dd}"];
  v172[1] = v42;
  v41 = [NSDictionary dictionaryWithObjects:v172 forKeys:v171 count:2];
  v218[22] = v41;
  v217[23] = @"mostly-cloudy-night";
  v170[0] = &unk_26DAEACE8;
  v169[0] = @"WeatherMapColors";
  v169[1] = @"WeatherMapPadding";
  v107[1] = 0;
  v107[0] = 0;
  v40 = [MEMORY[0x263F08D40] valueWithBytes:v107 objCType:"{CGPoint=dd}"];
  v170[1] = v40;
  v39 = [NSDictionary dictionaryWithObjects:v170 forKeys:v169 count:2];
  v218[23] = v39;
  v217[24] = @"mostly-sunny";
  v168[0] = &unk_26DAEAD00;
  v167[0] = @"WeatherMapColors";
  v167[1] = @"WeatherMapPadding";
  v106[1] = 0;
  v106[0] = 0;
  uint64_t v38 = [MEMORY[0x263F08D40] valueWithBytes:v106 objCType:"{CGPoint=dd}"];
  v168[1] = v38;
  v37 = [NSDictionary dictionaryWithObjects:v168 forKeys:v167 count:2];
  v218[24] = v37;
  v217[25] = @"no-report";
  v166[0] = &unk_26DAEAD18;
  v165[0] = @"WeatherMapColors";
  v165[1] = @"WeatherMapPadding";
  v105[1] = 0;
  v105[0] = 0;
  long long v36 = [MEMORY[0x263F08D40] valueWithBytes:v105 objCType:"{CGPoint=dd}"];
  v166[1] = v36;
  long long v35 = [NSDictionary dictionaryWithObjects:v166 forKeys:v165 count:2];
  v218[25] = v35;
  v217[26] = @"partly-cloudy-day";
  v164[0] = &unk_26DAEAD30;
  v163[0] = @"WeatherMapColors";
  v163[1] = @"WeatherMapPadding";
  long long v104 = xmmword_226D6F2D0;
  long long v34 = [MEMORY[0x263F08D40] valueWithBytes:&v104 objCType:"{CGPoint=dd}"];
  v164[1] = v34;
  long long v33 = [NSDictionary dictionaryWithObjects:v164 forKeys:v163 count:2];
  v218[26] = v33;
  v217[27] = @"partly-cloudy-night";
  v162[0] = &unk_26DAEAD48;
  v161[0] = @"WeatherMapColors";
  v161[1] = @"WeatherMapPadding";
  long long v103 = xmmword_226D6F2E0;
  uint64_t v32 = [MEMORY[0x263F08D40] valueWithBytes:&v103 objCType:"{CGPoint=dd}"];
  v162[1] = v32;
  v31 = [NSDictionary dictionaryWithObjects:v162 forKeys:v161 count:2];
  v218[27] = v31;
  v217[28] = @"rain-day";
  v160[0] = &unk_26DAEAD60;
  v159[0] = @"WeatherMapColors";
  v159[1] = @"WeatherMapPadding";
  long long v102 = xmmword_226D6F2C0;
  v30 = [MEMORY[0x263F08D40] valueWithBytes:&v102 objCType:"{CGPoint=dd}"];
  v160[1] = v30;
  uint64_t v29 = [NSDictionary dictionaryWithObjects:v160 forKeys:v159 count:2];
  v218[28] = v29;
  v217[29] = @"rain-night";
  v158[0] = &unk_26DAEAD78;
  v157[0] = @"WeatherMapColors";
  v157[1] = @"WeatherMapPadding";
  long long v101 = xmmword_226D6F2C0;
  os_log_t v28 = [MEMORY[0x263F08D40] valueWithBytes:&v101 objCType:"{CGPoint=dd}"];
  v158[1] = v28;
  v27 = [NSDictionary dictionaryWithObjects:v158 forKeys:v157 count:2];
  v218[29] = v27;
  v217[30] = @"scattered-showers";
  v156[0] = &unk_26DAEAD90;
  v155[0] = @"WeatherMapColors";
  v155[1] = @"WeatherMapPadding";
  v100[0] = 0;
  v100[1] = 0;
  os_log_t v26 = [MEMORY[0x263F08D40] valueWithBytes:v100 objCType:"{CGPoint=dd}"];
  v156[1] = v26;
  char v25 = [NSDictionary dictionaryWithObjects:v156 forKeys:v155 count:2];
  v218[30] = v25;
  v217[31] = @"scattered-showers-night";
  v154[0] = &unk_26DAEADA8;
  v153[0] = @"WeatherMapColors";
  v153[1] = @"WeatherMapPadding";
  long long v99 = xmmword_226D6F2F0;
  os_log_t v24 = [MEMORY[0x263F08D40] valueWithBytes:&v99 objCType:"{CGPoint=dd}"];
  v154[1] = v24;
  id v23 = [NSDictionary dictionaryWithObjects:v154 forKeys:v153 count:2];
  v218[31] = v23;
  v217[32] = @"scattered-thunderstorm";
  v152[0] = &unk_26DAEADC0;
  v151[0] = @"WeatherMapColors";
  v151[1] = @"WeatherMapPadding";
  v98[0] = 0;
  v98[1] = 0;
  os_log_t v22 = [MEMORY[0x263F08D40] valueWithBytes:v98 objCType:"{CGPoint=dd}"];
  v152[1] = v22;
  long double v21 = [NSDictionary dictionaryWithObjects:v152 forKeys:v151 count:2];
  v218[32] = v21;
  v217[33] = @"scattered-thunderstorm-night";
  v150[0] = &unk_26DAEADD8;
  v149[0] = @"WeatherMapColors";
  v149[1] = @"WeatherMapPadding";
  long long v97 = xmmword_226D6F2F0;
  os_log_t v20 = [MEMORY[0x263F08D40] valueWithBytes:&v97 objCType:"{CGPoint=dd}"];
  v150[1] = v20;
  float v19 = [NSDictionary dictionaryWithObjects:v150 forKeys:v149 count:2];
  v218[33] = v19;
  v217[34] = @"severe-thunderstorm-day";
  v148[0] = &unk_26DAEADF0;
  v147[0] = @"WeatherMapColors";
  v147[1] = @"WeatherMapPadding";
  long long v96 = xmmword_226D6F2C0;
  os_log_t v18 = [MEMORY[0x263F08D40] valueWithBytes:&v96 objCType:"{CGPoint=dd}"];
  v148[1] = v18;
  uint64_t v17 = [NSDictionary dictionaryWithObjects:v148 forKeys:v147 count:2];
  v218[34] = v17;
  v217[35] = @"severe-thunderstorm-night";
  v146[0] = &unk_26DAEAE08;
  v145[0] = @"WeatherMapColors";
  v145[1] = @"WeatherMapPadding";
  long long v95 = xmmword_226D6F2C0;
  v87 = [MEMORY[0x263F08D40] valueWithBytes:&v95 objCType:"{CGPoint=dd}"];
  v146[1] = v87;
  uint64_t v15 = [NSDictionary dictionaryWithObjects:v146 forKeys:v145 count:2];
  v218[35] = v15;
  v217[36] = @"sleet-day";
  v144[0] = &unk_26DAEAE20;
  v143[0] = @"WeatherMapColors";
  v143[1] = @"WeatherMapPadding";
  long long v94 = xmmword_226D6F300;
  os_log_t v14 = [MEMORY[0x263F08D40] valueWithBytes:&v94 objCType:"{CGPoint=dd}"];
  v144[1] = v14;
  uint64_t v13 = [NSDictionary dictionaryWithObjects:v144 forKeys:v143 count:2];
  v218[36] = v13;
  v217[37] = @"sleet-night";
  v142[0] = &unk_26DAEAE38;
  v141[0] = @"WeatherMapColors";
  v141[1] = @"WeatherMapPadding";
  long long v93 = xmmword_226D6F300;
  os_log_t v12 = [MEMORY[0x263F08D40] valueWithBytes:&v93 objCType:"{CGPoint=dd}"];
  v142[1] = v12;
  id v11 = [NSDictionary dictionaryWithObjects:v142 forKeys:v141 count:2];
  v218[37] = v11;
  v217[38] = @"smoke";
  v140[0] = &unk_26DAEAE50;
  v139[0] = @"WeatherMapColors";
  v139[1] = @"WeatherMapPadding";
  long long v92 = xmmword_226D6F2E0;
  os_log_t v16 = [MEMORY[0x263F08D40] valueWithBytes:&v92 objCType:"{CGPoint=dd}"];
  v140[1] = v16;
  double v10 = [NSDictionary dictionaryWithObjects:v140 forKeys:v139 count:2];
  v218[38] = v10;
  v217[39] = @"sunrise";
  v138[0] = &unk_26DAEAE68;
  v137[0] = @"WeatherMapColors";
  v137[1] = @"WeatherMapPadding";
  v91[0] = 0;
  v91[1] = 0;
  uint64_t v9 = [MEMORY[0x263F08D40] valueWithBytes:v91 objCType:"{CGPoint=dd}"];
  v138[1] = v9;
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v138 forKeys:v137 count:2];
  v218[39] = v0;
  v217[40] = @"sunset";
  v136[0] = &unk_26DAEAE80;
  v135[0] = @"WeatherMapColors";
  v135[1] = @"WeatherMapPadding";
  v90[0] = 0;
  v90[1] = 0;
  uint64_t v1 = [MEMORY[0x263F08D40] valueWithBytes:v90 objCType:"{CGPoint=dd}"];
  v136[1] = v1;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v136 forKeys:v135 count:2];
  v218[40] = v2;
  v217[41] = @"tornado";
  v134[0] = &unk_26DAEAE98;
  v133[0] = @"WeatherMapColors";
  v133[1] = @"WeatherMapPadding";
  v89[0] = 0;
  v89[1] = 0;
  uint64_t v3 = [MEMORY[0x263F08D40] valueWithBytes:v89 objCType:"{CGPoint=dd}"];
  v134[1] = v3;
  uint64_t v4 = [NSDictionary dictionaryWithObjects:v134 forKeys:v133 count:2];
  v218[41] = v4;
  v217[42] = @"tropical-storm";
  v132[0] = &unk_26DAEAEB0;
  v131[0] = @"WeatherMapColors";
  v131[1] = @"WeatherMapPadding";
  v88[0] = 0;
  v88[1] = 0;
  id v5 = [MEMORY[0x263F08D40] valueWithBytes:v88 objCType:"{CGPoint=dd}"];
  v132[1] = v5;
  os_log_t v6 = [NSDictionary dictionaryWithObjects:v132 forKeys:v131 count:2];
  v218[42] = v6;
  uint64_t v7 = [NSDictionary dictionaryWithObjects:v218 forKeys:v217 count:43];
  id v8 = (void *)WASmallWeatherIconsMap_s_smallWeatherIconsMap;
  WASmallWeatherIconsMap_s_smallWeatherIconsMap = v7;
}

id WAG2FontWithSize(double a1)
{
  v14[3] = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x263F1C660];
  uint64_t v3 = *MEMORY[0x263F03A30];
  v14[0] = *MEMORY[0x263F03A58];
  uint64_t v4 = *MEMORY[0x263F03B60];
  v13[0] = v3;
  v13[1] = v4;
  uint64_t v11 = *MEMORY[0x263F03AB8];
  os_log_t v12 = &unk_26DAEAFA0;
  id v5 = [NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  v14[1] = v5;
  void v13[2] = *MEMORY[0x263F03B28];
  os_log_t v6 = [NSNumber numberWithDouble:a1];
  v14[2] = v6;
  uint64_t v7 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];
  id v8 = [v2 fontDescriptorWithFontAttributes:v7];

  uint64_t v9 = [MEMORY[0x263F1C658] fontWithDescriptor:v8 size:0.0];

  return v9;
}

void sub_226D50010(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_226D504DC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void sub_226D51A5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_226D53878(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

void sub_226D54AB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void sub_226D55E18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
}

void sub_226D582EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_226D58524(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_226D5868C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_226D5E5E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_226D5ED6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226D5EECC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_226D5F9AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, id a18)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a18);
  _Unwind_Resume(a1);
}

BOOL CLLocationCoordinate2DEqualToCoordinates(double a1, double a2, double a3, double a4)
{
  return a2 == a4 && a1 == a3;
}

void TWCAttributionURLForTrafficParameter_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 description];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_226D1D000, a2, OS_LOG_TYPE_ERROR, "########### Logo URL %@", (uint8_t *)&v4, 0xCu);
}

void WAAttributionString_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v4 = [MEMORY[0x263EFF960] preferredLanguages];
  id v5 = [v4 objectAtIndex:0];
  int v6 = 138412802;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  __int16 v10 = 2112;
  uint64_t v11 = v5;
  _os_log_error_impl(&dword_226D1D000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "#Attribution Warning! Missing (%@) from string (%@)! (Lang: %@)", (uint8_t *)&v6, 0x20u);
}

void WAPresentFirstUsageDialogIfNeeded_cold_1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_226D1D000, a2, OS_LOG_TYPE_ERROR, "Failed to present first usage dialog %d@", (uint8_t *)v2, 8u);
}

CFDateFormatterRef CFDateFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle)
{
  return (CFDateFormatterRef)MEMORY[0x270EE4870](allocator, locale, dateStyle, timeStyle);
}

CFStringRef CFDateFormatterCreateStringWithDate(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFDateRef date)
{
  return (CFStringRef)MEMORY[0x270EE4898](allocator, formatter, date);
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return (CFLocaleRef)MEMORY[0x270EE4A60]();
}

CFTypeRef CFLocaleGetValue(CFLocaleRef locale, CFLocaleKey key)
{
  return (CFTypeRef)MEMORY[0x270EE4AD0](locale, key);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x270EE4C90](applicationID);
}

void CFRelease(CFTypeRef cf)
{
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x270EE5470](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x270EE5488](alloc, uuid);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x270EE5BD0](color);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C68]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextBeginTransparencyLayerWithRect(CGContextRef c, CGRect rect, CFDictionaryRef auxInfo)
{
}

void CGContextClip(CGContextRef c)
{
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
}

void CGContextDrawPDFPage(CGContextRef c, CGPDFPageRef page)
{
}

void CGContextEndTransparencyLayer(CGContextRef c)
{
}

void CGContextFillPath(CGContextRef c)
{
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetShadowWithColor(CGContextRef c, CGSize offset, CGFloat blur, CGColorRef color)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

CGGradientRef CGGradientCreateWithColors(CGColorSpaceRef space, CFArrayRef colors, const CGFloat *locations)
{
  return (CGGradientRef)MEMORY[0x270EE6690](space, colors, locations);
}

void CGGradientRelease(CGGradientRef gradient)
{
}

void CGImageRelease(CGImageRef image)
{
}

CGRect CGPDFPageGetBoxRect(CGPDFPageRef page, CGPDFBox box)
{
  MEMORY[0x270EE6D80](page, *(void *)&box);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CGPathRef CGPathCreateWithEllipseInRect(CGRect rect, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x270EE7050](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGPathRelease(CGPathRef path)
{
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x270EE7170]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x270EE71F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

BOOL CLLocationCoordinate2DIsValid(CLLocationCoordinate2D coord)
{
  return MEMORY[0x270EE7460]((__n128)coord, *(__n128 *)&coord.longitude);
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  MEMORY[0x270EE7470](latitude, longitude);
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

uint64_t CPGetDeviceRegionCode()
{
  return MEMORY[0x270F0CD50]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x270F4AE20]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x270F4AE40]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x270EF2C28](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

uint64_t NSStringFromWFTemperatureUnit()
{
  return MEMORY[0x270F85248]();
}

BOOL UIAccessibilityDarkerSystemColorsEnabled(void)
{
  return MEMORY[0x270F05EE8]();
}

BOOL UIAccessibilityIsReduceTransparencyEnabled(void)
{
  return MEMORY[0x270F05F28]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x270F06030]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x270F06038]();
}

void UIRectFillUsingBlendMode(CGRect rect, CGBlendMode blendMode)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x270EF2C98](commaSeparatedKeysString, firstValue);
}

uint64_t _UIGraphicsDrawIntoImageContextWithOptions()
{
  return MEMORY[0x270F06350]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

double __exp10(double a1)
{
  MEMORY[0x270ED7DC8](a1);
  return result;
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x270ED86A8](__y, __x);
  return result;
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

float cosf(float a1)
{
  MEMORY[0x270ED9130](a1);
  return result;
}

uint64_t ct_green_tea_logger_create()
{
  return MEMORY[0x270F91820]();
}

uint64_t ct_green_tea_logger_destroy()
{
  return MEMORY[0x270F91838]();
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x270ED98D0](*(void *)&a1, *(void *)&a2);
}

void free(void *a1)
{
}

uint64_t getCTGreenTeaOsLogHandle()
{
  return MEMORY[0x270F91848]();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

uint64_t network_usage_policy_create_client()
{
  return MEMORY[0x270F99290]();
}

uint64_t network_usage_policy_destroy_client()
{
  return MEMORY[0x270F99298]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t perform_first_network_use_flow()
{
  return MEMORY[0x270F992A0]();
}

int rand(void)
{
  return MEMORY[0x270EDB0D8]();
}

float sinf(float a1)
{
  MEMORY[0x270EDB4F0](a1);
  return result;
}

char *__cdecl u_strToUTF8(char *dest, int32_t destCapacity, int32_t *pDestLength, const UChar *src, int32_t srcLength, UErrorCode *pErrorCode)
{
  return (char *)MEMORY[0x270F995A0](dest, *(void *)&destCapacity, pDestLength, src, *(void *)&srcLength, pErrorCode);
}

uint64_t uameasfmt_close()
{
  return MEMORY[0x270F995F0]();
}

uint64_t uameasfmt_format()
{
  return MEMORY[0x270F995F8]();
}

uint64_t uameasfmt_open()
{
  return MEMORY[0x270F99600]();
}

uint64_t unum_clone()
{
  return MEMORY[0x270F99798]();
}

uint64_t unum_close()
{
  return MEMORY[0x270F997A0]();
}

uint64_t unum_open()
{
  return MEMORY[0x270F997F0]();
}

uint64_t unum_setAttribute()
{
  return MEMORY[0x270F99810]();
}