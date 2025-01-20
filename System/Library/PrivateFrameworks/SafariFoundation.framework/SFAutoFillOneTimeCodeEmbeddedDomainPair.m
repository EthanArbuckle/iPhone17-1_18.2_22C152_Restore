@interface SFAutoFillOneTimeCodeEmbeddedDomainPair
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)strict;
- (NSString)domain;
- (SFAutoFillOneTimeCodeEmbeddedDomainPair)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDomain:(id)a3;
- (void)setStrict:(BOOL)a3;
@end

@implementation SFAutoFillOneTimeCodeEmbeddedDomainPair

- (BOOL)isEqual:(id)a3
{
  v4 = (SFAutoFillOneTimeCodeEmbeddedDomainPair *)a3;
  if (self == v4)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(SFAutoFillOneTimeCodeEmbeddedDomainPair *)v5 domain];
      v7 = [(SFAutoFillOneTimeCodeEmbeddedDomainPair *)self domain];
      if ([v6 isEqualToString:v7])
      {
        BOOL v8 = [(SFAutoFillOneTimeCodeEmbeddedDomainPair *)v5 strict];
        int v9 = v8 ^ [(SFAutoFillOneTimeCodeEmbeddedDomainPair *)self strict] ^ 1;
      }
      else
      {
        LOBYTE(v9) = 0;
      }
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  domain = self->_domain;
  id v5 = a3;
  [v5 encodeObject:domain forKey:@"domain"];
  [v5 encodeBool:self->_strict forKey:@"embeddedDomains"];
}

- (SFAutoFillOneTimeCodeEmbeddedDomainPair)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFAutoFillOneTimeCodeEmbeddedDomainPair;
  id v5 = [(SFAutoFillOneTimeCodeEmbeddedDomainPair *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"domain"];
    domain = v5->_domain;
    v5->_domain = (NSString *)v6;

    v5->_strict = [v4 decodeBoolForKey:@"embeddedDomains"];
    BOOL v8 = v5;
  }

  return v5;
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
}

- (BOOL)strict
{
  return self->_strict;
}

- (void)setStrict:(BOOL)a3
{
  self->_strict = a3;
}

- (void).cxx_destruct
{
}

@end