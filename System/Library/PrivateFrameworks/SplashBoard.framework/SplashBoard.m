uint64_t XBInterfaceOrientationMaskForInterfaceOrientation(char a1)
{
  return (1 << a1) & 0x1E;
}

void sub_2232AD394(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2232AD3F0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2232AD49C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2232AD730(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id XBLogFetchRequests()
{
  if (XBLogFetchRequests_onceToken != -1) {
    dispatch_once(&XBLogFetchRequests_onceToken, &__block_literal_global_7);
  }
  v0 = (void *)XBLogFetchRequests___logObj;
  return v0;
}

uint64_t XBStatusBarStateMaskMatchesSettings(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __XBStatusBarStateMaskMatchesSettings_block_invoke;
  v7[3] = &unk_2646A5D28;
  v9 = &v10;
  id v4 = v3;
  id v8 = v4;
  XBEnumerateStatusBarStatesMatchingMask(a1, v7);
  uint64_t v5 = *((unsigned __int8 *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return v5;
}

void sub_2232AF844(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void XBEnumerateStatusBarStatesMatchingMask(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __XBEnumerateStatusBarStatesMatchingMask_block_invoke;
    v5[3] = &unk_2646A58D0;
    uint64_t v7 = a1;
    id v6 = v3;
    XBEnumerateStatusBarStates(v5);
  }
}

void XBEnumerateStatusBarStates(void *a1)
{
  v1 = a1;
  char v2 = 0;
  v1[2](v1, 0, &v2);
  if (!v2)
  {
    v1[2](v1, 1, &v2);
    if (!v2) {
      v1[2](v1, 2, &v2);
    }
  }
}

uint64_t __XBEnumerateStatusBarStatesMatchingMask_block_invoke(uint64_t result, char a2)
{
  if ((*(void *)(result + 40) & (1 << a2)) != 0) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

uint64_t __XBStatusBarStateMaskMatchesSettings_block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = XBStatusBarStateMatchesSettings(a2, *(void **)(a1 + 32));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a3 = 1;
  }
  return result;
}

uint64_t XBStatusBarStateMatchesSettings(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    if (a1)
    {
      [v3 style];
      uint64_t v5 = (a1 != 2) ^ UIStatusBarStyleIsDoubleHeight();
    }
    else
    {
      uint64_t v5 = [v3 isHidden];
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

id FAKE_NIL_PTR()
{
  if (FAKE_NIL_PTR_onceToken != -1) {
    dispatch_once(&FAKE_NIL_PTR_onceToken, &__block_literal_global_9);
  }
  v0 = (void *)FAKE_NIL_PTR___fakeNil;
  return v0;
}

uint64_t XBInterfaceOrientationMaskForInterfaceOrientationPair(uint64_t a1)
{
  uint64_t v1 = 24;
  if ((unint64_t)(a1 - 3) >= 2) {
    uint64_t v1 = 0;
  }
  if ((unint64_t)(a1 - 1) >= 2) {
    return v1;
  }
  else {
    return 6;
  }
}

uint64_t XBStatusBarStateMaskForStatusBarState(char a1)
{
  return (1 << a1);
}

id XBLogSnapshotReaper()
{
  if (XBLogSnapshotReaper_onceToken != -1) {
    dispatch_once(&XBLogSnapshotReaper_onceToken, &__block_literal_global_10);
  }
  v0 = (void *)XBLogSnapshotReaper___logObj;
  return v0;
}

void sub_2232B0B14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id XBLogFileManifest()
{
  if (XBLogFileManifest_onceToken != -1) {
    dispatch_once(&XBLogFileManifest_onceToken, &__block_literal_global_19);
  }
  v0 = (void *)XBLogFileManifest___logObj;
  return v0;
}

void sub_2232B18D0(_Unwind_Exception *a1)
{
  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 48));
  _Unwind_Resume(a1);
}

void sub_2232B1C84(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t XBApplicationSnapshotContentTypeMaskForContentType(char a1)
{
  return (1 << a1);
}

void sub_2232B1FC4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2232B21E8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t XBImageOrientationForInterfaceOrientationRotation(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = XBRotationDegreesForInterfaceOrientationRotation(a1, a2) % 360;
  if (v2 <= 89)
  {
    if (v2 != -180)
    {
      if (v2 == -90) {
        return 3;
      }
      return 0;
    }
    return 1;
  }
  if (v2 != 90) {
    return v2 == 180;
  }
  return 2;
}

uint64_t XBRotationDegreesForInterfaceOrientationRotation(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 90;
  uint64_t v3 = -90;
  uint64_t v4 = 180;
  if (a2 != 2) {
    uint64_t v4 = 0;
  }
  if (a2 != 4) {
    uint64_t v3 = v4;
  }
  if (a2 != 3) {
    uint64_t v2 = v3;
  }
  if (a2 == 1) {
    uint64_t v2 = 0;
  }
  uint64_t v5 = -90;
  uint64_t v6 = 90;
  uint64_t v7 = -180;
  if (a1 != 2) {
    uint64_t v7 = 0;
  }
  if (a1 != 4) {
    uint64_t v6 = v7;
  }
  if (a1 != 3) {
    uint64_t v5 = v6;
  }
  if (a1 == 1) {
    uint64_t v5 = 0;
  }
  uint64_t v8 = v5 + v2;
  uint64_t v9 = v8 + 360;
  if (v8 >= -180) {
    uint64_t v9 = v8;
  }
  if (v8 <= 180) {
    return v9;
  }
  else {
    return v8 - 360;
  }
}

void sub_2232B28BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_2232B2AFC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id XBLogSnapshot()
{
  if (XBLogSnapshot_onceToken != -1) {
    dispatch_once(&XBLogSnapshot_onceToken, &__block_literal_global);
  }
  v0 = (void *)XBLogSnapshot___logObj;
  return v0;
}

void sub_2232B2C50(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2232B4510(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __XBLogSnapshot_block_invoke()
{
  XBLogSnapshot___logObj = (uint64_t)os_log_create("com.apple.SplashBoard", "Snapshot");
  return MEMORY[0x270F9A758]();
}

id XBLogMemory()
{
  if (XBLogMemory_onceToken != -1) {
    dispatch_once(&XBLogMemory_onceToken, &__block_literal_global_4);
  }
  v0 = (void *)XBLogMemory___logObj;
  return v0;
}

uint64_t __XBLogMemory_block_invoke()
{
  XBLogMemory___logObj = (uint64_t)os_log_create("com.apple.SplashBoard", "Memory");
  return MEMORY[0x270F9A758]();
}

uint64_t __XBLogFetchRequests_block_invoke()
{
  XBLogFetchRequests___logObj = (uint64_t)os_log_create("com.apple.SplashBoard", "FetchRequests");
  return MEMORY[0x270F9A758]();
}

uint64_t __XBLogSnapshotReaper_block_invoke()
{
  XBLogSnapshotReaper___logObj = (uint64_t)os_log_create("com.apple.SplashBoard", "SnapshotReaper");
  return MEMORY[0x270F9A758]();
}

id XBLogDaemonLifecycle()
{
  if (XBLogDaemonLifecycle_onceToken != -1) {
    dispatch_once(&XBLogDaemonLifecycle_onceToken, &__block_literal_global_13);
  }
  v0 = (void *)XBLogDaemonLifecycle___logObj;
  return v0;
}

uint64_t __XBLogDaemonLifecycle_block_invoke()
{
  XBLogDaemonLifecycle___logObj = (uint64_t)os_log_create("com.apple.SplashBoard", "DaemonLifecycle");
  return MEMORY[0x270F9A758]();
}

id XBLogCapture()
{
  if (XBLogCapture_onceToken != -1) {
    dispatch_once(&XBLogCapture_onceToken, &__block_literal_global_16);
  }
  v0 = (void *)XBLogCapture___logObj;
  return v0;
}

uint64_t __XBLogCapture_block_invoke()
{
  XBLogCapture___logObj = (uint64_t)os_log_create("com.apple.SplashBoard", "Capture");
  return MEMORY[0x270F9A758]();
}

uint64_t __XBLogFileManifest_block_invoke()
{
  XBLogFileManifest___logObj = (uint64_t)os_log_create("com.apple.SplashBoard", "FileManifest");
  return MEMORY[0x270F9A758]();
}

id XBLogPurge()
{
  if (XBLogPurge_onceToken != -1) {
    dispatch_once(&XBLogPurge_onceToken, &__block_literal_global_22);
  }
  v0 = (void *)XBLogPurge___logObj;
  return v0;
}

uint64_t __XBLogPurge_block_invoke()
{
  XBLogPurge___logObj = (uint64_t)os_log_create("com.apple.SplashBoard", "Purge");
  return MEMORY[0x270F9A758]();
}

id XBLogCommon()
{
  if (XBLogCommon_onceToken != -1) {
    dispatch_once(&XBLogCommon_onceToken, &__block_literal_global_25);
  }
  v0 = (void *)XBLogCommon___logObj;
  return v0;
}

uint64_t __XBLogCommon_block_invoke()
{
  XBLogCommon___logObj = (uint64_t)os_log_create("com.apple.SplashBoard", "Common");
  return MEMORY[0x270F9A758]();
}

__CFString *XBStatusBarStateDescription(unint64_t a1)
{
  if (a1 > 2) {
    return @"invalid";
  }
  else {
    return off_2646A58F0[a1];
  }
}

__CFString *XBStatusBarStateMaskDescription(uint64_t a1)
{
  if (a1 == -1)
  {
    uint64_t v4 = @"All";
  }
  else
  {
    uint64_t v2 = [MEMORY[0x263EFF980] array];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __XBStatusBarStateMaskDescription_block_invoke;
    v6[3] = &unk_2646A5810;
    id v7 = v2;
    id v3 = v2;
    XBEnumerateStatusBarStatesMatchingMask(a1, v6);
    uint64_t v4 = [v3 componentsJoinedByString:@", "];
  }
  return v4;
}

uint64_t __XBStatusBarStateMaskDescription_block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (a2 > 2) {
    id v3 = @"invalid";
  }
  else {
    id v3 = off_2646A58F0[a2];
  }
  return [v2 addObject:v3];
}

__CFString *XBLaunchInterfaceTypeName(uint64_t a1)
{
  uint64_t v1 = @"(null)";
  if (a1 == 1) {
    uint64_t v1 = @"Storyboard";
  }
  if (a1) {
    return v1;
  }
  else {
    return @"XIB";
  }
}

uint64_t _XBInterfaceWithNameExistsInBundle(id *a1, void *a2, uint64_t *a3)
{
  id v5 = a2;
  if ([*a1 length])
  {
    id v6 = *a1;
    id v7 = [v6 pathExtension];
    if (v7)
    {
      uint64_t v8 = [v6 stringByDeletingPathExtension];

      uint64_t v9 = @"storyboardc";
      if (([v7 isEqualToString:@"storyboardc"] & 1) != 0
        || ([v7 isEqualToString:@"storyboard"] & 1) != 0)
      {
        uint64_t v10 = 1;
        goto LABEL_6;
      }
      uint64_t v9 = @"nib";
      if (([v7 isEqualToString:@"nib"] & 1) != 0
        || [v7 isEqualToString:@"xib"])
      {
        uint64_t v10 = 0;
LABEL_6:
        v11 = [v5 pathForResource:v8 ofType:v9 inDirectory:0];

        if (!v11)
        {
          uint64_t v10 = 0;
LABEL_21:
          id v13 = v8;
          *a1 = v13;

          goto LABEL_22;
        }
        goto LABEL_19;
      }
    }
    else
    {
      uint64_t v8 = v6;
    }
    uint64_t v12 = [v5 pathForResource:v8 ofType:@"storyboardc" inDirectory:0];

    if (v12)
    {
      uint64_t v10 = 1;
      if (!a3) {
        goto LABEL_21;
      }
    }
    else
    {
      uint64_t v10 = [v5 pathForResource:v8 ofType:@"nib" inDirectory:0];

      if (!v10) {
        goto LABEL_21;
      }
      if (!a3)
      {
LABEL_20:
        uint64_t v10 = 1;
        goto LABEL_21;
      }
      uint64_t v10 = 0;
    }
LABEL_19:
    *a3 = v10;
    goto LABEL_20;
  }
  uint64_t v10 = 0;
LABEL_22:

  return v10;
}

void sub_2232B7A90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL XBIsSymbolicLinkAtPath(void *a1)
{
  memset(&v3, 0, sizeof(v3));
  return !lstat((const char *)objc_msgSend(a1, "fileSystemRepresentation", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                            0,
                            0),
            &v3)
      && (v3.st_mode & 0xF000) == 40960;
}

double XBModificationDateForPath(void *a1)
{
  memset(&v3, 0, sizeof(v3));
  int v1 = stat((const char *)objc_msgSend(a1, "fileSystemRepresentation", 0, 0, 0, 0, 0, 0), &v3);
  double result = 0.0;
  if (!v1) {
    return (double)v3.st_mtimespec.tv_nsec / 1000000000.0 + (double)v3.st_mtimespec.tv_sec + -978307200.0;
  }
  return result;
}

BOOL XBEnsureDirectoryExistsAtPath(void *a1)
{
  id v1 = a1;
  int v2 = mkdir((const char *)[v1 fileSystemRepresentation], 0x1FFu);
  if (!v2 || v2 == -1 && *__error() == 17)
  {
    BOOL v3 = 1;
  }
  else
  {
    uint64_t v4 = [MEMORY[0x263F08850] defaultManager];
    id v7 = 0;
    [v4 createDirectoryAtPath:v1 withIntermediateDirectories:1 attributes:0 error:&v7];
    id v5 = v7;

    BOOL v3 = v5 == 0;
  }

  return v3;
}

id XBCachedNSHomeDirectory()
{
  if (XBCachedNSHomeDirectory_onceToken != -1) {
    dispatch_once(&XBCachedNSHomeDirectory_onceToken, &__block_literal_global_1);
  }
  v0 = (void *)XBCachedNSHomeDirectory_sHomeDir;
  return v0;
}

void __XBCachedNSHomeDirectory_block_invoke()
{
  NSHomeDirectory();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v2 copy];
  id v1 = (void *)XBCachedNSHomeDirectory_sHomeDir;
  XBCachedNSHomeDirectory_sHomeDir = v0;
}

id XBCachesPathForApplicationInfo(void *a1)
{
  id v1 = [a1 dataContainerURL];
  id v2 = [v1 path];
  BOOL v3 = XBCachesPathForSandboxPath(v2);

  return v3;
}

id XBCachesPathForSandboxPath(void *a1)
{
  id v1 = XBLibraryPathForSandboxPath(a1);
  id v2 = [v1 stringByAppendingPathComponent:@"Caches"];

  return v2;
}

id XBSnapshotPathForNonSandboxedSystemApplications()
{
  uint64_t v0 = XBSplashBoardPathForSandboxPath(0);
  id v1 = [v0 stringByAppendingPathComponent:@"Snapshots"];

  return v1;
}

id XBSplashBoardPathForSandboxPath(void *a1)
{
  id v1 = XBLibraryPathForSandboxPath(a1);
  id v2 = [v1 stringByAppendingPathComponent:@"SplashBoard"];

  return v2;
}

id XBSnapshotPathForBundleIdentifierWithSandboxPath(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = XBSplashBoardPathForSandboxPath(a2);
  id v5 = [v4 stringByAppendingPathComponent:@"Snapshots"];

  if (v3 && !a2)
  {
    uint64_t v6 = [v5 stringByAppendingPathComponent:v3];

    id v5 = (void *)v6;
  }

  return v5;
}

BOOL XBLegacyCachesSnapshotPathForNonSandboxedSystemApplicationsExists()
{
  uint64_t v0 = [MEMORY[0x263F08850] defaultManager];
  id v1 = XBLegacyCachesSnapshotPathForNonSandboxedSystemApplications();
  BOOL v2 = v1 && ([v0 fileExistsAtPath:v1] & 1) != 0;

  return v2;
}

id XBLegacyCachesSnapshotPathForNonSandboxedSystemApplications()
{
  uint64_t v0 = XBCachesPathForSandboxPath(0);
  id v1 = [v0 stringByAppendingPathComponent:@"Snapshots"];

  return v1;
}

uint64_t XBDeleteLegacyCachesSnapshotPathForSandboxedApplicationIfNeeded(void *a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v1 = a1;
  BOOL v2 = [v1 bundleIdentifier];
  id v3 = [v1 dataContainerURL];

  uint64_t v4 = [v3 path];

  if (v4)
  {
    id v5 = XBCachesPathForSandboxPath(v4);
    uint64_t v6 = [v5 stringByAppendingPathComponent:@"Snapshots"];

    id v7 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v8 = v7;
    if (v6 && [v7 fileExistsAtPath:v6])
    {
      uint64_t v9 = XBLogFileManifest();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v18 = v2;
        __int16 v19 = 2114;
        v20 = v4;
        __int16 v21 = 2114;
        v22 = v6;
        _os_log_impl(&dword_2232AB000, v9, OS_LOG_TYPE_DEFAULT, "Deleting legacy cache snapshots path for bundleID: %{public}@, sandboxPath: %{public}@, legacySnapshotsPath: %{public}@", buf, 0x20u);
      }

      id v16 = 0;
      char v10 = [v8 removeItemAtPath:v6 error:&v16];
      id v11 = v16;
      uint64_t v12 = v11;
      if ((v10 & 1) == 0 && v11)
      {
        id v13 = XBLogFileManifest();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138544130;
          v18 = v2;
          __int16 v19 = 2114;
          v20 = v4;
          __int16 v21 = 2114;
          v22 = v6;
          __int16 v23 = 2114;
          v24 = v12;
          _os_log_error_impl(&dword_2232AB000, v13, OS_LOG_TYPE_ERROR, "Error deleting legacy cache snapshots path for bundleID %{public}@, sandboxPath: %{public}@, legacySnapshotsPath: %{public}@: %{public}@", buf, 0x2Au);
        }
      }
      uint64_t v14 = 1;
    }
    else
    {
      uint64_t v14 = 0;
    }
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

uint64_t XBDeleteLegacyCachesSnapshotPathForNonSandboxedApplicationIfNeeded(void *a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v1 = [a1 bundleIdentifier];
  if (v1)
  {
    BOOL v2 = [MEMORY[0x263F08850] defaultManager];
    id v3 = XBLegacyCachesSnapshotPathForNonSandboxedSystemApplications();
    uint64_t v4 = [v3 stringByAppendingPathComponent:v1];
    if (v4 && [v2 fileExistsAtPath:v4])
    {
      id v5 = XBLogFileManifest();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v14 = v1;
        _os_log_impl(&dword_2232AB000, v5, OS_LOG_TYPE_DEFAULT, "Deleting legacy cache snapshots path for non-sandboxed system app: %{public}@", buf, 0xCu);
      }

      id v12 = 0;
      char v6 = [v2 removeItemAtPath:v4 error:&v12];
      id v7 = v12;
      uint64_t v8 = v7;
      if ((v6 & 1) == 0 && v7)
      {
        uint64_t v9 = XBLogFileManifest();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          uint64_t v14 = v1;
          __int16 v15 = 2114;
          id v16 = v4;
          __int16 v17 = 2114;
          v18 = v8;
          _os_log_error_impl(&dword_2232AB000, v9, OS_LOG_TYPE_ERROR, "Error deleting legacy cache snapshots path for non-sandboxed system app %{public}@ at %{public}@: %{public}@", buf, 0x20u);
        }
      }
      uint64_t v10 = 1;
    }
    else
    {
      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

void XBDeleteLegacyCachesSnapshotPathForNonSandboxedApplicationsIfNeeded()
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v0 = [MEMORY[0x263F08850] defaultManager];
  id v1 = XBLegacyCachesSnapshotPathForNonSandboxedSystemApplications();
  if (v1 && [v0 fileExistsAtPath:v1])
  {
    BOOL v2 = XBLogFileManifest();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v9 = v1;
      _os_log_impl(&dword_2232AB000, v2, OS_LOG_TYPE_DEFAULT, "Deleting legacy cache snapshots path for non-sandboxed system apps: %{public}@", buf, 0xCu);
    }

    id v7 = 0;
    char v3 = [v0 removeItemAtPath:v1 error:&v7];
    id v4 = v7;
    id v5 = v4;
    if ((v3 & 1) == 0 && v4)
    {
      char v6 = XBLogFileManifest();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        XBDeleteLegacyCachesSnapshotPathForNonSandboxedApplicationsIfNeeded_cold_1((uint64_t)v1, (uint64_t)v5, v6);
      }
    }
  }
}

id XBLibraryPathForSandboxPath(void *a1)
{
  id v1 = a1;
  if (!v1)
  {
    XBCachedNSHomeDirectory();
    id v1 = (id)objc_claimAutoreleasedReturnValue();
  }
  BOOL v2 = [v1 stringByAppendingPathComponent:@"Library"];

  return v2;
}

__CFString *XBApplicationSnapshotContentTypeDescription(unint64_t a1)
{
  if (a1 > 2) {
    return @"Unknown";
  }
  else {
    return off_2646A5908[a1];
  }
}

__CFString *XBApplicationSnapshotContentTypeMaskDescription(uint64_t a1)
{
  if (a1 != -1)
  {
    char v1 = a1;
    BOOL v2 = [MEMORY[0x263EFF980] array];
    char v3 = v2;
    if ((v1 & 4) != 0)
    {
      [v2 addObject:@"StaticDefault"];
      if ((v1 & 2) == 0)
      {
LABEL_4:
        if ((v1 & 1) == 0)
        {
LABEL_6:
          id v4 = [v3 componentsJoinedByString:@", "];

          goto LABEL_8;
        }
LABEL_5:
        [v3 addObject:@"SceneContent"];
        goto LABEL_6;
      }
    }
    else if ((v1 & 2) == 0)
    {
      goto LABEL_4;
    }
    [v3 addObject:@"GeneratedDefault"];
    if ((v1 & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  id v4 = @"All Types";
LABEL_8:
  return v4;
}

void sub_2232BA408(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

uint64_t XBInterfaceOrientationsAreOrthogonal(uint64_t a1, uint64_t a2)
{
  return ((unint64_t)(a1 - 1) < 2) ^ ((unint64_t)(a2 - 1) < 2);
}

uint64_t XBOppositeInterfaceOrientation(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3) {
    return 0;
  }
  else {
    return qword_2232D7140[a1 - 1];
  }
}

uint64_t XBNextClockwiseInterfaceOrientation(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3) {
    return 0;
  }
  else {
    return qword_2232D7160[a1 - 1];
  }
}

__CFString *XBStringForInterfaceOrientation(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3) {
    return 0;
  }
  else {
    return off_2646A5A68[a1 - 1];
  }
}

uint64_t XBInterfaceOrientationForString(void *a1)
{
  id v1 = a1;
  if (([v1 isEqualToString:@"Landscape"] & 1) != 0
    || ([v1 isEqualToString:@"LandscapeLeft"] & 1) != 0)
  {
    uint64_t v2 = 4;
  }
  else if ([v1 isEqualToString:@"LandscapeRight"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"PortraitUpsideDown"])
  {
    uint64_t v2 = 2;
  }
  else
  {
    uint64_t v2 = 1;
  }

  return v2;
}

uint64_t XBInterfaceOrientationForAffineTransform()
{
  if (BSFloatIsZero()) {
    return 1;
  }
  if (BSFloatEqualToFloat()) {
    return 4;
  }
  if (BSFloatEqualToFloat()) {
    return 3;
  }
  if (BSFloatEqualToFloat()) {
    return 2;
  }
  return 0;
}

uint64_t XBImageOrientationForInterfaceOrientation(uint64_t a1)
{
  if ((unint64_t)(a1 - 2) >= 3) {
    return 0;
  }
  else {
    return a1 - 1;
  }
}

uint64_t XBImageOrientationForRotationDegrees(uint64_t a1)
{
  uint64_t v1 = a1 % 360;
  if (a1 % 360 <= 89)
  {
    if (v1 != -180)
    {
      if (v1 == -90) {
        return 3;
      }
      return 0;
    }
    return 1;
  }
  if (v1 != 90) {
    return v1 == 180;
  }
  return 2;
}

uint64_t XBRotationDegreesForImageOrientation(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 6) {
    return 0;
  }
  else {
    return qword_2232D7180[a1 - 1];
  }
}

__CFString *XBImageOrientationDescription()
{
  uint64_t v1 = 180;
  uint64_t v2 = @"Down";
  switch((unint64_t)@"Down")
  {
    case 0uLL:
      char v3 = @"Up";
      return v3;
    case 1uLL:
      goto LABEL_16;
    case 2uLL:
      uint64_t v1 = 4294967206;
      uint64_t v2 = @"Left";
      goto LABEL_16;
    case 3uLL:
      uint64_t v1 = 90;
      uint64_t v2 = @"Right";
      goto LABEL_16;
    case 4uLL:
      char v3 = @"UpMirrored";
      return v3;
    case 5uLL:
      uint64_t v1 = 180;
      uint64_t v2 = @"DownMirrored";
      goto LABEL_16;
    case 6uLL:
      uint64_t v1 = 4294967206;
      uint64_t v2 = @"LeftMirrored";
      goto LABEL_16;
    case 7uLL:
      uint64_t v1 = 90;
      uint64_t v2 = @"RightMirrored";
LABEL_16:
      char v3 = [(__CFString *)v2 stringByAppendingFormat:@" (%d°)", v1];
      break;
    default:
      char v3 = 0;
      break;
  }
  return v3;
}

uint64_t _XBDebugCaptureIsEnabled()
{
  if (_XBDebugCaptureIsEnabled_onceToken != -1) {
    dispatch_once(&_XBDebugCaptureIsEnabled_onceToken, &__block_literal_global_3);
  }
  return _XBDebugCaptureIsEnabled_sEncodingEnabled;
}

void _XBPreparedLaunchInterfaceForCapture(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (a6) {
    goto LABEL_5;
  }
  if (_XBDebugCaptureIsEnabled_onceToken != -1) {
    dispatch_once(&_XBDebugCaptureIsEnabled_onceToken, &__block_literal_global_3);
  }
  if (_XBDebugCaptureIsEnabled_sEncodingEnabled)
  {
LABEL_5:
    __int16 v15 = XBLogCapture();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      _XBPreparedLaunchInterfaceForCapture_cold_1(v11, v15);
    }

    id v16 = NSString;
    __int16 v17 = [MEMORY[0x263F08AB0] processInfo];
    v18 = objc_msgSend(v16, "stringWithFormat:", @"splashboardd-%d", objc_msgSend(v17, "processIdentifier"));

    uint64_t v19 = NSString;
    v20 = [v12 bundleIdentifier];
    id v34 = v12;
    if ([v13 interfaceOrientation] == 1)
    {
      __int16 v21 = v11;
      v22 = @"UIInterfaceOrientationPortrait";
    }
    else
    {
      __int16 v21 = v11;
      if ([v13 interfaceOrientation] == 4)
      {
        v22 = @"UIInterfaceOrientationLandscapeLeft";
      }
      else if ([v13 interfaceOrientation] == 3)
      {
        v22 = @"UIInterfaceOrientationLandscapeRight";
      }
      else if ([v13 interfaceOrientation] == 2)
      {
        v22 = @"UIInterfaceOrientationPortraitUpsideDown";
      }
      else
      {
        v22 = 0;
      }
    }
    __int16 v23 = XBStringForUserInterfaceStyle([v13 userInterfaceStyle]);
    [v13 naturalSize];
    uint64_t v25 = v24;
    [v13 naturalSize];
    v27 = [v19 stringWithFormat:@"%@-%@-%@-%.fx%.f-%u", v20, v22, v23, v25, v26, a1];

    v28 = NSTemporaryDirectory();
    v29 = [NSString stringWithFormat:@"%@-%@.caar", v18, v27];
    v30 = [v28 stringByAppendingPathComponent:v29];

    if (a6) {
      *a6 = v30;
    }
    id v11 = v21;
    v31 = [v21 layer];
    id v32 = v30;
    [v32 UTF8String];
    CAEncodeLayerTreeToFile();

    v33 = XBLogCapture();
    id v12 = v34;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544130;
      id v36 = v32;
      __int16 v37 = 2114;
      id v38 = v34;
      __int16 v39 = 2114;
      id v40 = v13;
      __int16 v41 = 2114;
      id v42 = v14;
      _os_log_impl(&dword_2232AB000, v33, OS_LOG_TYPE_DEFAULT, "splashboardd wrote an encoded launch interface to: %{public}@\nappInfo: %{public}@\nlaunchRequest: %{public}@\nlaunchInterface: %{public}@", buf, 0x2Au);
    }
  }
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_2232BD24C(_Unwind_Exception *a1)
{
  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 96));
  _Unwind_Resume(a1);
}

