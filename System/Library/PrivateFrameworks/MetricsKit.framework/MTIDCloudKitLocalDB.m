@interface MTIDCloudKitLocalDB
- (BOOL)deleteIfExists:(id)a3 error:(id *)a4;
- (BOOL)deleteRecordWithID:(id)a3 error:(id *)a4;
- (BOOL)fileExists:(id)a3;
- (BOOL)needsFetchRecords;
- (BOOL)setUserRecordIDName:(id)a3;
- (BOOL)writeData:(id)a3 forName:(id)a4 error:(id *)a5;
- (BOOL)writeRecord:(id)a3 error:(id *)a4;
- (BOOL)zoneCreated;
- (CKRecordZoneID)recordZoneID;
- (MTIDCloudKitLocalDB)initWithContainerIdentifier:(id)a3 recordType:(id)a4 recordZoneID:(id)a5;
- (MTIDCloudKitLocalDBDelegate)delegate;
- (NSString)recordType;
- (NSURL)pathURL;
- (id)allRecords;
- (id)dataForName:(id)a3 error:(id *)a4;
- (id)decodeRecordFromData:(id)a3 recordID:(id)a4 isSynchronized:(BOOL)a5;
- (id)encodeRecord:(id)a3;
- (id)pendingRecordIDs;
- (id)recordWithID:(id)a3 error:(id *)a4;
- (id)syncStatusCode;
- (id)userRecordIDName;
- (void)clearData;
- (void)setDelegate:(id)a3;
- (void)setNeedsFetchRecords:(BOOL)a3;
- (void)setPathURL:(id)a3;
- (void)setRecordType:(id)a3;
- (void)setRecordZoneID:(id)a3;
- (void)setSyncStatusCode:(id)a3;
- (void)setZoneCreated:(BOOL)a3;
@end

@implementation MTIDCloudKitLocalDB

- (MTIDCloudKitLocalDB)initWithContainerIdentifier:(id)a3 recordType:(id)a4 recordZoneID:(id)a5
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v38.receiver = self;
  v38.super_class = (Class)MTIDCloudKitLocalDB;
  v11 = [(MTIDCloudKitLocalDB *)&v38 init];
  v12 = v11;
  if (v11)
  {
    [(MTIDCloudKitLocalDB *)v11 setRecordType:v9];
    [(MTIDCloudKitLocalDB *)v12 setRecordZoneID:v10];
    v13 = [MEMORY[0x263F08850] defaultManager];
    v14 = +[MTFrameworkEnvironment sharedEnvironment];
    v15 = [v14 localDataPath];

    v16 = [NSURL fileURLWithPath:v15];
    v17 = [v16 URLByAppendingPathComponent:@"MetricsIdentifiers"];

    v18 = [v17 URLByAppendingPathComponent:v8];

    if (v18)
    {
      id v37 = 0;
      char v19 = [v13 createDirectoryAtURL:v18 withIntermediateDirectories:1 attributes:0 error:&v37];
      id v20 = v37;
      v21 = v20;
      if (v19)
      {
LABEL_7:
        [(MTIDCloudKitLocalDB *)v12 setPathURL:v18];

        goto LABEL_8;
      }
      v35 = v20;
      unsigned __int8 v36 = 0;
      v22 = [v18 path];
      int v23 = [v13 fileExistsAtPath:v22 isDirectory:&v36];
      int v24 = v36;

      if (v23 && v24)
      {
        v21 = v35;
        goto LABEL_7;
      }
      v29 = MTMetricsKitOSLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v40 = v35;
        _os_log_impl(&dword_218211000, v29, OS_LOG_TYPE_ERROR, "MetricsKit: Error: %@", buf, 0xCu);
      }

      v30 = (void *)MEMORY[0x263EFF940];
      v31 = NSString;
      v32 = [v18 path];
      v33 = [v31 stringWithFormat:@"Application doesn't have write access to %@", v32];
      v34 = [v35 userInfo];
      id v28 = [v30 exceptionWithName:@"MTIDCloudKitLocalDB" reason:v33 userInfo:v34];
    }
    else
    {
      v26 = (void *)MEMORY[0x263EFF940];
      v27 = [NSString stringWithFormat:@"MTFrameworkEnvironment.sharedEnvironment.localDataPath is not valid: %@", v15];
      id v28 = [v26 exceptionWithName:@"MTIDCloudKitLocalDB" reason:v27 userInfo:0];
    }
    objc_exception_throw(v28);
  }
