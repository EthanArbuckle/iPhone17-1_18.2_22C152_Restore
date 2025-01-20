@interface AppsClient
+ (BOOL)_makeIconFromBundlePath:(id)a3 saveTo:(id)a4;
+ (id)_loadDemotedAppsPlist:(id)a3 withError:(id *)a4;
+ (id)_loadPlist:(id)a3 withError:(id *)a4;
+ (id)_orderTheItems:(id)a3;
+ (void)_notifySpringBoard:(BOOL)a3;
- (AppsClient)init;
- (BOOL)_appInstallationAllowed;
- (BOOL)_appRemovalAllowed;
- (BOOL)_isATCDaemon;
- (BOOL)_isRecoverableError:(id)a3;
- (BOOL)_placeholderExistsForApplication:(id)a3;
- (BOOL)_prepareDemotedAppForRestoreWithBundleId:(id)a3 iTunesMetadata:(id)a4 sinfData:(id)a5 iconData:(id)a6 demotionStatus:(unint64_t)a7;
- (BOOL)_prepareNonDemotedAppForRestoreWithBundleId:(id)a3 iTunesMetadata:(id)a4 sinfData:(id)a5 iconData:(id)a6;
- (BOOL)_processItunesRestoreInfo;
- (BOOL)createPlaceHolderPath:(id)a3 forBundleIdentifier:(id)a4 withAttributes:(id)a5;
- (BOOL)prepareAppForInstallUsingCoordination:(id)a3 existingApp:(BOOL)a4;
- (BOOL)prepareAppForRestoreUsingCoordination:(id)a3 iTunesMetadata:(id)a4 sinfData:(id)a5 iconData:(id)a6 demotionStatus:(unint64_t)a7;
- (BOOL)prepareForSyncWithHostAnchor:(id)a3 progressCallback:(id)a4 error:(id *)a5;
- (BOOL)reconcileRestoreOfType:(int)a3 withError:(id *)a4;
- (BOOL)reconcileSync:(unsigned int)a3 withNewAnchor:(id)a4 progressCallback:(id)a5 error:(id *)a6;
- (BOOL)updateTransferProgressForApp:(id)a3 existingApp:(BOOL)a4;
- (BOOL)writeIconData:(id)a3 atPath:(id)a4 returningFileSize:(unint64_t *)a5 forBundleIdentifier:(id)a6 withAttributes:(id)a7;
- (id)_createAppAssetPromiseForBundleIdentifier:(id)a3 atPath:(id)a4 andAddToCoordinatinator:(id)a5;
- (id)_createIconPromiseForBundleIdentifier:(id)a3 transferPath:(id)a4 diskSpaceNeeded:(unint64_t)a5 andAddToPlaceHolder:(id)a6 forAppInstall:(BOOL)a7;
- (id)_getSystemAppPlaceholders;
- (id)_initiatingOrUpdatingAppInstallCoordinatorForBundleIdentifier:(id)a3 existingApp:(BOOL)a4 createIfNotExisting:(BOOL)a5 error:(id *)a6;
- (id)_operationStateForIdentifier:(id)a3;
- (id)_placeHolderForBundleIdentifier:(id)a3 name:(id)a4 installType:(unint64_t)a5;
- (id)_placeHolderForBundleIdentifier:(id)a3 withiTunesMetadata:(id)a4 sinfData:(id)a5 iconData:(id)a6 demotionStatus:(unint64_t)a7;
- (id)_progressForAssetIdentifier:(id)a3;
- (id)_restoreStatePropertyForKey:(id)a3 identifier:(id)a4 version:(id)a5;
- (id)_userDataPromiseForBundleIdentifier:(id)a3;
- (id)accountsForAssets;
- (id)appleIDsForAssets;
- (id)currentSyncAnchor;
- (id)disabledAssetTypes;
- (id)installedAssetMetrics;
- (id)installedAssets;
- (id)outstandingAssetTransfers;
- (id)placeholderAppPathForBundleIdentifier:(id)a3;
- (id)supportedDataclasses;
- (int)_getAndResetNumAppInstallsAttempted;
- (void)_enumeratePlaceholdersWithBlock:(id)a3;
- (void)_setRestoreStatePropertyValue:(id)a3 forKey:(id)a4 identifier:(id)a5 version:(id)a6;
- (void)assetInstallFailed:(id)a3 withError:(id)a4;
- (void)assetInstallSucceeded:(id)a3;
- (void)assetSyncFinishedWithStatus:(BOOL)a3 outstandingItems:(id)a4;
- (void)assetTransfer:(id)a3 succeeded:(BOOL)a4 withError:(id)a5;
- (void)assetTransfer:(id)a3 updatedProgress:(double)a4;
- (void)assetTransferEndedWithSuccess:(BOOL)a3;
- (void)changeAssetID:(id)a3 toDo:(id)a4;
- (void)cleanRestoreStateForIdentifier:(id)a3;
- (void)clearSyncData;
- (void)coordinator:(id)a3 canceledWithReason:(id)a4 client:(unint64_t)a5;
- (void)coordinatorDidCompleteSuccessfully:(id)a3;
- (void)coordinatorDidInstallPlaceholder:(id)a3;
- (void)coordinatorShouldPrioritize:(id)a3;
- (void)dataMigratorCancelledCoordinatorForRestoreAppBundle:(id)a3;
- (void)dataMigratorSetPlaceHolderPromiseForRestoreAppBundle:(id)a3;
- (void)dealloc;
- (void)icDidInstallPlaceHolderForAppBundle:(id)a3;
- (void)prepareForBackup;
- (void)promiseDidBeginFulfillmentWithIdentifier:(unint64_t)a3;
- (void)setupInstallCoordinatorObserver;
- (void)syncEndedWithSuccess:(BOOL)a3;
- (void)transferCompleteForApp:(id)a3 withError:(id)a4 isExistingApp:(BOOL)a5;
- (void)uninstallAppUsingCoordination:(id)a3;
@end

@implementation AppsClient

- (void)promiseDidBeginFulfillmentWithIdentifier:(unint64_t)a3
{
  v4 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    unint64_t v6 = a3;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "promiseDidBeginFulfillmentWithIdentifier %lu", (uint8_t *)&v5, 0xCu);
  }
}

- (void)coordinatorDidInstallPlaceholder:(id)a3
{
  id v4 = a3;
  int v5 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v6 = [v4 bundleID];
    v7 = [v4 error];
    int v9 = 138543618;
    v10 = v6;
    __int16 v11 = 2114;
    v12 = v7;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "coordinatorDidInstallPlaceholder for %{public}@ with error %{public}@", (uint8_t *)&v9, 0x16u);
  }
  v8 = [v4 bundleID];
  [(AppsClient *)self icDidInstallPlaceHolderForAppBundle:v8];
}

- (void)coordinatorDidCompleteSuccessfully:(id)a3
{
  id v4 = a3;
  int v5 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v6 = [v4 bundleID];
    v7 = [v4 error];
    int v13 = 138543618;
    v14 = v6;
    __int16 v15 = 2114;
    v16 = v7;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "coordinatorDidCompleteSuccessfully for %{public}@ with error %{public}@", (uint8_t *)&v13, 0x16u);
  }
  v8 = [v4 error];
  int v9 = @"FAILED";
  if (!v8) {
    int v9 = @"INSTALLED";
  }
  v10 = v9;

  __int16 v11 = [v4 bundleID];
  [(AppsClient *)self changeAssetID:v11 toDo:v10];

  v12 = [v4 bundleID];
  [(AppsClient *)self cleanRestoreStateForIdentifier:v12];
}

- (BOOL)prepareAppForInstallUsingCoordination:(id)a3 existingApp:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 prettyName];
  v8 = [v6 identifier];
  int v9 = [v6 variantOptions];
  uint64_t v10 = [v9 objectForKeyedSubscript:@"Version"];

  __int16 v11 = [v6 infoPlist];
  v12 = +[NSDictionary dictionaryWithContentsOfFile:v11];

  int v13 = [v6 storePlist];
  v82 = +[NSDictionary dictionaryWithContentsOfFile:v13];

  v14 = [v12 objectForKey:@"LSApplicationLaunchProhibited"];
  unsigned int v15 = [v14 BOOLValue];

  v16 = _ATLogCategorySyncBundle_Oversize();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    v93 = v8;
    __int16 v94 = 2114;
    *(void *)v95 = v7;
    *(_WORD *)&v95[8] = 2114;
    *(void *)&v95[10] = v12;
    __int16 v96 = 2114;
    uint64_t v97 = v10;
    _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "processing app install for bundle '%{public}@', title %{public}@ assetplist %{public}@, version %{public}@ with install coordination", buf, 0x2Au);
  }
  v81 = (void *)v10;

  if (v4) {
    CFStringRef v17 = @"Update app";
  }
  else {
    CFStringRef v17 = @"Install App";
  }
  +[AITransactionLog logStep:1 byParty:1 phase:1 success:1 forBundleID:v8 description:v17];
  v80 = v12;
  if (![v7 length] && ![v8 length])
  {
    v19 = 0;
    v22 = 0;
    v18 = 0;
    goto LABEL_35;
  }
  unsigned int v77 = v15;
  id v91 = 0;
  v18 = [(AppsClient *)self _initiatingOrUpdatingAppInstallCoordinatorForBundleIdentifier:v8 existingApp:v4 createIfNotExisting:1 error:&v91];
  v19 = v91;
  if (!v18)
  {
    v22 = 0;
LABEL_35:
    v32 = 0;
    LOBYTE(v30) = 0;
    BOOL v31 = 0;
    goto LABEL_96;
  }
  [v18 setObserver:self];
  v79 = v7;
  if ([v18 hasInstallOptions])
  {
    v20 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v93 = v8;
      _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "coordinator for %{public}@ has install options", buf, 0xCu);
    }
    id v78 = 0;
    v21 = v19;
  }
  else
  {
    id v23 = [objc_alloc((Class)MIStoreMetadata) initWithDictionary:v82];
    v20 = objc_alloc_init((Class)MIInstallOptions);
    id v78 = v23;
    [v20 setITunesMetadata:v23];
    [v20 setLsInstallType:4];
    [v20 setInstallTargetType:1];
    v90 = v19;
    unsigned __int8 v24 = [v18 setInstallOptions:v20 error:&v90];
    v21 = v90;

    v25 = _ATLogCategorySyncBundle();
    v26 = v25;
    if ((v24 & 1) == 0)
    {
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v93 = v21;
        __int16 v94 = 2114;
        *(void *)v95 = v8;
        _os_log_impl(&dword_0, v26, OS_LOG_TYPE_ERROR, "Error %{public}@ setting install options on coordinator for '%{public}@'", buf, 0x16u);
      }

      v22 = 0;
      LOBYTE(v30) = 0;
      BOOL v31 = 0;
      goto LABEL_52;
    }
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v93 = v8;
      _os_log_impl(&dword_0, v26, OS_LOG_TYPE_DEFAULT, "set install options on coordinator for %{public}@", buf, 0xCu);
    }
  }
  if ([v18 hasInitialODRAssetPromises])
  {
    v20 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v93 = v8;
      _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "coordinator for %{public}@ has an ODR app asset promise", buf, 0xCu);
    }
    v19 = v21;
    v7 = v79;
  }
  else
  {
    v89 = v21;
    unsigned __int8 v28 = [v18 setInitialODRAssetPromises:&__NSArray0__struct error:&v89];
    v19 = v89;

    v29 = _ATLogCategorySyncBundle();
    v20 = v29;
    if ((v28 & 1) == 0)
    {
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v93 = v19;
        __int16 v94 = 2114;
        *(void *)v95 = v8;
        _os_log_impl(&dword_0, v20, OS_LOG_TYPE_ERROR, "Error %{public}@ setting ODR asset promise for '%{public}@'", buf, 0x16u);
      }
      v22 = 0;
      LOBYTE(v30) = 0;
      BOOL v31 = 0;
      goto LABEL_51;
    }
    v7 = v79;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v93 = v8;
      _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "set ODR asset promise to install coordinator for %{public}@", buf, 0xCu);
    }
  }

  if ([v18 hasAppAssetPromise])
  {
    v27 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v93 = v8;
      _os_log_impl(&dword_0, v27, OS_LOG_TYPE_DEFAULT, "coordinator for %{public}@ has an app asset promise", buf, 0xCu);
    }
  }
  else
  {
    v22 = [(AppsClient *)self _createAppAssetPromiseForBundleIdentifier:v8 atPath:0 andAddToCoordinatinator:v18];

    if (!v22)
    {
      LOBYTE(v30) = 0;
      BOOL v31 = 0;
      v32 = v78;
      goto LABEL_96;
    }
  }
  if (([v18 hasPlaceholderPromise] & 1) == 0)
  {
    v33 = [(AppsClient *)self placeholderAppPathForBundleIdentifier:v8];
    v100[0] = NSFileOwnerAccountName;
    v100[1] = NSFileGroupOwnerAccountName;
    v101[0] = @"mobile";
    v101[1] = @"mobile";
    v34 = +[NSDictionary dictionaryWithObjects:v101 forKeys:v100 count:2];
    unsigned int v35 = [(AppsClient *)self createPlaceHolderPath:v33 forBundleIdentifier:v8 withAttributes:v34];

    v76 = v33;
    if (v35)
    {
      v20 = [v33 stringByAppendingPathComponent:@"Icon.png"];
      v36 = +[NSFileManager defaultManager];
      v37 = [v6 icon];
      uint64_t v38 = [v37 path];

      v32 = v78;
      v74 = v36;
      v75 = v38;
      if (v38)
      {
        +[AITransactionLog logStep:5 byParty:1 phase:1 success:1 forBundleID:v8 description:@"Copying icon"];
        v88 = v19;
        unsigned int v39 = [v36 copyItemAtPath:v38 toPath:v20 error:&v88];
        v40 = v88;

        if (v39)
        {
          v87 = v40;
          v41 = [v36 attributesOfItemAtPath:v20 error:&v87];
          v19 = v87;

          id v42 = 0;
          if (v41 && !v19) {
            id v42 = [v41 fileSize];
          }
          v43 = _ATLogCategorySyncBundle();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543874;
            v93 = v8;
            __int16 v94 = 2114;
            *(void *)v95 = v20;
            *(_WORD *)&v95[8] = 2048;
            *(void *)&v95[10] = v42;
            _os_log_impl(&dword_0, v43, OS_LOG_TYPE_DEFAULT, "icon for %{public}@ at %{public}@ has a size of %llu", buf, 0x20u);
          }
        }
        else
        {
          id v42 = 0;
          v19 = v40;
        }
        v44 = _ATLogCategorySyncBundle();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138544386;
          v93 = v75;
          __int16 v94 = 2114;
          *(void *)v95 = v20;
          *(_WORD *)&v95[8] = 2114;
          *(void *)&v95[10] = v19;
          __int16 v96 = 2114;
          uint64_t v97 = (uint64_t)v8;
          __int16 v98 = 2048;
          id v99 = v42;
          _os_log_impl(&dword_0, v44, OS_LOG_TYPE_DEFAULT, "Copied icon from %{public}@ to %{public}@ with error %{public}@ for '%{public}@', sizeOnDisk:%llu", buf, 0x34u);
        }

        +[AITransactionLog logStep:5 byParty:1 phase:2 success:1 forBundleID:v8 description:@"Copying icon"];
      }
      else
      {
        id v42 = 0;
      }
    }
    else
    {
      id v42 = 0;
      v20 = 0;
      v32 = v78;
    }
    if (v79) {
      v45 = v79;
    }
    else {
      v45 = v8;
    }
    uint64_t v46 = [(AppsClient *)self _placeHolderForBundleIdentifier:v8 name:v45 installType:4];
    v22 = (void *)v46;
    if (v46 && v42)
    {
      v47 = [(AppsClient *)self _createIconPromiseForBundleIdentifier:v8 transferPath:v20 diskSpaceNeeded:v42 andAddToPlaceHolder:v46 forAppInstall:1];

      if (!v47)
      {
LABEL_88:
        v83 = v19;
        id v30 = [v18 setPlaceholderPromise:v22 error:&v83];
        v21 = v83;

        v62 = _ATLogCategorySyncBundle();
        v63 = v62;
        if (v30)
        {
          if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v93 = v8;
            v64 = "added placeholder promise to coordinator for %{public}@";
            v65 = v63;
            os_log_type_t v66 = OS_LOG_TYPE_DEFAULT;
            uint32_t v67 = 12;
LABEL_93:
            _os_log_impl(&dword_0, v65, v66, v64, buf, v67);
          }
        }
        else if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v93 = v21;
          __int16 v94 = 2114;
          *(void *)v95 = v8;
          v64 = "Error %{public}@ adding placeholder promise to coordinator for '%{public}@'";
          v65 = v63;
          os_log_type_t v66 = OS_LOG_TYPE_ERROR;
          uint32_t v67 = 22;
          goto LABEL_93;
        }

        BOOL v31 = (BOOL)v30;
        goto LABEL_95;
      }
    }
    else if (!v46)
    {
      goto LABEL_88;
    }
    v48 = [objc_alloc((Class)IXPlaceholderAttributes) initWithInfoPlistDictionary:v80];
    [v48 setLaunchProhibited:v77];
    [v48 setBundleVersion:v81];
    v86 = v19;
    unsigned __int8 v49 = [v22 setPlaceholderAttributes:v48 error:&v86];
    v50 = v86;

    v51 = _ATLogCategorySyncBundle();
    v52 = v51;
    if ((v49 & 1) == 0)
    {
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v93 = v50;
        __int16 v94 = 2114;
        *(void *)v95 = v8;
        _os_log_impl(&dword_0, v52, OS_LOG_TYPE_ERROR, "Error %{public}@ setting attributes on placeholder for '%{public}@'", buf, 0x16u);
      }

      goto LABEL_87;
    }
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v93 = v48;
      __int16 v94 = 2114;
      *(void *)v95 = v8;
      _os_log_impl(&dword_0, v52, OS_LOG_TYPE_DEFAULT, "set %{public}@ attributes on placeholder for %{public}@", buf, 0x16u);
    }

    v85 = v50;
    unsigned __int8 v53 = [v22 setMetadata:v32 error:&v85];
    v54 = v85;

    v55 = _ATLogCategorySyncBundle();
    v48 = v55;
    if ((v53 & 1) == 0)
    {
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v93 = v54;
        __int16 v94 = 2114;
        *(void *)v95 = v8;
        _os_log_impl(&dword_0, v48, OS_LOG_TYPE_ERROR, "Error %{public}@ setting store metadata on placeholder for '%{public}@'", buf, 0x16u);
      }
      v50 = v54;
      goto LABEL_87;
    }
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v93 = v8;
      _os_log_impl(&dword_0, v48, OS_LOG_TYPE_DEFAULT, "set store metadata on placeholder for %{public}@", buf, 0xCu);
    }

    v84 = v54;
    unsigned __int8 v56 = [v22 setConfigurationCompleteWithError:&v84];
    v50 = v84;

    v57 = _ATLogCategorySyncBundle();
    v48 = v57;
    if (v56)
    {
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v93 = v8;
        v58 = "set placeholder configuration as complete for %{public}@";
        v59 = v48;
        os_log_type_t v60 = OS_LOG_TYPE_DEFAULT;
        uint32_t v61 = 12;
LABEL_86:
        _os_log_impl(&dword_0, v59, v60, v58, buf, v61);
      }
    }
    else if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v93 = v50;
      __int16 v94 = 2114;
      *(void *)v95 = v8;
      v58 = "Error %{public}@ setting placeholder configuration as complete for '%{public}@'";
      v59 = v48;
      os_log_type_t v60 = OS_LOG_TYPE_ERROR;
      uint32_t v61 = 22;
      goto LABEL_86;
    }
