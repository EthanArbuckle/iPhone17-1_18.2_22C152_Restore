@interface CityPersistenceConversions
+ (BOOL)cityDictionaryHasValidCoordinates:(id)a3;
+ (BOOL)isCityValid:(id)a3;
+ (id)cityFromALCity:(id)a3;
+ (id)cityFromCloudDictionary:(id)a3;
+ (id)cityFromDictionary:(id)a3;
+ (id)cloudDictionaryRepresentationOfALCity:(id)a3;
+ (id)cloudDictionaryRepresentationOfCity:(id)a3;
+ (id)dayForecastDictionariesFromCity:(id)a3;
+ (id)dictionaryRepresentationOfCity:(id)a3;
+ (id)dictionaryRepresentationOfScaleCategory:(id)a3;
+ (id)dictionaryRepresentationOfTemperature:(id)a3;
+ (id)hourlyForecastDictionariesFromCity:(id)a3;
+ (id)scaleCategoryFromDictionaryRepresentation:(id)a3;
+ (id)temperatureFromDictionaryRepresentation:(id)a3;
+ (id)weatherDetailsDictionaryFromCity:(id)a3;
+ (void)populateCity:(id)a3 withDayForecastDictionaries:(id)a4;
+ (void)populateCity:(id)a3 withHourlyForecastDictionaries:(id)a4;
@end

@implementation CityPersistenceConversions

