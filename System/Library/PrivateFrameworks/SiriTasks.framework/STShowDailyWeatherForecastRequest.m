@interface STShowDailyWeatherForecastRequest
+ (BOOL)supportsSecureCoding;
- (STShowDailyWeatherForecastRequest)initWithCoder:(id)a3;
- (id)_initWithCurrentAttributes:(id)a3 dailyAttributes:(id)a4 city:(id)a5 startWeekday:(int64_t)a6;
- (id)city;
- (id)createResponse;
- (id)currentAttributes;
- (id)dailyAttributes;
- (int64_t)startWeekday;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STShowDailyWeatherForecastRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_city, 0);
  objc_storeStrong((id *)&self->_dailyAttributes, 0);
  objc_storeStrong((id *)&self->_currentAttributes, 0);
}

- (STShowDailyWeatherForecastRequest)initWithCoder:(id)a3
{
  v17[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)STShowDailyWeatherForecastRequest;
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
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"_dailyAttributes"];
    dailyAttributes = v5->_dailyAttributes;
    v5->_dailyAttributes = (NSArray *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_city"];
    city = v5->_city;
    v5->_city = (STCity *)v13;

    v5->_startWeekday = [v4 decodeIntegerForKey:@"_startWeekday"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STShowDailyWeatherForecastRequest;
  id v4 = a3;
  [(AFSiriRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_currentAttributes, @"_currentAttributes", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_dailyAttributes forKey:@"_dailyAttributes"];
  [v4 encodeObject:self->_city forKey:@"_city"];
  [v4 encodeInteger:self->_startWeekday forKey:@"_startWeekday"];
}

- (int64_t)startWeekday
{
  return self->_startWeekday;
}

- (id)city
{
  return self->_city;
}

- (id)dailyAttributes
{
  return self->_dailyAttributes;
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

- (id)_initWithCurrentAttributes:(id)a3 dailyAttributes:(id)a4 city:(id)a5 startWeekday:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v19.receiver = self;
  v19.super_class = (Class)STShowDailyWeatherForecastRequest;
  v14 = [(AFSiriRequest *)&v19 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_currentAttributes, a3);
    uint64_t v16 = [v12 copy];
    dailyAttributes = v15->_dailyAttributes;
    v15->_dailyAttributes = (NSArray *)v16;

    objc_storeStrong((id *)&v15->_city, a5);
    v15->_startWeekday = a6;
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end