LABEL_87:

    v19 = v50;
    goto LABEL_88;
  }
  v20 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v93 = v8;
    _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "coordinator for %{public}@ has a placeholder promise", buf, 0xCu);
  }
  v22 = 0;
  LOBYTE(v30) = 0;
  BOOL v31 = 1;
LABEL_51:
  v21 = v19;
LABEL_52:
  v32 = v78;
LABEL_95:

  v19 = v21;
  v7 = v79;
LABEL_96:
  v68 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v93 = v8;
    __int16 v94 = 1024;
    *(_DWORD *)v95 = v31;
    *(_WORD *)&v95[4] = 2114;
    *(void *)&v95[6] = v19;
    _os_log_impl(&dword_0, v68, OS_LOG_TYPE_DEFAULT, "processing app install for bundle %{public}@ finished with status %d error %{public}@", buf, 0x1Cu);
  }

  +[AITransactionLog logStep:1 byParty:1 phase:2 success:v31 forBundleID:v8 description:@"Install app"];
  if (!v31)
  {
    v69 = +[NSError errorWithDomain:@"ATError" code:1 userInfo:0];
    if (v22) {
      char v70 = (char)v30;
    }
    else {
      char v70 = 1;
    }
    if ((v70 & 1) == 0)
    {
      v71 = _ATLogCategorySyncBundle();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v93 = v8;
        _os_log_impl(&dword_0, v71, OS_LOG_TYPE_DEFAULT, "Cancelling placeholder for appBundleIdentifier:%{public}@", buf, 0xCu);
      }

      [v22 cancelForReason:v69 client:3 error:0];
    }
    if (v18)
    {
      v72 = _ATLogCategorySyncBundle();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v93 = v8;
        _os_log_impl(&dword_0, v72, OS_LOG_TYPE_DEFAULT, "Cancelling coordinator for appBundleIdentifier:%{public}@", buf, 0xCu);
      }

      [v18 cancelForReason:v69 client:3 error:0];
    }
  }
  return v31;
}

- (void)uninstallAppUsingCoordination:(id)a3
{
  id v3 = a3;
  +[AITransactionLog logStep:7 byParty:1 phase:1 success:1 forBundleID:v3 description:@"Uninstall app"];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_5CC8;
  v5[3] = &unk_18438;
  id v6 = v3;
  id v4 = v3;
  +[IXAppInstallCoordinator uninstallAppWithBundleID:v4 requestUserConfirmation:0 completion:v5];
}

- (BOOL)prepareAppForRestoreUsingCoordination:(id)a3 iTunesMetadata:(id)a4 sinfData:(id)a5 iconData:(id)a6 demotionStatus:(unint64_t)a7
{
  if (a7) {
    return -[AppsClient _prepareDemotedAppForRestoreWithBundleId:iTunesMetadata:sinfData:iconData:demotionStatus:](self, "_prepareDemotedAppForRestoreWithBundleId:iTunesMetadata:sinfData:iconData:demotionStatus:", a3, a4, a5, a6);
  }
  else {
    return [(AppsClient *)self _prepareNonDemotedAppForRestoreWithBundleId:a3 iTunesMetadata:a4 sinfData:a5 iconData:a6];
  }
}

- (BOOL)_prepareDemotedAppForRestoreWithBundleId:(id)a3 iTunesMetadata:(id)a4 sinfData:(id)a5 iconData:(id)a6 demotionStatus:(unint64_t)a7
{
  id v12 = a3;
  id v13 = a5;
  id v36 = a6;
  char v41 = 0;
  id v14 = a4;
  unsigned int v15 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v43 = v12;
    _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "processing app restore for demoted bundle '%{public}@' with install coordination", buf, 0xCu);
  }

  +[AITransactionLog logStep:2 byParty:1 phase:1 success:1 forBundleID:v12 description:@"Restore demoted app"];
  id v40 = 0;
  v16 = +[NSPropertyListSerialization propertyListWithData:v14 options:0 format:0 error:&v40];

  id v17 = v40;
  v34 = self;
  unsigned int v35 = v13;
  if (!v16)
  {
    v20 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v43 = v12;
      __int16 v44 = 2114;
      v45[0] = v17;
      _os_log_impl(&dword_0, v20, OS_LOG_TYPE_ERROR, "failed to parse itunes metadata for '%{public}@'. err=%{public}@", buf, 0x16u);
    }
    v22 = 0;
    v18 = 0;
    v21 = 0;
    goto LABEL_13;
  }
  id v39 = v17;
  v18 = +[IXRestoringDemotedAppInstallCoordinator coordinatorForAppWithBundleID:v12 withClientID:3 createIfNotExisting:1 created:&v41 error:&v39];
  id v19 = v39;

  if (!v18)
  {
    v20 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v43 = v19;
      __int16 v44 = 2114;
      v45[0] = v12;
      _os_log_impl(&dword_0, v20, OS_LOG_TYPE_ERROR, "Error %{public}@ creating restore coordinator for %{public}@", buf, 0x16u);
    }
    v22 = 0;
    v18 = 0;
    v21 = 0;
    char v23 = 0;
    BOOL v24 = 0;
    goto LABEL_25;
  }
  [v18 setObserver:self];
  if ([v18 hasUserDataPromise])
  {
    v20 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v43 = v12;
      _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "Coordinator for %{public}@ has a valid user data promise", buf, 0xCu);
    }
    v21 = 0;
    id v17 = v19;
LABEL_9:

    id v19 = v17;
    goto LABEL_21;
  }
  v21 = [(AppsClient *)self _userDataPromiseForBundleIdentifier:v12];
  if (v21)
  {
    id v38 = v19;
    unsigned __int8 v25 = [v18 setUserDataPromise:v21 error:&v38];
    id v17 = v38;

    v26 = _ATLogCategorySyncBundle();
    v20 = v26;
    if (v25)
    {
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v43 = v12;
        _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "Added out of band user data promise for for %{public}@", buf, 0xCu);
      }
      goto LABEL_9;
    }
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v43 = v17;
      __int16 v44 = 2114;
      v45[0] = v12;
      _os_log_impl(&dword_0, v20, OS_LOG_TYPE_ERROR, "Error %{public}@ adding out of band data promise for '%{public}@'", buf, 0x16u);
    }
    v22 = 0;
LABEL_13:
    char v23 = 0;
    BOOL v24 = 0;
LABEL_26:

    id v19 = v17;
    goto LABEL_27;
  }
LABEL_21:
  if (objc_msgSend(v18, "hasPlaceholderPromise", v34, v13))
  {
    v20 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v43 = v12;
      _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "Coordinator for %{public}@ has a valid placeholder promise", buf, 0xCu);
    }
    v22 = 0;
    char v23 = 0;
    BOOL v24 = 1;
LABEL_25:
    id v17 = v19;
    goto LABEL_26;
  }
  v22 = [(AppsClient *)v34 _placeHolderForBundleIdentifier:v12 withiTunesMetadata:v16 sinfData:v13 iconData:v36 demotionStatus:a7];
  if (v22)
  {
    id v37 = v19;
    unsigned __int8 v33 = [v18 setPlaceholderPromise:v22 error:&v37];
    id v17 = v37;

    if (v33)
    {
      [(AppsClient *)v34 dataMigratorSetPlaceHolderPromiseForRestoreAppBundle:v12];
      v20 = _ATLogCategorySyncBundle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v43 = v12;
        _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "added placeholder promise for %{public}@", buf, 0xCu);
      }
      char v23 = 1;
      BOOL v24 = 1;
      goto LABEL_26;
    }
    v20 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v43 = v17;
      __int16 v44 = 2114;
      v45[0] = v12;
      _os_log_impl(&dword_0, v20, OS_LOG_TYPE_ERROR, "Error %{public}@ setting placeholder promise for '%{public}@'", buf, 0x16u);
    }
    goto LABEL_13;
  }
  char v23 = 0;
  BOOL v24 = 0;
LABEL_27:
  v27 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v43 = v12;
    __int16 v44 = 1024;
    LODWORD(v45[0]) = v24;
    WORD2(v45[0]) = 2114;
    *(void *)((char *)v45 + 6) = v19;
    _os_log_impl(&dword_0, v27, OS_LOG_TYPE_DEFAULT, "processing app restore for demoted app %{public}@ finished with status %d error %{public}@", buf, 0x1Cu);
  }

  +[AITransactionLog logStep:2 byParty:1 phase:2 success:v24 forBundleID:v12 description:@"Restore demoted app"];
  if (!v24)
  {
    unsigned __int8 v28 = +[NSError errorWithDomain:@"ATError" code:29 userInfo:0];
    if (v18)
    {
      v29 = _ATLogCategorySyncBundle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v43 = v12;
        _os_log_impl(&dword_0, v29, OS_LOG_TYPE_DEFAULT, "Cancelling coordinator for appBundleIdentifier:%{public}@", buf, 0xCu);
      }

      [v18 cancelForReason:v28 client:3 error:0];
    }
    if (v22) {
      char v30 = v23;
    }
    else {
      char v30 = 1;
    }
    if ((v30 & 1) == 0)
    {
      BOOL v31 = _ATLogCategorySyncBundle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v43 = v12;
        _os_log_impl(&dword_0, v31, OS_LOG_TYPE_DEFAULT, "Cancelling placeholder for appBundleIdentifier:%{public}@", buf, 0xCu);
      }

      [v22 cancelForReason:v28 client:3 error:0];
    }
    -[AppsClient dataMigratorCancelledCoordinatorForRestoreAppBundle:](v34, "dataMigratorCancelledCoordinatorForRestoreAppBundle:", v12, v34);
  }
  return v24;
}

- (BOOL)_prepareNonDemotedAppForRestoreWithBundleId:(id)a3 iTunesMetadata:(id)a4 sinfData:(id)a5 iconData:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  char v47 = 0;
  id v13 = a4;
  id v14 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v49 = v10;
    _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "processing app restore for non demoted bundle '%{public}@' with install coordination", buf, 0xCu);
  }

  +[AITransactionLog logStep:2 byParty:1 phase:1 success:1 forBundleID:v10 description:@"Restore app"];
  id v46 = 0;
  unsigned int v15 = +[NSPropertyListSerialization propertyListWithData:v13 options:0 format:0 error:&v46];

  id v16 = v46;
  char v41 = v12;
  if (!v15)
  {
    id v39 = self;
    id v40 = v11;
    char v23 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v49 = v10;
      __int16 v50 = 2114;
      v51[0] = v16;
      _os_log_impl(&dword_0, v23, OS_LOG_TYPE_ERROR, "failed to parse itunes metadata for '%{public}@'. err=%{public}@", buf, 0x16u);
    }
    v21 = 0;
    id v17 = 0;
    v22 = 0;
    goto LABEL_12;
  }
  id v45 = v16;
  id v17 = +[IXRestoringAppInstallCoordinator coordinatorForAppWithBundleID:v10 withClientID:3 createIfNotExisting:1 created:&v47 error:&v45];
  id v18 = v45;

  if (!v17)
  {
    id v39 = self;
    id v40 = v11;
    char v23 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v49 = v18;
      __int16 v50 = 2114;
      v51[0] = v10;
      _os_log_impl(&dword_0, v23, OS_LOG_TYPE_ERROR, "Error %{public}@ creating restore coordinator for %{public}@", buf, 0x16u);
    }
    v21 = 0;
    id v17 = 0;
    v22 = 0;
    uint64_t v24 = 0;
    unsigned __int8 v25 = 1;
    id v16 = v18;
    goto LABEL_16;
  }
  if ([v17 appAssetPromiseResponsibleClientWithError:0] == (char *)&dword_0 + 1)
  {
    id v19 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v49 = v10;
      __int16 v50 = 2048;
      v51[0] = 1;
      _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "App asset DRI for %{public}@ is set to %lu - nothing more for atc to do", buf, 0x16u);
    }

    BOOL v20 = 1;
    +[AITransactionLog logStep:2 byParty:1 phase:2 success:1 forBundleID:v10 description:@"Restore app"];
    v21 = 0;
    v22 = 0;
    goto LABEL_32;
  }
  [v17 setObserver:self];
  id v39 = self;
  id v40 = v11;
  if ([v17 hasUserDataPromise])
  {
    char v23 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v49 = v10;
      _os_log_impl(&dword_0, v23, OS_LOG_TYPE_DEFAULT, "Coordinator for %{public}@ has a valid user data promise", buf, 0xCu);
    }
    v22 = 0;
    id v16 = v18;
  }
  else
  {
    v22 = [(AppsClient *)self _userDataPromiseForBundleIdentifier:v10];
    if (!v22) {
      goto LABEL_42;
    }
    id v44 = v18;
    unsigned __int8 v32 = [v17 setUserDataPromise:v22 error:&v44];
    id v16 = v44;

    unsigned __int8 v33 = _ATLogCategorySyncBundle();
    char v23 = v33;
    if ((v32 & 1) == 0)
    {
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v49 = v16;
        __int16 v50 = 2114;
        v51[0] = v10;
        _os_log_impl(&dword_0, v23, OS_LOG_TYPE_ERROR, "Error %{public}@ adding out of band data promise for '%{public}@'", buf, 0x16u);
      }
      v21 = 0;
      goto LABEL_12;
    }
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v49 = v10;
      _os_log_impl(&dword_0, v23, OS_LOG_TYPE_DEFAULT, "Added out of band user data promise for for %{public}@", buf, 0xCu);
    }
  }

  id v18 = v16;
LABEL_42:
  unsigned __int8 v25 = [v17 hasPlaceholderPromise];
  if (v25)
  {
    v34 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v49 = v10;
      _os_log_impl(&dword_0, v34, OS_LOG_TYPE_DEFAULT, "Coordinator for %{public}@ has a valid placeholder promise", buf, 0xCu);
    }
    v21 = 0;
    id v16 = v18;
