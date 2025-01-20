@interface FMDProtectedContextManager
+ (id)sharedManager;
- (BOOL)_startCleaningEmptyFolders;
- (BOOL)cleanOutCurrentContextDirectoryURL:(id)a3 preservingContextUUID:(id)a4 obliterateDirectory:(BOOL)a5;
- (BOOL)cleanupAllContextsForKey:(id)a3;
- (BOOL)cleanupContextsForKey:(id)a3 contextUUID:(id)a4;
- (BOOL)cleanupContextsForKey:(id)a3 contextUUID:(id)a4 obliterate:(BOOL)a5;
- (BOOL)deleteFilesAtURLs:(id)a3;
- (FMDProtectedContextManager)init;
- (FMReadWriteLock)protectedContextLock;
- (id)_directoryNamesWithURL:(id)a3 enumerationOption:(unint64_t)a4;
- (id)_emptyFolderURLs;
- (id)_enumeratorForDirectoryURL:(id)a3;
- (id)contextForKey:(id)a3 contextUUID:(id *)a4 error:(id *)a5;
- (id)contextKeysForType:(id)a3;
- (id)contextKeysForType:(id)a3 enumerationOption:(unint64_t)a4;
- (id)saveContext:(id)a3 forContextKey:(id)a4 dataProtectionClass:(int64_t)a5;
- (void)cleanupEmptyFolders;
- (void)saveContext:(id)a3 forContextKey:(id)a4;
- (void)setProtectedContextLock:(id)a3;
@end

@implementation FMDProtectedContextManager

+ (id)sharedManager
{
  if (qword_10031E988 != -1) {
    dispatch_once(&qword_10031E988, &stru_1002DBCD0);
  }
  v2 = (void *)qword_10031E980;

  return v2;
}

- (FMDProtectedContextManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)FMDProtectedContextManager;
  v2 = [(FMDProtectedContextManager *)&v5 init];
  if (v2)
  {
    id v3 = [objc_alloc((Class)FMReadWriteLock) initWithLockName:@"com.apple.icloud.findmydeviced.FMDProtectedContextManager-Lock"];
    [(FMDProtectedContextManager *)v2 setProtectedContextLock:v3];
  }
  return v2;
}

- (id)contextForKey:(id)a3 contextUUID:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = sub_10006C6FC;
  v36 = sub_10006C70C;
  id v37 = 0;
  if (v8)
  {
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x3032000000;
    v29 = sub_10006C6FC;
    v30 = sub_10006C70C;
    id v31 = 0;
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x3032000000;
    v23 = sub_10006C6FC;
    v24 = sub_10006C70C;
    id v25 = 0;
    v9 = [(FMDProtectedContextManager *)self protectedContextLock];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10006C714;
    v15[3] = &unk_1002DBCF8;
    id v10 = v8;
    id v16 = v10;
    v17 = &v20;
    v18 = &v32;
    v19 = &v26;
    [v9 performWithReadLock:v15];

    if (a5) {
      *a5 = (id) v27[5];
    }
    if (v27[5] || !v33[5])
    {
      v11 = sub_100004238();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v39 = v10;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "There was a file read error while getting the protected context %@.", buf, 0xCu);
      }
    }
    else if (a4)
    {
      *a4 = (id) v21[5];
    }

    _Block_object_dispose(&v20, 8);
    _Block_object_dispose(&v26, 8);

    v12 = (void *)v33[5];
  }
  else
  {
    v12 = 0;
  }
  id v13 = v12;
  _Block_object_dispose(&v32, 8);

  return v13;
}

- (id)saveContext:(id)a3 forContextKey:(id)a4 dataProtectionClass:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  v11 = 0;
  if (v8 && v9)
  {
    v12 = [[FMDProtectedContext alloc] initWithContextKey:v9];
    v11 = [(FMDProtectedContext *)v12 contextUUID];
    id v13 = [(FMDProtectedContextManager *)self protectedContextLock];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10006C978;
    v16[3] = &unk_1002DA2E8;
    v17 = v12;
    int64_t v20 = a5;
    id v18 = v8;
    id v19 = v10;
    v14 = v12;
    [v13 performWithWriteLock:v16];
  }

  return v11;
}

- (void)saveContext:(id)a3 forContextKey:(id)a4
{
  id v4 = [(FMDProtectedContextManager *)self saveContext:a3 forContextKey:a4 dataProtectionClass:2];
}

