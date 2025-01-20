@interface City
+ (id)_ISO8601Calendar;
+ (id)cityContainingLocation:(id)a3 expectedName:(id)a4 fromCities:(id)a5;
- (BOOL)_dataIsValid;
- (BOOL)_isUpdating;
- (BOOL)_isValidLearnMoreURLForSevereEvent:(id)a3;
- (BOOL)airQualityCanUseDefaultAttribution;
- (BOOL)airQualityForceHideRecommendation;
- (BOOL)airQualityScaleIsAscending;
- (BOOL)airQualityScaleIsNumerical;
- (BOOL)airQualityTemporarilyUnavailable;
- (BOOL)autoUpdate;
- (BOOL)containsLatitude:(double)a3 longitude:(double)a4;
- (BOOL)isDay;
- (BOOL)isDuplicateOfCity:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLocalWeatherCity;
- (BOOL)isRequestedByFrameworkClient;
- (BOOL)isTransient;
- (BOOL)isUpdating;
- (BOOL)isUpdatingOrNoData;
- (BOOL)lockedForDemoMode;
- (BOOL)populateWithDataFromCity:(id)a3;
- (BOOL)timeZoneIsFresh;
- (BOOL)update;
- (CLLocation)location;
- (CLLocationCoordinate2D)coordinate;
- (City)init;
- (City)initWithDictionaryRepresentation:(id)a3;
- (NSArray)dayForecasts;
- (NSArray)hourlyForecasts;
- (NSArray)severeWeatherEvents;
- (NSDate)timeZoneUpdateDate;
- (NSDate)updateTime;
- (NSDictionary)urlComponents;
- (NSError)lastUpdateError;
- (NSHashTable)cityUpdateObservers;
- (NSNumber)airQualityCategory;
- (NSNumber)airQualityCategoryOverride;
- (NSNumber)airQualityIdx;
- (NSNumber)airQualityIdxOverride;
- (NSString)ISO3166CountryAbbreviation;
- (NSString)airQualityRecommendation;
- (NSString)airQualityScaleIdentifier;
- (NSString)countryCode;
- (NSString)description;
- (NSString)fullName;
- (NSString)identifier;
- (NSString)locationID;
- (NSString)name;
- (NSString)searchSubtitle;
- (NSString)searchTitle;
- (NSString)state;
- (NSString)updateTimeString;
- (NSString)weatherDisplayName;
- (NSString)weatherLocationCitationName;
- (NSString)weatherLocationName;
- (NSString)woeid;
- (NSTimeZone)timeZone;
- (NSTimer)autoUpdateTimer;
- (NSURL)airQualityLearnMoreURL;
- (NSURL)deeplink;
- (NSURL)link;
- (NSURL)severeWeatherEventLearnMoreURL;
- (WFAQIScale)airQualityScale;
- (WFAQIScaleCategory)airQualityCurrentScaleCategory;
- (WFAQIScaleCategory)airQualityScaleCategory;
- (WFGeocodeRequest)activeGeocodeRequest;
- (WFLocation)wfLocation;
- (WFNextHourPrecipitation)nextHourPrecipitation;
- (WFTemperature)feelsLike;
- (WFTemperature)temperature;
- (WeatherAQIAttribution)airQualityAttribution;
- (double)distanceToLatitude:(double)a3 longitude:(double)a4;
- (double)distanceToLocation:(id)a3;
- (double)latitude;
- (double)longitude;
- (double)precipitationPast24Hours;
- (float)dewPoint;
- (float)heatIndex;
- (float)humidity;
- (float)pressure;
- (float)visibility;
- (float)windChill;
- (float)windDirection;
- (float)windSpeed;
- (id)cityAndState;
- (id)detailedDescription;
- (id)dictionaryRepresentation;
- (id)displayName;
- (id)getName;
- (id)naturalLanguageDescription;
- (id)naturalLanguageDescriptionWithDescribedCondition:(int64_t *)a3;
- (id)windDirectionAsString:(double)a3;
- (int64_t)conditionCode;
- (int64_t)locationOfTime:(int64_t)a3;
- (int64_t)primaryConditionForRange:(_NSRange)a3;
- (int64_t)timeDigit;
- (int64_t)updateInterval;
- (unint64_t)airQualitySignificance;
- (unint64_t)airQualitySignificanceOverride;
- (unint64_t)aqiDataAvailabilityStatus;
- (unint64_t)aqiDataAvailabilityStatusFromAppConfig;
- (unint64_t)aqiDataAvailabilityStatusOverride;
- (unint64_t)hash;
- (unint64_t)lastUpdateStatus;
- (unint64_t)moonPhase;
- (unint64_t)observationTime;
- (unint64_t)precipitationForecast;
- (unint64_t)pressureRising;
- (unint64_t)sunriseTime;
- (unint64_t)sunsetTime;
- (unint64_t)uvIndex;
- (unint64_t)weatherDataAge;
- (void)_clearAutoUpdateTimer;
- (void)_generateLocalizableStrings;
- (void)_notifyDidStartWeatherUpdate;
- (void)_updateTimeZone;
- (void)addUpdateObserver:(id)a3;
- (void)cityDidFinishUpdatingWithError:(id)a3;
- (void)clearForecasts;
- (void)dealloc;
- (void)discardDataIfNeeded;
- (void)localWeatherDidBeginUpdate;
- (void)removeUpdateObserver:(id)a3;
- (void)setActiveGeocodeRequest:(id)a3;
- (void)setAirQualityAttribution:(id)a3;
- (void)setAirQualityCategory:(id)a3;
- (void)setAirQualityCategoryOverride:(id)a3;
- (void)setAirQualityCurrentScaleCategory:(id)a3;
- (void)setAirQualityIdx:(id)a3;
- (void)setAirQualityIdxOverride:(id)a3;
- (void)setAirQualityLearnMoreURL:(id)a3;
- (void)setAirQualityRecommendation:(id)a3;
- (void)setAirQualityScale:(id)a3;
- (void)setAirQualityScaleCategory:(id)a3;
- (void)setAirQualityScaleIdentifier:(id)a3;
- (void)setAirQualitySignificance:(unint64_t)a3;
- (void)setAirQualitySignificanceOverride:(unint64_t)a3;
- (void)setAirQualityTemporarilyUnavailable:(BOOL)a3;
- (void)setAqiDataAvailabilityStatusOverride:(unint64_t)a3;
- (void)setAutoUpdate:(BOOL)a3;
- (void)setAutoUpdateTimer:(id)a3;
- (void)setCityUpdateObservers:(id)a3;
- (void)setConditionCode:(int64_t)a3;
- (void)setCoordinate:(CLLocationCoordinate2D)a3;
- (void)setDayForecasts:(id)a3;
- (void)setDeeplink:(id)a3;
- (void)setDewPoint:(float)a3;
- (void)setFeelsLike:(id)a3;
- (void)setFullName:(id)a3;
- (void)setHeatIndex:(float)a3;
- (void)setHourlyForecasts:(id)a3;
- (void)setHumidity:(float)a3;
- (void)setISO3166CountryAbbreviation:(id)a3;
- (void)setIsDay:(BOOL)a3;
- (void)setIsLocalWeatherCity:(BOOL)a3;
- (void)setIsRequestedByFrameworkClient:(BOOL)a3;
- (void)setIsUpdating:(BOOL)a3;
- (void)setLastUpdateError:(id)a3;
- (void)setLastUpdateStatus:(unint64_t)a3;
- (void)setLatitude:(double)a3;
- (void)setLink:(id)a3;
- (void)setLocation:(id)a3;
- (void)setLockedForDemoMode:(BOOL)a3;
- (void)setLongitude:(double)a3;
- (void)setMoonPhase:(unint64_t)a3;
- (void)setName:(id)a3;
- (void)setNextHourPrecipitation:(id)a3;
- (void)setObservationTime:(unint64_t)a3;
- (void)setPrecipitationPast24Hours:(double)a3;
- (void)setPressure:(float)a3;
- (void)setPressureRising:(unint64_t)a3;
- (void)setSearchSubtitle:(id)a3;
- (void)setSearchTitle:(id)a3;
- (void)setSevereWeatherEventLearnMoreURL:(id)a3;
- (void)setSevereWeatherEvents:(id)a3;
- (void)setState:(id)a3;
- (void)setSunriseTime:(unint64_t)a3;
- (void)setSunsetTime:(unint64_t)a3;
- (void)setTemperature:(id)a3;
- (void)setTimeZone:(id)a3;
- (void)setTimeZoneUpdateDate:(id)a3;
- (void)setTransient:(BOOL)a3;
- (void)setUVIndex:(unint64_t)a3;
- (void)setUpdateInterval:(int64_t)a3;
- (void)setUpdateTime:(id)a3;
- (void)setUpdateTimeString:(id)a3;
- (void)setVisibility:(float)a3;
- (void)setWeatherDisplayName:(id)a3;
- (void)setWeatherLocationName:(id)a3;
- (void)setWfLocation:(id)a3;
- (void)setWindChill:(float)a3;
- (void)setWindDirection:(float)a3;
- (void)setWindSpeed:(float)a3;
- (void)setWoeid:(id)a3;
- (void)update;
- (void)updateCityForModel:(id)a3;
- (void)updateCityForSevereWeatherEvents:(id)a3;
- (void)updateTimeZoneWithCompletionBlock:(id)a3;
@end

@implementation City

+ (id)_ISO8601Calendar
{
  if (_ISO8601Calendar_onceToken != -1) {
    dispatch_once(&_ISO8601Calendar_onceToken, &__block_literal_global_41);
  }
  v2 = (void *)_ISO8601Calendar_ISO6801Calendar;
  return v2;
}

uint64_t __24__City__ISO8601Calendar__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x263EFF8F0]);
  uint64_t v1 = [v0 initWithCalendarIdentifier:*MEMORY[0x263EFF410]];
  uint64_t v2 = _ISO8601Calendar_ISO6801Calendar;
  _ISO8601Calendar_ISO6801Calendar = v1;
  return MEMORY[0x270F9A758](v1, v2);
}

- (City)init
{
  v8.receiver = self;
  v8.super_class = (Class)City;
  uint64_t v2 = [(City *)&v8 init];
  if (v2)
  {
    v3 = +[WeatherInternalPreferences sharedInternalPreferences];
    v4 = [v3 objectForKey:@"ShouldWeatherUpdateRapidly"];
    int v5 = [v4 BOOLValue];
    uint64_t v6 = 300;
    if (v5) {
      uint64_t v6 = 5;
    }
    v2->_updateInterval = v6;

    v2->_conditionCode = 3200;
    v2->_humidity = 1.1755e-38;
    v2->_heatIndex = 1.1755e-38;
    v2->_windChill = 1.1755e-38;
  }
  return v2;
}

- (City)initWithDictionaryRepresentation:(id)a3
{
  v4 = +[CityPersistenceConversions cityFromDictionary:a3];

  return v4;
}

