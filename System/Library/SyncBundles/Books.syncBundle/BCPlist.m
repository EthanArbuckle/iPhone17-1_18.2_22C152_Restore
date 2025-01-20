@interface BCPlist
+ (BOOL)canPromiseItem:(id)a3;
+ (id)promisableItemsFromItems:(id)a3;
- (BCPlist)initWithPath:(id)a3;
- (BOOL)addItems:(id)a3;
- (BOOL)isExistingEntry:(id)a3;
- (BOOL)removeItemsByPersistentID:(id)a3;
- (BOOL)replaceItems:(id)a3;
- (NSString)path;
- (id)books;
- (id)booksSortedByKey:(id)a3;
- (id)entriesWithPath;
- (id)existingPersistentIDs;
- (id)objectForKey:(id)a3;
- (id)paths;
- (id)sortedPaths;
- (id)sortedPersistentIDs:(BOOL)a3;
- (id)unfilteredPersistentIDs;
- (id)uploadsByPersistentID;
- (void)dealloc;
- (void)generateDirectory;
- (void)processDeletesFile;
- (void)regenerateMissingEstimatedDownloadSizes;
- (void)regenerateMissingPersistentIDs;
- (void)removeItemsFromSidecar:(id)a3;
- (void)resetPaths;
@end

@implementation BCPlist

- (BCPlist)initWithPath:(id)a3
{
  v4 = [(BCPlist *)self init];
  if (v4)
  {
    v4->_path = (NSString *)a3;
    [(BCPlist *)v4 generateDirectory];
  }
  return v4;
}

- (void)dealloc
{
  self->_path = 0;
  v3.receiver = self;
  v3.super_class = (Class)BCPlist;
  [(BCPlist *)&v3 dealloc];
}

- (void)regenerateMissingPersistentIDs
{
  v2 = [(BCPlistProducer *)[BCGeneratePersistentIDPlistProducer alloc] initWithPath:[(BCPlist *)self path]];
  [(BCPlistProducer *)v2 write];
}

- (void)regenerateMissingEstimatedDownloadSizes
{
  v2 = [(BCPlistProducer *)[BCGenerateDownloadSizePlistProducer alloc] initWithPath:[(BCPlist *)self path]];
  [(BCPlistProducer *)v2 write];
}

- (BOOL)isExistingEntry:(id)a3
{
  v5 = +[NSFileManager defaultManager];
  uint64_t v6 = objc_opt_class();
  v7 = (void *)BCDynamicCast(v6, (uint64_t)[a3 objectForKey:@"Path"]);
  if ([v7 length]
    && [(NSFileManager *)v5 fileExistsAtPath:[[(NSString *)[(BCPlist *)self path] stringByDeletingLastPathComponent] stringByAppendingPathComponent:v7]])
  {
    return 1;
  }
  v9 = BCDefaultLog();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  BOOL result = 0;
  if (v10)
  {
    v11 = [(BCPlist *)self path];
    CFStringRef v12 = @"is not nil";
    int v13 = 138543874;
    v14 = v11;
    __int16 v15 = 2112;
    if (!v7) {
      CFStringRef v12 = @"is nil";
    }
    v16 = v7;
    __int16 v17 = 2112;
    CFStringRef v18 = v12;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Existing entry doesn't exist for plist %{public}@. EntryPath: %@ (%@)", (uint8_t *)&v13, 0x20u);
    return 0;
  }
  return result;
}

