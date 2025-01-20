@interface UASharedPasteboardDataManager
+ (id)sharedInstance;
- (BOOL)createTmpArchiveFileWithUUID:(id)a3;
- (BOOL)directoryExistsAtPath:(id)a3;
- (BOOL)fileExistsForUUID:(id)a3 inSubFolder:(id)a4;
- (NSMutableDictionary)lockTokens;
- (NSMutableDictionary)providers;
- (NSMutableDictionary)tmpArchiveWriteFiles;
- (NSString)currentLocalBlobPath;
- (NSString)currentRemoteBlobPath;
- (UASharedPasteboardDataManager)init;
- (id)createFileForLocalPasteboardBlob;
- (id)createFileForRemotePasteboardBlob;
- (id)createFileForUUID:(id)a3;
- (id)createFileForUUID:(id)a3 inSubFolder:(id)a4;
- (id)createFolderAtPath:(id)a3;
- (id)createSharedDataDirectory;
- (id)fileURLForArchiveWithUUID:(id)a3;
- (id)fileURLForCloneItems;
- (id)fileURLForPasteboardItem:(id)a3;
- (id)localPasteboardBlobForReading;
- (id)readHandleForArchiveWithUUID:(id)a3;
- (id)remotePasteboardBlobForReading;
- (id)sharedDataPath;
- (id)subDirForItem:(id)a3;
- (void)cancelAllLocks;
- (void)cleanupArchiveDir;
- (void)cleanupCloneDir;
- (void)cleanupForItem:(id)a3;
- (void)cleanupItemsDir;
- (void)finishWritingArchiveForUUID:(id)a3;
- (void)obtainLockForItem:(id)a3 completion:(id)a4;
- (void)releaseLockForItem:(id)a3;
- (void)releaseLockForItem:(id)a3 withError:(id)a4;
- (void)setCurrentLocalBlobPath:(id)a3;
- (void)setCurrentRemoteBlobPath:(id)a3;
- (void)setLockTokens:(id)a3;
- (void)setProviders:(id)a3;
- (void)setTmpArchiveWriteFiles:(id)a3;
- (void)writeArchiveData:(id)a3 forItem:(id)a4;
@end

@implementation UASharedPasteboardDataManager

+ (id)sharedInstance
{
  if (qword_1000E66F0 != -1) {
    dispatch_once(&qword_1000E66F0, &stru_1000C4E30);
  }
  v2 = (void *)qword_1000E66E8;

  return v2;
}

- (UASharedPasteboardDataManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)UASharedPasteboardDataManager;
  v2 = [(UASharedPasteboardDataManager *)&v10 init];
  v3 = v2;
  if (v2)
  {
    v4 = [(UASharedPasteboardDataManager *)v2 createSharedDataDirectory];
    id v5 = objc_alloc_init((Class)NSMutableDictionary);
    [(UASharedPasteboardDataManager *)v3 setTmpArchiveWriteFiles:v5];

    id v6 = objc_alloc_init((Class)NSMutableDictionary);
    [(UASharedPasteboardDataManager *)v3 setLockTokens:v6];

    id v7 = objc_alloc_init((Class)NSMutableDictionary);
    [(UASharedPasteboardDataManager *)v3 setProviders:v7];

    if (v4)
    {
      v8 = sub_10000BA18(@"pasteboard-server");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v12 = v4;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "[FILE MANAGER] ERROR creating shared pasteboard dir: %@", buf, 0xCu);
      }
    }
  }
  return v3;
}

- (id)sharedDataPath
{
  if (qword_1000E6700 != -1) {
    dispatch_once(&qword_1000E6700, &stru_1000C4E50);
  }
  v2 = (void *)qword_1000E66F8;

  return v2;
}

