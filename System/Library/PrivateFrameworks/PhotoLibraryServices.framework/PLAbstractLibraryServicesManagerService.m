@interface PLAbstractLibraryServicesManagerService
- (PLAbstractLibraryServicesManagerService)initWithLibraryServicesManager:(id)a3;
- (PLLibraryServicesManager)libraryServicesManager;
- (id)newShortLivedLibraryWithName:(const char *)a3;
@end

@implementation PLAbstractLibraryServicesManagerService

- (PLAbstractLibraryServicesManagerService)initWithLibraryServicesManager:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PLAbstractLibraryServicesManagerService.m", 18, @"Invalid parameter not satisfying: %@", @"manager != nil" object file lineNumber description];
  }
  v7 = [(PLAbstractLibraryServicesManagerService *)self init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_libraryServicesManager, a3);
  }

  return v8;
}

- (PLLibraryServicesManager)libraryServicesManager
{
  return self->_libraryServicesManager;
}

- (void).cxx_destruct
{
}

- (id)newShortLivedLibraryWithName:(const char *)a3
{
  v4 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  v5 = [v4 databaseContext];
  id v6 = (void *)[v5 newShortLivedLibraryWithName:a3];

  return v6;
}

@end