@interface WeatherOpenURLHelper
+ (BOOL)handleOpenURL:(id)a3 withContainerViewController:(id)a4;
+ (BOOL)handleOpenURL:(id)a3 withContainerViewController:(id)a4 completion:(id)a5;
+ (id)URLForCity:(id)a3;
+ (id)URLForWeatherCityComponents:(id)a3;
+ (id)cityFromURL:(id)a3 withContainerViewController:(id)a4;
+ (id)cityFromURLComponents:(id)a3 listedCities:(id)a4;
+ (id)transientCityFromURLComponents:(id)a3;
+ (void)displayCity:(id)a3 usingController:(id)a4 completion:(id)a5;
+ (void)presentAddTransientCityDialog:(id)a3 usingController:(id)a4;
@end

@implementation WeatherOpenURLHelper

+ (id)URLForCity:(id)a3
{
  v4 = [a3 urlComponents];
  v5 = [a1 URLForWeatherCityComponents:v4];

  return v5;
}

+ (id)URLForWeatherCityComponents:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"lat"];
  if (v4)
  {
    v5 = [v3 objectForKeyedSubscript:@"long"];
    if (v5)
    {
      BOOL v6 = 0;
    }
    else
    {
      v7 = [v3 objectForKeyedSubscript:@"lng"];
      BOOL v6 = v7 == 0;
    }
  }
  else
  {
    BOOL v6 = 1;
  }

  v8 = [v3 objectForKeyedSubscript:@"index"];

  v9 = [v3 objectForKeyedSubscript:@"isLocal"];
  int v10 = [v9 BOOLValue];

  if (!v6 || v8 || v10)
  {
    v12 = [MEMORY[0x263EFF980] array];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __52__WeatherOpenURLHelper_URLForWeatherCityComponents___block_invoke;
    v16[3] = &unk_2647E15A0;
    id v17 = v12;
    id v13 = v12;
    [v3 enumerateKeysAndObjectsUsingBlock:v16];
    id v14 = objc_alloc_init(MEMORY[0x263F08BA0]);
    [v14 setScheme:@"weather"];
    [v14 setQueryItems:v13];
    v11 = [v14 URL];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __52__WeatherOpenURLHelper_URLForWeatherCityComponents___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [v5 stringValue];

    id v5 = (id)v6;
  }
  v7 = *(void **)(a1 + 32);
  v8 = [MEMORY[0x263F08BD0] queryItemWithName:v9 value:v5];
  [v7 addObject:v8];
}

+ (id)cityFromURL:(id)a3 withContainerViewController:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x263EFF9A0] dictionary];
  v8 = [MEMORY[0x263F08BA0] componentsWithURL:v5 resolvingAgainstBaseURL:0];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = [v8 queryItems];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v15 = [v14 value];
        v16 = [v14 name];
        [v7 setObject:v15 forKeyedSubscript:v16];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v11);
  }

  id v17 = [v7 objectForKey:@"index"];
  v18 = [v6 cities];
  if (v17) {
    objc_msgSend(v18, "objectAtIndex:", objc_msgSend(v17, "integerValue"));
  }
  else {
  v19 = [a1 cityFromURLComponents:v7 listedCities:v18];
  }

  return v19;
}

+ (BOOL)handleOpenURL:(id)a3 withContainerViewController:(id)a4
{
  return [a1 handleOpenURL:a3 withContainerViewController:a4 completion:0];
}

+ (BOOL)handleOpenURL:(id)a3 withContainerViewController:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [a1 cityFromURL:a3 withContainerViewController:v8];
  if (v10) {
    [a1 displayCity:v10 usingController:v8 completion:v9];
  }

  return v10 != 0;
}

+ (void)displayCity:(id)a3 usingController:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  id v17 = __63__WeatherOpenURLHelper_displayCity_usingController_completion___block_invoke;
  v18 = &unk_2647E15C8;
  id v11 = v9;
  id v19 = v11;
  id v12 = v8;
  id v20 = v12;
  id v13 = v10;
  id v21 = v13;
  id v22 = a1;
  id v14 = (void (**)(void))MEMORY[0x22A668850](&v15);
  if (objc_msgSend(MEMORY[0x263F08B88], "isMainThread", v15, v16, v17, v18)) {
    v14[2](v14);
  }
  else {
    dispatch_async(MEMORY[0x263EF83A0], v14);
  }
}

