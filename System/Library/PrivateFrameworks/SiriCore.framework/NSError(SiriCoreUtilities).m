@interface NSError(SiriCoreUtilities)
- (uint64_t)siriCore_isNetworkDownError;
@end

@implementation NSError(SiriCoreUtilities)

- (uint64_t)siriCore_isNetworkDownError
{
  v2 = [a1 userInfo];
  uint64_t v3 = [v2 objectForKey:*MEMORY[0x263F08608]];
  v4 = (void *)v3;
  if (v3) {
    v5 = (void *)v3;
  }
  else {
    v5 = a1;
  }
  id v6 = v5;

  if ([v6 code] == 50)
  {
    v7 = [v6 domain];
    if ([v7 isEqualToString:*MEMORY[0x263F144D0]])
    {
      uint64_t v8 = 1;
    }
    else
    {
      v9 = [v6 domain];
      uint64_t v8 = [v9 isEqualToString:*MEMORY[0x263F08438]];
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

@end