LABEL_46:
    unsigned int v35 = v16;

    id v42 = v16;
    unsigned __int8 v36 = [v17 setAppAssetPromiseResponsibleClient:1 error:&v42];
    id v16 = v42;

    id v37 = _ATLogCategorySyncBundle();
    char v23 = v37;
    if (v36)
    {
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v49 = v10;
        _os_log_impl(&dword_0, v23, OS_LOG_TYPE_DEFAULT, "set IXClientAppStore to satisfy app asset promise for %{public}@", buf, 0xCu);
      }
      uint64_t v24 = 1;
    }
    else
    {
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v49 = v16;
        __int16 v50 = 2114;
        v51[0] = v10;
        _os_log_impl(&dword_0, v23, OS_LOG_TYPE_ERROR, "Error %{public}@ setting IXClientAppStore to satisfy app data promise for '%{public}@'", buf, 0x16u);
      }
      uint64_t v24 = 0;
    }
    goto LABEL_16;
  }
  v21 = [(AppsClient *)v39 _placeHolderForBundleIdentifier:v10 withiTunesMetadata:v15 sinfData:v40 iconData:v12 demotionStatus:0];
  if (!v21)
  {
    uint64_t v24 = 0;
    unsigned __int8 v25 = 1;
    goto LABEL_17;
  }
  id v43 = v18;
  unsigned __int8 v38 = [v17 setPlaceholderPromise:v21 error:&v43];
  id v16 = v43;

  if (v38)
  {
    [(AppsClient *)v39 dataMigratorSetPlaceHolderPromiseForRestoreAppBundle:v10];
    v34 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v49 = v10;
      _os_log_impl(&dword_0, v34, OS_LOG_TYPE_DEFAULT, "added placeholder promise for %{public}@", buf, 0xCu);
    }
    goto LABEL_46;
  }
  char v23 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    id v49 = v16;
    __int16 v50 = 2114;
    v51[0] = v10;
    _os_log_impl(&dword_0, v23, OS_LOG_TYPE_ERROR, "Error %{public}@ setting placeholder promise for '%{public}@'", buf, 0x16u);
  }
LABEL_12:
  uint64_t v24 = 0;
  unsigned __int8 v25 = 1;
LABEL_16:

  id v18 = v16;
LABEL_17:
  v26 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v49 = v10;
    __int16 v50 = 1024;
    LODWORD(v51[0]) = v24;
    WORD2(v51[0]) = 2114;
    *(void *)((char *)v51 + 6) = v18;
    _os_log_impl(&dword_0, v26, OS_LOG_TYPE_DEFAULT, "processing app restore for %{public}@ finished with status %d error %{public}@", buf, 0x1Cu);
  }

  BOOL v20 = 1;
  +[AITransactionLog logStep:2 byParty:1 phase:2 success:v24 forBundleID:v10 description:@"Restore app"];
  if (v24)
  {
    id v11 = v40;
  }
  else
  {
    v27 = +[NSError errorWithDomain:@"ATError" code:29 userInfo:0];
    if (v17)
    {
      unsigned __int8 v28 = _ATLogCategorySyncBundle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v49 = v10;
        _os_log_impl(&dword_0, v28, OS_LOG_TYPE_DEFAULT, "Cancelling coordinator for appBundleIdentifier:%{public}@", buf, 0xCu);
      }

      [v17 cancelForReason:v27 client:3 error:0];
    }
    char v29 = v25 ^ 1;
    if (!v21) {
      char v29 = 1;
    }
    id v11 = v40;
    if ((v29 & 1) == 0)
    {
      char v30 = _ATLogCategorySyncBundle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v49 = v10;
        _os_log_impl(&dword_0, v30, OS_LOG_TYPE_DEFAULT, "Cancelling placeholder for appBundleIdentifier:%{public}@", buf, 0xCu);
      }

      [v21 cancelForReason:v27 client:3 error:0];
    }
    [(AppsClient *)v39 dataMigratorCancelledCoordinatorForRestoreAppBundle:v10];

    BOOL v20 = 0;
  }
LABEL_32:

  return v20;
}

- (BOOL)updateTransferProgressForApp:(id)a3 existingApp:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 identifier];
  id v28 = 0;
  v8 = [(AppsClient *)self _initiatingOrUpdatingAppInstallCoordinatorForBundleIdentifier:v7 existingApp:v4 createIfNotExisting:0 error:&v28];
  id v9 = v28;

  if (v8 && ([v8 error], id v10 = objc_claimAutoreleasedReturnValue(), v10, !v10))
  {
    id v27 = v9;
    id v12 = [v8 appAssetPromiseWithError:&v27];
    id v13 = v27;

    unsigned int v14 = [v12 isComplete];
    if (v14)
    {
      unsigned int v15 = _ATLogCategorySyncBundle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = [v6 identifier];
        *(_DWORD *)buf = 138543362;
        double v30 = *(double *)&v16;
        _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "Asset promise is already satisfied for %{public}@", buf, 0xCu);
      }
    }
    else
    {
      if (!v12)
      {
        id v17 = [v6 identifier];
        id v18 = [v6 path];
        id v12 = [(AppsClient *)self _createAppAssetPromiseForBundleIdentifier:v17 atPath:v18 andAddToCoordinatinator:v8];
      }
      id v19 = _ATLogCategorySyncBundle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        [v6 downloadProgress];
        double v21 = v20;
        [v6 installProgress];
        double v23 = v22;
        uint64_t v24 = [v6 identifier];
        *(_DWORD *)buf = 134218498;
        double v30 = v21;
        __int16 v31 = 2048;
        double v32 = v23;
        __int16 v33 = 2114;
        v34 = v24;
        _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "Updating download progress: %f install progress:%f for %{public}@", buf, 0x20u);
      }
      [v6 downloadProgress];
      [v12 setPercentComplete:v25];
    }
    char v11 = v14 ^ 1;

    id v9 = v13;
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (void)transferCompleteForApp:(id)a3 withError:(id)a4 isExistingApp:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 identifier];
  id v23 = 0;
  char v11 = [(AppsClient *)self _initiatingOrUpdatingAppInstallCoordinatorForBundleIdentifier:v10 existingApp:v5 createIfNotExisting:0 error:&v23];
  id v12 = v23;

  if (v11)
  {
    id v13 = [v11 error];

    if (!v13)
    {
      if (v9)
      {
        unsigned int v14 = IXCreateUserPresentableError();
        [v11 cancelForReason:v14 client:3 error:0];
        id v15 = v12;
      }
      else
      {
        id v22 = v12;
        unsigned int v14 = [v11 appAssetPromiseWithError:&v22];
        id v15 = v22;

        if ([v14 isComplete])
        {
          id v16 = _ATLogCategorySyncBundle();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            id v17 = [v8 identifier];
            *(_DWORD *)buf = 138543362;
            float v25 = v17;
            _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "Asset promise is already satisfied for %{public}@", buf, 0xCu);
          }
        }
        else
        {
          if (v14)
          {
            id v18 = [v8 path];
            id v19 = +[NSURL fileURLWithPath:v18];
            [v14 setTransferPath:v19];
          }
          else
          {
            id v18 = [v8 identifier];
            id v19 = [v8 path];
            unsigned int v14 = [(AppsClient *)self _createAppAssetPromiseForBundleIdentifier:v18 atPath:v19 andAddToCoordinatinator:v11];
          }

          float v20 = _ATLogCategorySyncBundle();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            double v21 = [v8 identifier];
            *(_DWORD *)buf = 138543362;
            float v25 = v21;
            _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "Satisfying asset promise for %{public}@", buf, 0xCu);
          }
          [v14 setPercentComplete:1.0];
          [v14 setComplete:1];
        }
      }

      id v12 = v15;
    }
  }
}

- (void)assetSyncFinishedWithStatus:(BOOL)a3 outstandingItems:(id)a4
{
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = a4;
  id v5 = [obj countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v19;
    *(void *)&long long v6 = 138543618;
    long long v15 = v6;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * (void)v9);
        id v17 = 0;
        char v11 = +[IXAppInstallCoordinator coordinatorForAppWithBundleID:withClientID:createIfNotExisting:created:error:](IXAppInstallCoordinator, "coordinatorForAppWithBundleID:withClientID:createIfNotExisting:created:error:", v10, 3, 0, 0, &v17, v15);
        id v12 = v17;
        if (v11 && !a3)
        {
          id v13 = +[NSError errorWithDomain:@"ATError" code:30 userInfo:0];
          unsigned int v14 = _ATLogCategorySyncBundle();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v15;
            id v23 = v13;
            __int16 v24 = 2114;
            uint64_t v25 = v10;
            _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "Cancelling coordinator with error %{public}@ for %{public}@", buf, 0x16u);
          }

          [v11 cancelForReason:v13 client:3 error:0];
        }

        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [obj countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v7);
  }
}

- (id)_createIconPromiseForBundleIdentifier:(id)a3 transferPath:(id)a4 diskSpaceNeeded:(unint64_t)a5 andAddToPlaceHolder:(id)a6 forAppInstall:(BOOL)a7
{
  BOOL v7 = a7;
  char v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if (!v13)
  {
    long long v19 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v28 = v11;
      _os_log_impl(&dword_0, v19, OS_LOG_TYPE_ERROR, "Placeholder to add icon promise is nil for '%{public}@'", buf, 0xCu);
    }
    id v17 = 0;
    goto LABEL_17;
  }
  id v14 = objc_alloc((Class)IXPromisedTransferToPath);
  long long v15 = [v11 stringByAppendingString:@"-Icon"];
  id v16 = +[NSURL fileURLWithPath:v12];
  id v17 = [v14 initWithName:v15 client:3 transferPath:v16 diskSpaceNeeded:a5];

  if (v17)
  {
    [v17 setPercentComplete:1.0];
    [v17 setComplete:1];
    id v26 = 0;
    unsigned __int8 v18 = [v13 setIconPromise:v17 error:&v26];
    long long v19 = v26;
    long long v20 = _ATLogCategorySyncBundle();
    long long v21 = v20;
    if (v18)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v28 = v11;
        _os_log_impl(&dword_0, v21, OS_LOG_TYPE_DEFAULT, "Added icon promise to placeholder for '%{public}@'", buf, 0xCu);
      }

      id v22 = v17;
      goto LABEL_18;
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v28 = v19;
      __int16 v29 = 2114;
      double v30 = v11;
      _os_log_impl(&dword_0, v21, OS_LOG_TYPE_ERROR, "Error %{public}@ adding icon promise to placeholder for '%{public}@'", buf, 0x16u);
    }

    if (v7) {
      uint64_t v23 = 30;
    }
    else {
      uint64_t v23 = 29;
    }
    long long v19 = +[NSError errorWithDomain:@"ATError" code:v23 userInfo:0];
    [v17 cancelForReason:v19 client:3 error:0];
LABEL_17:
    id v22 = 0;
LABEL_18:

    goto LABEL_19;
  }
  id v22 = 0;
LABEL_19:
  id v24 = v22;

  return v24;
}

- (id)_placeHolderForBundleIdentifier:(id)a3 name:(id)a4 installType:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  +[AITransactionLog logStep:4 byParty:1 phase:1 success:1 forBundleID:v7 description:@"Create placeholder"];
  id v9 = [objc_alloc((Class)IXPlaceholder) initAppPlaceholderWithBundleName:v8 bundleID:v7 installType:a5 client:3];

  +[AITransactionLog logStep:4 byParty:1 phase:2 success:v9 != 0 forBundleID:v7 description:@"Finished creating placeholder"];
  uint64_t v10 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543874;
    id v13 = v9;
    __int16 v14 = 2114;
    id v15 = v7;
    __int16 v16 = 2048;
    unint64_t v17 = a5;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Created placeholder %{public}@ for '%{public}@' of type %lu", (uint8_t *)&v12, 0x20u);
  }

  return v9;
}

- (id)_initiatingOrUpdatingAppInstallCoordinatorForBundleIdentifier:(id)a3 existingApp:(BOOL)a4 createIfNotExisting:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v9 = a3;
  char v23 = 0;
  +[AITransactionLog logStep:3 byParty:1 phase:1 success:1 forBundleID:v9 description:@"Create coordinator"];
  if (v8)
  {
    uint64_t v10 = IXUpdatingAppInstallCoordinator;
    uint64_t v22 = 0;
    char v11 = (id *)&v22;
    int v12 = &v22;
  }
  else
  {
    uint64_t v10 = IXInitiatingAppInstallCoordinator;
    uint64_t v21 = 0;
    char v11 = (id *)&v21;
    int v12 = &v21;
  }
  id v13 = [v10 coordinatorForAppWithBundleID:v9 withClientID:3 createIfNotExisting:v7 created:&v23 error:v12];
  id v14 = *v11;
  if (v13)
  {
    id v15 = (char *)[v13 creatorIdentifier];
    __int16 v16 = _ATLogCategorySyncBundle();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if (v15 == (unsigned char *)&dword_0 + 3)
    {
      if (v17)
      {
        unsigned __int8 v18 = "initiating";
        *(_DWORD *)buf = 136316418;
        if (v8) {
          unsigned __int8 v18 = "updating";
        }
        uint64_t v25 = v18;
        __int16 v26 = 2114;
        id v27 = v13;
        __int16 v28 = 1024;
        BOOL v29 = v7;
        __int16 v30 = 1024;
        BOOL v31 = v8;
        __int16 v32 = 2114;
        id v33 = v9;
        __int16 v34 = 2114;
        id v35 = v14;
        _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "Created %s coordinator %{public}@ (createIfNotExisting:%d, existingApp:%d) for %{public}@ with error %{public}@", buf, 0x36u);
      }
    }
    else
    {
      if (v17)
      {
        long long v19 = "initiating";
        *(_DWORD *)buf = 136316674;
        if (v8) {
          long long v19 = "updating";
        }
        uint64_t v25 = v19;
        __int16 v26 = 2114;
        id v27 = v13;
        __int16 v28 = 1024;
        BOOL v29 = v7;
        __int16 v30 = 1024;
        BOOL v31 = v8;
        __int16 v32 = 2048;
        id v33 = v15;
        __int16 v34 = 2114;
        id v35 = v9;
        __int16 v36 = 2114;
        id v37 = v14;
        _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "IC returned %s coordinator %{public}@ (createIfNotExisting:%d, existingApp:%d, creatorIdentifier=%lu) for %{public}@ with error %{public}@ - Will not perform install/update for this bundle", buf, 0x40u);
      }

      __int16 v16 = v13;
      id v13 = 0;
    }
  }
  if (a6) {
    *a6 = v14;
  }
  +[AITransactionLog logStep:3 byParty:1 phase:2 success:v13 != 0 forBundleID:v9 description:@"Finished creating coordinator"];

  return v13;
}

- (id)_createAppAssetPromiseForBundleIdentifier:(id)a3 atPath:(id)a4 andAddToCoordinatinator:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    id v10 = objc_alloc((Class)IXPromisedTransferToPath);
    char v11 = [v7 stringByAppendingString:@"-Asset"];
    if (v8)
    {
      int v12 = +[NSURL fileURLWithPath:v8];
      id v13 = [v10 initWithName:v11 client:3 transferPath:v12 diskSpaceNeeded:0];
    }
    else
    {
      id v13 = [v10 initWithName:v11 client:3 diskSpaceNeeded:0];
    }

    if (v13)
    {
      id v22 = 0;
      unsigned __int8 v16 = [v9 setAppAssetPromise:v13 error:&v22];
      id v14 = v22;
      BOOL v17 = _ATLogCategorySyncBundle();
      unsigned __int8 v18 = v17;
      if (v16)
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v24 = v7;
          _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "Added app asset promise to coordinator for '%{public}@'", buf, 0xCu);
        }
        id v15 = v13;
        goto LABEL_20;
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        id v24 = v14;
        __int16 v25 = 2114;
        id v26 = v8;
        __int16 v27 = 2114;
        id v28 = v7;
        _os_log_impl(&dword_0, v18, OS_LOG_TYPE_ERROR, "Error %{public}@ adding app asset promise at %{public}@ to '%{public}@'", buf, 0x20u);
      }

      long long v19 = _ATLogCategorySyncBundle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v24 = v7;
        _os_log_impl(&dword_0, v19, OS_LOG_TYPE_ERROR, "Cancelling asset promise for '%{public}@'", buf, 0xCu);
      }

      unsigned __int8 v18 = +[NSError errorWithDomain:@"ATError" code:30 userInfo:0];
      [v13 cancelForReason:v18 client:3 error:0];
    }
    else
    {
      unsigned __int8 v18 = _ATLogCategorySyncBundle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v24 = v7;
        _os_log_impl(&dword_0, v18, OS_LOG_TYPE_ERROR, "Error creating asset promise for '%{public}@'", buf, 0xCu);
      }
      id v14 = 0;
      id v13 = 0;
    }
    id v15 = 0;
LABEL_20:

    goto LABEL_21;
  }
  id v14 = 0;
  id v13 = 0;
  id v15 = 0;
LABEL_21:
  id v20 = v15;

  return v20;
}

- (id)_userDataPromiseForBundleIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)IXPromisedOutOfBandTransfer);
  id v5 = [v3 stringByAppendingString:@"-UserData"];

  id v6 = [v4 initWithName:v5 client:3 diskSpaceNeeded:0];
  if (v6)
  {
    [v6 setPercentComplete:1.0];
    [v6 setComplete:1];
  }

  return v6;
}