+ (id)cityFromDictionary:(id)a3
{
  v92[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v92[0] = @"Name";
  v92[1] = @"Lat";
  v92[2] = @"Lon";
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v92 count:3];
  v89[0] = MEMORY[0x263EF8330];
  v89[1] = 3221225472;
  v89[2] = __49__CityPersistenceConversions_cityFromDictionary___block_invoke;
  v89[3] = &unk_2647E0DC0;
  id v6 = v4;
  id v90 = v6;
  if (!objc_msgSend(v5, "na_all:", v89))
  {
    v7 = 0;
    goto LABEL_28;
  }
  v84 = v5;
  v7 = objc_alloc_init(City);
  v8 = [v6 objectForKey:@"Name"];
  [(City *)v7 setName:v8];

  v9 = [v6 objectForKey:@"Lat"];
  [v9 doubleValue];
  -[City setLatitude:](v7, "setLatitude:");

  v10 = [v6 objectForKey:@"Lon"];
  [v10 doubleValue];
  -[City setLongitude:](v7, "setLongitude:");

  v11 = [v6 objectForKey:@"Country"];
  [(City *)v7 setISO3166CountryAbbreviation:v11];

  v12 = NSURL;
  v13 = [v6 objectForKey:@"Link"];
  v14 = [v12 URLWithString:v13];
  [(City *)v7 setLink:v14];

  v15 = NSURL;
  v16 = [v6 objectForKey:@"Deeplink"];
  v17 = [v15 URLWithString:v16];
  [(City *)v7 setDeeplink:v17];

  v18 = [v6 objectForKey:@"UpdateStatus"];
  -[City setLastUpdateStatus:](v7, "setLastUpdateStatus:", (int)[v18 intValue]);

  v19 = [v6 objectForKey:@"UpateTime"];
  [(City *)v7 setUpdateTime:v19];

  v20 = [v6 objectForKey:@"WindChill"];
  [v20 floatValue];
  -[City setWindChill:](v7, "setWindChill:");

  v21 = [v6 objectForKey:@"HeatIndex"];
  [v21 floatValue];
  -[City setHeatIndex:](v7, "setHeatIndex:");

  v22 = objc_opt_class();
  v23 = [v6 objectForKey:@"FeelsLike"];
  v24 = [v22 temperatureFromDictionaryRepresentation:v23];
  [(City *)v7 setFeelsLike:v24];

  v25 = [v6 objectForKey:@"DewPoint"];
  [v25 floatValue];
  -[City setDewPoint:](v7, "setDewPoint:");

  v26 = [v6 objectForKey:@"WindSpeed"];
  [v26 floatValue];
  -[City setWindSpeed:](v7, "setWindSpeed:");

  v27 = [v6 objectForKey:@"WindDirection"];
  [v27 floatValue];
  -[City setWindDirection:](v7, "setWindDirection:");

  v28 = [v6 objectForKey:@"Humidity"];
  [v28 floatValue];
  -[City setHumidity:](v7, "setHumidity:");

  v29 = [v6 objectForKey:@"Visibility"];
  [v29 floatValue];
  -[City setVisibility:](v7, "setVisibility:");

  v30 = [v6 objectForKey:@"Pressure"];
  [v30 floatValue];
  -[City setPressure:](v7, "setPressure:");

  v31 = [v6 objectForKey:@"PressureRising"];
  -[City setPressureRising:](v7, "setPressureRising:", [v31 integerValue]);

  v32 = objc_opt_class();
  v33 = [v6 objectForKey:@"Temperature"];
  v34 = [v32 temperatureFromDictionaryRepresentation:v33];
  [(City *)v7 setTemperature:v34];

  if (v6)
  {
    v35 = [v6 objectForKey:@"BigIcon"];
    -[City setConditionCode:](v7, "setConditionCode:", [v35 unsignedIntValue]);
  }
  else
  {
    [(City *)v7 setConditionCode:3200];
  }
  v36 = [v6 objectForKey:@"ObservationTime"];
  -[City setObservationTime:](v7, "setObservationTime:", [v36 unsignedIntValue]);

  v37 = [v6 objectForKey:@"SunsetTime"];
  -[City setSunsetTime:](v7, "setSunsetTime:", [v37 unsignedIntValue]);

  v38 = [v6 objectForKey:@"SunriseTime"];
  -[City setSunriseTime:](v7, "setSunriseTime:", [v38 unsignedIntValue]);

  v39 = [v6 objectForKey:@"MoonPhase"];
  -[City setMoonPhase:](v7, "setMoonPhase:", [v39 unsignedIntValue]);

  v40 = [v6 objectForKey:@"AirQualityIdxKey"];
  [(City *)v7 setAirQualityIdx:v40];

  v41 = [v6 objectForKey:@"AirQualityCategoryKey"];
  [(City *)v7 setAirQualityCategory:v41];

  v42 = [v6 objectForKey:@"AirQualitySignificance"];
  -[City setAirQualitySignificance:](v7, "setAirQualitySignificance:", [v42 unsignedIntegerValue]);

  v43 = [v6 objectForKey:@"CityWeatherDisplayName"];
  [(City *)v7 setWeatherDisplayName:v43];

  v44 = [v6 objectForKey:@"CityWeatherLocationName"];
  [(City *)v7 setWeatherLocationName:v44];

  v45 = [v6 objectForKey:@"CitySearchTitle"];
  [(City *)v7 setSearchTitle:v45];

  v46 = [v6 objectForKey:@"CitySearchSubtitle"];
  [(City *)v7 setSearchSubtitle:v46];

  uint64_t v47 = [v6 objectForKey:@"TimeZone"];
  if (v47)
  {
    v48 = [MEMORY[0x263EFFA18] timeZoneWithName:v47];
    [(City *)v7 setTimeZone:v48];
  }
  uint64_t v49 = [(City *)v7 location];
  if (v49)
  {
    v50 = (void *)v49;
    uint64_t v51 = [(City *)v7 name];
    if (!v51)
    {
LABEL_14:

      goto LABEL_15;
    }
    v52 = (void *)v51;
    v53 = [(City *)v7 timeZone];

    if (v53)
    {
      v50 = objc_opt_new();
      v54 = [(City *)v7 name];
      [v50 setDisplayName:v54];

      v55 = [(City *)v7 location];
      [v50 setGeoLocation:v55];

      v56 = [(City *)v7 weatherDisplayName];
      [v50 setWeatherDisplayName:v56];

      v57 = [(City *)v7 weatherLocationName];
      [v50 setWeatherLocationName:v57];

      v58 = [(City *)v7 ISO3166CountryAbbreviation];

      if (v58)
      {
        v59 = [(City *)v7 ISO3166CountryAbbreviation];
        [v50 setCountryAbbreviation:v59];
      }
      v60 = [(City *)v7 timeZone];
      [v50 setTimeZone:v60];

      [(City *)v7 setWfLocation:v50];
      goto LABEL_14;
    }
  }
LABEL_15:
  v61 = [v6 objectForKey:@"CityTimeZoneUpdateDateKey"];
  unint64_t v62 = [v61 unsignedIntegerValue];

  v83 = (void *)v47;
  if (v62) {
    [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:(double)v62];
  }
  else {
  v82 = [MEMORY[0x263EFF910] distantPast];
  }
  [(City *)v7 setTimeZoneUpdateDate:v82];
  v63 = [v6 objectForKeyedSubscript:@"Past24HoursPrecipitation"];
  [v63 floatValue];
  [(City *)v7 setPrecipitationPast24Hours:v64];

  v65 = [v6 objectForKeyedSubscript:@"UVIndex"];
  -[City setUVIndex:](v7, "setUVIndex:", [v65 unsignedIntegerValue]);

  v66 = [v6 objectForKeyedSubscript:@"DayForecasts"];
  [a1 populateCity:v7 withDayForecastDictionaries:v66];

  v67 = [v6 objectForKeyedSubscript:@"HourlyForecasts"];
  [a1 populateCity:v7 withHourlyForecastDictionaries:v67];

  v68 = objc_opt_class();
  v69 = [v6 objectForKeyedSubscript:@"AQIScaleCategory"];
  v70 = [v68 scaleCategoryFromDictionaryRepresentation:v69];
  [(City *)v7 setAirQualityScaleCategory:v70];

  v71 = [v6 objectForKey:@"NextHourPrecipitation"];
  if (v71)
  {
    v72 = (void *)[objc_alloc(MEMORY[0x263F85F38]) initWithDictionary:v71];
    [(City *)v7 setNextHourPrecipitation:v72];
  }
  v73 = [v6 objectForKey:@"SevereWeatherEvents"];
  id v74 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  id v75 = v73;
  uint64_t v76 = [v75 countByEnumeratingWithState:&v85 objects:v91 count:16];
  if (v76)
  {
    uint64_t v77 = v76;
    uint64_t v78 = *(void *)v86;
    do
    {
      for (uint64_t i = 0; i != v77; ++i)
      {
        if (*(void *)v86 != v78) {
          objc_enumerationMutation(v75);
        }
        v80 = (void *)[objc_alloc(MEMORY[0x263F85F68]) initWithDictionary:*(void *)(*((void *)&v85 + 1) + 8 * i)];
        [v74 addObject:v80];
      }
      uint64_t v77 = [v75 countByEnumeratingWithState:&v85 objects:v91 count:16];
    }
    while (v77);
  }

  [(City *)v7 updateCityForSevereWeatherEvents:v74];
  v5 = v84;
LABEL_28:

  return v7;
}

