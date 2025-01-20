@interface SFAuthenticateAccountsServiceConfiguration
- (BOOL)isHomeKitSetupNeeded;
- (BOOL)isHomeSharingSetupNeeded;
- (NSSet)existingAccountsIdentifiers;
- (SFAuthenticateAccountsServiceConfiguration)init;
- (id)copyWithZone:(_NSZone *)a3;
- (unsigned)serviceType;
- (unsigned)targetedAccountTypes;
- (void)setExistingAccountsIdentifiers:(id)a3;
- (void)setIsHomeKitSetupNeeded:(BOOL)a3;
- (void)setIsHomeSharingSetupNeeded:(BOOL)a3;
- (void)setServiceType:(unsigned int)a3;
- (void)setTargetedAccountTypes:(unsigned int)a3;
@end

@implementation SFAuthenticateAccountsServiceConfiguration

- (SFAuthenticateAccountsServiceConfiguration)init
{
  v6.receiver = self;
  v6.super_class = (Class)SFAuthenticateAccountsServiceConfiguration;
  v2 = [(SFAuthenticateAccountsServiceConfiguration *)&v6 init];
  v3 = v2;
  if (v2)
  {
    *(void *)(v2 + 12) = 0x700000000;
    v4 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = 0;

    *((_WORD *)v3 + 4) = 0;
  }
  return (SFAuthenticateAccountsServiceConfiguration *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(SFAuthenticateAccountsServiceConfiguration);
  v4->_serviceType = self->_serviceType;
  v4->_targetedAccountTypes = self->_targetedAccountTypes;
  uint64_t v5 = [(NSSet *)self->_existingAccountsIdentifiers copy];
  existingAccountsIdentifiers = v4->_existingAccountsIdentifiers;
  v4->_existingAccountsIdentifiers = (NSSet *)v5;

  v4->_isHomeSharingSetupNeeded = self->_isHomeSharingSetupNeeded;
  v4->_isHomeKitSetupNeeded = self->_isHomeKitSetupNeeded;
  return v4;
}

- (unsigned)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(unsigned int)a3
{
  self->_serviceType = a3;
}

- (unsigned)targetedAccountTypes
{
  return self->_targetedAccountTypes;
}

- (void)setTargetedAccountTypes:(unsigned int)a3
{
  self->_targetedAccountTypes = a3;
}

- (NSSet)existingAccountsIdentifiers
{
  return self->_existingAccountsIdentifiers;
}

- (void)setExistingAccountsIdentifiers:(id)a3
{
}

- (BOOL)isHomeSharingSetupNeeded
{
  return self->_isHomeSharingSetupNeeded;
}

- (void)setIsHomeSharingSetupNeeded:(BOOL)a3
{
  self->_isHomeSharingSetupNeeded = a3;
}

- (BOOL)isHomeKitSetupNeeded
{
  return self->_isHomeKitSetupNeeded;
}

- (void)setIsHomeKitSetupNeeded:(BOOL)a3
{
  self->_isHomeKitSetupNeeded = a3;
}

- (void).cxx_destruct
{
}

@end