- (BOOL)cleanupContextsForKey:(id)a3 contextUUID:(id)a4
{
  return [(FMDProtectedContextManager *)self cleanupContextsForKey:a3 contextUUID:a4 obliterate:0];
}

- (BOOL)cleanupContextsForKey:(id)a3 contextUUID:(id)a4 obliterate:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v19 = 0;
  int64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  if (v8)
  {
    id v10 = [(FMDProtectedContextManager *)self protectedContextLock];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10006CB84;
    v13[3] = &unk_1002DBD20;
    id v14 = v8;
    id v16 = self;
    v17 = &v19;
    id v15 = v9;
    BOOL v18 = a5;
    [v10 performWithWriteLock:v13];

    BOOL v11 = *((unsigned char *)v20 + 24) != 0;
  }
  else
  {
    BOOL v11 = 0;
  }
  _Block_object_dispose(&v19, 8);

  return v11;
}

- (BOOL)cleanupAllContextsForKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  objc_super v5 = [(FMDProtectedContextManager *)self protectedContextLock];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10006CE48;
  v8[3] = &unk_1002DBD48;
  id v6 = v4;
  id v10 = self;
  BOOL v11 = &v12;
  id v9 = v6;
  [v5 performWithWriteLock:v8];

  LOBYTE(self) = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  return (char)self;
}

- (void)cleanupEmptyFolders
{
  id v3 = +[FMDProtectedContext unittestRootURL];
  if (v3)
  {
  }
  else if (+[FMPreferencesUtil BOOLForKey:@"kFMDProtectedContextCleanedUpEmptyFolders" inDomain:kFMDNotBackedUpPrefDomain])
  {
    return;
  }
  id v4 = +[NSString stringWithUTF8String:"com.apple.mobile.keybagd.lock_status"];
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10006D078;
  v10[3] = &unk_1002D9238;
  objc_copyWeak(&v12, &location);
  id v5 = v4;
  id v11 = v5;
  id v6 = objc_retainBlock(v10);
  v7 = +[FMXPCNotificationsUtil sharedInstance];
  unsigned __int8 v8 = [v7 isHandlerRegisteredForDarwinNotification:v5];

  if ((v8 & 1) == 0)
  {
    id v9 = +[FMXPCNotificationsUtil sharedInstance];
    [v9 registerHandler:v6 forDarwinNotification:v5];
  }
  ((void (*)(void *))v6[2])(v6);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (BOOL)_startCleaningEmptyFolders
{
  id v3 = sub_100004238();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "FMDProtectedContextManager start cleaning up empty folders", buf, 2u);
  }

  *(void *)buf = 0;
  id v11 = buf;
  uint64_t v12 = 0x2020000000;
  char v13 = 1;
  id v4 = [(FMDProtectedContextManager *)self _emptyFolderURLs];
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10006D368;
  v7[3] = &unk_1002DBD70;
  v7[4] = buf;
  objc_copyWeak(&v8, &location);
  [v4 enumerateObjectsUsingBlock:v7];
  uint8_t v5 = v11[24];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

  _Block_object_dispose(buf, 8);
  return v5;
}

- (id)_emptyFolderURLs
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = +[FMDProtectedContext rootDirectoryURL];
  uint8_t v5 = [(FMDProtectedContextManager *)self _enumeratorForDirectoryURL:v4];
  id v6 = [v5 allObjects];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10006D520;
  v11[3] = &unk_1002DBD98;
  v11[4] = self;
  id v7 = v3;
  id v12 = v7;
  [v6 enumerateObjectsUsingBlock:v11];

  id v8 = v12;
  id v9 = v7;

  return v9;
}

- (id)contextKeysForType:(id)a3
{
  return [(FMDProtectedContextManager *)self contextKeysForType:a3 enumerationOption:0];
}

