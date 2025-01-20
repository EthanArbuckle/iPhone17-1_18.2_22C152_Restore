@interface WFWeatherChannelParserV3
- (NSCalendar)calendar;
- (WFWeatherChannelParserV3)init;
- (id)_parseCurrentConditions:(id)a3;
- (id)_parseDailyForecastedConditions:(id)a3;
- (id)_parseDailyPollenForecastedConditions:(id)a3;
- (id)_parseForecastedConditions:(id)a3 individualForecastProcessingBlock:(id)a4 uniqueParsingBlock:(id)a5;
- (id)_parseHourlyForecastedConditions:(id)a3;
- (id)_parseLastTwentyFourHoursOfObservations:(id)a3;
- (id)_parsePollutants:(id)a3;
- (id)parseAirQualityData:(id)a3 location:(id)a4 locale:(id)a5 error:(id *)a6;
- (id)parseForecastData:(id)a3 types:(unint64_t)a4 location:(id)a5 locale:(id)a6 date:(id)a7 error:(id *)a8;
- (id)parseForecastData:(id)a3 types:(unint64_t)a4 location:(id)a5 locale:(id)a6 date:(id)a7 error:(id *)a8 rules:(id)a9;
- (void)_parseCommonComponents:(id)a3 intoConditions:(id)a4;
- (void)_parseWebLinks:(id)a3 intoWeatherConditions:(id)a4;
@end

@implementation WFWeatherChannelParserV3

- (WFWeatherChannelParserV3)init
{
  v8.receiver = self;
  v8.super_class = (Class)WFWeatherChannelParserV3;
  v2 = [(WFWeatherChannelParserV3 *)&v8 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x263EFF8F0]);
    v4 = (NSCalendar *)[v3 initWithCalendarIdentifier:*MEMORY[0x263EFF410]];
    v5 = [MEMORY[0x263EFFA18] timeZoneWithName:@"GMT"];
    [(NSCalendar *)v4 setTimeZone:v5];

    calendar = v2->_calendar;
    v2->_calendar = v4;
  }
  return v2;
}

- (void)_parseCommonComponents:(id)a3 intoConditions:(id)a4
{
  id v32 = a3;
  id v5 = a4;
  v6 = [v32 numberForKey:@"validTimeUtc"];
  v7 = v6;
  if (v6)
  {
    objc_super v8 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v6, "unsignedIntegerValue"));
    [v5 setObject:v8 forKeyedSubscript:@"WFWeatherForecastDateComponent"];
  }
  v9 = [v32 numberForKey:@"expirationTimeUtc"];

  if (v9)
  {
    v10 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v9, "unsignedIntegerValue"));
    [v5 setObject:v10 forKeyedSubscript:@"WFWeatherForecastExpirationDateComponent"];
  }
  v11 = [v32 numberForKey:@"iconCode"];
  if (v11)
  {
    [v5 setObject:v11 forKeyedSubscript:@"__THIS_WILL_BE_DEPRECATED__WFWeatherLegacyConditionComponent"];
    v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", WFConditionCodeFromLegacyWeatherConditionCode(objc_msgSend(v11, "unsignedIntegerValue")));
    [v5 setObject:v12 forKeyedSubscript:@"WFWeatherConditionComponent"];
  }
  v13 = [v32 numberForKey:@"relativeHumidity"];
  [v5 setObject:v13 forKeyedSubscript:@"WFWeatherHumidityComponent"];

  v14 = [v32 numberForKey:@"qpf"];
  if (v14
    || ([v32 numberForKey:@"precip24Hour"],
        (v14 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    [v5 setObject:v14 forKeyedSubscript:@"WFWeatherPrecipitationAmountComponent"];
  }
  v15 = [v32 numberForKey:@"precipChance"];
  [v5 setObject:v15 forKeyedSubscript:@"WFWeatherPrecipitationChanceComponent"];

  v16 = [v32 numberForKey:@"sunriseTimeUtc"];

  if (v16)
  {
    v17 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v16, "unsignedIntegerValue"));
    [v5 setObject:v17 forKeyedSubscript:@"WFWeatherSunriseDateComponent"];
  }
  v18 = [v32 numberForKey:@"sunsetTimeUtc"];

  if (v18)
  {
    v19 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v18, "unsignedIntegerValue"));
    [v5 setObject:v19 forKeyedSubscript:@"WFWeatherSunsetDateComponent"];
  }
  v20 = [v32 numberForKey:@"temperature"];
  if (v20)
  {
    v21 = [WFTemperature alloc];
    [v20 doubleValue];
    v22 = -[WFTemperature initWithTemperatureUnit:value:](v21, "initWithTemperatureUnit:value:", 2);
    [v5 setObject:v22 forKeyedSubscript:@"WFWeatherTemperatureComponent"];
  }
  v23 = [v32 numberForKey:@"temperatureFeelsLike"];

  if (v23)
  {
    v24 = [WFTemperature alloc];
    [v23 doubleValue];
    v25 = -[WFTemperature initWithTemperatureUnit:value:](v24, "initWithTemperatureUnit:value:", 2);
    [v5 setObject:v25 forKeyedSubscript:@"WFWeatherFeelsLikeTemperatureComponent"];
  }
  v26 = [v32 numberForKey:@"uvIndex"];
  [v5 setObject:v26 forKeyedSubscript:@"WFWeatherUVIndexComponent"];

  v27 = [v32 numberForKey:@"visibility"];
  if (v27) {
    [v5 setObject:v27 forKeyedSubscript:@"WFWeatherVisibilityComponent"];
  }
  v28 = [v32 numberForKey:@"windDirection"];
  [v5 setObject:v28 forKeyedSubscript:@"WFWeatherWindDirectionComponent"];

  v29 = [v32 numberForKey:@"windSpeed"];
  if (v29) {
    [v5 setObject:v29 forKeyedSubscript:@"WFWeatherWindSpeedComponent"];
  }
  v30 = [v32 numberForKey:@"pressureAltimeter"];
  if (v30) {
    [v5 setObject:v30 forKeyedSubscript:@"WFWeatherPressureComponent"];
  }
  v31 = [v32 numberForKey:@"pressureTendencyCode"];
  if (v31) {
    [v5 setObject:v31 forKeyedSubscript:@"WFWeatherPressureTrendComponent"];
  }
}