- (id)createSharedDataDirectory
{
  v3 = +[NSFileManager defaultManager];
  v4 = [(UASharedPasteboardDataManager *)self sharedDataPath];
  id v9 = 0;
  [v3 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:&__NSDictionary0__struct error:&v9];
  id v5 = v9;

  id v6 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = [(UASharedPasteboardDataManager *)self sharedDataPath];
    *(_DWORD *)buf = 138412290;
    v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[FILE MANAGER] Shared Path: %@", buf, 0xCu);
  }

  return v5;
}

- (BOOL)fileExistsForUUID:(id)a3 inSubFolder:(id)a4
{
  id v6 = a4;
  id v7 = [a3 UUIDString];
  if (v6)
  {
    uint64_t v8 = [v6 stringByAppendingPathComponent:v7];

    id v7 = (void *)v8;
  }
  id v9 = [(UASharedPasteboardDataManager *)self sharedDataPath];
  objc_super v10 = [v9 stringByAppendingPathComponent:v7];

  v11 = +[NSFileManager defaultManager];
  unsigned __int8 v12 = [v11 fileExistsAtPath:v10];

  return v12;
}

- (id)createFileForUUID:(id)a3
{
  return [(UASharedPasteboardDataManager *)self createFileForUUID:a3 inSubFolder:0];
}

- (id)createFileForUUID:(id)a3 inSubFolder:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[NSFileManager defaultManager];
  id v9 = [(UASharedPasteboardDataManager *)self sharedDataPath];
  unsigned __int8 v10 = [v8 fileExistsAtPath:v9];

  if ((v10 & 1) == 0)
  {
    uint64_t v11 = [(UASharedPasteboardDataManager *)self createSharedDataDirectory];
    if (v11)
    {
      unsigned __int8 v12 = v11;
      v13 = sub_10000BA18(@"pasteboard-server");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        int v28 = 138412290;
        v29 = v12;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "[FILE MANAGER] ERROR creating shared pasteboard dir: %@", (uint8_t *)&v28, 0xCu);
      }

LABEL_6:
      v14 = 0;
      goto LABEL_21;
    }
  }
  if (![(UASharedPasteboardDataManager *)self directoryExistsAtPath:v7])
  {
    v15 = [(UASharedPasteboardDataManager *)self createFolderAtPath:v7];
    if (!v15)
    {
      unsigned __int8 v12 = sub_10000BA18(@"pasteboard-server");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        int v28 = 138412290;
        v29 = v7;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "[FILE MANAGER] Error creating subdir: %@", (uint8_t *)&v28, 0xCu);
      }
      goto LABEL_6;
    }
  }
  unsigned __int8 v12 = [v6 UUIDString];
  if (v7)
  {
    uint64_t v16 = [v7 stringByAppendingPathComponent:v12];

    unsigned __int8 v12 = v16;
  }
  v17 = [(UASharedPasteboardDataManager *)self sharedDataPath];
  v18 = [v17 stringByAppendingPathComponent:v12];

  v19 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    int v28 = 138412546;
    v29 = v6;
    __int16 v30 = 2112;
    v31 = v18;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "[FILE MANAGER] Path for file UUID: %@ -> '%@'", (uint8_t *)&v28, 0x16u);
  }

  v20 = +[NSFileManager defaultManager];
  unsigned int v21 = [v20 createFileAtPath:v18 contents:0 attributes:&__NSDictionary0__struct];

  v22 = sub_10000BA18(@"pasteboard-server");
  v23 = v22;
  if (v21)
  {
    v24 = v18;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      int v28 = 138412290;
      v29 = v18;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "[FILE MANAGER] Created file at path: %@", (uint8_t *)&v28, 0xCu);
      v24 = v18;
    }
  }
  else
  {
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v25 = __error();
      v26 = strerror(*v25);
      int v28 = 138412546;
      v29 = v18;
      __int16 v30 = 2080;
      v31 = v26;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "[FILE MANAGER] Failed to create file at path: %@ / %s", (uint8_t *)&v28, 0x16u);
    }
    v24 = 0;
  }

  v14 = v24;
