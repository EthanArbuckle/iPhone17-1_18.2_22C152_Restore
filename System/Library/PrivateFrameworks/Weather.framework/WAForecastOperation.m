@interface WAForecastOperation
- (BOOL)_needsGeolocation;
- (BOOL)canGeocode;
- (BOOL)isDay;
- (BOOL)isLocationInGeocodeSample;
- (BOOL)shouldAttachRawAPIData;
- (BOOL)shouldRequestChangeInConditions;
- (City)city;
- (NSArray)changeForecasts;
- (NSArray)dailyForecastConditions;
- (NSArray)dailyForecasts;
- (NSArray)hourlyForecastConditions;
- (NSArray)hourlyForecasts;
- (NSArray)severeWeatherEvents;
- (NSCalendar)calendar;
- (NSData)rawAPIData;
- (NSDate)sunrise;
- (NSDate)sunset;
- (NSDictionary)links;
- (NSError)error;
- (NSLocale)locale;
- (NSString)trackingParameter;
- (WACurrentForecast)currentConditions;
- (WAForecastModel)forecastModel;
- (WAForecastOperation)initWithCity:(id)a3 onConnection:(id)a4;
- (WAForecastOperation)initWithCity:(id)a3 withUnits:(int)a4 canGeocode:(BOOL)a5 onConnection:(id)a6;
- (WAForecastOperation)initWithCity:(id)a3 withUnits:(int)a4 onConnection:(id)a5;
- (WAForecastOperation)initWithCity:(id)a3 withUnits:(int)a4 requestOptions:(id)a5 canGeocode:(BOOL)a6 onConnection:(id)a7;
- (WAForecastOperation)initWithLocation:(id)a3 onConnection:(id)a4;
- (WFAggregateCommonRequest)aggregateRequest;
- (WFAirQualityConditions)airQualityConditions;
- (WFLocation)location;
- (WFNextHourPrecipitation)nextHourPrecipitation;
- (WFRequestOptions)requestOptions;
- (WFServiceConnection)connection;
- (WFWeatherConditions)currentWeatherConditions;
- (int)units;
- (void)_determineSunriseAndSunset;
- (void)_failWithError:(id)a3;
- (void)_mapReferralLinks;
- (void)_needsGeolocation;
- (void)cancel;
- (void)main;
- (void)setAggregateRequest:(id)a3;
- (void)setAirQualityConditions:(id)a3;
- (void)setCalendar:(id)a3;
- (void)setCanGeocode:(BOOL)a3;
- (void)setChangeForecasts:(id)a3;
- (void)setCity:(id)a3;
- (void)setConnection:(id)a3;
- (void)setCurrentConditions:(id)a3;
- (void)setCurrentWeatherConditions:(id)a3;
- (void)setDailyForecastConditions:(id)a3;
- (void)setDailyForecasts:(id)a3;
- (void)setError:(id)a3;
- (void)setHourlyForecastConditions:(id)a3;
- (void)setHourlyForecasts:(id)a3;
- (void)setIsDay:(BOOL)a3;
- (void)setIsLocationInGeocodeSample:(BOOL)a3;
- (void)setLinks:(id)a3;
- (void)setLocale:(id)a3;
- (void)setLocation:(id)a3;
- (void)setNextHourPrecipitation:(id)a3;
- (void)setRawAPIData:(id)a3;
- (void)setRequestOptions:(id)a3;
- (void)setSevereWeatherEvents:(id)a3;
- (void)setShouldAttachRawAPIData:(BOOL)a3;
- (void)setSunrise:(id)a3;
- (void)setSunset:(id)a3;
- (void)setTrackingParameter:(id)a3;
- (void)setUnits:(int)a3;
@end

@implementation WAForecastOperation

- (WAForecastOperation)initWithCity:(id)a3 onConnection:(id)a4
{
  return [(WAForecastOperation *)self initWithCity:a3 withUnits:0 onConnection:a4];
}

- (WAForecastOperation)initWithCity:(id)a3 withUnits:(int)a4 onConnection:(id)a5
{
  return [(WAForecastOperation *)self initWithCity:a3 withUnits:*(void *)&a4 canGeocode:1 onConnection:a5];
}

