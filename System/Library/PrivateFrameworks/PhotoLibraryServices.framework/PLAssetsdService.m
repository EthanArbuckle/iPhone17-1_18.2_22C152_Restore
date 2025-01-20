@interface PLAssetsdService
+ (id)autoCreateWellKnownPhotoLibraryIfNeededWithURL:(id)a3 wellKnownLibraryIdentifier:(int64_t *)a4;
- (BOOL)_prepareToRunDaemonJob:(id)a3 error:(id *)a4;
- (BOOL)isPhotosClient;
- (NSString)connectionDescription;
- (NSString)description;
- (NSString)stateDescription;
- (NSURL)libraryURL;
- (PLAssetsdService)initWithConnection:(id)a3 libraryBundleController:(id)a4 daemonServices:(id)a5;
- (PLCacheMetricsCollectorServerShell)cacheMetricsShellObject;
- (PLLibraryServicesManager)libraryServicesManager;
- (id)_photoLibrary;
- (id)_waitForLibraryServicesForDaemonJob;
- (id)clientDebugDescription;
- (id)newCloudInternalService;
- (id)newCloudService;
- (id)newDebugService;
- (id)newDemoService;
- (id)newDiagnosticsService;
- (id)newLibraryInternalService;
- (id)newLibraryManagementService;
- (id)newLibraryService;
- (id)newMigrationService;
- (id)newNonBindingDebugService;
- (id)newNotificationService;
- (id)newPhotoKitAddService;
- (id)newPhotoKitService;
- (id)newPrivacySupportService;
- (id)newResourceAvailabilityService;
- (id)newResourceInternalService;
- (id)newResourceService;
- (id)newResourceWriteOnlyService;
- (id)newSyncService;
- (id)newSystemLibraryURLReadOnlyService;
- (id)permissionsForCloudInternalService;
- (id)permissionsForCloudService;
- (id)permissionsForDebugService;
- (id)permissionsForDemoService;
- (id)permissionsForDiagnosticsService;
- (id)permissionsForLibraryInternalService;
- (id)permissionsForLibraryManagementService;
- (id)permissionsForLibraryService;
- (id)permissionsForMigrationService;
- (id)permissionsForNonBindingDebugService;
- (id)permissionsForNotificationService;
- (id)permissionsForPhotoKitAddService;
- (id)permissionsForPhotoKitService;
- (id)permissionsForPrivacySupportService;
- (id)permissionsForResourceAvailabilityService;
- (id)permissionsForResourceInternalService;
- (id)permissionsForResourceService;
- (id)permissionsForResourceWriteOnlyService;
- (id)permissionsForSyncService;
- (id)permissionsForSystemLibraryURLReadOnlyService;
- (id)resourceDownloader;
- (id)serviceContextWithSelector:(SEL)a3;
- (int64_t)requiredStateForCloudInternalService;
- (int64_t)requiredStateForCloudService;
- (int64_t)requiredStateForDebugService;
- (int64_t)requiredStateForDemoService;
- (int64_t)requiredStateForDiagnosticsService;
- (int64_t)requiredStateForLibraryInternalService;
- (int64_t)requiredStateForLibraryManagementService;
- (int64_t)requiredStateForLibraryService;
- (int64_t)requiredStateForMigrationService;
- (int64_t)requiredStateForNonBindingDebugService;
- (int64_t)requiredStateForNotificationService;
- (int64_t)requiredStateForPhotoKitAddService;
- (int64_t)requiredStateForPhotoKitService;
- (int64_t)requiredStateForPrivacySupportService;
- (int64_t)requiredStateForResourceAvailabilityService;
- (int64_t)requiredStateForResourceInternalService;
- (int64_t)requiredStateForResourceService;
- (int64_t)requiredStateForResourceWriteOnlyService;
- (int64_t)requiredStateForSyncService;
- (int64_t)requiredStateForSystemLibraryURLReadOnlyService;
- (void)bindToPhotoLibraryURL:(id)a3 sandboxExtension:(id)a4 clientOptions:(id)a5 withReply:(id)a6;
- (void)bindToPhotoLibraryURL:(id)a3 sandboxExtension:(id)a4 withReply:(id)a5;
- (void)collectCacheMetrics;
- (void)getCloudInternalServiceWithReply:(id)a3;
- (void)getCloudServiceWithReply:(id)a3;
- (void)getDebugServiceWithReply:(id)a3;
- (void)getDemoServiceWithReply:(id)a3;
- (void)getDiagnosticsServiceWithReply:(id)a3;
- (void)getLibraryInternalServiceWithReply:(id)a3;
- (void)getLibraryManagementServiceWithReply:(id)a3;
- (void)getLibraryServiceWithReply:(id)a3;
- (void)getMigrationServiceWithReply:(id)a3;
- (void)getNonBindingDebugServiceWithReply:(id)a3;
- (void)getNotificationServiceWithReply:(id)a3;
- (void)getPhotoKitAddServiceWithReply:(id)a3;
- (void)getPhotoKitServiceWithReply:(id)a3;
- (void)getPrivacySupportServiceWithReply:(id)a3;
- (void)getResourceAvailabilityServiceWithReply:(id)a3;
- (void)getResourceInternalServiceWithReply:(id)a3;
- (void)getResourceServiceWithReply:(id)a3;
- (void)getResourceWriteOnlyServiceWithReply:(id)a3;
- (void)getSyncServiceWithReply:(id)a3;
- (void)getSystemLibraryURLReadOnlyServiceWithReply:(id)a3;
- (void)handleInterruption;
- (void)handleInvalidation;
- (void)invalidateConnectionWithReason:(id)a3;
- (void)photoLibraryDeletedAtURL:(id)a3 reply:(id)a4;
- (void)runDaemonJob:(id)a3 isSerial:(BOOL)a4;
- (void)runDaemonJob:(id)a3 isSerial:(BOOL)a4 withReply:(id)a5;
@end

@implementation PLAssetsdService

- (PLAssetsdService)initWithConnection:(id)a3 libraryBundleController:(id)a4 daemonServices:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)PLAssetsdService;
  v11 = [(PLAssetsdService *)&v24 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_connection, v8);
    objc_storeStrong((id *)&v12->_libraryBundleController, a4);
    v13 = [[PLAssetsdConnectionAuthorization alloc] initWithConnection:v8 daemonServices:v10];
    connectionAuthorization = v12->_connectionAuthorization;
    v12->_connectionAuthorization = v13;

    id WeakRetained = objc_loadWeakRetained((id *)&v12->_connection);
    v12->_int remotePID = [WeakRetained processIdentifier];

    v16 = objc_alloc_init(PLCacheMetricsCollectorServerShell);
    cacheMetricsShellObject = v12->_cacheMetricsShellObject;
    v12->_cacheMetricsShellObject = v16;

    v18 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int remotePID = v12->_remotePID;
      id v20 = objc_loadWeakRetained((id *)&v12->_connection);
      v21 = PLClientBundleIdentifierFromXPCConnection();
      qos_class_self();
      v22 = PLStringFromQoSClass();
      *(_DWORD *)buf = 67109634;
      int v26 = remotePID;
      __int16 v27 = 2112;
      v28 = v21;
      __int16 v29 = 2114;
      v30 = v22;
      _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEFAULT, "Connection opened for client with PID: %d, bundle ID: %@ at QoS: %{public}@", buf, 0x1Cu);
    }
  }

  return v12;
}

+ (id)autoCreateWellKnownPhotoLibraryIfNeededWithURL:(id)a3 wellKnownLibraryIdentifier:(int64_t *)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!a4)
  {
    v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2, a1, @"PLAssetsdService.m", 876, @"Invalid parameter not satisfying: %@", @"outIdentifier" object file lineNumber description];
  }
  if ([MEMORY[0x1E4F8B980] isSystemPhotoLibraryURL:v7])
  {
    *a4 = 1;
  }
  else
  {
    int64_t v8 = [MEMORY[0x1E4F8B980] wellKnownPhotoLibraryIdentifierForURL:v7];
    *a4 = v8;
    if (!v8)
    {
      id v29 = 0;
      goto LABEL_27;
    }
  }
  id v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v10 = [v7 path];
  int v11 = [v9 fileExistsAtPath:v10];

  v12 = PLBackendGetLog();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      v14 = PLStringFromWellKnownPhotoLibraryIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v36 = (uint64_t)v14;
      __int16 v37 = 2112;
      id v38 = v7;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ library directory exists at URL %@", buf, 0x16u);
    }
    id v15 = 0;
    goto LABEL_25;
  }
  if (v13)
  {
    v16 = PLStringFromWellKnownPhotoLibraryIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v36 = (uint64_t)v16;
    __int16 v37 = 2112;
    id v38 = v7;
    _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "Auto-creating %{public}@ at URL %@", buf, 0x16u);
  }
  v17 = [v7 path];
  id v34 = 0;
  int v18 = [v9 createDirectoryAtPath:v17 withIntermediateDirectories:1 attributes:0 error:&v34];
  id v15 = v34;

  if (v18)
  {
    id v19 = v7;
    [v19 fileSystemRepresentation];
    id v20 = (const char *)sandbox_extension_issue_file_to_self();
    if (v20)
    {
      v21 = (char *)v20;
      v12 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v20 length:strlen(v20) + 1];
      free(v21);
      v22 = [MEMORY[0x1E4F8B950] sharedBookmarkManager];
      id v33 = 0;
      v23 = [v22 URLFromClientLibraryURL:v19 sandboxExtension:v12 error:&v33];
      id v24 = v33;
      if (!v23)
      {
        v25 = PLBackendGetLog();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v36 = (uint64_t)v24;
          _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_ERROR, "Auto-create library failed with resolutionError %@", buf, 0xCu);
        }
      }
      goto LABEL_26;
    }
    v12 = PLBackendGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v30 = [v19 fileSystemRepresentation];
      *(_DWORD *)buf = 136315138;
      uint64_t v36 = v30;
      int v26 = "sandbox_extension_issue_file_to_self failed for path %s";
      __int16 v27 = v12;
      uint32_t v28 = 12;
      goto LABEL_24;
    }
  }
  else
  {
    v12 = PLBackendGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v36 = (uint64_t)v7;
      __int16 v37 = 2112;
      id v38 = v15;
      int v26 = "Error creating directory at %@: %@";
      __int16 v27 = v12;
      uint32_t v28 = 22;
LABEL_24:
      _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_ERROR, v26, buf, v28);
    }
  }
LABEL_25:
  v23 = 0;
LABEL_26:

  id v29 = v23;
LABEL_27:

  return v29;
}

