@interface MSDContentFilesInstallOperation
- (BOOL)_addToProcessedContainersIfNeeded;
- (BOOL)_constructStagingArea;
- (BOOL)_createWormholeInStagingToUserHome;
- (BOOL)_moveFilesFromStagingToSecondaryStaging;
- (BOOL)_patchBackupFolderIfNeeded;
- (BOOL)rollback;
- (MSDContentCacheManagerProtocol)contentCacheProtocol;
- (MSDContentFilesInstallOperation)initWithContext:(id)a3;
- (MSDContentFilesInstallOperation)initWithContext:(id)a3 andContentCacheManager:(id)a4 andTargetDevice:(id)a5;
- (MSDTargetDeviceProtocol)targetDeviceDelegate;
- (id)_retrieveContentRootPath;
- (id)methodSelectors;
- (int64_t)type;
- (void)setContentCacheProtocol:(id)a3;
- (void)setTargetDeviceDelegate:(id)a3;
@end

@implementation MSDContentFilesInstallOperation

- (MSDContentFilesInstallOperation)initWithContext:(id)a3
{
  id v4 = a3;
  v5 = +[MSDContentCacheManager sharedInstance];
  v6 = +[MSDTargetDevice sharedInstance];
  v7 = [(MSDContentFilesInstallOperation *)self initWithContext:v4 andContentCacheManager:v5 andTargetDevice:v6];

  return v7;
}

- (MSDContentFilesInstallOperation)initWithContext:(id)a3 andContentCacheManager:(id)a4 andTargetDevice:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)MSDContentFilesInstallOperation;
  v10 = [(MSDOperation *)&v13 initWithContext:a3];
  v11 = v10;
  if (v10)
  {
    [(MSDContentFilesInstallOperation *)v10 setContentCacheProtocol:v8];
    [(MSDContentFilesInstallOperation *)v11 setTargetDeviceDelegate:v9];
  }

  return v11;
}

- (id)methodSelectors
{
  v2 = +[NSValue valueWithPointer:"_createWormholeInStagingToUserHome"];
  v3 = +[NSValue valueWithPointer:"_constructStagingArea"];
  id v4 = +[NSValue valueWithPointer:"_patchBackupFolderIfNeeded"];
  v5 = +[NSValue valueWithPointer:"_moveFilesFromStagingToSecondaryStaging"];
  v6 = +[NSValue valueWithPointer:"_addToProcessedContainersIfNeeded"];
  v7 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v2, v3, v4, v5, v6, 0);

  return v7;
}

- (BOOL)rollback
{
  v3 = [(MSDOperation *)self context];
  id v4 = [v3 stagingRootPath];

  v5 = [(MSDOperation *)self context];
  v6 = [v5 secondaryStagingRootPath];

  v7 = +[MSDHelperAgent sharedInstance];
  unsigned __int8 v8 = [v7 removeWorkDirectory:v4];

  if ((v8 & 1) == 0)
  {
    objc_super v13 = sub_100068600();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  id v9 = +[MSDHelperAgent sharedInstance];
  unsigned __int8 v10 = [v9 removeWorkDirectory:v6];

  if ((v10 & 1) == 0)
  {
    objc_super v13 = sub_100068600();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
LABEL_8:
    }
      sub_1000D0A9C();
LABEL_9:

    BOOL v11 = 0;
    goto LABEL_4;
  }
  BOOL v11 = 1;
LABEL_4:

  return v11;
}

- (int64_t)type
{
  return 3;
}

