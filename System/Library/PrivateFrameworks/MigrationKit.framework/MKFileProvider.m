@interface MKFileProvider
- (NSString)rootPath;
- (id)fetchRootPath;
- (void)fetchRootPath;
- (void)setRootPath:(id)a3;
@end

@implementation MKFileProvider

- (id)fetchRootPath
{
  rootPath = self->_rootPath;
  if (rootPath)
  {
    v3 = rootPath;
  }
  else
  {
    v5 = [MEMORY[0x263F08850] defaultManager];
    v6 = [v5 containerURLForSecurityApplicationGroupIdentifier:@"group.com.apple.FileProvider.LocalStorage"];

    if (v6)
    {
      v7 = [v6 URLByAppendingPathComponent:@"File Provider Storage"];
    }
    else
    {
      v8 = +[MKLog log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[MKFileProvider fetchRootPath](v8);
      }

      v7 = 0;
    }
    v3 = [v7 path];
    if (v3)
    {
      v9 = [MEMORY[0x263F08850] defaultManager];
      char v10 = [v9 fileExistsAtPath:v3];

      if ((v10 & 1) == 0)
      {
        v11 = [MEMORY[0x263F08850] defaultManager];
        id v16 = 0;
        [v11 createDirectoryAtPath:v3 withIntermediateDirectories:0 attributes:0 error:&v16];
        id v12 = v16;

        if (v12)
        {
          v13 = +[MKLog log];
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            [(MKFileProvider *)(uint64_t)self fetchRootPath];
          }
        }
      }
      [(MKFileProvider *)self setRootPath:v3];
    }
    else
    {
      v14 = +[MKLog log];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[MKFileProvider fetchRootPath](v14);
      }
    }
  }
  return v3;
}

- (NSString)rootPath
{
  return self->_rootPath;
}

- (void)setRootPath:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)fetchRootPath
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22BFAC000, log, OS_LOG_TYPE_ERROR, "No Local File Storage container found.", v1, 2u);
}

@end