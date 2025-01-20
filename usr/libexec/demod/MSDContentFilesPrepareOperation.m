@interface MSDContentFilesPrepareOperation
- (BOOL)_compareManifests;
- (BOOL)_deteremineContentFilesInstallNecessity;
- (BOOL)_generateDeviceManifest;
- (BOOL)_prepareStagingArea;
- (BOOL)_processAlreadyHaveList;
- (BOOL)_restoreStashedStagingToSecondaryStaging;
- (id)methodSelectors;
@end

@implementation MSDContentFilesPrepareOperation

- (id)methodSelectors
{
  if (+[MSDOperationContext downloadOnly]
    && +[MSDHubFeatureFlags disableBackgroundInstall])
  {
    v2 = +[NSValue valueWithPointer:"_deteremineContentFilesInstallNecessity"];
    v3 = +[NSValue valueWithPointer:"_generateDeviceManifest"];
    v4 = +[NSValue valueWithPointer:"_compareManifests"];
    v5 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v2, v3, v4, 0);
  }
  else
  {
    v2 = +[NSValue valueWithPointer:"_deteremineContentFilesInstallNecessity"];
    v3 = +[NSValue valueWithPointer:"_prepareStagingArea"];
    v4 = +[NSValue valueWithPointer:"_generateDeviceManifest"];
    v6 = +[NSValue valueWithPointer:"_compareManifests"];
    v7 = +[NSValue valueWithPointer:"_processAlreadyHaveList"];
    v5 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v2, v3, v4, v6, v7, 0);
  }

  return v5;
}

- (BOOL)_deteremineContentFilesInstallNecessity
{
  v3 = [(MSDOperation *)self context];
  if ([v3 containerized])
  {
    v4 = [(MSDOperation *)self context];
    v5 = [v4 contentRootPath];

    if (!v5 && !+[MSDOperationContext downloadOnly])
    {
      v6 = sub_100068600();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = [(MSDOperation *)self context];
        v8 = [v7 identifier];
        int v15 = 138543362;
        v16 = v8;
        v9 = "No content root path found for containerized component: %{public}@";
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v15, 0xCu);

        goto LABEL_11;
      }
      goto LABEL_11;
    }
  }
  else
  {
  }
  v10 = +[MSDContentFilesContext processedContainers];
  v11 = [(MSDOperation *)self context];
  v12 = [v11 uniqueName];
  unsigned int v13 = [v10 containsObject:v12];

  if (v13)
  {
    v6 = sub_100068600();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = [(MSDOperation *)self context];
      v8 = [v7 uniqueName];
      int v15 = 138543362;
      v16 = v8;
      v9 = "Shared container is already installed: %{public}@";
      goto LABEL_10;
    }
LABEL_11:

    [(MSDOperation *)self setSkipped:1];
  }
  return 1;
}

- (BOOL)_prepareStagingArea
{
  v15.receiver = self;
  v15.super_class = (Class)MSDContentFilesPrepareOperation;
  if ([(MSDBasePrepareOperation *)&v15 _prepareStagingArea])
  {
    v3 = +[MSDHelperAgent sharedInstance];
    v4 = +[NSFileManager defaultManager];
    v5 = [(MSDOperation *)self context];
    v6 = [v5 stashedStagingRootPath];

    if (!+[MSDOperationContext downloadOnly]
      && [v4 fileExistsAtPath:v6])
    {
      v7 = sub_100068600();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v17 = v6;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Found container already stashed at: %{public}@", buf, 0xCu);
      }

      unsigned int v8 = [(MSDContentFilesPrepareOperation *)self _restoreStashedStagingToSecondaryStaging];
      if (os_variant_has_internal_content())
      {
        if ((v8 & 1) == 0)
        {
          v9 = +[MSDTestPreferences sharedInstance];
          unsigned int v10 = [v9 bailOnStashedStagingRestoreFailure];

          if (v10)
          {
            v11 = sub_100068600();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Treat stashed staging restore failure as fatal error!", buf, 2u);
            }

            BOOL v12 = 0;
            goto LABEL_16;
          }
          goto LABEL_15;
        }
LABEL_14:
        unsigned int v13 = [(MSDOperation *)self context];
        BOOL v12 = 1;
        [v13 setRestored:1];

        [(MSDOperation *)self setSkipped:1];
LABEL_16:

        return v12;
      }
      if (v8) {
        goto LABEL_14;
      }
    }