- (BOOL)_createWormholeInStagingToUserHome
{
  v3 = +[NSFileManager defaultManager];
  id v4 = [(MSDContentFilesInstallOperation *)self targetDeviceDelegate];
  v5 = [v4 demoUserHomePath];

  v6 = [(MSDOperation *)self context];
  v7 = [v6 stagingRootPath];
  unsigned __int8 v8 = [v7 stringByAppendingPathComponent:v5];

  if (+[MSDOperationContext downloadOnly]) {
    id v9 = @"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata";
  }
  else {
    id v9 = v5;
  }
  unsigned __int8 v10 = [(__CFString *)v9 stringByAppendingPathComponent:@"/.MSDWorkContainer"];
  BOOL v11 = [v10 stringByAppendingPathComponent:@"/MSD_staging"];
  v12 = [(MSDOperation *)self context];
  objc_super v13 = [v12 uniqueName];
  v14 = [v11 stringByAppendingPathComponent:v13];

  v15 = [v10 stringByAppendingPathComponent:@"/MSD_secondary_staging"];
  v16 = [(MSDOperation *)self context];
  v17 = [v16 uniqueName];
  v18 = [v15 stringByAppendingPathComponent:v17];

  v19 = sub_100068600();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v39 = v8;
    __int16 v40 = 2114;
    v41 = v14;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Creating wormhole in staging from %{public}@ to %{public}@...", buf, 0x16u);
  }

  v20 = [v8 stringByDeletingLastPathComponent];
  id v37 = 0;
  unsigned __int8 v21 = [v3 createDirectoryAtPath:v20 withIntermediateDirectories:1 attributes:0 error:&v37];
  id v22 = v37;

  if ((v21 & 1) == 0)
  {
    v32 = sub_100068600();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      sub_1000D0CAC(v22);
    }
    goto LABEL_26;
  }
  id v36 = v22;
  unsigned __int8 v23 = [v3 createDirectoryAtPath:v14 withIntermediateDirectories:1 attributes:0 error:&v36];
  id v24 = v36;

  if ((v23 & 1) == 0)
  {
    v32 = sub_100068600();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      sub_1000D0C18((uint64_t)v14, v24);
    }
    goto LABEL_25;
  }
  id v35 = v24;
  unsigned __int8 v25 = [v3 createDirectoryAtPath:v18 withIntermediateDirectories:1 attributes:0 error:&v35];
  id v22 = v35;

  if ((v25 & 1) == 0)
  {
    v32 = sub_100068600();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      sub_1000D0C18((uint64_t)v18, v22);
    }
    goto LABEL_26;
  }
  v26 = [v3 destinationOfSymbolicLinkAtPath:v8 error:0];

  if (v26)
  {
    id v34 = v22;
    unsigned __int8 v27 = [v3 removeItemAtPath:v8 error:&v34];
    id v24 = v34;

    if (v27)
    {
      id v22 = v24;
      goto LABEL_12;
    }
    v32 = sub_100068600();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      sub_1000D0B94(v24);
    }
LABEL_25:
    id v22 = v24;
LABEL_26:

    BOOL v30 = 0;
    goto LABEL_14;
  }
LABEL_12:
  v28 = v22;
  id v33 = v22;
  unsigned __int8 v29 = [v3 createSymbolicLinkAtPath:v8 withDestinationPath:v14 error:&v33];
  id v22 = v33;

  if ((v29 & 1) == 0)
  {
    v32 = sub_100068600();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      sub_1000D0B10(v22);
    }
    goto LABEL_26;
  }
  BOOL v30 = 1;
LABEL_14:

  return v30;
}

