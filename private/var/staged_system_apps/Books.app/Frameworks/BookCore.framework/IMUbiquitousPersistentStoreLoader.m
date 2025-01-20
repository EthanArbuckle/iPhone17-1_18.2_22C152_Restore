@interface IMUbiquitousPersistentStoreLoader
+ (id)databaseFolderURL;
- (BOOL)storeFileExists;
- (IMUbiquitousPersistentStoreLoader)init;
- (IMUbiquitousPersistentStoreLoader)initWithIdentifier:(id)a3;
- (IMUbiquitousPersistentStoreLoader)initWithPersistentStoreURL:(id)a3;
- (NSString)identifier;
- (NSString)managedObjectModelName;
- (NSString)storeName;
- (NSURL)persistentStoreURL;
- (NSURL)storeURL;
- (id)addPersistentStoreToPersistentStoreCoordinator:(id)a3;
- (id)addPersistentStoreToPersistentStoreCoordinator:(id)a3 withType:(id)a4 configuration:(id)a5 URL:(id)a6 options:(id)a7;
- (void)deletePersistentStore;
- (void)setManagedObjectModelName:(id)a3;
- (void)setPersistentStoreURL:(id)a3;
- (void)setStoreName:(id)a3;
@end

@implementation IMUbiquitousPersistentStoreLoader

- (IMUbiquitousPersistentStoreLoader)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMUbiquitousPersistentStoreLoader;
  v5 = [(IMUbiquitousPersistentStoreLoader *)&v9 init];
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    identifier = v5->_identifier;
    v5->_identifier = v6;
  }
  return v5;
}

- (IMUbiquitousPersistentStoreLoader)initWithPersistentStoreURL:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMUbiquitousPersistentStoreLoader;
  v6 = [(IMUbiquitousPersistentStoreLoader *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_persistentStoreURL, a3);
  }

  return v7;
}

- (IMUbiquitousPersistentStoreLoader)init
{
  v3 = NSStringFromSelector("initWithIdentifier:");
  id v4 = NSStringFromSelector("initWithPersistentStoreURL:");
  +[NSException raise:NSGenericException, @"Please use one of the defaultInitializers {%@} or {%@}", v3, v4 format];

  return 0;
}

- (id)addPersistentStoreToPersistentStoreCoordinator:(id)a3
{
  id v4 = (char *)a3;
  id v5 = +[NSMutableDictionary dictionary];
  v6 = +[NSNumber numberWithBool:1];
  [v5 setValue:v6 forKey:NSMigratePersistentStoresAutomaticallyOption];

  v7 = +[NSNumber numberWithBool:1];
  [v5 setValue:v7 forKey:NSInferMappingModelAutomaticallyOption];

  v8 = [(IMUbiquitousPersistentStoreLoader *)self storeURL];
  objc_super v9 = [(IMUbiquitousPersistentStoreLoader *)self addPersistentStoreToPersistentStoreCoordinator:v4 withType:NSSQLiteStoreType configuration:0 URL:v8 options:v5];
  if (!v9)
  {
    v10 = BCIMLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v14 = "-[IMUbiquitousPersistentStoreLoader addPersistentStoreToPersistentStoreCoordinator:]";
      __int16 v15 = 2080;
      v16 = "/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/Database/BCUbiquitousPersistentStoreLoader.m";
      __int16 v17 = 1024;
      int v18 = 78;
      _os_log_impl(&def_7D91C, v10, OS_LOG_TYPE_INFO, "%s %s:%d", buf, 0x1Cu);
    }

    v11 = BCIMLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v14 = v4;
      __int16 v15 = 2112;
      v16 = v8;
      _os_log_impl(&def_7D91C, v11, OS_LOG_TYPE_INFO, "@\"Failed to add persistentStore at URL: %@ Error: %@ -- Crashing to avoid data loss\"", buf, 0x16u);
    }

    +[NSException raise:NSGenericException, @"%@ failed to add persistentStore to PSC: %@ at URL: %@", @"self", v4, v8 format];
  }

  return v9;
}

