@interface ACAccount
@end

@implementation ACAccount

id __46__ACAccount_SyncPrivate__applySyncProperties___block_invoke()
{
  id result = (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"__Password__", @"AccountType", 0);
  applySyncProperties__accountKeysToIgnore = (uint64_t)result;
  return result;
}

uint64_t __46__ACAccount_SyncPrivate__applySyncProperties___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result = [(id)applySyncProperties__accountKeysToIgnore containsObject:a2];
  if ((result & 1) == 0)
  {
    if ([a2 isEqualToString:@"Username"])
    {
      uint64_t v7 = [*(id *)(a1 + 32) _usernameFromProperties:*(void *)(a1 + 40)];
      v8 = *(void **)(a1 + 32);
      return [v8 setUsername:v7];
    }
    else
    {
      int v9 = [a2 isEqualToString:@"AccountName"];
      v10 = *(void **)(a1 + 32);
      if (v9)
      {
        return [v10 setAccountDescription:a3];
      }
      else
      {
        return [v10 setAccountProperty:a3 forKey:a2];
      }
    }
  }
  return result;
}

@end