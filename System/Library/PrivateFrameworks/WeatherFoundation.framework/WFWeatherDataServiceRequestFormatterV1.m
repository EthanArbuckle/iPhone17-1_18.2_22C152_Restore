@interface WFWeatherDataServiceRequestFormatterV1
+ (id)aqiRequestForScaleNamed:(id)a3 language:(id)a4;
+ (id)forecastRequest:(unint64_t)a3 forLocation:(id)a4 locale:(id)a5 date:(id)a6;
+ (id)forecastRequest:(unint64_t)a3 forLocation:(id)a4 withUnits:(int)a5 locale:(id)a6 date:(id)a7 rules:(id)a8 options:(id)a9;
+ (id)geocodePathForLocation:(id)a3 rules:(id)a4;
+ (id)hostURLForEnvironment:(id)a3;
+ (id)hostURLForService;
+ (id)languagePathForLocale:(id)a3;
@end

@implementation WFWeatherDataServiceRequestFormatterV1

+ (id)hostURLForEnvironment:(id)a3
{
  v3 = WeatherFoundationInternalUserDefaults();
  v4 = [v3 stringForKey:@"WDSEndpointOverride"];

  if (v4 && ([v4 isEqualToString:@"default"] & 1) == 0)
  {
    id v9 = [NSURL URLWithString:v4];
  }
  else
  {
    v5 = WeatherFoundationInternalUserDefaults();
    v6 = [v5 stringForKey:@"WDSEnvironment"];

    if ([v6 isEqualToString:@"wdsv1_prod_origin"])
    {
      v7 = NSURL;
      v8 = @"https://weather-data-origin.apple.com";
    }
    else if ([v6 isEqualToString:@"wdsv1_dev"])
    {
      v7 = NSURL;
      v8 = @"https://devel.weather-data.newsapps.apple.com";
    }
    else if ([v6 isEqualToString:@"wdsv1_test"])
    {
      v7 = NSURL;
      v8 = @"https://test.weather-data.newsapps.apple.com";
    }
    else if ([v6 isEqualToString:@"wdsv1_qa"])
    {
      v7 = NSURL;
      v8 = @"https://qa.weather-data.newsapps.apple.com";
    }
    else
    {
      int v10 = [v6 isEqualToString:@"wdsv1_staging"];
      v7 = NSURL;
      if (v10) {
        v8 = @"https://staging-weather-data.apple.com";
      }
      else {
        v8 = @"https://weather-data.apple.com";
      }
    }
    id v9 = [v7 URLWithString:v8];
  }
  return v9;
}

+ (id)hostURLForService
{
  v2 = objc_opt_class();
  return (id)[v2 hostURLForEnvironment:0];
}

+ (id)forecastRequest:(unint64_t)a3 forLocation:(id)a4 locale:(id)a5 date:(id)a6
{
  return (id)[a1 forecastRequest:a3 forLocation:a4 withUnits:0 locale:a5 date:a6 rules:0 options:0];
}

