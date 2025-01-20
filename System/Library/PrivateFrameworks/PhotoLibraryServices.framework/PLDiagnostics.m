@interface PLDiagnostics
+ (BOOL)shouldSuppressRadarUserNotificationWithMessage:(id)a3 radarTitle:(id)a4;
+ (BOOL)tapToRadarKitDisabled;
+ (id)_memoriesRelatedOutputPathBaseDirectoryWithPathManager:(id)a3;
+ (id)_tapToRadarProcessName;
+ (id)createOrEmptyMemoriesRelatedSnapshotOutputFolderWithPathManager:(id)a3;
+ (id)diagnosticsURLs;
+ (id)excludingNameExpression;
+ (id)logDirectoryURL;
+ (id)matchingNameExpression;
+ (id)memoriesAndRelatedDiagnosticsOutputURLWithPathManager:(id)a3;
+ (int64_t)_deviceClassesFromDeviceClassesString:(id)a3;
+ (unint64_t)addOSStateHandlerWithTitle:(id)a3 queue:(id)a4 propertyListHandler:(id)a5;
+ (void)_fallBackTapToRadarWithTitle:(id)a3 description:(id)a4 radarComponent:(int64_t)a5;
+ (void)_radarComponentDetailsForComponent:(int64_t)a3 reply:(id)a4;
+ (void)_tapToRadarKitDraftWithTitle:(id)a3 description:(id)a4 radarComponent:(int64_t)a5 isUserInitiated:(BOOL)a6 displayReason:(id)a7 attachments:(id)a8;
+ (void)collectMomentsStatWithLibraryContext:(id)a3 completionBlock:(id)a4;
+ (void)enumerateDiagnosticsURLsIncludingPropertyiesForKeys:(id)a3 handler:(id)a4;
+ (void)fileRadarUserNotificationWithHeader:(id)a3 message:(id)a4 radarTitle:(id)a5 radarDescription:(id)a6;
+ (void)fileRadarUserNotificationWithHeader:(id)a3 message:(id)a4 radarTitle:(id)a5 radarDescription:(id)a6 radarComponent:(int64_t)a7 diagnosticTTRType:(signed __int16)a8 attachments:(id)a9 extensionItem:(id)a10;
+ (void)requestTapToRadarAuthorizationWithCompletion:(id)a3;
+ (void)tapToRadarWithTitle:(id)a3 description:(id)a4 radarComponent:(int64_t)a5 isUserInitiated:(BOOL)a6 displayReason:(id)a7 attachments:(id)a8;
@end

@implementation PLDiagnostics

