id NWCDemoTodayForecastedConditions()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t vars8;

  v0 = objc_opt_new();
  [v0 setObject:&unk_26EEA8258 forKeyedSubscript:*MEMORY[0x263F85FB0]];
  v1 = [MEMORY[0x263EFD170] complicationDate];
  [v0 setObject:v1 forKeyedSubscript:*MEMORY[0x263F85FD0]];

  v2 = (void *)[objc_alloc(MEMORY[0x263F85F70]) initWithTemperatureUnit:1 value:88.0];
  [v0 setObject:v2 forKeyedSubscript:*MEMORY[0x263F85FE8]];

  v3 = (void *)[objc_alloc(MEMORY[0x263F85F70]) initWithTemperatureUnit:1 value:64.0];
  [v0 setObject:v3 forKeyedSubscript:*MEMORY[0x263F86000]];

  [v0 setObject:&unk_26EEA8768 forKeyedSubscript:*MEMORY[0x263F86058]];

  return v0;
}

id NWCLocalizationBundle()
{
  if (NWCLocalizationBundle_onceToken != -1) {
    dispatch_once(&NWCLocalizationBundle_onceToken, &__block_literal_global_134);
  }
  v0 = (void *)NWCLocalizationBundle_Bundle;

  return v0;
}

uint64_t NWMLocaleCurrentNumberSystem(void *a1)
{
  v1 = [a1 numberingSystem];
  if ([@"arab" isEqualToString:v1])
  {
    uint64_t v2 = 1;
  }
  else if ([@"deva" isEqualToString:v1])
  {
    uint64_t v2 = 2;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

__CFString *NWCComplicationFamilyDescription(uint64_t a1)
{
  if (*MEMORY[0x263EFCF20] == a1)
  {
    v1 = @"CLKComplicationFamilyCircularMedium";
  }
  else
  {
    CLKStringForComplicationFamily();
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v1;
}

id NWCHighLowFormattedStringFromDailyForecastedConditions(void *a1, void *a2, void *a3)
{
  uint64_t v5 = *MEMORY[0x263F85FE8];
  id v6 = a3;
  id v7 = a2;
  id v8 = a1;
  v9 = [v7 objectForKeyedSubscript:v5];
  v10 = [v6 formattedWithDegreeSymbol:v9 fallbackStyle:0];
  v11 = [v7 objectForKeyedSubscript:*MEMORY[0x263F86000]];

  v12 = [v6 formattedWithDegreeSymbol:v11 fallbackStyle:0];

  v13 = NSString;
  v14 = NWCLocalizedString(v8);

  v15 = objc_msgSend(v13, "stringWithFormat:", v14, v10, v12);

  return v15;
}

id NWCLocalizedString(void *a1)
{
  id v1 = a1;
  uint64_t v2 = NWCLocalizationBundle();
  v3 = [v2 localizedStringForKey:v1 value:&stru_26EEA3A40 table:@"NanoWeatherComplications-Localizable"];

  return v3;
}

id NWCDemoLocation()
{
  v0 = objc_opt_new();
  id v1 = NWCLocalizedString(@"DEMO_LOCATION_DISPLAY_NAME");
  [v0 setDisplayName:v1];

  [v0 setCountryAbbreviation:@"US"];

  return v0;
}

id NWCDemoAirQualityObservations()
{
  v0 = objc_opt_new();
  id v1 = NWCLocalizedString(@"COMPANION_DEMO_AIR_QUALITY_SCALE");
  uint64_t v2 = NWCLocalizedString(@"COMPANION_DEMO_AIR_QUALITY_CATEGORY_DESCRIPTION");
  if ([@"DAQI" isEqualToString:v1])
  {
    v3 = (Class *)0x263F85EB8;
  }
  else
  {
    int v4 = [@"UBA" isEqualToString:v1];
    v3 = (Class *)0x263F85EC0;
    if (v4) {
      v3 = (Class *)0x263F85EC8;
    }
  }
  uint64_t v5 = (void *)[objc_alloc(*v3) initWithCategoryIndex:1 localizedCategoryDescription:v2];

  [v0 setCurrentScaleCategory:v5];
  id v6 = NWCLocalizedString(@"COMPANION_DEMO_AIR_QUALITY_INDEX");
  uint64_t v7 = [v6 integerValue];

  [v0 setLocalizedAirQualityIndex:v7];
  id v8 = objc_alloc_init(MEMORY[0x263F85E90]);
  [v8 setNumerical:1];
  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  v10 = (void *)[objc_alloc(MEMORY[0x263F85EE8]) initWithLocation:@"#34C759" color:0.0];
  [v9 addObject:v10];

  id v11 = objc_alloc(MEMORY[0x263F85EE8]);
  LODWORD(v12) = 25.0;
  v13 = (void *)[v11 initWithLocation:@"#34C759" color:v12];
  [v9 addObject:v13];

  id v14 = objc_alloc(MEMORY[0x263F85EE8]);
  LODWORD(v15) = 1117126656;
  v16 = (void *)[v14 initWithLocation:@"#FFCC00" color:v15];
  [v9 addObject:v16];

  id v17 = objc_alloc(MEMORY[0x263F85EE8]);
  LODWORD(v18) = 1123680256;
  v19 = (void *)[v17 initWithLocation:@"#FF9500" color:v18];
  [v9 addObject:v19];

  id v20 = objc_alloc(MEMORY[0x263F85EE8]);
  LODWORD(v21) = 1127153664;
  v22 = (void *)[v20 initWithLocation:@"#FF2D55" color:v21];
  [v9 addObject:v22];

  id v23 = objc_alloc(MEMORY[0x263F85EE8]);
  LODWORD(v24) = 1132068864;
  v25 = (void *)[v23 initWithLocation:@"#AA00FF" color:v24];
  [v9 addObject:v25];

  id v26 = objc_alloc(MEMORY[0x263F85EE8]);
  LODWORD(v27) = 1135542272;
  v28 = (void *)[v26 initWithLocation:@"#9C08B8" color:v27];
  [v9 addObject:v28];

  id v29 = objc_alloc(MEMORY[0x263F85EE8]);
  LODWORD(v30) = 1140457472;
  v31 = (void *)[v29 initWithLocation:@"#75212D" color:v30];
  [v9 addObject:v31];

  v32 = (void *)[objc_alloc(MEMORY[0x263F85EE0]) initWithStops:v9];
  [v8 setGradient:v32];
  objc_msgSend(v8, "setRange:", 0, 500);
  [v0 setScale:v8];

  return v0;
}

id NWCDemoNowObservations()
{
  v0 = objc_opt_new();
  id v1 = [MEMORY[0x263EFD170] complicationDate];
  [v0 setObject:v1 forKeyedSubscript:*MEMORY[0x263F85FD0]];

  [v0 setObject:&unk_26EEA8708 forKeyedSubscript:*MEMORY[0x263F86058]];
  [v0 setObject:&unk_26EEA8240 forKeyedSubscript:*MEMORY[0x263F86070]];
  [v0 setObject:&unk_26EEA8718 forKeyedSubscript:*MEMORY[0x263F86078]];
  [v0 setObject:&unk_26EEA8258 forKeyedSubscript:*MEMORY[0x263F85FB0]];
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x263F85F70]) initWithTemperatureUnit:1 value:72.0];
  [v0 setObject:v2 forKeyedSubscript:*MEMORY[0x263F86050]];

  return v0;
}

