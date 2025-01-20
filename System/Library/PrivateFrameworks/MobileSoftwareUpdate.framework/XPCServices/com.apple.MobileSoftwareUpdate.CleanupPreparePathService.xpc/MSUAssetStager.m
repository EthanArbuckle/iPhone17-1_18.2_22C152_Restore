@interface MSUAssetStager
+ (BOOL)_checkAndLogLocalError:(id)a3 outError:(id *)a4;
+ (BOOL)_isEnabledWithAdditionalIndicators:(BOOL)a3 options:(id)a4 updateAttributes:(id)a5 snapshotPrepare:(BOOL)a6 splat:(BOOL)a7 sfr:(BOOL)a8 purging:(BOOL)a9;
+ (BOOL)_preSUStagingSupportedInSUCore;
+ (BOOL)_stageAssetsUsingUpdateAttributes:(id)a3 withError:(id *)a4;
+ (BOOL)isPurgingEnabled;
+ (BOOL)isStagingEnabledForOptions:(id)a3 updateAttributes:(id)a4 snapshotPrepare:(BOOL)a5 splat:(BOOL)a6 sfr:(BOOL)a7;
+ (BOOL)stageAssetsUsingUpdateAttributes:(id)a3 withError:(id *)a4;
+ (id)buildVersionFromAttributes:(id)a3;
+ (id)buildVersionFromInfoPlist:(id)a3;
+ (id)osVersionFromAttributes:(id)a3;
+ (id)osVersionFromInfoPlist:(id)a3;
+ (id)restoreVersionFromAttributes:(id)a3;
+ (id)trainNameFromAttributes:(id)a3;
+ (void)_purgeStagedAssetsSynchronously:(BOOL)a3;
+ (void)disableStagingForReason:(id)a3 buildVersion:(id)a4 osVersion:(id)a5;
+ (void)purgeStagedAssets;
+ (void)purgeStagedAssetsAsync;
@end

@implementation MSUAssetStager

+ (BOOL)stageAssetsUsingUpdateAttributes:(id)a3 withError:(id *)a4
{
  return +[MSUAssetStager _stageAssetsUsingUpdateAttributes:a3 withError:a4];
}

