@interface WFWeatherDataServiceParserV1
+ (id)dateFormatter;
- (BOOL)isProviderAttribution:(id)a3 stillValidWithMetadata:(id)a4;
- (id)airQualityDictFromData:(id)a3 types:(unint64_t)a4;
- (id)changeForecastDictFromData:(id)a3 types:(unint64_t)a4;
- (id)currentObservationsDictFromData:(id)a3 types:(unint64_t)a4;
- (id)dailyAlmanacDictFromData:(id)a3 types:(unint64_t)a4;
- (id)dailyForecastDictFromData:(id)a3 types:(unint64_t)a4;
- (id)dailyHistoryDictFromData:(id)a3 types:(unint64_t)a4;
- (id)hourlyForecastDictFromData:(id)a3 types:(unint64_t)a4;
- (id)hourlyHistoryDictFromData:(id)a3 types:(unint64_t)a4;
- (id)nextHourPrecipitationEventDictFromData:(id)a3 types:(unint64_t)a4;
- (id)nowLinksDictFromData:(id)a3 types:(unint64_t)a4;
- (id)parseAQIScaleNamed:(id)a3 data:(id)a4 error:(id *)a5;
- (id)parseAirQualityFromData:(id)a3 locale:(id)a4;
- (id)parseAlmanacFromData:(id)a3 withUnit:(int)a4;
- (id)parseChangeForecastFromData:(id)a3 withUnit:(int)a4;
- (id)parseDailyForecastFromData:(id)a3 withUnit:(int)a4;
- (id)parseDailyHistoryFromData:(id)a3 withUnit:(int)a4;
- (id)parseForecastData:(id)a3 types:(unint64_t)a4 location:(id)a5 locale:(id)a6 date:(id)a7 error:(id *)a8;
- (id)parseForecastData:(id)a3 types:(unint64_t)a4 location:(id)a5 locale:(id)a6 date:(id)a7 error:(id *)a8 rules:(id)a9;
- (id)parseForecastData:(id)a3 types:(unint64_t)a4 location:(id)a5 units:(int)a6 locale:(id)a7 date:(id)a8 error:(id *)a9 rules:(id)a10;
- (id)parseForecastDataFromDict:(id)a3 types:(unint64_t)a4 location:(id)a5 units:(int)a6 locale:(id)a7 date:(id)a8 error:(id *)a9 rules:(id)a10;
- (id)parseHourlyForecastFromData:(id)a3 withUnit:(int)a4;
- (id)parseHourlyHistoryFromData:(id)a3 withUnit:(int)a4;
- (id)parseMetaDataFromData:(id)a3;
- (id)parseNextHourPrecipitationFromData:(id)a3 withUnit:(int)a4;
- (id)parsePollenFromData:(id)a3;
- (id)parsePollutants:(id)a3;
- (id)parseSevereWeatherEventsFromData:(id)a3 withUnit:(int)a4;
- (id)parseWeatherComponentsFromData:(id)a3 withUnit:(int)a4;
- (id)parsedCategoryFromDictionary:(id)a3;
- (id)parsedGradientStopFromDictionary:(id)a3;
- (id)pollenDictFromData:(id)a3 types:(unint64_t)a4;
- (id)severeWeatherEventDictFromData:(id)a3 types:(unint64_t)a4;
- (void)parseNowLinksFromData:(id)a3 intoConditions:(id)a4;
- (void)parseWeatherComponentsFromData:(id)a3 intoConditions:(id)a4 withUnit:(int)a5;
@end

@implementation WFWeatherDataServiceParserV1

uint64_t __60__WFWeatherDataServiceParserV1_ParseNextHour__dateFormatter__block_invoke()
{
  dateFormatter_dateFormatter = (uint64_t)objc_alloc_init(MEMORY[0x263F088C0]);
  return MEMORY[0x270F9A758]();
}

- (id)parseNextHourPrecipitationFromData:(id)a3 withUnit:(int)a4
{
  uint64_t v113 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v81 = objc_alloc_init(MEMORY[0x263EFF980]);
  v76 = v4;
  [v4 objectForKey:@"minutes"];
  long long v105 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [obj countByEnumeratingWithState:&v105 objects:v112 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v90 = *(void *)v106;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v106 != v90) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v105 + 1) + 8 * i);
        v9 = [v8 objectForKey:@"precipChance"];
        v10 = [v8 objectForKey:@"precipIntensity"];
        v11 = [v8 objectForKey:@"perceivedIntensity"];
        v12 = [v8 objectForKey:@"startAt"];
        v13 = v12;
        if (v12)
        {
          v14 = (void *)MEMORY[0x263EFF910];
          [v12 doubleValue];
          v15 = objc_msgSend(v14, "dateWithTimeIntervalSince1970:");
        }
        else
        {
          v15 = 0;
        }
        v16 = [WFNextHourPrecipitationMinute alloc];
        [v10 doubleValue];
        double v18 = v17;
        [v9 doubleValue];
        double v20 = v19;
        [v11 doubleValue];
        v22 = [(WFNextHourPrecipitationMinute *)v16 initWithIntensity:v15 chance:v18 perceivedIntensity:v20 date:v21];
        [v81 addObject:v22];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v105 objects:v112 count:16];
    }
    while (v6);
  }
  v23 = [v76 objectForKey:@"metadata"];
  v24 = [v23 objectForKey:@"expire_time"];
  v74 = v24;
  if (v24)
  {
    v25 = (void *)MEMORY[0x263EFF910];
    [v24 doubleValue];
    v73 = objc_msgSend(v25, "dateWithTimeIntervalSince1970:");
  }
  else
  {
    v73 = 0;
  }
  v26 = [v76 objectForKey:@"startTime"];
  v72 = v26;
  if (v26)
  {
    v27 = (void *)MEMORY[0x263EFF910];
    [v26 doubleValue];
    v71 = objc_msgSend(v27, "dateWithTimeIntervalSince1970:");
  }
  else
  {
    v71 = 0;
  }
  v28 = [v23 objectForKey:@"read_time"];
  v70 = v28;
  if (v28)
  {
    v29 = (void *)MEMORY[0x263EFF910];
    [v28 doubleValue];
    v69 = objc_msgSend(v29, "dateWithTimeIntervalSince1970:");
  }
  else
  {
    v69 = 0;
  }
  v75 = v23;
  v80 = [MEMORY[0x263EFF980] array];
  [v76 objectForKey:@"condition"];
  long long v101 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  id v77 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v82 = [v77 countByEnumeratingWithState:&v101 objects:v111 count:16];
  if (v82)
  {
    uint64_t v79 = *(void *)v102;
    do
    {
      for (uint64_t j = 0; j != v82; ++j)
      {
        if (*(void *)v102 != v79) {
          objc_enumerationMutation(v77);
        }
        v31 = *(void **)(*((void *)&v101 + 1) + 8 * j);
        v32 = [v31 objectForKey:@"token"];
        v33 = [v31 objectForKey:@"shortTemplate"];
        v34 = [v31 objectForKey:@"longTemplate"];
        v35 = [v31 objectForKey:@"validUntil"];
        v36 = v35;
        if (v35)
        {
          v37 = (void *)MEMORY[0x263EFF910];
          [v35 doubleValue];
          v38 = objc_msgSend(v37, "dateWithTimeIntervalSince1970:");
        }
        else
        {
          v38 = 0;
        }
        v39 = [v31 objectForKey:@"parameters"];
        if ([v39 count])
        {
          v85 = v38;
          v86 = v36;
          v87 = v34;
          v88 = v33;
          v91 = v32;
          v40 = [MEMORY[0x263EFF9A0] dictionary];
          long long v97 = 0u;
          long long v98 = 0u;
          long long v99 = 0u;
          long long v100 = 0u;
          id v83 = v39;
          id v41 = v39;
          uint64_t v42 = [v41 countByEnumeratingWithState:&v97 objects:v110 count:16];
          if (v42)
          {
            uint64_t v43 = v42;
            uint64_t v44 = *(void *)v98;
            do
            {
              for (uint64_t k = 0; k != v43; ++k)
              {
                if (*(void *)v98 != v44) {
                  objc_enumerationMutation(v41);
                }
                uint64_t v46 = *(void *)(*((void *)&v97 + 1) + 8 * k);
                v47 = [v41 objectForKey:v46];
                v48 = (void *)MEMORY[0x263EFF910];
                [v47 doubleValue];
                v49 = objc_msgSend(v48, "dateWithTimeIntervalSince1970:");
                [v40 setValue:v49 forKey:v46];
              }
              uint64_t v43 = [v41 countByEnumeratingWithState:&v97 objects:v110 count:16];
            }
            while (v43);
          }

          v33 = v88;
          v32 = v91;
          v36 = v86;
          v34 = v87;
          v39 = v83;
          v38 = v85;
        }
        else
        {
          v40 = 0;
        }
        v50 = [[WFNextHourPrecipitationDescription alloc] initWithToken:v32 shortTemplate:v33 longTemplate:v34 parameters:v40 validUntil:v38];
        [v80 addObject:v50];
      }
      uint64_t v82 = [v77 countByEnumeratingWithState:&v101 objects:v111 count:16];
    }
    while (v82);
  }
  v92 = [MEMORY[0x263EFF980] array];
  [v76 objectForKey:@"summary"];
  long long v93 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  id v84 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v51 = [v84 countByEnumeratingWithState:&v93 objects:v109 count:16];
  if (v51)
  {
    uint64_t v52 = v51;
    uint64_t v89 = *(void *)v94;
    do
    {
      for (uint64_t m = 0; m != v52; ++m)
      {
        if (*(void *)v94 != v89) {
          objc_enumerationMutation(v84);
        }
        v54 = *(void **)(*((void *)&v93 + 1) + 8 * m);
        v55 = [v54 objectForKey:@"condition"];
        v56 = [v54 objectForKey:@"probability"];
        v57 = [v54 objectForKey:@"intensity"];
        v58 = [v54 objectForKey:@"validUntil"];
        v59 = v58;
        if (v58)
        {
          v60 = (void *)MEMORY[0x263EFF910];
          [v58 doubleValue];
          v61 = objc_msgSend(v60, "dateWithTimeIntervalSince1970:");
        }
        else
        {
          v61 = 0;
        }
        v62 = [WFNextHourPrecipitationCondition alloc];
        [v57 doubleValue];
        double v64 = v63;
        [v56 doubleValue];
        v66 = [(WFNextHourPrecipitationCondition *)v62 initWithType:v55 intensity:v61 probability:v64 validUntil:v65];
        [v92 addObject:v66];
      }
      uint64_t v52 = [v84 countByEnumeratingWithState:&v93 objects:v109 count:16];
    }
    while (v52);
  }
  v67 = [[WFNextHourPrecipitation alloc] initWithReadDate:v69 startDate:v71 expirationDate:v73 minutes:v81 conditions:v92 descriptions:v80];

  return v67;
}

