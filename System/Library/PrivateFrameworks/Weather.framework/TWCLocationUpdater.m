@interface TWCLocationUpdater
+ (id)sharedLocationUpdater;
- (CLGeocoder)reverseGeocoder;
- (City)currentCity;
- (TWCLocationUpdater)init;
- (ct_green_tea_logger_s)greenTeaLogger;
- (void)_completeReverseGeocodeForLocation:(id)a3 currentCity:(id)a4 geocodeError:(id)a5 completionHandler:(id)a6;
- (void)_geocodeLocation:(id)a3 currentCity:(id)a4 completionHandler:(id)a5;
- (void)_updateWeatherForLocation:(id)a3 city:(id)a4 completionHandler:(id)a5;
- (void)dealloc;
- (void)enableProgressIndicator:(BOOL)a3;
- (void)parsedResultCity:(id)a3;
- (void)setCurrentCity:(id)a3;
- (void)setGreenTeaLogger:(ct_green_tea_logger_s *)a3;
- (void)setReverseGeocoder:(id)a3;
- (void)updateWeatherForCities:(id)a3 withCompletionHandler:(id)a4;
- (void)updateWeatherForCity:(id)a3;
- (void)updateWeatherForLocation:(id)a3 city:(id)a4;
- (void)updateWeatherForLocation:(id)a3 city:(id)a4 isFromFrameworkClient:(BOOL)a5 withCompletionHandler:(id)a6;
@end

@implementation TWCLocationUpdater

+ (id)sharedLocationUpdater
{
  if (sharedLocationUpdater_onceToken != -1) {
    dispatch_once(&sharedLocationUpdater_onceToken, &__block_literal_global_22);
  }
  v2 = (void *)sharedLocationUpdater___sharedLocationUpdater;
  return v2;
}

uint64_t __43__TWCLocationUpdater_sharedLocationUpdater__block_invoke()
{
  v0 = objc_alloc_init(TWCLocationUpdater);
  v1 = (void *)sharedLocationUpdater___sharedLocationUpdater;
  sharedLocationUpdater___sharedLocationUpdater = (uint64_t)v0;

  v2 = +[WeatherInternalPreferences sharedInternalPreferences];
  __internalInstall = [v2 isInternalInstall];

  v3 = +[WeatherInternalPreferences sharedInternalPreferences];
  v4 = [v3 objectForKey:@"ForceLocalFallback"];
  [v4 BOOLValue];

  v5 = +[WeatherInternalPreferences sharedInternalPreferences];
  v6 = [v5 objectForKey:@"kMaxLatLonAccuracy"];
  __maxLatLonAccuracy = [v6 intValue];

  uint64_t result = [(id)*MEMORY[0x263F1D020] launchedToTest];
  __launchedToTest = result;
  if (__maxLatLonAccuracy <= 0) {
    __maxLatLonAccuracy = 5;
  }
  return result;
}

- (TWCLocationUpdater)init
{
  v4.receiver = self;
  v4.super_class = (Class)TWCLocationUpdater;
  v2 = [(TWCCityUpdater *)&v4 init];
  if (v2) {
    v2->_greenTeaLogger = (ct_green_tea_logger_s *)ct_green_tea_logger_create();
  }
  return v2;
}

- (void)dealloc
{
  [(TWCLocationUpdater *)self greenTeaLogger];
  ct_green_tea_logger_destroy();
  v3.receiver = self;
  v3.super_class = (Class)TWCLocationUpdater;
  [(TWCLocationUpdater *)&v3 dealloc];
}