LABEL_21:

  return v14;
}

- (BOOL)directoryExistsAtPath:(id)a3
{
  id v4 = a3;
  id v5 = [(UASharedPasteboardDataManager *)self sharedDataPath];
  id v6 = [v5 stringByAppendingPathComponent:v4];

  char v11 = 0;
  id v7 = +[NSFileManager defaultManager];
  unsigned __int8 v8 = [v7 fileExistsAtPath:v6 isDirectory:&v11];

  if (v11) {
    BOOL v9 = v8;
  }
  else {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)createFolderAtPath:(id)a3
{
  id v4 = a3;
  id v5 = [(UASharedPasteboardDataManager *)self sharedDataPath];
  id v6 = [v5 stringByAppendingPathComponent:v4];

  id v7 = +[NSFileManager defaultManager];
  id v19 = 0;
  unsigned int v8 = [v7 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:&__NSDictionary0__struct error:&v19];
  id v9 = v19;

  unsigned __int8 v10 = sub_10000BA18(@"pasteboard-server");
  char v11 = v10;
  if (v9)
  {
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 138543618;
    unsigned int v21 = v6;
    __int16 v22 = 2114;
    id v23 = v9;
    unsigned __int8 v12 = "[FILE MANAGER] Failed to create dir at path: %{public}@ / %{public}@";
    v13 = v11;
    os_log_type_t v14 = OS_LOG_TYPE_ERROR;
    uint32_t v15 = 22;
  }
  else
  {
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 138543362;
    unsigned int v21 = v6;
    unsigned __int8 v12 = "[FILE MANAGER] Created dir at path: %{public}@";
    v13 = v11;
    os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
    uint32_t v15 = 12;
  }
  _os_log_impl((void *)&_mh_execute_header, v13, v14, v12, buf, v15);
LABEL_7:

  if (v8) {
    uint64_t v16 = v6;
  }
  else {
    uint64_t v16 = 0;
  }
  id v17 = v16;

  return v17;
}

- (id)createFileForLocalPasteboardBlob
{
  v3 = [(UASharedPasteboardDataManager *)self currentLocalBlobPath];

  if (!v3)
  {
    id v4 = +[NSUserDefaults standardUserDefaults];
    id v5 = [v4 stringForKey:@"kLocalPasteboardBlobName"];
    [(UASharedPasteboardDataManager *)self setCurrentLocalBlobPath:v5];
  }
  id v6 = [(UASharedPasteboardDataManager *)self currentLocalBlobPath];

  if (v6)
  {
    id v7 = [(UASharedPasteboardDataManager *)self currentLocalBlobPath];
    unsigned int v8 = +[NSFileManager defaultManager];
    id v23 = 0;
    [v8 removeItemAtPath:v7 error:&v23];
    id v9 = v23;

    unsigned __int8 v10 = sub_10000BA18(@"pasteboard-server");
    char v11 = v10;
    if (v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v25 = v7;
        __int16 v26 = 2114;
        id v27 = v9;
        unsigned __int8 v12 = "[FILE MANAGER] Failed to remove item at path: %{public}@ / %{public}@";
        v13 = v11;
        os_log_type_t v14 = OS_LOG_TYPE_ERROR;
        uint32_t v15 = 22;
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v13, v14, v12, buf, v15);
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v25 = v7;
      unsigned __int8 v12 = "[FILE MANAGER] Removed item at path: %{public}@";
      v13 = v11;
      os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
      uint32_t v15 = 12;
      goto LABEL_9;
    }
  }
  uint64_t v16 = +[NSUUID UUID];
  id v17 = [(UASharedPasteboardDataManager *)self createFileForUUID:v16];
  [(UASharedPasteboardDataManager *)self setCurrentLocalBlobPath:v17];
  v18 = +[NSUserDefaults standardUserDefaults];
  [v18 setObject:v17 forKey:@"kLocalPasteboardBlobName"];

  id v19 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v17;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[FILE MANAGER] Creating file for local pasteboard blob at path: %@", buf, 0xCu);
  }

  if (v17)
  {
    v20 = +[NSFileHandle fileHandleForWritingAtPath:v17];
  }
  else
  {
    v20 = 0;
  }
  unsigned int v21 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v20;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "[FILE MANAGER] Created Handle: %@", buf, 0xCu);
  }

  return v20;
}