- (void)dealloc
{
  [(City *)self _clearAutoUpdateTimer];
  v3.receiver = self;
  v3.super_class = (Class)City;
  [(City *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v5 = v4;
  }
  else {
    int v5 = 0;
  }
  id v6 = v5;
  v7 = [(City *)self locationID];

  if (v7)
  {
    objc_super v8 = [(City *)self locationID];
    [v6 locationID];
  }
  else
  {
    objc_super v8 = [(City *)self name];
    [v6 name];
  v9 = };

  char v10 = [v8 isEqual:v9];
  return v10;
}

- (unint64_t)hash
{
  uint64_t v2 = [(City *)self locationID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)dictionaryRepresentation
{
  return +[CityPersistenceConversions dictionaryRepresentationOfCity:self];
}

- (int64_t)conditionCode
{
  if (conditionCode_onceToken != -1) {
    dispatch_once(&conditionCode_onceToken, &__block_literal_global_51);
  }
  unint64_t v3 = +[WeatherInternalPreferences sharedInternalPreferences];
  int v4 = [v3 isInternalInstall];
  int v5 = conditionCode_forceUnsetConditionCode;

  if (v4) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6) {
    return self->_conditionCode;
  }
  else {
    return 3200;
  }
}

void __21__City_conditionCode__block_invoke()
{
  id v1 = +[WeatherInternalPreferences sharedInternalPreferences];
  id v0 = [v1 objectForKey:@"Force3200Code"];
  conditionCode_forceUnsetConditionCode = [v0 BOOLValue];
}

- (NSString)description
{
  unint64_t v3 = (void *)MEMORY[0x263F089D8];
  v9.receiver = self;
  v9.super_class = (Class)City;
  int v4 = [(City *)&v9 description];
  int v5 = [(City *)self name];
  BOOL v6 = [(City *)self locationID];
  v7 = [v3 stringWithFormat:@"<%@ -- Name: %@, LocationID: %@", v4, v5, v6];

  return (NSString *)v7;
}

- (id)detailedDescription
{
  uint64_t v3 = WAUserTemperatureUnit();
  int v4 = [(City *)self description];
  int v5 = (void *)[v4 mutableCopy];

  v44 = +[WeatherVisibilityFormatter convenienceFormatter];
  v45 = +[WeatherWindSpeedFormatter convenienceFormatter];
  v43 = +[WeatherPressureFormatter convenienceFormatter];
  if ([(City *)self isLocalWeatherCity]) {
    [v5 appendFormat:@"\nLocal Weather City"];
  }
  BOOL v6 = NSStringFromWeatherConditionCode([(City *)self conditionCode]);
  [v5 appendFormat:@"\nCondition Code: %@", v6];

  id v7 = objc_alloc(MEMORY[0x263F85F70]);
  [(City *)self heatIndex];
  v42 = (void *)[v7 initWithTemperatureUnit:2 value:v8];
  objc_super v9 = NSNumber;
  char v10 = [(City *)self feelsLike];
  [v10 temperatureForUnit:v3];
  v11 = objc_msgSend(v9, "numberWithDouble:");
  v12 = [v11 stringValue];
  v13 = NSNumber;
  [v42 temperatureForUnit:v3];
  v14 = objc_msgSend(v13, "numberWithDouble:");
  v15 = [v14 stringValue];
  [v5 appendFormat:@"\nFeels Like: %@, Heat Index: %@", v12, v15];

  id v16 = objc_alloc(MEMORY[0x263F85F70]);
  [(City *)self windChill];
  v41 = (void *)[v16 initWithTemperatureUnit:2 value:v17];
  [(City *)self windSpeed];
  int v19 = v18;
  [(City *)self windDirection];
  LODWORD(v21) = v20;
  LODWORD(v22) = v19;
  v23 = [v45 formattedStringForSpeed:v22 direction:v21];
  v24 = NSNumber;
  [v41 temperatureForUnit:v3];
  v25 = objc_msgSend(v24, "numberWithDouble:");
  v26 = [v25 stringValue];
  [v5 appendFormat:@"\nWind Chill: %@, Wind: %@", v26, v23];

  id v27 = objc_alloc(MEMORY[0x263F85F70]);
  [(City *)self dewPoint];
  v29 = (void *)[v27 initWithTemperatureUnit:2 value:v28];
  [(City *)self humidity];
  double v31 = v30;
  [(City *)self visibility];
  v33 = [v44 stringFromKilometers:v32];
  [(City *)self pressure];
  v34 = objc_msgSend(v43, "stringFromMillibars:");
  v35 = NSNumber;
  [v29 temperatureForUnit:v3];
  v36 = objc_msgSend(v35, "numberWithDouble:");
  v37 = [v36 stringValue];
  [v5 appendFormat:@"\nHumidity %f%%, Visibility: %@, Pressure: %@, Dewpoint: %@, UV Index: %lu", *(void *)&v31, v33, v34, v37, -[City uvIndex](self, "uvIndex")];

  [v5 appendFormat:@"\nObservation Time: %lu Sunrise: %lu, Sunset: %lu, Moonphase: %lu", -[City observationTime](self, "observationTime"), -[City sunriseTime](self, "sunriseTime"), -[City sunsetTime](self, "sunsetTime"), -[City moonPhase](self, "moonPhase")];
  v38 = [(City *)self dayForecasts];
  [v5 appendFormat:@"\nForecasts: %@", v38];

  v39 = [(City *)self hourlyForecasts];
  [v5 appendFormat:@"\nHourly Forecasts: %@>", v39];

  return v5;
}

- (void)addUpdateObserver:(id)a3
{
  id v9 = a3;
  int v4 = [(City *)self cityUpdateObservers];
  int v5 = [v4 containsObject:v9];

  if (v5) {
    NSLog(&cfstr_Cityupdateobse.isa);
  }
  BOOL v6 = [(City *)self cityUpdateObservers];

  if (!v6)
  {
    id v7 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    [(City *)self setCityUpdateObservers:v7];
  }
  float v8 = [(City *)self cityUpdateObservers];
  [v8 addObject:v9];
}

- (void)removeUpdateObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(City *)self cityUpdateObservers];
  [v5 removeObject:v4];
}

- (void)_clearAutoUpdateTimer
{
  [(NSTimer *)self->_autoUpdateTimer invalidate];
  autoUpdateTimer = self->_autoUpdateTimer;
  self->_autoUpdateTimer = 0;
}

- (void)setAutoUpdate:(BOOL)a3
{
  if (self->_autoUpdate != a3)
  {
    self->_autoUpdate = a3;
    [(City *)self _clearAutoUpdateTimer];
    if (self->_autoUpdate && ![(City *)self isLocalWeatherCity])
    {
      [(City *)self update];
      id v4 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel_update selector:0 userInfo:1 repeats:(double)300];
      [(City *)self setAutoUpdateTimer:v4];
    }
  }
}

- (id)displayName
{
  uint64_t v3 = [(City *)self name];

  if (v3) {
    [(City *)self name];
  }
  else {
  id v4 = [(City *)self locationID];
  }
  return v4;
}

- (void)setTemperature:(id)a3
{
  id v7 = a3;
  if (![(City *)self lockedForDemoMode])
  {
    temperature = self->_temperature;
    p_temperature = &self->_temperature;
    if (([v7 isEqual:temperature] & 1) == 0) {
      objc_storeStrong((id *)p_temperature, a3);
    }
  }
}

- (void)setDayForecasts:(id)a3
{
  id v6 = a3;
  if (![(City *)self lockedForDemoMode])
  {
    id v4 = (NSArray *)[v6 copy];
    dayForecasts = self->_dayForecasts;
    self->_dayForecasts = v4;
  }
}

- (NSArray)dayForecasts
{
  if (self->_dayForecasts) {
    return self->_dayForecasts;
  }
  else {
    return (NSArray *)MEMORY[0x263EFFA68];
  }
}

- (void)setHourlyForecasts:(id)a3
{
  id v6 = a3;
  if (![(City *)self lockedForDemoMode])
  {
    id v4 = (NSArray *)[v6 copy];
    hourlyForecasts = self->_hourlyForecasts;
    self->_hourlyForecasts = v4;
  }
}

- (NSArray)hourlyForecasts
{
  if (self->_hourlyForecasts) {
    return self->_hourlyForecasts;
  }
  else {
    return (NSArray *)MEMORY[0x263EFFA68];
  }
}

- (int64_t)timeDigit
{
  uint64_t v2 = [(City *)self timeZone];
  int64_t v3 = CityTimeDigitForTimeZone(v2);

  return v3;
}

- (void)setIsDay:(BOOL)a3
{
  if (![(City *)self lockedForDemoMode]) {
    self->_isDay = a3;
  }
}

- (BOOL)isDay
{
  if ([(City *)self lockedForDemoMode]) {
    return self->_isDay;
  }
  if ([(City *)self weatherDataAge] == 2
    || ![(City *)self observationTime]
    && ![(City *)self sunriseTime]
    && ![(City *)self sunsetTime])
  {
    return 1;
  }
  int64_t v4 = [(City *)self timeDigit];
  if (v4 - [(City *)self observationTime] > 5) {
    [(City *)self setObservationTime:v4];
  }
  unint64_t v5 = [(City *)self sunsetTime];
  unint64_t v6 = [(City *)self sunriseTime];
  unint64_t v7 = [(City *)self observationTime];
  if (v5 <= v6)
  {
    if (v7 > [(City *)self sunsetTime])
    {
      unint64_t v9 = [(City *)self observationTime];
      return v9 >= [(City *)self sunriseTime];
    }
    return 1;
  }
  if (v7 <= [(City *)self sunriseTime]) {
    return 0;
  }
  unint64_t v8 = [(City *)self observationTime];
  return v8 < [(City *)self sunsetTime];
}

- (unint64_t)weatherDataAge
{
  int64_t v3 = [(City *)self updateTime];

  if (!v3) {
    return 2;
  }
  int64_t v4 = [(City *)self updateTime];
  [v4 timeIntervalSinceNow];
  double v6 = v5;

  double v7 = -v6;
  if (v6 >= 0.0) {
    double v7 = v6;
  }
  if (v7 >= 0.0) {
    double v8 = v7;
  }
  else {
    double v8 = -v7;
  }
  if (v8 < (double)[(City *)self updateInterval]) {
    return 0;
  }
  char v10 = [(City *)self updateTime];
  v11 = [(City *)self timeZone];
  int IsTodayInTimezone = DateIsTodayInTimezone(v10, v11);

  if (IsTodayInTimezone) {
    return 1;
  }
  else {
    return 2;
  }
}

- (void)localWeatherDidBeginUpdate
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  int64_t v3 = [(City *)self cityUpdateObservers];
  int64_t v4 = [v3 allObjects];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        char v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v10, "cityDidStartWeatherUpdate:", self, (void)v11);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (BOOL)update
{
  int64_t v3 = WALogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[City update].cold.4(self);
  }

  if ([(City *)self _dataIsValid] && ![(City *)self weatherDataAge])
  {
    char v10 = WALogForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[City update](self);
    }

    [(City *)self _updateTimeZone];
    return 0;
  }
  else
  {
    if ([(City *)self isLocalWeatherCity]) {
      +[TWCLocationUpdater sharedLocationUpdater];
    }
    else {
    int64_t v4 = +[TWCCityUpdater sharedCityUpdater];
    }
    char v5 = [v4 isUpdatingCity:self];
    uint64_t v6 = WALogForCategory(0);
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
    if (v5)
    {
      if (v7) {
        -[City update](self);
      }
    }
    else
    {
      if (v7) {
        -[City update](self);
      }

      [(City *)self setIsUpdating:1];
      [(City *)self _notifyDidStartWeatherUpdate];
      [v4 updateWeatherForCity:self];
    }
    [(City *)self _updateTimeZone];
    BOOL v8 = [(City *)self isUpdating];
  }
  return v8;
}

- (void)_notifyDidStartWeatherUpdate
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  int64_t v3 = (id *)MEMORY[0x263F1D020];
  if ([(id)*MEMORY[0x263F1D020] conformsToProtocol:&unk_26DB0DE50]
    && [*v3 showProgressIndicator])
  {
    int64_t v4 = +[ProgressController sharedProgressController];
    [v4 setLoadingData:1];
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  char v5 = [(City *)self cityUpdateObservers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        char v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          [v10 cityDidStartWeatherUpdate:self];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (BOOL)timeZoneIsFresh
{
  int64_t v3 = [(City *)self timeZone];
  if (v3)
  {
    int64_t v4 = [(City *)self timeZoneUpdateDate];
    [v4 timeIntervalSinceNow];
    BOOL v6 = v5 >= -86400.0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)_updateTimeZone
{
  if (![(City *)self timeZoneIsFresh])
  {
    [(City *)self updateTimeZoneWithCompletionBlock:0];
  }
}

- (void)updateTimeZoneWithCompletionBlock:(id)a3
{
  int64_t v4 = (void (**)(id, uint64_t, City *))a3;
  if ([(City *)self isLocalWeatherCity]
    || ([(City *)self coordinate], !CLLocationCoordinate2DIsValid(v21)))
  {
    if (v4) {
      v4[2](v4, 1, self);
    }
  }
  else
  {
    double v5 = [(City *)self activeGeocodeRequest];

    if (v5)
    {
      if (v4) {
        v4[2](v4, 2, self);
      }
    }
    else
    {
      objc_initWeak(&location, self);
      id v6 = objc_alloc(MEMORY[0x263F85F28]);
      [(City *)self coordinate];
      double v8 = v7;
      double v10 = v9;
      uint64_t v13 = MEMORY[0x263EF8330];
      uint64_t v14 = 3221225472;
      v15 = __42__City_updateTimeZoneWithCompletionBlock___block_invoke;
      uint64_t v16 = &unk_2647E0890;
      objc_copyWeak(&v19, &location);
      float v17 = self;
      int v18 = v4;
      long long v11 = objc_msgSend(v6, "initWithCoordinate:resultHandler:", &v13, v8, v10);
      -[City setActiveGeocodeRequest:](self, "setActiveGeocodeRequest:", v11, v13, v14, v15, v16);

      long long v12 = [(City *)self activeGeocodeRequest];
      [v12 start];

      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }
  }
}

void __42__City_updateTimeZoneWithCompletionBlock___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__City_updateTimeZoneWithCompletionBlock___block_invoke_2;
  block[3] = &unk_2647E0868;
  id v7 = v6;
  id v11 = v7;
  objc_copyWeak(&v15, a1 + 6);
  id v8 = v5;
  id v12 = v8;
  id v9 = a1[5];
  id v13 = a1[4];
  id v14 = v9;
  dispatch_async(MEMORY[0x263EF83A0], block);
  [a1[4] setActiveGeocodeRequest:0];

  objc_destroyWeak(&v15);
}

void __42__City_updateTimeZoneWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (uint64_t *)(a1 + 32);
  if (*(void *)(a1 + 32))
  {
    int64_t v3 = WALogForCategory(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __42__City_updateTimeZoneWithCompletionBlock___block_invoke_2_cold_1(v2, v3);
    }

    uint64_t v4 = *(void *)(a1 + 56);
    if (v4) {
      (*(void (**)(uint64_t, uint64_t, void))(v4 + 16))(v4, 1, *(void *)(a1 + 48));
    }
  }
  else
  {
    objc_copyWeak(&to, (id *)(a1 + 64));
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = objc_loadWeakRetained(&to);
    [v6 setWfLocation:v5];

    uint64_t v7 = *(void *)(a1 + 56);
    if (v7) {
      (*(void (**)(uint64_t, void, void))(v7 + 16))(v7, 0, *(void *)(a1 + 48));
    }
    objc_destroyWeak(&to);
  }
}

- (void)clearForecasts
{
  [(City *)self setDayForecasts:0];
  [(City *)self setHourlyForecasts:0];
  [(City *)self setAirQualityIdx:0];
  [(City *)self setAirQualityScaleCategory:0];
  [(City *)self setAirQualityCategory:0];
}

- (void)setUpdateTime:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_updateTime, a3);
  updateTimeString = self->_updateTimeString;
  self->_updateTimeString = 0;

  if (self->_updateTime)
  {
    if (setUpdateTime__locale)
    {
      uint64_t v7 = (__CFDateFormatter *)setUpdateTime__timeDateFormatter;
      if (setUpdateTime__timeDateFormatter)
      {
LABEL_4:
        StringWithDate = (__CFString *)CFDateFormatterCreateStringWithDate(0, v7, (CFDateRef)self->_updateTime);
        id v9 = self->_updateTimeString;
        self->_updateTimeString = &StringWithDate->isa;

        goto LABEL_9;
      }
    }
    else
    {
      setUpdateTime__locale = (uint64_t)CFLocaleCopyCurrent();
      uint64_t v7 = CFDateFormatterCreate(0, (CFLocaleRef)setUpdateTime__locale, kCFDateFormatterShortStyle, kCFDateFormatterShortStyle);
      setUpdateTime__timeDateFormatter = (uint64_t)v7;
      if (v7) {
        goto LABEL_4;
      }
    }
    double v10 = WALogForCategory(1);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[City setUpdateTime:](v10);
    }
  }
