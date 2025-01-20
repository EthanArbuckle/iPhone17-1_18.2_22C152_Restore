@interface WFAggregateCommonResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)responseWasFromCache;
- (NSArray)changeForecasts;
- (NSArray)dailyForecastedConditions;
- (NSArray)dailyPollenForecastedConditions;
- (NSArray)hourlyForecastedConditions;
- (NSArray)lastTwentyFourHoursOfObservations;
- (NSArray)severeWeatherEvents;
- (NSData)rawAPIData;
- (WFAggregateCommonResponse)initWithCoder:(id)a3;
- (WFAirQualityConditions)airQualityObservations;
- (WFNextHourPrecipitation)nextHourPrecipitation;
- (WFWeatherConditions)currentObservations;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAirQualityObservations:(id)a3;
- (void)setChangeForecasts:(id)a3;
- (void)setCurrentObservations:(id)a3;
- (void)setDailyForecastedConditions:(id)a3;
- (void)setDailyPollenForecastedConditions:(id)a3;
- (void)setHourlyForecastedConditions:(id)a3;
- (void)setLastTwentyFourHoursOfObservations:(id)a3;
- (void)setNextHourPrecipitation:(id)a3;
- (void)setRawAPIData:(id)a3;
- (void)setResponseWasFromCache:(BOOL)a3;
- (void)setSevereWeatherEvents:(id)a3;
@end