- (id)localPasteboardBlobForReading
{
  v3 = [(UASharedPasteboardDataManager *)self currentLocalBlobPath];

  if (v3)
  {
    id v4 = [(UASharedPasteboardDataManager *)self currentLocalBlobPath];
    id v5 = +[NSFileHandle fileHandleForReadingAtPath:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)createFileForRemotePasteboardBlob
{
  v3 = [(UASharedPasteboardDataManager *)self currentRemoteBlobPath];

  if (!v3)
  {
    id v4 = +[NSUserDefaults standardUserDefaults];
    id v5 = [v4 stringForKey:@"kRemotePasteboardBlobName"];
    [(UASharedPasteboardDataManager *)self setCurrentRemoteBlobPath:v5];
  }
  id v6 = [(UASharedPasteboardDataManager *)self currentRemoteBlobPath];

  if (v6)
  {
    id v7 = [(UASharedPasteboardDataManager *)self currentRemoteBlobPath];
    unsigned int v8 = +[NSFileManager defaultManager];
    id v23 = 0;
    [v8 removeItemAtPath:v7 error:&v23];
    id v9 = v23;

    unsigned __int8 v10 = sub_10000BA18(@"pasteboard-server");
    char v11 = v10;
    if (v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v25 = v7;
        __int16 v26 = 2114;
        id v27 = v9;
        unsigned __int8 v12 = "[FILE MANAGER] Failed to remove item at path: %{public}@ / %{public}@";
        v13 = v11;
        os_log_type_t v14 = OS_LOG_TYPE_ERROR;
        uint32_t v15 = 22;
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v13, v14, v12, buf, v15);
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v25 = v7;
      unsigned __int8 v12 = "[FILE MANAGER] Removed item at path: %{public}@";
      v13 = v11;
      os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
      uint32_t v15 = 12;
      goto LABEL_9;
    }
  }
  uint64_t v16 = +[NSUUID UUID];
  id v17 = [(UASharedPasteboardDataManager *)self createFileForUUID:v16];
  [(UASharedPasteboardDataManager *)self setCurrentRemoteBlobPath:v17];
  v18 = +[NSUserDefaults standardUserDefaults];
  [v18 setObject:v17 forKey:@"kRemotePasteboardBlobName"];

  id v19 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v17;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[FILE MANAGER] Creating file for remote pasteboard blob at path: %@", buf, 0xCu);
  }

  if (v17)
  {
    v20 = +[NSFileHandle fileHandleForWritingAtPath:v17];
  }
  else
  {
    v20 = 0;
  }
  unsigned int v21 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v20;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "[FILE MANAGER] Created Handle: %@", buf, 0xCu);
  }

  return v20;
}

- (id)remotePasteboardBlobForReading
{
  v3 = [(UASharedPasteboardDataManager *)self currentRemoteBlobPath];

  if (v3)
  {
    id v4 = [(UASharedPasteboardDataManager *)self currentRemoteBlobPath];
    id v5 = +[NSFileHandle fileHandleForReadingAtPath:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)subDirForItem:(id)a3
{
  v3 = [a3 UUIDString];
  id v4 = +[NSString stringWithFormat:@"items/%@/", v3];

  return v4;
}

- (id)fileURLForCloneItems
{
  v2 = +[UASharedPasteboardDataManager sharedInstance];
  v3 = [v2 sharedDataPath];
  uint64_t v4 = +[NSURL fileURLWithPath:v3 isDirectory:1];

  id v5 = [(id)v4 URLByAppendingPathComponent:@"type-clone"];

  id v6 = +[NSFileManager defaultManager];
  id v7 = [v5 path];
  LOBYTE(v4) = [v6 fileExistsAtPath:v7];

  if ((v4 & 1) == 0)
  {
    unsigned int v8 = +[NSFileManager defaultManager];
    id v9 = [v5 path];
    id v13 = 0;
    [v8 createDirectoryAtPath:v9 withIntermediateDirectories:1 attributes:&__NSDictionary0__struct error:&v13];
    id v10 = v13;

    if (v10)
    {
      char v11 = sub_10000BA18(@"pasteboard-server");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v15 = v10;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "[FILE MANAGER] Error creating clone items dir: %@", buf, 0xCu);
      }
    }
  }

  return v5;
}

