@interface MSDOperationBuilder
- (BOOL)disableBackgroundInstall;
- (BOOL)forBackgroundDownload;
- (BOOL)verifyHashBeforeStaging;
- (MSDOperationBuilder)initWithSignedManifest:(id)a3 forBackgroundDownload:(BOOL)a4 verifyHashBeforeStaging:(BOOL)a5;
- (MSDSignedManifest)signedManifest;
- (id)buildAppDataOperationsWithIdentifier:(id)a3 andDependencies:(id)a4;
- (id)buildAppOperationsWithIdentifier:(id)a3 shouldDeferApp:(BOOL)a4;
- (id)buildAppRemovalOperationsWithIdentifier:(id)a3;
- (id)buildBackupOperationsWithPath:(id)a3 andIndex:(unint64_t)a4;
- (id)buildConfigurationProfileOperationsWithIdentifier:(id)a3;
- (id)buildProvisioningProfileOperations:(id)a3;
- (id)buildSettingsOperationWithIdentifier:(id)a3;
- (id)buildStandalonePkgOperationsWithIdentifier:(id)a3;
- (id)buildSystemAppOperationsWithIdentifier:(id)a3;
- (id)sequentialGroupForIdentifiers:(id)a3 andContext:(id)a4;
- (id)sequentialOperationsForIdentifiers:(id)a3 andContext:(id)a4;
- (void)setDisableBackgroundInstall:(BOOL)a3;
- (void)setForBackgroundDownload:(BOOL)a3;
- (void)setSignedManifest:(id)a3;
- (void)setVerifyHashBeforeStaging:(BOOL)a3;
@end

@implementation MSDOperationBuilder

- (MSDOperationBuilder)initWithSignedManifest:(id)a3 forBackgroundDownload:(BOOL)a4 verifyHashBeforeStaging:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MSDOperationBuilder;
  v9 = [(MSDOperationBuilder *)&v16 init];
  v10 = v9;
  if (v9)
  {
    [(MSDOperationBuilder *)v9 setSignedManifest:v8];
    [(MSDOperationBuilder *)v10 setForBackgroundDownload:v6];
    [(MSDOperationBuilder *)v10 setVerifyHashBeforeStaging:v5];
    [(MSDOperationBuilder *)v10 setDisableBackgroundInstall:+[MSDHubFeatureFlags disableBackgroundInstall]];
    if ([(MSDOperationBuilder *)v10 disableBackgroundInstall])
    {
      v11 = sub_100068600();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Background install is disabled by feature flag!", v15, 2u);
      }
    }
    +[MSDOperationContext setDownloadOnly:v6];
    v12 = +[MSDContentFilesContext processedContainers];
    [v12 removeAllObjects];

    v13 = v10;
  }

  return v10;
}

- (id)buildBackupOperationsWithPath:(id)a3 andIndex:(unint64_t)a4
{
  id v6 = a3;
  v7 = [(MSDOperationBuilder *)self signedManifest];
  id v8 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v7 getVersion]);

  v9 = +[MSDSignedManifest getComponentFromPath:v6 forManifestVersion:v8];
  v10 = +[MSDTargetDevice sharedInstance];
  v11 = [v10 demoUserHomePath];

  v12 = [MSDManifest alloc];
  v13 = [(MSDOperationBuilder *)self signedManifest];
  v14 = [v13 mergedBackupManifest:a4];
  v15 = [(MSDManifest *)v12 initWithDictionary:v14 andUserHomePath:v11];

  if (v15)
  {
    objc_super v16 = +[MSDContentFilesContext defaultContextForBackupItem:v9];
    [v16 setMasterManifest:v15];
    [v16 setVerifyFileHash:[(MSDOperationBuilder *)self verifyHashBeforeStaging]];
    v17 = [(MSDOperationBuilder *)self signedManifest];
    v18 = [v17 originServerForBackupManifest:a4];
    [v16 setOriginServer:v18];

    v19 = [(MSDOperationBuilder *)self signedManifest];
    v20 = [v19 getDataComponentRealSizeFromSection:@"BackupData" forIdentifier:v9];
    [v16 setDiskSpacedRequired:v20];

    -[NSObject setContentBeingInstalled:](v16, "setContentBeingInstalled:", a4, 1);
    [v16 setAppIdentifier:v9];
    if ([(MSDOperationBuilder *)self forBackgroundDownload]) {
      CFStringRef v21 = @"/private/var/mnt/com.apple.mobilestoredemo.snapshot";
    }
    else {
      CFStringRef v21 = @"/";
    }
    [v16 setRootFileSystemPath:v21];
    v22 = +[NSMutableArray arrayWithObjects:@"MSDContentFilesPrepareOperation", @"MSDContentFilesDownloadOperation", @"MSDContentFilesInstallOperation", 0];
    if ([(MSDOperationBuilder *)self forBackgroundDownload]
      && [(MSDOperationBuilder *)self disableBackgroundInstall])
    {
      [v22 removeLastObject];
    }
    if ([(MSDOperationBuilder *)self forBackgroundDownload]) {
      goto LABEL_13;
    }
    v23 = [(MSDOperationBuilder *)self signedManifest];
    unsigned __int8 v24 = [v23 isItemBaseBackup:v6];

    if ((v24 & 1) != 0
      || ([(MSDOperationBuilder *)self signedManifest],
          v25 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v26 = [v25 isItemProvisioningProfileBackup:v6],
          v25,
          (v26 & 1) != 0))
    {
      v27 = &off_100153340;
    }
    else
    {
      v30 = [(MSDOperationBuilder *)self signedManifest];
      unsigned int v31 = [v30 isItemConfigurationProfileBackup:v6];

      if (!v31) {
        goto LABEL_13;
      }
      v27 = &off_100153338;
    }
    [v22 addObject:*v27];
LABEL_13:
    v28 = [(MSDOperationBuilder *)self sequentialOperationsForIdentifiers:v22 andContext:v16];

    goto LABEL_14;
  }
  objc_super v16 = sub_100068600();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    sub_1000CA0D0();
  }
  v28 = 0;
