@interface STShowWeatherCurrentConditionsRequest
+ (BOOL)supportsSecureCoding;
- (STShowWeatherCurrentConditionsRequest)initWithCoder:(id)a3;
- (id)_initWithCurrentConditions:(id)a3 city:(id)a4 units:(id)a5;
- (id)city;
- (id)createResponse;
- (id)currentConditions;
- (id)units;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STShowWeatherCurrentConditionsRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_units, 0);
  objc_storeStrong((id *)&self->_city, 0);
  objc_storeStrong((id *)&self->_currentConditions, 0);
}

- (STShowWeatherCurrentConditionsRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)STShowWeatherCurrentConditionsRequest;
  v5 = [(AFSiriRequest *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_currentConditions"];
    currentConditions = v5->_currentConditions;
    v5->_currentConditions = (STWeatherCurrentConditions *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_city"];
    city = v5->_city;
    v5->_city = (STCity *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_units"];
    units = v5->_units;
    v5->_units = (STWeatherUnits *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STShowWeatherCurrentConditionsRequest;
  id v4 = a3;
  [(AFSiriRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_currentConditions, @"_currentConditions", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_city forKey:@"_city"];
  [v4 encodeObject:self->_units forKey:@"_units"];
}

- (id)units
{
  return self->_units;
}

- (id)city
{
  return self->_city;
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

- (id)_initWithCurrentConditions:(id)a3 city:(id)a4 units:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)STShowWeatherCurrentConditionsRequest;
  v12 = [(AFSiriRequest *)&v15 init];
  p_isa = (id *)&v12->super.super.isa;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_currentConditions, a3);
    objc_storeStrong(p_isa + 6, a4);
    objc_storeStrong(p_isa + 7, a5);
  }

  return p_isa;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end