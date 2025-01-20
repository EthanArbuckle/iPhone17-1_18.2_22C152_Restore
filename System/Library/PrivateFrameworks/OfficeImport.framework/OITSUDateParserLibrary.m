@interface OITSUDateParserLibrary
- (OITSUDateParserLibrary)initWithLocale:(id)a3;
- (id)checkoutDateParser;
- (void)dealloc;
- (void)prepareDateParserInBackground;
- (void)returnDateParser:(id)a3;
@end

@implementation OITSUDateParserLibrary

- (OITSUDateParserLibrary)initWithLocale:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)OITSUDateParserLibrary;
  v4 = [(OITSUDateParserLibrary *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->mLocale = (OITSULocale *)a3;
    v4->mAvailableDateParsers = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v5->mParserLibraryConditionVariable = (NSCondition *)objc_alloc_init(MEMORY[0x263F08740]);
    v5->mNumberOfUses = 0;
    v5->mParsersCreated = 0;
    v5->mMaxPermittedParsers = 1;
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OITSUDateParserLibrary;
  [(OITSUDateParserLibrary *)&v3 dealloc];
}

- (id)checkoutDateParser
{
  [(NSCondition *)self->mParserLibraryConditionVariable lock];
  if (!self->mMaxPermittedParsers)
  {
    uint64_t v3 = [NSString stringWithUTF8String:"-[OITSUDateParserLibrary checkoutDateParser]"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUDateParserLibrary.m"], 47, 0, "can't have no permitted parsers");
    +[OITSUAssertionHandler logBacktraceThrottled];
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
        double v7 = sqrtf((float)self->mNumberOfUses) * 0.008;
        if (v7 < 1.0) {
          double v7 = 1.0;
        }
        float v8 = v7;
        if (mParsersCreated < (unint64_t)v8) {
          self->unint64_t mMaxPermittedParsers = (unint64_t)v8;
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
      v9 = (void *)MEMORY[0x23EC9A170]();
      v10 = [[OITSUDateParser alloc] initWithLocale:self->mLocale];
      [(NSMutableArray *)self->mAvailableDateParsers addObject:v10];

      ++self->mParsersCreated;
    }
  }
  id v11 = (id)[(NSMutableArray *)self->mAvailableDateParsers lastObject];
  [(NSMutableArray *)self->mAvailableDateParsers removeLastObject];
  [(NSCondition *)self->mParserLibraryConditionVariable unlock];
  return v11;
}

- (void)returnDateParser:(id)a3
{
  [(NSCondition *)self->mParserLibraryConditionVariable lock];
  [(NSMutableArray *)self->mAvailableDateParsers addObject:a3];
  [(NSCondition *)self->mParserLibraryConditionVariable signal];
  mParserLibraryConditionVariable = self->mParserLibraryConditionVariable;
  [(NSCondition *)mParserLibraryConditionVariable unlock];
}

- (void)prepareDateParserInBackground
{
  if (!self->mParsersCreated)
  {
    global_queue = dispatch_get_global_queue(-2, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __55__OITSUDateParserLibrary_prepareDateParserInBackground__block_invoke;
    block[3] = &unk_264D60B18;
    block[4] = self;
    dispatch_async(global_queue, block);
  }
}

uint64_t __55__OITSUDateParserLibrary_prepareDateParserInBackground__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = [v1 checkoutDateParser];
  return [v1 returnDateParser:v2];
}

@end