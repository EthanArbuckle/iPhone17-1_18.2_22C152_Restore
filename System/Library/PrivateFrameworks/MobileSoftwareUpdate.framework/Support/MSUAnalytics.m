@interface MSUAnalytics
- (BOOL)addCacheDeleteInfoToDictionary:(id)a3;
- (BOOL)addMobileAssetStatsToDictionary:(id)a3;
- (BOOL)addSoftwareUpdateInfoToDictionary:(id)a3;
- (MSUAnalytics)initWithPhase:(int)a3;
- (OS_dispatch_queue)SSOQueue;
- (OS_dispatch_queue)mainQueue;
- (id)copyAnalyticsData;
- (id)copyAnalyticsDataForPreflight;
- (id)copyAppleConnectPersonID;
- (id)copyGenericAnalyticsData;
- (id)copySerialNumber;
- (id)getStringForPhase;
- (int)updatePhase;
- (void)addTargetVolumeDriveInfoToDictionary:(id)a3;
- (void)setMainQueue:(id)a3;
- (void)setSSOQueue:(id)a3;
- (void)setUpdatePhase:(int)a3;
@end

@implementation MSUAnalytics

- (MSUAnalytics)initWithPhase:(int)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MSUAnalytics;
  v4 = [(MSUAnalytics *)&v9 init];
  if (v4)
  {
    dispatch_queue_t v5 = dispatch_queue_create("MSUAnalyticsMainQueue", 0);
    [(MSUAnalytics *)v4 setMainQueue:v5];

    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("MSUAnalyticsSSOQueue", v6);
    [(MSUAnalytics *)v4 setSSOQueue:v7];

    v4->_updatePhase = a3;
  }
  return v4;
}

- (id)getStringForPhase
{
  v3 = [(MSUAnalytics *)self mainQueue];
  dispatch_assert_queue_V2(v3);

  unsigned int v4 = [(MSUAnalytics *)self updatePhase];
  if (v4 > 5) {
    return @"Invalid";
  }
  else {
    return *(&off_100059388 + (int)v4);
  }
}

- (BOOL)addSoftwareUpdateInfoToDictionary:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = [(MSUAnalytics *)self mainQueue];
  dispatch_assert_queue_V2(v5);

  if (v4)
  {
    [v4 setObject:@"UNKNOWN" forKeyedSubscript:@"updateDownloaded"];
    CFBooleanRef v11 = (const __CFBoolean *)CFPreferencesCopyValue(@"SUAutomaticUpdateV2Enabled", @"com.apple.softwareupdateservicesd", @"mobile", kCFPreferencesAnyHost);
    if (v11)
    {
      CFBooleanRef v17 = v11;
      CFTypeID v18 = CFGetTypeID(v11);
      if (v18 == CFBooleanGetTypeID())
      {
        int Value = CFBooleanGetValue(v17);
        v30 = "Disabled";
        if (Value == 1) {
          v30 = "Enabled";
        }
        logfunction(", 1, @"AutoUpdate is %s\n"", v25, v26, v27, v28, v29, (char)v30);
        if (CFBooleanGetValue(v17) == 1) {
          CFStringRef v31 = @"ON";
        }
        else {
          CFStringRef v31 = @"OFF";
        }
      }
      else
      {
        logfunction(", 1, @"Unable to determine AutoUpdate status\n"", v19, v20, v21, v22, v23, v54);
        CFStringRef v31 = @"UNKNOWN";
      }
      [v4 setObject:v31 forKeyedSubscript:@"AutoUpdate"];
      CFRelease(v17);
    }
    else
    {
      logfunction(", 1, @"Unable to determine AutoUpdate status\n"", v12, v13, v14, v15, v16, v54);
      [v4 setObject:@"UNKNOWN" forKeyedSubscript:@"AutoUpdate"];
    }
    CFBooleanRef v32 = (const __CFBoolean *)CFPreferencesCopyValue(@"SUDisableAutoDownload", @"com.apple.softwareupdateservicesd", @"mobile", kCFPreferencesAnyHost);
    if (v32)
    {
      CFBooleanRef v38 = v32;
      CFTypeID v39 = CFGetTypeID(v32);
      if (v39 == CFBooleanGetTypeID())
      {
        int v45 = CFBooleanGetValue(v38);
        v51 = "Enabled";
        if (v45 == 1) {
          v51 = "Disabled";
        }
        logfunction(", 1, @"AutoDownload is %s\n"", v46, v47, v48, v49, v50, (char)v51);
        if (CFBooleanGetValue(v38) == 1) {
          CFStringRef v52 = @"OFF";
        }
        else {
          CFStringRef v52 = @"ON";
        }
      }
      else
      {
        logfunction(", 1, @"Unable to determine AutoDownload status\n"", v40, v41, v42, v43, v44, v55);
        CFStringRef v52 = @"UNKNOWN";
      }
      [v4 setObject:v52 forKeyedSubscript:@"AutoDownload"];
      CFRelease(v38);
    }
    else
    {
      logfunction(", 1, @"Default not found. AutoDownload is enabled\n"", v33, v34, v35, v36, v37, v55);
      [v4 setObject:@"ON" forKeyedSubscript:@"AutoDownload"];
    }
  }
  else
  {
    logfunction(", 1, @"Invalid dict passed to %s\n", v6, v7, v8, v9, v10, (char)"-[MSUAnalytics addSoftwareUpdateInfoToDictionary:]"");
  }

  return v4 != 0;
}