- (void)bindToPhotoLibraryURL:(id)a3 sandboxExtension:(id)a4 clientOptions:(id)a5 withReply:(id)a6
{
  v85[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v67 = a4;
  id v66 = a5;
  int v11 = (void (**)(id, id))a6;
  long long v72 = 0u;
  *(_OWORD *)sel = 0u;
  long long v71 = 0u;
  int v12 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v71) = v12;
  if (v12)
  {
    BOOL v13 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: bindToPhotoLibraryURL:sandboxExtension:clientOptions:withReply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    v14 = (void *)*((void *)&v71 + 1);
    *((void *)&v71 + 1) = v13;

    os_activity_scope_enter(v13, (os_activity_scope_state_t)((char *)&v72 + 8));
  }
  id v15 = [MEMORY[0x1E4F8B950] sharedBookmarkManager];
  id v70 = 0;
  v16 = [v15 URLFromClientLibraryURL:v10 sandboxExtension:v67 error:&v70];
  id v65 = v70;
  v69 = 0;
  v17 = [(id)objc_opt_class() autoCreateWellKnownPhotoLibraryIfNeededWithURL:v10 wellKnownLibraryIdentifier:&v69];
  int v18 = v17;
  if (v17)
  {
    id v19 = v17;

    v16 = v19;
  }
  if (self->_libraryURL && (objc_msgSend(v16, "isEqual:") & 1) == 0)
  {
    v60 = [MEMORY[0x1E4F28B00] currentHandler];
    [v60 handleFailureInMethod:a2, self, @"PLAssetsdService.m", 731, @"Cannot update _libraryURL %@ to %@ after it is assigned", self->_libraryURL, v10 object file lineNumber description];
  }
  if (((unint64_t)v69 & 0xFFFFFFFFFFFFFFFELL) != 2
    || [(PLAssetsdConnectionAuthorization *)self->_connectionAuthorization photosDataVaultEntitled])
  {
    goto LABEL_17;
  }
  if ([(PLAssetsdConnectionAuthorization *)self->_connectionAuthorization clientIsSandboxed])
  {
    id v20 = PLBackendGetLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = v69;
      v22 = [(PLAssetsdConnectionAuthorization *)self->_connectionAuthorization trustedCallerBundleID];
      int v23 = [(PLAssetsdConnectionAuthorization *)self->_connectionAuthorization clientProcessIdentifier];
      *(_DWORD *)buf = 134218498;
      v79 = v21;
      __int16 v80 = 2112;
      v81 = v22;
      __int16 v82 = 1024;
      int v83 = v23;
      _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_ERROR, "bindToPhotoLibraryURL WILL FAIL for well known library %td because client '%@' (%d) is missing the photos data vault entitlement \"com.apple.private.security.storage.PhotosLibraries\"", buf, 0x1Cu);
    }
    goto LABEL_17;
  }
  id v24 = NSStringFromPLErrorCode();
  v25 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v26 = *MEMORY[0x1E4F28228];
  v84[0] = *MEMORY[0x1E4F289D0];
  v84[1] = v26;
  v85[0] = v16;
  v85[1] = v24;
  __int16 v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v85 forKeys:v84 count:2];
  id v28 = [v25 errorWithDomain:*MEMORY[0x1E4F8C500] code:41030 userInfo:v27];

  id v29 = PLBackendGetLog();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    v79 = v69;
    _os_log_impl(&dword_19B3C7000, v29, OS_LOG_TYPE_ERROR, "bindToPhotoLibraryURL failed for well known library %td because client is missing the photos data vault entitlement \"com.apple.private.security.storage.PhotosLibraries\"", buf, 0xCu);
  }

  if (!v28)
  {
LABEL_17:
    if (self->_libraryBundle)
    {
      id v28 = 0;
      goto LABEL_62;
    }
    if (v66)
    {
      uint64_t v30 = [v66 objectForKeyedSubscript:*MEMORY[0x1E4F8C4D8]];
      int v31 = [v30 BOOLValue];

      if (v31) {
        [(PLAssetsdConnectionAuthorization *)self->_connectionAuthorization setClientLimitedLibraryCapable:1];
      }
      v32 = [v66 objectForKeyedSubscript:*MEMORY[0x1E4F8BA88]];
      if (v32) {
        [(PLAssetsdConnectionAuthorization *)self->_connectionAuthorization setClientMainBundleSandboxedURL:v32];
      }
    }
    if (v16)
    {
      if ([(PLAssetsdConnectionAuthorization *)self->_connectionAuthorization photoKitEntitled]
        || [(PLAssetsdConnectionAuthorization *)self->_connectionAuthorization isClientAuthorizedForTCCServicePhotos]|| [(PLAssetsdConnectionAuthorization *)self->_connectionAuthorization isClientAuthorizedForTCCServicePhotosAdd])
      {
        id obj = [(PLPhotoLibraryBundleController *)self->_libraryBundleController openBundleAtLibraryURL:v16];
        id v64 = [obj libraryServicesManager];
        BOOL v33 = [v64 wellKnownPhotoLibraryIdentifier] == 1
           || [(PLAssetsdConnectionAuthorization *)self->_connectionAuthorization isClientEntitledForPhotoKitOrPrivatePhotosTCC];
        if (MEMORY[0x19F38BDA0]())
        {
          if ([(PLAssetsdConnectionAuthorization *)self->_connectionAuthorization photosDataVaultEntitled]|| v33)
          {
            goto LABEL_50;
          }
        }
        else if (v33)
        {
LABEL_50:
          objc_storeStrong((id *)&self->_libraryURL, v16);
          objc_storeStrong((id *)&self->_libraryBundle, obj);
          if (v18)
          {
            v46 = [PLLibraryOpenerCreationOptions alloc];
            v47 = [(PLLibraryOpenerCreationOptions *)v46 initWithWellKnownLibraryIdentifier:v69];
            if (!v47)
            {
              v61 = [MEMORY[0x1E4F28B00] currentHandler];
              [v61 handleFailureInMethod:a2, self, @"PLAssetsdService.m", 829, @"Invalid parameter not satisfying: %@", @"openerCreationOptions != nil" object file lineNumber description];
            }
            [v64 setCreateMode:1 options:v47];
          }
          v48 = [[PLAssetsdXPCUserInfo alloc] initWithLibraryServicesManager:v64];
          id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
          [WeakRetained setUserInfo:v48];

          libraryBundleController = self->_libraryBundleController;
          libraryBundle = self->_libraryBundle;
          id v68 = 0;
          LOBYTE(v48) = [(PLPhotoLibraryBundleController *)libraryBundleController bindAssetsdService:self toBundle:libraryBundle error:&v68];
          id v52 = v68;
          v53 = v52;
          if (v48) {
            id v28 = 0;
          }
          else {
            id v28 = v52;
          }
          if ([v64 wellKnownPhotoLibraryIdentifier] == 1
            && ![(PLAssetsdConnectionAuthorization *)self->_connectionAuthorization isClientEntitledForPhotoKitOrPrivatePhotosTCC])
          {
            v54 = [MEMORY[0x1E4F8B998] sharedInstance];
            [v54 reportPhotosUseWithClientAuthorization:self->_connectionAuthorization];

            v55 = [MEMORY[0x1E4F8B998] sharedInstance];
            [v55 logPhotosAccessWithClientAuthorization:self->_connectionAuthorization];
          }
          goto LABEL_61;
        }
        v40 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v41 = *MEMORY[0x1E4F28588];
        v76[0] = *MEMORY[0x1E4F289D0];
        v76[1] = v41;
        v77[0] = v16;
        v77[1] = @"Library access denied, missing entitlement \"com.apple.private.tcc.allow\" = [ \"TCCServicePhotos\" ]";
        v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v77 forKeys:v76 count:2];
        id v28 = [v40 errorWithDomain:*MEMORY[0x1E4F8C500] code:41009 userInfo:v42];
      }
      else
      {
        v45 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v74 = *MEMORY[0x1E4F28568];
        v75 = @"Unauthorized access: client does not have valid TCC authorization";
        v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v75 forKeys:&v74 count:1];
        id v28 = [v45 errorWithDomain:*MEMORY[0x1E4F8C500] code:41011 userInfo:v42];
        id obj = 0;
        id v64 = 0;
      }

      if (!v28) {
        goto LABEL_50;
      }
LABEL_61:

      goto LABEL_62;
    }
    id obj = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if (v10) {
      [obj setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F289D0]];
    }
    id v64 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
    buf[0] = 0;
    id v34 = [v10 path];
    char v35 = [v64 fileExistsAtPath:v34 isDirectory:buf];

    if (v35)
    {
      uint64_t v36 = [v65 domain];
      uint64_t v37 = *MEMORY[0x1E4F8C500];
      int v38 = [v36 isEqualToString:*MEMORY[0x1E4F8C500]];

      if (v38)
      {
        id v39 = v65;
LABEL_47:
        id v28 = v39;
        goto LABEL_61;
      }
      if (v65) {
        [obj setObject:v65 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
      }
      v43 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v44 = 41014;
    }
    else
    {
      v43 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v37 = *MEMORY[0x1E4F8C500];
      uint64_t v44 = 41015;
    }
    id v39 = [v43 errorWithDomain:v37 code:v44 userInfo:obj];
    goto LABEL_47;
  }
LABEL_62:
  [(PLPhotoLibraryBundle *)self->_libraryBundle touch];
  v11[2](v11, v28);

  if ((_BYTE)v71) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v72 + 8));
  }
  if ((void)v72)
  {
    v56 = PLRequestGetLog();
    v57 = v56;
    os_signpost_id_t v58 = v72;
    if ((unint64_t)(v72 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v56))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v79 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v57, OS_SIGNPOST_INTERVAL_END, v58, "failed to load photo library %{public}s with url %@, %@", "Connection opened for client with PID: %d, bundle ID: %@ at QoS: %{public}@", buf, 0xCu);
    }
  }
}

- (void)getDiagnosticsServiceWithReply:(id)a3
{
  id v5 = a3;
  if (!self->_innerDiagnosticsService)
  {
    v6 = [(PLAssetsdService *)self permissionsForDiagnosticsService];
    int64_t v7 = [(PLAssetsdService *)self requiredStateForDiagnosticsService];
    id v8 = objc_initWeak(&location, self);

    id v9 = objc_alloc(MEMORY[0x1E4F8B948]);
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    v17 = __51__PLAssetsdService_getDiagnosticsServiceWithReply___block_invoke;
    int v18 = &unk_1E5874070;
    objc_copyWeak(&v19, &location);
    id v10 = (void *)[v9 initWithBlock:&v15];
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    int v11 = [PLAssetsdInnerService alloc];
    int v12 = -[PLAssetsdInnerService initWithPermissions:requiredLibraryServicesState:lazyService:](v11, "initWithPermissions:requiredLibraryServicesState:lazyService:", v6, v7, v10, v15, v16, v17, v18);
    innerDiagnosticsService = self->_innerDiagnosticsService;
    self->_innerDiagnosticsService = v12;
  }
  v14 = [(PLAssetsdService *)self serviceContextWithSelector:a2];
  [(PLAssetsdInnerService *)self->_innerDiagnosticsService getInnerServiceWithContext:v14 reply:v5];
}

- (int64_t)requiredStateForDiagnosticsService
{
  return 6;
}

- (void)getResourceAvailabilityServiceWithReply:(id)a3
{
  id v5 = a3;
  if (!self->_innerResourceAvailabilityService)
  {
    v6 = [(PLAssetsdService *)self permissionsForResourceAvailabilityService];
    int64_t v7 = [(PLAssetsdService *)self requiredStateForResourceAvailabilityService];
    id v8 = objc_initWeak(&location, self);

    id v9 = objc_alloc(MEMORY[0x1E4F8B948]);
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    v17 = __60__PLAssetsdService_getResourceAvailabilityServiceWithReply___block_invoke;
    int v18 = &unk_1E5874070;
    objc_copyWeak(&v19, &location);
    id v10 = (void *)[v9 initWithBlock:&v15];
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    int v11 = [PLAssetsdInnerService alloc];
    int v12 = -[PLAssetsdInnerService initWithPermissions:requiredLibraryServicesState:lazyService:](v11, "initWithPermissions:requiredLibraryServicesState:lazyService:", v6, v7, v10, v15, v16, v17, v18);
    innerResourceAvailabilityService = self->_innerResourceAvailabilityService;
    self->_innerResourceAvailabilityService = v12;
  }
  v14 = [(PLAssetsdService *)self serviceContextWithSelector:a2];
  [(PLAssetsdInnerService *)self->_innerResourceAvailabilityService getInnerServiceWithContext:v14 reply:v5];
}

- (int64_t)requiredStateForResourceAvailabilityService
{
  return 6;
}

