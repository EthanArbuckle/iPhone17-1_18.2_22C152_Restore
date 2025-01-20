@interface WFWeatherHistorical30DaysRequestFormatterV3
+ (id)aqiRequestForScaleNamed:(id)a3 language:(id)a4;
+ (id)forecastRequest:(unint64_t)a3 forLocation:(id)a4 locale:(id)a5 date:(id)a6;
+ (id)forecastRequest:(unint64_t)a3 forLocation:(id)a4 withUnits:(int)a5 locale:(id)a6 date:(id)a7 rules:(id)a8 options:(id)a9;
+ (id)hostURLForService;
@end

@implementation WFWeatherHistorical30DaysRequestFormatterV3

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
  id v12 = a8;
  id v13 = a7;
  id v14 = a6;
  id v15 = a4;
  v16 = objc_opt_new();
  v17 = [MEMORY[0x263F08BD0] queryItemWithName:@"units" value:@"m"];
  [v16 addObject:v17];

  v18 = (void *)MEMORY[0x263F08BD0];
  uint64_t v19 = [v14 languageCode];
  v20 = (void *)v19;
  if (v19) {
    v21 = (__CFString *)v19;
  }
  else {
    v21 = @"en";
  }
  v22 = [v18 queryItemWithName:@"language" value:v21];
  [v16 addObject:v22];

  v23 = (void *)MEMORY[0x263F08BD0];
  v24 = objc_msgSend(v15, "wf_weatherChannelGeocodeValue");
  v25 = [v23 queryItemWithName:@"geocode" value:v24];
  [v16 addObject:v25];

  v26 = [MEMORY[0x263F08BD0] queryItemWithName:@"format" value:@"json"];
  [v16 addObject:v26];

  v27 = [MEMORY[0x263F08BD0] queryItemWithName:@"apiKey" value:@"2f816d1e1526478c816d1e1526578cc7"];
  [v16 addObject:v27];

  v28 = +[WFWeatherChannelRequestFormatterV3 forecastRequest:@"v3-wx-conditions-historical-dailysummary-30day" forLocation:v15 locale:v14 date:v13 queryItems:v16 rules:v12];

  return v28;
}

+ (id)aqiRequestForScaleNamed:(id)a3 language:(id)a4
{
  return 0;
}

@end