- (id)existingPersistentIDs
{
  id v23 = +[NSMutableArray array];
  id v3 = [(BCPlist *)self books];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v24 objects:v36 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v25;
    id v22 = v3;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v25 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v24 + 1) + 8 * (void)v7);
        uint64_t v9 = objc_opt_class();
        BOOL v10 = (void *)BCDynamicCast(v9, v8);
        uint64_t v11 = objc_opt_class();
        uint64_t v12 = BCDynamicCast(v11, (uint64_t)[v10 objectForKey:@"Persistent ID"]);
        if (v12)
        {
          uint64_t v13 = v12;
          if ([(BCPlist *)self isExistingEntry:v10])
          {
            [v23 addObject:v13];
          }
          else
          {
            CFStringRef v18 = BCDefaultLog();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              v19 = [(BCPlist *)self path];
              id v20 = [v10 objectForKey:@"Path"];
              *(_DWORD *)buf = 138543874;
              v29 = v19;
              id v3 = v22;
              __int16 v30 = 2112;
              id v31 = v20;
              __int16 v32 = 2112;
              uint64_t v33 = v13;
              _os_log_error_impl(&dword_0, v18, OS_LOG_TYPE_ERROR, "[%{public}@] Collecting persistentIDs - File Not Found: %@ - [%@]", buf, 0x20u);
            }
          }
        }
        else
        {
          v14 = BCDefaultLog();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v15 = [(BCPlist *)self path];
            id v16 = [v10 objectForKey:@"Artist"];
            id v17 = [v10 objectForKey:@"Name"];
            *(_DWORD *)buf = 138544130;
            v29 = v15;
            __int16 v30 = 2112;
            id v31 = v16;
            id v3 = v22;
            __int16 v32 = 2112;
            uint64_t v33 = (uint64_t)v17;
            __int16 v34 = 2112;
            uint64_t v35 = 0;
            _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Collecting persistentIDs - No Path || PersistentID -- {%@, %@} - [%@]", buf, 0x2Au);
          }
        }
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v24 objects:v36 count:16];
    }
    while (v5);
  }
  return v23;
}

- (id)entriesWithPath
{
  id v3 = +[NSMutableArray array];
  id v4 = [(BCPlist *)self books];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * (void)v8);
        uint64_t v10 = objc_opt_class();
        uint64_t v11 = (void *)BCDynamicCast(v10, v9);
        uint64_t v12 = objc_opt_class();
        if (objc_msgSend((id)BCDynamicCast(v12, (uint64_t)objc_msgSend(v11, "objectForKey:", @"Path")), "length")) {
          [v3 addObject:v11];
        }
        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
  return v3;
}

- (id)unfilteredPersistentIDs
{
  id v3 = +[NSMutableArray array];
  id v4 = [(BCPlist *)self books];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * (void)v8);
        uint64_t v10 = objc_opt_class();
        uint64_t v11 = (void *)BCDynamicCast(v10, v9);
        uint64_t v12 = objc_opt_class();
        uint64_t v13 = (void *)BCDynamicCast(v12, (uint64_t)[v11 objectForKey:@"Persistent ID"]);
        if ([v13 length]) {
          [v3 addObject:v13];
        }
        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
  return v3;
}

- (id)sortedPersistentIDs:(BOOL)a3
{
  if (a3) {
    id v3 = [(BCPlist *)self existingPersistentIDs];
  }
  else {
    id v3 = [(BCPlist *)self unfilteredPersistentIDs];
  }
  id v4 = v3;
  if (![v3 count]) {
    return 0;
  }
  id v5 = +[NSMutableArray arrayWithArray:v4];
  [(NSMutableArray *)v5 sortUsingSelector:"compare:"];
  return v5;
}

- (id)paths
{
  id v3 = +[NSMutableArray array];
  id v4 = [(BCPlist *)self books];
  if ([v4 count])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v16;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * (void)v8);
          uint64_t v10 = objc_opt_class();
          uint64_t v11 = (void *)BCDynamicCast(v10, v9);
          uint64_t v12 = objc_opt_class();
          uint64_t v13 = (void *)BCDynamicCast(v12, (uint64_t)[v11 objectForKey:@"Path"]);
          if ([v13 length]) {
            [v3 addObject:v13];
          }
          uint64_t v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v6);
    }
  }
  return v3;
}

