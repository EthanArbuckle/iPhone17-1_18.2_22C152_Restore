@interface NSError(FCCKAdditions)
- (id)fc_underlyingCKErrorUserInfoValueForKey:()FCCKAdditions forItemID:;
- (uint64_t)fc_hasCKErrorWithCodePassingTest:()FCCKAdditions;
- (uint64_t)fc_hasIdentityLostError;
- (uint64_t)fc_hasIdentityStillSyncingError;
- (uint64_t)fc_hasXPCInterruptedOrInvalidError;
- (uint64_t)fc_isCKErrorWithCode:()FCCKAdditions;
- (uint64_t)fc_isCKErrorWithCodePassingTest:()FCCKAdditions;
- (uint64_t)fc_isCKUnknownItemError;
- (uint64_t)fc_isMissingZoneError;
- (uint64_t)fc_isTemporaryNetworkOrServerError;
@end

@implementation NSError(FCCKAdditions)

- (uint64_t)fc_isCKErrorWithCode:()FCCKAdditions
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__NSError_FCCKAdditions__fc_isCKErrorWithCode___block_invoke;
  v4[3] = &__block_descriptor_40_e8_B16__0q8l;
  v4[4] = a3;
  return objc_msgSend(a1, "fc_isCKErrorWithCodePassingTest:", v4);
}

- (uint64_t)fc_isCKErrorWithCodePassingTest:()FCCKAdditions
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  v5 = [a1 domain];
  uint64_t v6 = [v5 isEqualToString:*MEMORY[0x1E4F19C40]];

  if (v6)
  {
    if (((uint64_t (*)(id, uint64_t))v4[2])(v4, [a1 code]))
    {
      uint64_t v6 = 1;
    }
    else if ([a1 code] == 2)
    {
      v7 = [a1 userInfo];
      v8 = [v7 objectForKey:*MEMORY[0x1E4F19CD8]];

      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      v9 = objc_msgSend(v8, "allValues", 0);
      uint64_t v6 = [v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6)
      {
        uint64_t v10 = *(void *)v14;
        while (2)
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v14 != v10) {
              objc_enumerationMutation(v9);
            }
            if (!v4[2](v4, [*(id *)(*((void *)&v13 + 1) + 8 * v11) code]))
            {
              uint64_t v6 = 0;
              goto LABEL_16;
            }
            ++v11;
          }
          while (v6 != v11);
          uint64_t v6 = [v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
          if (v6) {
            continue;
          }
          break;
        }
        uint64_t v6 = 1;
      }
LABEL_16:
    }
    else
    {
      uint64_t v6 = 0;
    }
  }

  return v6;
}

- (uint64_t)fc_isCKUnknownItemError
{
  return objc_msgSend(a1, "fc_isCKErrorWithCode:", 11);
}

- (uint64_t)fc_isMissingZoneError
{
  if (objc_msgSend(a1, "fc_isCKErrorWithCode:", 26)) {
    return 1;
  }
  return objc_msgSend(a1, "fc_isCKErrorWithCode:", 28);
}

- (uint64_t)fc_isTemporaryNetworkOrServerError
{
  return objc_msgSend(a1, "fc_hasCKErrorWithCodePassingTest:", &__block_literal_global_12);
}

- (uint64_t)fc_hasIdentityStillSyncingError
{
  return objc_msgSend(a1, "fc_hasCKErrorWithCodePassingTest:", &__block_literal_global_2);
}

- (uint64_t)fc_hasIdentityLostError
{
  return objc_msgSend(a1, "fc_hasCKErrorWithCodePassingTest:", &__block_literal_global_4_0);
}

- (uint64_t)fc_hasXPCInterruptedOrInvalidError
{
  return objc_msgSend(a1, "fc_hasUnderlyingErrorPassingTest:", &__block_literal_global_7);
}

- (uint64_t)fc_hasCKErrorWithCodePassingTest:()FCCKAdditions
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  v5 = [a1 domain];
  uint64_t v6 = [v5 isEqualToString:*MEMORY[0x1E4F19C40]];

  if (v6)
  {
    if (v4[2](v4, [a1 code]))
    {
      uint64_t v6 = 1;
    }
    else if ([a1 code] == 2)
    {
      v7 = [a1 userInfo];
      v8 = [v7 objectForKey:*MEMORY[0x1E4F19CD8]];

      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      v9 = objc_msgSend(v8, "allValues", 0);
      uint64_t v6 = [v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6)
      {
        uint64_t v10 = *(void *)v14;
        while (2)
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v14 != v10) {
              objc_enumerationMutation(v9);
            }
            if (v4[2](v4, [*(id *)(*((void *)&v13 + 1) + 8 * i) code]))
            {
              uint64_t v6 = 1;
              goto LABEL_16;
            }
          }
          uint64_t v6 = [v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
          if (v6) {
            continue;
          }
          break;
        }
      }
LABEL_16:
    }
    else
    {
      uint64_t v6 = 0;
    }
  }

  return v6;
}

- (id)fc_underlyingCKErrorUserInfoValueForKey:()FCCKAdditions forItemID:
{
  id v6 = a3;
  id v7 = a4;
  v8 = [a1 domain];
  int v9 = [v8 isEqualToString:*MEMORY[0x1E4F19C40]];

  if (!v9) {
    goto LABEL_5;
  }
  uint64_t v10 = [a1 userInfo];
  uint64_t v11 = [v10 objectForKey:v6];

  if (v11) {
    goto LABEL_6;
  }
  if ([a1 code] == 2)
  {
    v12 = [a1 userInfo];
    long long v13 = [v12 objectForKey:*MEMORY[0x1E4F19CD8]];

    long long v14 = [v13 objectForKey:v7];
    long long v15 = [v14 userInfo];
    uint64_t v11 = [v15 objectForKey:v6];
  }
  else
  {
LABEL_5:
    uint64_t v11 = 0;
  }
LABEL_6:

  return v11;
}

@end