uint64_t __49__CityPersistenceConversions_cityFromDictionary___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 allKeys];
  uint64_t v5 = [v4 containsObject:v3];

  return v5;
}

+ (void)populateCity:(id)a3 withDayForecastDictionaries:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v25 = a3;
  id v5 = a4;
  id v6 = objc_opt_new();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    int v9 = 0;
    uint64_t v10 = *(void *)v28;
    do
    {
      uint64_t v11 = 0;
      uint64_t v12 = v9;
      do
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v27 + 1) + 8 * v11);
        v14 = objc_alloc_init(WADayForecast);
        v15 = [v13 objectForKey:@"ForecastDayOfWeek"];
        -[WADayForecast setDayOfWeek:](v14, "setDayOfWeek:", [v15 unsignedIntValue]);

        [(WADayForecast *)v14 setDayNumber:v12 + v11];
        v16 = objc_opt_class();
        v17 = [v13 objectForKey:@"High"];
        v18 = [v16 temperatureFromDictionaryRepresentation:v17];
        [(WADayForecast *)v14 setHigh:v18];

        v19 = objc_opt_class();
        v20 = [v13 objectForKey:@"Low"];
        v21 = [v19 temperatureFromDictionaryRepresentation:v20];
        [(WADayForecast *)v14 setLow:v21];

        v22 = [v13 objectForKey:@"Precipitation"];
        [v22 floatValue];
        [(WADayForecast *)v14 setPercentPrecipitation:v23];

        v24 = [v13 objectForKey:@"Icon"];
        -[WADayForecast setIcon:](v14, "setIcon:", [v24 unsignedIntValue]);

        objc_msgSend(v6, "na_safeAddObject:", v14);
        ++v11;
      }
      while (v8 != v11);
      uint64_t v8 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      int v9 = v12 + v11;
    }
    while (v8);
  }

  [v25 setDayForecasts:v6];
}