- (id)fileURLForPasteboardItem:(id)a3
{
  uint64_t v4 = [(UASharedPasteboardDataManager *)self subDirForItem:a3];
  id v5 = [(UASharedPasteboardDataManager *)self sharedDataPath];
  id v6 = [v5 stringByAppendingPathComponent:v4];

  id v7 = +[NSURL URLWithString:v6];

  return v7;
}

- (id)fileURLForArchiveWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(UASharedPasteboardDataManager *)self sharedDataPath];
  id v6 = [v5 stringByAppendingPathComponent:@"archives"];

  id v7 = [v4 UUIDString];

  unsigned int v8 = [v6 stringByAppendingPathComponent:v7];
  id v9 = +[NSURL URLWithString:v8];

  return v9;
}

- (id)readHandleForArchiveWithUUID:(id)a3
{
  v3 = [(UASharedPasteboardDataManager *)self fileURLForArchiveWithUUID:a3];
  id v4 = [v3 path];
  id v5 = +[NSFileHandle fileHandleForReadingAtPath:v4];

  return v5;
}

- (BOOL)createTmpArchiveFileWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(UASharedPasteboardDataManager *)self createFileForUUID:v4 inSubFolder:@"archives"];
  if (v5
    && (+[NSFileHandle fileHandleForWritingAtPath:v5],
        (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v7 = (void *)v6;
    unsigned int v8 = [(UASharedPasteboardDataManager *)self tmpArchiveWriteFiles];
    id v9 = [v4 UUIDString];
    [v8 setObject:v7 forKeyedSubscript:v9];

    BOOL v10 = 1;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)writeArchiveData:(id)a3 forItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [(UASharedPasteboardDataManager *)self tmpArchiveWriteFiles];
  id v9 = [v7 UUIDString];
  BOOL v10 = [v8 objectForKeyedSubscript:v9];

  if (v10)
  {
    id v11 = v10;
    objc_sync_enter(v11);
    id v16 = 0;
    unsigned __int8 v12 = [v11 writeData:v6 error:&v16];
    id v13 = v16;
    if ((v12 & 1) == 0)
    {
      os_log_type_t v14 = sub_10000BA18(@"pasteboard-server");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        id v15 = [v7 UUIDString];
        *(_DWORD *)buf = 138543618;
        v18 = v15;
        __int16 v19 = 2114;
        id v20 = v13;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "[File Manager] Error writting data for %{public}@: %{public}@", buf, 0x16u);
      }
    }

    objc_sync_exit(v11);
  }
}

- (void)finishWritingArchiveForUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(UASharedPasteboardDataManager *)self tmpArchiveWriteFiles];
  id v6 = [v4 UUIDString];
  id v7 = [v5 objectForKeyedSubscript:v6];

  if (v7)
  {
    id v8 = v7;
    objc_sync_enter(v8);
    [v8 synchronizeFile];
    [v8 closeFile];
    id v9 = [(UASharedPasteboardDataManager *)self tmpArchiveWriteFiles];
    BOOL v10 = [v4 UUIDString];
    [v9 removeObjectForKey:v10];

    objc_sync_exit(v8);
  }
}