- (id)permissionsForResourceAvailabilityService
{
  v2 = objc_alloc_init(PLAssetsdServicePermissions);
  [(PLAssetsdServicePermissions *)v2 setAllowsAuthorizationWithPhotoKitEntitlement:1];
  [(PLAssetsdServicePermissions *)v2 setRequiredAuthorization:2];
  [(PLAssetsdServicePermissions *)v2 setRequiredEntitlements:MEMORY[0x1E4F1CBF0]];
  return v2;
}

- (void)getResourceInternalServiceWithReply:(id)a3
{
  id v5 = a3;
  if (!self->_innerResourceInternalService)
  {
    v6 = [(PLAssetsdService *)self permissionsForResourceInternalService];
    int64_t v7 = [(PLAssetsdService *)self requiredStateForResourceInternalService];
    id v8 = objc_initWeak(&location, self);

    id v9 = objc_alloc(MEMORY[0x1E4F8B948]);
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    v17 = __56__PLAssetsdService_getResourceInternalServiceWithReply___block_invoke;
    int v18 = &unk_1E5874070;
    objc_copyWeak(&v19, &location);
    id v10 = (void *)[v9 initWithBlock:&v15];
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    int v11 = [PLAssetsdInnerService alloc];
    int v12 = -[PLAssetsdInnerService initWithPermissions:requiredLibraryServicesState:lazyService:](v11, "initWithPermissions:requiredLibraryServicesState:lazyService:", v6, v7, v10, v15, v16, v17, v18);
    innerResourceInternalService = self->_innerResourceInternalService;
    self->_innerResourceInternalService = v12;
  }
  v14 = [(PLAssetsdService *)self serviceContextWithSelector:a2];
  [(PLAssetsdInnerService *)self->_innerResourceInternalService getInnerServiceWithContext:v14 reply:v5];
}

- (id)serviceContextWithSelector:(SEL)a3
{
  id v5 = [PLDefaultAssetsdServiceContext alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  int64_t v7 = [(PLDefaultAssetsdServiceContext *)v5 initWithSelector:a3 connection:WeakRetained libraryBundle:self->_libraryBundle connectionAuthorization:self->_connectionAuthorization];

  return v7;
}

- (int64_t)requiredStateForResourceInternalService
{
  return 6;
}

- (id)permissionsForResourceInternalService
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = objc_alloc_init(PLAssetsdServicePermissions);
  [(PLAssetsdServicePermissions *)v2 setRequiredAuthorization:0];
  v5[0] = *MEMORY[0x1E4F8BAD8];
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  [(PLAssetsdServicePermissions *)v2 setRequiredEntitlements:v3];

  return v2;
}

- (id)permissionsForDiagnosticsService
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = objc_alloc_init(PLAssetsdServicePermissions);
  [(PLAssetsdServicePermissions *)v2 setRequiredAuthorization:0];
  v5[0] = *MEMORY[0x1E4F8BAB0];
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  [(PLAssetsdServicePermissions *)v2 setRequiredEntitlements:v3];

  return v2;
}

id __56__PLAssetsdService_getResourceInternalServiceWithReply___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained) {
    v3 = (void *)[WeakRetained newResourceInternalService];
  }
  else {
    v3 = 0;
  }

  return v3;
}

- (id)newResourceInternalService
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = [(PLAssetsdService *)self clientDebugDescription];
    int v10 = 138412290;
    int v11 = v4;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEBUG, "Creating new PLAssetsdResourceInternalService for client: %@", (uint8_t *)&v10, 0xCu);
  }
  id v5 = [PLAssetsdResourceInternalService alloc];
  v6 = [(PLAssetsdService *)self libraryServicesManager];
  int64_t v7 = [(PLAssetsdConnectionAuthorization *)self->_connectionAuthorization trustedCallerBundleID];
  id v8 = [(PLAssetsdResourceInternalService *)v5 initWithLibraryServicesManager:v6 trustedCallerBundleID:v7];

  return v8;
}

- (PLLibraryServicesManager)libraryServicesManager
{
  return [(PLPhotoLibraryBundle *)self->_libraryBundle libraryServicesManager];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheMetricsShellObject, 0);
  objc_storeStrong((id *)&self->_libraryURL, 0);
  objc_storeStrong((id *)&self->_resourceDownloader, 0);
  objc_storeStrong((id *)&self->_connectionAuthorization, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_libraryBundle, 0);
  objc_storeStrong((id *)&self->_libraryBundleController, 0);
  objc_destroyWeak((id *)&self->_connection);
  objc_storeStrong((id *)&self->_innerPrivacySupportService, 0);
  objc_storeStrong((id *)&self->_innerNonBindingDebugService, 0);
  objc_storeStrong((id *)&self->_innerDebugService, 0);
  objc_storeStrong((id *)&self->_innerDiagnosticsService, 0);
  objc_storeStrong((id *)&self->_innerDemoService, 0);
  objc_storeStrong((id *)&self->_innerNotificationService, 0);
  objc_storeStrong((id *)&self->_innerSyncService, 0);
  objc_storeStrong((id *)&self->_innerMigrationService, 0);
  objc_storeStrong((id *)&self->_innerCloudInternalService, 0);
  objc_storeStrong((id *)&self->_innerCloudService, 0);
  objc_storeStrong((id *)&self->_innerResourceInternalService, 0);
  objc_storeStrong((id *)&self->_innerResourceWriteOnlyService, 0);
  objc_storeStrong((id *)&self->_innerResourceService, 0);
  objc_storeStrong((id *)&self->_innerResourceAvailabilityService, 0);
  objc_storeStrong((id *)&self->_innerPhotoKitAddService, 0);
  objc_storeStrong((id *)&self->_innerPhotoKitService, 0);
  objc_storeStrong((id *)&self->_innerLibraryManagementService, 0);
  objc_storeStrong((id *)&self->_innerSystemLibraryURLReadOnlyService, 0);
  objc_storeStrong((id *)&self->_innerLibraryInternalService, 0);
  objc_storeStrong((id *)&self->_innerLibraryService, 0);
}

- (PLCacheMetricsCollectorServerShell)cacheMetricsShellObject
{
  return self->_cacheMetricsShellObject;
}

- (NSURL)libraryURL
{
  return self->_libraryURL;
}

- (id)clientDebugDescription
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v4 = PLClientBundleIdentifierFromXPCConnection();

  id v5 = [NSString stringWithFormat:@"PID: %d, bundle ID: %@", self->_remotePID, v4];

  return v5;
}

- (void)invalidateConnectionWithReason:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"PLAssetsdService.m", 1002, @"Invalid parameter not satisfying: %@", @"reason != nil" object file lineNumber description];
  }
  p_connection = &self->_connection;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);

  if (WeakRetained)
  {
    char v8 = PLIsErrorEqualToCode();
    char v9 = PLIsErrorEqualToCode();
    if ((v8 & 1) == 0 && (v9 & 1) == 0)
    {
      id v10 = objc_loadWeakRetained((id *)&self->_connection);
      int v11 = [v10 _unboostingRemoteObjectProxy];

      uint64_t v12 = PLBackendGetLog();
      BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      if (v11)
      {
        if (v13)
        {
          v14 = NSNumber;
          id v15 = objc_loadWeakRetained((id *)&self->_connection);
          uint64_t v16 = objc_msgSend(v14, "numberWithInt:", objc_msgSend(v15, "processIdentifier"));
          *(_DWORD *)buf = 138543362;
          int v23 = v16;
          _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "Sending libraryBecameUnavailable to PID %{public}@", buf, 0xCu);
        }
        uint64_t v12 = [(PLAssetsdService *)self libraryURL];
        [v11 libraryBecameUnavailable:v12 reason:v5];
      }
      else if (v13)
      {
        v17 = NSNumber;
        id v18 = objc_loadWeakRetained((id *)p_connection);
        id v19 = objc_msgSend(v17, "numberWithInt:", objc_msgSend(v18, "processIdentifier"));
        *(_DWORD *)buf = 138543362;
        int v23 = v19;
        _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "No remoteObjectProxy for client PID %{public}@", buf, 0xCu);
      }
    }
    id v20 = objc_loadWeakRetained((id *)p_connection);
    [v20 invalidate];

    objc_storeWeak((id *)p_connection, 0);
  }
}

- (BOOL)_prepareToRunDaemonJob:(id)a3 error:(id *)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v19[1] = (id)MEMORY[0x1E4F143A8];
  v19[2] = (id)3221225472;
  v19[3] = __49__PLAssetsdService__prepareToRunDaemonJob_error___block_invoke;
  v19[4] = &unk_1E5873348;
  v19[5] = self;
  v19[6] = (id)a2;
  pl_dispatch_once();
  if ([v7 daemonOperation] == 13 || objc_msgSend(v7, "daemonOperation") == 16)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    [v7 setClientConnection:WeakRetained];
  }
  if (!self->_readyForDaemonJobs)
  {
    id v10 = [(PLAssetsdService *)self libraryServicesManager];
    int v11 = v10;
    if (v10)
    {
      v19[0] = 0;
      char v12 = [v10 awaitLibraryState:6 error:v19];
      id v13 = v19[0];
      v14 = v13;
      if (v12)
      {
        self->_BOOL readyForDaemonJobs = 1;
LABEL_14:

        goto LABEL_15;
      }
      if (!a4) {
        goto LABEL_14;
      }
      id v17 = v13;
      v14 = v17;
    }
    else
    {
      if (!a4)
      {
LABEL_15:

        BOOL readyForDaemonJobs = self->_readyForDaemonJobs;
        goto LABEL_16;
      }
      id v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = *MEMORY[0x1E4F8C500];
      uint64_t v20 = *MEMORY[0x1E4F28568];
      v21[0] = @"No library services manager";
      v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
      id v17 = [v15 errorWithDomain:v16 code:41012 userInfo:v14];
    }
    *a4 = v17;
    goto LABEL_14;
  }
  BOOL readyForDaemonJobs = 1;
LABEL_16:

  return readyForDaemonJobs;
}

void __49__PLAssetsdService__prepareToRunDaemonJob_error___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) libraryServicesManager];
  v3 = [v2 modelMigrator];
  v4 = [v3 pathManager];
  id v5 = +[PLCloudSharingJob recoveredEventsWithPathManager:v4];

  if ([v5 count])
  {
    v6 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v7 = *MEMORY[0x1E4F8C9A0];
    [v6 setObject:*MEMORY[0x1E4F8C9A0] forKey:*MEMORY[0x1E4F8C970]];
    [v6 setObject:v5 forKey:@"kPLImageWriterDaemonJobRecoveredEventsKey"];
    char v8 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      char v9 = NSStringFromSelector(*(SEL *)(a1 + 40));
      int v12 = 138412802;
      id v13 = v9;
      __int16 v14 = 2112;
      uint64_t v15 = v7;
      __int16 v16 = 1024;
      int v17 = [v5 count];
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "[%@] enqueing job %@ with %d recovered events", (uint8_t *)&v12, 0x1Cu);
    }
    id v10 = [*(id *)(a1 + 32) libraryServicesManager];
    int v11 = [v10 imageWriter];
    [v11 enqueueJob:v6];
  }
}

