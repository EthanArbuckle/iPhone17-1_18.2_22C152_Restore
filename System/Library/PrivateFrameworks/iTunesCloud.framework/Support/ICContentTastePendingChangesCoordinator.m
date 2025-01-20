@interface ICContentTastePendingChangesCoordinator
- (BOOL)_savePendingChanges:(id)a3;
- (ICContentTastePendingChangesCoordinator)initWithConfiguration:(id)a3;
- (NSArray)pendingChanges;
- (id)_pendingChanges;
- (id)description;
- (void)_addPendingChangesForContentTasteUpdateOperation:(id)a3 invalidateLocalCache:(BOOL)a4;
- (void)_removePendingChangesForContentTasteUpdateOperation:(id)a3;
- (void)contentTasteUpdateOperation:(id)a3 finishedByInvalidatingCache:(BOOL)a4 error:(id)a5;
- (void)removePendingChanges;
@end

@implementation ICContentTastePendingChangesCoordinator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_pendingChangesPath, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (BOOL)_savePendingChanges:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste_Oversize");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 count];
    pendingChangesPath = self->_pendingChangesPath;
    *(_DWORD *)buf = 138544130;
    v15 = self;
    __int16 v16 = 2048;
    id v17 = v6;
    __int16 v18 = 2114;
    id v19 = v4;
    __int16 v20 = 2112;
    v21 = pendingChangesPath;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Saving pending changes [%lu], [%{public}@] - path=%@", buf, 0x2Au);
  }

  if ([v4 count])
  {
    id v13 = 0;
    v8 = +[NSKeyedArchiver archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v13];
    id v9 = v13;
    if (v8)
    {
      unsigned __int8 v10 = [v8 writeToFile:self->_pendingChangesPath atomically:1];
    }
    else
    {
      v11 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v15 = self;
        __int16 v16 = 2114;
        id v17 = v9;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%{public}@ Failed to encode pending changes. err=%{public}@", buf, 0x16u);
      }

      unsigned __int8 v10 = 0;
    }
  }
  else
  {
    id v9 = +[NSFileManager defaultManager];
    unsigned __int8 v10 = [v9 removeItemAtPath:self->_pendingChangesPath error:0];
  }

  return v10;
}

- (id)_pendingChanges
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    pendingChangesPath = self->_pendingChangesPath;
    *(_DWORD *)buf = 138543618;
    v24 = self;
    __int16 v25 = 2112;
    v26 = pendingChangesPath;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Retrieving pending changes - path=%@", buf, 0x16u);
  }

  v5 = +[NSArray array];
  id v6 = +[NSFileManager defaultManager];
  unsigned int v7 = [v6 fileExistsAtPath:self->_pendingChangesPath];

  if (v7)
  {
    v8 = +[NSData dataWithContentsOfFile:self->_pendingChangesPath];
    if (v8)
    {
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = objc_opt_class();
      uint64_t v12 = objc_opt_class();
      id v13 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v9, v10, v11, v12, objc_opt_class(), 0);
      id v22 = 0;
      uint64_t v14 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v13 fromData:v8 error:&v22];
      v15 = (NSString *)v22;

      if (!v14)
      {
        __int16 v16 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v24 = self;
          __int16 v25 = 2114;
          v26 = v15;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%{public}@ Failed to decode pending changes. err=%{public}@", buf, 0x16u);
        }
      }
    }
    else
    {
      uint64_t v14 = (uint64_t)v5;
    }

    v5 = (void *)v14;
    if (!v14)
    {
      id v17 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        __int16 v18 = self->_pendingChangesPath;
        *(_DWORD *)buf = 138543618;
        v24 = self;
        __int16 v25 = 2114;
        v26 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%{public}@ File exists at %{public}@ but we are unable to decode the changes. Clearing all pending changes", buf, 0x16u);
      }

      [(ICContentTastePendingChangesCoordinator *)self _savePendingChanges:0];
      v5 = 0;
    }
  }
  if (v5) {
    id v19 = v5;
  }
  else {
    id v19 = &__NSArray0__struct;
  }
  id v20 = v19;

  return v20;
}

