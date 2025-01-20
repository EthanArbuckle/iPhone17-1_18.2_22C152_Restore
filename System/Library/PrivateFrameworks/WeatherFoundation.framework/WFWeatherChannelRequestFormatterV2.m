@interface WFWeatherChannelRequestFormatterV2
+ (id)airQualityRequestForLocation:(id)a3 locale:(id)a4;
+ (id)aqiRequestForScaleNamed:(id)a3 language:(id)a4;
+ (id)forecastRequest:(unint64_t)a3 forLocation:(id)a4 locale:(id)a5 date:(id)a6;
+ (id)forecastRequest:(unint64_t)a3 forLocation:(id)a4 withUnits:(int)a5 locale:(id)a6 date:(id)a7 rules:(id)a8 options:(id)a9;
+ (id)forecastRequestForRequest:(id)a3 queryItems:(id)a4 forLocation:(id)a5 rules:(id)a6;
+ (id)forecastRequestForURL:(id)a3 queryItems:(id)a4;
+ (id)hostURLForService;
@end

@implementation WFWeatherChannelRequestFormatterV2

+ (id)hostURLForService
{
  return (id)[NSURL URLWithString:@"https://api.weather.com"];
}

+ (id)forecastRequest:(unint64_t)a3 forLocation:(id)a4 locale:(id)a5 date:(id)a6
{
  return (id)[a1 forecastRequest:a3 forLocation:a4 withUnits:0 locale:a5 date:a6 rules:0 options:0];
}

+ (id)forecastRequest:(unint64_t)a3 forLocation:(id)a4 withUnits:(int)a5 locale:(id)a6 date:(id)a7 rules:(id)a8 options:(id)a9
{
  id v13 = a4;
  id v14 = a6;
  id v15 = a8;
  v16 = [v13 geoLocation];

  if (!v16)
  {
    v18 = WFLogForCategory(2uLL);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[WFWeatherStoreServiceConfiguration forecastRequestForTypes:location:units:date:apiVersion:error:requestOptions:]((uint64_t)v13, v18);
    }

LABEL_8:
    v17 = 0;
    goto LABEL_10;
  }
  if (a3 == 1)
  {
    if (+[WFRequestFormattingRules aqiEnabledByRules:v15 forLocation:v13])
    {
      v17 = [a1 airQualityRequestForLocation:v13 locale:v14];
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  v19 = objc_opt_new();
  v20 = [MEMORY[0x263F08BD0] queryItemWithName:@"products" value:@"conditionsshort,fcstdaily10short,fcsthourly24short,nowlinks"];
  [v19 addObject:v20];

  v21 = [MEMORY[0x263F08BD0] queryItemWithName:@"apiKey" value:@"e45ff1b7c7bda231216c7ab7c33509b8"];
  [v19 addObject:v21];

  v17 = [(id)objc_opt_class() forecastRequestForRequest:@"aggregate.json" queryItems:v19 forLocation:v13 rules:v15];

LABEL_10:
  return v17;
}

+ (id)airQualityRequestForLocation:(id)a3 locale:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v6)
  {
    id v6 = [MEMORY[0x263EFF960] currentLocale];
  }
  v7 = [NSString stringWithFormat:@"https://api.weather.com/v2/globalairquality"];
  v8 = (void *)[objc_alloc(MEMORY[0x263F08BA0]) initWithString:v7];
  v9 = NSString;
  v10 = [v6 objectForKey:*MEMORY[0x263EFF508]];
  v11 = [v6 objectForKey:*MEMORY[0x263EFF4D0]];
  v12 = [v9 stringWithFormat:@"%@-%@", v10, v11];

  id v13 = NSString;
  id v14 = [v5 geoLocation];
  [v14 coordinate];
  uint64_t v16 = v15;
  v17 = [v5 geoLocation];
  [v17 coordinate];
  v19 = objc_msgSend(v13, "stringWithFormat:", @"%f,%f", v16, v18);

  v20 = [v8 queryItems];
  v21 = (void *)[v20 mutableCopy];
  v22 = v21;
  if (v21) {
    id v23 = v21;
  }
  else {
    id v23 = (id)objc_opt_new();
  }
  v24 = v23;

  v25 = [MEMORY[0x263F08BD0] queryItemWithName:@"geocode" value:v19];
  [v24 addObject:v25];

  v26 = [MEMORY[0x263F08BD0] queryItemWithName:@"language" value:v12];
  [v24 addObject:v26];

  v27 = [MEMORY[0x263F08BD0] queryItemWithName:@"format" value:@"json"];
  [v24 addObject:v27];

  v28 = [MEMORY[0x263F08BD0] queryItemWithName:@"apiKey" value:@"e45ff1b7c7bda231216c7ab7c33509b8"];
  [v24 addObject:v28];

  v29 = [(id)objc_opt_class() forecastRequestForURL:v8 queryItems:v24];

  return v29;
}

+ (id)forecastRequestForRequest:(id)a3 queryItems:(id)a4 forLocation:(id)a5 rules:(id)a6
{
  v8 = NSString;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [v9 geoLocation];
  [v12 coordinate];
  uint64_t v14 = v13;
  uint64_t v15 = [v9 geoLocation];

  [v15 coordinate];
  v17 = [v8 stringWithFormat:@"https://api.weather.com/v1/geocode/%f/%f/%@", v14, v16, v11];

  uint64_t v18 = (void *)[objc_alloc(MEMORY[0x263F08BA0]) initWithString:v17];
  v19 = [(id)objc_opt_class() forecastRequestForURL:v18 queryItems:v10];

  return v19;
}

+ (id)forecastRequestForURL:(id)a3 queryItems:(id)a4
{
  id v5 = a3;
  [v5 setQueryItems:a4];
  id v6 = (void *)MEMORY[0x263F089E0];
  v7 = [v5 URL];

  v8 = [v6 requestWithURL:v7 cachePolicy:4 timeoutInterval:30.0];

  [v8 setHTTPMethod:@"GET"];
  [v8 setHTTPShouldHandleCookies:0];
  return v8;
}

+ (id)aqiRequestForScaleNamed:(id)a3 language:(id)a4
{
  return 0;
}

@end