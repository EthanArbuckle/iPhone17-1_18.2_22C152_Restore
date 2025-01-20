@interface WFWeatherAlmanacRequestFormatterV3
+ (id)aqiRequestForScaleNamed:(id)a3 language:(id)a4;
+ (id)forecastRequest:(unint64_t)a3 forLocation:(id)a4 locale:(id)a5 date:(id)a6;
+ (id)forecastRequest:(unint64_t)a3 forLocation:(id)a4 withUnits:(int)a5 locale:(id)a6 date:(id)a7 rules:(id)a8 options:(id)a9;
+ (id)hostURLForService;
@end

@implementation WFWeatherAlmanacRequestFormatterV3

+ (id)hostURLForService
{
  return +[WFWeatherChannelRequestFormatterV3 hostURLForService];
}

+ (id)forecastRequest:(unint64_t)a3 forLocation:(id)a4 locale:(id)a5 date:(id)a6
{
  return (id)[a1 forecastRequest:a3 forLocation:a4 withUnits:0 locale:a5 date:a6 rules:0 options:0];
}

+ (id)forecastRequest:(unint64_t)a3 forLocation:(id)a4 withUnits:(int)a5 locale:(id)a6 date:(id)a7 rules:(id)a8 options:(id)a9
{
  id v12 = a4;
  id v35 = a8;
  id v13 = a7;
  id v34 = a6;
  v14 = +[WFWeatherConditions calendar];
  v15 = (void *)[v14 copy];

  v16 = [v12 timeZone];
  if (v16)
  {
    [v15 setTimeZone:v16];
  }
  else
  {
    v17 = [MEMORY[0x263EFFA18] systemTimeZone];
    [v15 setTimeZone:v17];
  }
  v18 = [v15 components:24 fromDate:v13];
  v19 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v18, "month"));
  v20 = [v19 stringValue];

  v21 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v18, "day"));
  v22 = [v21 stringValue];

  v23 = objc_opt_new();
  v24 = [MEMORY[0x263F08BD0] queryItemWithName:@"month" value:v20];
  [v23 addObject:v24];

  v25 = [MEMORY[0x263F08BD0] queryItemWithName:@"day" value:v22];
  [v23 addObject:v25];

  v26 = (void *)MEMORY[0x263F08BD0];
  v27 = objc_msgSend(v12, "wf_weatherChannelGeocodeValue");
  v28 = [v26 queryItemWithName:@"geocode" value:v27];
  [v23 addObject:v28];

  v29 = [MEMORY[0x263F08BD0] queryItemWithName:@"format" value:@"json"];
  [v23 addObject:v29];

  v30 = [MEMORY[0x263F08BD0] queryItemWithName:@"units" value:@"m"];
  [v23 addObject:v30];

  v31 = [MEMORY[0x263F08BD0] queryItemWithName:@"apiKey" value:@"2f816d1e1526478c816d1e1526578cc7"];
  [v23 addObject:v31];

  v32 = +[WFWeatherChannelRequestFormatterV3 forecastRequest:@"v3-wx-almanac-daily-1day" forLocation:v12 locale:v34 date:v13 queryItems:v23 rules:v35];

  return v32;
}

+ (id)aqiRequestForScaleNamed:(id)a3 language:(id)a4
{
  return 0;
}

@end