- (id)nextHourPrecipitationEventDictFromData:(id)a3 types:(unint64_t)a4
{
  id v5 = a3;
  if (WFForecastTypeIsRequestedInTypes(2048, a4))
  {
    uint64_t v6 = [v5 objectForKey:@"next_hour"];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)parseAlmanacFromData:(id)a3 withUnit:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = a3;
  uint64_t v6 = objc_opt_new();
  v7 = [v5 numberForKey:@"precipitationAverage"];
  if (v7) {
    [v6 setObject:v7 forKeyedSubscript:@"WFWeatherPrecipitationAmountComponent"];
  }
  v8 = [v5 numberForKey:@"temperatureAverageMax"];
  if (v8)
  {
    v9 = [WFTemperature alloc];
    [v8 doubleValue];
    v10 = -[WFTemperature initWithTemperatureUnit:value:](v9, "initWithTemperatureUnit:value:", v4);
    [v6 setObject:v10 forKeyedSubscript:@"WFWeatherHighTemperatureComponent"];
  }
  v11 = [v5 numberForKey:@"temperatureAverageMin"];
  if (v11)
  {
    v12 = [WFTemperature alloc];
    [v11 doubleValue];
    v13 = -[WFTemperature initWithTemperatureUnit:value:](v12, "initWithTemperatureUnit:value:", v4);
    [v6 setObject:v13 forKeyedSubscript:@"WFWeatherLowTemperatureComponent"];
  }
  return v6;
}

- (id)dailyAlmanacDictFromData:(id)a3 types:(unint64_t)a4
{
  id v5 = a3;
  if (WFForecastTypeIsRequestedInTypes(128, a4))
  {
    uint64_t v6 = [v5 dictionaryForKey:@"daily_almanac"];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)parsePollenFromData:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v35 = [v3 allKeys];
  uint64_t v4 = [v35 firstObject];
  id v5 = [v3 objectForKeyedSubscript:v4];
  uint64_t v6 = [v5 count];

  [MEMORY[0x263EFF980] arrayWithCapacity:v6];
  v34 = uint64_t v33 = v6;
  if (v6)
  {
    uint64_t v7 = 0;
    v32 = @"treePollenIndex";
    do
    {
      v8 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v35, "count", v32));
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v9 = v35;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v36 objects:v40 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v37;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v37 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v36 + 1) + 8 * i);
            v15 = [v3 arrayForKey:v14];
            v16 = [v15 objectAtIndexedSubscript:v7];
            [v8 setObject:v16 forKeyedSubscript:v14];
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v36 objects:v40 count:16];
        }
        while (v11);
      }

      double v17 = objc_opt_new();
      double v18 = [v8 numberForKey:@"validTimeUtc"];
      double v19 = v18;
      if (v18)
      {
        double v20 = (void *)MEMORY[0x263EFF910];
        [v18 doubleValue];
        double v21 = objc_msgSend(v20, "dateWithTimeIntervalSince1970:");
        [v17 setDate:v21];
      }
      uint64_t v22 = [v8 stringForKey:@"dayOrNight"];
      v23 = (void *)v22;
      if (v22) {
        [v17 setTimeOfDay:WFTimeOfDayForString(v22)];
      }
      v24 = [v8 numberForKey:@"grassPollenIndex"];
      v25 = v24;
      if (v24) {
        objc_msgSend(v17, "setGrassIndex:", objc_msgSend(v24, "unsignedIntegerValue"));
      }
      v26 = [v8 numberForKey:@"ragweedPollenIndex"];
      v27 = v26;
      if (v26) {
        objc_msgSend(v17, "setRagweedIndex:", objc_msgSend(v26, "unsignedIntegerValue"));
      }
      v28 = [v8 numberForKey:v32];
      v29 = v28;
      if (v28) {
        objc_msgSend(v17, "setTreeIndex:", objc_msgSend(v28, "unsignedIntegerValue"));
      }
      [v34 addObject:v17];

      ++v7;
    }
    while (v7 != v33);
  }
  v30 = (void *)[v34 copy];

  return v30;
}

- (id)pollenDictFromData:(id)a3 types:(unint64_t)a4
{
  id v5 = a3;
  if (WFForecastTypeIsRequestedInTypes(16, a4))
  {
    uint64_t v6 = [v5 dictionaryForKey:@"pollen"];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)parseHourlyForecastFromData:(id)a3 withUnit:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = objc_opt_new();
  v8 = [v6 dictionaryForKey:@"metadata"];
  if (v8)
  {
    [(WFWeatherDataServiceParserV1 *)self parseMetaDataFromData:v8];
  }
  id v9 = [v6 arrayForKey:@"hours"];
  uint64_t v10 = v9;
  if (v9)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = [(WFWeatherDataServiceParserV1 *)self parseWeatherComponentsFromData:*(void *)(*((void *)&v18 + 1) + 8 * i) withUnit:v4];
          [v7 addObject:v15];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v12);
    }
  }
  v16 = (void *)[v7 copy];

  return v16;
}

- (id)hourlyForecastDictFromData:(id)a3 types:(unint64_t)a4
{
  id v5 = a3;
  if (WFForecastTypeIsRequestedInTypes(4, a4))
  {
    id v6 = [v5 dictionaryForKey:@"hourly_forecast"];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)dateFormatter
{
  if (dateFormatter_onceToken_0 != -1) {
    dispatch_once(&dateFormatter_onceToken_0, &__block_literal_global_6);
  }
  v2 = (void *)dateFormatter_dateFormatter_0;
  return v2;
}

uint64_t __65__WFWeatherDataServiceParserV1_ParseSevereWeather__dateFormatter__block_invoke()
{
  dateFormatter_dateFormatter_0 = (uint64_t)objc_alloc_init(MEMORY[0x263F088C0]);
  return MEMORY[0x270F9A758]();
}

- (id)parseSevereWeatherEventsFromData:(id)a3 withUnit:(int)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v21 = [MEMORY[0x263EFF980] array];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  obuint64_t j = v4;
  uint64_t v22 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v22)
  {
    uint64_t v20 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v26 != v20) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        v24 = [v6 objectForKey:@"areaName"];
        uint64_t v7 = [v6 objectForKey:@"description"];
        v8 = [v6 objectForKey:@"expireTime"];
        uint64_t v23 = [v6 objectForKey:@"id"];
        id v9 = [v6 objectForKey:@"source"];
        uint64_t v10 = [v6 objectForKey:@"learnMoreURL"];
        uint64_t v11 = [v6 numberForKey:@"isImportant"];
        uint64_t v12 = v11;
        if (v11)
        {
          uint64_t v13 = [v11 BOOLValue];
          if (v8) {
            goto LABEL_8;
          }
        }
        else
        {
          uint64_t v13 = 0;
          if (v8)
          {
LABEL_8:
            uint64_t v14 = [(id)objc_opt_class() dateFormatter];
            v15 = [v14 dateFromString:v8];

            goto LABEL_11;
          }
        }
        v15 = 0;
LABEL_11:
        if (v10)
        {
          v16 = [NSURL URLWithString:v10];
        }
        else
        {
          v16 = 0;
        }
        double v17 = [[WFSevereWeatherEvent alloc] initWithIdentifier:v23 areaName:v24 eventDescription:v7 source:v9 expirationDate:v15 URL:v16 importance:v13];
        [v21 addObject:v17];
      }
      uint64_t v22 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v22);
  }

  return v21;
}