- (id)contextKeysForType:(id)a3 enumerationOption:(unint64_t)a4
{
  id v6 = a3;
  id v7 = +[NSMutableArray array];
  CFArrayRef v8 = CFPreferencesCopyKeyList(kFMDNotBackedUpPrefDomain, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
  if (v8) {
    [v7 addObjectsFromArray:v8];
  }
  id v9 = sub_100004238();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v29 = v7;
    __int16 v30 = 2048;
    unint64_t v31 = a4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "FMDProtectedContextManager obtaining list of context keys %@ with Type:%lu", buf, 0x16u);
  }

  id v10 = +[FMDProtectedContext rootDirectoryURL];
  id v11 = [(FMDProtectedContextManager *)self _directoryNamesWithURL:v10 enumerationOption:a4];
  id v12 = sub_100004238();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v29 = v11;
    __int16 v30 = 2048;
    unint64_t v31 = a4;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "FMDProtectedContextManager obtaining list directories on disk %@ with Type:%lu", buf, 0x16u);
  }

  char v13 = [v11 allObjects];
  [v7 addObjectsFromArray:v13];

  uint64_t v14 = +[NSMutableSet set];
  char v22 = _NSConcreteStackBlock;
  uint64_t v23 = 3221225472;
  v24 = sub_10006D894;
  id v25 = &unk_1002DAFA8;
  id v15 = v6;
  id v26 = v15;
  id v16 = v14;
  id v27 = v16;
  [v7 enumerateObjectsUsingBlock:&v22];
  v17 = sub_100004238();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = [v16 count:v22, v23, v24, v25, v26];
    *(_DWORD *)buf = 134218242;
    id v29 = v18;
    __int16 v30 = 2112;
    unint64_t v31 = (unint64_t)v15;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "FMDProtectedContextManager %lu context keys for Type %@", buf, 0x16u);
  }

  uint64_t v19 = v27;
  id v20 = v16;

  return v20;
}

- (id)_directoryNamesWithURL:(id)a3 enumerationOption:(unint64_t)a4
{
  id v6 = a3;
  id v7 = +[NSMutableSet set];
  if (a4 != 2)
  {
    CFArrayRef v8 = [(FMDProtectedContextManager *)self _enumeratorForDirectoryURL:v6];
    id v9 = [v8 allObjects];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10006DA04;
    v12[3] = &unk_1002DBDC0;
    unint64_t v15 = a4;
    id v13 = v7;
    uint64_t v14 = self;
    [v9 enumerateObjectsUsingBlock:v12];
  }
  id v10 = [v7 copy];

  return v10;
}

- (id)_enumeratorForDirectoryURL:(id)a3
{
  id v3 = a3;
  id v4 = +[NSFileManager defaultManager];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10006DBB8;
  v8[3] = &unk_1002DBDE8;
  id v9 = v3;
  id v5 = v3;
  id v6 = [v4 enumeratorAtURL:v5 includingPropertiesForKeys:0 options:1 errorHandler:v8];

  return v6;
}

- (BOOL)deleteFilesAtURLs:(id)a3
{
  id v3 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 1;
  +[NSFileManager defaultManager];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10006DD8C;
  v7[3] = &unk_1002DBE10;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = v4;
  id v9 = &v10;
  [v3 enumerateObjectsUsingBlock:v7];
  char v5 = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return v5;
}

- (BOOL)cleanOutCurrentContextDirectoryURL:(id)a3 preservingContextUUID:(id)a4 obliterateDirectory:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (v5)
  {
    id v24 = v8;
    uint64_t v10 = +[NSArray arrayWithObjects:&v24 count:1];
    BOOL v11 = [(FMDProtectedContextManager *)self deleteFilesAtURLs:v10];
  }
  else
  {
    uint64_t v10 = +[NSFileManager defaultManager];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10006E0D4;
    v22[3] = &unk_1002DBDE8;
    id v23 = v8;
    uint64_t v12 = [v10 enumeratorAtURL:v23 includingPropertiesForKeys:0 options:1 errorHandler:v22];
    char v13 = v12;
    if (v9)
    {
      uint64_t v14 = +[NSMutableArray array];
      unint64_t v15 = [v9 UUIDString];
      uint64_t v16 = [v13 nextObject];
      if (v16)
      {
        v17 = (void *)v16;
        do
        {
          id v18 = [v17 lastPathComponent];
          unsigned __int8 v19 = [v18 isEqualToString:v15];

          if ((v19 & 1) == 0) {
            [v14 addObject:v17];
          }
          uint64_t v20 = [v13 nextObject];

          v17 = (void *)v20;
        }
        while (v20);
      }
      BOOL v11 = [(FMDProtectedContextManager *)self deleteFilesAtURLs:v14];
    }
    else
    {
      uint64_t v14 = [v12 allObjects];
      BOOL v11 = [(FMDProtectedContextManager *)self deleteFilesAtURLs:v14];
    }
  }
  return v11;
}

- (FMReadWriteLock)protectedContextLock
{
  return self->_protectedContextLock;
}

- (void)setProtectedContextLock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end