- (void)obtainLockForItem:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(UASharedPasteboardDataManager *)self subDirForItem:v7];
  id v9 = [(UASharedPasteboardDataManager *)self createFolderAtPath:v8];
  BOOL v10 = +[NSURL fileURLWithPath:v9 isDirectory:1];
  id v11 = [[UASharedPasteboardFileProvider alloc] initWithURL:v10];
  unsigned __int8 v12 = [(UASharedPasteboardDataManager *)self providers];
  [v12 setObject:v11 forKeyedSubscript:v7];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10001B080;
  v14[3] = &unk_1000C4E78;
  id v15 = v6;
  id v13 = v6;
  +[NSFileCoordinator _addFileProvider:v11 completionHandler:v14];
}

- (void)releaseLockForItem:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = [v6 UUIDString];
    int v15 = 138412290;
    id v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[File Manager] Releasing lock for item %@", (uint8_t *)&v15, 0xCu);
  }
  BOOL v10 = [(UASharedPasteboardDataManager *)self providers];
  id v11 = [v10 objectForKeyedSubscript:v6];

  if (v11)
  {
    [v11 unlockWithError:v7];
    +[NSFileCoordinator _removeFileProvider:v11];
    unsigned __int8 v12 = [(UASharedPasteboardDataManager *)self providers];
    [v12 setObject:0 forKeyedSubscript:v6];

    id v13 = sub_10000BA18(@"pasteboard-server");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      os_log_type_t v14 = [v6 UUIDString];
      int v15 = 138412290;
      id v16 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[File Manager] Released lock for item %@", (uint8_t *)&v15, 0xCu);
    }
  }
}

- (void)releaseLockForItem:(id)a3
{
}

- (void)cancelAllLocks
{
  v3 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[File Manager] Canceling all file coordiation providers", buf, 2u);
  }

  id v4 = +[NSError errorWithDomain:NSCocoaErrorDomain code:3072 userInfo:0];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(UASharedPasteboardDataManager *)self providers];
  id v6 = [v5 allValues];

  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        [v11 unlockWithError:v4];
        +[NSFileCoordinator _removeFileProvider:v11];
      }
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v8);
  }

  unsigned __int8 v12 = [(UASharedPasteboardDataManager *)self providers];
  [v12 removeAllObjects];
}

- (void)cleanupForItem:(id)a3
{
  id v4 = a3;
  id v5 = [(UASharedPasteboardDataManager *)self sharedDataPath];
  id v6 = [v5 stringByAppendingPathComponent:@"items"];

  if (v6)
  {
    id v7 = [v4 UUIDString];
    id v8 = [v6 stringByAppendingPathComponent:v7];

    id v9 = [objc_alloc((Class)NSFileCoordinator) initWithFilePresenter:0];
    BOOL v10 = +[NSURL fileURLWithPath:v8];
    id v11 = [(UASharedPasteboardDataManager *)self lockTokens];
    unsigned __int8 v12 = [v11 objectForKeyedSubscript:v4];

    long long v13 = sub_10000BA18(@"pasteboard-server");
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
    if (!v12)
    {
      if (v14)
      {
        *(_DWORD *)buf = 138543362;
        id v30 = v4;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Obtaining write lock to delete file for item: %{public}@", buf, 0xCu);
      }

      id v27 = 0;
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_10001B7E0;
      v25[3] = &unk_1000C4EA0;
      id v26 = v4;
      [v9 coordinateWritingItemAtURL:v10 options:1 error:&v27 byAccessor:v25];
      id v22 = v27;
      if (v22)
      {
        id v23 = v22;
        v24 = sub_10000BA18(@"pasteboard-server");
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v30 = v23;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Error getting coord write for deleting item: %{public}@", buf, 0xCu);
        }
      }
      id v16 = v26;
      goto LABEL_21;
    }
    if (v14)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Already have lock for file, deleting", buf, 2u);
    }

    long long v15 = +[NSFileManager defaultManager];
    id v28 = 0;
    [v15 removeItemAtURL:v10 error:&v28];
    id v16 = v28;

    id v17 = sub_10000BA18(@"pasteboard-server");
    v18 = v17;
    if (v16)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v30 = v16;
        __int16 v19 = "Error deleting item: %{public}@";
        id v20 = v18;
        os_log_type_t v21 = OS_LOG_TYPE_ERROR;
