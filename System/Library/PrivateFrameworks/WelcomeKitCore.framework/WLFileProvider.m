@interface WLFileProvider
- (NSString)rootPath;
- (id)fetchRootPath;
- (void)setRootPath:(id)a3;
@end

@implementation WLFileProvider

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
      _WLLog();
      v7 = 0;
    }
    v3 = [v7 path];
    if (v3)
    {
      v8 = [MEMORY[0x263F08850] defaultManager];
      char v9 = [v8 fileExistsAtPath:v3];

      if ((v9 & 1) == 0)
      {
        _WLLog();
        v10 = [MEMORY[0x263F08850] defaultManager];
        id v14 = 0;
        [v10 createDirectoryAtPath:v3 withIntermediateDirectories:0 attributes:0 error:&v14];
        id v11 = v14;

        if (v11)
        {
          v13 = [v11 description];
          _WLLog();
        }
        else
        {
          _WLLog();
        }
      }
      -[WLFileProvider setRootPath:](self, "setRootPath:", v3, v13);
    }
    else
    {
      _WLLog();
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

@end