@interface MBFileScanner
+ (id)_stringValueForStats:(_MBFileScannerDomainStats *)a3;
+ (id)treeWithPaths:(id)a3;
- (BOOL)_shouldNotBackupFile:(id)a3 domain:(id)a4;
- (MBFileScanner)initWithDelegate:(id)a3 mode:(unint64_t)a4 enginePolicy:(unint64_t)a5 debugContext:(id)a6;
- (MBFileScannerDelegate)delegate;
- (NSSet)modifiedDomains;
- (id)_foundFile:(id)a3 snapshotPath:(id)a4 stats:(_MBFileScannerDomainStats *)a5;
- (id)_performSinglePassEnumerationForDomain:(id)a3 snapshotPath:(id)a4 relativePath:(id)a5 buffer:(id)a6 dirFd:(int)a7 direntCount:(unsigned int)a8 directoryPathStack:(id)a9 directoryCountStack:(id)a10 stats:(_MBFileScannerDomainStats *)a11;
- (id)_performTwoPassEnumerationForDomain:(id)a3 snapshotPath:(id)a4 relativePath:(id)a5 buffer:(id)a6 dirFd:(int)a7 direntCount:(unsigned int)a8 directoryPathStack:(id)a9 directoryCountStack:(id)a10 stats:(_MBFileScannerDomainStats *)a11;
- (id)_scanDirectory:(id)a3 domain:(id)a4 domainDirFd:(int)a5 snapshotPath:(id)a6 relativePath:(id)a7 depth:(int)a8 stats:(_MBFileScannerDomainStats *)a9;
- (id)_scanDomain:(id)a3 snapshotPath:(id)a4 stats:(_MBFileScannerDomainStats *)a5;
- (id)_scanFilesForDomain:(id)a3 snapshotPath:(id)a4 relativePath:(id)a5 stats:(_MBFileScannerDomainStats *)a6;
- (id)_scanFilesUsingGetattrlistbulkForDomain:(id)a3 snapshotPath:(id)a4 relativePath:(id)a5 stats:(_MBFileScannerDomainStats *)a6;
- (id)_scanFilesUsingReaddirForDomain:(id)a3 snapshotPath:(id)a4 relativePath:(id)a5 depth:(int)a6 stats:(_MBFileScannerDomainStats *)a7;
- (id)_scanTree:(id)a3 forDomain:(id)a4 snapshotPath:(id)a5 relativePath:(id)a6 stats:(_MBFileScannerDomainStats *)a7;
- (id)loggableStats;
- (id)scanDomain:(id)a3 snapshotMountPoint:(id)a4;
- (void)_detectModifiedDomain:(id)a3 relativePath:(id)a4 lastModified:(int64_t)a5;
- (void)_updateStats:(_MBFileScannerDomainStats *)a3 file:(id)a4;
- (void)cancel;
- (void)reset;
- (void)setDelegate:(id)a3;
@end

@implementation MBFileScanner

- (MBFileScanner)initWithDelegate:(id)a3 mode:(unint64_t)a4 enginePolicy:(unint64_t)a5 debugContext:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  if (!a4) {
    sub_10009A96C();
  }
  v12 = v11;
  v21.receiver = self;
  v21.super_class = (Class)MBFileScanner;
  v13 = [(MBFileScanner *)&v21 init];
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_delegate, v10);
    v14->_mode = a4;
    v14->_policy = a5;
    objc_storeStrong((id *)&v14->_debugContext, a6);
    v15 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    modifiedDomains = v14->_modifiedDomains;
    v14->_modifiedDomains = v15;

    v17 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    lastModifiedDateBySQLiteFileID = v14->_lastModifiedDateBySQLiteFileID;
    v14->_lastModifiedDateBySQLiteFileID = v17;

    v19 = (objc_class *)objc_opt_class();
    v14->_delegateImpOfFileScannerDidFindFile = class_getMethodImplementation(v19, "fileScanner:didFindFile:");
    v14->_delegateRespondsToFileScannerShouldExcludeFile = objc_opt_respondsToSelector() & 1;
  }

  return v14;
}

- (NSSet)modifiedDomains
{
  return (NSSet *)self->_modifiedDomains;
}

- (id)scanDomain:(id)a3 snapshotMountPoint:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((atomic_exchange((atomic_uchar *volatile)&self->_started, 1u) & 1) == 0)
  {
    *(_OWORD *)&self->_totalStats.totalFileSize = 0u;
    *(_OWORD *)&self->_totalStats.uint64_t maxFileSize = 0u;
    self->_totalStats.symLinkCount = 0;
    *(_OWORD *)&self->_totalStats.dirCount = 0u;
    *(_OWORD *)&self->_totalStats.rootCloneCount = 0u;
    *(_OWORD *)&self->_totalStats.uint64_t minFileSize = xmmword_1000B0F10;
    self->_startTime = (int64_t)[(MBDebugContext *)self->_debugContext time];
  }
  v9 = [v6 name];
  id v10 = [v6 rootPath];
  id v11 = [v6 volumeMountPoint];
  if (![v10 length])
  {
    v12 = MBGetDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      buf[0].i32[0] = 138412290;
      *(uint64_t *)((char *)buf[0].i64 + 4) = (uint64_t)v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "=scanning= Skipping domain \"%@\" with nil or empty root path", (uint8_t *)buf, 0xCu);
      _MBLog();
    }
  }
  buf[0].i64[0] = 0;
  memset(&buf[1], 0, 56);
  *(int64x2_t *)((char *)buf + 8) = (int64x2_t)xmmword_1000B0F10;
  v13 = MBGetDefaultLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    unint64_t mode = self->_mode;
    unint64_t policy = self->_policy;
    *(_DWORD *)v23 = 138544642;
    v24 = v9;
    __int16 v25 = 2112;
    v26 = v10;
    __int16 v27 = 2112;
    v28 = v11;
    __int16 v29 = 2112;
    id v30 = v7;
    __int16 v31 = 2048;
    unint64_t v32 = mode;
    __int16 v33 = 2048;
    unint64_t v34 = policy;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "=scanning= Scanning domain %{public}@ at %@ with mtpt %@ from snapshot %@ mode:0x%lx policy:0x%lx", v23, 0x3Eu);
    _MBLog();
  }

  v16 = [(MBFileScanner *)self _scanDomain:v6 snapshotPath:v7 stats:buf];
  v17 = MBGetDefaultLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = [(id)objc_opt_class() _stringValueForStats:buf];
    *(_DWORD *)v23 = 138543874;
    v24 = v9;
    __int16 v25 = 2112;
    v26 = v18;
    __int16 v27 = 2112;
    v28 = v16;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "=scanning= Finished scanning domain %{public}@ - %@: %@", v23, 0x20u);

    v22 = [(id)objc_opt_class() _stringValueForStats:buf];
    _MBLog();
  }
  uint64_t minFileSize = self->_totalStats.minFileSize;
  if (minFileSize >= buf[0].i64[1]) {
    uint64_t minFileSize = buf[0].i64[1];
  }
  self->_totalStats.totalFileSize += buf[0].i64[0];
  self->_totalStats.uint64_t minFileSize = minFileSize;
  uint64_t maxFileSize = self->_totalStats.maxFileSize;
  if (maxFileSize <= buf[1].i64[0]) {
    uint64_t maxFileSize = buf[1].i64[0];
  }
  self->_totalStats.uint64_t maxFileSize = maxFileSize;
  *(int64x2_t *)&self->_totalStats.fileCount = vaddq_s64(*(int64x2_t *)&self->_totalStats.fileCount, *(int64x2_t *)((char *)&buf[1] + 8));
  *(int64x2_t *)&self->_totalStats.fullCloneCount = vaddq_s64(*(int64x2_t *)&self->_totalStats.fullCloneCount, *(int64x2_t *)((char *)&buf[2] + 8));
  *(int64x2_t *)&self->_totalStats.hardLinkCount = vaddq_s64(*(int64x2_t *)&self->_totalStats.hardLinkCount, *(int64x2_t *)((char *)&buf[3] + 8));

  return v16;
}

+ (id)_stringValueForStats:(_MBFileScannerDomainStats *)a3
{
  v4 = +[NSByteCountFormatter stringFromByteCount:a3->totalFileSize countStyle:0];
  int64_t minFileSize = a3->minFileSize;
  if (minFileSize == 0x7FFFFFFFFFFFFFFFLL) {
    int64_t minFileSize = -1;
  }
  int64_t maxFileSize = a3->maxFileSize;
  if (maxFileSize == 0x8000000000000000) {
    int64_t maxFileSize = -1;
  }
  id v7 = +[NSString stringWithFormat:@"size:%lld (%@)/%lld/%lld, files:%llu, dirs:%llu, clones:%llu/%llu, hardLinks:%llu, symLinks:%llu", a3->totalFileSize, v4, minFileSize, maxFileSize, a3->fileCount, a3->dirCount, a3->fullCloneCount, a3->rootCloneCount, a3->hardLinkCount, a3->symLinkCount];

  return v7;
}

- (id)loggableStats
{
  v3 = objc_opt_class();

  return [v3 _stringValueForStats:&self->_totalStats];
}

- (void)cancel
{
  if ((atomic_exchange((atomic_uchar *volatile)&self->_canceled, 1u) & 1) == 0)
  {
    v3 = MBGetDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v5 = self;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "=scanning= Canceling %@", buf, 0xCu);
      _MBLog();
    }
  }
}

- (void)reset
{
  modifiedDomains = self->_modifiedDomains;
  self->_modifiedDomains = 0;

  v4 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  v5 = self->_modifiedDomains;
  self->_modifiedDomains = v4;

  lastModifiedDateBySQLiteFileID = self->_lastModifiedDateBySQLiteFileID;
  self->_lastModifiedDateBySQLiteFileID = 0;

  id v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  v8 = self->_lastModifiedDateBySQLiteFileID;
  self->_lastModifiedDateBySQLiteFileID = v7;

  self->_startTime = 0;
  atomic_store(0, (unsigned __int8 *)&self->_started);
}

- (void)_updateStats:(_MBFileScannerDomainStats *)a3 file:(id)a4
{
  id v5 = a4;
  unsigned int v6 = [v5 type];
  switch(v6)
  {
    case 0x4000u:
      unint64_t v14 = a3->dirCount + 1;
      a3->unint64_t dirCount = v14;
      if (__ROR8__(0xD288CE703AFB7E91 * v14, 4) <= 0x68DB8BAC710CBuLL)
      {
        v15 = MBGetDefaultLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t dirCount = a3->dirCount;
          v17 = [v5 domain];
          v18 = [v17 name];
          *(_DWORD *)buf = 134218242;
          unint64_t v32 = dirCount;
          __int16 v33 = 2114;
          unint64_t v34 = v18;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "=scanning= Found %llu dirs (%{public}@)", buf, 0x16u);

          v19 = [v5 domain];
          v20 = [v19 name];
LABEL_27:
          _MBLog();
        }
LABEL_28:
      }
      break;
    case 0xA000u:
      ++a3->symLinkCount;
      break;
    case 0x8000u:
      uint64_t v7 = (uint64_t)[v5 size];
      unint64_t v8 = v7;
      int64_t minFileSize = a3->minFileSize;
      if (minFileSize >= v7) {
        int64_t minFileSize = v7;
      }
      a3->totalFileSize += v7;
      a3->int64_t minFileSize = minFileSize;
      int64_t maxFileSize = a3->maxFileSize;
      unint64_t v11 = a3->fileCount + 1;
      if (maxFileSize <= v7) {
        int64_t maxFileSize = v7;
      }
      a3->int64_t maxFileSize = maxFileSize;
      a3->unint64_t fileCount = v11;
      if ([v5 isHardLink]) {
        ++a3->hardLinkCount;
      }
      if ([v5 isFullClone])
      {
        id v12 = [v5 inodeNumber];
        if (v12 == [v5 cloneID])
        {
          p_rootCloneCount = &a3->rootCloneCount;
        }
        else
        {
          if (![v5 isFullClone]) {
            goto LABEL_20;
          }
          p_rootCloneCount = &a3->fullCloneCount;
        }
        ++*p_rootCloneCount;
      }
LABEL_20:
      if (v8 >= 0x6FC23AC00)
      {
        objc_super v21 = MBGetDefaultLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v22 = [v5 absolutePath];
          v23 = [v5 domain];
          v24 = [v23 name];
          *(_DWORD *)buf = 134218498;
          unint64_t v32 = v8;
          __int16 v33 = 2114;
          unint64_t v34 = v22;
          __int16 v35 = 2114;
          v36 = v24;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "=scanning= Found large file (%lld) at %{public}@ (%{public}@)", buf, 0x20u);

          __int16 v25 = [v5 absolutePath];
          v26 = [v5 domain];
          id v30 = [v26 name];
          _MBLog();
        }
      }
      if (__ROR8__(0xD288CE703AFB7E91 * a3->fileCount, 4) <= 0x68DB8BAC710CBuLL)
      {
        v15 = MBGetDefaultLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t fileCount = a3->fileCount;
          v28 = [v5 domain];
          __int16 v29 = [v28 name];
          *(_DWORD *)buf = 134218242;
          unint64_t v32 = fileCount;
          __int16 v33 = 2114;
          unint64_t v34 = v29;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "=scanning= Found %llu files (%{public}@)", buf, 0x16u);

          v19 = [v5 domain];
          v20 = [v19 name];
          goto LABEL_27;
        }
        goto LABEL_28;
      }
      break;
  }
}