- (WAForecastOperation)initWithCity:(id)a3 withUnits:(int)a4 canGeocode:(BOOL)a5 onConnection:(id)a6
{
  return [(WAForecastOperation *)self initWithCity:a3 withUnits:*(void *)&a4 requestOptions:0 canGeocode:a5 onConnection:a6];
}

- (WAForecastOperation)initWithCity:(id)a3 withUnits:(int)a4 requestOptions:(id)a5 canGeocode:(BOOL)a6 onConnection:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a7;
  if (v13)
  {
    v16 = [(WAForecastOperation *)self init];
    if (v16)
    {
      uint64_t v17 = [v13 wfLocation];
      location = v16->_location;
      v16->_location = (WFLocation *)v17;

      objc_storeStrong((id *)&v16->_city, a3);
      v16->_units = a4;
      objc_storeStrong((id *)&v16->_requestOptions, a5);
      objc_storeStrong((id *)&v16->_connection, a7);
      v16->_isLocationInGeocodeSample = a6;
    }
    self = v16;
    v19 = self;
  }
  else
  {
    NSLog(&cfstr_NoCityBailing.isa);
    v19 = 0;
  }

  return v19;
}

- (WAForecastOperation)initWithLocation:(id)a3 onConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v12.receiver = self;
    v12.super_class = (Class)WAForecastOperation;
    v8 = [(WAForecastOperation *)&v12 init];
    v9 = v8;
    if (v8)
    {
      [(WAForecastOperation *)v8 setLocation:v6];
      objc_storeStrong((id *)&v9->_connection, a4);
      v9->_isLocationInGeocodeSample = 1;
    }
    self = v9;
    v10 = self;
  }
  else
  {
    NSLog(&cfstr_NoLocationBail.isa);
    v10 = 0;
  }

  return v10;
}

- (BOOL)_needsGeolocation
{
  v3 = [(WAForecastOperation *)self city];
  v4 = +[WeatherInternalPreferences sharedInternalPreferences];
  int v5 = [v4 BOOLForKey:@"EnableTimeZoneNeverFresh"];

  int v6 = [v3 timeZoneIsFresh];
  if (v3 && v6 ^ 1 | v5 && [(WAForecastOperation *)self isLocationInGeocodeSample])
  {
    id v7 = WALogForCategory(4);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      [(WAForecastOperation *)(uint64_t)v3 _needsGeolocation];
    }
  }
  else
  {
    uint64_t v8 = [(WAForecastOperation *)self location];
    if (v8)
    {
      v9 = (void *)v8;
      v10 = [(WAForecastOperation *)self location];
      int v11 = [v10 needsGeocoding];

      if (!v11)
      {
        BOOL v12 = 0;
        goto LABEL_12;
      }
    }
    id v7 = WALogForCategory(4);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      [(WAForecastOperation *)self _needsGeolocation];
    }
  }

  BOOL v12 = 1;
LABEL_12:

  return v12;
}

- (void)main
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_226D1D000, log, OS_LOG_TYPE_ERROR, "Location data missing for location %@ / city %@", buf, 0x16u);
}