- (void)parsedResultCity:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 locationID];
  if (v4)
  {
    v5 = (void *)v4;
    char v6 = [v3 isRequestedByFrameworkClient];

    if ((v6 & 1) == 0)
    {
      v7 = [v3 wfLocation];
      v8 = [v7 displayName];
      if (v8)
      {
        [v3 setName:v8];
      }
      else
      {
        v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v10 = [v9 localizedStringForKey:@"LOCAL_WEATHER" value:&stru_26DADC2F0 table:@"WeatherFrameworkLocalizableStrings"];
        [v3 setName:v10];
      }
      v11 = [v7 geoLocation];
      [v3 setLocation:v11];

      v12 = [MEMORY[0x263EFF910] date];
      [v3 setUpdateTime:v12];

      v13 = +[WeatherPreferences sharedPreferences];
      if (__internalInstall)
      {
        v14 = +[WeatherInternalPreferences sharedInternalPreferences];
        v15 = [v14 objectForKey:@"RandomizeWeather"];
        int v16 = [v15 BOOLValue];

        if (v16)
        {
          v17 = (void *)[objc_alloc(MEMORY[0x263F85F70]) initWithTemperatureUnit:2 value:(double)(rand() % 50 - 50)];
          [v3 setTemperature:v17];
          [v3 setConditionCode:rand() % 37];
          v18 = WALogForCategory(0);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
            -[TWCLocationUpdater parsedResultCity:](v18);
          }
        }
      }
      [v13 saveToDiskWithLocalWeatherCity:v3];
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.weather.localCityChanged", 0, 0, 1u);
    }
  }
  if (__launchedToTest) {
    BOOL v20 = 1;
  }
  else {
    BOOL v20 = __internalInstall == 0;
  }
  if (!v20)
  {
    v21 = [MEMORY[0x263F08A00] defaultCenter];
    [v21 postNotificationName:@"RestStateNotification" object:0];
  }
}

- (void)enableProgressIndicator:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = (id *)MEMORY[0x263F1D020];
  if ([(id)*MEMORY[0x263F1D020] conformsToProtocol:&unk_26DB0DE50]
    && [*v4 showProgressIndicator])
  {
    id v5 = +[ProgressController sharedProgressController];
    [v5 setLoadingData:v3];
  }
}

- (void)updateWeatherForCity:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = WALogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    char v6 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "isLocalWeatherCity"));
    int v11 = 138412546;
    id v12 = v4;
    __int16 v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_226D1D000, v5, OS_LOG_TYPE_DEFAULT, "Update weather for city : %@, isLocalWeatherCity=%@", (uint8_t *)&v11, 0x16u);
  }
  if ([v4 isLocalWeatherCity])
  {
    v7 = +[WeatherLocationManager sharedWeatherLocationManager];
    v8 = [v7 location];
    v9 = WALogForCategory(0);
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        int v11 = 138412290;
        id v12 = v8;
        _os_log_impl(&dword_226D1D000, v9, OS_LOG_TYPE_DEFAULT, "Has location: %@", (uint8_t *)&v11, 0xCu);
      }

      [(TWCLocationUpdater *)self updateWeatherForLocation:v8 city:v4];
    }
    else
    {
      if (v10)
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_226D1D000, v9, OS_LOG_TYPE_DEFAULT, "Does not have location from location manager, force location update", (uint8_t *)&v11, 2u);
      }

      [v7 forceLocationUpdate];
    }
  }
}

- (void)updateWeatherForLocation:(id)a3 city:(id)a4 isFromFrameworkClient:(BOOL)a5 withCompletionHandler:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  [v11 setIsRequestedByFrameworkClient:v6];
  [v11 setIsLocalWeatherCity:1];
  [(TWCLocationUpdater *)self _updateWeatherForLocation:v12 city:v11 completionHandler:v10];
}

- (void)updateWeatherForLocation:(id)a3 city:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v6 setIsRequestedByFrameworkClient:0];
  [(TWCLocationUpdater *)self _updateWeatherForLocation:v7 city:v6 completionHandler:0];
}

- (void)_updateWeatherForLocation:(id)a3 city:(id)a4 completionHandler:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  id v11 = WALogForCategory(0);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315650;
    v14 = "-[TWCLocationUpdater _updateWeatherForLocation:city:completionHandler:]";
    __int16 v15 = 2112;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v9;
    _os_log_impl(&dword_226D1D000, v11, OS_LOG_TYPE_DEFAULT, "%s currentLocation=%@, localCity=%@", (uint8_t *)&v13, 0x20u);
  }

  if (v9)
  {
    [(TWCLocationUpdater *)self setCurrentCity:v9];
    [(TWCLocationUpdater *)self _geocodeLocation:v8 currentCity:v9 completionHandler:v10];
  }
  else if (v10)
  {
    id v12 = WAErrorWithCode(4, 0, 0, 0);
    v10[2](v10, 0, v12);
  }
}

