@interface NSString(TSDKVCKeyPathAdditions)
- (__CFString)tsu_keyPathByRemovingFirstKey;
- (__CFString)tsu_keyPathByRemovingLastKey;
- (id)tsu_firstKey;
- (id)tsu_keyPathByAppendingKey:()TSDKVCKeyPathAdditions;
- (id)tsu_keyPathByPrependingKey:()TSDKVCKeyPathAdditions;
- (id)tsu_lastKey;
- (uint64_t)tsu_numberOfKeysInKeyPath;
@end

@implementation NSString(TSDKVCKeyPathAdditions)

- (__CFString)tsu_keyPathByRemovingLastKey
{
  uint64_t v2 = [a1 rangeOfString:@"." options:6];
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = &stru_26EBF24D8;
  }
  else
  {
    v3 = [a1 substringToIndex:v2];
  }
  return v3;
}

- (__CFString)tsu_keyPathByRemovingFirstKey
{
  uint64_t v2 = [a1 rangeOfString:@"." options:2];
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = &stru_26EBF24D8;
  }
  else
  {
    v3 = [a1 substringFromIndex:v2 + 1];
  }
  return v3;
}

- (id)tsu_keyPathByPrependingKey:()TSDKVCKeyPathAdditions
{
  id v4 = a3;
  if ([a1 length])
  {
    uint64_t v5 = [v4 length];
    v6 = NSString;
    if (v5)
    {
      uint64_t v7 = [NSString stringWithFormat:@"%@.%@", v4, a1];
      goto LABEL_7;
    }
    id v8 = a1;
  }
  else
  {
    v6 = NSString;
    id v8 = v4;
  }
  uint64_t v7 = [v6 stringWithString:v8];
LABEL_7:
  v9 = (void *)v7;

  return v9;
}

- (id)tsu_keyPathByAppendingKey:()TSDKVCKeyPathAdditions
{
  id v4 = a3;
  if ([a1 length])
  {
    uint64_t v5 = [v4 length];
    v6 = NSString;
    if (v5)
    {
      uint64_t v7 = [NSString stringWithFormat:@"%@.%@", a1, v4];
      goto LABEL_7;
    }
    id v8 = a1;
  }
  else
  {
    v6 = NSString;
    id v8 = v4;
  }
  uint64_t v7 = [v6 stringWithString:v8];
LABEL_7:
  v9 = (void *)v7;

  return v9;
}

- (id)tsu_firstKey
{
  id v1 = a1;
  uint64_t v2 = [v1 rangeOfString:@"." options:2];
  if (v2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v3 = [v1 substringToIndex:v2];

    id v1 = (id)v3;
  }
  return v1;
}

- (id)tsu_lastKey
{
  id v1 = a1;
  uint64_t v2 = [v1 rangeOfString:@"." options:6];
  if (v2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v3 = [v1 substringFromIndex:v2 + 1];

    id v1 = (id)v3;
  }
  return v1;
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