@interface PLDiskController
+ (BOOL)freeSpaceBelowDesiredSpaceThresholdForPath:(id)a3;
+ (id)mountPointForPath:(id)a3;
+ (id)sharedInstance;
+ (int64_t)diskSpaceAvailableForPath:(id)a3;
+ (int64_t)diskSpaceAvailableForUse;
+ (int64_t)fileSystemSizeForPath:(id)a3;
+ (int64_t)freeDiskSpaceThreshold;
- (BOOL)hasEnoughDiskToTakePicture;
- (PLDiskController)init;
- (int64_t)bytesToAutomaticallyClear;
- (void)_actuallyUpdateCookie;
- (void)_diskSpaceDidBecomeLow;
- (void)_updateCookie;
- (void)dealloc;
- (void)updateAvailableDiskSpace;
@end

@implementation PLDiskController

- (int64_t)bytesToAutomaticallyClear
{
  return 5 * self->_bytesRequiredForPhoto;
}

- (BOOL)hasEnoughDiskToTakePicture
{
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    return 1;
  }
  [(PLDiskController *)self updateAvailableDiskSpace];
  return (*(unsigned char *)&self->_flags & 2) == 0;
}

- (void)updateAvailableDiskSpace
{
  $C32D55F661429721DB3F1451F78C0B31 flags = self->_flags;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  if (Current - self->_lastFSCheck >= 2.0)
  {
    self->_lastFSCheck = Current;
    *(_DWORD *)&self->_flags &= ~2u;
    v5 = objc_opt_class();
    v6 = NSHomeDirectory();
    int64_t v7 = [v5 diskSpaceAvailableForPath:v6];

    BOOL v8 = v7 < self->_bytesRequiredForPhoto;
    $C32D55F661429721DB3F1451F78C0B31 v9 = self->_flags;
    self->_$C32D55F661429721DB3F1451F78C0B31 flags = ($C32D55F661429721DB3F1451F78C0B31)(*(_DWORD *)&v9 & 0xFFFFFFFD | (2 * v8));
    if (v8)
    {
      NSLog((NSString *)@"*** Not enough space to take a picture. Available space is %lld", v7);
      $C32D55F661429721DB3F1451F78C0B31 v10 = self->_flags;
      if ((*(unsigned char *)&flags & 2) != 0)
      {
        if ((*(unsigned char *)&v10 & 4) != 0)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.mobileslideshow-diskSpaceDidBecomeLow", 0, 0, 1u);
        }
      }
      else
      {
        self->_$C32D55F661429721DB3F1451F78C0B31 flags = ($C32D55F661429721DB3F1451F78C0B31)(*(_DWORD *)&v10 | 1);
        [(PLDiskController *)self _updateCookie];
        if ((*(unsigned char *)&self->_flags & 4) == 0)
        {
          id v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
          [v12 postNotificationName:@"PLDiskSpaceDidBecomeLowNotification" object:0];
        }
      }
    }
    else if (*(unsigned char *)&v9)
    {
      self->_$C32D55F661429721DB3F1451F78C0B31 flags = ($C32D55F661429721DB3F1451F78C0B31)(*(_DWORD *)&v9 & 0xFFFFFFFC | (2 * v8));
      [(PLDiskController *)self _updateCookie];
    }
  }
}

- (void)_updateCookie
{
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    [(PLDiskController *)self _actuallyUpdateCookie];
  }
  else
  {
    [(PLDiskController *)self performSelectorOnMainThread:sel__actuallyUpdateCookie withObject:0 waitUntilDone:0];
  }
}

- (void)_actuallyUpdateCookie
{
  v3 = (CFPropertyListRef *)MEMORY[0x1E4F1CFD0];
  if ((*(_DWORD *)&self->_flags & 1) == 0) {
    v3 = (CFPropertyListRef *)MEMORY[0x1E4F1CFC8];
  }
  CFPreferencesSetAppValue(@"DiskSpaceWasLow", *v3, @"com.apple.mobileslideshow");
  CFPreferencesAppSynchronize(@"com.apple.mobileslideshow");
  if ((~*(_DWORD *)&self->_flags & 5) == 0)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.mobileslideshow-diskSpaceDidBecomeLow", 0, 0, 1u);
  }
}

- (void)_diskSpaceDidBecomeLow
{
  $C32D55F661429721DB3F1451F78C0B31 flags = self->_flags;
  self->_$C32D55F661429721DB3F1451F78C0B31 flags = ($C32D55F661429721DB3F1451F78C0B31)(*(_DWORD *)&flags | 1);
  if ((*(unsigned char *)&flags & 1) == 0)
  {
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 postNotificationName:@"PLDiskSpaceDidBecomeLowNotification" object:0];
  }
}

