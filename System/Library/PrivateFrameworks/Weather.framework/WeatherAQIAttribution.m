@interface WeatherAQIAttribution
- (BOOL)isValid;
- (CLLocation)stationLocation;
- (NSDate)stationLastReadDate;
- (NSString)name;
- (NSString)stationLocationName;
- (OS_dispatch_queue)reverseGeocodingQueue;
- (UIImage)cachedLogoImage;
- (WFGeocodeRequest)geocodeRequest;
- (WeatherAQIAttribution)initWithFoundationAttribution:(id)a3;
- (int64_t)dataOrigination;
- (void)reverseGeocodeStationLocation:(id)a3;
- (void)setDataOrigination:(int64_t)a3;
- (void)setGeocodeRequest:(id)a3;
- (void)setName:(id)a3;
- (void)setReverseGeocodingQueue:(id)a3;
- (void)setStationLocationName:(id)a3;
@end

@implementation WeatherAQIAttribution

- (WeatherAQIAttribution)initWithFoundationAttribution:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)WeatherAQIAttribution;
  v5 = [(WeatherAQIAttribution *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [v4 name];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [v4 cachedLogoImage];
    cachedLogoImage = v5->_cachedLogoImage;
    v5->_cachedLogoImage = (UIImage *)v8;

    v5->_dataOrigination = [v4 dataOrigination];
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.weatherframework.airquality.attribution.reverse.geocoding", v10);
    reverseGeocodingQueue = v5->_reverseGeocodingQueue;
    v5->_reverseGeocodingQueue = (OS_dispatch_queue *)v11;

    v13 = [v4 station];

    if (v13)
    {
      v14 = [v4 station];
      uint64_t v15 = [v14 location];
      stationLocation = v5->_stationLocation;
      v5->_stationLocation = (CLLocation *)v15;

      v17 = [v4 station];
      uint64_t v18 = [v17 lastReadDate];
      stationLastReadDate = v5->_stationLastReadDate;
      v5->_stationLastReadDate = (NSDate *)v18;

      [(WeatherAQIAttribution *)v5 reverseGeocodeStationLocation:0];
    }
  }

  return v5;
}

- (BOOL)isValid
{
  v2 = [(WeatherAQIAttribution *)self name];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (void)reverseGeocodeStationLocation:(id)a3
{
  id v4 = a3;
  v5 = [(WeatherAQIAttribution *)self stationLocation];

  if (v5)
  {
    uint64_t v6 = [(WeatherAQIAttribution *)self reverseGeocodingQueue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __55__WeatherAQIAttribution_reverseGeocodeStationLocation___block_invoke;
    v8[3] = &unk_2647E0790;
    v8[4] = self;
    id v9 = v4;
    dispatch_async(v6, v8);
  }
  else if (v4)
  {
    v7 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.weather.foundation.airQuality.provider.attribution.errorDomain" code:7777 userInfo:0];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v7);
  }
}

void __55__WeatherAQIAttribution_reverseGeocodeStationLocation___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) geocodeRequest];

  if (v2)
  {
    BOOL v3 = [*(id *)(a1 + 32) geocodeRequest];
    [v3 cancel];
  }
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v4 = objc_alloc(MEMORY[0x263F85F28]);
  v5 = [*(id *)(a1 + 32) stationLocation];
  [v5 coordinate];
  double v7 = v6;
  double v9 = v8;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __55__WeatherAQIAttribution_reverseGeocodeStationLocation___block_invoke_2;
  v12[3] = &unk_2647E0230;
  objc_copyWeak(&v14, &location);
  id v13 = *(id *)(a1 + 40);
  v10 = objc_msgSend(v4, "initWithCoordinate:resultHandler:", v12, v7, v9);
  [*(id *)(a1 + 32) setGeocodeRequest:v10];

  dispatch_queue_t v11 = [*(id *)(a1 + 32) geocodeRequest];
  [v11 start];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __55__WeatherAQIAttribution_reverseGeocodeStationLocation___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!v5)
  {
    double v7 = [v9 displayName];
    [WeakRetained setStationLocationName:v7];
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v9, v5);
  }
}

- (NSString)name
{
  p_isa = self->_name;
  BOOL v3 = +[WeatherInternalPreferences sharedInternalPreferences];
  int v4 = [v3 BOOLForKey:@"feature.enhancedAQIView.overridesEnabled"];
  char v5 = [v3 BOOLForKey:@"feature.enhancedAQIView.demoModeEnabled"];
  if (v4 && (v5 & 1) == 0)
  {
    double v6 = [v3 objectForKey:@"feature.enhancedAQIView.airQualityDataProviderOverride"];
    if (!v6) {
      goto LABEL_10;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_10;
    }
    uint64_t v7 = [v6 integerValue];
    if (v7)
    {
      if (v7 != 1)
      {
LABEL_10:

        goto LABEL_11;
      }
      uint64_t v8 = @"Breezometer";
    }
    else
    {
      uint64_t v8 = @"The Weather Channel";
    }

    p_isa = &v8->isa;
    goto LABEL_10;
  }
LABEL_11:

  return p_isa;
}

- (int64_t)dataOrigination
{
  uint64_t dataOrigination = self->_dataOrigination;
  BOOL v3 = +[WeatherInternalPreferences sharedInternalPreferences];
  int v4 = [v3 BOOLForKey:@"feature.enhancedAQIView.overridesEnabled"];
  char v5 = [v3 BOOLForKey:@"feature.enhancedAQIView.demoModeEnabled"];
  if (v4 && (v5 & 1) == 0)
  {
    double v6 = [v3 objectForKey:@"feature.enhancedAQIView.airQualityDataOriginationOverride"];
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && (unint64_t)[v6 integerValue] <= 1) {
        uint64_t dataOrigination = [v6 integerValue];
      }
    }
  }
  return dataOrigination;
}

- (void)setName:(id)a3
{
}

- (void)setDataOrigination:(int64_t)a3
{
  self->_uint64_t dataOrigination = a3;
}

- (UIImage)cachedLogoImage
{
  return self->_cachedLogoImage;
}

- (NSDate)stationLastReadDate
{
  return self->_stationLastReadDate;
}

- (CLLocation)stationLocation
{
  return self->_stationLocation;
}

- (NSString)stationLocationName
{
  return self->_stationLocationName;
}

- (void)setStationLocationName:(id)a3
{
}

- (WFGeocodeRequest)geocodeRequest
{
  return self->_geocodeRequest;
}

- (void)setGeocodeRequest:(id)a3
{
}

- (OS_dispatch_queue)reverseGeocodingQueue
{
  return self->_reverseGeocodingQueue;
}

- (void)setReverseGeocodingQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reverseGeocodingQueue, 0);
  objc_storeStrong((id *)&self->_geocodeRequest, 0);
  objc_storeStrong((id *)&self->_stationLocationName, 0);
  objc_storeStrong((id *)&self->_stationLocation, 0);
  objc_storeStrong((id *)&self->_stationLastReadDate, 0);
  objc_storeStrong((id *)&self->_cachedLogoImage, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end