void __27__WAForecastOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  if (v8 && !v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    [WeakRetained setLocation:v8];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

void __27__WAForecastOperation_main__block_invoke_30(uint64_t a1, void *a2, void *a3, void *a4)
{
  v53[1] = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9) {
    goto LABEL_2;
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    int v11 = [v7 currentObservations];

    if (v11) {
      goto LABEL_6;
    }
  }
  BOOL v12 = [*(id *)(a1 + 32) city];
  uint64_t v52 = *MEMORY[0x263F08320];
  v53[0] = @"A successful todayRequestHandler callback should always have valid location and conditions set";
  id v13 = [NSDictionary dictionaryWithObjects:v53 forKeys:&v52 count:1];
  WAErrorWithCode(0, 0, v12, v13);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
LABEL_2:
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    [WeakRetained _failWithError:v9];
  }
  else
  {
LABEL_6:
    id v14 = [v7 currentObservations];
    id v15 = objc_loadWeakRetained((id *)(a1 + 56));
    [v15 setCurrentWeatherConditions:v14];

    v16 = [v7 dailyForecastedConditions];
    id v17 = objc_loadWeakRetained((id *)(a1 + 56));
    [v17 setDailyForecastConditions:v16];

    v18 = [v7 hourlyForecastedConditions];
    id v19 = objc_loadWeakRetained((id *)(a1 + 56));
    [v19 setHourlyForecastConditions:v18];

    v20 = [v7 airQualityObservations];
    id v21 = objc_loadWeakRetained((id *)(a1 + 56));
    [v21 setAirQualityConditions:v20];

    v22 = [v7 severeWeatherEvents];
    id v23 = objc_loadWeakRetained((id *)(a1 + 56));
    [v23 setSevereWeatherEvents:v22];

    v24 = [v7 changeForecasts];
    id v25 = objc_loadWeakRetained((id *)(a1 + 56));
    [v25 setChangeForecasts:v24];

    v26 = [v7 nextHourPrecipitation];
    id v27 = objc_loadWeakRetained((id *)(a1 + 56));
    [v27 setNextHourPrecipitation:v26];

    uint64_t v28 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    v29 = [v7 currentObservations];
    v30 = +[WACurrentForecast currentForecastForLocation:v28 conditions:v29];
    id v31 = objc_loadWeakRetained((id *)(a1 + 56));
    [v31 setCurrentConditions:v30];

    v32 = [v7 dailyForecastedConditions];
    v51[0] = MEMORY[0x263EF8330];
    v51[1] = 3221225472;
    v51[2] = __27__WAForecastOperation_main__block_invoke_2;
    v51[3] = &unk_2647E0A30;
    v51[4] = *(void *)(a1 + 48);
    objc_msgSend(v32, "na_map:", v51);
    id v9 = (id)objc_claimAutoreleasedReturnValue();

    id v33 = objc_loadWeakRetained((id *)(a1 + 56));
    [v33 setDailyForecasts:v9];

    id v34 = objc_loadWeakRetained((id *)(a1 + 56));
    v35 = [v34 currentWeatherConditions];
    v36 = [v35 valueForComponent:*MEMORY[0x263F86038]];

    id v37 = objc_loadWeakRetained((id *)(a1 + 56));
    v38 = [v37 currentWeatherConditions];
    v39 = [v38 valueForComponent:*MEMORY[0x263F86048]];

    v40 = [v7 hourlyForecastedConditions];
    v47[0] = MEMORY[0x263EF8330];
    v47[1] = 3221225472;
    v47[2] = __27__WAForecastOperation_main__block_invoke_3;
    v47[3] = &unk_2647E0A58;
    uint64_t v41 = *(void *)(a1 + 48);
    id v49 = v39;
    uint64_t v50 = v41;
    id v48 = v36;
    id v42 = v39;
    id WeakRetained = v36;
    v43 = objc_msgSend(v40, "na_map:", v47);

    id v44 = objc_loadWeakRetained((id *)(a1 + 56));
    [v44 setHourlyForecasts:v43];

    id v45 = objc_loadWeakRetained((id *)(a1 + 56));
    LODWORD(v40) = [v45 shouldAttachRawAPIData];

    if (v40)
    {
      id v46 = objc_loadWeakRetained((id *)(a1 + 56));
      [v46 setRawAPIData:v8];
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

id __27__WAForecastOperation_main__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[WADayForecast dayForecastForLocation:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) conditions:a2];
}

id __27__WAForecastOperation_main__block_invoke_3(void *a1, uint64_t a2)
{
  return +[WAHourlyForecast hourlyForecastForLocation:*(void *)(*(void *)(a1[6] + 8) + 40) conditions:a2 sunriseDateComponents:a1[4] sunsetDateComponents:a1[5]];
}

