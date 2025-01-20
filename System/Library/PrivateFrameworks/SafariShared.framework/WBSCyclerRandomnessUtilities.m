@interface WBSCyclerRandomnessUtilities
+ (id)_randomStringWithCharactersFromString:(id)a3 withMaximumLength:(int64_t)a4;
+ (id)randomElementOfArray:(id)a3;
+ (id)randomElementOfArray:(id)a3 relativeProbabilities:(id)a4;
+ (id)randomString;
+ (id)randomStringWithMaximumLength:(int64_t)a3;
+ (id)randomURL;
+ (unint64_t)randomIntegerWithUpperBound:(unint64_t)a3;
+ (unint64_t)seed;
+ (void)initialize;
+ (void)reseed;
+ (void)setSeed:(unint64_t)a3;
@end

@implementation WBSCyclerRandomnessUtilities

+ (void)initialize
{
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  [a1 setSeed:(unint64_t)v3];
}

+ (unint64_t)seed
{
  return seed;
}

+ (void)setSeed:(unint64_t)a3
{
  seed = a3;
  [a1 reseed];
}

+ (void)reseed
{
}

+ (unint64_t)randomIntegerWithUpperBound:(unint64_t)a3
{
  return lrand48() % a3;
}

+ (id)randomString
{
  return (id)[a1 randomStringWithMaximumLength:200];
}

+ (id)randomStringWithMaximumLength:(int64_t)a3
{
  return (id)[a1 _randomStringWithCharactersFromString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()_+\\/:\"'. " withMaximumLength:a3];
}

+ (id)randomURL
{
  if ([a1 randomIntegerWithUpperBound:5])
  {
    double v3 = (void *)MEMORY[0x1E4F1CB10];
    v4 = [a1 randomElementOfArray:&unk_1EFC220E8];
    v5 = [v3 URLWithString:v4];
  }
  else
  {
    v4 = [a1 _randomStringWithCharactersFromString:@"abcdefghijklmnopqrstuvwxyz0123456789" withMaximumLength:200];
    v6 = (void *)MEMORY[0x1E4F1CB10];
    v7 = [NSString stringWithFormat:@"https://%@.com/", v4];
    v5 = [v6 URLWithString:v7];
  }
  return v5;
}

+ (id)randomElementOfArray:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(v4, "objectAtIndexedSubscript:", objc_msgSend(a1, "randomIntegerWithUpperBound:", objc_msgSend(v4, "count")));

  return v5;
}

+ (id)randomElementOfArray:(id)a3 relativeProbabilities:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v29;
    double v9 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v28 + 1) + 8 * i) doubleValue];
        double v9 = v9 + v11;
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v7);
  }
  else
  {
    double v9 = 0.0;
  }
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  double v27 = 0.0;
  double v27 = drand48();
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__9;
  v24 = __Block_byref_object_dispose__9;
  id v25 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __75__WBSCyclerRandomnessUtilities_randomElementOfArray_relativeProbabilities___block_invoke;
  v15[3] = &unk_1E5C9A848;
  v17 = v26;
  id v12 = v6;
  double v19 = v9;
  id v16 = v12;
  v18 = &v20;
  [v5 enumerateObjectsUsingBlock:v15];
  id v13 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(v26, 8);

  return v13;
}

void __75__WBSCyclerRandomnessUtilities_randomElementOfArray_relativeProbabilities___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  uint64_t v8 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  [v8 doubleValue];
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 24)
                                                              - v9 / *(double *)(a1 + 56);

  if (*(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) <= 0.0)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    *a4 = 1;
  }
}

+ (id)_randomStringWithCharactersFromString:(id)a3 withMaximumLength:(int64_t)a4
{
  id v6 = a3;
  unint64_t v7 = [a1 randomIntegerWithUpperBound:a4];
  if (v7 <= 1) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = v7;
  }
  double v9 = [MEMORY[0x1E4F28E78] string];
  uint64_t v10 = [v6 length];
  do
  {
    objc_msgSend(v9, "appendFormat:", @"%C", objc_msgSend(v6, "characterAtIndex:", objc_msgSend(a1, "randomIntegerWithUpperBound:", v10)));
    --v8;
  }
  while (v8);

  return v9;
}

@end