+ (BOOL)_stageAssetsUsingUpdateAttributes:(id)a3 withError:(id *)a4
{
  uint64_t v107 = 0;
  v108 = &v107;
  uint64_t v109 = 0x3052000000;
  v110 = __Block_byref_object_copy_;
  v111 = __Block_byref_object_dispose_;
  uint64_t v112 = 0;
  if (a4) {
    *a4 = 0;
  }
  if (objc_opt_class() && objc_opt_class() && objc_opt_class())
  {
    if ((objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector())
      && (objc_opt_respondsToSelector() & 1) != 0
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v106[0] = 0;
      v106[1] = v106;
      v106[2] = 0x2020000000;
      v106[3] = 0;
      uint64_t v104 = 0;
      unint64_t v105 = 0;
      uint64_t v101 = 0;
      v102 = &v101;
      uint64_t v103 = 0x2020000000;
      id v9 = +[MSUAssetStager buildVersionFromAttributes:a3];
      id v10 = +[MSUAssetStager osVersionFromAttributes:a3];
      id v11 = +[MSUAssetStager trainNameFromAttributes:a3];
      id v12 = +[MSUAssetStager restoreVersionFromAttributes:a3];
      if (objc_opt_respondsToSelector())
      {
        id v18 = objc_alloc_init((Class)NSMutableDictionary);
        [v18 setObject:v9 forKeyedSubscript:@"Build"];
        [v18 setObject:v10 forKeyedSubscript:@"OSVersion"];
        if (v11) {
          [v18 setObject:v11 forKeyedSubscript:@"TrainName"];
        }
        else {
          logfunction(", 1, @"MSUAssetStager: Unable to determine TrainName from update attributes. Not adding to options\n"", v19, v20, v21, v22, v23, v93);
        }
        if (v12) {
          [v18 setObject:v12 forKeyedSubscript:@"RestoreVersion"];
        }
        else {
          logfunction(", 1, @"MSUAssetStager: Unable to determine RestoreVersion from update attributes. Not adding to options\n"", v24, v25, v26, v27, v28, v93);
        }
        logfunction(", 1, @"MSUAssetStager: Using new SPI for determining assets for pre SU staging. Options being passed into stageDetermineAllAvailableForUpdate are {\n%@\n}\n"", v40, v41, v42, v43, v44, (char)v18);
        id v34 = +[MAAutoAsset stageDetermineAllAvailableForUpdateSync:v18 totalExpectedBytes:&v105 error:v108 + 5];
      }
      else
      {
        logfunction(", 1, @"MSUAssetStager: Determining all available assets for staging using buildVersion:%@ osVersion:%@ via legacy SPI on supported OS\n"", v13, v14, v15, v16, v17, (char)v9);
        id v34 = +[MAAutoAsset stageDetermineAllAvailableSync:v10 forTargetBuildVersion:v9 totalExpectedBytes:&v105 error:v108 + 5];
      }
      v45 = v34;
      if (v108[5])
      {
        logfunction(", 1, @"MSUAssetStager: Failed to determine assets available for staging\n"", v35, v36, v37, v38, v39, v94);
        CFTypeRef v46 = (CFTypeRef)v108[5];
      }
      else
      {
        if (!v34 || ![v34 count])
        {
          BOOL v32 = 1;
          logfunction(", 1, @"MSUAssetStager: No assets found for staging\n"", v35, v36, v37, v38, v39, v94);
          goto LABEL_38;
        }
        if (v105)
        {
          char v47 = [v45 count];
          logfunction(", 1, @"MSUAssetStager: Determined %lu assets to stage requiring %llu bytes\n"", v48, v49, v50, v51, v52, v47);
          v99 = 0;
          CFErrorRef v100 = 0;
          if (get_snapshot_preparation_size(a3, &v99, &v100))
          {
            uint64_t v98 = 0;
            if (get_snapshot_apply_size(a3, &v98))
            {
              bzero(&v113, 0x878uLL);
              statfs("/private/var", &v113);
              uint64_t v68 = v113.f_bavail * v113.f_bsize;
              unint64_t v69 = v68 - (void)&v99[v98];
              if (v68 <= (unint64_t)&v99[v98])
              {
                CFErrorRef error_internal_cf = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", 63, 0, 0, @"Free space (%llu) is less than the prepareSize (%llu) + applySize (%llu) total", v65, v66, v67, LOBYTE(v113.f_bavail) * LOBYTE(v113.f_bsize));
                CFTypeRef v90 = (id)CFMakeCollectable(error_internal_cf);
                v108[5] = (uint64_t)v90;
                +[MSUAssetStager _checkAndLogLocalError:v90 outError:a4];
              }
              else
              {
                unint64_t v70 = (unint64_t)(float)((float)((float)v105 + (float)((float)v105 * 0.1)) + 262140000.0);
                logfunction(", 1, @"MSUAssetStager: Required space for staging assets freeSpace:%llu - (prepareSize:%llu + applySize:%llu) = remainingSpace:%llu > estimatedBytesWithPadding:%llu | stagingValid:%@\n"", v63, v64, v65, v66, v67, LOBYTE(v113.f_bavail) * LOBYTE(v113.f_bsize));
                if (v69 <= v70)
                {
                  CFErrorRef v91 = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", 63, 0, 0, @"Not enough space available for staging assets; remainingSpace:%llu, estimatedBytesWithPadding:%llu",
                          v73,
                          v74,
                          v75,
                          v69);
                  CFTypeRef v92 = (id)CFMakeCollectable(v91);
                  v108[5] = (uint64_t)v92;
                  +[MSUAssetStager _checkAndLogLocalError:v92 outError:a4];
                }
                else
                {
                  logfunction(", 1, @"MSUAssetStager: Beginning asset downloads for staging\n"", v71, v72, v73, v74, v75, v95);
                  dispatch_semaphore_t v76 = dispatch_semaphore_create(0);
                  if (v76)
                  {
                    v82 = v76;
                    v97[0] = _NSConcreteStackBlock;
                    v97[1] = 3221225472;
                    v97[2] = __62__MSUAssetStager__stageAssetsUsingUpdateAttributes_withError___block_invoke_2;
                    v97[3] = &unk_1000591D8;
                    v97[6] = &v101;
                    v97[7] = &v107;
                    v97[4] = v76;
                    v97[5] = v106;
                    +[MAAutoAsset stageDownloadAll:3600 reportingProgress:&__block_literal_global_1 completion:v97];
                    if (dispatch_semaphore_wait(v82, 0))
                    {
                      [+[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:objc_opt_new()];
                      +[MAAutoAsset stagePurgeAllSync];
                    }
                    else
                    {
                      if (!v108[5])
                      {
                        BOOL v32 = 1;
                        logfunction(", 1, @"MSUAssetStager: Completed asset staging using %llu bytes\n"", v83, v84, v85, v86, v87, v102[3]);
                        goto LABEL_38;
                      }
                      logfunction(", 1, @"MSUAssetStager: Failed to download assets for staging\n"", v83, v84, v85, v86, v87, v96);
                      +[MSUAssetStager _checkAndLogLocalError:v108[5] outError:a4];
                    }
                  }
                  else
                  {
                    logfunction(", 1, @"MSUAssetStager: Failed to create semaphore for staging.\n"", v77, v78, v79, v80, v81, v96);
                  }
                }
              }
            }
            else
            {
              logfunction(", 1, @"MSUAssetStager: Failed to get snapshot apply size with error: %@\n"", v58, v59, v60, v61, v62, (char)v100);
              +[MSUAssetStager _checkAndLogLocalError:v100 outError:a4];
            }
          }
          else
          {
            logfunction(", 1, @"MSUAssetStager: Failed to get snapshot preparation size with error: %@\n"", v53, v54, v55, v56, v57, (char)v100);
            +[MSUAssetStager _checkAndLogLocalError:v100 outError:a4];
          }
          goto LABEL_26;
        }
        CFErrorRef v88 = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", 63, 0, 0, @"Failed to estimate bytes needed for staging", v37, v38, v39, v94);
        CFTypeRef v46 = (id)CFMakeCollectable(v88);
        v108[5] = (uint64_t)v46;
      }
      +[MSUAssetStager _checkAndLogLocalError:v46 outError:a4];
LABEL_26:
      BOOL v32 = 0;
LABEL_38:
      _Block_object_dispose(&v101, 8);
      _Block_object_dispose(v106, 8);
      goto LABEL_16;
    }
    CFStringRef v29 = @"Required MobileAsset classes do not respond to required selectors";
  }
  else
  {
    CFStringRef v29 = @"Required MobileAsset classes do not exist";
  }
  CFErrorRef v30 = _create_error_internal_cf(@"MobileSoftwareUpdateErrorDomain", 63, 0, 0, v29, v6, v7, v8, v93);
  CFTypeRef v31 = (id)CFMakeCollectable(v30);
  v108[5] = (uint64_t)v31;
  +[MSUAssetStager _checkAndLogLocalError:v31 outError:a4];
  BOOL v32 = 0;
LABEL_16:
  _Block_object_dispose(&v107, 8);
  return v32;
}