+ (id)forecastRequest:(unint64_t)a3 forLocation:(id)a4 withUnits:(int)a5 locale:(id)a6 date:(id)a7 rules:(id)a8 options:(id)a9
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v18 = v14;
  id v19 = a9;
  v20 = [v14 geoLocation];

  if (v20)
  {
    v69 = v19;
    v21 = +[WFWeatherConditions calendar];
    v22 = [v21 copy];

    v23 = [v18 timeZone];
    id v70 = v15;
    if (v23)
    {
      [v22 setTimeZone:v23];
    }
    else
    {
      v27 = [MEMORY[0x263EFFA18] systemTimeZone];
      [v22 setTimeZone:v27];
    }
    v64 = v22;
    id v65 = v16;
    v28 = [v22 components:28 fromDate:v16];
    v29 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v28, "year"));
    v68 = [v29 stringValue];

    v30 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v28, "day"));
    v72 = [v30 stringValue];

    v31 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v28, "month"));
    v71 = [v31 stringValue];

    v32 = [MEMORY[0x263EFF980] arrayWithCapacity:12];
    id v33 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    unint64_t v34 = a3;
    v63 = v28;
    if (WFForecastTypeIsRequestedInTypes(1, a3))
    {
      if (v17 && ![v18 shouldQueryForAirQualityData])
      {
        if (WFForecastTypeIsSingleType(a3))
        {
          v24 = v17;
          id v26 = 0;
          id v19 = v69;
          id v15 = v70;
LABEL_54:

          v25 = v64;
          id v16 = v65;
          goto LABEL_55;
        }
        v59 = WFLogForCategory(2uLL);
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v76 = v18;
          _os_log_impl(&dword_21C988000, v59, OS_LOG_TYPE_DEFAULT, "AQI is not enabled for the location. AQI will not be requested. location=%{public}@", buf, 0xCu);
        }

        unint64_t v34 = a3;
      }
      else
      {
        unint64_t v34 = a3 & 0xFFFFFFFFFFFFFFFELL;
        [v32 addObject:@"air_quality"];
      }
    }
    if (WFForecastTypeIsRequestedInTypes(2, v34))
    {
      v34 &= ~2uLL;
      [v32 addObject:@"current_observations"];
    }
    if (WFForecastTypeIsRequestedInTypes(4, v34))
    {
      v34 &= ~4uLL;
      [v32 addObject:@"hourly_forecast"];
    }
    if (WFForecastTypeIsRequestedInTypes(8, v34))
    {
      v34 &= ~8uLL;
      [v32 addObject:@"daily_forecast"];
    }
    if (WFForecastTypeIsRequestedInTypes(256, v34))
    {
      v34 &= ~0x100uLL;
      [v32 addObject:@"now_links"];
    }
    if (WFForecastTypeIsRequestedInTypes(16, v34))
    {
      v34 &= ~0x10uLL;
      [v32 addObject:@"primaryPollutant"];
    }
    if (WFForecastTypeIsRequestedInTypes(64, v34))
    {
      v34 &= ~0x40uLL;
      [v32 addObject:@"daily_history"];
      v35 = [MEMORY[0x263F08BD0] queryItemWithName:@"dayOfMonth" value:v72];
      [v33 addObject:v35];

      v36 = [MEMORY[0x263F08BD0] queryItemWithName:@"month" value:v71];
      [v33 addObject:v36];

      v37 = [MEMORY[0x263F08BD0] queryItemWithName:@"year" value:v68];
      [v33 addObject:v37];
    }
    if (WFForecastTypeIsRequestedInTypes(128, v34))
    {
      v34 &= ~0x80uLL;
      [v32 addObject:@"daily_almanac"];
      v38 = [MEMORY[0x263F08BD0] queryItemWithName:@"dayOfMonth" value:v72];
      [v33 addObject:v38];

      v39 = [MEMORY[0x263F08BD0] queryItemWithName:@"month" value:v71];
      [v33 addObject:v39];
    }
    if (WFForecastTypeIsRequestedInTypes(512, v34))
    {
      v34 &= ~0x200uLL;
      [v32 addObject:@"weather_change"];
    }
    if (WFForecastTypeIsRequestedInTypes(1024, v34))
    {
      v34 &= ~0x400uLL;
      [v32 addObject:@"severe_weather"];
    }
    if (WFForecastTypeIsRequestedInTypes(2048, v34))
    {
      v34 &= ~0x800uLL;
      [v32 addObject:@"next_hour_forecast"];
    }
    if (v34)
    {
      v40 = WFLogForCategory(0);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
        +[WFWeatherDataServiceRequestFormatterV1 forecastRequest:forLocation:withUnits:locale:date:rules:options:]();
      }
    }
    if (![v32 count])
    {
      v24 = v17;
      v41 = WFLogForCategory(0);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        v60 = objc_opt_class();
        *(_DWORD *)buf = 138543874;
        v76 = v60;
        __int16 v77 = 2048;
        unint64_t v78 = a3;
        __int16 v79 = 2112;
        v80 = v18;
        id v61 = v60;
        _os_log_error_impl(&dword_21C988000, v41, OS_LOG_TYPE_ERROR, "%{public}@ is unable to build %lu forecast request for %@.", buf, 0x20u);
      }
      id v26 = 0;
      goto LABEL_53;
    }
    v41 = [a1 hostURLForService];
    uint64_t v42 = [v32 componentsJoinedByString:@","];
    v43 = (void *)[objc_alloc(MEMORY[0x263F08BA0]) initWithURL:v41 resolvingAgainstBaseURL:0];
    v62 = (void *)v42;
    v44 = [MEMORY[0x263F08BD0] queryItemWithName:@"include" value:v42];
    [v33 addObject:v44];

    if ((a5 - 2) < 2)
    {
      v46 = @"m";
    }
    else if (a5 == 1)
    {
      v46 = @"e";
    }
    else
    {
      if (!a5)
      {
        v45 = (void *)MEMORY[0x263F08BD0];
        v46 = @"m";
LABEL_50:
        v47 = [v45 queryItemWithName:@"units" value:v46];
        [v33 addObject:v47];

        v48 = [v33 allObjects];
        [v43 setQueryItems:v48];

        v49 = [a1 languagePathForLocale:v70];
        v67 = v18;
        v24 = v17;
        v50 = [(id)objc_opt_class() geocodePathForLocation:v18 rules:v17];
        v51 = [NSString stringWithFormat:@"/v1/weather/%@/%@", v49, v50];
        [v43 setPath:v51];

        v52 = (void *)MEMORY[0x263F089E0];
        v53 = [v43 URL];
        v54 = [v52 requestWithURL:v53 cachePolicy:4 timeoutInterval:30.0];

        v55 = objc_opt_new();
        +[WFWeatherDataServiceRequestSigner signRequest:v54 withDate:v55];

        [v54 setHTTPMethod:@"GET"];
        [v54 setHTTPShouldHandleCookies:0];
        v56 = [v69 httpHeaderDictionary];
        v73[0] = MEMORY[0x263EF8330];
        v73[1] = 3221225472;
        v73[2] = __106__WFWeatherDataServiceRequestFormatterV1_forecastRequest_forLocation_withUnits_locale_date_rules_options___block_invoke;
        v73[3] = &unk_264431950;
        id v26 = v54;
        id v74 = v26;
        [v56 enumerateKeysAndObjectsUsingBlock:v73];
        v57 = WFLogForCategory(2uLL);
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG)) {
          +[WFWeatherDataServiceRequestFormatterV1 forecastRequest:forLocation:withUnits:locale:date:rules:options:](v26);
        }

        v18 = v67;