LABEL_9:
}

- (void)cityDidFinishUpdatingWithError:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = WALogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[City cityDidFinishUpdatingWithError:]();
  }

  if ([(City *)self isUpdating])
  {
    [(City *)self setIsUpdating:0];
    id v6 = (id *)MEMORY[0x263F1D020];
    if ([(id)*MEMORY[0x263F1D020] conformsToProtocol:&unk_26DB0DE50])
    {
      if ([*v6 showProgressIndicator])
      {
        uint64_t v7 = +[ProgressController sharedProgressController];
        [v7 setLoadingData:0];
      }
    }
  }
  if ([v4 code] == 3072)
  {
    [(City *)self setLastUpdateStatus:2];
    [(City *)self setLastUpdateError:v4];
LABEL_10:
    [(City *)self discardDataIfNeeded];
    goto LABEL_11;
  }
  [(City *)self setLastUpdateStatus:v4 != 0];
  [(City *)self setLastUpdateError:v4];
  if (v4) {
    goto LABEL_10;
  }
  id v15 = [MEMORY[0x263EFF910] date];
  [(City *)self setUpdateTime:v15];

  uint64_t v16 = [(City *)self dayForecasts];
  float v17 = [v16 sortedArrayUsingSelector:sel_compareDayNumberToDayForecast_];
  [(City *)self setDayForecasts:v17];

LABEL_11:
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = [(City *)self cityUpdateObservers];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v18 + 1) + 8 * v12);
        if (objc_opt_respondsToSelector()) {
          [v13 cityDidFinishWeatherUpdate:self];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  id v14 = [MEMORY[0x263F08A00] defaultCenter];
  [v14 postNotificationName:@"CityDidUpdate" object:self];
}

- (BOOL)_isUpdating
{
  int64_t v3 = +[TWCCityUpdater sharedCityUpdater];
  LOBYTE(self) = [v3 isUpdatingCity:self];

  return (char)self;
}

- (BOOL)isUpdatingOrNoData
{
  return !self->_updateTime || [(City *)self _isUpdating];
}

- (id)cityAndState
{
  if (self->_state)
  {
    int64_t v3 = NSString;
    id v4 = [(City *)self name];
    id v5 = [v3 stringWithFormat:@"%@, %@", v4, self->_state];
  }
  else
  {
    id v5 = [(City *)self name];
  }
  return v5;
}

- (NSString)weatherLocationCitationName
{
  if ([(City *)self isLocalWeatherCity]
    && ([(City *)self weatherLocationName],
        int64_t v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    id v4 = [(City *)self weatherLocationName];
  }
  else if ([(City *)self isLocalWeatherCity] {
         || ([(City *)self searchTitle],
  }
             id v5 = objc_claimAutoreleasedReturnValue(),
             v5,
             !v5))
  {
    id v4 = [(City *)self name];
  }
  else
  {
    id v4 = [(City *)self searchTitle];
  }
  return (NSString *)v4;
}

- (void)setName:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  if (![(City *)v4 lockedForDemoMode])
  {
    uint64_t v5 = [v7 copy];
    name = v4->_name;
    v4->_name = (NSString *)v5;
  }
  objc_sync_exit(v4);
}

- (id)getName
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  int64_t v3 = v2->_name;
  objc_sync_exit(v2);

  return v3;
}

- (void)setConditionCode:(int64_t)a3
{
  if (![(City *)self lockedForDemoMode]) {
    self->_conditionCode = a3;
  }
}

- (void)setWfLocation:(id)a3
{
  id v30 = a3;
  uint64_t v5 = [(City *)self lockedForDemoMode];
  id v6 = v30;
  if ((v5 & 1) == 0)
  {
    if (!v30
      || ([v30 geoLocation], id v7 = objc_claimAutoreleasedReturnValue(), v7, !v7))
    {
      wfLocation = self->_wfLocation;
      self->_wfLocation = 0;

      [(City *)self setTimeZone:0];
      [(City *)self setTimeZoneUpdateDate:0];
      uint64_t v5 = [(City *)self setISO3166CountryAbbreviation:0];
LABEL_16:
      id v6 = v30;
      goto LABEL_17;
    }
    p_wfLocation = &self->_wfLocation;
    int v9 = [v30 isEqual:self->_wfLocation];
    id v6 = v30;
    if (!v9) {
      goto LABEL_14;
    }
    uint64_t v10 = [v30 geoLocation];
    uint64_t v11 = [(WFLocation *)*p_wfLocation geoLocation];
    [v10 distanceFromLocation:v11];
    double v13 = v12;
    double v14 = *(double *)&CityMinimumContainmentDistance;

    id v6 = v30;
    if (v13 >= v14) {
      goto LABEL_14;
    }
    id v15 = [v30 countryAbbreviation];
    uint64_t v16 = [(City *)self ISO3166CountryAbbreviation];
    if ([v15 isEqualToString:v16])
    {
      float v17 = [v30 timeZone];
      long long v18 = [(City *)self timeZone];
      if ([v17 isEqualToTimeZone:v18])
      {
        uint64_t v19 = [v30 weatherLocationName];
        if (!v19)
        {

          goto LABEL_15;
        }
        long long v20 = (void *)v19;
        long long v21 = [v30 weatherLocationName];
        double v22 = [(WFLocation *)*p_wfLocation weatherLocationName];
        char v29 = [v21 isEqualToString:v22];

        id v6 = v30;
        if (v29) {
          goto LABEL_17;
        }
LABEL_14:
        id v15 = [v6 timeZone];
        objc_storeStrong((id *)&self->_wfLocation, a3);
        v24 = [v30 geoLocation];
        [(City *)self setLocation:v24];

        [(City *)self setTimeZone:v15];
        v25 = [MEMORY[0x263EFF910] date];
        [(City *)self setTimeZoneUpdateDate:v25];

        v26 = [v30 countryAbbreviation];
        [(City *)self setISO3166CountryAbbreviation:v26];

        id v27 = [v30 weatherDisplayName];
        [(City *)self setWeatherDisplayName:v27];

        float v28 = [v30 weatherLocationName];
        [(City *)self setWeatherLocationName:v28];

LABEL_15:
        goto LABEL_16;
      }
    }
    id v6 = v30;
    goto LABEL_14;
  }
LABEL_17:
  MEMORY[0x270F9A758](v5, v6);
}

- (void)setCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  if (![(City *)self lockedForDemoMode])
  {
    id v6 = (id)[objc_alloc(MEMORY[0x263F00A50]) initWithLatitude:latitude longitude:longitude];
    [(City *)self setLocation:v6];
  }
}

- (CLLocationCoordinate2D)coordinate
{
  int64_t v3 = [(City *)self location];

  if (v3)
  {
    id v4 = [(City *)self location];
    [v4 coordinate];
    double v6 = v5;
    double v8 = v7;
  }
  else
  {
    double v6 = *MEMORY[0x263F00B58];
    double v8 = *(double *)(MEMORY[0x263F00B58] + 8);
  }
  double v9 = v6;
  double v10 = v8;
  result.double longitude = v10;
  result.double latitude = v9;
  return result;
}

- (double)latitude
{
  int64_t v3 = [(City *)self location];

  if (!v3) {
    return *MEMORY[0x263F00B58];
  }
  id v4 = [(City *)self location];
  [v4 coordinate];
  double v6 = v5;

  return v6;
}

- (void)setLatitude:(double)a3
{
  [(City *)self longitude];
  CLLocationCoordinate2D v6 = CLLocationCoordinate2DMake(a3, v5);
  -[City setCoordinate:](self, "setCoordinate:", v6.latitude, v6.longitude);
}

- (double)longitude
{
  int64_t v3 = [(City *)self location];

  if (!v3) {
    return *(double *)(MEMORY[0x263F00B58] + 8);
  }
  id v4 = [(City *)self location];
  [v4 coordinate];
  double v6 = v5;

  return v6;
}

- (void)setLongitude:(double)a3
{
  [(City *)self latitude];
  CLLocationCoordinate2D v6 = CLLocationCoordinate2DMake(v5, a3);
  -[City setCoordinate:](self, "setCoordinate:", v6.latitude, v6.longitude);
}

- (NSString)locationID
{
  int64_t v3 = [(City *)self location];

  if (v3)
  {
    id v4 = NSString;
    CLLocationDegrees v5 = [(City *)self location];
    [v5 coordinate];
    uint64_t v7 = v6;
    double v8 = [(City *)self location];
    [v8 coordinate];
    double v10 = objc_msgSend(v4, "stringWithFormat:", @"%f,%f", v7, v9);
  }
  else
  {
    double v10 = 0;
  }
  return (NSString *)v10;
}

- (BOOL)populateWithDataFromCity:(id)a3
{
  id v4 = a3;
  if ([(City *)self lockedForDemoMode])
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    uint64_t v6 = [v4 name];
    [(City *)self setName:v6];

    uint64_t v7 = [v4 state];
    [(City *)self setState:v7];

    double v8 = [v4 deeplink];
    [(City *)self setDeeplink:v8];

    uint64_t v9 = [v4 timeZone];
    [(City *)self setTimeZone:v9];

    double v10 = [v4 temperature];
    [(City *)self setTemperature:v10];

    [v4 heatIndex];
    -[City setHeatIndex:](self, "setHeatIndex:");
    [v4 visibility];
    -[City setVisibility:](self, "setVisibility:");
    [v4 windChill];
    -[City setWindChill:](self, "setWindChill:");
    [v4 windDirection];
    -[City setWindDirection:](self, "setWindDirection:");
    [v4 windSpeed];
    -[City setWindSpeed:](self, "setWindSpeed:");
    [v4 heatIndex];
    -[City setHeatIndex:](self, "setHeatIndex:");
    -[City setConditionCode:](self, "setConditionCode:", [v4 conditionCode]);
    uint64_t v11 = [v4 dayForecasts];
    [(City *)self setDayForecasts:v11];

    double v12 = [v4 hourlyForecasts];
    [(City *)self setHourlyForecasts:v12];

    -[City setObservationTime:](self, "setObservationTime:", [v4 observationTime]);
    -[City setSunsetTime:](self, "setSunsetTime:", [v4 sunsetTime]);
    -[City setSunriseTime:](self, "setSunriseTime:", [v4 sunriseTime]);
    -[City setMoonPhase:](self, "setMoonPhase:", [v4 moonPhase]);
    double v13 = [(City *)self updateTime];
    double v14 = [v4 updateTime];
    int v15 = [v13 isEqualToDate:v14];

    uint64_t v16 = [v4 updateTime];
    [(City *)self setUpdateTime:v16];

    -[City setLastUpdateStatus:](self, "setLastUpdateStatus:", [v4 lastUpdateStatus]);
    float v17 = [(City *)self locationID];
    long long v18 = [v4 locationID];
    int v5 = v15 & [v17 isEqualToString:v18] ^ 1;

    uint64_t v19 = [v4 location];
    [(City *)self setLocation:v19];
  }
  return v5;
}

- (void)discardDataIfNeeded
{
  id v1 = [a1 displayName];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_226D1D000, v2, v3, "Weather data is outdated for %@; dumping data...", v4, v5, v6, v7, v8);
}

- (id)windDirectionAsString:(double)a3
{
  float v3 = a3 + 22.5;
  unsigned int v4 = vcvtms_s32_f32(v3 / 45.0);
  if (v4 > 8) {
    return &stru_26DADC2F0;
  }
  else {
    return off_2647E08B0[v4];
  }
}

- (BOOL)containsLatitude:(double)a3 longitude:(double)a4
{
  [(City *)self distanceToLatitude:a3 longitude:a4];
  return v4 < *(double *)&CityMinimumContainmentDistance;
}

- (double)distanceToLocation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(City *)self location];

  if (v5)
  {
    uint64_t v6 = [(City *)self location];
    [v6 distanceFromLocation:v4];
    double v8 = v7;
  }
  else
  {
    double v8 = 1.79769313e308;
  }

  return v8;
}

- (double)distanceToLatitude:(double)a3 longitude:(double)a4
{
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263F00A50]) initWithLatitude:a3 longitude:a4];
  [(City *)self distanceToLocation:v5];
  double v7 = v6;

  return v7;
}

+ (id)cityContainingLocation:(id)a3 expectedName:(id)a4 fromCities:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    double v12 = 0;
    uint64_t v13 = *(void *)v25;
    double v14 = 1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v9);
        }
        uint64_t v16 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        [v16 distanceToLocation:v7];
        double v18 = v17;
        uint64_t v19 = [v16 name];
        int v20 = [v19 isEqualToString:v8];

        if (v18 <= v14)
        {
          long long v21 = (double *)&CityMinimumContainmentDistanceMatchingNames;
          if (!v20) {
            long long v21 = (double *)&CityMinimumContainmentDistance;
          }
          if (v18 <= *v21)
          {
            id v22 = v16;

            double v12 = v22;
            double v14 = v18;
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v11);
  }
  else
  {
    double v12 = 0;
  }

  return v12;
}

