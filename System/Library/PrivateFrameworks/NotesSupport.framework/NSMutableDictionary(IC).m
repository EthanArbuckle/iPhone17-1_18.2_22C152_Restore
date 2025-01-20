@interface NSMutableDictionary(IC)
+ (id)ic_dictionaryFromNonNilDictionary:()IC;
- (uint64_t)ic_addKey:()IC forNonNilObject:;
- (void)ic_removeObjectForNonNilKey:()IC;
- (void)ic_setNonNilObject:()IC forKey:;
- (void)ic_setNonNilObject:()IC forNonNilKey:;
@end

@implementation NSMutableDictionary(IC)

- (void)ic_setNonNilObject:()IC forKey:
{
  if (a3) {
    return objc_msgSend(a1, "setObject:forKeyedSubscript:");
  }
  return a1;
}

- (void)ic_setNonNilObject:()IC forNonNilKey:
{
  if (a3)
  {
    if (a4) {
      return objc_msgSend(a1, "setObject:forKeyedSubscript:");
    }
  }
  return a1;
}

- (void)ic_removeObjectForNonNilKey:()IC
{
  if (a3) {
    return objc_msgSend(a1, "removeObjectForKey:");
  }
  return a1;
}

- (uint64_t)ic_addKey:()IC forNonNilObject:
{
  return objc_msgSend(a1, "ic_setNonNilObject:forKey:", a4, a3);
}

+ (id)ic_dictionaryFromNonNilDictionary:()IC
{
  if (a3) {
    objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithDictionary:");
  }
  else {
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  }
  return v3;
}

@end