LABEL_14:

  return v28;
}

- (id)buildSystemAppOperationsWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  id v6 = [(MSDOperationBuilder *)self signedManifest];
  v7 = [v6 getSystemAppDataList];

  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v36 = v4;
    if ([(MSDOperationBuilder *)self forBackgroundDownload])
    {
      id v8 = 0;
    }
    else
    {
      id v8 = objc_alloc_init(MSDOperationContext);
      [(MSDOperationContext *)v8 setIdentifier:v4];
      CFStringRef v45 = @"MSDSystemAppsDataPrepareOperation";
      v9 = +[NSArray arrayWithObjects:&v45 count:1];
      v10 = [(MSDOperationBuilder *)self sequentialGroupForIdentifiers:v9 andContext:v8];

      if (!v10) {
        goto LABEL_30;
      }
      v11 = [(MSDOperationContext *)v10 operations];
      v12 = [v11 allObjects];
      [v5 addObjectsFromArray:v12];

      id v8 = v10;
    }
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    v35 = v7;
    id obj = v7;
    id v13 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v39;
      while (2)
      {
        objc_super v16 = 0;
        do
        {
          if (*(void *)v39 != v15) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(void *)(*((void *)&v38 + 1) + 8 * (void)v16);
          v18 = sub_100068600();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v43 = v17;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Processing system app: %{public}@", buf, 0xCu);
          }

          v19 = [(MSDOperationBuilder *)self signedManifest];
          v20 = [v19 getSystemAppDependecies:v17];

          if (v20 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            CFStringRef v21 = [(MSDOperationBuilder *)self buildAppDataOperationsWithIdentifier:v17 andDependencies:v20];
            if (!v21)
            {
              unsigned __int8 v26 = sub_100068600();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
                sub_1000CA138(v26, v27, v28, v29, v30, v31, v32, v33);
              }

              v10 = 0;
              goto LABEL_29;
            }
            v22 = v21;
            if (v8) {
              [v21 addDependency:v8];
            }
            v23 = [v22 operations];
            unsigned __int8 v24 = [v23 allObjects];
            [v5 addObjectsFromArray:v24];
          }
          else
          {
            v22 = sub_100068600();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v43 = v17;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Missing app data dependencies for system app:  %{public}@", buf, 0xCu);
            }
          }

          objc_super v16 = (char *)v16 + 1;
        }
        while (v14 != v16);
        id v25 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
        id v14 = v25;
        if (v25) {
          continue;
        }
        break;
      }
    }

    v10 = (MSDOperationContext *)v5;
LABEL_29:
    v7 = v35;
    id v4 = v36;
  }
  else
  {
    sub_100068600();
    id v8 = (MSDOperationContext *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v8->super, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, &v8->super, OS_LOG_TYPE_DEFAULT, "Missing SystemApps data section.", buf, 2u);
    }
    v10 = 0;
  }
LABEL_30:

  return v10;
}

