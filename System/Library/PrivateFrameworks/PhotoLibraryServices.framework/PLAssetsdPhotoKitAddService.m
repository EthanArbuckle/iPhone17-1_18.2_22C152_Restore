@interface PLAssetsdPhotoKitAddService
- (BOOL)validatePhotosAccessScopeForChangesRequest:(id)a3;
- (PLAssetsdPhotoKitAddService)initWithLibraryServicesManager:(id)a3 connectionAuthorization:(id)a4;
- (id)clientBundleID;
- (id)clientDescription;
- (id)clientDisplayName;
- (id)persistentStoreCoordinator;
- (unint64_t)libraryRole;
- (void)applyChangesRequest:(id)a3 reply:(id)a4;
- (void)commitRequest:(id)a3 reply:(id)a4;
- (void)dealloc;
@end

@implementation PLAssetsdPhotoKitAddService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraTaskConstraintCoordinator, 0);
  objc_storeStrong((id *)&self->_persistentStoreCoordinator, 0);
  objc_storeStrong((id *)&self->_connectionAuthorization, 0);
}

- (void)commitRequest:(id)a3 reply:(id)a4
{
  v8 = (void (**)(id, void, uint64_t))a4;
  id v6 = a3;
  if ([(PLAssetsdPhotoKitAddService *)self validatePhotosAccessScopeForChangesRequest:v6])
  {
    [v6 executeWithService:self reply:v8];
  }
  else
  {
    uint64_t v7 = [v6 errorWithLocalizedDescription:@"Authorization failure for changes"];

    v8[2](v8, 0, v7);
    id v6 = (id)v7;
  }
}

- (BOOL)validatePhotosAccessScopeForChangesRequest:(id)a3
{
  return (unint64_t)[a3 accessScopeOptionsRequiredForRequestedChanges] < 2;
}

- (unint64_t)libraryRole
{
  return 2;
}

- (id)clientDisplayName
{
  return [(PLAssetsdConnectionAuthorization *)self->_connectionAuthorization trustedCallerDisplayName];
}

- (id)clientBundleID
{
  return [(PLAssetsdConnectionAuthorization *)self->_connectionAuthorization trustedCallerBundleID];
}

- (id)clientDescription
{
  return [(PLAssetsdConnectionAuthorization *)self->_connectionAuthorization description];
}

- (id)persistentStoreCoordinator
{
  return self->_persistentStoreCoordinator;
}

- (void)applyChangesRequest:(id)a3 reply:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  +[PLFileDescriptorFuse checkFileDescriptorFuse];
  long long v16 = 0u;
  *(_OWORD *)sel = 0u;
  long long v14 = 0u;
  int v8 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v14) = v8;
  if (v8)
  {
    *((void *)&v14 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: applyChangesRequest:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v14 + 1), (os_activity_scope_state_t)((char *)&v16 + 8));
  }
  objc_msgSend(v6, "decodeWithService:clientAuthorization:", self, self->_connectionAuthorization, (void)v14);
  if ([(PLAssetsdConnectionAuthorization *)self->_connectionAuthorization isClientInLimitedLibraryMode])
  {
    [v6 discardUnsupportedLimitedLibraryChangeRequests];
  }
  v9 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    BOOL v10 = [(PLAssetsdConnectionAuthorization *)self->_connectionAuthorization photoKitEntitled];
    *(_DWORD *)buf = 136315650;
    v19 = "-[PLAssetsdPhotoKitAddService applyChangesRequest:reply:]";
    __int16 v20 = 2112;
    id v21 = v6;
    __int16 v22 = 1024;
    BOOL v23 = v10;
    _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEBUG, "##### %s %@ entitled:%d", buf, 0x1Cu);
  }

  [(PLAssetsdPhotoKitAddService *)self commitRequest:v6 reply:v7];
  if (v15) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v16 + 8));
  }
  if ((void)v16)
  {
    v11 = PLRequestGetLog();
    v12 = v11;
    if ((unint64_t)(v16 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v19 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v12, OS_SIGNPOST_INTERVAL_END, v16, "##### %s %@ entitled:%d", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)dealloc
{
  [(PLCameraCaptureTaskConstraintCoordinator *)self->_cameraTaskConstraintCoordinator invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PLAssetsdPhotoKitAddService;
  [(PLAssetsdPhotoKitAddService *)&v3 dealloc];
}

- (PLAssetsdPhotoKitAddService)initWithLibraryServicesManager:(id)a3 connectionAuthorization:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PLAssetsdPhotoKitAddService;
  int v8 = [(PLAbstractLibraryServicesManagerService *)&v16 initWithLibraryServicesManager:v6];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_connectionAuthorization, a4);
    uint64_t v10 = [v6 persistentStoreCoordinator];
    persistentStoreCoordinator = v9->_persistentStoreCoordinator;
    v9->_persistentStoreCoordinator = (NSPersistentStoreCoordinator *)v10;

    if (PLPlatformCameraCaptureSupported())
    {
      v12 = [NSString stringWithFormat:@"PhotoKitAddService: %@", v7];
      v13 = [[PLCameraCaptureTaskConstraintCoordinator alloc] initWithTaskContstraintRole:2 name:v12];
      cameraTaskConstraintCoordinator = v9->_cameraTaskConstraintCoordinator;
      v9->_cameraTaskConstraintCoordinator = v13;
    }
  }

  return v9;
}

@end