@interface WFWeatherChannelParserV2
+ (NSSet)componentsForCurrentForecast;
+ (NSSet)componentsForDailyForecasts;
+ (NSSet)componentsForHourlyForecasts;
+ (unint64_t)expectedDailyForecastCount;
+ (unint64_t)expectedHourlyForecastCount;
- (NSCalendar)calendar;
- (WFWeatherChannelParserV2)init;
- (id)parseAirQualityData:(id)a3 location:(id)a4 error:(id *)a5;
- (id)parseCurrentCondition:(id)a3;
- (id)parseDailyForecasts:(id)a3;
- (id)parseForecastData:(id)a3 types:(unint64_t)a4 location:(id)a5 locale:(id)a6 date:(id)a7 error:(id *)a8;
- (id)parseForecastData:(id)a3 types:(unint64_t)a4 location:(id)a5 locale:(id)a6 date:(id)a7 error:(id *)a8 rules:(id)a9;
- (id)parseHourlyForecasts:(id)a3;
- (unint64_t)_pressureTrendFromWeatherChannelCode:(id)a3;
- (void)parseCommonComponents:(id)a3 data:(id)a4;
- (void)setCalendar:(id)a3;
@end

@implementation WFWeatherChannelParserV2

- (WFWeatherChannelParserV2)init
{
  v9.receiver = self;
  v9.super_class = (Class)WFWeatherChannelParserV2;
  v2 = [(WFWeatherChannelParserV2 *)&v9 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x263EFF8F0]);
    uint64_t v4 = [v3 initWithCalendarIdentifier:*MEMORY[0x263EFF410]];
    calendar = v2->_calendar;
    v2->_calendar = (NSCalendar *)v4;

    v6 = [MEMORY[0x263EFFA18] timeZoneWithName:@"GMT"];
    v7 = [(WFWeatherChannelParserV2 *)v2 calendar];
    [v7 setTimeZone:v6];
  }
  return v2;
}

- (id)parseForecastData:(id)a3 types:(unint64_t)a4 location:(id)a5 locale:(id)a6 date:(id)a7 error:(id *)a8
{
  return [(WFWeatherChannelParserV2 *)self parseForecastData:a3 types:a4 location:a5 locale:a6 date:a7 error:a8 rules:0];
}

- (id)parseForecastData:(id)a3 types:(unint64_t)a4 location:(id)a5 locale:(id)a6 date:(id)a7 error:(id *)a8 rules:(id)a9
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a9;
  if (!v15)
  {
    id v21 = 0;
    goto LABEL_9;
  }
  v54 = self;
  id v59 = 0;
  v20 = [MEMORY[0x263F08900] JSONObjectWithData:v15 options:0 error:&v59];
  id v21 = v59;
  if (!v20)
  {
LABEL_9:
    v25 = WFLogForCategory(7uLL);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[WFWeatherChannelParserV2 parseForecastData:types:location:locale:date:error:rules:]();
    }

    if (!v21)
    {
      v23 = 0;
      goto LABEL_34;
    }
    v26 = (void *)MEMORY[0x263F087E8];
    uint64_t v60 = *MEMORY[0x263F08320];
    v61 = @"Failed to parse JSON forecast data";
    v20 = [NSDictionary dictionaryWithObjects:&v61 forKeys:&v60 count:1];
    objc_msgSend(v26, "wf_errorWithCode:encapsulatedError:userInfo:", 1, v21, v20);
    v23 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_33;
  }
  v22 = WFLogForCategory(7uLL);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
    -[WFWeatherChannelParserV2 parseForecastData:types:location:locale:date:error:rules:]();
  }

  v23 = objc_alloc_init(WFParsedForecastData);
  if (a4 != 1)
  {
    id v51 = v21;
    id v52 = v18;
    id v46 = v19;
    id v47 = v17;
    id v48 = v16;
    id v49 = v15;
    v53 = [(WFWeatherChannelParserV2 *)v54 parseCurrentCondition:v20];
    v27 = [v53 valueForComponent:@"WFWeatherForecastDateComponent"];
    uint64_t v28 = +[WFWeatherConditions calendar];
    v29 = v20;
    v30 = (void *)v28;
    v50 = v29;
    -[WFWeatherChannelParserV2 parseDailyForecasts:](v54, "parseDailyForecasts:");
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v31 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v32 = [v31 countByEnumeratingWithState:&v55 objects:v62 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v56;
LABEL_16:
      uint64_t v35 = 0;
      while (1)
      {
        if (*(void *)v56 != v34) {
          objc_enumerationMutation(v31);
        }
        v36 = *(void **)(*((void *)&v55 + 1) + 8 * v35);
        v37 = [v36 valueForComponent:@"WFWeatherForecastDateComponent"];
        if ([v30 isDate:v37 inSameDayAsDate:v27]) {
          break;
        }

        if (v33 == ++v35)
        {
          uint64_t v33 = [v31 countByEnumeratingWithState:&v55 objects:v62 count:16];
          if (v33) {
            goto LABEL_16;
          }
          goto LABEL_22;
        }
      }
      uint64_t v39 = [v36 valueForComponent:@"WFWeatherHighTemperatureComponent"];
      uint64_t v38 = [v36 valueForComponent:@"WFWeatherLowTemperatureComponent"];

      if (v39) {
        BOOL v40 = v38 == 0;
      }
      else {
        BOOL v40 = 1;
      }
      v45 = (void *)v39;
      if (!v40)
      {
        [v53 setValue:v39 forComponent:@"WFWeatherHighTemperatureComponent"];
        v44 = (void *)v38;
        [v53 setValue:v38 forComponent:@"WFWeatherLowTemperatureComponent"];
        id v16 = v48;
        id v15 = v49;
        id v17 = v47;
        goto LABEL_31;
      }
    }
    else
    {
LABEL_22:

      uint64_t v38 = 0;
      v45 = 0;
    }
    id v16 = v48;
    id v15 = v49;
    v41 = WFLogForCategory(7uLL);
    id v17 = v47;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      -[WFWeatherChannelParserV2 parseForecastData:types:location:locale:date:error:rules:]();
    }
    v44 = (void *)v38;

