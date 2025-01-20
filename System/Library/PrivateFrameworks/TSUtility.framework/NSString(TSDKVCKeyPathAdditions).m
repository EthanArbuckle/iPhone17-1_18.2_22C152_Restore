@interface NSString(TSDKVCKeyPathAdditions)
- (__CFString)tsu_keyPathByRemovingFirstKey;
- (__CFString)tsu_keyPathByRemovingLastKey;
- (uint64_t)tsu_firstKey;
- (uint64_t)tsu_keyPathByAppendingKey:()TSDKVCKeyPathAdditions;
- (uint64_t)tsu_keyPathByPrependingKey:()TSDKVCKeyPathAdditions;
- (uint64_t)tsu_lastKey;
- (uint64_t)tsu_numberOfKeysInKeyPath;
@end

@implementation NSString(TSDKVCKeyPathAdditions)

- (__CFString)tsu_keyPathByRemovingLastKey
{
  uint64_t v2 = [a1 rangeOfString:@"." options:6];
  if (v2 == 0x7FFFFFFFFFFFFFFFLL) {
    return &stru_26D4F03D0;
  }
  return (__CFString *)[a1 substringToIndex:v2];
}

- (__CFString)tsu_keyPathByRemovingFirstKey
{
  uint64_t v2 = [a1 rangeOfString:@"." options:2];
  if (v2 == 0x7FFFFFFFFFFFFFFFLL) {
    return &stru_26D4F03D0;
  }
  return (__CFString *)[a1 substringFromIndex:v2 + 1];
}

- (uint64_t)tsu_keyPathByPrependingKey:()TSDKVCKeyPathAdditions
{
  if ([a1 length])
  {
    uint64_t v5 = [a3 length];
    v6 = NSString;
    if (v5) {
      return [NSString stringWithFormat:@"%@.%@", a3, a1];
    }
    v8 = a1;
  }
  else
  {
    v6 = NSString;
    v8 = a3;
  }
  return [v6 stringWithString:v8];
}

- (uint64_t)tsu_keyPathByAppendingKey:()TSDKVCKeyPathAdditions
{
  if ([a1 length])
  {
    uint64_t v5 = [a3 length];
    v6 = NSString;
    if (v5) {
      return [NSString stringWithFormat:@"%@.%@", a1, a3];
    }
    v8 = a1;
  }
  else
  {
    v6 = NSString;
    v8 = a3;
  }
  return [v6 stringWithString:v8];
}

- (uint64_t)tsu_firstKey
{
  uint64_t v2 = [a1 rangeOfString:@"." options:2];
  if (v2 == 0x7FFFFFFFFFFFFFFFLL) {
    return (uint64_t)a1;
  }
  return [a1 substringToIndex:v2];
}

- (uint64_t)tsu_lastKey
{
  uint64_t v2 = [a1 rangeOfString:@"." options:6];
  if (v2 == 0x7FFFFFFFFFFFFFFFLL) {
    return (uint64_t)a1;
  }
  return [a1 substringFromIndex:v2 + 1];
}

- (uint64_t)tsu_numberOfKeysInKeyPath
{
  uint64_t v2 = [a1 length];
  uint64_t v3 = 0;
  uint64_t v4 = 0;
  uint64_t v5 = v2;
  do
  {
    uint64_t v6 = objc_msgSend(a1, "rangeOfString:options:range:", @".", 2, v3, v5);
    ++v4;
    uint64_t v3 = v6 + v7;
    uint64_t v5 = v2 - (v6 + v7);
  }
  while (v6 + v7 != 0x7FFFFFFFFFFFFFFFLL);
  return v4;
}

@end