- (id)_scanDomain:(id)a3 snapshotPath:(id)a4 stats:(_MBFileScannerDomainStats *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 name];
  if ([v8 isUninstalledAppDomain])
  {
    unint64_t v11 = MBGetDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v19 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "=scanning= Not scanning uninstalled app domain %{public}@", buf, 0xCu);
      _MBLog();
    }

    id v12 = 0;
  }
  else
  {
    [(MBDebugContext *)self->_debugContext setValue:v10 forName:@"DomainName"];
    v13 = [v8 relativePathsToBackup];
    unsigned int v14 = [v13 containsObject:&stru_1000F43B0];

    if (v14)
    {
      id v12 = [(MBFileScanner *)self _scanFilesForDomain:v8 snapshotPath:v9 relativePath:&stru_1000F43B0 stats:a5];
    }
    else
    {
      v15 = [v8 relativePathsToBackup];
      v16 = +[MBFileScanner treeWithPaths:v15];

      id v12 = [(MBFileScanner *)self _scanTree:v16 forDomain:v8 snapshotPath:v9 relativePath:&stru_1000F43B0 stats:a5];
    }
    [v8 releaseCachedFileDescriptors];
  }

  return v12;
}

+ (id)treeWithPaths:(id)a3
{
  id v3 = a3;
  id v26 = (id)objc_opt_new();
  id v21 = [objc_alloc((Class)NSSortDescriptor) initWithKey:0 ascending:1];
  id v41 = v21;
  v4 = +[NSArray arrayWithObjects:&v41 count:1];
  v23 = v3;
  id v5 = [v3 sortedArrayUsingDescriptors:v4];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v5;
  id v27 = [obj countByEnumeratingWithState:&v33 objects:v40 count:16];
  if (v27)
  {
    uint64_t v25 = *(void *)v34;
    do
    {
      for (i = 0; i != v27; i = (char *)i + 1)
      {
        if (*(void *)v34 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        id v8 = v26;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        id v9 = [v7 pathComponents];
        id v10 = [v9 countByEnumeratingWithState:&v29 objects:v39 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v30;
          while (2)
          {
            v13 = 0;
            unsigned int v14 = v8;
            do
            {
              if (*(void *)v30 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v15 = *(void *)(*((void *)&v29 + 1) + 8 * (void)v13);
              v16 = [v14 objectForKeyedSubscript:v15, v20];
              if (v16)
              {
                id v8 = v16;
                if (![v16 count])
                {
                  v17 = MBGetDefaultLog();
                  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138543362;
                    v38 = v7;
                    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "=scanning= Ignoring %{public}@ since one of its ancestors is already included", buf, 0xCu);
                    v20 = v7;
                    _MBLog();
                  }

                  id v8 = v14;
                  goto LABEL_21;
                }
              }
              else
              {
                id v8 = (id)objc_opt_new();
                [v14 setObject:v8 forKeyedSubscript:v15];
              }

              v13 = (char *)v13 + 1;
              unsigned int v14 = v8;
            }
            while (v11 != v13);
            id v11 = [v9 countByEnumeratingWithState:&v29 objects:v39 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }
LABEL_21:
      }
      id v27 = [obj countByEnumeratingWithState:&v33 objects:v40 count:16];
    }
    while (v27);
  }

  return v26;
}

- (BOOL)_shouldNotBackupFile:(id)a3 domain:(id)a4
{
  id v6 = a3;
  id v112 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v8 = WeakRetained;
  if (!self->_delegateRespondsToFileScannerShouldExcludeFile
    || ([WeakRetained fileScanner:self shouldExcludeFile:v6] & 1) == 0)
  {
    unint64_t policy = self->_policy;
    if ((policy & 0x21) == 0x20) {
      sub_10009A998();
    }
    CFURLRef url = (CFURLRef)(policy & 0x22);
    BOOL v11 = url != 0;
    unint64_t v12 = policy & 0x2A;
    v13 = [v6 relativePath];
    char v14 = _os_feature_enabled_impl();
    if (v12 == 8 && (v14 & 1) == 0 && [v6 isDataless])
    {
      uint64_t v15 = MBGetDefaultLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v124 = v6;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "=scanning= Not backed up (SF_DATALESS): %@", buf, 0xCu);
LABEL_41:
        _MBLog();
        goto LABEL_42;
      }
      goto LABEL_42;
    }
    if ([v6 isCompressed])
    {
      if ([v6 isRegularFile])
      {
        [v6 absolutePath];
        char v16 = policy;
        unint64_t policy = (unint64_t) objc_claimAutoreleasedReturnValue();
        int v17 = open((const char *)[(id)policy fileSystemRepresentation], 256);

        LOBYTE(policy) = v16;
        if ((v17 & 0x80000000) == 0)
        {
          ssize_t v18 = pread(v17, &__buf, 1uLL, 0);
          uint64_t v19 = *__error();
          close(v17);
          if (v18 < 0)
          {
            v20 = MBGetDefaultLog();
            uint64_t v15 = v20;
            if ((v19 & 0xFFFFFFFD) == 9)
            {
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                *(void *)v124 = v6;
                *(_WORD *)&v124[8] = 1024;
                *(_DWORD *)&v124[10] = v19;
                _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "=scanning= Not backed up (UF_COMPRESSED): %@ (%{errno}d)", buf, 0x12u);
                goto LABEL_41;
              }
LABEL_42:

              id v32 = 0;
              BOOL v9 = 1;
LABEL_43:

              goto LABEL_44;
            }
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              id v21 = v15;
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                *(void *)v124 = v13;
                *(_WORD *)&v124[8] = 1024;
                *(_DWORD *)&v124[10] = v19;
                _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "=scanning= pread failed for %@: %{errno}d", buf, 0x12u);
              }

              v93 = v13;
              uint64_t v95 = v19;
              _MBLog();
            }
          }
          LOBYTE(policy) = v16;
        }
      }
    }
    v22 = [v6 domain:v93, v95];
    v23 = [v22 relativePathsNotToBackup];
    v24 = v13;
    uint64_t v25 = v23;
    v111 = v24;
    if (objc_msgSend(v23, "containsObject:")) {
      goto LABEL_27;
    }
    if (url)
    {
      context = [v6 domain];
      id v26 = [context relativePathsNotToBackupToDrive];
      if ([v26 containsObject:v111])
      {

LABEL_27:
        goto LABEL_39;
      }
      v103 = v26;
    }
    v108 = v8;
    char v105 = policy;
    if (v12 == 8)
    {
      v100 = [v6 domain];
      v101 = [v100 relativePathsNotToBackupToService];
      if ([v101 containsObject:v111])
      {
        unsigned __int8 v27 = 1;
        goto LABEL_36;
      }
    }
    unint64_t v28 = policy & 6;
    if (v28 == 2)
    {
      long long v29 = [v6 domain];
      long long v30 = [v29 relativePathsNotToBackupToLocal];
      if ([v30 containsObject:v111])
      {

        unsigned __int8 v27 = 1;
        id v8 = v108;
        if (v12 == 8) {
          goto LABEL_36;
        }
        goto LABEL_84;
      }
      v99 = v30;
      if ((policy & 0x20) == 0)
      {
        unsigned __int8 v27 = 0;
        id v8 = v108;
        goto LABEL_82;
      }
      v98 = v29;
    }
    else if ((policy & 0x20) == 0)
    {
      unsigned __int8 v27 = 0;
      id v8 = v108;
      goto LABEL_83;
    }
    v54 = [v6 domain];
    v55 = [v54 relativePathsNotToBackupInMegaBackup];
    unsigned __int8 v27 = [v55 containsObject:v111];

    BOOL v11 = 1;
    BOOL v56 = v28 == 2;
    id v8 = v108;
    long long v29 = v98;
    if (!v56)
    {
LABEL_83:
      if (v12 == 8)
      {
LABEL_36:

        long long v31 = v103;
        if (!v11) {
          goto LABEL_38;
        }
        goto LABEL_37;
      }
LABEL_84:
      long long v31 = v103;
      if (!v11)
      {
LABEL_38:

        if (v27)
        {
LABEL_39:
          uint64_t v15 = MBGetDefaultLog();
          v13 = v111;
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v124 = v6;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "=scanning= Not backed up (explicit): %@", buf, 0xCu);
            goto LABEL_41;
          }
          goto LABEL_42;
        }
        long long v34 = MBDeviceClass();
        v13 = v111;
        if ([v34 isEqualToString:@"AppleTV"])
        {
          long long v35 = [v6 domain];
          long long v36 = [v35 relativePathsNotToBackupAndRestoreToAppleTVs];
          unsigned int v37 = [v36 containsObject:v111];

          char v38 = v105;
          if (v37)
          {
            uint64_t v15 = MBGetDefaultLog();
            if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_42;
            }
            *(_DWORD *)buf = 138412290;
            *(void *)v124 = v6;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "=scanning= Not backed up (device explicit): %@", buf, 0xCu);
            goto LABEL_41;
          }
        }
        else
        {

          char v38 = v105;
        }
        id v39 = [v6 absolutePath];
        if (strlen((const char *)[v39 fileSystemRepresentation]) >= 0x3E6)
        {
          v40 = MBGetDefaultLog();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v124 = v39;
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "=scanning= WARNING: File name too long - excluding file and continuing with backup. Please contact the developer and include this log message. Path: %@", buf, 0xCu);
            _MBLog();
          }
          id v32 = 0;
          goto LABEL_56;
        }
        unsigned int v41 = [v6 hasXattrs];
        if (url)
        {
          unsigned int v102 = v41;
          id v104 = v39;
          v42 = [v112 relativePathsToIgnoreExclusionsForDrive];
          long long v119 = 0u;
          long long v120 = 0u;
          long long v121 = 0u;
          long long v122 = 0u;
          CFURLRef v43 = v42;
          id v44 = [(__CFURL *)v43 countByEnumeratingWithState:&v119 objects:v127 count:16];
          CFURLRef urla = v43;
          if (v44)
          {
            id v45 = v44;
            uint64_t v46 = *(void *)v120;
            while (2)
            {
              for (i = 0; i != v45; i = (char *)i + 1)
              {
                if (*(void *)v120 != v46) {
                  objc_enumerationMutation(v43);
                }
                v48 = *(__CFError **)(*((void *)&v119 + 1) + 8 * i);
                if ([(__CFError *)v48 hasSuffix:@"/", v94, v96])
                {
                  v49 = MBGetDefaultLog();
                  if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
                  {
                    v50 = v49;
                    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
                    {
                      v51 = [v112 name];
                      *(_DWORD *)buf = 138412546;
                      *(void *)v124 = v51;
                      *(_WORD *)&v124[8] = 2112;
                      *(void *)&v124[10] = v48;
                      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "=scanning= Found an invalid path in relativePathsToIgnoreExclusionsForDrive for %@: %@", buf, 0x16u);

                      v13 = v111;
                    }

                    v94 = [v112 name];
                    CFErrorRef v96 = v48;
                    _MBLog();

                    CFURLRef v43 = urla;
                  }
                }
                else if ([v13 hasPrefix:v48])
                {
                  id v52 = [v13 length];
                  id v53 = [(__CFError *)v48 length];
                  if (v52 == v53 || v53 < v52 && [v13 characterAtIndex:v53] == 47)
                  {

                    goto LABEL_98;
                  }
                }
              }
              id v45 = [(__CFURL *)v43 countByEnumeratingWithState:&v119 objects:v127 count:16];
              if (v45) {
                continue;
              }
              break;
            }
          }

          if (!v102)
          {
LABEL_98:
            v60 = MBGetDefaultLog();
            id v39 = v104;
            char v38 = v105;
            if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)v124 = v6;
              _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEBUG, "=scanning= Skipping exclusion check for %@", buf, 0xCu);
              v94 = v6;
              _MBLog();
            }
            id v32 = 0;
            goto LABEL_126;
          }

          id v39 = v104;
        }
        else if (!v41)
        {
          id v32 = 0;
          goto LABEL_127;
        }
        id v57 = [v6 isDirectory:v94];
        v58 = +[NSURL fileURLWithPath:v39 isDirectory:v57];
        id v118 = 0;
        id v117 = 0;
        unsigned int v59 = [v58 getResourceValue:&v118 forKey:v118];
        v60 = v118;
        id v61 = v117;
        CFURLRef urla = (CFURLRef)v58;
        if (v59)
        {
          if ([v60 BOOLValue])
          {
            if (v57 && [v39 hasSuffix:@"/Preferences"])
            {
              v63 = [v6 livePath];
              if ([(__CFError *)v63 isEqualToString:@"/var/mobile/Library/Preferences"])
              {
                contexta = v62;
                v64 = v63;
                CFURLRef v65 = +[NSURL fileURLWithPath:v63];

                id v116 = v61;
                CFURLRef urla = v65;
                unsigned __int8 v66 = [(__CFURL *)v65 setResourceValue:0 forKey:NSURLIsExcludedFromBackupKey error:&v116];
                id v32 = v116;

                v67 = MBGetDefaultLog();
                v68 = v67;
                if (v66)
                {
                  if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
                  {
                    v69 = v68;
                    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412546;
                      *(void *)v124 = NSURLIsExcludedFromBackupKey;
                      *(_WORD *)&v124[8] = 2112;
                      *(void *)&v124[10] = v64;
                      _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "=scanning= Removed %@ at %@", buf, 0x16u);
                    }

                    v94 = NSURLIsExcludedFromBackupKey;
                    CFErrorRef v96 = v64;
LABEL_175:
                    _MBLog();
                  }
                }
                else if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
                {
                  v90 = v68;
                  if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412802;
                    *(void *)v124 = NSURLIsExcludedFromBackupKey;
                    *(_WORD *)&v124[8] = 2112;
                    *(void *)&v124[10] = v64;
                    __int16 v125 = 2112;
                    id v126 = v32;
                    _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_ERROR, "=scanning= Failed to remove %@ at %@: %@", buf, 0x20u);
                  }

                  CFErrorRef v96 = v64;
                  id v97 = v32;
                  v94 = NSURLIsExcludedFromBackupKey;
                  goto LABEL_175;
                }

                v91 = MBGetDefaultLog();
                if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
                {
                  v92 = v91;
                  if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    *(void *)v124 = NSURLIsExcludedFromBackupKey;
                    *(_WORD *)&v124[8] = 2112;
                    *(void *)&v124[10] = v39;
                    _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_DEFAULT, "=scanning= Found %@ at %@ - ignoring", buf, 0x16u);
                  }

                  v94 = NSURLIsExcludedFromBackupKey;
                  CFErrorRef v96 = (CFErrorRef)v39;
                  _MBLog();
                }