LABEL_31:
    id v19 = v46;
    [(WFParsedForecastData *)v23 setDailyForecasts:v31];
    v42 = [(WFWeatherChannelParserV2 *)v54 parseHourlyForecasts:v50];
    [(WFParsedForecastData *)v23 setHourlyForecasts:v42];

    v24 = v53;
    [(WFParsedForecastData *)v23 setCurrentConditions:v53];
    [(WFParsedForecastData *)v23 setRawData:v15];

    v20 = v50;
    id v21 = v51;
    id v18 = v52;
    goto LABEL_32;
  }
  if (+[WFResponseParsingRules aqiEnabledByRules:v19 forLocation:v16])
  {
    v24 = [(WFWeatherChannelParserV2 *)v54 parseAirQualityData:v15 location:v16 error:a8];
    [(WFParsedForecastData *)v23 setAirQualityObservations:v24];
LABEL_32:
  }
LABEL_33:

LABEL_34:
  return v23;
}

+ (unint64_t)expectedHourlyForecastCount
{
  return 24;
}

+ (unint64_t)expectedDailyForecastCount
{
  return 11;
}

+ (NSSet)componentsForCurrentForecast
{
  v6[22] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"WFWeatherForecastDateComponent";
  v6[1] = @"WFWeatherForecastExpirationDateComponent";
  v6[2] = @"WFWeatherConditionComponent";
  v6[3] = @"WFWeatherFeelsLikeTemperatureComponent";
  v6[4] = @"WFWeatherTemperatureComponent";
  v6[5] = @"WFWeatherHighTemperatureComponent";
  v6[6] = @"WFWeatherLowTemperatureComponent";
  v6[7] = @"WFWeatherWindSpeedComponent";
  v6[8] = @"WFWeatherWindDirectionComponent";
  v6[9] = @"WFWeatherPrecipitationAmountComponent";
  v6[10] = @"WFWeatherHumidityComponent";
  v6[11] = @"WFWeatherDewpointComponent";
  v6[12] = @"WFWeatherPressureComponent";
  v6[13] = @"WFWeatherPressureTrendComponent";
  v6[14] = @"WFWeatherUVIndexComponent";
  v6[15] = @"WFWeatherVisibilityComponent";
  v6[16] = @"WFWeatherSunriseDateComponent";
  v6[17] = @"WFWeatherSunsetDateComponent";
  v6[18] = @"WFWeatherIOSLinkComponent";
  v6[19] = @"WFWeatherWebLinkComponent";
  v6[20] = @"WFWeatherMobileLinkComponent";
  v6[21] = @"__THIS_WILL_BE_DEPRECATED__WFWeatherLegacyConditionComponent";
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:22];
  uint64_t v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (NSSet)componentsForHourlyForecasts
{
  v6[15] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"WFWeatherForecastDateComponent";
  v6[1] = @"WFWeatherForecastExpirationDateComponent";
  v6[2] = @"WFWeatherConditionComponent";
  v6[3] = @"WFWeatherTemperatureComponent";
  v6[4] = @"WFWeatherWindSpeedComponent";
  v6[5] = @"WFWeatherWindDirectionComponent";
  v6[6] = @"WFWeatherPrecipitationChanceComponent";
  v6[7] = @"WFWeatherHumidityComponent";
  v6[8] = @"WFWeatherDewpointComponent";
  v6[9] = @"WFWeatherUVIndexComponent";
  v6[10] = @"WFWeatherVisibilityComponent";
  v6[11] = @"__THIS_WILL_BE_DEPRECATED__WFWeatherLegacyConditionComponent";
  v6[12] = @"__THIS_WILL_BE_DEPRECATED__WFWeatherSeriesIndexComponent";
  v6[13] = @"WFWeatherSunsetDateComponent";
  v6[14] = @"WFWeatherSunriseDateComponent";
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:15];
  uint64_t v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (NSSet)componentsForDailyForecasts
{
  v6[11] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"WFWeatherForecastDateComponent";
  v6[1] = @"WFWeatherForecastExpirationDateComponent";
  v6[2] = @"WFWeatherConditionComponent";
  v6[3] = @"WFWeatherHighTemperatureComponent";
  v6[4] = @"WFWeatherLowTemperatureComponent";
  v6[5] = @"WFWeatherPrecipitationChanceComponent";
  v6[6] = @"WFWeatherSunriseDateComponent";
  v6[7] = @"WFWeatherSunsetDateComponent";
  v6[8] = @"WFWeatherUVIndexComponent";
  v6[9] = @"__THIS_WILL_BE_DEPRECATED__WFWeatherLegacyConditionComponent";
  v6[10] = @"__THIS_WILL_BE_DEPRECATED__WFWeatherSeriesIndexComponent";
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:11];
  uint64_t v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