id NWCDemoFiveHourHourlyForecastedConditions()
{
  v26[5] = *MEMORY[0x263EF8340];
  v25 = [MEMORY[0x263EFD170] complicationDate];
  v0 = [MEMORY[0x263EFF8F0] currentCalendar];
  id v1 = [v0 components:60 fromDate:v25];
  double v24 = NWCDemoNowObservations();
  v26[0] = v24;
  uint64_t v2 = objc_opt_new();
  uint64_t v3 = *MEMORY[0x263F85FB0];
  [v2 setObject:&unk_26EEA8258 forKeyedSubscript:*MEMORY[0x263F85FB0]];
  objc_msgSend(v1, "setHour:", objc_msgSend(v1, "hour") + 1);
  int v4 = [v0 dateFromComponents:v1];
  uint64_t v5 = *MEMORY[0x263F85FD0];
  [v2 setObject:v4 forKeyedSubscript:*MEMORY[0x263F85FD0]];

  id v6 = (void *)[objc_alloc(MEMORY[0x263F85F70]) initWithTemperatureUnit:1 value:74.0];
  uint64_t v7 = *MEMORY[0x263F86050];
  [v2 setObject:v6 forKeyedSubscript:*MEMORY[0x263F86050]];

  uint64_t v8 = *MEMORY[0x263F86070];
  [v2 setObject:&unk_26EEA8270 forKeyedSubscript:*MEMORY[0x263F86070]];
  uint64_t v9 = *MEMORY[0x263F86078];
  [v2 setObject:&unk_26EEA8728 forKeyedSubscript:*MEMORY[0x263F86078]];
  v26[1] = v2;
  v10 = objc_opt_new();
  uint64_t v22 = v3;
  [v10 setObject:&unk_26EEA8258 forKeyedSubscript:v3];
  objc_msgSend(v1, "setHour:", objc_msgSend(v1, "hour") + 1);
  id v11 = [v0 dateFromComponents:v1];
  [v10 setObject:v11 forKeyedSubscript:v5];

  double v12 = (void *)[objc_alloc(MEMORY[0x263F85F70]) initWithTemperatureUnit:1 value:84.0];
  [v10 setObject:v12 forKeyedSubscript:v7];

  [v10 setObject:&unk_26EEA8738 forKeyedSubscript:v8];
  [v10 setObject:&unk_26EEA8728 forKeyedSubscript:v9];
  v26[2] = v10;
  v13 = objc_opt_new();
  [v13 setObject:&unk_26EEA8288 forKeyedSubscript:v3];
  objc_msgSend(v1, "setHour:", objc_msgSend(v1, "hour") + 1);
  id v14 = v0;
  id v23 = v0;
  double v15 = [v0 dateFromComponents:v1];
  [v13 setObject:v15 forKeyedSubscript:v5];

  v16 = (void *)[objc_alloc(MEMORY[0x263F85F70]) initWithTemperatureUnit:1 value:88.0];
  [v13 setObject:v16 forKeyedSubscript:v7];

  [v13 setObject:&unk_26EEA8240 forKeyedSubscript:v8];
  [v13 setObject:&unk_26EEA8748 forKeyedSubscript:v9];
  v26[3] = v13;
  id v17 = objc_opt_new();
  [v17 setObject:&unk_26EEA8258 forKeyedSubscript:v22];
  objc_msgSend(v1, "setHour:", objc_msgSend(v1, "hour") + 1);
  double v18 = [v14 dateFromComponents:v1];
  [v17 setObject:v18 forKeyedSubscript:v5];

  v19 = (void *)[objc_alloc(MEMORY[0x263F85F70]) initWithTemperatureUnit:1 value:86.0];
  [v17 setObject:v19 forKeyedSubscript:v7];

  [v17 setObject:&unk_26EEA8270 forKeyedSubscript:v8];
  [v17 setObject:&unk_26EEA8758 forKeyedSubscript:v9];
  v26[4] = v17;
  id v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:5];

  return v20;
}