- (BOOL)isDuplicateOfCity:(id)a3
{
  v15[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(City *)self isLocalWeatherCity]
    || ([v4 isLocalWeatherCity] & 1) != 0
    || ([(City *)self name],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        [v4 name],
        double v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v5 isEqualToString:v6],
        v6,
        v5,
        !v7))
  {
    BOOL v13 = 0;
  }
  else
  {
    id v8 = objc_opt_class();
    id v9 = [(City *)self location];
    uint64_t v10 = [(City *)self name];
    v15[0] = v4;
    uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
    double v12 = [v8 cityContainingLocation:v9 expectedName:v10 fromCities:v11];
    BOOL v13 = v12 != 0;
  }
  return v13;
}

- (int64_t)primaryConditionForRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v25 = 0;
  memset(v24, 0, sizeof(v24));
  p_hourlyForecasts = &self->_hourlyForecasts;
  if (a3.location < [(NSArray *)self->_hourlyForecasts count]
    && location + length <= [(NSArray *)*p_hourlyForecasts count])
  {
    -[NSArray subarrayWithRange:](*p_hourlyForecasts, "subarrayWithRange:", location, length);
    int v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    double v6 = WALogForCategory(1);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v27.NSUInteger location = location;
      v27.NSUInteger length = length;
      [(City *)v27 primaryConditionForRange:v6];
    }

    int v7 = *p_hourlyForecasts;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v7;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        BOOL v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v13, "conditionCode", (void)v19) <= 47)
        {
          uint64_t v14 = [v13 conditionCode];
          ++*((void *)v24 + v14);
        }
      }
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  int64_t v15 = 0;
  uint64_t v16 = 0;
  int64_t v17 = 3200;
  do
  {
    if (*((void *)v24 + v15) > v16)
    {
      int64_t v17 = v15;
      uint64_t v16 = *((void *)v24 + v15);
    }
    ++v15;
  }
  while (v15 != 48);

  return v17;
}

- (int64_t)locationOfTime:(int64_t)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = self->_hourlyForecasts;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      uint64_t v9 = 0;
      uint64_t v10 = v7 + v6;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v9), "time", (void)v15);
        int64_t v12 = +[WAHourlyForecast TimeValueFromString:v11];

        if (v12 == a3)
        {
          int64_t v13 = v7 + v9;
          goto LABEL_11;
        }
        ++v9;
      }
      while (v6 != v9);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      uint64_t v7 = v10;
      if (v6) {
        continue;
      }
      break;
    }
  }
  int64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_11:

  return v13;
}

- (id)naturalLanguageDescription
{
  return [(City *)self naturalLanguageDescriptionWithDescribedCondition:0];
}

- (id)naturalLanguageDescriptionWithDescribedCondition:(int64_t *)a3
{
  v121[2] = *MEMORY[0x263EF8340];
  int v5 = [(City *)self isDay];
  uint64_t v6 = WAUserTemperatureUnit();
  int64_t conditionCode = self->_conditionCode;
  if (conditionCode == 3200
    || (uint64_t v8 = v6,
        [(City *)self locationID],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        uint64_t v10 = [v9 length],
        v9,
        !v10))
  {
    uint64_t v14 = &stru_26DADC2F0;
    if (!a3) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v108 = LocalizedWeatherDescription(self->_conditionCode, v5, 1);
  NSUInteger v11 = [(NSArray *)self->_dayForecasts count];
  NSUInteger v12 = [(NSArray *)self->_hourlyForecasts count];
  if (v11)
  {
    int64_t v13 = [(NSArray *)self->_dayForecasts firstObject];
  }
  else
  {
    int64_t v13 = 0;
  }
  if (self->_conditionCode <= 2)
  {
    long long v16 = NSString;
    long long v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    long long v18 = [v17 localizedStringForKey:@"MAJOR_EVENT_FORMAT" value:&stru_26DADC2F0 table:@"WeatherFrameworkLocalizableStrings"];
    objc_msgSend(v16, "stringWithFormat:", v18, v108);
    uint64_t v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_98;
  }
  v107 = [MEMORY[0x263F089D8] string];
  v106 = [MEMORY[0x263EFF980] array];
  v105 = [MEMORY[0x263F089D8] string];
  [(WFTemperature *)self->_feelsLike temperatureForUnit:2];
  double v20 = v19;
  [(WFTemperature *)self->_temperature temperatureForUnit:2];
  NSUInteger v100 = v12;
  if (self->_feelsLike)
  {
    double v22 = v20 - v21;
    BOOL v23 = v22 > 10.0 || v20 <= *(double *)&CityMaxWindChillTemperature;
    BOOL v24 = v22 > 10.0 || v20 >= *(double *)&CityMinHeatIndexTemperature;
  }
  else
  {
    BOOL v23 = 0;
    BOOL v24 = 0;
  }
  float windSpeed = self->_windSpeed;
  float visibility = self->_visibility;
  BOOL v27 = visibility <= 1.6 && visibility != 1.1755e-38;
  float v28 = @"FAHRENHEIT";
  if (v8 == 2) {
    float v28 = @"CELSIUS";
  }
  uint64_t v29 = [NSString stringWithFormat:@"TEMP_UNIT_%@", v28];
  v102 = (void *)v29;
  if (WAIsChinaSKUAndSimplifiedChinese())
  {
    id v30 = &stru_26DADC2F0;
  }
  else
  {
    double v31 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v30 = [v31 localizedStringForKey:v29 value:&stru_26DADC2F0 table:@"WeatherFrameworkLocalizableStrings"];
  }
  int v32 = v23 || v24;
  if (windSpeed >= 25.0) {
    int v32 = 1;
  }
  v103 = v30;
  v104 = v13;
  if ((v32 | v27) == 1)
  {
    [v107 appendString:@"CONDITION_NOW_"];
    [v106 addObject:v108];
    if (v23)
    {
      [v107 appendString:@"WINDCHILL_"];
      v33 = WATemperatureStringForOutputUnit(self->_feelsLike, v8);
      v121[0] = v33;
      v34 = (void **)v121;
    }
    else
    {
      if (!v24)
      {
LABEL_37:
        if (windSpeed >= 25.0)
        {
          [v107 appendString:@"WIND_"];
          v36 = +[WeatherWindSpeedFormatter convenienceFormatter];
          *(float *)&double v37 = self->_windSpeed;
          v99 = [NSNumber numberWithFloat:v37];
          v98 = [v36 stringForObjectValue:v99];
          v119[0] = v98;
          v38 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          v39 = [(City *)self windDirectionAsString:self->_windDirection];
          v40 = [v38 localizedStringForKey:v39 value:&stru_26DADC2F0 table:@"WeatherFrameworkLocalizableStrings"];
          v119[1] = v40;
          v41 = [MEMORY[0x263EFF8C0] arrayWithObjects:v119 count:2];
          [v106 addObjectsFromArray:v41];

          id v30 = v103;
          int64_t v13 = v104;
        }
        if (v27) {
          [v107 appendString:@"VISIBILITY_"];
        }
        goto LABEL_41;
      }
      [v107 appendString:@"HEAT_INDEX_"];
      v33 = WATemperatureStringForOutputUnit(self->_feelsLike, v8);
      v120 = v33;
      v34 = &v120;
    }
    v34[1] = v30;
    v35 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:");
    [v106 addObjectsFromArray:v35];

    goto LABEL_37;
  }
LABEL_41:
  unint64_t observationTime = self->_observationTime;
  if (observationTime - 400 <= 0x258)
  {
    v43 = WALogForCategory(0);
    v44 = v107;
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
      -[City naturalLanguageDescriptionWithDescribedCondition:]();
    }

    objc_msgSend(v105, "appendFormat:", @"Forecast Type %d to %d", 400, 1000);
    uint64_t v45 = -[City primaryConditionForRange:](self, "primaryConditionForRange:", 0, v100);
    if (![v107 length] && v45 != 3200)
    {
      [v107 appendString:@"TODAY_CONDITION_"];
      v46 = LocalizedWeatherDescription(v45, 1, 1);
      [v106 addObject:v46];

      [v107 appendString:@"IT_IS_CURRENTLY_HIGH_WILL_BE"];
      v47 = WATemperatureStringForOutputUnit(self->_temperature, v8);
      v118[0] = v47;
      v118[1] = v30;
      v48 = [v104 high];
      uint64_t v49 = v8;
      v50 = v106;
      v51 = WATemperatureStringForOutputUnit(v48, v49);
      v118[2] = v51;
      v118[3] = v30;
      v52 = [MEMORY[0x263EFF8C0] arrayWithObjects:v118 count:4];
      [v106 addObjectsFromArray:v52];

      int64_t conditionCode = v45;
LABEL_93:
      unint64_t v62 = 0x263F08000uLL;
      goto LABEL_94;
    }
    unint64_t v62 = 0x263F08000;
    if ([v107 length]) {
      goto LABEL_59;
    }
    [v107 appendString:@"CURRENTLY_NOW_IT_IS_CURRENTLY_HIGH_WILL_BE"];
    v117[0] = v108;
    v47 = WATemperatureStringForOutputUnit(self->_temperature, v8);
    v117[1] = v47;
    v117[2] = v30;
    v48 = [v104 high];
    v51 = WATemperatureStringForOutputUnit(v48, v8);
    v117[3] = v51;
    v117[4] = v30;
    v81 = (void *)MEMORY[0x263EFF8C0];
    v82 = v117;
LABEL_81:
    v83 = [v81 arrayWithObjects:v82 count:5];
    v50 = v106;
    [v106 addObjectsFromArray:v83];

LABEL_94:
    int64_t v13 = v104;
    v44 = v107;
    goto LABEL_95;
  }
  v44 = v107;
  if (observationTime - 1001 <= 0x31F)
  {
    v53 = WALogForCategory(0);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG)) {
      -[City naturalLanguageDescriptionWithDescribedCondition:]();
    }

    objc_msgSend(v105, "appendFormat:", @"Forecast Type %d to %d", 1000, 1800);
    int64_t v54 = [(City *)self locationOfTime:1800];
    int64_t v55 = [(City *)self locationOfTime:0];
    uint64_t v56 = [v107 length];
    if (v54 != 0x7FFFFFFFFFFFFFFFLL && v55 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (!v56)
      {
        [v107 appendString:@"CURRENTLY_NOW_"];
        [v106 addObject:v108];
      }
      int64_t v57 = v100;
      if (v54 < v55) {
        int64_t v57 = v55;
      }
      int64_t v58 = -[City primaryConditionForRange:](self, "primaryConditionForRange:", v54, v57 - v54);
      if (self->_conditionCode == v58)
      {
        [v107 appendString:@"MIDDAY_SAME"];
        [v13 high];
        v47 = v59 = v13;
        v48 = WATemperatureStringForOutputUnit(v47, v8);
        v116[0] = v48;
        v116[1] = v30;
        v51 = [v59 low];
        v60 = WATemperatureStringForOutputUnit(v51, v8);
        v116[2] = v60;
        v116[3] = v30;
        v61 = [MEMORY[0x263EFF8C0] arrayWithObjects:v116 count:4];
        v50 = v106;
        [v106 addObjectsFromArray:v61];
      }
      else
      {
        uint64_t v84 = v58;
        [v107 appendString:@"MIDDAY_DIFFERENT"];
        [v13 high];
        v47 = v85 = v13;
        v48 = WATemperatureStringForOutputUnit(v47, v8);
        v115[0] = v48;
        v115[1] = v30;
        v51 = LocalizedWeatherDescription(v84, 0, 1);
        v115[2] = v51;
        v60 = [v85 low];
        v61 = WATemperatureStringForOutputUnit(v60, v8);
        v115[3] = v61;
        v115[4] = v30;
        v86 = [MEMORY[0x263EFF8C0] arrayWithObjects:v115 count:5];
        v50 = v106;
        [v106 addObjectsFromArray:v86];
      }
      goto LABEL_92;
    }
    if (!v56)
    {
      [v107 appendString:@"CURRENTLY_NOW_IT_IS_CURRENTLY_HIGH_WILL_BE"];
      v114[0] = v108;
      uint64_t v71 = WATemperatureStringForOutputUnit(self->_temperature, v8);
      v72 = v13;
      v47 = (void *)v71;
      v114[1] = v71;
      v114[2] = v30;
      v48 = [v72 high];
      v51 = WATemperatureStringForOutputUnit(v48, v8);
      v114[3] = v51;
      v114[4] = v30;
      v73 = (void *)MEMORY[0x263EFF8C0];
      v74 = v114;
LABEL_90:
      uint64_t v90 = 5;
LABEL_91:
      v60 = [v73 arrayWithObjects:v74 count:v90];
      v50 = v106;
      [v106 addObjectsFromArray:v60];
LABEL_92:

      goto LABEL_93;
    }
    goto LABEL_83;
  }
  unint64_t v63 = observationTime - 1801;
  v64 = WALogForCategory(0);
  BOOL v65 = os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG);
  if (v63 <= 0x22E)
  {
    if (v65) {
      -[City naturalLanguageDescriptionWithDescribedCondition:].cold.4();
    }

    objc_msgSend(v105, "appendFormat:", @"Forecast Type %d to %d", 1800, 2359);
    int64_t v66 = [(City *)self locationOfTime:2359];
    int64_t v67 = [(City *)self locationOfTime:0];
    uint64_t v68 = [v107 length];
    if (v66 != 0x7FFFFFFFFFFFFFFFLL && v67 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (!v68)
      {
        [v107 appendFormat:@"CURRENTLY_COMMA_"];
        [v106 addObject:v108];
      }
      int64_t v69 = v100;
      if (v66 < v67) {
        int64_t v69 = v67;
      }
      int64_t v70 = -[City primaryConditionForRange:](self, "primaryConditionForRange:", v66, v69 - v66);
      if (self->_conditionCode == v70)
      {
        [v107 appendFormat:@"AFTERNOON_SAME"];
        v47 = [v13 low];
        v48 = WATemperatureStringForOutputUnit(v47, v8);
        v113[0] = v48;
        v113[1] = v30;
        v51 = [MEMORY[0x263EFF8C0] arrayWithObjects:v113 count:2];
        v50 = v106;
        [v106 addObjectsFromArray:v51];
        goto LABEL_93;
      }
      uint64_t v87 = v70;
      [v107 appendFormat:@"AFTERNOON_DIFFERENT"];
      uint64_t v88 = LocalizedWeatherDescription(v87, 0, 0);
      v89 = v13;
      v47 = (void *)v88;
      v112[0] = v88;
      v48 = [v89 low];
      v51 = WATemperatureStringForOutputUnit(v48, v8);
      v112[1] = v51;
      v112[2] = v30;
      v73 = (void *)MEMORY[0x263EFF8C0];
      v74 = v112;
      uint64_t v90 = 3;
      goto LABEL_91;
    }
    if (!v68)
    {
      [v107 appendString:@"CURRENTLY_NOW_IT_IS_CURRENTLY_HIGH_WAS"];
      v111[0] = v108;
      uint64_t v91 = WATemperatureStringForOutputUnit(self->_temperature, v8);
      v92 = v13;
      v47 = (void *)v91;
      v111[1] = v91;
      v111[2] = v30;
      v48 = [v92 high];
      v51 = WATemperatureStringForOutputUnit(v48, v8);
      v111[3] = v51;
      v111[4] = v30;
      v73 = (void *)MEMORY[0x263EFF8C0];
      v74 = v111;
      goto LABEL_90;
    }
LABEL_83:
    v50 = v106;
    unint64_t v62 = 0x263F08000;
    goto LABEL_95;
  }
  if (v65) {
    -[City naturalLanguageDescriptionWithDescribedCondition:].cold.5();
  }

  objc_msgSend(v105, "appendFormat:", @"Forecast Type %d to %d", 2359, 400);
  int64_t v75 = [(City *)self locationOfTime:400];
  int64_t v76 = [(City *)self locationOfTime:2400];
  if (v75 != 0x7FFFFFFFFFFFFFFFLL && v76 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v77 = v100;
    if (v75 < v76) {
      int64_t v77 = v76;
    }
    int64_t conditionCode = -[City primaryConditionForRange:](self, "primaryConditionForRange:", v75, v77 - v75);
    uint64_t v101 = [MEMORY[0x263F089D8] stringWithString:@"CONDITION_LIKELY_TOMORROW_WITH_HIGH_AND_LOW"];

    v47 = LocalizedWeatherDescription(conditionCode, 1, 1);
    v110[0] = v47;
    v48 = [v104 high];
    v51 = WATemperatureStringForOutputUnit(v48, v8);
    v110[1] = v51;
    v110[2] = v30;
    v78 = [v104 low];
    v79 = WATemperatureStringForOutputUnit(v78, v8 == 2);
    v110[3] = v79;
    v110[4] = v103;
    v80 = [MEMORY[0x263EFF8C0] arrayWithObjects:v110 count:5];
    v50 = v106;
    [v106 addObjectsFromArray:v80];

    v107 = (void *)v101;
    goto LABEL_93;
  }
  unint64_t v62 = 0x263F08000;
  if (![v107 length])
  {
    [v107 appendString:@"CURRENTLY_NOW_IT_IS_CURRENTLY_HIGH_WILL_BE"];
    v109[0] = v108;
    v47 = WATemperatureStringForOutputUnit(self->_temperature, v8);
    v109[1] = v47;
    v109[2] = v30;
    v48 = [v104 high];
    v51 = WATemperatureStringForOutputUnit(v48, v8);
    v109[3] = v51;
    v109[4] = v30;
    v81 = (void *)MEMORY[0x263EFF8C0];
    v82 = v109;
    goto LABEL_81;
  }