- (BOOL)addCacheDeleteInfoToDictionary:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = [(MSUAnalytics *)self mainQueue];
  dispatch_assert_queue_V2(v5);

  if (v4)
  {
    logfunction(", 1, @"Attempting to determine purgable space on system\n"", v6, v7, v8, v9, v10, v19);
    CFErrorRef v21 = 0;
    uint64_t v11 = purgeable_data_space(4, &v21);
    if (v21)
    {
      logfunction(", 1, @"Failed to get available purgable space.\n"", v12, v13, v14, v15, v16, v20);
      [v4 setObject:@"UNKNOWN" forKeyedSubscript:@"purgeableSpaceMB"];
    }
    else
    {
      CFBooleanRef v17 = +[NSNumber numberWithLongLong:v11 / 0x100000];
      [v4 setObject:v17 forKeyedSubscript:@"purgeableSpaceMB"];
    }
  }
  else
  {
    logfunction(", 1, @"Invalid dictionary passed to %s\n", v6, v7, v8, v9, v10, (char)"-[MSUAnalytics addCacheDeleteInfoToDictionary:]"");
  }

  return v4 != 0;
}

- (BOOL)addMobileAssetStatsToDictionary:(id)a3
{
  id v24 = a3;
  uint64_t v27 = +[NSFileManager defaultManager];
  v44[0] = NSURLFileResourceTypeKey;
  v44[1] = NSURLFileAllocatedSizeKey;
  uint64_t v26 = +[NSArray arrayWithObjects:v44 count:2];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v28 = [&off_100064B98 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v28)
  {
    unint64_t v31 = 0;
    uint64_t v25 = *(void *)v39;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v39 != v25) {
          objc_enumerationMutation(&off_100064B98);
        }
        uint64_t v30 = v3;
        uint64_t v29 = +[NSURL URLWithString:*(void *)(*((void *)&v38 + 1) + 8 * v3)];
        id v4 = objc_msgSend(v27, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:");
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        id v5 = [v4 countByEnumeratingWithState:&v34 objects:v42 count:16];
        if (v5)
        {
          id v6 = v5;
          uint64_t v7 = *(void *)v35;
          do
          {
            for (i = 0; i != v6; i = (char *)i + 1)
            {
              if (*(void *)v35 != v7) {
                objc_enumerationMutation(v4);
              }
              uint64_t v9 = *(void **)(*((void *)&v34 + 1) + 8 * i);
              id v33 = 0;
              unsigned int v10 = [v9 getResourceValue:&v33 forKey:NSURLFileResourceTypeKey error:0];
              id v11 = v33;
              uint64_t v12 = v11;
              if (v10 && [v11 isEqualToString:NSURLFileResourceTypeRegular])
              {
                id v32 = 0;
                unsigned int v13 = [v9 getResourceValue:&v32 forKey:NSURLFileAllocatedSizeKey error:0];
                id v14 = v32;
                uint64_t v15 = v14;
                if (v13) {
                  v31 += (unint64_t)[v14 unsignedIntegerValue];
                }
              }
              else
              {
                uint64_t v15 = 0;
              }
            }
            id v6 = [v4 countByEnumeratingWithState:&v34 objects:v42 count:16];
          }
          while (v6);
        }

        uint64_t v3 = v30 + 1;
      }
      while ((id)(v30 + 1) != v28);
      id v28 = [&off_100064B98 countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v28);
  }
  else
  {
    unint64_t v31 = 0;
  }
  uint64_t v16 = +[NSNumber numberWithUnsignedInteger:v31 >> 20];
  logfunction(", 1, @"Total Size taken by MobileAssets is %@MB\n"", v17, v18, v19, v20, v21, (char)v16);

  uint64_t v22 = +[NSNumber numberWithUnsignedInteger:v31 >> 20];
  [v24 setObject:v22 forKeyedSubscript:@"mobileAssetsSpaceMB"];

  return 0;
}

