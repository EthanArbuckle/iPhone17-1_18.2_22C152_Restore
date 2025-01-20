@interface BACloudKitDownload
+ (BOOL)supportsSecureCoding;
- (BACloudKitDownload)init;
- (BACloudKitDownload)initWithCoder:(id)a3;
- (BACloudKitDownload)initWithIdentifier:(id)a3 recordType:(id)a4 expectedFieldKey:(id)a5 expectedFieldValue:(id)a6 assetKey:(id)a7 applicationGroupIdentifier:(id)a8;
- (BACloudKitDownload)initWithIdentifier:(id)a3 recordType:(id)a4 expectedFieldKey:(id)a5 expectedFieldValue:(id)a6 assetKey:(id)a7 applicationGroupIdentifier:(id)a8 containerIdentifier:(id)a9 zoneID:(id)a10 databaseScope:(int64_t)a11 priority:(int64_t)a12;
- (BACloudKitDownload)initWithIdentifier:(id)a3 recordType:(id)a4 recordName:(id)a5 assetKey:(id)a6 applicationGroupIdentifier:(id)a7;
- (BACloudKitDownloadManager)downloadManager;
- (BOOL)startDownloadWithDelegate:(id)a3 error:(id *)a4;
- (CKContainerID)containerID;
- (CKQuery)query;
- (CKRecordZoneID)zoneID;
- (NSString)assetKey;
- (NSString)masqueradeIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)databaseScope;
- (void)_downloadDidPause;
- (void)_downloadFailedWithError:(id)a3;
- (void)_downloadSucceededWithURL:(id)a3;
- (void)cancelDownload;
- (void)downloadDidPause;
- (void)downloadFailedWithError:(id)a3;
- (void)downloadSucceededWithURL:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)pauseDownload;
- (void)setAssetKey:(id)a3;
- (void)setContainerID:(id)a3;
- (void)setDatabaseScope:(int64_t)a3;
- (void)setDownloadManager:(id)a3;
- (void)setMasqueradeIdentifier:(id)a3;
- (void)setQuery:(id)a3;
- (void)setZoneID:(id)a3;
@end

@implementation BACloudKitDownload

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BACloudKitDownload)init
{
  result = (BACloudKitDownload *)os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
  if (result)
  {
    int v3 = 136315138;
    v4 = "BACloudKitDownload cannot be constructed using -init.";
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "BUG IN CLIENT OF BackgroundAssets: %s", (uint8_t *)&v3, 0xCu);
  }
  qword_1000694C8 = (uint64_t)"BUG IN CLIENT OF BackgroundAssets: BACloudKitDownload cannot be constructed using -init.";
  __break(1u);
  return result;
}

- (BACloudKitDownload)initWithIdentifier:(id)a3 recordType:(id)a4 recordName:(id)a5 assetKey:(id)a6 applicationGroupIdentifier:(id)a7
{
  return [(BACloudKitDownload *)self initWithIdentifier:a3 recordType:a4 expectedFieldKey:@"Name" expectedFieldValue:a5 assetKey:a6 applicationGroupIdentifier:a7];
}

- (BACloudKitDownload)initWithIdentifier:(id)a3 recordType:(id)a4 expectedFieldKey:(id)a5 expectedFieldValue:(id)a6 assetKey:(id)a7 applicationGroupIdentifier:(id)a8
{
  id v13 = a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  v25 = +[CKContainer defaultContainer];
  v19 = [v25 containerIdentifier];
  v20 = +[CKRecordZone defaultRecordZone];
  v21 = [v20 zoneID];
  v22 = [(BACloudKitDownload *)self initWithIdentifier:v18 recordType:v17 expectedFieldKey:v16 expectedFieldValue:v15 assetKey:v14 applicationGroupIdentifier:v13 containerIdentifier:v19 zoneID:v21 databaseScope:1 priority:0];

  return v22;
}

- (BACloudKitDownload)initWithIdentifier:(id)a3 recordType:(id)a4 expectedFieldKey:(id)a5 expectedFieldValue:(id)a6 assetKey:(id)a7 applicationGroupIdentifier:(id)a8 containerIdentifier:(id)a9 zoneID:(id)a10 databaseScope:(int64_t)a11 priority:(int64_t)a12
{
  id v33 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  id v24 = a10;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || ![v19 length])
  {
    NSExceptionName v29 = NSInvalidArgumentException;
    CFStringRef v30 = @"expectedFieldKey must be a valid string.";
LABEL_11:
    v25 = +[NSException exceptionWithName:v29 reason:v30 userInfo:0];
    [v25 raise];
    v28 = 0;
    goto LABEL_12;
  }
  if (!v20)
  {
    NSExceptionName v29 = NSInvalidArgumentException;
    CFStringRef v30 = @"expectedFieldValue cannot be passed in as nil.";
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            NSExceptionName v29 = NSInvalidArgumentException;
            CFStringRef v30 = @"expectedFieldValue must be of type: NSString, NSNumber, NSDate, NSData, or NSArray.";
            goto LABEL_11;
          }
        }
      }
    }
  }
  v25 = +[NSString stringWithFormat:@"%@ == %%@", v19];
  v26 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", v25, v20);
  id v32 = v18;
  id v27 = [objc_alloc((Class)CKQuery) initWithRecordType:v18 predicate:v26];
  self = (BACloudKitDownload *)sub_10000F280(self, v33, v27, v21, v22, v23, v24, a11, a12);

  id v18 = v32;
  v28 = self;
