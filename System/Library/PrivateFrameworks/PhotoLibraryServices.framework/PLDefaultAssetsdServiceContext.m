@interface PLDefaultAssetsdServiceContext
- (BOOL)hasEntitlement:(id)a3;
- (BOOL)isClientAuthorizedForTCCServicePhotos;
- (BOOL)isClientAuthorizedForTCCServicePhotosAdd;
- (NSError)shutdownReason;
- (NSString)clientDebugDescription;
- (PLDefaultAssetsdServiceContext)initWithSelector:(SEL)a3 connection:(id)a4 libraryBundle:(id)a5 connectionAuthorization:(id)a6;
- (id)libraryServicesManager;
- (void)awaitLibraryState:(int64_t)a3 completionHandler:(id)a4;
- (void)invalidateClientAuthorizationCache;
@end

@implementation PLDefaultAssetsdServiceContext

- (PLDefaultAssetsdServiceContext)initWithSelector:(SEL)a3 connection:(id)a4 libraryBundle:(id)a5 connectionAuthorization:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)PLDefaultAssetsdServiceContext;
  v14 = [(PLDefaultAssetsdServiceContext *)&v19 init];
  v15 = v14;
  if (v14)
  {
    if (a3) {
      SEL v16 = a3;
    }
    else {
      SEL v16 = 0;
    }
    v14->_selector = v16;
    objc_storeStrong((id *)&v14->_connection, a4);
    objc_storeStrong((id *)&v15->_libraryBundle, a5);
    objc_storeStrong((id *)&v15->_connectionAuthorization, a6);
    v17 = v15;
  }

  return v15;
}

- (void)invalidateClientAuthorizationCache
{
}

- (BOOL)isClientAuthorizedForTCCServicePhotosAdd
{
  return [(PLAssetsdConnectionAuthorization *)self->_connectionAuthorization isClientAuthorizedForTCCServicePhotosAdd];
}

- (NSError)shutdownReason
{
  return [(PLPhotoLibraryBundle *)self->_libraryBundle shutdownReason];
}

- (void)awaitLibraryState:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v6 = (void (**)(id, uint64_t, id))a4;
  v7 = [(PLDefaultAssetsdServiceContext *)self libraryServicesManager];
  v8 = v7;
  if (v7)
  {
    id v16 = 0;
    uint64_t v9 = [v7 awaitLibraryState:a3 error:&v16];
    id v10 = v16;
    v6[2](v6, v9, v10);
  }
  else
  {
    id v11 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      id v12 = [(PLDefaultAssetsdServiceContext *)self clientDebugDescription];
      *(_DWORD *)buf = 138543362;
      v20 = v12;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_FAULT, "No library services manager: %{public}@", buf, 0xCu);
    }
    id v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F8C500];
    uint64_t v17 = *MEMORY[0x1E4F28568];
    v18 = @"No library services manager";
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    id v10 = [v13 errorWithDomain:v14 code:41012 userInfo:v15];

    v6[2](v6, 0, v10);
  }
}

- (id)libraryServicesManager
{
  return [(PLPhotoLibraryBundle *)self->_libraryBundle libraryServicesManager];
}

- (BOOL)hasEntitlement:(id)a3
{
  v3 = [(NSXPCConnection *)self->_connection valueForEntitlement:a3];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionAuthorization, 0);
  objc_storeStrong((id *)&self->_libraryBundle, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (NSString)clientDebugDescription
{
  v3 = PLClientBundleIdentifierFromXPCConnection();
  char v4 = NSString;
  uint64_t v5 = [(NSXPCConnection *)self->_connection processIdentifier];
  if (self->_selector) {
    selector = self->_selector;
  }
  else {
    selector = 0;
  }
  v7 = NSStringFromSelector(selector);
  v8 = [v4 stringWithFormat:@"PID: %d, bundle ID: %@, selector: %@", v5, v3, v7];

  return (NSString *)v8;
}

- (BOOL)isClientAuthorizedForTCCServicePhotos
{
  return [(PLAssetsdConnectionAuthorization *)self->_connectionAuthorization isClientAuthorizedForTCCServicePhotos];
}

@end