@interface WFWeatherHistorical1DayParserV2
- (id)parseForecastConditionsFromObservations:(id)a3;
- (id)parseForecastData:(id)a3 types:(unint64_t)a4 location:(id)a5 locale:(id)a6 date:(id)a7 error:(id *)a8;
- (id)parseForecastData:(id)a3 types:(unint64_t)a4 location:(id)a5 locale:(id)a6 date:(id)a7 error:(id *)a8 rules:(id)a9;
- (id)parseHistoricalForecast:(id)a3 location:(id)a4 date:(id)a5 error:(id *)a6;
- (id)parseHistoricalForecastConditionsFromObservations:(id)a3 forDate:(id)a4;
@end

@implementation WFWeatherHistorical1DayParserV2

- (id)parseForecastData:(id)a3 types:(unint64_t)a4 location:(id)a5 locale:(id)a6 date:(id)a7 error:(id *)a8
{
  return [(WFWeatherHistorical1DayParserV2 *)self parseForecastData:a3 types:a4 location:a5 locale:a6 date:a7 error:a8 rules:0];
}

- (id)parseForecastData:(id)a3 types:(unint64_t)a4 location:(id)a5 locale:(id)a6 date:(id)a7 error:(id *)a8 rules:(id)a9
{
  v24[1] = *MEMORY[0x263EF8340];
  id v13 = a5;
  id v14 = a7;
  id v22 = 0;
  v15 = [MEMORY[0x263F08900] JSONObjectWithData:a3 options:0 error:&v22];
  id v16 = v22;
  if (v15)
  {
    v17 = [(WFWeatherHistorical1DayParserV2 *)self parseHistoricalForecast:v15 location:v13 date:v14 error:a8];
  }
  else
  {
    v18 = WFLogForCategory(7uLL);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[WFWeatherHistorical1DayParserV2 parseForecastData:types:location:locale:date:error:rules:]((uint64_t)v16, v18);
    }

    if (v16)
    {
      v19 = (void *)MEMORY[0x263F087E8];
      uint64_t v23 = *MEMORY[0x263F08320];
      v24[0] = @"Failed to parse JSON historical 1 day forecast data";
      v20 = [NSDictionary dictionaryWithObjects:v24 forKeys:&v23 count:1];
      objc_msgSend(v19, "wf_errorWithCode:encapsulatedError:userInfo:", 1, v16, v20);
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v17 = 0;
  }

  return v17;
}