- (id)_placeHolderForBundleIdentifier:(id)a3 withiTunesMetadata:(id)a4 sinfData:(id)a5 iconData:(id)a6 demotionStatus:(unint64_t)a7
{
  char v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v60 = 0;
  id v15 = [v12 objectForKey:@"title"];
  if (!v15)
  {
    id v15 = [v12 objectForKey:@"itemName"];
    if (!v15) {
      id v15 = v11;
    }
  }
  id v54 = v14;
  v55 = v15;
  unsigned __int8 v53 = [v12 objectForKey:@"bundleVersion"];
  unsigned __int8 v16 = [(AppsClient *)self placeholderAppPathForBundleIdentifier:v11];
  BOOL v17 = [v12 objectForKey:@"LSApplicationLaunchProhibited"];
  if (!v17)
  {
    BOOL v17 = [v12 objectForKey:@"launchProhibited"];
  }
  __int16 v50 = v17;
  id v51 = v12;
  unsigned int v47 = [v17 BOOLValue];
  v67[0] = NSFileOwnerAccountName;
  v67[1] = NSFileGroupOwnerAccountName;
  v68[0] = @"mobile";
  v68[1] = @"mobile";
  unsigned __int8 v18 = +[NSDictionary dictionaryWithObjects:v68 forKeys:v67 count:2];
  unsigned int v19 = [(AppsClient *)self createPlaceHolderPath:v16 forBundleIdentifier:v11 withAttributes:v18];

  v52 = v16;
  if (!v19)
  {
    __int16 v25 = v11;
    BOOL v31 = 0;
    id v20 = 0;
    id v26 = 0;
    char v41 = 0;
    __int16 v34 = v51;
    __int16 v27 = v13;
    id v22 = v54;
    goto LABEL_40;
  }
  [v16 stringByAppendingPathComponent:@"Icon.png"];
  v65[0] = NSFileOwnerAccountName;
  v65[1] = NSFileGroupOwnerAccountName;
  v66[0] = @"mobile";
  id v20 = v66[1] = @"mobile";
  uint64_t v21 = +[NSDictionary dictionaryWithObjects:v66 forKeys:v65 count:2];
  id v22 = v54;
  [(AppsClient *)self writeIconData:v54 atPath:v20 returningFileSize:&v60 forBundleIdentifier:v11 withAttributes:v21];

  uint64_t v23 = 7;
  if (a7 != 2) {
    uint64_t v23 = 2;
  }
  if (a7 == 1) {
    uint64_t v24 = 8;
  }
  else {
    uint64_t v24 = v23;
  }
  __int16 v25 = v11;
  id v26 = [(AppsClient *)self _placeHolderForBundleIdentifier:v11 name:v55 installType:v24];
  if (!v26)
  {
    BOOL v31 = 0;
    char v41 = 0;
    __int16 v34 = v51;
    __int16 v27 = v13;
    goto LABEL_40;
  }
  __int16 v27 = v13;
  if (!v60
    || ([(AppsClient *)self _createIconPromiseForBundleIdentifier:v25 transferPath:v20 diskSpaceNeeded:v60 andAddToPlaceHolder:v26 forAppInstall:0], id v28 = objc_claimAutoreleasedReturnValue(), v28, v28))
  {
    BOOL v29 = objc_alloc_init((Class)IXPlaceholderAttributes);
    [v29 setLaunchProhibited:v47];
    [v29 setBundleVersion:v53];
    id v59 = 0;
    unsigned __int8 v30 = [v26 setPlaceholderAttributes:v29 error:&v59];
    BOOL v31 = v59;
    __int16 v32 = _ATLogCategorySyncBundle();
    id v33 = v32;
    __int16 v34 = v51;
    if (v30)
    {
      id v49 = v20;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v62 = v29;
        __int16 v63 = 2114;
        v64 = v25;
        _os_log_impl(&dword_0, v33, OS_LOG_TYPE_DEFAULT, "set %{public}@ placeholder attributes for %{public}@", buf, 0x16u);
      }

      BOOL v29 = [objc_alloc((Class)MIStoreMetadata) initWithDictionary:v51];
      v58 = v31;
      unsigned __int8 v35 = [v26 setMetadata:v29 error:&v58];
      __int16 v36 = v58;

      id v37 = _ATLogCategorySyncBundle();
      unsigned __int8 v38 = v37;
      if ((v35 & 1) == 0)
      {
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v62 = v36;
          __int16 v63 = 2114;
          v64 = v25;
          _os_log_impl(&dword_0, v38, OS_LOG_TYPE_ERROR, "Error %{public}@ setting store metadata for '%{public}@'", buf, 0x16u);
        }

        BOOL v31 = v36;
        id v22 = v54;
LABEL_36:
        id v20 = v49;
        goto LABEL_37;
      }
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v62 = v25;
        _os_log_impl(&dword_0, v38, OS_LOG_TYPE_DEFAULT, "set store metadata on placeholder for %{public}@", buf, 0xCu);
      }

      if (!v27)
      {
        BOOL v31 = v36;
LABEL_44:
        id v22 = v54;
        id v44 = v31;
        unsigned __int8 v56 = v31;
        unsigned __int8 v45 = [v26 setConfigurationCompleteWithError:&v56];
        BOOL v31 = v56;

        id v46 = _ATLogCategorySyncBundle();
        BOOL v29 = v46;
        if (v45)
        {
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v62 = v25;
            _os_log_impl(&dword_0, v29, OS_LOG_TYPE_DEFAULT, "set placeholder configuration complete for %{public}@", buf, 0xCu);
          }
          char v41 = v26;
          id v20 = v49;
          goto LABEL_39;
        }
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v62 = v31;
          __int16 v63 = 2114;
          v64 = v25;
          _os_log_impl(&dword_0, v29, OS_LOG_TYPE_ERROR, "Error %{public}@ setting placeholder configuration as complete for '%{public}@'", buf, 0x16u);
        }
        goto LABEL_36;
      }
      v57 = v36;
      unsigned __int8 v39 = [v26 setSinfData:v27 error:&v57];
      BOOL v31 = v57;

      id v40 = _ATLogCategorySyncBundle();
      BOOL v29 = v40;
      if (v39)
      {
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v62 = v25;
          _os_log_impl(&dword_0, v29, OS_LOG_TYPE_DEFAULT, "set SINF data on placeholder for %{public}@", buf, 0xCu);
        }

        goto LABEL_44;
      }
      id v20 = v49;
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v62 = v31;
        __int16 v63 = 2114;
        v64 = v25;
        _os_log_impl(&dword_0, v29, OS_LOG_TYPE_ERROR, "Error %{public}@ setting SINF data for '%{public}@'", buf, 0x16u);
      }
    }
    else
    {
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v62 = v31;
        __int16 v63 = 2114;
        v64 = v25;
        _os_log_impl(&dword_0, v33, OS_LOG_TYPE_ERROR, "Error %{public}@ setting placeholder attributes for '%{public}@'", buf, 0x16u);
      }
    }
    id v22 = v54;
LABEL_37:

    goto LABEL_38;
  }
  BOOL v31 = 0;
  __int16 v34 = v12;
LABEL_38:
  BOOL v29 = +[NSError errorWithDomain:@"ATError" code:29 userInfo:0];
  [v26 cancelForReason:v29 client:3 error:0];
  char v41 = 0;
LABEL_39:

LABEL_40:
  id v42 = v41;

  return v42;
}

- (AppsClient)init
{
  v7.receiver = self;
  v7.super_class = (Class)AppsClient;
  v2 = [(AppsClient *)&v7 init];
  if (v2)
  {
    v2->_installGroup = (OS_dispatch_group *)dispatch_group_create();
    v2->_restorePlaceHoldersWaitGroup = (OS_dispatch_group *)dispatch_group_create();
    v2->_outstandingAFCTransfers = (NSMutableSet *)[objc_alloc((Class)NSMutableSet) initWithCapacity:0];
    v2->_vppAppsToIgnore = (NSMutableSet *)[objc_alloc((Class)NSMutableSet) initWithCapacity:0];
    v2->_placeholdersForRestoringApps = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    id v3 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    v2->_installOperationQueue = v3;
    [(NSOperationQueue *)v3 setMaxConcurrentOperationCount:10];
    v2->_backupManager = (MBManager *)objc_alloc_init((Class)MBManager);
    v2->_accessQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.amp.AirTraffic.AppSync", 0);
    v2->_restoreQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.amp.AirTraffic.AppRestore", 0);
    objc_msgSend(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"), "addObserver:", v2);
    os_log_t v4 = os_log_create("com.apple.appinstallation", "atc.appsync");
    +[AITransactionLog initializeWithLog:v4];

    v2->_finishedWaitingForPlaceHolderInstalls = 0;
    v2->_restoringPlaceholderCount = 0;
    v2->_updatingApps = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v2->_userCancelledApps = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    if ([(AppsClient *)v2 _isATCDaemon])
    {
      v2->_finishedWaitingForPlaceHolderInstalls = 1;
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_handleATCStartupCompletedNotification, @"com.apple.atc.ATStartupCompleteNotification", 0, CFNotificationSuspensionBehaviorDrop);
    }
  }
  return v2;
}

- (void)dealloc
{
  id v3 = (NSMutableSet *)[(NSMutableSet *)self->_outstandingAFCTransfers count];
  if (v3)
  {
    os_log_t v4 = v3;
    id v5 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v13 = self;
      __int16 v14 = 2048;
      id v15 = v4;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_ERROR, "%{public}@ getting dealloc'd with %lu outstanding AFC transfers!", buf, 0x16u);
    }
  }
  if ([(NSMutableSet *)self->_placeholdersForRestoringApps count])
  {
    id v6 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      placeholdersForRestoringApps = self->_placeholdersForRestoringApps;
      *(_DWORD *)buf = 138543618;
      id v13 = self;
      __int16 v14 = 2114;
      id v15 = placeholdersForRestoringApps;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_ERROR, "%{public}@ getting dealloc'd with %{public}@pending placeholder install complete notifications", buf, 0x16u);
    }
  }

  installGroup = self->_installGroup;
  if (installGroup) {
    dispatch_release((dispatch_object_t)installGroup);
  }
  restorePlaceHoldersWaitGroup = self->_restorePlaceHoldersWaitGroup;
  if (restorePlaceHoldersWaitGroup) {
    dispatch_release((dispatch_object_t)restorePlaceHoldersWaitGroup);
  }
  objc_msgSend(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"), "removeObserver:", self);
  if ([(AppsClient *)self _isATCDaemon])
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.atc.ATStartupCompleteNotification", 0);
    self->_appInstallObserver = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)AppsClient;
  [(AppsClient *)&v11 dealloc];
}

- (void)coordinatorShouldPrioritize:(id)a3
{
  id v5 = [a3 bundleID];
  if ([(AppsClient *)self _isATCDaemon] && v5)
  {
    id v6 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v11 = [a3 bundleID];
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Prioritize %{public}@", buf, 0xCu);
    }
    objc_super v7 = +[ATDeviceService sharedInstance];
    if (objc_opt_respondsToSelector())
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_9310;
      v9[3] = &unk_18460;
      v9[4] = v5;
      [(ATDeviceService *)v7 prioritizeAsset:+[ATAsset downloadAssetWithIdentifier:v5 dataclass:@"Application" prettyName:0] withCompletion:v9];
    }
    else
    {
      id v8 = _ATLogCategorySyncBundle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v11 = v5;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_ERROR, "Cannot prioritize %{public}@ as it's not supported", buf, 0xCu);
      }
    }
  }
}

- (void)coordinator:(id)a3 canceledWithReason:(id)a4 client:(unint64_t)a5
{
  id v6 = [a3 bundleID];
  if ([(AppsClient *)self _isATCDaemon] && v6)
  {
    objc_super v7 = +[ATDeviceService sharedInstance];
    uint64_t v15 = 0;
    unsigned __int8 v16 = &v15;
    uint64_t v17 = 0x2020000000;
    char v18 = 0;
    accessQueue = self->_accessQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_9638;
    block[3] = &unk_18488;
    block[5] = v6;
    block[6] = &v15;
    block[4] = self;
    dispatch_sync((dispatch_queue_t)accessQueue, block);
    restoreQueue = self->_restoreQueue;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_9688;
    v13[3] = &unk_184B0;
    v13[4] = self;
    v13[5] = v6;
    dispatch_sync((dispatch_queue_t)restoreQueue, v13);
    if (*((unsigned char *)v16 + 24) || (objc_opt_respondsToSelector() & 1) == 0)
    {
      id v11 = _ATLogCategorySyncBundle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v12 = *((unsigned __int8 *)v16 + 24);
        *(_DWORD *)buf = 138543618;
        id v20 = v6;
        __int16 v21 = 1024;
        int v22 = v12;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_ERROR, "Cannot cancel %{public}@ as it's already cancelled %d OR the call is not supported", buf, 0x12u);
      }
    }
    else
    {
      id v10 = _ATLogCategorySyncBundle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v20 = v6;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Cancelling asset sync for %{public}@", buf, 0xCu);
      }
      [(ATDeviceService *)v7 cancelAssetTransferForFailedAsset:+[ATAsset downloadAssetWithIdentifier:v6 dataclass:@"Application" prettyName:0]];
    }
    _Block_object_dispose(&v15, 8);
  }
}

- (id)supportedDataclasses
{
  return +[NSArray arrayWithObject:@"Application"];
}

- (id)currentSyncAnchor
{
  return @"NO_APP_SYNC_ANCHOR";
}

- (BOOL)prepareForSyncWithHostAnchor:(id)a3 progressCallback:(id)a4 error:(id *)a5
{
  return 1;
}

- (id)installedAssets
{
  id v3 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "getting installed assets", buf, 2u);
  }
  id v38 = +[NSMutableDictionary dictionary];
  id v40 = +[NSMutableArray array];
  id v4 = +[AppsClient _loadPlist:@"/var/mobile/Library/ApplicationSync/iTunesStuff/ApplicationsSync.plist" withError:0];
  id v5 = +[AppsClient _loadPlist:@"/var/mobile/Library/ApplicationSync/LastSyncAppState.plist" withError:0];
  id v6 = +[NSMutableSet set];
  uint64_t v7 = MobileInstallationLookupUninstalled();
  id v37 = self;
  if (v7)
  {
    id v8 = (void *)v7;

    id v9 = (NSArray *)[v8 allKeys];
    self->_uninstalledApps = v9;
    [v6 addObjectsFromArray:v9];
    CFRelease(v8);
  }
  else
  {
    id v10 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_ERROR, "MobileInstallationLookupUninstalled returned NULL", buf, 2u);
    }
  }
  if (v5)
  {
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v11 = [v5 countByEnumeratingWithState:&v49 objects:v60 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v50;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v50 != v13) {
            objc_enumerationMutation(v5);
          }
          uint64_t v15 = *(void *)(*((void *)&v49 + 1) + 8 * i);
          if ((objc_msgSend(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"), "applicationIsInstalled:", v15) & 1) == 0)objc_msgSend(v6, "addObject:", v15); {
        }
          }
        id v12 = [v5 countByEnumeratingWithState:&v49 objects:v60 count:16];
      }
      while (v12);
    }
  }
  id v36 = v5;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = v6;
  id v16 = [v6 countByEnumeratingWithState:&v45 objects:v59 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v46;
    do
    {
      unsigned int v19 = 0;
      do
      {
        if (*(void *)v46 != v18) {
          objc_enumerationMutation(obj);
        }
        id v20 = *(void **)(*((void *)&v45 + 1) + 8 * (void)v19);
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        id v21 = [v4 countByEnumeratingWithState:&v41 objects:v58 count:16];
        if (v21)
        {
          id v22 = v21;
          uint64_t v23 = *(void *)v42;
LABEL_24:
          uint64_t v24 = 0;
          while (1)
          {
            if (*(void *)v42 != v23) {
              objc_enumerationMutation(v4);
            }
            __int16 v25 = *(void **)(*((void *)&v41 + 1) + 8 * v24);
            if (objc_msgSend(objc_msgSend(v25, "objectForKey:", @"identifier"), "isEqualToString:", v20))break; {
            if (v22 == (id)++v24)
            }
            {
              id v22 = [v4 countByEnumeratingWithState:&v41 objects:v58 count:16];
              if (v22) {
                goto LABEL_24;
              }
              goto LABEL_30;
            }
          }
          id v29 = [v25 objectForKey:@"operation"];
          if ([v29 isEqualToString:@"FAILED"])
          {
            int v26 = 0;
            int v27 = 1;
LABEL_35:
            int v28 = 1;
            goto LABEL_36;
          }
          if ([v29 isEqualToString:@"INSTALLED"])
          {
            int v27 = 0;
            int v26 = 1;
            goto LABEL_35;
          }
          BOOL v31 = _ATLogCategorySyncBundle();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v54 = v20;
            _os_log_impl(&dword_0, v31, OS_LOG_TYPE_DEFAULT, "%{public}@ not installed, but is in our todo list. Not marking deleted", buf, 0xCu);
          }
        }
        else
        {
LABEL_30:
          int v26 = 0;
          int v27 = 0;
          int v28 = 0;
LABEL_36:
          unsigned __int8 v30 = _ATLogCategorySyncBundle();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138544130;
            id v54 = v20;
            __int16 v55 = 1024;
            *(_DWORD *)unsigned __int8 v56 = v28;
            *(_WORD *)&v56[4] = 1024;
            *(_DWORD *)&v56[6] = v26;
            LOWORD(v57) = 1024;
            *(_DWORD *)((char *)&v57 + 2) = v27;
            _os_log_impl(&dword_0, v30, OS_LOG_TYPE_DEFAULT, "%{public}@ not installed, and no todo (found=%d pi=%d failed=%d) Marking as deleted", buf, 0x1Eu);
          }
          objc_msgSend(v40, "addObject:", +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v20, kCFBundleIdentifierKey, 0));
        }
        unsigned int v19 = (char *)v19 + 1;
      }
      while (v19 != v17);
      id v32 = [obj countByEnumeratingWithState:&v45 objects:v59 count:16];
      id v17 = v32;
    }
    while (v32);
  }
  [v38 setObject:v40 forKey:@"_Deleted"];
  id v33 = _ATLogCategorySyncBundle_Oversize();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    uninstalledApps = v37->_uninstalledApps;
    *(_DWORD *)buf = 138543874;
    id v54 = v4;
    __int16 v55 = 2114;
    *(void *)unsigned __int8 v56 = uninstalledApps;
    *(_WORD *)&v56[8] = 2114;
    id v57 = v36;
    _os_log_impl(&dword_0, v33, OS_LOG_TYPE_DEFAULT, "finished getting installed assets toDoList:%{public}@, uninstalled apps %{public}@, last synced apps%{public}@", buf, 0x20u);
  }
  return v38;
}

