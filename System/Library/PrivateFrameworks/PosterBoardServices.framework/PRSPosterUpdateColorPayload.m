@interface PRSPosterUpdateColorPayload
+ (BOOL)supportsSecureCoding;
- (BSColor)color;
- (PRSPosterUpdateColorPayload)initWithCoder:(id)a3;
- (PRSPosterUpdateColorPayload)initWithColor:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)rawValue;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PRSPosterUpdateColorPayload

- (PRSPosterUpdateColorPayload)initWithColor:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PRSPosterUpdateColorPayload;
  v5 = [(PRSPosterUpdatePayload *)&v9 _init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    color = v5->_color;
    v5->_color = (BSColor *)v6;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  color = self->_color;
  return (id)[v4 initWithColor:color];
}

- (PRSPosterUpdateColorPayload)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(PRSPosterUpdatePayload *)self _init];
  if (v5)
  {
    uint64_t v6 = self;
    uint64_t v7 = [v4 decodeObjectOfClass:v6 forKey:@"_color"];
    color = v5->_color;
    v5->_color = (BSColor *)v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)rawValue
{
  v2 = (void *)[(BSColor *)self->_color copy];
  return v2;
}

- (BSColor)color
{
  return self->_color;
}

- (void).cxx_destruct
{
}

@end