- (void)cancel
{
  v6.receiver = self;
  v6.super_class = (Class)WAForecastOperation;
  [(WAForecastOperation *)&v6 cancel];
  v3 = [(WAForecastOperation *)self aggregateRequest];
  [v3 cancel];

  v4 = [(WAForecastOperation *)self city];
  int v5 = WAErrorWithCode(3072, 0, v4, 0);
  [(WAForecastOperation *)self _failWithError:v5];
}

- (BOOL)shouldRequestChangeInConditions
{
  v2 = [MEMORY[0x263F086E0] mainBundle];
  v3 = [v2 bundleIdentifier];

  BOOL v7 = 0;
  if ([v3 isEqualToString:@"com.apple.weather.widget"])
  {
    v4 = [MEMORY[0x263EFF910] now];
    int v5 = [MEMORY[0x263EFF8F0] currentCalendar];
    uint64_t v6 = [v5 component:32 fromDate:v4];

    if (v6 > 18) {
      BOOL v7 = 1;
    }
  }

  return v7;
}

- (void)_failWithError:(id)a3
{
  id v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  int v5 = [(WAForecastOperation *)v4 error];

  if (!v5) {
    [(WAForecastOperation *)v4 setError:v6];
  }
  objc_sync_exit(v4);
}

- (void)_determineSunriseAndSunset
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  v3 = [(WAForecastOperation *)self currentWeatherConditions];
  uint64_t v34 = *MEMORY[0x263F85FE0];
  v4 = objc_msgSend(v3, "valueForComponent:");
  id v37 = [v4 date];

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v35 = self;
  id obj = [(WAForecastOperation *)self dailyForecastConditions];
  uint64_t v5 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = 0;
    id v8 = 0;
    uint64_t v9 = *(void *)v39;
    uint64_t v10 = *MEMORY[0x263F86038];
    uint64_t v11 = *MEMORY[0x263F86048];
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v39 != v9) {
        objc_enumerationMutation(obj);
      }
      id v13 = *(void **)(*((void *)&v38 + 1) + 8 * v12);
      id v14 = [v13 valueForComponent:v10];
      id v15 = [v14 date];

      if (!v8 && v15)
      {
        v16 = [v15 laterDate:v37];

        if (v16 == v15) {
          id v8 = v15;
        }
        else {
          id v8 = 0;
        }
      }
      id v17 = [v13 valueForComponent:v11];
      v18 = [v17 date];

      if (!v7 && v18)
      {
        id v19 = [v18 laterDate:v37];

        if (v19 == v18) {
          id v7 = v18;
        }
        else {
          id v7 = 0;
        }
      }

      if (v7)
      {
        if (v8) {
          break;
        }
      }
      if (v6 == ++v12)
      {
        uint64_t v6 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    id v7 = 0;
    id v8 = 0;
  }

  [(WAForecastOperation *)v35 setSunset:v7];
  [(WAForecastOperation *)v35 setSunrise:v8];
  v20 = [(WAForecastOperation *)v35 currentWeatherConditions];
  id v21 = [v20 valueForComponent:v34];
  v22 = [v21 date];
  [v22 timeIntervalSince1970];
  double v24 = v23;

  id v25 = [(WAForecastOperation *)v35 sunset];
  [v25 timeIntervalSince1970];
  double v27 = v26;

  uint64_t v28 = [(WAForecastOperation *)v35 sunrise];
  [v28 timeIntervalSince1970];
  double v30 = v29;

  BOOL v31 = v24 <= v27;
  if (v24 >= v30) {
    BOOL v31 = 1;
  }
  BOOL v32 = v24 > v30;
  if (v24 >= v27) {
    BOOL v32 = 0;
  }
  if (v27 > v30) {
    BOOL v33 = v32;
  }
  else {
    BOOL v33 = v31;
  }
  [(WAForecastOperation *)v35 setIsDay:v33];
}