void sub_2232BD57C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,os_activity_scope_state_s state)
{
}

void sub_2232BDA7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t OUTLINED_FUNCTION_2()
{
  return objc_opt_class();
}

void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_2232BEE74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2232BF6D0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2232BF760(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

__CFString *NSStringFromXBApplicationSnapshotOnDiskFormat(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) > 4) {
    return @"(unknown)";
  }
  else {
    return off_2646A5DC0[a1 + 1];
  }
}

uint64_t XBApplicationSnapshotOnDiskFormatForFileExtension(void *a1)
{
  id v1 = a1;
  if ([v1 caseInsensitiveCompare:@"png"])
  {
    if ([v1 caseInsensitiveCompare:@"ktx"])
    {
      if ([v1 caseInsensitiveCompare:@"jpeg"])
      {
        if ([v1 caseInsensitiveCompare:@"jpg"]) {
          uint64_t v2 = -1;
        }
        else {
          uint64_t v2 = 3;
        }
      }
      else
      {
        uint64_t v2 = 3;
      }
    }
    else
    {
      uint64_t v2 = 1;
    }
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

void sub_2232C0440(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2232C0744(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2232C0884(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2232C08FC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2232C0B84(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2232C0F44(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2232C1164(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2232C1274(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_2232C1488(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_2232C16A0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2232C29F8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2232C2C3C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2232C2CF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_2232C2D78(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2232C2E24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_2232C38B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
  objc_sync_exit(v16);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t _XBTrackDeletionPreferencesChangedHandler()
{
  return +[XBApplicationSnapshotManifest handleTrackingStateChange];
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void _fsEventStreamCallback(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v31 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (a3)
  {
    uint64_t v9 = 0;
    uint64_t v10 = @"path";
    id v11 = @"fileID";
    *(void *)&long long v8 = 138543362;
    long long v30 = v8;
    do
    {
      if ((*(_DWORD *)(a5 + 4 * v9) & 0x100200) != 0)
      {
        id v12 = [v7 objectAtIndex:v9];
        id v13 = [v12 objectForKeyedSubscript:v10];
        uint64_t v14 = [v12 objectForKeyedSubscript:v11];
        __int16 v15 = (void *)v14;
        if (v13 && v14)
        {
          id v16 = v7;
          __int16 v17 = v11;
          v18 = v10;
          uint64_t v19 = XBLogFileManifest();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v30;
            id v38 = v13;
            _os_log_impl(&dword_2232AB000, v19, OS_LOG_TYPE_DEFAULT, "fsEventStream: file removed at %{public}@", buf, 0xCu);
          }

          v35 = @"LaunchImageDeleted";
          id v36 = v13;
          v20 = [NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
          [v31 addObject:v20];

          uint64_t v10 = v18;
          id v11 = v17;
          id v7 = v16;
        }
      }
      ++v9;
    }
    while (a3 != v9);
  }
  if (objc_msgSend(v31, "count", v30))
  {
    uint64_t v21 = __LastLogEventTime;
    if (*(double *)&__LastLogEventTime == 0.0
      || (BSContinuousMachTimeNow(), v22 - *(double *)&__LastLogEventTime >= 300.0))
    {
      BSContinuousMachTimeNow();
      __LastLogEventTime = v23;
      id v24 = objc_alloc_init(MEMORY[0x263F7C080]);
      uint64_t v25 = [MEMORY[0x263F08AB0] processInfo];
      uint64_t v26 = [v25 processName];
      v27 = [v24 signatureWithDomain:@"SplashBoard" type:@"Manifest" subType:@"LaunchImagesDeleted" subtypeContext:0 detectedProcess:v26 triggerThresholdValues:0];

      uint64_t v28 = *MEMORY[0x263F7C088];
      v33[0] = *MEMORY[0x263F7C090];
      v33[1] = v28;
      v34[0] = MEMORY[0x263EFFA80];
      v34[1] = MEMORY[0x263EFFA80];
      v29 = [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:2];
      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = ___fsEventStreamCallback_block_invoke;
      v32[3] = &__block_descriptor_40_e22_v16__0__NSDictionary_8l;
      v32[4] = v21;
      [v24 snapshotWithSignature:v27 duration:v31 events:0 payload:v29 actions:v32 reply:0.0];
    }
  }
}

void sub_2232C8A5C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_2232C917C(_Unwind_Exception *a1)
{
  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 120));
  _Unwind_Resume(a1);
}

void sub_2232CB32C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_2232CC700(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void ___fsEventStreamCallback_block_invoke(uint64_t a1, void *a2)
{
  char v3 = [a2 objectForKeyedSubscript:*MEMORY[0x263F7C160]];
  int v4 = [v3 BOOLValue];

  id v5 = __ManifestFSEventsQueue;
  if (v4)
  {
    dispatch_async(v5, &__block_literal_global_439);
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = ___fsEventStreamCallback_block_invoke_3;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = *(void *)(a1 + 32);
    dispatch_async((dispatch_queue_t)__ManifestFSEventsQueue, block);
  }
}

uint64_t ___fsEventStreamCallback_block_invoke_2()
{
  uint64_t result = BSContinuousMachTimeNow();
  __LastLogEventTime = v1;
  return result;
}

double ___fsEventStreamCallback_block_invoke_3(uint64_t a1)
{
  double result = *(double *)(a1 + 32);
  __LastLogEventTime = *(void *)&result;
  return result;
}

void OUTLINED_FUNCTION_0_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_6(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_10(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_11(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

uint64_t XBIsInternalInstall()
{
  return MEMORY[0x270EDAB30]("com.apple.SplashBoard");
}

void sub_2232CDBF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a65, 8);
  _Block_object_dispose(&a71, 8);
  _Block_object_dispose(&STACK[0x220], 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void sub_2232CE1CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_2232CF9EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2232D07B0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 240), 8);
  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

__CFString *XBStringForUserInterfaceStyle(unint64_t a1)
{
  if (a1 > 2) {
    return 0;
  }
  else {
    return off_2646A6580[a1];
  }
}

BOOL XBValidateStoryboard(void *a1, void *a2, void *a3)
{
  return XBValidateResource(a1, @"storyboardc", 1, a2, a3);
}

BOOL XBValidateResource(void *a1, void *a2, int a3, void *a4, void *a5)
{
  uint64_t v84 = *MEMORY[0x263EF8340];
  double v9 = COERCE_DOUBLE(a1);
  id v10 = a2;
  id v11 = a4;
  SecStaticCodeRef staticCode = 0;
  id v12 = XBLogCapture();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    double v79 = v9;
    __int16 v80 = 2114;
    id v81 = v10;
    __int16 v82 = 2114;
    id v83 = v11;
    _os_log_impl(&dword_2232AB000, v12, OS_LOG_TYPE_DEFAULT, "Validating resource %{public}@.%{public}@ in %{public}@", buf, 0x20u);
  }

  id v13 = v11;
  uint64_t v14 = [0 pathExtension];
  int v15 = [v14 isEqualToString:v10];

  if (v15)
  {
    *(double *)&uint64_t v16 = [*(id *)&v9 stringByDeletingPathExtension];

    double v9 = *(double *)&v16;
  }
  uint64_t v17 = [v13 pathForResource:*(void *)&v9 ofType:v10];
  v18 = v13;
  id v69 = v13;
  if (v17
    || ([MEMORY[0x263F086E0] mainBundle],
        v18 = objc_claimAutoreleasedReturnValue(),
        v13,
        [v18 pathForResource:*(void *)&v9 ofType:v10],
        (uint64_t v17 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v19 = a5;
    v67 = v18;
    v68 = (void *)v17;
    uint64_t v20 = [v13 bundleIdentifier];
    uint64_t v21 = (void *)v20;
    if (v20) {
      double v22 = (__CFString *)v20;
    }
    else {
      double v22 = &stru_26D65DBC8;
    }
    uint64_t v23 = v22;

    id v24 = v13;
    uint64_t v25 = [v24 infoDictionary];
    uint64_t v26 = [v25 objectForKeyedSubscript:*MEMORY[0x263EFFB70]];

    if (!v26)
    {
      v27 = [v24 infoDictionary];
      uint64_t v28 = [v27 objectForKeyedSubscript:*MEMORY[0x263EFFAA0]];

      if (v28) {
        uint64_t v26 = (__CFString *)v28;
      }
      else {
        uint64_t v26 = &stru_26D65DBC8;
      }
    }

    if (v26) {
      v29 = v26;
    }
    else {
      v29 = &stru_26D65DBC8;
    }
    long long v30 = v29;

    uint64_t v31 = SecStaticCodeCreateWithPath((CFURLRef)[v24 bundleURL], 0, &staticCode);
    if (v31)
    {
      id v32 = [NSString stringWithFormat:@"Failed to create SecStaticCodeRef: %d, %@ v%@", v31, v23, v30];
      v33 = XBLogCapture();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        XBValidateResource_cold_1();
      }

      v18 = v67;
      if (!v19)
      {
        BOOL v39 = 0;
        id v40 = v68;
LABEL_46:

        goto LABEL_47;
      }
      id v34 = [XBLaunchImageError alloc];
      uint64_t v35 = [v24 bundleIdentifier];
      id v36 = [NSString stringWithFormat:@"Bundle validation failed: %@", v32];
      __int16 v37 = v34;
      id v38 = (void *)v35;
      *uint64_t v19 = [(XBLaunchImageError *)v37 initWithCode:11 bundleID:v35 reason:v36 fatal:0];

      BOOL v39 = 0;
      id v40 = v68;
    }
    else
    {
      id v40 = v68;
      id v32 = [NSURL fileURLWithPath:v68];
      uint64_t v41 = [MEMORY[0x263EFF910] date];
      id v42 = (void *)v41;
      if (a3)
      {
        v65 = (void *)v41;
        id v66 = v10;
        id v43 = objc_alloc_init(MEMORY[0x263F08850]);
        uint64_t v44 = *MEMORY[0x263EFF6A8];
        uint64_t v77 = *MEMORY[0x263EFF6A8];
        BOOL v39 = 1;
        v45 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v77 count:1];
        v64 = v43;
        v46 = [v43 enumeratorAtURL:v32 includingPropertiesForKeys:v45 options:4 errorHandler:0];

        long long v73 = 0u;
        long long v74 = 0u;
        long long v71 = 0u;
        long long v72 = 0u;
        id v47 = v46;
        uint64_t v48 = [v47 countByEnumeratingWithState:&v71 objects:v76 count:16];
        if (v48)
        {
          uint64_t v49 = v48;
          v62 = v32;
          double v63 = v9;
          uint64_t v50 = *(void *)v72;
          while (2)
          {
            for (uint64_t i = 0; i != v49; ++i)
            {
              if (*(void *)v72 != v50) {
                objc_enumerationMutation(v47);
              }
              v52 = *(void **)(*((void *)&v71 + 1) + 8 * i);
              id v70 = 0;
              [v52 getResourceValue:&v70 forKey:v44 error:0];
              id v53 = v70;
              if (([v53 BOOLValue] & 1) == 0 && !validateFile(v23, v30, v52, (uint64_t)staticCode, v19))
              {

                BOOL v39 = 0;
                goto LABEL_40;
              }
            }
            uint64_t v49 = [v47 countByEnumeratingWithState:&v71 objects:v76 count:16];
            if (v49) {
              continue;
            }
            break;
          }
          BOOL v39 = 1;
LABEL_40:
          id v32 = v62;
          double v9 = v63;
        }

        id v10 = v66;
        v18 = v67;
        id v40 = v68;
        id v42 = v65;
      }
      else
      {
        BOOL v39 = validateFile(v23, v30, v32, (uint64_t)staticCode, v19);
        v18 = v67;
      }
      v57 = v42;
      [v42 timeIntervalSinceNow];
      double v59 = v58;
      v60 = XBLogCapture();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v79 = -v59;
        _os_log_impl(&dword_2232AB000, v60, OS_LOG_TYPE_DEFAULT, "Validated resource in %fs", buf, 0xCu);
      }

      CFRelease(staticCode);
      id v38 = v57;
    }

    goto LABEL_46;
  }
  id v40 = [NSString stringWithFormat:@"Could not find the resource '%@' in bundle %@.", *(void *)&v9, v18];
  v54 = XBLogCapture();
  if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
    XBValidateResource_cold_1();
  }

  if (!a5)
  {
    BOOL v39 = 0;
    goto LABEL_48;
  }
  v55 = [XBLaunchImageError alloc];
  [v13 bundleIdentifier];
  v56 = a5;
  uint64_t v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
  long long v30 = [NSString stringWithFormat:@"Bundle validation couldn't find resource: %@", v40];
  BOOL v39 = 0;
  void *v56 = [(XBLaunchImageError *)v55 initWithCode:1 bundleID:v23 reason:v30 fatal:0];
LABEL_47:

  id v13 = v69;
LABEL_48:

  return v39;
}

BOOL XBValidateNib(void *a1, void *a2, void *a3)
{
  return XBValidateResource(a1, @"nib", 0, a2, a3);
}

BOOL validateFile(void *a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8 = a1;
  id v9 = a2;
  id v10 = a3;
  id v11 = XBLogCapture();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    validateFile_cold_2();
  }

  int v12 = SecStaticCodeValidateResourceWithErrors();
  if (v12)
  {
    if (v12 == -67054)
    {
      [NSString stringWithFormat:@"Security error errSecCSBadResource reading resource from bundle: %@, path: '%@'", v8, v10, v18, v19];
    }
    else if (v12 == -67062)
    {
      [NSString stringWithFormat:@"Cannot validate resource. Bundle is not codesigned: %@, %@ v%@", v10, v8, v9, v19];
    }
    else
    {
      [NSString stringWithFormat:@"Security error %ld reading resource from bundle: %@, %@ v%@", objc_msgSend(0, "code"), v10, v8, v9];
    id v13 = };
  }
  else
  {
    id v13 = 0;
  }
  if (v13)
  {
    uint64_t v14 = XBLogCapture();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      validateFile_cold_1();
    }

    if (a5)
    {
      int v15 = [XBLaunchImageError alloc];
      uint64_t v16 = [NSString stringWithFormat:@"Resource validation failed: %@", v13];
      *a5 = [(XBLaunchImageError *)v15 initWithCode:11 bundleID:v8 reason:v16 fatal:0];
    }
  }

  return v13 == 0;
}

void XBDeleteLegacyCachesSnapshotPathForNonSandboxedApplicationsIfNeeded_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_2232AB000, log, OS_LOG_TYPE_ERROR, "Error deleting legacy cache snapshots path for non-sandboxed system apps %{public}@: %{public}@", (uint8_t *)&v3, 0x16u);
}

void _XBPreparedLaunchInterfaceForCapture_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v3 = [a1 recursiveDescription];
  int v4 = 138412290;
  __int16 v5 = v3;
  _os_log_debug_impl(&dword_2232AB000, a2, OS_LOG_TYPE_DEBUG, "dumping caar for view hierarchy:\n %@", (uint8_t *)&v4, 0xCu);
}

void XBValidateResource_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_2232AB000, v0, v1, "%{public}@", v2, v3, v4, v5, v6);
}

void validateFile_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_2232AB000, v0, v1, "Resource validation error: %{public}@", v2, v3, v4, v5, v6);
}

