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
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

uint64_t __36__MSDPreferencesFile_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance = objc_alloc_init(MSDPreferencesFile);
  return MEMORY[0x270F9A758]();
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
  v2 = [MEMORY[0x263F08850] defaultManager];
  v3 = +[MSDPreferencesFile preferencesFilePath];
  char v4 = [v2 fileExistsAtPath:v3];

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
    v9 = defaultLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MSDPreferencesFile objectForKey:](v9, v10, v11, v12, v13, v14, v15, v16);
    }

    v7 = 0;
  }

  return v7;
}

- (BOOL)setObject:(id)a3 forKey:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6 || !v7)
  {
    defaultLogHandle();
    uint64_t v10 = (MSDPreferencesFile *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v10->super, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 136446210;
      v17 = "-[MSDPreferencesFile setObject:forKey:]";
      uint64_t v14 = "%{public}s - Both object and key must be non-nil.";
LABEL_13:
      _os_log_impl(&dword_23911B000, &v10->super, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v16, 0xCu);
    }
LABEL_14:
    BOOL v13 = 0;
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    defaultLogHandle();
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
  if (([MEMORY[0x263F08AC0] propertyList:v6 isValidForFormat:100] & 1) == 0) {
    [(MSDPreferencesFile *)self raiseInvalidPropertyListObjectExceptionForObject:v6];
  }
  v9 = defaultLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[MSDPreferencesFile setObject:forKey:]((uint64_t)v8, (uint64_t)v6, v9);
  }

  uint64_t v10 = self;
  objc_sync_enter(v10);
  uint64_t v11 = [(MSDPreferencesFile *)v10 cache];
  uint64_t v12 = [(MSDPreferencesFile *)v10 deepCopy:v6];
  [v11 setObject:v12 forKey:v8];

  BOOL v13 = [(MSDPreferencesFile *)v10 saveCache];
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

    BOOL v7 = [(MSDPreferencesFile *)v5 saveCache];
    objc_sync_exit(v5);
  }
  else
  {
    v9 = defaultLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MSDPreferencesFile removeObjectForKey:](v9, v10, v11, v12, v13, v14, v15, v16);
    }

    BOOL v7 = 0;
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

    BOOL v7 = [(MSDPreferencesFile *)v5 saveCache];
    objc_sync_exit(v5);
  }
  else
  {
    v9 = defaultLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MSDPreferencesFile removeObjectsForKeys:](v9, v10, v11, v12, v13, v14, v15, v16);
    }

    BOOL v7 = 0;
  }

  return v7;
}

- (void)populateCache
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (!+[MSDPreferencesFile preferencesFileExists])
  {
LABEL_7:
    id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [(MSDPreferencesFile *)self setCache:v5];
    goto LABEL_8;
  }
  v3 = NSDictionary;
  id v4 = +[MSDPreferencesFile preferencesFileUrl];
  id v10 = 0;
  id v5 = [v3 dictionaryWithContentsOfURL:v4 error:&v10];
  id v6 = v10;

  if (!v5)
  {
    v8 = defaultLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = +[MSDPreferencesFile preferencesFilePath];
      *(_DWORD *)buf = 136446722;
      uint64_t v12 = "-[MSDPreferencesFile populateCache]";
      __int16 v13 = 2114;
      uint64_t v14 = v9;
      __int16 v15 = 2114;
      id v16 = v6;
      _os_log_impl(&dword_23911B000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s - Failed to read preferences file:  %{public}@ - Error:  %{public}@", buf, 0x20u);
    }
    goto LABEL_7;
  }

  BOOL v7 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v5];
  [(MSDPreferencesFile *)self setCache:v7];

LABEL_8:
}

- (BOOL)saveCache
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = [(MSDPreferencesFile *)self cache];
  v3 = +[MSDPreferencesFile preferencesFileUrl];
  id v9 = 0;
  char v4 = [v2 writeToURL:v3 error:&v9];
  id v5 = v9;

  if ((v4 & 1) == 0)
  {
    id v6 = defaultLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v7 = +[MSDPreferencesFile preferencesFilePath];
      *(_DWORD *)buf = 136446722;
      uint64_t v11 = "-[MSDPreferencesFile saveCache]";
      __int16 v12 = 2114;
      __int16 v13 = v7;
      __int16 v14 = 2114;
      id v15 = v5;
      _os_log_impl(&dword_23911B000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s - Failed to save preferences file:  %{public}@ - Error:  %{public}@", buf, 0x20u);
    }
  }

  return v4;
}

- (void)raiseInvalidPropertyListObjectExceptionForObject:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3 = NSString;
  id v4 = a3;
  id v5 = [v3 stringWithFormat:@"Object %@ of type %@ is not a valid property list object.", v4, objc_opt_class()];

  id v6 = [MEMORY[0x263EFF940] exceptionWithName:@"InvalidPropertyListObject" reason:v5 userInfo:0];
  BOOL v7 = defaultLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v9 = "-[MSDPreferencesFile raiseInvalidPropertyListObjectExceptionForObject:]";
    __int16 v10 = 2114;
    uint64_t v11 = v6;
    _os_log_impl(&dword_23911B000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s - Exception:  %{public}@", buf, 0x16u);
  }

  [v6 raise];
}

+ (id)preferencesFileUrl
{
  if (preferencesFileUrl_onceToken != -1) {
    dispatch_once(&preferencesFileUrl_onceToken, &__block_literal_global_12);
  }
  v2 = (void *)preferencesFileUrl_fileUrl;
  return v2;
}

void __40__MSDPreferencesFile_preferencesFileUrl__block_invoke()
{
  v0 = [@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata" stringByAppendingPathComponent:@"com.apple.MobileStoreDemo"];
  id v3 = [v0 stringByAppendingPathExtension:@"plist"];

  uint64_t v1 = [NSURL fileURLWithPath:v3 isDirectory:0];
  v2 = (void *)preferencesFileUrl_fileUrl;
  preferencesFileUrl_fileUrl = v1;
}

- (id)deepCopy:(id)a3
{
  DeepCopy = (void *)CFPropertyListCreateDeepCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], a3, 0);
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

- (void)objectForKey:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setObject:(os_log_t)log forKey:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_23911B000, log, OS_LOG_TYPE_DEBUG, "Setting preference %{public}@:%{public}@", (uint8_t *)&v3, 0x16u);
}

- (void)removeObjectForKey:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)removeObjectsForKeys:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end