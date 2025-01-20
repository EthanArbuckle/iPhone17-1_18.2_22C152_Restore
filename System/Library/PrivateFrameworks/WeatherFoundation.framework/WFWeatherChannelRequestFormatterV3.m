@interface WFWeatherChannelRequestFormatterV3
+ (id)aqiRequestForScaleNamed:(id)a3 language:(id)a4;
+ (id)forecastRequest:(id)a3 forLocation:(id)a4 locale:(id)a5 date:(id)a6 queryItems:(id)a7 rules:(id)a8;
+ (id)forecastRequest:(unint64_t)a3 forLocation:(id)a4 locale:(id)a5 date:(id)a6;
+ (id)forecastRequest:(unint64_t)a3 forLocation:(id)a4 withUnits:(int)a5 locale:(id)a6 date:(id)a7 rules:(id)a8 options:(id)a9;
+ (id)forecastRequestForComponents:(id)a3 location:(id)a4 locale:(id)a5 date:(id)a6 queryItems:(id)a7;
+ (id)hostURLForService;
@end

@implementation WFWeatherChannelRequestFormatterV3

+ (id)forecastRequest:(unint64_t)a3 forLocation:(id)a4 locale:(id)a5 date:(id)a6
{
  return (id)[a1 forecastRequest:a3 forLocation:a4 withUnits:0 locale:a5 date:a6 rules:0 options:0];
}

+ (id)forecastRequest:(unint64_t)a3 forLocation:(id)a4 withUnits:(int)a5 locale:(id)a6 date:(id)a7 rules:(id)a8 options:(id)a9
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v13 = a4;
  id v14 = a6;
  id v61 = a7;
  id v15 = a8;
  v16 = [MEMORY[0x263EFF980] arrayWithCapacity:12];
  v17 = [MEMORY[0x263EFF9C0] setWithCapacity:2];
  unint64_t v18 = 0x263F08000uLL;
  unint64_t v19 = a3;
  if (WFForecastTypeIsRequestedInTypes(1, a3))
  {
    if (+[WFRequestFormattingRules aqiEnabledByRules:v15 forLocation:v13])
    {
      unint64_t v19 = a3 & 0xFFFFFFFFFFFFFFFELL;
      [v16 addObject:@"v3-wx-globalAirQuality"];
      v20 = [v14 countryCode];
      AqiScaleForCountryCode(v20);
      unint64_t v21 = a3;
      id v22 = v13;
      id v23 = v14;
      v25 = id v24 = v15;

      v26 = (void *)MEMORY[0x263F08BD0];
      v27 = [v25 name];
      v28 = [v26 queryItemWithName:@"scale" value:v27];
      [v17 addObject:v28];

      id v15 = v24;
      id v14 = v23;
      id v13 = v22;
      a3 = v21;
      unint64_t v18 = 0x263F08000;
    }
    else
    {
      unint64_t v19 = a3;
      if (WFForecastTypeIsSingleType(a3))
      {
        v29 = 0;
        v30 = v61;
        goto LABEL_37;
      }
    }
  }
  if (WFForecastTypeIsRequestedInTypes(2, v19))
  {
    v19 &= ~2uLL;
    [v16 addObject:@"v3-wx-observations-current"];
    v31 = [*(id *)(v18 + 3024) queryItemWithName:@"units" value:@"m"];
    [v17 addObject:v31];
  }
  if (WFForecastTypeIsRequestedInTypes(4, v19))
  {
    v19 &= ~4uLL;
    [v16 addObject:@"v3-wx-forecast-hourly-1day"];
    v32 = [*(id *)(v18 + 3024) queryItemWithName:@"units" value:@"m"];
    [v17 addObject:v32];
  }
  if (WFForecastTypeIsRequestedInTypes(8, v19))
  {
    v19 &= ~8uLL;
    [v16 addObject:@"v3-wx-forecast-daily-10day"];
    v33 = [*(id *)(v18 + 3024) queryItemWithName:@"units" value:@"m"];
    [v17 addObject:v33];
  }
  if (WFForecastTypeIsRequestedInTypes(256, v19))
  {
    v19 &= ~0x100uLL;
    [v16 addObject:@"v3-links"];
    v34 = [*(id *)(v18 + 3024) queryItemWithName:@"par" value:@"apple_TWC"];
    [v17 addObject:v34];
  }
  if (WFForecastTypeIsRequestedInTypes(16, v19))
  {
    v19 &= ~0x10uLL;
    [v16 addObject:@"v2idxPollenDaypart10"];
  }
  id v60 = v15;
  if (WFForecastTypeIsRequestedInTypes(32, v19))
  {
    v19 &= ~0x20uLL;
    [v16 addObject:@"v3-wx-conditions-historical-hourly-1day"];
    v35 = [*(id *)(v18 + 3024) queryItemWithName:@"units" value:@"m"];
    [v17 addObject:v35];
  }
  v36 = [v17 allObjects];
  v37 = (void *)[v36 mutableCopy];

  v38 = *(void **)(v18 + 3024);
  v39 = objc_msgSend(v13, "wf_weatherChannelGeocodeValue");
  v40 = [v38 queryItemWithName:@"geocode" value:v39];
  [v37 addObject:v40];

  v41 = [*(id *)(v18 + 3024) queryItemWithName:@"format" value:@"json"];
  [v37 addObject:v41];

  v42 = *(void **)(v18 + 3024);
  uint64_t v43 = [v14 languageCode];
  v44 = (void *)v43;
  if (v43) {
    v45 = (__CFString *)v43;
  }
  else {
    v45 = @"en";
  }
  v46 = [v42 queryItemWithName:@"language" value:v45];
  [v37 addObject:v46];

  v47 = [*(id *)(v18 + 3024) queryItemWithName:@"apiKey" value:@"daab481aeef8450eab481aeef8950e4d"];
  [v37 addObject:v47];

  if (v19)
  {
    v48 = WFLogForCategory(0);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
      +[WFWeatherChannelRequestFormatterV3 forecastRequest:forLocation:withUnits:locale:date:rules:options:](a3, v48);
    }
  }
  if ([v16 count])
  {
    id v49 = objc_alloc(MEMORY[0x263F08BA0]);
    v50 = [a1 hostURLForService];
    v51 = [v49 initWithURL:v50 resolvingAgainstBaseURL:0];

    if ([v16 count] == 1)
    {
      v52 = [v16 firstObject];
      if ([@"v2idxPollenDaypart10" isEqualToString:v52])
      {
        v53 = @"v2/indices/pollen/daypart/10day";
      }
      else
      {
        v53 = [v52 stringByReplacingOccurrencesOfString:@"-" withString:@"/"];
      }
      v55 = v53;

      [NSString stringWithFormat:@"/%@", v55];
    }
    else
    {
      v54 = NSString;
      v55 = [v16 componentsJoinedByString:@";"];
      [v54 stringWithFormat:@"/v3/aggcommon/%@", v55];
    v56 = };
    [v51 setPath:v56];

    v30 = v61;
    v29 = +[WFWeatherChannelRequestFormatterV3 forecastRequestForComponents:v51 location:v13 locale:v14 date:v61 queryItems:v37];
  }
  else
  {
    v51 = WFLogForCategory(0);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      id v63 = (id)objc_opt_class();
      __int16 v64 = 2048;
      unint64_t v65 = a3;
      __int16 v66 = 2112;
      id v67 = v13;
      id v58 = v63;
      _os_log_error_impl(&dword_21C988000, v51, OS_LOG_TYPE_ERROR, "%{public}@ is unable to build %lu forecast request for %@.", buf, 0x20u);
    }
    v29 = 0;
    v30 = v61;
  }

  id v15 = v60;