void __62__MSUAssetStager__stageAssetsUsingUpdateAttributes_withError___block_invoke(id a1, MAAutoAssetStatus *a2, NSError *a3)
{
  if (objc_opt_respondsToSelector())
  {
    char v9 = [(MAAutoAssetStatus *)a2 summary];
    logfunction(", 1, @"MSUAssetStager: Progress %@\n"", v10, v11, v12, v13, v14, v9);
  }
  else
  {
    logfunction(", 1, @"MSUAssetStager: Progress reported, but status does not implement summary\n"", v4, v5, v6, v7, v8, v16);
  }
}

intptr_t __62__MSUAssetStager__stageAssetsUsingUpdateAttributes_withError___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = a4;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (void)disableStagingForReason:(id)a3 buildVersion:(id)a4 osVersion:(id)a5
{
  if (!+[MSUAssetStager _preSUStagingSupportedInSUCore])
  {
    v22[0] = @"DisablePreSoftwareUpdateAssetStaging";
    v22[1] = @"Reason";
    CFStringRef v8 = @"NotSpecified";
    if (a3) {
      CFStringRef v9 = (const __CFString *)a3;
    }
    else {
      CFStringRef v9 = @"NotSpecified";
    }
    v23[0] = &__kCFBooleanTrue;
    v23[1] = v9;
    if (a4) {
      CFStringRef v10 = (const __CFString *)a4;
    }
    else {
      CFStringRef v10 = @"NotSpecified";
    }
    v22[2] = @"BuildVersion";
    v22[3] = @"OSVersion";
    if (a5) {
      CFStringRef v8 = (const __CFString *)a5;
    }
    v23[2] = v10;
    v23[3] = v8;
    uint64_t v11 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:4];
    logfunction(", 1, @"MSUAssetStager: Writing preSoftwareUpdateStagingDictionary: %@ to path: %s\n"", v12, v13, v14, v15, v16, (char)v11);
    if (![(NSDictionary *)v11 writeToFile:@"/private/var/MobileSoftwareUpdate/PreSoftwareUpdateAssetStaging.plist" atomically:1])logfunction(", 1, @"MSUAssetStager: Failed to write preSoftwareUpdateStagingDictionary to plist at path: %s\n", v17, v18, v19, v20, v21, (char)"/private/var/MobileSoftwareUpdate/PreSoftwareUpdateAssetStaging.plist""); {
  }
    }
}

