@interface TWCCityUpdater
+ (id)sharedCityUpdater;
- (BOOL)isUpdatingCity:(id)a3;
- (NSLocale)locale;
- (NSString)trackingParameter;
- (TWCCityUpdater)init;
- (WAForecastModelController)forecastModelController;
- (WALocationPrivacySampler)locationGeocodingSampler;
- (WeatherUpdaterDelegate)delegate;
- (void)cancel;
- (void)configureWithLocationGeocodingSampler:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setForecastModelController:(id)a3;
- (void)setLocale:(id)a3;
- (void)setTrackingParameter:(id)a3;
- (void)updateWeatherForCities:(id)a3;
- (void)updateWeatherForCities:(id)a3 withCompletionHandler:(id)a4;
- (void)updateWeatherForCity:(id)a3;
@end

@implementation TWCCityUpdater

+ (id)sharedCityUpdater
{
  if (sharedCityUpdater_onceToken != -1) {
    dispatch_once(&sharedCityUpdater_onceToken, &__block_literal_global_15);
  }
  v2 = (void *)sharedCityUpdater_sharedCityUpdater;
  return v2;
}

uint64_t __35__TWCCityUpdater_sharedCityUpdater__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = sharedCityUpdater_sharedCityUpdater;
  sharedCityUpdater_sharedCityUpdater = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (TWCCityUpdater)init
{
  v5.receiver = self;
  v5.super_class = (Class)TWCCityUpdater;
  v2 = [(TWCCityUpdater *)&v5 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [(TWCCityUpdater *)v2 setForecastModelController:v3];
  }
  return v2;
}

- (void)configureWithLocationGeocodingSampler:(id)a3
{
}

- (BOOL)isUpdatingCity:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(TWCCityUpdater *)self forecastModelController];
  char v6 = [v5 isCityBeingUpdated:v4];

  return v6;
}

- (void)cancel
{
  id v2 = [(TWCCityUpdater *)self forecastModelController];
  [v2 cancelAllFetchRequests];
}

- (NSString)trackingParameter
{
  id v2 = [(TWCCityUpdater *)self forecastModelController];
  v3 = [v2 trackingParameter];

  return (NSString *)v3;
}

- (void)setTrackingParameter:(id)a3
{
  id v4 = a3;
  id v5 = [(TWCCityUpdater *)self forecastModelController];
  [v5 setTrackingParameter:v4];
}

- (void)updateWeatherForCity:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(TWCCityUpdater *)self forecastModelController];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39__TWCCityUpdater_updateWeatherForCity___block_invoke;
  v7[3] = &unk_2647E0E50;
  id v6 = v4;
  id v8 = v6;
  objc_copyWeak(&v9, &location);
  [v5 fetchForecastForCity:v6 completion:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __39__TWCCityUpdater_updateWeatherForCity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __39__TWCCityUpdater_updateWeatherForCity___block_invoke_2;
  v9[3] = &unk_2647E0E28;
  id v10 = v6;
  id v11 = *(id *)(a1 + 32);
  id v12 = v5;
  id v7 = v5;
  id v8 = v6;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  dispatch_async(MEMORY[0x263EF83A0], v9);
  objc_destroyWeak(&v13);
}

void __39__TWCCityUpdater_updateWeatherForCity___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2)
  {
    [*(id *)(a1 + 40) updateCityForModel:*(void *)(a1 + 48)];
    uint64_t v2 = *(void *)(a1 + 32);
  }
  [*(id *)(a1 + 40) cityDidFinishUpdatingWithError:v2];
  uint64_t v3 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v4 = [WeakRetained delegate];
  id v5 = v4;
  uint64_t v6 = *(void *)(a1 + 40);
  if (v3) {
    [v4 city:v6 failedToUpdateWithError:*(void *)(a1 + 32)];
  }
  else {
    [v4 cityDidUpdateWeather:v6];
  }
}

- (void)updateWeatherForCities:(id)a3
{
}