id NWCDemoSevenDayDailyForecastedConditions()
{
  v20[7] = *MEMORY[0x263EF8340];
  v19 = [MEMORY[0x263EFD170] complicationDate];
  v0 = [MEMORY[0x263EFF8F0] currentCalendar];
  id v1 = [v0 components:60 fromDate:v19];
  double v18 = NWCDemoTodayForecastedConditions();
  v20[0] = v18;
  id v17 = objc_opt_new();
  objc_msgSend(v1, "setDay:", objc_msgSend(v1, "day") + 1);
  uint64_t v2 = [v0 dateFromComponents:v1];
  uint64_t v3 = *MEMORY[0x263F85FD0];
  [v17 setObject:v2 forKeyedSubscript:*MEMORY[0x263F85FD0]];

  uint64_t v4 = *MEMORY[0x263F86058];
  [v17 setObject:&unk_26EEA8778 forKeyedSubscript:*MEMORY[0x263F86058]];
  v20[1] = v17;
  uint64_t v5 = objc_opt_new();
  objc_msgSend(v1, "setDay:", objc_msgSend(v1, "day") + 1);
  id v6 = [v0 dateFromComponents:v1];
  [v5 setObject:v6 forKeyedSubscript:v3];

  [v5 setObject:&unk_26EEA8788 forKeyedSubscript:v4];
  v20[2] = v5;
  uint64_t v7 = objc_opt_new();
  objc_msgSend(v1, "setDay:", objc_msgSend(v1, "day") + 1);
  uint64_t v8 = [v0 dateFromComponents:v1];
  [v7 setObject:v8 forKeyedSubscript:v3];

  [v7 setObject:&unk_26EEA8798 forKeyedSubscript:v4];
  v20[3] = v7;
  uint64_t v9 = objc_opt_new();
  objc_msgSend(v1, "setDay:", objc_msgSend(v1, "day") + 1);
  v10 = [v0 dateFromComponents:v1];
  [v9 setObject:v10 forKeyedSubscript:v3];

  [v9 setObject:&unk_26EEA8768 forKeyedSubscript:v4];
  v20[4] = v9;
  id v11 = objc_opt_new();
  objc_msgSend(v1, "setDay:", objc_msgSend(v1, "day") + 1);
  double v12 = [v0 dateFromComponents:v1];
  [v11 setObject:v12 forKeyedSubscript:v3];

  [v11 setObject:&unk_26EEA8788 forKeyedSubscript:v4];
  v20[5] = v11;
  v13 = objc_opt_new();
  objc_msgSend(v1, "setDay:", objc_msgSend(v1, "day") + 1);
  id v14 = [v0 dateFromComponents:v1];
  [v13 setObject:v14 forKeyedSubscript:v3];

  [v13 setObject:&unk_26EEA87A8 forKeyedSubscript:v4];
  v20[6] = v13;
  double v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:7];

  return v15;
}