- (id)sortedPaths
{
  v2 = +[NSMutableArray arrayWithArray:[(BCPlist *)self paths]];
  if ([(NSMutableArray *)v2 count]) {
    [(NSMutableArray *)v2 sortUsingSelector:"compare:"];
  }
  return v2;
}

- (void)removeItemsFromSidecar:(id)a3
{
  id v4 = objc_alloc_init((Class)NSMutableArray);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(a3);
        }
        uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * (void)v8);
        uint64_t v10 = objc_opt_class();
        uint64_t v11 = (void *)BCDynamicCast(v10, v9);
        uint64_t v12 = objc_opt_class();
        uint64_t v13 = (void *)BCDynamicCast(v12, (uint64_t)[v11 objectForKey:@"Path"]);
        if ([v13 length]) {
          [v4 addObject:v13];
        }
        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [a3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
  if ([v4 count])
  {
    long long v14 = [[BCSidecarTrimPlistProducer alloc] initWithPath:[[(NSString *)[(BCPlist *)self path] stringByDeletingLastPathComponent] stringByAppendingPathComponent:@"Deletes.plist"] removePaths:v4];
    [(BCPlistProducer *)v14 write];
  }
}

- (BOOL)addItems:(id)a3
{
  id v5 = [[BCAddEntriesPlistProducer alloc] initWithPath:[(BCPlist *)self path] entries:a3];
  unsigned int v6 = [(BCPlistProducer *)v5 write];

  if (v6) {
    [(BCPlist *)self removeItemsFromSidecar:a3];
  }
  return v6;
}

- (BOOL)replaceItems:(id)a3
{
  id v3 = [[BCAddEntriesPlistProducer alloc] initWithPath:[(BCPlist *)self path] entries:a3];
  [(BCAddEntriesPlistProducer *)v3 replace:1];
  unsigned __int8 v4 = [(BCPlistProducer *)v3 write];

  return v4;
}

- (void)generateDirectory
{
  v2 = [(NSString *)[(BCPlist *)self path] stringByDeletingLastPathComponent];
  if ([(NSString *)v2 length])
  {
    id v3 = +[NSFileManager defaultManager];
    if (![(NSFileManager *)v3 fileExistsAtPath:v2])
    {
      v4[0] = NSFileOwnerAccountName;
      v4[1] = NSFileGroupOwnerAccountName;
      v5[0] = @"mobile";
      v5[1] = @"mobile";
      [(NSFileManager *)v3 createDirectoryAtPath:v2 withIntermediateDirectories:1 attributes:+[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2] error:0];
    }
  }
}

- (id)objectForKey:(id)a3
{
  id result = +[NSDictionary dictionaryWithContentsOfFile:[(BCPlist *)self path]];
  if (result)
  {
    return [result objectForKey:a3];
  }
  return result;
}

- (id)books
{
  id v2 = [(BCPlist *)self objectForKey:@"Books"];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = BCDynamicCast(v3, (uint64_t)v2);
  id v5 = (void *)v4;
  if (v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v2 == 0;
  }
  if (v6)
  {
    if (!v4)
    {
      uint64_t v7 = BCDefaultLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_13C14(v7);
      }
    }
  }
  else
  {
    uint64_t v8 = BCDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_13BD0(v8);
    }
  }
  return v5;
}

- (id)booksSortedByKey:(id)a3
{
  id v3 = [(BCPlist *)self books];

  return [v3 arrayOfDictionariesSortedByKey:@"Persistent ID"];
}

- (id)uploadsByPersistentID
{
  id v2 = +[NSDictionary dictionaryWithContentsOfFile:[(BCPlist *)self path]];
  if (v2)
  {
    uint64_t v3 = objc_opt_class();
    id v2 = (NSDictionary *)BCDynamicCast(v3, (uint64_t)[(NSDictionary *)v2 objectForKey:@"Persistent IDs"]);
  }
  if (![(NSDictionary *)v2 count]) {
    return 0;
  }
  uint64_t v4 = +[NSMutableArray arrayWithArray:v2];
  [(NSMutableArray *)v4 sortUsingSelector:"compare:"];
  return v4;
}