- (void)collectCacheMetrics
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = [(PLAssetsdService *)self cacheMetricsShellObject];
  v4 = [v3 cacheMetricsCollectorServer];

  if (v4)
  {
    id v5 = [(PLAssetsdService *)self libraryServicesManager];
    uint64_t v6 = [v5 resourceCacheMetrics];
    uint64_t v8 = v7;
    char v9 = [(PLAssetsdService *)self cacheMetricsShellObject];
    id v10 = [v9 cacheMetricsCollectorServer];
    uint64_t v11 = [v10 getSharedImageRequestCacheMetrics];
    uint64_t v12 = (v11 + v6);
    uint64_t v14 = (v13 + v8);
    unint64_t v15 = v13 + (v8 & 0xFFFFFFFF00000000);
    unint64_t v16 = v11 + (v6 & 0xFFFFFFFF00000000);

    objc_msgSend(v5, "setResourceCacheMetrics:", v16 & 0xFFFFFFFF00000000 | v12, v14 | v15 & 0xFFFFFFFF00000000);
    int v17 = PLCacheMetricsCollectorGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      int v18 = 134218752;
      uint64_t v19 = v12;
      __int16 v20 = 2048;
      unint64_t v21 = HIDWORD(v16);
      __int16 v22 = 2048;
      uint64_t v23 = v14;
      __int16 v24 = 2048;
      unint64_t v25 = HIDWORD(v15);
      _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEBUG, "CacheMetrics Aggregation done, current data is: [%ld, %ld, %ld, %ld]", (uint8_t *)&v18, 0x2Au);
    }
  }
}

- (void)bindToPhotoLibraryURL:(id)a3 sandboxExtension:(id)a4 withReply:(id)a5
{
}

- (id)_waitForLibraryServicesForDaemonJob
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v2 = [(PLAssetsdService *)self libraryServicesManager];
  if (v2)
  {
    v3 = 0;
  }
  else
  {
    v4 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v5 = *MEMORY[0x1E4F8C500];
    uint64_t v8 = *MEMORY[0x1E4F28568];
    v9[0] = @"No library services manager";
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    v3 = [v4 errorWithDomain:v5 code:41012 userInfo:v6];
  }
  return v3;
}

- (void)runDaemonJob:(id)a3 isSerial:(BOOL)a4 withReply:(id)a5
{
  BOOL v6 = a4;
  *(void *)&v35[5] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  char v9 = (void (**)(id, NSObject *, void))a5;
  +[PLFileDescriptorFuse checkFileDescriptorFuse];
  long long v32 = 0u;
  *(_OWORD *)sel = 0u;
  long long v31 = 0u;
  int v10 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v31) = v10;
  if (v10)
  {
    uint64_t v11 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: runDaemonJob:isSerial:withReply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    uint64_t v12 = (void *)*((void *)&v31 + 1);
    *((void *)&v31 + 1) = v11;

    os_activity_scope_enter(v11, (os_activity_scope_state_t)((char *)&v32 + 8));
  }
  uint64_t v13 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)char v35 = v8;
    _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEFAULT, "runDaemonJob:isSerial:withReply: with job %@", buf, 0xCu);
  }

  id v30 = 0;
  BOOL v14 = [(PLAssetsdService *)self _prepareToRunDaemonJob:v8 error:&v30];
  id v15 = v30;
  if (v14)
  {
    if (v9) {
      [v8 setReplyHandler:v9];
    }
    if (v6)
    {
      unint64_t v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [v16 setObject:*MEMORY[0x1E4F8C9F8] forKey:*MEMORY[0x1E4F8C970]];
      [v16 setObject:v8 forKey:@"kPLImageWriterDaemonJobEventKey"];
      if ([(PLAssetsdConnectionAuthorization *)self->_connectionAuthorization isClientInLimitedLibraryMode])
      {
        [v16 setObject:MEMORY[0x1E4F1CC38] forKey:@"job.private.ClientInLimitedLibraryMode"];
        int v17 = [(PLAssetsdConnectionAuthorization *)self->_connectionAuthorization trustedCallerBundleID];
        if ([v17 length])
        {
          int v18 = PLGatekeeperXPCGetLog();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            int v19 = [(PLAssetsdConnectionAuthorization *)self->_connectionAuthorization clientProcessIdentifier];
            *(_DWORD *)buf = 67109378;
            v35[0] = v19;
            LOWORD(v35[1]) = 2112;
            *(void *)((char *)&v35[1] + 2) = v17;
            _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEFAULT, "Running job for limited library client (%d) %@", buf, 0x12u);
          }

          [v16 setObject:v17 forKey:@"job.private.LimitedLibraryClientFetchFilterIdentifier"];
          [v16 setObject:self->_connectionAuthorization forKey:@"job.private.LimitedLibraryClientAuthorization"];
        }
        else
        {
          unint64_t v21 = PLGatekeeperXPCGetLog();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            int v22 = [(PLAssetsdConnectionAuthorization *)self->_connectionAuthorization clientProcessIdentifier];
            *(_DWORD *)buf = 67109120;
            v35[0] = v22;
            _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_DEFAULT, "Running job for limited library client %d without client identifier", buf, 8u);
          }
        }
      }
      uint64_t v23 = [(PLAssetsdService *)self libraryServicesManager];
      __int16 v24 = [v23 imageWriter];
      [v24 enqueueJob:v16];
    }
    else
    {
      __int16 v20 = dispatch_get_global_queue(0, 0);
      id v29 = v8;
      pl_dispatch_async();

      unint64_t v16 = v29;
    }
  }
  else if (v9)
  {
    unint64_t v16 = [(PLAssetsdService *)self _waitForLibraryServicesForDaemonJob];
    v9[2](v9, v16, 0);
  }
  else
  {
    unint64_t v16 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)char v35 = v15;
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "Failed in prepare to run daemon job: %@", buf, 0xCu);
    }
  }

  if ((_BYTE)v31) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v32 + 8));
  }
  if ((void)v32)
  {
    unint64_t v25 = PLRequestGetLog();
    uint64_t v26 = v25;
    os_signpost_id_t v27 = v32;
    if ((unint64_t)(v32 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      *(void *)char v35 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v26, OS_SIGNPOST_INTERVAL_END, v27, "failed to load photo library %{public}s with url %@, %@", "Connection opened for client with PID: %d, bundle ID: %@ at QoS: %{public}@", buf, 0xCu);
    }
  }
}

uint64_t __52__PLAssetsdService_runDaemonJob_isSerial_withReply___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) runDaemonSide];
}

- (void)runDaemonJob:(id)a3 isSerial:(BOOL)a4
{
}

- (void)photoLibraryDeletedAtURL:(id)a3 reply:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  char v9 = [WeakRetained valueForEntitlement:@"com.apple.private.photos.library.deleted"];

  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && ([v9 BOOLValue])
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __51__PLAssetsdService_photoLibraryDeletedAtURL_reply___block_invoke;
    v14[3] = &unk_1E5874950;
    id v15 = v6;
    id v16 = v7;
    +[PLSpotlightDonationManager handleDeletionForPhotoLibraryWithURL:v15 completion:v14];

    int v10 = v15;
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F8C500];
    uint64_t v17 = *MEMORY[0x1E4F28228];
    v18[0] = @"Missing entitlement for photoLibraryDeletedAtURL";
    int v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    uint64_t v13 = [v11 errorWithDomain:v12 code:46104 userInfo:v10];
    (*((void (**)(id, void *))v7 + 2))(v7, v13);
  }
}

void __51__PLAssetsdService_photoLibraryDeletedAtURL_reply___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = PLBackendGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138412546;
      uint64_t v9 = v7;
      __int16 v10 = 2112;
      id v11 = v5;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "Failed to handle deletion for photoLibrary with URL: %@, %@", (uint8_t *)&v8, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)newNonBindingDebugService
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = [(PLAssetsdService *)self clientDebugDescription];
    int v6 = 138412290;
    uint64_t v7 = v4;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEBUG, "Creating new PLAssetsdNonBindingDebugService for client: %@", (uint8_t *)&v6, 0xCu);
  }
  return [[PLAssetsdNonBindingDebugService alloc] initWithConnectionAuthorization:self->_connectionAuthorization bundleController:self->_libraryBundleController];
}

- (id)permissionsForNonBindingDebugService
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = objc_alloc_init(PLAssetsdServicePermissions);
  [(PLAssetsdServicePermissions *)v2 setRequiredAuthorization:0];
  v5[0] = *MEMORY[0x1E4F8BAA0];
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  [(PLAssetsdServicePermissions *)v2 setRequiredEntitlements:v3];

  return v2;
}

- (int64_t)requiredStateForNonBindingDebugService
{
  return 0;
}

- (id)newDebugService
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = [(PLAssetsdService *)self clientDebugDescription];
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEBUG, "Creating new PLAssetsdDebugService for client: %@", (uint8_t *)&v10, 0xCu);
  }
  id v5 = [PLAssetsdDebugService alloc];
  int v6 = [(PLAssetsdService *)self libraryServicesManager];
  uint64_t v7 = [(PLAssetsdService *)self resourceDownloader];
  uint64_t v8 = [(PLAssetsdDebugService *)v5 initWithLibraryServicesManager:v6 resourceDownloader:v7 bundleController:self->_libraryBundleController connectionAuthorization:self->_connectionAuthorization];

  return v8;
}

- (id)permissionsForDebugService
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = objc_alloc_init(PLAssetsdServicePermissions);
  [(PLAssetsdServicePermissions *)v2 setRequiredAuthorization:0];
  v5[0] = *MEMORY[0x1E4F8BAA0];
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  [(PLAssetsdServicePermissions *)v2 setRequiredEntitlements:v3];

  return v2;
}

- (int64_t)requiredStateForDebugService
{
  return 6;
}

- (id)newDiagnosticsService
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = [(PLAssetsdService *)self clientDebugDescription];
    int v9 = 138412290;
    int v10 = v4;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEBUG, "Creating new PLAssetsdDiagnosticsService for client: %@", (uint8_t *)&v9, 0xCu);
  }
  id v5 = [PLAssetsdDiagnosticsService alloc];
  int v6 = [(PLAssetsdService *)self libraryServicesManager];
  uint64_t v7 = [(PLAbstractLibraryServicesManagerService *)v5 initWithLibraryServicesManager:v6];

  return v7;
}

- (id)newDemoService
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = [(PLAssetsdService *)self clientDebugDescription];
    int v6 = 138412290;
    uint64_t v7 = v4;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEBUG, "Creating new PLAssetsdDemoService for client: %@", (uint8_t *)&v6, 0xCu);
  }
  return [[PLAssetsdDemoService alloc] initWithConnectionAuthorization:self->_connectionAuthorization];
}

- (id)permissionsForDemoService
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = objc_alloc_init(PLAssetsdServicePermissions);
  [(PLAssetsdServicePermissions *)v2 setRequiredAuthorization:0];
  v5[0] = *MEMORY[0x1E4F8BAA8];
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  [(PLAssetsdServicePermissions *)v2 setRequiredEntitlements:v3];

  return v2;
}

- (int64_t)requiredStateForDemoService
{
  return 0;
}

- (id)newNotificationService
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = [(PLAssetsdService *)self clientDebugDescription];
    int v9 = 138412290;
    int v10 = v4;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEBUG, "Creating new PLAssetsdNotificationService for client: %@", (uint8_t *)&v9, 0xCu);
  }
  id v5 = [PLAssetsdNotificationService alloc];
  int v6 = [(PLAssetsdService *)self libraryServicesManager];
  uint64_t v7 = [(PLAbstractLibraryServicesManagerService *)v5 initWithLibraryServicesManager:v6];

  return v7;
}

- (id)permissionsForNotificationService
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = objc_alloc_init(PLAssetsdServicePermissions);
  [(PLAssetsdServicePermissions *)v2 setRequiredAuthorization:0];
  v5[0] = *MEMORY[0x1E4F8BAD0];
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  [(PLAssetsdServicePermissions *)v2 setRequiredEntitlements:v3];

  return v2;
}

- (int64_t)requiredStateForNotificationService
{
  return 6;
}

