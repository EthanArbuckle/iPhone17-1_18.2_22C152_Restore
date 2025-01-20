@interface ICQDaemonOfferConditions
+ (BOOL)backupRestoreComplete;
+ (BOOL)hasPhotosCloudEverBeenEnabled;
+ (BOOL)isCachedCloudQuotaAlmostFullOrFull;
+ (BOOL)isDeviceStorageAlmostFull;
+ (BOOL)isPhotosCloudEnabled;
+ (BOOL)isPhotosOptimizeEnabled;
+ (BOOL)isSimulatedDeviceStorageAlmostFull;
+ (NSNumber)photosLibrarySize;
+ (NSNumber)photosLibraryUploadSize;
+ (NSNumber)photosVideosCount;
+ (id)currentConditions;
+ (uint64_t)isPhotosCloudEnabled;
+ (void)getPhotosLibraryUploadSizeWithCompletion:(id)a3;
+ (void)setSimulatedDeviceStorageAlmostFull:(BOOL)a3;
- (BOOL)isBackupRestoreComplete;
- (BOOL)isDeviceStorageAlmostFull;
- (BOOL)isPhotosCloudEnabled;
- (BOOL)isPhotosOptimizeEnabled;
- (ICQDaemonOfferConditions)initWithCurrentConditions;
- (NSNumber)photosLibrarySize;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setBackupRestoreComplete:(BOOL)a3;
- (void)setDeviceStorageAlmostFull:(BOOL)a3;
- (void)setPhotosCloudEnabled:(BOOL)a3;
- (void)setPhotosLibrarySize:(id)a3;
- (void)setPhotosOptimizeEnabled:(BOOL)a3;
@end

@implementation ICQDaemonOfferConditions

+ (id)currentConditions
{
  v2 = (void *)[objc_alloc((Class)a1) initWithCurrentConditions];
  return v2;
}

- (ICQDaemonOfferConditions)initWithCurrentConditions
{
  v6.receiver = self;
  v6.super_class = (Class)ICQDaemonOfferConditions;
  v2 = [(ICQDaemonOfferConditions *)&v6 init];
  if (v2)
  {
    -[ICQDaemonOfferConditions setDeviceStorageAlmostFull:](v2, "setDeviceStorageAlmostFull:", [(id)objc_opt_class() isDeviceStorageAlmostFull]);
    -[ICQDaemonOfferConditions setPhotosCloudEnabled:](v2, "setPhotosCloudEnabled:", [(id)objc_opt_class() isPhotosCloudEnabled]);
    if ([(ICQDaemonOfferConditions *)v2 isPhotosCloudEnabled]) {
      uint64_t v3 = [(id)objc_opt_class() isPhotosOptimizeEnabled];
    }
    else {
      uint64_t v3 = 0;
    }
    [(ICQDaemonOfferConditions *)v2 setPhotosOptimizeEnabled:v3];
    if ([(ICQDaemonOfferConditions *)v2 isPhotosCloudEnabled])
    {
      [(ICQDaemonOfferConditions *)v2 setPhotosLibrarySize:0];
    }
    else
    {
      v4 = [(id)objc_opt_class() photosLibrarySize];
      [(ICQDaemonOfferConditions *)v2 setPhotosLibrarySize:v4];
    }
    -[ICQDaemonOfferConditions setBackupRestoreComplete:](v2, "setBackupRestoreComplete:", [(id)objc_opt_class() backupRestoreComplete]);
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setDeviceStorageAlmostFull:", -[ICQDaemonOfferConditions isDeviceStorageAlmostFull](self, "isDeviceStorageAlmostFull"));
  objc_msgSend(v4, "setPhotosCloudEnabled:", -[ICQDaemonOfferConditions isPhotosCloudEnabled](self, "isPhotosCloudEnabled"));
  objc_msgSend(v4, "setPhotosOptimizeEnabled:", -[ICQDaemonOfferConditions isPhotosOptimizeEnabled](self, "isPhotosOptimizeEnabled"));
  v5 = [(ICQDaemonOfferConditions *)self photosLibrarySize];
  [v4 setPhotosLibrarySize:v5];

  objc_msgSend(v4, "setBackupRestoreComplete:", -[ICQDaemonOfferConditions isBackupRestoreComplete](self, "isBackupRestoreComplete"));
  return v4;
}

+ (BOOL)isDeviceStorageAlmostFull
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (([a1 isSimulatedDeviceStorageAlmostFull] & 1) == 0)
  {
    uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F8BA18]) initWithPath:@"/private/var"];
    id v4 = v3;
    if (v3)
    {
      unint64_t v5 = [v3 availableSpace];
      objc_super v6 = _ICQGetLogSystem();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 134349056;
        unint64_t v17 = v5;
        _os_log_impl(&dword_1D5851000, v6, OS_LOG_TYPE_DEFAULT, "Found %{public}llu bytes of free space", (uint8_t *)&v16, 0xCu);
      }

      v7 = CacheDeleteCopyPurgeableSpaceWithInfo();
      v8 = [v7 objectForKeyedSubscript:@"CACHE_DELETE_ERROR"];

      if (v8)
      {
        v9 = _ICQGetLogSystem();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v10 = [v7 objectForKeyedSubscript:@"CACHE_DELETE_ERROR"];
          int v16 = 138412290;
          unint64_t v17 = (unint64_t)v10;
          _os_log_impl(&dword_1D5851000, v9, OS_LOG_TYPE_DEFAULT, "Failed to get purgable space from Cache Delete: %@", (uint8_t *)&v16, 0xCu);
        }
      }
      else
      {
        v11 = [v7 objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"];
        uint64_t v12 = [v11 unsignedLongLongValue];

        v13 = _ICQGetLogSystem();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          int v16 = 134349056;
          unint64_t v17 = v12;
          _os_log_impl(&dword_1D5851000, v13, OS_LOG_TYPE_DEFAULT, "Found %{public}llu bytes of purgeable space", (uint8_t *)&v16, 0xCu);
        }

        v5 += v12;
      }
      if (v5 >= [v4 lowDiskThreshold])
      {
        BOOL v2 = v5 < 2 * [v4 nearLowDiskThreshold];
        goto LABEL_21;
      }
      v14 = _ICQGetLogSystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v16) = 0;
        _os_log_impl(&dword_1D5851000, v14, OS_LOG_TYPE_DEFAULT, "user volume is eating into the reserve -- too low for offers", (uint8_t *)&v16, 2u);
      }
    }
    else
    {
      v7 = _ICQGetLogSystem();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v16) = 0;
        _os_log_impl(&dword_1D5851000, v7, OS_LOG_TYPE_DEFAULT, "Unable to get user volume status", (uint8_t *)&v16, 2u);
      }
    }
    BOOL v2 = 0;