LABEL_59:
  int64_t v13 = v104;
  v50 = v106;
LABEL_95:
  objc_msgSend(v105, "appendFormat:", @" - wc %f hi %f w %f v %f / hours %d / ", self->_windChill, self->_heatIndex, self->_windSpeed, self->_visibility, -[NSArray count](self->_hourlyForecasts, "count"));
  v93 = NSString;
  v94 = [*(id *)(v62 + 1760) bundleForClass:objc_opt_class()];
  [v94 localizedStringForKey:v44 value:&stru_26DADC2F0 table:@"WeatherFrameworkLocalizableStrings"];
  v96 = v95 = v44;
  uint64_t v14 = [v93 stringWithFormat:v96 andArguments:v50];

  [v105 appendString:v14];
  v97 = WALogForCategory(1);
  if (os_log_type_enabled(v97, OS_LOG_TYPE_DEBUG)) {
    -[City naturalLanguageDescriptionWithDescribedCondition:]();
  }

LABEL_98:
  if (a3) {
LABEL_6:
  }
    *a3 = conditionCode;
LABEL_7:
  return v14;
}

- (unint64_t)precipitationForecast
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v2 = self->_hourlyForecasts;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (!v3)
  {

    return 2;
  }
  uint64_t v4 = v3;
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  unint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = *(void *)v22;
  do
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v22 != v10) {
        objc_enumerationMutation(v2);
      }
      NSUInteger v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
      uint64_t v13 = objc_msgSend(v12, "conditionCode", (void)v21);
      if (((0x1017FFF80001uLL >> v13) & 1) == 0)
      {
        uint64_t v14 = PrecipitationTypeMap_0[v13];
        if (!v8) {
          unint64_t v8 = PrecipitationTypeMap_0[v13];
        }
        if (v14 == 4) {
          uint64_t v15 = v9 + 1;
        }
        else {
          uint64_t v15 = v9;
        }
        if (v14 == 3) {
          uint64_t v16 = v6 + 1;
        }
        else {
          uint64_t v16 = v6;
        }
        if (v14 == 3) {
          uint64_t v15 = v9;
        }
        if (v14 == 2) {
          ++v5;
        }
        else {
          uint64_t v6 = v16;
        }
        if (v14 != 2) {
          uint64_t v9 = v15;
        }
      }
      long long v17 = [v12 temperature];
      [v17 temperatureForUnit:2];
      double v19 = v18;

      if (v19 < 0.0) {
        ++v7;
      }
    }
    uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v21 objects:v25 count:16];
  }
  while (v4);

  if (v5 >= 1 && v5 > v6) {
    return 2;
  }
  if (v6 < 1 || v6 <= v5)
  {
    if (v9 >= 1 && v9 > v5 && v9 > v6) {
      return 4;
    }
    if (v8) {
      return v8;
    }
    if (!v7) {
      return 2;
    }
  }
  return 3;
}

- (void)_generateLocalizableStrings
{
  v129[4] = *MEMORY[0x263EF8340];
  v126 = @"IT_IS_CURRENTLY_HIGH_WILL_BE";
  v127 = @"It's currently %8$@%9$@; the high will be %10$@%11$@. ";
  v128[0] = @"TODAY_CONDITION";
  uint64_t v2 = [NSDictionary dictionaryWithObjects:&v127 forKeys:&v126 count:1];
  v129[0] = v2;
  v128[1] = @"CURRENTLY_NOW";
  v124[0] = @"MIDDAY_SAME";
  v124[1] = @"MIDDAY_DIFFERENT";
  v125[0] = @"The high will be %2$@%3$@. The low tonight will be %4$@%5$@. ";
  v125[1] = @"The high will be %2$@%3$@. %4$@ tonight with a low of %5$@%6$@. ";
  v124[2] = @"IT_IS_CURRENTLY_HIGH_WILL_BE";
  v124[3] = @"IT_IS_CURRENTLY_HIGH_WAS";
  v125[2] = @"It's %8$@%9$@; the high will be %10$@%11$@. ";
  v125[3] = @"It's %8$@%9$@; the high today was forecast as %10$@%11$@. ";
  uint64_t v3 = [NSDictionary dictionaryWithObjects:v125 forKeys:v124 count:4];
  v129[1] = v3;
  v128[2] = @"CURRENTLY_COMMA";
  v122[0] = @"AFTERNOON_SAME";
  uint64_t v4 = [@"The low tonight will be %8$@%9$@. " lowercaseString];
  v123[0] = v4;
  v122[1] = @"AFTERNOON_DIFFERENT";
  uint64_t v5 = [@"%8$@ tonight with a low of %9$@%10$@. " lowercaseString];
  v123[1] = v5;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v123 forKeys:v122 count:2];
  v128[3] = @"CONDITION_LIKELY_TOMORROW";
  v129[2] = v6;
  v129[3] = &unk_26DAEB078;
  v47 = [NSDictionary dictionaryWithObjects:v129 forKeys:v128 count:4];

  v120[0] = @"TODAY_CONDITION";
  v118 = @"IT_IS_CURRENTLY_HIGH_WILL_BE";
  v119 = @"8 = Current Temperature, 9 = Temperature Unit, 10 = High Temperature for day, 11 = Temperature Unit ";
  uint64_t v7 = [NSDictionary dictionaryWithObjects:&v119 forKeys:&v118 count:1];
  v121[0] = v7;
  v120[1] = @"CURRENTLY_NOW";
  v116[0] = @"MIDDAY_SAME";
  v116[1] = @"MIDDAY_DIFFERENT";
  v117[0] = @"2 = High Temperature for day, 3 = Temperature Unit , 4 = Low Temperature for day, 5 = Temperature Unit ";
  v117[1] = @"2 = High Temperature for day, 3 = Temperature Unit, 4 = Condition (Cloudy, Rainy, etc.), 5 = Low Temperature for day, 6 = Temperature Unit ";
  v116[2] = @"IT_IS_CURRENTLY_HIGH_WILL_BE";
  v116[3] = @"IT_IS_CURRENTLY_HIGH_WAS";
  v117[2] = @"8 = Current Temperature, 9 = Temperature Unit, 10 = High Temperature for day, 11 = Temperature Unit ";
  v117[3] = @"8 = Current Temperature, 9 = Temperature Unit, 10 = High Temperature for day, 11 = Temperature Unit ";
  unint64_t v8 = [NSDictionary dictionaryWithObjects:v117 forKeys:v116 count:4];
  v121[1] = v8;
  v120[2] = @"CURRENTLY_COMMA";
  v114[0] = @"AFTERNOON_SAME";
  v114[1] = @"AFTERNOON_DIFFERENT";
  v115[0] = @"8 = Low Temperature for tonight, 9 = Temperature Unit";
  v115[1] = @"8 = Condition for tonight, 9 = Low Temperature for tonight, 10 = Temperature Unit ";
  uint64_t v9 = [NSDictionary dictionaryWithObjects:v115 forKeys:v114 count:2];
  v120[3] = @"CONDITION_LIKELY_TOMORROW";
  v121[2] = v9;
  v121[3] = &unk_26DAEB0A0;
  v46 = [NSDictionary dictionaryWithObjects:v121 forKeys:v120 count:4];

  v112[0] = &stru_26DADC2F0;
  v112[1] = @"IT_IS_CURRENTLY_HIGH_WILL_BE";
  v113[0] = &stru_26DADC2F0;
  v113[1] = @"It's currently %8$@%9$@; the high will be %10$@%11$@. ";
  v112[2] = @"MIDDAY_SAME";
  void v112[3] = @"MIDDAY_DIFFERENT";
  void v113[2] = @"The high will be %8$@%9$@. The low tonight will be %10$@%11$@. ";
  v113[3] = @"The high will be %8$@%9$@. %10$@ tonight with a low of %11$@%12$@. ";
  v112[4] = @"AFTERNOON_SAME";
  v112[5] = @"AFTERNOON_DIFFERENT";
  v113[4] = @"The low tonight will be %8$@%9$@. ";
  v113[5] = @"%8$@ tonight with a low of %9$@%10$@. ";
  v50 = [NSDictionary dictionaryWithObjects:v113 forKeys:v112 count:6];
  v110[0] = @"_";
  v110[1] = @"IT_IS_CURRENTLY_HIGH_WILL_BE";
  v111[0] = &stru_26DADC2F0;
  v111[1] = @"8 = Current Temperature, 9 = Temperature Unit, 10 = High Temperature for day, 11 = Temperature Unit ";
  v110[2] = @"MIDDAY_SAME";
  v110[3] = @"MIDDAY_DIFFERENT";
  v111[2] = @"8 = High Temperature for day, 9 = Temperature Unit, 10 = Low Temperature for day, 11 = Temperature Unit";
  v111[3] = @"8 = High Temperature for day, 9 = Temperature Unit, 10 = Condition (Cloudy, Rainy, etc.), 11 = Low Temperature for day, 12 = Temperature Unit,";
  v110[4] = @"AFTERNOON_SAME";
  void v110[5] = @"AFTERNOON_DIFFERENT";
  v111[4] = @"8 = Low Temperature for tonight, 9 = Temperature Unit";
  void v111[5] = @"8 = Condition for tonight, 9 = Low Temperature for tonight, 10 = Temperature Unit ";
  int64_t v66 = [NSDictionary dictionaryWithObjects:v111 forKeys:v110 count:6];
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  uint64_t v55 = [&unk_26DAEB028 countByEnumeratingWithState:&v83 objects:v109 count:16];
  if (v55)
  {
    uint64_t v54 = *(void *)v84;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v84 != v54) {
          objc_enumerationMutation(&unk_26DAEB028);
        }
        uint64_t v57 = v10;
        uint64_t v11 = *(void *)(*((void *)&v83 + 1) + 8 * v10);
        NSUInteger v12 = [v47 objectForKey:v11];
        uint64_t v62 = v11;
        v64 = [v46 objectForKey:v11];
        long long v79 = 0u;
        long long v80 = 0u;
        long long v81 = 0u;
        long long v82 = 0u;
        id v13 = v12;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v79 objects:v108 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v80;
          uint64_t v60 = *(void *)v80;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v80 != v16) {
                objc_enumerationMutation(v13);
              }
              uint64_t v18 = *(void *)(*((void *)&v79 + 1) + 8 * i);
              double v19 = WALogForCategory(0);
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              {
                double v20 = [&unk_26DAEB028 objectForKey:v62];
                [v13 objectForKey:v18];
                v22 = id v21 = v13;
                long long v23 = [&unk_26DAEB050 objectForKey:v62];
                long long v24 = [v64 objectForKey:v18];
                *(_DWORD *)buf = 138413570;
                uint64_t v88 = v62;
                __int16 v89 = 2112;
                uint64_t v90 = v18;
                __int16 v91 = 2112;
                v92 = v20;
                __int16 v93 = 2112;
                v94 = v22;
                __int16 v95 = 2112;
                v96 = v23;
                __int16 v97 = 2112;
                v98 = v24;
                _os_log_impl(&dword_226D1D000, v19, OS_LOG_TYPE_DEFAULT, "########### \"%@_%@\" = \"%@%@\"; /* %@%@ */",
                  buf,
                  0x3Eu);

                id v13 = v21;
                uint64_t v16 = v60;
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v79 objects:v108 count:16];
          }
          while (v15);
        }

        uint64_t v25 = WALogForCategory(0);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_226D1D000, v25, OS_LOG_TYPE_DEFAULT, "###########", buf, 2u);
        }

        uint64_t v10 = v57 + 1;
      }
      while (v57 + 1 != v55);
      uint64_t v55 = [&unk_26DAEB028 countByEnumeratingWithState:&v83 objects:v109 count:16];
    }
    while (v55);
  }
  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  uint64_t v48 = [&unk_26DAEB0C8 countByEnumeratingWithState:&v75 objects:v107 count:16];
  if (v48)
  {
    uint64_t v45 = *(void *)v76;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v76 != v45) {
          objc_enumerationMutation(&unk_26DAEB0C8);
        }
        uint64_t v49 = v26;
        uint64_t v56 = *(void *)(*((void *)&v75 + 1) + 8 * v26);
        long long v71 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        uint64_t v52 = [&unk_26DAEB118 countByEnumeratingWithState:&v71 objects:v106 count:16];
        if (v52)
        {
          uint64_t v51 = *(void *)v72;
          do
          {
            uint64_t v27 = 0;
            do
            {
              if (*(void *)v72 != v51) {
                objc_enumerationMutation(&unk_26DAEB118);
              }
              uint64_t v53 = v27;
              uint64_t v61 = *(void *)(*((void *)&v71 + 1) + 8 * v27);
              long long v67 = 0u;
              long long v68 = 0u;
              long long v69 = 0u;
              long long v70 = 0u;
              id v28 = v50;
              uint64_t v29 = [v28 countByEnumeratingWithState:&v67 objects:v105 count:16];
              if (v29)
              {
                uint64_t v30 = v29;
                uint64_t v31 = *(void *)v68;
                uint64_t v58 = *(void *)v68;
                id v59 = v28;
                do
                {
                  uint64_t v32 = 0;
                  uint64_t v63 = v30;
                  do
                  {
                    if (*(void *)v68 != v31) {
                      objc_enumerationMutation(v28);
                    }
                    v33 = *(void **)(*((void *)&v67 + 1) + 8 * v32);
                    uint64_t v34 = [v66 objectForKey:v33];
                    v35 = (void *)v34;
                    v36 = &stru_26DADC2F0;
                    if (v34) {
                      v36 = (__CFString *)v34;
                    }
                    double v37 = v36;

                    v38 = WALogForCategory(0);
                    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
                    {
                      BOOL v65 = [&unk_26DAEB0C8 objectForKey:v56];
                      v39 = [&unk_26DAEB118 objectForKey:v61];
                      v40 = [v28 objectForKey:v33];
                      v41 = [&unk_26DAEB0F0 objectForKey:v56];
                      v42 = [&unk_26DAEB140 objectForKey:v61];
                      *(_DWORD *)buf = 138414338;
                      uint64_t v88 = v56;
                      __int16 v89 = 2112;
                      uint64_t v90 = v61;
                      __int16 v91 = 2112;
                      v92 = v33;
                      __int16 v93 = 2112;
                      uint64_t v30 = v63;
                      v94 = v65;
                      __int16 v95 = 2112;
                      v96 = v39;
                      __int16 v97 = 2112;
                      v98 = v40;
                      __int16 v99 = 2112;
                      NSUInteger v100 = v41;
                      __int16 v101 = 2112;
                      v102 = v42;
                      __int16 v103 = 2112;
                      v104 = v37;
                      _os_log_impl(&dword_226D1D000, v38, OS_LOG_TYPE_DEFAULT, "########### \"%@_%@_%@\" = \"%@%@%@\"; /* %@%@%@ */",
                        buf,
                        0x5Cu);

                      id v28 = v59;
                      uint64_t v31 = v58;
                    }
                    ++v32;
                  }
                  while (v30 != v32);
                  uint64_t v30 = [v28 countByEnumeratingWithState:&v67 objects:v105 count:16];
                }
                while (v30);
              }

              v43 = WALogForCategory(0);
              if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_226D1D000, v43, OS_LOG_TYPE_DEFAULT, "###########", buf, 2u);
              }

              uint64_t v27 = v53 + 1;
            }
            while (v53 + 1 != v52);
            uint64_t v52 = [&unk_26DAEB118 countByEnumeratingWithState:&v71 objects:v106 count:16];
          }
          while (v52);
        }
        v44 = WALogForCategory(0);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_226D1D000, v44, OS_LOG_TYPE_DEFAULT, "###########", buf, 2u);
        }

        uint64_t v26 = v49 + 1;
      }
      while (v49 + 1 != v48);
      uint64_t v48 = [&unk_26DAEB0C8 countByEnumeratingWithState:&v75 objects:v107 count:16];
    }
    while (v48);
  }
}

