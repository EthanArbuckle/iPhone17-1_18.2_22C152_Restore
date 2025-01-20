@interface OCMapper
+ (id)mapperForCurrentThread;
- (BOOL)isCancelled;
- (OCMapper)init;
- (id)temporaryDirectoryPath;
- (void)cancel;
- (void)quit;
- (void)setup;
- (void)teardown;
@end

@implementation OCMapper

- (OCMapper)init
{
  v6.receiver = self;
  v6.super_class = (Class)OCMapper;
  v2 = [(OCMapper *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(OCCancel);
    mCancel = v2->mCancel;
    v2->mCancel = v3;
  }
  return v2;
}

- (void)cancel
{
}

- (BOOL)isCancelled
{
  return [(OCCancel *)self->mCancel isCancelled];
}

- (void)quit
{
}

- (void)setup
{
  id v7 = [MEMORY[0x263F08B88] currentThread];
  v3 = [v7 threadDictionary];
  v4 = [v3 objectForKey:@"kOCMapper"];

  if (v4)
  {
    id v8 = [NSString stringWithUTF8String:"-[OCMapper setup]"];
    v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/OfficeCommon/ImportExport/OCMapper.mm"];
    +[OITSUAssertionHandler handleFailureInFunction:v8 file:v5 lineNumber:53 isFatal:0 description:"More than one exporter document controller in one thread"];

    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  id v9 = [MEMORY[0x263F08B88] currentThread];
  objc_super v6 = [v9 threadDictionary];
  [v6 setObject:self forKey:@"kOCMapper"];
}

- (void)teardown
{
  +[TCBundleResourceManager disposeInstance];
  v3 = [MEMORY[0x263F08B88] currentThread];
  v4 = [v3 threadDictionary];
  v5 = [v4 objectForKey:@"kOCMapper"];

  if (v5 != self)
  {
    objc_super v6 = [NSString stringWithUTF8String:"-[OCMapper teardown]"];
    id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/OfficeCommon/ImportExport/OCMapper.mm"];
    +[OITSUAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:63 isFatal:0 description:"More than one exporter document controller in one thread"];

    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  id v8 = [MEMORY[0x263F08B88] currentThread];
  id v9 = [v8 threadDictionary];
  [v9 removeObjectForKey:@"kOCMapper"];

  mTemporaryDirectoryObject = self->mTemporaryDirectoryObject;
  self->mTemporaryDirectoryObject = 0;
}

+ (id)mapperForCurrentThread
{
  v2 = [MEMORY[0x263F08B88] currentThread];
  v3 = [v2 threadDictionary];
  v4 = [v3 objectForKey:@"kOCMapper"];

  return v4;
}

- (id)temporaryDirectoryPath
{
  mTemporaryDirectoryObject = self->mTemporaryDirectoryObject;
  if (!mTemporaryDirectoryObject)
  {
    v4 = [[OITSUTemporaryDirectory alloc] initWithError:0];
    v5 = self->mTemporaryDirectoryObject;
    self->mTemporaryDirectoryObject = v4;

    mTemporaryDirectoryObject = self->mTemporaryDirectoryObject;
  }
  return [(OITSUTemporaryDirectory *)mTemporaryDirectoryObject path];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mTemporaryDirectoryObject, 0);
  objc_storeStrong((id *)&self->mCancel, 0);
}

@end