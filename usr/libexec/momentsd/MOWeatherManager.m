@interface MOWeatherManager
- (MODefaultsManager)defaultManager;
- (MOWeatherManager)init;
- (MOWeatherManager)initWithUniverse:(id)a3;
- (OS_dispatch_queue)queue;
- (_TtC8momentsd21MOWeatherDataProvider)weatherDataProvider;
- (void)_rehydrateWeather:(id)a3 handler:(id)a4;
- (void)fetchWeatherBetweenStartDate:(id)a3 StartDate:(id)a4 EndDate:(id)a5 handler:(id)a6;
- (void)rehydrateWeather:(id)a3 handler:(id)a4;
- (void)setWeatherDataProvider:(id)a3;
@end

@implementation MOWeatherManager

- (MOWeatherManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)MOWeatherManager;
  v2 = [(MOWeatherManager *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("MOWeatherManager", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    uint64_t v6 = objc_opt_new();
    weatherDataProvider = v2->_weatherDataProvider;
    v2->_weatherDataProvider = (_TtC8momentsd21MOWeatherDataProvider *)v6;
  }
  return v2;
}

- (MOWeatherManager)initWithUniverse:(id)a3
{
  id v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  v7 = [v4 getService:v6];

  v16.receiver = self;
  v16.super_class = (Class)MOWeatherManager;
  v8 = [(MOWeatherManager *)&v16 init];
  if (v8)
  {
    objc_super v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("MOWeatherManager", v9);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v10;

    uint64_t v12 = objc_opt_new();
    weatherDataProvider = v8->_weatherDataProvider;
    v8->_weatherDataProvider = (_TtC8momentsd21MOWeatherDataProvider *)v12;

    objc_storeStrong((id *)&v8->_defaultManager, v7);
    v14 = [(MOWeatherManager *)v8 defaultManager];
    [v14 setObject:&__kCFBooleanTrue forKey:@"MODefaultsWeatherManagerRequestsDisabled"];
  }
  return v8;
}

- (void)fetchWeatherBetweenStartDate:(id)a3 StartDate:(id)a4 EndDate:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [(MOWeatherManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __75__MOWeatherManager_fetchWeatherBetweenStartDate_StartDate_EndDate_handler___block_invoke;
  block[3] = &unk_1002CA300;
  block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(v14, block);
}

void __75__MOWeatherManager_fetchWeatherBetweenStartDate_StartDate_EndDate_handler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  v3 = *(void **)(*(void *)(a1 + 32) + 16);
  id v4 = *(void **)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __75__MOWeatherManager_fetchWeatherBetweenStartDate_StartDate_EndDate_handler___block_invoke_2;
  v6[3] = &unk_1002CAD60;
  id v7 = v4;
  id v8 = *(id *)(a1 + 56);
  id v9 = *(id *)(a1 + 64);
  [v3 fetchHourlyWeatherFor:v2 startDate:v7 endDate:v5 completion:v6];
}

void __75__MOWeatherManager_fetchWeatherBetweenStartDate_StartDate_EndDate_handler___block_invoke_2(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 count])
  {
    id v7 = _mo_log_facility_get_os_log(&MOLogFacilityWeather);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = [v5 objectAtIndex:0];
      id v9 = [v8 getWeatherSummary];
      uint64_t v10 = a1[4];
      uint64_t v11 = a1[5];
      int v12 = 138412802;
      id v13 = v9;
      __int16 v14 = 2112;
      uint64_t v15 = v10;
      __int16 v16 = 2112;
      uint64_t v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Weather condition is %@ between %@ and %@", (uint8_t *)&v12, 0x20u);
    }
  }
  (*(void (**)(void))(a1[6] + 16))();
}

- (void)rehydrateWeather:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MOWeatherManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __45__MOWeatherManager_rehydrateWeather_handler___block_invoke;
  block[3] = &unk_1002CAD38;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