- (BOOL)_constructStagingArea
{
  v2 = [(MSDOperation *)self context];
  v80 = [v2 stagingRootPath];

  v79 = [(MSDContentFilesInstallOperation *)self _retrieveContentRootPath];
  v85 = [v80 stringByAppendingPathComponent:v79];
  v3 = [(MSDOperation *)self context];
  id v4 = [v3 masterManifest];
  v5 = [v4 dict];
  v6 = [v5 allKeys];

  v7 = [(MSDOperation *)self context];
  v84 = [v7 masterManifest];

  v140[0] = 0;
  v140[1] = v140;
  v140[2] = 0x3032000000;
  v140[3] = sub_100061610;
  v140[4] = sub_100061620;
  id v141 = [(MSDContentFilesInstallOperation *)self contentCacheProtocol];
  uint64_t v134 = 0;
  v135 = &v134;
  uint64_t v136 = 0x3032000000;
  v137 = sub_100061610;
  v138 = sub_100061620;
  id v139 = +[NSFileManager defaultManager];
  v132[0] = 0;
  v132[1] = v132;
  v132[2] = 0x2020000000;
  char v133 = 0;
  unsigned __int8 v8 = [(MSDOperation *)self context];
  LOBYTE(v4) = [v8 verifyFileHash];

  char v133 = (char)v4;
  uint64_t v128 = 0;
  v129 = &v128;
  uint64_t v130 = 0x2020000000;
  char v131 = 1;
  uint64_t v122 = 0;
  v123 = &v122;
  uint64_t v124 = 0x3032000000;
  v125 = sub_100061610;
  v126 = sub_100061620;
  id v127 = 0;
  id v86 = objc_alloc_init((Class)NSMutableSet);
  uint64_t v116 = 0;
  v117 = &v116;
  uint64_t v118 = 0x3032000000;
  v119 = sub_100061610;
  v120 = sub_100061620;
  id v121 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v110 = 0;
  v111 = &v110;
  uint64_t v112 = 0x3032000000;
  v113 = sub_100061610;
  v114 = sub_100061620;
  id v115 = +[NSMutableDictionary dictionary];
  uint64_t v104 = 0;
  v105 = &v104;
  uint64_t v106 = 0x3032000000;
  v107 = sub_100061610;
  v108 = sub_100061620;
  id v109 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v98 = 0;
  v99 = &v98;
  uint64_t v100 = 0x3032000000;
  v101 = sub_100061610;
  v102 = sub_100061620;
  id v103 = +[NSMutableDictionary dictionary];
  long long v94 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  id obj = v6;
  id v9 = [obj countByEnumeratingWithState:&v94 objects:v147 count:16];
  if (v9)
  {
    uint64_t v83 = *(void *)v95;
    *(void *)&long long v10 = 138543362;
    long long v78 = v10;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v95 != v83) {
        objc_enumerationMutation(obj);
      }
      uint64_t v12 = *(void *)(*((void *)&v94 + 1) + 8 * v11);
      v14 = [v85 stringByAppendingPathComponent:v12];
      v15 = [v14 stringByDeletingLastPathComponent];
      v16 = [v84 metadataForFile:v12];
      v17 = v16;
      if (!v16) {
        break;
      }
      v18 = [v16 getFileType];
      [v86 addObject:v15];
      if ([v18 isEqualToString:NSFileTypeDirectory])
      {
        [v86 addObject:v14];
      }
      else
      {
        if ([v18 isEqualToString:NSFileTypeSymbolicLink])
        {
          [(id)v105[5] addObject:v14];
          v20 = (void *)v99[5];
          unsigned __int8 v21 = [v17 getTargetFile];
          [v20 setObject:v21 forKey:v14];
          goto LABEL_17;
        }
        if (![v18 isEqualToString:NSFileTypeRegular])
        {
          unsigned __int8 v21 = sub_100068600();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            uint64_t v144 = v12;
            __int16 v145 = 2114;
            v146 = v18;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Ignore path %{public}@ of unexpected file type %{public}@", buf, 0x16u);
          }
LABEL_17:
          int v19 = 0;
LABEL_18:

          goto LABEL_19;
        }
        [(id)v117[5] addObject:v14];
        id v22 = [v17 getFileSize];
        unsigned __int8 v23 = (void *)v111[5];
        if (v22)
        {
          unsigned __int8 v21 = [v17 getHash];
          id v24 = [v21 hexStringRepresentation];
          [v23 setObject:v24 forKey:v14];

          goto LABEL_17;
        }
        [(id)v111[5] setObject:@"ZERO_SIZE" forKey:v14];
      }
      int v19 = 0;
LABEL_19:

      if (!v17)
      {

        if (v19 == 6) {
          goto LABEL_54;
        }
        goto LABEL_29;
      }
      if (v9 == (id)++v11)
      {
        id v25 = [obj countByEnumeratingWithState:&v94 objects:v147 count:16];
        id v9 = v25;
        if (v25) {
          goto LABEL_3;
        }
        goto LABEL_27;
      }
    }
    unsigned __int8 v21 = sub_100068600();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = v78;
      uint64_t v144 = v12;
      _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Cannot find metadata for path %{public}@", buf, 0xCu);
    }
    v18 = 0;
    int v19 = 6;
    goto LABEL_18;
  }