void validateFile_cold_2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_2232AB000, v0, OS_LOG_TYPE_DEBUG, "Resource validation working on %@", v1, 0xCu);
}

uint64_t BSContinuousMachTimeNow()
{
  return MEMORY[0x270F2D108]();
}

uint64_t BSCreateDeserializedBSXPCEncodableObjectFromXPCDictionaryWithKey()
{
  return MEMORY[0x270F2D110]();
}

uint64_t BSCreateDeserializedCFValueFromXPCDictionaryWithKey()
{
  return MEMORY[0x270F2D118]();
}

uint64_t BSDeserializeArrayOfBSXPCEncodableObjectsFromXPCDictionaryWithKey()
{
  return MEMORY[0x270F2D120]();
}

uint64_t BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey()
{
  return MEMORY[0x270F2D128]();
}

uint64_t BSDeserializeCGFloatFromXPCDictionaryWithKey()
{
  return MEMORY[0x270F2D130]();
}

uint64_t BSDeserializeCGSizeFromXPCDictionaryWithKey()
{
  return MEMORY[0x270F2D138]();
}

uint64_t BSDeserializeDataFromXPCDictionaryWithKey()
{
  return MEMORY[0x270F2D140]();
}

uint64_t BSDispatchBlockCreateWithQualityOfService()
{
  return MEMORY[0x270F2D148]();
}

