@interface TSUManagedTemporaryDirectory
- (NSURL)URL;
- (TSUManagedTemporaryDirectory)init;
- (TSUManagedTemporaryDirectory)initWithURL:(id)a3;
- (void)dealloc;
@end

@implementation TSUManagedTemporaryDirectory

- (TSUManagedTemporaryDirectory)initWithURL:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)TSUManagedTemporaryDirectory;
    v5 = [(TSUManagedTemporaryDirectory *)&v10 init];
    if (v5)
    {
      uint64_t v6 = [v4 copy];
      URL = v5->_URL;
      v5->_URL = (NSURL *)v6;
    }
    self = v5;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (TSUManagedTemporaryDirectory)init
{
  v2 = [NSString stringWithUTF8String:"-[TSUManagedTemporaryDirectory init]"];
  v3 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUTemporaryDirectoryManager.m"];
  +[OITSUAssertionHandler handleFailureInFunction:v2 file:v3 lineNumber:30 isFatal:0 description:"Do not call method"];

  +[OITSUAssertionHandler logBacktraceThrottled];
  id v4 = (void *)MEMORY[0x263EFF940];
  uint64_t v5 = *MEMORY[0x263EFF498];
  uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[TSUManagedTemporaryDirectory init]");
  id v7 = [v4 exceptionWithName:v5 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (void)dealloc
{
  if (TSUManagedTemporaryLogCat_init_token != -1) {
    dispatch_once(&TSUManagedTemporaryLogCat_init_token, &__block_literal_global_30);
  }
  if ([(NSURL *)self->_URL checkResourceIsReachableAndReturnError:0])
  {
    v3 = [MEMORY[0x263F08850] defaultManager];
    URL = self->_URL;
    uint64_t v7 = 0;
    char v5 = [v3 removeItemAtURL:URL error:&v7];

    if ((v5 & 1) == 0 && TSUDefaultCat_init_token != -1) {
      dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_12_0);
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)TSUManagedTemporaryDirectory;
  [(TSUManagedTemporaryDirectory *)&v6 dealloc];
}

void __39__TSUManagedTemporaryDirectory_dealloc__block_invoke()
{
  uint64_t v0 = TSULogCreateCategory("TSUManagedTemporaryLogCat");
  v1 = (void *)TSUManagedTemporaryLogCat_log_t;
  TSUManagedTemporaryLogCat_log_t = v0;
}

void __39__TSUManagedTemporaryDirectory_dealloc__block_invoke_2()
{
  uint64_t v0 = TSULogCreateCategory("TSUDefaultCat");
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void).cxx_destruct
{
}

@end