- (id)severeWeatherEventDictFromData:(id)a3 types:(unint64_t)a4
{
  id v5 = a3;
  if (WFForecastTypeIsRequestedInTypes(1024, a4))
  {
    id v6 = [v5 arrayForKey:@"severe_weather_events"];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)parseChangeForecastFromData:(id)a3 withUnit:(int)a4
{
  id v4 = (void *)MEMORY[0x263EFF980];
  id v5 = a3;
  id v6 = [v4 array];
  uint64_t v7 = [v5 stringForKey:@"messageSameTimezone"];
  v8 = [v5 stringForKey:@"messageDifferentTimezone"];

  id v9 = [WFChangeForecast alloc];
  uint64_t v10 = [MEMORY[0x263EFF910] date];
  uint64_t v11 = [(WFChangeForecast *)v9 initWithDate:v10 descriptionSameTimeZone:v7 descriptionDifferentTimeZone:v8];

  [v6 addObject:v11];
  return v6;
}

- (id)changeForecastDictFromData:(id)a3 types:(unint64_t)a4
{
  id v5 = a3;
  if (WFForecastTypeIsRequestedInTypes(512, a4))
  {
    id v6 = [v5 dictionaryForKey:@"change_forecast"];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)parseHourlyHistoryFromData:(id)a3 withUnit:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = objc_opt_new();
  v8 = [v6 dictionaryForKey:@"metadata"];
  if (v8)
  {
    [(WFWeatherDataServiceParserV1 *)self parseMetaDataFromData:v8];
  }
  id v9 = [v6 arrayForKey:@"hours"];
  uint64_t v10 = v9;
  if (v9)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = [(WFWeatherDataServiceParserV1 *)self parseWeatherComponentsFromData:*(void *)(*((void *)&v18 + 1) + 8 * i) withUnit:v4];
          [v7 addObject:v15];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v12);
    }
  }
  v16 = (void *)[v7 copy];

  return v16;
}

- (id)hourlyHistoryDictFromData:(id)a3 types:(unint64_t)a4
{
  id v5 = a3;
  if (WFForecastTypeIsRequestedInTypes(32, a4))
  {
    id v6 = [v5 dictionaryForKey:@"hourly_history"];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)parseForecastData:(id)a3 types:(unint64_t)a4 location:(id)a5 units:(int)a6 locale:(id)a7 date:(id)a8 error:(id *)a9 rules:(id)a10
{
  v29[1] = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  id v19 = a10;
  if (v15)
  {
    id v27 = 0;
    long long v20 = [MEMORY[0x263F08900] JSONObjectWithData:v15 options:0 error:&v27];
    id v21 = v27;
    if (v21) {
      goto LABEL_8;
    }
  }
  else
  {
    long long v20 = 0;
  }
  if ([v20 count])
  {
    uint64_t v22 = [(WFWeatherDataServiceParserV1 *)self parseForecastDataFromDict:v20 types:a4 location:v16 units:a6 locale:v17 date:v18 error:a9 rules:v19];
    goto LABEL_9;
  }
  id v21 = 0;
LABEL_8:
  uint64_t v23 = (void *)MEMORY[0x263F087E8];
  uint64_t v28 = *MEMORY[0x263F08320];
  v29[0] = @"Failed to parse JSON forecast data";
  v24 = [NSDictionary dictionaryWithObjects:v29 forKeys:&v28 count:1];
  objc_msgSend(v23, "wf_errorWithCode:encapsulatedError:userInfo:", 1, v21, v24);
  *a9 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v22 = 0;
LABEL_9:

  return v22;
}

- (id)parseForecastData:(id)a3 types:(unint64_t)a4 location:(id)a5 locale:(id)a6 date:(id)a7 error:(id *)a8
{
  return [(WFWeatherDataServiceParserV1 *)self parseForecastData:a3 types:a4 location:a5 units:2 locale:a6 date:a7 error:a8 rules:0];
}

- (id)parseForecastData:(id)a3 types:(unint64_t)a4 location:(id)a5 locale:(id)a6 date:(id)a7 error:(id *)a8 rules:(id)a9
{
  return [(WFWeatherDataServiceParserV1 *)self parseForecastData:a3 types:a4 location:a5 units:2 locale:a6 date:a7 error:a8 rules:a9];
}

- (id)parseForecastDataFromDict:(id)a3 types:(unint64_t)a4 location:(id)a5 units:(int)a6 locale:(id)a7 date:(id)a8 error:(id *)a9 rules:(id)a10
{
  id v16 = a3;
  id v61 = a5;
  id v17 = a7;
  id v18 = a8;
  if (a6) {
    uint64_t v19 = a6;
  }
  else {
    uint64_t v19 = 2;
  }
  long long v20 = objc_alloc_init(WFParsedForecastData);
  uint64_t v21 = [(WFWeatherDataServiceParserV1 *)self currentObservationsDictFromData:v16 types:a4];
  unsigned int v62 = v19;
  if (v21)
  {
    uint64_t v22 = (void *)v21;
    uint64_t v23 = [(WFWeatherDataServiceParserV1 *)self parseCurrentObservationsFromData:v21 withUnit:v19];
LABEL_8:
    long long v25 = (void *)v23;
    [(WFParsedForecastData *)v20 setCurrentConditions:v23];
    goto LABEL_9;
  }
  uint64_t v24 = [(WFWeatherDataServiceParserV1 *)self dailyAlmanacDictFromData:v16 types:a4];
  if (v24)
  {
    uint64_t v22 = (void *)v24;
    uint64_t v23 = [(WFWeatherDataServiceParserV1 *)self parseAlmanacFromData:v24 withUnit:v19];
    goto LABEL_8;
  }
  uint64_t v54 = [(WFWeatherDataServiceParserV1 *)self dailyHistoryDictFromData:v16 types:a4];
  if (!v54) {
    goto LABEL_10;
  }
  uint64_t v22 = (void *)v54;
  long long v25 = [(WFWeatherDataServiceParserV1 *)self parseDailyHistoryFromData:v54 withUnit:v19];
  v55 = [v25 firstObject];
  [(WFParsedForecastData *)v20 setCurrentConditions:v55];

LABEL_9:
LABEL_10:
  long long v26 = [(WFParsedForecastData *)v20 currentConditions];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v28 = [(WFParsedForecastData *)v20 currentConditions];
    [v28 setLocation:v61];

    v29 = [(WFParsedForecastData *)v20 currentConditions];
    uint64_t v30 = [v29 objectForKeyedSubscript:@"WFWeatherForecastDateComponent"];

    if (!v30)
    {
      v31 = [(WFParsedForecastData *)v20 currentConditions];
      [v31 setObject:v18 forKeyedSubscript:@"WFWeatherForecastDateComponent"];
    }
  }
  uint64_t v32 = [(WFWeatherDataServiceParserV1 *)self hourlyHistoryDictFromData:v16 types:a4];
  uint64_t v33 = v62;
  if (v32)
  {
    v34 = [(WFWeatherDataServiceParserV1 *)self parseHourlyHistoryFromData:v32 withUnit:v62];
    [(WFParsedForecastData *)v20 setLastTwentyFourHoursOfObservations:v34];
  }
  uint64_t v35 = [(WFWeatherDataServiceParserV1 *)self dailyForecastDictFromData:v16 types:a4];
  if (v35)
  {
    long long v36 = [(WFWeatherDataServiceParserV1 *)self parseDailyForecastFromData:v35 withUnit:v62];
    [(WFParsedForecastData *)v20 setDailyForecasts:v36];
  }
  v57 = (void *)v35;
  v58 = (void *)v32;
  uint64_t v37 = [(WFWeatherDataServiceParserV1 *)self hourlyForecastDictFromData:v16 types:a4];
  if (v37)
  {
    long long v38 = [(WFWeatherDataServiceParserV1 *)self parseHourlyForecastFromData:v37 withUnit:v62];
    [(WFParsedForecastData *)v20 setHourlyForecasts:v38];
  }
  v56 = (void *)v37;
  long long v39 = [(WFWeatherDataServiceParserV1 *)self airQualityDictFromData:v16 types:a4];
  if (v39)
  {
    v40 = [(WFWeatherDataServiceParserV1 *)self parseAirQualityFromData:v39 locale:v17];
    [(WFParsedForecastData *)v20 setAirQualityObservations:v40];
  }
  v59 = v18;
  v60 = v17;
  uint64_t v41 = [(WFWeatherDataServiceParserV1 *)self pollenDictFromData:v16 types:a4];
  if (v41)
  {
    uint64_t v42 = [(WFWeatherDataServiceParserV1 *)self parsePollenFromData:v41];
    [(WFParsedForecastData *)v20 setPollenForecasts:v42];
  }
  uint64_t v43 = [(WFParsedForecastData *)v20 currentConditions];
  if (v43)
  {
    uint64_t v44 = (void *)v43;
    v45 = [(WFWeatherDataServiceParserV1 *)self nowLinksDictFromData:v16 types:a4];

    if (v45)
    {
      uint64_t v46 = [(WFParsedForecastData *)v20 currentConditions];
      [(WFWeatherDataServiceParserV1 *)self parseNowLinksFromData:v45 intoConditions:v46];
    }
  }
  v47 = [(WFWeatherDataServiceParserV1 *)self changeForecastDictFromData:v16 types:a4];
  if (v47)
  {
    v48 = [(WFWeatherDataServiceParserV1 *)self parseChangeForecastFromData:v47 withUnit:v62];
    [(WFParsedForecastData *)v20 setChangeForecasts:v48];
  }
  v49 = [(WFWeatherDataServiceParserV1 *)self severeWeatherEventDictFromData:v16 types:a4];
  if (v49)
  {
    v50 = [(WFWeatherDataServiceParserV1 *)self parseSevereWeatherEventsFromData:v49 withUnit:v62];
    [(WFParsedForecastData *)v20 setSevereWeatherEvents:v50];

    uint64_t v33 = v62;
  }
  uint64_t v51 = [(WFWeatherDataServiceParserV1 *)self nextHourPrecipitationEventDictFromData:v16 types:a4];
  if (v51)
  {
    uint64_t v52 = [(WFWeatherDataServiceParserV1 *)self parseNextHourPrecipitationFromData:v51 withUnit:v33];
    [(WFParsedForecastData *)v20 setNextHourPrecipitation:v52];
  }
  return v20;
}