LABEL_53:
        id v19 = v69;

        id v15 = v70;
        goto LABEL_54;
      }
      v46 = 0;
    }
    v45 = (void *)MEMORY[0x263F08BD0];
    goto LABEL_50;
  }
  v24 = v17;
  v25 = WFLogForCategory(2uLL);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
    +[WFWeatherDataServiceRequestFormatterV1 forecastRequest:forLocation:withUnits:locale:date:rules:options:]();
  }
  id v26 = 0;
LABEL_55:

  return v26;
}

uint64_t __106__WFWeatherDataServiceRequestFormatterV1_forecastRequest_forLocation_withUnits_locale_date_rules_options___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) addValue:a3 forHTTPHeaderField:a2];
}

+ (id)aqiRequestForScaleNamed:(id)a3 language:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v8 = [MEMORY[0x263EFF960] currentLocale];
    id v9 = NSString;
    int v10 = [v8 countryCode];
    v11 = [v9 stringWithFormat:@"%@_%@", v7, v10];

    v12 = [a1 hostURLForService];
    v13 = (void *)[objc_alloc(MEMORY[0x263F08BA0]) initWithURL:v12 resolvingAgainstBaseURL:0];
    id v14 = [NSString stringWithFormat:@"%@/%@/%@", @"/v1/airQualityScale", v11, v6];
    [v13 setPath:v14];

    id v15 = (void *)MEMORY[0x263F089E0];
    id v16 = [v13 URL];
    id v17 = [v15 requestWithURL:v16 cachePolicy:4 timeoutInterval:30.0];

    v18 = objc_opt_new();
    +[WFWeatherDataServiceRequestSigner signRequest:v17 withDate:v18];

    [v17 setHTTPMethod:@"GET"];
    [v17 setHTTPShouldHandleCookies:0];
    id v19 = WFLogForCategory(2uLL);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      +[WFWeatherDataServiceRequestFormatterV1 aqiRequestForScaleNamed:language:](v17);
    }
  }
  else
  {
    v8 = WFLogForCategory(2uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[WFWeatherDataServiceRequestFormatterV1 aqiRequestForScaleNamed:language:](v8);
    }
    id v17 = 0;
  }

  return v17;
}

