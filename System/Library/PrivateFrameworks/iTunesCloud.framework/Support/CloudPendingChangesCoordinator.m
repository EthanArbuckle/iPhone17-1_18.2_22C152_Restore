@interface CloudPendingChangesCoordinator
- (BOOL)_savePendingChanges:(id)a3;
- (CloudPendingChangesCoordinator)initWithConfiguration:(id)a3 prefix:(id)a4 loggable:(Class)a5;
- (ICConnectionConfiguration)configuration;
- (id)_pendingChanges;
- (void)addPendingChange:(id)a3;
- (void)processPendingChangesUsingLibrary:(id)a3;
- (void)removeAllPendingChanges;
- (void)removeAllPendingChangesWithCompletion:(id)a3;
@end

@implementation CloudPendingChangesCoordinator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_pendingChangesPath, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (ICConnectionConfiguration)configuration
{
  return self->_configuration;
}

- (BOOL)_savePendingChanges:(id)a3
{
  id v4 = a3;
  v5 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 count];
    pendingChangesPath = self->_pendingChangesPath;
    *(_DWORD *)buf = 134218498;
    v15 = self;
    __int16 v16 = 2048;
    id v17 = v6;
    __int16 v18 = 2112;
    v19 = pendingChangesPath;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CloudPendingChangesCoordinator %p - Saving pending changes [%lu] - path=%@", buf, 0x20u);
  }

  if ([v4 count])
  {
    id v13 = 0;
    v8 = +[NSKeyedArchiver archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v13];
    v9 = (CloudPendingChangesCoordinator *)v13;
    if (v8)
    {
      unsigned __int8 v10 = [v8 writeToFile:self->_pendingChangesPath atomically:1];
    }
    else
    {
      v11 = [(id)objc_opt_class() logCategory];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v15 = v9;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to encode pending changes. err=%{public}@", buf, 0xCu);
      }

      unsigned __int8 v10 = 0;
    }
  }
  else
  {
    v9 = +[NSFileManager defaultManager];
    unsigned __int8 v10 = [(CloudPendingChangesCoordinator *)v9 removeItemAtPath:self->_pendingChangesPath error:0];
  }

  return v10;
}

- (id)_pendingChanges
{
  v3 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    pendingChangesPath = self->_pendingChangesPath;
    *(_DWORD *)buf = 134218242;
    __int16 v16 = self;
    __int16 v17 = 2112;
    __int16 v18 = pendingChangesPath;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CloudPendingChangesCoordinator %p - Retrieving pending changes - path=%@", buf, 0x16u);
  }

  v5 = +[NSFileManager defaultManager];
  unsigned int v6 = [v5 fileExistsAtPath:self->_pendingChangesPath];

  if (v6)
  {
    v7 = +[NSData dataWithContentsOfFile:self->_pendingChangesPath];
    if (v7)
    {
      uint64_t v8 = objc_opt_class();
      v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, objc_opt_class(), 0);
      id v14 = 0;
      unsigned __int8 v10 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v9 fromData:v7 error:&v14];
      v11 = (CloudPendingChangesCoordinator *)v14;

      if (!v10)
      {
        v12 = [(id)objc_opt_class() logCategory];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          __int16 v16 = v11;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to decode pending changes. err=%{public}@", buf, 0xCu);
        }
      }
    }
    else
    {
      unsigned __int8 v10 = 0;
    }
  }
  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (void)removeAllPendingChanges
{
}

- (void)removeAllPendingChangesWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    pendingChangesPath = self->_pendingChangesPath;
    *(_DWORD *)buf = 134218242;
    __int16 v17 = self;
    __int16 v18 = 2112;
    v19 = pendingChangesPath;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CloudPendingChangesCoordinator %p - removeAllPendingChangesWithCompletion - path=%@", buf, 0x16u);
  }

  id v7 = objc_alloc((Class)MSVXPCTransaction);
  uint64_t v8 = +[NSString stringWithFormat:@"%@-RemoveAllPendingChanges", self->_name];
  id v9 = [v7 initWithName:v8];

  [v9 beginTransaction];
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D3B84;
  block[3] = &unk_1001BEC98;
  id v14 = v9;
  id v15 = v4;
  block[4] = self;
  id v11 = v9;
  id v12 = v4;
  dispatch_async(queue, block);
}