- (id)parseAQIScaleNamed:(id)a3 data:(id)a4 error:(id *)a5
{
  v120[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    id v92 = 0;
    uint64_t v10 = [MEMORY[0x263F08900] JSONObjectWithData:v9 options:0 error:&v92];
    id v11 = v92;
    if (v11 || ![v10 count])
    {
      uint64_t v117 = *MEMORY[0x263F08320];
      v118 = @"Failed to parse JSON for remote AQI scale data";
      uint64_t v12 = [NSDictionary dictionaryWithObjects:&v118 forKeys:&v117 count:1];
      objc_msgSend(MEMORY[0x263F087E8], "wf_errorWithCode:encapsulatedError:userInfo:", 1, v11, v12);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      uint64_t v13 = 0;
      uint64_t v10 = v11;
      goto LABEL_80;
    }
    id v15 = [v10 objectForKeyedSubscript:@"aqi"];
    if ([v15 count])
    {
      if (v8)
      {
        id v16 = objc_alloc_init(WFAQIScale);
        [(WFAQIScale *)v16 setIdentifier:v8];
        id v17 = [v15 objectForKeyedSubscript:@"numerical"];
        id v18 = v17;
        if (v17)
        {
          -[WFAQIScale setNumerical:](v16, "setNumerical:", [v17 BOOLValue]);
          uint64_t v19 = [v15 objectForKeyedSubscript:@"ascending"];
          long long v20 = v19;
          if (v19)
          {
            -[WFAQIScale setAscending:](v16, "setAscending:", [v19 BOOLValue]);
            uint64_t v21 = [v10 objectForKeyedSubscript:@"displayName"];
            id v81 = (void *)v21;
            uint64_t v82 = v18;
            if (v21)
            {
              [(WFAQIScale *)v16 setDisplayName:v21];
              uint64_t v22 = [v10 objectForKeyedSubscript:@"displayLabel"];
              v78 = (void *)v22;
              if (v22)
              {
                [(WFAQIScale *)v16 setDisplayLabel:v22];
                uint64_t v23 = [v15 objectForKeyedSubscript:@"range"];
                if ([v23 count] == 2)
                {
                  v73 = v20;
                  uint64_t v24 = [v23 objectAtIndexedSubscript:0];
                  long long v25 = [v23 objectAtIndexedSubscript:1];
                  v74 = v24;
                  uint64_t v26 = [v24 unsignedIntegerValue];
                  v76 = v25;
                  -[WFAQIScale setRange:](v16, "setRange:", v26, [v25 unsignedIntegerValue] - v26);
                  id v27 = [v15 objectForKeyedSubscript:@"categories"];
                  uint64_t v28 = [v27 count];
                  id v77 = v23;
                  v75 = v27;
                  if (v28)
                  {
                    v71 = v15;
                    id v83 = [MEMORY[0x263EFF980] arrayWithCapacity:v28];
                    long long v88 = 0u;
                    long long v89 = 0u;
                    long long v90 = 0u;
                    long long v91 = 0u;
                    obuint64_t j = v27;
                    uint64_t v29 = [obj countByEnumeratingWithState:&v88 objects:v100 count:16];
                    if (v29)
                    {
                      uint64_t v30 = v29;
                      uint64_t v31 = *(void *)v89;
                      while (2)
                      {
                        for (uint64_t i = 0; i != v30; ++i)
                        {
                          if (*(void *)v89 != v31) {
                            objc_enumerationMutation(obj);
                          }
                          uint64_t v33 = [(WFWeatherDataServiceParserV1 *)self parsedCategoryFromDictionary:*(void *)(*((void *)&v88 + 1) + 8 * i)];
                          if (!v33)
                          {

                            v60 = WFLogForCategory(7uLL);
                            if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
                              -[WFWeatherDataServiceParserV1 parseAQIScaleNamed:data:error:]2();
                            }

                            uint64_t v98 = *MEMORY[0x263F08320];
                            long long v99 = @"Encountered a nil category property while parsing the categories";
                            uint64_t v35 = [NSDictionary dictionaryWithObjects:&v99 forKeys:&v98 count:1];
                            objc_msgSend(MEMORY[0x263F087E8], "wf_errorWithCode:encapsulatedError:userInfo:", 3, 0, v35);
                            uint64_t v13 = 0;
                            *a5 = (id)objc_claimAutoreleasedReturnValue();
                            id v15 = v71;
                            long long v20 = v73;
                            v53 = v81;
                            goto LABEL_72;
                          }
                          v34 = (void *)v33;
                          [v83 addObject:v33];
                        }
                        uint64_t v30 = [obj countByEnumeratingWithState:&v88 objects:v100 count:16];
                        if (v30) {
                          continue;
                        }
                        break;
                      }
                    }

                    [(WFAQIScale *)v16 setCategories:v83];
                    id v15 = v71;
                    uint64_t v35 = [v71 objectForKeyedSubscript:@"gradient"];
                    long long v36 = [v35 objectForKeyedSubscript:@"stops"];
                    uint64_t v37 = [v36 count];
                    v70 = v36;
                    if (v37)
                    {
                      v69 = v35;
                      id obja = [MEMORY[0x263EFF980] arrayWithCapacity:v37];
                      long long v84 = 0u;
                      long long v85 = 0u;
                      long long v86 = 0u;
                      long long v87 = 0u;
                      id v72 = v36;
                      uint64_t v38 = [v72 countByEnumeratingWithState:&v84 objects:v95 count:16];
                      if (v38)
                      {
                        uint64_t v39 = v38;
                        uint64_t v40 = *(void *)v85;
                        while (2)
                        {
                          for (uint64_t j = 0; j != v39; ++j)
                          {
                            if (*(void *)v85 != v40) {
                              objc_enumerationMutation(v72);
                            }
                            uint64_t v42 = [(WFWeatherDataServiceParserV1 *)self parsedGradientStopFromDictionary:*(void *)(*((void *)&v84 + 1) + 8 * j)];
                            if (!v42)
                            {

                              double v63 = WFLogForCategory(7uLL);
                              if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
                                -[WFWeatherDataServiceParserV1 parseAQIScaleNamed:data:error:]1();
                              }

                              uint64_t v93 = *MEMORY[0x263F08320];
                              long long v94 = @"Encountered a nil gradient property while parsing the gradient";
                              double v64 = [NSDictionary dictionaryWithObjects:&v94 forKeys:&v93 count:1];
                              objc_msgSend(MEMORY[0x263F087E8], "wf_errorWithCode:userInfo:", 3, v64);
                              *a5 = (id)objc_claimAutoreleasedReturnValue();

                              uint64_t v13 = 0;
                              goto LABEL_67;
                            }
                            uint64_t v43 = (void *)v42;
                            [obja addObject:v42];
                          }
                          uint64_t v39 = [v72 countByEnumeratingWithState:&v84 objects:v95 count:16];
                          if (v39) {
                            continue;
                          }
                          break;
                        }
                      }

                      uint64_t v44 = [[WFAQIScaleGradient alloc] initWithStops:obja];
                      [(WFAQIScale *)v16 setGradient:v44];

                      v45 = WFLogForCategory(7uLL);
                      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG)) {
                        -[WFWeatherDataServiceParserV1 parseAQIScaleNamed:data:error:]0((uint64_t)v16, v45);
                      }

                      uint64_t v13 = v16;
LABEL_67:
                      id v15 = v71;
                      long long v20 = v73;
                      double v65 = obja;
                      v53 = v81;
                      uint64_t v35 = v69;
                    }
                    else
                    {
                      v66 = WFLogForCategory(7uLL);
                      long long v20 = v73;
                      if (os_log_type_enabled(v66, OS_LOG_TYPE_FAULT)) {
                        -[WFWeatherDataServiceParserV1 parseAQIScaleNamed:data:error:].cold.9();
                      }

                      uint64_t v96 = *MEMORY[0x263F08320];
                      long long v97 = @"No gradient stops found";
                      uint64_t v67 = [NSDictionary dictionaryWithObjects:&v97 forKeys:&v96 count:1];
                      objc_msgSend(MEMORY[0x263F087E8], "wf_errorWithCode:userInfo:", 3, v67);
                      uint64_t v13 = 0;
                      *a5 = (id)objc_claimAutoreleasedReturnValue();
                      double v65 = (void *)v67;
                      v53 = v81;
                    }

LABEL_72:
                    v59 = v74;

                    unsigned int v62 = v83;
                  }
                  else
                  {
                    id v61 = WFLogForCategory(7uLL);
                    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
                      -[WFWeatherDataServiceParserV1 parseAQIScaleNamed:data:error:].cold.8();
                    }

                    uint64_t v101 = *MEMORY[0x263F08320];
                    long long v102 = @"Encountered a nil categories property in AQI scale data";
                    unsigned int v62 = [NSDictionary dictionaryWithObjects:&v102 forKeys:&v101 count:1];
                    objc_msgSend(MEMORY[0x263F087E8], "wf_errorWithCode:userInfo:", 3, v62);
                    uint64_t v13 = 0;
                    *a5 = (id)objc_claimAutoreleasedReturnValue();
                    long long v20 = v73;
                    v59 = v74;
                    v53 = v81;
                  }

                  uint64_t v23 = v77;
                }
                else
                {
                  v57 = WFLogForCategory(7uLL);
                  if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
                    -[WFWeatherDataServiceParserV1 parseAQIScaleNamed:data:error:]3();
                  }

                  uint64_t v103 = *MEMORY[0x263F08320];
                  long long v104 = @"Encountered a nil range property in AQI scale data";
                  uint64_t v58 = [NSDictionary dictionaryWithObjects:&v104 forKeys:&v103 count:1];
                  objc_msgSend(MEMORY[0x263F087E8], "wf_errorWithCode:userInfo:", 3, v58);
                  uint64_t v13 = 0;
                  *a5 = (id)objc_claimAutoreleasedReturnValue();
                  v59 = (void *)v58;
                  v53 = v81;
                }
              }
              else
              {
                v56 = WFLogForCategory(7uLL);
                if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
                  -[WFWeatherDataServiceParserV1 parseAQIScaleNamed:data:error:].cold.7();
                }

                uint64_t v105 = *MEMORY[0x263F08320];
                long long v106 = @"Encountered a nil displayLabel property in AQI scale data";
                uint64_t v23 = [NSDictionary dictionaryWithObjects:&v106 forKeys:&v105 count:1];
                objc_msgSend(MEMORY[0x263F087E8], "wf_errorWithCode:userInfo:", 3, v23);
                uint64_t v13 = 0;
                *a5 = (id)objc_claimAutoreleasedReturnValue();
                v53 = v81;
              }

              v55 = v78;
            }
            else
            {
              uint64_t v54 = WFLogForCategory(7uLL);
              if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
                -[WFWeatherDataServiceParserV1 parseAQIScaleNamed:data:error:].cold.6();
              }

              uint64_t v107 = *MEMORY[0x263F08320];
              long long v108 = @"Encountered a nil displayName property in AQI scale data";
              v55 = [NSDictionary dictionaryWithObjects:&v108 forKeys:&v107 count:1];
              objc_msgSend(MEMORY[0x263F087E8], "wf_errorWithCode:userInfo:", 3, v55);
              uint64_t v13 = 0;
              *a5 = (id)objc_claimAutoreleasedReturnValue();
              v53 = 0;
            }

            id v18 = v82;
          }
          else
          {
            uint64_t v52 = WFLogForCategory(7uLL);
            if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
              -[WFWeatherDataServiceParserV1 parseAQIScaleNamed:data:error:].cold.5();
            }

            uint64_t v109 = *MEMORY[0x263F08320];
            v110 = @"Encountered a nil ascending property in AQI scale data";
            v53 = [NSDictionary dictionaryWithObjects:&v110 forKeys:&v109 count:1];
            objc_msgSend(MEMORY[0x263F087E8], "wf_errorWithCode:userInfo:", 3, v53);
            uint64_t v13 = 0;
            *a5 = (id)objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
          uint64_t v51 = WFLogForCategory(7uLL);
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
            -[WFWeatherDataServiceParserV1 parseAQIScaleNamed:data:error:].cold.4();
          }

          uint64_t v111 = *MEMORY[0x263F08320];
          v112 = @"Encountered a nil nnumerical property in AQI scale data";
          long long v20 = [NSDictionary dictionaryWithObjects:&v112 forKeys:&v111 count:1];
          objc_msgSend(MEMORY[0x263F087E8], "wf_errorWithCode:userInfo:", 3, v20);
          uint64_t v13 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }

        goto LABEL_79;
      }
      v50 = WFLogForCategory(7uLL);
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
        -[WFWeatherDataServiceParserV1 parseAQIScaleNamed:data:error:]();
      }

      uint64_t v113 = *MEMORY[0x263F08320];
      v114 = @"Encountered a nil name property in AQI scale data";
      v47 = NSDictionary;
      v48 = &v114;
      v49 = &v113;
    }
    else
    {
      uint64_t v46 = WFLogForCategory(7uLL);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
        -[WFWeatherDataServiceParserV1 parseAQIScaleNamed:data:error:]();
      }

      uint64_t v115 = *MEMORY[0x263F08320];
      v116 = @"Encountered an empty scale";
      v47 = NSDictionary;
      v48 = &v116;
      v49 = &v115;
    }
    id v16 = [v47 dictionaryWithObjects:v48 forKeys:v49 count:1];
    objc_msgSend(MEMORY[0x263F087E8], "wf_errorWithCode:userInfo:", 3, v16);
    uint64_t v13 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_79:

    goto LABEL_80;
  }
  uint64_t v14 = WFLogForCategory(7uLL);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    -[WFWeatherDataServiceParserV1 parseAQIScaleNamed:data:error:]();
  }

  uint64_t v119 = *MEMORY[0x263F08320];
  v120[0] = @"The passed in data is nil";
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v120 forKeys:&v119 count:1];
  objc_msgSend(MEMORY[0x263F087E8], "wf_errorWithCode:userInfo:", 3, v10);
  uint64_t v13 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_80:

  return v13;
}

