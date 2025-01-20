@interface PRSMutableMigrationDescriptor
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation PRSMutableMigrationDescriptor

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(PRSMigrationDescriptor);
  v5 = [(PRSMigrationDescriptor *)self isHomeScreenDim];
  [(PRSMigrationDescriptor *)v4 setHomeScreenDim:v5];

  v6 = [(PRSMigrationDescriptor *)self homeScreenTintColor];
  [(PRSMigrationDescriptor *)v4 setHomeScreenTintColor:v6];

  v7 = [(PRSMigrationDescriptor *)self homeScreenIconSize];
  [(PRSMigrationDescriptor *)v4 setHomeScreenIconSize:v7];

  v8 = [(PRSMigrationDescriptor *)self homeScreenIconStyle];
  [(PRSMigrationDescriptor *)v4 setHomeScreenIconStyle:v8];

  return v4;
}

@end