uint64_t BSDispatchMain()
{
  return MEMORY[0x270F2D150]();
}

uint64_t BSDispatchQueueAssert()
{
  return MEMORY[0x270F2D158]();
}

uint64_t BSDispatchQueueCreateSerial()
{
  return MEMORY[0x270F2D160]();
}

uint64_t BSDispatchQueueCreateSerialWithQoS()
{
  return MEMORY[0x270F2D168]();
}

uint64_t BSDispatchQueueCreateWithQualityOfService()
{
  return MEMORY[0x270F2D170]();
}

uint64_t BSEarlierDate()
{
  return MEMORY[0x270F2D178]();
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x270F2D180]();
}

uint64_t BSEqualStrings()
{
  return MEMORY[0x270F2D188]();
}

uint64_t BSFloatEqualToFloat()
{
  return MEMORY[0x270F2D190]();
}

uint64_t BSFloatIsZero()
{
  return MEMORY[0x270F2D198]();
}

uint64_t BSPthreadCurrentEffectiveQualityOfService()
{
  return MEMORY[0x270F2D1A0]();
}

uint64_t BSRadiansFromAffineTransform()
{
  return MEMORY[0x270F2D1A8]();
}

uint64_t BSSerializeArrayOfBSXPCEncodableObjectsToXPCDictionaryWithKey()
{
  return MEMORY[0x270F2D1B8]();
}