- (id)parseHistoricalForecast:(id)a3 location:(id)a4 date:(id)a5 error:(id *)a6
{
  id v9 = a4;
  id v10 = a5;
  v11 = [a3 arrayForKey:@"observations"];
  if (v11)
  {
    v12 = [(WFWeatherHistorical1DayParserV2 *)self parseHistoricalForecastConditionsFromObservations:v11 forDate:v10];
    id v13 = [v12 currentConditions];
    [v13 setLocation:v9];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)parseHistoricalForecastConditionsFromObservations:(id)a3 forDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_alloc_init(WFParsedForecastData);
  id v9 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  [v7 timeIntervalSince1970];
  uint64_t v11 = v10;
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x2020000000;
  uint64_t v54 = 0;
  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x2020000000;
  v50[3] = 0x7FFFFFFFFFFFFFFFLL;
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x2020000000;
  v49[3] = 0;
  uint64_t v45 = 0;
  v46 = (double *)&v45;
  uint64_t v47 = 0x2020000000;
  unint64_t v48 = 0xC061800000000000;
  uint64_t v41 = 0;
  v42 = (double *)&v41;
  uint64_t v43 = 0x2020000000;
  uint64_t v44 = 0x4061800000000000;
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __93__WFWeatherHistorical1DayParserV2_parseHistoricalForecastConditionsFromObservations_forDate___block_invoke;
  v32[3] = &unk_264432188;
  id v12 = v9;
  id v33 = v12;
  v34 = self;
  uint64_t v40 = v11;
  v35 = v50;
  v36 = &v51;
  v37 = &v45;
  v38 = &v41;
  v39 = v49;
  [v6 enumerateObjectsUsingBlock:v32];
  [(WFParsedForecastData *)v8 setHourlyForecasts:v12];
  id v13 = [v12 objectAtIndexedSubscript:v52[3]];
  [(WFParsedForecastData *)v8 setCurrentConditions:v13];

  id v14 = [(WFParsedForecastData *)v8 currentConditions];
  v15 = [v14 objectForKeyedSubscript:@"WFWeatherForecastDateComponent"];

  if (!v15)
  {
    id v16 = [(WFParsedForecastData *)v8 currentConditions];
    [v16 setObject:v7 forKeyedSubscript:@"WFWeatherForecastDateComponent"];
  }
  v17 = [v6 lastObject];
  v18 = [v17 objectForKeyedSubscript:@"max_temp"];

  v19 = [v6 lastObject];
  v20 = [v19 objectForKeyedSubscript:@"min_temp"];

  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    if (v46[3] < v42[3]) {
      goto LABEL_9;
    }
    v21 = [WFTemperature alloc];
    id v22 = [(WFTemperature *)v21 initWithTemperatureUnit:2 value:v46[3]];
    uint64_t v23 = [(WFParsedForecastData *)v8 currentConditions];
    [v23 setObject:v22 forKeyedSubscript:@"WFWeatherHighTemperatureComponent"];

    v24 = [WFTemperature alloc];
    v25 = [(WFTemperature *)v24 initWithTemperatureUnit:2 value:v42[3]];
    v26 = [(WFParsedForecastData *)v8 currentConditions];
    [v26 setObject:v25 forKeyedSubscript:@"WFWeatherLowTemperatureComponent"];
  }
  else
  {
    v27 = [WFTemperature alloc];
    [v18 doubleValue];
    v28 = -[WFTemperature initWithTemperatureUnit:value:](v27, "initWithTemperatureUnit:value:", 2);
    v29 = [(WFParsedForecastData *)v8 currentConditions];
    [v29 setObject:v28 forKeyedSubscript:@"WFWeatherHighTemperatureComponent"];

    v30 = [WFTemperature alloc];
    [v20 doubleValue];
    v25 = -[WFTemperature initWithTemperatureUnit:value:](v30, "initWithTemperatureUnit:value:", 2);
    v26 = [(WFParsedForecastData *)v8 currentConditions];
    [v26 setObject:v25 forKeyedSubscript:@"WFWeatherLowTemperatureComponent"];
  }

LABEL_9:
  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(v49, 8);
  _Block_object_dispose(v50, 8);
  _Block_object_dispose(&v51, 8);

  return v8;
}

void __93__WFWeatherHistorical1DayParserV2_parseHistoricalForecastConditionsFromObservations_forDate___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v20 = a2;
  v5 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) parseForecastConditionsFromObservations:v20];
  [v5 addObject:v6];

  id v7 = [v20 numberForKey:@"valid_time_gmt"];
  v8 = v7;
  if (v7)
  {
    uint64_t v9 = (uint64_t)vabdd_f64(*(double *)(a1 + 88), (double)[v7 integerValue]);
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    if (*(void *)(v10 + 24) > v9)
    {
      *(void *)(v10 + 24) = v9;
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a3;
    }
  }
  uint64_t v11 = [v20 numberForKey:@"temp"];
  id v12 = v11;
  if (v11)
  {
    double v13 = *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    [v11 doubleValue];
    if (v13 >= v14) {
      double v14 = v13;
    }
    *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v14;
    double v15 = *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    [v12 doubleValue];
    if (v15 < v16) {
      double v16 = v15;
    }
    *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v16;
  }
  v17 = [v20 numberForKey:@"precip_hrly"];
  v18 = v17;
  if (v17)
  {
    [v17 doubleValue];
    *(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = v19
                                                                + *(double *)(*(void *)(*(void *)(a1 + 80) + 8)
                                                                            + 24);
  }
}