- (id)addPersistentStoreToPersistentStoreCoordinator:(id)a3 withType:(id)a4 configuration:(id)a5 URL:(id)a6 options:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  __int16 v15 = (__CFString *)a6;
  id v16 = a7;
  id v87 = 0;
  __int16 v17 = [v12 addPersistentStoreWithType:v13 configuration:v14 URL:v15 options:v16 error:&v87];
  id v71 = v87;
  if (v17)
  {
    int v18 = v71;
  }
  else
  {
    object = self;
    id v66 = v14;
    id v69 = v16;
    id v67 = v13;
    v19 = BCIMLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      CFStringRef v91 = @"self";
      __int16 v92 = 2112;
      uint64_t v93 = (uint64_t)v12;
      __int16 v94 = 2112;
      v95 = v15;
      __int16 v96 = 2112;
      id v97 = v71;
      _os_log_impl(&def_7D91C, v19, OS_LOG_TYPE_DEFAULT, "%@ failed to add persistentStore to PSC: %@ at URL: %@ -- Error: %@", buf, 0x2Au);
    }
    id v68 = v12;

    v70 = v15;
    v20 = [(__CFString *)v15 path];
    v21 = +[NSFileManager defaultManager];
    v22 = [v20 stringByDeletingLastPathComponent];
    v75 = v21;
    v23 = [v21 enumeratorAtPath:v22];
    v76 = objc_opt_new();
    long long v83 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    id v24 = v23;
    id v25 = [v24 countByEnumeratingWithState:&v83 objects:v89 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v84;
      do
      {
        for (i = 0; i != v26; i = (char *)i + 1)
        {
          if (*(void *)v84 != v27) {
            objc_enumerationMutation(v24);
          }
          v29 = [v22 stringByAppendingPathComponent:*(void *)(*((void *)&v83 + 1) + 8 * i)];
          if ([v29 hasPrefix:v20]
            && ([v29 hasSuffix:@"bak"] & 1) == 0)
          {
            v30 = +[NSURL fileURLWithPath:v29];
            [v76 addObject:v30];
          }
        }
        id v26 = [v24 countByEnumeratingWithState:&v83 objects:v89 count:16];
      }
      while (v26);
    }

    id v31 = [v76 count];
    v32 = BCIMLog();
    v33 = v32;
    if (v31)
    {
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&def_7D91C, v33, OS_LOG_TYPE_DEFAULT, "There is an existing persistentStore. Maybe the files are somehow corrupted -- Attempting Move and Retry", buf, 2u);
      }

      +[NSDate timeIntervalSinceReferenceDate];
      v74 = +[NSString stringWithFormat:@"%ld.%@", (uint64_t)v34, @"bak"];
      long long v79 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      id obj = v76;
      id v35 = [obj countByEnumeratingWithState:&v79 objects:v88 count:16];
      if (v35)
      {
        id v36 = v35;
        uint64_t v37 = *(void *)v80;
        id v38 = v71;
        while (2)
        {
          v39 = 0;
          v40 = v38;
          do
          {
            if (*(void *)v80 != v37) {
              objc_enumerationMutation(obj);
            }
            v41 = *(void **)(*((void *)&v79 + 1) + 8 * (void)v39);
            v42 = [v41 URLByAppendingPathExtension:v74];
            id v78 = v40;
            unsigned int v43 = [v75 moveItemAtURL:v41 toURL:v42 error:&v78];
            id v38 = v78;

            if (!v43)
            {

              v44 = BCIMLog();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
                sub_1EE904();
              }
              __int16 v17 = 0;
              id v13 = v67;
              id v12 = v68;
              id v14 = v66;
              goto LABEL_49;
            }
            v39 = (char *)v39 + 1;
            v40 = v38;
          }
          while (v36 != v39);
          id v36 = [obj countByEnumeratingWithState:&v79 objects:v88 count:16];
          if (v36) {
            continue;
          }
          break;
        }
      }
      else
      {
        id v38 = v71;
      }

      uint64_t v59 = [(__CFString *)v70 URLByAppendingPathExtension:v74];
      v60 = BCIMLog();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        CFStringRef v91 = v70;
        __int16 v92 = 2112;
        uint64_t v93 = v59;
        _os_log_impl(&def_7D91C, v60, OS_LOG_TYPE_DEFAULT, "Successfully moved existing persistingStore from URL: %@ to URL: %@", buf, 0x16u);
      }
      obja = v59;

      v61 = objc_getAssociatedObject(object, @"kIMDidRetryAddPersistentStore");
      id v13 = v67;
      id v12 = v68;
      id v14 = v66;
      if ([v61 BOOLValue])
      {
        v62 = BCIMLog();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
          sub_1EE8C0(v62);
        }

        __int16 v17 = 0;
      }
      else
      {
        v63 = +[NSNumber numberWithBool:1];

        v61 = v63;
        objc_setAssociatedObject(object, @"kIMDidRetryAddPersistentStore", v63, &stru_2E8.segname[9]);
        __int16 v17 = [(IMUbiquitousPersistentStoreLoader *)object addPersistentStoreToPersistentStoreCoordinator:v68 withType:v67 configuration:v66 URL:v70 options:v69];
        if (v17) {
          objc_setAssociatedObject(object, @"kIMDidRetryAddPersistentStore", 0, &stru_2E8.segname[9]);
        }
      }
      v44 = obja;

