@interface PLDistributedNotificationHandler
- (PLDistributedNotificationHandler)initWithLibraryBundleController:(id)a3;
- (void)_handleNotification:(id)a3;
- (void)_openSystemPhotoLibrary;
- (void)registerForNotifications;
@end

@implementation PLDistributedNotificationHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appUninstallNotificationHandler, 0);
  objc_storeStrong((id *)&self->_libraryBundleController, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
}

- (void)_openSystemPhotoLibrary
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F8B980] systemLibraryURL];
  v4 = [(PLPhotoLibraryBundleController *)self->_libraryBundleController openBundleAtLibraryURL:v3];
  v5 = v4;
  if (v4)
  {
    v6 = [v4 libraryServicesManager];
    v7 = [[PLPhotoLibraryOpener alloc] initWithLibraryServicesManager:v6 reportInProgressUpgrades:0];
    id v16 = 0;
    BOOL v8 = [(PLPhotoLibraryOpener *)v7 openPhotoLibraryDatabaseWithAutoUpgrade:0 autoCreate:0 error:&v16];
    v9 = v16;
    v10 = PLBackendGetLog();
    v11 = v10;
    if (v8)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v12 = "Distributed notification handler: Opened system photo library";
        v13 = v11;
        os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
        uint32_t v15 = 2;
LABEL_9:
        _os_log_impl(&dword_19B3C7000, v13, v14, v12, buf, v15);
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v18 = v3;
      __int16 v19 = 2112;
      v20 = v9;
      v12 = "Distributed notification handler: Unable to open library at URL: %@, error: %@";
      v13 = v11;
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
      uint32_t v15 = 22;
      goto LABEL_9;
    }

    goto LABEL_11;
  }
  v9 = PLBackendGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v3;
    _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "Distributed notification handler: No library bundle for URL %@", buf, 0xCu);
  }
LABEL_11:
}

- (void)_handleNotification:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = PLBackendGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    PLDescriptionFromXPCObject();
    v6 = (char *)objc_claimAutoreleasedReturnValue();
    int v15 = 138412290;
    id v16 = v6;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEBUG, "Got distributed notification: %@", (uint8_t *)&v15, 0xCu);
  }
  uint64_t v7 = MEMORY[0x19F38E330](v4);
  uint64_t v8 = MEMORY[0x1E4F14590];
  if (v7 != MEMORY[0x1E4F14590])
  {
    v9 = PLBackendGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      PLDescriptionFromXPCObject();
      v10 = (char *)objc_claimAutoreleasedReturnValue();
      int v15 = 138412290;
      id v16 = v10;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "Unexpected notification: %@", (uint8_t *)&v15, 0xCu);
    }
LABEL_6:

    goto LABEL_7;
  }
  string = xpc_dictionary_get_string(v4, (const char *)*MEMORY[0x1E4F14560]);
  if (!strcmp(string, "com.apple.assetsd.cloudphoto"))
  {
    [(PLDistributedNotificationHandler *)self _handleCloudPhotoNotification];
    goto LABEL_7;
  }
  if (strcmp(string, "Application Uninstalled"))
  {
    v9 = PLBackendGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136315138;
      id v16 = string;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "Unexpected event name: %s", (uint8_t *)&v15, 0xCu);
    }
    goto LABEL_6;
  }
  v12 = xpc_dictionary_get_value(v4, "UserInfo");
  if (MEMORY[0x19F38E330]() == v8) {
    v13 = (char *)_CFXPCCreateCFObjectFromXPCObject();
  }
  else {
    v13 = 0;
  }
  os_log_type_t v14 = PLBackendGetLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138543362;
    id v16 = v13;
    _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEFAULT, "Handling Application Uninstalled event for %{public}@.", (uint8_t *)&v15, 0xCu);
  }

  [(PLAppUninstallNotificationHandler *)self->_appUninstallNotificationHandler handleApplicationUninstalledNotification:v13];
LABEL_7:
}

- (void)registerForNotifications
{
  objc_initWeak(&location, self);
  notificationQueue = self->_notificationQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __60__PLDistributedNotificationHandler_registerForNotifications__block_invoke;
  v4[3] = &unk_1E5869778;
  objc_copyWeak(&v5, &location);
  xpc_set_event_stream_handler("com.apple.distnoted.matching", notificationQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __60__PLDistributedNotificationHandler_registerForNotifications__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleNotification:v3];
}

- (PLDistributedNotificationHandler)initWithLibraryBundleController:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PLDistributedNotificationHandler;
  v6 = [(PLDistributedNotificationHandler *)&v15 init];
  if (v6)
  {
    uint64_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_BACKGROUND, 0);

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.photos.distnoted.handler", v8);
    notificationQueue = v6->_notificationQueue;
    v6->_notificationQueue = (OS_dispatch_queue *)v9;

    objc_storeStrong((id *)&v6->_libraryBundleController, a3);
    v11 = [[PLAppUninstallNotificationHandler alloc] initWithLibraryBundleController:v5];
    appUninstallNotificationHandler = v6->_appUninstallNotificationHandler;
    v6->_appUninstallNotificationHandler = v11;

    v13 = v6;
  }

  return v6;
}

@end