- (id)buildAppOperationsWithIdentifier:(id)a3 shouldDeferApp:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v62 = objc_alloc_init((Class)NSMutableArray);
  v7 = [(MSDOperationBuilder *)self signedManifest];
  id v8 = [v7 getAppManifest:v6];

  objc_opt_class();
  v60 = v8;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v47 = sub_100068600();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v65 = v8;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Unexpected app info format: %{public}@", buf, 0xCu);
    }

    v63 = 0;
    v19 = 0;
    id v36 = 0;
    v42 = 0;
    id v14 = 0;
    v61 = 0;
    goto LABEL_48;
  }
  v9 = [(MSDOperationBuilder *)self signedManifest];
  v10 = [v9 getAppDependecies:v6];

  v61 = v10;
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v50 = sub_100068600();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v65 = v10;
        _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "Unexpected app dependencies format: %{public}@", buf, 0xCu);
      }

      v63 = 0;
      v19 = 0;
      id v36 = 0;
      v42 = 0;
      id v14 = 0;
LABEL_48:
      v59 = 0;
      goto LABEL_49;
    }
  }
  v11 = [v10 objectForKey:@"ProvisioningProfiles"];
  v59 = v11;
  if (v11 && (v12 = v11, [v11 count]))
  {
    id v13 = [(MSDOperationBuilder *)self buildProvisioningProfileOperations:v12];
    id v14 = v13;
    if (!v13)
    {
      v63 = 0;
      v19 = 0;
      goto LABEL_43;
    }
    uint64_t v15 = [v13 operations];
    objc_super v16 = [v15 allObjects];
    [v62 addObjectsFromArray:v16];
  }
  else
  {
    id v14 = 0;
  }
  uint64_t v17 = [v8 objectForKey:@"Identifier"];
  uint64_t v18 = [v8 objectForKey:@"Hash"];
  v19 = (void *)v18;
  v63 = (void *)v17;
  if (!v17 || !v18)
  {
    v48 = sub_100068600();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v65 = v8;
      v49 = "Missing app identifier or hash data from app info: %{public}@";
LABEL_41:
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, v49, buf, 0xCu);
    }
LABEL_42:

LABEL_43:
    id v36 = 0;
    v42 = 0;
LABEL_49:
    v34 = 0;
    v23 = 0;
    id v41 = 0;
    v37 = v62;
    goto LABEL_27;
  }
  v20 = [(MSDOperationBuilder *)self signedManifest];
  id v21 = [v20 getAppType:v6];

  if ((unint64_t)v21 >= 3)
  {
    v48 = sub_100068600();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v65 = v21;
      v49 = "Received unknown value for app type: %lu";
      goto LABEL_41;
    }
    goto LABEL_42;
  }
  v22 = v14;
  v23 = objc_alloc_init(MSDInstallableFileContext);
  [(MSDOperationContext *)v23 setIdentifier:v6];
  unsigned __int8 v24 = [(MSDOperationBuilder *)self signedManifest];
  id v25 = [v24 originServerForApp:v6];
  [(MSDInstallableFileContext *)v23 setOriginServer:v25];

  unsigned __int8 v26 = [v19 hexStringRepresentation];
  [(MSDInstallableFileContext *)v23 setFileHash:v26];

  [(MSDInstallableFileContext *)v23 setFileType:0];
  [(MSDInstallableFileContext *)v23 setUniqueIdentifier:v63];
  [(MSDInstallableFileContext *)v23 setCurrentUniqueIdentifier:0];
  [(MSDInstallableFileContext *)v23 setUseDiffPatch:0];
  [(MSDInstallableFileContext *)v23 setAlreadyInstalled:0];
  [(MSDInstallableFileContext *)v23 setPricingAppUpdateDeferred:v4];
  [(MSDInstallableFileContext *)v23 setVerifyFileHash:[(MSDOperationBuilder *)self verifyHashBeforeStaging]];
  uint64_t v27 = +[MSDTargetDevice sharedInstance];
  -[MSDInstallableFileContext setDeleteInstallableFileAfterInstall:](v23, "setDeleteInstallableFileAfterInstall:", [v27 isOfflineMode] ^ 1);

  uint64_t v28 = [(MSDOperationBuilder *)self signedManifest];
  uint64_t v29 = [v28 getAppRealSize:v6];
  id v30 = [v29 unsignedLongLongValue];

  uint64_t v31 = [(MSDOperationBuilder *)self signedManifest];
  uint64_t v32 = [v31 getAppFileSize:v6];
  uint64_t v33 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (char *)[v32 unsignedLongLongValue]+ (void)v30+ ((unint64_t)(((((unint64_t)(5 * (void)v30) >> 1) & 0x3FFFFFFFFFFFFFFFLL)* (unsigned __int128)0x28F5C28F5C28F5C3uLL) >> 64) >> 2));
  [(MSDOperationContext *)v23 setDiskSpacedRequired:v33];

  v34 = +[NSMutableArray arrayWithObjects:@"MSDApplicationFilePrepareOperation", @"MSDApplicationFileDownloadOperation", 0];
  if (![(MSDOperationBuilder *)self forBackgroundDownload])
  {
    v35 = &off_100153328;
    if (v21 != (id)2) {
      v35 = &off_100153330;
    }
    [v34 addObject:*v35];
  }
  id v36 = [(MSDOperationBuilder *)self sequentialGroupForIdentifiers:v34 andContext:v23];
  v37 = v62;
  id v14 = v22;
  if (v36)
  {
    if (![(MSDOperationBuilder *)self forBackgroundDownload] && v22) {
      [v36 addDependency:v22];
    }
    long long v38 = [v36 operations];
    long long v39 = [v38 allObjects];
    [v62 addObjectsFromArray:v39];

    if (([v6 isEqualToString:@"com.retailtech.arkenstone"] & 1) != 0
      || ([v6 isEqualToString:@"com.apple.ist.windward"] & 1) != 0
      || [v6 isEqualToString:@"com.apple.ist.DemoDiscoveryApp"])
    {
      long long v40 = sub_100068600();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v65 = v6;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Skipping updating app data for %{public}@ as requested.", buf, 0xCu);
      }

      id v41 = v62;
      v42 = 0;
    }
    else
    {
      uint64_t v44 = [(MSDOperationBuilder *)self buildAppDataOperationsWithIdentifier:v6 andDependencies:v61];
      if (v44)
      {
        v42 = (void *)v44;
        if (![(MSDOperationBuilder *)self forBackgroundDownload]) {
          [v42 addDependency:v36];
        }
        CFStringRef v45 = [v42 operations];
        v46 = [v45 allObjects];
        [v62 addObjectsFromArray:v46];

        v37 = v62;
        id v41 = v62;
      }
      else
      {
        v51 = sub_100068600();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
          sub_1000CA138(v51, v52, v53, v54, v55, v56, v57, v58);
        }

        v42 = 0;
        id v41 = 0;
      }
    }
    id v14 = v22;
  }
  else
  {
    v42 = 0;
    id v41 = 0;
  }