- (unint64_t)_pressureTrendFromWeatherChannelCode:(id)a3
{
  unsigned int v3 = [a3 intValue] - 1;
  if (v3 > 3) {
    return 0;
  }
  else {
    return qword_21C9D8B90[v3];
  }
}

- (id)parseDailyForecasts:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263F08790]);
  [v4 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
  v5 = [MEMORY[0x263EFFA18] timeZoneWithAbbreviation:@"GMT"];
  [v4 setTimeZone:v5];

  BOOL v40 = v3;
  v6 = objc_msgSend(v3, "wf_arrayForKeyPath:", &unk_26CD649D0);
  v7 = v6;
  if (v6)
  {
    id v37 = v4;
    v8 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    uint64_t v35 = v7;
    id obj = v7;
    uint64_t v9 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v44;
      uint64_t v38 = *(void *)v44;
      uint64_t v39 = v8;
      do
      {
        uint64_t v12 = 0;
        uint64_t v41 = v10;
        do
        {
          if (*(void *)v44 != v11) {
            objc_enumerationMutation(obj);
          }
          v13 = *(WFWeatherConditions **)(*((void *)&v43 + 1) + 8 * v12);
          v14 = WFLogForCategory(7uLL);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            id v48 = v13;
            _os_log_debug_impl(&dword_21C988000, v14, OS_LOG_TYPE_DEBUG, "Parsing daily forecast: %@", buf, 0xCu);
          }

          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v15 = v13;
            id v16 = objc_alloc_init(WFWeatherConditions);
            id v17 = [(WFWeatherConditions *)v15 wf_numberForKeyPath:&unk_26CD64A00];
            id v18 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v17, "unsignedIntegerValue"));
            [(WFWeatherConditions *)v16 setValue:v18 forComponent:@"WFWeatherForecastDateComponent"];
            id v19 = objc_msgSend(v40, "wf_numberForKeyPath:", &unk_26CD64A18);
            v20 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v19, "unsignedIntegerValue"));
            [(WFWeatherConditions *)v16 setValue:v20 forComponent:@"WFWeatherForecastExpirationDateComponent"];
            id v21 = [(WFWeatherConditions *)v15 wf_temperatureWithCelsiusKeyPath:&unk_26CD64A30 fahrenheitKeyPath:&unk_26CD64A48];
            [(WFWeatherConditions *)v16 setValue:v21 forComponent:@"WFWeatherHighTemperatureComponent"];

            v22 = [(WFWeatherConditions *)v15 wf_temperatureWithCelsiusKeyPath:&unk_26CD64A60 fahrenheitKeyPath:&unk_26CD64A78];
            [(WFWeatherConditions *)v16 setValue:v22 forComponent:@"WFWeatherLowTemperatureComponent"];

            v23 = [(WFWeatherConditions *)v15 wf_numberForKeyPath:&unk_26CD64A90];
            [(WFWeatherConditions *)v16 setValue:v23 forComponent:@"__THIS_WILL_BE_DEPRECATED__WFWeatherSeriesIndexComponent"];

            v24 = [(WFWeatherConditions *)v15 wf_dictionaryForKeyPath:&unk_26CD64AA8];
            if (!v24)
            {
              v24 = [(WFWeatherConditions *)v15 wf_dictionaryForKeyPath:&unk_26CD64AC0];
              [(WFWeatherConditions *)v16 setNightForecast:1];
            }
            v25 = objc_msgSend(v24, "wf_numberForKeyPath:", &unk_26CD64AD8, v35);
            [(WFWeatherConditions *)v16 setValue:v25 forComponent:@"__THIS_WILL_BE_DEPRECATED__WFWeatherLegacyConditionComponent"];
            v26 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", WFConditionCodeFromLegacyWeatherConditionCode(objc_msgSend(v25, "unsignedIntegerValue")));
            [(WFWeatherConditions *)v16 setValue:v26 forComponent:@"WFWeatherConditionComponent"];

            v27 = objc_msgSend(v24, "wf_numberForKeyPath:", &unk_26CD64AF0);
            [(WFWeatherConditions *)v16 setValue:v27 forComponent:@"WFWeatherPrecipitationChanceComponent"];

            uint64_t v28 = objc_msgSend(v24, "wf_numberForKeyPath:", &unk_26CD64B08);
            [(WFWeatherConditions *)v16 setValue:v28 forComponent:@"WFWeatherUVIndexComponent"];

            v29 = WFLogForCategory(7uLL);
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              id v48 = v16;
              _os_log_debug_impl(&dword_21C988000, v29, OS_LOG_TYPE_DEBUG, "Parsed daily forecast into: %@", buf, 0xCu);
            }

            v8 = v39;
            [v39 addObject:v16];

            uint64_t v10 = v41;
            uint64_t v11 = v38;
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
      }
      while (v10);
    }

    uint64_t v30 = [v8 count];
    id v4 = v37;
    if (v30 != +[WFWeatherChannelParserV2 expectedDailyForecastCount])
    {
      id v31 = WFLogForCategory(7uLL);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        -[WFWeatherChannelParserV2 parseDailyForecasts:](v8);
      }
    }
    uint64_t v32 = +[WFForecastDataParserUtils ascendingTimeComparator];
    uint64_t v33 = [v8 sortedArrayUsingComparator:v32];

    v7 = v36;
  }
  else
  {
    v8 = WFLogForCategory(7uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[WFWeatherChannelParserV2 parseDailyForecasts:]();
    }
    uint64_t v33 = 0;
  }

  return v33;
}

