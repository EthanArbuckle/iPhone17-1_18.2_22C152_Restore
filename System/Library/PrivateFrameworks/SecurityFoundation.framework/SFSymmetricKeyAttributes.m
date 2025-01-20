@interface SFSymmetricKeyAttributes
- (NSString)keyDomain;
- (NSString)localizedDescription;
- (NSString)localizedLabel;
- (NSString)persistentIdentifier;
- (SFSymmetricKeyAttributes)initWithSpecifier:(id)a3;
- (SFSymmetricKeyAttributes)initWithSpecifier:(id)a3 domain:(id)a4;
- (_SFKeySpecifier)keySpecifier;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setKeySpecifier:(id)a3;
- (void)setLocalizedDescription:(id)a3;
- (void)setLocalizedLabel:(id)a3;
@end

@implementation SFSymmetricKeyAttributes

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->persistentIdentifier, 0);
  objc_storeStrong(&self->_symmetricKeyAttributesInternal, 0);
}

- (SFSymmetricKeyAttributes)initWithSpecifier:(id)a3
{
  return [(SFSymmetricKeyAttributes *)self initWithSpecifier:a3 domain:@"SFKeyDomainCPU"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithSpecifier:domain:", *((void *)self->_symmetricKeyAttributesInternal + 3), *((void *)self->_symmetricKeyAttributesInternal + 4));
  [v4 setLocalizedLabel:*((void *)self->_symmetricKeyAttributesInternal + 1)];
  [v4 setLocalizedDescription:*((void *)self->_symmetricKeyAttributesInternal + 2)];
  return v4;
}

- (SFSymmetricKeyAttributes)initWithSpecifier:(id)a3 domain:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SFSymmetricKeyAttributes;
  v8 = [(SFSymmetricKeyAttributes *)&v18 init];
  if (v8)
  {
    v9 = objc_alloc_init(SFSymmetricKeyAttributes_Ivars);
    id symmetricKeyAttributesInternal = v8->_symmetricKeyAttributesInternal;
    v8->_id symmetricKeyAttributesInternal = v9;

    uint64_t v11 = [v6 copy];
    v12 = v8->_symmetricKeyAttributesInternal;
    v13 = (void *)v12[3];
    v12[3] = v11;

    uint64_t v14 = [v7 copy];
    v15 = v8->_symmetricKeyAttributesInternal;
    v16 = (void *)v15[4];
    v15[4] = v14;
  }
  return v8;
}

- (void)setLocalizedLabel:(id)a3
{
  *((void *)self->_symmetricKeyAttributesInternal + 1) = [a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setLocalizedDescription:(id)a3
{
  *((void *)self->_symmetricKeyAttributesInternal + 2) = [a3 copy];
  MEMORY[0x1F41817F8]();
}

- (NSString)localizedLabel
{
  v2 = (void *)[*((id *)self->_symmetricKeyAttributesInternal + 1) copy];
  return (NSString *)v2;
}

- (NSString)localizedDescription
{
  v2 = (void *)[*((id *)self->_symmetricKeyAttributesInternal + 2) copy];
  return (NSString *)v2;
}

- (_SFKeySpecifier)keySpecifier
{
  v2 = (void *)[*((id *)self->_symmetricKeyAttributesInternal + 3) copy];
  return (_SFKeySpecifier *)v2;
}

- (void)setKeySpecifier:(id)a3
{
  *((void *)self->_symmetricKeyAttributesInternal + 3) = [a3 copy];
  MEMORY[0x1F41817F8]();
}

- (NSString)keyDomain
{
  v2 = (void *)[*((id *)self->_symmetricKeyAttributesInternal + 4) copy];
  return (NSString *)v2;
}

- (NSString)persistentIdentifier
{
  return self->persistentIdentifier;
}

@end