- (void)_removePendingChangesForContentTasteUpdateOperation:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = [v4 operationIdentifier];
  id v6 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_DWORD *)buf = 138543618;
      __int16 v25 = self;
      __int16 v26 = 2114;
      id v27 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Removing pending changes for operation with operationIdentifier=%{public}@", buf, 0x16u);
    }

    v8 = [(ICContentTastePendingChangesCoordinator *)self _pendingChanges];
    id v9 = [v8 mutableCopy];

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v6 = v9;
    id v10 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    uint64_t v11 = v6;
    if (v10)
    {
      id v12 = v10;
      id v18 = v4;
      uint64_t v13 = *(void *)v20;
LABEL_6:
      uint64_t v14 = 0;
      while (1)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v6);
        }
        v15 = *(void **)(*((void *)&v19 + 1) + 8 * v14);
        __int16 v16 = [v15 objectForKey:@"ContentTastePendingChangesCoordinatorOperationIdentifierKey"];
        unsigned __int8 v17 = [v16 isEqualToString:v5];

        if (v17) {
          break;
        }
        if (v12 == (id)++v14)
        {
          id v12 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
          if (v12) {
            goto LABEL_6;
          }
          uint64_t v11 = v6;
          goto LABEL_15;
        }
      }
      uint64_t v11 = v15;

      if (v11)
      {
        [v6 removeObject:v11];
        [(ICContentTastePendingChangesCoordinator *)self _savePendingChanges:v6];
LABEL_15:
        id v4 = v18;
        goto LABEL_16;
      }
      id v4 = v18;
    }
    else
    {
LABEL_16:
    }
  }
  else if (v7)
  {
    *(_DWORD *)buf = 138543618;
    __int16 v25 = self;
    __int16 v26 = 2048;
    id v27 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Not removing pending changes for operation %p as is no retry identifier", buf, 0x16u);
  }
}

- (void)_addPendingChangesForContentTasteUpdateOperation:(id)a3 invalidateLocalCache:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  BOOL v7 = [v6 requestItem];
  v8 = [v6 operationIdentifier];
  id v9 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v44 = self;
    __int16 v45 = 2114;
    v46 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Adding pending changes for operation with operationIdentifier=%{public}@", buf, 0x16u);
  }

  if (v7)
  {
    v41[0] = @"ContentTastePendingChangesCoordinatorContentTasteItemKey";
    v41[1] = @"ContentTastePendingChangesCoordinatorInvalidateCacheKey";
    v42[0] = v7;
    id v10 = +[NSNumber numberWithBool:v4];
    v42[1] = v10;
    uint64_t v11 = (void **)v42;
    id v12 = (const __CFString **)v41;
    uint64_t v13 = 2;
  }
  else
  {
    CFStringRef v39 = @"ContentTastePendingChangesCoordinatorInvalidateCacheKey";
    id v10 = +[NSNumber numberWithBool:v4];
    v40 = v10;
    uint64_t v11 = &v40;
    id v12 = &v39;
    uint64_t v13 = 1;
  }
  uint64_t v14 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v12 count:v13];

  v37[0] = @"ContentTastePendingChangesCoordinatorOperationIdentifierKey";
  v37[1] = @"ContentTastePendingChangesCoordinatorPendingChangesKey";
  v38[0] = v8;
  v38[1] = v14;
  v15 = +[NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:2];
  __int16 v16 = [(ICContentTastePendingChangesCoordinator *)self _pendingChanges];
  id v17 = [v16 mutableCopy];

  if (!v17)
  {
    id v18 = [objc_alloc((Class)NSMutableArray) initWithCapacity:1];
LABEL_22:
    objc_msgSend(v18, "addObject:", v15, v28, v29);
    [(ICContentTastePendingChangesCoordinator *)self _savePendingChanges:v18];
    goto LABEL_23;
  }
  v28 = v15;
  v29 = v14;
  v30 = v7;
  id v31 = v6;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v18 = v17;
  id v19 = [v18 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (!v19)
  {
LABEL_15:

LABEL_20:
    BOOL v7 = v30;
    id v6 = v31;
    v15 = v28;
    uint64_t v14 = v29;
    goto LABEL_22;
  }
  id v20 = v19;
  uint64_t v21 = *(void *)v33;
LABEL_9:
  uint64_t v22 = 0;
  while (1)
  {
    if (*(void *)v33 != v21) {
      objc_enumerationMutation(v18);
    }
    v23 = *(void **)(*((void *)&v32 + 1) + 8 * v22);
    v24 = objc_msgSend(v23, "objectForKey:", @"ContentTastePendingChangesCoordinatorOperationIdentifierKey", v28, v29);
    unsigned __int8 v25 = [v24 isEqualToString:v8];

    if (v25) {
      break;
    }
    if (v20 == (id)++v22)
    {
      id v20 = [v18 countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (v20) {
        goto LABEL_9;
      }
      goto LABEL_15;
    }
  }
  id v26 = v23;

  if (!v26) {
    goto LABEL_20;
  }
  id v27 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
  id v6 = v31;
  v15 = v28;
  uint64_t v14 = v29;
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v44 = self;
    __int16 v45 = 2048;
    v46 = v31;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ we already have a pending change for this operation=%p", buf, 0x16u);
  }

  BOOL v7 = v30;
LABEL_23:
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  BOOL v4 = NSStringFromClass(v3);
  v5 = [(ICConnectionConfiguration *)self->_configuration userIdentity];
  id v6 = [v5 accountDSID];
  BOOL v7 = +[NSString stringWithFormat:@"%@ %p [dsid=%@]", v4, self, v6];

  return v7;
}