+ (void)purgeStagedAssets
{
}

+ (void)purgeStagedAssetsAsync
{
}

+ (void)_purgeStagedAssetsSynchronously:(BOOL)a3
{
  BOOL v3 = a3;
  if (!objc_opt_class())
  {
    CFStringRef v10 = @"MSUAssetStager: Pre-SoftwareUpdate Asset Staging cannot proceed as MAAutoAsset class does not exist\n";
    goto LABEL_16;
  }
  if (v3)
  {
    if (objc_opt_respondsToSelector())
    {
      if (+[MSUAssetStager isPurgingEnabled])
      {
        logfunction(", 1, @"MSUAssetStager: Pre-SoftwareUpdate Asset Staging purge starting (synchronously)\n"", v4, v5, v6, v7, v8, v11);
        id v9 = +[MAAutoAsset stagePurgeAllSync];
        if (v9)
        {
          logfunction(", 1, @"MSUAssetStager: Pre-SoftwareUpdate Asset Staging failed to complete purge with error: %@\n"", v4, v5, v6, v7, v8, (char)v9);
          return;
        }
        CFStringRef v10 = @"MSUAssetStager: Pre-SoftwareUpdate Asset Staging completed purge successfully\n";
        goto LABEL_16;
      }
      goto LABEL_15;
    }
    CFStringRef v10 = @"MSUAssetStager: Pre-SoftwareUpdate Asset Staging cannot proceed as MAAutoAsset class does respond to required selector (stagePurgeAllSync)\n";
LABEL_16:
    logfunction("", 1, v10, v4, v5, v6, v7, v8, v13);
    return;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    CFStringRef v10 = @"MSUAssetStager: Pre-SoftwareUpdate Asset Staging cannot proceed as MAAutoAsset class does respond to required selector (stagePurgeAll:)\n";
    goto LABEL_16;
  }
  if (!+[MSUAssetStager isPurgingEnabled])
  {
LABEL_15:
    CFStringRef v10 = @"MSUAssetStager: Pre-SoftwareUpdate Asset Purging is disabled\n";
    goto LABEL_16;
  }
  logfunction(", 1, @"MSUAssetStager: Pre-SoftwareUpdate Asset Staging purge starting (asynchronously)\n"", v4, v5, v6, v7, v8, v11);
  +[MAAutoAsset stagePurgeAll:&__block_literal_global_160];
}

void __50__MSUAssetStager__purgeStagedAssetsSynchronously___block_invoke(id a1, NSError *a2)
{
  if (a2)
  {
    logfunction(", 1, @"MSUAssetStager: Pre-SoftwareUpdate Asset Staging failed to complete purge with error: %@\n"", v2, v3, v4, v5, v6, (char)a2);
  }
  else
  {
    logfunction(", 1, @"MSUAssetStager: Pre-SoftwareUpdate Asset Staging completed purge successfully\n"", v2, v3, v4, v5, v6, v8);
  }
}

+ (BOOL)isPurgingEnabled
{
  LOBYTE(v10) = 1;
  BOOL v7 = +[MSUAssetStager _isEnabledWithAdditionalIndicators:0 options:0 updateAttributes:0 snapshotPrepare:0 splat:0 sfr:0 purging:v10];
  char v8 = "not enabled";
  if (v7) {
    char v8 = "enabled";
  }
  logfunction(", 1, @"MSUAssetStager: Pre-SoftwareUpdate Asset Staging is %s for purging\n"", v2, v3, v4, v5, v6, (char)v8);
  return v7;
}

