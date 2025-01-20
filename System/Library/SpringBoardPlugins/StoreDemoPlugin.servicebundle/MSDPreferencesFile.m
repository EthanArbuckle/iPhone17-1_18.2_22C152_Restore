@interface MSDPreferencesFile
+ (BOOL)preferencesFileExists;
+ (id)preferencesFilePath;
+ (id)preferencesFileUrl;
+ (id)sharedInstance;
- (BOOL)removeObjectForKey:(id)a3;
- (BOOL)removeObjectsForKeys:(id)a3;
- (BOOL)saveCache;
- (BOOL)setObject:(id)a3 forKey:(id)a4;
- (MSDPreferencesFile)init;
- (NSMutableDictionary)cache;
- (id)deepCopy:(id)a3;
- (id)objectForKey:(id)a3;
- (void)populateCache;
- (void)raiseInvalidPropertyListObjectExceptionForObject:(id)a3;
- (void)reload;
- (void)setCache:(id)a3;
@end

@implementation MSDPreferencesFile

+ (id)sharedInstance
{
  if (qword_1E670 != -1) {
    dispatch_once(&qword_1E670, &stru_18640);
  }
  v2 = (void *)qword_1E668;

  return v2;
}

- (MSDPreferencesFile)init
{
  v5.receiver = self;
  v5.super_class = (Class)MSDPreferencesFile;
  v2 = [(MSDPreferencesFile *)&v5 init];
  v3 = v2;
  if (v2) {
    [(MSDPreferencesFile *)v2 populateCache];
  }
  return v3;
}

+ (id)preferencesFilePath
{
  v2 = +[MSDPreferencesFile preferencesFileUrl];
  v3 = [v2 path];

  return v3;
}

+ (BOOL)preferencesFileExists
{
  v2 = +[NSFileManager defaultManager];
  v3 = +[MSDPreferencesFile preferencesFilePath];
  unsigned __int8 v4 = [v2 fileExistsAtPath:v3];

  return v4;
}

- (void)reload
{
  obj = self;
  objc_sync_enter(obj);
  [(MSDPreferencesFile *)obj populateCache];
  objc_sync_exit(obj);
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_super v5 = self;
    objc_sync_enter(v5);
    v6 = [(MSDPreferencesFile *)v5 cache];
    v7 = [v6 objectForKey:v4];

    objc_sync_exit(v5);
  }
  else
  {
    v9 = sub_7CA4();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_E940(v9, v10, v11, v12, v13, v14, v15, v16);
    }

    v7 = 0;
  }

  return v7;
}