- (void)_geocodeLocation:(id)a3 currentCity:(id)a4 completionHandler:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = WALogForCategory(4);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v22 = "-[TWCLocationUpdater _geocodeLocation:currentCity:completionHandler:]";
    __int16 v23 = 2112;
    id v24 = v8;
    __int16 v25 = 2112;
    id v26 = v9;
    _os_log_impl(&dword_226D1D000, v11, OS_LOG_TYPE_DEFAULT, "%s location=%@, currentCity=%@", buf, 0x20u);
  }

  if ([v9 isLocalWeatherCity])
  {
    [(TWCLocationUpdater *)self greenTeaLogger];
    id v12 = getCTGreenTeaOsLogHandle();
    int v13 = v12;
    if (v12 && os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226D1D000, v13, OS_LOG_TYPE_INFO, "Transmitting current location to CoreLocation for reverse geocode request.", buf, 2u);
    }
  }
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __69__TWCLocationUpdater__geocodeLocation_currentCity_completionHandler___block_invoke;
  v17[3] = &unk_2647E1860;
  v17[4] = self;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  dispatch_async(MEMORY[0x263EF83A0], v17);
}

void __69__TWCLocationUpdater__geocodeLocation_currentCity_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) reverseGeocoder];
  int v3 = [v2 isGeocoding];

  if (v3)
  {
    id v4 = WALogForCategory(4);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [*(id *)(a1 + 32) reverseGeocoder];
      uint64_t v6 = *(void *)(a1 + 40);
      uint64_t v7 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138412802;
      v22 = v5;
      __int16 v23 = 2112;
      uint64_t v24 = v6;
      __int16 v25 = 2112;
      uint64_t v26 = v7;
      _os_log_impl(&dword_226D1D000, v4, OS_LOG_TYPE_DEFAULT, "cancelGeocode reverseGeocoder=%@ for location=%@, currentCity=%@", buf, 0x20u);
    }
    id v8 = [*(id *)(a1 + 32) reverseGeocoder];
    [v8 cancelGeocode];
  }
  id v9 = objc_alloc_init(MEMORY[0x263F00A40]);
  [*(id *)(a1 + 32) setReverseGeocoder:v9];
  id v10 = WALogForCategory(4);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = *(void **)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138412546;
    v22 = v11;
    __int16 v23 = 2112;
    uint64_t v24 = v12;
    _os_log_impl(&dword_226D1D000, v10, OS_LOG_TYPE_DEFAULT, "Will start reverseGeocodeLocation: location=%@, currentCity=%@", buf, 0x16u);
  }

  int v13 = *(void **)(a1 + 40);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __69__TWCLocationUpdater__geocodeLocation_currentCity_completionHandler___block_invoke_33;
  v16[3] = &unk_2647E1838;
  id v17 = v13;
  id v14 = *(id *)(a1 + 48);
  uint64_t v15 = *(void *)(a1 + 32);
  id v18 = v14;
  uint64_t v19 = v15;
  id v20 = *(id *)(a1 + 56);
  [v9 reverseGeocodeLocation:v17 completionHandler:v16];
}