- (void)updateCityForModel:(id)a3
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  uint64_t v4 = (City *)a3;
  if (!v4) {
    goto LABEL_34;
  }
  uint64_t v5 = WALogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v53 = 136315650;
    uint64_t v54 = (City *)"-[City updateCityForModel:]";
    __int16 v55 = 2112;
    uint64_t v56 = v4;
    __int16 v57 = 2112;
    uint64_t v58 = self;
    _os_log_impl(&dword_226D1D000, v5, OS_LOG_TYPE_DEFAULT, "%s, forecastModel:%@, city:%@, airQualityCondition", (uint8_t *)&v53, 0x20u);
  }

  [(City *)self clearForecasts];
  uint64_t v6 = [(City *)v4 location];

  if (v6)
  {
    uint64_t v7 = [(City *)v4 location];
    [(City *)self setWfLocation:v7];
  }
  unint64_t v8 = [(City *)v4 link];
  [(City *)self setLink:v8];

  uint64_t v9 = [(City *)v4 deepLink];
  [(City *)self setDeeplink:v9];

  uint64_t v10 = [(City *)v4 currentConditions];
  uint64_t v11 = v10;
  if (v10)
  {
    NSUInteger v12 = [v10 temperature];
    [(City *)self setTemperature:v12];

    id v13 = [v11 feelsLike];
    [(City *)self setFeelsLike:v13];

    [v11 windDirection];
    -[City setWindDirection:](self, "setWindDirection:");
    [v11 windSpeed];
    -[City setWindSpeed:](self, "setWindSpeed:");
    [v11 humidity];
    -[City setHumidity:](self, "setHumidity:");
    [v11 dewPoint];
    -[City setDewPoint:](self, "setDewPoint:");
    [v11 visibility];
    -[City setVisibility:](self, "setVisibility:");
    [v11 pressure];
    -[City setPressure:](self, "setPressure:");
    -[City setPressureRising:](self, "setPressureRising:", [v11 pressureRising]);
    -[City setUVIndex:](self, "setUVIndex:", [v11 UVIndex]);
    [v11 precipitationPast24Hours];
    [(City *)self setPrecipitationPast24Hours:v14];
    -[City setConditionCode:](self, "setConditionCode:", [v11 conditionCode]);
    -[City setObservationTime:](self, "setObservationTime:", [v11 observationTime]);
  }
  uint64_t v15 = [(City *)v4 airQualityConditions];
  uint64_t v16 = [(City *)v15 localizedAirQualityScaleCategory];
  if (v15)
  {
    long long v17 = WALogForCategory(0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v53 = 138412546;
      uint64_t v54 = v15;
      __int16 v55 = 2112;
      uint64_t v56 = self;
      _os_log_impl(&dword_226D1D000, v17, OS_LOG_TYPE_DEFAULT, "airCondition=%@, city: %@", (uint8_t *)&v53, 0x16u);
    }

    uint64_t v18 = [(City *)v15 scaleIdentifier];
    if (!v18)
    {
      double v19 = WALogForCategory(0);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        int v53 = 138412290;
        uint64_t v54 = self;
        _os_log_impl(&dword_226D1D000, v19, OS_LOG_TYPE_DEFAULT, "error airCondition.scaleIdentifier was NULL for city: %@, using default", (uint8_t *)&v53, 0xCu);
      }

      uint64_t v18 = @"AQI";
    }
    [(City *)self setAirQualityScaleIdentifier:v18];
    double v20 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[City airQualityIndex](v15, "airQualityIndex"));
    [(City *)self setAirQualityIdx:v20];

    [(City *)self setAirQualityScaleCategory:v16];
    id v21 = [NSNumber numberWithUnsignedInteger:WAAirQualityCategoryFromConditions(v15)];
    [(City *)self setAirQualityCategory:v21];

    [(City *)self setAirQualitySignificance:[(City *)v15 significance]];
    [(City *)self setAirQualityTemporarilyUnavailable:[(City *)v15 temporarilyUnavailable]];
    long long v22 = [(City *)v15 scale];
    [(City *)self setAirQualityScale:v22];

    long long v23 = [(City *)v15 currentScaleCategory];
    [(City *)self setAirQualityCurrentScaleCategory:v23];

    long long v24 = [(City *)v15 currentScaleCategory];
    uint64_t v25 = [v24 recommendation];
    [(City *)self setAirQualityRecommendation:v25];

    uint64_t v26 = [(City *)v15 providerAttribution];
    uint64_t v27 = [v26 name];
    uint64_t v28 = [v27 length];

    if (v28)
    {
      uint64_t v29 = [[WeatherAQIAttribution alloc] initWithFoundationAttribution:v26];
      [(City *)self setAirQualityAttribution:v29];
      uint64_t v30 = [(City *)v15 learnMoreURL];
    }
    else
    {
      if (![(City *)self airQualityCanUseDefaultAttribution])
      {
LABEL_20:

        goto LABEL_21;
      }
      uint64_t v31 = [MEMORY[0x263F85F20] sharedManager];
      uint64_t v32 = [v31 defaultProviderAttribution];

      uint64_t v29 = [[WeatherAQIAttribution alloc] initWithFoundationAttribution:v32];
      [(City *)self setAirQualityAttribution:v29];
      uint64_t v30 = [NSURL URLWithString:@"http://www.weather.com/wx/today/"];
      uint64_t v26 = (void *)v32;
    }
    [(City *)self setAirQualityLearnMoreURL:v30];

    goto LABEL_20;
  }
LABEL_21:
  if ([(City *)self conditionCode] == 3200)
  {
    v33 = WALogForCategory(0);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      -[City updateCityForModel:](self);
    }
  }
  uint64_t v34 = WALogForCategory(0);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    v35 = [(City *)v4 hourlyForecasts];
    int v53 = 138543618;
    uint64_t v54 = self;
    __int16 v55 = 2114;
    uint64_t v56 = v35;
    _os_log_impl(&dword_226D1D000, v34, OS_LOG_TYPE_DEFAULT, "Updating city with hourly forecast, city: %{public}@, hourlyForecast=%{public}@", (uint8_t *)&v53, 0x16u);
  }
  v36 = [(City *)v4 hourlyForecasts];
  [(City *)self setHourlyForecasts:v36];

  double v37 = WALogForCategory(0);
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    v38 = [(City *)v4 dailyForecasts];
    int v53 = 138543618;
    uint64_t v54 = self;
    __int16 v55 = 2114;
    uint64_t v56 = v38;
    _os_log_impl(&dword_226D1D000, v37, OS_LOG_TYPE_DEFAULT, "Updating city with daily forecast, city: %{public}@, dailyForecast=%{public}@", (uint8_t *)&v53, 0x16u);
  }
  v39 = [(City *)v4 dailyForecasts];
  [(City *)self setDayForecasts:v39];

  v40 = [(id)objc_opt_class() _ISO8601Calendar];
  v41 = [(City *)self timeZone];
  [v40 setTimeZone:v41];

  v42 = [(City *)v4 sunrise];
  v43 = [v40 components:96 fromDate:v42];

  -[City setSunriseTime:](self, "setSunriseTime:", [v43 minute] + 100 * objc_msgSend(v43, "hour"));
  v44 = [(City *)v4 sunset];
  uint64_t v45 = [v40 components:96 fromDate:v44];

  -[City setSunsetTime:](self, "setSunsetTime:", [v45 minute] + 100 * objc_msgSend(v45, "hour"));
  v46 = WALogForCategory(0);
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
  {
    v47 = [(City *)v4 severeWeatherEvents];
    int v53 = 138543618;
    uint64_t v54 = self;
    __int16 v55 = 2114;
    uint64_t v56 = v47;
    _os_log_impl(&dword_226D1D000, v46, OS_LOG_TYPE_DEFAULT, "Updating city with severe weather events, city: %{public}@, severeWeatherEvents=%{public}@", (uint8_t *)&v53, 0x16u);
  }
  uint64_t v48 = [(City *)v4 severeWeatherEvents];
  [(City *)self updateCityForSevereWeatherEvents:v48];

  uint64_t v49 = WALogForCategory(0);
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    v50 = [(City *)v4 nextHourPrecipitation];
    int v53 = 138543618;
    uint64_t v54 = self;
    __int16 v55 = 2114;
    uint64_t v56 = v50;
    _os_log_impl(&dword_226D1D000, v49, OS_LOG_TYPE_DEFAULT, "Updating city with next hour precipitation model, city: %{public}@, nextHourPrecipitation=%{public}@", (uint8_t *)&v53, 0x16u);
  }
  uint64_t v51 = [(City *)v4 nextHourPrecipitation];
  [(City *)self setNextHourPrecipitation:v51];

  uint64_t v52 = [MEMORY[0x263EFF910] date];
  [(City *)self setUpdateTime:v52];