- (void)processPendingChangesUsingLibrary:(id)a3
{
  id v4 = a3;
  v5 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    pendingChangesPath = self->_pendingChangesPath;
    id v7 = [v4 libraryIdentifier];
    *(_DWORD *)buf = 138543874;
    __int16 v18 = self;
    __int16 v19 = 2112;
    v20 = pendingChangesPath;
    __int16 v21 = 2112;
    v22 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ - processPendingChangesUsingLibrary - path=%@ - libraryIdentifier=%@", buf, 0x20u);
  }
  id v8 = objc_alloc((Class)MSVXPCTransaction);
  id v9 = +[NSString stringWithFormat:@"%@-ProcessPendingChanges", self->_name];
  id v10 = [v8 initWithName:v9];

  [v10 beginTransaction];
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D3E20;
  block[3] = &unk_1001BDFE8;
  block[4] = self;
  id v15 = v4;
  id v16 = v10;
  id v12 = v10;
  id v13 = v4;
  dispatch_sync(queue, block);
}

- (void)addPendingChange:(id)a3
{
  id v4 = a3;
  v5 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    pendingChangesPath = self->_pendingChangesPath;
    *(_DWORD *)buf = 134218242;
    id v15 = self;
    __int16 v16 = 2112;
    __int16 v17 = pendingChangesPath;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CloudPendingChangesCoordinator %p - addPendingChange: - path=%@", buf, 0x16u);
  }

  id v7 = objc_alloc((Class)MSVXPCTransaction);
  id v8 = +[NSString stringWithFormat:@"%@-AddPendingChange", self->_name];
  id v9 = [v7 initWithName:v8];

  [v9 beginTransaction];
  if ([v4 isPersistent])
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000D4500;
    block[3] = &unk_1001BDFE8;
    block[4] = self;
    id v12 = v4;
    id v13 = v9;
    dispatch_async(queue, block);
  }
  else
  {
    [v9 endTransaction];
  }
}

- (CloudPendingChangesCoordinator)initWithConfiguration:(id)a3 prefix:(id)a4 loggable:(Class)a5
{
  id v8 = a3;
  id v9 = a4;
  v33.receiver = self;
  v33.super_class = (Class)CloudPendingChangesCoordinator;
  id v10 = [(CloudPendingChangesCoordinator *)&v33 init];
  if (v10)
  {
    id v11 = (ICConnectionConfiguration *)[v8 copy];
    configuration = v10->_configuration;
    v10->_configuration = v11;

    uint64_t v13 = +[NSString stringWithFormat:@"%@-CloudPendingChanges", v9];
    name = v10->_name;
    v10->_name = (NSString *)v13;

    id v15 = [v8 userIdentity];
    uint64_t v16 = [v15 accountDSID];
    __int16 v17 = (void *)v16;
    __int16 v18 = @"noDSID";
    if (v16) {
      __int16 v18 = (__CFString *)v16;
    }
    __int16 v19 = v18;

    v20 = +[NSString stringWithFormat:@"com.apple.itunescloudd.pendingchanges.%@.%@", v9, v19];

    id v21 = v20;
    dispatch_queue_t v22 = dispatch_queue_create((const char *)[v21 UTF8String], 0);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v22;

    v24 = [v8 userIdentity];
    v25 = +[ML3MusicLibrary musicLibraryForUserAccount:v24];

    v26 = [v25 pathForResourceFileOrFolder:25];
    v27 = +[NSString stringWithFormat:@"%@.plist", v10->_name];
    uint64_t v28 = [v26 stringByAppendingPathComponent:v27];
    pendingChangesPath = v10->_pendingChangesPath;
    v10->_pendingChangesPath = (NSString *)v28;

    v10->_loggable = a5;
    v30 = os_log_create("com.apple.amp.itunescloudd", "Default");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      v31 = v10->_pendingChangesPath;
      *(_DWORD *)buf = 134218242;
      v35 = v10;
      __int16 v36 = 2112;
      v37 = v31;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "CloudPendingChangesCoordinator %p - Creating new coordinator - path=%@", buf, 0x16u);
    }
  }
  return v10;
}

@end