- (id)_parseCurrentConditions:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_opt_new();
    [(WFWeatherChannelParserV3 *)self _parseCommonComponents:v4 intoConditions:v5];
    v6 = [v4 numberForKey:@"temperatureDewPoint"];
    if (v6)
    {
      [v5 setObject:v6 forKeyedSubscript:@"WFWeatherDewpointComponent"];
      v7 = [WFTemperature alloc];
      [v6 doubleValue];
      objc_super v8 = -[WFTemperature initWithTemperatureUnit:value:](v7, "initWithTemperatureUnit:value:", 2);
      [v5 setObject:v8 forKeyedSubscript:@"WFWeatherDewpointTemperatureComponent"];
    }
    v9 = [v4 numberForKey:@"temperatureMaxSince7Am"];
    if (v9)
    {
      v10 = [WFTemperature alloc];
      [v9 doubleValue];
      v11 = -[WFTemperature initWithTemperatureUnit:value:](v10, "initWithTemperatureUnit:value:", 2);
      [v5 setObject:v11 forKeyedSubscript:@"WFWeatherHighTemperatureComponent"];
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_parseForecastedConditions:(id)a3 individualForecastProcessingBlock:(id)a4 uniqueParsingBlock:(id)a5
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v7 = a3;
  objc_super v8 = (char *)a4;
  v33 = (void (**)(id, void *, void *))a5;
  id v32 = [v7 allKeys];
  v9 = [v32 firstObject];
  v10 = [v7 objectForKeyedSubscript:v9];
  uint64_t v11 = [v10 count];

  v31 = [MEMORY[0x263EFF980] arrayWithCapacity:v11];
  uint64_t v29 = v11;
  if (v11)
  {
    uint64_t v12 = 0;
    v13 = v8 + 16;
    do
    {
      uint64_t v34 = v12;
      v14 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v32, "count"));
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id obj = v32;
      uint64_t v15 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v37;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v37 != v17) {
              objc_enumerationMutation(obj);
            }
            uint64_t v19 = *(void *)(*((void *)&v36 + 1) + 8 * i);
            if (((*((uint64_t (**)(char *, void *, id, uint64_t, uint64_t))v8 + 2))(v8, v14, v7, v19, v12) & 1) == 0)
            {
              [v7 objectForKeyedSubscript:v19];
              v21 = v20 = v13;
              v22 = [v21 objectAtIndexedSubscript:v12];
              [v14 setObject:v22 forKeyedSubscript:v19];

              uint64_t v12 = v34;
              v13 = v20;
            }
          }
          uint64_t v16 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
        }
        while (v16);
      }

      v23 = objc_opt_new();
      [(WFWeatherChannelParserV3 *)self _parseCommonComponents:v14 intoConditions:v23];
      uint64_t v24 = v12 + 1;
      [NSNumber numberWithUnsignedInteger:v24];
      v26 = uint64_t v25 = v24;
      [v23 setObject:v26 forKeyedSubscript:@"__THIS_WILL_BE_DEPRECATED__WFWeatherSeriesIndexComponent"];

      uint64_t v12 = v25;
      v33[2](v33, v23, v14);
      [v31 addObject:v23];
    }
    while (v25 != v29);
  }
  v27 = (void *)[v31 copy];

  return v27;
}

