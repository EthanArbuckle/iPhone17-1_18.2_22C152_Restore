@interface WFWeatherHistorical1DayRequestFormatterV2
+ (id)dateFormatter;
+ (id)forecastRequest:(unint64_t)a3 forLocation:(id)a4 locale:(id)a5 date:(id)a6;
+ (id)forecastRequest:(unint64_t)a3 forLocation:(id)a4 withUnits:(int)a5 locale:(id)a6 date:(id)a7 rules:(id)a8 options:(id)a9;
+ (id)hostURLForService;
@end

@implementation WFWeatherHistorical1DayRequestFormatterV2

+ (id)dateFormatter
{
  if (dateFormatter_onceToken_1 != -1) {
    dispatch_once(&dateFormatter_onceToken_1, &__block_literal_global_18);
  }
  v2 = (void *)dateFormatter_dateFormatter_1;
  return v2;
}

uint64_t __58__WFWeatherHistorical1DayRequestFormatterV2_dateFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  uint64_t v1 = dateFormatter_dateFormatter_1;
  dateFormatter_dateFormatter_1 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

+ (id)forecastRequest:(unint64_t)a3 forLocation:(id)a4 locale:(id)a5 date:(id)a6
{
  return (id)[a1 forecastRequest:a3 forLocation:a4 withUnits:0 locale:a5 date:a6 rules:0 options:0];
}

+ (id)forecastRequest:(unint64_t)a3 forLocation:(id)a4 withUnits:(int)a5 locale:(id)a6 date:(id)a7 rules:(id)a8 options:(id)a9
{
  id v11 = a4;
  id v12 = a7;
  id v13 = a8;
  v14 = [v11 geoLocation];

  if (v14)
  {
    v15 = [(id)objc_opt_class() dateFormatter];
    [v15 setDateFormat:@"yyyyMMdd"];
    v16 = [v15 stringFromDate:v12];
    v17 = objc_opt_new();
    v18 = [MEMORY[0x263F08BD0] queryItemWithName:@"units" value:@"m"];
    [v17 addObject:v18];

    v19 = [MEMORY[0x263F08BD0] queryItemWithName:@"startDate" value:v16];
    [v17 addObject:v19];

    v20 = [MEMORY[0x263F08BD0] queryItemWithName:@"apiKey" value:@"2f816d1e1526478c816d1e1526578cc7"];
    [v17 addObject:v20];

    v21 = +[WFWeatherChannelRequestFormatterV2 forecastRequestForRequest:@"observations/historical.json" queryItems:v17 forLocation:v11 rules:v13];
  }
  else
  {
    v22 = WFLogForCategory(2uLL);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[WFWeatherStoreServiceConfiguration forecastRequestForTypes:location:units:date:apiVersion:error:requestOptions:]((uint64_t)v11, v22);
    }

    v21 = 0;
  }

  return v21;
}

+ (id)hostURLForService
{
  return +[WFWeatherChannelRequestFormatterV2 hostURLForService];
}

@end