void __63__WeatherOpenURLHelper_displayCity_usingController_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) cities];
  uint64_t v3 = [v2 indexOfObject:*(void *)(a1 + 40)];

  if ([*(id *)(a1 + 40) isTransient]) {
    BOOL v4 = v3 == 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4)
  {
    [*(id *)(a1 + 32) addAndUpdateViewsForCity:*(void *)(a1 + 40)];
    id v5 = [*(id *)(a1 + 32) cities];
    uint64_t v3 = [v5 indexOfObject:*(void *)(a1 + 40)];
  }
  [*(id *)(a1 + 32) showPageForCityAtIndex:v3 animated:0 completion:0];
  id v6 = +[WeatherPreferences sharedPreferences];
  [v6 setActiveCity:v3];

  uint64_t v7 = *(void *)(a1 + 48);
  if (v7) {
    (*(void (**)(void))(v7 + 16))();
  }
  id v8 = [*(id *)(a1 + 32) cities];
  unint64_t v9 = [v8 count];

  if (v9 < 0x14)
  {
    id v10 = *(void **)(a1 + 56);
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    [v10 presentAddTransientCityDialog:v11 usingController:v12];
  }
}

+ (void)presentAddTransientCityDialog:(id)a3 usingController:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isTransient])
  {
    uint64_t v7 = NSString;
    id v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    unint64_t v9 = [v8 localizedStringForKey:@"ADD_TRANSIENT_CITY_ALERT_TITLE-%@" value:&stru_26DADC2F0 table:@"WeatherFrameworkLocalizableStrings"];
    id v10 = [v5 name];
    uint64_t v11 = objc_msgSend(v7, "stringWithFormat:", v9, v10);

    uint64_t v12 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:v11 message:0 preferredStyle:1];
    id v13 = NSString;
    id v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v15 = [v14 localizedStringForKey:@"ADD_TRANSIENT_CITY_ALERT_CANCEL_TITLE" value:&stru_26DADC2F0 table:@"WeatherFrameworkLocalizableStrings"];
    uint64_t v16 = [v13 stringWithFormat:v15];

    id v17 = [MEMORY[0x263F1C3F0] actionWithTitle:v16 style:1 handler:&__block_literal_global_18];
    [v12 addAction:v17];

    v18 = NSString;
    id v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v20 = [v19 localizedStringForKey:@"ADD_TRANSIENT_CITY_ALERT_ADD_TITLE" value:&stru_26DADC2F0 table:@"WeatherFrameworkLocalizableStrings"];
    id v21 = [v18 stringWithFormat:v20];

    id v22 = (void *)MEMORY[0x263F1C3F0];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __70__WeatherOpenURLHelper_presentAddTransientCityDialog_usingController___block_invoke_2;
    v25[3] = &unk_2647E1610;
    id v26 = v5;
    id v23 = v6;
    id v27 = v23;
    long long v24 = [v22 actionWithTitle:v21 style:0 handler:v25];
    [v12 addAction:v24];

    [v23 presentViewController:v12 animated:1 completion:0];
  }
}

uint64_t __70__WeatherOpenURLHelper_presentAddTransientCityDialog_usingController___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setTransient:0];
  v2 = *(void **)(a1 + 40);
  return [v2 saveStateToDisk];
}

+ (id)cityFromURLComponents:(id)a3 listedCities:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 objectForKey:@"lat"];
  unint64_t v9 = [v6 objectForKey:@"long"];
  id v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = [v6 objectForKey:@"lng"];
  }
  uint64_t v12 = v11;

  id v13 = [v6 objectForKey:@"city"];
  id v14 = objc_alloc(MEMORY[0x263F00A50]);
  [v8 floatValue];
  double v16 = v15;
  [v12 floatValue];
  v18 = (void *)[v14 initWithLatitude:v16 longitude:v17];
  id v19 = [v6 objectForKey:@"isLocal"];
  int v20 = [v19 BOOLValue];

  if (!v20
    || (objc_msgSend(v7, "na_firstObjectPassingTest:", &__block_literal_global_56),
        (id v21 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v21 = +[City cityContainingLocation:v18 expectedName:v13 fromCities:v7];
    if (!v21)
    {
      id v21 = [a1 transientCityFromURLComponents:v6];
    }
  }

  return v21;
}

uint64_t __59__WeatherOpenURLHelper_cityFromURLComponents_listedCities___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isLocalWeatherCity];
}

+ (id)transientCityFromURLComponents:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 objectForKey:@"lat"];
  id v5 = [v3 objectForKey:@"long"];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [v3 objectForKey:@"lng"];
  }
  id v8 = v7;

  unint64_t v9 = [v3 objectForKey:@"city"];
  id v10 = objc_opt_new();
  [v10 setName:v9];
  [v4 floatValue];
  [v10 setLatitude:v11];
  [v8 floatValue];
  [v10 setLongitude:v12];
  [v10 setTransient:1];
  [v10 update];

  return v10;
}

@end