- (id)parseHourlyForecasts:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v31 = a3;
  id v3 = objc_msgSend(v31, "wf_arrayForKeyPath:", &unk_26CD64B20);
  id v4 = v3;
  if (v3)
  {
    uint64_t v30 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    uint64_t v28 = v4;
    id obj = v4;
    uint64_t v5 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v35;
      do
      {
        uint64_t v8 = 0;
        uint64_t v32 = v6;
        do
        {
          if (*(void *)v35 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void **)(*((void *)&v34 + 1) + 8 * v8);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v10 = v9;
            uint64_t v11 = WFLogForCategory(7uLL);
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v39 = v10;
              _os_log_debug_impl(&dword_21C988000, v11, OS_LOG_TYPE_DEBUG, "Parsing hourly forecast: %@", buf, 0xCu);
            }

            uint64_t v12 = objc_alloc_init(WFWeatherConditions);
            v13 = [(WFWeatherConditions *)v10 wf_numberForKeyPath:&unk_26CD64B50];
            v14 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v13, "unsignedIntegerValue"));
            [(WFWeatherConditions *)v12 setValue:v14 forComponent:@"WFWeatherForecastDateComponent"];
            id v15 = objc_msgSend(v31, "wf_numberForKeyPath:", &unk_26CD64B68);
            id v16 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v15, "unsignedIntegerValue"));
            [(WFWeatherConditions *)v12 setValue:v16 forComponent:@"WFWeatherForecastExpirationDateComponent"];
            id v17 = [(WFWeatherConditions *)v10 wf_numberForKeyPath:&unk_26CD64B80];
            [(WFWeatherConditions *)v12 setValue:v17 forComponent:@"__THIS_WILL_BE_DEPRECATED__WFWeatherSeriesIndexComponent"];

            id v18 = [(WFWeatherConditions *)v10 wf_numberForKeyPath:&unk_26CD64B98];
            id v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", WFConditionCodeFromLegacyWeatherConditionCode(objc_msgSend(v18, "unsignedIntegerValue")));
            [(WFWeatherConditions *)v12 setValue:v19 forComponent:@"WFWeatherConditionComponent"];

            [(WFWeatherConditions *)v12 setValue:v18 forComponent:@"__THIS_WILL_BE_DEPRECATED__WFWeatherLegacyConditionComponent"];
            v20 = [(WFWeatherConditions *)v10 wf_numberForKeyPath:&unk_26CD64BB0];
            [(WFWeatherConditions *)v12 setValue:v20 forComponent:@"WFWeatherPrecipitationChanceComponent"];

            [(WFWeatherChannelParserV2 *)self parseCommonComponents:v12 data:v10];
            [v30 addObject:v12];
            id v21 = WFLogForCategory(7uLL);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v39 = v12;
              _os_log_debug_impl(&dword_21C988000, v21, OS_LOG_TYPE_DEBUG, "Parsed hourly forecast into: %@", buf, 0xCu);
            }

            uint64_t v6 = v32;
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
      }
      while (v6);
    }

    v22 = v30;
    uint64_t v23 = [v30 count];
    if (v23 != +[WFWeatherChannelParserV2 expectedHourlyForecastCount])
    {
      v24 = WFLogForCategory(7uLL);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[WFWeatherChannelParserV2 parseHourlyForecasts:](v30);
      }
    }
    v25 = +[WFForecastDataParserUtils ascendingTimeComparator];
    v26 = [v30 sortedArrayUsingComparator:v25];

    id v4 = v28;
  }
  else
  {
    v22 = WFLogForCategory(7uLL);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[WFWeatherChannelParserV2 parseHourlyForecasts:]();
    }
    v26 = 0;
  }

  return v26;
}

