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
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v35.receiver = self;
  v35.super_class = (Class)MTIDCloudKitLocalDB;
  v11 = [(MTIDCloudKitLocalDB *)&v35 init];
  v12 = v11;
  if (v11)
  {
    [(MTIDCloudKitLocalDB *)v11 setRecordType:v9];
    [(MTIDCloudKitLocalDB *)v12 setRecordZoneID:v10];
    v13 = +[NSFileManager defaultManager];
    v14 = +[MTFrameworkEnvironment sharedEnvironment];
    v15 = [v14 localDataPath];

    v16 = +[NSURL fileURLWithPath:v15];
    v17 = [v16 URLByAppendingPathComponent:@"MetricsIdentifiers"];

    v18 = [v17 URLByAppendingPathComponent:v8];

    if (v18)
    {
      id v34 = 0;
      unsigned __int8 v19 = [v13 createDirectoryAtURL:v18 withIntermediateDirectories:1 attributes:0 error:&v34];
      id v20 = v34;
      v21 = v20;
      if (v19)
      {
LABEL_7:
        [(MTIDCloudKitLocalDB *)v12 setPathURL:v18];

        goto LABEL_8;
      }
      v32 = v20;
      unsigned __int8 v33 = 0;
      v22 = [v18 path];
      unsigned int v23 = [v13 fileExistsAtPath:v22 isDirectory:&v33];
      int v24 = v33;

      if (v23 && v24)
      {
        v21 = v32;
        goto LABEL_7;
      }
      v28 = MTMetricsKitOSLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v37 = v32;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "MetricsKit: Error: %@", buf, 0xCu);
      }

      v29 = [v18 path];
      v30 = +[NSString stringWithFormat:@"Application doesn't have write access to %@", v29];
      v31 = [v32 userInfo];
      id v27 = +[NSException exceptionWithName:@"MTIDCloudKitLocalDB" reason:v30 userInfo:v31];
    }
    else
    {
      v26 = +[NSString stringWithFormat:@"MTFrameworkEnvironment.sharedEnvironment.localDataPath is not valid: %@", v15];
      id v27 = +[NSException exceptionWithName:@"MTIDCloudKitLocalDB" reason:v26 userInfo:0];
    }
    objc_exception_throw(v27);
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
  id v9 = +[NSData dataWithContentsOfURL:v8 options:0 error:&v15];
  id v10 = v15;
  v11 = v10;
  if (a4 && !v9)
  {
    v12 = [v10 domain];
    if ([v12 isEqualToString:NSCocoaErrorDomain])
    {
      id v13 = [v11 code];

      if (v13 == (id)260) {
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

    unsigned __int8 v12 = [v8 writeToURL:v11 options:1 error:a5];
    id v9 = (id)v11;
  }
  else
  {
    unsigned __int8 v12 = [(MTIDCloudKitLocalDB *)self deleteIfExists:v9 error:a5];
  }

  return v12;
}

- (BOOL)fileExists:(id)a3
{
  id v4 = a3;
  v5 = [(MTIDCloudKitLocalDB *)self pathURL];
  id v6 = [v5 URLByAppendingPathComponent:v4];

  v7 = +[NSFileManager defaultManager];
  id v8 = [v6 path];
  unsigned __int8 v9 = [v7 fileExistsAtPath:v8];

  return v9;
}

- (BOOL)deleteIfExists:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(MTIDCloudKitLocalDB *)self pathURL];
  id v8 = [v7 URLByAppendingPathComponent:v6];

  unsigned __int8 v9 = +[NSFileManager defaultManager];
  id v15 = 0;
  unsigned __int8 v10 = [v9 removeItemAtURL:v8 error:&v15];
  id v11 = v15;
  unsigned __int8 v12 = [v11 domain];
  if (![v12 isEqualToString:NSCocoaErrorDomain])
  {

    if (!a4) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  id v13 = [v11 code];

  if (v13 == (id)4) {
    unsigned __int8 v10 = 1;
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
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
  [v3 encodeSystemFieldsWithCoder:v4];
  id v5 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
  id v6 = [v4 encodedData];
  [v5 encodeObject:v6 forKey:@"systemFields"];

  v7 = [v3 objectForKeyedSubscript:@"namespace"];
  [v5 encodeObject:v7 forKey:@"namespace"];

  id v8 = [v3 objectForKeyedSubscript:@"secretKey"];
  [v5 encodeObject:v8 forKey:@"secretKey"];

  unsigned __int8 v9 = [v3 objectForKeyedSubscript:@"expiration"];
  [v5 encodeObject:v9 forKey:@"expiration"];

  unsigned __int8 v10 = objc_msgSend(v3, "mt_secretValue");

  [v5 encodeObject:v10 forKey:@"secretValue"];
  id v11 = [v5 encodedData];

  return v11;
}

- (id)decodeRecordFromData:(id)a3 recordID:(id)a4 isSynchronized:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v9 error:0];

  [v10 setRequiresSecureCoding:1];
  id v11 = [v10 decodeObjectOfClass:objc_opt_class() forKey:@"systemFields"];
  if (v11)
  {
    id v12 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v11 error:0];
    [v12 setRequiresSecureCoding:1];
    id v13 = [objc_alloc((Class)CKRecord) initWithCoder:v12];

    if (v13)
    {
      v14 = [v13 recordType];
      id v15 = [(MTIDCloudKitLocalDB *)self recordType];
      unsigned __int8 v16 = [v14 isEqualToString:v15];

      if (v16) {
        goto LABEL_6;
      }
    }
    if (v8)
    {
LABEL_5:
      id v17 = objc_alloc((Class)CKRecord);
      v18 = [(MTIDCloudKitLocalDB *)self recordType];
      id v19 = [v17 initWithRecordType:v18 recordID:v8];

      BOOL v5 = 0;
      id v13 = v19;
LABEL_6:
      id v20 = [v10 decodeObjectOfClass:objc_opt_class() forKey:@"namespace"];
      [v13 setObject:v20 forKeyedSubscript:@"namespace"];

      v21 = [v10 decodeObjectOfClass:objc_opt_class() forKey:@"secretKey"];
      [v13 setObject:v21 forKeyedSubscript:@"secretKey"];

      v22 = [v10 decodeObjectOfClass:objc_opt_class() forKey:@"expiration"];
      [v13 setObject:v22 forKeyedSubscript:@"expiration"];

      unsigned int v23 = [v10 decodeObjectOfClass:objc_opt_class() forKey:@"secretValue"];
      objc_msgSend(v13, "mt_setSecretValue:", v23);

      objc_msgSend(v13, "mt_setSynchronized:", v5);
      id v13 = v13;
      int v24 = v13;
      goto LABEL_9;
    }
  }
  else
  {
    id v13 = 0;
    if (v8) {
      goto LABEL_5;
    }
  }
  int v24 = 0;
