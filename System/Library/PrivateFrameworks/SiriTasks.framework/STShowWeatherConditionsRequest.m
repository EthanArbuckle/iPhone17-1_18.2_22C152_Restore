@interface STShowWeatherConditionsRequest
+ (BOOL)supportsSecureCoding;
- (STShowWeatherConditionsRequest)initWithCoder:(id)a3;
- (id)_initWithAttributes:(id)a3 city:(id)a4;
- (id)attributes;
- (id)city;
- (id)createResponse;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STShowWeatherConditionsRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_city, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
}

- (STShowWeatherConditionsRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)STShowWeatherConditionsRequest;
  v5 = [(AFSiriRequest *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_attributes"];
    attributes = v5->_attributes;
    v5->_attributes = (STWeatherAttributes *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_city"];
    city = v5->_city;
    v5->_city = (STCity *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STShowWeatherConditionsRequest;
  id v4 = a3;
  [(AFSiriRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_attributes, @"_attributes", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_city forKey:@"_city"];
}

- (id)city
{
  return self->_city;
}

- (id)attributes
{
  return self->_attributes;
}

- (id)createResponse
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F28620]) _initWithRequest:self];
  return v2;
}

- (id)_initWithAttributes:(id)a3 city:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)STShowWeatherConditionsRequest;
  v9 = [(AFSiriRequest *)&v12 init];
  p_isa = (id *)&v9->super.super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_attributes, a3);
    objc_storeStrong(p_isa + 6, a4);
  }

  return p_isa;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end