- (id)parseCurrentCondition:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(v4, "wf_dictionaryForKeyPath:", &unk_26CD64BC8);
  uint64_t v6 = WFLogForCategory(7uLL);
  uint64_t v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[WFWeatherChannelParserV2 parseCurrentCondition:]();
    }

    uint64_t v8 = objc_alloc_init(WFWeatherConditions);
    uint64_t v7 = objc_msgSend(v5, "wf_numberForKeyPath:", &unk_26CD64BF8);
    uint64_t v32 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v7, "unsignedIntegerValue"));
    -[WFWeatherConditions setValue:forComponent:](v8, "setValue:forComponent:");
    id v31 = objc_msgSend(v4, "wf_numberForKeyPath:", &unk_26CD64C10);
    uint64_t v30 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v31, "unsignedIntegerValue"));
    -[WFWeatherConditions setValue:forComponent:](v8, "setValue:forComponent:");
    uint64_t v9 = objc_msgSend(v5, "wf_temperatureWithCelsiusKeyPath:fahrenheitKeyPath:", &unk_26CD64C28, &unk_26CD64C40);
    [(WFWeatherConditions *)v8 setValue:v9 forComponent:@"WFWeatherFeelsLikeTemperatureComponent"];

    uint64_t v10 = objc_msgSend(v5, "wf_numberForKeyPath:", &unk_26CD64C58);
    uint64_t v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", WFConditionCodeFromLegacyWeatherConditionCode(objc_msgSend(v10, "unsignedIntegerValue")));
    [(WFWeatherConditions *)v8 setValue:v11 forComponent:@"WFWeatherConditionComponent"];

    v29 = v10;
    [(WFWeatherConditions *)v8 setValue:v10 forComponent:@"__THIS_WILL_BE_DEPRECATED__WFWeatherLegacyConditionComponent"];
    uint64_t v12 = NSNumber;
    v13 = objc_msgSend(v5, "wf_numberForKeyPath:", &unk_26CD64C70);
    [v13 floatValue];
    id v15 = [v12 numberWithDouble:v14 * 25.4];

    [(WFWeatherConditions *)v8 setValue:v15 forComponent:@"WFWeatherPrecipitationAmountComponent"];
    id v16 = objc_msgSend(v5, "wf_numberForKeyPath:", &unk_26CD64C88);
    [(WFWeatherConditions *)v8 setValue:v16 forComponent:@"WFWeatherPressureComponent"];

    id v17 = objc_msgSend(v5, "wf_numberForKeyPath:", &unk_26CD64CA0);
    id v18 = v17;
    if (v17 && (unint64_t)[v17 unsignedIntegerValue] <= 4)
    {
      id v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[WFWeatherChannelParserV2 _pressureTrendFromWeatherChannelCode:](self, "_pressureTrendFromWeatherChannelCode:", v18));
      [(WFWeatherConditions *)v8 setValue:v19 forComponent:@"WFWeatherPressureTrendComponent"];
    }
    uint64_t v33 = self;
    id v34 = v4;
    v20 = objc_msgSend(v4, "wf_dictionaryForKeyPath:", &unk_26CD64CB8);
    id v21 = objc_msgSend(v20, "wf_stringForKeyPath:", &unk_26CD64CD0);
    v22 = objc_msgSend(v20, "wf_stringForKeyPath:", &unk_26CD64CE8);
    uint64_t v23 = objc_msgSend(v20, "wf_stringForKeyPath:", &unk_26CD64D00);
    if (v21)
    {
      v24 = [NSURL URLWithString:v21];
      [(WFWeatherConditions *)v8 setValue:v24 forComponent:@"WFWeatherWebLinkComponent"];
    }
    if (v22)
    {
      v25 = [NSURL URLWithString:v22];
      [(WFWeatherConditions *)v8 setValue:v25 forComponent:@"WFWeatherIOSLinkComponent"];
    }
    if (v23)
    {
      v26 = [NSURL URLWithString:v23];
      [(WFWeatherConditions *)v8 setValue:v26 forComponent:@"WFWeatherMobileLinkComponent"];
    }
    [(WFWeatherChannelParserV2 *)v33 parseCommonComponents:v8 data:v5];
    v27 = WFLogForCategory(7uLL);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
      -[WFWeatherChannelParserV2 parseCurrentCondition:]();
    }

    id v4 = v34;
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[WFWeatherChannelParserV2 parseCurrentCondition:]();
    }
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)parseCommonComponents:(id)a3 data:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = objc_msgSend(v5, "wf_temperatureWithCelsiusKeyPath:fahrenheitKeyPath:", &unk_26CD64D18, &unk_26CD64D30);
  [v6 setValue:v7 forComponent:@"WFWeatherTemperatureComponent"];

  uint64_t v8 = objc_msgSend(v5, "wf_numberForKeyPath:", &unk_26CD64D48);
  [v6 setValue:v8 forComponent:@"WFWeatherWindDirectionComponent"];

  uint64_t v9 = objc_msgSend(v5, "wf_numberForKeyPath:", &unk_26CD64D60);
  [v6 setValue:v9 forComponent:@"WFWeatherWindSpeedComponent"];

  uint64_t v10 = objc_msgSend(v5, "wf_numberForKeyPath:", &unk_26CD64D78);
  [v6 setValue:v10 forComponent:@"WFWeatherHumidityComponent"];

  uint64_t v11 = objc_msgSend(v5, "wf_numberForKeyPath:", &unk_26CD64D90);
  [v6 setValue:v11 forComponent:@"WFWeatherDewpointComponent"];

  uint64_t v12 = objc_msgSend(v5, "wf_numberForKeyPath:", &unk_26CD64DA8);
  [v6 setValue:v12 forComponent:@"WFWeatherUVIndexComponent"];

  objc_msgSend(v5, "wf_numberForKeyPath:", &unk_26CD64DC0);
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  [v6 setValue:v13 forComponent:@"WFWeatherVisibilityComponent"];
}