LABEL_21:

    return v2;
  }
  return 1;
}

+ (BOOL)isPhotosCloudEnabled
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  BOOL v2 = (uint64_t (*)(void))getPLIsCPLDataclassEnabledSymbolLoc_ptr;
  v9 = getPLIsCPLDataclassEnabledSymbolLoc_ptr;
  if (!getPLIsCPLDataclassEnabledSymbolLoc_ptr)
  {
    uint64_t v3 = (void *)PhotoLibraryServicesLibrary();
    v7[3] = (uint64_t)dlsym(v3, "PLIsCPLDataclassEnabled");
    getPLIsCPLDataclassEnabledSymbolLoc_ptr = (_UNKNOWN *)v7[3];
    BOOL v2 = (uint64_t (*)(void))v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (!v2)
  {
    unint64_t v5 = (_Unwind_Exception *)+[ICQDaemonOfferConditions isPhotosCloudEnabled]();
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v5);
  }
  return v2();
}

+ (BOOL)hasPhotosCloudEverBeenEnabled
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  BOOL v2 = (uint64_t (*)(void))getPLCPLHasBeenEnabledForCurrentAccountSymbolLoc_ptr;
  v9 = getPLCPLHasBeenEnabledForCurrentAccountSymbolLoc_ptr;
  if (!getPLCPLHasBeenEnabledForCurrentAccountSymbolLoc_ptr)
  {
    uint64_t v3 = (void *)PhotoLibraryServicesLibrary();
    v7[3] = (uint64_t)dlsym(v3, "PLCPLHasBeenEnabledForCurrentAccount");
    getPLCPLHasBeenEnabledForCurrentAccountSymbolLoc_ptr = (_UNKNOWN *)v7[3];
    BOOL v2 = (uint64_t (*)(void))v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (!v2)
  {
    unint64_t v5 = (_Unwind_Exception *)+[ICQDaemonOfferConditions isPhotosCloudEnabled]();
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v5);
  }
  return v2();
}