LABEL_19:
        _os_log_impl((void *)&_mh_execute_header, v20, v21, v19, buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v30 = v4;
      __int16 v19 = "Deleted file for item: %{public}@";
      id v20 = v18;
      os_log_type_t v21 = OS_LOG_TYPE_INFO;
      goto LABEL_19;
    }

    [(UASharedPasteboardDataManager *)self releaseLockForItem:v4];
LABEL_21:

    goto LABEL_22;
  }
  id v8 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Error to get sharedDir cleaning up", buf, 2u);
  }
LABEL_22:
}

- (void)cleanupArchiveDir
{
  v2 = [(UASharedPasteboardDataManager *)self sharedDataPath];
  v3 = [v2 stringByAppendingPathComponent:@"archives"];

  if (v3)
  {
    id v4 = +[NSFileManager defaultManager];
    id v24 = 0;
    id v5 = [v4 contentsOfDirectoryAtPath:v3 error:&v24];
    id v6 = v24;

    id obj = v6;
    if (v6)
    {
      id v7 = sub_10000BA18(@"pasteboard-server");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v27 = obj;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Error getting sharedDirPath archives: %{public}@", buf, 0xCu);
      }
    }
    else
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id obj = v5;
      id v8 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v21;
        do
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v21 != v10) {
              objc_enumerationMutation(obj);
            }
            unsigned __int8 v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
            long long v13 = sub_10000BA18(@"pasteboard-server");
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v27 = v12;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Attempting to deleta archive: %@", buf, 0xCu);
            }

            BOOL v14 = [v3 stringByAppendingPathComponent:v12];
            long long v15 = +[NSFileManager defaultManager];
            id v19 = 0;
            [v15 removeItemAtPath:v14 error:&v19];
            id v16 = v19;

            if (v16)
            {
              id v17 = sub_10000BA18(@"pasteboard-server");
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                id v27 = v16;
                _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Error deleting archive: %{public}@", buf, 0xCu);
              }
            }
          }
          id v9 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
        }
        while (v9);
      }
    }
  }
}

- (void)cleanupItemsDir
{
  v3 = [(UASharedPasteboardDataManager *)self sharedDataPath];
  id v4 = [v3 stringByAppendingPathComponent:@"items"];

  id v5 = +[NSFileManager defaultManager];
  id v36 = 0;
  id v6 = [v5 contentsOfDirectoryAtPath:v4 error:&v36];
  id v7 = v36;

  id v8 = [objc_alloc((Class)NSFileCoordinator) initWithFilePresenter:0];
  if (!v7)
  {
    id v27 = v8;
    v29 = self;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v26 = v6;
    id obj = v6;
    id v9 = [obj countByEnumeratingWithState:&v32 objects:v39 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v33;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v33 != v11) {
            objc_enumerationMutation(obj);
          }
          long long v13 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          BOOL v14 = sub_10000BA18(@"pasteboard-server");
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v38 = v13;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Attempting to delete item: %@", buf, 0xCu);
          }

          long long v15 = v4;
          id v16 = +[NSURL fileURLWithPath:v4];
          id v17 = +[NSURL URLWithString:v13 relativeToURL:v16];

          id v18 = [objc_alloc((Class)NSUUID) initWithUUIDString:v13];
          id v19 = [(UASharedPasteboardDataManager *)v29 lockTokens];
          long long v20 = [v19 objectForKeyedSubscript:v18];

          long long v21 = sub_10000BA18(@"pasteboard-server");
          BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_INFO);
          if (v20)
          {
            if (v22)
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "We have lock for the file, we are receiving the item and should not delete it at this time", buf, 2u);
            }

            id v4 = v15;
          }
          else
          {
            if (v22)
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Obtaining write lock to delete file", buf, 2u);
            }

            v30[4] = v13;
            id v31 = 0;
            v30[0] = _NSConcreteStackBlock;
            v30[1] = 3221225472;
            v30[2] = sub_10001C004;
            v30[3] = &unk_1000C4EA0;
            [v27 coordinateWritingItemAtURL:v17 options:1 error:&v31 byAccessor:v30];
            id v23 = v31;
            id v4 = v15;
            if (v23)
            {
              id v24 = v23;
              v25 = sub_10000BA18(@"pasteboard-server");
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                v38 = v24;
                _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Error getting coord write for deleting item: %{public}@", buf, 0xCu);
              }
            }
          }
        }
        id v10 = [obj countByEnumeratingWithState:&v32 objects:v39 count:16];
      }
      while (v10);
    }

    id v7 = 0;
    id v6 = v26;
    id v8 = v27;
  }
}

