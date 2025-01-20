@interface FMDProtectedContext
+ (BOOL)isUnittest;
+ (NSURL)unittestRootURL;
+ (id)directoryURLForContextKey:(id)a3;
+ (id)rootDirectoryURL;
+ (void)setIsUnittest:(BOOL)a3;
+ (void)setUnittestRootURL:(id)a3;
- (FMDProtectedContext)initWithContextKey:(id)a3;
- (FMDProtectedContext)initWithContextKey:(id)a3 contextUUID:(id)a4;
- (FMDataArchiver)dataArchiver;
- (NSDictionary)contextDictionary;
- (NSString)contextKey;
- (NSUUID)contextUUID;
- (id)context:(id *)a3;
- (id)contextForContextKey:(id)a3 error:(id *)a4;
- (id)fileURLForContextKey:(id)a3;
- (int64_t)_fmDataProtectionClass;
- (int64_t)protectionClass;
- (void)saveContext:(id)a3;
- (void)saveForContextKey:(id)a3;
- (void)setContextDictionary:(id)a3;
- (void)setContextKey:(id)a3;
- (void)setContextUUID:(id)a3;
- (void)setDataArchiver:(id)a3;
- (void)setProtectionClass:(int64_t)a3;
- (void)setupDataArchiverWithURL:(id)a3;
@end

@implementation FMDProtectedContext

- (FMDProtectedContext)initWithContextKey:(id)a3
{
  return [(FMDProtectedContext *)self initWithContextKey:a3 contextUUID:0];
}

- (FMDProtectedContext)initWithContextKey:(id)a3 contextUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FMDProtectedContext;
  v8 = [(FMDProtectedContext *)&v14 init];
  v9 = v8;
  if (v8)
  {
    [(FMDProtectedContext *)v8 setContextKey:v6];
    if (v7)
    {
      [(FMDProtectedContext *)v9 setContextUUID:v7];
    }
    else
    {
      v10 = +[NSUUID UUID];
      [(FMDProtectedContext *)v9 setContextUUID:v10];
    }
    [(FMDProtectedContext *)v9 setProtectionClass:2];
    v11 = [(FMDProtectedContext *)v9 contextKey];
    v12 = [(FMDProtectedContext *)v9 fileURLForContextKey:v11];

    [(FMDProtectedContext *)v9 setupDataArchiverWithURL:v12];
  }

  return v9;
}

- (void)setProtectionClass:(int64_t)a3
{
  self->_protectionClass = a3;
  int64_t v4 = [(FMDProtectedContext *)self _fmDataProtectionClass];
  id v5 = [(FMDProtectedContext *)self dataArchiver];
  [v5 setDataProtectionClass:v4];
}

- (void)setupDataArchiverWithURL:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [objc_alloc((Class)FMDataArchiver) initWithFileURL:v4];
    [v5 setBackedUp:0];
    [v5 setCreateDirectories:1];
    [v5 setDataProtectionClass:[(FMDProtectedContext *)self _fmDataProtectionClass]];
    [(FMDProtectedContext *)self setDataArchiver:v5];
  }
  else
  {
    id v5 = sub_100004238();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10023C000(self, v5);
    }
  }
}

- (void)saveContext:(id)a3
{
  id v4 = a3;
  id v5 = [(FMDProtectedContext *)self contextKey];
  v8 = v5;
  id v9 = v4;
  id v6 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];

  [(FMDProtectedContext *)self setContextDictionary:v6];
  id v7 = [(FMDProtectedContext *)self contextKey];
  [(FMDProtectedContext *)self saveForContextKey:v7];
}

- (id)context:(id *)a3
{
  id v5 = [(FMDProtectedContext *)self contextKey];
  id v6 = [(FMDProtectedContext *)self contextForContextKey:v5 error:a3];

  return v6;
}

+ (id)directoryURLForContextKey:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = [(id)objc_opt_class() rootDirectoryURL];
    id v5 = [v3 lastPathComponent];
    id v6 = [v4 URLByAppendingPathComponent:v5 isDirectory:1];
  }
  else
  {
    id v6 = 0;
  }
  id v7 = sub_100004238();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412290;
    v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "New protected context directory URL %@", (uint8_t *)&v9, 0xCu);
  }

  return v6;
}