LABEL_104:
                char v38 = v105;
                if ((v105 & 0x20) != 0) {
                  goto LABEL_111;
                }
LABEL_109:
                unint64_t v71 = self->_policy;
                if ((v38 & 2) == 0 || (v71 & 0x14) != 0)
                {
                  if ((v71 & 1) == 0)
                  {
LABEL_125:
                    v13 = v111;
LABEL_126:

                    id v8 = v108;
LABEL_127:
                    if (objc_msgSend(v6, "isRegularFile", v94, v96, v97))
                    {
                      if ((v38 & 8) != 0)
                      {
                        unsigned int v77 = [v6 protectionClass];
                        if (v77)
                        {
                          unsigned int v78 = v77;
                          v79 = 0;
                        }
                        else
                        {
                          id v113 = 0;
                          unsigned int v78 = +[MBProtectionClassUtils getWithPath:v39 error:&v113];
                          v79 = v113;
                        }
                        if ((v78 - 1 < 2
                           || v78 == 255
                           && +[MBError isError:withCode:](MBError, "isError:withCode:", v79, 24))&& [v6 isCompressed])
                        {
                          v80 = MBGetDefaultLog();
                          if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
                          {
                            *(_DWORD *)buf = 67109378;
                            *(_DWORD *)v124 = v78;
                            *(_WORD *)&v124[4] = 2112;
                            *(void *)&v124[6] = v6;
                            _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEFAULT, "=scanning= Not backed up (compressed, pc:%d): %@", buf, 0x12u);
                            _MBLog();
                          }

                          v40 = v79;
                          goto LABEL_56;
                        }
                      }
                      v81 = [v39 length];
                      if (v81 - (unsigned char *)[@".plist.1234567" length] >= 1)
                      {
                        v82 = [v39 substringFromIndex:];
                        unsigned int v83 = [v82 hasPrefix:@".plist."];

                        if (v83)
                        {
                          v40 = MBGetDefaultLog();
                          if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
                          {
                            *(_DWORD *)buf = 138412290;
                            *(void *)v124 = v39;
                            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "=scanning= Not backing up failed plist safe save: %@", buf, 0xCu);
LABEL_154:
                            _MBLog();
                            goto LABEL_56;
                          }
                          goto LABEL_56;
                        }
                      }
                      v84 = [v39 pathExtension];
                      if ([v84 isEqualToString:@"dat"])
                      {
                        unsigned int v85 = [v39 containsString:@"binarycookies_tmp"];

                        if (v85)
                        {
                          v40 = MBGetDefaultLog();
                          if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
                          {
                            *(_DWORD *)buf = 138412290;
                            *(void *)v124 = v39;
                            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "=scanning= Not backing up temporary cookie: %@", buf, 0xCu);
                            goto LABEL_154;
                          }
LABEL_56:

                          BOOL v9 = 1;
LABEL_156:

                          goto LABEL_43;
                        }
                      }
                      else
                      {
                      }
                      v86 = [v39 lastPathComponent];
                      unsigned int v87 = [v86 hasPrefix:@".dat.nosync"];

                      if (v87)
                      {
                        v40 = MBGetDefaultLog();
                        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
                        {
                          v40 = v40;
                          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
                          {
                            *(_DWORD *)buf = 138412290;
                            *(void *)v124 = v39;
                            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEBUG, "=scanning= Not backing up .dat.nosync file: %@", buf, 0xCu);
                          }

                          goto LABEL_154;
                        }
                        goto LABEL_56;
                      }
                    }
                    BOOL v9 = 0;
                    goto LABEL_156;
                  }
                  CFErrorRef error = 0;
                  CFBooleanRef __buf = 0;
                  v72 = (void *)_kCFURLIsExcludedFromCloudBackupKey;
                  if (CFURLCopyResourcePropertyForKey(urla, _kCFURLIsExcludedFromCloudBackupKey, &__buf, &error))
                  {
                    CFBooleanRef v88 = __buf;
                    if (__buf)
                    {
                      CFRelease(__buf);
                      char v38 = v105;
                      if (v88 == kCFBooleanTrue)
                      {
                        v74 = MBGetDefaultLog();
                        if (!os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT)) {
                          goto LABEL_117;
                        }
                        *(_DWORD *)buf = 138412290;
                        *(void *)v124 = v6;
                        _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "=scanning= Not backed up to iCloud (attribute): %@", buf, 0xCu);
                        goto LABEL_116;
                      }
                    }
                    goto LABEL_125;
                  }
                  v75 = MBGetDefaultLog();
                  if (!os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
                  {
LABEL_122:

                    char v38 = v105;
                    if (error) {
                      CFRelease(error);
                    }
                    goto LABEL_125;
                  }
                  v76 = v75;
                  if (!os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
                  {
LABEL_121:

                    v94 = v72;
                    CFErrorRef v96 = error;
                    _MBLog();
                    goto LABEL_122;
                  }
LABEL_120:
                  *(_DWORD *)buf = 138543618;
                  *(void *)v124 = v72;
                  *(_WORD *)&v124[8] = 2112;
                  *(void *)&v124[10] = error;
                  _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_ERROR, "=scanning= Error fetching value for property %{public}@: %@", buf, 0x16u);
                  goto LABEL_121;
                }
LABEL_111:
                CFErrorRef error = 0;
                CFBooleanRef __buf = 0;
                v72 = (void *)_kCFURLIsExcludedFromUnencryptedBackupKey;
                if (CFURLCopyResourcePropertyForKey(urla, _kCFURLIsExcludedFromUnencryptedBackupKey, &__buf, &error))
                {
                  CFBooleanRef v73 = __buf;
                  if (__buf)
                  {
                    CFRelease(__buf);
                    char v38 = v105;
                    if (v73 == kCFBooleanTrue)
                    {
                      v74 = MBGetDefaultLog();
                      if (!os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
                      {
LABEL_117:

                        id v61 = v32;
LABEL_169:

                        id v32 = v61;
                        id v8 = v108;
                        v40 = urla;
                        v13 = v111;
                        goto LABEL_56;
                      }
                      *(_DWORD *)buf = 138412290;
                      *(void *)v124 = v6;
                      _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "=scanning= Not backed up to unencrypted iTunes (attribute): %@", buf, 0xCu);
LABEL_116:
                      _MBLog();
                      goto LABEL_117;
                    }
                  }
                  goto LABEL_125;
                }
                v75 = MBGetDefaultLog();
                if (!os_log_type_enabled(v75, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_122;
                }
                v76 = v75;
                if (!os_log_type_enabled(v76, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_121;
                }
                goto LABEL_120;
              }
            }
            v89 = MBGetDefaultLog();
            if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)v124 = v6;
              _os_log_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_DEFAULT, "=scanning= Not backed up (attribute): %@", buf, 0xCu);
              _MBLog();
            }

            goto LABEL_169;
          }
        }
        else if (+[MBError codeForNSError:v61] != 4)
        {
          v70 = MBGetDefaultLog();
          char v38 = v105;
          if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)v124 = v6;
            *(_WORD *)&v124[8] = 2112;
            *(void *)&v124[10] = v61;
            _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "=scanning= Error getting NSURLIsExcludedFromBackupKey resource: %@: %@", buf, 0x16u);
            v94 = v6;
            CFErrorRef v96 = (CFErrorRef)v61;
            _MBLog();
          }

          id v32 = v61;
          if ((v105 & 0x20) != 0) {
            goto LABEL_111;
          }
          goto LABEL_109;
        }
        id v32 = v61;
        goto LABEL_104;
      }
LABEL_37:

      goto LABEL_38;
    }
LABEL_82:

    goto LABEL_83;
  }
  BOOL v9 = 1;
LABEL_44:

  return v9;
}

- (id)_scanTree:(id)a3 forDomain:(id)a4 snapshotPath:(id)a5 relativePath:(id)a6 stats:(_MBFileScannerDomainStats *)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  ssize_t v18 = v17;
  unsigned __int8 v19 = atomic_load((unsigned __int8 *)&self->_canceled);
  if (v19)
  {
    uint64_t v25 = +[MBError errorWithCode:202 format:@"File scan cancelled"];
    goto LABEL_6;
  }
  SEL v50 = a2;
  context = v17;
  id v20 = [(MBDebugContext *)self->_debugContext performSelectorForName:@"Scanning" withObject:self->_debugContext];
  [(MBDebugContext *)self->_debugContext setValue:v16 forName:@"RelativePath"];
  id v21 = +[MBFile fileWithDomain:v14 snapshotPath:v15 relativePath:v16];
  uint64_t v58 = 0;
  memset(v57, 0, sizeof(v57));
  v22 = [v21 absolutePath];
  BOOL v56 = 0;
  char v23 = sub_10008F178(v22, (uint64_t)v57, &v56);
  v24 = v56;

  if ((v23 & 1) == 0)
  {
    if (+[MBError isError:v24 withCode:4])
    {
      id v26 = MBGetDefaultLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        unsigned __int8 v27 = [v21 absolutePath];
        *(_DWORD *)buf = 138412290;
        id v61 = v27;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "=scanning= Doesn't exist: %@", buf, 0xCu);

        unint64_t v28 = [v21 absolutePath];
LABEL_18:
        _MBLog();
      }
    }
    else
    {
      if (!+[MBError isError:v24 withCode:241])
      {
        if (!+[MBError isError:v24 withCode:242])
        {
          v24 = v24;
          uint64_t v25 = v24;
          goto LABEL_20;
        }
        id v26 = MBGetDefaultLog();
        if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_19;
        }
        long long v31 = [v21 absolutePath];
        *(_DWORD *)buf = 138412546;
        id v61 = v31;
        __int16 v62 = 2112;
        v63 = v24;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "=scanning= Skipping due to unsupported mbNode type: %@ %@", buf, 0x16u);

        unint64_t v28 = [v21 absolutePath];
        goto LABEL_18;
      }
      id v26 = MBGetDefaultLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        long long v30 = [v21 absolutePath];
        *(_DWORD *)buf = 138412546;
        id v61 = v30;
        __int16 v62 = 2112;
        v63 = v24;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "=scanning= Skipping due to unsupported protection class: %@ %@", buf, 0x16u);

        unint64_t v28 = [v21 absolutePath];
        goto LABEL_18;
      }
    }