id __45__MOWeatherManager_rehydrateWeather_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _rehydrateWeather:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_rehydrateWeather:(id)a3 handler:(id)a4
{
  id v41 = a3;
  v40 = (void (**)(void))a4;
  v44 = self;
  id v6 = [(MOWeatherManager *)self queue];
  dispatch_assert_queue_V2(v6);

  id v7 = dispatch_group_create();
  uint64_t v71 = 0;
  v72 = &v71;
  uint64_t v73 = 0x3032000000;
  v74 = __Block_byref_object_copy__10;
  v75 = __Block_byref_object_dispose__10;
  id v76 = objc_alloc_init((Class)NSMutableArray);
  v69[0] = 0;
  v69[1] = v69;
  v69[2] = 0x3032000000;
  v69[3] = __Block_byref_object_copy__10;
  v69[4] = __Block_byref_object_dispose__10;
  id v70 = 0;
  id v8 = _mo_log_facility_get_os_log(&MOLogFacilityWeather);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    id v12 = [v41 count];
    *(_DWORD *)buf = 138412802;
    *(void *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2048;
    id v79 = v12;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%@, %@, Fetch Weather Data START, events count, %lu", buf, 0x20u);
  }
  id v13 = [(MOWeatherManager *)self defaultManager];
  __int16 v14 = [v13 objectForKey:@"MODefaultsWeatherManagerRequestsDisabled"];
  unsigned int v15 = [v14 BOOLValue];

  if (v15)
  {
    __int16 v16 = _mo_log_facility_get_os_log(&MOLogFacilityWeather);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      v19 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v18;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v19;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%@, %@, Fetch Weather Data END, the call to weather service is disabled by the default settings", buf, 0x16u);
    }
    if (v40)
    {
      v40[2]();
    }
    else
    {
      v36 = _mo_log_facility_get_os_log(&MOLogFacilityWeather);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v37 = (objc_class *)objc_opt_class();
        NSStringFromClass(v37);
        id v38 = (id)objc_claimAutoreleasedReturnValue();
        v39 = NSStringFromSelector(a2);
        [(MOWeatherManager *)v38 _rehydrateWeather:buf handler:v36];
      }
    }
  }
  else
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    id v79 = 0;
    v68[0] = 0;
    v68[1] = v68;
    v68[2] = 0x2020000000;
    v68[3] = 0;
    uint64_t v64 = 0;
    v65 = &v64;
    uint64_t v66 = 0x2020000000;
    uint64_t v67 = 0;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id obj = v41;
    id v20 = [obj countByEnumeratingWithState:&v60 objects:v77 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v61;
      do
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v61 != v21) {
            objc_enumerationMutation(obj);
          }
          id v23 = *(void **)(*((void *)&v60 + 1) + 8 * i);
          id v24 = objc_alloc((Class)CLLocation);
          v25 = [v23 location];
          [v25 latitude];
          double v27 = v26;
          v28 = [v23 location];
          [v28 longitude];
          id v30 = [v24 initWithLatitude:v27 longitude:v29];

          dispatch_group_enter(v7);
          v31 = [v23 predominantWeather];
          LODWORD(v24) = v31 == 0;

          if (v24)
          {
            ++v65[3];
            weatherDataProvider = v44->_weatherDataProvider;
            v33 = [v23 startDate];
            v34 = [v23 endDate];
            v53[0] = _NSConcreteStackBlock;
            v53[1] = 3221225472;
            v53[2] = __46__MOWeatherManager__rehydrateWeather_handler___block_invoke;
            v53[3] = &unk_1002CB518;
            v53[4] = v23;
            v53[5] = v44;
            v55 = v68;
            v56 = v69;
            v57 = buf;
            v58 = &v71;
            SEL v59 = a2;
            v54 = v7;
            [(MOWeatherDataProvider *)weatherDataProvider fetchHourlyWeatherFor:v30 startDate:v33 endDate:v34 completion:v53];
          }
          else
          {
            [(id)v72[5] addObject:v23];
            dispatch_group_leave(v7);
          }
        }
        id v20 = [obj countByEnumeratingWithState:&v60 objects:v77 count:16];
      }
      while (v20);
    }

    v35 = [(MOWeatherManager *)v44 queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __46__MOWeatherManager__rehydrateWeather_handler___block_invoke_100;
    block[3] = &unk_1002CB540;
    v47 = &v64;
    v48 = v68;
    SEL v52 = a2;
    v49 = buf;
    v50 = &v71;
    v51 = v69;
    block[4] = v44;
    v46 = v40;
    dispatch_group_notify(v7, v35, block);

    _Block_object_dispose(&v64, 8);
    _Block_object_dispose(v68, 8);
    _Block_object_dispose(buf, 8);
  }
  _Block_object_dispose(v69, 8);

  _Block_object_dispose(&v71, 8);
}