LABEL_9:

  return v24;
}

- (id)userRecordIDName
{
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
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "MetricsKit: Failed to load user record ID with error %@", buf, 0xCu);
    }

    goto LABEL_5;
  }
  if (!v2)
  {
LABEL_5:
    id v5 = 0;
    goto LABEL_8;
  }
  id v5 = [objc_alloc((Class)NSString) initWithData:v2 encoding:4];
LABEL_8:

  return v5;
}

- (BOOL)setUserRecordIDName:(id)a3
{
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
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "MetricsKit: CloudKit user has changed", buf, 2u);
    }

    [(MTIDCloudKitLocalDB *)self clearData];
    if (v4) {
      [(MTIDCloudKitLocalDB *)self setNeedsFetchRecords:1];
    }
    id v8 = [v4 dataUsingEncoding:4];
    id v13 = 0;
    unsigned __int8 v9 = [(MTIDCloudKitLocalDB *)self writeData:v8 forName:@"UserRecordID" error:&v13];
    id v10 = v13;

    if ((v9 & 1) == 0)
    {
      id v11 = MTMetricsKitOSLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v15 = v10;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "MetricsKit: Failed to write user record ID with error %@", buf, 0xCu);
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
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "MetricsKit: Failed to write fetch file with error %@", buf, 0xCu);
  }

LABEL_8:
}

- (id)syncStatusCode
{
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
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "MetricsKit: Failed to load sync engine status with error %@", buf, 0xCu);
    }

    id v5 = 0;
  }
  else if (v2)
  {
    id v5 = (__CFString *)[objc_alloc((Class)NSString) initWithData:v2 encoding:4];
  }
  else
  {
    id v5 = @"Starting";
  }

  return v5;
}

- (void)setSyncStatusCode:(id)a3
{
  id v4 = [a3 dataUsingEncoding:4];
  id v8 = 0;
  unsigned __int8 v5 = [(MTIDCloudKitLocalDB *)self writeData:v4 forName:@"SyncEngineStatus" error:&v8];
  id v6 = v8;

  if ((v5 & 1) == 0)
  {
    id v7 = MTMetricsKitOSLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "MetricsKit: Failed to write sync engine status with error %@", buf, 0xCu);
    }
  }
}

- (BOOL)writeRecord:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = self;
  objc_sync_enter(v7);
  id v8 = [v6 recordID];
  id v9 = objc_msgSend(v8, "mt_syncingFileName");

  if (!objc_msgSend(v6, "mt_isSynchronized"))
  {
    unsigned __int8 v16 = MTMetricsKitOSLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      id v17 = [v6 recordID];
      v18 = [v17 recordName];
      id v19 = [v6 objectForKeyedSubscript:@"namespace"];
      int v25 = 138412546;
      v26 = v18;
      __int16 v27 = 2112;
      v28 = v19;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "MetricsKit: Saving unsynchronized record with ID %@ for namespace %@", (uint8_t *)&v25, 0x16u);
    }
    id v20 = [v6 recordID];
    v21 = objc_msgSend(v20, "mt_syncedFileName");
    unsigned int v22 = [(MTIDCloudKitLocalDB *)v7 deleteIfExists:v21 error:a4];

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
    id v11 = [v6 recordID];
    id v12 = [v11 recordName];
    id v13 = [v6 objectForKeyedSubscript:@"namespace"];
    int v25 = 138412546;
    v26 = v12;
    __int16 v27 = 2112;
    v28 = v13;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "MetricsKit: Saving synchronized record with ID %@ for namespace %@", (uint8_t *)&v25, 0x16u);
  }
  if (![(MTIDCloudKitLocalDB *)v7 deleteIfExists:v9 error:a4]) {
    goto LABEL_11;
  }
  v14 = [v6 recordID];
  uint64_t v15 = objc_msgSend(v14, "mt_syncedFileName");

  id v9 = (void *)v15;