- (id)newSyncService
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = [(PLAssetsdService *)self clientDebugDescription];
    int v9 = 138412290;
    int v10 = v4;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEBUG, "Creating new PLAssetsdSyncService for client: %@", (uint8_t *)&v9, 0xCu);
  }
  id v5 = [PLAssetsdSyncService alloc];
  int v6 = [(PLAssetsdService *)self libraryServicesManager];
  uint64_t v7 = [(PLAssetsdSyncService *)v5 initWithLibraryServicesManager:v6];

  return v7;
}

- (id)permissionsForSyncService
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = objc_alloc_init(PLAssetsdServicePermissions);
  [(PLAssetsdServicePermissions *)v2 setRequiredAuthorization:0];
  v5[0] = *MEMORY[0x1E4F8BAE8];
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  [(PLAssetsdServicePermissions *)v2 setRequiredEntitlements:v3];

  return v2;
}

- (int64_t)requiredStateForSyncService
{
  return 6;
}

- (id)newMigrationService
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = [(PLAssetsdService *)self clientDebugDescription];
    int v9 = 138412290;
    int v10 = v4;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEBUG, "Creating new PLAssetsdMigrationService for client: %@", (uint8_t *)&v9, 0xCu);
  }
  id v5 = [PLAssetsdMigrationService alloc];
  int v6 = [(PLAssetsdService *)self libraryServicesManager];
  uint64_t v7 = [(PLAssetsdMigrationService *)v5 initWithLibraryServicesManager:v6];

  return v7;
}

- (id)permissionsForMigrationService
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = objc_alloc_init(PLAssetsdServicePermissions);
  [(PLAssetsdServicePermissions *)v2 setRequiredAuthorization:0];
  v5[0] = *MEMORY[0x1E4F8BAC8];
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  [(PLAssetsdServicePermissions *)v2 setRequiredEntitlements:v3];

  return v2;
}

- (int64_t)requiredStateForMigrationService
{
  return 1;
}

- (id)newCloudInternalService
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = [(PLAssetsdService *)self clientDebugDescription];
    int v9 = 138412290;
    int v10 = v4;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEBUG, "Creating new PLAssetsdCloudInternalService for client: %@", (uint8_t *)&v9, 0xCu);
  }
  id v5 = [PLAssetsdCloudInternalService alloc];
  int v6 = [(PLAssetsdService *)self libraryServicesManager];
  uint64_t v7 = [(PLAssetsdCloudInternalService *)v5 initWithLibraryServicesManager:v6 connectionAuthorization:self->_connectionAuthorization];

  return v7;
}

- (id)permissionsForCloudInternalService
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = objc_alloc_init(PLAssetsdServicePermissions);
  [(PLAssetsdServicePermissions *)v2 setRequiredAuthorization:0];
  v5[0] = *MEMORY[0x1E4F8BA98];
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  [(PLAssetsdServicePermissions *)v2 setRequiredEntitlements:v3];

  return v2;
}

- (int64_t)requiredStateForCloudInternalService
{
  return 6;
}

- (id)newCloudService
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = [(PLAssetsdService *)self clientDebugDescription];
    *(_DWORD *)buf = 138412290;
    id v15 = v4;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEBUG, "Creating new PLAssetsdCloudService for client: %@", buf, 0xCu);
  }
  id v5 = objc_initWeak((id *)buf, self);

  id v6 = objc_alloc(MEMORY[0x1E4F8B948]);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __35__PLAssetsdService_newCloudService__block_invoke;
  v12[3] = &unk_1E5874070;
  objc_copyWeak(&v13, (id *)buf);
  uint64_t v7 = (void *)[v6 initWithBlock:v12];
  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
  uint64_t v8 = [PLAssetsdCloudService alloc];
  int v9 = [(PLAssetsdService *)self libraryServicesManager];
  int v10 = [(PLAssetsdCloudService *)v8 initWithLibraryServicesManager:v9 lazyResourceDownloader:v7];

  return v10;
}

id __35__PLAssetsdService_newCloudService__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = [WeakRetained resourceDownloader];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)permissionsForCloudService
{
  v2 = objc_alloc_init(PLAssetsdServicePermissions);
  [(PLAssetsdServicePermissions *)v2 setRequiredAuthorization:1];
  [(PLAssetsdServicePermissions *)v2 setRequiredEntitlements:MEMORY[0x1E4F1CBF0]];
  return v2;
}

- (int64_t)requiredStateForCloudService
{
  return 6;
}

- (id)newResourceWriteOnlyService
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = [(PLAssetsdService *)self clientDebugDescription];
    int v9 = 138412290;
    int v10 = v4;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEBUG, "Creating new newResourceWriteOnlyService for client: %@", (uint8_t *)&v9, 0xCu);
  }
  id v5 = [PLAssetsdResourceWriteOnlyService alloc];
  id v6 = [(PLAssetsdService *)self libraryServicesManager];
  uint64_t v7 = [(PLAssetsdResourceWriteOnlyService *)v5 initWithLibraryServicesManager:v6 connectionAuthorization:self->_connectionAuthorization];

  return v7;
}

- (id)permissionsForResourceWriteOnlyService
{
  v2 = objc_alloc_init(PLAssetsdServicePermissions);
  [(PLAssetsdServicePermissions *)v2 setRequiredAuthorization:2];
  [(PLAssetsdServicePermissions *)v2 setRequiredEntitlements:MEMORY[0x1E4F1CBF0]];
  return v2;
}

- (int64_t)requiredStateForResourceWriteOnlyService
{
  return 6;
}

- (id)newResourceService
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = [(PLAssetsdService *)self clientDebugDescription];
    int v11 = 138412290;
    uint64_t v12 = v4;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEBUG, "Creating new PLAssetsdResourceService for client: %@", (uint8_t *)&v11, 0xCu);
  }
  id v5 = [PLAssetsdResourceService alloc];
  id v6 = [(PLAssetsdService *)self libraryServicesManager];
  connectionAuthorization = self->_connectionAuthorization;
  uint64_t v8 = [(PLAssetsdService *)self resourceDownloader];
  int v9 = [(PLAssetsdResourceService *)v5 initWithLibraryServicesManager:v6 connectionAuthorization:connectionAuthorization resourceDownloader:v8];

  return v9;
}

- (id)permissionsForResourceService
{
  v2 = objc_alloc_init(PLAssetsdServicePermissions);
  [(PLAssetsdServicePermissions *)v2 setRequiredAuthorization:1];
  [(PLAssetsdServicePermissions *)v2 setRequiredEntitlements:MEMORY[0x1E4F1CBF0]];
  return v2;
}

- (int64_t)requiredStateForResourceService
{
  return 6;
}

- (id)newResourceAvailabilityService
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = [(PLAssetsdService *)self clientDebugDescription];
    int v14 = 138412290;
    id v15 = v5;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEBUG, "Creating new PLAssetsdResourceAvailabilityService for client: %@", (uint8_t *)&v14, 0xCu);
  }
  id v6 = NSClassFromString(&cfstr_Plassetsdresou_13.isa);
  if (!v6)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"PLAssetsdService.m" lineNumber:397 description:@"no PLAssetsdResourceAvailabilityService class found"];
  }
  id v7 = [v6 alloc];
  uint64_t v8 = [(PLAssetsdService *)self libraryServicesManager];
  int v9 = [(PLAssetsdService *)self cacheMetricsShellObject];
  int v10 = [(PLAssetsdConnectionAuthorization *)self->_connectionAuthorization trustedCallerBundleID];
  int v11 = (void *)[v7 initWithLibraryServicesManager:v8 shellObject:v9 trustedCallerBundleID:v10 clientPid:self->_remotePID];

  return v11;
}

- (id)newPhotoKitAddService
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = [(PLAssetsdService *)self clientDebugDescription];
    int v9 = 138412290;
    int v10 = v4;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEBUG, "Creating new PLAssetsdPhotoKitAddService for client: %@", (uint8_t *)&v9, 0xCu);
  }
  id v5 = [PLAssetsdPhotoKitAddService alloc];
  id v6 = [(PLAssetsdService *)self libraryServicesManager];
  id v7 = [(PLAssetsdPhotoKitAddService *)v5 initWithLibraryServicesManager:v6 connectionAuthorization:self->_connectionAuthorization];

  return v7;
}

- (id)permissionsForPhotoKitAddService
{
  v2 = objc_alloc_init(PLAssetsdServicePermissions);
  [(PLAssetsdServicePermissions *)v2 setAllowsAuthorizationWithPhotoKitEntitlement:1];
  [(PLAssetsdServicePermissions *)v2 setRequiredAuthorization:2];
  [(PLAssetsdServicePermissions *)v2 setRequiredEntitlements:MEMORY[0x1E4F1CBF0]];
  return v2;
}

- (int64_t)requiredStateForPhotoKitAddService
{
  return 6;
}

- (id)newPhotoKitService
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = [(PLAssetsdService *)self clientDebugDescription];
    int v9 = 138412290;
    int v10 = v4;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEBUG, "Creating new PLAssetsdPhotoKitService for client: %@", (uint8_t *)&v9, 0xCu);
  }
  id v5 = [PLAssetsdPhotoKitService alloc];
  id v6 = [(PLAssetsdService *)self libraryServicesManager];
  id v7 = [(PLAssetsdPhotoKitService *)v5 initWithLibraryServicesManager:v6 connectionAuthorization:self->_connectionAuthorization];

  return v7;
}

- (id)permissionsForPhotoKitService
{
  v2 = objc_alloc_init(PLAssetsdServicePermissions);
  [(PLAssetsdServicePermissions *)v2 setAllowsAuthorizationWithPhotoKitEntitlement:1];
  [(PLAssetsdServicePermissions *)v2 setRequiredAuthorization:1];
  [(PLAssetsdServicePermissions *)v2 setRequiredEntitlements:MEMORY[0x1E4F1CBF0]];
  return v2;
}

- (int64_t)requiredStateForPhotoKitService
{
  return 6;
}

- (id)newLibraryManagementService
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = [(PLAssetsdService *)self clientDebugDescription];
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEBUG, "Creating new PLAssetsdLibraryManagementService for client: %@", (uint8_t *)&v6, 0xCu);
  }
  return [[PLAssetsdLibraryManagementService alloc] initWithConnectionAuthorization:self->_connectionAuthorization bundleController:self->_libraryBundleController];
}

- (id)permissionsForLibraryManagementService
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = objc_alloc_init(PLAssetsdServicePermissions);
  [(PLAssetsdServicePermissions *)v2 setRequiredAuthorization:1];
  v5[0] = *MEMORY[0x1E4F8BAC0];
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  [(PLAssetsdServicePermissions *)v2 setRequiredEntitlements:v3];

  return v2;
}

- (int64_t)requiredStateForLibraryManagementService
{
  return 0;
}

- (id)newPrivacySupportService
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = [(PLAssetsdService *)self clientDebugDescription];
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEBUG, "Creating new PLAssetsdPrivacySupportService for client: %@", (uint8_t *)&v6, 0xCu);
  }
  return [[PLAssetsdPrivacySupportService alloc] initWithConnectionAuthorization:self->_connectionAuthorization];
}

- (id)permissionsForPrivacySupportService
{
  v2 = objc_alloc_init(PLAssetsdServicePermissions);
  [(PLAssetsdServicePermissions *)v2 setRequiredAuthorization:0];
  [(PLAssetsdServicePermissions *)v2 setRequiredEntitlements:MEMORY[0x1E4F1CBF0]];
  return v2;
}

- (int64_t)requiredStateForPrivacySupportService
{
  return 0;
}

