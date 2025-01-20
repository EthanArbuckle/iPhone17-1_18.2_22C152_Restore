@interface SFIdentityAttributes
+ (BOOL)supportsSecureCoding;
- (BOOL)hasCertificate;
- (NSString)identityName;
- (NSString)localizedDescription;
- (NSString)localizedLabel;
- (NSString)persistentIdentifier;
- (NSString)privateKeyDomain;
- (SFIdentityAttributes)initWithCoder:(id)a3;
- (_SFKeySpecifier)keySpecifier;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setIdentityName:(id)a3;
- (void)setKeySpecifier:(id)a3;
- (void)setLocalizedDescription:(id)a3;
- (void)setLocalizedLabel:(id)a3;
@end

@implementation SFIdentityAttributes

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFIdentityAttributes)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SFIdentityAttributes;
  return [(SFIdentityAttributes *)&v4 init];
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 setLocalizedLabel:*((void *)self->_identityAttributesInternal + 1)];
  [v4 setLocalizedDescription:*((void *)self->_identityAttributesInternal + 2)];
  [v4 setKeySpecifier:*((void *)self->_identityAttributesInternal + 3)];
  [v4 setIdentityName:*((void *)self->_identityAttributesInternal + 4)];
  return v4;
}

- (NSString)localizedLabel
{
  v2 = (void *)[*((id *)self->_identityAttributesInternal + 1) copy];
  return (NSString *)v2;
}

- (void)setLocalizedLabel:(id)a3
{
  *((void *)self->_identityAttributesInternal + 1) = [a3 copy];
  MEMORY[0x1F41817F8]();
}

- (NSString)localizedDescription
{
  v2 = (void *)[*((id *)self->_identityAttributesInternal + 2) copy];
  return (NSString *)v2;
}

- (void)setLocalizedDescription:(id)a3
{
  *((void *)self->_identityAttributesInternal + 2) = [a3 copy];
  MEMORY[0x1F41817F8]();
}

- (_SFKeySpecifier)keySpecifier
{
  v2 = (void *)[*((id *)self->_identityAttributesInternal + 3) copy];
  return (_SFKeySpecifier *)v2;
}

- (void)setKeySpecifier:(id)a3
{
  *((void *)self->_identityAttributesInternal + 3) = [a3 copy];
  MEMORY[0x1F41817F8]();
}

- (NSString)identityName
{
  v2 = (void *)[*((id *)self->_identityAttributesInternal + 4) copy];
  return (NSString *)v2;
}

- (void)setIdentityName:(id)a3
{
  *((void *)self->_identityAttributesInternal + 4) = [a3 copy];
  MEMORY[0x1F41817F8]();
}

- (BOOL)hasCertificate
{
  return *((unsigned char *)self->_identityAttributesInternal + 48);
}

- (NSString)persistentIdentifier
{
  return self->persistentIdentifier;
}

- (NSString)privateKeyDomain
{
  return self->_privateKeyDomain;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateKeyDomain, 0);
  objc_storeStrong((id *)&self->persistentIdentifier, 0);
  objc_storeStrong(&self->_identityAttributesInternal, 0);
}

@end