LABEL_8:

  return v12;
}

- (id)dataForName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(MTIDCloudKitLocalDB *)self pathURL];
  id v8 = [v7 URLByAppendingPathComponent:v6];

  id v15 = 0;
  id v9 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v8 options:0 error:&v15];
  id v10 = v15;
  v11 = v10;
  if (a4 && !v9)
  {
    v12 = [v10 domain];
    if ([v12 isEqualToString:*MEMORY[0x263F07F70]])
    {
      uint64_t v13 = [v11 code];

      if (v13 == 260) {
        goto LABEL_8;
      }
    }
    else
    {
    }
    *a4 = v11;
  }
LABEL_8:

  return v9;
}

- (BOOL)writeData:(id)a3 forName:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    id v10 = [(MTIDCloudKitLocalDB *)self pathURL];
    uint64_t v11 = [v10 URLByAppendingPathComponent:v9];

    char v12 = [v8 writeToURL:v11 options:1 error:a5];
    id v9 = (id)v11;
  }
  else
  {
    char v12 = [(MTIDCloudKitLocalDB *)self deleteIfExists:v9 error:a5];
  }

  return v12;
}

- (BOOL)fileExists:(id)a3
{
  id v4 = a3;
  v5 = [(MTIDCloudKitLocalDB *)self pathURL];
  id v6 = [v5 URLByAppendingPathComponent:v4];

  v7 = [MEMORY[0x263F08850] defaultManager];
  id v8 = [v6 path];
  char v9 = [v7 fileExistsAtPath:v8];

  return v9;
}

- (BOOL)deleteIfExists:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(MTIDCloudKitLocalDB *)self pathURL];
  id v8 = [v7 URLByAppendingPathComponent:v6];

  char v9 = [MEMORY[0x263F08850] defaultManager];
  id v15 = 0;
  char v10 = [v9 removeItemAtURL:v8 error:&v15];
  id v11 = v15;
  char v12 = [v11 domain];
  if (![v12 isEqualToString:*MEMORY[0x263F07F70]])
  {

    if (!a4) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  uint64_t v13 = [v11 code];

  if (v13 == 4) {
    char v10 = 1;
  }
  if (a4)
  {
LABEL_7:
    if ((v10 & 1) == 0) {
      *a4 = v11;
    }
  }
LABEL_9:

  return v10;
}

- (id)encodeRecord:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F08910];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initRequiringSecureCoding:1];
  [v4 encodeSystemFieldsWithCoder:v5];
  id v6 = (void *)[objc_alloc(MEMORY[0x263F08910]) initRequiringSecureCoding:1];
  v7 = [v5 encodedData];
  [v6 encodeObject:v7 forKey:@"systemFields"];

  id v8 = [v4 objectForKeyedSubscript:@"namespace"];
  [v6 encodeObject:v8 forKey:@"namespace"];

  char v9 = [v4 objectForKeyedSubscript:@"secretKey"];
  [v6 encodeObject:v9 forKey:@"secretKey"];

  char v10 = [v4 objectForKeyedSubscript:@"expiration"];
  [v6 encodeObject:v10 forKey:@"expiration"];

  id v11 = objc_msgSend(v4, "mt_secretValue");

  [v6 encodeObject:v11 forKey:@"secretValue"];
  char v12 = [v6 encodedData];

  return v12;
}