LABEL_19:

    uint64_t v25 = 0;
    goto LABEL_20;
  }
  [v21 setNode:v57];
  if (![(MBFileScanner *)self _shouldNotBackupFile:v21 domain:v14])
  {
    long long v29 = [(MBFileScanner *)self _foundFile:v21 snapshotPath:v15 stats:a7];

    if (v29)
    {
      v24 = v29;
      uint64_t v25 = v24;
      goto LABEL_20;
    }
    unsigned int v33 = [v21 isDirectory];
    long long v34 = v21;
    if (v33)
    {
      id v45 = v21;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v35 = [v13 allKeys];
      long long v36 = [v35 sortedArrayUsingComparator:&stru_1000F2468];

      id obj = v36;
      id v48 = [v36 countByEnumeratingWithState:&v52 objects:v59 count:16];
      if (v48)
      {
        v49 = v13;
        uint64_t v47 = *(void *)v53;
        while (2)
        {
          for (i = 0; i != v48; i = (char *)i + 1)
          {
            if (*(void *)v53 != v47) {
              objc_enumerationMutation(obj);
            }
            uint64_t v38 = *(void *)(*((void *)&v52 + 1) + 8 * i);
            id v39 = [v49 objectForKeyedSubscript:v38];
            v40 = [v16 stringByAppendingPathComponent:v38];
            unsigned int v41 = [v14 relativePathsNotToBackup];
            unsigned int v42 = [v41 containsObject:v40];

            if (v42)
            {
              id v44 = +[NSAssertionHandler currentHandler];
              [v44 handleFailureInMethod:v50, self, @"MBFileScanner.m", 497, @"Relative path to backup in domain is in set not to backup also: %@-%@", v14, v40 object file lineNumber description];
            }
            if ([v39 count])
            {
              uint64_t v43 = [(MBFileScanner *)self _scanTree:v39 forDomain:v14 snapshotPath:v15 relativePath:v40 stats:a7];
              if (v43) {
                goto LABEL_41;
              }
            }
            else
            {
              uint64_t v43 = [(MBFileScanner *)self _scanFilesForDomain:v14 snapshotPath:v15 relativePath:v40 stats:a7];
              if (v43)
              {
LABEL_41:
                uint64_t v25 = (void *)v43;

                goto LABEL_42;
              }
            }
          }
          id v48 = [obj countByEnumeratingWithState:&v52 objects:v59 count:16];
          if (v48) {
            continue;
          }
          break;
        }
        uint64_t v25 = 0;
LABEL_42:
        id v13 = v49;
      }
      else
      {
        uint64_t v25 = 0;
      }

      ssize_t v18 = context;
      long long v34 = v45;
    }
    else
    {
      uint64_t v25 = 0;
      ssize_t v18 = context;
    }

LABEL_6:
    goto LABEL_21;
  }
  uint64_t v25 = 0;
LABEL_20:

LABEL_21:

  return v25;
}

- (id)_scanFilesForDomain:(id)a3 snapshotPath:(id)a4 relativePath:(id)a5 stats:(_MBFileScannerDomainStats *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  unint64_t mode = self->_mode;
  if (mode)
  {
    id v14 = [(MBFileScanner *)self _scanFilesUsingReaddirForDomain:v10 snapshotPath:v11 relativePath:v12 depth:0 stats:a6];
    if (v14) {
      goto LABEL_7;
    }
    unint64_t mode = self->_mode;
  }
  if ((mode & 2) != 0)
  {
    id v14 = [(MBFileScanner *)self _scanFilesUsingGetattrlistbulkForDomain:v10 snapshotPath:v11 relativePath:v12 stats:a6];
  }
  else
  {
    id v14 = 0;
  }
LABEL_7:

  return v14;
}

- (id)_scanFilesUsingReaddirForDomain:(id)a3 snapshotPath:(id)a4 relativePath:(id)a5 depth:(int)a6 stats:(_MBFileScannerDomainStats *)a7
{
  uint64_t v8 = *(void *)&a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = (__CFString *)a5;
  unsigned __int8 v15 = atomic_load((unsigned __int8 *)&self->_canceled);
  if (v15)
  {
    ssize_t v18 = +[MBError errorWithCode:202 format:@"File scan cancelled"];
    goto LABEL_68;
  }
  if ((int)v8 >= 239)
  {
    int v17 = MBGetDefaultLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&uint8_t buf[4] = v8;
      *(_WORD *)&buf[8] = 2114;
      *(void *)&buf[10] = v14;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, "=scanning= Reached max directory depth (%d) under %{public}@", buf, 0x12u);
      _MBLog();
    }
    ssize_t v18 = 0;
    goto LABEL_67;
  }
  id v73 = 0;
  id v19 = [v12 cachedFileDescriptorWithSnapshotPath:v13 error:&v73];
  int v17 = v73;
  if (v19 == -1)
  {
    v24 = MBGetDefaultLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = [v12 rootPath];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v12;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v25;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&buf[24] = v17;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "=scanning= Unable to open domain directory at %@:%@: %@", buf, 0x20u);

      v63 = [v12 rootPath];
      _MBLog();
    }
    ssize_t v18 = 0;
    goto LABEL_66;
  }
  unint64_t v71 = v16;
  id v20 = [(MBDebugContext *)self->_debugContext performSelectorForName:@"Scanning" withObject:self->_debugContext];
  [(MBDebugContext *)self->_debugContext setValue:v14 forName:@"RelativePath"];
  v70 = +[MBFile fileWithDomain:v12 snapshotPath:v13 relativePath:v14];
  if (!v13) {
    goto LABEL_39;
  }
  id v21 = [v12 name];
  if (![v21 isEqualToString:@"HomeDomain"])
  {
LABEL_38:

    goto LABEL_39;
  }
  v22 = v21;
  unint64_t policy = self->_policy;
  if ((policy & 0x22) != 0)
  {
  }
  else
  {

    if ((policy & 4) == 0) {
      goto LABEL_39;
    }
  }
  if (([(__CFString *)v14 isEqualToString:@"Library/Application Support/CloudDocs/backup"] & 1) == 0)
  {
    id v16 = v71;
    if ([(__CFString *)v14 hasPrefix:@"Library/Application Support/CloudDocs/backup/"] & 1) != 0|| ([(__CFString *)v14 isEqualToString:@"Library/Application Support/FileProvider/backup"] & 1) != 0|| ([(__CFString *)v14 hasPrefix:@"Library/Application Support/FileProvider/backup/"])
    {
      ssize_t v18 = 0;
LABEL_22:
      v24 = v70;
      goto LABEL_66;
    }
    if (([(__CFString *)v14 isEqualToString:@"Library/Application Support/CloudDocs"] & 1) != 0|| [(__CFString *)v14 isEqualToString:@"Library/Application Support/FileProvider"])
    {
      id v21 = [(__CFString *)v14 stringByAppendingPathComponent:@"backup"];
      CFURLRef v65 = +[MBFile fileWithDomain:v12 snapshotPath:0 relativePath:v21];
      v68 = [v65 absolutePath];
      v74[0] = 0;
      id v26 = +[NSFileManager defaultManager];
      unsigned int v66 = [v26 fileExistsAtPath:v68 isDirectory:v74];
      int v64 = v74[0];

      unsigned __int8 v27 = MBGetDefaultLog();
      BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
      if (v66 && v64)
      {
        if (v28)
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v68;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "=scanning= Scanning the live path at %@", buf, 0xCu);
          unsigned int v59 = v68;
          _MBLog();
        }

        uint64_t v29 = [(MBFileScanner *)self _scanFilesUsingReaddirForDomain:v12 snapshotPath:0 relativePath:v21 depth:(v8 + 1) stats:a7];
        long long v30 = v21;
        id v16 = v71;
        if (v29)
        {
          ssize_t v18 = (MBError *)v29;
          long long v31 = v30;

          goto LABEL_22;
        }
        id v21 = v30;
        id v32 = MBGetDefaultLog();
        v67 = v32;
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v68;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "=scanning= Finished scanning the live path at %@", buf, 0xCu);
          goto LABEL_35;
        }
      }
      else
      {
        v67 = v27;
        if (v28)
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v68;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "=scanning= No directory found at live path %@", buf, 0xCu);
LABEL_35:
          unsigned int v33 = v65;
          unsigned int v59 = v68;
          _MBLog();
LABEL_37:

          goto LABEL_38;
        }
      }
      unsigned int v33 = v65;
      goto LABEL_37;
    }
LABEL_39:
    uint64_t v83 = 0;
    long long v81 = 0u;
    long long v82 = 0u;
    memset(buf, 0, sizeof(buf));
    v72 = v17;
    char v34 = sub_10008F27C((int)v19, v14, (uint64_t)buf, (MBError **)&v72);
    long long v35 = v72;

    if (v34)
    {
      [v70 setNode:buf];
      if ([(MBFileScanner *)self _shouldNotBackupFile:v70 domain:v12])
      {
        v69 = v35;
        ssize_t v18 = 0;
        id v16 = v71;
      }
      else
      {
        unsigned int v41 = [(MBFileScanner *)self _foundFile:v70 snapshotPath:v13 stats:a7];

        id v16 = v71;
        if (!v41)
        {
          if ([v70 isDirectory])
          {
            v51 = [(MBFileScanner *)self _scanDirectory:v70 domain:v12 domainDirFd:v19 snapshotPath:v13 relativePath:v14 depth:v8 stats:a7];
            long long v52 = v50;
            id v16 = v71;
          }
          else
          {
            v51 = 0;
          }
          ssize_t v18 = v51;
          v69 = v18;
          v24 = v70;
          goto LABEL_65;
        }
        ssize_t v18 = v41;
        v69 = v18;
      }
      v24 = v70;
LABEL_65:
      int v17 = v69;
      goto LABEL_66;
    }
    id v36 = +[MBError errnoForError:v35];
    unsigned int v37 = [(MBFileScanner *)self delegate];
    v69 = v35;
    if (v36 == 2)
    {
      uint64_t v38 = MBGetDefaultLog();
      id v39 = v38;
      if (v8)
      {
        v24 = v70;
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          v40 = [v70 absolutePath];
          *(_DWORD *)v74 = 138412290;
          v75 = v40;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "=scanning= Deleted while scanning: %@", v74, 0xCu);

          v60 = [v70 absolutePath];
          _MBLog();
        }
        [(MBDebugContext *)self->_debugContext setFlag:@"FileDeletedWhileScanning"];
        [(NSMutableSet *)self->_modifiedDomains addObject:v12];
      }
      else
      {
        v24 = v70;
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        {
          id v48 = [v70 absolutePath];
          *(_DWORD *)v74 = 138412290;
          v75 = v48;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEBUG, "=scanning= Doesn't exist: %@", v74, 0xCu);

          __int16 v62 = [v70 absolutePath];
          _MBLog();
        }
      }
      goto LABEL_62;
    }
    v24 = v70;
    if (+[MBError isError:v35 withCode:241])
    {
      unsigned int v42 = MBGetDefaultLog();
      if (!os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
LABEL_54:

LABEL_62:
        ssize_t v18 = 0;
LABEL_63:
        id v16 = v71;
LABEL_64:

        goto LABEL_65;
      }
      uint64_t v43 = [v70 absolutePath];
      *(_DWORD *)v74 = 138412546;
      v75 = v43;
      __int16 v76 = 2112;
      unsigned int v77 = (__CFString *)v69;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "=scanning= Skipping due to unsupported protection class: %@ %@", v74, 0x16u);

      id v44 = [v70 absolutePath];
      _MBLog();
    }
    else
    {
      unsigned int v45 = +[MBError isError:v35 withCode:242];
      id v16 = v71;
      if (v45)
      {
        uint64_t v46 = MBGetDefaultLog();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v47 = [v70 absolutePath];
          *(_DWORD *)v74 = 138412546;
          v75 = v47;
          __int16 v76 = 2112;
          unsigned int v77 = (__CFString *)v69;
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEBUG, "=scanning= Skipping unsupported mbNode type: %@ %@", v74, 0x16u);

          id v61 = [v70 absolutePath];
          _MBLog();

          id v16 = v71;
        }

        ssize_t v18 = 0;
        goto LABEL_64;
      }
      if ((objc_opt_respondsToSelector() & 1) == 0
        || ![v37 fileScanner:self failedToStatFile:v70 withErrno:v36])
      {
        long long v55 = [v70 absolutePath];
        BOOL v56 = [v70 domain];
        id v57 = [v56 volumeMountPoint];

        uint64_t v58 = MBGetDefaultLog();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v74 = 138412802;
          v75 = v55;
          __int16 v76 = 2112;
          unsigned int v77 = v14;
          __int16 v78 = 1024;
          int v79 = (int)v36;
          _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_ERROR, "=scanning= MBNodeForRelativePathAt() failed at %@ (%@): %{errno}d", v74, 0x1Cu);
          _MBLog();
        }

        sub_10001338C(v55, v13, v57, (int)v36, (uint64_t)"MBNodeForRelativePathAt");
        sub_100013544(v55, v13, v57, (int)v36, (uint64_t)"MBNodeForRelativePathAt");
        ssize_t v18 = +[MBError errorWithErrno:v36 code:101 path:v55 format:@"MBNodeForRelativePathAt() error"];

        goto LABEL_63;
      }
      unsigned int v42 = [v70 absolutePath];
      long long v53 = [v70 domain];
      id v44 = [v53 volumeMountPoint];

      long long v54 = MBGetDefaultLog();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v74 = 138412802;
        v75 = v42;
        __int16 v76 = 2112;
        unsigned int v77 = v14;
        __int16 v78 = 1024;
        int v79 = (int)v36;
        _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_INFO, "=scanning= Skipping file with MBNodeForRelativePathAt() failure %@ (%@): %{errno}d", v74, 0x1Cu);
        _MBLog();
      }

      sub_10001338C(v42, v13, v44, (int)v36, (uint64_t)"MBNodeForRelativePathAt");
      sub_100013544(v42, v13, v44, (int)v36, (uint64_t)"MBNodeForRelativePathAt");
    }

    goto LABEL_54;
  }
  ssize_t v18 = 0;
  v24 = v70;
  id v16 = v71;
