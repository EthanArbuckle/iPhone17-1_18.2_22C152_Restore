@interface MSDiOSApp
+ (id)appWithPath:(id)a3;
- (BOOL)isAlmondApp;
- (MSDiOSApp)initWithPath:(id)a3;
- (NSDictionary)info;
- (NSString)path;
- (id)codeSignaturePathForAlmondApp;
- (id)getCodeResourcesURL;
- (id)getExcutableURL;
- (id)serachForFileWithSuffix:(id)a3 inFolder:(id)a4;
- (id)uniqueIdentifier;
- (id)versionInfo;
- (void)dealloc;
- (void)setInfo:(id)a3;
- (void)setPath:(id)a3;
@end

@implementation MSDiOSApp

+ (id)appWithPath:(id)a3
{
  id v3 = a3;
  v4 = [[MSDiOSApp alloc] initWithPath:v3];

  return v4;
}

- (MSDiOSApp)initWithPath:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MSDiOSApp;
  v5 = [(MSDiOSApp *)&v13 init];
  if (!v5)
  {
    v10 = 0;
    goto LABEL_8;
  }
  if ([v4 rangeOfString:@".app"] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = sub_100068600();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000D9A3C();
    }
    goto LABEL_16;
  }
  v6 = +[NSBundle bundleWithPath:v4];
  if (!v6)
  {
    v7 = sub_100068600();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000D9AA8();
    }
    goto LABEL_16;
  }
  v7 = v6;
  v8 = [v6 infoDictionary];

  if (!v8)
  {
    v12 = sub_100068600();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1000D9B14();
    }

LABEL_16:
    v10 = 0;
    goto LABEL_6;
  }
  [(MSDiOSApp *)v5 setPath:v4];
  v9 = [v7 infoDictionary];
  [(MSDiOSApp *)v5 setInfo:v9];

  v10 = v5;
LABEL_6:

LABEL_8:
  return v10;
}

- (void)dealloc
{
  [(MSDiOSApp *)self setPath:0];
  [(MSDiOSApp *)self setInfo:0];
  v3.receiver = self;
  v3.super_class = (Class)MSDiOSApp;
  [(MSDiOSApp *)&v3 dealloc];
}

- (id)uniqueIdentifier
{
  objc_super v3 = [(MSDiOSApp *)self getExcutableURL];
  id v4 = sub_100068600();
  v5 = v4;
  if (!v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000D9B80(self);
    }

    goto LABEL_25;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [v3 path];
    *(_DWORD *)buf = 136315394;
    v27 = "-[MSDiOSApp uniqueIdentifier]";
    __int16 v28 = 2114;
    v29 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s - executableFileURL:  %{public}@", buf, 0x16u);
  }
  v7 = [(MSDiOSApp *)self getCodeResourcesURL];
  v8 = sub_100068600();
  v9 = v8;
  if (!v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000D9C10(self);
    }

LABEL_25:
    v7 = 0;
LABEL_29:
    v14 = 0;
    v17 = 0;
    v20 = 0;
    goto LABEL_16;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = [v7 path];
    *(_DWORD *)buf = 136315394;
    v27 = "-[MSDiOSApp uniqueIdentifier]";
    __int16 v28 = 2114;
    v29 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s - codeResourcesURL:  %{public}@", buf, 0x16u);
  }
  CC_SHA1_Init(&v24);
  v11 = [v3 path];
  v12 = +[NSInputStream inputStreamWithFileAtPath:v11];

  if (!v12)
  {
    v22 = sub_100068600();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_1000D9CA0(v3);
    }

    goto LABEL_29;
  }
  objc_super v13 = +[NSRunLoop currentRunLoop];
  [v12 scheduleInRunLoop:v13 forMode:NSDefaultRunLoopMode];

  [v12 open];
  v14 = malloc_type_calloc(0x40000uLL, 1uLL, 0xF66F3526uLL);
  uint64_t v15 = (uint64_t)[v12 read:v14 maxLength:0x40000];
  if (v15 >= 1)
  {
    do
    {
      CC_SHA1_Update(&v24, v14, v15);
      uint64_t v15 = (uint64_t)[v12 read:v14 maxLength:0x40000];
    }
    while (v15 > 0);
  }
  if (v15)
  {
    v23 = sub_100068600();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_1000D9D24(v3);
    }
  }
  else
  {
    [v12 close];
    v16 = [v7 path];
    v17 = +[NSInputStream inputStreamWithFileAtPath:v16];

    if (v17)
    {
      v18 = +[NSRunLoop currentRunLoop];
      [v17 scheduleInRunLoop:v18 forMode:NSDefaultRunLoopMode];

      [v17 open];
      uint64_t v19 = (uint64_t)[v17 read:v14 maxLength:0x40000];
      if (v19 >= 1)
      {
        do
        {
          CC_SHA1_Update(&v24, v14, v19);
          uint64_t v19 = (uint64_t)[v17 read:v14 maxLength:0x40000];
        }
        while (v19 > 0);
      }
      if (!v19)
      {
        [v17 close];
        free(v14);
        CC_SHA1_Final(md, &v24);
        v14 = +[NSData dataWithBytes:md length:20];
        v20 = [v14 hexStringRepresentation];
        goto LABEL_16;
      }
      v23 = sub_100068600();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_1000D9D24(v7);
      }
      v12 = v17;
    }
    else
    {
      v23 = sub_100068600();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_1000D9CA0(v7);
      }
      v12 = 0;
    }
  }

  if (v14)
  {
    free(v14);
    v14 = 0;
  }
  v20 = 0;
  v17 = v12;