- (BOOL)setObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6 || !v7)
  {
    sub_7CA4();
    uint64_t v10 = (MSDPreferencesFile *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v10->super, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 136446210;
      v17 = "-[MSDPreferencesFile setObject:forKey:]";
      uint64_t v14 = "%{public}s - Both object and key must be non-nil.";
LABEL_13:
      _os_log_impl(&dword_0, &v10->super, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v16, 0xCu);
    }
LABEL_14:
    unsigned __int8 v13 = 0;
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    sub_7CA4();
    uint64_t v10 = (MSDPreferencesFile *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v10->super, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 136446210;
      v17 = "-[MSDPreferencesFile setObject:forKey:]";
      uint64_t v14 = "%{public}s - Key must be of type NSString.";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  if (!+[NSPropertyListSerialization propertyList:v6 isValidForFormat:100])[(MSDPreferencesFile *)self raiseInvalidPropertyListObjectExceptionForObject:v6]; {
  v9 = sub_7CA4();
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_E9B8((uint64_t)v8, (uint64_t)v6, v9);
  }

  uint64_t v10 = self;
  objc_sync_enter(v10);
  uint64_t v11 = [(MSDPreferencesFile *)v10 cache];
  uint64_t v12 = [(MSDPreferencesFile *)v10 deepCopy:v6];
  [v11 setObject:v12 forKey:v8];

  unsigned __int8 v13 = [(MSDPreferencesFile *)v10 saveCache];
  objc_sync_exit(v10);
LABEL_15:

  return v13;
}

- (BOOL)removeObjectForKey:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_super v5 = self;
    objc_sync_enter(v5);
    id v6 = [(MSDPreferencesFile *)v5 cache];
    [v6 removeObjectForKey:v4];

    unsigned __int8 v7 = [(MSDPreferencesFile *)v5 saveCache];
    objc_sync_exit(v5);
  }
  else
  {
    v9 = sub_7CA4();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_EA40(v9, v10, v11, v12, v13, v14, v15, v16);
    }

    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (BOOL)removeObjectsForKeys:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_super v5 = self;
    objc_sync_enter(v5);
    id v6 = [(MSDPreferencesFile *)v5 cache];
    [v6 removeObjectsForKeys:v4];

    unsigned __int8 v7 = [(MSDPreferencesFile *)v5 saveCache];
    objc_sync_exit(v5);
  }
  else
  {
    v9 = sub_7CA4();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_EAB8(v9, v10, v11, v12, v13, v14, v15, v16);
    }

    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (void)populateCache
{
  if (!+[MSDPreferencesFile preferencesFileExists])
  {
LABEL_7:
    id v4 = objc_alloc_init((Class)NSMutableDictionary);
    [(MSDPreferencesFile *)self setCache:v4];
    goto LABEL_8;
  }
  v3 = +[MSDPreferencesFile preferencesFileUrl];
  id v9 = 0;
  id v4 = +[NSDictionary dictionaryWithContentsOfURL:v3 error:&v9];
  id v5 = v9;

  if (!v4)
  {
    unsigned __int8 v7 = sub_7CA4();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = +[MSDPreferencesFile preferencesFilePath];
      *(_DWORD *)buf = 136446722;
      uint64_t v11 = "-[MSDPreferencesFile populateCache]";
      __int16 v12 = 2114;
      uint64_t v13 = v8;
      __int16 v14 = 2114;
      id v15 = v5;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%{public}s - Failed to read preferences file:  %{public}@ - Error:  %{public}@", buf, 0x20u);
    }
    goto LABEL_7;
  }

  id v6 = +[NSMutableDictionary dictionaryWithDictionary:v4];
  [(MSDPreferencesFile *)self setCache:v6];

LABEL_8:
}

- (BOOL)saveCache
{
  v2 = [(MSDPreferencesFile *)self cache];
  v3 = +[MSDPreferencesFile preferencesFileUrl];
  id v9 = 0;
  unsigned __int8 v4 = [v2 writeToURL:v3 error:&v9];
  id v5 = v9;

  if ((v4 & 1) == 0)
  {
    id v6 = sub_7CA4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v7 = +[MSDPreferencesFile preferencesFilePath];
      *(_DWORD *)buf = 136446722;
      uint64_t v11 = "-[MSDPreferencesFile saveCache]";
      __int16 v12 = 2114;
      uint64_t v13 = v7;
      __int16 v14 = 2114;
      id v15 = v5;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%{public}s - Failed to save preferences file:  %{public}@ - Error:  %{public}@", buf, 0x20u);
    }
  }

  return v4;
}

- (void)raiseInvalidPropertyListObjectExceptionForObject:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = +[NSString stringWithFormat:@"Object %@ of type %@ is not a valid property list object.", v3, objc_opt_class()];

  id v5 = +[NSException exceptionWithName:@"InvalidPropertyListObject" reason:v4 userInfo:0];
  id v6 = sub_7CA4();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v8 = "-[MSDPreferencesFile raiseInvalidPropertyListObjectExceptionForObject:]";
    __int16 v9 = 2114;
    uint64_t v10 = v5;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%{public}s - Exception:  %{public}@", buf, 0x16u);
  }

  [v5 raise];
}

+ (id)preferencesFileUrl
{
  if (qword_1E680 != -1) {
    dispatch_once(&qword_1E680, &stru_18660);
  }
  v2 = (void *)qword_1E678;

  return v2;
}

- (id)deepCopy:(id)a3
{
  DeepCopy = (void *)CFPropertyListCreateDeepCopy(kCFAllocatorDefault, a3, 0);

  return DeepCopy;
}

- (NSMutableDictionary)cache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCache:(id)a3
{
}

- (void).cxx_destruct
{
}

@end