BOOL __48__MSUAnalytics_addMobileAssetStatsToDictionary___block_invoke(id a1, NSURL *a2, NSError *a3)
{
  logfunction(", 1, @"Directory enumerator error while sizing MobileAsset usage: %@\n"", v3, v4, v5, v6, v7, (char)a3);
  return 1;
}

- (void)addTargetVolumeDriveInfoToDictionary:(id)a3
{
  logfunction(", 1, @"add_persistent_target_volume_metrics: nothing to do.\n"", v3, v4, v5, v6, v7, v8);
}

- (id)copySerialNumber
{
  v2 = (void *)MGCopyAnswer();
  if (!v2)
  {
    CFStringRef v8 = @"NO";
LABEL_6:
    objc_opt_class();
    objc_opt_isKindOfClass();
    logfunction(", 1, @"Unable to determine serial number: ValidObject: %@ isString: %@\n"", v9, v10, v11, v12, v13, (char)v8);

    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    CFStringRef v8 = @"YES";
    goto LABEL_6;
  }
  logfunction(", 1, @"Successfully read serial number : %@\n"", v3, v4, v5, v6, v7, (char)v2);
  return v2;
}

- (id)copyAppleConnectPersonID
{
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__1;
  uint64_t v22 = __Block_byref_object_dispose__1;
  id v23 = 0;
  uint64_t v3 = dlopen("/usr/lib/libSoftwareUpdateSSO.dylib", 2);
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = dlsym(v3, "copyPersonID");
    uint64_t v6 = (unsigned int (*)(const __CFString *))dlsym(v4, "MSUSSOIsAvailable");
    if (v5 && v6)
    {
      if (v6(@"177666"))
      {
        uint64_t v12 = [(MSUAnalytics *)self SSOQueue];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = __40__MSUAnalytics_copyAppleConnectPersonID__block_invoke;
        block[3] = &unk_100059340;
        block[4] = &v18;
        block[5] = v5;
        dispatch_sync(v12, block);
      }
      else
      {
        logfunction(", 1, @"AppleConnect framework unavailable. Unable to read personID\n"", v7, v8, v9, v10, v11, v16);
      }
    }
    else
    {
      NSLog(@"Unable to load symbols to copyPersonID from libSoftwareUpdateSSO");
    }
  }
  else
  {
    uint64_t v13 = dlerror();
    NSLog(@"Failed to open SoftwareUpdateSSO dylib with error: %s", v13);
  }
  id v14 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v14;
}

void __40__MSUAnalytics_copyAppleConnectPersonID__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)NSMutableDictionary);
  [v2 setObject:&__kCFBooleanTrue forKeyedSubscript:@"stealthMode"];
  uint64_t v3 = *(void (**)(id, id *))(a1 + 40);
  id v14 = 0;
  uint64_t v4 = v3(v2, &v14);
  id v5 = v14;
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v4;

  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
    BOOL v13 = v5 == 0;
  }
  else {
    BOOL v13 = 0;
  }
  if (!v13) {
    logfunction(", 1, @"Failed to read personID : %@\n"", v8, v9, v10, v11, v12, (char)v5);
  }
}

- (id)copyAnalyticsDataForPreflight
{
  uint64_t v3 = [(MSUAnalytics *)self mainQueue];
  dispatch_assert_queue_V2(v3);

  id v9 = objc_alloc_init((Class)NSMutableDictionary);
  if (v9)
  {
    [(MSUAnalytics *)self addSoftwareUpdateInfoToDictionary:v9];
    [(MSUAnalytics *)self addCacheDeleteInfoToDictionary:v9];
    [(MSUAnalytics *)self addMobileAssetStatsToDictionary:v9];
    [(MSUAnalytics *)self addTargetVolumeDriveInfoToDictionary:v9];
    if (MGGetBoolAnswer())
    {
      id v15 = [(MSUAnalytics *)self copyAppleConnectPersonID];
      if (v15) {
        [v9 setObject:v15 forKeyedSubscript:@"personId"];
      }
      id v16 = [(MSUAnalytics *)self copySerialNumber];
      if (v16) {
        [v9 setObject:v16 forKeyedSubscript:@"serialNumber"];
      }
    }
    logfunction(", 1, @"UsageInfoForPreflight is %@\n"", v10, v11, v12, v13, v14, (char)v9);
    id v17 = v9;
  }
  else
  {
    logfunction(", 1, @"Failed to allocate downloadInfo dict for additional preflight data\n"", v4, v5, v6, v7, v8, v19);
  }

  return v9;
}