LABEL_66:

LABEL_67:
LABEL_68:

  return v18;
}

- (id)_scanDirectory:(id)a3 domain:(id)a4 domainDirFd:(int)a5 snapshotPath:(id)a6 relativePath:(id)a7 depth:(int)a8 stats:(_MBFileScannerDomainStats *)a9
{
  BOOL v9 = *(NSObject **)&a8;
  id v14 = a3;
  id v106 = a4;
  id v110 = a6;
  id v15 = a7;
  if ([v15 length]) {
    id v16 = (const char *)[v15 fileSystemRepresentation];
  }
  else {
    id v16 = ".";
  }
  int v17 = openat(a5, v16, 256, 0);
  if (v17 < 0)
  {
    uint64_t v32 = *__error();
    unsigned int v33 = [(MBFileScanner *)self delegate];
    if (v32 == 2)
    {
      char v34 = MBGetDefaultLog();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        long long v35 = [v14 absolutePath];
        LODWORD(v117.d_ino) = 138412290;
        *(__uint64_t *)((char *)&v117.d_ino + 4) = (__uint64_t)v35;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "=scanning= Modification error when opening directory \"%@\" while scanning", (uint8_t *)&v117, 0xCu);

        CFBooleanRef v88 = [v14 absolutePath];
        _MBLog();
      }
      id v36 = v106;
      [(NSMutableSet *)self->_modifiedDomains addObject:v106];
      BOOL v9 = 0;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0
        && [v33 fileScanner:self failedToOpenFile:v14 withErrno:v32])
      {
        unsigned int v42 = MBGetDefaultLog();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          uint64_t v43 = [v14 absolutePath];
          LODWORD(v117.d_ino) = 138412802;
          *(__uint64_t *)((char *)&v117.d_ino + 4) = (__uint64_t)v43;
          WORD2(v117.d_seekoff) = 2080;
          *(__uint64_t *)((char *)&v117.d_seekoff + 6) = (__uint64_t)v16;
          *(_WORD *)&v117.d_name[1] = 1024;
          *(_DWORD *)&v117.d_name[3] = v32;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "=scanning= Skipping file with openat failure %@ (%s): %{errno}d", (uint8_t *)&v117, 0x1Cu);

          v90 = [v14 absolutePath];
          _MBLog();
        }
        BOOL v9 = 0;
      }
      else
      {
        v49 = MBGetDefaultLog();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          SEL v50 = [v14 absolutePath];
          LODWORD(v117.d_ino) = 138412802;
          *(__uint64_t *)((char *)&v117.d_ino + 4) = (__uint64_t)v50;
          WORD2(v117.d_seekoff) = 2080;
          *(__uint64_t *)((char *)&v117.d_seekoff + 6) = (__uint64_t)v16;
          *(_WORD *)&v117.d_name[1] = 1024;
          *(_DWORD *)&v117.d_name[3] = v32;
          _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "=scanning= openat failed at %@ (%s): %{errno}d", (uint8_t *)&v117, 0x1Cu);

          v92 = [v14 absolutePath];
          _MBLog();
        }
        v51 = [v14 absolutePath];
        BOOL v9 = +[MBError errorWithErrno:v32 code:101 path:v51 format:@"open error"];

        long long v52 = [v14 absolutePath];
        sub_1000111EC(v52);
      }
      id v36 = v106;
    }
    goto LABEL_65;
  }
  int v18 = v17;
  int v103 = a5;
  if (v110) {
    goto LABEL_6;
  }
  memset(&v117, 0, 144);
  if (fstat(v17, (stat *)&v117))
  {
    uint64_t v37 = *__error();
    uint64_t v38 = [(MBFileScanner *)self delegate];
    id v36 = v106;
    if (v37 == 2)
    {
      id v39 = MBGetDefaultLog();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        v40 = [v14 absolutePath];
        *(_DWORD *)buf = 138412290;
        *(void *)long long v119 = v40;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "=scanning= Modification error when stating directory \"%@\" while scanning", buf, 0xCu);

        v89 = [v14 absolutePath];
        _MBLog();
      }
      [(NSMutableSet *)self->_modifiedDomains addObject:v106];
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0
        || ![v38 fileScanner:self failedToStatFile:v14 withErrno:v37])
      {
        v75 = MBGetDefaultLog();
        if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
        {
          __int16 v76 = [v14 absolutePath];
          *(_DWORD *)buf = 138412802;
          *(void *)long long v119 = v76;
          *(_WORD *)&v119[8] = 2080;
          *(void *)&v119[10] = v16;
          *(_WORD *)&v119[18] = 1024;
          *(_DWORD *)&v119[20] = v37;
          _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_ERROR, "=scanning= fstat failed at %@ (%s): %{errno}d", buf, 0x1Cu);

          id v97 = [v14 absolutePath];
          _MBLog();
        }
        unsigned int v77 = [v14 absolutePath];
        unsigned int v41 = +[MBError errorWithErrno:v37 code:101 path:v77 format:@"stat error"];

        goto LABEL_103;
      }
      id v73 = MBGetDefaultLog();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
      {
        v74 = [v14 absolutePath];
        *(_DWORD *)buf = 138412802;
        *(void *)long long v119 = v74;
        *(_WORD *)&v119[8] = 2080;
        *(void *)&v119[10] = v16;
        *(_WORD *)&v119[18] = 1024;
        *(_DWORD *)&v119[20] = v37;
        _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_INFO, "=scanning= Skipping file with fstat failure %@ (%s): %{errno}d", buf, 0x1Cu);

        CFErrorRef v96 = [v14 absolutePath];
        _MBLog();
      }
    }
    unsigned int v41 = 0;
LABEL_103:
    close(v18);
    BOOL v9 = v41;

    goto LABEL_104;
  }
  id d_seekoff = (id)v117.d_seekoff;
  if (d_seekoff != [v14 inodeNumber])
  {
    v69 = MBGetDefaultLog();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
    {
      v70 = [v14 absolutePath];
      *(_DWORD *)buf = 138412290;
      *(void *)long long v119 = v70;
      _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "=scanning= Modification error when opening directory \"%@\" while scanning", buf, 0xCu);

      v94 = [v14 absolutePath];
      _MBLog();
    }
    id v36 = v106;
    [(NSMutableSet *)self->_modifiedDomains addObject:v106];
    close(v18);
LABEL_121:
    BOOL v9 = 0;
    goto LABEL_105;
  }
LABEL_6:
  id v104 = +[NSMutableArray array];
  id v19 = fdopendir(v18);
  if (!v19)
  {
    uint64_t v44 = *__error();
    unsigned int v45 = MBGetDefaultLog();
    uint64_t v46 = v45;
    if (v44 == 2)
    {
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v47 = [v14 absolutePath];
        LODWORD(v117.d_ino) = 138412290;
        *(__uint64_t *)((char *)&v117.d_ino + 4) = (__uint64_t)v47;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "=scanning= Modification error when opening directory \"%@\" while scanning", (uint8_t *)&v117, 0xCu);

        v91 = [v14 absolutePath];
        _MBLog();
      }
      id v36 = v106;
      [(NSMutableSet *)self->_modifiedDomains addObject:v106];
      id v48 = 0;
    }
    else
    {
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        unint64_t v71 = [v14 absolutePath];
        LODWORD(v117.d_ino) = 138412802;
        *(__uint64_t *)((char *)&v117.d_ino + 4) = (__uint64_t)v71;
        WORD2(v117.d_seekoff) = 2080;
        *(__uint64_t *)((char *)&v117.d_seekoff + 6) = (__uint64_t)v16;
        *(_WORD *)&v117.d_name[1] = 1024;
        *(_DWORD *)&v117.d_name[3] = v44;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "=scanning= fdopendir failed at %@ (%s): %{errno}d", (uint8_t *)&v117, 0x1Cu);

        uint64_t v95 = [v14 absolutePath];
        _MBLog();
      }
      v72 = [v14 absolutePath];
      id v48 = +[MBError errorWithErrno:v44 code:101 path:v72 format:@"fdopendir error"];

      id v36 = v106;
    }
    close(v18);
LABEL_92:
    BOOL v9 = v48;

LABEL_104:
    goto LABEL_105;
  }
  id v20 = v19;
  unsigned int v102 = (char *)v16;
  v108 = v15;
  unsigned int v21 = 0;
  char v105 = 0;
  unsigned int v107 = v9 + 1;
  while (1)
  {
    memset(&v117, 0, 512);
    v115 = 0;
    int v23 = readdir_r(v20, &v117, &v115);
    if (v23) {
      break;
    }
    if (!v115) {
      goto LABEL_69;
    }
    if (*(unsigned __int16 *)v117.d_name != 46
      && *(unsigned __int16 *)v117.d_name ^ 0x2E2E | v117.d_name[2])
    {
      ++v21;
      BOOL v9 = +[NSString mb_stringWithFileSystemRepresentation:v117.d_name];
      if (v9)
      {
        if (v117.d_type == 4)
        {
          v24 = [v108 stringByAppendingPathComponent:v9];
          uint64_t v25 = [(MBFileScanner *)self _scanFilesUsingReaddirForDomain:v106 snapshotPath:v110 relativePath:v24 depth:v107 stats:a9];

          if (v25)
          {
            int v26 = 39;
            char v105 = (void *)v25;
LABEL_34:

            goto LABEL_35;
          }
          char v105 = 0;
        }
        else
        {
          [v104 addObject:v9];
        }
        HIDWORD(v30) = 989560465 * v21;
        LODWORD(v30) = 989560465 * v21;
        if ((v30 >> 4) > 0x68DB8)
        {
          int v26 = 0;
          goto LABEL_34;
        }
        unsigned __int8 v27 = MBGetDefaultLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          long long v31 = [v106 name];
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)long long v119 = v21;
          *(_WORD *)&v119[4] = 2082;
          *(void *)&v119[6] = v102;
          *(_WORD *)&v119[14] = 2114;
          *(void *)&v119[16] = v31;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "=scanning= Found %u items under %{public}s (%{public}@)", buf, 0x1Cu);

          uint64_t v29 = [v106 name];
          _MBLog();
          int v26 = 0;
LABEL_32:
        }
        else
        {
          int v26 = 0;
        }
LABEL_33:

        goto LABEL_34;
      }
      unsigned __int8 v27 = +[NSData dataWithBytes:v117.d_name length:v117.d_namlen];
      BOOL v28 = MBGetDefaultLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)long long v119 = v27;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "=scanning= Unexpected file name: %@", buf, 0xCu);
        _MBLog();
      }

      if (sub_100092304())
      {
        uint64_t v29 = MBGetDefaultLog();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)long long v119 = v27;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_FAULT, "=scanning= Unexpected file name: %@", buf, 0xCu);
          goto LABEL_22;
        }
      }
      else
      {
        if (dword_100113018)
        {
          int v26 = 38;
          goto LABEL_33;
        }
        if (atomic_fetch_add_explicit(&dword_100113018, 1u, memory_order_relaxed))
        {
          int v26 = 38;
          goto LABEL_33;
        }
        uint64_t v29 = MBGetDefaultLog();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_FAULT, "=scanning= =scanning= Unexpected file name", buf, 2u);
LABEL_22:
          _MBLog();
        }
      }
      int v26 = 38;
      goto LABEL_32;
    }
    int v26 = 38;
