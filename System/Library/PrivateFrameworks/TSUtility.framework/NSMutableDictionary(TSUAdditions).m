@interface NSMutableDictionary(TSUAdditions)
+ (id)tsu_dictionaryByInvertingDictionaryIfPossible:()TSUAdditions;
+ (uint64_t)tsu_dictionaryByInvertingDictionary:()TSUAdditions;
- (uint64_t)tsu_objectForKey:()TSUAdditions withDefaultOfClass:;
- (uint64_t)tsu_objectForKey:()TSUAdditions withDefaultUsingBlock:;
- (void)tsu_removeObjectsWithoutKeys:()TSUAdditions;
@end

@implementation NSMutableDictionary(TSUAdditions)

- (uint64_t)tsu_objectForKey:()TSUAdditions withDefaultUsingBlock:
{
  uint64_t v7 = objc_msgSend(a1, "objectForKey:");
  if (!v7)
  {
    uint64_t v7 = (*(uint64_t (**)(uint64_t))(a4 + 16))(a4);
    [a1 setObject:v7 forKey:a3];
  }
  return v7;
}

- (uint64_t)tsu_objectForKey:()TSUAdditions withDefaultOfClass:
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __73__NSMutableDictionary_TSUAdditions__tsu_objectForKey_withDefaultOfClass___block_invoke;
  v5[3] = &unk_26462A3B8;
  v5[4] = a4;
  return objc_msgSend(a1, "tsu_objectForKey:withDefaultUsingBlock:", a3, v5);
}

+ (id)tsu_dictionaryByInvertingDictionaryIfPossible:()TSUAdditions
{
  if (!a3)
  {
    id v4 = +[TSUAssertionHandler currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"+[NSMutableDictionary(TSUAdditions) tsu_dictionaryByInvertingDictionaryIfPossible:]"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/NSDictionaryAdditions.m"), 67, @"invalid nil value for '%s'", "source");
  }
  id v6 = (id)objc_opt_new();
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __83__NSMutableDictionary_TSUAdditions__tsu_dictionaryByInvertingDictionaryIfPossible___block_invoke;
  v9[3] = &unk_26462A3E0;
  v9[4] = v6;
  [a3 enumerateKeysAndObjectsUsingBlock:v9];
  uint64_t v7 = [a3 count];
  if (v7 == [v6 count]) {
    return v6;
  }
  else {
    return 0;
  }
}

+ (uint64_t)tsu_dictionaryByInvertingDictionary:()TSUAdditions
{
  uint64_t v1 = objc_msgSend(a1, "tsu_dictionaryByInvertingDictionaryIfPossible:");
  if (!v1)
  {
    id v2 = +[TSUAssertionHandler currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"+[NSMutableDictionary(TSUAdditions) tsu_dictionaryByInvertingDictionary:]"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/NSDictionaryAdditions.m"), 86, @"Source dictionary is not invertible.");
  }
  return v1;
}

- (void)tsu_removeObjectsWithoutKeys:()TSUAdditions
{
  id v5 = (id)objc_msgSend((id)objc_msgSend(a1, "allKeys"), "mutableCopy");
  [v5 removeObjectsInArray:a3];
  [a1 removeObjectsForKeys:v5];
}

@end