uint64_t BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey()
{
  return MEMORY[0x270F2D1C0]();
}

uint64_t BSSerializeCFValueToXPCDictionaryWithKey()
{
  return MEMORY[0x270F2D1C8]();
}

uint64_t BSSerializeCGFloatToXPCDictionaryWithKey()
{
  return MEMORY[0x270F2D1D0]();
}

uint64_t BSSerializeCGSizeToXPCDictionaryWithKey()
{
  return MEMORY[0x270F2D1D8]();
}

uint64_t BSSettingFlagDescription()
{
  return MEMORY[0x270F2D1E0]();
}

uint64_t BSSettingFlagForBool()
{
  return MEMORY[0x270F2D1E8]();
}

uint64_t CAEncodeLayerTreeToFile()
{
  return MEMORY[0x270EFB7A0]();
}

CATransform3D *__cdecl CATransform3DMakeAffineTransform(CATransform3D *__return_ptr retstr, CGAffineTransform *m)
{
  return (CATransform3D *)MEMORY[0x270EFB930](retstr, m);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x270EE47E0](allocator, capacity);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x270EE4D08](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

uint64_t CGImageCreateFromIOSurface()
{
  return MEMORY[0x270EF4ED0]();
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x270EF4F20](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x270EF4F48](idst);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x270EE67C0](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x270EE6800](image);
}

