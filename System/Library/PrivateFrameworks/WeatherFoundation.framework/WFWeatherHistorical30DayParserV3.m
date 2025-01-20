@interface WFWeatherHistorical30DayParserV3
+ (id)dateFormatter;
+ (id)daysOfWeek;
- (id)parseForecastData:(id)a3 types:(unint64_t)a4 location:(id)a5 locale:(id)a6 date:(id)a7 error:(id *)a8;
- (id)parseForecastData:(id)a3 types:(unint64_t)a4 location:(id)a5 locale:(id)a6 date:(id)a7 error:(id *)a8 rules:(id)a9;
- (id)parseHistorical30DayForecastDataFromJson:(id)a3 location:(id)a4 date:(id)a5 error:(id *)a6;
- (int64_t)getDataIndexFromFirstDayOfWeek:(id)a3 andRequestedDate:(id)a4;
@end

@implementation WFWeatherHistorical30DayParserV3

+ (id)daysOfWeek
{
  if (daysOfWeek_onceToken != -1) {
    dispatch_once(&daysOfWeek_onceToken, &__block_literal_global_23);
  }
  v2 = (void *)daysOfWeek__daysOfWeek;
  return v2;
}

void __46__WFWeatherHistorical30DayParserV3_daysOfWeek__block_invoke()
{
  v0 = (void *)daysOfWeek__daysOfWeek;
  daysOfWeek__daysOfWeek = (uint64_t)&unk_26CD65300;
}

+ (id)dateFormatter
{
  if (dateFormatter_onceToken_2 != -1) {
    dispatch_once(&dateFormatter_onceToken_2, &__block_literal_global_21);
  }
  v2 = (void *)dateFormatter_dateFormatter_2;
  return v2;
}

uint64_t __49__WFWeatherHistorical30DayParserV3_dateFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  uint64_t v1 = dateFormatter_dateFormatter_2;
  dateFormatter_dateFormatter_2 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (id)parseForecastData:(id)a3 types:(unint64_t)a4 location:(id)a5 locale:(id)a6 date:(id)a7 error:(id *)a8
{
  return [(WFWeatherHistorical30DayParserV3 *)self parseForecastData:a3 types:a4 location:a5 locale:a6 date:a7 error:a8 rules:0];
}