- (id)copyGenericAnalyticsData
{
  uint64_t v3 = [(MSUAnalytics *)self mainQueue];
  dispatch_assert_queue_V2(v3);

  id v9 = objc_alloc_init((Class)NSMutableDictionary);
  if (v9)
  {
    if (MGGetBoolAnswer())
    {
      if ([(MSUAnalytics *)self updatePhase] == 5)
      {
        logfunction(", 1, @"Skipping collection of personID for updateFinished\n"", v10, v11, v12, v13, v14, v39);
      }
      else
      {
        logfunction(", 1, @"Attempting to read personID\n"", v10, v11, v12, v13, v14, v39);
        id v25 = [(MSUAnalytics *)self copyAppleConnectPersonID];
        if (v25)
        {
          logfunction(", 1, @"Successfully read personID: %@\n"", v20, v21, v22, v23, v24, (char)v25);
          [v9 setObject:v25 forKeyedSubscript:@"personId"];
        }
        else
        {
          logfunction(", 1, @"Failed to read personID\n"", v20, v21, v22, v23, v24, v41);
        }
      }
      logfunction(", 1, @"Attempting to read serial number\n"", v15, v16, v17, v18, v19, v40);
      id v31 = [(MSUAnalytics *)self copySerialNumber];
      if (v31)
      {
        logfunction(", 1, @"Successfully read serial number %@\n"", v26, v27, v28, v29, v30, (char)v31);
        [v9 setObject:v31 forKeyedSubscript:@"serialNumber"];
      }
      else
      {
        logfunction(", 1, @"Failed to read serial number\n"", v26, v27, v28, v29, v30, v42);
      }
    }
    [(MSUAnalytics *)self addTargetVolumeDriveInfoToDictionary:v9];
    logfunction(", 1, @"Additional analytics data is %@\n"", v32, v33, v34, v35, v36, (char)v9);
    id v37 = v9;
  }
  else
  {
    logfunction(", 1, @"Failed to allocate downloadInfo dict for additional generic data\n"", v4, v5, v6, v7, v8, v39);
  }

  return v9;
}

- (id)copyAnalyticsData
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__1;
  uint64_t v11 = __Block_byref_object_dispose__1;
  id v12 = 0;
  uint64_t v3 = [(MSUAnalytics *)self mainQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __33__MSUAnalytics_copyAnalyticsData__block_invoke;
  v6[3] = &unk_100059368;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

int *__33__MSUAnalytics_copyAnalyticsData__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (![*(id *)(a1 + 32) updatePhase]
    || [*(id *)(a1 + 32) updatePhase] >= 6)
  {
    CFStringRef v15 = @"Invalid phase set in MSUAnalytics object\n";
LABEL_4:
    return logfunction("", 1, v15, v10, v11, v12, v13, v14, a9);
  }
  uint64_t v17 = [*(id *)(a1 + 32) getStringForPhase];
  logfunction(", 1, @"Attempting to gather analytics data for phase : %@\n"", v18, v19, v20, v21, v22, (char)v17);

  unsigned int v23 = [*(id *)(a1 + 32) updatePhase];
  if (v23 - 3 >= 3)
  {
    if (v23 != 2)
    {
      CFStringRef v15 = @"Copying data for this phase is currently unsupported.\n";
      goto LABEL_4;
    }
    id v24 = [*(id *)(a1 + 32) copyAnalyticsDataForPreflight];
  }
  else
  {
    id v24 = [*(id *)(a1 + 32) copyGenericAnalyticsData];
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = v24;
  return (int *)_objc_release_x1();
}

- (int)updatePhase
{
  return self->_updatePhase;
}

- (void)setUpdatePhase:(int)a3
{
  self->_updatePhase = a3;
}

- (OS_dispatch_queue)mainQueue
{
  return self->_mainQueue;
}

- (void)setMainQueue:(id)a3
{
}

- (OS_dispatch_queue)SSOQueue
{
  return self->_SSOQueue;
}

- (void)setSSOQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_SSOQueue, 0);
  objc_storeStrong((id *)&self->_mainQueue, 0);
}

@end