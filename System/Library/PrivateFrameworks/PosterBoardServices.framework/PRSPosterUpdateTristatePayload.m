@interface PRSPosterUpdateTristatePayload
+ (BOOL)supportsSecureCoding;
- (NSNumber)tristate;
- (PRSPosterUpdateTristatePayload)initWithCoder:(id)a3;
- (PRSPosterUpdateTristatePayload)initWithState:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)rawValue;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PRSPosterUpdateTristatePayload

- (PRSPosterUpdateTristatePayload)initWithState:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PRSPosterUpdateTristatePayload;
  v5 = [(PRSPosterUpdatePayload *)&v9 _init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    tristate = v5->_tristate;
    v5->_tristate = (NSNumber *)v6;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  tristate = self->_tristate;
  return (id)[v4 initWithState:tristate];
}

- (PRSPosterUpdateTristatePayload)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(PRSPosterUpdatePayload *)self _init];
  if (v5)
  {
    uint64_t v6 = self;
    uint64_t v7 = [v4 decodeObjectOfClass:v6 forKey:@"_tristate"];
    tristate = v5->_tristate;
    v5->_tristate = (NSNumber *)v7;
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
  v2 = (void *)[(NSNumber *)self->_tristate copy];
  return v2;
}

- (NSNumber)tristate
{
  return self->_tristate;
}

- (void).cxx_destruct
{
}

@end