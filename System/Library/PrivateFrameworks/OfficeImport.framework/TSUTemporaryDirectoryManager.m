@interface TSUTemporaryDirectoryManager
+ (Class)managedTemporaryDirectoryClass;
+ (id)baseDirectoryURL;
+ (id)makeUniqueDirectoryWithBaseDirectory:(id)a3 filename:(id)a4;
+ (id)sharedManager;
- (TSUTemporaryDirectoryManager)init;
- (id)_readDirectories;
- (id)newDirectoryWithFilename:(id)a3;
- (void)_clearDirectories:(id)a3;
@end

@implementation TSUTemporaryDirectoryManager

+ (id)baseDirectoryURL
{
  v2 = [NSString stringWithUTF8String:"+[TSUTemporaryDirectoryManager baseDirectoryURL]"];
  v3 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUTemporaryDirectoryManager.m"];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  +[OITSUAssertionHandler handleFailureInFunction:v2, v3, 51, 0, "Abstract method not overridden by %@", v5 file lineNumber isFatal description];

  +[OITSUAssertionHandler logBacktraceThrottled];
  v6 = (void *)MEMORY[0x263EFF940];
  uint64_t v7 = *MEMORY[0x263EFF498];
  v8 = NSString;
  v9 = (objc_class *)objc_opt_class();
  v10 = NSStringFromClass(v9);
  v11 = [v8 stringWithFormat:@"Abstract method not overridden by %@: %s", v10, "+[TSUTemporaryDirectoryManager baseDirectoryURL]"];
  id v12 = [v6 exceptionWithName:v7 reason:v11 userInfo:0];

  objc_exception_throw(v12);
}

+ (Class)managedTemporaryDirectoryClass
{
  return (Class)objc_opt_class();
}

+ (id)sharedManager
{
  v2 = [NSString stringWithUTF8String:"+[TSUTemporaryDirectoryManager sharedManager]"];
  v3 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUTemporaryDirectoryManager.m"];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  +[OITSUAssertionHandler handleFailureInFunction:v2, v3, 59, 0, "Abstract method not overridden by %@", v5 file lineNumber isFatal description];

  +[OITSUAssertionHandler logBacktraceThrottled];
  v6 = (void *)MEMORY[0x263EFF940];
  uint64_t v7 = *MEMORY[0x263EFF498];
  v8 = NSString;
  v9 = (objc_class *)objc_opt_class();
  v10 = NSStringFromClass(v9);
  v11 = [v8 stringWithFormat:@"Abstract method not overridden by %@: %s", v10, "+[TSUTemporaryDirectoryManager sharedManager]"];
  id v12 = [v6 exceptionWithName:v7 reason:v11 userInfo:0];

  objc_exception_throw(v12);
}

+ (id)makeUniqueDirectoryWithBaseDirectory:(id)a3 filename:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (!v5)
  {
    v21 = [NSString stringWithUTF8String:"+[TSUTemporaryDirectoryManager makeUniqueDirectoryWithBaseDirectory:filename:]"];
    v22 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUTemporaryDirectoryManager.m"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v21, v22, 63, 0, "invalid nil value for '%{public}s'", "baseDirectory");

    +[OITSUAssertionHandler logBacktraceThrottled];
    if (v7) {
      goto LABEL_3;
    }
LABEL_13:
    v23 = [NSString stringWithUTF8String:"+[TSUTemporaryDirectoryManager makeUniqueDirectoryWithBaseDirectory:filename:]"];
    v24 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUTemporaryDirectoryManager.m"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v23, v24, 64, 0, "invalid nil value for '%{public}s'", "filename");

    +[OITSUAssertionHandler logBacktraceThrottled];
    goto LABEL_3;
  }
  if (!v6) {
    goto LABEL_13;
  }
