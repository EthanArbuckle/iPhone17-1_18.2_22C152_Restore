@interface WFForecastResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)responseWasFromCache;
- (NSData)rawAPIData;
- (WFForecastResponse)initWithCoder:(id)a3;
- (WFWeatherConditions)forecast;
- (unint64_t)forecastType;
- (void)encodeWithCoder:(id)a3;
- (void)setForecast:(id)a3;
- (void)setForecastType:(unint64_t)a3;
- (void)setRawAPIData:(id)a3;
- (void)setResponseWasFromCache:(BOOL)a3;
@end

@implementation WFForecastResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WFForecastResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WFForecastResponse;
  v5 = [(WFResponse *)&v9 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WFForecastResponseForecastKey"];
    [(WFForecastResponse *)v5 setForecast:v6];

    -[WFForecastResponse setForecastType:](v5, "setForecastType:", [v4 decodeIntegerForKey:@"WFForecastResponseForecastTypeKey"]);
    v7 = [v4 decodeObjectForKey:@"WFForecastResponseRawAPIResponse"];
    [(WFForecastResponse *)v5 setRawAPIData:v7];

    -[WFForecastResponse setResponseWasFromCache:](v5, "setResponseWasFromCache:", [v4 decodeBoolForKey:@"WFForecastResponseWasFromCacheKey"]);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WFForecastResponse;
  [(WFResponse *)&v8 encodeWithCoder:v4];
  v5 = [(WFForecastResponse *)self forecast];
  [v4 encodeObject:v5 forKey:@"WFForecastResponseForecastKey"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[WFForecastResponse forecastType](self, "forecastType"), @"WFForecastResponseForecastTypeKey");
  objc_msgSend(v4, "encodeBool:forKey:", -[WFForecastResponse responseWasFromCache](self, "responseWasFromCache"), @"WFForecastResponseWasFromCacheKey");
  v6 = [(WFForecastResponse *)self rawAPIData];

  if (v6)
  {
    v7 = [(WFForecastResponse *)self rawAPIData];
    [v4 encodeObject:v7 forKey:@"WFForecastResponseRawAPIResponse"];
  }
}

- (WFWeatherConditions)forecast
{
  return self->_forecast;
}

- (void)setForecast:(id)a3
{
}

- (unint64_t)forecastType
{
  return self->_forecastType;
}

- (void)setForecastType:(unint64_t)a3
{
  self->_forecastType = a3;
}

- (BOOL)responseWasFromCache
{
  return self->_responseWasFromCache;
}

- (void)setResponseWasFromCache:(BOOL)a3
{
  self->_responseWasFromCache = a3;
}

- (NSData)rawAPIData
{
  return self->_rawAPIData;
}

- (void)setRawAPIData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawAPIData, 0);
  objc_storeStrong((id *)&self->_forecast, 0);
}

@end