LABEL_27:

  return v41;
}

- (id)buildStandalonePkgOperationsWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(MSDOperationBuilder *)self signedManifest];
  id v6 = [v5 getManifestInfoFromSection:@"Packages" forIdentifier:v4];

  if (!v6)
  {
    v19 = sub_100068600();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v24 = v4;
      v22 = "Missing Info section for stand-alone package:  %{public}@";
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v22, buf, 0xCu);
    }
LABEL_14:
    v20 = 0;
    goto LABEL_6;
  }
  uint64_t v7 = [v6 objectForKey:@"Hash"];
  if (!v7)
  {
    v19 = sub_100068600();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v24 = v4;
      v22 = "Missing Hash value in the Info section for stand-alone package:  %{public}@";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  id v8 = (void *)v7;
  v9 = objc_alloc_init(MSDInstallableFileContext);
  [(MSDOperationContext *)v9 setIdentifier:v4];
  [(MSDInstallableFileContext *)v9 setFileType:1];
  v10 = [v8 hexStringRepresentation];
  [(MSDInstallableFileContext *)v9 setFileHash:v10];

  [(MSDInstallableFileContext *)v9 setVerifyFileHash:[(MSDOperationBuilder *)self verifyHashBeforeStaging]];
  v11 = [(MSDOperationBuilder *)self signedManifest];
  v12 = [v11 getOriginServerFromSection:@"Packages" forIdentifier:v4];
  [(MSDInstallableFileContext *)v9 setOriginServer:v12];

  id v13 = [(MSDOperationBuilder *)self signedManifest];
  id v14 = [v13 getStandAlonePackageRealSize:v4];
  id v15 = [v14 unsignedLongLongValue];

  objc_super v16 = [(MSDOperationBuilder *)self signedManifest];
  uint64_t v17 = [v16 getStandAlonePackageFileSize:v4];
  uint64_t v18 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (char *)[v17 unsignedLongLongValue]+ (void)v15+ ((unint64_t)(((((unint64_t)(5 * (void)v15) >> 1) & 0x3FFFFFFFFFFFFFFFLL)* (unsigned __int128)0x28F5C28F5C28F5C3uLL) >> 64) >> 2));
  [(MSDOperationContext *)v9 setDiskSpacedRequired:v18];

  v19 = +[NSMutableArray arrayWithObjects:@"MSDBasePrepareOperation", @"MSDInstallableFileDownloadOperation", 0];
  if (![(MSDOperationBuilder *)self forBackgroundDownload]) {
    [v19 addObject:@"MSDPackageInstallOperation"];
  }
  v20 = [(MSDOperationBuilder *)self sequentialOperationsForIdentifiers:v19 andContext:v9];