+ (void)collectMomentsStatWithLibraryContext:(id)a3 completionBlock:(id)a4
{
  v55[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = (void (**)(id, void *, void))a4;
  v7 = [MEMORY[0x1E4F1CA60] dictionary];
  v8 = (void *)MEMORY[0x1E4F1C0D0];
  v9 = +[PLMoment entityName];
  v10 = [v8 fetchRequestWithEntityName:v9];

  [v10 setResultType:2];
  [v10 setPropertiesToFetch:&unk_1EEBF2540];
  v11 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"cachedCount" ascending:1];
  v54 = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v54 count:1];
  [v10 setSortDescriptors:v12];

  id v52 = 0;
  v13 = [v5 executeFetchRequest:v10 error:&v52];
  id v14 = v52;
  if (!v14 && v13)
  {
    v42 = v10;
    v43 = v7;
    v44 = v6;
    id v45 = v5;
    unint64_t v47 = [v13 count];
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    v40 = v13;
    id v15 = v13;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v48 objects:v53 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      unint64_t v18 = 0;
      uint64_t v19 = 0;
      uint64_t v20 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v49 != v20) {
            objc_enumerationMutation(v15);
          }
          v22 = *(void **)(*((void *)&v48 + 1) + 8 * i);
          v23 = (void *)MEMORY[0x19F38D3B0]();
          v24 = [v22 objectForKeyedSubscript:@"cachedCount"];
          uint64_t v25 = [v24 unsignedIntegerValue];

          v18 += v25;
          if (v25 == 1) {
            ++v19;
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v48 objects:v53 count:16];
      }
      while (v17);
    }
    else
    {
      unint64_t v18 = 0;
      uint64_t v19 = 0;
    }

    unint64_t v26 = v47;
    objc_msgSend(v15, "valueForKeyPath:", @"cachedCount", v40);
    id v27 = (id)objc_claimAutoreleasedReturnValue();
    unint64_t v46 = v18 / v47;
    if ([v27 count])
    {
      id v5 = v45;
      if ([v27 count] == 1)
      {
        v28 = [v27 firstObject];
        uint64_t v29 = [v28 integerValue];
        v13 = v41;
      }
      else
      {
        v28 = [v27 sortedArrayUsingSelector:sel_compare_];
        char v30 = [v27 count];
        unint64_t v31 = (unint64_t)[v28 count] >> 1;
        if (v30)
        {
          v32 = [v28 objectAtIndex:v31];
          uint64_t v29 = [v32 integerValue];
        }
        else
        {
          v32 = [v28 objectAtIndex:v31 - 1];
          v55[0] = v32;
          v33 = [v28 objectAtIndex:v31];
          v55[1] = v33;
          v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:2];
          v35 = [v34 valueForKeyPath:@"@avg.self"];
          uint64_t v29 = [v35 integerValue];
        }
        v13 = v41;

        unint64_t v26 = v47;
      }

      v7 = v43;
      v6 = v44;
      v10 = v42;
    }
    else
    {
      uint64_t v29 = 0;
      v6 = v44;
      id v5 = v45;
      v10 = v42;
      v7 = v43;
      v13 = v41;
    }

    v36 = [NSNumber numberWithUnsignedInteger:v26];
    [v7 setObject:v36 forKey:@"numberOfMoments"];

    v37 = [NSNumber numberWithInteger:v46];
    [v7 setObject:v37 forKey:@"averageNumberOfAssetsInMoments"];

    v38 = [NSNumber numberWithUnsignedInteger:v29];
    [v7 setObject:v38 forKey:@"medianNumberOfAssetsInMoments"];

    v39 = [NSNumber numberWithUnsignedInteger:v19];
    [v7 setObject:v39 forKey:@"numberOfMomentsWithSingleAsset"];

    id v14 = 0;
    if (v6) {
      v6[2](v6, v7, 0);
    }
  }
}

+ (id)createOrEmptyMemoriesRelatedSnapshotOutputFolderWithPathManager:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [a1 memoriesAndRelatedDiagnosticsOutputURLWithPathManager:a3];
  v4 = [v3 path];
  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  if ([v5 fileExistsAtPath:v4])
  {
    id v16 = 0;
    char v6 = [v5 removeItemAtURL:v3 error:&v16];
    id v7 = v16;
    if ((v6 & 1) == 0)
    {
      v8 = PLBackendGetLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = [v3 path];
        *(_DWORD *)buf = 138412546;
        id v18 = v7;
        __int16 v19 = 2112;
        uint64_t v20 = v9;
        _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "ERROR (%@) : Photo Diagnostics failed deleting snapshot output path (%@).", buf, 0x16u);
      }
    }
  }
  else
  {
    id v7 = 0;
  }
  if ([v5 fileExistsAtPath:v4])
  {
    id v10 = v7;
  }
  else
  {
    id v15 = v7;
    char v11 = [v5 createDirectoryAtURL:v3 withIntermediateDirectories:1 attributes:0 error:&v15];
    id v10 = v15;

    if ((v11 & 1) == 0 && v10)
    {
      v12 = PLBackendGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = [v3 path];
        *(_DWORD *)buf = 138412546;
        id v18 = v10;
        __int16 v19 = 2112;
        uint64_t v20 = v13;
        _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "ERROR (%@) : Photo Diagnostics failed creating snapshot output path (%@).", buf, 0x16u);
      }
    }
  }

  return v10;
}

+ (id)memoriesAndRelatedDiagnosticsOutputURLWithPathManager:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CB10];
  v4 = [a1 _memoriesRelatedOutputPathBaseDirectoryWithPathManager:a3];
  id v5 = [v4 stringByAppendingPathComponent:@"Memories"];
  char v6 = [v3 fileURLWithPath:v5];

  return v6;
}