- (id)parsedCategoryFromDictionary:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    uint64_t v4 = objc_alloc_init(WFAQIScaleCategory);
    id v5 = [v3 objectForKeyedSubscript:@"categoryName"];
    [(WFAQIScaleCategory *)v4 setCategoryName:v5];
    id v6 = [v3 objectForKeyedSubscript:@"categoryNumber"];
    -[WFAQIScaleCategory setCategoryNumber:](v4, "setCategoryNumber:", [v6 unsignedIntegerValue]);
    uint64_t v7 = [v3 objectForKeyedSubscript:@"color"];
    [(WFAQIScaleCategory *)v4 setColor:v7];
    id v8 = [v3 objectForKeyedSubscript:@"glyph"];
    [(WFAQIScaleCategory *)v4 setGlyph:v8];
    id v9 = [v3 objectForKeyedSubscript:@"recommendation"];
    [(WFAQIScaleCategory *)v4 setRecommendation:v9];
    uint64_t v10 = [v3 objectForKeyedSubscript:@"range"];
    if ([v10 count] == 2)
    {
      uint64_t v21 = [v10 objectAtIndexedSubscript:0];
      id v11 = [v10 objectAtIndexedSubscript:1];
      uint64_t v12 = v8;
      uint64_t v13 = v7;
      uint64_t v14 = v6;
      id v15 = v5;
      uint64_t v16 = [v21 unsignedIntegerValue];
      uint64_t v17 = [v11 unsignedIntegerValue] - v16;
      uint64_t v18 = v16;
      id v5 = v15;
      id v6 = v14;
      uint64_t v7 = v13;
      id v8 = v12;
      -[WFAQIScaleCategory setRange:](v4, "setRange:", v18, v17);
    }
  }
  else
  {
    uint64_t v19 = WFLogForCategory(7uLL);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      -[WFWeatherDataServiceParserV1 parsedCategoryFromDictionary:]();
    }

    uint64_t v4 = 0;
  }

  return v4;
}

- (id)parsedGradientStopFromDictionary:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    uint64_t v4 = [v3 objectForKeyedSubscript:@"location"];
    id v5 = v4;
    if (v4)
    {
      [v4 floatValue];
      int v7 = v6;
      id v8 = [v3 objectForKeyedSubscript:@"color"];
      if (v8)
      {
        id v9 = [WFAQIScaleGradientStop alloc];
        LODWORD(v10) = v7;
        id v11 = [(WFAQIScaleGradientStop *)v9 initWithLocation:v8 color:v10];
LABEL_14:

        goto LABEL_15;
      }
      uint64_t v12 = WFLogForCategory(7uLL);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        -[WFWeatherDataServiceParserV1 parsedGradientStopFromDictionary:]();
      }
    }
    else
    {
      id v8 = WFLogForCategory(7uLL);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        -[WFWeatherDataServiceParserV1 parsedGradientStopFromDictionary:]();
      }
    }
    id v11 = 0;
    goto LABEL_14;
  }
  id v5 = WFLogForCategory(7uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
    -[WFWeatherDataServiceParserV1 parsedGradientStopFromDictionary:]();
  }
  id v11 = 0;
LABEL_15:

  return v11;
}