LABEL_16:

  return v20;
}

- (id)versionInfo
{
  objc_super v3 = [(MSDiOSApp *)self info];
  id v4 = @"CFBundleShortVersionString";
  v5 = [v3 objectForKey:@"CFBundleShortVersionString"];

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = sub_100068600();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_1000D9E14(v6, v7, v8);
      }

      v9 = 0;
      id v4 = @"CFBundleShortVersionString";
      goto LABEL_9;
    }
LABEL_8:
    v9 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v5, v4, 0);
    goto LABEL_9;
  }
  id v4 = (id)kCFBundleVersionKey;
  v10 = [(MSDiOSApp *)self info];
  v5 = [v10 objectForKey:v4];

  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_8;
    }
  }
  v12 = sub_100068600();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_1000D9DA8();
  }

  v9 = 0;
LABEL_9:

  return v9;
}

- (id)getExcutableURL
{
  objc_super v3 = [(MSDiOSApp *)self path];
  id v4 = +[NSBundle bundleWithPath:v3];

  if (v4)
  {
    v5 = [v4 executableURL];
    if (v5) {
      goto LABEL_3;
    }
    uint64_t v7 = sub_100068600();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000D9F14(self);
    }
  }
  else
  {
    uint64_t v7 = sub_100068600();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000D9E90(self);
    }
  }

  v5 = 0;
LABEL_3:

  return v5;
}

- (id)getCodeResourcesURL
{
  objc_super v3 = [(MSDiOSApp *)self path];
  unsigned int v4 = +[MSDMacAppPkg isMacApp:v3];

  if (v4)
  {
    v5 = [(MSDiOSApp *)self path];
    uint64_t v6 = +[MSDMacAppPkg codeSignaturePath:v5];
  }
  else
  {
    if ([(MSDiOSApp *)self isAlmondApp])
    {
      uint64_t v7 = [(MSDiOSApp *)self codeSignaturePathForAlmondApp];
      goto LABEL_7;
    }
    v5 = [(MSDiOSApp *)self path];
    uint64_t v6 = [v5 stringByAppendingPathComponent:@"_CodeSignature"];
  }
  uint64_t v7 = (void *)v6;

LABEL_7:
  if (v7)
  {
    uint64_t v8 = [v7 stringByAppendingPathComponent:@"CodeResources"];
    v9 = +[NSURL fileURLWithPath:v8];
  }
  else
  {
    uint64_t v8 = [(MSDiOSApp *)self path];
    NSLog(@"Error - Failed to get CodeSignature path for app:  %@", v8);
    v9 = 0;
  }

  return v9;
}

- (BOOL)isAlmondApp
{
  char v8 = 0;
  v2 = [(MSDiOSApp *)self path];
  objc_super v3 = [v2 stringByAppendingPathComponent:@"Wrapper"];

  unsigned int v4 = +[NSFileManager defaultManager];
  unsigned __int8 v5 = [v4 fileExistsAtPath:v3 isDirectory:&v8];

  if (v8) {
    BOOL v6 = v5;
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)codeSignaturePathForAlmondApp
{
  objc_super v3 = [(MSDiOSApp *)self path];
  unsigned int v4 = [v3 stringByAppendingPathComponent:@"Wrapper"];

  unsigned __int8 v5 = [(MSDiOSApp *)self serachForFileWithSuffix:@".app" inFolder:v4];
  if (v5)
  {
    BOOL v6 = +[NSString stringWithFormat:@"%@/%@/%@", v4, v5, @"_CodeSignature"];
  }
  else
  {
    char v8 = sub_100068600();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000D9F98();
    }

    BOOL v6 = 0;
  }

  return v6;
}

- (id)serachForFileWithSuffix:(id)a3 inFolder:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = +[NSFileManager defaultManager];
  id v21 = 0;
  char v8 = [v7 contentsOfDirectoryAtPath:v6 error:&v21];
  id v9 = v21;

  if (v8)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v10 = v8;
    v11 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v11)
    {
      id v12 = 0;
      uint64_t v13 = *(void *)v18;
      while (2)
      {
        v14 = 0;
        uint64_t v15 = v12;
        do
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          id v12 = *(id *)(*((void *)&v17 + 1) + 8 * (void)v14);

          if (objc_msgSend(v12, "hasSuffix:", v5, (void)v17))
          {
            v11 = v12;

            v10 = v11;
            goto LABEL_12;
          }
          v14 = ((char *)v14 + 1);
          uint64_t v15 = v12;
        }
        while (v11 != v14);
        v11 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
  }
  else
  {
    v10 = sub_100068600();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000DA018((uint64_t)v6, v9, v10);
    }
    v11 = 0;
  }
LABEL_12:

  return v11;
}

- (NSString)path
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPath:(id)a3
{
}

- (NSDictionary)info
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_info, 0);

  objc_storeStrong((id *)&self->_path, 0);
}

@end