id NWCDemoChanceRainNowObservations()
{
  v0 = objc_opt_new();
  id v1 = [MEMORY[0x263EFD170] complicationDate];
  [v0 setObject:v1 forKeyedSubscript:*MEMORY[0x263F85FD0]];

  [v0 setObject:&unk_26EEA82A0 forKeyedSubscript:*MEMORY[0x263F85FB0]];
  uint64_t v2 = [NSNumber numberWithDouble:60.0];
  [v0 setObject:v2 forKeyedSubscript:*MEMORY[0x263F86018]];

  return v0;
}

id NWCDemoFiveHourChanceRainHourlyForecastedConditions()
{
  v21[5] = *MEMORY[0x263EF8340];
  id v20 = [MEMORY[0x263EFD170] complicationDate];
  v0 = [MEMORY[0x263EFF8F0] currentCalendar];
  id v1 = [v0 components:60 fromDate:v20];
  v19 = NWCDemoChanceRainNowObservations();
  v21[0] = v19;
  uint64_t v2 = objc_opt_new();
  uint64_t v3 = *MEMORY[0x263F85FB0];
  [v2 setObject:&unk_26EEA82B8 forKeyedSubscript:*MEMORY[0x263F85FB0]];
  objc_msgSend(v1, "setHour:", objc_msgSend(v1, "hour") + 1);
  uint64_t v4 = [v0 dateFromComponents:v1];
  uint64_t v5 = *MEMORY[0x263F85FD0];
  [v2 setObject:v4 forKeyedSubscript:*MEMORY[0x263F85FD0]];

  id v6 = [NSNumber numberWithDouble:30.0];
  uint64_t v7 = *MEMORY[0x263F86018];
  [v2 setObject:v6 forKeyedSubscript:*MEMORY[0x263F86018]];

  v21[1] = v2;
  uint64_t v8 = objc_opt_new();
  [v8 setObject:&unk_26EEA82D0 forKeyedSubscript:v3];
  objc_msgSend(v1, "setHour:", objc_msgSend(v1, "hour") + 1);
  uint64_t v9 = [v0 dateFromComponents:v1];
  [v8 setObject:v9 forKeyedSubscript:v5];

  v10 = [NSNumber numberWithDouble:10.0];
  [v8 setObject:v10 forKeyedSubscript:v7];

  v21[2] = v8;
  id v11 = objc_opt_new();
  [v11 setObject:&unk_26EEA8258 forKeyedSubscript:v3];
  objc_msgSend(v1, "setHour:", objc_msgSend(v1, "hour") + 1);
  double v12 = [v0 dateFromComponents:v1];
  [v11 setObject:v12 forKeyedSubscript:v5];

  v13 = [NSNumber numberWithDouble:0.0];
  [v11 setObject:v13 forKeyedSubscript:v7];

  v21[3] = v11;
  id v14 = objc_opt_new();
  [v14 setObject:&unk_26EEA82E8 forKeyedSubscript:v3];
  objc_msgSend(v1, "setHour:", objc_msgSend(v1, "hour") + 1);
  double v15 = [v0 dateFromComponents:v1];
  [v14 setObject:v15 forKeyedSubscript:v5];

  v16 = [NSNumber numberWithDouble:0.0];
  [v14 setObject:v16 forKeyedSubscript:v7];

  v21[4] = v14;
  id v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:5];

  return v17;
}

