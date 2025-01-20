@interface PLPhotoLibraryForceExitObserver
+ (id)sharedInstance;
- (PLPhotoLibraryForceExitObserver)init;
- (void)_photoLibraryCorruptNotification;
- (void)_photoLibraryForceClientExitNotification;
- (void)dealloc;
@end

@implementation PLPhotoLibraryForceExitObserver

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_1031);
  }
  v2 = (void *)sharedInstance_observer;
  return v2;
}

void __49__PLPhotoLibraryForceExitObserver_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(PLPhotoLibraryForceExitObserver);
  v1 = (void *)sharedInstance_observer;
  sharedInstance_observer = (uint64_t)v0;
}

- (PLPhotoLibraryForceExitObserver)init
{
  v5.receiver = self;
  v5.super_class = (Class)PLPhotoLibraryForceExitObserver;
  v2 = [(PLPhotoLibraryForceExitObserver *)&v5 init];
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_photoLibraryCorruptNotification, (CFStringRef)PLPhotoLibraryCorruptNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_photoLibraryForceClientExitNotification, (CFStringRef)PLPhotoLibraryForceClientExitNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v2;
}

- (void)_photoLibraryForceClientExitNotification
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (!PLIsRunningInStoreDemoMode()) {
    goto LABEL_14;
  }
  int v2 = PLIsSpringboard();
  if (v2) {
    v3 = @"for SpringBoard in Store Demo Mode to avoid a possible crash loop";
  }
  else {
    v3 = 0;
  }
  char v4 = PLIsInternalTool();
  int v5 = PLIsDemod();
  if (v4)
  {
    if (!v5)
    {
      v3 = @"for internal tool in Store Demo Mode to avoid unnecessary crash";
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  if (v5)
  {
LABEL_9:
    v3 = @"for demod in Store Demo Mode to avoid unnecessary crash";
    goto LABEL_11;
  }
  if (!v2)
  {
LABEL_14:
    v7 = PLBackendGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "Exiting because another process requested a FORCE CLIENT EXIT.  Everything is behaving as it should and you don't need to file a radar about this.\n\nThis is usually initiated by: plphotosctl rebuilddb.", (uint8_t *)&v8, 2u);
    }

    exit(0);
  }
LABEL_11:
  v6 = PLBackendGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138543362;
    v9 = v3;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "Ignoring simulated FORCE CLIENT EXIT %{public}@.", (uint8_t *)&v8, 0xCu);
  }
}

- (void)_photoLibraryCorruptNotification
{
  int v2 = PLBackendGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_ERROR, "Exiting because another process detected a corrupt database.", v3, 2u);
  }

  exit(0);
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)PLPhotoLibraryForceExitObserver;
  [(PLPhotoLibraryForceExitObserver *)&v4 dealloc];
}

@end