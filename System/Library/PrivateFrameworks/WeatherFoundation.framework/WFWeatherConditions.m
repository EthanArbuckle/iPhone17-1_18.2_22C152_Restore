@interface WFWeatherConditions
+ (BOOL)supportsSecureCoding;
+ (NSCalendar)calendar;
+ (unint64_t)dateComponentCalendarUnits;
- (BOOL)isNightForecast;
- (BOOL)wf_isDay;
- (BOOL)wf_isDayIfSunrise:(id)a3 sunset:(id)a4;
- (NSMutableDictionary)components;
- (WFLocation)location;
- (WFWeatherConditions)init;
- (WFWeatherConditions)initWithCoder:(id)a3;
- (id)allComponents;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)valueForComponent:(id)a3;
- (id)valueForComponentSync:(id)a3;
- (os_unfair_lock_s)componentsLock;
- (void)_commonInit;
- (void)editLinksWithLocale:(id)a3 trackingParameter:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setComponents:(id)a3;
- (void)setComponentsLock:(os_unfair_lock_s)a3;
- (void)setLocation:(id)a3;
- (void)setNightForecast:(BOOL)a3;
- (void)setValue:(id)a3 forComponent:(id)a4;
- (void)setValueSync:(id)a3 forComponent:(id)a4;
@end

@implementation WFWeatherConditions