id NWCPlaceholderDailyConditionsStartingAtDate(void *a1, uint64_t a2)
{
  id v3 = a1;
  uint64_t v4 = [MEMORY[0x263EFF980] arrayWithCapacity:a2];
  uint64_t v5 = [MEMORY[0x263EFF8F0] currentCalendar];
  id v6 = [v5 components:60 fromDate:v3];
  [v6 setHour:9];
  if (a2)
  {
    uint64_t v7 = *MEMORY[0x263F85FD0];
    do
    {
      uint64_t v8 = objc_opt_new();
      uint64_t v9 = [v5 dateFromComponents:v6];
      [v8 setObject:v9 forKeyedSubscript:v7];

      [v4 addObject:v8];
      objc_msgSend(v6, "setDay:", objc_msgSend(v6, "day") + 1);
      --a2;
    }
    while (a2);
  }
  v10 = (void *)[v4 copy];

  return v10;
}

id NWCPlaceholderHourlyConditionsStartingAtDate(void *a1, uint64_t a2)
{
  id v3 = a1;
  uint64_t v4 = [MEMORY[0x263EFF980] arrayWithCapacity:a2];
  uint64_t v5 = [MEMORY[0x263EFF8F0] currentCalendar];
  id v6 = [v5 components:60 fromDate:v3];
  if (a2)
  {
    uint64_t v7 = *MEMORY[0x263F85FD0];
    do
    {
      uint64_t v8 = objc_opt_new();
      uint64_t v9 = [v5 dateFromComponents:v6];
      [v8 setObject:v9 forKeyedSubscript:v7];

      [v4 addObject:v8];
      objc_msgSend(v6, "setHour:", objc_msgSend(v6, "hour") + 1);
      --a2;
    }
    while (a2);
  }
  v10 = (void *)[v4 copy];

  return v10;
}