+ (BOOL)isStagingEnabledForOptions:(id)a3 updateAttributes:(id)a4 snapshotPrepare:(BOOL)a5 splat:(BOOL)a6 sfr:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  int v17 = MANonUserInitiatedDownloadsAllowed();
  if ((v17 & 1) == 0) {
    logfunction(", 1, @"MSUAssetStager: Failed to check if non-User Initiated Downloads are allowed with error: %@\n"", v12, v13, v14, v15, v16, 0);
  }
  LOBYTE(v27) = 0;
  unsigned int v18 = +[MSUAssetStager _isEnabledWithAdditionalIndicators:1 options:a3 updateAttributes:a4 snapshotPrepare:v9 splat:v8 sfr:v7 purging:v27];
  if ([+[NSFileManager defaultManager] fileExistsAtPath:@"/private/var/MobileSoftwareUpdate/PreSoftwareUpdateAssetStaging.plist"])
  {
    logfunction(", 1, @"MSUAssetStager: Pre-SoftwareUpdate Asset Staging found preSoftwareUpdateStagingPlist at path: %s\n", v19, v20, v21, v22, v23, (char)"/private/var/MobileSoftwareUpdate/PreSoftwareUpdateAssetStaging.plist"");
    LOBYTE(v24) = 0;
    uint64_t v25 = "not enabled";
  }
  else
  {
    int v24 = v18 & v17;
    uint64_t v25 = "not enabled";
    if (v24) {
      uint64_t v25 = "enabled";
    }
  }
  logfunction(", 1, @"MSUAssetStager: Pre-SoftwareUpdate Asset Staging is %s for downloads and staging\n"", v19, v20, v21, v22, v23, (char)v25);
  return v24 & 1;
}

+ (BOOL)_preSUStagingSupportedInSUCore
{
  logfunction(", 1, @"MSUAssetStager: Pre-SoftwareUpdate Asset Staging is supported in SUCore\n"", v2, v3, v4, v5, v6, vars0);
  return 1;
}

+ (BOOL)_isEnabledWithAdditionalIndicators:(BOOL)a3 options:(id)a4 updateAttributes:(id)a5 snapshotPrepare:(BOOL)a6 splat:(BOOL)a7 sfr:(BOOL)a8 purging:(BOOL)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  BOOL v11 = a6;
  BOOL v13 = a3;
  if (+[MSUAssetStager _preSUStagingSupportedInSUCore])
  {
    BOOL v19 = !a9;
  }
  else
  {
    BOOL v19 = 0;
  }
  if (v19)
  {
    BOOL v23 = 0;
    CFStringRef v22 = @"MSUAssetStager: Only purging is enabled\n";
    goto LABEL_8;
  }
  uint64_t AppBooleanValueWithDefaultValue = _MSUPreferencesGetAppBooleanValueWithDefaultValue(@"DisablePreSoftwareUpdateAssetStaging", 0);
  if (AppBooleanValueWithDefaultValue)
  {
    BOOL v23 = 0;
    CFStringRef v22 = @"MSUAssetStager: Pre-SoftwareUpdate Asset Staging disabled via on-device default; skipping staging\n";
    goto LABEL_8;
  }
  if (v13)
  {
    id v25 = [a5 objectForKey:@"DisablePreSoftwareUpdateAssetStaging"];
    objc_opt_class();
    uint64_t AppBooleanValueWithDefaultValue = objc_opt_isKindOfClass();
    if (AppBooleanValueWithDefaultValue)
    {
      uint64_t AppBooleanValueWithDefaultValue = (uint64_t)[v25 BOOLValue];
      BOOL v23 = 0;
      int v26 = AppBooleanValueWithDefaultValue | (v10 || v9);
      CFStringRef v27 = @"MSUAssetStager: Pre-SoftwareUpdate Asset Staging is disabled for sfr updates\n";
      if (v10) {
        CFStringRef v27 = @"MSUAssetStager: Pre-SoftwareUpdate Asset Staging is disabled for splat updates\n";
      }
      if (AppBooleanValueWithDefaultValue) {
        CFStringRef v27 = @"MSUAssetStager: Pre-SoftwareUpdate Asset Staging is disabled via asset attributes\n";
      }
      if (v26) {
        CFStringRef v22 = v27;
      }
      else {
        CFStringRef v22 = @"MSUAssetStager: Pre-SoftwareUpdate Asset Staging is only enabled for snapshot based updates\n";
      }
      if ((v26 & 1) != 0 || !v11) {
        goto LABEL_8;
      }
    }
    else
    {
      BOOL v23 = 0;
      CFStringRef v28 = @"MSUAssetStager: Pre-SoftwareUpdate Asset Staging is only enabled for snapshot based updates\n";
      if (v9) {
        CFStringRef v28 = @"MSUAssetStager: Pre-SoftwareUpdate Asset Staging is disabled for sfr updates\n";
      }
      if (v10) {
        CFStringRef v22 = @"MSUAssetStager: Pre-SoftwareUpdate Asset Staging is disabled for splat updates\n";
      }
      else {
        CFStringRef v22 = v28;
      }
      if (!v11 || v9 || v10) {
        goto LABEL_8;
      }
    }
  }
  if (msu_running_in_limited_environment(AppBooleanValueWithDefaultValue, v21, (uint64_t)v22, v14, v15, v16, v17, v18))
  {
    BOOL v23 = 0;
    CFStringRef v22 = @"MSUAssetStager: Pre-SoftwareUpdate Asset Staging is not enabled running in limited environments\n";
  }
  else
  {
    if (a5)
    {
      if (!+[MSUAssetStager buildVersionFromAttributes:a5])
      {
        BOOL v23 = 0;
        CFStringRef v22 = @"MSUAssetStager: Pre-SoftwareUpdate Asset Staging requires a build version\n";
        goto LABEL_8;
      }
      if (!+[MSUAssetStager osVersionFromAttributes:a5])
      {
        BOOL v23 = 0;
        CFStringRef v22 = @"MSUAssetStager: Pre-SoftwareUpdate Asset Staging requires an os version\n";
        goto LABEL_8;
      }
    }
    BOOL v23 = 1;
    CFStringRef v22 = @"MSUAssetStager: Pre-SoftwareUpdate Asset Staging passed environment pre-checks\n";
  }