LABEL_15:
    BOOL v12 = 1;
    goto LABEL_16;
  }
  return 0;
}

- (BOOL)_generateDeviceManifest
{
  v3 = +[NSFileManager defaultManager];
  v4 = +[MSDHelperAgent sharedInstance];
  v5 = +[MSDTargetDevice sharedInstance];
  v6 = [(MSDOperation *)self context];
  v7 = [v6 contentRootPath];

  if (!v7)
  {
    if (+[MSDOperationContext downloadOnly])
    {
      v30 = objc_alloc_init(MSDManifest);
      v31 = [(MSDOperation *)self context];
      [v31 setDeviceManifest:v30];

      BOOL v29 = 1;
      goto LABEL_8;
    }
    v42 = sub_100068600();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
      sub_1000CB4FC(v42, v43, v44, v45, v46, v47, v48, v49);
    }

LABEL_18:
    BOOL v29 = 0;
    goto LABEL_8;
  }
  unsigned int v8 = [(MSDOperation *)self context];
  v9 = [v8 uniqueName];
  unsigned int v10 = [v9 stringByAppendingPathExtension:@"plist"];

  v11 = [@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/MSDWorkContainer/DeviceManifests" stringByAppendingPathComponent:v10];
  id v54 = 0;
  unsigned __int8 v12 = [v3 createDirectoryAtPath:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/MSDWorkContainer/DeviceManifests" withIntermediateDirectories:1 attributes:0 error:&v54];
  id v13 = v54;
  v14 = v13;
  if ((v12 & 1) == 0)
  {
    v33 = sub_100068600();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      sub_1000CB56C(v14, v33);
    }

    goto LABEL_18;
  }
  v50 = v13;
  v51 = v10;
  v53 = v3;
  objc_super v15 = [(MSDOperation *)self context];
  v16 = [v15 rootFileSystemPath];
  v17 = [(MSDOperation *)self context];
  v18 = [v17 contentRootPath];
  v19 = [v16 stringByAppendingPathComponent:v18];

  v20 = [(MSDOperation *)self context];
  v21 = [v20 identifier];
  v22 = [(MSDOperation *)self context];
  [v22 containerType];
  v24 = v23 = v4;
  v52 = v5;
  v25 = [v5 demoUserHomePath];
  v26 = v23;
  v27 = [v23 createDeviceManifestForComponent:v21 ofType:v24 withRootPath:v19 userHomePath:v25 andSavePath:v11];

  if (v27)
  {
    v28 = [(MSDOperation *)self context];
    [v28 setDeviceManifest:v27];

    BOOL v29 = 1;
  }
  else
  {
    v34 = sub_100068600();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      sub_1000CB534(v34, v35, v36, v37, v38, v39, v40, v41);
    }

    BOOL v29 = 0;
  }
  v5 = v52;
  v3 = v53;
  v4 = v26;
LABEL_8:

  return v29;
}

