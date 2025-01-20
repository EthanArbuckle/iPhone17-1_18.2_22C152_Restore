@interface WFWeatherUndergroundRequestFormatter
+ (id)aqiRequestForScaleNamed:(id)a3 language:(id)a4;
+ (id)forecastRequest:(unint64_t)a3 forLocation:(id)a4 locale:(id)a5 date:(id)a6;
+ (id)forecastRequest:(unint64_t)a3 forLocation:(id)a4 withUnits:(int)a5 locale:(id)a6 date:(id)a7 rules:(id)a8 options:(id)a9;
+ (id)hostURLForService;
@end

@implementation WFWeatherUndergroundRequestFormatter

+ (id)hostURLForService
{
  return (id)[NSURL URLWithString:@"https://api.wunderground.com"];
}

+ (id)forecastRequest:(unint64_t)a3 forLocation:(id)a4 locale:(id)a5 date:(id)a6
{
  return (id)[a1 forecastRequest:a3 forLocation:a4 withUnits:0 locale:a5 date:a6 rules:0 options:0];
}

+ (id)forecastRequest:(unint64_t)a3 forLocation:(id)a4 withUnits:(int)a5 locale:(id)a6 date:(id)a7 rules:(id)a8 options:(id)a9
{
  id v10 = a4;
  id v11 = a7;
  v12 = [v10 geoLocation];

  if (v12)
  {
    id v13 = objc_alloc_init(MEMORY[0x263F08790]);
    [v13 setDateFormat:@"yyyyMMdd"];
    v14 = NSString;
    v15 = [v13 stringFromDate:v11];
    v16 = [v10 geoLocation];
    [v16 coordinate];
    v19 = NSStringFromCLLocationCoordinate2D(v17, v18);
    v20 = [v14 stringWithFormat:@"https://api.wunderground.com/api/%@/%@%@/q/%@.json", @"e13f255ff1aeedb8", @"history_", v15, v19];

    v21 = (void *)MEMORY[0x263F089E0];
    v22 = [NSURL URLWithString:v20];
    v23 = [v21 requestWithURL:v22 cachePolicy:4 timeoutInterval:30.0];

    [v23 setHTTPMethod:@"GET"];
    [v23 setValue:@"Client" forHTTPHeaderField:@"X-Client-Info"];
    [v23 setValue:@"1.1" forHTTPHeaderField:@"X-Device-Info"];
  }
  else
  {
    v24 = WFLogForCategory(2uLL);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      +[WFWeatherUndergroundRequestFormatter forecastRequest:forLocation:withUnits:locale:date:rules:options:]((uint64_t)v10, v24);
    }

    v23 = 0;
  }

  return v23;
}

+ (id)aqiRequestForScaleNamed:(id)a3 language:(id)a4
{
  return 0;
}

+ (void)forecastRequest:(uint64_t)a1 forLocation:(NSObject *)a2 withUnits:locale:date:rules:options:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21C988000, a2, OS_LOG_TYPE_ERROR, "Cannot format a request without a geolocation: %@", (uint8_t *)&v2, 0xCu);
}

@end