- (BOOL)reconcileRestoreOfType:(int)a3 withError:(id *)a4
{
  uint64_t v7 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v12 = a3;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "reconcileRestoreOfType %d", buf, 8u);
  }
  +[AppsClient _notifySpringBoard:1];
  id v10 = 0;
  [+[NSFileManager defaultManager] createDirectoryAtPath:@"/var/mobile/Library/ApplicationSync" withIntermediateDirectories:1 attributes:0 error:a4];
  if ((a3 & 0xFFFFFFFE) == 2)
  {
    if ([(MBManager *)self->_backupManager airTrafficShouldCreateAppPlaceholdersWithError:&v10])
    {
      [(AppsClient *)self _processItunesRestoreInfo];
    }
    else
    {
      id v8 = _ATLogCategorySyncBundle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109378;
        int v12 = a3;
        __int16 v13 = 2114;
        __int16 v14 = v10;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Will not reconcile restore of type %d - error %{public}@", buf, 0x12u);
      }
    }
  }
  if (a4) {
    *a4 = v10;
  }
  return 1;
}

- (BOOL)reconcileSync:(unsigned int)a3 withNewAnchor:(id)a4 progressCallback:(id)a5 error:(id *)a6
{
  id v9 = +[NSFileManager defaultManager];
  id v10 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v50 = a4;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "starting to reconcile sync with new anchor %{public}@", buf, 0xCu);
  }
  [(NSFileManager *)v9 removeItemAtPath:@"/var/mobile/Library/ApplicationSync/iTunesStuff" error:0];
  if (![(NSFileManager *)v9 createDirectoryAtPath:@"/var/mobile/Library/ApplicationSync" withIntermediateDirectories:1 attributes:0 error:a6])
  {
    __int16 v34 = _ATLogCategorySyncBundle();
    BOOL v33 = 0;
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_47;
    }
    *(_WORD *)buf = 0;
    unsigned __int8 v35 = "can't create work area";
    goto LABEL_52;
  }
  if (![(NSFileManager *)v9 fileExistsAtPath:@"/var/mobile/Media/PublicStaging/ApplicationSync"])
  {
    id v36 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v36, OS_LOG_TYPE_DEFAULT, "Nothing to do", buf, 2u);
    }
LABEL_46:
    BOOL v33 = 1;
    goto LABEL_47;
  }
  if ([(NSFileManager *)v9 moveItemAtPath:@"/var/mobile/Media/PublicStaging/ApplicationSync" toPath:@"/var/mobile/Library/ApplicationSync/iTunesStuff" error:a6])
  {
    unsigned __int8 v11 = [(AppsClient *)self _appRemovalAllowed];
    p_type = &stru_1CFF0.type;
    id v13 = +[AppsClient _loadPlist:@"/var/mobile/Library/ApplicationSync/iTunesStuff/ApplicationsSync.plist" withError:a6];
    if (v13)
    {
      if (v11)
      {
        __int16 v14 = +[NSMutableArray arrayWithCapacity:8];
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        uint64_t v15 = v13;
        id v16 = [v13 countByEnumeratingWithState:&v43 objects:v48 count:16];
        if (v16)
        {
          id v17 = v16;
          uint64_t v18 = *(void *)v44;
          do
          {
            for (i = 0; i != v17; i = (char *)i + 1)
            {
              if (*(void *)v44 != v18) {
                objc_enumerationMutation(v15);
              }
              id v20 = *(void **)(*((void *)&v43 + 1) + 8 * i);
              id v21 = [v20 objectForKey:@"identifier"];
              if (sub_A458((BOOL)v21)
                && objc_msgSend(objc_msgSend(v20, "objectForKey:", @"operation"), "isEqualToString:", @"remove"))
              {
                id v22 = _ATLogCategorySyncBundle();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543362;
                  id v50 = v21;
                  _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ targeted for termination", buf, 0xCu);
                }
                [(NSMutableArray *)v14 addObject:v21];
              }
            }
            id v17 = [v15 countByEnumeratingWithState:&v43 objects:v48 count:16];
          }
          while (v17);
        }
        id v13 = v15;
        p_type = (char **)(&stru_1CFF0 + 16);
        if ([(NSMutableArray *)v14 count])
        {
          uint64_t v23 = _ATLogCategorySyncBundle();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            id v24 = [(NSMutableArray *)v14 count];
            *(_DWORD *)buf = 134217984;
            id v50 = v24;
            _os_log_impl(&dword_0, v23, OS_LOG_TYPE_DEFAULT, "performing %llu deletions", buf, 0xCu);
          }
          long long v41 = 0u;
          long long v42 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          id v25 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v39 objects:v47 count:16];
          if (v25)
          {
            id v26 = v25;
            uint64_t v27 = *(void *)v40;
            do
            {
              for (j = 0; j != v26; j = (char *)j + 1)
              {
                if (*(void *)v40 != v27) {
                  objc_enumerationMutation(v14);
                }
                [(AppsClient *)self uninstallAppUsingCoordination:*(void *)(*((void *)&v39 + 1) + 8 * (void)j)];
              }
              id v26 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v39 objects:v47 count:16];
            }
            while (v26);
          }
        }
LABEL_36:
        [p_type + 283 _notifySpringBoard:1];
        BOOL v31 = +[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", +[NSString stringWithFormat:@"%@/SpringboardIconState.plist", @"/var/mobile/Library/ApplicationSync/iTunesStuff"]);
        if ([(NSData *)v31 length])
        {
          id v32 = _ATLogCategorySyncBundle();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_0, v32, OS_LOG_TYPE_DEFAULT, "Sending iconlayout to SB", buf, 2u);
          }
          SBSSpringBoardBlockableServerPort();
          [(NSData *)v31 bytes];
          [(NSData *)v31 length];
          SBSetIconState();
        }
        if (v13)
        {
          BOOL v33 = 1;
          [(NSData *)+[NSPropertyListSerialization dataWithPropertyList:v13 format:200 options:0 error:0] writeToFile:@"/var/mobile/Library/ApplicationSync/iTunesStuff/ApplicationsSync.plist-debug.plist" atomically:1];
          goto LABEL_47;
        }
        goto LABEL_46;
      }
      id v29 = _ATLogCategorySyncBundle();
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_36;
      }
      *(_WORD *)buf = 0;
      unsigned __int8 v30 = "Not processing deletes because app removal is restricted";
    }
    else
    {
      id v29 = _ATLogCategorySyncBundle();
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_36;
      }
      *(_WORD *)buf = 0;
      unsigned __int8 v30 = "Nothing to do from iTunes";
    }
    _os_log_impl(&dword_0, v29, OS_LOG_TYPE_DEFAULT, v30, buf, 2u);
    goto LABEL_36;
  }
  __int16 v34 = _ATLogCategorySyncBundle();
  BOOL v33 = 0;
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    unsigned __int8 v35 = "Can't move staging area";
LABEL_52:
    _os_log_impl(&dword_0, v34, OS_LOG_TYPE_DEFAULT, v35, buf, 2u);
    BOOL v33 = 0;
  }
LABEL_47:
  id v37 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v37, OS_LOG_TYPE_DEFAULT, "finished reconcile sync", buf, 2u);
  }
  return v33;
}

- (void)syncEndedWithSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (v3) {
      int v6 = 121;
    }
    else {
      int v6 = 110;
    }
    int v13 = 67109120;
    LODWORD(v14) = v6;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "sync ended with success: %c", (uint8_t *)&v13, 8u);
  }
  if (v3)
  {
    if (utimes("/var/mobile/Library/ApplicationSync", 0))
    {
      uint64_t v7 = _ATLogCategorySyncBundle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        id v8 = __error();
        id v9 = strerror(*v8);
        int v13 = 136315394;
        __int16 v14 = "/var/mobile/Library/ApplicationSync";
        __int16 v15 = 2080;
        id v16 = v9;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_ERROR, "Failed to update utimes of \"%s\": %s", (uint8_t *)&v13, 0x16u);
      }
    }
    if (self->_uninstalledApps)
    {
      id v10 = _ATLogCategorySyncBundle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uninstalledApps = self->_uninstalledApps;
        int v13 = 138543362;
        __int16 v14 = (const char *)uninstalledApps;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "clearing uninstalled apps: %{public}@", (uint8_t *)&v13, 0xCu);
      }
      if (MobileInstallationClearUninstalled())
      {
        int v12 = _ATLogCategorySyncBundle();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v13) = 0;
          _os_log_impl(&dword_0, v12, OS_LOG_TYPE_ERROR, "Failed to clear uninstalled apps from MobileInstallation.", (uint8_t *)&v13, 2u);
        }
      }
      else
      {

        self->_uninstalledApps = 0;
      }
    }
    [+[NSFileManager defaultManager] removeItemAtPath:@"/var/mobile/Library/ApplicationSync/LastSyncAppState.plist" error:0];
  }
}

- (void)assetTransferEndedWithSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (v3) {
      int v6 = 121;
    }
    else {
      int v6 = 110;
    }
    *(_DWORD *)buf = 67109120;
    LODWORD(v15) = v6;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "asset transfer ended withsuccess: %c", buf, 8u);
  }
  dispatch_group_wait((dispatch_group_t)self->_installGroup, 0xFFFFFFFFFFFFFFFFLL);
  +[AppsClient _notifySpringBoard:0];
  if ([(AppsClient *)self _getAndResetNumAppInstallsAttempted] >= 1)
  {
    id v7 = objc_alloc_init((Class)SSSoftwareLibrary);
    id v8 = dispatch_semaphore_create(0);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_A8FC;
    v13[3] = &unk_18460;
    v13[4] = v8;
    [v7 refreshReceiptsWithCompletionBlock:v13];
    dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v8);
  }
  if ([(NSMutableSet *)self->_outstandingAFCTransfers count])
  {
    [(AppsClient *)self assetSyncFinishedWithStatus:v3 outstandingItems:self->_outstandingAFCTransfers];
    if (v3)
    {
      id v9 = _ATLogCategorySyncBundle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        id v10 = [(NSMutableSet *)self->_outstandingAFCTransfers count];
        *(_DWORD *)buf = 134217984;
        id v15 = v10;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_ERROR, "Called with success == YES but with %lu outstanding AFC transfers!", buf, 0xCu);
      }
    }
    [(NSMutableSet *)self->_outstandingAFCTransfers removeAllObjects];
    accessQueue = self->_accessQueue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_A9DC;
    v12[3] = &unk_184D8;
    v12[4] = self;
    dispatch_sync((dispatch_queue_t)accessQueue, v12);
  }
}

- (void)assetTransfer:(id)a3 succeeded:(BOOL)a4 withError:(id)a5
{
  BOOL v6 = a4;
  uint64_t v42 = 0;
  long long v43 = &v42;
  uint64_t v44 = 0x2020000000;
  char v45 = 0;
  uint64_t v38 = 0;
  long long v39 = &v38;
  uint64_t v40 = 0x2020000000;
  char v41 = 0;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_B0C8;
  block[3] = &unk_18500;
  block[4] = self;
  block[5] = a3;
  block[6] = &v42;
  void block[7] = &v38;
  dispatch_sync((dispatch_queue_t)accessQueue, block);
  -[NSMutableSet removeObject:](self->_outstandingAFCTransfers, "removeObject:", [a3 identifier]);
  if (a5)
  {
    id v10 = _ATLogCategorySyncBundle();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    int v11 = *((unsigned __int8 *)v43 + 24);
    id v12 = objc_msgSend(a5, "msv_description");
    *(_DWORD *)buf = 138544130;
    if (v6) {
      int v13 = 121;
    }
    else {
      int v13 = 110;
    }
    id v47 = a3;
    __int16 v48 = 1024;
    *(_DWORD *)long long v49 = v13;
    *(_WORD *)&v49[4] = 1024;
    *(_DWORD *)&v49[6] = v11;
    __int16 v50 = 2114;
    id v51 = v12;
    __int16 v14 = "transfer for asset %{public}@ ended with success %c existingApp:%d error=%{public}@";
    id v15 = v10;
    os_log_type_t v16 = OS_LOG_TYPE_ERROR;
    uint32_t v17 = 34;
  }
  else
  {
    uint64_t v18 = _ATLogCategorySyncBundle();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    if (v6) {
      int v19 = 121;
    }
    else {
      int v19 = 110;
    }
    int v20 = *((unsigned __int8 *)v43 + 24);
    *(_DWORD *)buf = 138543874;
    id v47 = a3;
    __int16 v48 = 1024;
    *(_DWORD *)long long v49 = v19;
    *(_WORD *)&v49[4] = 1024;
    *(_DWORD *)&v49[6] = v20;
    __int16 v14 = "transfer for asset %{public}@ ended with success %c existingApp:%d";
    id v15 = v18;
    os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
    uint32_t v17 = 24;
  }
  _os_log_impl(&dword_0, v15, v16, v14, buf, v17);
LABEL_13:
  id v21 = -[AppsClient _progressForAssetIdentifier:](self, "_progressForAssetIdentifier:", [a3 identifier]);
  if (v6)
  {
    id v22 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      id v23 = [a3 identifier];
      *(_DWORD *)buf = 138543362;
      id v47 = v23;
      _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "asset transfer succeeded for %{public}@", buf, 0xCu);
    }
    if ([a3 path])
    {
      if (objc_msgSend(objc_msgSend(a3, "path"), "hasPrefix:", @"/")) {
        goto LABEL_35;
      }
      id v24 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s/%@", "/var/mobile/Media/PublicStaging", [a3 path]);
    }
    else
    {
      id v24 = -[AppsClient _restoreStatePropertyForKey:identifier:version:](self, "_restoreStatePropertyForKey:identifier:version:", @"path", [a3 identifier], objc_msgSend(objc_msgSend(a3, "variantOptions"), "objectForKeyedSubscript:", @"Version"));
    }
    [a3 setPath:v24];