- (id)_parseDailyForecastedConditions:(id)a3
{
  if (a3)
  {
    id v4 = [(WFWeatherChannelParserV3 *)self _parseForecastedConditions:a3 individualForecastProcessingBlock:&__block_literal_global_22 uniqueParsingBlock:&__block_literal_global_12];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

uint64_t __60__WFWeatherChannelParserV3__parseDailyForecastedConditions___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = [@"daypart" isEqualToString:v10];
  if (v11)
  {
    id v30 = v9;
    uint64_t v12 = [v9 objectForKeyedSubscript:v10];
    v13 = [v12 firstObject];

    unsigned int v29 = v11;
    id v28 = v10;
    if (a5)
    {
      uint64_t v14 = 0;
    }
    else
    {
      uint64_t v15 = [v13 objectForKeyedSubscript:@"dayOrNight"];
      uint64_t v16 = [v15 firstObject];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      uint64_t v14 = isKindOfClass & 1;
    }
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v18 = [v13 allKeys];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v32;
      uint64_t v22 = v14 | (2 * a5);
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v32 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v24 = *(void *)(*((void *)&v31 + 1) + 8 * i);
          uint64_t v25 = [v13 objectForKeyedSubscript:v24];
          v26 = [v25 objectAtIndexedSubscript:v22];
          [v8 setObject:v26 forKeyedSubscript:v24];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v20);
    }

    id v9 = v30;
    uint64_t v11 = v29;
    id v10 = v28;
  }

  return v11;
}

void __60__WFWeatherChannelParserV3__parseDailyForecastedConditions___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v4 = a3;
  id v5 = [v4 stringForKey:@"dayOrNight"];
  if (v5) {
    [v12 setNightForecast:objc_msgSend(@"N", "isEqualToString:", v5)];
  }
  v6 = [v4 numberForKey:@"temperatureMax"];
  if (v6)
  {
    id v7 = [WFTemperature alloc];
    [v6 doubleValue];
    id v8 = -[WFTemperature initWithTemperatureUnit:value:](v7, "initWithTemperatureUnit:value:", 2);
    [v12 setObject:v8 forKeyedSubscript:@"WFWeatherHighTemperatureComponent"];
  }
  id v9 = [v4 numberForKey:@"temperatureMin"];
  if (v9)
  {
    id v10 = [WFTemperature alloc];
    [v9 doubleValue];
    uint64_t v11 = -[WFTemperature initWithTemperatureUnit:value:](v10, "initWithTemperatureUnit:value:", 2);
    [v12 setObject:v11 forKeyedSubscript:@"WFWeatherLowTemperatureComponent"];
  }
}

- (id)_parseDailyPollenForecastedConditions:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    uint64_t v36 = [v3 allKeys];
    id v5 = [v36 firstObject];
    v6 = [v4 objectForKeyedSubscript:v5];
    uint64_t v7 = [v6 count];

    [MEMORY[0x263EFF980] arrayWithCapacity:v7];
    v35 = uint64_t v34 = v7;
    if (v7)
    {
      uint64_t v8 = 0;
      long long v33 = @"treePollenIndex";
      do
      {
        id v9 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v36, "count", v33));
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        id v10 = v36;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v37 objects:v41 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v38;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v38 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void *)(*((void *)&v37 + 1) + 8 * i);
              uint64_t v16 = [v4 arrayForKey:v15];
              uint64_t v17 = [v16 objectAtIndexedSubscript:v8];
              [v9 setObject:v17 forKeyedSubscript:v15];
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v37 objects:v41 count:16];
          }
          while (v12);
        }

        v18 = objc_opt_new();
        uint64_t v19 = [v9 numberForKey:@"fcstValid"];
        uint64_t v20 = v19;
        if (v19)
        {
          uint64_t v21 = (void *)MEMORY[0x263EFF910];
          [v19 doubleValue];
          uint64_t v22 = objc_msgSend(v21, "dateWithTimeIntervalSince1970:");
          [v18 setDate:v22];
        }
        uint64_t v23 = [v9 stringForKey:@"dayInd"];
        uint64_t v24 = (void *)v23;
        if (v23) {
          [v18 setTimeOfDay:WFTimeOfDayForString(v23)];
        }
        uint64_t v25 = [v9 numberForKey:@"grassPollenIndex"];
        v26 = v25;
        if (v25) {
          objc_msgSend(v18, "setGrassIndex:", objc_msgSend(v25, "unsignedIntegerValue"));
        }
        v27 = [v9 numberForKey:@"ragweedPollenIndex"];
        id v28 = v27;
        if (v27) {
          objc_msgSend(v18, "setRagweedIndex:", objc_msgSend(v27, "unsignedIntegerValue"));
        }
        unsigned int v29 = [v9 numberForKey:v33];
        id v30 = v29;
        if (v29) {
          objc_msgSend(v18, "setTreeIndex:", objc_msgSend(v29, "unsignedIntegerValue"));
        }
        [v35 addObject:v18];

        ++v8;
      }
      while (v8 != v34);
    }
    long long v31 = (void *)[v35 copy];
  }
  else
  {
    long long v31 = 0;
  }

  return v31;
}