void __46__MOWeatherManager__rehydrateWeather_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 count])
  {
    id v19 = v6;
    id v20 = v5;
    ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    id v7 = [v5 objectAtIndex:0];
    id v18 = [MOWeather alloc];
    uint64_t v17 = +[NSUUID UUID];
    id v8 = [*(id *)(a1 + 32) startDate];
    id v9 = [*(id *)(a1 + 32) endDate];
    id v10 = [v7 weatherSummary];
    id v11 = [v7 symbolName];
    id v12 = [v7 temperature];
    id v13 = [v7 windSpeed];
    __int16 v14 = [(MOWeather *)v18 initWithWeatherIdentifier:v17 startDate:v8 endDate:v9 weatherSummary:v10 weatherSymbolName:v11 temperature:v12 windSpeed:v13];

    [(MOWeather *)v14 setSourceEventAccessType:5];
    [*(id *)(a1 + 32) setPredominantWeather:v14];
    unsigned int v15 = _mo_log_facility_get_os_log(&MOLogFacilityWeather);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      __46__MOWeatherManager__rehydrateWeather_handler___block_invoke_cold_2(a1, (id *)(a1 + 32), v15);
    }

    id v6 = v19;
    id v5 = v20;
  }
  else if (v6)
  {
    __int16 v16 = _mo_log_facility_get_os_log(&MOLogFacilityWeather);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      __46__MOWeatherManager__rehydrateWeather_handler___block_invoke_cold_1(a1, (uint64_t)v6, v16);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a3);
    ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  }
  [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) addObject:*(void *)(a1 + 32)];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __46__MOWeatherManager__rehydrateWeather_handler___block_invoke_100(uint64_t a1)
{
  uint64_t v2 = _mo_log_facility_get_os_log(&MOLogFacilityWeather);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = (objc_class *)objc_opt_class();
    id v4 = NSStringFromClass(v3);
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 88));
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    int v11 = 138413314;
    id v12 = v4;
    __int16 v13 = 2112;
    __int16 v14 = v5;
    __int16 v15 = 2048;
    uint64_t v16 = v6;
    __int16 v17 = 2048;
    uint64_t v18 = v7;
    __int16 v19 = 2048;
    uint64_t v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%@, %@, Fetch Weather Data END, attempted %lu weather requests, successfully fethed weather data for %lu events and %lu weather fetch errors occured.", (uint8_t *)&v11, 0x34u);
  }
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9)
  {
    (*(void (**)(uint64_t, void, void))(v9 + 16))(v9, *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40));
  }
  else
  {
    id v10 = _mo_log_facility_get_os_log(&MOLogFacilityWeather);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __46__MOWeatherManager__rehydrateWeather_handler___block_invoke_100_cold_1(a1, v10);
    }
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (_TtC8momentsd21MOWeatherDataProvider)weatherDataProvider
{
  return self->_weatherDataProvider;
}

- (void)setWeatherDataProvider:(id)a3
{
}

- (MODefaultsManager)defaultManager
{
  return self->_defaultManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultManager, 0);
  objc_storeStrong((id *)&self->_weatherDataProvider, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_rehydrateWeather:(uint8_t *)buf handler:(os_log_t)log .cold.1(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%@, %@, nil handler", buf, 0x16u);
}

void __46__MOWeatherManager__rehydrateWeather_handler___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  id v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  uint64_t v7 = NSStringFromSelector(*(SEL *)(a1 + 88));
  uint64_t v8 = [*(id *)(a1 + 32) eventIdentifier];
  uint64_t v9 = [*(id *)(a1 + 32) predominantWeather];
  id v10 = [v9 weatherSummary];
  int v11 = [*(id *)(a1 + 32) predominantWeather];
  id v12 = [v11 startDate];
  __int16 v13 = [*(id *)(a1 + 32) predominantWeather];
  __int16 v14 = [v13 endDate];
  *(_DWORD *)buf = 138413826;
  __int16 v17 = v6;
  __int16 v18 = 2112;
  __int16 v19 = v7;
  __int16 v20 = 2112;
  uint64_t v21 = a2;
  __int16 v22 = 2112;
  id v23 = v8;
  __int16 v24 = 2112;
  v25 = v10;
  __int16 v26 = 2112;
  double v27 = v12;
  __int16 v28 = 2112;
  double v29 = v14;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%@, %@, error %@ fetching weather for the event %@, weather condition for the first hour is %@ between %@ and %@ ", buf, 0x48u);
}

void __46__MOWeatherManager__rehydrateWeather_handler___block_invoke_cold_2(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  uint64_t v8 = NSStringFromSelector(*(SEL *)(a1 + 88));
  uint64_t v9 = [*a2 eventIdentifier];
  id v10 = [*a2 predominantWeather];
  int v11 = [v10 weatherSummary];
  id v12 = [*a2 predominantWeather];
  __int16 v13 = [v12 startDate];
  __int16 v14 = [*a2 predominantWeather];
  __int16 v15 = [v14 endDate];
  int v16 = 138413570;
  __int16 v17 = v7;
  __int16 v18 = 2112;
  __int16 v19 = v8;
  __int16 v20 = 2112;
  uint64_t v21 = v9;
  __int16 v22 = 2112;
  id v23 = v11;
  __int16 v24 = 2112;
  v25 = v13;
  __int16 v26 = 2112;
  double v27 = v15;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "%@, %@, Just finished processing weather rehydrate for the event %@, weather condition for the first hour is %@ between %@ and %@ ", (uint8_t *)&v16, 0x3Eu);
}

void __46__MOWeatherManager__rehydrateWeather_handler___block_invoke_100_cold_1(uint64_t a1, NSObject *a2)
{
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = NSStringFromSelector(*(SEL *)(a1 + 88));
  int v7 = 138412546;
  uint64_t v8 = v5;
  __int16 v9 = 2112;
  id v10 = v6;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%@, %@, nil handler", (uint8_t *)&v7, 0x16u);
}

@end