LABEL_34:
}

- (void)updateCityForSevereWeatherEvents:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v15 = [MEMORY[0x263EFF980] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "expirationDate", v15);
        NSUInteger v12 = [MEMORY[0x263EFF910] date];
        uint64_t v13 = [v11 compare:v12];

        if (v13 == 1) {
          [v15 addObject:v10];
        }
        if ([(City *)self _isValidLearnMoreURLForSevereEvent:v10])
        {
          uint64_t v14 = [v10 URL];

          uint64_t v7 = (void *)v14;
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
  }

  [(City *)self setSevereWeatherEvents:v15];
  [(City *)self setSevereWeatherEventLearnMoreURL:v7];
}

- (BOOL)_isValidLearnMoreURLForSevereEvent:(id)a3
{
  uint64_t v3 = [a3 URL];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 scheme];
    uint64_t v6 = [v5 uppercaseString];

    if (([v6 isEqualToString:@"HTTPS"] & 1) != 0
      || ([v6 isEqualToString:@"HTTP"] & 1) != 0)
    {
      BOOL v7 = 1;
    }
    else
    {
      uint64_t v8 = WALogForCategory(0);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[City _isValidLearnMoreURLForSevereEvent:](v4);
      }

      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)_dataIsValid
{
  uint64_t v3 = [(City *)self timeZone];
  if (v3)
  {
    id v4 = [(City *)self hourlyForecasts];
    if ([v4 count])
    {
      uint64_t v5 = [(City *)self dayForecasts];
      if ([v5 count])
      {
        uint64_t v6 = [(City *)self temperature];
        BOOL v7 = v6 != 0;
      }
      else
      {
        BOOL v7 = 0;
      }
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (NSString)identifier
{
  uint64_t v3 = NSString;
  [(City *)self coordinate];
  uint64_t v5 = v4;
  [(City *)self coordinate];
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", @"%f-%f", v5, v6);
}

- (NSString)countryCode
{
  uint64_t v2 = [(City *)self wfLocation];
  uint64_t v3 = [v2 countryAbbreviation];

  return (NSString *)v3;
}

- (unint64_t)aqiDataAvailabilityStatus
{
  uint64_t v3 = +[WeatherInternalPreferences sharedInternalPreferences];
  int v4 = [v3 BOOLForKey:@"feature.enhancedAQIView.overridesEnabled"];
  if ([v3 BOOLForKey:@"feature.enhancedAQIView.demoModeEnabled"])
  {
    if ([(City *)self aqiDataAvailabilityStatusOverride])
    {
      unint64_t v5 = [(City *)self aqiDataAvailabilityStatusOverride];
LABEL_9:
      unint64_t v8 = v5;
      goto LABEL_12;
    }
LABEL_8:
    unint64_t v5 = [(City *)self aqiDataAvailabilityStatusFromAppConfig];
    goto LABEL_9;
  }
  if (!v4) {
    goto LABEL_8;
  }
  uint64_t v6 = [v3 objectForKey:@"feature.enhancedAQIView.airQualityAvailabilityForCountryOverride"];
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    uint64_t v7 = [v6 integerValue];
  }
  else {
    uint64_t v7 = [(City *)self aqiDataAvailabilityStatusFromAppConfig];
  }
  unint64_t v8 = v7;

LABEL_12:
  return v8;
}

- (unint64_t)aqiDataAvailabilityStatusFromAppConfig
{
  uint64_t v3 = [MEMORY[0x263F85F60] sharedInstance];
  int v4 = [v3 settings];
  unint64_t v5 = [v4 aqiEnabledCountryCodes];

  uint64_t v6 = [(City *)self countryCode];
  LODWORD(v4) = [v5 containsObject:v6];

  if (!v4) {
    goto LABEL_6;
  }
  if (![(City *)self airQualityTemporarilyUnavailable])
  {
    uint64_t v8 = [(City *)self airQualityIdx];
    if (v8)
    {
      uint64_t v9 = (void *)v8;
      uint64_t v10 = [(City *)self airQualityCategory];
      BOOL v11 = v10 != 0;

      unint64_t v7 = 2 * v11;
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v7 = 0;
    goto LABEL_7;
  }
  unint64_t v7 = 1;
LABEL_7:

  return v7;
}

- (NSNumber)airQualityCategory
{
  uint64_t v3 = self->_airQualityCategory;
  int v4 = +[WeatherInternalPreferences sharedInternalPreferences];
  int v5 = [v4 BOOLForKey:@"feature.enhancedAQIView.overridesEnabled"];
  if ([v4 BOOLForKey:@"feature.enhancedAQIView.demoModeEnabled"]
    && ([(City *)self airQualityCategoryOverride],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    [(City *)self airQualityCategoryOverride];
    unint64_t v7 = v3;
    uint64_t v3 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v5) {
      goto LABEL_9;
    }
    unint64_t v7 = [v4 objectForKey:@"feature.enhancedAQIView.airQualityCategoryOverride"];
    if (v7)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unint64_t v7 = v7;

        uint64_t v3 = v7;
      }
    }
  }

LABEL_9:
  return v3;
}

- (NSNumber)airQualityIdx
{
  uint64_t v3 = self->_airQualityIdx;
  int v4 = +[WeatherInternalPreferences sharedInternalPreferences];
  int v5 = [v4 BOOLForKey:@"feature.enhancedAQIView.overridesEnabled"];
  if ([v4 BOOLForKey:@"feature.enhancedAQIView.demoModeEnabled"]
    && ([(City *)self airQualityIdxOverride],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    [(City *)self airQualityIdxOverride];
    unint64_t v7 = v3;
    uint64_t v3 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v5) {
      goto LABEL_8;
    }
    unint64_t v7 = [v4 stringForKey:@"feature.enhancedAQIView.airQualityIndexOverride"];
    if (v7)
    {
      uint64_t v8 = WANumberFormatterForDisplayingAQI();
      uint64_t v9 = [v8 numberFromString:v7];

      uint64_t v3 = (NSNumber *)v9;
    }
  }

LABEL_8:
  return v3;
}

- (unint64_t)airQualitySignificance
{
  uint64_t airQualitySignificance = self->_airQualitySignificance;
  int v4 = +[WeatherInternalPreferences sharedInternalPreferences];
  int v5 = [v4 BOOLForKey:@"feature.enhancedAQIView.overridesEnabled"];
  if ([v4 BOOLForKey:@"feature.enhancedAQIView.demoModeEnabled"]
    && [(City *)self airQualitySignificanceOverride])
  {
    uint64_t airQualitySignificance = [(City *)self airQualitySignificanceOverride];
  }
  else if (v5)
  {
    uint64_t v6 = [v4 objectForKey:@"feature.enhancedAQIView.airQualitySignificanceOverride"];
    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t airQualitySignificance = [v6 integerValue];
      }
    }
  }
  return airQualitySignificance;
}

- (BOOL)airQualityForceHideRecommendation
{
  uint64_t v2 = +[WeatherInternalPreferences sharedInternalPreferences];
  int v3 = [v2 BOOLForKey:@"feature.enhancedAQIView.overridesEnabled"];
  char v4 = [v2 BOOLForKey:@"feature.enhancedAQIView.demoModeEnabled"];
  BOOL v5 = 0;
  if (v3 && (v4 & 1) == 0)
  {
    uint64_t v6 = [v2 objectForKey:@"feature.enhancedAQIView.airQualityRecommendationEnabled"];
    BOOL v5 = v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v6 integerValue] == 1;
  }
  return v5;
}

- (BOOL)airQualityCanUseDefaultAttribution
{
  uint64_t v2 = +[WeatherInternalPreferences sharedInternalPreferences];
  int v3 = [v2 BOOLForKey:@"feature.enhancedAQIView.overridesEnabled"];
  char v4 = [v2 BOOLForKey:@"feature.enhancedAQIView.demoModeEnabled"];
  char v5 = 0;
  if (v3 && (v4 & 1) == 0) {
    char v5 = [v2 BOOLForKey:@"feature.enhancedAQIView.useDefaultAttribution"];
  }

  return v5;
}

- (BOOL)airQualityScaleIsAscending
{
  int v3 = [(City *)self airQualityScale];

  if (v3)
  {
    char v4 = [(City *)self airQualityScale];
    char v5 = [v4 isAscending];
  }
  else
  {
    char v5 = 1;
  }
  uint64_t v6 = +[WeatherInternalPreferences sharedInternalPreferences];
  int v7 = [v6 BOOLForKey:@"feature.enhancedAQIView.scaleOverridesEnabled"];
  char v8 = [v6 BOOLForKey:@"feature.enhancedAQIView.demoModeEnabled"];
  if (v7 && (v8 & 1) == 0)
  {
    uint64_t v9 = [v6 objectForKey:@"feature.enhancedAQIView.scale.ascendingOverride"];
    if (v9)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v10 = [v9 integerValue];
        if (v10 == 1)
        {
          char v5 = 0;
        }
        else if (!v10)
        {
          char v5 = 1;
        }
      }
    }
  }
  return v5;
}

- (BOOL)airQualityScaleIsNumerical
{
  int v3 = [(City *)self airQualityScale];

  if (v3)
  {
    char v4 = [(City *)self airQualityScale];
    char v5 = [v4 isNumerical];
  }
  else
  {
    char v5 = 1;
  }
  uint64_t v6 = +[WeatherInternalPreferences sharedInternalPreferences];
  int v7 = [v6 BOOLForKey:@"feature.enhancedAQIView.scaleOverridesEnabled"];
  char v8 = [v6 BOOLForKey:@"feature.enhancedAQIView.demoModeEnabled"];
  if (v7 && (v8 & 1) == 0)
  {
    uint64_t v9 = [v6 objectForKey:@"feature.enhancedAQIView.scale.numericalOverride"];
    if (v9)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v10 = [v9 integerValue];
        if (v10 == 1)
        {
          char v5 = 0;
        }
        else if (!v10)
        {
          char v5 = 1;
        }
      }
    }
  }
  return v5;
}

- (WFAQIScale)airQualityScale
{
  uint64_t v2 = self->_airQualityScale;
  if (!v2)
  {
    int v3 = +[WeatherInternalPreferences sharedInternalPreferences];
    if ([v3 BOOLForKey:@"feature.enhancedAQIView.allowUseDefaultScaleIfCacheEmpty"])
    {
      char v4 = [MEMORY[0x263F85EA8] sharedManager];
      uint64_t v2 = [v4 defaultScale];
    }
    else
    {
      uint64_t v2 = 0;
    }
  }
  return v2;
}

- (NSString)updateTimeString
{
  return self->_updateTimeString;
}

- (void)setUpdateTimeString:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)isLocalWeatherCity
{
  return self->_isLocalWeatherCity;
}

- (void)setIsLocalWeatherCity:(BOOL)a3
{
  self->_isLocalWeatherCity = a3;
}

- (BOOL)isTransient
{
  return self->_transient;
}

- (void)setTransient:(BOOL)a3
{
  self->_transient = a3;
}

- (NSString)woeid
{
  return self->_woeid;
}

- (void)setWoeid:(id)a3
{
}

- (NSString)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (NSString)ISO3166CountryAbbreviation
{
  return self->_ISO3166CountryAbbreviation;
}

- (void)setISO3166CountryAbbreviation:(id)a3
{
}

- (WFTemperature)temperature
{
  return self->_temperature;
}

- (WFTemperature)feelsLike
{
  return self->_feelsLike;
}

- (void)setFeelsLike:(id)a3
{
}

- (unint64_t)observationTime
{
  return self->_observationTime;
}

- (void)setObservationTime:(unint64_t)a3
{
  self->_unint64_t observationTime = a3;
}

- (unint64_t)sunsetTime
{
  return self->_sunsetTime;
}

- (void)setSunsetTime:(unint64_t)a3
{
  self->_sunsetTime = a3;
}

- (unint64_t)sunriseTime
{
  return self->_sunriseTime;
}

- (void)setSunriseTime:(unint64_t)a3
{
  self->_sunriseTime = a3;
}

- (unint64_t)moonPhase
{
  return self->_moonPhase;
}