- (BOOL)removeItemsByPersistentID:(id)a3
{
  id v5 = BCDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = a3;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Removing items with IDs %@.", (uint8_t *)&v9, 0xCu);
  }
  BOOL v6 = [[BCRemovePersistentIDPlistProducer alloc] initWithPath:[(BCPlist *)self path] persistentIDs:a3];
  unsigned __int8 v7 = [(BCPlistProducer *)v6 write];

  return v7;
}

+ (BOOL)canPromiseItem:(id)a3
{
  return [a3 objectForKey:@"Package Hash"]
      || [a3 objectForKey:@"iBooks-UniqueId"]
      || [a3 objectForKey:@"Item ID"]
      || [a3 objectForKey:@"s"]
      || [a3 objectForKey:@"iTunesU Permlink"] != 0;
}

+ (id)promisableItemsFromItems:(id)a3
{
  id v4 = +[NSMutableArray array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(a3);
        }
        uint64_t v9 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v10 = objc_opt_class();
        uint64_t v11 = (void *)BCDynamicCast(v10, v9);
        if (+[BCPlist canPromiseItem:v11])
        {
          [v4 addObject:v11];
          uint64_t v12 = BCDefaultLog();
          if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
            continue;
          }
          id v13 = [v11 objectForKey:@"Artist"];
          id v14 = [v11 objectForKey:@"Name"];
          *(_DWORD *)buf = 138412546;
          id v26 = v13;
          __int16 v27 = 2112;
          id v28 = v14;
          long long v15 = v12;
          long long v16 = "Can Promise: {%@ - %@}";
        }
        else
        {
          long long v17 = BCDefaultLog();
          if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
            continue;
          }
          id v18 = [v11 objectForKey:@"Artist"];
          id v19 = [v11 objectForKey:@"Name"];
          *(_DWORD *)buf = 138412546;
          id v26 = v18;
          __int16 v27 = 2112;
          id v28 = v19;
          long long v15 = v17;
          long long v16 = "Cannot Promise: {%@ - %@}";
        }
        _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, v16, buf, 0x16u);
      }
      id v6 = [a3 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v6);
  }
  return v4;
}