void __69__TWCLocationUpdater__geocodeLocation_currentCity_completionHandler___block_invoke_33(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = WALogForCategory(4);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v5 firstObject];
    uint64_t v9 = *(void *)(a1 + 32);
    int v17 = 138412802;
    id v18 = v8;
    __int16 v19 = 2112;
    uint64_t v20 = v9;
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl(&dword_226D1D000, v7, OS_LOG_TYPE_DEFAULT, "Reverse-geocoded Weather Location finished: placemark=%@, location=%@, error=%@", (uint8_t *)&v17, 0x20u);
  }
  if (v6)
  {
    id v10 = 0;
  }
  else
  {
    id v11 = objc_alloc(MEMORY[0x263F10960]);
    id v12 = objc_alloc(MEMORY[0x263F109E0]);
    int v13 = [v5 firstObject];
    id v14 = (void *)[v12 initWithPlacemark:v13];
    uint64_t v15 = (void *)[v11 initWithPlacemark:v14];

    id v16 = WALogForCategory(4);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      id v18 = v15;
      _os_log_impl(&dword_226D1D000, v16, OS_LOG_TYPE_DEFAULT, "ReversGeocoded mapitem is: %@", (uint8_t *)&v17, 0xCu);
    }

    id v10 = objc_msgSend(objc_alloc(MEMORY[0x263F85F30]), "initWithMapItem:isCurrentLocation:", v15, objc_msgSend(*(id *)(a1 + 40), "isLocalWeatherCity"));
  }
  [*(id *)(a1 + 48) _completeReverseGeocodeForLocation:v10 currentCity:*(void *)(a1 + 40) geocodeError:v6 completionHandler:*(void *)(a1 + 56)];
}

- (void)_completeReverseGeocodeForLocation:(id)a3 currentCity:(id)a4 geocodeError:(id)a5 completionHandler:(id)a6
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = (void (**)(id, id, void *))a6;
  id v14 = WALogForCategory(4);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v37 = "-[TWCLocationUpdater _completeReverseGeocodeForLocation:currentCity:geocodeError:completionHandler:]";
    __int16 v38 = 2112;
    id v39 = v10;
    __int16 v40 = 2112;
    id v41 = v11;
    __int16 v42 = 2112;
    id v43 = v12;
    _os_log_impl(&dword_226D1D000, v14, OS_LOG_TYPE_DEFAULT, "%s resultLocation=%@, currentCity=%@, geocodeError=%@", buf, 0x2Au);
  }

  uint64_t v15 = +[WeatherPreferences sharedPreferences];
  id v16 = v15;
  if (v12)
  {
    [v15 saveToDiskWithLocalWeatherCity:v11];
    int v17 = WALogForCategory(4);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[TWCLocationUpdater _completeReverseGeocodeForLocation:currentCity:geocodeError:completionHandler:]((uint64_t)v12, (uint64_t)v11, v17);
    }

    id v18 = [v12 domain];
    if ([v18 isEqualToString:*MEMORY[0x263F00AF8]])
    {
      uint64_t v19 = [v12 code];

      if (v19 == 10)
      {
        id v20 = v12;
LABEL_15:
        __int16 v25 = v20;
        [v11 cityDidFinishUpdatingWithError:v20];
        if (v13) {
          v13[2](v13, v11, v25);
        }

        goto LABEL_24;
      }
    }
    else
    {
    }
    WAErrorWithCode(2, v12, v11, 0);
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  __int16 v21 = NSNumber;
  id v22 = [MEMORY[0x263EFF910] date];
  [v22 timeIntervalSince1970];
  uint64_t v23 = objc_msgSend(v21, "numberWithDouble:");
  [v16 writeDefaultValue:v23 forKey:@"LastLocationParseTime"];

  uint64_t v24 = WALogForCategory(4);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v37 = (const char *)v11;
    __int16 v38 = 2112;
    id v39 = v10;
    _os_log_impl(&dword_226D1D000, v24, OS_LOG_TYPE_DEFAULT, "Updating City '%@' with geocode location '%@'", buf, 0x16u);
  }

  [v11 setWfLocation:v10];
  [v11 clearForecasts];
  id v16 = [v10 displayName];
  if (v16)
  {
    [v11 setName:v16];
  }
  else
  {
    uint64_t v26 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v27 = [v26 localizedStringForKey:@"LOCAL_WEATHER" value:&stru_26DADC2F0 table:@"WeatherFrameworkLocalizableStrings"];
    [v11 setName:v27];
  }
  v28 = +[WeatherPreferences sharedPreferences];
  [v28 saveToDiskWithLocalWeatherCity:v11];

  v29 = WALogForCategory(4);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v37 = (const char *)v10;
    __int16 v38 = 2112;
    id v39 = v11;
    _os_log_impl(&dword_226D1D000, v29, OS_LOG_TYPE_DEFAULT, "Received reverse geocode for %@, currentCity=%@", buf, 0x16u);
  }

  v30 = WALogForCategory(4);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v37 = (const char *)v11;
    _os_log_impl(&dword_226D1D000, v30, OS_LOG_TYPE_DEFAULT, "Updating weather for currentCity: %@", buf, 0xCu);
  }

  id v35 = v11;
  v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v35 count:1];
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __100__TWCLocationUpdater__completeReverseGeocodeForLocation_currentCity_geocodeError_completionHandler___block_invoke;
  v32[3] = &unk_2647E1888;
  v32[4] = self;
  id v33 = v11;
  v34 = v13;
  [(TWCLocationUpdater *)self updateWeatherForCities:v31 withCompletionHandler:v32];