LABEL_12:

  return v28;
}

- (BACloudKitDownload)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BACloudKitDownload;
  v5 = [(BADownload *)&v12 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BACKD.ContainerID"];
    [(BACloudKitDownload *)v5 setContainerID:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BACKD.query"];
    [(BACloudKitDownload *)v5 setQuery:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BACKD.assetKey"];
    [(BACloudKitDownload *)v5 setAssetKey:v8];

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BACKD.zoneID"];
    [(BACloudKitDownload *)v5 setZoneID:v9];

    -[BACloudKitDownload setDatabaseScope:](v5, "setDatabaseScope:", [v4 decodeIntegerForKey:@"BACKD.databaseScope"]);
    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"masqueradeIdentifier"];
    [(BACloudKitDownload *)v5 setMasqueradeIdentifier:v10];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BACloudKitDownload;
  [(BADownload *)&v11 encodeWithCoder:v4];
  v5 = [(BACloudKitDownload *)self containerID];
  [v4 encodeObject:v5 forKey:@"BACKD.ContainerID"];

  v6 = [(BACloudKitDownload *)self query];
  [v4 encodeObject:v6 forKey:@"BACKD.query"];

  v7 = [(BACloudKitDownload *)self assetKey];
  [v4 encodeObject:v7 forKey:@"BACKD.assetKey"];

  v8 = [(BACloudKitDownload *)self zoneID];
  [v4 encodeObject:v8 forKey:@"BACKD.zoneID"];

  [v4 encodeInteger:-[BACloudKitDownload databaseScope](self, "databaseScope") forKey:@"BACKD.databaseScope"];
  v9 = [(BACloudKitDownload *)self masqueradeIdentifier];

  if (v9)
  {
    v10 = [(BACloudKitDownload *)self masqueradeIdentifier];
    [v4 encodeObject:v10 forKey:@"masqueradeIdentifier"];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)BACloudKitDownload;
  id v5 = -[BADownload copyWithZone:](&v9, "copyWithZone:");
  if (v5)
  {
    v6 = [(BACloudKitDownload *)self masqueradeIdentifier];
    id v7 = [v6 copyWithZone:a3];
    [v5 setMasqueradeIdentifier:v7];
  }
  return v5;
}

- (CKContainerID)containerID
{
  return self->_containerID;
}

- (void)setContainerID:(id)a3
{
}

- (CKQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
}

- (NSString)assetKey
{
  return self->_assetKey;
}

- (void)setAssetKey:(id)a3
{
}

- (CKRecordZoneID)zoneID
{
  return self->_zoneID;
}

- (void)setZoneID:(id)a3
{
}

- (int64_t)databaseScope
{
  return self->_databaseScope;
}

- (void)setDatabaseScope:(int64_t)a3
{
  self->_databaseScope = a3;
}

- (NSString)masqueradeIdentifier
{
  return self->_masqueradeIdentifier;
}

- (void)setMasqueradeIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_masqueradeIdentifier, 0);
  objc_storeStrong((id *)&self->_zoneID, 0);
  objc_storeStrong((id *)&self->_assetKey, 0);
  objc_storeStrong((id *)&self->_query, 0);

  objc_storeStrong((id *)&self->_containerID, 0);
}

- (BOOL)startDownloadWithDelegate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(BADownload *)self downloadLock];
  os_unfair_lock_lock(v7);
  [(BADownload *)self setDelegate:v6];
  sub_100032D34(self, -1);
  v8 = [(BADownload *)self applicationIdentifier];
  objc_super v9 = +[NSUUID UUID];
  v10 = [v9 UUIDString];
  objc_super v11 = +[NSString stringWithFormat:@"BACloudKitDownload.%@.%@", v8, v10];
  [(BADownload *)self setUniqueIdentifier:v11];

  objc_super v12 = [(BADownload *)self applicationInfo];

  if (!v12) {
    goto LABEL_5;
  }
  id v13 = sub_100013C84();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v32 = self;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Download %{public}@ is restricted, validating.", buf, 0xCu);
  }

  id v14 = [(BADownload *)self applicationInfo];
  BOOL v15 = [v14 remainingDownloadAllowanceWithNecessity:0] == 0;

  if (v15)
  {
    v28 = sub_100013C84();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_10003B6B8((uint64_t)self, v28);
    }

    if (a4)
    {
      sub_100029C00(203);
      BOOL v26 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v26 = 0;
    }
  }
  else
  {
LABEL_5:
    id v16 = +[NSDate now];
    [(BADownload *)self setDownloadStartDate:v16];

    id v17 = [(BADownload *)self uniqueIdentifier];
    [(BADownload *)self _addActivityWithIdentifier:v17 takePowerAssertion:1];

    id v18 = [(BADownload *)self delegate];
    if (v18)
    {
      id v19 = [(BADownload *)self delegate];
      char v20 = objc_opt_respondsToSelector();

      if (v20)
      {
        id v21 = [(BADownload *)self responseQueue];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100031658;
        block[3] = &unk_10005C998;
        block[4] = self;
        dispatch_async(v21, block);
      }
    }
    id v22 = [[BACloudKitDownloadManager alloc] initWithDownload:self withDelegate:self];
    [(BACloudKitDownload *)self setDownloadManager:v22];

    id v23 = [(BACloudKitDownload *)self downloadManager];
    id v29 = 0;
    unsigned __int8 v24 = [v23 startDownloadWithError:&v29];
    id v25 = v29;

    if ((v24 & 1) == 0) {
      [(BACloudKitDownload *)self _downloadFailedWithError:v25];
    }

    BOOL v26 = 1;
  }
  os_unfair_lock_unlock(v7);

  return v26;
}

