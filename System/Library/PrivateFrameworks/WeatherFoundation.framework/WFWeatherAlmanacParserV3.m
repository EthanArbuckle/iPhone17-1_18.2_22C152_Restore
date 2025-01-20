@interface WFWeatherAlmanacParserV3
- (id)parseAlmanacForecastDataFromJson:(id)a3 location:(id)a4 date:(id)a5;
- (id)parseForecastData:(id)a3 types:(unint64_t)a4 location:(id)a5 locale:(id)a6 date:(id)a7 error:(id *)a8;
- (id)parseForecastData:(id)a3 types:(unint64_t)a4 location:(id)a5 locale:(id)a6 date:(id)a7 error:(id *)a8 rules:(id)a9;
@end

@implementation WFWeatherAlmanacParserV3

- (id)parseForecastData:(id)a3 types:(unint64_t)a4 location:(id)a5 locale:(id)a6 date:(id)a7 error:(id *)a8
{
  return [(WFWeatherAlmanacParserV3 *)self parseForecastData:a3 types:a4 location:a5 locale:a6 date:a7 error:a8 rules:0];
}

- (id)parseForecastData:(id)a3 types:(unint64_t)a4 location:(id)a5 locale:(id)a6 date:(id)a7 error:(id *)a8 rules:(id)a9
{
  v28[1] = *MEMORY[0x263EF8340];
  id v14 = a5;
  id v15 = a7;
  id v26 = 0;
  v16 = [MEMORY[0x263F08900] JSONObjectWithData:a3 options:0 error:&v26];
  id v17 = v26;
  v18 = objc_alloc_init(WFParsedForecastData);
  if (a4 == 128)
  {
    if (v16)
    {
      v19 = [(WFWeatherAlmanacParserV3 *)self parseAlmanacForecastDataFromJson:v16 location:v14 date:v15];
      [(WFParsedForecastData *)v18 setCurrentConditions:v19];

      v20 = v18;
    }
    else
    {
      v22 = WFLogForCategory(7uLL);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[WFWeatherAlmanacParserV3 parseForecastData:types:location:locale:date:error:rules:]((uint64_t)v17, v22);
      }

      if (v17)
      {
        v23 = (void *)MEMORY[0x263F087E8];
        uint64_t v27 = *MEMORY[0x263F08320];
        v28[0] = @"Failed to parse JSON forecast data";
        v24 = [NSDictionary dictionaryWithObjects:v28 forKeys:&v27 count:1];
        objc_msgSend(v23, "wf_errorWithCode:encapsulatedError:userInfo:", 1, v17, v24);
        *a8 = (id)objc_claimAutoreleasedReturnValue();
      }
      v20 = 0;
    }
  }
  else
  {
    v21 = WFLogForCategory(7uLL);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[WFWeatherAlmanacParserV3 parseForecastData:types:location:locale:date:error:rules:](v21);
    }

    objc_msgSend(MEMORY[0x263F087E8], "wf_errorWithCode:userInfo:", 6, MEMORY[0x263EFFA78]);
    v20 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v20;
}

- (id)parseAlmanacForecastDataFromJson:(id)a3 location:(id)a4 date:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  v10 = objc_alloc_init(WFWeatherConditions);
  [(WFWeatherConditions *)v10 setLocation:v9];

  [(WFWeatherConditions *)v10 setObject:v8 forKeyedSubscript:@"WFWeatherForecastDateComponent"];
  v11 = [v7 arrayForKey:@"precipitationAverage"];
  if ([v11 count])
  {
    v12 = [v11 firstObject];
    [(WFWeatherConditions *)v10 setObject:v12 forKeyedSubscript:@"WFWeatherPrecipitationAmountComponent"];
  }
  v13 = [v7 arrayForKey:@"temperatureAverageMax"];
  if ([v13 count])
  {
    id v14 = [WFTemperature alloc];
    id v15 = [v13 firstObject];
    [v15 doubleValue];
    v16 = -[WFTemperature initWithTemperatureUnit:value:](v14, "initWithTemperatureUnit:value:", 2);
    [(WFWeatherConditions *)v10 setObject:v16 forKeyedSubscript:@"WFWeatherHighTemperatureComponent"];
  }
  id v17 = [v7 arrayForKey:@"temperatureAverageMin"];
  if ([v17 count])
  {
    v18 = [WFTemperature alloc];
    v19 = [v17 firstObject];
    [v19 doubleValue];
    v20 = -[WFTemperature initWithTemperatureUnit:value:](v18, "initWithTemperatureUnit:value:", 2);
    [(WFWeatherConditions *)v10 setObject:v20 forKeyedSubscript:@"WFWeatherLowTemperatureComponent"];
  }
  return v10;
}

- (void)parseForecastData:(uint64_t)a1 types:(NSObject *)a2 location:locale:date:error:rules:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21C988000, a2, OS_LOG_TYPE_ERROR, "Failed to parse JSON data with error \"%@\"", (uint8_t *)&v2, 0xCu);
}

- (void)parseForecastData:(os_log_t)log types:location:locale:date:error:rules:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21C988000, log, OS_LOG_TYPE_ERROR, "Invalid type for parsing Almanac data", v1, 2u);
}

@end