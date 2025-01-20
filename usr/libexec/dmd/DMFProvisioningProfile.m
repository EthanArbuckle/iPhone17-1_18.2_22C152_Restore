@interface DMFProvisioningProfile
- (id)initWithProfileRef:(void *)a3;
@end

@implementation DMFProvisioningProfile

- (id)initWithProfileRef:(void *)a3
{
  uint64_t UUID = MISProvisioningProfileGetUUID();
  uint64_t Name = MISProvisioningProfileGetName();
  uint64_t ExpirationDate = MISProvisioningProfileGetExpirationDate();

  return [(DMFProvisioningProfile *)self initWithUUID:UUID name:Name expirationDate:ExpirationDate];
}

@end