LABEL_49:
      id v49 = v38;
    }
    else
    {
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        sub_1EE87C(v33);
      }

      v45 = [(__CFString *)v15 path];
      unsigned __int8 v46 = [v75 isWritableFileAtPath:v45];

      id v13 = v67;
      if (v46)
      {
        v47 = [(__CFString *)v15 path];
        id v77 = v71;
        uint64_t v48 = [v75 attributesOfFileSystemForPath:v47 error:&v77];
        id v49 = v77;

        v50 = BCIMLog();
        BOOL v51 = os_log_type_enabled(v50, OS_LOG_TYPE_ERROR);
        id v12 = v68;
        v74 = v48;
        if (v48)
        {
          id v14 = v66;
          if (v51) {
            sub_1EE7AC();
          }
        }
        else
        {
          id v14 = v66;
          if (v51) {
            sub_1EE73C(v50, v52, v53, v54, v55, v56, v57, v58);
          }
        }

        __int16 v17 = 0;
      }
      else
      {
        v74 = BCIMLog();
        id v12 = v68;
        if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR)) {
          sub_1EE814();
        }
        __int16 v17 = 0;
        id v49 = v71;
        id v14 = v66;
      }
    }

    int v18 = v49;
    id v16 = v69;
    __int16 v15 = v70;
  }

  return v17;
}

- (BOOL)storeFileExists
{
  v3 = +[NSFileManager defaultManager];
  id v4 = [(IMUbiquitousPersistentStoreLoader *)self storeURL];
  id v5 = [v4 path];
  unsigned __int8 v6 = [v3 fileExistsAtPath:v5];

  return v6;
}

- (void)deletePersistentStore
{
  v2 = [(IMUbiquitousPersistentStoreLoader *)self storeURL];
  v3 = +[NSFileManager defaultManager];
  id v4 = [v2 path];
  unsigned int v5 = [v3 fileExistsAtPath:v4];

  if (v5)
  {
    id v9 = 0;
    unsigned __int8 v6 = [v3 removeItemAtURL:v2 error:&v9];
    id v7 = v9;
    if ((v6 & 1) == 0)
    {
      v8 = BCIMLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_1EE96C();
      }
    }
  }
  else
  {
    id v7 = 0;
  }
}

+ (id)databaseFolderURL
{
  v2 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 1uLL, 1);
  v3 = [v2 lastObject];

  id v4 = +[NSURL fileURLWithPath:v3 isDirectory:1];
  unsigned int v5 = [v4 URLByAppendingPathComponent:@"storeFiles"];

  return v5;
}

- (NSURL)storeURL
{
  persistentStoreURL = self->_persistentStoreURL;
  if (!persistentStoreURL)
  {
    id v4 = [(id)objc_opt_class() databaseFolderURL];
    unsigned int v5 = +[NSFileManager defaultManager];
    unsigned __int8 v6 = [v4 path];
    id v15 = 0;
    unsigned __int8 v7 = [v5 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:0 error:&v15];
    id v8 = v15;

    if ((v7 & 1) == 0)
    {
      id v9 = BCIMLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1EE9D4();
      }
    }
    v10 = [(IMUbiquitousPersistentStoreLoader *)self storeName];
    v11 = [(IMUbiquitousPersistentStoreLoader *)self identifier];
    id v12 = +[NSString stringWithFormat:@"%@_%@.sqlite", v10, v11];
    id v13 = [v4 URLByAppendingPathComponent:v12];
    [(IMUbiquitousPersistentStoreLoader *)self setPersistentStoreURL:v13];

    persistentStoreURL = self->_persistentStoreURL;
  }

  return persistentStoreURL;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSURL)persistentStoreURL
{
  return self->_persistentStoreURL;
}

- (void)setPersistentStoreURL:(id)a3
{
}

- (NSString)storeName
{
  return self->_storeName;
}

- (void)setStoreName:(id)a3
{
}

- (NSString)managedObjectModelName
{
  return self->_managedObjectModelName;
}

- (void)setManagedObjectModelName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedObjectModelName, 0);
  objc_storeStrong((id *)&self->_storeName, 0);
  objc_storeStrong((id *)&self->_persistentStoreURL, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end