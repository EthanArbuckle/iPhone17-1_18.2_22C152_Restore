@interface MBCKSettingsContext
- (IXCoordinatorWithUserDataPromise)installCoordinator;
- (NSSet)bundleIDs;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setBundleIDs:(id)a3;
- (void)setInstallCoordinator:(id)a3;
@end

@implementation MBCKSettingsContext

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MBCKSettingsContext;
  id v5 = -[MBServiceSettingsContext copyWithZone:](&v8, "copyWithZone:");
  id v6 = [(NSSet *)self->_bundleIDs copyWithZone:a3];
  [v5 setBundleIDs:v6];

  return v5;
}

- (NSSet)bundleIDs
{
  return self->_bundleIDs;
}

- (void)setBundleIDs:(id)a3
{
}

- (IXCoordinatorWithUserDataPromise)installCoordinator
{
  return self->_installCoordinator;
}

- (void)setInstallCoordinator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installCoordinator, 0);
  objc_storeStrong((id *)&self->_bundleIDs, 0);
}

@end