- (id)_parseHourlyForecastedConditions:(id)a3
{
  if (a3)
  {
    id v4 = [(WFWeatherChannelParserV3 *)self _parseForecastedConditions:a3 individualForecastProcessingBlock:&__block_literal_global_18 uniqueParsingBlock:&__block_literal_global_20];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

uint64_t __61__WFWeatherChannelParserV3__parseHourlyForecastedConditions___block_invoke()
{
  return 0;
}

void __61__WFWeatherChannelParserV3__parseHourlyForecastedConditions___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v4 = a3;
  id v5 = [v4 numberForKey:@"temperatureDewPoint"];
  if (v5)
  {
    [v9 setObject:v5 forKeyedSubscript:@"WFWeatherDewpointComponent"];
    v6 = [WFTemperature alloc];
    [v5 doubleValue];
    uint64_t v7 = -[WFTemperature initWithTemperatureUnit:value:](v6, "initWithTemperatureUnit:value:", 2);
    [v9 setObject:v7 forKeyedSubscript:@"WFWeatherDewpointTemperatureComponent"];
  }
  uint64_t v8 = [v4 numberForKey:@"wxSeverity"];
  [v9 setObject:v8 forKeyedSubscript:@"WFWeatherSeverityComponent"];
}

- (id)_parseLastTwentyFourHoursOfObservations:(id)a3
{
  if (a3)
  {
    id v4 = [(WFWeatherChannelParserV3 *)self _parseForecastedConditions:a3 individualForecastProcessingBlock:&__block_literal_global_22_0 uniqueParsingBlock:&__block_literal_global_24];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

uint64_t __68__WFWeatherChannelParserV3__parseLastTwentyFourHoursOfObservations___block_invoke()
{
  return 0;
}

void __68__WFWeatherChannelParserV3__parseLastTwentyFourHoursOfObservations___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v4 = [a3 numberForKey:@"temperatureDewPoint"];
  if (v4)
  {
    [v7 setObject:v4 forKeyedSubscript:@"WFWeatherDewpointComponent"];
    id v5 = [WFTemperature alloc];
    [v4 doubleValue];
    v6 = -[WFTemperature initWithTemperatureUnit:value:](v5, "initWithTemperatureUnit:value:", 2);
    [v7 setObject:v6 forKeyedSubscript:@"WFWeatherDewpointTemperatureComponent"];
  }
}

- (id)_parsePollutants:(id)a3
{
  if (a3)
  {
    uint64_t v3 = (void *)MEMORY[0x263EFF9A0];
    id v4 = a3;
    id v5 = objc_msgSend(v3, "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __45__WFWeatherChannelParserV3__parsePollutants___block_invoke;
    v9[3] = &unk_264432208;
    id v10 = v5;
    id v6 = v5;
    [v4 enumerateKeysAndObjectsUsingBlock:v9];

    id v7 = (void *)[v6 copy];
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

void __45__WFWeatherChannelParserV3__parsePollutants___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v14 = (id)objc_opt_new();
  id v7 = [v5 stringForKey:@"name"];
  [v14 setLocalizedName:v7];

  uint64_t v8 = [v5 stringForKey:@"phrase"];
  [v14 setLocalizedDescription:v8];

  id v9 = [v5 numberForKey:@"amount"];
  [v9 doubleValue];
  objc_msgSend(v14, "setAmount:");

  id v10 = [v5 stringForKey:@"unit"];
  [v14 setUnit:v10];

  uint64_t v11 = [v5 stringForKey:@"category"];
  [v14 setLocalizedCategoryDescription:v11];

  uint64_t v12 = [v5 numberForKey:@"categoryIndex"];
  objc_msgSend(v14, "setCategoryIndex:", objc_msgSend(v12, "unsignedIntegerValue"));

  uint64_t v13 = [v5 numberForKey:@"index"];

  objc_msgSend(v14, "setIndex:", objc_msgSend(v13, "unsignedIntegerValue"));
  [*(id *)(a1 + 32) setObject:v14 forKeyedSubscript:v6];
}

- (void)_parseWebLinks:(id)a3 intoWeatherConditions:(id)a4
{
  if (a3)
  {
    id v5 = NSURL;
    id v6 = a4;
    id v7 = a3;
    uint64_t v8 = [v7 stringForKey:@"web"];
    id v9 = [v5 URLWithString:v8];
    [v6 setObject:v9 forKeyedSubscript:@"WFWeatherWebLinkComponent"];

    id v10 = NSURL;
    id v12 = [v7 stringForKey:@"web"];

    uint64_t v11 = [v10 URLWithString:v12];
    [v6 setObject:v11 forKeyedSubscript:@"WFWeatherMobileLinkComponent"];
  }
}

- (id)parseForecastData:(id)a3 types:(unint64_t)a4 location:(id)a5 locale:(id)a6 date:(id)a7 error:(id *)a8
{
  return [(WFWeatherChannelParserV3 *)self parseForecastData:a3 types:a4 location:a5 locale:a6 date:a7 error:a8 rules:0];
}

- (id)parseForecastData:(id)a3 types:(unint64_t)a4 location:(id)a5 locale:(id)a6 date:(id)a7 error:(id *)a8 rules:(id)a9
{
  v154[1] = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a9;
  if (v14)
  {
    id v139 = 0;
    uint64_t v19 = [MEMORY[0x263F08900] JSONObjectWithData:v14 options:0 error:&v139];
    id v20 = v139;
  }
  else
  {
    uint64_t v19 = 0;
    id v20 = 0;
  }
  uint64_t v21 = [v19 arrayForKey:@"errors"];
  v133 = (void *)v21;
  if (v20 || (v26 = (void *)v21, ![v19 count]))
  {
    uint64_t v22 = (void *)MEMORY[0x263F087E8];
    uint64_t v153 = *MEMORY[0x263F08320];
    v154[0] = @"Failed to parse JSON forecast data";
    uint64_t v23 = [NSDictionary dictionaryWithObjects:v154 forKeys:&v153 count:1];
    objc_msgSend(v22, "wf_errorWithCode:encapsulatedError:userInfo:", 1, v20, v23);
    uint64_t v24 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v130 = v19;
  if ([v26 count])
  {
    uint64_t v23 = [NSString stringWithFormat:@"Server error %@", v26];
    v27 = (void *)MEMORY[0x263F087E8];
    uint64_t v151 = *MEMORY[0x263F07F80];
    v152 = v23;
    id v28 = [NSDictionary dictionaryWithObjects:&v152 forKeys:&v151 count:1];
    objc_msgSend(v27, "wf_errorWithCode:userInfo:", 17, v28);
    *a8 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v19 = v130;
    uint64_t v24 = 0;
    goto LABEL_6;
  }
  v129 = objc_opt_new();
  BOOL IsRequestedInTypes = WFForecastTypeIsRequestedInTypes(2, a4);
  id v128 = v17;
  if (a4 == 2)
  {
    id v30 = v19;
  }
  else
  {
    if (!IsRequestedInTypes)
    {
      long long v31 = 0;
      goto LABEL_23;
    }
    id v30 = [v19 dictionaryForKey:@"v3-wx-observations-current"];
  }
  long long v31 = v30;
  if (!v30)
  {
LABEL_23:
    long long v33 = 0;
    goto LABEL_24;
  }
  uint64_t v32 = [(WFWeatherChannelParserV3 *)self _parseCurrentConditions:v30];
  if (!v32)
  {
    uint64_t v34 = WFLogForCategory(7uLL);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      -[WFWeatherChannelParserV3 parseForecastData:types:location:locale:date:error:rules:].cold.5(v34, v35, v36, v37, v38, v39, v40, v41);
    }

    uint64_t v42 = (void *)MEMORY[0x263F087E8];
    uint64_t v149 = *MEMORY[0x263F07F80];
    v150 = @"Failed to parse current observations from response.";
    v43 = [NSDictionary dictionaryWithObjects:&v150 forKeys:&v149 count:1];
    objc_msgSend(v42, "wf_errorWithCode:userInfo:", 1, v43);
    *a8 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_23;
  }
  long long v33 = (void *)v32;
LABEL_24:
  if (WFForecastTypeIsRequestedInTypes(256, a4))
  {
    uint64_t v44 = [v130 dictionaryForKey:@"v3-links"];
    if (v44)
    {
      v45 = (void *)v44;
      [(WFWeatherChannelParserV3 *)self _parseWebLinks:v44 intoWeatherConditions:v33];
    }
  }

  [v129 setCurrentConditions:v33];
  BOOL v46 = WFForecastTypeIsRequestedInTypes(32, a4);
  id v127 = v18;
  if (a4 == 32)
  {
    id v47 = v130;
  }
  else
  {
    if (!v46)
    {
      v48 = 0;
      v49 = 0;
      id v17 = v128;
      goto LABEL_38;
    }
    id v47 = [v130 dictionaryForKey:@"v3-wx-conditions-historical-hourly-1day"];
  }
  v48 = v47;
  id v17 = v128;
  if (v47)
  {
    v49 = [(WFWeatherChannelParserV3 *)self _parseLastTwentyFourHoursOfObservations:v47];
    if (![v49 count])
    {
      id v50 = v16;
      v51 = WFLogForCategory(7uLL);
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
        -[WFWeatherChannelParserV3 parseForecastData:types:location:locale:date:error:rules:].cold.4(v51, v52, v53, v54, v55, v56, v57, v58);
      }

      v59 = (void *)MEMORY[0x263F087E8];
      uint64_t v147 = *MEMORY[0x263F07F80];
      v148 = @"Failed to parse last twenty-four hours of observations from response.";
      v60 = [NSDictionary dictionaryWithObjects:&v148 forKeys:&v147 count:1];
      objc_msgSend(v59, "wf_errorWithCode:userInfo:", 1, v60);
      *a8 = (id)objc_claimAutoreleasedReturnValue();

      id v16 = v50;
      id v18 = v127;
      id v17 = v128;
    }
  }
  else
  {
    v49 = 0;
  }
LABEL_38:

  [v129 setLastTwentyFourHoursOfObservations:v49];
  BOOL v61 = WFForecastTypeIsRequestedInTypes(4, a4);
  if (a4 == 4)
  {
    id v62 = v130;
  }
  else
  {
    if (!v61)
    {
      v63 = 0;
      goto LABEL_48;
    }
    id v62 = [v130 dictionaryForKey:@"v3-wx-forecast-hourly-1day"];
  }
  v63 = v62;
  if (!v62)
  {
LABEL_48:
    v64 = 0;
    goto LABEL_49;
  }
  v64 = [(WFWeatherChannelParserV3 *)self _parseHourlyForecastedConditions:v62];
  if (![v64 count])
  {
    id v65 = v16;
    v66 = WFLogForCategory(7uLL);
    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
      -[WFWeatherChannelParserV3 parseForecastData:types:location:locale:date:error:rules:](v66, v67, v68, v69, v70, v71, v72, v73);
    }

    v74 = (void *)MEMORY[0x263F087E8];
    uint64_t v145 = *MEMORY[0x263F07F80];
    v146 = @"Failed to parse daily forecasted conditions from response.";
    v75 = [NSDictionary dictionaryWithObjects:&v146 forKeys:&v145 count:1];
    objc_msgSend(v74, "wf_errorWithCode:userInfo:", 1, v75);
    *a8 = (id)objc_claimAutoreleasedReturnValue();

    id v16 = v65;
    id v18 = v127;
    id v17 = v128;
  }
LABEL_49:

  [v129 setHourlyForecasts:v64];
  BOOL v76 = WFForecastTypeIsRequestedInTypes(8, a4);
  if (a4 == 8)
  {
    id v77 = v130;
  }
  else
  {
    if (!v76)
    {
      v78 = 0;
      goto LABEL_59;
    }
    id v77 = [v130 dictionaryForKey:@"v3-wx-forecast-daily-10day"];
  }
  v78 = v77;
  if (!v77)
  {
LABEL_59:
    v79 = 0;
    goto LABEL_60;
  }
  v79 = [(WFWeatherChannelParserV3 *)self _parseDailyForecastedConditions:v77];
  if (![v79 count])
  {
    id v80 = v16;
    v81 = WFLogForCategory(7uLL);
    if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR)) {
      -[WFWeatherChannelParserV3 parseForecastData:types:location:locale:date:error:rules:](v81, v82, v83, v84, v85, v86, v87, v88);
    }

    v89 = (void *)MEMORY[0x263F087E8];
    uint64_t v143 = *MEMORY[0x263F07F80];
    v144 = @"Failed to parse daily forecasted conditions from response.";
    v90 = [NSDictionary dictionaryWithObjects:&v144 forKeys:&v143 count:1];
    objc_msgSend(v89, "wf_errorWithCode:userInfo:", 1, v90);
    *a8 = (id)objc_claimAutoreleasedReturnValue();

    id v16 = v80;
    id v18 = v127;
    id v17 = v128;
  }
LABEL_60:

  [v129 setDailyForecasts:v79];
  if (WFForecastTypeIsRequestedInTypes(1, a4))
  {
    v91 = v130;
    if (+[WFResponseParsingRules aqiEnabledByRules:v18 forLocation:v15])
    {
      v92 = [(WFWeatherChannelParserV3 *)self parseAirQualityData:v130 location:v15 locale:v16 error:a8];
    }
    else
    {
      v92 = 0;
    }
  }
  else
  {
    v92 = 0;
    v91 = v130;
  }
  [v129 setAirQualityObservations:v92];

  BOOL v93 = WFForecastTypeIsRequestedInTypes(16, a4);
  if (a4 == 16)
  {
    id v94 = v91;
LABEL_69:
    v95 = v94;
    goto LABEL_71;
  }
  if (v93)
  {
    id v94 = [v91 dictionaryForKey:@"v2idxPollenDaypart10"];
    goto LABEL_69;
  }
  v95 = 0;
LABEL_71:
  v96 = [v95 dictionaryForKey:@"pollenForecast12hour"];

  if (v96)
  {
    v97 = [(WFWeatherChannelParserV3 *)self _parseDailyPollenForecastedConditions:v96];
    if (![v97 count])
    {
      v98 = WFLogForCategory(7uLL);
      if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR)) {
        -[WFWeatherChannelParserV3 parseForecastData:types:location:locale:date:error:rules:](v98, v99, v100, v101, v102, v103, v104, v105);
      }

      v106 = (void *)MEMORY[0x263F087E8];
      uint64_t v141 = *MEMORY[0x263F07F80];
      v142 = @"Failed to parse daily pollen forecasted conditions from response.";
      v107 = [NSDictionary dictionaryWithObjects:&v142 forKeys:&v141 count:1];
      objc_msgSend(v106, "wf_errorWithCode:userInfo:", 1, v107);
      *a8 = (id)objc_claimAutoreleasedReturnValue();

      id v17 = v128;
    }
  }
  else
  {
    v97 = 0;
  }

  uint64_t v24 = v129;
  [v129 setPollenForecasts:v97];

  uint64_t v23 = [v129 currentConditions];
  if (v23)
  {
    v108 = [v129 dailyForecasts];
    uint64_t v109 = [v108 count];

    if (v109)
    {
      id v124 = v16;
      id v126 = v14;
      v110 = WFLogForCategory(7uLL);
      if (os_log_type_enabled(v110, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21C988000, v110, OS_LOG_TYPE_INFO, "Found current conditions in response; let's try to update the high/low for our current conditions with the mat"
          "ching daily forecasted conditions.",
          buf,
          2u);
      }

      v111 = [MEMORY[0x263EFF8F0] currentCalendar];
      id v125 = v15;
      v112 = [v15 timeZone];
      [v111 setTimeZone:v112];

      v113 = [v23 objectForKeyedSubscript:@"WFWeatherForecastDateComponent"];
      long long v134 = 0u;
      long long v135 = 0u;
      long long v136 = 0u;
      long long v137 = 0u;
      id obja = [v129 dailyForecasts];
      uint64_t v114 = [obja countByEnumeratingWithState:&v134 objects:v140 count:16];
      if (v114)
      {
        uint64_t v115 = v114;
        uint64_t v116 = *(void *)v135;
        while (2)
        {
          for (uint64_t i = 0; i != v115; ++i)
          {
            if (*(void *)v135 != v116) {
              objc_enumerationMutation(obja);
            }
            v118 = *(void **)(*((void *)&v134 + 1) + 8 * i);
            v119 = [v118 objectForKeyedSubscript:@"WFWeatherForecastDateComponent"];
            if ([v111 isDate:v119 inSameDayAsDate:v113])
            {
              v120 = [v118 objectForKeyedSubscript:@"WFWeatherHighTemperatureComponent"];
              if (v120)
              {
                v121 = [v118 objectForKeyedSubscript:@"WFWeatherHighTemperatureComponent"];
                v122 = v23;
              }
              else
              {
                v121 = [v23 objectForKeyedSubscript:@"WFWeatherHighTemperatureComponent"];
                v122 = v118;
              }
              [v122 setObject:v121 forKeyedSubscript:@"WFWeatherHighTemperatureComponent"];

              v123 = [v118 objectForKeyedSubscript:@"WFWeatherLowTemperatureComponent"];
              [v23 setObject:v123 forKeyedSubscript:@"WFWeatherLowTemperatureComponent"];

              goto LABEL_95;
            }
          }
          uint64_t v115 = [obja countByEnumeratingWithState:&v134 objects:v140 count:16];
          if (v115) {
            continue;
          }
          break;
        }
      }
LABEL_95:

      id v15 = v125;
      id v14 = v126;
      id v16 = v124;
      id v18 = v127;
      id v17 = v128;
    }
    uint64_t v24 = v129;
    uint64_t v19 = v130;
  }
  else
  {
    uint64_t v19 = v130;
  }