LABEL_6:

  return v20;
}

- (id)buildConfigurationProfileOperationsWithIdentifier:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v6 = sub_100068600();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000CA170(v6, v23, v24, v25, v26, v27, v28, v29);
    }
    goto LABEL_24;
  }
  id v5 = [(MSDOperationBuilder *)self signedManifest];
  id v6 = [v5 getManifestDataFromSection:@"ConfigurationProfiles" forIdentifier:v4];

  if (!v6)
  {
    id v6 = sub_100068600();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000CA1E0();
    }
    goto LABEL_24;
  }
  if ([v6 count] != (id)1)
  {
    id v30 = sub_100068600();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_1000CA340();
    }
    goto LABEL_20;
  }
  uint64_t v7 = [(MSDOperationBuilder *)self signedManifest];
  id v8 = [v7 getManifestInfoFromSection:@"ConfigurationProfiles" forIdentifier:v4];

  if (!v8)
  {
    id v30 = sub_100068600();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_1000CA258();
    }
LABEL_20:

LABEL_24:
    id v21 = 0;
    goto LABEL_9;
  }
  v9 = [v6 allKeys];
  v10 = [v9 firstObject];

  v11 = [v6 objectForKey:v10];
  v12 = [v11 objectForKey:@"MSDManifestFileHash"];

  if (!v12)
  {
    uint64_t v31 = sub_100068600();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      sub_1000CA2D0();
    }

    goto LABEL_24;
  }
  id v13 = objc_alloc_init(MSDInstallableFileContext);
  [(MSDOperationContext *)v13 setIdentifier:v4];
  [(MSDInstallableFileContext *)v13 setFileType:3];
  id v14 = [v12 hexStringRepresentation];
  [(MSDInstallableFileContext *)v13 setFileHash:v14];

  [(MSDInstallableFileContext *)v13 setVerifyFileHash:[(MSDOperationBuilder *)self verifyHashBeforeStaging]];
  id v15 = [(MSDOperationBuilder *)self signedManifest];
  objc_super v16 = [v15 getOriginServerFromSection:@"ConfigurationProfiles" forIdentifier:v4];
  [(MSDInstallableFileContext *)v13 setOriginServer:v16];

  uint64_t v17 = [(MSDOperationBuilder *)self signedManifest];
  uint64_t v18 = [v17 getDataComponentRealSizeFromSection:@"ConfigurationProfiles" forIdentifier:v4];
  [(MSDOperationContext *)v13 setDiskSpacedRequired:v18];

  v19 = [v8 objectForKey:@"ProfileIdentifier"];
  [(MSDInstallableFileContext *)v13 setProfileIdentifier:v19];

  v20 = +[NSMutableArray arrayWithObjects:@"MSDBasePrepareOperation", @"MSDInstallableFileDownloadOperation", 0];
  if (![(MSDOperationBuilder *)self forBackgroundDownload]) {
    [v20 addObject:@"MSDConfigurationProfileInstallOperation"];
  }
  id v21 = [(MSDOperationBuilder *)self sequentialOperationsForIdentifiers:v20 andContext:v13];

  id v6 = v20;
LABEL_9:

  return v21;
}

- (id)buildAppRemovalOperationsWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  id v6 = objc_alloc_init(MSDInstallableFileContext);
  [(MSDInstallableFileContext *)v6 setFileType:0];
  [(MSDOperationContext *)v6 setIdentifier:v4];

  [(MSDInstallableFileContext *)v6 setVerifyFileHash:[(MSDOperationBuilder *)self verifyHashBeforeStaging]];
  CFStringRef v21 = @"MSDIPAUninstallOperation";
  uint64_t v7 = +[NSArray arrayWithObjects:&v21 count:1];
  id v8 = [(MSDOperationBuilder *)self sequentialGroupForIdentifiers:v7 andContext:v6];

  if (v8)
  {
    v9 = [v8 operations];
    v10 = [v9 allObjects];
    [v5 addObjectsFromArray:v10];

    id v11 = v5;
  }
  else
  {
    id v13 = sub_100068600();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1000CA3A8(v13, v14, v15, v16, v17, v18, v19, v20);
    }

    id v11 = 0;
  }

  return v11;
}