- (id)decodeRecordFromData:(id)a3 recordID:(id)a4 isSynchronized:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  char v9 = (objc_class *)MEMORY[0x263F08928];
  id v10 = a3;
  id v11 = (void *)[[v9 alloc] initForReadingFromData:v10 error:0];

  [v11 setRequiresSecureCoding:1];
  char v12 = [v11 decodeObjectOfClass:objc_opt_class() forKey:@"systemFields"];
  if (v12)
  {
    uint64_t v13 = (void *)[objc_alloc(MEMORY[0x263F08928]) initForReadingFromData:v12 error:0];
    [v13 setRequiresSecureCoding:1];
    id v14 = (id)[objc_alloc(MEMORY[0x263EFD7C8]) initWithCoder:v13];

    if (v14)
    {
      id v15 = [v14 recordType];
      v16 = [(MTIDCloudKitLocalDB *)self recordType];
      char v17 = [v15 isEqualToString:v16];

      if (v17) {
        goto LABEL_6;
      }
    }
    if (v8)
    {
LABEL_5:
      id v18 = objc_alloc(MEMORY[0x263EFD7C8]);
      char v19 = [(MTIDCloudKitLocalDB *)self recordType];
      uint64_t v20 = [v18 initWithRecordType:v19 recordID:v8];

      BOOL v5 = 0;
      id v14 = (id)v20;
LABEL_6:
      v21 = [v11 decodeObjectOfClass:objc_opt_class() forKey:@"namespace"];
      [v14 setObject:v21 forKeyedSubscript:@"namespace"];

      v22 = [v11 decodeObjectOfClass:objc_opt_class() forKey:@"secretKey"];
      [v14 setObject:v22 forKeyedSubscript:@"secretKey"];

      int v23 = [v11 decodeObjectOfClass:objc_opt_class() forKey:@"expiration"];
      [v14 setObject:v23 forKeyedSubscript:@"expiration"];

      int v24 = [v11 decodeObjectOfClass:objc_opt_class() forKey:@"secretValue"];
      objc_msgSend(v14, "mt_setSecretValue:", v24);

      objc_msgSend(v14, "mt_setSynchronized:", v5);
      id v14 = v14;
      v25 = v14;
      goto LABEL_9;
    }
  }
  else
  {
    id v14 = 0;
    if (v8) {
      goto LABEL_5;
    }
  }
  v25 = 0;
LABEL_9:

  return v25;
}

- (id)userRecordIDName
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v7 = 0;
  v2 = [(MTIDCloudKitLocalDB *)self dataForName:@"UserRecordID" error:&v7];
  id v3 = v7;
  if (v3)
  {
    id v4 = MTMetricsKitOSLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_218211000, v4, OS_LOG_TYPE_ERROR, "MetricsKit: Failed to load user record ID with error %@", buf, 0xCu);
    }

    goto LABEL_5;
  }
  if (!v2)
  {
LABEL_5:
    BOOL v5 = 0;
    goto LABEL_8;
  }
  BOOL v5 = (void *)[[NSString alloc] initWithData:v2 encoding:4];
LABEL_8:

  return v5;
}

- (BOOL)setUserRecordIDName:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(MTIDCloudKitLocalDB *)self userRecordIDName];
  if (v5 == v4 || ([v4 isEqual:v5] & 1) != 0)
  {
    BOOL v6 = 0;
  }
  else
  {
    id v7 = MTMetricsKitOSLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218211000, v7, OS_LOG_TYPE_DEBUG, "MetricsKit: CloudKit user has changed", buf, 2u);
    }

    [(MTIDCloudKitLocalDB *)self clearData];
    if (v4) {
      [(MTIDCloudKitLocalDB *)self setNeedsFetchRecords:1];
    }
    id v8 = [v4 dataUsingEncoding:4];
    id v13 = 0;
    BOOL v9 = [(MTIDCloudKitLocalDB *)self writeData:v8 forName:@"UserRecordID" error:&v13];
    id v10 = v13;

    if (!v9)
    {
      id v11 = MTMetricsKitOSLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v15 = v10;
        _os_log_impl(&dword_218211000, v11, OS_LOG_TYPE_ERROR, "MetricsKit: Failed to write user record ID with error %@", buf, 0xCu);
      }
    }
    [(MTIDCloudKitLocalDB *)self setZoneCreated:0];

    BOOL v6 = 1;
  }

  return v6;
}