- (void)_mapReferralLinks
{
  id v10 = (id)objc_opt_new();
  v3 = [(WAForecastOperation *)self currentWeatherConditions];
  v4 = [v3 valueForComponent:*MEMORY[0x263F85FF8]];

  uint64_t v5 = [(WAForecastOperation *)self currentWeatherConditions];
  uint64_t v6 = [v5 valueForComponent:*MEMORY[0x263F86008]];

  id v7 = [(WAForecastOperation *)self currentWeatherConditions];
  id v8 = [v7 valueForComponent:*MEMORY[0x263F86068]];

  if (v4) {
    [v10 setObject:v4 forKeyedSubscript:@"ios"];
  }
  if (v8) {
    [v10 setObject:v8 forKeyedSubscript:@"web"];
  }
  id v9 = v10;
  if (v6)
  {
    [v10 setObject:v6 forKeyedSubscript:@"mobile"];
    id v9 = v10;
  }
  [(WAForecastOperation *)self setLinks:v9];
}

- (WAForecastModel)forecastModel
{
  v3 = [(WAForecastOperation *)self error];

  if (v3)
  {
    v4 = 0;
  }
  else
  {
    v4 = objc_opt_new();
    uint64_t v5 = [(WAForecastOperation *)self city];
    [v4 setCity:v5];

    uint64_t v6 = [(WAForecastOperation *)self location];
    [v4 setLocation:v6];

    id v7 = [(WAForecastOperation *)self currentConditions];
    [v4 setCurrentConditions:v7];

    id v8 = [(WAForecastOperation *)self hourlyForecasts];
    [v4 setHourlyForecasts:v8];

    id v9 = [(WAForecastOperation *)self dailyForecasts];
    [v4 setDailyForecasts:v9];

    id v10 = [(WAForecastOperation *)self airQualityConditions];
    [v4 setAirQualityConditions:v10];

    uint64_t v11 = [(WAForecastOperation *)self sunrise];
    [v4 setSunrise:v11];

    uint64_t v12 = [(WAForecastOperation *)self sunset];
    [v4 setSunset:v12];

    id v13 = [(WAForecastOperation *)self currentWeatherConditions];
    id v14 = [v13 valueForComponent:*MEMORY[0x263F85FF8]];
    [v4 setDeepLink:v14];

    id v15 = [(WAForecastOperation *)self currentWeatherConditions];
    v16 = [v15 valueForComponent:*MEMORY[0x263F86008]];
    [v4 setLink:v16];

    id v17 = [(WAForecastOperation *)self currentWeatherConditions];
    [v4 setUnderlyingCurrentConditions:v17];

    v18 = [(WAForecastOperation *)self hourlyForecastConditions];
    [v4 setUnderlyingHourlyConditions:v18];

    id v19 = [(WAForecastOperation *)self dailyForecastConditions];
    [v4 setUnderlyingDailyConditions:v19];

    v20 = [(WAForecastOperation *)self changeForecasts];
    [v4 setChangeForecasts:v20];

    id v21 = [(WAForecastOperation *)self severeWeatherEvents];
    [v4 setSevereWeatherEvents:v21];

    v22 = [(WAForecastOperation *)self nextHourPrecipitation];
    [v4 setNextHourPrecipitation:v22];
  }
  return (WAForecastModel *)v4;
}

- (City)city
{
  return self->_city;
}

- (void)setCity:(id)a3
{
}