- (id)parseAirQualityData:(id)a3 location:(id)a4 error:(id *)a5
{
  v87[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    uint64_t v9 = WFLogForCategory(7uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[WFWeatherChannelParserV2 parseAirQualityData:location:error:].cold.5(v9);
    }

    id v84 = 0;
    uint64_t v10 = [MEMORY[0x263F08900] JSONObjectWithData:v7 options:4 error:&v84];
    id v11 = v84;
    id v12 = v11;
    if (!v10 || v11)
    {
      if (a5)
      {
        objc_msgSend(MEMORY[0x263F087E8], "wf_errorWithCode:encapsulatedError:userInfo:", 1, v11, 0);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      v22 = WFLogForCategory(7uLL);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[WFWeatherChannelParserV2 parseAirQualityData:location:error:]();
      }
      goto LABEL_18;
    }
    id v13 = [v10 wf_numberForKeyPath:&unk_26CD64DD8];
    uint64_t v14 = [v13 integerValue];

    id v15 = [v10 wf_numberForKeyPath:&unk_26CD64DF0];
    [v15 doubleValue];
    double v17 = v16;

    id v18 = [v10 wf_numberForKeyPath:&unk_26CD64E08];
    [v18 doubleValue];
    double v20 = v19;

    id v21 = [objc_alloc(MEMORY[0x263F00A50]) initWithLatitude:v17 longitude:v20];
    v22 = v21;
    if (v14 == 200)
    {
      [v21 coordinate];
      if (!CLLocationCoordinate2DIsValid(v89))
      {
        uint64_t v32 = (void *)MEMORY[0x263F087E8];
        v86 = @"location";
        v87[0] = v22;
        uint64_t v33 = [NSDictionary dictionaryWithObjects:v87 forKeys:&v86 count:1];
        objc_msgSend(v32, "wf_errorWithCode:userInfo:", 4, v33);
        id v12 = (id)objc_claimAutoreleasedReturnValue();

        if (v12) {
          goto LABEL_42;
        }
      }
    }
    else
    {
      if (v14 == 204) {
        uint64_t v23 = 10;
      }
      else {
        uint64_t v23 = 8;
      }
      objc_msgSend(MEMORY[0x263F087E8], "wf_errorWithCode:", v23);
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
LABEL_42:
        if (a5)
        {
          v67 = WFLogForCategory(7uLL);
          if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
            -[WFWeatherChannelParserV2 parseAirQualityData:location:error:]();
          }

          id v12 = v12;
          id v31 = 0;
          *a5 = v12;
          goto LABEL_46;
        }
LABEL_18:
        id v31 = 0;
LABEL_46:

        goto LABEL_47;
      }
    }

    id v34 = objc_alloc_init(MEMORY[0x263F08790]);
    [v34 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
    long long v35 = [MEMORY[0x263EFFA18] timeZoneWithAbbreviation:@"GMT"];
    [v34 setTimeZone:v35];

    long long v36 = objc_opt_new();
    [v36 setLocation:v8];
    long long v37 = [v10 wf_stringForKeyPath:&unk_26CD64E20];
    uint64_t v38 = [v37 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];

    uint64_t v39 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:v38];
    BOOL v40 = [v10 wf_arrayForKeyPath:&unk_26CD64E38];
    uint64_t v41 = [v40 firstObject];

    if (!v41)
    {
      uint64_t v41 = [v10 wf_dictionaryForKeyPath:&unk_26CD64E50];
    }
    v74 = v38;
    id v77 = v8;
    id v78 = v7;
    v76 = v10;
    v42 = [v10 wf_numberForKeyPath:&unk_26CD64E68];
    objc_msgSend(v41, "wf_stringForKeyPath:", &unk_26CD64E80);
    v70 = id v75 = v34;
    long long v43 = objc_msgSend(v34, "dateFromString:");
    [v36 setDate:v43];

    v71 = v42;
    long long v44 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v42, "unsignedIntegerValue"));
    [v36 setExpirationDate:v44];

    long long v45 = objc_msgSend(v41, "wf_stringForKeyPath:", &unk_26CD64E98);
    [v36 setProvider:v45];

    v73 = (void *)v39;
    [v36 setLocale:v39];
    long long v46 = objc_msgSend(v41, "wf_numberForKeyPath:", &unk_26CD64EB0);
    objc_msgSend(v36, "setLocalizedAirQualityIndex:", objc_msgSend(v46, "integerValue"));

    id v47 = objc_msgSend(v41, "wf_stringForKeyPath:", &unk_26CD64EC8);
    [v36 setAirQualityScale:v47];

    id v48 = objc_msgSend(v41, "wf_stringForKeyPath:", &unk_26CD64EE0);
    [v36 setLocalizedAirQualityCategory:v48];

    id v49 = objc_msgSend(v41, "wf_numberForKeyPath:", &unk_26CD64EF8);
    uint64_t v50 = v49;
    if (v49) {
      objc_msgSend(v36, "setCategory:", objc_msgSend(v49, "integerValue"));
    }
    v69 = v50;
    id v51 = v36;
    v72 = v41;
    id v52 = objc_msgSend(v41, "wf_arrayForKeyPath:", &unk_26CD64F10);
    v53 = objc_opt_new();
    long long v80 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    id obj = v52;
    uint64_t v54 = [obj countByEnumeratingWithState:&v80 objects:v85 count:16];
    if (v54)
    {
      uint64_t v55 = v54;
      uint64_t v56 = *(void *)v81;
      do
      {
        for (uint64_t i = 0; i != v55; ++i)
        {
          if (*(void *)v81 != v56) {
            objc_enumerationMutation(obj);
          }
          long long v58 = *(void **)(*((void *)&v80 + 1) + 8 * i);
          id v59 = objc_opt_new();
          uint64_t v60 = objc_msgSend(v58, "wf_stringForKeyPath:", &unk_26CD64F28);
          [v59 setLocalizedName:v60];

          v61 = objc_msgSend(v58, "wf_stringForKeyPath:", &unk_26CD64F40);
          [v59 setLocalizedDescription:v61];

          v62 = objc_msgSend(v58, "wf_numberForKeyPath:", &unk_26CD64F58);
          [v62 doubleValue];
          objc_msgSend(v59, "setAmount:");

          uint64_t v63 = objc_msgSend(v58, "wf_stringForKeyPath:", &unk_26CD64F70);
          int v64 = [v63 BOOLValue];

          v65 = [v51 primaryPollutant];

          if (!v65 && v64) {
            [v51 setPrimaryPollutant:v59];
          }
          [v53 addObject:v59];
        }
        uint64_t v55 = [obj countByEnumeratingWithState:&v80 objects:v85 count:16];
      }
      while (v55);
    }

    id v31 = v51;
    if ([v53 count]) {
      [v51 setPollutants:v53];
    }
    v66 = WFLogForCategory(7uLL);
    id v8 = v77;
    id v7 = v78;
    v22 = v74;
    id v12 = v75;
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG)) {
      -[WFWeatherChannelParserV2 parseAirQualityData:location:error:]();
    }

    uint64_t v10 = v76;
    goto LABEL_46;
  }
  if (a5)
  {
    objc_msgSend(MEMORY[0x263F087E8], "wf_errorWithCode:", 1);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v10 = WFLogForCategory(7uLL);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    -[WFWeatherChannelParserV2 parseAirQualityData:location:error:](v10, v24, v25, v26, v27, v28, v29, v30);
  }
  id v31 = 0;
