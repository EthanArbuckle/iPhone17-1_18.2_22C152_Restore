@interface NDDownloadServiceStore
- (NDDownloadLimits)lastKnownLimits;
- (NDDownloadServiceStore)initWithParentDirectory:(id)a3;
- (NSArray)lastKnownRequests;
- (NSString)parentDirectory;
- (id)_filePathForKey:(id)a3;
- (void)setLastKnownLimits:(id)a3;
- (void)setLastKnownRequests:(id)a3;
@end

@implementation NDDownloadServiceStore

- (NDDownloadServiceStore)initWithParentDirectory:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NDDownloadServiceStore;
  v5 = [(NDDownloadServiceStore *)&v9 init];
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    parentDirectory = v5->_parentDirectory;
    v5->_parentDirectory = v6;
  }
  return v5;
}

- (NSArray)lastKnownRequests
{
  id v4 = [(NDDownloadServiceStore *)self _filePathForKey:@"last-known-requests"];
  v5 = +[NSData dataWithContentsOfFile:v4];

  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = objc_opt_class();
    v8 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v7, objc_opt_class(), 0);
    id v19 = 0;
    objc_super v9 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v8 fromData:v6 error:&v19];
    id v10 = v19;

    v11 = FCOfflineDownloadsLog;
    if (v9)
    {
      if (os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v21 = v9;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "successfully loaded last known requests from store: %{public}@", buf, 0xCu);
      }
    }
    else
    {
      if (os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_ERROR)) {
        sub_10004806C((uint64_t)v10, v11, v12, v13, v14, v15, v16, v17);
      }
      objc_super v9 = &__NSArray0__struct;
    }
  }
  else
  {
    objc_super v9 = sub_1000095CC();
  }

  return (NSArray *)v9;
}

- (void)setLastKnownRequests:(id)a3
{
  id v4 = a3;
  id v18 = 0;
  id v6 = +[NSKeyedArchiver archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v18];
  id v7 = v18;
  v8 = v7;
  if (v6)
  {
    id v9 = v6;
    id v10 = [(NDDownloadServiceStore *)self _filePathForKey:@"last-known-requests"];
    v17[0] = v8;
    unsigned __int8 v11 = [v9 writeToFile:v10 options:1 error:v17];
    id v12 = v17[0];

    if (v11)
    {
      uint64_t v13 = (void *)FCOfflineDownloadsLog;
      if (os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = v13;
        id v15 = [v4 count];
        *(_DWORD *)buf = 134217984;
        id v20 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "successfully saved %lu last known requests to store", buf, 0xCu);
      }
    }
    else
    {
      id v16 = v12;
      sub_1000098C8();
    }
  }
  else
  {
    v17[1] = _NSConcreteStackBlock;
    v17[2] = (id)3221225472;
    v17[3] = sub_10000987C;
    v17[4] = &unk_100061828;
    id v12 = v7;
    v17[5] = v12;
    sub_10000987C();
    id v9 = v12;
  }
}

- (NDDownloadLimits)lastKnownLimits
{
  id v4 = [(NDDownloadServiceStore *)self _filePathForKey:@"last-known-limits"];
  v5 = +[NSData dataWithContentsOfFile:v4];

  if (v5)
  {
    id v6 = v5;
    id v17 = 0;
    id v7 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:&v17];
    id v8 = v17;
    id v9 = FCOfflineDownloadsLog;
    if (v7)
    {
      if (os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v19 = v7;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "successfully loaded last known limits from store: %{public}@", buf, 0xCu);
      }
    }
    else
    {
      if (os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_ERROR)) {
        sub_100048140((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15);
      }
      id v7 = +[NDDownloadLimits defaultLimits];
    }
  }
  else
  {
    id v7 = sub_100009AC8();
  }

  return (NDDownloadLimits *)v7;
}

- (void)setLastKnownLimits:(id)a3
{
  id v4 = a3;
  id v21 = 0;
  id v6 = +[NSKeyedArchiver archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v21];
  id v7 = v21;
  id v8 = v7;
  if (v6)
  {
    id v9 = v6;
    uint64_t v10 = [(NDDownloadServiceStore *)self _filePathForKey:@"last-known-limits"];
    v20[0] = v8;
    unsigned __int8 v11 = [v9 writeToFile:v10 options:1 error:v20];
    id v12 = v20[0];

    if (v11)
    {
      uint64_t v13 = FCOfflineDownloadsLog;
      if (os_log_type_enabled(FCOfflineDownloadsLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "successfully saved last known limits to store", v14, 2u);
      }
    }
    else
    {
      uint64_t v15 = _NSConcreteStackBlock;
      uint64_t v16 = 3221225472;
      id v17 = sub_100009D90;
      id v18 = &unk_100061828;
      id v19 = v12;
      sub_100009D90();
    }
  }
  else
  {
    v20[1] = _NSConcreteStackBlock;
    v20[2] = (id)3221225472;
    v20[3] = sub_100009D44;
    v20[4] = &unk_100061828;
    id v12 = v7;
    v20[5] = v12;
    sub_100009D44();
    id v9 = v12;
  }
}

- (id)_filePathForKey:(id)a3
{
  id v4 = a3;
  v5 = [(NDDownloadServiceStore *)self parentDirectory];
  id v6 = [v5 stringByAppendingPathComponent:v4];

  return v6;
}

- (NSString)parentDirectory
{
  return self->_parentDirectory;
}

- (void).cxx_destruct
{
}

@end