- (void)editLinksWithLocale:(id)a3 trackingParameter:(id)a4
{
  id v19 = a4;
  id v6 = a3;
  v7 = [(WFWeatherConditions *)self valueForComponent:@"WFWeatherIOSLinkComponent"];
  v8 = [(WFWeatherConditions *)self valueForComponent:@"WFWeatherMobileLinkComponent"];
  v9 = [(WFWeatherConditions *)self valueForComponent:@"WFWeatherWebLinkComponent"];
  if (v7 && (objc_msgSend(v7, "wf_URLHasParameter:", v19) & 1) == 0)
  {
    uint64_t v10 = objc_msgSend(v7, "wf_URLWithTracking:", v19);

    [(WFWeatherConditions *)self setValue:v10 forComponent:@"WFWeatherIOSLinkComponent"];
    v7 = (void *)v10;
  }
  v11 = [v6 objectForKey:*MEMORY[0x263EFF4D0]];
  v12 = [v11 uppercaseString];

  v13 = [v6 objectForKey:*MEMORY[0x263EFF508]];

  v14 = [v13 lowercaseString];

  v15 = [NSString stringWithFormat:@"%@_%@", v14, v12];
  v16 = [v19 stringByAppendingFormat:@"&locale=%@", v15];
  if (v8 && (objc_msgSend(v8, "wf_URLHasParameter:", v16) & 1) == 0)
  {
    uint64_t v17 = objc_msgSend(v8, "wf_URLWithTracking:", v16);

    [(WFWeatherConditions *)self setValue:v17 forComponent:@"WFWeatherMobileLinkComponent"];
    v8 = (void *)v17;
  }
  if (v9 && (objc_msgSend(v9, "wf_URLHasParameter:", v16) & 1) == 0)
  {
    uint64_t v18 = objc_msgSend(v9, "wf_URLWithTracking:", v16);

    [(WFWeatherConditions *)self setValue:v18 forComponent:@"WFWeatherWebLinkComponent"];
    v9 = (void *)v18;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_commonInit
{
  self->_componentsLock._os_unfair_lock_opaque = 0;
}

- (WFWeatherConditions)init
{
  v6.receiver = self;
  v6.super_class = (Class)WFWeatherConditions;
  v2 = [(WFWeatherConditions *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    components = v2->_components;
    v2->_components = v3;

    [(WFWeatherConditions *)v2 _commonInit];
  }
  return v2;
}

- (WFWeatherConditions)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFWeatherConditions;
  v5 = [(WFWeatherConditions *)&v12 init];
  if (v5)
  {
    if (initWithCoder__onceToken_0 != -1) {
      dispatch_once(&initWithCoder__onceToken_0, &__block_literal_global_14);
    }
    objc_super v6 = [v4 decodeObjectOfClasses:initWithCoder__classes_0 forKey:@"WFWeatherForecastComponentsDictionary"];
    uint64_t v7 = [objc_alloc(MEMORY[0x263EFF9A0]) initWithDictionary:v6 copyItems:1];
    components = v5->_components;
    v5->_components = (NSMutableDictionary *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WFWeatherForecastComponentsLocationKey"];
    location = v5->_location;
    v5->_location = (WFLocation *)v9;

    v5->_nightForecast = [v4 decodeBoolForKey:@"WFWeatherForecastComponentsIsNightForecastKey"];
    [(WFWeatherConditions *)v5 _commonInit];
  }
  return v5;
}

uint64_t __37__WFWeatherConditions_initWithCoder___block_invoke()
{
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  initWithCoder__classes_0 = objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
  return MEMORY[0x270F9A758]();
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(WFWeatherConditions *)self components];
  [v6 encodeObject:v4 forKey:@"WFWeatherForecastComponentsDictionary"];

  uint64_t v5 = [(WFWeatherConditions *)self location];
  [v6 encodeObject:v5 forKey:@"WFWeatherForecastComponentsLocationKey"];

  objc_msgSend(v6, "encodeBool:forKey:", -[WFWeatherConditions isNightForecast](self, "isNightForecast"), @"WFWeatherForecastComponentsIsNightForecastKey");
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  uint64_t v4 = objc_opt_new();
  id v5 = objc_alloc(MEMORY[0x263EFF9A0]);
  id v6 = [(WFWeatherConditions *)self components];
  uint64_t v7 = [v5 initWithDictionary:v6 copyItems:1];
  uint64_t v8 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v7;

  uint64_t v9 = [(WFWeatherConditions *)self location];
  uint64_t v10 = *(void **)(v4 + 8);
  *(void *)(v4 + 8) = v9;

  *(unsigned char *)(v4 + 16) = [(WFWeatherConditions *)self isNightForecast];
  return (id)v4;
}

- (id)description
{
  uint64_t v3 = [MEMORY[0x263F089D8] stringWithFormat:@"<%@: %p, ", objc_opt_class(), self];
  id v4 = objc_alloc_init(MEMORY[0x263F08790]);
  [v4 setDateFormat:@"yyy-MM-dd'T'hh:mm:ss"];
  id v5 = [(WFWeatherConditions *)self components];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __34__WFWeatherConditions_description__block_invoke;
  v12[3] = &unk_264431B18;
  id v13 = v4;
  id v14 = v3;
  id v6 = v3;
  id v7 = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:v12];

  uint64_t v8 = NSString;
  uint64_t v9 = objc_msgSend(v6, "substringWithRange:", 0, objc_msgSend(v6, "length") - 2);
  uint64_t v10 = [v8 stringWithFormat:@"%@>", v9];

  return v10;
}

void __34__WFWeatherConditions_description__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  objc_opt_class();
  id v6 = v5;
  if (objc_opt_isKindOfClass())
  {
    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = [v5 date];
    id v6 = [v7 stringFromDate:v8];
  }
  [*(id *)(a1 + 40) appendFormat:@"%@ = %@, ", v9, v6];
}

- (WFLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  self->_location = (WFLocation *)[a3 copy];
  MEMORY[0x270F9A758]();
}

- (NSMutableDictionary)components
{
  p_componentsLock = &self->_componentsLock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[(NSMutableDictionary *)self->_components copy];
  os_unfair_lock_unlock(p_componentsLock);
  return (NSMutableDictionary *)v4;
}

- (void)setComponents:(id)a3
{
  p_componentsLock = &self->_componentsLock;
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  id v6 = (NSMutableDictionary *)[v5 copy];

  components = self->_components;
  self->_components = v6;

  os_unfair_lock_unlock(p_componentsLock);
}

- (id)valueForComponentSync:(id)a3
{
  p_componentsLock = &self->_componentsLock;
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  id v6 = [(NSMutableDictionary *)self->_components valueForKey:v5];

  os_unfair_lock_unlock(p_componentsLock);
  return v6;
}

- (void)setValueSync:(id)a3 forComponent:(id)a4
{
  p_componentsLock = &self->_componentsLock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock_with_options();
  [(NSMutableDictionary *)self->_components setValue:v8 forKey:v7];

  os_unfair_lock_unlock(p_componentsLock);
}