LABEL_24:
}

void __100__TWCLocationUpdater__completeReverseGeocodeForLocation_currentCity_geocodeError_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)(a1 + 40);
  [*(id *)(a1 + 32) parsedResultCity:*(void *)(a1 + 40)];
  id v6 = WALogForCategory(0);
  uint64_t v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __100__TWCLocationUpdater__completeReverseGeocodeForLocation_currentCity_geocodeError_completionHandler___block_invoke_cold_1((void *)(a1 + 40), (uint64_t)v4, v7);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *v5;
    int v10 = 138412290;
    uint64_t v11 = v8;
    _os_log_impl(&dword_226D1D000, v7, OS_LOG_TYPE_DEFAULT, "Finished forecast retrieval for: %@", (uint8_t *)&v10, 0xCu);
  }

  uint64_t v9 = *(void *)(a1 + 48);
  if (v9) {
    (*(void (**)(uint64_t, void, id))(v9 + 16))(v9, *v5, v4);
  }
}

- (void)updateWeatherForCities:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = WALogForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v11 = "-[TWCLocationUpdater updateWeatherForCities:withCompletionHandler:]";
    __int16 v12 = 2112;
    int v13 = self;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl(&dword_226D1D000, v8, OS_LOG_TYPE_DEFAULT, "%s self=%@, updating weather for cities: %@ in locationUpdater", buf, 0x20u);
  }

  [(TWCCityUpdater *)self cancel];
  v9.receiver = self;
  v9.super_class = (Class)TWCLocationUpdater;
  [(TWCCityUpdater *)&v9 updateWeatherForCities:v6 withCompletionHandler:v7];
}

- (City)currentCity
{
  return self->_currentCity;
}

- (void)setCurrentCity:(id)a3
{
}

- (CLGeocoder)reverseGeocoder
{
  return self->_reverseGeocoder;
}

- (void)setReverseGeocoder:(id)a3
{
}

- (ct_green_tea_logger_s)greenTeaLogger
{
  return self->_greenTeaLogger;
}

- (void)setGreenTeaLogger:(ct_green_tea_logger_s *)a3
{
  self->_greenTeaLogger = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reverseGeocoder, 0);
  objc_storeStrong((id *)&self->_currentCity, 0);
}

- (void)parsedResultCity:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_226D1D000, log, OS_LOG_TYPE_DEBUG, "Internal Weather update debug mode enabled.", v1, 2u);
}

- (void)_completeReverseGeocodeForLocation:(NSObject *)a3 currentCity:geocodeError:completionHandler:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)int v3 = 138412546;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_1(&dword_226D1D000, a2, a3, "ReverseGeocode completed with error: %@, save the failed city: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

void __100__TWCLocationUpdater__completeReverseGeocodeForLocation_currentCity_geocodeError_completionHandler___block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)int v3 = 138412546;
  *(void *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_1(&dword_226D1D000, a2, a3, "Forecast retrieval failed retrieval for %@ with error %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

@end