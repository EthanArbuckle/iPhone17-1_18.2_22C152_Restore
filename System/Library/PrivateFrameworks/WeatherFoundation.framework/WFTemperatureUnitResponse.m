@interface WFTemperatureUnitResponse
+ (BOOL)supportsSecureCoding;
- (WFTemperatureUnitResponse)initWithCoder:(id)a3;
- (int)temperatureUnit;
- (void)encodeWithCoder:(id)a3;
- (void)setTemperatureUnit:(int)a3;
@end

@implementation WFTemperatureUnitResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WFTemperatureUnitResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WFTemperatureUnitResponse;
  v5 = [(WFResponse *)&v8 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectForKey:@"WFTemperatureUnitResponseKey"];
    [(WFTemperatureUnitResponse *)v5 setTemperatureUnit:NSStringToWFTemperatureUnit(v6)];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFTemperatureUnitResponse;
  id v4 = a3;
  [(WFResponse *)&v6 encodeWithCoder:v4];
  v5 = NSStringFromWFTemperatureUnit([(WFTemperatureUnitResponse *)self temperatureUnit]);
  [v4 encodeObject:v5 forKey:@"WFTemperatureUnitResponseKey"];
}

- (int)temperatureUnit
{
  return self->_temperatureUnit;
}

- (void)setTemperatureUnit:(int)a3
{
  self->_temperatureUnit = a3;
}

@end