LABEL_27:

LABEL_29:
  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  id v26 = v86;
  id v27 = [v26 countByEnumeratingWithState:&v90 objects:v142 count:16];
  if (v27)
  {
    uint64_t v28 = *(void *)v91;
    while (2)
    {
      unsigned __int8 v29 = 0;
      do
      {
        if (*(void *)v91 != v28) {
          objc_enumerationMutation(v26);
        }
        uint64_t v30 = *(void *)(*((void *)&v90 + 1) + 8 * (void)v29);
        if (([(id)v135[5] fileExistsAtPath:v30] & 1) != 0
          || (v32 = (void *)v135[5],
              id v33 = (id *)(v123 + 5),
              id v89 = (id)v123[5],
              unsigned __int8 v34 = [v32 createDirectoryAtPath:v30 withIntermediateDirectories:1 attributes:0 error:&v89], objc_storeStrong(v33, v89), *((unsigned char *)v129 + 24) = v34, (v34 & 1) != 0))
        {
          int v35 = 0;
          int v36 = 1;
        }
        else
        {
          id v37 = sub_100068600();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            v38 = [(id)v123[5] localizedDescription];
            *(_DWORD *)buf = 138543618;
            uint64_t v144 = v30;
            __int16 v145 = 2114;
            v146 = v38;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Could not create directory at %{public}@ - %{public}@", buf, 0x16u);
          }
          int v36 = 0;
          int v35 = 6;
        }
        if (!v36)
        {

          if (v35 == 6) {
            goto LABEL_54;
          }
          goto LABEL_46;
        }
        unsigned __int8 v29 = (char *)v29 + 1;
      }
      while (v27 != v29);
      id v39 = [v26 countByEnumeratingWithState:&v90 objects:v142 count:16];
      id v27 = v39;
      if (v39) {
        continue;
      }
      break;
    }
  }

LABEL_46:
  id v40 = [v105[5] count:v78];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100061628;
  block[3] = &unk_100152E90;
  block[4] = &v104;
  block[5] = &v98;
  block[6] = &v134;
  block[7] = &v122;
  block[8] = &v128;
  dispatch_apply((size_t)v40, 0, block);
  if (!*((unsigned char *)v129 + 24))
  {
    v56 = sub_100068600();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
      sub_1000D0D30(v56, v57, v58, v59, v60, v61, v62, v63);
    }
    goto LABEL_61;
  }
  id v41 = [(id)v117[5] count];
  v87[0] = _NSConcreteStackBlock;
  v87[1] = 3221225472;
  v87[2] = sub_100061798;
  v87[3] = &unk_100152EB8;
  v87[4] = &v116;
  v87[5] = &v110;
  v87[6] = &v134;
  v87[7] = &v122;
  v87[8] = v140;
  v87[9] = v132;
  v87[10] = &v128;
  dispatch_apply((size_t)v41, 0, v87);
  if (!*((unsigned char *)v129 + 24))
  {
    v56 = sub_100068600();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
      sub_1000D0D68(v56, v64, v65, v66, v67, v68, v69, v70);
    }
    goto LABEL_61;
  }
  if (!+[MSDOperationContext downloadOnly])
  {
    v42 = [(MSDOperation *)self context];
    v43 = [v42 containerType];
    unsigned int v44 = [v43 isEqualToString:@"BackupData"];

    v45 = +[MSDHelperAgent sharedInstance];
    [(MSDOperation *)self context];
    if (v44) {
      v46 = {;
    }
      id v47 = [v46 contentBeingInstalled];
      unsigned __int8 v49 = [v45 restoreBackupAttributesUnder:v85 range:v47 manifestUID:off_100162198 deviceUID:off_100162198];
      *((unsigned char *)v129 + 24) = v49;
    }
    else {
      v46 = {;
    }
      v50 = [v46 containerType];
      v51 = [(MSDOperation *)self context];
      v52 = [v51 identifier];
      unsigned __int8 v53 = [v45 restoreAppDataAttributesUnder:v85 containerType:v50 identifier:v52 manifestUID:&off_100162198 deviceUID:&off_100162198];
      *((unsigned char *)v129 + 24) = v53;
    }
  }
  if (!*((unsigned char *)v129 + 24))
  {
    v56 = sub_100068600();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
      sub_1000D0DA0(v56, v71, v72, v73, v74, v75, v76, v77);
    }
