@interface STShowWeatherForecastRequest
+ (BOOL)supportsSecureCoding;
- (STShowWeatherForecastRequest)initWithCoder:(id)a3;
- (id)_initWithCurrentConditions:(id)a3 hourlyForecasts:(id)a4 city:(id)a5 units:(id)a6 forecastType:(int64_t)a7;
- (id)city;
- (id)createResponse;
- (id)currentConditions;
- (id)hourlyForecasts;
- (id)units;
- (int64_t)forecastType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STShowWeatherForecastRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_units, 0);
  objc_storeStrong((id *)&self->_city, 0);
  objc_storeStrong((id *)&self->_hourlyForecasts, 0);
  objc_storeStrong((id *)&self->_currentConditions, 0);
}

- (STShowWeatherForecastRequest)initWithCoder:(id)a3
{
  v19[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)STShowWeatherForecastRequest;
  v5 = [(AFSiriRequest *)&v18 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_currentConditions"];
    currentConditions = v5->_currentConditions;
    v5->_currentConditions = (STWeatherCurrentConditions *)v6;

    v8 = (void *)MEMORY[0x263EFFA08];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
    v10 = [v8 setWithArray:v9];
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"_hourlyForecasts"];
    hourlyForecasts = v5->_hourlyForecasts;
    v5->_hourlyForecasts = (NSArray *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_city"];
    city = v5->_city;
    v5->_city = (STCity *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_units"];
    units = v5->_units;
    v5->_units = (STWeatherUnits *)v15;

    v5->_forecastType = [v4 decodeIntegerForKey:@"_forecastType"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STShowWeatherForecastRequest;
  id v4 = a3;
  [(AFSiriRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_currentConditions, @"_currentConditions", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_hourlyForecasts forKey:@"_hourlyForecasts"];
  [v4 encodeObject:self->_city forKey:@"_city"];
  [v4 encodeObject:self->_units forKey:@"_units"];
  [v4 encodeInteger:self->_forecastType forKey:@"_forecastType"];
}

- (int64_t)forecastType
{
  return self->_forecastType;
}

- (id)units
{
  return self->_units;
}

- (id)city
{
  return self->_city;
}

- (id)hourlyForecasts
{
  return self->_hourlyForecasts;
}

- (id)currentConditions
{
  return self->_currentConditions;
}

- (id)createResponse
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F28620]) _initWithRequest:self];
  return v2;
}

- (id)_initWithCurrentConditions:(id)a3 hourlyForecasts:(id)a4 city:(id)a5 units:(id)a6 forecastType:(int64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)STShowWeatherForecastRequest;
  v17 = [(AFSiriRequest *)&v20 init];
  objc_super v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_currentConditions, a3);
    objc_storeStrong((id *)&v18->_hourlyForecasts, a4);
    objc_storeStrong((id *)&v18->_city, a5);
    objc_storeStrong((id *)&v18->_units, a6);
    v18->_forecastType = a7;
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end