+ (BOOL)isPhotosOptimizeEnabled
{
  int v2 = [a1 isPhotosCloudEnabled];
  if (v2)
  {
    uint64_t v7 = 0;
    uint64_t v8 = &v7;
    uint64_t v9 = 0x2020000000;
    uint64_t v3 = (uint64_t (*)(void))getPLCloudPhotoLibraryKeepOriginalsIsEnabledSymbolLoc_ptr;
    v10 = getPLCloudPhotoLibraryKeepOriginalsIsEnabledSymbolLoc_ptr;
    if (!getPLCloudPhotoLibraryKeepOriginalsIsEnabledSymbolLoc_ptr)
    {
      id v4 = (void *)PhotoLibraryServicesLibrary();
      v8[3] = (uint64_t)dlsym(v4, "PLCloudPhotoLibraryKeepOriginalsIsEnabled");
      getPLCloudPhotoLibraryKeepOriginalsIsEnabledSymbolLoc_ptr = (_UNKNOWN *)v8[3];
      uint64_t v3 = (uint64_t (*)(void))v8[3];
    }
    _Block_object_dispose(&v7, 8);
    if (!v3)
    {
      unint64_t v5 = (_Unwind_Exception *)+[ICQDaemonOfferConditions isPhotosCloudEnabled]();
      _Block_object_dispose(&v7, 8);
      _Unwind_Resume(v5);
    }
    LOBYTE(v2) = v3() ^ 1;
  }
  return v2;
}

+ (NSNumber)photosLibrarySize
{
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  unint64_t v17 = __Block_byref_object_copy__8;
  uint64_t v18 = __Block_byref_object_dispose__8;
  int v2 = +[ICQDaemonOfferManager sharedDaemonOfferManager];
  id v19 = [v2 simulatedPhotosLibrarySize];

  uint64_t v3 = (void *)v15[5];
  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    uint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __45__ICQDaemonOfferConditions_photosLibrarySize__block_invoke;
    v10[3] = &unk_1E6A53480;
    id v7 = v6;
    id v11 = v7;
    v13 = &v14;
    uint64_t v8 = v5;
    uint64_t v12 = v8;
    +[_ICQHelperFunctions getPhotosLibrarySizeWithCompletion:v10];
    dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
    id v4 = (id)v15[5];
  }
  _Block_object_dispose(&v14, 8);

  return (NSNumber *)v4;
}

void __45__ICQDaemonOfferConditions_photosLibrarySize__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [*(id *)(a1 + 32) timeIntervalSinceNow];
  double v5 = v4;
  uint64_t v6 = _ICQGetLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [NSNumber numberWithDouble:-v5];
    int v11 = 138412290;
    uint64_t v12 = v7;
    _os_log_impl(&dword_1D5851000, v6, OS_LOG_TYPE_DEFAULT, "photosLibrarySize took %@ seconds", (uint8_t *)&v11, 0xCu);
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v3;
  id v10 = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

+ (NSNumber)photosLibraryUploadSize
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__8;
  id v19 = __Block_byref_object_dispose__8;
  id v3 = +[ICQDaemonOfferManager sharedDaemonOfferManager];
  id v20 = [v3 simulatedPhotosLibrarySize];

  double v4 = (void *)v16[5];
  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
    id v7 = [MEMORY[0x1E4F1C9C8] date];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __51__ICQDaemonOfferConditions_photosLibraryUploadSize__block_invoke;
    v11[3] = &unk_1E6A53480;
    id v8 = v7;
    id v12 = v8;
    uint64_t v14 = &v15;
    uint64_t v9 = v6;
    uint64_t v13 = v9;
    [a1 getPhotosLibraryUploadSizeWithCompletion:v11];
    dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
    id v5 = (id)v16[5];
  }
  _Block_object_dispose(&v15, 8);

  return (NSNumber *)v5;
}

void __51__ICQDaemonOfferConditions_photosLibraryUploadSize__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [*(id *)(a1 + 32) timeIntervalSinceNow];
  double v5 = v4;
  dispatch_semaphore_t v6 = _ICQGetLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [NSNumber numberWithDouble:-v5];
    int v11 = 138412290;
    id v12 = v7;
    _os_log_impl(&dword_1D5851000, v6, OS_LOG_TYPE_DEFAULT, "photosLibraryUploadSize took %@ seconds", (uint8_t *)&v11, 0xCu);
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v3;
  id v10 = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

+ (NSNumber)photosVideosCount
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  int v2 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2050000000;
  id v3 = (void *)getPLPhotoLibraryClass_softClass;
  uint64_t v17 = getPLPhotoLibraryClass_softClass;
  if (!getPLPhotoLibraryClass_softClass)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    id v19 = __getPLPhotoLibraryClass_block_invoke;
    id v20 = &unk_1E6A52090;
    v21 = &v14;
    __getPLPhotoLibraryClass_block_invoke((uint64_t)&buf);
    id v3 = (void *)v15[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v14, 8);
  double v5 = [v4 sharedPhotoLibrary];
  [v5 getPhotoCount:&v13 videoCount:&v12];

  [v2 timeIntervalSinceNow];
  double v7 = v6;
  uint64_t v8 = _ICQGetLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [NSNumber numberWithDouble:-v7];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v9;
    _os_log_impl(&dword_1D5851000, v8, OS_LOG_TYPE_DEFAULT, "photosVideosCount took %@ seconds", (uint8_t *)&buf, 0xCu);
  }
  id v10 = [NSNumber numberWithUnsignedInteger:v12 + v13];

  return (NSNumber *)v10;
}

+ (void)getPhotosLibraryUploadSizeWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2050000000;
  double v5 = (void *)getPLGatekeeperClientClass_softClass;
  uint64_t v16 = getPLGatekeeperClientClass_softClass;
  if (!getPLGatekeeperClientClass_softClass)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __getPLGatekeeperClientClass_block_invoke;
    v12[3] = &unk_1E6A52090;
    v12[4] = &v13;
    __getPLGatekeeperClientClass_block_invoke((uint64_t)v12);
    double v5 = (void *)v14[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v13, 8);
  double v7 = [v6 sharedInstance];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __69__ICQDaemonOfferConditions_getPhotosLibraryUploadSizeWithCompletion___block_invoke;
  v9[3] = &unk_1E6A534A8;
  id v10 = v4;
  id v11 = a1;
  id v8 = v4;
  [v7 getLibrarySizesFromDB:1 handler:v9];
}

void __69__ICQDaemonOfferConditions_getPhotosLibraryUploadSizeWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 40);
  id v4 = a2;
  int v5 = [v3 isPhotosCloudEnabled];
  uint64_t v6 = 32;
  if (v5) {
    uint64_t v6 = 16;
  }
  objc_msgSend(NSString, "stringWithFormat:", @"%lu", v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  double v7 = [v4 objectForKeyedSubscript:v8];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (BOOL)backupRestoreComplete
{
  return +[_ICQHelperFunctions userDefaultsBoolValueForKey:@"backupRestoreComplete"];
}

+ (BOOL)isSimulatedDeviceStorageAlmostFull
{
  int v2 = +[ICQDaemonOfferManager sharedDaemonOfferManager];
  char v3 = [v2 isSimulatedDeviceStorageAlmostFull];

  return v3;
}

+ (void)setSimulatedDeviceStorageAlmostFull:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[ICQDaemonOfferManager sharedDaemonOfferManager];
  [v4 setSimulatedDeviceStorageAlmostFull:v3];
}

+ (BOOL)isCachedCloudQuotaAlmostFullOrFull
{
  int v2 = +[ICQDaemonPersisted persistedObject];
  BOOL v3 = +[ICQDaemonPersisted persistedObject];
  id v4 = [v2 _cachedQuotaAvailable];
  uint64_t v5 = [v3 _cachedQuotaAvailable];
  uint64_t v6 = (void *)v5;
  if (v4) {
    double v7 = v4;
  }
  else {
    double v7 = (void *)v5;
  }
  id v8 = v7;
  if (v4) {
    BOOL v9 = v6 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    id v10 = [v2 retrievalDate];
    id v11 = [v3 retrievalDate];
    uint64_t v12 = [v10 compare:v11];

    if (v12 == -1)
    {
      id v14 = v6;

      id v8 = v14;
      goto LABEL_12;
    }
  }
  if (v8)
  {
LABEL_12:
    BOOL v13 = (unint64_t)[v8 longLongValue] < 0x1DCD6500;

    goto LABEL_13;
  }
  BOOL v13 = 0;
LABEL_13:

  return v13;
}

- (BOOL)isDeviceStorageAlmostFull
{
  return self->_deviceStorageAlmostFull;
}

- (void)setDeviceStorageAlmostFull:(BOOL)a3
{
  self->_deviceStorageAlmostFull = a3;
}

- (BOOL)isPhotosCloudEnabled
{
  return self->_photosCloudEnabled;
}

- (void)setPhotosCloudEnabled:(BOOL)a3
{
  self->_photosCloudEnabled = a3;
}

- (BOOL)isPhotosOptimizeEnabled
{
  return self->_photosOptimizeEnabled;
}

- (void)setPhotosOptimizeEnabled:(BOOL)a3
{
  self->_photosOptimizeEnabled = a3;
}

- (NSNumber)photosLibrarySize
{
  return self->_photosLibrarySize;
}

- (void)setPhotosLibrarySize:(id)a3
{
}

- (BOOL)isBackupRestoreComplete
{
  return self->_backupRestoreComplete;
}

- (void)setBackupRestoreComplete:(BOOL)a3
{
  self->_backupRestoreComplete = a3;
}

- (void).cxx_destruct
{
}

+ (uint64_t)isPhotosCloudEnabled
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return __getPLPhotoLibraryClass_block_invoke_cold_1(v0);
}

@end