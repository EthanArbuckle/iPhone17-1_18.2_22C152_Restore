@interface WFParsedForecastData
- (NSArray)changeForecasts;
- (NSArray)dailyForecasts;
- (NSArray)hourlyForecasts;
- (NSArray)lastTwentyFourHoursOfObservations;
- (NSArray)pollenForecasts;
- (NSArray)severeWeatherEvents;
- (NSData)rawData;
- (WFAirQualityConditions)airQualityObservations;
- (WFNextHourPrecipitation)nextHourPrecipitation;
- (WFWeatherConditions)currentConditions;
- (id)objectForForecastType:(unint64_t)a3;
- (void)setAirQualityObservations:(id)a3;
- (void)setChangeForecasts:(id)a3;
- (void)setCurrentConditions:(id)a3;
- (void)setDailyForecasts:(id)a3;
- (void)setHourlyForecasts:(id)a3;
- (void)setLastTwentyFourHoursOfObservations:(id)a3;
- (void)setNextHourPrecipitation:(id)a3;
- (void)setPollenForecasts:(id)a3;
- (void)setRawData:(id)a3;
- (void)setSevereWeatherEvents:(id)a3;
@end

@implementation WFParsedForecastData

- (id)objectForForecastType:(unint64_t)a3
{
  v4 = 0;
  if ((uint64_t)a3 > 15)
  {
    if ((uint64_t)a3 > 63)
    {
      if (a3 == 64 || a3 == 128)
      {
LABEL_10:
        v4 = [(WFParsedForecastData *)self currentConditions];
      }
    }
    else if (a3 == 16)
    {
      v4 = [(WFParsedForecastData *)self pollenForecasts];
    }
    else if (a3 == 32)
    {
      v4 = [(WFParsedForecastData *)self lastTwentyFourHoursOfObservations];
    }
  }
  else
  {
    switch(a3)
    {
      case 1uLL:
        v4 = [(WFParsedForecastData *)self airQualityObservations];
        break;
      case 2uLL:
        goto LABEL_10;
      case 4uLL:
        v4 = [(WFParsedForecastData *)self hourlyForecasts];
        break;
      case 8uLL:
        v4 = [(WFParsedForecastData *)self dailyForecasts];
        break;
      default:
        break;
    }
  }
  return v4;
}

- (NSData)rawData
{
  return self->_rawData;
}

- (void)setRawData:(id)a3
{
}

- (WFAirQualityConditions)airQualityObservations
{
  return self->_airQualityObservations;
}

- (void)setAirQualityObservations:(id)a3
{
}

- (WFWeatherConditions)currentConditions
{
  return self->_currentConditions;
}

- (void)setCurrentConditions:(id)a3
{
}

- (NSArray)lastTwentyFourHoursOfObservations
{
  return self->_lastTwentyFourHoursOfObservations;
}

- (void)setLastTwentyFourHoursOfObservations:(id)a3
{
}

- (NSArray)dailyForecasts
{
  return self->_dailyForecasts;
}

- (void)setDailyForecasts:(id)a3
{
}

- (NSArray)hourlyForecasts
{
  return self->_hourlyForecasts;
}

- (void)setHourlyForecasts:(id)a3
{
}

- (NSArray)pollenForecasts
{
  return self->_pollenForecasts;
}

- (void)setPollenForecasts:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextHourPrecipitation, 0);
  objc_storeStrong((id *)&self->_severeWeatherEvents, 0);
  objc_storeStrong((id *)&self->_changeForecasts, 0);
  objc_storeStrong((id *)&self->_pollenForecasts, 0);
  objc_storeStrong((id *)&self->_hourlyForecasts, 0);
  objc_storeStrong((id *)&self->_dailyForecasts, 0);
  objc_storeStrong((id *)&self->_lastTwentyFourHoursOfObservations, 0);
  objc_storeStrong((id *)&self->_currentConditions, 0);
  objc_storeStrong((id *)&self->_airQualityObservations, 0);
  objc_storeStrong((id *)&self->_rawData, 0);
}

@end