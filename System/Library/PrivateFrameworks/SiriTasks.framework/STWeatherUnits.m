@interface STWeatherUnits
+ (BOOL)supportsSecureCoding;
- (STWeatherUnits)initWithCoder:(id)a3;
- (id)_initWithTemperatureUnits:(int64_t)a3;
- (int64_t)temperatureUnits;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STWeatherUnits

- (STWeatherUnits)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)STWeatherUnits;
  v5 = [(STSiriModelObject *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_temperatureUnits = [v4 decodeIntegerForKey:@"_temperatureUnits"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STWeatherUnits;
  id v4 = a3;
  [(STSiriModelObject *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_temperatureUnits, @"_temperatureUnits", v5.receiver, v5.super_class);
}

- (int64_t)temperatureUnits
{
  return self->_temperatureUnits;
}

- (id)_initWithTemperatureUnits:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STWeatherUnits;
  id result = [(STWeatherUnits *)&v5 init];
  if (result) {
    *((void *)result + 2) = a3;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end