- (BOOL)_compareManifests
{
  v3 = [(MSDOperation *)self context];
  v4 = [v3 masterManifest];

  v28 = self;
  v5 = [(MSDOperation *)self context];
  v6 = [v5 deviceManifest];

  v31 = +[NSMutableArray array];
  v33 = +[NSMutableArray array];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = [v4 dict];
  id v34 = [obj countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (v34)
  {
    uint64_t v7 = *(void *)v36;
    uint64_t v30 = *(void *)v36;
    do
    {
      unsigned int v8 = 0;
      do
      {
        if (*(void *)v36 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v35 + 1) + 8 * (void)v8);
        v11 = [v6 dict];
        unsigned __int8 v12 = [v11 objectForKey:v9];

        if (!v12)
        {
          [v33 addObject:v9];
          goto LABEL_19;
        }
        id v13 = [v4 metadataForFile:v9];
        v14 = [v6 metadataForFile:v9];
        id v15 = [v13 compareWith:v14];
        if (v15 != 5)
        {
          id v17 = v15;
          v18 = v6;
          v19 = v4;
          v20 = sub_100068600();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            BOOL v29 = +[MSDFileMetadata compareResultToNSString:v17];
            *(_DWORD *)buf = 138543618;
            uint64_t v40 = v9;
            __int16 v41 = 2114;
            v42 = v29;
            _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "File meta data mismatch: %{public}@ (%{public}@)", buf, 0x16u);
          }
          if (v17 < 4)
          {
            [v33 addObject:v9];
            v16 = sub_100068600();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v40 = v9;
              _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "File found with incorrect metadata; Add to creation list: %{public}@",
                buf,
                0xCu);
            }
            v4 = v19;
            v6 = v18;
            uint64_t v7 = v30;
            goto LABEL_17;
          }
          v4 = v19;
          v6 = v18;
          uint64_t v7 = v30;
          if (v17 != 4) {
            goto LABEL_18;
          }
        }
        [v31 addObject:v9];
        v16 = sub_100068600();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v40 = v9;
          _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Add to already have list: %{public}@", buf, 0xCu);
        }
LABEL_17:

LABEL_18:
LABEL_19:

        unsigned int v8 = (char *)v8 + 1;
      }
      while (v34 != v8);
      id v21 = [obj countByEnumeratingWithState:&v35 objects:v43 count:16];
      id v34 = v21;
    }
    while (v21);
  }

  v22 = [(MSDOperation *)v28 context];
  [v22 setAlreadyHaveList:v31];

  v23 = +[NSMutableArray arrayWithCapacity:0];
  v24 = [(MSDOperation *)v28 context];
  [v24 setCloneFailedList:v23];

  v25 = [(MSDOperation *)v28 context];
  [v25 setCreationList:v33];

  v26 = [(MSDOperation *)v28 context];
  [v26 setDeviceManifest:0];

  return 1;
}

