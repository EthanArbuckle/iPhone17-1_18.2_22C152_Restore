@interface PRSPosterUpdateDiscreteStylePayload
+ (BOOL)supportsSecureCoding;
- (NSNumber)luminance;
- (NSNumber)saturation;
- (NSNumber)variation;
- (PRSPosterUpdateDiscreteStylePayload)initWithCoder:(id)a3;
- (PRSPosterUpdateDiscreteStylePayload)initWithVariation:(id)a3 saturation:(id)a4 luminance:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)rawValue;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PRSPosterUpdateDiscreteStylePayload

- (PRSPosterUpdateDiscreteStylePayload)initWithVariation:(id)a3 saturation:(id)a4 luminance:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PRSPosterUpdateDiscreteStylePayload;
  v12 = [(PRSPosterUpdatePayload *)&v15 _init];
  v13 = (PRSPosterUpdateDiscreteStylePayload *)v12;
  if (v12)
  {
    objc_storeStrong(v12 + 1, a3);
    objc_storeStrong((id *)&v13->_saturation, a4);
    objc_storeStrong((id *)&v13->_luminance, a5);
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  variation = self->_variation;
  saturation = self->_saturation;
  luminance = self->_luminance;
  return (id)[v4 initWithVariation:variation saturation:saturation luminance:luminance];
}

- (PRSPosterUpdateDiscreteStylePayload)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(PRSPosterUpdatePayload *)self _init];
  if (v5)
  {
    v6 = self;
    uint64_t v7 = [v4 decodeObjectOfClass:v6 forKey:@"_luminance"];
    luminance = v5->_luminance;
    v5->_luminance = (NSNumber *)v7;

    id v9 = self;
    uint64_t v10 = [v4 decodeObjectOfClass:v9 forKey:@"_saturation"];
    saturation = v5->_saturation;
    v5->_saturation = (NSNumber *)v10;

    v12 = self;
    uint64_t v13 = [v4 decodeObjectOfClass:v12 forKey:@"_variation"];
    variation = v5->_variation;
    v5->_variation = (NSNumber *)v13;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  luminance = self->_luminance;
  id v5 = a3;
  [v5 encodeObject:luminance forKey:@"_luminance"];
  [v5 encodeObject:self->_saturation forKey:@"_saturation"];
  [v5 encodeObject:self->_variation forKey:@"_variation"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)rawValue
{
  return 0;
}

- (NSNumber)variation
{
  return self->_variation;
}

- (NSNumber)saturation
{
  return self->_saturation;
}

- (NSNumber)luminance
{
  return self->_luminance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_saturation, 0);
  objc_storeStrong((id *)&self->_luminance, 0);
  objc_storeStrong((id *)&self->_variation, 0);
}

@end