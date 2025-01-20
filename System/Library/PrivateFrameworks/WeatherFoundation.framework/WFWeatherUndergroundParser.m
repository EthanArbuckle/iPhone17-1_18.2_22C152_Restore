@interface WFWeatherUndergroundParser
+ (NSSet)componentsForCurrentForecast;
+ (NSSet)componentsForDailyForecasts;
+ (NSSet)componentsForHourlyForecasts;
+ (unint64_t)conditionFromWeatherUndergroundPhrase:(id)a3;
+ (unint64_t)expectedDailyForecastCount;
+ (unint64_t)expectedHourlyForecastCount;
- (id)dateFromUTCDict:(id)a3 toUnitGranularity:(unint64_t)a4;
- (id)parseForecastData:(id)a3 types:(unint64_t)a4 location:(id)a5 locale:(id)a6 date:(id)a7 error:(id *)a8;
- (id)parseForecastData:(id)a3 types:(unint64_t)a4 location:(id)a5 locale:(id)a6 date:(id)a7 error:(id *)a8 rules:(id)a9;
- (id)parseHistoricalForecast:(id)a3 error:(id *)a4;
- (id)sanitizedNumberForKeyPath:(id)a3 dict:(id)a4;
- (id)sanitizedTemperatureForCelsiusKeyPath:(id)a3 fahrenheitKeyPath:(id)a4 dict:(id)a5;
- (void)logParsingErrorAtKeyPath:(id)a3 error:(id *)a4;
@end

@implementation WFWeatherUndergroundParser

- (id)parseForecastData:(id)a3 types:(unint64_t)a4 location:(id)a5 locale:(id)a6 date:(id)a7 error:(id *)a8
{
  return [(WFWeatherUndergroundParser *)self parseForecastData:a3 types:a4 location:a5 locale:a6 date:a7 error:a8 rules:0];
}