void NWCHourlyDateEnumeration(void *a1, void *a2, unint64_t a3, void *a4)
{
  id v16 = a1;
  id v7 = a2;
  uint64_t v8 = a4;
  uint64_t v9 = [MEMORY[0x263EFF8F0] currentCalendar];
  v10 = [v9 components:60 fromDate:v16];
  objc_msgSend(v10, "setHour:", objc_msgSend(v10, "hour") + 1);
  id v11 = [v9 dateFromComponents:v10];
  if ([v11 compare:v7] != 1 && a3 != 0)
  {
    unint64_t v13 = 1;
    do
    {
      id v14 = v11;
      v8[2](v8, v11);
      objc_msgSend(v10, "setHour:", objc_msgSend(v10, "hour") + 1);
      id v11 = [v9 dateFromComponents:v10];

      if ([v11 compare:v7] == 1) {
        break;
      }
    }
    while (v13++ < a3);
  }
}

void NWCMinuteByMinuteDateEnumeration(void *a1, void *a2, unint64_t a3, void *a4)
{
  id v16 = a1;
  id v7 = a2;
  uint64_t v8 = a4;
  uint64_t v9 = [MEMORY[0x263EFF8F0] currentCalendar];
  v10 = [v9 components:124 fromDate:v16];
  objc_msgSend(v10, "setMinute:", objc_msgSend(v10, "minute") + 1);
  id v11 = [v9 dateFromComponents:v10];
  if ([v11 compare:v7] != 1 && a3 != 0)
  {
    unint64_t v13 = 1;
    do
    {
      id v14 = v11;
      v8[2](v8, v11);
      objc_msgSend(v10, "setMinute:", objc_msgSend(v10, "minute") + 1);
      id v11 = [v9 dateFromComponents:v10];

      if ([v11 compare:v7] == 1) {
        break;
      }
    }
    while (v13++ < a3);
  }
}

uint64_t NWCIsCurrentLocaleNonLatin()
{
  if (NWCIsCurrentLocaleNonLatin_onceToken != -1) {
    dispatch_once(&NWCIsCurrentLocaleNonLatin_onceToken, &__block_literal_global_2);
  }
  v0 = (void *)NWCIsCurrentLocaleNonLatin_NonLatinSet;
  id v1 = [MEMORY[0x263EFF960] currentLocale];
  uint64_t v2 = [v1 languageCode];
  uint64_t v3 = [v0 containsObject:v2];

  return v3;
}

uint64_t __NWCIsCurrentLocaleNonLatin_block_invoke()
{
  NWCIsCurrentLocaleNonLatin_NonLatinSet = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"zh", @"ja", @"ko", @"hi", @"th", @"ar", 0);

  return MEMORY[0x270F9A758]();
}

uint64_t __NWCLocalizationBundle_block_invoke()
{
  NWCLocalizationBundle_Bundle = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];

  return MEMORY[0x270F9A758]();
}

id NWCLocalizedImageNamed(void *a1)
{
  id v1 = (void *)MEMORY[0x263F1C6B0];
  id v2 = a1;
  uint64_t v3 = NWCLocalizationBundle();
  uint64_t v4 = [MEMORY[0x263F1C920] mainScreen];
  uint64_t v5 = [v4 traitCollection];
  id v6 = [v1 imageNamed:v2 inBundle:v3 compatibleWithTraitCollection:v5];

  return v6;
}