- (id)parseForecastData:(id)a3 types:(unint64_t)a4 location:(id)a5 locale:(id)a6 date:(id)a7 error:(id *)a8 rules:(id)a9
{
  v28[1] = *MEMORY[0x263EF8340];
  id v14 = a5;
  id v15 = a7;
  if (a4 == 64)
  {
    id v26 = 0;
    v16 = [MEMORY[0x263F08900] JSONObjectWithData:a3 options:0 error:&v26];
    id v17 = v26;
    v18 = objc_alloc_init(WFParsedForecastData);
    if (v16)
    {
      v19 = [(WFWeatherHistorical30DayParserV3 *)self parseHistorical30DayForecastDataFromJson:v16 location:v14 date:v15 error:a8];
      [(WFParsedForecastData *)v18 setCurrentConditions:v19];

      v20 = v18;
    }
    else
    {
      v22 = WFLogForCategory(7uLL);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[WFWeatherHistorical30DayParserV3 parseForecastData:types:location:locale:date:error:rules:]((uint64_t)v17, v22);
      }

      if (v17)
      {
        v23 = (void *)MEMORY[0x263F087E8];
        uint64_t v27 = *MEMORY[0x263F08320];
        v28[0] = @"Failed to parse historical 30 day JSON forecast data";
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
      -[WFWeatherHistorical30DayParserV3 parseForecastData:types:location:locale:date:error:rules:](v21);
    }

    objc_msgSend(MEMORY[0x263F087E8], "wf_errorWithCode:userInfo:", 6, MEMORY[0x263EFFA78]);
    v20 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v20;
}

- (id)parseHistorical30DayForecastDataFromJson:(id)a3 location:(id)a4 date:(id)a5 error:(id *)a6
{
  v42[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [v10 arrayForKey:@"dayOfWeek"];
  if (!v13) {
    goto LABEL_13;
  }
  id v14 = (void *)v13;
  id v15 = [v10 arrayForKey:@"dayOfWeek"];
  v16 = [v15 objectAtIndexedSubscript:0];

  if (v16)
  {
    id v17 = [v10 arrayForKey:@"dayOfWeek"];
    v18 = [v17 objectAtIndexedSubscript:0];
    int64_t v19 = [(WFWeatherHistorical30DayParserV3 *)self getDataIndexFromFirstDayOfWeek:v18 andRequestedDate:v12];

    v20 = objc_alloc_init(WFWeatherConditions);
    [(WFWeatherConditions *)v20 setLocation:v11];
    [(WFWeatherConditions *)v20 setObject:v12 forKeyedSubscript:@"WFWeatherForecastDateComponent"];
    v21 = [v10 arrayForKey:@"precip24Hour"];
    v22 = v21;
    if (v21)
    {
      v23 = [v21 objectAtIndexedSubscript:v19];

      if (v23)
      {
        v24 = [v22 objectAtIndexedSubscript:v19];
        [(WFWeatherConditions *)v20 setObject:v24 forKeyedSubscript:@"WFWeatherPrecipitationAmountComponent"];
      }
    }
    v25 = [v10 arrayForKey:@"temperatureMax"];
    id v26 = v25;
    if (v25)
    {
      uint64_t v27 = [v25 objectAtIndexedSubscript:v19];

      if (v27)
      {
        v28 = [WFTemperature alloc];
        v29 = [v26 objectAtIndexedSubscript:v19];
        [v29 doubleValue];
        v30 = -[WFTemperature initWithTemperatureUnit:value:](v28, "initWithTemperatureUnit:value:", 2);
        [(WFWeatherConditions *)v20 setObject:v30 forKeyedSubscript:@"WFWeatherHighTemperatureComponent"];
      }
    }
    v31 = [v10 arrayForKey:@"temperatureMin"];
    v32 = v31;
    if (v31)
    {
      v33 = [v31 objectAtIndexedSubscript:v19];

      if (v33)
      {
        v34 = [WFTemperature alloc];
        v35 = [v32 objectAtIndexedSubscript:v19];
        [v35 doubleValue];
        v36 = -[WFTemperature initWithTemperatureUnit:value:](v34, "initWithTemperatureUnit:value:", 2);
        [(WFWeatherConditions *)v20 setObject:v36 forKeyedSubscript:@"WFWeatherLowTemperatureComponent"];
      }
    }
  }
  else
  {
LABEL_13:
    v37 = WFLogForCategory(7uLL);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      -[WFWeatherHistorical30DayParserV3 parseHistorical30DayForecastDataFromJson:location:date:error:](v37);
    }

    v38 = (void *)MEMORY[0x263F087E8];
    uint64_t v41 = *MEMORY[0x263F07F80];
    v42[0] = @"Failed to parse last twenty-four hours of observations from response.";
    v39 = [NSDictionary dictionaryWithObjects:v42 forKeys:&v41 count:1];
    objc_msgSend(v38, "wf_errorWithCode:userInfo:", 1, v39);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

    v20 = 0;
  }

  return v20;
}

- (int64_t)getDataIndexFromFirstDayOfWeek:(id)a3 andRequestedDate:(id)a4
{
  v5 = (objc_class *)MEMORY[0x263EFF910];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(v5);
  v9 = [(id)objc_opt_class() dateFormatter];
  [v9 setDateFormat:@"EEEE"];
  id v10 = [v9 stringFromDate:v8];
  id v11 = [(id)objc_opt_class() daysOfWeek];
  uint64_t v12 = [v11 indexOfObject:v10];

  uint64_t v13 = [(id)objc_opt_class() daysOfWeek];
  uint64_t v14 = [v13 indexOfObject:v7];

  uint64_t v15 = v12 - v14;
  if (v12 - v14 < 0)
  {
    v16 = [(id)objc_opt_class() daysOfWeek];
    v15 += [v16 count];
  }
  id v17 = [MEMORY[0x263EFF8F0] currentCalendar];
  v18 = [v17 components:16 fromDate:v6 toDate:v8 options:0];

  int64_t v19 = [v18 day] - v15;
  return v19;
}

- (void)parseForecastData:(uint64_t)a1 types:(NSObject *)a2 location:locale:date:error:rules:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21C988000, a2, OS_LOG_TYPE_ERROR, "Failed to parse historical 30 day JSON data with error \"%@\"", (uint8_t *)&v2, 0xCu);
}

- (void)parseForecastData:(os_log_t)log types:location:locale:date:error:rules:.cold.2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_21C988000, log, OS_LOG_TYPE_ERROR, "Invalid type for parsing historical 30 day data", v1, 2u);
}

- (void)parseHistorical30DayForecastDataFromJson:(os_log_t)log location:date:error:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138543362;
  int v2 = @"Failed to parse last twenty-four hours of observations from response.";
  _os_log_error_impl(&dword_21C988000, log, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v1, 0xCu);
}

@end