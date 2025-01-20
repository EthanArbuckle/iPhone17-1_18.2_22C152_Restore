@interface NSError(ISAdditions)
- (uint64_t)errorBySettingFatalError:()ISAdditions;
- (uint64_t)isEqual:()ISAdditions compareUserInfo:;
- (uint64_t)isFatalError;
@end

@implementation NSError(ISAdditions)

- (uint64_t)errorBySettingFatalError:()ISAdditions
{
  __ISRecordSPIClassUsage(a1);
  [NSNumber numberWithBool:a3];

  return SSErrorBySettingUserInfoValue();
}

- (uint64_t)isEqual:()ISAdditions compareUserInfo:
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  __ISRecordSPIClassUsage(a1);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [a1 code];
    BOOL v8 = v7 == [a3 code];
  }
  else
  {
    BOOL v8 = 0;
  }
  v9 = (void *)[a1 domain];
  uint64_t v10 = [a1 domain];
  if (!v8) {
    return 0;
  }
  if (v9 == (void *)v10)
  {
    uint64_t v11 = 1;
  }
  else
  {
    uint64_t v11 = [v9 isEqualToString:v10];
    if (!v11) {
      return v11;
    }
  }
  if (a4)
  {
    v12 = (void *)[a1 userInfo];
    v13 = (void *)[a3 userInfo];
    uint64_t v14 = [v12 count];
    if (v14 == [v13 count])
    {
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      uint64_t v15 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (!v15) {
        return 1;
      }
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v24;
      LOBYTE(v11) = 1;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v24 != v17) {
            objc_enumerationMutation(v12);
          }
          uint64_t v19 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          v20 = (void *)[v12 objectForKey:v19];
          uint64_t v21 = [v13 objectForKey:v19];
          if (v11)
          {
            if (v20 == (void *)v21) {
              uint64_t v11 = 1;
            }
            else {
              uint64_t v11 = [v20 isEqual:v21];
            }
          }
          else
          {
            uint64_t v11 = 0;
          }
        }
        uint64_t v16 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v16);
      return v11;
    }
    return 0;
  }
  return v11;
}

- (uint64_t)isFatalError
{
  __ISRecordSPIClassUsage(a1);
  v2 = objc_msgSend((id)objc_msgSend(a1, "userInfo"), "objectForKey:", @"ISFatalError");

  return [v2 BOOLValue];
}

@end