@interface PLAssetsdXPCUserInfo
- (PLAssetsdXPCUserInfo)initWithLibraryServicesManager:(id)a3;
- (id)libraryServicesManager;
- (id)persistentStoreCoordinator;
@end

@implementation PLAssetsdXPCUserInfo

- (PLAssetsdXPCUserInfo)initWithLibraryServicesManager:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PLAssetsdXPCUserInfo;
  v6 = [(PLAssetsdXPCUserInfo *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_libraryServicesManager, a3);
    v8 = v7;
  }

  return v7;
}

- (void).cxx_destruct
{
}

- (id)persistentStoreCoordinator
{
  return [(PLLibraryServicesManager *)self->_libraryServicesManager persistentStoreCoordinator];
}

- (id)libraryServicesManager
{
  return self->_libraryServicesManager;
}

@end