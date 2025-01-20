@interface CLWeatherServiceData
- (NSString)precipitationType;
- (double)timestamp;
- (float)feelsLikeTemperature;
- (float)temperature;
- (float)weatherPressure;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setFeelsLikeTemperature:(float)a3;
- (void)setPrecipitationType:(id)a3;
- (void)setTemperature:(float)a3;
- (void)setTimestamp:(double)a3;
- (void)setWeatherPressure:(float)a3;
@end

@implementation CLWeatherServiceData

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [[objc_opt_class() allocWithZone:a3] init];
  [(CLWeatherServiceData *)self timestamp];
  [v4 setTimestamp:];
  [(CLWeatherServiceData *)self weatherPressure];
  [v4 setWeatherPressure:];
  [v4 setPrecipitationType:[NSString stringWithString:-[CLWeatherServiceData precipitationType](self, "precipitationType")]];
  [(CLWeatherServiceData *)self temperature];
  [v4 setTemperature:];
  [(CLWeatherServiceData *)self feelsLikeTemperature];
  [v4 setFeelsLikeTemperature:];
  return v4;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (float)weatherPressure
{
  return self->_weatherPressure;
}

- (void)setWeatherPressure:(float)a3
{
  self->_weatherPressure = a3;
}

- (NSString)precipitationType
{
  return self->_precipitationType;
}

- (void)setPrecipitationType:(id)a3
{
}

- (float)temperature
{
  return self->_temperature;
}

- (void)setTemperature:(float)a3
{
  self->_temperature = a3;
}

- (float)feelsLikeTemperature
{
  return self->_feelsLikeTemperature;
}

- (void)setFeelsLikeTemperature:(float)a3
{
  self->_feelsLikeTemperature = a3;
}

@end