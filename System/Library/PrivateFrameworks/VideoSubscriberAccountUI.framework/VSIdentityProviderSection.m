@interface VSIdentityProviderSection
- (NSArray)identityProviders;
- (VSIdentityProviderSection)init;
- (void)setIdentityProviders:(id)a3;
@end

@implementation VSIdentityProviderSection

- (VSIdentityProviderSection)init
{
  v6.receiver = self;
  v6.super_class = (Class)VSIdentityProviderSection;
  v2 = [(VSIdentityProviderSection *)&v6 init];
  v3 = v2;
  if (v2)
  {
    identityProviders = v2->_identityProviders;
    v2->_identityProviders = (NSArray *)MEMORY[0x263EFFA68];
  }
  return v3;
}

- (NSArray)identityProviders
{
  return self->_identityProviders;
}

- (void)setIdentityProviders:(id)a3
{
}

- (void).cxx_destruct
{
}

@end