- (BOOL)_processAlreadyHaveList
{
  v3 = +[MSDContentCacheManager sharedInstance];
  uint64_t v49 = +[NSFileManager defaultManager];
  unsigned int v47 = +[MSDOperationContext downloadOnly];
  v4 = [(MSDOperation *)self context];
  v5 = [v4 contentRootPath];

  v6 = [(MSDOperation *)self context];
  uint64_t v7 = [v6 rootFileSystemPath];
  unsigned int v8 = [(MSDOperation *)self context];
  uint64_t v9 = v8;
  if (v5) {
    [v8 contentRootPath];
  }
  else {
  unsigned int v10 = [v8 pseudoContentRootPath];
  }
  uint64_t v48 = [v7 stringByAppendingPathComponent:v10];

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  v11 = [(MSDOperation *)self context];
  unsigned __int8 v12 = [v11 alreadyHaveList];

  id obj = v12;
  id v52 = [v12 countByEnumeratingWithState:&v53 objects:v59 count:16];
  if (v52)
  {
    char v14 = 0;
    uint64_t v51 = *(void *)v54;
    *(void *)&long long v13 = 138543362;
    long long v44 = v13;
    uint64_t v45 = self;
    uint64_t v46 = v3;
LABEL_6:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v54 != v51) {
        objc_enumerationMutation(obj);
      }
      uint64_t v16 = *(void *)(*((void *)&v53 + 1) + 8 * v15);
      v18 = [(MSDOperation *)self context];
      v19 = [v18 masterManifest];
      v20 = [v19 metadataForFile:v16];

      if (!v20)
      {
        __int16 v41 = sub_100068600();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
          sub_1000CB5F8();
        }

        goto LABEL_32;
      }
      id v21 = [v20 getFileType];
      unsigned int v22 = [v21 isEqualToString:NSFileTypeRegular];

      if (v22)
      {
        v23 = [v20 getHash];
        v24 = [v23 hexStringRepresentation];

        v25 = [v3 findFileInCache:v24];

        if (v25)
        {
          v26 = 0;
          v27 = 0;
        }
        else
        {
          v26 = [v48 stringByAppendingPathComponent:v16];
          v28 = [v3 fileCachePathFromSourcePath:v26 forBackgroundDownload:v47];
          v27 = [v28 stringByAppendingPathComponent:v24];

          BOOL v29 = [v20 getAccessControlList];
          if (v29)
          {
            uint64_t v30 = [v20 getAccessControlList];
            BOOL v31 = [v30 length] != 0;
          }
          else
          {
            BOOL v31 = 0;
          }

          if (![v49 isReadableFileAtPath:v26] || v31)
          {
            long long v37 = +[MSDHelperAgent sharedInstance];
            long long v38 = [v20 getHash];
            unsigned __int8 v39 = [v37 cloneFile:v26 to:v27 expectingHash:v38];

            if ((v39 & 1) == 0)
            {
LABEL_22:
              id v34 = sub_100068600();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v44;
                uint64_t v58 = v16;
                _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "Failed to clone file %{public}@; Adding it to creation list.",
                  buf,
                  0xCu);
              }

              self = v45;
              long long v35 = [(MSDOperation *)v45 context];
              long long v36 = [v35 cloneFailedList];
              [v36 addObject:v16];

              char v14 = 0;
              v3 = v46;
              goto LABEL_14;
            }
          }
          else
          {
            v32 = [v20 getHash];
            unsigned __int8 v33 = [v49 cloneFile:v26 to:v27 expectingHash:v32 correctOwnership:0];

            if ((v33 & 1) == 0) {
              goto LABEL_22;
            }
          }
          char v14 = 1;
          self = v45;
          v3 = v46;
        }
      }
      else
      {
        v26 = 0;
        v27 = 0;
        v24 = 0;
      }
LABEL_14:

      if (v52 == (id)++v15)
      {
        id v40 = [obj countByEnumeratingWithState:&v53 objects:v59 count:16];
        id v52 = v40;
        if (v40) {
          goto LABEL_6;
        }
        break;
      }
    }
  }
  char v14 = 1;
LABEL_32:

  v42 = [(MSDOperation *)self context];
  [v42 setAlreadyHaveList:0];

  return v14 & 1;
}