- (id)newSystemLibraryURLReadOnlyService
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = [(PLAssetsdService *)self clientDebugDescription];
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEBUG, "Creating new PLAssetsdSystemLibraryURLReadOnlyService for client: %@", (uint8_t *)&v6, 0xCu);
  }
  return [[PLAssetsdSystemLibraryURLReadOnlyService alloc] initWithConnectionAuthorization:self->_connectionAuthorization];
}

- (id)permissionsForSystemLibraryURLReadOnlyService
{
  v2 = objc_alloc_init(PLAssetsdServicePermissions);
  [(PLAssetsdServicePermissions *)v2 setRequiredAuthorization:0];
  [(PLAssetsdServicePermissions *)v2 setRequiredEntitlements:MEMORY[0x1E4F1CBF0]];
  return v2;
}

- (int64_t)requiredStateForSystemLibraryURLReadOnlyService
{
  return 0;
}

- (id)newLibraryInternalService
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = [(PLAssetsdService *)self clientDebugDescription];
    int v9 = 138412290;
    int v10 = v4;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEBUG, "Creating new PLAssetsdLibraryInternalService for client: %@", (uint8_t *)&v9, 0xCu);
  }
  id v5 = [PLAssetsdLibraryInternalService alloc];
  int v6 = [(PLAssetsdService *)self libraryServicesManager];
  id v7 = [(PLAssetsdLibraryInternalService *)v5 initWithLibraryServicesManager:v6 connectionAuthorization:self->_connectionAuthorization];

  return v7;
}

- (id)permissionsForLibraryInternalService
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = objc_alloc_init(PLAssetsdServicePermissions);
  [(PLAssetsdServicePermissions *)v2 setRequiredAuthorization:1];
  v5[0] = *MEMORY[0x1E4F8BAB8];
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  [(PLAssetsdServicePermissions *)v2 setRequiredEntitlements:v3];

  return v2;
}

- (int64_t)requiredStateForLibraryInternalService
{
  return 6;
}

- (id)newLibraryService
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = [(PLAssetsdService *)self clientDebugDescription];
    int v9 = 138412290;
    int v10 = v4;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEBUG, "Creating new PLAssetsdLibraryService for client: %@", (uint8_t *)&v9, 0xCu);
  }
  id v5 = [PLAssetsdLibraryService alloc];
  int v6 = [(PLAssetsdService *)self libraryServicesManager];
  id v7 = [(PLAssetsdLibraryService *)v5 initWithLibraryServicesManager:v6 bundleController:self->_libraryBundleController connectionAuthorization:self->_connectionAuthorization assetsdService:self];

  return v7;
}

- (id)permissionsForLibraryService
{
  v2 = objc_alloc_init(PLAssetsdServicePermissions);
  [(PLAssetsdServicePermissions *)v2 setRequiredAuthorization:1];
  [(PLAssetsdServicePermissions *)v2 setRequiredEntitlements:MEMORY[0x1E4F1CBF0]];
  return v2;
}

- (int64_t)requiredStateForLibraryService
{
  return +[PLAssetsdLibraryService requiredLibraryServicesStateForURL:self->_libraryURL];
}

- (void)getPrivacySupportServiceWithReply:(id)a3
{
  id v5 = a3;
  if (!self->_innerPrivacySupportService)
  {
    int v6 = [(PLAssetsdService *)self permissionsForPrivacySupportService];
    int64_t v7 = [(PLAssetsdService *)self requiredStateForPrivacySupportService];
    id v8 = objc_initWeak(&location, self);

    id v9 = objc_alloc(MEMORY[0x1E4F8B948]);
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    uint64_t v17 = __54__PLAssetsdService_getPrivacySupportServiceWithReply___block_invoke;
    int v18 = &unk_1E5874070;
    objc_copyWeak(&v19, &location);
    int v10 = (void *)[v9 initWithBlock:&v15];
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    uint64_t v11 = [PLAssetsdInnerService alloc];
    uint64_t v12 = -[PLAssetsdInnerService initWithPermissions:requiredLibraryServicesState:lazyService:](v11, "initWithPermissions:requiredLibraryServicesState:lazyService:", v6, v7, v10, v15, v16, v17, v18);
    innerPrivacySupportService = self->_innerPrivacySupportService;
    self->_innerPrivacySupportService = v12;
  }
  int v14 = [(PLAssetsdService *)self serviceContextWithSelector:a2];
  [(PLAssetsdInnerService *)self->_innerPrivacySupportService getInnerServiceWithContext:v14 reply:v5];
}

id __54__PLAssetsdService_getPrivacySupportServiceWithReply___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained) {
    v3 = (void *)[WeakRetained newPrivacySupportService];
  }
  else {
    v3 = 0;
  }

  return v3;
}

- (void)getNonBindingDebugServiceWithReply:(id)a3
{
  id v5 = a3;
  if (!self->_innerNonBindingDebugService)
  {
    int v6 = [(PLAssetsdService *)self permissionsForNonBindingDebugService];
    int64_t v7 = [(PLAssetsdService *)self requiredStateForNonBindingDebugService];
    id v8 = objc_initWeak(&location, self);

    id v9 = objc_alloc(MEMORY[0x1E4F8B948]);
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    uint64_t v17 = __55__PLAssetsdService_getNonBindingDebugServiceWithReply___block_invoke;
    int v18 = &unk_1E5874070;
    objc_copyWeak(&v19, &location);
    int v10 = (void *)[v9 initWithBlock:&v15];
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    uint64_t v11 = [PLAssetsdInnerService alloc];
    uint64_t v12 = -[PLAssetsdInnerService initWithPermissions:requiredLibraryServicesState:lazyService:](v11, "initWithPermissions:requiredLibraryServicesState:lazyService:", v6, v7, v10, v15, v16, v17, v18);
    innerNonBindingDebugService = self->_innerNonBindingDebugService;
    self->_innerNonBindingDebugService = v12;
  }
  int v14 = [(PLAssetsdService *)self serviceContextWithSelector:a2];
  [(PLAssetsdInnerService *)self->_innerNonBindingDebugService getInnerServiceWithContext:v14 reply:v5];
}

id __55__PLAssetsdService_getNonBindingDebugServiceWithReply___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained) {
    v3 = (void *)[WeakRetained newNonBindingDebugService];
  }
  else {
    v3 = 0;
  }

  return v3;
}

- (void)getDebugServiceWithReply:(id)a3
{
  id v5 = a3;
  if (!self->_innerDebugService)
  {
    int v6 = [(PLAssetsdService *)self permissionsForDebugService];
    int64_t v7 = [(PLAssetsdService *)self requiredStateForDebugService];
    id v8 = objc_initWeak(&location, self);

    id v9 = objc_alloc(MEMORY[0x1E4F8B948]);
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    uint64_t v17 = __45__PLAssetsdService_getDebugServiceWithReply___block_invoke;
    int v18 = &unk_1E5874070;
    objc_copyWeak(&v19, &location);
    int v10 = (void *)[v9 initWithBlock:&v15];
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    uint64_t v11 = [PLAssetsdInnerService alloc];
    uint64_t v12 = -[PLAssetsdInnerService initWithPermissions:requiredLibraryServicesState:lazyService:](v11, "initWithPermissions:requiredLibraryServicesState:lazyService:", v6, v7, v10, v15, v16, v17, v18);
    innerDebugService = self->_innerDebugService;
    self->_innerDebugService = v12;
  }
  int v14 = [(PLAssetsdService *)self serviceContextWithSelector:a2];
  [(PLAssetsdInnerService *)self->_innerDebugService getInnerServiceWithContext:v14 reply:v5];
}

id __45__PLAssetsdService_getDebugServiceWithReply___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained) {
    v3 = (void *)[WeakRetained newDebugService];
  }
  else {
    v3 = 0;
  }

  return v3;
}

id __51__PLAssetsdService_getDiagnosticsServiceWithReply___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained) {
    v3 = (void *)[WeakRetained newDiagnosticsService];
  }
  else {
    v3 = 0;
  }

  return v3;
}

- (void)getDemoServiceWithReply:(id)a3
{
  id v5 = a3;
  if (!self->_innerDemoService)
  {
    int v6 = [(PLAssetsdService *)self permissionsForDemoService];
    int64_t v7 = [(PLAssetsdService *)self requiredStateForDemoService];
    id v8 = objc_initWeak(&location, self);

    id v9 = objc_alloc(MEMORY[0x1E4F8B948]);
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    uint64_t v17 = __44__PLAssetsdService_getDemoServiceWithReply___block_invoke;
    int v18 = &unk_1E5874070;
    objc_copyWeak(&v19, &location);
    int v10 = (void *)[v9 initWithBlock:&v15];
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    uint64_t v11 = [PLAssetsdInnerService alloc];
    uint64_t v12 = -[PLAssetsdInnerService initWithPermissions:requiredLibraryServicesState:lazyService:](v11, "initWithPermissions:requiredLibraryServicesState:lazyService:", v6, v7, v10, v15, v16, v17, v18);
    innerDemoService = self->_innerDemoService;
    self->_innerDemoService = v12;
  }
  int v14 = [(PLAssetsdService *)self serviceContextWithSelector:a2];
  [(PLAssetsdInnerService *)self->_innerDemoService getInnerServiceWithContext:v14 reply:v5];
}

id __44__PLAssetsdService_getDemoServiceWithReply___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained) {
    v3 = (void *)[WeakRetained newDemoService];
  }
  else {
    v3 = 0;
  }

  return v3;
}

- (void)getNotificationServiceWithReply:(id)a3
{
  id v5 = a3;
  if (!self->_innerNotificationService)
  {
    int v6 = [(PLAssetsdService *)self permissionsForNotificationService];
    int64_t v7 = [(PLAssetsdService *)self requiredStateForNotificationService];
    id v8 = objc_initWeak(&location, self);

    id v9 = objc_alloc(MEMORY[0x1E4F8B948]);
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    uint64_t v17 = __52__PLAssetsdService_getNotificationServiceWithReply___block_invoke;
    int v18 = &unk_1E5874070;
    objc_copyWeak(&v19, &location);
    int v10 = (void *)[v9 initWithBlock:&v15];
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    uint64_t v11 = [PLAssetsdInnerService alloc];
    uint64_t v12 = -[PLAssetsdInnerService initWithPermissions:requiredLibraryServicesState:lazyService:](v11, "initWithPermissions:requiredLibraryServicesState:lazyService:", v6, v7, v10, v15, v16, v17, v18);
    innerNotificationService = self->_innerNotificationService;
    self->_innerNotificationService = v12;
  }
  int v14 = [(PLAssetsdService *)self serviceContextWithSelector:a2];
  [(PLAssetsdInnerService *)self->_innerNotificationService getInnerServiceWithContext:v14 reply:v5];
}

id __52__PLAssetsdService_getNotificationServiceWithReply___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained) {
    v3 = (void *)[WeakRetained newNotificationService];
  }
  else {
    v3 = 0;
  }

  return v3;
}

- (void)getSyncServiceWithReply:(id)a3
{
  id v5 = a3;
  if (!self->_innerSyncService)
  {
    int v6 = [(PLAssetsdService *)self permissionsForSyncService];
    int64_t v7 = [(PLAssetsdService *)self requiredStateForSyncService];
    id v8 = objc_initWeak(&location, self);

    id v9 = objc_alloc(MEMORY[0x1E4F8B948]);
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    uint64_t v17 = __44__PLAssetsdService_getSyncServiceWithReply___block_invoke;
    int v18 = &unk_1E5874070;
    objc_copyWeak(&v19, &location);
    int v10 = (void *)[v9 initWithBlock:&v15];
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    uint64_t v11 = [PLAssetsdInnerService alloc];
    uint64_t v12 = -[PLAssetsdInnerService initWithPermissions:requiredLibraryServicesState:lazyService:](v11, "initWithPermissions:requiredLibraryServicesState:lazyService:", v6, v7, v10, v15, v16, v17, v18);
    innerSyncService = self->_innerSyncService;
    self->_innerSyncService = v12;
  }
  int v14 = [(PLAssetsdService *)self serviceContextWithSelector:a2];
  [(PLAssetsdInnerService *)self->_innerSyncService getInnerServiceWithContext:v14 reply:v5];
}