- (BOOL)needsFetchRecords
{
  return [(MTIDCloudKitLocalDB *)self fileExists:@"NeedsFetch"];
}

- (void)setNeedsFetchRecords:(BOOL)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v4 = [@"1" dataUsingEncoding:4];
    id v8 = 0;
    [(MTIDCloudKitLocalDB *)self writeData:v4 forName:@"NeedsFetch" error:&v8];
    id v5 = v8;

    if (!v5) {
      goto LABEL_8;
    }
  }
  else
  {
    id v7 = 0;
    [(MTIDCloudKitLocalDB *)self deleteIfExists:@"NeedsFetch" error:&v7];
    id v5 = v7;
    if (!v5) {
      goto LABEL_8;
    }
  }
  BOOL v6 = MTMetricsKitOSLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v5;
    _os_log_impl(&dword_218211000, v6, OS_LOG_TYPE_ERROR, "MetricsKit: Failed to write fetch file with error %@", buf, 0xCu);
  }

LABEL_8:
}

- (id)syncStatusCode
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v7 = 0;
  v2 = [(MTIDCloudKitLocalDB *)self dataForName:@"SyncEngineStatus" error:&v7];
  id v3 = v7;
  if (v3)
  {
    id v4 = MTMetricsKitOSLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_218211000, v4, OS_LOG_TYPE_ERROR, "MetricsKit: Failed to load sync engine status with error %@", buf, 0xCu);
    }

    id v5 = 0;
  }
  else if (v2)
  {
    id v5 = (__CFString *)[[NSString alloc] initWithData:v2 encoding:4];
  }
  else
  {
    id v5 = @"Starting";
  }

  return v5;
}

- (void)setSyncStatusCode:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = [a3 dataUsingEncoding:4];
  id v8 = 0;
  BOOL v5 = [(MTIDCloudKitLocalDB *)self writeData:v4 forName:@"SyncEngineStatus" error:&v8];
  id v6 = v8;

  if (!v5)
  {
    id v7 = MTMetricsKitOSLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v6;
      _os_log_impl(&dword_218211000, v7, OS_LOG_TYPE_ERROR, "MetricsKit: Failed to write sync engine status with error %@", buf, 0xCu);
    }
  }
}

- (BOOL)writeRecord:(id)a3 error:(id *)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = self;
  objc_sync_enter(v7);
  id v8 = [v6 recordID];
  id v9 = objc_msgSend(v8, "mt_syncingFileName");

  if (!objc_msgSend(v6, "mt_isSynchronized"))
  {
    uint64_t v16 = MTMetricsKitOSLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      char v17 = [v6 recordID];
      id v18 = [v17 recordName];
      char v19 = [v6 objectForKeyedSubscript:@"namespace"];
      int v25 = 138412546;
      v26 = v18;
      __int16 v27 = 2112;
      id v28 = v19;
      _os_log_impl(&dword_218211000, v16, OS_LOG_TYPE_DEBUG, "MetricsKit: Saving unsynchronized record with ID %@ for namespace %@", (uint8_t *)&v25, 0x16u);
    }
    uint64_t v20 = [v6 recordID];
    v21 = objc_msgSend(v20, "mt_syncedFileName");
    BOOL v22 = [(MTIDCloudKitLocalDB *)v7 deleteIfExists:v21 error:a4];

    if (v22) {
      goto LABEL_9;
    }