+ (void)populateCity:(id)a3 withHourlyForecastDictionaries:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v20 = a3;
  id v5 = a4;
  id v6 = objc_opt_new();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v23;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v22 + 1) + 8 * v10);
        uint64_t v12 = objc_alloc_init(WAHourlyForecast);
        v13 = objc_opt_class();
        v14 = [v11 objectForKey:@"Temperature"];
        v15 = [v13 temperatureFromDictionaryRepresentation:v14];
        [(WAHourlyForecast *)v12 setTemperature:v15];

        v16 = [v11 objectForKey:@"Time24"];
        [(WAHourlyForecast *)v12 setTime:v16];

        v17 = [v11 objectForKey:@"Condition"];
        -[WAHourlyForecast setConditionCode:](v12, "setConditionCode:", [v17 integerValue]);

        v18 = [v11 objectForKey:@"Precipitation"];
        [v18 floatValue];
        [(WAHourlyForecast *)v12 setPercentPrecipitation:v19];

        objc_msgSend(v6, "na_safeAddObject:", v12);
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v8);
  }

  [v20 setHourlyForecasts:v6];
}

+ (BOOL)isCityValid:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && ([v3 coordinate], CLLocationCoordinate2DIsValid(v8)))
  {
    id v5 = [v4 name];
    BOOL v6 = [v5 length] != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

+ (id)dictionaryRepresentationOfScaleCategory:(id)a3
{
  v13[3] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 localizedCategoryDescription];
    if (v5 && [v4 categoryIndex])
    {
      BOOL v6 = [v4 scaleClassName];

      if (v6)
      {
        v12[0] = @"AQICategoryDescription";
        uint64_t v7 = [v4 localizedCategoryDescription];
        v13[0] = v7;
        v12[1] = @"AQICategoryIndex";
        CLLocationCoordinate2D v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "categoryIndex"));
        v13[1] = v8;
        v12[2] = @"AQIScaleClass";
        uint64_t v9 = [v4 scaleClassName];
        v13[2] = v9;
        uint64_t v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:3];

        goto LABEL_8;
      }
    }
    else
    {
    }
  }
  uint64_t v10 = 0;
LABEL_8:

  return v10;
}

+ (id)scaleCategoryFromDictionaryRepresentation:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"AQICategoryIndex"];
  uint64_t v5 = [v4 integerValue];

  uint64_t v6 = [v3 objectForKeyedSubscript:@"AQICategoryDescription"];
  uint64_t v7 = (void *)v6;
  CLLocationCoordinate2D v8 = &stru_26DADC2F0;
  if (v6) {
    CLLocationCoordinate2D v8 = (__CFString *)v6;
  }
  uint64_t v9 = v8;

  uint64_t v10 = [v3 objectForKeyedSubscript:@"AQIScaleClass"];

  uint64_t v11 = NSClassFromString(v10);
  id v12 = objc_alloc_init(v11);
  v13 = [v12 scaleCategoryForCategoryIndex:v5 localizedCategoryDescription:v9];

  return v13;
}

+ (id)dictionaryRepresentationOfTemperature:(id)a3
{
  v18[3] = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v3 = a3;
    id v4 = NSStringFromWFTemperatureUnit();
    v17[0] = v4;
    uint64_t v5 = NSNumber;
    [v3 fahrenheit];
    uint64_t v6 = objc_msgSend(v5, "numberWithDouble:");
    v18[0] = v6;
    uint64_t v7 = NSStringFromWFTemperatureUnit();
    v17[1] = v7;
    CLLocationCoordinate2D v8 = NSNumber;
    [v3 celsius];
    uint64_t v9 = objc_msgSend(v8, "numberWithDouble:");
    v18[1] = v9;
    uint64_t v10 = NSStringFromWFTemperatureUnit();
    v17[2] = v10;
    uint64_t v11 = NSNumber;
    [v3 kelvin];
    double v13 = v12;

    v14 = [v11 numberWithDouble:v13];
    v18[2] = v14;
    v15 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:3];
  }
  else
  {
    v15 = 0;
  }
  return v15;
}

+ (id)temperatureFromDictionaryRepresentation:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v3 count])
      {
        id v4 = objc_opt_new();
        uint64_t v5 = NSStringFromWFTemperatureUnit();
        uint64_t v6 = [v3 objectForKeyedSubscript:v5];
        [v6 doubleValue];
        objc_msgSend(v4, "setCelsius:");

        uint64_t v7 = NSStringFromWFTemperatureUnit();
        CLLocationCoordinate2D v8 = [v3 objectForKeyedSubscript:v7];
        [v8 doubleValue];
        objc_msgSend(v4, "setKelvin:");

        uint64_t v9 = NSStringFromWFTemperatureUnit();
        uint64_t v10 = [v3 objectForKeyedSubscript:v9];
        [v10 doubleValue];
        objc_msgSend(v4, "setFahrenheit:");

        goto LABEL_10;
      }
    }
    else
    {
      uint64_t v11 = WALogForCategory(1);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        +[CityPersistenceConversions temperatureFromDictionaryRepresentation:](v11);
      }

      if (objc_opt_respondsToSelector())
      {
        [v3 doubleValue];
        id v4 = (void *)[objc_alloc(MEMORY[0x263F85F70]) initWithTemperatureUnit:2 value:v12];
        goto LABEL_10;
      }
    }
  }
  id v4 = 0;
