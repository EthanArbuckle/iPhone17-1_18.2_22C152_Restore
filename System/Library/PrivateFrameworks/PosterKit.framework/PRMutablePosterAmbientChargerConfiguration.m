@interface PRMutablePosterAmbientChargerConfiguration
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)associateWithChargerIdentifier:(id)a3;
- (void)disassociateFromChargerIdentifier:(id)a3;
@end

@implementation PRMutablePosterAmbientChargerConfiguration

- (void)associateWithChargerIdentifier:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v6 = [(PRPosterAmbientChargerConfiguration *)self associatedChargerIdentifiers];
    v5 = [v6 setByAddingObject:v4];

    [(PRPosterAmbientChargerConfiguration *)self setAssociatedChargerIdentifiers:v5];
  }
}

- (void)disassociateFromChargerIdentifier:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [(PRPosterAmbientChargerConfiguration *)self associatedChargerIdentifiers];
    id v6 = (id)[v5 mutableCopy];

    [v6 removeObject:v4];
    [(PRPosterAmbientChargerConfiguration *)self setAssociatedChargerIdentifiers:v6];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[PRPosterAmbientChargerConfiguration allocWithZone:a3];
  v5 = [(PRPosterAmbientChargerConfiguration *)self associatedChargerIdentifiers];
  id v6 = [(PRPosterAmbientChargerConfiguration *)v4 initWithAssociatedChargerIdentifiers:v5];

  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(PRPosterAmbientChargerConfiguration *)self associatedChargerIdentifiers];
  id v6 = (void *)[v4 initWithAssociatedChargerIdentifiers:v5];

  return v6;
}

@end