id __44__PLAssetsdService_getSyncServiceWithReply___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained) {
    v3 = (void *)[WeakRetained newSyncService];
  }
  else {
    v3 = 0;
  }

  return v3;
}

- (void)getMigrationServiceWithReply:(id)a3
{
  id v5 = a3;
  if (!self->_innerMigrationService)
  {
    int v6 = [(PLAssetsdService *)self permissionsForMigrationService];
    int64_t v7 = [(PLAssetsdService *)self requiredStateForMigrationService];
    id v8 = objc_initWeak(&location, self);

    id v9 = objc_alloc(MEMORY[0x1E4F8B948]);
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    uint64_t v17 = __49__PLAssetsdService_getMigrationServiceWithReply___block_invoke;
    int v18 = &unk_1E5874070;
    objc_copyWeak(&v19, &location);
    int v10 = (void *)[v9 initWithBlock:&v15];
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    uint64_t v11 = [PLAssetsdInnerService alloc];
    uint64_t v12 = -[PLAssetsdInnerService initWithPermissions:requiredLibraryServicesState:lazyService:](v11, "initWithPermissions:requiredLibraryServicesState:lazyService:", v6, v7, v10, v15, v16, v17, v18);
    innerMigrationService = self->_innerMigrationService;
    self->_innerMigrationService = v12;
  }
  int v14 = [(PLAssetsdService *)self serviceContextWithSelector:a2];
  [(PLAssetsdInnerService *)self->_innerMigrationService getInnerServiceWithContext:v14 reply:v5];
}

id __49__PLAssetsdService_getMigrationServiceWithReply___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained) {
    v3 = (void *)[WeakRetained newMigrationService];
  }
  else {
    v3 = 0;
  }

  return v3;
}

- (void)getCloudInternalServiceWithReply:(id)a3
{
  id v5 = a3;
  if (!self->_innerCloudInternalService)
  {
    int v6 = [(PLAssetsdService *)self permissionsForCloudInternalService];
    int64_t v7 = [(PLAssetsdService *)self requiredStateForCloudInternalService];
    id v8 = objc_initWeak(&location, self);

    id v9 = objc_alloc(MEMORY[0x1E4F8B948]);
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    uint64_t v17 = __53__PLAssetsdService_getCloudInternalServiceWithReply___block_invoke;
    int v18 = &unk_1E5874070;
    objc_copyWeak(&v19, &location);
    int v10 = (void *)[v9 initWithBlock:&v15];
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    uint64_t v11 = [PLAssetsdInnerService alloc];
    uint64_t v12 = -[PLAssetsdInnerService initWithPermissions:requiredLibraryServicesState:lazyService:](v11, "initWithPermissions:requiredLibraryServicesState:lazyService:", v6, v7, v10, v15, v16, v17, v18);
    innerCloudInternalService = self->_innerCloudInternalService;
    self->_innerCloudInternalService = v12;
  }
  int v14 = [(PLAssetsdService *)self serviceContextWithSelector:a2];
  [(PLAssetsdInnerService *)self->_innerCloudInternalService getInnerServiceWithContext:v14 reply:v5];
}

id __53__PLAssetsdService_getCloudInternalServiceWithReply___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained) {
    v3 = (void *)[WeakRetained newCloudInternalService];
  }
  else {
    v3 = 0;
  }

  return v3;
}

- (void)getCloudServiceWithReply:(id)a3
{
  id v5 = a3;
  if (!self->_innerCloudService)
  {
    int v6 = [(PLAssetsdService *)self permissionsForCloudService];
    int64_t v7 = [(PLAssetsdService *)self requiredStateForCloudService];
    id v8 = objc_initWeak(&location, self);

    id v9 = objc_alloc(MEMORY[0x1E4F8B948]);
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    uint64_t v17 = __45__PLAssetsdService_getCloudServiceWithReply___block_invoke;
    int v18 = &unk_1E5874070;
    objc_copyWeak(&v19, &location);
    int v10 = (void *)[v9 initWithBlock:&v15];
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    uint64_t v11 = [PLAssetsdInnerService alloc];
    uint64_t v12 = -[PLAssetsdInnerService initWithPermissions:requiredLibraryServicesState:lazyService:](v11, "initWithPermissions:requiredLibraryServicesState:lazyService:", v6, v7, v10, v15, v16, v17, v18);
    innerCloudService = self->_innerCloudService;
    self->_innerCloudService = v12;
  }
  int v14 = [(PLAssetsdService *)self serviceContextWithSelector:a2];
  [(PLAssetsdInnerService *)self->_innerCloudService getInnerServiceWithContext:v14 reply:v5];
}

id __45__PLAssetsdService_getCloudServiceWithReply___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained) {
    v3 = (void *)[WeakRetained newCloudService];
  }
  else {
    v3 = 0;
  }

  return v3;
}

- (void)getResourceWriteOnlyServiceWithReply:(id)a3
{
  id v5 = a3;
  if (!self->_innerResourceWriteOnlyService)
  {
    int v6 = [(PLAssetsdService *)self permissionsForResourceWriteOnlyService];
    int64_t v7 = [(PLAssetsdService *)self requiredStateForResourceWriteOnlyService];
    id v8 = objc_initWeak(&location, self);

    id v9 = objc_alloc(MEMORY[0x1E4F8B948]);
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    uint64_t v17 = __57__PLAssetsdService_getResourceWriteOnlyServiceWithReply___block_invoke;
    int v18 = &unk_1E5874070;
    objc_copyWeak(&v19, &location);
    int v10 = (void *)[v9 initWithBlock:&v15];
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    uint64_t v11 = [PLAssetsdInnerService alloc];
    uint64_t v12 = -[PLAssetsdInnerService initWithPermissions:requiredLibraryServicesState:lazyService:](v11, "initWithPermissions:requiredLibraryServicesState:lazyService:", v6, v7, v10, v15, v16, v17, v18);
    innerResourceWriteOnlyService = self->_innerResourceWriteOnlyService;
    self->_innerResourceWriteOnlyService = v12;
  }
  int v14 = [(PLAssetsdService *)self serviceContextWithSelector:a2];
  [(PLAssetsdInnerService *)self->_innerResourceWriteOnlyService getInnerServiceWithContext:v14 reply:v5];
}

id __57__PLAssetsdService_getResourceWriteOnlyServiceWithReply___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained) {
    v3 = (void *)[WeakRetained newResourceWriteOnlyService];
  }
  else {
    v3 = 0;
  }

  return v3;
}

- (void)getResourceServiceWithReply:(id)a3
{
  id v5 = a3;
  if (!self->_innerResourceService)
  {
    int v6 = [(PLAssetsdService *)self permissionsForResourceService];
    int64_t v7 = [(PLAssetsdService *)self requiredStateForResourceService];
    id v8 = objc_initWeak(&location, self);

    id v9 = objc_alloc(MEMORY[0x1E4F8B948]);
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    uint64_t v17 = __48__PLAssetsdService_getResourceServiceWithReply___block_invoke;
    int v18 = &unk_1E5874070;
    objc_copyWeak(&v19, &location);
    int v10 = (void *)[v9 initWithBlock:&v15];
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    uint64_t v11 = [PLAssetsdInnerService alloc];
    uint64_t v12 = -[PLAssetsdInnerService initWithPermissions:requiredLibraryServicesState:lazyService:](v11, "initWithPermissions:requiredLibraryServicesState:lazyService:", v6, v7, v10, v15, v16, v17, v18);
    innerResourceService = self->_innerResourceService;
    self->_innerResourceService = v12;
  }
  int v14 = [(PLAssetsdService *)self serviceContextWithSelector:a2];
  [(PLAssetsdInnerService *)self->_innerResourceService getInnerServiceWithContext:v14 reply:v5];
}

id __48__PLAssetsdService_getResourceServiceWithReply___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained) {
    v3 = (void *)[WeakRetained newResourceService];
  }
  else {
    v3 = 0;
  }

  return v3;
}

id __60__PLAssetsdService_getResourceAvailabilityServiceWithReply___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained) {
    v3 = (void *)[WeakRetained newResourceAvailabilityService];
  }
  else {
    v3 = 0;
  }

  return v3;
}

- (void)getPhotoKitAddServiceWithReply:(id)a3
{
  id v5 = a3;
  if (!self->_innerPhotoKitAddService)
  {
    int v6 = [(PLAssetsdService *)self permissionsForPhotoKitAddService];
    int64_t v7 = [(PLAssetsdService *)self requiredStateForPhotoKitAddService];
    id v8 = objc_initWeak(&location, self);

    id v9 = objc_alloc(MEMORY[0x1E4F8B948]);
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    uint64_t v17 = __51__PLAssetsdService_getPhotoKitAddServiceWithReply___block_invoke;
    int v18 = &unk_1E5874070;
    objc_copyWeak(&v19, &location);
    int v10 = (void *)[v9 initWithBlock:&v15];
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    uint64_t v11 = [PLAssetsdInnerService alloc];
    uint64_t v12 = -[PLAssetsdInnerService initWithPermissions:requiredLibraryServicesState:lazyService:](v11, "initWithPermissions:requiredLibraryServicesState:lazyService:", v6, v7, v10, v15, v16, v17, v18);
    innerPhotoKitAddService = self->_innerPhotoKitAddService;
    self->_innerPhotoKitAddService = v12;
  }
  int v14 = [(PLAssetsdService *)self serviceContextWithSelector:a2];
  [(PLAssetsdInnerService *)self->_innerPhotoKitAddService getInnerServiceWithContext:v14 reply:v5];
}

id __51__PLAssetsdService_getPhotoKitAddServiceWithReply___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained) {
    v3 = (void *)[WeakRetained newPhotoKitAddService];
  }
  else {
    v3 = 0;
  }

  return v3;
}

- (void)getPhotoKitServiceWithReply:(id)a3
{
  id v5 = a3;
  if (!self->_innerPhotoKitService)
  {
    int v6 = [(PLAssetsdService *)self permissionsForPhotoKitService];
    int64_t v7 = [(PLAssetsdService *)self requiredStateForPhotoKitService];
    id v8 = objc_initWeak(&location, self);

    id v9 = objc_alloc(MEMORY[0x1E4F8B948]);
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    uint64_t v17 = __48__PLAssetsdService_getPhotoKitServiceWithReply___block_invoke;
    int v18 = &unk_1E5874070;
    objc_copyWeak(&v19, &location);
    int v10 = (void *)[v9 initWithBlock:&v15];
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    uint64_t v11 = [PLAssetsdInnerService alloc];
    uint64_t v12 = -[PLAssetsdInnerService initWithPermissions:requiredLibraryServicesState:lazyService:](v11, "initWithPermissions:requiredLibraryServicesState:lazyService:", v6, v7, v10, v15, v16, v17, v18);
    innerPhotoKitService = self->_innerPhotoKitService;
    self->_innerPhotoKitService = v12;
  }
  int v14 = [(PLAssetsdService *)self serviceContextWithSelector:a2];
  [(PLAssetsdInnerService *)self->_innerPhotoKitService getInnerServiceWithContext:v14 reply:v5];
}