LABEL_10:

  return v4;
}

+ (id)dictionaryRepresentationOfCity:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([a1 isCityValid:v4])
  {
    uint64_t v5 = [a1 weatherDetailsDictionaryFromCity:v4];
    uint64_t v6 = [a1 dayForecastDictionariesFromCity:v4];
    objc_msgSend(v5, "na_safeSetObject:forKey:", v6, @"DayForecasts");

    uint64_t v7 = [a1 hourlyForecastDictionariesFromCity:v4];
    objc_msgSend(v5, "na_safeSetObject:forKey:", v7, @"HourlyForecasts");

    CLLocationCoordinate2D v8 = [v4 nextHourPrecipitation];

    if (v8)
    {
      uint64_t v9 = [v4 nextHourPrecipitation];
      uint64_t v10 = [v9 dictionaryRepresentation];
      [v5 setObject:v10 forKey:@"NextHourPrecipitation"];
    }
    id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    double v12 = objc_msgSend(v4, "severeWeatherEvents", 0);
    uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = [*(id *)(*((void *)&v19 + 1) + 8 * i) dictionaryRepresentation];
          [v11 addObject:v17];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v14);
    }

    if ([v11 count]) {
      [v5 setObject:v11 forKey:@"SevereWeatherEvents"];
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

+ (BOOL)cityDictionaryHasValidCoordinates:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 objectForKey:@"Lat"];
  uint64_t v5 = [v3 objectForKey:@"Lon"];
  uint64_t v6 = (void *)v5;
  if (v4 && v5 && (([v4 doubleValue], v7 != 0.0) || (objc_msgSend(v6, "doubleValue"), v8 != 0.0)))
  {
    BOOL v10 = 1;
  }
  else
  {
    uint64_t v9 = WALogForCategory(5);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v3;
      _os_log_impl(&dword_226D1D000, v9, OS_LOG_TYPE_DEFAULT, "Not loading city due to invalid coordinates: %@", (uint8_t *)&v12, 0xCu);
    }

    BOOL v10 = 0;
  }

  return v10;
}

+ (id)dayForecastDictionariesFromCity:(id)a3
{
  id v4 = a3;
  if ([a1 isCityValid:v4])
  {
    uint64_t v5 = [v4 dayForecasts];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __62__CityPersistenceConversions_dayForecastDictionariesFromCity___block_invoke;
    v8[3] = &__block_descriptor_40_e23__16__0__WADayForecast_8l;
    v8[4] = a1;
    uint64_t v6 = objc_msgSend(v5, "na_map:", v8);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

id __62__CityPersistenceConversions_dayForecastDictionariesFromCity___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263EFF9A0];
  id v3 = a2;
  id v4 = [v2 dictionary];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [v3 high];
  double v7 = [v5 dictionaryRepresentationOfTemperature:v6];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v7, @"High");

  double v8 = objc_opt_class();
  uint64_t v9 = [v3 low];
  BOOL v10 = [v8 dictionaryRepresentationOfTemperature:v9];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v10, @"Low");

  id v11 = NSNumber;
  [v3 percentPrecipitation];
  int v12 = objc_msgSend(v11, "numberWithDouble:");
  objc_msgSend(v4, "na_safeSetObject:forKey:", v12, @"Precipitation");

  id v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "icon"));
  objc_msgSend(v4, "na_safeSetObject:forKey:", v13, @"Icon");

  uint64_t v14 = NSNumber;
  uint64_t v15 = [v3 dayOfWeek];

  v16 = [v14 numberWithUnsignedInteger:v15];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v16, @"ForecastDayOfWeek");

  return v4;
}

