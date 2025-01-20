@interface _SFAsymmetricKeyAttributes
- (NSString)keyDomain;
- (_SFAsymmetricKeyAttributes)initWithSpecifier:(id)a3;
- (_SFAsymmetricKeyAttributes)initWithSpecifier:(id)a3 domain:(id)a4;
- (_SFKeySpecifier)keySpecifier;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation _SFAsymmetricKeyAttributes

- (_SFAsymmetricKeyAttributes)initWithSpecifier:(id)a3
{
  return [(_SFAsymmetricKeyAttributes *)self initWithSpecifier:a3 domain:@"SFKeyDomainCPU"];
}

- (_SFAsymmetricKeyAttributes)initWithSpecifier:(id)a3 domain:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_SFAsymmetricKeyAttributes;
  v8 = [(_SFAsymmetricKeyAttributes *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    asymmetricKeySpecifier = v8->_asymmetricKeySpecifier;
    v8->_asymmetricKeySpecifier = (_SFKeySpecifier *)v9;

    uint64_t v11 = [v7 copy];
    asymmetricKeyDomain = v8->_asymmetricKeyDomain;
    v8->_asymmetricKeyDomain = (NSString *)v11;
  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  asymmetricKeySpecifier = self->_asymmetricKeySpecifier;
  asymmetricKeyDomain = self->_asymmetricKeyDomain;
  return (id)[v4 initWithSpecifier:asymmetricKeySpecifier domain:asymmetricKeyDomain];
}

- (_SFKeySpecifier)keySpecifier
{
  return self->_asymmetricKeySpecifier;
}

- (NSString)keyDomain
{
  return self->_asymmetricKeyDomain;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asymmetricKeyDomain, 0);
  objc_storeStrong((id *)&self->_asymmetricKeySpecifier, 0);
}

@end