- (id)allComponents
{
  uint64_t v2 = (void *)MEMORY[0x263EFF9C0];
  uint64_t v3 = [(WFWeatherConditions *)self components];
  uint64_t v4 = [v3 allKeys];
  id v5 = (void *)v4;
  if (v4) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = MEMORY[0x263EFFA68];
  }
  id v7 = [v2 setWithArray:v6];

  id v8 = [v7 allObjects];

  return v8;
}

- (id)valueForComponent:(id)a3
{
  id v4 = a3;
  if (valueForComponent__onceToken != -1) {
    dispatch_once(&valueForComponent__onceToken, &__block_literal_global_148);
  }
  uint64_t v5 = [v4 hash];
  uint64_t v6 = [(WFWeatherConditions *)self valueForComponentSync:v4];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
LABEL_5:
    id v9 = v8;
    goto LABEL_14;
  }
  if (v5 == valueForComponent__forecastTimeComponentHash)
  {
    uint64_t v10 = [(WFWeatherConditions *)self valueForComponentSync:@"WFWeatherForecastDateComponent"];
    if (v10)
    {
      v11 = (void *)v10;
      id v12 = +[WFWeatherConditions calendar];
      objc_msgSend(v12, "components:fromDate:", +[WFWeatherConditions dateComponentCalendarUnits](WFWeatherConditions, "dateComponentCalendarUnits"), v11);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      id v13 = @"WFWeatherForecastTimeComponent";
LABEL_12:
      [(WFWeatherConditions *)self setValueSync:v9 forComponent:v13];
LABEL_13:

      goto LABEL_14;
    }
  }
  if (v5 == valueForComponent__forecastExpirationTimeComponentHash)
  {
    uint64_t v14 = [(WFWeatherConditions *)self valueForComponentSync:@"WFWeatherForecastExpirationDateComponent"];
    if (v14)
    {
      v11 = (void *)v14;
      id v12 = +[WFWeatherConditions calendar];
      objc_msgSend(v12, "components:fromDate:", +[WFWeatherConditions dateComponentCalendarUnits](WFWeatherConditions, "dateComponentCalendarUnits"), v11);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      id v13 = @"WFWeatherForecastExpirationTimeComponent";
      goto LABEL_12;
    }
  }
  if (v5 != valueForComponent__sunriseTimeComponentHash
    && v5 != valueForComponent__sunsetTimeComponentHash
    && v5 != valueForComponent__sunriseDateComponentHash
    && v5 != valueForComponent__sunsetDateComponentHash)
  {
LABEL_21:
    id v8 = [(WFWeatherConditions *)self valueForComponentSync:v4];
    goto LABEL_5;
  }
  uint64_t v16 = [(WFWeatherConditions *)self valueForComponentSync:@"WFWeatherForecastDateComponent"];
  if (v16)
  {
    v11 = (void *)v16;
    uint64_t v17 = [(WFWeatherConditions *)self valueForComponentSync:@"WFWeatherSunriseDateComponent"];
    uint64_t v18 = [(WFWeatherConditions *)self valueForComponentSync:@"WFWeatherSunsetDateComponent"];
    id v19 = (void *)v18;
    if (v17 && v18)
    {
      id v20 = (id)v18;
      id v12 = v17;
    }
    else
    {
      [(WFWeatherConditions *)self location];
      id v28 = v19;
      v26 = id v29 = v17;
      [v26 sunrise:&v29 andSunset:&v28 forDate:v11];
      id v12 = v29;

      id v20 = v28;
      if (v12 && v20)
      {
        [(WFWeatherConditions *)self setValueSync:v12 forComponent:@"WFWeatherSunriseDateComponent"];
        [(WFWeatherConditions *)self setValueSync:v20 forComponent:@"WFWeatherSunsetDateComponent"];
      }
    }
    v21 = v12;
    if (v5 == valueForComponent__sunriseDateComponentHash
      || (v21 = v20, v5 == valueForComponent__sunsetDateComponentHash))
    {
      id v9 = v21;

      goto LABEL_13;
    }
    v27 = [(WFWeatherConditions *)self location];
    v22 = [v27 timeZone];
    v23 = [MEMORY[0x263EFF8F0] calendarWithIdentifier:*MEMORY[0x263EFF410]];
    v24 = [v23 componentsInTimeZone:v22 fromDate:v12];
    v25 = [v23 componentsInTimeZone:v22 fromDate:v20];
    [(WFWeatherConditions *)self setValueSync:v24 forComponent:@"WFWeatherSunriseTimeComponent"];
    [(WFWeatherConditions *)self setValueSync:v25 forComponent:@"WFWeatherSunsetTimeComponent"];

    goto LABEL_21;
  }
  id v9 = 0;