+ (id)hourlyForecastDictionariesFromCity:(id)a3
{
  id v4 = a3;
  if ([a1 isCityValid:v4])
  {
    uint64_t v5 = [v4 hourlyForecasts];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __65__CityPersistenceConversions_hourlyForecastDictionariesFromCity___block_invoke;
    v8[3] = &__block_descriptor_40_e40___NSDictionary_16__0__WAHourlyForecast_8l;
    v8[4] = a1;
    uint64_t v6 = objc_msgSend(v5, "na_map:", v8);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

id __65__CityPersistenceConversions_hourlyForecastDictionariesFromCity___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263EFF9A0];
  id v3 = a2;
  id v4 = [v2 dictionary];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [v3 temperature];
  double v7 = [v5 dictionaryRepresentationOfTemperature:v6];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v7, @"Temperature");

  double v8 = [v3 time];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v8, @"Time24");

  uint64_t v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "conditionCode"));
  objc_msgSend(v4, "na_safeSetObject:forKey:", v9, @"Condition");

  BOOL v10 = NSNumber;
  [v3 percentPrecipitation];
  double v12 = v11;

  id v13 = [v10 numberWithDouble:v12];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v13, @"Precipitation");

  return v4;
}

+ (id)weatherDetailsDictionaryFromCity:(id)a3
{
  id v4 = a3;
  if ([a1 isCityValid:v4])
  {
    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v6 = [v4 name];
    objc_msgSend(v5, "na_safeSetObject:forKey:", v6, @"Name");

    double v7 = [v4 ISO3166CountryAbbreviation];
    objc_msgSend(v5, "na_safeSetObject:forKey:", v7, @"Country");

    double v8 = [v4 link];
    uint64_t v9 = [v8 absoluteString];
    objc_msgSend(v5, "na_safeSetObject:forKey:", v9, @"Link");

    BOOL v10 = [v4 deeplink];
    double v11 = [v10 absoluteString];
    objc_msgSend(v5, "na_safeSetObject:forKey:", v11, @"Deeplink");

    double v12 = NSNumber;
    [v4 windChill];
    id v13 = objc_msgSend(v12, "numberWithFloat:");
    objc_msgSend(v5, "na_safeSetObject:forKey:", v13, @"WindChill");

    uint64_t v14 = NSNumber;
    [v4 heatIndex];
    uint64_t v15 = objc_msgSend(v14, "numberWithFloat:");
    objc_msgSend(v5, "na_safeSetObject:forKey:", v15, @"HeatIndex");

    v16 = objc_opt_class();
    v17 = [v4 feelsLike];
    v18 = [v16 dictionaryRepresentationOfTemperature:v17];
    objc_msgSend(v5, "na_safeSetObject:forKey:", v18, @"FeelsLike");

    long long v19 = NSNumber;
    [v4 dewPoint];
    long long v20 = objc_msgSend(v19, "numberWithFloat:");
    objc_msgSend(v5, "na_safeSetObject:forKey:", v20, @"DewPoint");

    long long v21 = NSNumber;
    [v4 windSpeed];
    long long v22 = objc_msgSend(v21, "numberWithFloat:");
    objc_msgSend(v5, "na_safeSetObject:forKey:", v22, @"WindSpeed");

    long long v23 = NSNumber;
    [v4 windDirection];
    uint64_t v24 = objc_msgSend(v23, "numberWithFloat:");
    objc_msgSend(v5, "na_safeSetObject:forKey:", v24, @"WindDirection");

    long long v25 = NSNumber;
    [v4 humidity];
    v26 = objc_msgSend(v25, "numberWithFloat:");
    objc_msgSend(v5, "na_safeSetObject:forKey:", v26, @"Humidity");

    uint64_t v27 = NSNumber;
    [v4 visibility];
    long long v28 = objc_msgSend(v27, "numberWithFloat:");
    objc_msgSend(v5, "na_safeSetObject:forKey:", v28, @"Visibility");

    long long v29 = NSNumber;
    [v4 pressure];
    long long v30 = objc_msgSend(v29, "numberWithFloat:");
    objc_msgSend(v5, "na_safeSetObject:forKey:", v30, @"Pressure");

    v31 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "pressureRising"));
    objc_msgSend(v5, "na_safeSetObject:forKey:", v31, @"PressureRising");

    uint64_t v32 = NSNumber;
    [v4 latitude];
    v33 = objc_msgSend(v32, "numberWithDouble:");
    objc_msgSend(v5, "na_safeSetObject:forKey:", v33, @"Lat");

    v34 = NSNumber;
    [v4 longitude];
    v35 = objc_msgSend(v34, "numberWithDouble:");
    objc_msgSend(v5, "na_safeSetObject:forKey:", v35, @"Lon");

    v36 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "lastUpdateStatus"));
    objc_msgSend(v5, "na_safeSetObject:forKey:", v36, @"UpdateStatus");

    v37 = [v4 updateTime];
    if (v37)
    {
      objc_msgSend(v5, "na_safeSetObject:forKey:", v37, @"UpateTime");
    }
    else
    {
      v38 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:0.0];
      objc_msgSend(v5, "na_safeSetObject:forKey:", v38, @"UpateTime");
    }
    v39 = objc_opt_class();
    v40 = [v4 temperature];
    v41 = [v39 dictionaryRepresentationOfTemperature:v40];
    objc_msgSend(v5, "na_safeSetObject:forKey:", v41, @"Temperature");

    v42 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "conditionCode"));
    objc_msgSend(v5, "na_safeSetObject:forKey:", v42, @"BigIcon");

    v43 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "observationTime"));
    objc_msgSend(v5, "na_safeSetObject:forKey:", v43, @"ObservationTime");

    v44 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "sunsetTime"));
    objc_msgSend(v5, "na_safeSetObject:forKey:", v44, @"SunsetTime");

    v45 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "sunriseTime"));
    objc_msgSend(v5, "na_safeSetObject:forKey:", v45, @"SunriseTime");

    v46 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "moonPhase"));
    objc_msgSend(v5, "na_safeSetObject:forKey:", v46, @"MoonPhase");

    uint64_t v47 = [v4 airQualityIdx];
    objc_msgSend(v5, "na_safeSetObject:forKey:", v47, @"AirQualityIdxKey");

    v48 = [v4 airQualityCategory];
    objc_msgSend(v5, "na_safeSetObject:forKey:", v48, @"AirQualityCategoryKey");

    uint64_t v49 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "airQualitySignificance"));
    objc_msgSend(v5, "na_safeSetObject:forKey:", v49, @"AirQualitySignificance");

    v50 = [v4 weatherDisplayName];
    objc_msgSend(v5, "na_safeSetObject:forKey:", v50, @"CityWeatherDisplayName");

    uint64_t v51 = [v4 weatherLocationName];
    objc_msgSend(v5, "na_safeSetObject:forKey:", v51, @"CityWeatherLocationName");

    v52 = [v4 searchTitle];
    objc_msgSend(v5, "na_safeSetObject:forKey:", v52, @"CitySearchTitle");

    v53 = [v4 searchSubtitle];
    objc_msgSend(v5, "na_safeSetObject:forKey:", v53, @"CitySearchSubtitle");

    v54 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "uvIndex"));
    objc_msgSend(v5, "na_safeSetObject:forKey:", v54, @"UVIndex");

    v55 = NSNumber;
    [v4 precipitationPast24Hours];
    v56 = objc_msgSend(v55, "numberWithDouble:");
    objc_msgSend(v5, "na_safeSetObject:forKey:", v56, @"Past24HoursPrecipitation");

    v57 = [v4 timeZone];

    if (v57)
    {
      v58 = [v4 timeZone];
      v59 = [v58 name];
      objc_msgSend(v5, "na_safeSetObject:forKey:", v59, @"TimeZone");
    }
    v60 = [v4 timeZoneUpdateDate];
    if (v60)
    {
      v61 = [v4 timeZoneUpdateDate];
      unint64_t v62 = [MEMORY[0x263EFF910] distantPast];
      char v63 = [v61 isEqualToDate:v62];

      if (v63)
      {
        v60 = 0;
      }
      else
      {
        float v64 = NSNumber;
        v65 = [v4 timeZoneUpdateDate];
        [v65 timeIntervalSince1970];
        v60 = objc_msgSend(v64, "numberWithDouble:");
      }
    }
    objc_msgSend(v5, "na_safeSetObject:forKey:", v60, @"CityTimeZoneUpdateDateKey");
    v66 = objc_opt_class();
    v67 = [v4 airQualityScaleCategory];
    v68 = [v66 dictionaryRepresentationOfScaleCategory:v67];
    objc_msgSend(v5, "na_safeSetObject:forKey:", v68, @"AQIScaleCategory");
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