LABEL_35:
    if (sub_A458((BOOL)[a3 path]))
    {
      if ([a3 isDownload])
      {
        id v32 = _ATLogCategorySyncBundle();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          id v33 = [a3 path];
          *(_DWORD *)buf = 138543362;
          id v47 = v33;
          _os_log_impl(&dword_0, v32, OS_LOG_TYPE_DEFAULT, "Received file at %{public}@", buf, 0xCu);
        }
        -[AppsClient changeAssetID:toDo:](self, "changeAssetID:toDo:", [a3 identifier], @"DOWNLOADED");
        if (([a3 isRestore] & 1) == 0)
        {
          __int16 v34 = _ATLogCategorySyncBundle();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v47 = a3;
            _os_log_impl(&dword_0, v34, OS_LOG_TYPE_DEFAULT, "Installing synced asset %{public}@", buf, 0xCu);
          }
          [(AppsClient *)self transferCompleteForApp:a3 withError:0 isExistingApp:*((unsigned __int8 *)v43 + 24)];
        }
      }
      else
      {
        -[AppsClient changeAssetID:toDo:](self, "changeAssetID:toDo:", [a3 identifier], @"SENT");
      }
    }
    else
    {
      unsigned __int8 v35 = _ATLogCategorySyncBundle();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        id v36 = [a3 path];
        *(_DWORD *)buf = 138543362;
        id v47 = v36;
        _os_log_impl(&dword_0, v35, OS_LOG_TYPE_DEFAULT, "Ignoring invalid path: %{public}@", buf, 0xCu);
      }
    }
    goto LABEL_46;
  }
  id v25 = v21;
  if ([(AppsClient *)self _isRecoverableError:a5])
  {
    id v26 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      id v27 = [a3 identifier];
      *(_DWORD *)buf = 138543618;
      id v47 = v27;
      __int16 v48 = 2114;
      *(void *)long long v49 = a5;
      _os_log_impl(&dword_0, v26, OS_LOG_TYPE_DEFAULT, "Failed to transfer asset %{public}@ with recoverable error=%{public}@", buf, 0x16u);
    }
    [v25 setInstallState:4];
  }
  else
  {
    int v28 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      id v29 = [a3 identifier];
      *(_DWORD *)buf = 138543618;
      id v47 = v29;
      __int16 v48 = 2114;
      *(void *)long long v49 = a5;
      _os_log_impl(&dword_0, v28, OS_LOG_TYPE_ERROR, "Failed to transfer asset %{public}@ with unrecoverable error=%{public}@", buf, 0x16u);
    }
    if (objc_msgSend(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"), "applicationIsInstalled:", objc_msgSend(a3, "identifier"))&& (objc_msgSend(a3, "isRestore") & 1) == 0)
    {
      if ((unint64_t)[v25 installState] < 3) {
        [v25 cancel];
      }
      unsigned __int8 v30 = _ATLogCategorySyncBundle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        id v31 = [a3 identifier];
        *(_DWORD *)buf = 138543362;
        id v47 = v31;
        _os_log_impl(&dword_0, v30, OS_LOG_TYPE_DEFAULT, "Uninstalling placeholder %{public}@", buf, 0xCu);
      }
      if (!*((unsigned char *)v39 + 24)) {
        [(AppsClient *)self transferCompleteForApp:a3 withError:a5 isExistingApp:*((unsigned __int8 *)v43 + 24)];
      }
    }
  }
LABEL_46:
  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v42, 8);
}

- (void)assetInstallSucceeded:(id)a3
{
  id v5 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = [a3 identifier];
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ install succeeded", (uint8_t *)&v6, 0xCu);
  }
  -[AppsClient changeAssetID:toDo:](self, "changeAssetID:toDo:", [a3 identifier], @"INSTALLED");
  -[AppsClient cleanRestoreStateForIdentifier:](self, "cleanRestoreStateForIdentifier:", [a3 identifier]);
}

- (void)assetInstallFailed:(id)a3 withError:(id)a4
{
  if ([(AppsClient *)self _isRecoverableError:a4]
    || ([a3 isRestore] & 1) != 0)
  {
    id v7 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543618;
      id v12 = [a3 identifier];
      __int16 v13 = 2114;
      id v14 = a4;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ install failed but was recoverable: %{public}@", (uint8_t *)&v11, 0x16u);
    }
    +[AITransactionLog logScenario:step:success:forBundleID:description:](AITransactionLog, "logScenario:step:success:forBundleID:description:", @"iCloud restore", 0, 0, [a3 identifier], @"install failed recoverably");
  }
  else
  {
    id v8 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138543618;
      id v12 = [a3 identifier];
      __int16 v13 = 2114;
      id v14 = a4;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_ERROR, "%{public}@ install failed unrecoverably: %{public}@", (uint8_t *)&v11, 0x16u);
    }
    -[AppsClient changeAssetID:toDo:](self, "changeAssetID:toDo:", [a3 identifier], @"FAILED");
    if ([a3 isRestore])
    {
      id v9 = _ATLogCategorySyncBundle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = [a3 identifier];
        int v11 = 138543362;
        id v12 = v10;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "not uninstalling restore asset %{public}@ as install coordination is enabled", (uint8_t *)&v11, 0xCu);
      }
    }
    else
    {
      -[AppsClient uninstallAppUsingCoordination:](self, "uninstallAppUsingCoordination:", [a3 identifier]);
    }
  }
  -[AppsClient cleanRestoreStateForIdentifier:](self, "cleanRestoreStateForIdentifier:", [a3 identifier]);
}

- (id)outstandingAssetTransfers
{
  v88 = +[NSMutableArray arrayWithCapacity:16];
  unsigned int v97 = [(AppsClient *)self _appInstallationAllowed];
  id v3 = +[AppsClient _loadPlist:@"/var/mobile/Library/ApplicationSync/iTunesStuff/ApplicationsSync.plist" withError:0];
  id v92 = +[NSMutableSet set];
  id v4 = _ATLogCategorySyncBundle_Oversize();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v117 = (uint64_t)v3;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "outstandingAssetTransfers starting with todoList %{public}@", buf, 0xCu);
  }
  id v99 = v3;
  id v5 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v3 count]);
  uint64_t v6 = objc_opt_new();
  id v91 = [(AppsClient *)self _getSystemAppPlaceholders];
  v115[0] = _NSConcreteStackBlock;
  v115[1] = 3221225472;
  v115[2] = sub_C49C;
  v115[3] = &unk_18528;
  v115[4] = v6;
  v93 = self;
  [(AppsClient *)self _enumeratePlaceholdersWithBlock:v115];
  [(NSMutableDictionary *)v5 addEntriesFromDictionary:v6];
  id v7 = _ATLogCategorySyncBundle_Oversize();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v117 = v6;
    __int16 v118 = 2114;
    *(void *)v119 = v5;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "outstandingAssetTransfers preExistingPlaceHolders %{public}@, idsWeWant %{public}@", buf, 0x16u);
  }
  long long v113 = 0u;
  long long v114 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  id v8 = v99;
  id v9 = [v99 countByEnumeratingWithState:&v111 objects:v134 count:16];
  id v10 = v92;
  if (v9)
  {
    id v11 = v9;
    uint64_t v12 = *(void *)v112;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v112 != v12) {
          objc_enumerationMutation(v8);
        }
        id v14 = *(void **)(*((void *)&v111 + 1) + 8 * i);
        if (objc_msgSend(objc_msgSend(v14, "objectForKey:", @"operation"), "isEqualToString:", @"install"))
        {
          id v15 = [v14 objectForKey:@"identifier"];
          if (!sub_A458((BOOL)v15))
          {
            int v19 = _ATLogCategorySyncBundle();
            if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
              continue;
            }
            *(_DWORD *)buf = 138543362;
            uint64_t v117 = (uint64_t)v15;
            uint32_t v17 = v19;
            uint64_t v18 = "Ignoring invalid path: %{public}@";
            goto LABEL_17;
          }
          if ([(NSMutableDictionary *)v5 objectForKey:v15])
          {
            [v10 addObject:v15];
            os_log_type_t v16 = _ATLogCategorySyncBundle();
            if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
              continue;
            }
            *(_DWORD *)buf = 138543362;
            uint64_t v117 = (uint64_t)v15;
            uint32_t v17 = v16;
            uint64_t v18 = "%{public}@ already has a placeholder - skipping";
LABEL_17:
            _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, v18, buf, 0xCu);
            continue;
          }
          int v20 = v5;
          id v21 = +[NSString stringWithFormat:@"%s/%@", "/var/mobile/Library/ApplicationSync/iTunesStuff", v15];
          id v22 = [v14 objectForKey:@"version"];
          id v23 = [v14 objectForKey:@"name"];
          id v24 = +[NSMutableDictionary dictionary];
          [v24 setObject:v21 forKey:@"Path"];
          [v24 setObject:v15 forKey:kCFBundleIdentifierKey];
          [v24 setObject:v21 forKey:@"Container"];
          if (v22) {
            [v24 setObject:v22 forKey:kCFBundleVersionKey];
          }
          id v10 = v92;
          if (v23) {
            [v24 setObject:v23 forKey:@"NameFromItunes"];
          }
          id v5 = v20;
          [(NSMutableDictionary *)v20 setObject:v24 forKey:v15];
          [v92 addObject:v15];
          id v8 = v99;
        }
      }
      id v11 = [v8 countByEnumeratingWithState:&v111 objects:v134 count:16];
    }
    while (v11);
  }
  uint64_t v109 = 0;
  v110 = 0;
  +[InProgressAssetQuery currentInProgressAssetIDs:&v110 restoringAssetIDs:&v109];
  id v25 = v110;
  id v26 = _ATLogCategorySyncBundle();
  id v27 = v26;
  if (v25)
  {
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v117 = (uint64_t)v110;
      _os_log_impl(&dword_0, v27, OS_LOG_TYPE_DEFAULT, "Assets already in progress (not returning these): %{public}@", buf, 0xCu);
    }
    [(NSMutableDictionary *)v5 removeObjectsForKeys:v110];
  }
  else if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v27, OS_LOG_TYPE_ERROR, "Failed to get list of assets already in progress!", buf, 2u);
  }
  uint64_t v28 = v109;
  id v29 = _ATLogCategorySyncBundle();
  unsigned __int8 v30 = v29;
  if (v28)
  {
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v117 = v109;
      id v31 = "Assets currently restoring: %{public}@";
      id v32 = v30;
      os_log_type_t v33 = OS_LOG_TYPE_DEFAULT;
      uint32_t v34 = 12;
LABEL_36:
      _os_log_impl(&dword_0, v32, v33, v31, buf, v34);
    }
  }
  else if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    id v31 = "Failed to get list of assets currently restoring!";
    id v32 = v30;
    os_log_type_t v33 = OS_LOG_TYPE_ERROR;
    uint32_t v34 = 2;
    goto LABEL_36;
  }
  id obj = +[AppsClient _orderTheItems:v5];
  unsigned __int8 v35 = +[NSFileManager defaultManager];
  [(NSFileManager *)v35 removeItemAtPath:@"/var/mobile/Library/ApplicationSync/Icons" error:0];
  uint64_t v108 = 0;
  if (![(NSFileManager *)v35 createDirectoryAtPath:@"/var/mobile/Library/ApplicationSync/Icons" withIntermediateDirectories:0 attributes:0 error:&v108])
  {
    id v36 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v117 = v108;
      _os_log_impl(&dword_0, v36, OS_LOG_TYPE_ERROR, "Can't create icon scratch dir! %{public}@", buf, 0xCu);
    }
  }
  long long v106 = 0u;
  long long v107 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  id v98 = [obj countByEnumeratingWithState:&v104 objects:v133 count:16];
  if (v98)
  {
    uint64_t v96 = *(void *)v105;
    uint64_t v95 = _kCFBundleDisplayNameKey;
    do
    {
      id v37 = 0;
      do
      {
        if (*(void *)v105 != v96) {
          objc_enumerationMutation(obj);
        }
        uint64_t v38 = *(void **)(*((void *)&v104 + 1) + 8 * (void)v37);
        id v39 = [v38 objectForKey:kCFBundleIdentifierKey];
        id v40 = [v38 objectForKey:@"Path"];
        id v101 = v39;
        char v41 = +[NSString stringWithFormat:@"%s/%@.png", "/var/mobile/Library/ApplicationSync/Icons", v39];
        id v42 = [+[NSBundle bundleWithPath:v40] objectForInfoDictionaryKey:v95];
        id v100 = [v38 objectForKey:kCFBundleVersionKey];
        id v43 = [v38 valueForKey:@"IsRestore"];
        if (objc_opt_respondsToSelector()) {
          unsigned int v44 = [v43 BOOLValue];
        }
        else {
          unsigned int v44 = 0;
        }
        id v45 = [v38 valueForKey:@"auto_demoted_app"];
        if (objc_opt_respondsToSelector()) {
          unsigned int v46 = [v45 BOOLValue];
        }
        else {
          unsigned int v46 = 0;
        }
        id v47 = [v38 valueForKey:@"intentional_demoted_app"];
        if (objc_opt_respondsToSelector()) {
          unsigned int v48 = [v47 BOOLValue];
        }
        else {
          unsigned int v48 = 0;
        }
        id v49 = [v38 valueForKey:@"system_app"];
        if (objc_opt_respondsToSelector()) {
          unsigned int v50 = [v49 BOOLValue];
        }
        else {
          unsigned int v50 = 0;
        }
        if (((v97 | v44) & 1) == 0)
        {
          unsigned __int8 v56 = _ATLogCategorySyncBundle();
          if (!os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_66;
          }
          *(_DWORD *)buf = 138543362;
          uint64_t v117 = (uint64_t)v101;
          id v54 = v56;
          __int16 v55 = "skipping %{public}@ - its not a restore and app installation is disabled";
          goto LABEL_64;
        }
        if (v44)
        {
          unsigned int v51 = [(NSMutableSet *)v93->_vppAppsToIgnore containsObject:v101];
          long long v52 = _ATLogCategorySyncBundle();
          BOOL v53 = os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT);
          if (v51)
          {
            if (!v53) {
              goto LABEL_66;
            }
            *(_DWORD *)buf = 138543362;
            uint64_t v117 = (uint64_t)v101;
            id v54 = v52;
            __int16 v55 = "%{public}@ is currenlty marked as to be ignored for download - skipping";
LABEL_64:
            uint32_t v57 = 12;
LABEL_65:
            _os_log_impl(&dword_0, v54, OS_LOG_TYPE_DEFAULT, v55, buf, v57);
            goto LABEL_66;
          }
          if (v53)
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v117 = (uint64_t)v101;
            id v54 = v52;
            __int16 v55 = "%{public}@ is currenlty marked to be restored and will be handled by appstored - skipping";
            goto LABEL_64;
          }
        }
        else if (v50)
        {
          v58 = _ATLogCategorySyncBundle();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138544130;
            uint64_t v117 = (uint64_t)v101;
            __int16 v118 = 1024;
            *(_DWORD *)v119 = v46;
            *(_WORD *)&v119[4] = 1024;
            *(_DWORD *)&v119[6] = v48;
            LOWORD(v120) = 1024;
            *(_DWORD *)((char *)&v120 + 2) = 1;
            id v54 = v58;
            __int16 v55 = "%{public}@ is auto demoted: %d, manual demoted: %d, system app:%d - skipping";
            uint32_t v57 = 30;
            goto LABEL_65;
          }
        }
        else if ([v91 containsObject:v101])
        {
          id v59 = _ATLogCategorySyncBundle();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v117 = (uint64_t)v101;
            id v54 = v59;
            __int16 v55 = "%{public}@ is system app placeholder - skipping";
            goto LABEL_64;
          }
        }
        else
        {
          if ((v46 | v48) != 1) {
            goto LABEL_80;
          }
          unsigned int v60 = [v92 containsObject:v101];
          uint32_t v61 = _ATLogCategorySyncBundle();
          BOOL v62 = os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT);
          if (v60)
          {
            if (v62)
            {
              *(_DWORD *)buf = 138543874;
              uint64_t v117 = (uint64_t)v101;
              __int16 v118 = 1024;
              *(_DWORD *)v119 = v46;
              *(_WORD *)&v119[4] = 1024;
              *(_DWORD *)&v119[6] = v48;
              _os_log_impl(&dword_0, v61, OS_LOG_TYPE_DEFAULT, "%{public}@ is currenlty demoted (manual:%d, auto:%d) - but will be installed as it's requested by client", buf, 0x18u);
            }
LABEL_80:
            if (!v42) {
              id v42 = [v38 objectForKey:@"NameFromItunes"];
            }
            if (v42) {
              id v63 = v42;
            }
            else {
              id v63 = v101;
            }
            if (!+[AppsClient _makeIconFromBundlePath:saveTo:](AppsClient, "_makeIconFromBundlePath:saveTo:", v40, v41))char v41 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@/iTunesArtwork", [v38 objectForKey:@"Container"]); {
            v64 = +[NSURL fileURLWithPath:v41 isDirectory:0];
            }
            id v90 = v63;
            id v65 = +[ATAsset downloadAssetWithIdentifier:v101 dataclass:@"Application" prettyName:v63];
            v89 = v64;
            [v65 setIcon:v64];
            [v65 setIsRestore:0];
            os_log_type_t v66 = objc_opt_new();
            id v67 = [(AppsClient *)v93 _restoreStatePropertyForKey:@"path" identifier:v101 version:v100];
            if (v67)
            {
              id v68 = v67;
              unsigned int v69 = [+[NSFileManager defaultManager] fileExistsAtPath:v67];
              char v70 = _ATLogCategorySyncBundle();
              BOOL v71 = os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT);
              if (v69)
              {
                if (v71)
                {
                  *(_DWORD *)buf = 138543618;
                  uint64_t v117 = (uint64_t)v101;
                  __int16 v118 = 2114;
                  *(void *)v119 = v68;
                  _os_log_impl(&dword_0, v70, OS_LOG_TYPE_DEFAULT, "Recovered download path for %{public}@ at %{public}@", buf, 0x16u);
                }
                unsigned __int8 v72 = [v65 isRestore];
                v73 = &off_19620;
                if (v72) {
                  goto LABEL_101;
                }
                goto LABEL_98;
              }
              if (v71)
              {
                *(_DWORD *)buf = 138543618;
                uint64_t v117 = (uint64_t)v101;
                __int16 v118 = 2114;
                *(void *)v119 = v68;
                _os_log_impl(&dword_0, v70, OS_LOG_TYPE_DEFAULT, "Download path recovered for %{public}@ but the file is missing: %{public}@", buf, 0x16u);
              }
            }
            [v65 isRestore];