+ (id)geocodePathForLocation:(id)a3 rules:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 locationNumDecimalsOfPrecision];
    if (v8 < 0)
    {
      id v9 = NSString;
      int v10 = [v5 geoLocation];
      [v10 coordinate];
      uint64_t v12 = v11;
      v13 = [v5 geoLocation];
      [v13 coordinate];
      id v15 = objc_msgSend(v9, "stringWithFormat:", @"%f/%f", v12, v14);

      id v16 = WFLogForCategory(2uLL);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        +[WFWeatherDataServiceRequestFormatterV1 geocodePathForLocation:rules:]();
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v8 = 3;
  }
  id v17 = NSString;
  v18 = [v5 geoLocation];
  [v18 coordinate];
  id v16 = objc_msgSend(v17, "stringWithFormat:", @"%.*f", v8, v19);

  v20 = NSString;
  v21 = [v5 geoLocation];
  [v21 coordinate];
  v23 = objc_msgSend(v20, "stringWithFormat:", @"%.*f", v8, v22);

  id v15 = [NSString stringWithFormat:@"%@/%@", v16, v23];
  v24 = WFLogForCategory(2uLL);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
    +[WFWeatherDataServiceRequestFormatterV1 geocodePathForLocation:rules:]((uint64_t)v15, v8, v24);
  }

LABEL_9:
  return v15;
}

+ (id)languagePathForLocale:(id)a3
{
  v3 = (void *)MEMORY[0x263F086E0];
  id v4 = a3;
  id v5 = [v3 mainBundle];
  id v6 = [v5 preferredLocalizations];
  id v7 = [v6 objectAtIndex:0];

  uint64_t v8 = [v7 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];

  id v9 = NSString;
  int v10 = [v4 countryCode];

  uint64_t v11 = [v9 stringWithFormat:@"%@_%@", v8, v10];

  return v11;
}

+ (void)forecastRequest:forLocation:withUnits:locale:date:rules:options:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_21C988000, v0, OS_LOG_TYPE_ERROR, "Cannot format a forecast request without a geolocation: %@", v1, 0xCu);
}

+ (void)forecastRequest:(void *)a1 forLocation:withUnits:locale:date:rules:options:.cold.2(void *a1)
{
  v1 = [a1 URL];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_1(&dword_21C988000, v2, v3, "formatted WDS forecast request: %@", v4, v5, v6, v7, v8);
}

+ (void)forecastRequest:forLocation:withUnits:locale:date:rules:options:.cold.3()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_21C988000, v1, OS_LOG_TYPE_ERROR, "Unhandled forecast request type. initialRequest=%lu, unhandled=%lu", v2, 0x16u);
}

+ (void)aqiRequestForScaleNamed:(os_log_t)log language:.cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_21C988000, log, OS_LOG_TYPE_ERROR, "Cannot format an AQI scale request with a nil AQI scale name", v1, 2u);
}

+ (void)aqiRequestForScaleNamed:(void *)a1 language:.cold.2(void *a1)
{
  os_log_t v1 = [a1 URL];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_1(&dword_21C988000, v2, v3, "formatted WDS AQI scale request: %@", v4, v5, v6, v7, v8);
}

+ (void)geocodePathForLocation:(os_log_t)log rules:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 134218242;
  uint64_t v4 = a2;
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  _os_log_debug_impl(&dword_21C988000, log, OS_LOG_TYPE_DEBUG, "Using %ld digits of precision: %@", (uint8_t *)&v3, 0x16u);
}

+ (void)geocodePathForLocation:rules:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_21C988000, v0, OS_LOG_TYPE_DEBUG, "Using the maximum digits of precision: %@", v1, 0xCu);
}

@end