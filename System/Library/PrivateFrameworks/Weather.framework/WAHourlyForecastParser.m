@interface WAHourlyForecastParser
+ (id)parseForecasts:(id)a3 temperature:(id)a4 currentTime:(unint64_t)a5 condition:(int64_t)a6 sunrise:(unint64_t)a7 sunset:(unint64_t)a8;
+ (id)parseForecasts:(id)a3 temperature:(id)a4 hour:(int64_t)a5 condition:(int64_t)a6 sunrise:(unint64_t)a7 sunset:(unint64_t)a8;
+ (void)addSunEventIntoForecasts:(id)a3 eventType:(unint64_t)a4 forecastDetail:(id)a5 eventTime:(unint64_t)a6 currentTime:(unint64_t)a7;
@end

@implementation WAHourlyForecastParser

+ (void)addSunEventIntoForecasts:(id)a3 eventType:(unint64_t)a4 forecastDetail:(id)a5 eventTime:(unint64_t)a6 currentTime:(unint64_t)a7
{
  id v11 = a3;
  id v12 = a5;
  if ([v11 count])
  {
    v13 = objc_msgSend(MEMORY[0x263F089D8], "stringWithFormat:", @"%04lu", a6);
    [v13 insertString:@":" atIndex:2];
    v14 = [v11 objectAtIndexedSubscript:0];
    v15 = [v14 time];
    int v16 = TimeStringToIntValue(v15);

    if (a6 > a7)
    {
      uint64_t v17 = 0;
      if (v16 > a6) {
        goto LABEL_4;
      }
    }
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __98__WAHourlyForecastParser_addSunEventIntoForecasts_eventType_forecastDetail_eventTime_currentTime___block_invoke;
    v23[3] = &__block_descriptor_40_e33_B32__0__WAHourlyForecast_8Q16_B24l;
    v23[4] = a6;
    uint64_t v19 = [v11 indexOfObjectPassingTest:v23];
    if (v19 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v17 = v19;
      if (a4 != 1)
      {
        v20 = [v11 objectAtIndexedSubscript:v19];
        v21 = [v20 time];
        char v22 = [v21 isEqualToString:v13];

        if (v22) {
          goto LABEL_4;
        }
      }
      if (++v17 != 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_4:
        v18 = objc_alloc_init(WAHourlyForecast);
        [(WAHourlyForecast *)v18 setEventType:a4];
        [(WAHourlyForecast *)v18 setTime:v13];
        [(WAHourlyForecast *)v18 setForecastDetail:v12];
        [v11 insertObject:v18 atIndex:v17];
      }
    }
  }
}

BOOL __98__WAHourlyForecastParser_addSunEventIntoForecasts_eventType_forecastDetail_eventTime_currentTime___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 time];
  int v4 = TimeStringToIntValue(v3);

  unint64_t v5 = *(void *)(a1 + 32);
  return v5 >= v4 && v5 < v4 + 100;
}

+ (id)parseForecasts:(id)a3 temperature:(id)a4 hour:(int64_t)a5 condition:(int64_t)a6 sunrise:(unint64_t)a7 sunset:(unint64_t)a8
{
  return (id)[a1 parseForecasts:a3 temperature:a4 currentTime:100 * a5 condition:a6 sunrise:a7 sunset:a8];
}

+ (id)parseForecasts:(id)a3 temperature:(id)a4 currentTime:(unint64_t)a5 condition:(int64_t)a6 sunrise:(unint64_t)a7 sunset:(unint64_t)a8
{
  id v13 = a3;
  id v14 = a4;
  if ([v13 count])
  {
    unint64_t v28 = a7;
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __90__WAHourlyForecastParser_parseForecasts_temperature_currentTime_condition_sunrise_sunset___block_invoke;
    v31[3] = &__block_descriptor_40_e33_B32__0__WAHourlyForecast_8Q16_B24l;
    v31[4] = a5;
    uint64_t v15 = [v13 indexOfObjectPassingTest:v31];
    int64_t v30 = a6;
    unint64_t v29 = a8;
    if (v15 == 0x7FFFFFFFFFFFFFFFLL)
    {
      int v16 = WALogForCategory(0);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        +[WAHourlyForecastParser parseForecasts:temperature:currentTime:condition:sunrise:sunset:]((uint64_t)v13, a5, v16);
      }

      uint64_t v17 = [MEMORY[0x263EFF980] arrayWithArray:v13];
    }
    else
    {
      v18 = (void *)MEMORY[0x263EFF980];
      uint64_t v19 = objc_msgSend(v13, "subarrayWithRange:", v15, objc_msgSend(v13, "count") - v15);
      uint64_t v17 = [v18 arrayWithArray:v19];
    }
    v20 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v21 = [v20 localizedStringForKey:@"SUNRISE_COMPACT" value:&stru_26DADC2F0 table:@"WeatherFrameworkLocalizableStrings"];
    +[WAHourlyForecastParser addSunEventIntoForecasts:v17 eventType:1 forecastDetail:v21 eventTime:v28 currentTime:a5];

    char v22 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v23 = [v22 localizedStringForKey:@"SUNSET_COMPACT" value:&stru_26DADC2F0 table:@"WeatherFrameworkLocalizableStrings"];
    +[WAHourlyForecastParser addSunEventIntoForecasts:v17 eventType:2 forecastDetail:v23 eventTime:v29 currentTime:a5];

    v24 = objc_alloc_init(WAHourlyForecast);
    [(WAHourlyForecast *)v24 setEventType:3];
    v25 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v26 = [v25 localizedStringForKey:@"NOW" value:&stru_26DADC2F0 table:@"WeatherFrameworkLocalizableStrings"];
    [(WAHourlyForecast *)v24 setTime:v26];

    [(WAHourlyForecast *)v24 setTemperature:v14];
    [(WAHourlyForecast *)v24 setPercentPrecipitation:-1.0];
    [(WAHourlyForecast *)v24 setConditionCode:v30];
    [v17 insertObject:v24 atIndex:0];
  }
  else
  {
    uint64_t v17 = 0;
  }

  return v17;
}

BOOL __90__WAHourlyForecastParser_parseForecasts_temperature_currentTime_condition_sunrise_sunset___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 time];
  BOOL v4 = *(void *)(a1 + 32) < (unint64_t)(int)TimeStringToIntValue(v3);

  return v4;
}

+ (void)parseForecasts:(os_log_t)log temperature:currentTime:condition:sunrise:sunset:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 134218242;
  uint64_t v4 = a2;
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  _os_log_error_impl(&dword_226D1D000, log, OS_LOG_TYPE_ERROR, "Unable to locate current hour (%ld) within new hourly forecasts: %@", (uint8_t *)&v3, 0x16u);
}

@end