- (void)resetPaths
{
  uint64_t v3 = BCDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v47 = [(BCPlist *)self path];
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Resetting paths in %{public}@.", buf, 0xCu);
  }
  id v37 = objc_alloc_init((Class)NSAutoreleasePool);
  [(BCPlist *)self regenerateMissingPersistentIDs];
  id v4 = [(BCPlist *)self books];
  id v41 = objc_alloc_init((Class)NSMutableArray);
  v40 = +[NSFileManager defaultManager];
  v38 = self;
  id v5 = [(NSString *)[(BCPlist *)self path] stringByDeletingLastPathComponent];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = v4;
  id v6 = [v4 countByEnumeratingWithState:&v42 objects:v50 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v43;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v43 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v42 + 1) + 8 * i);
        uint64_t v11 = objc_opt_class();
        uint64_t v12 = (void *)BCDynamicCast(v11, v10);
        unsigned int v13 = +[BCPlist canPromiseItem:v12];
        uint64_t v14 = objc_opt_class();
        long long v15 = (void *)BCDynamicCast(v14, (uint64_t)[v12 objectForKey:@"Path"]);
        if ([v15 length])
        {
          long long v16 = [(NSString *)v5 stringByAppendingPathComponent:v15];
          unsigned __int8 v17 = [(NSFileManager *)v40 fileExistsAtPath:v16];
          id v18 = BCDefaultLog();
          BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
          if (v17)
          {
            if (v19)
            {
              id v20 = (NSString *)[v12 objectForKey:@"Persistent ID"];
              *(_DWORD *)buf = 138412546;
              v47 = v20;
              __int16 v48 = 2112;
              v49 = v16;
              long long v21 = v18;
              long long v22 = "resetting paths -- Entry exists: %@ -- [%@]";
              uint32_t v23 = 22;
              goto LABEL_15;
            }
            goto LABEL_16;
          }
          if (!v13)
          {
            if (!v19) {
              continue;
            }
            uint64_t v33 = (NSString *)[v12 objectForKey:@"Persistent ID"];
            *(_DWORD *)buf = 138412546;
            v47 = v33;
            __int16 v48 = 2112;
            v49 = v16;
            __int16 v30 = v18;
            id v31 = "resetting paths -- Entry does not stat: %@ -- [%@] -- Cannot promise";
            uint32_t v32 = 22;
            goto LABEL_25;
          }
          if (v19)
          {
            __int16 v27 = (NSString *)[v12 objectForKey:@"Persistent ID"];
            *(_DWORD *)buf = 138412546;
            v47 = v27;
            __int16 v48 = 2112;
            v49 = v16;
            _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "resetting paths -- Entry does not stat: %@ -- [%@]", buf, 0x16u);
          }
          id v28 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:v12];
          [v28 removeObjectForKey:@"Backup-Path"];
          [v28 removeObjectForKey:@"Path"];
          [v28 setObject:v16 forKey:@"Backup-Path"];
          [v41 addObject:v28];
        }
        else
        {
          long long v24 = BCDefaultLog();
          BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
          if (v13)
          {
            if (v25)
            {
              id v26 = (NSString *)[v12 objectForKey:@"Persistent ID"];
              *(_DWORD *)buf = 138412290;
              v47 = v26;
              long long v21 = v24;
              long long v22 = "resetting paths -- Entry without a path: %@";
              uint32_t v23 = 12;
LABEL_15:
              _os_log_impl(&dword_0, v21, OS_LOG_TYPE_DEFAULT, v22, buf, v23);
            }
LABEL_16:
            [v41 addObject:v12];
            continue;
          }
          if (v25)
          {
            v29 = (NSString *)[v12 objectForKey:@"Persistent ID"];
            *(_DWORD *)buf = 138412290;
            v47 = v29;
            __int16 v30 = v24;
            id v31 = "resetting paths -- Entry without a path: %@ -- Cannot promise";
            uint32_t v32 = 12;
LABEL_25:
            _os_log_impl(&dword_0, v30, OS_LOG_TYPE_DEFAULT, v31, buf, v32);
            continue;
          }
        }
      }
      id v7 = [obj countByEnumeratingWithState:&v42 objects:v50 count:16];
    }
    while (v7);
  }
  __int16 v34 = BCDefaultLog();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v35 = (NSString *)[v41 count];
    *(_DWORD *)buf = 134217984;
    v47 = v35;
    _os_log_impl(&dword_0, v34, OS_LOG_TYPE_DEFAULT, "resetting paths -- rewriting %lu entries", buf, 0xCu);
  }
  v36 = [[BCAddEntriesPlistProducer alloc] initWithPath:[(BCPlist *)v38 path] entries:v41];
  [(BCAddEntriesPlistProducer *)v36 replace:1];
  [(BCPlistProducer *)v36 write];
}

- (void)processDeletesFile
{
  uint64_t v3 = [[(NSString *)[(BCPlist *)self path] stringByDeletingLastPathComponent] stringByAppendingPathComponent:@"Deletes.plist"];
  id v4 = [[BCIngestSidecarPlistProducer alloc] initWithPath:[(BCPlist *)self path] sidecarPath:v3];
  unsigned int v5 = [(BCPlistProducer *)v4 write];
  id v7 = [(BCIngestSidecarPlistProducer *)v4 filterMatches];

  if (v5)
  {
    id v6 = [[BCSidecarRewritePlistProducer alloc] initWithPath:v3 deletes:v7];
    [(BCPlistProducer *)v6 write];
  }
}

- (NSString)path
{
  return self->_path;
}

@end