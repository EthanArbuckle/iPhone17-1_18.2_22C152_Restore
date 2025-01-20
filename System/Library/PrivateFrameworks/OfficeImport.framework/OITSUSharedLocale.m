@interface OITSUSharedLocale
+ (id)_singletonAlloc;
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)sharedLocale;
- (OITSUSharedLocale)init;
- (__CFLocale)currentLocale;
- (unint64_t)retainCount;
- (void)datePreferencesChanged:(id)a3;
- (void)dealloc;
@end

@implementation OITSUSharedLocale

+ (id)_singletonAlloc
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___OITSUSharedLocale;
  return objc_msgSendSuper2(&v3, sel_allocWithZone_, 0);
}

+ (id)sharedLocale
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__OITSUSharedLocale_sharedLocale__block_invoke;
  block[3] = &unk_264D60B18;
  block[4] = a1;
  if (sharedLocale_sOnceToken != -1) {
    dispatch_once(&sharedLocale_sOnceToken, block);
  }
  return (id)sharedLocale_sSingletonInstance;
}

uint64_t __33__OITSUSharedLocale_sharedLocale__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_singletonAlloc"), "init");
  sharedLocale_sSingletonInstance = result;
  if (!result)
  {
    uint64_t v3 = [NSString stringWithUTF8String:"+[OITSUSharedLocale sharedLocale]_block_invoke"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSULocale.m"], 1129, 0, "Couldn't create singleton instance of %@", *(void *)(a1 + 32));
    return +[OITSUAssertionHandler logBacktraceThrottled];
  }
  return result;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  uint64_t v3 = [NSString stringWithUTF8String:"+[OITSUSharedLocale allocWithZone:]"];
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSULocale.m"], 1129, 0, "Don't alloc a singleton");
  +[OITSUAssertionHandler logBacktraceThrottled];
  return 0;
}

- (unint64_t)retainCount
{
  return 0xFFFFFFFFLL;
}

- (OITSUSharedLocale)init
{
  v8.receiver = self;
  v8.super_class = (Class)OITSUSharedLocale;
  v2 = [(OITSUSharedLocale *)&v8 init];
  if (v2)
  {
    v2->mCurrentLocale = CFLocaleCopyCurrent();
    uint64_t v3 = +[OITSUWeakReference weakReferenceWithObject:v2];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __25__OITSUSharedLocale_init__block_invoke;
    v7[3] = &unk_264D60C48;
    v7[4] = v3;
    v4 = (NSArray *)TSURegisterLocaleChangeObserver((uint64_t)v7);
    v2->mObserverObjects = v4;
    v5 = v4;
  }
  return v2;
}

uint64_t __25__OITSUSharedLocale_init__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)[*(id *)(a1 + 32) object];
  return [v3 datePreferencesChanged:a2];
}

- (void)dealloc
{
  mCurrentLocale = self->mCurrentLocale;
  if (mCurrentLocale) {
    CFRelease(mCurrentLocale);
  }

  v4.receiver = self;
  v4.super_class = (Class)OITSUSharedLocale;
  [(OITSUSharedLocale *)&v4 dealloc];
}

- (__CFLocale)currentLocale
{
  uint64_t result = self->mCurrentLocale;
  if (!result)
  {
    uint64_t result = CFLocaleCopyCurrent();
    self->mCurrentLocale = result;
  }
  if (!self->mObserverObjects)
  {
    objc_super v4 = +[OITSUWeakReference weakReferenceWithObject:self];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __34__OITSUSharedLocale_currentLocale__block_invoke;
    v7[3] = &unk_264D60C48;
    v7[4] = v4;
    v5 = (NSArray *)TSURegisterLocaleChangeObserver((uint64_t)v7);
    self->mObserverObjects = v5;
    v6 = v5;
    return self->mCurrentLocale;
  }
  return result;
}

uint64_t __34__OITSUSharedLocale_currentLocale__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)[*(id *)(a1 + 32) object];
  return [v3 datePreferencesChanged:a2];
}

- (void)datePreferencesChanged:(id)a3
{
  uint64_t v3 = self;
  mCurrentLocale = self->mCurrentLocale;
  v3->mCurrentLocale = 0;
  __dmb(0xBu);
  v6 = v3;
  if (mCurrentLocale)
  {
    CFRelease(mCurrentLocale);
    uint64_t v3 = v6;
  }
  mObserverObjects = v3->mObserverObjects;
  if (mObserverObjects)
  {
    TSURemoveLocaleChangeObserver(mObserverObjects);

    uint64_t v3 = v6;
    v6->mObserverObjects = 0;
  }
}

@end