- (BOOL)_restoreStashedStagingToSecondaryStaging
{
  v3 = +[MSDHelperAgent sharedInstance];
  v4 = +[NSFileManager defaultManager];
  v5 = [(MSDOperation *)self context];
  v6 = [v5 stashedStagingRootPath];

  uint64_t v7 = [@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata" stringByAppendingPathComponent:@"/.MSDWorkContainer"];
  unsigned int v8 = [v7 stringByAppendingPathComponent:@"/MSD_stashed_staging"];
  uint64_t v9 = [(MSDOperation *)self context];
  unsigned int v10 = [v9 uniqueName];
  v11 = [v8 stringByAppendingPathComponent:v10];

  unsigned __int8 v12 = [(MSDOperation *)self context];
  long long v13 = [v12 pseudoContentRootPath];

  v62 = [v6 stringByAppendingPathComponent:v13];
  char v14 = [(MSDOperation *)self context];
  uint64_t v15 = [v14 secondaryStagingRootPath];

  uint64_t v16 = [(MSDOperation *)self context];
  id v17 = [v16 contentRootPath];
  uint64_t v59 = [v15 stringByAppendingPathComponent:v17];

  v18 = sub_100068600();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v67 = v6;
    __int16 v68 = 2114;
    v69 = v15;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Restoring files from: %{public}@ to: %{public}@", buf, 0x16u);
  }

  v60 = v15;
  v61 = v13;
  if (v13 && [v4 fileExistsAtPath:v62])
  {
    v19 = [(MSDOperation *)self context];
    v20 = [v19 contentRootPath];
    id v21 = [v6 stringByAppendingPathComponent:v20];

    unsigned int v22 = sub_100068600();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v67 = v62;
      __int16 v68 = 2114;
      v69 = v21;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Renaming pseudo content content root path from: %{public}@ to: %{public}@", buf, 0x16u);
    }

    v23 = [v21 stringByDeletingLastPathComponent];
    id v64 = 0;
    unsigned __int8 v24 = [v4 createDirectoryAtPath:v23 withIntermediateDirectories:1 attributes:0 error:&v64];
    id v25 = v64;

    if (v24)
    {
      id v63 = v25;
      v26 = v4;
      unsigned __int8 v27 = [v4 moveItemAtPath:v62 toPath:v21 error:&v63];
      id v28 = v63;

      if (v27)
      {

        v4 = v26;
        uint64_t v15 = v60;
        long long v13 = v61;
        goto LABEL_10;
      }
      long long v56 = sub_100068600();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
        sub_1000CB708(v28, v56);
      }
      id v25 = v28;
      v4 = v26;
    }
    else
    {
      long long v56 = sub_100068600();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
        sub_1000CB794();
      }
    }
    uint64_t v15 = v60;

    long long v13 = v61;
LABEL_27:
    long long v36 = (void *)v59;
LABEL_28:

    BOOL v39 = 0;
    goto LABEL_14;
  }
LABEL_10:
  if (([v3 moveStagingToFinal:v6 finalPath:v15] & 1) == 0)
  {
    id v21 = sub_100068600();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_1000CB6D0(v21, v49, v50, v51, v52, v53, v54, v55);
    }
    goto LABEL_27;
  }
  BOOL v29 = [(MSDOperation *)self context];
  uint64_t v30 = [v29 containerType];
  unsigned int v31 = [v30 isEqualToString:@"BackupData"];

  v32 = +[MSDHelperAgent sharedInstance];
  unsigned __int8 v33 = [(MSDOperation *)self context];
  id v34 = v33;
  if (!v31)
  {
    v42 = [v33 containerType];
    [(MSDOperation *)self context];
    v57 = v11;
    uint64_t v58 = v6;
    uint64_t v43 = v7;
    long long v44 = v3;
    v46 = uint64_t v45 = v4;
    unsigned int v47 = [v46 identifier];
    long long v36 = (void *)v59;
    unsigned __int8 v48 = [v32 restoreAppDataAttributesUnder:v59 containerType:v42 identifier:v47 manifestUID:&off_100162078 deviceUID:&off_100162078];

    v4 = v45;
    v3 = v44;
    uint64_t v7 = v43;
    v11 = v57;
    v6 = v58;

    if (v48) {
      goto LABEL_13;
    }
    goto LABEL_16;
  }
  id v35 = [v33 contentBeingInstalled];
  long long v36 = (void *)v59;
  unsigned __int8 v38 = [v32 restoreBackupAttributesUnder:v59 range:v35 manifestUID:v37 deviceUID:&off_100162078];

  if ((v38 & 1) == 0)
  {
LABEL_16:
    id v21 = sub_100068600();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_1000CB664();
    }
    uint64_t v15 = v60;
    long long v13 = v61;
    goto LABEL_28;
  }
LABEL_13:
  BOOL v39 = 1;
  uint64_t v15 = v60;
  long long v13 = v61;
LABEL_14:
  v65[0] = v6;
  v65[1] = v11;
  id v40 = +[NSArray arrayWithObjects:v65 count:2];
  [v3 removeWorkDirectories:v40];

  return v39;
}

@end