- (id)buildSettingsOperationWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(MSDOperationBuilder *)self signedManifest];
  id v6 = [v5 getSettingsDataFromSection:@"BackupData" forIdentifier:v4];

  uint64_t v7 = sub_100068600();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315394;
      id v13 = "-[MSDOperationBuilder buildSettingsOperationWithIdentifier:]";
      __int16 v14 = 2114;
      uint64_t v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s - %{public}@", (uint8_t *)&v12, 0x16u);
    }

    id v8 = +[MSDSettingsContext defaultContextForIdentifier:v4];
    [v8 setDataDict:v6];
    v9 = +[NSMutableArray array];
    [v9 addObject:@"MSDSettingsInstallOperation"];
    v10 = [(MSDOperationBuilder *)self sequentialOperationsForIdentifiers:v9 andContext:v8];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000CA3E0();
    }
    v10 = 0;
  }

  return v10;
}

- (id)sequentialOperationsForIdentifiers:(id)a3 andContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init((Class)NSMutableArray);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v19;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = +[MSDOperationRepository createOperationFromIdentifier:withContext:](MSDOperationRepository, "createOperationFromIdentifier:withContext:", *(void *)(*((void *)&v18 + 1) + 8 * i), v6, (void)v18);
        if (!v13)
        {

          id v16 = 0;
          goto LABEL_13;
        }
        __int16 v14 = (void *)v13;
        if ([v7 count])
        {
          uint64_t v15 = [v7 lastObject];
          [v14 addDependency:v15];
        }
        [v7 addObject:v14];
      }
      id v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  id v16 = v7;
LABEL_13:

  return v16;
}

- (id)sequentialGroupForIdentifiers:(id)a3 andContext:(id)a4
{
  id v4 = [(MSDOperationBuilder *)self sequentialOperationsForIdentifiers:a3 andContext:a4];
  id v5 = [[MSDOperationGroup alloc] initWithOperations:v4];

  return v5;
}