LABEL_9:
  unsigned int v23 = [(MTIDCloudKitLocalDB *)v7 encodeRecord:v6];
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
  id v6 = a3;
  id v7 = self;
  objc_sync_enter(v7);
  id v8 = objc_msgSend(v6, "mt_syncedFileName");
  BOOL v9 = [(MTIDCloudKitLocalDB *)v7 fileExists:v8];
  if (!v9)
  {
    uint64_t v10 = objc_msgSend(v6, "mt_syncingFileName");

    id v8 = (void *)v10;
  }
  id v11 = [(MTIDCloudKitLocalDB *)v7 dataForName:v8 error:a4];
  if (v11)
  {
    id v12 = [(MTIDCloudKitLocalDB *)v7 decodeRecordFromData:v11 recordID:v6 isSynchronized:v9];
    if (!v12)
    {
      id v17 = 0;
      unsigned __int8 v13 = [(MTIDCloudKitLocalDB *)v7 deleteIfExists:v8 error:&v17];
      id v14 = v17;
      if ((v13 & 1) == 0)
      {
        uint64_t v15 = MTMetricsKitOSLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v19 = v8;
          __int16 v20 = 2112;
          id v21 = v14;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "MetricsKit: Failed to delete corrupted data file %@ error %@", buf, 0x16u);
        }
      }
    }
  }
  else
  {
    id v12 = 0;
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
    BOOL v9 = objc_msgSend(v6, "mt_syncedFileName");
    unsigned __int8 v10 = [(MTIDCloudKitLocalDB *)v7 deleteIfExists:v9 error:a4];
  }
  else
  {
    unsigned __int8 v10 = 0;
  }

  objc_sync_exit(v7);
  return v10;
}

- (id)pendingRecordIDs
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = +[NSFileManager defaultManager];
  id v4 = +[NSMutableArray array];
  unsigned __int8 v5 = +[CKRecordID mt_syncingFileExtension];
  id v6 = [(MTIDCloudKitLocalDB *)v2 pathURL];
  id v7 = [v6 path];
  id v8 = [v3 enumeratorAtPath:v7];
  BOOL v9 = 0;
LABEL_2:

  unsigned __int8 v10 = v9;
  while (1)
  {
    BOOL v9 = [v8 nextObject];

    if (!v9) {
      break;
    }
    unsigned __int8 v10 = v9;
    if ([v9 hasSuffix:v5])
    {
      id v6 = objc_msgSend(v9, "substringToIndex:", (unsigned char *)objc_msgSend(v9, "length") - (unsigned char *)objc_msgSend(v5, "length"));
      id v11 = objc_alloc((Class)CKRecordID);
      id v7 = [(MTIDCloudKitLocalDB *)v2 recordZoneID];
      id v12 = [v11 initWithRecordName:v6 zoneID:v7];
      [v4 addObject:v12];

      goto LABEL_2;
    }
  }

  objc_sync_exit(v2);

  return v4;
}

- (void)clearData
{
  id v3 = MTMetricsKitOSLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "MetricsKit: Clearing local CloudKit record cache", buf, 2u);
  }

  id v4 = self;
  objc_sync_enter(v4);
  unsigned __int8 v5 = +[NSFileManager defaultManager];
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
    unsigned __int8 v11 = [v5 removeItemAtURL:v10 error:&v16];
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
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "MetricsKit: Failed to remove local record data %@ with error %@", buf, 0x16u);
      }
    }
    id v8 = (void *)v10;
  }

  objc_sync_exit(v4);
}

- (id)allRecords
{
  id v3 = +[NSFileManager defaultManager];
  id v4 = [(MTIDCloudKitLocalDB *)self pathURL];
  unsigned __int8 v5 = [v3 enumeratorAtURL:v4 includingPropertiesForKeys:0 options:1 errorHandler:0];

  id v6 = +[NSMutableArray array];
  uint64_t v7 = [v5 nextObject];
  if (v7)
  {
    id v8 = (void *)v7;
    do
    {
      long long v9 = +[NSData dataWithContentsOfURL:v8 options:0 error:0];
      if (v9)
      {
        uint64_t v10 = [v8 path];
        unsigned __int8 v11 = +[CKRecordID mt_syncedFileExtension];
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