- (void)cancelDownload
{
  id v2 = [(BACloudKitDownload *)self downloadManager];
  [v2 cancelDownload];
}

- (void)pauseDownload
{
  os_unfair_lock_lock([(BADownload *)self downloadLock]);
  sub_100032D34(self, 4);
  os_unfair_lock_unlock([(BADownload *)self downloadLock]);
  id v3 = [(BACloudKitDownload *)self downloadManager];
  [v3 pauseDownload];
}

- (void)downloadSucceededWithURL:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock([(BADownload *)self downloadLock]);
  [(BACloudKitDownload *)self _downloadSucceededWithURL:v4];

  id v5 = [(BADownload *)self downloadLock];

  os_unfair_lock_unlock(v5);
}

- (void)downloadDidPause
{
  os_unfair_lock_lock([(BADownload *)self downloadLock]);
  [(BACloudKitDownload *)self _downloadDidPause];
  id v3 = [(BADownload *)self downloadLock];

  os_unfair_lock_unlock(v3);
}

- (void)downloadFailedWithError:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock([(BADownload *)self downloadLock]);
  [(BACloudKitDownload *)self _downloadFailedWithError:v4];

  id v5 = [(BADownload *)self downloadLock];

  os_unfair_lock_unlock(v5);
}

- (void)_downloadFailedWithError:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner([(BADownload *)self downloadLock]);
  sub_100032D34(self, -1);
  [(BADownload *)self setDownloadError:v4];
  uint64_t v5 = [(BADownload *)self delegate];
  if (v5)
  {
    id v6 = (void *)v5;
    id v7 = [(BADownload *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      objc_super v9 = [(BADownload *)self responseQueue];
      v10 = _NSConcreteStackBlock;
      uint64_t v11 = 3221225472;
      objc_super v12 = sub_100031984;
      id v13 = &unk_10005CA10;
      id v14 = self;
      id v15 = v4;
      dispatch_async(v9, &v10);
    }
  }
  [(BADownload *)self _removeActivityAndPowerAssertion];
}

- (void)_downloadDidPause
{
  os_unfair_lock_assert_owner([(BADownload *)self downloadLock]);
  sub_100032D34(self, 5);
  uint64_t v3 = [(BADownload *)self delegate];
  if (v3)
  {
    id v4 = (void *)v3;
    uint64_t v5 = [(BADownload *)self delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = [(BADownload *)self responseQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100031AC8;
      block[3] = &unk_10005C998;
      block[4] = self;
      dispatch_async(v7, block);
    }
  }
  [(BADownload *)self _removeActivityAndPowerAssertion];
}

- (void)_downloadSucceededWithURL:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner([(BADownload *)self downloadLock]);
  sub_100032D34(self, 8);
  uint64_t v5 = [(BADownload *)self downloadCachePath];
  char v6 = [v4 path];
  uint64_t v7 = [v6 lastPathComponent];
  char v8 = [v5 stringByAppendingPathComponent:v7];

  objc_super v9 = +[NSURL fileURLWithPath:v8];
  v10 = +[NSFileManager defaultManager];
  id v19 = 0;
  LOBYTE(v7) = [v10 moveItemAtURL:v4 toURL:v9 error:&v19];

  id v11 = v19;
  if (v7)
  {
    sub_100032D90(self, v9);
    uint64_t v12 = [(BADownload *)self delegate];
    if (v12)
    {
      id v13 = (void *)v12;
      id v14 = [(BADownload *)self delegate];
      char v15 = objc_opt_respondsToSelector();

      if (v15)
      {
        id v16 = [(BADownload *)self responseQueue];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100031D0C;
        block[3] = &unk_10005CA10;
        block[4] = self;
        id v18 = v9;
        dispatch_async(v16, block);
      }
    }
    [(BADownload *)self _removeActivityAndPowerAssertion];
  }
  else
  {
    [(BACloudKitDownload *)self _downloadFailedWithError:v11];
  }
}

- (BACloudKitDownloadManager)downloadManager
{
  return (BACloudKitDownloadManager *)objc_getAssociatedObject(self, off_100069398);
}

- (void)setDownloadManager:(id)a3
{
}

@end