id NWCGlyphPrefixedTextProvider(void *a1, void *a2, int a3)
{
  id v5 = a1;
  id v6 = a2;
  if (a3)
  {
    uint64_t v14 = 0;
    double v15 = &v14;
    uint64_t v16 = 0x2050000000;
    id v7 = (void *)getNTKOverrideTextProviderClass_softClass;
    uint64_t v17 = getNTKOverrideTextProviderClass_softClass;
    if (!getNTKOverrideTextProviderClass_softClass)
    {
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __getNTKOverrideTextProviderClass_block_invoke;
      v13[3] = &unk_264DEF9C0;
      v13[4] = &v14;
      __getNTKOverrideTextProviderClass_block_invoke((uint64_t)v13);
      id v7 = (void *)v15[3];
    }
    id v8 = v7;
    _Block_object_dispose(&v14, 8);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __NWCGlyphPrefixedTextProvider_block_invoke;
    v11[3] = &unk_264DEF998;
    id v12 = v6;
    uint64_t v9 = [v8 textProviderWithText:v5 overrideBlock:v11];
  }
  else
  {
    uint64_t v9 = [MEMORY[0x263EFD208] textProviderWithText:v5];
  }

  return v9;
}

void sub_23B5AAC10(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

id __NWCGlyphPrefixedTextProvider_block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v4 = 0;
  if (a2 && !a3)
  {
    id v7 = a4;
    id v8 = a2;
    uint64_t v9 = [v7 otherAttributes];
    v10 = (void *)[v9 mutableCopy];

    [v10 setObject:*(void *)(a1 + 32) forKeyedSubscript:*MEMORY[0x263F1C240]];
    id v11 = (void *)MEMORY[0x263F85F30];
    id v12 = [v7 font];

    unint64_t v13 = objc_msgSend(v11, "nwm_attributedDisplayNameWithLocationGlyph:inFont:", v8, v12);

    uint64_t v14 = (void *)[v13 mutableCopy];
    objc_msgSend(v14, "addAttributes:range:", v10, 0, objc_msgSend(v14, "length"));
    uint64_t v4 = (void *)[v14 copy];
  }

  return v4;
}

double NWCExtraLargeScalingFactor(void *a1)
{
  v15[3] = *MEMORY[0x263EF8340];
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&NWCExtraLargeScalingFactor___lock);
  id WeakRetained = objc_loadWeakRetained(&NWCExtraLargeScalingFactor___cachedDevice);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  uint64_t v3 = WeakRetained;
  id v4 = objc_loadWeakRetained(&NWCExtraLargeScalingFactor___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    id v7 = objc_storeWeak(&NWCExtraLargeScalingFactor___cachedDevice, v1);
    NWCExtraLargeScalingFactor___previousCLKDeviceVersion = [v1 version];

    __NWCExtraLargeScalingFactor_block_invoke(v8, (uint64_t)v1);
    goto LABEL_6;
  }
  uint64_t v5 = [v1 version];
  uint64_t v6 = NWCExtraLargeScalingFactor___previousCLKDeviceVersion;

  if (v5 != v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&NWCExtraLargeScalingFactor___lock);
  uint64_t v9 = (void *)NWCExtraLargeScalingFactor_Metrics;
  v14[0] = &unk_26EEA8300;
  v14[1] = &unk_26EEA8318;
  v15[0] = &unk_26EEA87B8;
  v15[1] = &unk_26EEA87B8;
  v14[2] = &unk_26EEA8330;
  v15[2] = &unk_26EEA87C8;
  v10 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];
  [v9 scaledValue:v10 withOverrides:2.86];
  double v12 = v11;

  return v12;
}

void __NWCExtraLargeScalingFactor_block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = [MEMORY[0x263EFD188] metricsWithDevice:a2 identitySizeClass:2];
  [v2 setRoundingBehavior:0];
  uint64_t v3 = (void *)NWCExtraLargeScalingFactor_Metrics;
  NWCExtraLargeScalingFactor_Metrics = (uint64_t)v2;
}

Class __getNTKOverrideTextProviderClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!NanoTimeKitCompanionLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __NanoTimeKitCompanionLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_264DEF9E0;
    uint64_t v6 = 0;
    NanoTimeKitCompanionLibraryCore_frameworkLibrary = _sl_dlopen();
    id v2 = (void *)v4[0];
    if (!NanoTimeKitCompanionLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("NTKOverrideTextProvider");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    id v2 = (void *)__getNTKOverrideTextProviderClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getNTKOverrideTextProviderClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __NanoTimeKitCompanionLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  NanoTimeKitCompanionLibraryCore_frameworkLibrary = result;
  return result;
}

