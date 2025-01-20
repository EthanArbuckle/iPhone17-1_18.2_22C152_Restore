@interface NSDictionary(HKSPSleep)
- (HKSPDictionaryDiff)hksp_computeDiffFromDictionary:()HKSPSleep keysToDiff:;
- (id)hksp_computeDiffFromDictionary:()HKSPSleep;
- (id)hksp_dictionaryByFilteringKeys:()HKSPSleep;
- (uint64_t)hksp_hash;
@end

@implementation NSDictionary(HKSPSleep)

- (id)hksp_dictionaryByFilteringKeys:()HKSPSleep
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__NSDictionary_HKSPSleep__hksp_dictionaryByFilteringKeys___block_invoke;
  v8[3] = &unk_1E5D33848;
  id v9 = v4;
  id v5 = v4;
  v6 = objc_msgSend(a1, "na_filter:", v8);

  return v6;
}

- (id)hksp_computeDiffFromDictionary:()HKSPSleep
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  v6 = [v5 allKeys];
  v7 = [v4 setWithArray:v6];

  v8 = [a1 allKeys];
  id v9 = [v7 setByAddingObjectsFromArray:v8];

  v10 = objc_msgSend(a1, "hksp_computeDiffFromDictionary:keysToDiff:", v5, v9);

  return v10;
}

- (HKSPDictionaryDiff)hksp_computeDiffFromDictionary:()HKSPSleep keysToDiff:
{
  id v6 = a4;
  id v7 = a3;
  v8 = [[HKSPDictionaryDiff alloc] initWithOriginalDictionary:v7 updatedDictionary:a1 keysToDiff:v6];

  return v8;
}

- (uint64_t)hksp_hash
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  uint64_t v8 = [a1 hash];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __36__NSDictionary_HKSPSleep__hksp_hash__block_invoke;
  v4[3] = &unk_1E5D33870;
  v4[4] = &v5;
  [a1 enumerateKeysAndObjectsUsingBlock:v4];
  uint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

@end