- (void)removePendingChanges
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100077ED4;
  block[3] = &unk_1001BEC20;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (NSArray)pendingChanges
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_100077FD0;
  id v10 = sub_100077FE0;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100077FE8;
  v5[3] = &unk_1001BE648;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (void)contentTasteUpdateOperation:(id)a3 finishedByInvalidatingCache:(BOOL)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    pendingChangesPath = self->_pendingChangesPath;
    *(_DWORD *)buf = 138543618;
    uint64_t v21 = self;
    __int16 v22 = 2112;
    v23 = pendingChangesPath;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ addOrRemovePendingChange: - path=%@", buf, 0x16u);
  }

  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000781A4;
  v15[3] = &unk_1001BBD40;
  id v16 = v9;
  id v17 = self;
  id v18 = v8;
  BOOL v19 = a4;
  id v13 = v8;
  id v14 = v9;
  dispatch_sync(queue, v15);
}

- (ICContentTastePendingChangesCoordinator)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)ICContentTastePendingChangesCoordinator;
  v5 = [(ICContentTastePendingChangesCoordinator *)&v28 init];
  if (v5)
  {
    uint64_t v6 = (ICConnectionConfiguration *)[v4 copy];
    configuration = v5->_configuration;
    v5->_configuration = v6;

    id v8 = [v4 userIdentity];
    uint64_t v9 = [v8 accountDSID];
    id v10 = (void *)v9;
    id v11 = @"noDSID";
    if (v9) {
      id v11 = (__CFString *)v9;
    }
    id v12 = v11;

    uint64_t v13 = +[NSString stringWithFormat:@"%lu-ContentTastePendingChanges", [(__CFString *)v12 hash]];
    name = v5->_name;
    v5->_name = (NSString *)v13;

    id v15 = [(__CFString *)v12 hash];
    id v16 = +[NSString stringWithFormat:@"com.apple.itunescloudd.contenttastependingchanges.%ld", v15];
    dispatch_queue_t v17 = dispatch_queue_create((const char *)[v16 UTF8String], 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v17;

    BOOL v19 = [v4 userIdentity];
    id v20 = +[ML3MusicLibrary musicLibraryForUserAccount:v19];

    uint64_t v21 = [v20 pathForResourceFileOrFolder:25];
    __int16 v22 = +[NSString stringWithFormat:@"%@.plist", v5->_name];
    uint64_t v23 = [v21 stringByAppendingPathComponent:v22];
    pendingChangesPath = v5->_pendingChangesPath;
    v5->_pendingChangesPath = (NSString *)v23;

    unsigned __int8 v25 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      id v26 = v5->_pendingChangesPath;
      *(_DWORD *)buf = 138543618;
      v30 = v5;
      __int16 v31 = 2112;
      long long v32 = v26;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ Creating new pending changes coordinator - path=%@", buf, 0x16u);
    }
  }
  return v5;
}

@end