- (id)parseForecastConditionsFromObservations:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(WFWeatherConditions);
  v5 = [v3 numberForKey:@"valid_time_gmt"];
  id v6 = v5;
  if (v5)
  {
    id v7 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v5, "unsignedIntegerValue"));
    [(WFWeatherConditions *)v4 setObject:v7 forKeyedSubscript:@"WFWeatherForecastDateComponent"];
  }
  v8 = [v3 numberForKey:@"expire_time_gmt"];

  if (v8)
  {
    uint64_t v9 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v8, "unsignedIntegerValue"));
    [(WFWeatherConditions *)v4 setObject:v9 forKeyedSubscript:@"WFWeatherForecastExpirationDateComponent"];
  }
  uint64_t v10 = [v3 numberForKey:@"wx_icon"];
  if (v10)
  {
    [(WFWeatherConditions *)v4 setObject:v10 forKeyedSubscript:@"__THIS_WILL_BE_DEPRECATED__WFWeatherLegacyConditionComponent"];
    uint64_t v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", WFConditionCodeFromLegacyWeatherConditionCode(objc_msgSend(v10, "unsignedIntegerValue")));
    [(WFWeatherConditions *)v4 setObject:v11 forKeyedSubscript:@"WFWeatherConditionComponent"];
  }
  id v12 = [v3 numberForKey:@"rh"];
  [(WFWeatherConditions *)v4 setObject:v12 forKeyedSubscript:@"WFWeatherHumidityComponent"];

  double v13 = [v3 numberForKey:@"dewPt"];
  if (v13)
  {
    [(WFWeatherConditions *)v4 setObject:v13 forKeyedSubscript:@"WFWeatherDewpointComponent"];
    double v14 = [WFTemperature alloc];
    [v13 doubleValue];
    double v15 = -[WFTemperature initWithTemperatureUnit:value:](v14, "initWithTemperatureUnit:value:", 2);
    [(WFWeatherConditions *)v4 setObject:v15 forKeyedSubscript:@"WFWeatherDewpointTemperatureComponent"];
  }
  double v16 = [v3 numberForKey:@"precip_hrly"];
  if (v16
    || ([v3 numberForKey:@"precip_total"],
        (double v16 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    [(WFWeatherConditions *)v4 setObject:v16 forKeyedSubscript:@"WFWeatherPrecipitationAmountComponent"];
  }
  v17 = [v3 numberForKey:@"temp"];
  if (v17)
  {
    v18 = [WFTemperature alloc];
    [v17 doubleValue];
    double v19 = -[WFTemperature initWithTemperatureUnit:value:](v18, "initWithTemperatureUnit:value:", 2);
    [(WFWeatherConditions *)v4 setObject:v19 forKeyedSubscript:@"WFWeatherTemperatureComponent"];
  }
  id v20 = [v3 numberForKey:@"feels_like"];

  if (v20)
  {
    v21 = [WFTemperature alloc];
    [v20 doubleValue];
    id v22 = -[WFTemperature initWithTemperatureUnit:value:](v21, "initWithTemperatureUnit:value:", 2);
    [(WFWeatherConditions *)v4 setObject:v22 forKeyedSubscript:@"WFWeatherFeelsLikeTemperatureComponent"];
  }
  uint64_t v23 = [v3 numberForKey:@"uv_index"];
  [(WFWeatherConditions *)v4 setObject:v23 forKeyedSubscript:@"WFWeatherUVIndexComponent"];

  v24 = [v3 numberForKey:@"vis"];
  if (v24) {
    [(WFWeatherConditions *)v4 setObject:v24 forKeyedSubscript:@"WFWeatherVisibilityComponent"];
  }
  v25 = [v3 numberForKey:@"wdir"];
  [(WFWeatherConditions *)v4 setObject:v25 forKeyedSubscript:@"WFWeatherWindDirectionComponent"];

  v26 = [v3 numberForKey:@"wspd"];
  if (v26) {
    [(WFWeatherConditions *)v4 setObject:v26 forKeyedSubscript:@"WFWeatherWindSpeedComponent"];
  }
  v27 = [v3 numberForKey:@"pressure"];
  if (v27) {
    [(WFWeatherConditions *)v4 setObject:v27 forKeyedSubscript:@"WFWeatherPressureComponent"];
  }
  v28 = [v3 numberForKey:@"pressure_tend"];
  if (v28) {
    [(WFWeatherConditions *)v4 setObject:v28 forKeyedSubscript:@"WFWeatherPressureTrendComponent"];
  }

  return v4;
}

- (void)parseForecastData:(uint64_t)a1 types:(NSObject *)a2 location:locale:date:error:rules:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21C988000, a2, OS_LOG_TYPE_ERROR, "Failed to parse JSON historical 1 day forecast data with error \"%@\"", (uint8_t *)&v2, 0xCu);
}

@end