- (id)currentObservationsDictFromData:(id)a3 types:(unint64_t)a4
{
  id v5 = a3;
  if (WFForecastTypeIsRequestedInTypes(2, a4))
  {
    int v6 = [v5 dictionaryForKey:@"current_observations"];
  }
  else
  {
    int v6 = 0;
  }

  return v6;
}

- (id)parseMetaDataFromData:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(WFWeatherDataServiceParserMetadataV1);
  id v5 = [v3 numberForKey:@"reported_time"];
  int v6 = v5;
  if (v5)
  {
    int v7 = (void *)MEMORY[0x263EFF910];
    [v5 doubleValue];
    id v8 = objc_msgSend(v7, "dateWithTimeIntervalSince1970:");
    [(WFWeatherDataServiceParserMetadataV1 *)v4 setReadDate:v8];
  }
  id v9 = [v3 numberForKey:@"expirationTimeUtc"];
  double v10 = v9;
  if (v9)
  {
    id v11 = (void *)MEMORY[0x263EFF910];
    [v9 doubleValue];
    uint64_t v12 = objc_msgSend(v11, "dateWithTimeIntervalSince1970:");
    [(WFWeatherDataServiceParserMetadataV1 *)v4 setExpireDate:v12];
  }
  uint64_t v13 = [v3 numberForKey:@"version"];
  uint64_t v14 = v13;
  if (v13) {
    -[WFWeatherDataServiceParserMetadataV1 setVersion:](v4, "setVersion:", [v13 unsignedIntegerValue]);
  }
  id v15 = [v3 stringForKey:@"provider_name"];
  [(WFWeatherDataServiceParserMetadataV1 *)v4 setProviderName:v15];

  uint64_t v16 = [v3 stringForKey:@"provider_logo"];
  if (v16)
  {
    uint64_t v17 = [NSURL URLWithString:v16];
    [(WFWeatherDataServiceParserMetadataV1 *)v4 setProviderLogoURL:v17];
  }
  uint64_t v18 = [v3 numberForKey:@"data_source"];
  uint64_t v19 = v18;
  if (v18)
  {
    uint64_t v20 = [v18 unsignedIntegerValue];
    uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
    if (v20 == 1) {
      uint64_t v21 = 1;
    }
    if (v20) {
      uint64_t v22 = v21;
    }
    else {
      uint64_t v22 = 0;
    }
    [(WFWeatherDataServiceParserMetadataV1 *)v4 setDataOrigination:v22];
  }
  uint64_t v23 = [v3 numberForKey:@"latitude"];
  if (v23)
  {
    uint64_t v24 = [v3 numberForKey:@"longitude"];
    if (v24)
    {
      long long v25 = (void *)v24;
      uint64_t v35 = v6;
      uint64_t v26 = objc_opt_new();
      id v27 = objc_alloc(MEMORY[0x263F00A50]);
      [v23 doubleValue];
      double v29 = v28;
      [v25 doubleValue];
      uint64_t v31 = (void *)[v27 initWithLatitude:v29 longitude:v30];
      [v26 setGeoLocation:v31];

      [(WFWeatherDataServiceParserMetadataV1 *)v4 setLocation:v26];
      if ([(WFWeatherDataServiceParserMetadataV1 *)v4 dataOrigination] == 0x7FFFFFFFFFFFFFFFLL) {
        [(WFWeatherDataServiceParserMetadataV1 *)v4 setDataOrigination:0];
      }

      int v6 = v35;
    }
  }
  uint64_t v32 = [v3 numberForKey:@"temporarily_unavailable"];
  uint64_t v33 = v32;
  if (v32) {
    -[WFWeatherDataServiceParserMetadataV1 setTemporarilyUnavailable:](v4, "setTemporarilyUnavailable:", [v32 BOOLValue]);
  }

  return v4;
}

- (id)parseWeatherComponentsFromData:(id)a3 withUnit:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  int v7 = objc_alloc_init(WFWeatherConditions);
  [(WFWeatherDataServiceParserV1 *)self parseWeatherComponentsFromData:v6 intoConditions:v7 withUnit:v4];

  return v7;
}