LABEL_35:
    if (v26 == 39) {
      goto LABEL_70;
    }
  }
  int v53 = v23;
  long long v54 = MBGetDefaultLog();
  if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
  {
    long long v55 = [v14 absolutePath];
    *(_DWORD *)buf = 138412546;
    *(void *)long long v119 = v55;
    *(_WORD *)&v119[8] = 1024;
    *(_DWORD *)&v119[10] = v53;
    _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "=scanning= readdir_r failed at %@: %d", buf, 0x12u);

    v93 = [v14 absolutePath];
    _MBLog();
  }
  uint64_t v56 = *__error();
  id v57 = [v14 absolutePath];
  BOOL v9 = +[MBError errorWithErrno:v56 code:101 path:v57 format:@"readdir error"];

  char v105 = v9;
LABEL_69:
LABEL_70:
  id v15 = v108;
  if (v21 >> 4 >= 0x271)
  {
    BOOL v9 = MBGetDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v58 = [v106 name];
      LODWORD(v117.d_ino) = 67109634;
      HIDWORD(v117.d_ino) = v21;
      LOWORD(v117.d_seekoff) = 2082;
      *(__uint64_t *)((char *)&v117.d_seekoff + 2) = (__uint64_t)v102;
      v117.d_namlen = 2114;
      *(void *)&v117.d_type = v58;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "=scanning= Found a total of %u items under %{public}s (%{public}@)", (uint8_t *)&v117, 0x1Cu);

      v101 = [v106 name];
      _MBLog();
    }
  }
  closedir(v20);
  id v48 = v105;
  id v36 = v106;
  if (v105) {
    goto LABEL_92;
  }
  [v104 sortUsingComparator:&stru_1000F2488];
  long long v113 = 0u;
  long long v114 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  id v59 = v104;
  v60 = [v59 countByEnumeratingWithState:&v111 objects:v116 count:16];
  if (v60)
  {
    BOOL v9 = v60;
    uint64_t v61 = *(void *)v112;
    while (2)
    {
      for (i = 0; i != v9; i = ((char *)i + 1))
      {
        if (*(void *)v112 != v61) {
          objc_enumerationMutation(v59);
        }
        uint64_t v63 = *(void *)(*((void *)&v111 + 1) + 8 * i);
        CFURLRef v65 = [v108 stringByAppendingPathComponent:v63];
        unsigned int v66 = [(MBFileScanner *)self _scanFilesUsingReaddirForDomain:v106 snapshotPath:v110 relativePath:v65 depth:v107 stats:a9];
        if (v66)
        {
          BOOL v9 = v66;

          int v67 = 1;
          goto LABEL_99;
        }
      }
      BOOL v9 = [v59 countByEnumeratingWithState:&v111 objects:v116 count:16];
      if (v9) {
        continue;
      }
      break;
    }
    int v67 = 0;
LABEL_99:
    id v15 = v108;
  }
  else
  {
    int v67 = 0;
  }

  if (!v67) {
    BOOL v9 = 0;
  }
  if (v110 || (v67 & 1) != 0) {
    goto LABEL_105;
  }
  memset(&v117, 0, 144);
  if (!fstatat(v103, v102, (stat *)&v117, 32))
  {
    id v81 = (id)v117.d_seekoff;
    if (v81 == [v14 inodeNumber])
    {
      [(MBFileScanner *)self _detectModifiedDomain:v106 relativePath:v15 lastModified:*(void *)&v117.d_name[27]];
    }
    else
    {
LABEL_118:
      long long v82 = MBGetDefaultLog();
      if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v83 = [v14 absolutePath];
        *(_DWORD *)buf = 138412290;
        *(void *)long long v119 = v83;
        _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEFAULT, "=scanning= Deleted/modified while scanning: %@", buf, 0xCu);

        v98 = [v14 absolutePath];
        _MBLog();
      }
      [(MBDebugContext *)self->_debugContext setFlag:@"FileDeletedWhileScanning"];
      [(NSMutableSet *)self->_modifiedDomains addObject:v106];
    }
    goto LABEL_121;
  }
  uint64_t v79 = *__error();
  v80 = [(MBFileScanner *)self delegate];
  unsigned int v33 = v80;
  if (v79 == 2)
  {

    goto LABEL_118;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [v33 fileScanner:self failedToStatFile:v14 withErrno:v79])
  {
    v84 = MBGetDefaultLog();
    if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
    {
      unsigned int v85 = [v14 absolutePath];
      *(_DWORD *)buf = 138412802;
      *(void *)long long v119 = v85;
      *(_WORD *)&v119[8] = 2080;
      *(void *)&v119[10] = v102;
      *(_WORD *)&v119[18] = 1024;
      *(_DWORD *)&v119[20] = v79;
      _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_INFO, "=scanning= Skipping file with fstat failure %@ (%s): %{errno}d", buf, 0x1Cu);

      v99 = [v14 absolutePath];
      _MBLog();
    }
    BOOL v9 = 0;
  }
  else
  {
    v86 = MBGetDefaultLog();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
    {
      unsigned int v87 = [v14 absolutePath];
      *(_DWORD *)buf = 138412802;
      *(void *)long long v119 = v87;
      *(_WORD *)&v119[8] = 2080;
      *(void *)&v119[10] = v102;
      *(_WORD *)&v119[18] = 1024;
      *(_DWORD *)&v119[20] = v79;
      _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_ERROR, "=scanning= fstatat failed at %@ (%s): %{errno}d", buf, 0x1Cu);

      v100 = [v14 absolutePath];
      _MBLog();
    }
    v84 = [v14 absolutePath];
    BOOL v9 = +[MBError errorWithErrno:v79 code:101 path:v84 format:@"stat error"];
  }

LABEL_65:
LABEL_105:

  return v9;
}

- (id)_scanFilesUsingGetattrlistbulkForDomain:(id)a3 snapshotPath:(id)a4 relativePath:(id)a5 stats:(_MBFileScannerDomainStats *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = (__CFString *)a5;
  unsigned __int8 v13 = atomic_load((unsigned __int8 *)&self->_canceled);
  if (v13)
  {
    id v20 = +[MBError errorWithCode:202 format:@"File scan cancelled"];
    goto LABEL_58;
  }
  id v73 = 0;
  int v14 = [v10 cachedFileDescriptorWithSnapshotPath:v11 error:&v73];
  id v15 = (MBError *)v73;
  id v16 = v15;
  if (v14 < 0)
  {
    if (+[MBError isError:v15 withCode:4])
    {
      id v20 = 0;
    }
    else
    {
      unsigned int v21 = MBGetDefaultLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = [v10 name];
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v22;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v16;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "=scanning= Failed to fetch cached file descriptor for domain %@: %@", buf, 0x16u);

        uint64_t v58 = [v10 name];
        _MBLog();
      }
      id v16 = v16;
      id v20 = v16;
    }
    goto LABEL_57;
  }
  uint64_t v79 = 0;
  long long v77 = 0u;
  long long v78 = 0u;
  memset(buf, 0, sizeof(buf));
  v72 = v15;
  char v17 = sub_10008F27C(v14, v12, (uint64_t)buf, &v72);
  int v18 = v72;

  if ((v17 & 1) == 0)
  {
    if (+[MBError isError:v18 withCode:4])
    {
      id v20 = 0;
    }
    else
    {
      int v18 = v18;
      id v20 = v18;
    }
    goto LABEL_56;
  }
  id v19 = +[MBFile fileWithDomain:v10 snapshotPath:v11 relativePath:v12];
  [v19 setNode:buf];
  if (![(MBFileScanner *)self _shouldNotBackupFile:v19 domain:v10])
  {
    int v23 = [(MBFileScanner *)self _foundFile:v19 snapshotPath:v11 stats:a6];

    if (v23)
    {
      int v18 = v23;
      id v20 = v18;
      goto LABEL_55;
    }
    if ([v19 isDirectory])
    {
      uint64_t v63 = v19;
      v70 = objc_opt_new();
      [v70 addObject:v12];
      v24 = objc_opt_new();
      uint64_t v25 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)buf];
      int v67 = v24;
      [v24 addObject:v25];

      unsigned int v66 = +[NSMutableData dataWithLength:0x4000];
      int v26 = 0;
      while (1)
      {
        if (!objc_msgSend(v70, "count", v57, v60, v62))
        {
          id v48 = v26;
          goto LABEL_54;
        }
        BOOL v28 = v27;
        unsigned __int8 v29 = atomic_load((unsigned __int8 *)&self->_canceled);
        if (v29)
        {
          id v48 = +[MBError errorWithCode:202 format:@"File scan cancelled"];
          unint64_t v30 = v26;
          goto LABEL_53;
        }
        v68 = v27;
        unint64_t v30 = [v70 lastObject];
        [v70 removeLastObject];
        long long v31 = [v67 lastObject];
        id v32 = [v31 unsignedIntValue];

        [v67 removeLastObject];
        id v71 = v26;
        int v33 = [v10 cachedFileDescriptorWithSnapshotPath:v11 error:&v71];
        id v69 = v71;

        if (v33 < 0) {
          break;
        }
        if ([v30 length]) {
          char v34 = (const char *)[v30 fileSystemRepresentation];
        }
        else {
          char v34 = ".";
        }
        uint64_t v35 = openat(v33, v34, 256, 0);
        if ((v35 & 0x80000000) != 0)
        {
          uint64_t v38 = *__error();
          id v39 = [(MBFileScanner *)self delegate];
          v40 = +[MBFile fileWithDomain:v10 snapshotPath:v11 relativePath:v30];
          CFURLRef v65 = v39;
          if ((objc_opt_respondsToSelector() & 1) != 0
            && [v39 fileScanner:self failedToOpenFile:v40 withErrno:v38])
          {
            unsigned int v41 = MBGetDefaultLog();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
            {
              [v40 absolutePath];
              uint64_t v43 = v42 = v38;
              *(_DWORD *)v74 = 138412802;
              *(void *)v75 = v43;
              *(_WORD *)&v75[8] = 2112;
              *(void *)&v75[10] = v30;
              *(_WORD *)&v75[18] = 1024;
              *(_DWORD *)&v75[20] = v42;
              _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "=scanning= Skipping file with openat failure %@ (%@): %{errno}d", v74, 0x1Cu);

              [v40 absolutePath];
              v60 = v30;
              id v57 = v62 = v42;
              _MBLog();
            }
            int v44 = 6;
          }
          else
          {
            uint64_t v64 = v38;
            SEL v50 = MBGetDefaultLog();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
            {
              v51 = [v40 absolutePath];
              *(_DWORD *)v74 = 138412802;
              *(void *)v75 = v51;
              *(_WORD *)&v75[8] = 2112;
              *(void *)&v75[10] = v30;
              *(_WORD *)&v75[18] = 1024;
              *(_DWORD *)&v75[20] = v64;
              _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "=scanning= openat failed at %@ (%@): %{errno}d", v74, 0x1Cu);

              [v40 absolutePath];
              v60 = v30;
              id v57 = v62 = v64;
              _MBLog();
            }
            long long v52 = [v40 absolutePath];
            uint64_t v53 = +[MBError errorWithErrno:v64 code:101 path:v52 format:@"open error"];

            unsigned int v41 = [v40 absolutePath];
            sub_1000111EC(v41);
            int v44 = 7;
            id v69 = (id)v53;
          }
          v49 = v68;

          id v48 = v69;
        }
        else
        {
          uint64_t v36 = v35;
          if (v32 > 0x61A8)
          {
            unsigned int v45 = MBGetDefaultLog();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
            {
              uint64_t v46 = [v10 name];
              *(_DWORD *)v74 = 67109634;
              *(_DWORD *)v75 = v32;
              *(_WORD *)&v75[4] = 2114;
              *(void *)&v75[6] = v46;
              *(_WORD *)&v75[14] = 2114;
              *(void *)&v75[16] = v30;
              _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "=scanning= Found a direntcount of %u under %{public}@ (%{public}@)", v74, 0x1Cu);

              uint64_t v61 = [v10 name];
              _MBLog();
            }
            uint64_t v37 = [(MBFileScanner *)self _performTwoPassEnumerationForDomain:v10 snapshotPath:v11 relativePath:v30 buffer:v66 dirFd:v36 direntCount:v32 directoryPathStack:v70 directoryCountStack:v67 stats:a6];
          }
          else
          {
            uint64_t v37 = [(MBFileScanner *)self _performSinglePassEnumerationForDomain:v10 snapshotPath:v11 relativePath:v30 buffer:v66 dirFd:v35 direntCount:v32 directoryPathStack:v70 directoryCountStack:v67 stats:a6];
          }
          uint64_t v47 = (void *)v37;

          close(v36);
          if (v47)
          {
            long long v54 = MBGetDefaultLog();
            if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v74 = 138412290;
              *(void *)v75 = v47;
              _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "=scanning= Error performing file enumeration: %@", v74, 0xCu);
              _MBLog();
            }
            id v69 = v47;
            goto LABEL_52;
          }
          id v48 = 0;
          int v44 = 0;
          v49 = v68;
        }

        int v26 = v48;
        if (v44 == 7) {
          goto LABEL_54;
        }
      }
      long long v54 = MBGetDefaultLog();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        long long v55 = [v10 name];
        *(_DWORD *)v74 = 138412546;
        *(void *)v75 = v55;
        *(_WORD *)&v75[8] = 2112;
        *(void *)&v75[10] = v69;
        _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "=scanning= Failed to fetch cached file descriptor for domain %@: %@", v74, 0x16u);

        id v59 = [v10 name];
        _MBLog();
      }
