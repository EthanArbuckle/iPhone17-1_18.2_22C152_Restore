@interface OITSUTemporaryDirectory
- (BOOL)_createDirectoryWithSignature:(id)a3 subdirectory:(id)a4 error:(id *)a5;
- (OITSUTemporaryDirectory)init;
- (OITSUTemporaryDirectory)initWithError:(id *)a3;
- (OITSUTemporaryDirectory)initWithSignature:(id)a3 error:(id *)a4;
- (OITSUTemporaryDirectory)initWithSignature:(id)a3 subdirectory:(id)a4 error:(id *)a5;
- (id)URL;
- (id)initForWritingToURL:(id)a3 error:(id *)a4;
- (id)path;
- (void)dealloc;
- (void)leakTemporaryDirectory;
@end

@implementation OITSUTemporaryDirectory

- (OITSUTemporaryDirectory)init
{
  v2 = [NSString stringWithUTF8String:"-[OITSUTemporaryDirectory init]"];
  v3 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUTemporaryDirectory.m"];
  +[OITSUAssertionHandler handleFailureInFunction:v2 file:v3 lineNumber:26 isFatal:0 description:"Do not call method"];

  +[OITSUAssertionHandler logBacktraceThrottled];
  v4 = (void *)MEMORY[0x263EFF940];
  uint64_t v5 = *MEMORY[0x263EFF498];
  v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[OITSUTemporaryDirectory init]");
  id v7 = [v4 exceptionWithName:v5 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (OITSUTemporaryDirectory)initWithError:(id *)a3
{
  return [(OITSUTemporaryDirectory *)self initWithSignature:&stru_26EBF24D8 subdirectory:0 error:a3];
}

- (OITSUTemporaryDirectory)initWithSignature:(id)a3 error:(id *)a4
{
  return [(OITSUTemporaryDirectory *)self initWithSignature:a3 subdirectory:0 error:a4];
}

- (OITSUTemporaryDirectory)initWithSignature:(id)a3 subdirectory:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)OITSUTemporaryDirectory;
  v10 = [(OITSUTemporaryDirectory *)&v13 init];
  v11 = v10;
  if (v10
    && ![(OITSUTemporaryDirectory *)v10 _createDirectoryWithSignature:v8 subdirectory:v9 error:a5])
  {

    v11 = 0;
  }

  return v11;
}

- (id)initForWritingToURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)OITSUTemporaryDirectory;
  id v7 = [(OITSUTemporaryDirectory *)&v13 init];
  if (v7)
  {
    id v8 = [MEMORY[0x263F08850] defaultManager];
    id v9 = [v8 URLForDirectory:99 inDomain:1 appropriateForURL:v6 create:1 error:a4];

    uint64_t v10 = [v9 path];
    path = v7->_path;
    v7->_path = (NSString *)v10;

    if (!v9)
    {

      id v7 = 0;
    }
  }
  return v7;
}

- (void)dealloc
{
  if (!self->_leak)
  {
    v3 = [MEMORY[0x263F08850] defaultManager];
    path = self->_path;
    id v10 = 0;
    char v5 = [v3 removeItemAtPath:path error:&v10];
    id v6 = v10;
    id v7 = v6;
    if (v5)
    {
    }
    else
    {
      char v8 = objc_msgSend(v6, "tsu_isNoSuchFileError");

      if ((v8 & 1) == 0 && TSUDefaultCat_init_token != -1) {
        dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_8);
      }
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)OITSUTemporaryDirectory;
  [(OITSUTemporaryDirectory *)&v9 dealloc];
}

void __34__OITSUTemporaryDirectory_dealloc__block_invoke()
{
  uint64_t v0 = TSULogCreateCategory("TSUDefaultCat");
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;
}

- (id)path
{
  return self->_path;
}

- (id)URL
{
  return (id)[NSURL fileURLWithPath:self->_path isDirectory:1];
}

- (void)leakTemporaryDirectory
{
  self->_leak = 1;
}

- (BOOL)_createDirectoryWithSignature:(id)a3 subdirectory:(id)a4 error:(id *)a5
{
  char v8 = (__CFString *)a3;
  id v9 = a4;
  if (v8) {
    id v10 = v8;
  }
  else {
    id v10 = &stru_26EBF24D8;
  }
  if (_createDirectoryWithSignature_subdirectory_error__secretSubdirectoryNameBaseToken != -1) {
    dispatch_once(&_createDirectoryWithSignature_subdirectory_error__secretSubdirectoryNameBaseToken, &__block_literal_global_15);
  }
  v11 = [(id)_createDirectoryWithSignature_subdirectory_error__secretSubdirectoryNameBase stringByAppendingFormat:@"_%@_%d_%d", v10, (int)CFAbsoluteTimeGetCurrent(), atomic_fetch_add(_createDirectoryWithSignature_subdirectory_error__secretSubdirectoryIndex, 1u) + 1];
  if ((unint64_t)[v11 length] >= 0x100)
  {
    uint64_t v12 = [v11 substringToIndex:255];

    v11 = (void *)v12;
  }
  objc_super v13 = getenv("CIRRUSEXPORTERTEMPDIR");
  if (v13) {
    [NSString stringWithUTF8String:v13];
  }
  else {
  v14 = NSTemporaryDirectory();
  }
  v15 = v14;
  if (v9)
  {
    uint64_t v16 = [v14 stringByAppendingPathComponent:v9];

    v15 = (void *)v16;
  }
  v17 = [v15 stringByAppendingPathComponent:v11];
  v18 = [MEMORY[0x263F08850] defaultManager];
  id v23 = 0;
  char v19 = [v18 createDirectoryAtPath:v17 withIntermediateDirectories:1 attributes:0 error:&v23];
  id v20 = v23;

  objc_storeStrong((id *)&self->_path, v17);
  if (a5 && (v19 & 1) == 0)
  {
    if (v20)
    {
      *a5 = v20;
    }
    else
    {
      objc_msgSend(MEMORY[0x263F087E8], "tsu_fileWriteUnknownErrorWithUserInfo:", 0);
      id v21 = objc_claimAutoreleasedReturnValue();
      *a5 = v21;
    }
  }

  return v19;
}

void __76__OITSUTemporaryDirectory__createDirectoryWithSignature_subdirectory_error___block_invoke()
{
  uint64_t v0 = SFUBundle();
  id v6 = [v0 bundleIdentifier];

  id v1 = [NSString alloc];
  if (v6) {
    v2 = v6;
  }
  else {
    v2 = @"com.apple.Unknown";
  }
  v3 = (void *)[v1 initWithFormat:@"%@_%d", v2, getpid()];
  objc_storeStrong((id *)&_createDirectoryWithSignature_subdirectory_error__secretSubdirectoryNameBase, v3);
  if (!_createDirectoryWithSignature_subdirectory_error__secretSubdirectoryNameBase)
  {
    v4 = [NSString stringWithUTF8String:"-[OITSUTemporaryDirectory _createDirectoryWithSignature:subdirectory:error:]_block_invoke"];
    char v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUTemporaryDirectory.m"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 102, 0, "invalid nil value for '%{public}s'", "secretSubdirectoryNameBase");

    +[OITSUAssertionHandler logBacktraceThrottled];
  }
}

- (void).cxx_destruct
{
}

@end