+ (id)_memoriesRelatedOutputPathBaseDirectoryWithPathManager:(id)a3
{
  return (id)[a3 privateCacheDirectoryWithSubType:12];
}

+ (void)fileRadarUserNotificationWithHeader:(id)a3 message:(id)a4 radarTitle:(id)a5 radarDescription:(id)a6 radarComponent:(int64_t)a7 diagnosticTTRType:(signed __int16)a8 attachments:(id)a9 extensionItem:(id)a10
{
  int v10 = a8;
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a9;
  id v21 = a10;
  if (([a1 shouldSuppressRadarUserNotificationWithMessage:v17 radarTitle:v18] & 1) == 0)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&s_userNotificationLock);
    if (s_userNotificationHandler)
    {
      os_unfair_lock_unlock((os_unfair_lock_t)&s_userNotificationLock);
      v22 = PLBackendGetLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v61 = v18;
        __int16 v62 = 2112;
        id v63 = v19;
        _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_DEFAULT, "user notification already running: ignoring %@: %@", buf, 0x16u);
      }
      goto LABEL_29;
    }
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __148__PLDiagnostics_fileRadarUserNotificationWithHeader_message_radarTitle_radarDescription_radarComponent_diagnosticTTRType_attachments_extensionItem___block_invoke;
    v51[3] = &unk_1E58756F8;
    id v52 = v20;
    id v53 = v18;
    id v54 = v19;
    int64_t v56 = a7;
    id v23 = v16;
    id v55 = v23;
    uint64_t v24 = MEMORY[0x19F38D650](v51);
    uint64_t v25 = (void *)s_userNotificationHandler;
    s_userNotificationHandler = v24;

    os_unfair_lock_unlock((os_unfair_lock_t)&s_userNotificationLock);
    unint64_t v26 = @"Never for Photos Issues";
    if (v10 == 1) {
      unint64_t v26 = @"File Radar with Image and intermediates";
    }
    uint64_t v27 = *MEMORY[0x1E4F1D9A8];
    v58[0] = *MEMORY[0x1E4F1D990];
    v58[1] = v27;
    uint64_t v28 = *MEMORY[0x1E4F1D9E0];
    v59[1] = v17;
    v59[2] = @"File Radar";
    uint64_t v29 = *MEMORY[0x1E4F1D9D0];
    v58[2] = v28;
    v58[3] = v29;
    uint64_t v30 = *MEMORY[0x1E4F1DA10];
    v59[3] = @"Not Now";
    v59[4] = v26;
    uint64_t v31 = *MEMORY[0x1E4F1D9B8];
    v58[4] = v30;
    v58[5] = v31;
    uint64_t v32 = *MEMORY[0x1E4FA73C8];
    v59[5] = MEMORY[0x1E4F1CC38];
    v59[6] = MEMORY[0x1E4F1CC38];
    uint64_t v33 = *MEMORY[0x1E4FA73D0];
    v58[6] = v32;
    v58[7] = v33;
    v58[8] = *MEMORY[0x1E4FA7328];
    v59[0] = v23;
    v59[7] = MEMORY[0x1E4F1CC38];
    v59[8] = MEMORY[0x1E4F1CC28];
    v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v59 forKeys:v58 count:9];
    v22 = v34;
    id v49 = v16;
    if (v10 == 1 && v21)
    {
      id v35 = [v34 mutableCopy];
      [v35 setObject:@"com.apple.mobileslideshow.DestructiveChangeConfirmation" forKeyedSubscript:*MEMORY[0x1E4FA7348]];
      id v48 = v23;
      v36 = (void *)MEMORY[0x1E4F28DB0];
      id v57 = v21;
      v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v57 count:1];
      v38 = [v36 archivedDataWithRootObject:v37 requiringSecureCoding:1 error:0];
      [v35 setObject:v38 forKeyedSubscript:*MEMORY[0x1E4FA7350]];

      id v23 = v48;
      uint64_t v39 = [v35 copy];

      v22 = v39;
    }
    SInt32 error = 0;
    v40 = CFUserNotificationCreate(0, 0.0, 3uLL, &error, (CFDictionaryRef)v22);
    if (!v40 || error)
    {
      unint64_t v46 = PLBackendGetLog();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v61) = error;
        _os_log_impl(&dword_19B3C7000, v46, OS_LOG_TYPE_ERROR, "could not create user notification: %d", buf, 8u);
      }

      if (!v40) {
        goto LABEL_28;
      }
    }
    else
    {
      if (v10 == 1) {
        v41 = (void (__cdecl *)(CFUserNotificationRef, CFOptionFlags))PLDiagnosticsUserNotificationSharePhotoCallback;
      }
      else {
        v41 = (void (__cdecl *)(CFUserNotificationRef, CFOptionFlags))PLDiagnosticsUserNotificationCallback;
      }
      CFRunLoopSourceRef RunLoopSource = CFUserNotificationCreateRunLoopSource(0, v40, v41, 0);
      if (RunLoopSource)
      {
        v43 = RunLoopSource;
        Main = CFRunLoopGetMain();
        CFRunLoopAddSource(Main, v43, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
        CFRelease(v43);
        id v45 = PLBackendGetLog();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v61 = v23;
          _os_log_impl(&dword_19B3C7000, v45, OS_LOG_TYPE_DEFAULT, "running user notification: %@", buf, 0xCu);
        }

        goto LABEL_28;
      }
      unint64_t v47 = PLBackendGetLog();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v61) = error;
        _os_log_impl(&dword_19B3C7000, v47, OS_LOG_TYPE_ERROR, "could not create user notification runloop: %d", buf, 8u);
      }
    }
    CFRelease(v40);