LABEL_61:
  }
LABEL_54:
  BOOL v54 = *((unsigned char *)v129 + 24) != 0;
  _Block_object_dispose(&v98, 8);

  _Block_object_dispose(&v104, 8);
  _Block_object_dispose(&v110, 8);

  _Block_object_dispose(&v116, 8);
  _Block_object_dispose(&v122, 8);

  _Block_object_dispose(&v128, 8);
  _Block_object_dispose(v132, 8);
  _Block_object_dispose(&v134, 8);

  _Block_object_dispose(v140, 8);
  return v54;
}

- (BOOL)_patchBackupFolderIfNeeded
{
  v3 = [(MSDOperation *)self context];
  id v4 = [v3 identifier];

  v5 = [(MSDOperation *)self context];
  v6 = [v5 containerType];

  if ([v6 isEqualToString:@"BackupData"]
    && [v4 hasSuffix:@"baseBackup"])
  {
    v7 = [(MSDContentFilesInstallOperation *)self targetDeviceDelegate];
    unsigned __int8 v8 = [(MSDOperation *)self context];
    id v9 = [v8 stagingRootPath];
    [v7 patchBackupFolderInStaging:v9];
  }
  if (!+[MSDOperationContext downloadOnly]
    && [v6 isEqualToString:@"BackupData"]
    && [v4 hasSuffix:@"greyMatter"])
  {
    +[MSDGreyMatterHelper purgeExistingAssets];
  }

  return 1;
}

- (BOOL)_moveFilesFromStagingToSecondaryStaging
{
  v3 = [(MSDOperation *)self context];
  id v4 = [v3 stagingRootPath];

  v5 = [(MSDOperation *)self context];
  v6 = [v5 secondaryStagingRootPath];

  v7 = sub_100068600();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543618;
    uint64_t v12 = v4;
    __int16 v13 = 2114;
    v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Moving files from %{public}@ to %{public}@.", (uint8_t *)&v11, 0x16u);
  }

  unsigned __int8 v8 = [(MSDContentFilesInstallOperation *)self targetDeviceDelegate];
  unsigned __int8 v9 = [v8 moveFilesToFinalDst:v4 finalPath:v6];

  return v9;
}

- (BOOL)_addToProcessedContainersIfNeeded
{
  v3 = +[MSDContentFilesContext processedContainers];
  id v4 = [(MSDOperation *)self context];
  v5 = [v4 uniqueName];

  if (([v3 containsObject:v5] & 1) == 0)
  {
    v6 = sub_100068600();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543362;
      unsigned __int8 v9 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Adding to processed containers: %{public}@", (uint8_t *)&v8, 0xCu);
    }

    [v3 addObject:v5];
  }

  return 1;
}

- (id)_retrieveContentRootPath
{
  v3 = [(MSDOperation *)self context];
  id v4 = [v3 contentRootPath];

  if (!v4)
  {
    v5 = [(MSDOperation *)self context];
    id v4 = [v5 pseudoContentRootPath];
  }

  return v4;
}

- (MSDContentCacheManagerProtocol)contentCacheProtocol
{
  return self->_contentCacheProtocol;
}

- (void)setContentCacheProtocol:(id)a3
{
}

- (MSDTargetDeviceProtocol)targetDeviceDelegate
{
  return self->_targetDeviceDelegate;
}

- (void)setTargetDeviceDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetDeviceDelegate, 0);

  objc_storeStrong((id *)&self->_contentCacheProtocol, 0);
}

@end