LABEL_47:

  return v31;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (void)setCalendar:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)parseForecastData:types:location:locale:date:error:rules:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_21C988000, v0, v1, "Failed to parse JSON data with error \"%@\"", v2, v3, v4, v5, v6);
}

- (void)parseForecastData:types:location:locale:date:error:rules:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_21C988000, v0, v1, "Did not find a forecasted high/low for %{public}@.", v2, v3, v4, v5, v6);
}

- (void)parseForecastData:types:location:locale:date:error:rules:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21C988000, v0, v1, "NSJSONSerialization parsed the data into: '%@'", v2, v3, v4, v5, v6);
}

- (void)parseDailyForecasts:.cold.1()
{
  v0 = +[WFForecastDataParserUtils stringFromKeyPath:&unk_26CD649E8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3_0(&dword_21C988000, v1, v2, "Missing daily forecasts at key path %@", v3, v4, v5, v6, v7);
}

- (void)parseDailyForecasts:(void *)a1 .cold.2(void *a1)
{
  [a1 count];
  +[WFWeatherChannelParserV2 expectedDailyForecastCount];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5_0(&dword_21C988000, v1, v2, "Actual number of parsed daily forecasts (%lu) doesn't match expected (%lu)", v3, v4, v5, v6, v7);
}

- (void)parseHourlyForecasts:.cold.1()
{
  v0 = +[WFForecastDataParserUtils stringFromKeyPath:&unk_26CD64B38];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3_0(&dword_21C988000, v1, v2, "Missing hourly forecasts at key path %@", v3, v4, v5, v6, v7);
}

- (void)parseHourlyForecasts:(void *)a1 .cold.2(void *a1)
{
  [a1 count];
  +[WFWeatherChannelParserV2 expectedHourlyForecastCount];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5_0(&dword_21C988000, v1, v2, "Actual number of parsed hourly forecasts (%lu) doesn't match expected (%lu)", v3, v4, v5, v6, v7);
}

- (void)parseCurrentCondition:.cold.1()
{
  v0 = +[WFForecastDataParserUtils stringFromKeyPath:&unk_26CD64BE0];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3_0(&dword_21C988000, v1, v2, "Missing current conditions at key path %@", v3, v4, v5, v6, v7);
}

- (void)parseCurrentCondition:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21C988000, v0, v1, "Parsed current conditions into %@", v2, v3, v4, v5, v6);
}

- (void)parseCurrentCondition:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21C988000, v0, v1, "Parsing current conditions from data: %@", v2, v3, v4, v5, v6);
}

- (void)parseAirQualityData:(uint64_t)a3 location:(uint64_t)a4 error:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)parseAirQualityData:location:error:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_21C988000, v0, v1, "Could not parse airquality data: %@", v2, v3, v4, v5, v6);
}

- (void)parseAirQualityData:location:error:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21C988000, v0, v1, "Parsing AirQuality conditions into %@", v2, v3, v4, v5, v6);
}

- (void)parseAirQualityData:(os_log_t)log location:error:.cold.5(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_21C988000, log, OS_LOG_TYPE_DEBUG, "Attempting to parse data...", v1, 2u);
}

@end