LABEL_8:
  logfunction("", 1, v22, v14, v15, v16, v17, v18, v29);
  return v23;
}

+ (id)buildVersionFromAttributes:(id)a3
{
  id v3 = [a3 objectForKey:@"Build"];
  if (!v3) {
    return 0;
  }
  uint64_t v4 = v3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  return v4;
}

+ (id)osVersionFromAttributes:(id)a3
{
  id v3 = [a3 objectForKey:@"OSVersion"];
  if (!v3) {
    return v3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  if ((unint64_t)[v3 length] < 4
    || objc_msgSend(v3, "rangeOfString:options:range:", @"9.9.", 0, 0, 4) == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    return v3;
  }
  return objc_msgSend(v3, "stringByReplacingCharactersInRange:withString:", 0, 4, &stru_10005C5C0);
}

+ (id)trainNameFromAttributes:(id)a3
{
  id v3 = [a3 objectForKey:@"TrainName"];
  if (!v3) {
    return 0;
  }
  uint64_t v4 = v3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  return v4;
}

+ (id)restoreVersionFromAttributes:(id)a3
{
  id v3 = [a3 objectForKey:@"RestoreVersion"];
  if (!v3) {
    return 0;
  }
  uint64_t v4 = v3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  return v4;
}

+ (id)buildVersionFromInfoPlist:(id)a3
{
  id v3 = [a3 objectForKey:@"TargetUpdate"];
  if (!v3) {
    return 0;
  }
  uint64_t v4 = v3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  return v4;
}

+ (id)osVersionFromInfoPlist:(id)a3
{
  id v3 = [a3 objectForKey:@"ProductVersion"];
  if (!v3) {
    return v3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  if ((unint64_t)[v3 length] < 4
    || objc_msgSend(v3, "rangeOfString:options:range:", @"9.9.", 0, 0, 4) == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    return v3;
  }
  return objc_msgSend(v3, "stringByReplacingCharactersInRange:withString:", 0, 4, &stru_10005C5C0);
}

+ (BOOL)_checkAndLogLocalError:(id)a3 outError:(id *)a4
{
  if (a3)
  {
    logfunction(", 1, @"MSUAssetStager: Failed with error %@\n"", (uint64_t)a4, v4, v5, v6, v7, (char)a3);
    id v10 = a3;
    if (!a4) {
      return a3 == 0;
    }
    goto LABEL_6;
  }
  if (a4)
  {
    id v10 = 0;
LABEL_6:
    *a4 = v10;
  }
  return a3 == 0;
}

@end