LABEL_28:
    id v16 = v49;
LABEL_29:
  }
}

void __148__PLDiagnostics_fileRadarUserNotificationWithHeader_message_radarTitle_radarDescription_radarComponent_diagnosticTTRType_attachments_extensionItem___block_invoke(uint64_t a1, int a2)
{
  if (a2) {
    id v3 = *(id *)(a1 + 32);
  }
  else {
    id v3 = (id)MEMORY[0x1E4F1CBF0];
  }
  id v4 = v3;
  +[PLDiagnostics tapToRadarWithTitle:*(void *)(a1 + 40) description:*(void *)(a1 + 48) radarComponent:*(void *)(a1 + 64) isUserInitiated:0 displayReason:*(void *)(a1 + 56) attachments:v3];
}

+ (void)fileRadarUserNotificationWithHeader:(id)a3 message:(id)a4 radarTitle:(id)a5 radarDescription:(id)a6
{
}

+ (BOOL)shouldSuppressRadarUserNotificationWithMessage:(id)a3 radarTitle:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  char v6 = a4;
  if (MEMORY[0x19F38BDA0]())
  {
    id v7 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v8 = [v7 objectForKey:@"PhotoDiagnosticsIgnoreUntil"];

    if (!v8
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || ([MEMORY[0x1E4F1C9C8] date],
          v9 = objc_claimAutoreleasedReturnValue(),
          uint64_t v10 = [v8 compare:v9],
          v9,
          v10 != 1))
    {
      BOOL v12 = 0;
      goto LABEL_12;
    }
    char v11 = PLBackendGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412802;
      id v15 = v8;
      __int16 v16 = 2112;
      id v17 = v6;
      __int16 v18 = 2112;
      id v19 = v5;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "Ignoring Radar user notification request with ignore date=%@ for %@: %@", (uint8_t *)&v14, 0x20u);
    }
  }
  else
  {
    v8 = PLBackendGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412546;
      id v15 = v6;
      __int16 v16 = 2112;
      id v17 = v5;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "Ignoring Radar user notification request on a customer install for %@: %@", (uint8_t *)&v14, 0x16u);
    }
  }
  BOOL v12 = 1;
LABEL_12:

  return v12;
}

