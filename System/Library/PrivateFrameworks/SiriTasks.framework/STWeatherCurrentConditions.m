@interface STWeatherCurrentConditions
+ (BOOL)supportsSecureCoding;
- (STWeatherCurrentConditions)initWithCoder:(id)a3;
- (id)_initWithConditionCode:(int64_t)a3 temperature:(id)a4 highTemperature:(id)a5 lowTemperature:(id)a6;
- (id)highTemperature;
- (id)lowTemperature;
- (id)temperature;
- (int64_t)conditionCode;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STWeatherCurrentConditions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lowTemperature, 0);
  objc_storeStrong((id *)&self->_highTemperature, 0);
  objc_storeStrong((id *)&self->_temperature, 0);
}

- (STWeatherCurrentConditions)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)STWeatherCurrentConditions;
  v5 = [(STSiriModelObject *)&v13 initWithCoder:v4];
  if (v5)
  {
    v5->_conditionCode = [v4 decodeIntegerForKey:@"_conditionCode"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_temperature"];
    temperature = v5->_temperature;
    v5->_temperature = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_highTemperature"];
    highTemperature = v5->_highTemperature;
    v5->_highTemperature = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_lowTemperature"];
    lowTemperature = v5->_lowTemperature;
    v5->_lowTemperature = (NSNumber *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STWeatherCurrentConditions;
  id v4 = a3;
  [(STSiriModelObject *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_conditionCode, @"_conditionCode", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_temperature forKey:@"_temperature"];
  [v4 encodeObject:self->_highTemperature forKey:@"_highTemperature"];
  [v4 encodeObject:self->_lowTemperature forKey:@"_lowTemperature"];
}

- (id)lowTemperature
{
  return self->_lowTemperature;
}

- (id)highTemperature
{
  return self->_highTemperature;
}

- (id)temperature
{
  return self->_temperature;
}

- (int64_t)conditionCode
{
  return self->_conditionCode;
}

- (id)_initWithConditionCode:(int64_t)a3 temperature:(id)a4 highTemperature:(id)a5 lowTemperature:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)STWeatherCurrentConditions;
  v14 = [(STWeatherCurrentConditions *)&v17 init];
  p_isa = (id *)&v14->super.super.isa;
  if (v14)
  {
    v14->_conditionCode = a3;
    objc_storeStrong((id *)&v14->_temperature, a4);
    objc_storeStrong(p_isa + 4, a5);
    objc_storeStrong(p_isa + 5, a6);
  }

  return p_isa;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end