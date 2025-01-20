@interface PUPosterUtilities
+ (int64_t)mediaIndexWithSeed:(int64_t)a3 mediaCount:(int64_t)a4;
@end

@implementation PUPosterUtilities

+ (int64_t)mediaIndexWithSeed:(int64_t)a3 mediaCount:(int64_t)a4
{
  if (a4 < 1 || !a3) {
    return 0;
  }
  int64_t v6 = a3 / a4;
  unint64_t v7 = a3 / a4 == 0;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v7 < a4)
  {
    do
    {
      v9 = [NSNumber numberWithUnsignedInteger:v7];
      [v8 addObject:v9];

      ++v7;
    }
    while (a4 != v7);
  }
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F8CD40]) initWithSeed:v6];
  v11 = PFShuffledArrayWithRandomNumberGenerator();
  v12 = (void *)[v11 mutableCopy];

  int64_t v13 = a3 % (unint64_t)[v12 count];
  if (a4 >= 3 && v6 && v13 < 2)
  {
    v14 = (void *)[objc_alloc(MEMORY[0x1E4F8CD40]) initWithSeed:v6 - 1];
    v15 = PFShuffledArrayWithRandomNumberGenerator();
    v16 = [v15 lastObject];
    uint64_t v17 = [v16 integerValue];
    v18 = [v12 firstObject];
    uint64_t v19 = [v18 integerValue];

    if (v17 == v19) {
      [v12 exchangeObjectAtIndex:0 withObjectAtIndex:1];
    }
  }
  v20 = [v12 objectAtIndexedSubscript:v13];
  int64_t v21 = [v20 integerValue];

  return v21;
}

@end