- (PLDiskController)init
{
  v11.receiver = self;
  v11.super_class = (Class)PLDiskController;
  v2 = [(PLDiskController *)&v11 init];
  if (v2)
  {
    v2->_lastFSCheck = CFAbsoluteTimeGetCurrent() + -2.0;
    v2->_bytesRequiredForPhoto = [MEMORY[0x1E4F16478] maxLivePhotoDataSize];
    if (MGGetBoolAnswer()) {
      v2->_bytesRequiredForPhoto *= 4;
    }
    Boolean keyExistsAndHasValidFormat = 0;
    if (CFPreferencesGetAppBooleanValue(@"DiskSpaceWasLow", @"com.apple.mobileslideshow", &keyExistsAndHasValidFormat))
    {
      BOOL v3 = 1;
    }
    else
    {
      BOOL v3 = keyExistsAndHasValidFormat == 0;
    }
    int v4 = v3;
    if (v3) {
      int v5 = 2;
    }
    else {
      int v5 = 0;
    }
    v2->_$C32D55F661429721DB3F1451F78C0B31 flags = ($C32D55F661429721DB3F1451F78C0B31)(*(_DWORD *)&v2->_flags & 0xFFFFFFFC | v4 | v5);
    pl_dispatch_once(&PLIsReallyAssetsd_didCheckReadOnly, &__block_literal_global_54_3819);
    int v6 = (PLIsReallyAssetsd_isAssetsd != 0) | __PLIsAssetsdProxyService & 1;
    if ((PLIsReallyAssetsd_isAssetsd != 0) | __PLIsAssetsdProxyService & 1) {
      int v7 = 4;
    }
    else {
      int v7 = 0;
    }
    v2->_$C32D55F661429721DB3F1451F78C0B31 flags = ($C32D55F661429721DB3F1451F78C0B31)(*(_DWORD *)&v2->_flags & 0xFFFFFFFB | v7);
    if (!v6)
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)DiskSpaceDidBecomeLow, @"com.apple.mobileslideshow-diskSpaceDidBecomeLow", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    }
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.mobileslideshow-diskSpaceDidBecomeLow", 0);
  int v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)PLDiskController;
  [(PLDiskController *)&v5 dealloc];
}

+ (BOOL)freeSpaceBelowDesiredSpaceThresholdForPath:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__PLDiskController_freeSpaceBelowDesiredSpaceThresholdForPath___block_invoke;
  block[3] = &unk_1E58A2238;
  block[4] = &v14;
  if (freeSpaceBelowDesiredSpaceThresholdForPath__onceToken != -1) {
    dispatch_once(&freeSpaceBelowDesiredSpaceThresholdForPath__onceToken, block);
  }
  if (*((unsigned char *)v15 + 24))
  {
    BOOL v5 = 1;
  }
  else
  {
    int v6 = [a1 mountPointForPath:v4];
    if (v6)
    {
      int v7 = [(id)freeSpaceBelowDesiredSpaceThresholdForPath__mountPointToThreshold objectForKeyedSubscript:v6];
      if (v7
        || (objc_super v11 = [[PLVolumeInfo alloc] initWithMountPoint:v6],
            (id v12 = v11) != 0)
        && (objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", -[PLVolumeInfo desiredDiskThreshold](v11, "desiredDiskThreshold")), int v7 = objc_claimAutoreleasedReturnValue(), objc_msgSend((id)freeSpaceBelowDesiredSpaceThresholdForPath__mountPointToThreshold, "setObject:forKeyedSubscript:", v7, v6), v12, v7))
      {
        uint64_t v8 = [a1 diskSpaceAvailableForPath:v4];
        BOOL v9 = v8 < [v7 longLongValue];
        *((unsigned char *)v15 + 24) = v9;
      }
    }

    BOOL v5 = *((unsigned char *)v15 + 24) != 0;
  }
  _Block_object_dispose(&v14, 8);

  return v5;
}

uint64_t __63__PLDiskController_freeSpaceBelowDesiredSpaceThresholdForPath___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = CFPreferencesGetAppBooleanValue(@"PLForceLowDiskSpace", @"com.apple.mobileslideshow", 0) != 0;
  freeSpaceBelowDesiredSpaceThresholdForPath__mountPointToThreshold = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  return MEMORY[0x1F41817F8]();
}

+ (id)mountPointForPath:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = v4;
  if (!v4)
  {
    uint64_t v14 = PLBackendGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v27.f_bsize) = 0;
      v15 = "nil path for mountPoint";
      uint64_t v16 = v14;
      uint32_t v17 = 2;
LABEL_11:
      _os_log_impl(&dword_19BCFB000, v16, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v27, v17);
    }