+ (id)cityFromCloudDictionary:(id)a3
{
  v18[3] = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = *MEMORY[0x263F85E78];
  uint64_t v5 = *MEMORY[0x263F85E68];
  v18[0] = *MEMORY[0x263F85E78];
  v18[1] = v5;
  uint64_t v6 = *MEMORY[0x263F85E70];
  v18[2] = *MEMORY[0x263F85E70];
  double v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:3];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __54__CityPersistenceConversions_cityFromCloudDictionary___block_invoke;
  v16[3] = &unk_2647E0DC0;
  id v8 = v3;
  id v17 = v8;
  if (objc_msgSend(v7, "na_all:", v16))
  {
    uint64_t v9 = objc_alloc_init(City);
    BOOL v10 = [v8 objectForKeyedSubscript:v4];
    [(City *)v9 setName:v10];

    double v11 = [v8 objectForKeyedSubscript:v5];
    [v11 doubleValue];
    -[City setLatitude:](v9, "setLatitude:");

    double v12 = [v8 objectForKeyedSubscript:v6];
    [v12 doubleValue];
    -[City setLongitude:](v9, "setLongitude:");

    id v13 = [v8 objectForKeyedSubscript:*MEMORY[0x263F85E88]];
    [(City *)v9 setSearchTitle:v13];

    uint64_t v14 = [v8 objectForKeyedSubscript:*MEMORY[0x263F85E80]];
    [(City *)v9 setSearchSubtitle:v14];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

uint64_t __54__CityPersistenceConversions_cityFromCloudDictionary___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 allKeys];
  uint64_t v5 = [v4 containsObject:v3];

  return v5;
}