LABEL_37:

  return v29;
}

+ (id)hostURLForService
{
  return (id)[NSURL URLWithString:@"https://api.weather.com"];
}

+ (id)forecastRequest:(id)a3 forLocation:(id)a4 locale:(id)a5 date:(id)a6 queryItems:(id)a7 rules:(id)a8
{
  id v13 = (objc_class *)MEMORY[0x263F08BA0];
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  id v19 = [v13 alloc];
  v20 = [a1 hostURLForService];
  unint64_t v21 = (void *)[v19 initWithURL:v20 resolvingAgainstBaseURL:0];

  id v22 = NSString;
  id v23 = [v18 stringByReplacingOccurrencesOfString:@"-" withString:@"/"];

  id v24 = [v22 stringWithFormat:@"/%@", v23];
  [v21 setPath:v24];

  v25 = +[WFWeatherChannelRequestFormatterV3 forecastRequestForComponents:v21 location:v17 locale:v16 date:v15 queryItems:v14];

  return v25;
}

+ (id)forecastRequestForComponents:(id)a3 location:(id)a4 locale:(id)a5 date:(id)a6 queryItems:(id)a7
{
  id v8 = a3;
  [v8 setQueryItems:a7];
  v9 = (void *)MEMORY[0x263F089E0];
  v10 = [v8 URL];

  v11 = [v9 requestWithURL:v10 cachePolicy:4 timeoutInterval:30.0];

  [v11 setHTTPShouldHandleCookies:0];
  return v11;
}

+ (id)aqiRequestForScaleNamed:(id)a3 language:(id)a4
{
  return 0;
}

+ (void)forecastRequest:(uint64_t)a1 forLocation:(NSObject *)a2 withUnits:locale:date:rules:options:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21C988000, a2, OS_LOG_TYPE_ERROR, "Unhandled forecast request type: %lu", (uint8_t *)&v2, 0xCu);
}

@end