id NWMAirQualityLocalizedString(void *a1)
{
  id v1 = a1;
  id v2 = +[NWCCBundle bundle];
  uint64_t v3 = [v2 localizedStringForKey:v1 value:&stru_26EEA3A40 table:@"AirQuality"];

  return v3;
}

id NWMWindLocalizedString(void *a1)
{
  id v1 = a1;
  id v2 = +[NWCCBundle bundle];
  uint64_t v3 = [v2 localizedStringForKey:v1 value:&stru_26EEA3A40 table:@"Wind"];

  return v3;
}

id NWMConditionsLocalizedString(void *a1)
{
  id v1 = a1;
  id v2 = +[NWCCBundle bundle];
  uint64_t v3 = [v2 localizedStringForKey:v1 value:&stru_26EEA3A40 table:@"Conditions"];

  return v3;
}

void _LayoutConstants(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  id obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_3);
  id WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_3);
  if (WeakRetained)
  {
    uint64_t v6 = WeakRetained;
    id v7 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_3);
    if (v7 == obj)
    {
      uint64_t v8 = [obj version];
      uint64_t v9 = _LayoutConstants___previousCLKDeviceVersion_3;

      if (v8 == v9) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v10 = objc_storeWeak(&_LayoutConstants___cachedDevice_3, obj);
  _LayoutConstants___previousCLKDeviceVersion_3 = [obj version];

  ___LayoutConstants_block_invoke_3(v11, obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_3);
  if (a2 == 12) {
    double v12 = &_LayoutConstants___constantsGraphicExtraLarge;
  }
  else {
    double v12 = &_LayoutConstants___constantsGraphicCircular;
  }
  long long v13 = v12[1];
  *(_OWORD *)a3 = *v12;
  *(_OWORD *)(a3 + 16) = v13;
  *(void *)(a3 + 32) = *((void *)v12 + 4);
}

double _LinearGaugeLayoutConstants(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&_LinearGaugeLayoutConstants___lock);
  id WeakRetained = objc_loadWeakRetained(&_LinearGaugeLayoutConstants___cachedDevice);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  uint64_t v3 = WeakRetained;
  id v4 = objc_loadWeakRetained(&_LinearGaugeLayoutConstants___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    id v7 = objc_storeWeak(&_LinearGaugeLayoutConstants___cachedDevice, v1);
    _LinearGaugeLayoutConstants___previousCLKDeviceVersion = [v1 version];

    ___LinearGaugeLayoutConstants_block_invoke(v8, v1);
    goto LABEL_6;
  }
  uint64_t v5 = [v1 version];
  uint64_t v6 = _LinearGaugeLayoutConstants___previousCLKDeviceVersion;

  if (v5 != v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_LinearGaugeLayoutConstants___lock);
  double v9 = *(double *)&_LinearGaugeLayoutConstants_constants_0;

  return v9;
}

id NWMUltravioletIndexLocalizedString(void *a1)
{
  id v1 = a1;
  id v2 = +[NWCCBundle bundle];
  uint64_t v3 = [v2 localizedStringForKey:v1 value:&stru_26EEA3A40 table:@"UltravioletIndex"];

  return v3;
}

int64_t __getNTKOverrideTextProviderClass_block_invoke_cold_1()
{
  v0 = (NWCWindObservationsBaseView *)abort_report_np();
  return [(NWCWindObservationsBaseView *)v0 supportedComplicationFamily];
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

uint64_t CLKStringForComplicationFamily()
{
  return MEMORY[0x270EE3258]();
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x270EF2BB8]();
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return (NSString *)MEMORY[0x270EF2C18](proto);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

uint64_t NWMInterpolateBetweenColors()
{
  return MEMORY[0x270F4DC50]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
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