LABEL_14:

  return v9;
}

uint64_t __41__WFWeatherConditions_valueForComponent___block_invoke()
{
  valueForComponent__forecastTimeComponentHash = [@"WFWeatherForecastTimeComponent" hash];
  valueForComponent__forecastExpirationTimeComponentHash = [@"WFWeatherForecastExpirationTimeComponent" hash];
  valueForComponent__sunriseTimeComponentHash = [@"WFWeatherSunriseTimeComponent" hash];
  valueForComponent__sunsetTimeComponentHash = [@"WFWeatherSunsetTimeComponent" hash];
  valueForComponent__sunriseDateComponentHash = [@"WFWeatherSunriseDateComponent" hash];
  uint64_t result = [@"WFWeatherSunsetDateComponent" hash];
  valueForComponent__sunsetDateComponentHash = result;
  return result;
}

- (id)dictionaryRepresentation
{
  uint64_t v2 = NSDictionary;
  uint64_t v3 = [(WFWeatherConditions *)self components];
  id v4 = [v2 dictionaryWithDictionary:v3];

  return v4;
}

- (void)setValue:(id)a3 forComponent:(id)a4
{
  if (a4) {
    -[WFWeatherConditions setValueSync:forComponent:](self, "setValueSync:forComponent:", a3);
  }
}

- (BOOL)wf_isDay
{
  uint64_t v3 = [(WFWeatherConditions *)self valueForComponent:@"WFWeatherSunsetDateComponent"];
  uint64_t v4 = [(WFWeatherConditions *)self valueForComponent:@"WFWeatherSunriseDateComponent"];
  uint64_t v5 = (void *)v4;
  if (v3) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  BOOL v7 = !v6 && [(WFWeatherConditions *)self wf_isDayIfSunrise:v4 sunset:v3];

  return v7;
}

- (BOOL)wf_isDayIfSunrise:(id)a3 sunset:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WFWeatherConditions *)self valueForComponent:@"WFWeatherForecastDateComponent"];
  id v9 = v8;
  BOOL v10 = 1;
  if (v6 && v7 && v8)
  {
    [v8 timeIntervalSince1970];
    double v12 = v11;
    [v7 timeIntervalSince1970];
    double v14 = v13;
    [v6 timeIntervalSince1970];
    BOOL v16 = v12 <= v14;
    if (v12 >= v15) {
      BOOL v16 = 1;
    }
    BOOL v17 = v12 > v15;
    if (v12 >= v14) {
      BOOL v17 = 0;
    }
    if (v14 > v15) {
      BOOL v10 = v17;
    }
    else {
      BOOL v10 = v16;
    }
  }

  return v10;
}

+ (NSCalendar)calendar
{
  if (calendar_onceToken != -1) {
    dispatch_once(&calendar_onceToken, &__block_literal_global_152);
  }
  uint64_t v2 = (void *)calendar_Calendar;
  return (NSCalendar *)v2;
}

void __31__WFWeatherConditions_calendar__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x263EFF8F0]);
  uint64_t v1 = [v0 initWithCalendarIdentifier:*MEMORY[0x263EFF410]];
  uint64_t v2 = (void *)calendar_Calendar;
  calendar_Calendar = v1;

  id v3 = [MEMORY[0x263EFFA18] timeZoneWithName:@"UTC"];
  [(id)calendar_Calendar setTimeZone:v3];
}

+ (unint64_t)dateComponentCalendarUnits
{
  return 3146494;
}

- (BOOL)isNightForecast
{
  return self->_nightForecast;
}

- (void)setNightForecast:(BOOL)a3
{
  self->_nightForecast = a3;
}

- (os_unfair_lock_s)componentsLock
{
  return self->_componentsLock;
}

- (void)setComponentsLock:(os_unfair_lock_s)a3
{
  self->_componentsLock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_components, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

@end