- (void)cleanupCloneDir
{
  v2 = [(UASharedPasteboardDataManager *)self fileURLForCloneItems];
  v3 = [v2 path];

  id v4 = +[NSFileManager defaultManager];
  id v27 = 0;
  id v5 = [v4 contentsOfDirectoryAtPath:v3 error:&v27];
  id v6 = v27;

  id v7 = [objc_alloc((Class)NSFileCoordinator) initWithFilePresenter:0];
  if (!v6)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id obj = v5;
    id v8 = [obj countByEnumeratingWithState:&v23 objects:v30 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v24;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v24 != v10) {
            objc_enumerationMutation(obj);
          }
          unsigned __int8 v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          long long v13 = sub_10000BA18(@"pasteboard-server");
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138477827;
            v29 = v12;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Attempting to delete copied item: %{private}@", buf, 0xCu);
          }

          BOOL v14 = +[NSURL fileURLWithPath:v3];
          long long v15 = +[NSURL URLWithString:v12 relativeToURL:v14];

          id v16 = sub_10000BA18(@"pasteboard-server");
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Obtaining write lock to delete file", buf, 2u);
          }

          v21[4] = v12;
          id v22 = 0;
          v21[0] = _NSConcreteStackBlock;
          v21[1] = 3221225472;
          v21[2] = sub_10001C4B0;
          v21[3] = &unk_1000C4EA0;
          [v7 coordinateWritingItemAtURL:v15 options:1 error:&v22 byAccessor:v21];
          id v17 = v22;
          if (v17)
          {
            id v18 = v17;
            id v19 = sub_10000BA18(@"pasteboard-server");
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v29 = v18;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Error getting coord write for deleting item: %{public}@", buf, 0xCu);
            }
          }
        }
        id v9 = [obj countByEnumeratingWithState:&v23 objects:v30 count:16];
      }
      while (v9);
    }

    id v6 = 0;
  }
}

- (NSString)currentLocalBlobPath
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCurrentLocalBlobPath:(id)a3
{
}

- (NSString)currentRemoteBlobPath
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCurrentRemoteBlobPath:(id)a3
{
}

- (NSMutableDictionary)tmpArchiveWriteFiles
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTmpArchiveWriteFiles:(id)a3
{
}

- (NSMutableDictionary)lockTokens
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLockTokens:(id)a3
{
}

- (NSMutableDictionary)providers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setProviders:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providers, 0);
  objc_storeStrong((id *)&self->_lockTokens, 0);
  objc_storeStrong((id *)&self->_tmpArchiveWriteFiles, 0);
  objc_storeStrong((id *)&self->_currentRemoteBlobPath, 0);

  objc_storeStrong((id *)&self->_currentLocalBlobPath, 0);
}

@end