LABEL_98:
            if (objc_msgSend(v65, "isRestore", v73)) {
              v73 = &off_19638;
            }
            else {
              v73 = &off_19650;
            }
LABEL_101:
            [v66 setObject:v73 forKeyedSubscript:@"AssetParts"];
            if (v100) {
              [v66 setObject:v100 forKeyedSubscript:@"Version"];
            }
            if ([v66 count]) {
              [v65 setVariantOptions:v66];
            }

            [v65 setStorePlist:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@/iTunesMetadata.plist", objc_msgSend(v38, "objectForKey:", @"Container"];
            [v65 setInfoPlist:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@/Info.plist", v40)];
            [v65 setAssetType:@"Application"];
            v74 = _ATLogCategorySyncBundle();
            if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
            {
              id v75 = [v65 storePlist];
              id v76 = [v65 infoPlist];
              id v77 = [v65 storePID];
              unsigned int v78 = [v65 isRestore];
              *(_DWORD *)buf = 138545410;
              if (v78) {
                int v79 = 121;
              }
              else {
                int v79 = 110;
              }
              uint64_t v117 = (uint64_t)v101;
              __int16 v118 = 2114;
              *(void *)v119 = v90;
              *(_WORD *)&v119[8] = 2114;
              id v120 = v100;
              __int16 v121 = 2114;
              v122 = v89;
              __int16 v123 = 2114;
              id v124 = v40;
              __int16 v125 = 2114;
              id v126 = v75;
              __int16 v127 = 2114;
              id v128 = v76;
              __int16 v129 = 2048;
              id v130 = v77;
              __int16 v131 = 1024;
              int v132 = v79;
              _os_log_impl(&dword_0, v74, OS_LOG_TYPE_DEFAULT, "Asset %{public}@ (pretty=%{public}@, version=%{public}@) prepped with icon %{public}@, at %{public}@, meta at %{public}@, info at %{public}@, storePid=%lld, isRestore=%c", buf, 0x58u);
            }
            id v80 = +[LSApplicationProxy applicationProxyForIdentifier:v101 placeholder:0];
            v81 = v80;
            if (v80)
            {
              v82 = v93;
              if ([v80 isInstalled]
                && ([v81 isPlaceholder] & 1) == 0)
              {
                v83 = _ATLogCategorySyncBundle();
                if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543362;
                  uint64_t v117 = (uint64_t)v101;
                  _os_log_impl(&dword_0, v83, OS_LOG_TYPE_DEFAULT, "App %{public}@ is already installed and will be updated.", buf, 0xCu);
                }
                v81 = &dword_0 + 1;
              }
              else
              {
                v81 = 0;
              }
            }
            else
            {
              v82 = v93;
            }
            if ([(AppsClient *)v82 prepareAppForInstallUsingCoordination:v65 existingApp:v81])
            {
              [(NSMutableArray *)v88 addObject:v65];
              accessQueue = v82->_accessQueue;
              block[0] = _NSConcreteStackBlock;
              block[1] = 3221225472;
              block[2] = sub_C678;
              block[3] = &unk_18550;
              char v103 = (char)v81;
              block[4] = v82;
              block[5] = v101;
              dispatch_sync(accessQueue, block);
            }
            else
            {
              v85 = _ATLogCategorySyncBundle();
              if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                uint64_t v117 = (uint64_t)v101;
                _os_log_impl(&dword_0, v85, OS_LOG_TYPE_ERROR, "Not requesting app asset for %{public}@", buf, 0xCu);
              }
              [(AppsClient *)v82 changeAssetID:v101 toDo:@"FAILED"];
            }
            goto LABEL_66;
          }
          if (v62)
          {
            *(_DWORD *)buf = 138543874;
            uint64_t v117 = (uint64_t)v101;
            __int16 v118 = 1024;
            *(_DWORD *)v119 = v46;
            *(_WORD *)&v119[4] = 1024;
            *(_DWORD *)&v119[6] = v48;
            id v54 = v61;
            __int16 v55 = "%{public}@ is currenlty demoted (manual:%d, auto:%d) - skipping";
            uint32_t v57 = 24;
            goto LABEL_65;
          }
        }
LABEL_66:
        id v37 = (char *)v37 + 1;
      }
      while (v98 != v37);
      id v86 = [obj countByEnumeratingWithState:&v104 objects:v133 count:16];
      id v98 = v86;
    }
    while (v86);
  }
  return v88;
}

- (void)clearSyncData
{
  id v3 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "blasting work area", buf, 2u);
  }
  [+[NSFileManager defaultManager] removeItemAtPath:@"/var/mobile/Library/ApplicationSync" error:0];
  id v4 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Cancelling remaining coordinator installs", v11, 2u);
  }
  [(AppsClient *)self assetSyncFinishedWithStatus:0 outstandingItems:self->_outstandingAFCTransfers];
  id v5 = (void *)MobileInstallationLookupUninstalled();
  if (v5)
  {
    uint64_t v6 = v5;
    [v5 allKeys];
    if (MobileInstallationClearUninstalled())
    {
      id v7 = _ATLogCategorySyncBundle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v10 = 0;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_ERROR, "Failed to clear uninstalled apps list", v10, 2u);
      }
    }
    CFRelease(v6);
  }
  else
  {
    id v8 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_ERROR, "Failed to fetch uninstalled apps list to clear it", v9, 2u);
    }
  }
}

- (id)installedAssetMetrics
{
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_CA0C;
  v8[3] = &unk_18578;
  v8[4] = &v13;
  v8[5] = &v9;
  objc_msgSend(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"), "enumerateBundlesOfType:block:", 1, v8);
  v2 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = v10[3];
    uint64_t v4 = v14[3];
    *(_DWORD *)buf = 134218496;
    uint64_t v18 = v3;
    __int16 v19 = 2048;
    uint64_t v20 = v4;
    __int16 v21 = 2048;
    uint64_t v22 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "found %ld apps using %lld bytes (%lld purgeable)", buf, 0x20u);
  }
  id v5 = +[NSNumber numberWithUnsignedLongLong:v10[3]];
  uint64_t v6 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v5, @"_Count", +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v14[3]), @"_PhysicalSize", +[NSNumber numberWithUnsignedLongLong:0], @"_PurgeableSize", 0);
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
  return v6;
}

- (id)appleIDsForAssets
{
  v2 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "getting id's for assets", buf, 2u);
  }
  id v3 = +[NSMutableSet set];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_CBC8;
  v6[3] = &unk_185A0;
  v6[4] = v3;
  objc_msgSend(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"), "enumerateBundlesOfType:block:", 1, v6);
  uint64_t v4 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v8 = v3;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Returning apple ID set: %{public}@", buf, 0xCu);
  }
  return v3;
}

- (id)accountsForAssets
{
  id v2 = +[NSMutableSet set];
  id v3 = +[NSMutableSet set];
  uint64_t v4 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "getting accounts for assets", buf, 2u);
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_D080;
  v7[3] = &unk_185C8;
  v7[4] = v3;
  v7[5] = v2;
  objc_msgSend(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"), "enumerateBundlesOfType:block:", 1, v7);
  id v5 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v9 = v2;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Returning accountInfo: %{public}@", buf, 0xCu);
  }
  return v2;
}

- (void)assetTransfer:(id)a3 updatedProgress:(double)a4
{
  id v7 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    *(double *)&uint8_t buf[4] = a4;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = [a3 identifier];
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "finished transferring %lf for %{public}@", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x2020000000;
  char v11 = 0;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_D420;
  block[3] = &unk_18488;
  block[5] = a3;
  void block[6] = buf;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)accessQueue, block);
  [(AppsClient *)self updateTransferProgressForApp:a3 existingApp:*(unsigned __int8 *)(*(void *)&buf[8] + 24)];
  -[NSMutableSet addObject:](self->_outstandingAFCTransfers, "addObject:", [a3 identifier]);
  _Block_object_dispose(buf, 8);
}

- (id)disabledAssetTypes
{
  if ([(AppsClient *)self _appInstallationAllowed]
    || [(AppsClient *)self _appRemovalAllowed])
  {
    return 0;
  }
  else
  {
    return +[NSSet setWithObjects:@"Application", 0];
  }
}

- (void)prepareForBackup
{
  id v2 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "preparing for backup", buf, 2u);
  }
  objc_msgSend(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"), "enumerateBundlesOfType:block:", 1, &stru_18608);
  id v3 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "finished preparing for backup", v4, 2u);
  }
}

+ (void)_notifySpringBoard:(BOOL)a3
{
  BOOL v3 = a3;
  int out_token = 0;
  uint32_t v4 = notify_register_check("com.apple.springboard.atc.wsyncnotify", &out_token);
  id v5 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = "done";
    if (v3) {
      uint64_t v6 = "starting";
    }
    *(_DWORD *)buf = 136315138;
    id v10 = v6;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Notifying SB we are %s syncing", buf, 0xCu);
  }
  SBSSpringBoardBlockableServerPort();
  if (v4)
  {
    id v7 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v10) = v4;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_ERROR, "Uh Oh...can't send notification to SB:%d", buf, 8u);
    }
  }
  else
  {
    notify_set_state(out_token, v3);
    notify_post("com.apple.springboard.atc.wsyncnotify");
  }
}

+ (BOOL)_makeIconFromBundlePath:(id)a3 saveTo:(id)a4
{
  uint64_t v6 = (__CFData *)+[NSMutableData data];
  if (!a3)
  {
    uint32_t v17 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v27) = 0;
      uint64_t v18 = "missing bundlePath";
LABEL_17:
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v27, 2u);
    }
    return 0;
  }
  id v7 = v6;
  CFURLRef v8 = CFURLCreateWithFileSystemPath(0, (CFStringRef)a3, kCFURLPOSIXPathStyle, 1u);
  if (!v8)
  {
    uint32_t v17 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v27) = 0;
      uint64_t v18 = "couldn't create URL";
      goto LABEL_17;
    }
    return 0;
  }
  CFURLRef v9 = v8;
  CFBundleRef v10 = CFBundleCreate(0, v8);
  if (!v10)
  {
    __int16 v19 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v27) = 0;
      _os_log_impl(&dword_0, v19, OS_LOG_TYPE_ERROR, "couldn't create bundle from URL", (uint8_t *)&v27, 2u);
    }
    CFRelease(v9);
    return 0;
  }
  CFBundleRef v11 = v10;
  uint64_t v12 = (CGImage *)LICreateDeviceAppropriateHomeScreenIconImageFromBundle();
  if (!v12)
  {
    uint64_t v20 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v27) = 0;
      __int16 v21 = "couldn't create SB icon from bundle";
LABEL_26:
      _os_log_impl(&dword_0, v20, OS_LOG_TYPE_ERROR, v21, (uint8_t *)&v27, 2u);
    }
LABEL_27:
    id v14 = 0;
    goto LABEL_33;
  }
  uint64_t v13 = CGImageDestinationCreateWithData(v7, @"public.png", 1uLL, 0);
  if (!v13)
  {
    uint64_t v20 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v27) = 0;
      __int16 v21 = "couldn't create image";
      goto LABEL_26;
    }
    goto LABEL_27;
  }
  id v14 = v13;
  CGImageDestinationAddImage(v13, v12, 0);
  if (!CGImageDestinationFinalize(v14))
  {
    uint64_t v22 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v27) = 0;
      id v23 = "Couldn't finalize image";
      id v24 = v22;
      uint32_t v25 = 2;
LABEL_32:
      _os_log_impl(&dword_0, v24, OS_LOG_TYPE_ERROR, v23, (uint8_t *)&v27, v25);
    }
LABEL_33:
    BOOL v15 = 0;
    goto LABEL_8;
  }
  BOOL v15 = 1;
  if (([(__CFData *)v7 writeToFile:a4 atomically:1] & 1) == 0)
  {
    id v26 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      int v27 = 138543362;
      id v28 = a4;
      id v23 = "Couldn't save image file to %{public}@";
      id v24 = v26;
      uint32_t v25 = 12;
      goto LABEL_32;
    }
    goto LABEL_33;
  }
LABEL_8:
  CFRelease(v9);
  CFRelease(v11);
  if (v12) {
    CFRelease(v12);
  }
  if (v14) {
    CFRelease(v14);
  }
  return v15;
}

+ (id)_loadPlist:(id)a3 withError:(id *)a4
{
  id v5 = +[NSData dataWithContentsOfFile:a3 options:2 error:a4];
  if (![(NSData *)v5 length]) {
    return 0;
  }
  id v6 = +[NSPropertyListSerialization propertyListWithData:v5 options:1 format:0 error:a4];
  if (!v6)
  {
    CFURLRef v9 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      __int16 v13 = 0;
      CFBundleRef v10 = "couldn't parse todo list";
      CFBundleRef v11 = (uint8_t *)&v13;
LABEL_9:
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_ERROR, v10, v11, 2u);
    }
    return 0;
  }
  id v7 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    CFURLRef v9 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      __int16 v12 = 0;
      CFBundleRef v10 = "todo list is not an array";
      CFBundleRef v11 = (uint8_t *)&v12;
      goto LABEL_9;
    }
    return 0;
  }
  return v7;
}

+ (id)_loadDemotedAppsPlist:(id)a3 withError:(id *)a4
{
  id v5 = +[NSData dataWithContentsOfFile:a3 options:2 error:a4];
  if (![(NSData *)v5 length]) {
    return 0;
  }
  id v6 = +[NSPropertyListSerialization propertyListWithData:v5 options:0 format:0 error:a4];
  if (!v6)
  {
    CFURLRef v9 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      __int16 v13 = 0;
      CFBundleRef v10 = "couldn't parse demoted apps list";
      CFBundleRef v11 = (uint8_t *)&v13;
LABEL_9:
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_ERROR, v10, v11, 2u);
    }
    return 0;
  }
  id v7 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    CFURLRef v9 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      __int16 v12 = 0;
      CFBundleRef v10 = "demoted apps list is not a dictionary";
      CFBundleRef v11 = (uint8_t *)&v12;
      goto LABEL_9;
    }
    return 0;
  }
  return v7;
}

+ (id)_orderTheItems:(id)a3
{
  memset(size, 0, sizeof(size));
  uint32_t v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [a3 count]);
  SBSSpringBoardBlockableServerPort();
  SBGetFlattenedIconState();
  id v5 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "got no icon sort order from SB", buf, 2u);
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v6 = [0 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v31;
    *(void *)&long long v7 = 138543362;
    long long v24 = v7;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(0);
        }
        uint64_t v11 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        id v12 = objc_msgSend(a3, "objectForKey:", v11, v24);
        if (v12)
        {
          id v13 = v12;
          id v14 = _ATLogCategorySyncBundle();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v24;
            uint64_t v37 = v11;
            _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "prioritize %{public}@", buf, 0xCu);
          }
          [(NSMutableArray *)v4 addObject:v13];
          [a3 removeObjectForKey:v11];
        }
      }
      id v8 = [0 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v8);
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v15 = [a3 countByEnumeratingWithState:&v26 objects:v35 count:16];
  if (v15)
  {
    id v17 = v15;
    uint64_t v18 = *(void *)v27;
    *(void *)&long long v16 = 138543362;
    long long v25 = v16;
    do
    {
      for (j = 0; j != v17; j = (char *)j + 1)
      {
        if (*(void *)v27 != v18) {
          objc_enumerationMutation(a3);
        }
        uint64_t v20 = *(void *)(*((void *)&v26 + 1) + 8 * (void)j);
        id v21 = objc_msgSend(a3, "objectForKey:", v20, v25);
        uint64_t v22 = _ATLogCategorySyncBundle();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v25;
          uint64_t v37 = v20;
          _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "lastly %{public}@", buf, 0xCu);
        }
        [(NSMutableArray *)v4 addObject:v21];
      }
      id v17 = [a3 countByEnumeratingWithState:&v26 objects:v35 count:16];
    }
    while (v17);
  }
  return v4;
}

- (BOOL)_isATCDaemon
{
  id v2 = [+[NSBundle mainBundle] bundleIdentifier];

  return [(NSString *)v2 isEqualToString:@"com.apple.atc"];
}

- (id)_restoreStatePropertyForKey:(id)a3 identifier:(id)a4 version:(id)a5
{
  uint64_t v10 = 0;
  id result = +[NSData dataWithContentsOfFile:@"/var/mobile/Library/ApplicationSync/RestoreState.plist" options:2 error:&v10];
  if (result)
  {
    id result = +[NSPropertyListSerialization propertyListWithData:result options:1 format:0 error:&v10];
    if (result)
    {
      id v9 = result;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        return objc_msgSend(objc_msgSend(objc_msgSend(v9, "objectForKeyedSubscript:", a4), "objectForKeyedSubscript:", a5), "objectForKeyedSubscript:", a3);
      }
      else {
        return 0;
      }
    }
  }
  return result;
}