id __48__PLAssetsdService_getPhotoKitServiceWithReply___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained) {
    v3 = (void *)[WeakRetained newPhotoKitService];
  }
  else {
    v3 = 0;
  }

  return v3;
}

- (void)getLibraryManagementServiceWithReply:(id)a3
{
  id v5 = a3;
  if (!self->_innerLibraryManagementService)
  {
    int v6 = [(PLAssetsdService *)self permissionsForLibraryManagementService];
    int64_t v7 = [(PLAssetsdService *)self requiredStateForLibraryManagementService];
    id v8 = objc_initWeak(&location, self);

    id v9 = objc_alloc(MEMORY[0x1E4F8B948]);
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    uint64_t v17 = __57__PLAssetsdService_getLibraryManagementServiceWithReply___block_invoke;
    int v18 = &unk_1E5874070;
    objc_copyWeak(&v19, &location);
    int v10 = (void *)[v9 initWithBlock:&v15];
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    uint64_t v11 = [PLAssetsdInnerService alloc];
    uint64_t v12 = -[PLAssetsdInnerService initWithPermissions:requiredLibraryServicesState:lazyService:](v11, "initWithPermissions:requiredLibraryServicesState:lazyService:", v6, v7, v10, v15, v16, v17, v18);
    innerLibraryManagementService = self->_innerLibraryManagementService;
    self->_innerLibraryManagementService = v12;
  }
  int v14 = [(PLAssetsdService *)self serviceContextWithSelector:a2];
  [(PLAssetsdInnerService *)self->_innerLibraryManagementService getInnerServiceWithContext:v14 reply:v5];
}

id __57__PLAssetsdService_getLibraryManagementServiceWithReply___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained) {
    v3 = (void *)[WeakRetained newLibraryManagementService];
  }
  else {
    v3 = 0;
  }

  return v3;
}

- (void)getSystemLibraryURLReadOnlyServiceWithReply:(id)a3
{
  id v5 = a3;
  if (!self->_innerSystemLibraryURLReadOnlyService)
  {
    int v6 = [(PLAssetsdService *)self permissionsForSystemLibraryURLReadOnlyService];
    int64_t v7 = [(PLAssetsdService *)self requiredStateForSystemLibraryURLReadOnlyService];
    id v8 = objc_initWeak(&location, self);

    id v9 = objc_alloc(MEMORY[0x1E4F8B948]);
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    uint64_t v17 = __64__PLAssetsdService_getSystemLibraryURLReadOnlyServiceWithReply___block_invoke;
    int v18 = &unk_1E5874070;
    objc_copyWeak(&v19, &location);
    int v10 = (void *)[v9 initWithBlock:&v15];
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    uint64_t v11 = [PLAssetsdInnerService alloc];
    uint64_t v12 = -[PLAssetsdInnerService initWithPermissions:requiredLibraryServicesState:lazyService:](v11, "initWithPermissions:requiredLibraryServicesState:lazyService:", v6, v7, v10, v15, v16, v17, v18);
    innerSystemLibraryURLReadOnlyService = self->_innerSystemLibraryURLReadOnlyService;
    self->_innerSystemLibraryURLReadOnlyService = v12;
  }
  int v14 = [(PLAssetsdService *)self serviceContextWithSelector:a2];
  [(PLAssetsdInnerService *)self->_innerSystemLibraryURLReadOnlyService getInnerServiceWithContext:v14 reply:v5];
}

id __64__PLAssetsdService_getSystemLibraryURLReadOnlyServiceWithReply___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained) {
    v3 = (void *)[WeakRetained newSystemLibraryURLReadOnlyService];
  }
  else {
    v3 = 0;
  }

  return v3;
}

- (void)getLibraryInternalServiceWithReply:(id)a3
{
  id v5 = a3;
  if (!self->_innerLibraryInternalService)
  {
    int v6 = [(PLAssetsdService *)self permissionsForLibraryInternalService];
    int64_t v7 = [(PLAssetsdService *)self requiredStateForLibraryInternalService];
    id v8 = objc_initWeak(&location, self);

    id v9 = objc_alloc(MEMORY[0x1E4F8B948]);
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    uint64_t v17 = __55__PLAssetsdService_getLibraryInternalServiceWithReply___block_invoke;
    int v18 = &unk_1E5874070;
    objc_copyWeak(&v19, &location);
    int v10 = (void *)[v9 initWithBlock:&v15];
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    uint64_t v11 = [PLAssetsdInnerService alloc];
    uint64_t v12 = -[PLAssetsdInnerService initWithPermissions:requiredLibraryServicesState:lazyService:](v11, "initWithPermissions:requiredLibraryServicesState:lazyService:", v6, v7, v10, v15, v16, v17, v18);
    innerLibraryInternalService = self->_innerLibraryInternalService;
    self->_innerLibraryInternalService = v12;
  }
  int v14 = [(PLAssetsdService *)self serviceContextWithSelector:a2];
  [(PLAssetsdInnerService *)self->_innerLibraryInternalService getInnerServiceWithContext:v14 reply:v5];
}

id __55__PLAssetsdService_getLibraryInternalServiceWithReply___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained) {
    v3 = (void *)[WeakRetained newLibraryInternalService];
  }
  else {
    v3 = 0;
  }

  return v3;
}

- (void)getLibraryServiceWithReply:(id)a3
{
  id v5 = a3;
  if (!self->_innerLibraryService)
  {
    int v6 = [(PLAssetsdService *)self permissionsForLibraryService];
    int64_t v7 = [(PLAssetsdService *)self requiredStateForLibraryService];
    id v8 = objc_initWeak(&location, self);

    id v9 = objc_alloc(MEMORY[0x1E4F8B948]);
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    uint64_t v17 = __47__PLAssetsdService_getLibraryServiceWithReply___block_invoke;
    int v18 = &unk_1E5874070;
    objc_copyWeak(&v19, &location);
    int v10 = (void *)[v9 initWithBlock:&v15];
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    uint64_t v11 = [PLAssetsdInnerService alloc];
    uint64_t v12 = -[PLAssetsdInnerService initWithPermissions:requiredLibraryServicesState:lazyService:](v11, "initWithPermissions:requiredLibraryServicesState:lazyService:", v6, v7, v10, v15, v16, v17, v18);
    innerLibraryService = self->_innerLibraryService;
    self->_innerLibraryService = v12;
  }
  int v14 = [(PLAssetsdService *)self serviceContextWithSelector:a2];
  [(PLAssetsdInnerService *)self->_innerLibraryService getInnerServiceWithContext:v14 reply:v5];
}

id __47__PLAssetsdService_getLibraryServiceWithReply___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained) {
    v3 = (void *)[WeakRetained newLibraryService];
  }
  else {
    v3 = 0;
  }

  return v3;
}

- (void)handleInvalidation
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int remotePID = self->_remotePID;
    v8[0] = 67109120;
    v8[1] = remotePID;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "Connection invalidated for client with PID: %d", (uint8_t *)v8, 8u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  [WeakRetained setDelegate:0];

  [(PLAssetsdCPLResourceDownloader *)self->_resourceDownloader handleInvalidation];
  if ([(PLAssetsdConnectionAuthorization *)self->_connectionAuthorization isPhotosClient])
  {
    int v6 = [(PLPhotoLibraryBundle *)self->_libraryBundle libraryServicesManager];
    int64_t v7 = [v6 migrationServiceProxy];
    [v7 unboost];
  }
}

- (void)handleInterruption
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int remotePID = self->_remotePID;
    v8[0] = 67109120;
    v8[1] = remotePID;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "Connection interrupted for client with PID: %d", (uint8_t *)v8, 8u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  [WeakRetained setDelegate:0];

  if ([(PLAssetsdConnectionAuthorization *)self->_connectionAuthorization isPhotosClient])
  {
    int v6 = [(PLPhotoLibraryBundle *)self->_libraryBundle libraryServicesManager];
    int64_t v7 = [v6 migrationServiceProxy];
    [v7 unboost];
  }
}

- (NSString)connectionDescription
{
  v3 = NSString;
  v4 = [(PLAssetsdConnectionAuthorization *)self->_connectionAuthorization trustedCallerBundleID];
  id v5 = [v3 stringWithFormat:@"%@[%d]", v4, -[PLAssetsdConnectionAuthorization clientProcessIdentifier](self->_connectionAuthorization, "clientProcessIdentifier")];

  return (NSString *)v5;
}

- (NSString)stateDescription
{
  v3 = [(PLAssetsdService *)self libraryURL];

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E4F8B908];
    id v5 = [(PLAssetsdService *)self libraryURL];
    int v6 = [v4 redactedDescriptionForFileURL:v5];
  }
  else
  {
    int v6 = @"<no library>";
  }
  int64_t v7 = [NSString stringWithFormat:@"%@: %@", self->_connectionAuthorization, v6];

  return (NSString *)v7;
}

- (NSString)description
{
  v2 = NSString;
  connectionAuthorization = self->_connectionAuthorization;
  uint64_t v4 = [(PLAssetsdService *)self libraryURL];
  id v5 = (void *)v4;
  int v6 = @"<no library>";
  if (v4) {
    int v6 = (__CFString *)v4;
  }
  int64_t v7 = [v2 stringWithFormat:@"%@: %@", connectionAuthorization, v6];

  return (NSString *)v7;
}

- (id)resourceDownloader
{
  resourceDownloader = self->_resourceDownloader;
  if (!resourceDownloader)
  {
    uint64_t v4 = [PLAssetsdCPLResourceDownloader alloc];
    id v5 = [(PLAssetsdService *)self _photoLibrary];
    int v6 = [(PLAssetsdConnectionAuthorization *)self->_connectionAuthorization trustedCallerBundleID];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    id v8 = [(PLAssetsdCPLResourceDownloader *)v4 initWithPhotoLibrary:v5 trustedCallerBundleID:v6 clientConnection:WeakRetained];
    uint64_t v9 = self->_resourceDownloader;
    self->_resourceDownloader = v8;

    resourceDownloader = self->_resourceDownloader;
  }
  return resourceDownloader;
}

- (id)_photoLibrary
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (!self->_photoLibrary)
  {
    v3 = [(PLAssetsdService *)self libraryURL];

    if (v3)
    {
      uint64_t v4 = objc_alloc_init(PLPhotoLibraryOptions);
      [(PLPhotoLibraryOptions *)v4 setRequiredState:6];
      [(PLPhotoLibraryOptions *)v4 setAutomaticallyPinToFirstFetch:0];
      libraryBundle = self->_libraryBundle;
      id v13 = 0;
      int v6 = +[PLPhotoLibrary newPhotoLibraryWithName:loadedFromBundle:options:error:](PLPhotoLibrary, "newPhotoLibraryWithName:loadedFromBundle:options:error:", "-[PLAssetsdService _photoLibrary]", libraryBundle, v4, &v13);
      id v7 = v13;
      photoLibrary = self->_photoLibrary;
      self->_photoLibrary = v6;

      if (!self->_photoLibrary)
      {
        uint64_t v9 = PLBackendGetLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          int v10 = [(PLAssetsdService *)self libraryURL];
          *(_DWORD *)buf = 136446722;
          uint64_t v15 = "-[PLAssetsdService _photoLibrary]";
          __int16 v16 = 2112;
          uint64_t v17 = v10;
          __int16 v18 = 2112;
          id v19 = v7;
          _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "failed to load photo library %{public}s with url %@, %@", buf, 0x20u);
        }
      }
    }
  }
  uint64_t v11 = self->_photoLibrary;
  return v11;
}

- (BOOL)isPhotosClient
{
  return [(PLAssetsdConnectionAuthorization *)self->_connectionAuthorization isPhotosClient];
}

@end