LABEL_52:
      BOOL v28 = v68;

      id v48 = v69;
LABEL_53:

LABEL_54:
      int v18 = v48;

      id v20 = v18;
      id v19 = v63;
      goto LABEL_55;
    }
    int v18 = 0;
  }
  id v20 = 0;
LABEL_55:

LABEL_56:
  id v16 = v18;
LABEL_57:

LABEL_58:

  return v20;
}

- (id)_performSinglePassEnumerationForDomain:(id)a3 snapshotPath:(id)a4 relativePath:(id)a5 buffer:(id)a6 dirFd:(int)a7 direntCount:(unsigned int)a8 directoryPathStack:(id)a9 directoryCountStack:(id)a10 stats:(_MBFileScannerDomainStats *)a11
{
  uint64_t v11 = *(void *)&a8;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v48 = a6;
  id v50 = a9;
  id v49 = a10;
  uint64_t v72 = 0;
  id v73 = &v72;
  uint64_t v74 = 0x2020000000;
  uint64_t v75 = 0;
  uint64_t v66 = 0;
  int v67 = &v66;
  uint64_t v68 = 0x3032000000;
  id v69 = sub_10008C74C;
  v70 = sub_10008C75C;
  id v71 = 0;
  id v19 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v11];
  id v20 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v11];
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472;
  v55[2] = sub_10008C764;
  v55[3] = &unk_1000F24B0;
  id v52 = v16;
  id v56 = v52;
  id v53 = v18;
  id v57 = v53;
  uint64_t v58 = self;
  uint64_t v62 = &v66;
  uint64_t v63 = &v72;
  int v65 = v11;
  id v21 = v17;
  id v59 = v21;
  uint64_t v64 = a11;
  id v54 = v20;
  id v60 = v54;
  id v22 = v19;
  id v61 = v22;
  sub_10008EBC0(a7, v48, (uint64_t)v55);
  if ((unint64_t)v73[3] >> 4 >= 0x271)
  {
    int v23 = MBGetDefaultLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = v23;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v25 = v73[3];
        int v26 = [v52 name];
        *(_DWORD *)buf = 134218754;
        uint64_t v77 = v25;
        __int16 v78 = 1024;
        int v79 = v11;
        __int16 v80 = 2114;
        id v81 = v53;
        __int16 v82 = 2114;
        uint64_t v83 = v26;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "=scanning= Found a total of %llu/%u items under %{public}@ (%{public}@), single pass", buf, 0x26u);
      }
      uint64_t v27 = v73[3];
      [v52 name];
      v47 = id v46 = v53;
      uint64_t v44 = v27;
      uint64_t v45 = v11;
      _MBLog();
    }
  }
  BOOL v28 = (void *)v67[5];
  if (!v28)
  {
    id v29 = [v22 count];
    if (v29 != [v54 count]) {
      __assert_rtn("-[MBFileScanner _performSinglePassEnumerationForDomain:snapshotPath:relativePath:buffer:dirFd:direntCount:directoryPathStack:directoryCountStack:stats:]", "MBFileScanner.m", 952, "foundNodes.count == foundFileNames.count");
    }
    unint64_t v30 = 0;
    do
    {
      if (v30 >= (unint64_t)objc_msgSend(v22, "count", v44, v45, v46, v47)) {
        break;
      }
      id v32 = [v22 objectAtIndexedSubscript:v30];
      int v33 = (unsigned int *)[v32 bytes];

      char v34 = [v54 objectAtIndexedSubscript:v30];
      uint64_t v35 = [v53 stringByAppendingPathComponent:v34];
      uint64_t v36 = +[MBFile fileWithDomain:v52 snapshotPath:v21 relativePath:v35];

      [v36 setNode:v33];
      uint64_t v37 = [(MBFileScanner *)self _foundFile:v36 snapshotPath:v21 stats:a11];
      uint64_t v38 = (void *)v67[5];
      v67[5] = v37;

      uint64_t v39 = v67[5];
      if (!v39 && [v36 isDirectory])
      {
        v40 = [v36 relativePath];
        [v50 addObject:v40];

        unsigned int v41 = +[NSNumber numberWithUnsignedInt:*v33];
        [v49 addObject:v41];
      }
      ++v30;
    }
    while (!v39);
    BOOL v28 = (void *)v67[5];
  }
  id v42 = v28;

  _Block_object_dispose(&v66, 8);
  _Block_object_dispose(&v72, 8);

  return v42;
}

- (id)_performTwoPassEnumerationForDomain:(id)a3 snapshotPath:(id)a4 relativePath:(id)a5 buffer:(id)a6 dirFd:(int)a7 direntCount:(unsigned int)a8 directoryPathStack:(id)a9 directoryCountStack:(id)a10 stats:(_MBFileScannerDomainStats *)a11
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v44 = a9;
  id v45 = a10;
  uint64_t v77 = 0;
  __int16 v78 = &v77;
  uint64_t v79 = 0x2020000000;
  uint64_t v80 = 0;
  uint64_t v71 = 0;
  uint64_t v72 = &v71;
  uint64_t v73 = 0x3032000000;
  uint64_t v74 = sub_10008C74C;
  uint64_t v75 = sub_10008C75C;
  id v76 = 0;
  v62[0] = _NSConcreteStackBlock;
  v62[1] = 3221225472;
  v62[2] = sub_10008D0D0;
  v62[3] = &unk_1000F24D8;
  id v46 = v16;
  id v63 = v46;
  id v20 = v18;
  id v64 = v20;
  int v65 = self;
  unsigned int v41 = self;
  int v67 = &v71;
  uint64_t v68 = &v77;
  unsigned int v21 = a8;
  unsigned int v70 = a8;
  id v22 = v17;
  id v66 = v22;
  id v69 = a11;
  sub_10008EBC0(a7, v19, (uint64_t)v62);
  if ((unint64_t)v78[3] >> 4 >= 0x271)
  {
    int v23 = MBGetDefaultLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = v23;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        id v40 = v19;
        uint64_t v25 = v78[3];
        int v26 = [v46 name];
        *(_DWORD *)buf = 134218754;
        uint64_t v82 = v25;
        __int16 v83 = 1024;
        unsigned int v84 = a8;
        __int16 v85 = 2114;
        id v86 = v20;
        __int16 v87 = 2114;
        CFBooleanRef v88 = v26;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "=scanning= Found a total of %llu/%u items under %{public}@ (%{public}@), first pass", buf, 0x26u);

        id v19 = v40;
      }

      uint64_t v38 = [v46 name];
      _MBLog();
    }
  }
  uint64_t v27 = (void *)v72[5];
  if (v27)
  {
    id v28 = v27;
LABEL_9:
    id v29 = v28;
    goto LABEL_18;
  }
  if (lseek(a7, 0, 0) < 0)
  {
    id v28 = +[MBError errorWithErrno:*__error() path:v20 format:@"lseek error"];
    goto LABEL_9;
  }
  id v30 = v19;
  uint64_t v58 = 0;
  id v59 = &v58;
  uint64_t v60 = 0x2020000000;
  uint64_t v61 = 0;
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_10008D440;
  v47[3] = &unk_1000F24B0;
  id v31 = v46;
  id v48 = v31;
  id v32 = v20;
  id v49 = v32;
  id v50 = v41;
  id v54 = &v71;
  long long v55 = &v58;
  unsigned int v57 = a8;
  id v51 = v22;
  id v56 = a11;
  id v52 = v44;
  id v53 = v45;
  sub_10008EBC0(a7, v19, (uint64_t)v47);
  if ((unint64_t)v59[3] >> 4 >= 0x271)
  {
    int v33 = MBGetDefaultLog();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      id v43 = v32;
      char v34 = v33;
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v35 = v59[3];
        uint64_t v36 = [v31 name];
        *(_DWORD *)buf = 134218754;
        uint64_t v82 = v35;
        __int16 v83 = 1024;
        unsigned int v84 = v21;
        __int16 v85 = 2114;
        id v86 = v43;
        __int16 v87 = 2114;
        CFBooleanRef v88 = v36;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "=scanning= Found a total of %llu/%u items under %{public}@ (%{public}@), second pass", buf, 0x26u);

        id v19 = v30;
      }

      uint64_t v39 = [v31 name];
      _MBLog();
    }
  }
  id v29 = (id)v72[5];

  _Block_object_dispose(&v58, 8);
LABEL_18:

  _Block_object_dispose(&v71, 8);
  _Block_object_dispose(&v77, 8);

  return v29;
}