- (void)_setRestoreStatePropertyValue:(id)a3 forKey:(id)a4 identifier:(id)a5 version:(id)a6
{
  uint64_t v13 = 0;
  uint64_t v10 = +[NSData dataWithContentsOfFile:@"/var/mobile/Library/ApplicationSync/RestoreState.plist" options:2 error:&v13];
  if (v10) {
    id v11 = +[NSPropertyListSerialization propertyListWithData:v10 options:1 format:0 error:&v13];
  }
  else {
    id v11 = +[NSMutableDictionary dictionary];
  }
  id v12 = v11;
  if (![v11 objectForKeyedSubscript:a5]) {
    objc_msgSend(v12, "setObject:forKeyedSubscript:", +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"), a5);
  }
  if (!objc_msgSend(objc_msgSend(v12, "objectForKeyedSubscript:", a5), "objectForKeyedSubscript:", a6)) {
    objc_msgSend(objc_msgSend(v12, "objectForKeyedSubscript:", a5), "setObject:forKeyedSubscript:", +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"), a6);
  }
  objc_msgSend(objc_msgSend(objc_msgSend(v12, "objectForKeyedSubscript:", a5), "objectForKeyedSubscript:", a6), "setObject:forKeyedSubscript:", a3, a4);
  [v12 writeToFile:@"/var/mobile/Library/ApplicationSync/RestoreState.plist" atomically:1];
}

- (void)cleanRestoreStateForIdentifier:(id)a3
{
  uint64_t v6 = 0;
  uint32_t v4 = +[NSData dataWithContentsOfFile:@"/var/mobile/Library/ApplicationSync/RestoreState.plist" options:2 error:&v6];
  if (v4)
  {
    id v5 = +[NSPropertyListSerialization propertyListWithData:v4 options:1 format:0 error:&v6];
    [v5 removeObjectForKey:a3];
    if ([v5 count]) {
      [v5 writeToFile:@"/var/mobile/Library/ApplicationSync/RestoreState.plist" atomically:1];
    }
    else {
      [+[NSFileManager defaultManager] removeItemAtPath:@"/var/mobile/Library/ApplicationSync/RestoreState.plist" error:0];
    }
  }
}

- (void)changeAssetID:(id)a3 toDo:(id)a4
{
  id v6 = +[AppsClient _loadPlist:@"/var/mobile/Library/ApplicationSync/iTunesStuff/ApplicationsSync.plist" withError:0];
  if ([v6 count])
  {
    uint64_t v7 = 0;
    while (1)
    {
      id v8 = [v6 objectAtIndex:v7];
      if (objc_msgSend(objc_msgSend(v8, "objectForKey:", @"identifier"), "isEqualToString:", a3)) {
        break;
      }
      if (++v7 >= (unint64_t)[v6 count]) {
        return;
      }
    }
    id v9 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543874;
      id v11 = a3;
      __int16 v12 = 2114;
      id v13 = [v8 objectForKey:@"operation"];
      __int16 v14 = 2114;
      id v15 = a4;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Changing %{public}@ from %{public}@ to %{public}@", (uint8_t *)&v10, 0x20u);
    }
    [v8 setObject:a4 forKey:@"operation"];
    [(NSData *)+[NSPropertyListSerialization dataWithPropertyList:v6 format:200 options:0 error:0] writeToFile:@"/var/mobile/Library/ApplicationSync/iTunesStuff/ApplicationsSync.plist" atomically:1];
  }
}

- (void)dataMigratorSetPlaceHolderPromiseForRestoreAppBundle:(id)a3
{
  restoreQueue = self->_restoreQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_E5FC;
  v4[3] = &unk_184B0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync((dispatch_queue_t)restoreQueue, v4);
}

- (void)dataMigratorCancelledCoordinatorForRestoreAppBundle:(id)a3
{
  restoreQueue = self->_restoreQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_E758;
  v4[3] = &unk_184B0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync((dispatch_queue_t)restoreQueue, v4);
}

- (void)icDidInstallPlaceHolderForAppBundle:(id)a3
{
  restoreQueue = self->_restoreQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_E8B4;
  v4[3] = &unk_184B0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync((dispatch_queue_t)restoreQueue, v4);
}

- (id)_operationStateForIdentifier:(id)a3
{
  id v4 = +[AppsClient _loadPlist:@"/var/mobile/Library/ApplicationSync/iTunesStuff/ApplicationsSync.plist" withError:0];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id result = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (result)
  {
    id v6 = result;
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      id v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v10 + 1) + 8 * (void)v8);
        if (objc_msgSend(objc_msgSend(v9, "objectForKeyedSubscript:", @"identifier"), "isEqualToString:", a3))return objc_msgSend(v9, "objectForKeyedSubscript:", @"operation"); {
        id v8 = (char *)v8 + 1;
        }
      }
      while (v6 != v8);
      id result = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      id v6 = result;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

- (id)_progressForAssetIdentifier:(id)a3
{
  id v4 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = a3;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Not returning NSProgress * for %{public}@ as installcoordination is enabled", (uint8_t *)&v6, 0xCu);
  }
  return 0;
}

- (id)placeholderAppPathForBundleIdentifier:(id)a3
{
  id v3 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", NSTemporaryDirectory(), @"com.apple.atc.Apps", a3, 0);
  id v4 = [+[NSString pathWithComponents:v3] stringByAppendingPathExtension:@"app"];

  return v4;
}

- (int)_getAndResetNumAppInstallsAttempted
{
  do
  {
    int numAppInstallsAttempted = self->_numAppInstallsAttempted;
    int v3 = numAppInstallsAttempted;
    atomic_compare_exchange_strong_explicit(&self->_numAppInstallsAttempted, (unsigned int *)&v3, 0, memory_order_relaxed, memory_order_relaxed);
  }
  while (v3 != numAppInstallsAttempted);
  return numAppInstallsAttempted;
}

- (BOOL)_appInstallationAllowed
{
  id v2 = +[MCProfileConnection sharedConnection];
  return [v2 effectiveBoolValueForSetting:MCFeatureAppInstallationAllowed] != 2;
}

- (BOOL)_appRemovalAllowed
{
  id v2 = +[MCProfileConnection sharedConnection];
  return [v2 effectiveBoolValueForSetting:MCFeatureAppRemovalAllowed] != 2;
}

- (BOOL)_processItunesRestoreInfo
{
  uint64_t v45 = 0;
  int v3 = +[NSFileManager defaultManager];
  if (![(NSFileManager *)v3 fileExistsAtPath:@"/var/mobile/Media/iTunesRestore/RestoreApplications.plist" isDirectory:0])
  {
    long long v26 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v26, OS_LOG_TYPE_DEFAULT, "no itunes restore plist found - skipping processing of itunes restored apps", buf, 2u);
    }
    return 1;
  }
  id v4 = +[NSData dataWithContentsOfFile:@"/var/mobile/Media/iTunesRestore/RestoreApplications.plist" options:2 error:&v45];
  id v5 = _ATLogCategorySyncBundle();
  int v6 = v5;
  if (!v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v47 = v45;
      long long v28 = "failed to read itunes app restore info. err=%{public}@";
LABEL_40:
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_ERROR, v28, buf, 0xCu);
    }
LABEL_41:
    unsigned __int8 v12 = 0;
    goto LABEL_46;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "processing itunes restore info", buf, 2u);
  }
  id v38 = +[NSPropertyListSerialization propertyListWithData:v4 options:0 format:0 error:&v45];
  if (!v38)
  {
    int v6 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v47 = v45;
      long long v28 = "failed to parse itunes app restore info. err=%{public}@";
      goto LABEL_40;
    }
    goto LABEL_41;
  }
  unsigned __int8 v35 = v3;
  id v7 = +[AppsClient _loadDemotedAppsPlist:@"/var/mobile/Library/Preferences/com.apple.MobileBackup.DemotedApps.plist" withError:0];
  id v8 = [v7 objectForKey:@"AutomaticDowngrades"];
  id v37 = [v7 objectForKey:@"IntentionalDowngrades"];
  id v9 = _ATLogCategorySyncBundle_Oversize();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v47 = (uint64_t)v7;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Demoted Apps: %{public}@", buf, 0xCu);
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = [v38 allKeys];
  id v10 = [obj countByEnumeratingWithState:&v41 objects:v50 count:16];
  if (!v10)
  {
    unsigned __int8 v12 = 0;
    goto LABEL_43;
  }
  id v11 = v10;
  unsigned __int8 v12 = 0;
  uint64_t v13 = *(void *)v42;
  uint64_t v36 = *(void *)v42;
  do
  {
    for (i = 0; i != v11; i = (char *)i + 1)
    {
      if (*(void *)v42 != v13) {
        objc_enumerationMutation(obj);
      }
      uint64_t v15 = *(void *)(*((void *)&v41 + 1) + 8 * i);
      if ([v8 containsObject:v15]) {
        uint64_t v16 = 2;
      }
      else {
        uint64_t v16 = [v37 containsObject:v15];
      }
      id v17 = _ATLogCategorySyncBundle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v47 = v15;
        __int16 v48 = 2048;
        uint64_t v49 = v16;
        _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "processing itunes restore info for '%{public}@' demotionStatus :%lu", buf, 0x16u);
      }
      if ([(AppsClient *)self _placeholderExistsForApplication:v15])
      {
        uint64_t v18 = _ATLogCategorySyncBundle();
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
          continue;
        }
        *(_DWORD *)buf = 138543362;
        uint64_t v47 = v15;
        __int16 v19 = v18;
        uint64_t v20 = "placeholder already exists for '%{public}@' - skiping'";
LABEL_26:
        _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, v20, buf, 0xCu);
        continue;
      }
      id v21 = [v38 objectForKey:v15];
      if (!v21)
      {
        long long v24 = _ATLogCategorySyncBundle();
        if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
          continue;
        }
        *(_DWORD *)buf = 138543362;
        uint64_t v47 = v15;
        __int16 v19 = v24;
        uint64_t v20 = "no itunes restore info for '%{public}@' - skipping";
        goto LABEL_26;
      }
      uint64_t v22 = v21;
      id v23 = [v21 objectForKey:@"iTunesMetadata"];
      if (v23)
      {
        unsigned __int8 v12 = -[AppsClient prepareAppForRestoreUsingCoordination:iTunesMetadata:sinfData:iconData:demotionStatus:](self, "prepareAppForRestoreUsingCoordination:iTunesMetadata:sinfData:iconData:demotionStatus:", v15, v23, [v22 objectForKey:@"ApplicationSINF"], objc_msgSend(v22, "objectForKey:", @"PlaceholderIcon"), v16);
      }
      else
      {
        long long v25 = _ATLogCategorySyncBundle();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v47 = v15;
          _os_log_impl(&dword_0, v25, OS_LOG_TYPE_DEFAULT, "no iTunesMetadata for '%{public}@' - ignoring", buf, 0xCu);
        }
      }
      uint64_t v13 = v36;
    }
    id v11 = [obj countByEnumeratingWithState:&v41 objects:v50 count:16];
  }
  while (v11);
LABEL_43:
  int64_t restoringPlaceholderCount = self->_restoringPlaceholderCount;
  dispatch_time_t v30 = dispatch_time(0, 5000000000 * restoringPlaceholderCount);
  long long v31 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v32 = self->_restoringPlaceholderCount;
    *(_DWORD *)buf = 134218240;
    uint64_t v47 = 5 * restoringPlaceholderCount;
    __int16 v48 = 2048;
    uint64_t v49 = v32;
    _os_log_impl(&dword_0, v31, OS_LOG_TYPE_DEFAULT, "Will wait for %lld seconds for %lld placeholders to install", buf, 0x16u);
  }
  dispatch_group_wait((dispatch_group_t)self->_restorePlaceHoldersWaitGroup, v30);
  restoreQueue = self->_restoreQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_F344;
  block[3] = &unk_184D8;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)restoreQueue, block);
  int v3 = v35;
LABEL_46:
  [(NSFileManager *)v3 removeItemAtPath:@"/var/mobile/Library/Logs/MediaServices/RestoreApplications.plist" error:0];
  if (![(NSFileManager *)v3 moveItemAtPath:@"/var/mobile/Media/iTunesRestore/RestoreApplications.plist" toPath:@"/var/mobile/Library/Logs/MediaServices/RestoreApplications.plist" error:&v45])
  {
    uint32_t v34 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v47 = v45;
      _os_log_impl(&dword_0, v34, OS_LOG_TYPE_ERROR, "failed to copy itunes metadata. err=%{public}@", buf, 0xCu);
    }
  }
  return v12 & 1;
}

- (BOOL)createPlaceHolderPath:(id)a3 forBundleIdentifier:(id)a4 withAttributes:(id)a5
{
  id v17 = 0;
  BOOL v7 = [+[NSFileManager defaultManager] createDirectoryAtPath:a3 withIntermediateDirectories:1 attributes:a5 error:&v17];
  BOOL v8 = v7 && v17 == 0;
  if (v8
    || (+[AITransactionLog logScenario:@"iTunes App Restore" step:0 success:0 forBundleID:a4 description:@"Failed to create app directory"], !v17))
  {
    uint64_t v15 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v19 = a4;
      __int16 v20 = 2114;
      id v21 = a3;
      id v11 = "Created app directory for '%{public}@' at %{public}@.";
      unsigned __int8 v12 = v15;
      os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
      uint32_t v14 = 22;
      goto LABEL_10;
    }
  }
  else
  {
    id v9 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = objc_msgSend(v17, "msv_description");
      *(_DWORD *)buf = 138543874;
      id v19 = a4;
      __int16 v20 = 2114;
      id v21 = a3;
      __int16 v22 = 2114;
      id v23 = v10;
      id v11 = "Created app directory for '%{public}@' at %{public}@. error=%{public}@";
      unsigned __int8 v12 = v9;
      os_log_type_t v13 = OS_LOG_TYPE_ERROR;
      uint32_t v14 = 32;
LABEL_10:
      _os_log_impl(&dword_0, v12, v13, v11, buf, v14);
    }
  }
  return v7;
}

- (BOOL)writeIconData:(id)a3 atPath:(id)a4 returningFileSize:(unint64_t *)a5 forBundleIdentifier:(id)a6 withAttributes:(id)a7
{
  uint64_t v21 = 0;
  if (a3)
  {
    unsigned __int8 v12 = +[NSFileManager defaultManager];
    unsigned int v13 = [(NSFileManager *)v12 createFileAtPath:a4 contents:a3 attributes:a7];
    if (v13
      && ((uint32_t v14 = [(NSFileManager *)v12 attributesOfItemAtPath:a4 error:&v21]) != 0
        ? (BOOL v15 = v21 == 0)
        : (BOOL v15 = 0),
          v15))
    {
      id v20 = [(NSDictionary *)v14 fileSize];
      id v16 = v20;
      if (a5) {
        *a5 = (unint64_t)v20;
      }
    }
    else
    {
      id v16 = 0;
    }
    id v17 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544130;
      id v23 = a6;
      __int16 v24 = 2114;
      id v25 = a4;
      __int16 v26 = 1024;
      unsigned int v27 = v13;
      __int16 v28 = 2048;
      id v29 = v16;
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "icon data for '%{public}@' was writen to %{public}@ with status:%d fileSize:%llu", buf, 0x26u);
    }
  }
  else
  {
    uint64_t v18 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v23 = a6;
      _os_log_impl(&dword_0, v18, OS_LOG_TYPE_ERROR, "no icon data for '%{public}@'", buf, 0xCu);
    }
    LOBYTE(v13) = 0;
  }
  return v13;
}

- (BOOL)_placeholderExistsForApplication:(id)a3
{
  return 0;
}

- (BOOL)_isRecoverableError:(id)a3
{
  id v4 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = a3;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Treating error %{public}@ as non recoverable", (uint8_t *)&v6, 0xCu);
  }
  return 0;
}

- (void)_enumeratePlaceholdersWithBlock:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_F808;
  v3[3] = &unk_18630;
  v3[4] = a3;
  objc_msgSend(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"), "enumerateBundlesOfType:block:", 0, v3);
}

- (id)_getSystemAppPlaceholders
{
  uint64_t v7 = 0;
  BOOL v8 = &v7;
  uint64_t v9 = 0x3052000000;
  id v10 = sub_FA28;
  id v11 = sub_FA38;
  id v12 = 0;
  id v12 = +[NSMutableSet set];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_FA44;
  v6[3] = &unk_18658;
  v6[4] = &v7;
  objc_msgSend(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"), "enumerateBundlesOfType:block:", 7, v6);
  id v2 = _ATLogCategorySyncBundle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = v8[5];
    *(_DWORD *)buf = 138543362;
    uint64_t v14 = v3;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "SystemAppPlaceholders %{public}@", buf, 0xCu);
  }
  id v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)setupInstallCoordinatorObserver
{
  if (!self->_appInstallObserver) {
    self->_appInstallObserver = (IXAppInstallObserver *)objc_msgSend(objc_alloc((Class)IXAppInstallObserver), "initWithMachServiceName:forClients:delegate:", @"com.apple.atc.xpc.icappobserverdelegate", +[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_19668, 0), self);
  }
}

@end