LABEL_11:
    LOBYTE(a4) = 0;
    goto LABEL_12;
  }
  id v10 = MTMetricsKitOSLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = [v6 recordID];
    char v12 = [v11 recordName];
    id v13 = [v6 objectForKeyedSubscript:@"namespace"];
    int v25 = 138412546;
    v26 = v12;
    __int16 v27 = 2112;
    id v28 = v13;
    _os_log_impl(&dword_218211000, v10, OS_LOG_TYPE_DEBUG, "MetricsKit: Saving synchronized record with ID %@ for namespace %@", (uint8_t *)&v25, 0x16u);
  }
  if (![(MTIDCloudKitLocalDB *)v7 deleteIfExists:v9 error:a4]) {
    goto LABEL_11;
  }
  id v14 = [v6 recordID];
  uint64_t v15 = objc_msgSend(v14, "mt_syncedFileName");

  id v9 = (void *)v15;
LABEL_9:
  int v23 = [(MTIDCloudKitLocalDB *)v7 encodeRecord:v6];
  LODWORD(a4) = [(MTIDCloudKitLocalDB *)v7 writeData:v23 forName:v9 error:a4];

  if (a4)
  {
    a4 = [(MTIDCloudKitLocalDB *)v7 delegate];
    [a4 cloudKitLocalDB:v7 didChangeRecord:v6];

    LOBYTE(a4) = 1;
  }
LABEL_12:

  objc_sync_exit(v7);
  return (char)a4;
}

- (id)recordWithID:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = self;
  objc_sync_enter(v7);
  id v8 = objc_msgSend(v6, "mt_syncedFileName");
  uint64_t v9 = [(MTIDCloudKitLocalDB *)v7 fileExists:v8];
  if ((v9 & 1) == 0)
  {
    uint64_t v10 = objc_msgSend(v6, "mt_syncingFileName");

    id v8 = (void *)v10;
  }
  uint64_t v11 = [(MTIDCloudKitLocalDB *)v7 dataForName:v8 error:a4];
  if (v11)
  {
    char v12 = [(MTIDCloudKitLocalDB *)v7 decodeRecordFromData:v11 recordID:v6 isSynchronized:v9];
    if (!v12)
    {
      id v17 = 0;
      BOOL v13 = [(MTIDCloudKitLocalDB *)v7 deleteIfExists:v8 error:&v17];
      id v14 = v17;
      if (!v13)
      {
        uint64_t v15 = MTMetricsKitOSLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          char v19 = v8;
          __int16 v20 = 2112;
          id v21 = v14;
          _os_log_impl(&dword_218211000, v15, OS_LOG_TYPE_ERROR, "MetricsKit: Failed to delete corrupted data file %@ error %@", buf, 0x16u);
        }
      }
    }
  }
  else
  {
    char v12 = 0;
  }

  objc_sync_exit(v7);

  return v12;
}

- (BOOL)deleteRecordWithID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = self;
  objc_sync_enter(v7);
  id v8 = objc_msgSend(v6, "mt_syncingFileName");
  if ([(MTIDCloudKitLocalDB *)v7 deleteIfExists:v8 error:a4])
  {
    uint64_t v9 = objc_msgSend(v6, "mt_syncedFileName");
    BOOL v10 = [(MTIDCloudKitLocalDB *)v7 deleteIfExists:v9 error:a4];
  }
  else
  {
    BOOL v10 = 0;
  }

  objc_sync_exit(v7);
  return v10;
}

- (id)pendingRecordIDs
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [MEMORY[0x263F08850] defaultManager];
  id v4 = [MEMORY[0x263EFF980] array];
  BOOL v5 = objc_msgSend(MEMORY[0x263EFD7E8], "mt_syncingFileExtension");
  id v6 = [(MTIDCloudKitLocalDB *)v2 pathURL];
  id v7 = [v6 path];
  id v8 = [v3 enumeratorAtPath:v7];
  uint64_t v9 = 0;