@implementation WFAggregateCommonResponse

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  v4 = objc_opt_new();
  v5 = [(WFAggregateCommonResponse *)self airQualityObservations];
  v6 = (void *)[v5 copy];
  [v4 setAirQualityObservations:v6];

  v7 = [(WFAggregateCommonResponse *)self currentObservations];
  v8 = (void *)[v7 copy];
  [v4 setCurrentObservations:v8];

  id v9 = objc_alloc(MEMORY[0x263EFF8C0]);
  v10 = [(WFAggregateCommonResponse *)self lastTwentyFourHoursOfObservations];
  v11 = (void *)[v9 initWithArray:v10 copyItems:1];
  [v4 setLastTwentyFourHoursOfObservations:v11];

  id v12 = objc_alloc(MEMORY[0x263EFF8C0]);
  v13 = [(WFAggregateCommonResponse *)self hourlyForecastedConditions];
  v14 = (void *)[v12 initWithArray:v13 copyItems:1];
  [v4 setHourlyForecastedConditions:v14];

  id v15 = objc_alloc(MEMORY[0x263EFF8C0]);
  v16 = [(WFAggregateCommonResponse *)self dailyForecastedConditions];
  v17 = (void *)[v15 initWithArray:v16 copyItems:1];
  [v4 setDailyForecastedConditions:v17];

  id v18 = objc_alloc(MEMORY[0x263EFF8C0]);
  v19 = [(WFAggregateCommonResponse *)self dailyPollenForecastedConditions];
  v20 = (void *)[v18 initWithArray:v19 copyItems:1];
  [v4 setDailyPollenForecastedConditions:v20];

  id v21 = objc_alloc(MEMORY[0x263EFF8C0]);
  v22 = [(WFAggregateCommonResponse *)self changeForecasts];
  v23 = (void *)[v21 initWithArray:v22 copyItems:1];
  [v4 setChangeForecasts:v23];

  id v24 = objc_alloc(MEMORY[0x263EFF8C0]);
  v25 = [(WFAggregateCommonResponse *)self severeWeatherEvents];
  v26 = (void *)[v24 initWithArray:v25 copyItems:1];
  [v4 setSevereWeatherEvents:v26];

  v27 = [(WFAggregateCommonResponse *)self nextHourPrecipitation];
  v28 = (void *)[v27 copy];
  [v4 setNextHourPrecipitation:v28];

  v29 = [(WFAggregateCommonResponse *)self rawAPIData];
  [v4 setRawAPIData:v29];

  objc_msgSend(v4, "setResponseWasFromCache:", -[WFAggregateCommonResponse responseWasFromCache](self, "responseWasFromCache"));
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WFAggregateCommonResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)WFAggregateCommonResponse;
  v5 = [(WFResponse *)&v36 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), v6, v7, 0);
    uint64_t v9 = objc_opt_class();
    v10 = NSStringFromSelector(sel_airQualityObservations);
    v11 = [v4 decodeObjectOfClass:v9 forKey:v10];
    [(WFAggregateCommonResponse *)v5 setAirQualityObservations:v11];

    id v12 = NSStringFromSelector(sel_currentObservations);
    v13 = [v4 decodeObjectOfClass:v6 forKey:v12];
    [(WFAggregateCommonResponse *)v5 setCurrentObservations:v13];

    v14 = NSStringFromSelector(sel_lastTwentyFourHoursOfObservations);
    id v15 = [v4 decodeObjectOfClasses:v8 forKey:v14];
    [(WFAggregateCommonResponse *)v5 setLastTwentyFourHoursOfObservations:v15];

    v16 = NSStringFromSelector(sel_hourlyForecastedConditions);
    v17 = [v4 decodeObjectOfClasses:v8 forKey:v16];
    [(WFAggregateCommonResponse *)v5 setHourlyForecastedConditions:v17];

    id v18 = NSStringFromSelector(sel_dailyForecastedConditions);
    v19 = [v4 decodeObjectOfClasses:v8 forKey:v18];
    [(WFAggregateCommonResponse *)v5 setDailyForecastedConditions:v19];

    v20 = NSStringFromSelector(sel_dailyPollenForecastedConditions);
    id v21 = [v4 decodeObjectOfClasses:v8 forKey:v20];
    [(WFAggregateCommonResponse *)v5 setDailyPollenForecastedConditions:v21];

    uint64_t v22 = objc_opt_class();
    v23 = NSStringFromSelector(sel_changeForecasts);
    id v24 = [v4 decodeObjectOfClass:v22 forKey:v23];
    [(WFAggregateCommonResponse *)v5 setChangeForecasts:v24];

    uint64_t v25 = objc_opt_class();
    v26 = NSStringFromSelector(sel_severeWeatherEvents);
    v27 = [v4 decodeObjectOfClass:v25 forKey:v26];
    [(WFAggregateCommonResponse *)v5 setSevereWeatherEvents:v27];

    uint64_t v28 = objc_opt_class();
    v29 = NSStringFromSelector(sel_nextHourPrecipitation);
    v30 = [v4 decodeObjectOfClass:v28 forKey:v29];
    [(WFAggregateCommonResponse *)v5 setNextHourPrecipitation:v30];

    uint64_t v31 = objc_opt_class();
    v32 = NSStringFromSelector(sel_rawAPIData);
    v33 = [v4 decodeObjectOfClass:v31 forKey:v32];
    [(WFAggregateCommonResponse *)v5 setRawAPIData:v33];

    v34 = NSStringFromSelector(sel_responseWasFromCache);
    -[WFAggregateCommonResponse setResponseWasFromCache:](v5, "setResponseWasFromCache:", [v4 decodeBoolForKey:v34]);
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v27.receiver = self;
  v27.super_class = (Class)WFAggregateCommonResponse;
  id v4 = a3;
  [(WFResponse *)&v27 encodeWithCoder:v4];
  v5 = [(WFAggregateCommonResponse *)self airQualityObservations];
  uint64_t v6 = NSStringFromSelector(sel_airQualityObservations);
  [v4 encodeObject:v5 forKey:v6];

  uint64_t v7 = [(WFAggregateCommonResponse *)self currentObservations];
  v8 = NSStringFromSelector(sel_currentObservations);
  [v4 encodeObject:v7 forKey:v8];

  uint64_t v9 = [(WFAggregateCommonResponse *)self lastTwentyFourHoursOfObservations];
  v10 = NSStringFromSelector(sel_lastTwentyFourHoursOfObservations);
  [v4 encodeObject:v9 forKey:v10];

  v11 = [(WFAggregateCommonResponse *)self hourlyForecastedConditions];
  id v12 = NSStringFromSelector(sel_hourlyForecastedConditions);
  [v4 encodeObject:v11 forKey:v12];

  v13 = [(WFAggregateCommonResponse *)self dailyForecastedConditions];
  v14 = NSStringFromSelector(sel_dailyForecastedConditions);
  [v4 encodeObject:v13 forKey:v14];

  id v15 = [(WFAggregateCommonResponse *)self dailyPollenForecastedConditions];
  v16 = NSStringFromSelector(sel_dailyPollenForecastedConditions);
  [v4 encodeObject:v15 forKey:v16];

  BOOL v17 = [(WFAggregateCommonResponse *)self responseWasFromCache];
  id v18 = NSStringFromSelector(sel_responseWasFromCache);
  [v4 encodeBool:v17 forKey:v18];

  v19 = [(WFAggregateCommonResponse *)self changeForecasts];
  v20 = NSStringFromSelector(sel_changeForecasts);
  [v4 encodeObject:v19 forKey:v20];

  id v21 = [(WFAggregateCommonResponse *)self severeWeatherEvents];
  uint64_t v22 = NSStringFromSelector(sel_severeWeatherEvents);
  [v4 encodeObject:v21 forKey:v22];

  v23 = [(WFAggregateCommonResponse *)self nextHourPrecipitation];
  id v24 = NSStringFromSelector(sel_nextHourPrecipitation);
  [v4 encodeObject:v23 forKey:v24];

  uint64_t v25 = [(WFAggregateCommonResponse *)self rawAPIData];
  v26 = NSStringFromSelector(sel_rawAPIData);
  [v4 encodeObject:v25 forKey:v26];
}

