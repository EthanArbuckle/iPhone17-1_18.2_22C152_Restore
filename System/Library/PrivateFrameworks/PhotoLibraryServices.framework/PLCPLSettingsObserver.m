@interface PLCPLSettingsObserver
- (BOOL)isCloudPhotoLibraryEnabled;
- (BOOL)setPrefetchMode:(int64_t)a3 error:(id *)a4;
- (PLCPLSettings)settings;
- (PLCPLSettingsObserver)initWithLibraryBundle:(id)a3;
- (PLCPLSettingsObserver)initWithSettings:(id)a3;
- (PLCPLSettingsObserverDelegate)delegate;
- (void)dealloc;
- (void)setDelegate:(id)a3;
@end

@implementation PLCPLSettingsObserver

- (BOOL)isCloudPhotoLibraryEnabled
{
  if ([(PLPhotoLibraryBundle *)self->_libraryBundle isSystemPhotoLibrary])
  {
    v3 = (void *)*MEMORY[0x1E4F17570];
    return _PLIsCloudPhotoLibraryEnabledForCurrentUserWithDataclass(v3);
  }
  else
  {
    v5 = [(PLCPLSettingsObserver *)self settings];
    char v6 = [v5 isCloudPhotoLibraryEnabled];

    return v6;
  }
}

- (void)setDelegate:(id)a3
{
}

- (PLCPLSettingsObserver)initWithLibraryBundle:(id)a3
{
  id v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PLCPLSettingsObserver;
  v7 = [(PLCPLSettingsObserver *)&v19 init];
  if (v7)
  {
    if (!v6)
    {
      v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2 object:v7 file:@"PLCPLSettings.m" lineNumber:368 description:@"Missing library bundle"];
    }
    objc_storeStrong((id *)&v7->_libraryBundle, a3);
    id v8 = objc_initWeak(&location, v7);

    id v9 = objc_alloc(MEMORY[0x1E4F8B948]);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __47__PLCPLSettingsObserver_initWithLibraryBundle___block_invoke;
    v15[3] = &unk_1E5870860;
    objc_copyWeak(&v17, &location);
    id v16 = v6;
    uint64_t v10 = [v9 initWithRetriableBlock:v15];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
    lazySettings = v7->_lazySettings;
    v7->_lazySettings = (PLLazyObject *)v10;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v7, (CFNotificationCallback)_settingsDidChange, @"PLCPLSettingsDidChangeNotification", 0, (CFNotificationSuspensionBehavior)1024);
  }

  return v7;
}

id __47__PLCPLSettingsObserver_initWithLibraryBundle___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = +[PLCPLSettings settingsWithLibraryBundle:*(void *)(a1 + 32)];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lazySettings, 0);
  objc_storeStrong((id *)&self->_libraryBundle, 0);
}

- (PLCPLSettingsObserverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PLCPLSettingsObserverDelegate *)WeakRetained;
}

- (BOOL)setPrefetchMode:(int64_t)a3 error:(id *)a4
{
  BOOL v5 = +[PLCPLSettings setPrefetchMode:a3 withLibraryBundle:self->_libraryBundle error:a4];
  if (v5) {
    [(PLLazyObject *)self->_lazySettings resetObject];
  }
  return v5;
}

- (PLCPLSettings)settings
{
  return (PLCPLSettings *)[(PLLazyObject *)self->_lazySettings objectValue];
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"PLCPLSettingsDidChangeNotification", 0);
  v4.receiver = self;
  v4.super_class = (Class)PLCPLSettingsObserver;
  [(PLCPLSettingsObserver *)&v4 dealloc];
}

- (PLCPLSettingsObserver)initWithSettings:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PLCPLSettingsObserver;
  BOOL v5 = [(PLCPLSettingsObserver *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 libraryBundle];
    libraryBundle = v5->_libraryBundle;
    v5->_libraryBundle = (PLPhotoLibraryBundle *)v6;

    id v8 = objc_initWeak(&location, v5);
    id v9 = objc_alloc(MEMORY[0x1E4F8B948]);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __42__PLCPLSettingsObserver_initWithSettings___block_invoke;
    v14[3] = &unk_1E5870860;
    objc_copyWeak(&v16, &location);
    id v15 = v4;
    uint64_t v10 = [v9 initWithRetriableBlock:v14];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
    lazySettings = v5->_lazySettings;
    v5->_lazySettings = (PLLazyObject *)v10;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v5, (CFNotificationCallback)_settingsDidChange, @"PLCPLSettingsDidChangeNotification", 0, (CFNotificationSuspensionBehavior)1024);
  }

  return v5;
}

id __42__PLCPLSettingsObserver_initWithSettings___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    id v3 = *(id *)(a1 + 32);
  }
  else {
    id v3 = 0;
  }

  return v3;
}

@end