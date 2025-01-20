@interface PLMainQueuePhotoLibrary
+ (id)systemMainQueuePhotoLibrary;
+ (void)_resetSharedInstance;
- (PLMainQueuePhotoLibrary)initWithName:(const char *)a3 libraryBundle:(id)a4 options:(id)a5;
- (void)dealloc;
@end

@implementation PLMainQueuePhotoLibrary

- (void)dealloc
{
  int splChangedToken = self->_splChangedToken;
  if (splChangedToken) {
    notify_cancel(splChangedToken);
  }
  v4.receiver = self;
  v4.super_class = (Class)PLMainQueuePhotoLibrary;
  [(PLPhotoLibrary *)&v4 dealloc];
}

- (PLMainQueuePhotoLibrary)initWithName:(const char *)a3 libraryBundle:(id)a4 options:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  if (PLIsAssetsd())
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"PLMainQueuePhotoLibrary.m" lineNumber:30 description:@"Must not be used in assetsd"];
  }
  v16.receiver = self;
  v16.super_class = (Class)PLMainQueuePhotoLibrary;
  v11 = [(PLPhotoLibrary *)&v16 initWithName:a3 libraryBundle:v9 options:v10];
  if (v11)
  {
    v12 = (const char *)*MEMORY[0x1E4F8C580];
    v13 = dispatch_get_global_queue(25, 0);
    notify_register_dispatch(v12, &v11->_splChangedToken, v13, &__block_literal_global_25861);
  }
  return v11;
}

uint64_t __62__PLMainQueuePhotoLibrary_initWithName_libraryBundle_options___block_invoke()
{
  return +[PLMainQueuePhotoLibrary _resetSharedInstance];
}

+ (id)systemMainQueuePhotoLibrary
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = a1;
  objc_sync_enter(v2);
  if (!sharedInstance)
  {
    v3 = [MEMORY[0x1E4F8B980] systemLibraryURL];
    objc_super v4 = objc_alloc_init(PLPhotoLibraryOptions);
    [(PLPhotoLibraryOptions *)v4 setAutomaticallyMergesContext:1];
    [(PLPhotoLibraryOptions *)v4 setAutomaticallyPinToFirstFetch:0];
    id v15 = 0;
    id v5 = +[PLPhotoLibrary newPhotoLibraryWithName:loadedFromURL:options:error:](PLMainQueuePhotoLibrary, "newPhotoLibraryWithName:loadedFromURL:options:error:", "+[PLMainQueuePhotoLibrary systemMainQueuePhotoLibrary]", v3, v4, &v15);
    id v6 = v15;
    v7 = (void *)sharedInstance;
    sharedInstance = (uint64_t)v5;

    if (sharedInstance)
    {
      v8 = PLBackendGetLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v3;
        id v9 = "successfully loaded photo library systemMainQueuePhotoLibrary with url %@";
        id v10 = v8;
        os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
        uint32_t v12 = 12;
LABEL_7:
        _os_log_impl(&dword_19B3C7000, v10, v11, v9, buf, v12);
      }
    }
    else
    {
      v8 = PLBackendGetLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v17 = v3;
        __int16 v18 = 2112;
        id v19 = v6;
        id v9 = "failed to load photo library systemMainQueuePhotoLibrary with url %@, %@";
        id v10 = v8;
        os_log_type_t v11 = OS_LOG_TYPE_ERROR;
        uint32_t v12 = 22;
        goto LABEL_7;
      }
    }
  }
  objc_sync_exit(v2);

  v13 = (void *)sharedInstance;
  return v13;
}

+ (void)_resetSharedInstance
{
  id obj = a1;
  objc_sync_enter(obj);
  id v2 = (void *)sharedInstance;
  sharedInstance = 0;

  objc_sync_exit(obj);
}

@end