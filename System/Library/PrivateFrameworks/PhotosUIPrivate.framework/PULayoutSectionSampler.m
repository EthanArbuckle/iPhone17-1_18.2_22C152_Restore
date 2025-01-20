@interface PULayoutSectionSampler
- (int64_t)indexForUnsampledIndex:(int64_t)a3 isMainItem:(BOOL *)a4;
- (int64_t)unsampledIndexForIndex:(int64_t)a3;
- (void)dumpInternalMemory;
- (void)enumerateUnsampledIndexesForSampledIndexInRange:(_NSRange)a3 usingBlock:(id)a4;
@end

@implementation PULayoutSectionSampler

- (void)dumpInternalMemory
{
}

- (void)enumerateUnsampledIndexesForSampledIndexInRange:(_NSRange)a3 usingBlock:(id)a4
{
  char v8 = 0;
  if ((uint64_t)a3.location < (int64_t)(a3.location + a3.length))
  {
    NSUInteger location = a3.location;
    NSUInteger v6 = a3.length - 1;
    do
    {
      (*((void (**)(id, NSUInteger, NSUInteger, char *))a4 + 2))(a4, location, location, &v8);
      ++location;
      if (v8) {
        BOOL v7 = 1;
      }
      else {
        BOOL v7 = v6 == 0;
      }
      --v6;
    }
    while (!v7);
  }
}

- (int64_t)unsampledIndexForIndex:(int64_t)a3
{
  return a3;
}

- (int64_t)indexForUnsampledIndex:(int64_t)a3 isMainItem:(BOOL *)a4
{
  int64_t result = a3;
  if (a4) {
    *a4 = 1;
  }
  return result;
}

@end