- (id)buildAppDataOperationsWithIdentifier:(id)a3 andDependencies:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[MSDTargetDevice sharedInstance];
  uint64_t v56 = [v8 demoUserHomePath];

  id v58 = objc_alloc_init((Class)NSMutableArray);
  id v9 = objc_alloc_init(MSDOperationContext);
  uint64_t v57 = v6;
  [(MSDOperationContext *)v9 setIdentifier:v6];
  if ([v7 count])
  {
    CFStringRef v73 = @"MSDApplicationDataPrepareOperation";
    id v10 = +[NSArray arrayWithObjects:&v73 count:1];
    uint64_t v11 = [(MSDOperationBuilder *)self sequentialGroupForIdentifiers:v10 andContext:v9];

    if (v11)
    {
      [v58 addObject:v11];
      long long v65 = 0u;
      long long v66 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      id v12 = v7;
      id v13 = [v12 countByEnumeratingWithState:&v63 objects:v72 count:16];
      if (!v13) {
        goto LABEL_49;
      }
      id v14 = v13;
      uint64_t v52 = *(void *)v64;
      uint64_t v55 = v11;
      v49 = v9;
      id v50 = v7;
      v51 = v12;
      while (1)
      {
        uint64_t v15 = 0;
        id v48 = v14;
        do
        {
          if (*(void *)v64 != v52) {
            objc_enumerationMutation(v12);
          }
          uint64_t v53 = v15;
          id v16 = *(void **)(*((void *)&v63 + 1) + 8 * v15);
          uint64_t v17 = [v12 objectForKey:v16];
          long long v18 = v16;
          if (!v17 || ![v17 count])
          {
            long long v19 = sub_100068600();
            if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_44;
            }
            *(_DWORD *)buf = 138543362;
            v68 = v18;
            long long v20 = v19;
            long long v21 = "No dependency listed under: %{public}@";
LABEL_15:
            uint32_t v22 = 12;
LABEL_16:
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, v21, buf, v22);
            goto LABEL_44;
          }
          if ([v18 isEqualToString:@"ProvisioningProfiles"])
          {
            long long v19 = sub_100068600();
            if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_44;
            }
            *(_WORD *)buf = 0;
            long long v20 = v19;
            long long v21 = "Skip app provisioning profile dependency.";
            uint32_t v22 = 2;
            goto LABEL_16;
          }
          if (([v18 isEqualToString:@"AppData"] & 1) != 0
            || ([v18 isEqualToString:@"ExtensionData"] & 1) != 0
            || ([v18 isEqualToString:@"GroupData"] & 1) != 0
            || ([v18 isEqualToString:@"UserData"] & 1) != 0
            || ([v18 isEqualToString:@"SharedAppData"] & 1) != 0)
          {
            long long v61 = 0u;
            long long v62 = 0u;
            long long v59 = 0u;
            long long v60 = 0u;
            long long v19 = v17;
            id v23 = [v19 countByEnumeratingWithState:&v59 objects:v71 count:16];
            if (v23)
            {
              id v24 = v23;
              id obj = v19;
              uint64_t v25 = *(void *)v60;
              while (2)
              {
                for (i = 0; i != v24; i = (char *)i + 1)
                {
                  if (*(void *)v60 != v25) {
                    objc_enumerationMutation(obj);
                  }
                  uint64_t v27 = *(const char **)(*((void *)&v59 + 1) + 8 * i);
                  uint64_t v28 = sub_100068600();
                  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138543618;
                    v68 = v27;
                    __int16 v69 = 2114;
                    v70 = v18;
                    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Creating operation sequence for app data: <Name = %{public}@, Type = %{public}@>", buf, 0x16u);
                  }

                  uint64_t v29 = [(MSDOperationBuilder *)self signedManifest];
                  id v30 = [v29 getManifestDataFromSection:v18 forIdentifier:v27];

                  if (!v30)
                  {
                    uint64_t v33 = sub_100068600();
                    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 136315394;
                      v68 = "-[MSDOperationBuilder buildAppDataOperationsWithIdentifier:andDependencies:]";
                      __int16 v69 = 2114;
                      v70 = (char *)v27;
                      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%s - Failed to retrieve master manifest data for %{public}@", buf, 0x16u);
                    }
                    goto LABEL_56;
                  }
                  uint64_t v31 = [(MSDOperationBuilder *)self signedManifest];
                  unsigned int v32 = [v31 isContainerizedComponent:v18];

                  if (v32) {
                    +[MSDContentFilesContext defaultContextForContainerizedAppDataItem:v27];
                  }
                  else {
                  uint64_t v33 = +[MSDContentFilesContext defaultContextForNonContainerizedAppDataItem:v27];
                  }
                  v34 = [[MSDManifest alloc] initWithDictionary:v30 andUserHomePath:v56];
                  [v33 setMasterManifest:v34];

                  [v33 setIdentifier:v27];
                  [v33 setContainerType:v18];
                  [v33 setVerifyFileHash:[(MSDOperationBuilder *)self verifyHashBeforeStaging]];
                  v35 = [(MSDOperationBuilder *)self signedManifest];
                  id v36 = [v35 getOriginServerFromSection:v18 forIdentifier:v27];
                  [v33 setOriginServer:v36];

                  v37 = [(MSDOperationBuilder *)self signedManifest];
                  long long v38 = [v37 getDataComponentRealSizeFromSection:v18 forIdentifier:v27];
                  [v33 setDiskSpacedRequired:v38];

                  [v33 setAppIdentifier:v57];
                  if ([(MSDOperationBuilder *)self forBackgroundDownload]) {
                    CFStringRef v39 = @"/private/var/mnt/com.apple.mobilestoredemo.snapshot";
                  }
                  else {
                    CFStringRef v39 = @"/";
                  }
                  [v33 setRootFileSystemPath:v39];
                  long long v40 = +[NSMutableArray arrayWithObjects:@"MSDContentFilesPrepareOperation", @"MSDContentFilesDownloadOperation", @"MSDContentFilesInstallOperation", 0];
                  if ([(MSDOperationBuilder *)self forBackgroundDownload]
                    && [(MSDOperationBuilder *)self disableBackgroundInstall])
                  {
                    [v40 removeLastObject];
                  }
                  id v41 = [(MSDOperationBuilder *)self sequentialGroupForIdentifiers:v40 andContext:v33];
                  uint64_t v11 = v55;
                  if (!v41)
                  {

LABEL_56:
                    uint64_t v44 = 0;
                    id v9 = v49;
                    id v7 = v50;
                    goto LABEL_57;
                  }
                  v42 = v41;
                  [v41 addDependency:v55];
                  [v58 addObject:v42];
                }
                id v24 = [obj countByEnumeratingWithState:&v59 objects:v71 count:16];
                if (v24) {
                  continue;
                }
                break;
              }
              long long v19 = obj;
              uint64_t v17 = obj;
              id v12 = v51;
              id v14 = v48;
            }
            else
            {
              uint64_t v17 = v19;
            }
          }
          else
          {
            long long v19 = sub_100068600();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v68 = v18;
              long long v20 = v19;
              long long v21 = "Ignore unrecognized app dependency: %{public}@";
              goto LABEL_15;
            }
          }
LABEL_44:

          uint64_t v15 = v53 + 1;
        }
        while ((id)(v53 + 1) != v14);
        id v43 = [v12 countByEnumeratingWithState:&v63 objects:v72 count:16];
        id v14 = v43;
        id v9 = v49;
        id v7 = v50;
        if (!v43)
        {
LABEL_49:

          uint64_t v44 = [[MSDOperationGroup alloc] initWithOperationGroups:v58];
          goto LABEL_57;
        }
      }
    }
    v47 = sub_100068600();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
      sub_1000CA448();
    }

    uint64_t v44 = 0;
  }
  else
  {
    CFStringRef v45 = sub_100068600();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v68 = (const char *)v6;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "No app dependencies for %{public}@; skip building AppData operations ...",
        buf,
        0xCu);
    }

    uint64_t v44 = objc_alloc_init(MSDOperationGroup);
  }
