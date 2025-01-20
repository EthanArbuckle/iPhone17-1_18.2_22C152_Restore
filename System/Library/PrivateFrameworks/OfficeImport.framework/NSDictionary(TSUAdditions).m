@interface NSDictionary(TSUAdditions)
+ (uint64_t)tsu_dictionaryByInvertingDictionary:()TSUAdditions;
- (uint64_t)tsu_BOOLValueForKey:()TSUAdditions;
- (uint64_t)tsu_allKeysAsSet;
- (uint64_t)tsu_objectOfClass:()TSUAdditions forKey:;
@end

@implementation NSDictionary(TSUAdditions)

- (uint64_t)tsu_BOOLValueForKey:()TSUAdditions
{
  uint64_t v1 = objc_msgSend(a1, "objectForKey:");
  if (!v1) {
    return 0;
  }
  v2 = (void *)v1;
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  return [v2 BOOLValue];
}

- (uint64_t)tsu_objectOfClass:()TSUAdditions forKey:
{
  uint64_t result = [a1 objectForKey:a4];
  if (result)
  {
    return TSUDynamicCast(a3, result);
  }
  return result;
}

- (uint64_t)tsu_allKeysAsSet
{
  uint64_t v1 = (void *)MEMORY[0x263EFFA08];
  uint64_t v2 = [a1 allKeys];
  return [v1 setWithArray:v2];
}

+ (uint64_t)tsu_dictionaryByInvertingDictionary:()TSUAdditions
{
  return objc_msgSend(MEMORY[0x263EFF9A0], "tsu_dictionaryByInvertingDictionary:");
}

@end