- (id)_foundFile:(id)a3 snapshotPath:(id)a4 stats:(_MBFileScannerDomainStats *)a5
{
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [(MBFileScanner *)self _updateStats:a5 file:v8];
  if (!v9)
  {
    uint64_t v11 = [v8 domain];
    id v12 = [v8 relativePath];
    -[MBFileScanner _detectModifiedDomain:relativePath:lastModified:](self, "_detectModifiedDomain:relativePath:lastModified:", v11, v12, [v8 lastModified]);
  }
  if (![v8 isRegularFile])
  {
    unsigned int v21 = 0;
    goto LABEL_70;
  }
  long long v113 = 0u;
  long long v114 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  unsigned __int8 v13 = MBSQLiteJournalSuffixes();
  id v14 = [v13 countByEnumeratingWithState:&v111 objects:v123 count:16];
  if (!v14)
  {
    unsigned int v21 = 0;
    goto LABEL_60;
  }
  id v15 = v14;
  int v103 = WeakRetained;
  uint64_t v16 = *(void *)v112;
  while (2)
  {
    for (i = 0; i != v15; i = (char *)i + 1)
    {
      if (*(void *)v112 != v16) {
        objc_enumerationMutation(v13);
      }
      id v18 = *(void **)(*((void *)&v111 + 1) + 8 * i);
      id v19 = [v8 relativePath];
      unsigned int v20 = [v19 hasSuffix:v18];

      if (v20)
      {
        id v22 = [v8 relativePath];
        int v23 = [v8 relativePath];
        v24 = [v22 substringToIndex:[v23 length] - [v18 length]];

        uint64_t v25 = [v8 domain];
        int v26 = [v25 rootPath];
        uint64_t v27 = [v26 stringByAppendingPathComponent:v24];

        id v28 = [v8 domain];
        id v29 = [v28 volumeMountPoint];
        v101 = (void *)v27;
        id v30 = MBSnapshotPathFromLivePath();

        id v31 = [v8 domain];
        id v32 = +[MBFileID fileIDWithDomain:v31 relativePath:v24];

        if ([v18 hasSuffix:@"-wal"]) {
          [(NSMutableDictionary *)self->_lastModifiedDateBySQLiteFileID removeObjectForKey:v32];
        }
        unsigned int v102 = v32;
        id v110 = 0;
        uint64_t v33 = +[MBProtectionClassUtils getWithPath:v30 error:&v110];
        char v34 = v110;
        if (v33 == 255)
        {
          if (!+[MBError isError:v34 withCode:4])
          {
            unsigned int v21 = v34;

            id v44 = v21;
LABEL_43:
            id WeakRetained = v103;
            goto LABEL_77;
          }
          id v45 = MBGetDefaultLog();
          id v46 = v101;
          if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v30;
            _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "=scanning= Potential SQLite database not found: %@", buf, 0xCu);
            uint64_t v88 = (uint64_t)v30;
            _MBLog();
          }
          uint64_t v47 = v34;
          char v34 = 0;
        }
        else
        {
          if ((self->_policy & 8) == 0
            || +[MBProtectionClassUtils canOpenWhenLocked:v33])
          {
            v100 = v24;
            char v109 = 0;
            v108 = v34;
            unsigned __int8 v35 = +[MBSQLiteFileHandle isSQLiteFileAtPath:v30 result:&v109 error:&v108];
            uint64_t v36 = v108;

            if (v35)
            {
              if (v109)
              {
                if ((self->_policy & 0x40) == 0)
                {
LABEL_22:
                  uint64_t v37 = MBGetDefaultLog();
                  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
                  {
                    uint64_t v38 = [v8 absolutePath];
                    *(_DWORD *)buf = 138412290;
                    *(void *)&uint8_t buf[4] = v38;
                    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "=scanning= Not backing up SQLite file: %@", buf, 0xCu);

                    v89 = [v8 absolutePath];
                    _MBLog();
                  }
                  if ([v18 hasSuffix:@"-wal"])
                  {
                    uint64_t v39 = [v8 lastModifiedDate];
                    [v39 timeIntervalSince1970];
                    double v41 = v40;

                    id v42 = MBGetDefaultLog();
                    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 134218498;
                      *(void *)&uint8_t buf[4] = (uint64_t)v41;
                      *(_WORD *)&buf[12] = 2112;
                      *(void *)&buf[14] = v30;
                      *(_WORD *)&buf[22] = 2112;
                      *(void *)&buf[24] = v102;
                      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "=scanning= Saving last modified date of SQLite file's WAL (%lu): %@ (%@)", buf, 0x20u);
                      _MBLog();
                    }

                    id v43 = [v8 lastModifiedDate];
                    [(NSMutableDictionary *)self->_lastModifiedDateBySQLiteFileID setObject:v43 forKeyedSubscript:v102];
                  }
                  id v44 = 0;
                  goto LABEL_42;
                }
                id v51 = [v8 domain];
                id v52 = +[MBFile fileWithDomain:v51 snapshotPath:v9 relativePath:v100];

                uint64_t v122 = 0;
                long long v120 = 0u;
                long long v121 = 0u;
                memset(buf, 0, sizeof(buf));
                unsigned int v107 = v36;
                char v53 = sub_10008F178(v30, (uint64_t)buf, &v107);
                unsigned int v21 = v107;

                v99 = v52;
                if (v53)
                {
                  [v52 setNode:buf];
                  if ([v52 isRegularFile])
                  {
                    char v105 = v21;
                    uint64_t v106 = 0;
                    unsigned __int8 v54 = +[MBSQLiteFileHandle lastModifiedForSQLiteFileAtPath:v30 time:&v106 error:&v105];
                    uint64_t v36 = v105;

                    if (v54)
                    {
                      [v52 setLastModified:v106];
                      if (![v103 fileScanner:self isFileAddedOrModified:v52])
                      {

                        goto LABEL_22;
                      }
                      long long v55 = MBGetDefaultLog();
                      if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
                      {
                        id v56 = [v8 absolutePath];
                        *(_DWORD *)v115 = 138412290;
                        *(void *)id v116 = v56;
                        _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_INFO, "=scanning= Backing up SQLite file: %@", v115, 0xCu);

                        uint64_t v88 = [v8 absolutePath];
                        _MBLog();
                      }
                      int v57 = 2;
                      unsigned int v21 = v36;
                      id WeakRetained = v103;
                    }
                    else
                    {
                      if (+[MBError isError:v36 withCode:4])
                      {
                        id v86 = MBGetDefaultLog();
                        if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
                        {
                          *(_DWORD *)v115 = 138412290;
                          *(void *)id v116 = v30;
                          _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_INFO, "=scanning= Potential SQLite database not found: %@", v115, 0xCu);
                          uint64_t v88 = (uint64_t)v30;
                          _MBLog();
                        }

                        int v57 = 2;
                      }
                      else
                      {
                        __int16 v87 = v36;
                        int v57 = 1;
                      }
                      unsigned int v21 = v36;
                      id WeakRetained = v103;
                    }
LABEL_98:

                    id v44 = v21;
                    if (v57 == 2) {
                      goto LABEL_61;
                    }
                    goto LABEL_77;
                  }
                  __int16 v78 = MBGetDefaultLog();
                  if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
                  {
                    unsigned int v80 = [v8 mode];
                    *(_DWORD *)v115 = 67109378;
                    *(_DWORD *)id v116 = v80;
                    *(_WORD *)&v116[4] = 2112;
                    *(void *)&v116[6] = v30;
                    _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_INFO, "=scanning= Potential SQLite database is not a regular file (0%o): %@", v115, 0x12u);
                    uint64_t v88 = [v8 mode];
                    v92 = v30;
                    _MBLog();
                  }
                  int v57 = 2;
                  id WeakRetained = v103;
LABEL_97:

                  goto LABEL_98;
                }
                id v77 = +[MBError errnoForError:v21];
                __int16 v78 = [(MBFileScanner *)self delegate];
                if (v77 == 2)
                {
                  uint64_t v79 = MBGetDefaultLog();
                  if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)v115 = 138412290;
                    *(void *)id v116 = v30;
                    _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_INFO, "=scanning= Potential SQLite database not found: %@", v115, 0xCu);
                    uint64_t v88 = (uint64_t)v30;
                    _MBLog();
                  }
                }
                else
                {
                  if ((objc_opt_respondsToSelector() & 1) == 0
                    || ![v78 fileScanner:self failedToStatFile:v52 withErrno:v77])
                  {
                    unsigned int v84 = MBGetDefaultLog();
                    if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)v115 = 138412546;
                      *(void *)id v116 = v30;
                      *(_WORD *)&v116[8] = 2114;
                      *(void *)&v116[10] = v21;
                      _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_ERROR, "=scanning= MBNodeForPath() failed at %@: %{public}@", v115, 0x16u);
                      uint64_t v88 = (uint64_t)v30;
                      v92 = v21;
                      _MBLog();
                    }

                    __int16 v85 = v21;
                    int v57 = 1;
                    goto LABEL_96;
                  }
                  id v81 = MBGetDefaultLog();
                  if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
                  {
                    id v97 = [v99 absolutePath];
                    uint64_t v82 = [v99 relativePath];
                    *(_DWORD *)v115 = 138412802;
                    *(void *)id v116 = v97;
                    *(_WORD *)&v116[8] = 2112;
                    *(void *)&v116[10] = v82;
                    __int16 v83 = (void *)v82;
                    __int16 v117 = 1024;
                    int v118 = (int)v77;
                    _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_INFO, "=scanning= Skipping SQLite file with lstat failure %@ (%@): %{errno}d", v115, 0x1Cu);

                    v98 = [v99 absolutePath];
                    v92 = [v99 relativePath];
                    id v94 = v77;
                    uint64_t v88 = (uint64_t)v98;
                    _MBLog();
                  }
                }
                int v57 = 2;
LABEL_96:
                id WeakRetained = v103;
                goto LABEL_97;
              }
              id v48 = MBGetDefaultLog();
              if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v49 = (uint64_t)v30;
                *(void *)&uint8_t buf[4] = v30;
                _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "=scanning= Potential SQLite database isn't: %@", buf, 0xCu);
                v24 = v100;
                goto LABEL_46;
              }
              v24 = v100;
            }
            else
            {
              if (!+[MBError isError:v36 withCode:4])
              {
                uint64_t v36 = v36;
                id v44 = v36;
LABEL_42:

                unsigned int v21 = v36;
                goto LABEL_43;
              }
              id v48 = MBGetDefaultLog();
              v24 = v100;
              if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v49 = (uint64_t)v30;
                *(void *)&uint8_t buf[4] = v30;
                _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "=scanning= Potential SQLite database not found: %@", buf, 0xCu);
LABEL_46:
                id v46 = v101;
                uint64_t v88 = v49;
                _MBLog();
LABEL_58:

                goto LABEL_59;
              }
            }
            id v46 = v101;
            goto LABEL_58;
          }
          uint64_t v47 = MBGetDefaultLog();
          if (!os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
          {
            id v46 = v101;
            goto LABEL_48;
          }
          id v50 = [v8 absolutePath];
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v50;
          _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "=scanning= Backing up protected SQLite journal: %@", buf, 0xCu);

          id v45 = [v8 absolutePath];
          uint64_t v88 = (uint64_t)v45;
          _MBLog();
          id v46 = v101;
        }

LABEL_48:
        uint64_t v36 = (MBError *)v34;
LABEL_59:

        unsigned int v21 = v36;
        id WeakRetained = v103;
        goto LABEL_60;
      }
    }
    id v15 = [v13 countByEnumeratingWithState:&v111 objects:v123 count:16];
    if (v15) {
      continue;
    }
    break;
  }
  unsigned int v21 = 0;
  id WeakRetained = v103;
LABEL_60:

LABEL_61:
  lastModifiedDateBySQLiteFileID = self->_lastModifiedDateBySQLiteFileID;
  id v59 = [v8 fileID:v88 v92 v94];
  uint64_t v60 = [(NSMutableDictionary *)lastModifiedDateBySQLiteFileID objectForKeyedSubscript:v59];

  if (v60)
  {
    [v60 timeIntervalSince1970];
    uint64_t v62 = (uint64_t)v61;
    id v63 = MBGetDefaultLog();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
    {
      id v64 = [v8 lastModified];
      *(_DWORD *)buf = 134218498;
      *(void *)&uint8_t buf[4] = v64;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v62;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&buf[24] = v8;
      _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_INFO, "=scanning= Overriding last modified date of SQLite file (%lu) with WAL's (%lu): %@", buf, 0x20u);
      uint64_t v93 = v62;
      id v95 = v8;
      id v90 = [v8 lastModified];
      _MBLog();
    }

    [v8 setLastModified:v62];
  }
  id v65 = +[MBFileSystemManager fileSystemCapacity];
  if ([v8 size] > v65)
  {
    id v66 = MBGetDefaultLog();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_FAULT))
    {
      id v67 = [v8 size];
      [v8 absolutePath];
      v68 = id v104 = WeakRetained;
      *(_DWORD *)buf = 134218498;
      *(void *)&uint8_t buf[4] = v67;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v65;
      *(_WORD *)&buf[22] = 2114;
      *(void *)&buf[24] = v68;
      _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_FAULT, "=scanning= Found a file with unexpected size (%llu/%llu) at %{public}@", buf, 0x20u);

      [v8 size];
      CFErrorRef v96 = [v8 absolutePath];
      _MBLog();

      id WeakRetained = v104;
    }

    id v69 = [v8 absolutePath];
    sub_1000132F0(v69);
  }
LABEL_70:
  unsigned int v70 = v21;
  ((void (*)(id, const char *, MBFileScanner *, id))self->_delegateImpOfFileScannerDidFindFile)(WeakRetained, "fileScanner:didFindFile:", self, v8);
  unsigned int v21 = (MBError *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    if (+[MBError isError:v21 withCode:4])
    {
      uint64_t v72 = MBGetDefaultLog();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v73 = [v8 absolutePath];
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v73;
        _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "=scanning= Deleted while scanning: %@", buf, 0xCu);

        v91 = [v8 absolutePath];
        _MBLog();
      }
      [(MBDebugContext *)self->_debugContext setFlag:@"FileDeletedWhileScanning"];
      modifiedDomains = self->_modifiedDomains;
      uint64_t v75 = [v8 domain];
      [(NSMutableSet *)modifiedDomains addObject:v75];

      goto LABEL_75;
    }
    unsigned int v21 = v21;
    id v44 = v21;
  }
  else
  {
LABEL_75:
    id v44 = 0;
  }
LABEL_77:

  return v44;
}

- (void)_detectModifiedDomain:(id)a3 relativePath:(id)a4 lastModified:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (self->_startTime <= a5 && (uint64_t)[(MBDebugContext *)self->_debugContext time] >= a5)
  {
    id v10 = [v8 relativePathsNotToCheckIfModifiedDuringBackup];
    id v11 = [v10 count];

    if (v11)
    {
      id v24 = v9;
      id v12 = [v9 pathComponents];
      id v13 = [v12 count];
      uint64_t v14 = 0;
      while (1)
      {
        uint64_t v16 = [v12 subarrayWithRange:0, v14];
        id v17 = +[NSString pathWithComponents:v16];

        id v18 = [v8 relativePathsNotToCheckIfModifiedDuringBackup];
        unsigned int v19 = [v18 containsObject:v17];

        if (v19) {
          break;
        }

        if (++v14 > (unint64_t)v13)
        {
          unsigned int v20 = MBGetDefaultLog();
          id v9 = v24;
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            int64_t startTime = self->_startTime;
            *(_DWORD *)buf = 138412802;
            id v26 = v24;
            __int16 v27 = 2048;
            int64_t v28 = startTime;
            __int16 v29 = 2048;
            int64_t v30 = a5;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "=scanning= Modified while scanning: %@ (startTime:%ld, lastModified:%ld)", buf, 0x20u);
            _MBLog();
          }

          [(MBDebugContext *)self->_debugContext setFlag:@"FileModifiedWhileScanning"];
          [(NSMutableSet *)self->_modifiedDomains addObject:v8];
          goto LABEL_13;
        }
      }
      id v22 = MBGetDefaultLog();
      id v9 = v24;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        int64_t v23 = self->_startTime;
        *(_DWORD *)buf = 138412802;
        id v26 = v24;
        __int16 v27 = 2048;
        int64_t v28 = v23;
        __int16 v29 = 2048;
        int64_t v30 = a5;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "=scanning= Ignoring path modified while scanning: %@ (startTime:%ld, lastModified:%ld)", buf, 0x20u);
        _MBLog();
      }

LABEL_13:
    }
  }
}

- (MBFileScannerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MBFileScannerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lastModifiedDateBySQLiteFileID, 0);
  objc_storeStrong((id *)&self->_modifiedDomains, 0);

  objc_storeStrong((id *)&self->_debugContext, 0);
}

@end