+ (void)_radarComponentDetailsForComponent:(int64_t)a3 reply:(id)a4
{
  if ((unint64_t)a3 > 3)
  {
    uint64_t v6 = 0;
    id v7 = &stru_1EEB2EB80;
    v8 = &stru_1EEB2EB80;
    v9 = &stru_1EEB2EB80;
  }
  else
  {
    uint64_t v6 = qword_19BA9F008[a3];
    id v7 = off_1E5875730[a3];
    v8 = off_1E5875750[a3];
    v9 = off_1E5875770[a3];
  }
  (*((void (**)(id, uint64_t, __CFString *, __CFString *, __CFString *))a4 + 2))(a4, v6, v7, v8, v9);
}

+ (void)_fallBackTapToRadarWithTitle:(id)a3 description:(id)a4 radarComponent:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__113932;
  uint64_t v28 = __Block_byref_object_dispose__113933;
  id v29 = 0;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __73__PLDiagnostics__fallBackTapToRadarWithTitle_description_radarComponent___block_invoke;
  v23[3] = &unk_1E58756A8;
  v23[4] = &v24;
  [a1 _radarComponentDetailsForComponent:a5 reply:v23];
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  char v11 = (void *)v25[5];
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  uint64_t v20 = __73__PLDiagnostics__fallBackTapToRadarWithTitle_description_radarComponent___block_invoke_2;
  id v21 = &unk_1E58756D0;
  id v12 = v10;
  id v22 = v12;
  [v11 enumerateKeysAndObjectsUsingBlock:&v18];
  if (v8)
  {
    v13 = objc_msgSend(MEMORY[0x1E4F290C8], "queryItemWithName:value:", @"Title", v8, v18, v19, v20, v21);
    [v12 addObject:v13];
  }
  if (v9)
  {
    int v14 = [MEMORY[0x1E4F290C8] queryItemWithName:@"Description" value:v9];
    [v12 addObject:v14];
  }
  id v15 = objc_msgSend(MEMORY[0x1E4F29088], "componentsWithString:", @"tap-to-radar://new", v18, v19, v20, v21);
  [v15 setQueryItems:v12];
  __int16 v16 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  id v17 = [v15 URL];
  [v16 openURL:v17 configuration:0 completionHandler:0];

  _Block_object_dispose(&v24, 8);
}

void __73__PLDiagnostics__fallBackTapToRadarWithTitle_description_radarComponent___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  v18[7] = *MEMORY[0x1E4F143B8];
  v18[0] = @"com.apple.PhotoLibraryServices.PhotosDiagnostics";
  v18[1] = @"Serious Bug";
  v18[2] = @"Not Applicable";
  id v9 = NSString;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = objc_msgSend(v9, "stringWithFormat:", @"%ld", a2, @"ExtensionIdentifiers", @"Classification", @"Reproducibility", @"ComponentID");
  v18[3] = v13;
  v18[4] = v12;
  v17[4] = @"ComponentName";
  v17[5] = @"ComponentVersion";
  v17[6] = @"DeviceClasses";
  v18[5] = v11;
  v18[6] = v10;
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:7];
  uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 8);
  __int16 v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;
}

void __73__PLDiagnostics__fallBackTapToRadarWithTitle_description_radarComponent___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = [MEMORY[0x1E4F290C8] queryItemWithName:a2 value:a3];
  [v3 addObject:v4];
}