uint64_t CGImageGetImageProvider()
{
  return MEMORY[0x270EE6810]();
}

uint64_t CGImageProviderCopyIOSurface()
{
  return MEMORY[0x270EE6898]();
}

void CGImageRelease(CGImageRef image)
{
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x270EE6908](image);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7238]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

FSEventStreamRef FSEventStreamCreate(CFAllocatorRef allocator, FSEventStreamCallback callback, FSEventStreamContext *context, CFArrayRef pathsToWatch, FSEventStreamEventId sinceWhen, CFTimeInterval latency, FSEventStreamCreateFlags flags)
{
  return (FSEventStreamRef)MEMORY[0x270EE84F0](allocator, callback, context, pathsToWatch, sinceWhen, *(void *)&flags, latency);
}

void FSEventStreamInvalidate(FSEventStreamRef streamRef)
{
}

void FSEventStreamRelease(FSEventStreamRef streamRef)
{
}

void FSEventStreamSetDispatchQueue(FSEventStreamRef streamRef, dispatch_queue_t q)
{
}

Boolean FSEventStreamStart(FSEventStreamRef streamRef)
{
  return MEMORY[0x270EE8528](streamRef);
}

void FSEventStreamStop(FSEventStreamRef streamRef)
{
}

uint64_t FigCreateCGImageFromIOSurface()
{
  return MEMORY[0x270F15BC8]();
}