LABEL_6:

  return v24;
}

- (id)parseAirQualityData:(id)a3 location:(id)a4 locale:(id)a5 error:(id *)a6
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v9;
    id v12 = [v11 objectForKeyedSubscript:@"v3-wx-globalAirQuality"];

    if (v12)
    {
      uint64_t v13 = [v11 objectForKeyedSubscript:@"v3-wx-globalAirQuality"];

      id v11 = (id)v13;
    }
    id v14 = [v11 objectForKeyedSubscript:@"globalairquality"];
  }
  else
  {
    id v14 = 0;
  }
  if ([v14 count])
  {
    id v15 = objc_opt_new();
    [v15 setLocale:v10];
    id v16 = objc_opt_new();
    [v15 setDate:v16];

    id v17 = [v14 numberForKey:@"expireTimeGmt"];
    id v18 = v17;
    if (v17)
    {
      uint64_t v19 = (void *)MEMORY[0x263EFF910];
      [v17 doubleValue];
      id v20 = objc_msgSend(v19, "dateWithTimeIntervalSince1970:");
      [v15 setExpirationDate:v20];
    }
    uint64_t v21 = [v14 stringForKey:@"source"];
    [v15 setProvider:v21];

    uint64_t v22 = [v14 stringForKey:@"disclaimer"];
    [v15 setLocalizedDisclaimer:v22];

    id v42 = v10;
    uint64_t v23 = [v10 countryCode];
    uint64_t v24 = AqiScaleForCountryCode(v23);

    uint64_t v25 = [v14 numberForKey:@"airQualityIndex"];
    uint64_t v41 = v24;
    if (v25)
    {
      v26 = [v14 stringForKey:@"airQualityCategory"];
      if (v26)
      {
        v27 = [v14 numberForKey:@"airQualityCategoryIndex"];
        if (v27)
        {
          objc_msgSend(v15, "setLocalizedAirQualityIndex:", objc_msgSend(v25, "unsignedIntegerValue"));
          id v28 = objc_msgSend(v24, "scaleCategoryForCategoryIndex:localizedCategoryDescription:", objc_msgSend(v27, "unsignedIntegerValue"), v26);
          [v15 setLocalizedAirQualityScaleCategory:v28];

          objc_msgSend(v15, "setCategory:", objc_msgSend(v27, "integerValue"));
        }
      }
      else
      {
        v27 = 0;
      }
    }
    else
    {
      v27 = 0;
      v26 = 0;
    }
    id v30 = [v14 dictionaryForKey:@"pollutants"];
    long long v31 = [(WFWeatherChannelParserV3 *)self _parsePollutants:v30];

    uint64_t v32 = [v31 allValues];
    [v15 setPollutants:v32];

    long long v33 = [v14 stringForKey:@"primaryPollutant"];
    if (v33)
    {
      uint64_t v34 = [v31 objectForKeyedSubscript:v33];
      if (v34)
      {
        [v15 setPrimaryPollutant:v34];
      }
      else
      {
        log = WFLogForCategory(7uLL);
        if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v39 = [v15 pollutants];
          uint64_t v38 = NSStringFromSelector(sel_localizedName);
          uint64_t v37 = [v39 valueForKeyPath:v38];
          uint64_t v36 = [v37 componentsJoinedByString:@", "];
          *(_DWORD *)buf = 138543618;
          BOOL v46 = v33;
          __int16 v47 = 2114;
          v48 = v36;
          _os_log_impl(&dword_21C988000, log, OS_LOG_TYPE_DEFAULT, "Did not find primary pollutant %{public}@ in list of pollutants: %{public}@", buf, 0x16u);
        }
      }
    }
    id v10 = v42;
  }
  else
  {
    unsigned int v29 = (void *)MEMORY[0x263F087E8];
    uint64_t v43 = *MEMORY[0x263F08320];
    uint64_t v44 = @"Failed to parse JSON air quality data";
    id v18 = [NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
    objc_msgSend(v29, "wf_errorWithCode:userInfo:", 1, v18);
    id v15 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (void).cxx_destruct
{
}

- (void)parseForecastData:(uint64_t)a3 types:(uint64_t)a4 location:(uint64_t)a5 locale:(uint64_t)a6 date:(uint64_t)a7 error:(uint64_t)a8 rules:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)parseForecastData:(uint64_t)a3 types:(uint64_t)a4 location:(uint64_t)a5 locale:(uint64_t)a6 date:(uint64_t)a7 error:(uint64_t)a8 rules:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)parseForecastData:(uint64_t)a3 types:(uint64_t)a4 location:(uint64_t)a5 locale:(uint64_t)a6 date:(uint64_t)a7 error:(uint64_t)a8 rules:.cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)parseForecastData:(uint64_t)a3 types:(uint64_t)a4 location:(uint64_t)a5 locale:(uint64_t)a6 date:(uint64_t)a7 error:(uint64_t)a8 rules:.cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end