- (WFLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (WACurrentForecast)currentConditions
{
  return self->_currentConditions;
}

- (void)setCurrentConditions:(id)a3
{
}

- (WFAirQualityConditions)airQualityConditions
{
  return self->_airQualityConditions;
}

- (void)setAirQualityConditions:(id)a3
{
}

- (NSArray)hourlyForecasts
{
  return self->_hourlyForecasts;
}

- (void)setHourlyForecasts:(id)a3
{
}

- (NSArray)dailyForecasts
{
  return self->_dailyForecasts;
}

- (void)setDailyForecasts:(id)a3
{
}

- (NSDate)sunrise
{
  return self->_sunrise;
}

- (void)setSunrise:(id)a3
{
}

- (NSDate)sunset
{
  return self->_sunset;
}

- (void)setSunset:(id)a3
{
}

- (NSDictionary)links
{
  return self->_links;
}

- (void)setLinks:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (WFWeatherConditions)currentWeatherConditions
{
  return self->_currentWeatherConditions;
}

- (void)setCurrentWeatherConditions:(id)a3
{
}

- (NSArray)dailyForecastConditions
{
  return self->_dailyForecastConditions;
}

- (void)setDailyForecastConditions:(id)a3
{
}

- (NSArray)hourlyForecastConditions
{
  return self->_hourlyForecastConditions;
}

- (void)setHourlyForecastConditions:(id)a3
{
}

- (NSArray)severeWeatherEvents
{
  return self->_severeWeatherEvents;
}

- (void)setSevereWeatherEvents:(id)a3
{
}

- (NSArray)changeForecasts
{
  return self->_changeForecasts;
}

- (void)setChangeForecasts:(id)a3
{
}

- (WFNextHourPrecipitation)nextHourPrecipitation
{
  return self->_nextHourPrecipitation;
}

- (void)setNextHourPrecipitation:(id)a3
{
}

- (WFAggregateCommonRequest)aggregateRequest
{
  return self->_aggregateRequest;
}

- (void)setAggregateRequest:(id)a3
{
}

- (BOOL)isDay
{
  return self->_isDay;
}

- (void)setIsDay:(BOOL)a3
{
  self->_isDay = a3;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (void)setCalendar:(id)a3
{
}

- (NSLocale)locale
{
  return (NSLocale *)objc_getProperty(self, a2, 400, 1);
}

- (void)setLocale:(id)a3
{
}

- (NSString)trackingParameter
{
  return (NSString *)objc_getProperty(self, a2, 408, 1);
}

- (void)setTrackingParameter:(id)a3
{
}

- (BOOL)shouldAttachRawAPIData
{
  return self->_shouldAttachRawAPIData;
}

- (void)setShouldAttachRawAPIData:(BOOL)a3
{
  self->_shouldAttachRawAPIData = a3;
}

- (NSData)rawAPIData
{
  return self->_rawAPIData;
}

- (void)setRawAPIData:(id)a3
{
}

- (int)units
{
  return self->_units;
}

- (void)setUnits:(int)a3
{
  self->_units = a3;
}

- (WFRequestOptions)requestOptions
{
  return self->_requestOptions;
}

- (void)setRequestOptions:(id)a3
{
}

- (WFServiceConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (BOOL)canGeocode
{
  return self->_canGeocode;
}

- (void)setCanGeocode:(BOOL)a3
{
  self->_canGeocode = a3;
}

- (BOOL)isLocationInGeocodeSample
{
  return self->_isLocationInGeocodeSample;
}

- (void)setIsLocationInGeocodeSample:(BOOL)a3
{
  self->_isLocationInGeocodeSample = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_requestOptions, 0);
  objc_storeStrong((id *)&self->_rawAPIData, 0);
  objc_storeStrong((id *)&self->_trackingParameter, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_aggregateRequest, 0);
  objc_storeStrong((id *)&self->_nextHourPrecipitation, 0);
  objc_storeStrong((id *)&self->_changeForecasts, 0);
  objc_storeStrong((id *)&self->_severeWeatherEvents, 0);
  objc_storeStrong((id *)&self->_hourlyForecastConditions, 0);
  objc_storeStrong((id *)&self->_dailyForecastConditions, 0);
  objc_storeStrong((id *)&self->_currentWeatherConditions, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_links, 0);
  objc_storeStrong((id *)&self->_sunset, 0);
  objc_storeStrong((id *)&self->_sunrise, 0);
  objc_storeStrong((id *)&self->_dailyForecasts, 0);
  objc_storeStrong((id *)&self->_hourlyForecasts, 0);
  objc_storeStrong((id *)&self->_airQualityConditions, 0);
  objc_storeStrong((id *)&self->_currentConditions, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_city, 0);
}

- (void)_needsGeolocation
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = [a1 location];
  v4 = @"Unpopulated properties within WFLocation";
  if (!v3) {
    v4 = @"No WFLocation";
  }
  int v5 = 138412290;
  uint64_t v6 = v4;
  _os_log_error_impl(&dword_226D1D000, a2, OS_LOG_TYPE_ERROR, "Executing Geocode for reason: %@", (uint8_t *)&v5, 0xCu);
}

@end