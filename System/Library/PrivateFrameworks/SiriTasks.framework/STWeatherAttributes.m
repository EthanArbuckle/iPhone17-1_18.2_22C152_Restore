@interface STWeatherAttributes
+ (BOOL)supportsSecureCoding;
- (STWeatherAttributes)initWithCoder:(id)a3;
- (id)_initWithCondition:(int64_t)a3 temperature:(id)a4 highTemperature:(id)a5 lowTemperature:(id)a6 chanceOfPrecipitation:(id)a7;
- (id)chanceOfPrecipitation;
- (id)highTemperature;
- (id)lowTemperature;
- (id)temperature;
- (int64_t)condition;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STWeatherAttributes

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chanceOfPrecipitation, 0);
  objc_storeStrong((id *)&self->_lowTemperature, 0);
  objc_storeStrong((id *)&self->_highTemperature, 0);
  objc_storeStrong((id *)&self->_temperature, 0);
}

- (STWeatherAttributes)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)STWeatherAttributes;
  v5 = [(STSiriModelObject *)&v15 initWithCoder:v4];
  if (v5)
  {
    v5->_condition = [v4 decodeIntegerForKey:@"_condition"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_temperature"];
    temperature = v5->_temperature;
    v5->_temperature = (STTemperature *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_highTemperature"];
    highTemperature = v5->_highTemperature;
    v5->_highTemperature = (STTemperature *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_lowTemperature"];
    lowTemperature = v5->_lowTemperature;
    v5->_lowTemperature = (STTemperature *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_chanceOfPrecipitation"];
    chanceOfPrecipitation = v5->_chanceOfPrecipitation;
    v5->_chanceOfPrecipitation = (NSNumber *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STWeatherAttributes;
  id v4 = a3;
  [(STSiriModelObject *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_condition, @"_condition", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_temperature forKey:@"_temperature"];
  [v4 encodeObject:self->_highTemperature forKey:@"_highTemperature"];
  [v4 encodeObject:self->_lowTemperature forKey:@"_lowTemperature"];
  [v4 encodeObject:self->_chanceOfPrecipitation forKey:@"_chanceOfPrecipitation"];
}

- (id)chanceOfPrecipitation
{
  return self->_chanceOfPrecipitation;
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

- (int64_t)condition
{
  return self->_condition;
}

- (id)_initWithCondition:(int64_t)a3 temperature:(id)a4 highTemperature:(id)a5 lowTemperature:(id)a6 chanceOfPrecipitation:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)STWeatherAttributes;
  v17 = [(STWeatherAttributes *)&v20 init];
  p_isa = (id *)&v17->super.super.isa;
  if (v17)
  {
    v17->_condition = a3;
    objc_storeStrong((id *)&v17->_temperature, a4);
    objc_storeStrong(p_isa + 4, a5);
    objc_storeStrong(p_isa + 5, a6);
    objc_storeStrong(p_isa + 6, a7);
  }

  return p_isa;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end