- (void)parseWeatherComponentsFromData:(id)a3 intoConditions:(id)a4 withUnit:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v45 = a3;
  id v8 = a4;
  id v9 = [v45 numberForKey:@"validTimeUtc"];
  double v10 = v9;
  if (v9)
  {
    id v11 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v9, "unsignedIntegerValue"));
    [v8 setObject:v11 forKeyedSubscript:@"WFWeatherForecastDateComponent"];
  }
  uint64_t v12 = [v45 numberForKey:@"expirationTimeUtc"];

  if (v12)
  {
    uint64_t v13 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v12, "unsignedIntegerValue"));
    [v8 setObject:v13 forKeyedSubscript:@"WFWeatherForecastExpirationDateComponent"];
  }
  uint64_t v14 = [v45 dictionaryForKey:@"metadata"];
  if (v14)
  {
    id v15 = [(WFWeatherDataServiceParserV1 *)self parseMetaDataFromData:v14];
    uint64_t v16 = [v15 providerName];
    [v8 setObject:v16 forKeyedSubscript:@"WFWeatherDataProviderName"];
  }
  uint64_t v17 = [v45 numberForKey:@"iconCode"];
  if (v17
    || ([v45 numberForKey:@"iconCodeDay"],
        (uint64_t v17 = objc_claimAutoreleasedReturnValue()) != 0)
    || ([v45 numberForKey:@"iconCodeNight"],
        (uint64_t v17 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    [v8 setObject:v17 forKeyedSubscript:@"__THIS_WILL_BE_DEPRECATED__WFWeatherLegacyConditionComponent"];
    uint64_t v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", WFConditionCodeFromLegacyWeatherConditionCode(objc_msgSend(v17, "unsignedIntegerValue")));
    [v8 setObject:v18 forKeyedSubscript:@"WFWeatherConditionComponent"];
  }
  uint64_t v19 = [v45 numberForKey:@"relativeHumidity"];
  if (v19) {
    [v8 setObject:v19 forKeyedSubscript:@"WFWeatherHumidityComponent"];
  }
  uint64_t v43 = (void *)v14;
  uint64_t v20 = objc_msgSend(v45, "numberForKey:", @"precip1Hour", v19);
  if (v20
    || ([v45 numberForKey:@"precip24Hour"],
        (uint64_t v20 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    [v8 setObject:v20 forKeyedSubscript:@"WFWeatherPrecipitationAmountComponent"];
  }
  uint64_t v44 = v12;
  uint64_t v21 = [v45 numberForKey:@"precipChance"];
  if (v21) {
    [v8 setObject:v21 forKeyedSubscript:@"WFWeatherPrecipitationChanceComponent"];
  }
  uint64_t v22 = [v45 stringForKey:@"precipType"];
  if (v22) {
    [v8 setObject:v22 forKeyedSubscript:@"WFWeatherPrecipitationTypeComponent"];
  }
  uint64_t v23 = [v45 stringForKey:@"dayOrNight"];
  if (v23) {
    [v8 setNightForecast:objc_msgSend(@"N", "isEqualToString:", v23)];
  }
  uint64_t v24 = [v45 numberForKey:@"temperature"];
  if (v24)
  {
    long long v25 = [WFTemperature alloc];
    [v24 doubleValue];
    uint64_t v26 = -[WFTemperature initWithTemperatureUnit:value:](v25, "initWithTemperatureUnit:value:", v5);
    [v8 setObject:v26 forKeyedSubscript:@"WFWeatherTemperatureComponent"];
  }
  id v27 = [v45 numberForKey:@"temperatureMax24Hour"];
  if (v27
    || ([v45 numberForKey:@"temperatureMax"],
        (id v27 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    double v28 = [WFTemperature alloc];
    [v27 doubleValue];
    double v29 = -[WFTemperature initWithTemperatureUnit:value:](v28, "initWithTemperatureUnit:value:", v5);
    [v8 setObject:v29 forKeyedSubscript:@"WFWeatherHighTemperatureComponent"];
  }
  double v30 = [v45 numberForKey:@"temperatureMin24Hour"];
  if (v30
    || ([v45 numberForKey:@"temperatureMin"],
        (double v30 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v31 = [WFTemperature alloc];
    [v30 doubleValue];
    uint64_t v32 = -[WFTemperature initWithTemperatureUnit:value:](v31, "initWithTemperatureUnit:value:", v5);
    [v8 setObject:v32 forKeyedSubscript:@"WFWeatherLowTemperatureComponent"];
  }
  uint64_t v33 = [v45 numberForKey:@"temperatureFeelsLike"];

  if (v33)
  {
    v34 = [WFTemperature alloc];
    [v33 doubleValue];
    uint64_t v35 = -[WFTemperature initWithTemperatureUnit:value:](v34, "initWithTemperatureUnit:value:", v5);
    [v8 setObject:v35 forKeyedSubscript:@"WFWeatherFeelsLikeTemperatureComponent"];
  }
  long long v36 = [v45 numberForKey:@"uvIndex"];
  if (v36) {
    [v8 setObject:v36 forKeyedSubscript:@"WFWeatherUVIndexComponent"];
  }
  uint64_t v37 = [v45 numberForKey:@"visibility"];
  if (v37) {
    [v8 setObject:v37 forKeyedSubscript:@"WFWeatherVisibilityComponent"];
  }
  uint64_t v38 = [v45 numberForKey:@"windDirection"];
  if (v38) {
    [v8 setObject:v38 forKeyedSubscript:@"WFWeatherWindDirectionComponent"];
  }
  uint64_t v39 = [v45 numberForKey:@"windSpeed"];
  if (v39) {
    [v8 setObject:v39 forKeyedSubscript:@"WFWeatherWindSpeedComponent"];
  }
  uint64_t v40 = [v45 numberForKey:@"pressureAltimeter"];
  if (v40
    || ([v45 numberForKey:@"pressureMeanSeaLevel"],
        (uint64_t v40 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    [v8 setObject:v40 forKeyedSubscript:@"WFWeatherPressureComponent"];
  }
  uint64_t v41 = [v45 numberForKey:@"pressureTendencyCode"];
  if (v41) {
    [v8 setObject:v41 forKeyedSubscript:@"WFWeatherPressureTrendComponent"];
  }
}

- (id)parseAirQualityFromData:(id)a3 locale:(id)a4
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(WFAirQualityConditions);
  [v6 dictionaryForKey:@"metadata"];
  uint64_t v54 = v53 = v7;
  if (v54)
  {
    id v9 = [(WFWeatherDataServiceParserV1 *)self parseMetaDataFromData:v54];
    double v10 = [v9 expireDate];
    [(WFAirQualityConditions *)v8 setExpirationDate:v10];

    id v11 = [v9 readDate];
    [(WFAirQualityConditions *)v8 setDate:v11];

    if ([v9 dataOrigination])
    {
      uint64_t v12 = 0;
    }
    else
    {
      uint64_t v13 = [WFAirQualityProviderStation alloc];
      uint64_t v14 = [v9 location];
      id v15 = [v14 geoLocation];
      uint64_t v16 = [v9 readDate];
      uint64_t v12 = [(WFAirQualityProviderStation *)v13 initWithLocation:v15 lastReadDate:v16];
    }
    uint64_t v17 = +[WFAirQualityProviderAttributionManager sharedManager];
    uint64_t v18 = [v9 providerName];
    uint64_t v19 = [v17 cachedAttributionForProvider:v18];

    if (![(WFWeatherDataServiceParserV1 *)self isProviderAttribution:v19 stillValidWithMetadata:v9])
    {
      uint64_t v20 = [WFAirQualityProviderAttribution alloc];
      uint64_t v21 = [v9 providerName];
      uint64_t v22 = [v9 providerLogoURL];
      uint64_t v23 = -[WFAirQualityProviderAttribution initWithName:logoURL:dataOrigination:station:](v20, "initWithName:logoURL:dataOrigination:station:", v21, v22, [v9 dataOrigination], v12);

      id v7 = v53;
      [v17 registerProviderAttribution:v23];
      uint64_t v19 = (void *)v23;
    }
    [(WFAirQualityConditions *)v8 setProviderAttribution:v19];
    -[WFAirQualityConditions setTemporarilyUnavailable:](v8, "setTemporarilyUnavailable:", [v9 temporarilyUnavailable]);
  }
  [(WFAirQualityConditions *)v8 setLocale:v7];
  uint64_t v24 = [v6 stringForKey:@"source"];
  [(WFAirQualityConditions *)v8 setProvider:v24];

  long long v25 = [v6 stringForKey:@"disclaimer"];
  [(WFAirQualityConditions *)v8 setLocalizedDisclaimer:v25];

  uint64_t v26 = [v6 numberForKey:@"airQualityIndex"];
  id v27 = v26;
  if (v26)
  {
    -[WFAirQualityConditions setLocalizedAirQualityIndex:](v8, "setLocalizedAirQualityIndex:", [v26 unsignedIntegerValue]);
    -[WFAirQualityConditions setAirQualityIndex:](v8, "setAirQualityIndex:", [v27 unsignedIntegerValue]);
  }
  double v28 = [v6 numberForKey:@"airQualityCategoryIndex"];
  double v29 = v28;
  if (v28)
  {
    -[WFAirQualityConditions setCategory:](v8, "setCategory:", [v28 integerValue]);
    -[WFAirQualityConditions setCurrentCategoryIndex:](v8, "setCurrentCategoryIndex:", [v29 integerValue]);
  }
  double v30 = [v6 stringForKey:@"airQualityCategory"];
  [(WFAirQualityConditions *)v8 setLocalizedAirQualityCategory:v30];

  uint64_t v31 = [v6 stringForKey:@"airQualityScale"];
  [(WFAirQualityConditions *)v8 setAirQualityScale:v31];

  uint64_t v32 = [v6 stringForKey:@"airQualityScale"];
  [(WFAirQualityConditions *)v8 setScaleIdentifier:v32];

  [(WFAirQualityConditions *)v8 setSignificance:0];
  uint64_t v33 = [v6 numberForKey:@"isSignificant"];
  v34 = v33;
  if (v33)
  {
    if ([v33 BOOLValue]) {
      uint64_t v35 = 1;
    }
    else {
      uint64_t v35 = 2;
    }
    [(WFAirQualityConditions *)v8 setSignificance:v35];
  }
  long long v36 = [v6 stringForKey:@"learnMoreURL"];
  uint64_t v37 = v36;
  if (v36)
  {
    uint64_t v38 = [v36 stringByReplacingOccurrencesOfString:@"{products}" withString:@"AppleWeatherService"];
    uint64_t v39 = [NSURL URLWithString:v38];
    [(WFAirQualityConditions *)v8 setLearnMoreURL:v39];
  }
  uint64_t v40 = [v6 dictionaryForKey:@"pollutants"];
  uint64_t v41 = [(WFWeatherDataServiceParserV1 *)self parsePollutants:v40];

  uint64_t v42 = [v41 allValues];
  [(WFAirQualityConditions *)v8 setPollutants:v42];

  uint64_t v43 = [v6 stringForKey:@"primaryPollutant"];
  if (v43)
  {
    uint64_t v44 = [v41 objectForKeyedSubscript:v43];
    if (v44)
    {
      [(WFAirQualityConditions *)v8 setPrimaryPollutant:v44];
    }
    else
    {
      id v45 = WFLogForCategory(7uLL);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v51 = [(WFAirQualityConditions *)v8 pollutants];
        log = v45;
        v50 = NSStringFromSelector(sel_localizedName);
        uint64_t v46 = [v51 valueForKeyPath:v50];
        v49 = [v46 componentsJoinedByString:@", "];
        *(_DWORD *)buf = 138543618;
        v56 = v43;
        __int16 v57 = 2114;
        uint64_t v58 = v49;
        _os_log_impl(&dword_21C988000, log, OS_LOG_TYPE_DEFAULT, "Did not find primary pollutant %{public}@ in list of pollutants: %{public}@", buf, 0x16u);

        id v45 = log;
      }
    }
  }
  v47 = WFLogForCategory(7uLL);
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG)) {
    -[WFWeatherDataServiceParserV1(ParseAirQuality) parseAirQualityFromData:locale:]((uint64_t)v8, v47);
  }

  return v8;
}

- (id)parsePollutants:(id)a3
{
  if (a3)
  {
    id v3 = (void *)MEMORY[0x263EFF9A0];
    id v4 = a3;
    uint64_t v5 = objc_msgSend(v3, "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __65__WFWeatherDataServiceParserV1_ParseAirQuality__parsePollutants___block_invoke;
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

void __65__WFWeatherDataServiceParserV1_ParseAirQuality__parsePollutants___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v14 = (id)objc_opt_new();
  id v7 = [v5 stringForKey:@"name"];
  [v14 setLocalizedName:v7];

  id v8 = [v5 stringForKey:@"phrase"];
  [v14 setLocalizedDescription:v8];

  id v9 = [v5 numberForKey:@"amount"];
  [v9 doubleValue];
  objc_msgSend(v14, "setAmount:");

  id v10 = [v5 stringForKey:@"unit"];
  [v14 setUnit:v10];

  id v11 = [v5 stringForKey:@"category"];
  [v14 setLocalizedCategoryDescription:v11];

  uint64_t v12 = [v5 numberForKey:@"categoryIndex"];
  objc_msgSend(v14, "setCategoryIndex:", objc_msgSend(v12, "unsignedIntegerValue"));

  uint64_t v13 = [v5 numberForKey:@"index"];

  objc_msgSend(v14, "setIndex:", objc_msgSend(v13, "unsignedIntegerValue"));
  [*(id *)(a1 + 32) setObject:v14 forKeyedSubscript:v6];
}

- (id)airQualityDictFromData:(id)a3 types:(unint64_t)a4
{
  id v5 = a3;
  if (WFForecastTypeIsRequestedInTypes(1, a4))
  {
    id v6 = [v5 dictionaryForKey:@"air_quality"];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)isProviderAttribution:(id)a3 stillValidWithMetadata:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  BOOL v8 = 0;
  if (v5 && v6)
  {
    id v9 = [v5 name];
    id v10 = [v7 providerName];
    int v11 = [v9 isEqualToString:v10];

    if (!v11) {
      goto LABEL_6;
    }
    uint64_t v12 = [v5 logoURL];
    uint64_t v13 = [v12 absoluteString];
    id v14 = [v7 providerLogoURL];
    id v15 = [v14 absoluteString];
    int v16 = [v13 isEqualToString:v15];

    if (v16)
    {
      uint64_t v17 = [v5 dataOrigination];
      BOOL v8 = v17 == [v7 dataOrigination];
    }
    else
    {
LABEL_6:
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (id)parseDailyHistoryFromData:(id)a3 withUnit:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = objc_opt_new();
  BOOL v8 = [v6 dictionaryForKey:@"metadata"];
  if (v8)
  {
    [(WFWeatherDataServiceParserV1 *)self parseMetaDataFromData:v8];
  }
  id v9 = [v6 arrayForKey:@"days"];
  id v10 = v9;
  if (v9)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = [(WFWeatherDataServiceParserV1 *)self parseWeatherComponentsFromData:*(void *)(*((void *)&v18 + 1) + 8 * i) withUnit:v4];
          [v7 addObject:v15];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v12);
    }
  }
  int v16 = (void *)[v7 copy];

  return v16;
}

- (id)dailyHistoryDictFromData:(id)a3 types:(unint64_t)a4
{
  id v5 = a3;
  if (WFForecastTypeIsRequestedInTypes(64, a4))
  {
    id v6 = [v5 dictionaryForKey:@"daily_history"];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)parseDailyForecastFromData:(id)a3 withUnit:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = objc_opt_new();
  BOOL v8 = [v6 arrayForKey:@"days"];
  long long v25 = v6;
  id v9 = [v6 arrayForKey:@"dayParts"];
  if ([v8 count])
  {
    int v10 = 0;
    unint64_t v11 = 0;
    int v28 = 0;
    id v27 = v8;
    uint64_t v26 = v7;
    do
    {
      uint64_t v12 = objc_opt_new();
      int v13 = v28 + v10;
      if ([v9 count] > (unint64_t)(v28 + v10))
      {
        uint64_t v14 = v13;
        if (!v13)
        {
          id v15 = [v9 objectAtIndexedSubscript:0];
          int v16 = [v15 valueForKey:@"dayOrNight"];

          int v17 = [@"N" isEqualToString:v16];
          int v18 = v28;
          if (v17) {
            int v18 = -1;
          }
          int v28 = v18;
        }
        long long v19 = [v9 objectAtIndexedSubscript:v14];
        [(WFWeatherDataServiceParserV1 *)self parseWeatherComponentsFromData:v19 intoConditions:v12 withUnit:v4];
        long long v20 = [v19 valueForKey:@"dayOrNight"];
        [v12 setNightForecast:objc_msgSend(@"N", "isEqualToString:", v20)];

        id v7 = v26;
        BOOL v8 = v27;
      }
      long long v21 = [v8 objectAtIndexedSubscript:v11];
      [(WFWeatherDataServiceParserV1 *)self parseWeatherComponentsFromData:v21 intoConditions:v12 withUnit:v4];
      uint64_t v22 = [NSNumber numberWithInt:++v11];
      [v12 setObject:v22 forKeyedSubscript:@"__THIS_WILL_BE_DEPRECATED__WFWeatherSeriesIndexComponent"];

      [v7 addObject:v12];
      v10 += 2;
    }
    while ([v8 count] > v11);
  }
  uint64_t v23 = (void *)[v7 copy];

  return v23;
}

- (id)dailyForecastDictFromData:(id)a3 types:(unint64_t)a4
{
  id v5 = a3;
  if (WFForecastTypeIsRequestedInTypes(8, a4))
  {
    id v6 = [v5 dictionaryForKey:@"daily_forecast"];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)parseNowLinksFromData:(id)a3 intoConditions:(id)a4
{
  id v5 = NSURL;
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [v7 stringForKey:@"iosNow"];
  id v9 = [v5 URLWithString:v8];
  [v6 setObject:v9 forKeyedSubscript:@"WFWeatherIOSLinkComponent"];

  int v10 = NSURL;
  unint64_t v11 = [v7 stringForKey:@"web"];
  uint64_t v12 = [v10 URLWithString:v11];
  [v6 setObject:v12 forKeyedSubscript:@"WFWeatherMobileLinkComponent"];

  int v13 = NSURL;
  uint64_t v14 = [v7 stringForKey:@"web"];
  id v15 = [v13 URLWithString:v14];
  [v6 setObject:v15 forKeyedSubscript:@"WFWeatherWebLinkComponent"];

  int v16 = NSURL;
  int v17 = [v7 stringForKey:@"webForecastHourly"];
  int v18 = [v16 URLWithString:v17];
  [v6 setObject:v18 forKeyedSubscript:@"WFWeatherWebForecastHourlyLinkComponent"];

  long long v19 = NSURL;
  long long v20 = [v7 stringForKey:@"webForecastDaily10"];
  long long v21 = [v19 URLWithString:v20];
  [v6 setObject:v21 forKeyedSubscript:@"WFWeatherWebForecastDailyLinkComponent"];

  uint64_t v22 = NSURL;
  uint64_t v23 = [v7 stringForKey:@"webForecastMonthly"];
  uint64_t v24 = [v22 URLWithString:v23];
  [v6 setObject:v24 forKeyedSubscript:@"WFWeatherWebForecastMonthlyLinkComponent"];

  long long v25 = NSURL;
  uint64_t v26 = [v7 stringForKey:@"webRadar"];
  id v27 = [v25 URLWithString:v26];
  [v6 setObject:v27 forKeyedSubscript:@"WFWeatherWebRadarLinkComponent"];

  int v28 = NSURL;
  id v30 = [v7 stringForKey:@"webAllergy"];

  double v29 = [v28 URLWithString:v30];
  [v6 setObject:v29 forKeyedSubscript:@"WFWeatherWebAllergyLinkComponent"];
}

- (id)nowLinksDictFromData:(id)a3 types:(unint64_t)a4
{
  id v5 = a3;
  if (WFForecastTypeIsRequestedInTypes(256, a4))
  {
    id v6 = [v5 dictionaryForKey:@"now_links"];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)parseAQIScaleNamed:data:error:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_0(&dword_21C988000, v0, v1, "The passed in data is nil", v2, v3, v4, v5, v6);
}

- (void)parseAQIScaleNamed:data:error:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_0(&dword_21C988000, v0, v1, "Encountered an empty scale", v2, v3, v4, v5, v6);
}

- (void)parseAQIScaleNamed:data:error:.cold.3()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_0(&dword_21C988000, v0, v1, "Encountered a nil name property in AQI scale data", v2, v3, v4, v5, v6);
}

- (void)parseAQIScaleNamed:data:error:.cold.4()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_0(&dword_21C988000, v0, v1, "Encountered a nil numerical property in AQI scale data", v2, v3, v4, v5, v6);
}

- (void)parseAQIScaleNamed:data:error:.cold.5()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_0(&dword_21C988000, v0, v1, "Encountered a nil ascending property in AQI scale data", v2, v3, v4, v5, v6);
}

- (void)parseAQIScaleNamed:data:error:.cold.6()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_0(&dword_21C988000, v0, v1, "Encountered a nil displayName property in AQI scale data", v2, v3, v4, v5, v6);
}

- (void)parseAQIScaleNamed:data:error:.cold.7()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_0(&dword_21C988000, v0, v1, "Encountered a nil displayLabel property in AQI scale data", v2, v3, v4, v5, v6);
}

- (void)parseAQIScaleNamed:data:error:.cold.8()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_0(&dword_21C988000, v0, v1, "Encountered a nil categories property in AQI scale data", v2, v3, v4, v5, v6);
}