LABEL_2:

  BOOL v10 = v9;
  while (1)
  {
    uint64_t v9 = [v8 nextObject];

    if (!v9) {
      break;
    }
    BOOL v10 = v9;
    if ([v9 hasSuffix:v5])
    {
      id v6 = objc_msgSend(v9, "substringToIndex:", objc_msgSend(v9, "length") - objc_msgSend(v5, "length"));
      id v11 = objc_alloc(MEMORY[0x263EFD7E8]);
      id v7 = [(MTIDCloudKitLocalDB *)v2 recordZoneID];
      char v12 = (void *)[v11 initWithRecordName:v6 zoneID:v7];
      [v4 addObject:v12];

      goto LABEL_2;
    }
  }

  objc_sync_exit(v2);

  return v4;
}

- (void)clearData
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = MTMetricsKitOSLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218211000, v3, OS_LOG_TYPE_DEBUG, "MetricsKit: Clearing local CloudKit record cache", buf, 2u);
  }

  id v4 = self;
  objc_sync_enter(v4);
  BOOL v5 = [MEMORY[0x263F08850] defaultManager];
  id v6 = [(MTIDCloudKitLocalDB *)v4 pathURL];
  id v7 = [v5 enumeratorAtURL:v6 includingPropertiesForKeys:0 options:1 errorHandler:0];

  id v8 = 0;
  *(void *)&long long v9 = 138412546;
  long long v15 = v9;
  while (1)
  {
    uint64_t v10 = objc_msgSend(v7, "nextObject", v15);

    if (!v10) {
      break;
    }
    id v16 = 0;
    char v11 = [v5 removeItemAtURL:v10 error:&v16];
    id v12 = v16;
    if (v12) {
      char v13 = v11;
    }
    else {
      char v13 = 1;
    }
    if ((v13 & 1) == 0)
    {
      id v14 = MTMetricsKitOSLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v15;
        uint64_t v18 = v10;
        __int16 v19 = 2112;
        id v20 = v12;
        _os_log_impl(&dword_218211000, v14, OS_LOG_TYPE_ERROR, "MetricsKit: Failed to remove local record data %@ with error %@", buf, 0x16u);
      }
    }
    id v8 = (void *)v10;
  }

  objc_sync_exit(v4);
}

- (id)allRecords
{
  id v3 = [MEMORY[0x263F08850] defaultManager];
  id v4 = [(MTIDCloudKitLocalDB *)self pathURL];
  BOOL v5 = [v3 enumeratorAtURL:v4 includingPropertiesForKeys:0 options:1 errorHandler:0];

  id v6 = [MEMORY[0x263EFF980] array];
  uint64_t v7 = [v5 nextObject];
  if (v7)
  {
    id v8 = (void *)v7;
    do
    {
      long long v9 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v8 options:0 error:0];
      if (v9)
      {
        uint64_t v10 = [v8 path];
        char v11 = objc_msgSend(MEMORY[0x263EFD7E8], "mt_syncedFileExtension");
        id v12 = -[MTIDCloudKitLocalDB decodeRecordFromData:recordID:isSynchronized:](self, "decodeRecordFromData:recordID:isSynchronized:", v9, 0, [v10 hasSuffix:v11]);

        if (v12) {
          [v6 addObject:v12];
        }
      }
      uint64_t v13 = [v5 nextObject];

      id v8 = (void *)v13;
    }
    while (v13);
  }

  return v6;
}

- (MTIDCloudKitLocalDBDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MTIDCloudKitLocalDBDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)recordType
{
  return self->_recordType;
}

- (void)setRecordType:(id)a3
{
}

- (CKRecordZoneID)recordZoneID
{
  return self->_recordZoneID;
}

- (void)setRecordZoneID:(id)a3
{
}

- (NSURL)pathURL
{
  return self->_pathURL;
}

- (void)setPathURL:(id)a3
{
}

- (BOOL)zoneCreated
{
  return self->_zoneCreated;
}

- (void)setZoneCreated:(BOOL)a3
{
  self->_zoneCreated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathURL, 0);
  objc_storeStrong((id *)&self->_recordZoneID, 0);
  objc_storeStrong((id *)&self->_recordType, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end