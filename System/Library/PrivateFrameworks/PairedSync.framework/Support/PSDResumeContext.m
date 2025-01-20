@interface PSDResumeContext
+ (BOOL)supportsSecureCoding;
+ (PSDResumeContext)contextWithURL:(id)a3;
+ (id)defaultURL;
- (BOOL)save:(id *)a3;
- (PSDResumeContext)initWithCoder:(id)a3;
- (PSDResumeContext)initWithURL:(id)a3;
- (PSYSyncSession)syncSession;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)reset;
- (void)setSyncSession:(id)a3;
@end

@implementation PSDResumeContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)defaultURL
{
  v2 = +[PSDFileManager defaultManager];
  v3 = [v2 storageURL];

  v4 = [v3 URLByAppendingPathComponent:@"resumeContext.dat"];

  return v4;
}

+ (PSDResumeContext)contextWithURL:(id)a3
{
  id v4 = a3;
  uint64_t v16 = objc_opt_class();
  v5 = +[NSArray arrayWithObjects:&v16 count:1];
  v6 = +[NSSet setWithArray:v5];
  v7 = [v4 path];
  id v8 = +[NSKeyedUnarchiver secureUnarchiveObjectOfClasses:v6 withFile:v7];

  v9 = psd_log();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    if (v10)
    {
      v11 = psd_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v14) = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Successfully unarchived resume context", (uint8_t *)&v14, 2u);
      }
    }
  }
  else
  {
    if (v10)
    {
      v12 = psd_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138543362;
        id v15 = v4;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "No resume context at %{public}@.  Creating a new one.", (uint8_t *)&v14, 0xCu);
      }
    }
    id v8 = [objc_alloc((Class)a1) initWithURL:v4];
  }

  return (PSDResumeContext *)v8;
}

- (PSDResumeContext)initWithURL:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PSDResumeContext;
  v5 = [(PSDResumeContext *)&v11 init];
  if (v5)
  {
    v6 = (NSURL *)[v4 copy];
    URL = v5->_URL;
    v5->_URL = v6;

    id v8 = objc_alloc_init((Class)NSFileManager);
    v9 = [v4 URLByDeletingLastPathComponent];
    [v8 createDirectoryAtURL:v9 withIntermediateDirectories:1 attributes:0 error:0];
  }
  return v5;
}

- (PSDResumeContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PSDResumeContext;
  v5 = [(PSDResumeContext *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"URL"];
    URL = v5->_URL;
    v5->_URL = (NSURL *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"syncSession"];
    syncSession = v5->_syncSession;
    v5->_syncSession = (PSYSyncSession *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  URL = self->_URL;
  id v5 = a3;
  [v5 encodeObject:URL forKey:@"URL"];
  [v5 encodeObject:self->_syncSession forKey:@"syncSession"];
}

- (void)reset
{
  id v3 = objc_alloc_init((Class)NSFileManager);
  URL = self->_URL;
  uint64_t v5 = 0;
  [v3 removeItemAtURL:URL error:&v5];
  [(PSDResumeContext *)self setSyncSession:0];
}

- (BOOL)save:(id *)a3
{
  id v3 = self;
  id v4 = [(NSURL *)self->_URL path];
  LOBYTE(v3) = +[NSKeyedArchiver secureArchiveRootObject:v3 toFile:v4 withOptions:268435457];

  return (char)v3;
}

- (id)description
{
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  uint64_t v5 = [(NSURL *)self->_URL path];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@ %p; URL=%@;\n\tsyncSession=%@>",
    v4,
    self,
    v5,
  uint64_t v6 = self->_syncSession);

  return v6;
}

- (PSYSyncSession)syncSession
{
  return self->_syncSession;
}

- (void)setSyncSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncSession, 0);

  objc_storeStrong((id *)&self->_URL, 0);
}

@end