LABEL_3:
  v8 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v26 = 0;
  char v9 = [v8 createDirectoryAtPath:v5 withIntermediateDirectories:1 attributes:0 error:&v26];

  if ((v9 & 1) == 0 && TSUDefaultCat_init_token != -1) {
    dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_35);
  }
  v10 = 0;
  if (v5 && v7)
  {
    v11 = [v7 stringByAppendingString:@".XXXXXX"];
    id v12 = [v5 stringByAppendingPathComponent:v11];

    id v5 = v12;
    v13 = (const char *)[v5 fileSystemRepresentation];
    if (v13 && (size_t v14 = strlen(v13), (v15 = (char *)malloc_type_calloc(v14 + 1, 1uLL, 0x100004077774924uLL)) != 0))
    {
      v16 = v15;
      id v5 = v5;
      v17 = strncpy(v16, (const char *)[v5 fileSystemRepresentation], v14);
      v16[v14] = 0;
      v18 = mkdtemp(v17);
      if (v18)
      {
        v19 = NSURL;
        v20 = [NSString stringWithUTF8String:v18];
        v10 = objc_msgSend(v19, "tsu_fileURLWithPath:", v20);
      }
      else
      {
        v10 = 0;
      }
      free(v16);
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

void __78__TSUTemporaryDirectoryManager_makeUniqueDirectoryWithBaseDirectory_filename___block_invoke()
{
  uint64_t v0 = TSULogCreateCategory("TSUDefaultCat");
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;
}

- (TSUTemporaryDirectoryManager)init
{
  v14.receiver = self;
  v14.super_class = (Class)TSUTemporaryDirectoryManager;
  v2 = [(TSUTemporaryDirectoryManager *)&v14 init];
  if (v2)
  {
    v3 = [(id)objc_opt_class() baseDirectoryURL];
    uint64_t v4 = [v3 copy];
    baseDirectoryURL = v2->_baseDirectoryURL;
    v2->_baseDirectoryURL = (NSURL *)v4;

    if (!v2->_baseDirectoryURL)
    {
      id v6 = [NSString stringWithUTF8String:"-[TSUTemporaryDirectoryManager init]"];
      uint64_t v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUTemporaryDirectoryManager.m"];
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 101, 0, "invalid nil value for '%{public}s'", "_baseDirectoryURL");

      +[OITSUAssertionHandler logBacktraceThrottled];
    }
    v8 = [(TSUTemporaryDirectoryManager *)v2 _readDirectories];
    if ([v8 count])
    {
      char v9 = dispatch_get_global_queue(-32768, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __36__TSUTemporaryDirectoryManager_init__block_invoke;
      block[3] = &unk_264D612E8;
      id v12 = v8;
      v13 = v2;
      dispatch_async(v9, block);
    }
  }
  return v2;
}

uint64_t __36__TSUTemporaryDirectoryManager_init__block_invoke(uint64_t a1)
{
  if (TSUManagedTemporaryLogCat_init_token != -1) {
    dispatch_once(&TSUManagedTemporaryLogCat_init_token, &__block_literal_global_43);
  }
  uint64_t v3 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  return [v2 _clearDirectories:v3];
}

void __36__TSUTemporaryDirectoryManager_init__block_invoke_2()
{
  uint64_t v0 = TSULogCreateCategory("TSUManagedTemporaryLogCat");
  v1 = (void *)TSUManagedTemporaryLogCat_log_t;
  TSUManagedTemporaryLogCat_log_t = v0;
}

- (id)_readDirectories
{
  v20[1] = *MEMORY[0x263EF8340];
  if (self->_baseDirectoryURL)
  {
    uint64_t v3 = [MEMORY[0x263F08850] defaultManager];
    baseDirectoryURL = self->_baseDirectoryURL;
    v20[0] = *MEMORY[0x263EFF758];
    id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
    id v6 = [v3 contentsOfDirectoryAtURL:baseDirectoryURL includingPropertiesForKeys:v5 options:0 error:0];

    uint64_t v7 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "path", (void)v15);
          [v7 addObject:v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  return v7;
}

- (void)_clearDirectories:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x263F08850] defaultManager];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(v4, "removeItemAtPath:error:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), 0, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)newDirectoryWithFilename:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v5 = [NSString stringWithUTF8String:"-[TSUTemporaryDirectoryManager newDirectoryWithFilename:]"];
    uint64_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUTemporaryDirectoryManager.m"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 139, 0, "invalid nil value for '%{public}s'", "filename");

    +[OITSUAssertionHandler logBacktraceThrottled];
    uint64_t v7 = [MEMORY[0x263F08C38] UUID];
    id v4 = [v7 UUIDString];
  }
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = [(NSURL *)self->_baseDirectoryURL path];
  long long v10 = [v8 makeUniqueDirectoryWithBaseDirectory:v9 filename:v4];

  if (!v10)
  {
    if (TSUDefaultCat_init_token != -1) {
      dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_48);
    }
    baseDirectoryURL = self->_baseDirectoryURL;
    long long v12 = [MEMORY[0x263F08C38] UUID];
    long long v13 = [v12 UUIDString];
    long long v10 = [(NSURL *)baseDirectoryURL URLByAppendingPathComponent:v13];

    if (!v10)
    {
      objc_super v14 = [NSString stringWithUTF8String:"-[TSUTemporaryDirectoryManager newDirectoryWithFilename:]"];
      uint64_t v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUTemporaryDirectoryManager.m"];
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 151, 0, "invalid nil value for '%{public}s'", "URL");

      +[OITSUAssertionHandler logBacktraceThrottled];
      long long v10 = 0;
    }
  }
  long long v16 = (objc_class *)[(id)objc_opt_class() managedTemporaryDirectoryClass];
  if (([(objc_class *)v16 isSubclassOfClass:objc_opt_class()] & 1) == 0)
  {
    long long v17 = [NSString stringWithUTF8String:"-[TSUTemporaryDirectoryManager newDirectoryWithFilename:]"];
    long long v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUTemporaryDirectoryManager.m"];
    v19 = NSStringFromClass(v16);
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 154, 0, "Invalid managed temporary directory class: %{public}@", v19);

    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  v20 = (void *)[[v16 alloc] initWithURL:v10];

  return v20;
}

void __57__TSUTemporaryDirectoryManager_newDirectoryWithFilename___block_invoke()
{
  uint64_t v0 = TSULogCreateCategory("TSUDefaultCat");
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;
}

- (void).cxx_destruct
{
}

@end