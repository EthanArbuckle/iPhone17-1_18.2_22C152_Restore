@interface TSUSharedLocale
+ (id)_singletonAlloc;
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)sharedLocale;
- (TSUSharedLocale)init;
- (__CFLocale)currentLocale;
- (unint64_t)retainCount;
- (void)datePreferencesChanged:(id)a3;
- (void)dealloc;
@end

@implementation TSUSharedLocale

+ (id)_singletonAlloc
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___TSUSharedLocale;
  return objc_msgSendSuper2(&v3, sel_allocWithZone_, 0);
}

+ (id)sharedLocale
{
  id result = (id)sharedLocale_sSingletonInstance;
  if (!sharedLocale_sSingletonInstance)
  {
    objc_sync_enter(a1);
    if (!sharedLocale_sSingletonInstance)
    {
      uint64_t v4 = objc_msgSend((id)objc_msgSend(a1, "_singletonAlloc"), "init");
      __dmb(0xBu);
      sharedLocale_sSingletonInstance = v4;
      if (!v4)
      {
        id v5 = +[TSUAssertionHandler currentHandler];
        uint64_t v6 = [NSString stringWithUTF8String:"+[TSUSharedLocale sharedLocale]"];
        [v5 handleFailureInFunction:v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSULocale.m"), 38, @"Couldn't create singleton instance of %@", a1 file lineNumber description];
      }
    }
    objc_sync_exit(a1);
    return (id)sharedLocale_sSingletonInstance;
  }
  return result;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  id v3 = +[TSUAssertionHandler currentHandler];
  uint64_t v4 = [NSString stringWithUTF8String:"+[TSUSharedLocale allocWithZone:]"];
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSULocale.m"), 38, @"Don't alloc a singleton");
  return 0;
}

- (unint64_t)retainCount
{
  return 0xFFFFFFFFLL;
}

- (TSUSharedLocale)init
{
  v7.receiver = self;
  v7.super_class = (Class)TSUSharedLocale;
  v2 = [(TSUSharedLocale *)&v7 init];
  if (v2)
  {
    v2->mCurrentLocale = CFLocaleCopyCurrent();
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __23__TSUSharedLocale_init__block_invoke;
    v6[3] = &unk_26462A170;
    v6[4] = v2;
    id v3 = (NSArray *)TSURegisterLocaleChangeObserver((uint64_t)v6);
    v2->mObserverObjects = v3;
    uint64_t v4 = v3;
  }
  return v2;
}

uint64_t __23__TSUSharedLocale_init__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) datePreferencesChanged:a2];
}

- (void)dealloc
{
  mCurrentLocale = self->mCurrentLocale;
  if (mCurrentLocale) {
    CFRelease(mCurrentLocale);
  }

  v4.receiver = self;
  v4.super_class = (Class)TSUSharedLocale;
  [(TSUSharedLocale *)&v4 dealloc];
}

- (__CFLocale)currentLocale
{
  id result = self->mCurrentLocale;
  if (!result)
  {
    id result = CFLocaleCopyCurrent();
    self->mCurrentLocale = result;
  }
  if (!self->mObserverObjects)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __32__TSUSharedLocale_currentLocale__block_invoke;
    v6[3] = &unk_26462A170;
    v6[4] = self;
    objc_super v4 = (NSArray *)TSURegisterLocaleChangeObserver((uint64_t)v6);
    self->mObserverObjects = v4;
    id v5 = v4;
    return self->mCurrentLocale;
  }
  return result;
}

uint64_t __32__TSUSharedLocale_currentLocale__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) datePreferencesChanged:a2];
}

- (void)datePreferencesChanged:(id)a3
{
  id v3 = self;
  mCurrentLocale = self->mCurrentLocale;
  v3->mCurrentLocale = 0;
  __dmb(0xBu);
  uint64_t v6 = v3;
  if (mCurrentLocale)
  {
    CFRelease(mCurrentLocale);
    id v3 = v6;
  }
  mObserverObjects = v3->mObserverObjects;
  if (mObserverObjects)
  {
    TSURemoveLocaleChangeObserver(mObserverObjects);

    v6->mObserverObjects = 0;
  }
  MEMORY[0x270F9A758]();
}

@end