- (void)parseAQIScaleNamed:data:error:.cold.9()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_2(&dword_21C988000, v0, v1, "No gradient stops found", v2, v3, v4, v5, v6);
}

- (void)parseAQIScaleNamed:(uint64_t)a1 data:(NSObject *)a2 error:.cold.10(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_21C988000, a2, OS_LOG_TYPE_DEBUG, "Successfully parsed aqi scale: %@", (uint8_t *)&v2, 0xCu);
}

- (void)parseAQIScaleNamed:data:error:.cold.11()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_0(&dword_21C988000, v0, v1, "Encountered a nil gradient property while parsing the gradient", v2, v3, v4, v5, v6);
}

- (void)parseAQIScaleNamed:data:error:.cold.12()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_0(&dword_21C988000, v0, v1, "Encountered a nil category property while parsing the categories", v2, v3, v4, v5, v6);
}

- (void)parseAQIScaleNamed:data:error:.cold.13()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_0(&dword_21C988000, v0, v1, "Encountered a nil range property in AQI scale data", v2, v3, v4, v5, v6);
}

- (void)parsedCategoryFromDictionary:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_2(&dword_21C988000, v0, v1, "encountered an empty scale category", v2, v3, v4, v5, v6);
}

- (void)parsedGradientStopFromDictionary:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_2(&dword_21C988000, v0, v1, "encountered an empty gradient stop", v2, v3, v4, v5, v6);
}

- (void)parsedGradientStopFromDictionary:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_2(&dword_21C988000, v0, v1, "encountered an gradient stop with a nil or malformed location", v2, v3, v4, v5, v6);
}

- (void)parsedGradientStopFromDictionary:.cold.3()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_2(&dword_21C988000, v0, v1, "encountered an gradient stop with a nil color", v2, v3, v4, v5, v6);
}

@end