+ (int64_t)_deviceClassesFromDeviceClassesString:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = objc_msgSend(a3, "componentsSeparatedByString:", @",", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    int64_t v6 = 0;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v9 isEqualToString:@"iPhone"])
        {
          v6 |= 1uLL;
        }
        else if ([v9 isEqualToString:@"iPad"])
        {
          v6 |= 2uLL;
        }
        else if ([v9 isEqualToString:@"Watch"])
        {
          v6 |= 4uLL;
        }
        else if ([v9 isEqualToString:@"AppleTV"])
        {
          v6 |= 8uLL;
        }
        else if ([v9 isEqualToString:@"HomePod"])
        {
          v6 |= 0x10uLL;
        }
        else if ([v9 isEqualToString:@"Mac"])
        {
          v6 |= 0x20uLL;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

+ (id)_tapToRadarProcessName
{
  v2 = [MEMORY[0x1E4F28F80] processInfo];
  id v3 = [v2 processName];

  if (([v3 isEqualToString:@"assetsd"] & 1) != 0
    || ([v3 isEqualToString:@"photolibraryd"] & 1) != 0)
  {
    uint64_t v4 = @"Photos Library Service";
  }
  else if ([v3 isEqualToString:@"photoanalysisd"])
  {
    uint64_t v4 = @"Photos Analysis Service";
  }
  else
  {
    uint64_t v4 = v3;
  }

  return v4;
}

+ (void)_tapToRadarKitDraftWithTitle:(id)a3 description:(id)a4 radarComponent:(int64_t)a5 isUserInitiated:(BOOL)a6 displayReason:(id)a7 attachments:(id)a8
{
  BOOL v10 = a6;
  id v15 = a3;
  id v16 = a4;
  id v17 = a7;
  id v18 = a8;
  if (!v17 && !v10)
  {
    uint64_t v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, a1, @"PLDiagnostics.m", 191, @"Invalid parameter not satisfying: %@", @"isUserInitiated || displayReason != nil" object file lineNumber description];
  }
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2050000000;
  uint64_t v19 = (void *)getRadarDraftClass_softClass;
  uint64_t v40 = getRadarDraftClass_softClass;
  if (!getRadarDraftClass_softClass)
  {
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __getRadarDraftClass_block_invoke;
    v36[3] = &unk_1E5875840;
    v36[4] = &v37;
    __getRadarDraftClass_block_invoke((uint64_t)v36);
    uint64_t v19 = (void *)v38[3];
  }
  id v20 = v19;
  _Block_object_dispose(&v37, 8);
  id v21 = objc_opt_new();
  [v21 setTitle:v15];
  [v21 setProblemDescription:v16];
  [v21 setClassification:6];
  [v21 setReproducibility:6];
  [v21 setAutoDiagnostics:0];
  [v21 setIsUserInitiated:v10];
  [v21 setKeywords:MEMORY[0x1E4F1CBF0]];
  [v21 setAttachments:v18];
  [v21 setDiagnosticExtensionIDs:&unk_1EEBF2528];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __115__PLDiagnostics__tapToRadarKitDraftWithTitle_description_radarComponent_isUserInitiated_displayReason_attachments___block_invoke;
  v33[3] = &unk_1E5875658;
  id v34 = v21;
  id v35 = a1;
  id v22 = v21;
  [a1 _radarComponentDetailsForComponent:a5 reply:v33];
  id v23 = [getTapToRadarServiceClass() shared];
  uint64_t v24 = [a1 _tapToRadarProcessName];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __115__PLDiagnostics__tapToRadarKitDraftWithTitle_description_radarComponent_isUserInitiated_displayReason_attachments___block_invoke_2;
  v28[3] = &unk_1E5875680;
  id v29 = v15;
  id v30 = v16;
  id v31 = a1;
  int64_t v32 = a5;
  id v25 = v16;
  id v26 = v15;
  [v23 createDraft:v22 forProcessNamed:v24 withDisplayReason:v17 completionHandler:v28];
}

void __115__PLDiagnostics__tapToRadarKitDraftWithTitle_description_radarComponent_isUserInitiated_displayReason_attachments___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2050000000;
  long long v12 = (void *)getRadarComponentClass_softClass;
  uint64_t v19 = getRadarComponentClass_softClass;
  if (!getRadarComponentClass_softClass)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __getRadarComponentClass_block_invoke;
    v15[3] = &unk_1E5875840;
    v15[4] = &v16;
    __getRadarComponentClass_block_invoke((uint64_t)v15);
    long long v12 = (void *)v17[3];
  }
  long long v13 = v12;
  _Block_object_dispose(&v16, 8);
  long long v14 = (void *)[[v13 alloc] initWithName:v9 version:v10 identifier:a2];
  [*(id *)(a1 + 32) setComponent:v14];

  objc_msgSend(*(id *)(a1 + 32), "setRemoteDeviceClasses:", objc_msgSend(*(id *)(a1 + 40), "_deviceClassesFromDeviceClassesString:", v11));
}