+ (id)rootDirectoryURL
{
  if (+[FMDProtectedContext isUnittest])
  {
    v2 = +[FMDProtectedContext unittestRootURL];
  }
  else
  {
    id v3 = objc_alloc_init((Class)FMInternalFileContainer);
    id v4 = [v3 url];
    id v5 = [v4 fm_preferencesPathURLForDomain:@"com.apple.icloud.findmydeviced.protectedcontext"];

    id v6 = [v5 URLByDeletingLastPathComponent];
    v2 = [v6 URLByAppendingPathComponent:@"protectedContexts" isDirectory:1];

    id v7 = sub_100004238();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_10023C094();
    }
  }

  return v2;
}

+ (void)setIsUnittest:(BOOL)a3
{
  byte_10031E798 = a3;
}

+ (BOOL)isUnittest
{
  return byte_10031E798;
}

+ (void)setUnittestRootURL:(id)a3
{
}

+ (NSURL)unittestRootURL
{
  return (NSURL *)(id)qword_10031E790;
}

- (id)fileURLForContextKey:(id)a3
{
  id v4 = +[FMDProtectedContext directoryURLForContextKey:a3];
  id v5 = [(FMDProtectedContext *)self contextUUID];

  if (v5)
  {
    id v6 = [(FMDProtectedContext *)self contextUUID];
    id v7 = [v6 UUIDString];

    id v5 = [v4 URLByAppendingPathComponent:v7 isDirectory:0];
    v8 = sub_100004238();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_10023C0FC();
    }
  }

  return v5;
}

- (id)contextForContextKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(FMDProtectedContext *)self contextDictionary];
  id v8 = [v7 copy];

  if (!v8)
  {
    int v9 = sub_100004238();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_10023C164();
    }

    v10 = [(FMDProtectedContext *)self dataArchiver];
    v11 = +[NSSet setWithObject:objc_opt_class()];
    id v19 = 0;
    id v8 = [v10 readDictionaryAndClasses:v11 error:&v19];
    id v12 = v19;

    if (v12)
    {
      v13 = sub_100004238();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v23 = v6;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Unable to read %@", buf, 0xCu);
      }

      objc_super v14 = +[FMDEventLoggerGeneral sharedInstance];
      [v14 sendError:v12 forEventName:@"FMDProtectedContextFailedReadEventName"];

      NSErrorUserInfoKey v20 = NSUnderlyingErrorKey;
      id v21 = v12;
      v15 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
      v16 = +[NSError errorWithDomain:@"com.apple.icloud.findmydeviced.protectedcontext" code:1 userInfo:v15];

      if (a4) {
        *a4 = v16;
      }
    }
    [(FMDProtectedContext *)self setContextDictionary:v8];
  }
  v17 = [v8 objectForKeyedSubscript:v6];

  return v17;
}

- (void)saveForContextKey:(id)a3
{
  id v4 = [(FMDProtectedContext *)self contextDictionary];

  if (v4)
  {
    id v5 = sub_100004238();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_10023C268(self, v5);
    }

    id v6 = [(FMDProtectedContext *)self dataArchiver];
    id v7 = [(FMDProtectedContext *)self contextDictionary];
    id v8 = [v6 saveDictionary:v7];

    if (v8)
    {
      int v9 = sub_100004238();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10023C1CC(v8, v9);
      }
    }
  }
}

- (int64_t)_fmDataProtectionClass
{
  return [(FMDProtectedContext *)self protectionClass];
}

- (NSUUID)contextUUID
{
  return self->_contextUUID;
}

- (void)setContextUUID:(id)a3
{
}

- (int64_t)protectionClass
{
  return self->_protectionClass;
}

- (NSDictionary)contextDictionary
{
  return self->_contextDictionary;
}

- (void)setContextDictionary:(id)a3
{
}

- (NSString)contextKey
{
  return self->_contextKey;
}

- (void)setContextKey:(id)a3
{
}

- (FMDataArchiver)dataArchiver
{
  return self->_dataArchiver;
}

- (void)setDataArchiver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataArchiver, 0);
  objc_storeStrong((id *)&self->_contextKey, 0);
  objc_storeStrong((id *)&self->_contextDictionary, 0);

  objc_storeStrong((id *)&self->_contextUUID, 0);
}

@end