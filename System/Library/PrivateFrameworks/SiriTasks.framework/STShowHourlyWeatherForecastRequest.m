@interface STShowHourlyWeatherForecastRequest
+ (BOOL)supportsSecureCoding;
- (STShowHourlyWeatherForecastRequest)initWithCoder:(id)a3;
- (id)_initWithCurrentAttributes:(id)a3 hourlyAttributes:(id)a4 city:(id)a5 startHour:(int64_t)a6 forecastType:(int64_t)a7;
- (id)city;
- (id)createResponse;
- (id)currentAttributes;
- (id)hourlyAttributes;
- (int64_t)forecastType;
- (int64_t)startHour;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STShowHourlyWeatherForecastRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_city, 0);
  objc_storeStrong((id *)&self->_hourlyAttributes, 0);
  objc_storeStrong((id *)&self->_currentAttributes, 0);
}

- (STShowHourlyWeatherForecastRequest)initWithCoder:(id)a3
{
  v17[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)STShowHourlyWeatherForecastRequest;
  v5 = [(AFSiriRequest *)&v16 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_currentAttributes"];
    currentAttributes = v5->_currentAttributes;
    v5->_currentAttributes = (STWeatherAttributes *)v6;

    v8 = (void *)MEMORY[0x263EFFA08];
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];
    v10 = [v8 setWithArray:v9];
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"_hourlyAttributes"];
    hourlyAttributes = v5->_hourlyAttributes;
    v5->_hourlyAttributes = (NSArray *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_city"];
    city = v5->_city;
    v5->_city = (STCity *)v13;

    v5->_startHour = [v4 decodeIntegerForKey:@"_startHour"];
    v5->_forecastType = [v4 decodeIntegerForKey:@"_forecastType"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STShowHourlyWeatherForecastRequest;
  id v4 = a3;
  [(AFSiriRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_currentAttributes, @"_currentAttributes", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_hourlyAttributes forKey:@"_hourlyAttributes"];
  [v4 encodeObject:self->_city forKey:@"_city"];
  [v4 encodeInteger:self->_startHour forKey:@"_startHour"];
  [v4 encodeInteger:self->_forecastType forKey:@"_forecastType"];
}

- (int64_t)forecastType
{
  return self->_forecastType;
}

- (int64_t)startHour
{
  return self->_startHour;
}

- (id)city
{
  return self->_city;
}

- (id)hourlyAttributes
{
  return self->_hourlyAttributes;
}

- (id)currentAttributes
{
  return self->_currentAttributes;
}

- (id)createResponse
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F28620]) _initWithRequest:self];
  return v2;
}

- (id)_initWithCurrentAttributes:(id)a3 hourlyAttributes:(id)a4 city:(id)a5 startHour:(int64_t)a6 forecastType:(int64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v21.receiver = self;
  v21.super_class = (Class)STShowHourlyWeatherForecastRequest;
  objc_super v16 = [(AFSiriRequest *)&v21 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_currentAttributes, a3);
    uint64_t v18 = [v14 copy];
    hourlyAttributes = v17->_hourlyAttributes;
    v17->_hourlyAttributes = (NSArray *)v18;

    objc_storeStrong((id *)&v17->_city, a5);
    v17->_startHour = a6;
    v17->_forecastType = a7;
  }

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end