@interface PLTCCObserver
- (PLTCCObserver)initWithLibraryBundleController:(id)a3;
- (id)_systemPhotoLibrary;
- (void)_handleTCCEvent:(unint64_t)a3 auth_record:(id)a4;
- (void)registerAsTCCObserver;
@end

@implementation PLTCCObserver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryBundleController, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
}

- (id)_systemPhotoLibrary
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F8B980] systemLibraryURL];
  v4 = [(PLPhotoLibraryBundleController *)self->_libraryBundleController openBundleAtLibraryURL:v3];
  v5 = v4;
  if (v4)
  {
    v6 = [v4 libraryServicesManager];
    v7 = [[PLPhotoLibraryOpener alloc] initWithLibraryServicesManager:v6 reportInProgressUpgrades:0];
    id v14 = 0;
    BOOL v8 = [(PLPhotoLibraryOpener *)v7 openPhotoLibraryDatabaseWithAutoUpgrade:0 autoCreate:0 error:&v14];
    v9 = v14;
    v10 = PLBackendGetLog();
    v11 = v10;
    if (v8)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "TCC Observer: Opened system photo library", buf, 2u);
      }

      v11 = [v6 databaseContext];
      v12 = (void *)-[NSObject newShortLivedLibraryWithName:](v11, "newShortLivedLibraryWithName:", "-[PLTCCObserver _systemPhotoLibrary]");
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v16 = v3;
        __int16 v17 = 2112;
        v18 = v9;
        _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "TCC Observer: Unable to open library at URL: %@, error: %@", buf, 0x16u);
      }
      v12 = 0;
    }
  }
  else
  {
    v9 = PLBackendGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v3;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "TCC Observer: No library bundle for URL %@", buf, 0xCu);
    }
    v12 = 0;
  }

  return v12;
}

- (void)_handleTCCEvent:(unint64_t)a3 auth_record:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = tcc_authorization_record_get_service();
  BOOL v8 = tcc_service_get_CF_name();
  v9 = tcc_authorization_record_get_subject_identity();
  uint64_t type = tcc_identity_get_type();
  uint64_t authorization_value = tcc_authorization_record_get_authorization_value();

  authorization_value_uint64_t type = tcc_service_get_authorization_value_type();
  uint64_t identifier = tcc_identity_get_identifier();
  if (!type)
  {
    uint64_t v14 = identifier;
    if (a3 == 3
      && (([v8 isEqualToString:*MEMORY[0x1E4FA9AE0]] & 1) != 0
       || [v8 isEqualToString:*MEMORY[0x1E4FA9AE8]]))
    {
      v15 = [(PLTCCObserver *)self _systemPhotoLibrary];
      v16 = PLBackendGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v25 = v14;
        _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEFAULT, "TCC Observer: Deleting limited library for bundle: %s", buf, 0xCu);
      }

      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __45__PLTCCObserver__handleTCCEvent_auth_record___block_invoke;
      v21[3] = &unk_1E5873348;
      id v22 = v15;
      uint64_t v23 = v14;
      id v17 = v15;
      [v17 performTransactionAndWait:v21];
    }
    if (PLIsChinaSKU())
    {
      if ((authorization_value & 0xFFFFFFFFFFFFFFFDLL) == 0 && authorization_value_type == 1)
      {
        if ([v8 isEqualToString:*MEMORY[0x1E4FA9A10]])
        {
          v18 = [NSString stringWithUTF8String:v14];
          int v19 = [v18 isEqualToString:@"com.apple.mobileslideshow"];

          if (v19)
          {
            v20 = PLBackendGetLog();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_DEFAULT, "Requesting exit due to detected contacts authorization change.", buf, 2u);
            }

            xpc_transaction_exit_clean();
          }
        }
      }
    }
  }
}

void __45__PLTCCObserver__handleTCCEvent_auth_record___block_invoke(uint64_t a1)
{
  id v3 = [NSString stringWithUTF8String:*(void *)(a1 + 40)];
  v2 = [*(id *)(a1 + 32) managedObjectContext];
  +[PLLimitedLibraryFetchFilter deleteLimitedLibraryFetchFilterWithApplicationIdentifier:v3 inManagedObjectContext:v2];
}

- (void)registerAsTCCObserver
{
  objc_initWeak(&location, self);
  objc_copyWeak(&v2, &location);
  tcc_events_subscribe();
  objc_destroyWeak(&v2);
  objc_destroyWeak(&location);
}

void __38__PLTCCObserver_registerAsTCCObserver__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = (id *)(a1 + 32);
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_handleTCCEvent:auth_record:", a2, v5);
}

- (PLTCCObserver)initWithLibraryBundleController:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PLTCCObserver;
  id v6 = [(PLTCCObserver *)&v13 init];
  if (v6)
  {
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    BOOL v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_BACKGROUND, 0);

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.photos.tccObserver", v8);
    observerQueue = v6->_observerQueue;
    v6->_observerQueue = (OS_dispatch_queue *)v9;

    objc_storeStrong((id *)&v6->_libraryBundleController, a3);
    v11 = v6;
  }
  return v6;
}

@end