@interface CMProgressiveArchiveManager
- (BOOL)isCancelled;
- (BOOL)isProgressive;
- (CMProgressiveArchiveManager)initWithClient:(const void *)a3 andCallBacks:(id *)a4;
- (id)copyResourceWithName:(id)a3 type:(int)a4;
- (void)closeResourceAtPath:(id)a3;
- (void)commitDataAtPath:(id)a3;
- (void)pushCssToPath:(id)a3;
- (void)pushData:(id)a3 toPath:(id)a4;
- (void)pushText:(id)a3 toPath:(id)a4;
@end

@implementation CMProgressiveArchiveManager

- (CMProgressiveArchiveManager)initWithClient:(const void *)a3 andCallBacks:(id *)a4
{
  v11.receiver = self;
  v11.super_class = (Class)CMProgressiveArchiveManager;
  v6 = [(CMStylingArchiveManager *)&v11 init];
  v7 = v6;
  if (v6)
  {
    v6->mClient = a3;
    v6->mCallBacks = a4;
    uint64_t v8 = objc_opt_new();
    mDataCache = v7->mDataCache;
    v7->mDataCache = (NSMutableDictionary *)v8;

    v7->super.super.mCommitInterval = 2.0;
    v7->super.super.mAutoCommit = 1;
  }
  return v7;
}

- (BOOL)isCancelled
{
  return ((uint64_t (*)(const void *, SEL))self->mCallBacks->var3)(self->mClient, a2) ^ 1;
}

- (void)commitDataAtPath:(id)a3
{
  v4 = (__CFString *)a3;
  v12 = v4;
  if (!v4)
  {
    if (!self->mMainDataInited)
    {
      v5 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithObjectsAndKeys:", @"text/html", @"MimeType", @"UTF-8", @"TextEncoding", 0);
      if (self->super.super.mWidth)
      {
        v6 = objc_msgSend(NSNumber, "numberWithInt:");
        [v5 setObject:v6 forKey:HTMLWidth];
      }
      if (self->super.super.mHeight)
      {
        v7 = objc_msgSend(NSNumber, "numberWithInt:");
        [v5 setObject:v7 forKey:HTMLHeight];
      }
      if (self->super.super.mPageCount)
      {
        uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
        [v5 setObject:v8 forKey:HTMLPageCount];
      }
      ((void (*)(const void *, __CFString *, void *))self->mCallBacks->var0)(self->mClient, @"public.html", v5);
      self->mMainDataInited = 1;
    }
    v4 = @"##main##";
  }
  v9 = v4;
  v10 = [(NSMutableDictionary *)self->mDataCache objectForKey:v9];
  if (v10)
  {
    if (v12) {
      uint64_t v11 = objc_msgSend(NSURL, "URLWithString:");
    }
    else {
      uint64_t v11 = 0;
    }
    ((void (*)(const void *, uint64_t, void *, void))self->mCallBacks->var2)(self->mClient, v11, v10, 0);
    [(NSMutableDictionary *)self->mDataCache removeObjectForKey:v9];
  }
}

- (void)pushText:(id)a3 toPath:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (![(CMArchiveManager *)self progressiveMappingIsPausedOnPath:v6])
  {
    if (!v6) {
      [(NSMutableString *)self->mHtmlLogString appendString:v8];
    }
    v7 = [v8 dataUsingEncoding:4];
    [(CMProgressiveArchiveManager *)self pushData:v7 toPath:v6];
  }
}

- (void)pushData:(id)a3 toPath:(id)a4
{
  id v17 = a3;
  id v6 = (__CFString *)a4;
  if (!self->mStartDate)
  {
    v7 = (NSDate *)objc_alloc_init(MEMORY[0x263EFF910]);
    mStartDate = self->mStartDate;
    self->mStartDate = v7;
  }
  v9 = @"##main##";
  if (v6) {
    v9 = v6;
  }
  v10 = v9;
  if (![(CMArchiveManager *)self progressiveMappingIsPausedOnPath:v10])
  {
    uint64_t v11 = [(NSMutableDictionary *)self->mDataCache objectForKey:v10];
    if (!v11)
    {
      uint64_t v11 = objc_msgSend(MEMORY[0x263EFF990], "dataWithLength:", objc_msgSend(v17, "length"));
      [(NSMutableDictionary *)self->mDataCache setObject:v17 forKey:v10];
    }
    [v11 appendData:v17];
    if (!v6 && self->super.super.mAutoCommit)
    {
      if (self->super.super.mCommitInterval == 0.0
        || ([(NSDate *)self->mStartDate timeIntervalSinceNow], fabs(v12) < 2.0))
      {
        [(CMProgressiveArchiveManager *)self commitDataAtPath:0];
      }
      else
      {
        mLastCommitDate = self->mLastCommitDate;
        if (!mLastCommitDate
          || ([(NSDate *)mLastCommitDate timeIntervalSinceNow],
              fabs(v14) > self->super.super.mCommitInterval))
        {
          [(CMProgressiveArchiveManager *)self commitDataAtPath:0];
          v15 = (NSDate *)objc_alloc_init(MEMORY[0x263EFF910]);
          v16 = self->mLastCommitDate;
          self->mLastCommitDate = v15;
        }
      }
    }
  }
}

- (void)pushCssToPath:(id)a3
{
  id v4 = [(CMStylingArchiveManager *)self commitStylesheet];
  if (v4) {
    [(CMProgressiveArchiveManager *)self pushText:v4 toPath:0];
  }
}

- (BOOL)isProgressive
{
  return 1;
}

- (void)closeResourceAtPath:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4) {
    id v4 = (id)[NSURL URLWithString:v4];
  }
  ((void (*)(const void *, id, void, uint64_t))self->mCallBacks->var2)(self->mClient, v4, 0, 1);
}

- (id)copyResourceWithName:(id)a3 type:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v7 = +[CMArchiveManager resourceTypeToMIME:v4];
  id v8 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", v7, @"MimeType", @"UTF-8", @"TextEncoding", 0);
  v9 = (void *)((uint64_t (*)(const void *, id, void *))self->mCallBacks->var1)(self->mClient, v6, v8);
  v10 = v9;
  if (v9)
  {
    uint64_t v11 = [v9 absoluteString];
    CFRelease(v10);
    v10 = (const void *)[v11 copy];
  }
  return (id)v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mHtmlLogString, 0);
  objc_storeStrong((id *)&self->mLastCommitDate, 0);
  objc_storeStrong((id *)&self->mStartDate, 0);
  objc_storeStrong((id *)&self->mDataCache, 0);
}

@end