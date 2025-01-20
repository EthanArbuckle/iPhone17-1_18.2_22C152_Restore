@interface TSUDateParserLibrary
+ (id)_singletonAlloc;
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)sharedDateParserLibrary;
- (TSUDateParserLibrary)init;
- (id)checkoutDateParser;
- (unint64_t)retainCount;
- (void)returnDateParser:(id)a3;
@end

@implementation TSUDateParserLibrary

+ (id)_singletonAlloc
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___TSUDateParserLibrary;
  return objc_msgSendSuper2(&v3, sel_allocWithZone_, 0);
}

+ (id)sharedDateParserLibrary
{
  id result = (id)sharedDateParserLibrary_sSingletonInstance;
  if (!sharedDateParserLibrary_sSingletonInstance)
  {
    objc_sync_enter(a1);
    if (!sharedDateParserLibrary_sSingletonInstance)
    {
      uint64_t v4 = objc_msgSend((id)objc_msgSend(a1, "_singletonAlloc"), "init");
      __dmb(0xBu);
      sharedDateParserLibrary_sSingletonInstance = v4;
      if (!v4)
      {
        id v5 = +[TSUAssertionHandler currentHandler];
        uint64_t v6 = [NSString stringWithUTF8String:"+[TSUDateParserLibrary sharedDateParserLibrary]"];
        [v5 handleFailureInFunction:v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDateParserLibrary.m"), 19, @"Couldn't create singleton instance of %@", a1 file lineNumber description];
      }
    }
    objc_sync_exit(a1);
    return (id)sharedDateParserLibrary_sSingletonInstance;
  }
  return result;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  id v3 = +[TSUAssertionHandler currentHandler];
  uint64_t v4 = [NSString stringWithUTF8String:"+[TSUDateParserLibrary allocWithZone:]"];
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDateParserLibrary.m"), 19, @"Don't alloc a singleton");
  return 0;
}

- (unint64_t)retainCount
{
  return 0xFFFFFFFFLL;
}

- (TSUDateParserLibrary)init
{
  v4.receiver = self;
  v4.super_class = (Class)TSUDateParserLibrary;
  v2 = [(TSUDateParserLibrary *)&v4 init];
  if (v2)
  {
    v2->mAvailableDateParsers = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v2->mParserLibraryConditionVariable = (NSCondition *)objc_alloc_init(MEMORY[0x263F08740]);
    v2->mNumberOfUses = 0;
    v2->mParsersCreated = 0;
    v2->mMaxPermittedParsers = 1;
  }
  return v2;
}

- (id)checkoutDateParser
{
  [(NSCondition *)self->mParserLibraryConditionVariable lock];
  if (!self->mMaxPermittedParsers)
  {
    id v3 = +[TSUAssertionHandler currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSUDateParserLibrary checkoutDateParser]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDateParserLibrary.m"), 39, @"can't have no permitted parsers");
  }
  unint64_t mNumberOfUses = self->mNumberOfUses;
  if (mNumberOfUses != -1)
  {
    self->unint64_t mNumberOfUses = mNumberOfUses + 1;
    unint64_t mMaxPermittedParsers = self->mMaxPermittedParsers;
    if (mMaxPermittedParsers < objc_msgSend((id)objc_msgSend(MEMORY[0x263F08AB0], "processInfo"), "processorCount"))
    {
      unint64_t mParsersCreated = self->mParsersCreated;
      if (mParsersCreated == self->mMaxPermittedParsers)
      {
        double v8 = sqrtf((float)self->mNumberOfUses) * 0.008;
        float v9 = v8;
        unint64_t v10 = (unint64_t)v9;
        if (v8 <= 1.0) {
          unint64_t v10 = 1;
        }
        if (v10 > mParsersCreated) {
          self->unint64_t mMaxPermittedParsers = v10;
        }
      }
    }
  }
  while (![(NSMutableArray *)self->mAvailableDateParsers count])
  {
    if (self->mParsersCreated >= self->mMaxPermittedParsers)
    {
      [(NSCondition *)self->mParserLibraryConditionVariable wait];
    }
    else
    {
      v11 = [[TSUDateParser alloc] initWithLocale:0];
      [(NSMutableArray *)self->mAvailableDateParsers addObject:v11];

      ++self->mParsersCreated;
    }
  }
  id v12 = (id)[(NSMutableArray *)self->mAvailableDateParsers lastObject];
  [(NSMutableArray *)self->mAvailableDateParsers removeLastObject];
  [(NSCondition *)self->mParserLibraryConditionVariable unlock];
  return v12;
}

- (void)returnDateParser:(id)a3
{
  [(NSCondition *)self->mParserLibraryConditionVariable lock];
  [(NSMutableArray *)self->mAvailableDateParsers addObject:a3];
  [(NSCondition *)self->mParserLibraryConditionVariable signal];
  mParserLibraryConditionVariable = self->mParserLibraryConditionVariable;
  [(NSCondition *)mParserLibraryConditionVariable unlock];
}

@end