void __115__PLDiagnostics__tapToRadarKitDraftWithTitle_description_radarComponent_isUserInitiated_displayReason_attachments___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = PLBackendGetLog();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "TapToRadarService returned error: (%@)", (uint8_t *)&v6, 0xCu);
    }

    [*(id *)(a1 + 48) _fallBackTapToRadarWithTitle:*(void *)(a1 + 32) description:*(void *)(a1 + 40) radarComponent:*(void *)(a1 + 56)];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v6) = 0;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "TapToRadarService draft submitted", (uint8_t *)&v6, 2u);
    }
  }
}

+ (void)tapToRadarWithTitle:(id)a3 description:(id)a4 radarComponent:(int64_t)a5 isUserInitiated:(BOOL)a6 displayReason:(id)a7 attachments:(id)a8
{
  BOOL v10 = a6;
  id v17 = a3;
  id v14 = a4;
  id v15 = a7;
  id v16 = a8;
  if (([a1 tapToRadarKitDisabled] & 1) != 0 || !TapToRadarKitLibraryCore()) {
    [a1 _fallBackTapToRadarWithTitle:v17 description:v14 radarComponent:a5];
  }
  else {
    [a1 _tapToRadarKitDraftWithTitle:v17 description:v14 radarComponent:a5 isUserInitiated:v10 displayReason:v15 attachments:v16];
  }
}

+ (void)requestTapToRadarAuthorizationWithCompletion:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [getTapToRadarServiceClass() shared];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__PLDiagnostics_requestTapToRadarAuthorizationWithCompletion___block_invoke;
  v6[3] = &unk_1E5875630;
  id v7 = v3;
  id v5 = v3;
  [v4 getServiceSettingsWithCompletionHandler:v6];
}

uint64_t __62__PLDiagnostics_requestTapToRadarAuthorizationWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = [a2 authorizationStatus] == 3;
  uint64_t v4 = *(uint64_t (**)(uint64_t, BOOL))(v2 + 16);
  return v4(v2, v3);
}

+ (BOOL)tapToRadarKitDisabled
{
  uint64_t v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"PLPhotosDiagnosticsTapToRadarKitDisabled"];

  return v3;
}

+ (unint64_t)addOSStateHandlerWithTitle:(id)a3 queue:(id)a4 propertyListHandler:(id)a5
{
  id v10 = a3;
  id v11 = a5;
  id v6 = v10;
  id v7 = v11;
  unint64_t v8 = os_state_add_handler();

  return v8;
}

_DWORD *__70__PLDiagnostics_addOSStateHandlerWithTitle_queue_propertyListHandler___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v2)
  {
    id v15 = 0;
    char v3 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v2 format:200 options:0 error:&v15];
    id v4 = v15;
    if (v3)
    {
      unsigned int v5 = [v3 length];
      unsigned int v6 = v5;
      if (v5 <= 0x8000)
      {
        long long v13 = malloc_type_malloc(v5 + 200, 0x9FCE8B6DuLL);
        id v11 = v13;
        if (v13)
        {
          bzero(v13, v6 + 200);
          _DWORD *v11 = 1;
          v11[1] = v6;
          [*(id *)(a1 + 32) UTF8String];
          __strlcpy_chk();
          [v3 getBytes:v11 + 50 length:v6];
        }
        goto LABEL_13;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        uint64_t v17 = v7;
        unint64_t v8 = MEMORY[0x1E4F14500];
        id v9 = "state information archive for %@ too large";
        uint32_t v10 = 12;
LABEL_9:
        _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, v9, buf, v10);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v17 = v12;
      __int16 v18 = 2112;
      id v19 = v4;
      unint64_t v8 = MEMORY[0x1E4F14500];
      id v9 = "unable to archive process state information for %@: %@";
      uint32_t v10 = 22;
      goto LABEL_9;
    }
    id v11 = 0;
LABEL_13:

    goto LABEL_14;
  }
  id v11 = 0;
LABEL_14:

  return v11;
}

+ (id)excludingNameExpression
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = (id)*MEMORY[0x1E4F59760];
  id v7 = 0;
  char v3 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:v2 options:1 error:&v7];
  id v4 = v7;
  if (!v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v5 = [v4 localizedDescription];
    *(_DWORD *)buf = 138543362;
    id v9 = v5;
    _os_log_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Error creating excludingExpression %{public}@", buf, 0xCu);
  }
  return v3;
}