- (WFAirQualityConditions)airQualityObservations
{
  return self->_airQualityObservations;
}

- (void)setAirQualityObservations:(id)a3
{
}

- (WFWeatherConditions)currentObservations
{
  return self->_currentObservations;
}

- (void)setCurrentObservations:(id)a3
{
}

- (NSArray)lastTwentyFourHoursOfObservations
{
  return self->_lastTwentyFourHoursOfObservations;
}

- (void)setLastTwentyFourHoursOfObservations:(id)a3
{
}

- (NSArray)hourlyForecastedConditions
{
  return self->_hourlyForecastedConditions;
}

- (void)setHourlyForecastedConditions:(id)a3
{
}

- (NSArray)dailyForecastedConditions
{
  return self->_dailyForecastedConditions;
}

- (void)setDailyForecastedConditions:(id)a3
{
}

- (NSArray)dailyPollenForecastedConditions
{
  return self->_dailyPollenForecastedConditions;
}

- (void)setDailyPollenForecastedConditions:(id)a3
{
}

- (NSArray)changeForecasts
{
  return self->_changeForecasts;
}

- (void)setChangeForecasts:(id)a3
{
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

- (NSData)rawAPIData
{
  return self->_rawAPIData;
}

- (void)setRawAPIData:(id)a3
{
}

- (BOOL)responseWasFromCache
{
  return self->_responseWasFromCache;
}

- (void)setResponseWasFromCache:(BOOL)a3
{
  self->_responseWasFromCache = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawAPIData, 0);
  objc_storeStrong((id *)&self->_nextHourPrecipitation, 0);
  objc_storeStrong((id *)&self->_severeWeatherEvents, 0);
  objc_storeStrong((id *)&self->_changeForecasts, 0);
  objc_storeStrong((id *)&self->_dailyPollenForecastedConditions, 0);
  objc_storeStrong((id *)&self->_dailyForecastedConditions, 0);
  objc_storeStrong((id *)&self->_hourlyForecastedConditions, 0);
  objc_storeStrong((id *)&self->_lastTwentyFourHoursOfObservations, 0);
  objc_storeStrong((id *)&self->_currentObservations, 0);
  objc_storeStrong((id *)&self->_airQualityObservations, 0);
}

@end