+ (id)cloudDictionaryRepresentationOfCity:(id)a3
{
  v21[3] = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (([v3 isLocalWeatherCity] & 1) != 0
    || ([v3 latitude], v4 == 0.0)
    || ([v3 longitude], v5 == 0.0)
    || ([v3 name],
        id v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = [v8 length],
        v8,
        !v9))
  {
    uint64_t v6 = 0;
  }
  else
  {
    v20[0] = *MEMORY[0x263F85E78];
    BOOL v10 = [v3 name];
    v21[0] = v10;
    v20[1] = *MEMORY[0x263F85E68];
    double v11 = NSNumber;
    [v3 latitude];
    double v12 = objc_msgSend(v11, "numberWithDouble:");
    v21[1] = v12;
    v20[2] = *MEMORY[0x263F85E70];
    id v13 = NSNumber;
    [v3 longitude];
    uint64_t v14 = objc_msgSend(v13, "numberWithDouble:");
    v21[2] = v14;
    uint64_t v15 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:3];
    uint64_t v6 = (void *)[v15 mutableCopy];

    v16 = [v3 searchTitle];

    if (v16)
    {
      id v17 = [v3 searchTitle];
      [v6 setObject:v17 forKeyedSubscript:*MEMORY[0x263F85E88]];
    }
    v18 = [v3 searchSubtitle];

    if (v18)
    {
      long long v19 = [v3 searchSubtitle];
      [v6 setObject:v19 forKeyedSubscript:*MEMORY[0x263F85E80]];
    }
  }

  return v6;
}

+ (id)cityFromALCity:(id)a3
{
  id v3 = a3;
  double v4 = [v3 name];
  uint64_t v5 = [v4 length];

  if (!v5 || ([v3 latitude], v6 == 0.0) || (objc_msgSend(v3, "longitude"), v7 == 0.0))
  {
    id v8 = 0;
  }
  else
  {
    id v8 = objc_alloc_init(City);
    BOOL v10 = [v3 name];
    [(City *)v8 setName:v10];

    [v3 latitude];
    [(City *)v8 setLatitude:v11];
    [v3 longitude];
    [(City *)v8 setLongitude:v12];
    id v13 = [v3 localeCode];
    [(City *)v8 setISO3166CountryAbbreviation:v13];
  }
  return v8;
}

+ (id)cloudDictionaryRepresentationOfALCity:(id)a3
{
  v15[3] = *MEMORY[0x263EF8340];
  v14[0] = *MEMORY[0x263F85E78];
  id v3 = a3;
  double v4 = [v3 name];
  v15[0] = v4;
  v14[1] = *MEMORY[0x263F85E68];
  uint64_t v5 = NSNumber;
  [v3 latitude];
  float v6 = objc_msgSend(v5, "numberWithFloat:");
  v15[1] = v6;
  v14[2] = *MEMORY[0x263F85E70];
  float v7 = NSNumber;
  [v3 longitude];
  int v9 = v8;

  LODWORD(v10) = v9;
  float v11 = [v7 numberWithFloat:v10];
  v15[2] = v11;
  float v12 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];

  return v12;
}

+ (void)temperatureFromDictionaryRepresentation:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_226D1D000, log, OS_LOG_TYPE_ERROR, "WEATHER DATA MIGRATOR SHOULD HAVE RUN.  THIS SHOULDNT BE POSSIBLE.", v1, 2u);
}

@end