+ (id)matchingNameExpression
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = [NSString alloc];
  char v3 = (void *)[v2 initWithFormat:@"(CPL-diagnostics|%@)-.*.tgz", *MEMORY[0x1E4F59770]];
  id v8 = 0;
  id v4 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:v3 options:1 error:&v8];
  id v5 = v8;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v6 = [v5 localizedDescription];
    *(_DWORD *)buf = 138543362;
    uint64_t v10 = v6;
    _os_log_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Error creating matchingExpression %{public}@", buf, 0xCu);
  }
  return v4;
}

+ (void)enumerateDiagnosticsURLsIncludingPropertyiesForKeys:(id)a3 handler:(id)a4
{
  v41[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v30 = (void (**)(id, void *, uint64_t))a4;
  id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v8 = *MEMORY[0x1E4F1C628];
  uint64_t v9 = *MEMORY[0x1E4F1C6E8];
  v41[0] = *MEMORY[0x1E4F1C628];
  v41[1] = v9;
  uint64_t v31 = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:2];
  uint64_t v11 = v10;
  id v29 = v6;
  if (v6)
  {
    uint64_t v12 = [v10 arrayByAddingObjectsFromArray:v6];

    uint64_t v11 = (void *)v12;
  }
  long long v13 = [a1 logDirectoryURL];
  uint64_t v27 = v11;
  uint64_t v28 = v7;
  id v14 = [v7 enumeratorAtURL:v13 includingPropertiesForKeys:v11 options:7 errorHandler:&__block_literal_global_114056];

  id v15 = [a1 matchingNameExpression];
  uint64_t v33 = [a1 excludingNameExpression];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = v14;
  uint64_t v16 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v37 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        id v21 = (void *)MEMORY[0x19F38D3B0]();
        id v35 = 0;
        [v20 getResourceValue:&v35 forKey:v8 error:0];
        id v22 = v35;
        if (([v22 BOOLValue] & 1) == 0)
        {
          id v34 = 0;
          [v20 getResourceValue:&v34 forKey:v31 error:0];
          id v23 = v34;
          uint64_t v24 = v23;
          if (!v15
            || (objc_msgSend(v15, "firstMatchInString:options:range:", v23, 0, 0, objc_msgSend(v23, "length")),
                id v25 = objc_claimAutoreleasedReturnValue(),
                v25,
                v25))
          {
            if (!v33
              || (objc_msgSend(v33, "firstMatchInString:options:range:", v24, 0, 0, objc_msgSend(v24, "length")),
                  id v26 = objc_claimAutoreleasedReturnValue(),
                  v26,
                  !v26))
            {
              v30[2](v30, v20, [v22 BOOLValue]);
            }
          }
        }
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v17);
  }
}

uint64_t __77__PLDiagnostics_enumerateDiagnosticsURLsIncludingPropertyiesForKeys_handler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 domain];
  if ([v4 isEqualToString:*MEMORY[0x1E4F281F8]])
  {
    uint64_t v5 = [v3 code];

    if (v5 == 260) {
      goto LABEL_7;
    }
  }
  else
  {
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v3 localizedDescription];
    int v8 = 138412290;
    uint64_t v9 = v6;
    _os_log_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "enumerate diagnostics error: %@\n", (uint8_t *)&v8, 0xCu);
  }
LABEL_7:

  return 1;
}

+ (id)diagnosticsURLs
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __32__PLDiagnostics_diagnosticsURLs__block_invoke;
  v6[3] = &unk_1E58755C0;
  id v4 = v3;
  id v7 = v4;
  [a1 enumerateDiagnosticsURLsIncludingPropertyiesForKeys:0 handler:v6];

  return v4;
}

uint64_t __32__PLDiagnostics_diagnosticsURLs__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

+ (id)logDirectoryURL
{
  return (id)[MEMORY[0x1E4F1CB10] fileURLWithPath:*MEMORY[0x1E4F59768] isDirectory:1];
}

@end