- (id)parseForecastData:(id)a3 types:(unint64_t)a4 location:(id)a5 locale:(id)a6 date:(id)a7 error:(id *)a8 rules:(id)a9
{
  v26[1] = *MEMORY[0x263EF8340];
  id v24 = 0;
  v11 = objc_msgSend(MEMORY[0x263F08900], "JSONObjectWithData:options:error:", a3, 0, &v24, a6, a7);
  id v12 = v24;
  if (v11)
  {
    v13 = [(WFWeatherUndergroundParser *)self parseHistoricalForecast:v11 error:a8];
  }
  else
  {
    v14 = WFLogForCategory(7uLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[WFWeatherUndergroundParser parseForecastData:types:location:locale:date:error:rules:]((uint64_t)v12, v14, v15, v16, v17, v18, v19, v20);
    }

    if (v12)
    {
      v21 = (void *)MEMORY[0x263F087E8];
      uint64_t v25 = *MEMORY[0x263F08320];
      v26[0] = @"Failed to parse JSON forecast data";
      v22 = [NSDictionary dictionaryWithObjects:v26 forKeys:&v25 count:1];
      objc_msgSend(v21, "wf_errorWithCode:encapsulatedError:userInfo:", 1, v12, v22);
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = 0;
  }

  return v13;
}

+ (unint64_t)expectedHourlyForecastCount
{
  return 24;
}

+ (unint64_t)expectedDailyForecastCount
{
  return 0;
}

+ (NSSet)componentsForCurrentForecast
{
  v6[12] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"WFWeatherForecastDateComponent";
  v6[1] = @"WFWeatherTemperatureComponent";
  v6[2] = @"WFWeatherHighTemperatureComponent";
  v6[3] = @"WFWeatherLowTemperatureComponent";
  v6[4] = @"WFWeatherWindSpeedComponent";
  v6[5] = @"WFWeatherWindDirectionComponent";
  v6[6] = @"WFWeatherPrecipitationAmountComponent";
  v6[7] = @"WFWeatherDewpointComponent";
  v6[8] = @"WFWeatherVisibilityComponent";
  v6[9] = @"WFWeatherPressureComponent";
  v6[10] = @"WFWeatherSunsetDateComponent";
  v6[11] = @"WFWeatherSunriseDateComponent";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:12];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (NSSet)componentsForHourlyForecasts
{
  v6[12] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"WFWeatherForecastDateComponent";
  v6[1] = @"WFWeatherConditionComponent";
  v6[2] = @"WFWeatherTemperatureComponent";
  v6[3] = @"WFWeatherWindSpeedComponent";
  v6[4] = @"WFWeatherWindDirectionComponent";
  v6[5] = @"WFWeatherPrecipitationAmountComponent";
  v6[6] = @"WFWeatherHumidityComponent";
  v6[7] = @"WFWeatherDewpointComponent";
  v6[8] = @"WFWeatherVisibilityComponent";
  v6[9] = @"WFWeatherPressureComponent";
  v6[10] = @"WFWeatherSunsetDateComponent";
  v6[11] = @"WFWeatherSunriseDateComponent";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:12];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (NSSet)componentsForDailyForecasts
{
  return 0;
}

- (id)parseHistoricalForecast:(id)a3 error:(id *)a4
{
  v65[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = objc_msgSend(v6, "wf_stringForKeyPath:", &unk_26CD64FB8);
  if (v7)
  {
    v8 = WFLogForCategory(7uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[WFWeatherUndergroundParser parseHistoricalForecast:error:]((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);
    }

    if (!a4)
    {
      uint64_t v17 = 0;
      goto LABEL_24;
    }
    uint64_t v15 = (void *)MEMORY[0x263F087E8];
    uint64_t v64 = *MEMORY[0x263F08320];
    v65[0] = v7;
    uint64_t v16 = [NSDictionary dictionaryWithObjects:v65 forKeys:&v64 count:1];
    objc_msgSend(v15, "wf_errorWithCode:userInfo:", 1, v16);
    uint64_t v17 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v16 = objc_msgSend(v6, "wf_dictionaryForKeyPath:", &unk_26CD64FD0);
    if (v16)
    {
      uint64_t v18 = objc_alloc_init(WFParsedForecastData);
      uint64_t v19 = objc_msgSend(v16, "wf_arrayForKeyPath:", &unk_26CD65000);
      uint64_t v20 = [v19 firstObject];

      if (v20)
      {
        v21 = objc_alloc_init(WFWeatherConditions);
        v22 = objc_msgSend(v16, "wf_dictionaryForKeyPath:", &unk_26CD65018);
        v23 = [(WFWeatherUndergroundParser *)self dateFromUTCDict:v22 toUnitGranularity:16];
        -[WFWeatherConditions setValue:forComponent:](v21, "setValue:forComponent:", v23);

        id v24 = [(WFWeatherUndergroundParser *)self sanitizedTemperatureForCelsiusKeyPath:&unk_26CD65030 fahrenheitKeyPath:&unk_26CD65048 dict:v20];
        -[WFWeatherConditions setValue:forComponent:](v21, "setValue:forComponent:", v24);

        uint64_t v25 = [(WFWeatherUndergroundParser *)self sanitizedTemperatureForCelsiusKeyPath:&unk_26CD65060 fahrenheitKeyPath:&unk_26CD65078 dict:v20];
        [(WFWeatherConditions *)v21 setValue:v25 forComponent:@"WFWeatherHighTemperatureComponent"];

        v26 = [(WFWeatherUndergroundParser *)self sanitizedTemperatureForCelsiusKeyPath:&unk_26CD65090 fahrenheitKeyPath:&unk_26CD650A8 dict:v20];
        [(WFWeatherConditions *)v21 setValue:v26 forComponent:@"WFWeatherLowTemperatureComponent"];

        v27 = [(WFWeatherUndergroundParser *)self sanitizedNumberForKeyPath:&unk_26CD650C0 dict:v20];
        -[WFWeatherConditions setValue:forComponent:](v21, "setValue:forComponent:", v27);

        v28 = [(WFWeatherUndergroundParser *)self sanitizedNumberForKeyPath:&unk_26CD650D8 dict:v20];
        -[WFWeatherConditions setValue:forComponent:](v21, "setValue:forComponent:", v28);

        v29 = [(WFWeatherUndergroundParser *)self sanitizedNumberForKeyPath:&unk_26CD650F0 dict:v20];
        -[WFWeatherConditions setValue:forComponent:](v21, "setValue:forComponent:", v29);

        v30 = [(WFWeatherUndergroundParser *)self sanitizedNumberForKeyPath:&unk_26CD65108 dict:v20];
        -[WFWeatherConditions setValue:forComponent:](v21, "setValue:forComponent:", v30);

        v31 = [(WFWeatherUndergroundParser *)self sanitizedNumberForKeyPath:&unk_26CD65120 dict:v20];
        -[WFWeatherConditions setValue:forComponent:](v21, "setValue:forComponent:", v31);

        v56 = v20;
        v32 = [(WFWeatherUndergroundParser *)self sanitizedNumberForKeyPath:&unk_26CD65138 dict:v20];
        -[WFWeatherConditions setValue:forComponent:](v21, "setValue:forComponent:", v32);

        [(WFParsedForecastData *)v18 setCurrentConditions:v21];
        v33 = objc_msgSend(v16, "wf_arrayForKeyPath:", &unk_26CD65168);
        if ([v33 count])
        {
          v54 = v18;
          id v55 = v6;
          v58 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v33, "count"));
          long long v59 = 0u;
          long long v60 = 0u;
          long long v61 = 0u;
          long long v62 = 0u;
          v53 = v33;
          id obj = v33;
          uint64_t v34 = [obj countByEnumeratingWithState:&v59 objects:v63 count:16];
          if (v34)
          {
            uint64_t v35 = v34;
            uint64_t v36 = *(void *)v60;
            do
            {
              for (uint64_t i = 0; i != v35; ++i)
              {
                if (*(void *)v60 != v36) {
                  objc_enumerationMutation(obj);
                }
                v38 = *(void **)(*((void *)&v59 + 1) + 8 * i);
                v39 = objc_alloc_init(WFWeatherConditions);
                v40 = objc_msgSend(v38, "wf_dictionaryForKeyPath:", &unk_26CD65180);
                v41 = [(WFWeatherUndergroundParser *)self dateFromUTCDict:v40 toUnitGranularity:32];
                [(WFWeatherConditions *)v39 setValue:v41 forComponent:@"WFWeatherForecastDateComponent"];

                v42 = [(WFWeatherUndergroundParser *)self sanitizedTemperatureForCelsiusKeyPath:&unk_26CD65198 fahrenheitKeyPath:&unk_26CD651B0 dict:v38];
                [(WFWeatherConditions *)v39 setValue:v42 forComponent:@"WFWeatherTemperatureComponent"];

                v43 = [(WFWeatherUndergroundParser *)self sanitizedNumberForKeyPath:&unk_26CD651C8 dict:v38];
                [(WFWeatherConditions *)v39 setValue:v43 forComponent:@"WFWeatherWindSpeedComponent"];

                v44 = [(WFWeatherUndergroundParser *)self sanitizedNumberForKeyPath:&unk_26CD651E0 dict:v38];
                [(WFWeatherConditions *)v39 setValue:v44 forComponent:@"WFWeatherWindDirectionComponent"];

                unint64_t v45 = +[WFWeatherUndergroundParser conditionFromWeatherUndergroundPhrase:@"conds"];
                v46 = [NSNumber numberWithUnsignedInteger:v45];
                [(WFWeatherConditions *)v39 setValue:v46 forComponent:@"WFWeatherConditionComponent"];

                v47 = [(WFWeatherUndergroundParser *)self sanitizedNumberForKeyPath:&unk_26CD651F8 dict:v38];
                [(WFWeatherConditions *)v39 setValue:v47 forComponent:@"WFWeatherVisibilityComponent"];

                v48 = [(WFWeatherUndergroundParser *)self sanitizedNumberForKeyPath:&unk_26CD65210 dict:v38];
                [(WFWeatherConditions *)v39 setValue:v48 forComponent:@"WFWeatherPressureComponent"];

                v49 = [(WFWeatherUndergroundParser *)self sanitizedNumberForKeyPath:&unk_26CD65228 dict:v38];
                [(WFWeatherConditions *)v39 setValue:v49 forComponent:@"WFWeatherDewpointComponent"];

                v50 = [(WFWeatherUndergroundParser *)self sanitizedNumberForKeyPath:&unk_26CD65240 dict:v38];
                [(WFWeatherConditions *)v39 setValue:v50 forComponent:@"WFWeatherHumidityComponent"];

                v51 = [(WFWeatherUndergroundParser *)self sanitizedNumberForKeyPath:&unk_26CD65258 dict:v38];
                [(WFWeatherConditions *)v39 setValue:v51 forComponent:@"WFWeatherPrecipitationAmountComponent"];

                [v58 addObject:v39];
              }
              uint64_t v35 = [obj countByEnumeratingWithState:&v59 objects:v63 count:16];
            }
            while (v35);
          }

          uint64_t v18 = v54;
          [(WFParsedForecastData *)v54 setHourlyForecasts:v58];

          uint64_t v17 = v54;
          id v6 = v55;
          v33 = v53;
        }
        else
        {
          [(WFWeatherUndergroundParser *)self logParsingErrorAtKeyPath:&unk_26CD65270 error:a4];
          uint64_t v17 = 0;
        }

        uint64_t v20 = v56;
      }
      else
      {
        [(WFWeatherUndergroundParser *)self logParsingErrorAtKeyPath:&unk_26CD65150 error:a4];
        uint64_t v17 = 0;
      }
    }
    else
    {
      [(WFWeatherUndergroundParser *)self logParsingErrorAtKeyPath:&unk_26CD64FE8 error:a4];
      uint64_t v17 = 0;
    }
  }

LABEL_24:
  return v17;
}

- (void)logParsingErrorAtKeyPath:(id)a3 error:(id *)a4
{
  v18[1] = *MEMORY[0x263EF8340];
  v5 = NSString;
  id v6 = +[WFForecastDataParserUtils stringFromKeyPath:a3];
  v7 = [v5 stringWithFormat:@"Missing object at key path %@", v6];

  v8 = WFLogForCategory(7uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[WFWeatherUndergroundParser logParsingErrorAtKeyPath:error:]((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);
  }

  if (a4)
  {
    uint64_t v15 = (void *)MEMORY[0x263F087E8];
    uint64_t v17 = *MEMORY[0x263F08320];
    v18[0] = v7;
    uint64_t v16 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
    objc_msgSend(v15, "wf_errorWithCode:userInfo:", 1, v16);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)sanitizedNumberForKeyPath:(id)a3 dict:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_msgSend(v6, "wf_integerForKeyPath:", v5);
  v8 = 0;
  if (v7 != -9999 && v7 != -999)
  {
    uint64_t v9 = NSNumber;
    objc_msgSend(v6, "wf_floatForKeyPath:", v5);
    v8 = objc_msgSend(v9, "numberWithFloat:");
  }

  return v8;
}

- (id)sanitizedTemperatureForCelsiusKeyPath:(id)a3 fahrenheitKeyPath:(id)a4 dict:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [(WFWeatherUndergroundParser *)self sanitizedNumberForKeyPath:a4 dict:v8];
  uint64_t v11 = [(WFWeatherUndergroundParser *)self sanitizedNumberForKeyPath:v9 dict:v8];

  if (v10 | v11)
  {
    uint64_t v12 = objc_opt_new();
    if (v11)
    {
      [(id)v11 floatValue];
      [v12 setCelsius:v13];
    }
    if (v10)
    {
      [(id)v10 floatValue];
      [v12 setFahrenheit:v14];
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

+ (unint64_t)conditionFromWeatherUndergroundPhrase:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"^(Light|Heavy)\\s" options:0 error:0];
  id v5 = objc_msgSend(v4, "firstMatchInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
  id v6 = v5;
  uint64_t v7 = v3;
  if (v5)
  {
    uint64_t v8 = [v5 rangeAtIndex:1];
    uint64_t v7 = objc_msgSend(v3, "substringWithRange:", v8, v9);

    [v6 range];
    uint64_t v11 = v10;
    uint64_t v12 = [v3 length];
    [v6 range];
    objc_msgSend(v3, "substringWithRange:", v11, v12 - v13);
  }
  if ([v7 isEqual:@"Drizzle"]) {
    goto LABEL_4;
  }
  if ([v7 isEqual:@"Rain"])
  {
    unint64_t v14 = 13;
    goto LABEL_20;
  }
  if ([v7 isEqual:@"Snow"])
  {
    unint64_t v14 = 17;
    goto LABEL_20;
  }
  if ([v7 isEqual:@"Snow Grains"])
  {
    unint64_t v14 = 14;
    goto LABEL_20;
  }
  if ([v7 isEqual:@"Ice Crystals"])
  {
    unint64_t v14 = 19;
    goto LABEL_20;
  }
  if (([v7 isEqual:@"Ice Pellets"] & 1) != 0
    || ([v7 isEqual:@"Hail"] & 1) != 0)
  {
LABEL_15:
    unint64_t v14 = 18;
    goto LABEL_20;
  }
  if (([v7 isEqual:@"Mist"] & 1) != 0
    || ([v7 isEqual:@"Fog"] & 1) != 0
    || ([v7 isEqual:@"Fog Patches"] & 1) != 0)
  {
LABEL_19:
    unint64_t v14 = 21;
    goto LABEL_20;
  }
  if (([v7 isEqual:@"Smoke"] & 1) != 0
    || ([v7 isEqual:@"Volcanic Ash"] & 1) != 0)
  {
    unint64_t v14 = 23;
    goto LABEL_20;
  }
  if (([v7 isEqual:@"Widespread Dust"] & 1) != 0
    || ([v7 isEqual:@"Sand"] & 1) != 0)
  {
    goto LABEL_26;
  }
  if ([v7 isEqual:@"Haze"])
  {
    unint64_t v14 = 22;
    goto LABEL_20;
  }
  if ([v7 isEqual:@"Spray"]) {
    goto LABEL_19;
  }
  if (([v7 isEqual:@"Dust Whirls"] & 1) != 0
    || ([v7 isEqual:@"Sandstorm"] & 1) != 0)
  {
    goto LABEL_26;
  }
  if ([v7 isEqual:@"Low Drifting Snow"]) {
    goto LABEL_33;
  }
  if (([v7 isEqual:@"Low Drifting Widespread Dust"] & 1) != 0
    || ([v7 isEqual:@"Low Drifting Sand"] & 1) != 0)
  {
    goto LABEL_26;
  }
  if ([v7 isEqual:@"Blowing Snow"]) {
    goto LABEL_33;
  }
  if (([v7 isEqual:@"Blowing Widespread Dust"] & 1) != 0
    || ([v7 isEqual:@"Blowing Sand"] & 1) != 0)
  {
LABEL_26:
    unint64_t v14 = 20;
    goto LABEL_20;
  }
  if ([v7 isEqual:@"Rain Mist"])
  {
LABEL_4:
    unint64_t v14 = 10;
    goto LABEL_20;
  }
  if ([v7 isEqual:@"Rain Showers"])
  {
    unint64_t v14 = 12;
    goto LABEL_20;
  }
  if ([v7 isEqual:@"Snow Showers"])
  {
    unint64_t v14 = 15;
    goto LABEL_20;
  }
  if ([v7 isEqual:@"Snow Blowing Snow Mist"])
  {
LABEL_33:
    unint64_t v14 = 16;
    goto LABEL_20;
  }
  if (([v7 isEqual:@"Ice Pellet Showers"] & 1) != 0
    || ([v7 isEqual:@"Hail Showers"] & 1) != 0)
  {
    unint64_t v14 = 36;
    goto LABEL_20;
  }
  if ([v7 isEqual:@"Small Hail Showers"]) {
    goto LABEL_15;
  }
  if (([v7 isEqual:@"Thunderstorm"] & 1) != 0
    || ([v7 isEqual:@"Thunderstorms and Rain"] & 1) != 0
    || ([v7 isEqual:@"Thunderstorms and Snow"] & 1) != 0
    || ([v7 isEqual:@"Thunderstorms and Ice Pellets"] & 1) != 0
    || ([v7 isEqual:@"Thunderstorms with Hail"] & 1) != 0
    || ([v7 isEqual:@"Thunderstorms with Small Hail"] & 1) != 0)
  {
    unint64_t v14 = 5;
    goto LABEL_20;
  }
  if ([v7 isEqual:@"Freezing Drizzle"])
  {
    unint64_t v14 = 9;
    goto LABEL_20;
  }
  if ([v7 isEqual:@"Freezing Rain"])
  {
    unint64_t v14 = 11;
    goto LABEL_20;
  }
  if (([v7 isEqual:@"Freezing Fog"] & 1) != 0
    || ([v7 isEqual:@"Patches of Fog"] & 1) != 0
    || ([v7 isEqual:@"Shallow Fog"] & 1) != 0
    || ([v7 isEqual:@"Partial Fog"] & 1) != 0)
  {
    goto LABEL_19;
  }
  if ([v7 isEqual:@"Overcast"])
  {
    unint64_t v14 = 27;
    goto LABEL_20;
  }
  if ([v7 isEqual:@"Clear"])
  {
    unint64_t v14 = 33;
    goto LABEL_20;
  }
  if ([v7 isEqual:@"Partly Cloudy"]) {
    goto LABEL_72;
  }
  if ([v7 isEqual:@"Mostly Cloudy"]) {
    goto LABEL_70;
  }
  if ([v7 isEqual:@"Scattered Clouds"])
  {
LABEL_72:
    unint64_t v14 = 31;
    goto LABEL_20;
  }
  if ([v7 isEqual:@"Small Hail"]) {
    goto LABEL_15;
  }
  if ([v7 isEqual:@"Squalls"])
  {
LABEL_70:
    unint64_t v14 = 29;
    goto LABEL_20;
  }
  if ([v7 isEqual:@"Funnel Cloud"])
  {
    unint64_t v14 = 1;
  }
  else
  {
    if (([v7 isEqual:@"Unknown Precipitation"] & 1) == 0) {
      [v7 isEqual:@"Unknown"];
    }
    unint64_t v14 = 0;
  }
LABEL_20:

  return v14;
}

- (id)dateFromUTCDict:(id)a3 toUnitGranularity:(unint64_t)a4
{
  id v5 = a3;
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF918]);
    *((void *)&v7 + 1) = a4;
    *(void *)&long long v7 = a4 - 4;
    switch((unint64_t)(v7 >> 2))
    {
      case 0uLL:
        goto LABEL_7;
      case 1uLL:
        goto LABEL_6;
      case 3uLL:
        goto LABEL_5;
      case 7uLL:
        goto LABEL_4;
      default:
        objc_msgSend(v6, "setMinute:", objc_msgSend(v5, "wf_integerForKeyPath:", &unk_26CD65288));
LABEL_4:
        objc_msgSend(v6, "setHour:", objc_msgSend(v5, "wf_integerForKeyPath:", &unk_26CD652A0));
LABEL_5:
        objc_msgSend(v6, "setDay:", objc_msgSend(v5, "wf_integerForKeyPath:", &unk_26CD652B8));
LABEL_6:
        objc_msgSend(v6, "setMonth:", objc_msgSend(v5, "wf_integerForKeyPath:", &unk_26CD652D0));
LABEL_7:
        objc_msgSend(v6, "setYear:", objc_msgSend(v5, "wf_integerForKeyPath:", &unk_26CD652E8));
        uint64_t v8 = +[WFWeatherConditions calendar];
        uint64_t v9 = [v8 dateFromComponents:v6];

        break;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (void)parseForecastData:(uint64_t)a3 types:(uint64_t)a4 location:(uint64_t)a5 locale:(uint64_t)a6 date:(uint64_t)a7 error:(uint64_t)a8 rules:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)parseHistoricalForecast:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)logParsingErrorAtKeyPath:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end