- (void)setMoonPhase:(unint64_t)a3
{
  self->_moonPhase = a3;
}

- (unint64_t)uvIndex
{
  return self->_uvIndex;
}

- (void)setUVIndex:(unint64_t)a3
{
  self->_uvIndex = a3;
}

- (double)precipitationPast24Hours
{
  return self->_precipitationPast24Hours;
}

- (void)setPrecipitationPast24Hours:(double)a3
{
  self->_precipitationPast24Hours = a3;
}

- (NSURL)link
{
  return self->_link;
}

- (void)setLink:(id)a3
{
}

- (NSURL)deeplink
{
  return self->_deeplink;
}

- (void)setDeeplink:(id)a3
{
}

- (CLLocation)location
{
  return (CLLocation *)objc_getProperty(self, a2, 192, 1);
}

- (void)setLocation:(id)a3
{
}

- (NSString)searchTitle
{
  return self->_searchTitle;
}

- (void)setSearchTitle:(id)a3
{
}

- (NSString)searchSubtitle
{
  return self->_searchSubtitle;
}

- (void)setSearchSubtitle:(id)a3
{
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(id)a3
{
}

- (NSDate)timeZoneUpdateDate
{
  return self->_timeZoneUpdateDate;
}

- (void)setTimeZoneUpdateDate:(id)a3
{
}

- (NSError)lastUpdateError
{
  return self->_lastUpdateError;
}

- (void)setLastUpdateError:(id)a3
{
}

- (NSDate)updateTime
{
  return self->_updateTime;
}

- (float)windChill
{
  return self->_windChill;
}

- (void)setWindChill:(float)a3
{
  self->_windChill = a3;
}

- (float)windDirection
{
  return self->_windDirection;
}

- (void)setWindDirection:(float)a3
{
  self->_windDirection = a3;
}

- (float)windSpeed
{
  return self->_windSpeed;
}

- (void)setWindSpeed:(float)a3
{
  self->_float windSpeed = a3;
}

- (float)humidity
{
  return self->_humidity;
}

- (void)setHumidity:(float)a3
{
  self->_humidity = a3;
}

- (float)visibility
{
  return self->_visibility;
}

- (void)setVisibility:(float)a3
{
  self->_float visibility = a3;
}

- (float)pressure
{
  return self->_pressure;
}

- (void)setPressure:(float)a3
{
  self->_pressure = a3;
}

- (unint64_t)pressureRising
{
  return self->_pressureRising;
}

- (void)setPressureRising:(unint64_t)a3
{
  self->_pressureRising = a3;
}

- (float)dewPoint
{
  return self->_dewPoint;
}

- (void)setDewPoint:(float)a3
{
  self->_dewPoint = a3;
}

- (float)heatIndex
{
  return self->_heatIndex;
}

- (void)setHeatIndex:(float)a3
{
  self->_heatIndex = a3;
}

- (BOOL)autoUpdate
{
  return self->_autoUpdate;
}

- (NSArray)severeWeatherEvents
{
  return self->_severeWeatherEvents;
}

- (void)setSevereWeatherEvents:(id)a3
{
}

- (WFNextHourPrecipitation)nextHourPrecipitation
{
  return self->_nextHourPrecipitation;
}

- (void)setNextHourPrecipitation:(id)a3
{
}

- (NSURL)severeWeatherEventLearnMoreURL
{
  return self->_severeWeatherEventLearnMoreURL;
}

- (void)setSevereWeatherEventLearnMoreURL:(id)a3
{
}

- (void)setAirQualityIdx:(id)a3
{
}

- (void)setAirQualityCategory:(id)a3
{
}

- (NSString)airQualityScaleIdentifier
{
  return self->_airQualityScaleIdentifier;
}

- (void)setAirQualityScaleIdentifier:(id)a3
{
}

- (WFAQIScaleCategory)airQualityScaleCategory
{
  return self->_airQualityScaleCategory;
}

- (void)setAirQualityScaleCategory:(id)a3
{
}

- (void)setAirQualitySignificance:(unint64_t)a3
{
  self->_uint64_t airQualitySignificance = a3;
}

- (NSString)airQualityRecommendation
{
  return self->_airQualityRecommendation;
}

- (void)setAirQualityRecommendation:(id)a3
{
}

- (BOOL)airQualityTemporarilyUnavailable
{
  return self->_airQualityTemporarilyUnavailable;
}

- (void)setAirQualityTemporarilyUnavailable:(BOOL)a3
{
  self->_airQualityTemporarilyUnavailable = a3;
}

- (WeatherAQIAttribution)airQualityAttribution
{
  return self->_airQualityAttribution;
}

- (void)setAirQualityAttribution:(id)a3
{
}

- (NSURL)airQualityLearnMoreURL
{
  return self->_airQualityLearnMoreURL;
}

- (void)setAirQualityLearnMoreURL:(id)a3
{
}

- (void)setAirQualityScale:(id)a3
{
}

- (WFAQIScaleCategory)airQualityCurrentScaleCategory
{
  return self->_airQualityCurrentScaleCategory;
}

- (void)setAirQualityCurrentScaleCategory:(id)a3
{
}

- (WFLocation)wfLocation
{
  return self->_wfLocation;
}

- (unint64_t)lastUpdateStatus
{
  return self->_lastUpdateStatus;
}

- (void)setLastUpdateStatus:(unint64_t)a3
{
  self->_lastUpdateStatus = a3;
}

- (BOOL)isUpdating
{
  return self->_isUpdating;
}

- (void)setIsUpdating:(BOOL)a3
{
  self->_isUpdating = a3;
}

- (BOOL)isRequestedByFrameworkClient
{
  return self->_isRequestedByFrameworkClient;
}

- (void)setIsRequestedByFrameworkClient:(BOOL)a3
{
  self->_isRequestedByFrameworkClient = a3;
}

- (BOOL)lockedForDemoMode
{
  return self->_lockedForDemoMode;
}

- (void)setLockedForDemoMode:(BOOL)a3
{
  self->_lockedForDemoMode = a3;
}

- (int64_t)updateInterval
{
  return self->_updateInterval;
}

- (void)setUpdateInterval:(int64_t)a3
{
  self->_updateInterval = a3;
}

- (NSTimer)autoUpdateTimer
{
  return self->_autoUpdateTimer;
}

- (void)setAutoUpdateTimer:(id)a3
{
}

- (WFGeocodeRequest)activeGeocodeRequest
{
  return self->_activeGeocodeRequest;
}

- (void)setActiveGeocodeRequest:(id)a3
{
}

- (NSHashTable)cityUpdateObservers
{
  return self->_cityUpdateObservers;
}

- (void)setCityUpdateObservers:(id)a3
{
}

- (NSString)fullName
{
  return self->_fullName;
}

- (void)setFullName:(id)a3
{
}

- (unint64_t)aqiDataAvailabilityStatusOverride
{
  return self->_aqiDataAvailabilityStatusOverride;
}

- (void)setAqiDataAvailabilityStatusOverride:(unint64_t)a3
{
  self->_aqiDataAvailabilityStatusOverride = a3;
}

- (NSNumber)airQualityIdxOverride
{
  return self->_airQualityIdxOverride;
}

- (void)setAirQualityIdxOverride:(id)a3
{
}

- (NSNumber)airQualityCategoryOverride
{
  return self->_airQualityCategoryOverride;
}

- (void)setAirQualityCategoryOverride:(id)a3
{
}

- (unint64_t)airQualitySignificanceOverride
{
  return self->_airQualitySignificanceOverride;
}

- (void)setAirQualitySignificanceOverride:(unint64_t)a3
{
  self->_airQualitySignificanceOverride = a3;
}

- (NSString)weatherDisplayName
{
  return self->_weatherDisplayName;
}

- (void)setWeatherDisplayName:(id)a3
{
}

- (NSString)weatherLocationName
{
  return self->_weatherLocationName;
}

- (void)setWeatherLocationName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weatherLocationName, 0);
  objc_storeStrong((id *)&self->_weatherDisplayName, 0);
  objc_storeStrong((id *)&self->_airQualityCategoryOverride, 0);
  objc_storeStrong((id *)&self->_airQualityIdxOverride, 0);
  objc_storeStrong((id *)&self->_fullName, 0);
  objc_storeStrong((id *)&self->_cityUpdateObservers, 0);
  objc_storeStrong((id *)&self->_activeGeocodeRequest, 0);
  objc_storeStrong((id *)&self->_autoUpdateTimer, 0);
  objc_storeStrong((id *)&self->_wfLocation, 0);
  objc_storeStrong((id *)&self->_airQualityCurrentScaleCategory, 0);
  objc_storeStrong((id *)&self->_airQualityScale, 0);
  objc_storeStrong((id *)&self->_airQualityLearnMoreURL, 0);
  objc_storeStrong((id *)&self->_airQualityAttribution, 0);
  objc_storeStrong((id *)&self->_airQualityRecommendation, 0);
  objc_storeStrong((id *)&self->_airQualityScaleCategory, 0);
  objc_storeStrong((id *)&self->_airQualityScaleIdentifier, 0);
  objc_storeStrong((id *)&self->_airQualityCategory, 0);
  objc_storeStrong((id *)&self->_airQualityIdx, 0);
  objc_storeStrong((id *)&self->_severeWeatherEventLearnMoreURL, 0);
  objc_storeStrong((id *)&self->_nextHourPrecipitation, 0);
  objc_storeStrong((id *)&self->_severeWeatherEvents, 0);
  objc_storeStrong((id *)&self->_updateTime, 0);
  objc_storeStrong((id *)&self->_lastUpdateError, 0);
  objc_storeStrong((id *)&self->_timeZoneUpdateDate, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_searchSubtitle, 0);
  objc_storeStrong((id *)&self->_searchTitle, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_deeplink, 0);
  objc_storeStrong((id *)&self->_link, 0);
  objc_storeStrong((id *)&self->_feelsLike, 0);
  objc_storeStrong((id *)&self->_temperature, 0);
  objc_storeStrong((id *)&self->_ISO3166CountryAbbreviation, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_woeid, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_updateTimeString, 0);
  objc_storeStrong((id *)&self->_hourlyForecasts, 0);
  objc_storeStrong((id *)&self->_dayForecasts, 0);
}

- (NSDictionary)urlComponents
{
  int v3 = [MEMORY[0x263EFF9A0] dictionary];
  char v4 = NSNumber;
  [(City *)self latitude];
  char v5 = objc_msgSend(v4, "numberWithDouble:");
  objc_msgSend(v3, "na_safeSetObject:forKey:", v5, @"lat");

  uint64_t v6 = NSNumber;
  [(City *)self longitude];
  int v7 = objc_msgSend(v6, "numberWithDouble:");
  objc_msgSend(v3, "na_safeSetObject:forKey:", v7, @"long");

  char v8 = [(City *)self name];
  objc_msgSend(v3, "na_safeSetObject:forKey:", v8, @"city");

  if ([(City *)self isLocalWeatherCity]) {
    [v3 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"isLocal"];
  }
  return (NSDictionary *)v3;
}

- (void)update
{
  id v1 = [a1 displayName];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_226D1D000, v2, v3, "performing update of %@", v4, v5, v6, v7, v8);
}

void __42__City_updateTimeZoneWithCompletionBlock___block_invoke_2_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_226D1D000, a2, OS_LOG_TYPE_ERROR, "Geocode failure while updating wfLocation for timezone etc. Error: %@", (uint8_t *)&v3, 0xCu);
}

- (void)setUpdateTime:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_226D1D000, log, OS_LOG_TYPE_ERROR, "(-[City setUpdateTime] Got a null timeDateFormatter returning null _updateTimeString!!!", v1, 2u);
}

- (void)cityDidFinishUpdatingWithError:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_226D1D000, v1, OS_LOG_TYPE_ERROR, "City: %@, updating failed with error:%@", v2, 0x16u);
}

- (void)primaryConditionForRange:(NSObject *)a3 .cold.1(NSRange a1, id *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v5 = NSStringFromRange(a1);
  uint64_t v6 = [*a2 count];
  int v7 = 138412546;
  uint8_t v8 = v5;
  __int16 v9 = 2048;
  uint64_t v10 = v6;
  _os_log_error_impl(&dword_226D1D000, a3, OS_LOG_TYPE_ERROR, "-primaryConditionForRange: given invalid range: %@, # of hourly forecasts: %ld", (uint8_t *)&v7, 0x16u);
}

- (void)naturalLanguageDescriptionWithDescribedCondition:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_226D1D000, v0, OS_LOG_TYPE_DEBUG, "debugString: %@", v1, 0xCu);
}

- (void)naturalLanguageDescriptionWithDescribedCondition:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_226D1D000, v0, v1, "Forecast Type %d to %d", v2, v3, v4, v5, 0);
}

- (void)naturalLanguageDescriptionWithDescribedCondition:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_226D1D000, v0, v1, "Forecast Type %d to %d", v2, v3, v4, v5, 0);
}

- (void)naturalLanguageDescriptionWithDescribedCondition:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_226D1D000, v0, v1, "Forecast Type %d to %d", v2, v3, v4, v5, 0);
}

- (void)naturalLanguageDescriptionWithDescribedCondition:.cold.5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_226D1D000, v0, v1, "Forecast Type %d to %d", v2, v3, v4, v5, 0);
}

- (void)updateCityForModel:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 displayName];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_226D1D000, v2, v3, "Weather Update Warning: %@ has an unknown weather condition.", v4, v5, v6, v7, v8);
}

- (void)_isValidLearnMoreURLForSevereEvent:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 absoluteString];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_226D1D000, v2, v3, "Invalid scheme for severe weather learn more URL: %@", v4, v5, v6, v7, v8);
}

@end