LABEL_57:

  return v44;
}

- (id)buildProvisioningProfileOperations:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v6 = v4;
  id v30 = [v6 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v30)
  {
    uint64_t v29 = *(void *)v32;
    id obj = v6;
    uint64_t v28 = v5;
    while (2)
    {
      for (i = 0; i != v30; i = (char *)i + 1)
      {
        if (*(void *)v32 != v29) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        id v9 = [(MSDOperationBuilder *)self signedManifest];
        id v10 = [v9 getManifestDataFromSection:@"ProvisioningProfiles" forIdentifier:v8];

        if (!v10)
        {
          id v12 = sub_100068600();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            uint64_t v36 = v8;
            __int16 v37 = 2114;
            CFStringRef v38 = @"ProvisioningProfiles";
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "ERROR - Missing data for profile:  %{public}@ under component:  %{public}@", buf, 0x16u);
          }
          goto LABEL_23;
        }
        if ([v10 count] != (id)1)
        {
          id v12 = sub_100068600();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
            sub_1000CA340();
          }
          goto LABEL_23;
        }
        uint64_t v11 = [v10 allKeys];
        id v12 = [v11 firstObject];

        id v13 = [v10 objectForKey:v12];
        id v14 = [v13 objectForKey:@"MSDManifestFileHash"];

        if (!v14)
        {
          uint64_t v25 = sub_100068600();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
            sub_1000CA2D0();
          }

          goto LABEL_23;
        }
        uint64_t v15 = objc_alloc_init(MSDInstallableFileContext);
        [(MSDOperationContext *)v15 setIdentifier:v8];
        [(MSDInstallableFileContext *)v15 setFileType:2];
        id v16 = [v14 hexStringRepresentation];
        [(MSDInstallableFileContext *)v15 setFileHash:v16];

        [(MSDInstallableFileContext *)v15 setVerifyFileHash:[(MSDOperationBuilder *)self verifyHashBeforeStaging]];
        uint64_t v17 = [(MSDOperationBuilder *)self signedManifest];
        long long v18 = [v17 getOriginServerFromSection:@"ProvisioningProfiles" forIdentifier:v8];
        [(MSDInstallableFileContext *)v15 setOriginServer:v18];

        long long v19 = [(MSDOperationBuilder *)self signedManifest];
        long long v20 = [v19 getDataComponentRealSizeFromSection:@"ProvisioningProfiles" forIdentifier:v8];
        [(MSDOperationContext *)v15 setDiskSpacedRequired:v20];

        long long v21 = +[NSMutableArray arrayWithObjects:@"MSDProvisioningProfilePrepareOperation", @"MSDInstallableFileDownloadOperation", 0];
        if (![(MSDOperationBuilder *)self forBackgroundDownload]) {
          [v21 addObject:@"MSDProvisioningProfileInstallOperation"];
        }
        uint64_t v22 = [(MSDOperationBuilder *)self sequentialOperationsForIdentifiers:v21 andContext:v15];
        id v5 = v28;
        if (!v22)
        {

          id v12 = v21;
LABEL_23:
          id v6 = obj;

          id v24 = 0;
          goto LABEL_24;
        }
        id v23 = (void *)v22;
        [v28 addObjectsFromArray:v22];
      }
      id v6 = obj;
      id v30 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
      if (v30) {
        continue;
      }
      break;
    }
  }

  id v24 = [[MSDOperationGroup alloc] initWithOperations:v5];
LABEL_24:

  return v24;
}

- (MSDSignedManifest)signedManifest
{
  return self->_signedManifest;
}

- (void)setSignedManifest:(id)a3
{
}

- (BOOL)forBackgroundDownload
{
  return self->_forBackgroundDownload;
}

- (void)setForBackgroundDownload:(BOOL)a3
{
  self->_forBackgroundDownload = a3;
}

- (BOOL)verifyHashBeforeStaging
{
  return self->_verifyHashBeforeStaging;
}

- (void)setVerifyHashBeforeStaging:(BOOL)a3
{
  self->_verifyHashBeforeStaging = a3;
}

- (BOOL)disableBackgroundInstall
{
  return self->_disableBackgroundInstall;
}

- (void)setDisableBackgroundInstall:(BOOL)a3
{
  self->_disableBackgroundInstall = a3;
}

- (void).cxx_destruct
{
}

@end