LABEL_12:

    goto LABEL_13;
  }
  if (([v4 hasPrefix:@"/"] & 1) == 0)
  {
    uint64_t v14 = PLBackendGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v27.f_bsize = 138412290;
      *(void *)&v27.f_iosize = v5;
      v15 = "Path %@ must be an absolute path, retuning nil for mount point";
      uint64_t v16 = v14;
      uint32_t v17 = 12;
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  memset(&v27, 0, 512);
  id v6 = v5;
  if (!statfs((const char *)[v6 fileSystemRepresentation], &v27))
  {
    if (v27.f_mntonname[0])
    {
      v13 = [NSString stringWithUTF8String:v27.f_mntonname];
      goto LABEL_27;
    }
LABEL_13:
    v13 = 0;
    goto LABEL_27;
  }
  int v7 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v6];
  id v24 = 0;
  uint64_t v8 = *MEMORY[0x1E4F1C960];
  id v23 = 0;
  int v9 = [v7 getResourceValue:&v24 forKey:v8 error:&v23];
  id v10 = v24;
  id v11 = v23;
  id v12 = v11;
  if (!v9 || v11)
  {
    v18 = [v6 stringByDeletingLastPathComponent];
    while (([v18 isEqualToString:&stru_1EEBF74F0] & 1) == 0)
    {
      if ([v18 isEqualToString:@"/Volumes"])
      {
        v20 = PLBackendGetLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v26 = v6;
          _os_log_impl(&dword_19BCFB000, v20, OS_LOG_TYPE_ERROR, "Searched up to '/Volumes', cannot find mount point for '%@', returning nil for mount point", buf, 0xCu);
        }

        break;
      }
      uint64_t v19 = [a1 mountPointForPath:v18];
      if (v19)
      {
        v13 = (void *)v19;
        goto LABEL_25;
      }
    }
    v13 = 0;
LABEL_25:
  }
  else
  {
    v13 = [v10 path];
  }

LABEL_27:
  v21 = PLBackendGetLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v27.f_bsize = 138412546;
    *(void *)&v27.f_iosize = v5;
    WORD2(v27.f_blocks) = 2112;
    *(uint64_t *)((char *)&v27.f_blocks + 6) = (uint64_t)v13;
    _os_log_impl(&dword_19BCFB000, v21, OS_LOG_TYPE_DEFAULT, "Mount point for %@: %@", (uint8_t *)&v27, 0x16u);
  }

  return v13;
}

+ (int64_t)fileSystemSizeForPath:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [a1 mountPointForPath:a3];
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v10 = 0;
    BOOL v5 = [v4 attributesOfFileSystemForPath:v3 error:&v10];
    id v6 = v10;

    if (v5)
    {
      int v7 = [v5 objectForKey:*MEMORY[0x1E4F283B0]];
      int64_t v8 = [v7 unsignedLongLongValue];
    }
    else
    {
      int v7 = PLBackendGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v12 = v3;
        __int16 v13 = 2112;
        uint64_t v14 = v6;
        _os_log_impl(&dword_19BCFB000, v7, OS_LOG_TYPE_ERROR, "Unable to get file system attributes for %@: %@", buf, 0x16u);
      }
      int64_t v8 = -1;
    }
  }
  else
  {
    id v6 = PLBackendGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19BCFB000, v6, OS_LOG_TYPE_ERROR, "Missing path to get free space", buf, 2u);
    }
    int64_t v8 = -1;
  }

  return v8;
}

+ (int64_t)diskSpaceAvailableForPath:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v14 = 0;
    id v6 = [v5 attributesOfFileSystemForPath:v4 error:&v14];
    int v7 = v14;

    if (v6)
    {
      int64_t v8 = [v6 objectForKey:*MEMORY[0x1E4F283A0]];
      uint64_t v9 = [v8 unsignedLongLongValue];

      uint64_t v10 = [a1 freeDiskSpaceThreshold];
      if (v9 <= v10) {
        int64_t v11 = 0;
      }
      else {
        int64_t v11 = v9 - v10;
      }
    }
    else
    {
      id v12 = PLBackendGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v16 = v4;
        __int16 v17 = 2112;
        v18 = v7;
        _os_log_impl(&dword_19BCFB000, v12, OS_LOG_TYPE_ERROR, "Unable to get file system attributes for %@: %@", buf, 0x16u);
      }

      int64_t v11 = -1;
    }
  }
  else
  {
    int v7 = PLBackendGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19BCFB000, v7, OS_LOG_TYPE_ERROR, "Missing path to get free space", buf, 2u);
    }
    int64_t v11 = -1;
  }

  return v11;
}

+ (int64_t)diskSpaceAvailableForUse
{
  BOOL v3 = NSHomeDirectory();
  int64_t v4 = [a1 diskSpaceAvailableForPath:v3];

  return v4;
}

+ (int64_t)freeDiskSpaceThreshold
{
  if ((freeDiskSpaceThreshold_didSetFreeDiskSpaceThreshold & 1) == 0)
  {
    v2 = (void *)MGCopyAnswer();
    BOOL v3 = [v2 objectForKey:*MEMORY[0x1E4FBA0E0]];
    freeDiskSpaceThreshold_freeDiskSpaceThreshold = [v3 longLongValue];

    freeDiskSpaceThreshold_didSetFreeDiskSpaceThreshold = 1;
  }
  return freeDiskSpaceThreshold_freeDiskSpaceThreshold;
}

+ (id)sharedInstance
{
  pl_dispatch_once(&sharedInstance_pl_once_token_17, &__block_literal_global_12568);
  v2 = (void *)sharedInstance_pl_once_object_17;
  return v2;
}

uint64_t __34__PLDiskController_sharedInstance__block_invoke()
{
  sharedInstance_pl_once_object_17 = objc_alloc_init(PLDiskController);
  return MEMORY[0x1F41817F8]();
}

@end