uint64_t FigCreateIOSurfaceFromJPEG()
{
  return MEMORY[0x270F15BD0]();
}

OSType IOSurfaceGetPixelFormat(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4D80](buffer);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2AD0]();
}

uint64_t NSLocalizedFileSizeDescription()
{
  return MEMORY[0x270EF2B10]();
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x270F05EA8]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

OSStatus SecStaticCodeCreateWithPath(CFURLRef path, SecCSFlags flags, SecStaticCodeRef *staticCode)
{
  return MEMORY[0x270EFDC88](path, *(void *)&flags, staticCode);
}

uint64_t SecStaticCodeValidateResourceWithErrors()
{
  return MEMORY[0x270EFDC98]();
}

uint64_t UIApplicationSceneClassicModeForString()
{
  return MEMORY[0x270F05F90]();
}

uint64_t UIApplicationSceneCompatibilityModeForString()
{
  return MEMORY[0x270F05F98]();
}

uint64_t UIApplicationSceneStringForClassicMode()
{
  return MEMORY[0x270F05FA0]();
}

uint64_t UIApplicationSceneStringForCompatibilityMode()
{
  return MEMORY[0x270F05FA8]();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x270F06078](image);
}

uint64_t UIStatusBarStyleIsDoubleHeight()
{
  return MEMORY[0x270F06298]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _UIImageJPEGRepresentation()
{
  return MEMORY[0x270F06370]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

uint64_t _bs_set_crash_log_message()
{
  return MEMORY[0x270F2D220]();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x270ED8028](dso, description, activity, *(void *)&flags);
}

void _os_activity_initiate(void *dso, const char *description, os_activity_flag_t flags, os_block_t activity_block)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x270ED9468](label, attr, target);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return MEMORY[0x270ED9518](source);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

dispatch_workloop_t dispatch_workloop_create(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x270ED95C8](label);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x270ED98D0](*(void *)&a1, *(void *)&a2);
}

int ffsctl(int a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x270ED9940](*(void *)&a1, a2, a3, *(void *)&a4);
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x270ED9AB8](a1, a2, a3, *(void *)&a4);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDA120](a1, a2);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x270EDA518](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x270EDAA68](log, ptr);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x270EDAA90]();
}

void os_unfair_lock_assert_not_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDB568](a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x270EDBC30](*(void *)&__fd, __buf, __nbyte);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC050](xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC088](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}