- (void)updateWeatherForCities:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = WALogForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v29 = "-[TWCCityUpdater updateWeatherForCities:withCompletionHandler:]";
    __int16 v30 = 2112;
    v31 = self;
    __int16 v32 = 2112;
    id v33 = v6;
    _os_log_impl(&dword_226D1D000, v8, OS_LOG_TYPE_DEFAULT, "%s self=%@, updating weather for cities: %@ in city updater", buf, 0x20u);
  }

  unint64_t v9 = [v6 count];
  if (v7 || v9 > 1)
  {
    dispatch_group_t v11 = dispatch_group_create();
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __63__TWCCityUpdater_updateWeatherForCities_withCompletionHandler___block_invoke;
    v26[3] = &unk_2647E0E78;
    id v12 = v11;
    v27 = v12;
    [v6 enumerateObjectsUsingBlock:v26];
    id v13 = [(TWCCityUpdater *)self delegate];
    objc_initWeak((id *)buf, v13);

    v14 = objc_opt_new();
    v15 = [(TWCCityUpdater *)self forecastModelController];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __63__TWCCityUpdater_updateWeatherForCities_withCompletionHandler___block_invoke_2;
    v22[3] = &unk_2647E0EC8;
    objc_copyWeak(&v25, (id *)buf);
    id v16 = v14;
    id v23 = v16;
    id v10 = v12;
    v24 = v10;
    [v15 fetchForecastForCities:v6 completion:v22];

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __63__TWCCityUpdater_updateWeatherForCities_withCompletionHandler___block_invoke_6;
    block[3] = &unk_2647E0EF0;
    id v21 = v7;
    id v19 = v16;
    id v20 = v6;
    id v17 = v16;
    dispatch_group_notify(v10, MEMORY[0x263EF83A0], block);

    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    id v10 = [v6 firstObject];
    [(TWCCityUpdater *)self updateWeatherForCity:v10];
  }
}

void __63__TWCCityUpdater_updateWeatherForCities_withCompletionHandler___block_invoke(uint64_t a1)
{
}

void __63__TWCCityUpdater_updateWeatherForCities_withCompletionHandler___block_invoke_2(id *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __63__TWCCityUpdater_updateWeatherForCities_withCompletionHandler___block_invoke_3;
  v13[3] = &unk_2647E0EA0;
  id v14 = v9;
  id v15 = v7;
  id v16 = v8;
  id v10 = v8;
  id v11 = v7;
  id v12 = v9;
  objc_copyWeak(&v19, a1 + 6);
  id v17 = a1[4];
  id v18 = a1[5];
  dispatch_async(MEMORY[0x263EF83A0], v13);

  objc_destroyWeak(&v19);
}

void __63__TWCCityUpdater_updateWeatherForCities_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v3 = (uint64_t *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2)
  {
    id v4 = WALogForCategory(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = *(void *)(a1 + 48);
      int v9 = 138412546;
      uint64_t v10 = v5;
      __int16 v11 = 2112;
      uint64_t v12 = v6;
      _os_log_impl(&dword_226D1D000, v4, OS_LOG_TYPE_DEFAULT, "Success updated city: %@, with forecast model: %@", (uint8_t *)&v9, 0x16u);
    }

    [*(id *)(a1 + 40) updateCityForModel:*(void *)(a1 + 48)];
    uint64_t v2 = *(void *)(a1 + 32);
  }
  [*(id *)(a1 + 40) cityDidFinishUpdatingWithError:v2];
  if (*(void *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 56), "addObject:");
    id v7 = WALogForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __63__TWCCityUpdater_updateWeatherForCities_withCompletionHandler___block_invoke_3_cold_1(v3, (uint64_t *)(a1 + 40), v7);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    [WeakRetained city:*(void *)(a1 + 40) failedToUpdateWithError:*(void *)(a1 + 32)];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    [WeakRetained cityDidUpdateWeather:*(void *)(a1 + 40)];
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

void __63__TWCCityUpdater_updateWeatherForCities_withCompletionHandler___block_invoke_6(uint64_t a1)
{
  v9[1] = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 48))
  {
    uint64_t v2 = [*(id *)(a1 + 32) count];
    uint64_t v3 = *(void **)(a1 + 32);
    if (v2 == 1)
    {
      id v4 = [v3 firstObject];
    }
    else if ([v3 count])
    {
      uint64_t v5 = (void *)MEMORY[0x263F087E8];
      uint64_t v6 = *(void *)(a1 + 32);
      id v8 = @"errors";
      v9[0] = v6;
      id v7 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
      id v4 = [v5 errorWithDomain:@"com.apple.weather.errorDomain" code:7 userInfo:v7];
    }
    else
    {
      id v4 = 0;
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (WeatherUpdaterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WeatherUpdaterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
}

- (WALocationPrivacySampler)locationGeocodingSampler
{
  return self->_locationGeocodingSampler;
}

- (WAForecastModelController)forecastModelController
{
  return self->_forecastModelController;
}

- (void)setForecastModelController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_forecastModelController, 0);
  objc_storeStrong((id *)&self->_locationGeocodingSampler, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __63__TWCCityUpdater_updateWeatherForCities_withCompletionHandler___block_invoke_3_cold_1(uint64_t *a1, uint64_t *a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  uint64_t v4 = *a2;
  int v5 = 138412546;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  _os_log_error_impl(&dword_226D1D000, log, OS_LOG_TYPE_ERROR, "Forecast retrieval error: %@ for city: %@", (uint8_t *)&v5, 0x16u);
}

@end