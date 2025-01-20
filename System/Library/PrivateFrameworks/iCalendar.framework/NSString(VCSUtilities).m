@interface NSString(VCSUtilities)
- (id)VCS_uncommentedAddress;
- (uint64_t)VCS_isPhoneNumber;
@end

@implementation NSString(VCSUtilities)

- (id)VCS_uncommentedAddress
{
  objc_sync_enter(@"AddressParsing");
  v2 = (void *)VCS_uncommentedAddress_uncommentedAddresses;
  if (!VCS_uncommentedAddress_uncommentedAddresses)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v4 = (void *)VCS_uncommentedAddress_uncommentedAddresses;
    VCS_uncommentedAddress_uncommentedAddresses = (uint64_t)v3;

    v2 = (void *)VCS_uncommentedAddress_uncommentedAddresses;
  }
  v5 = [v2 objectForKey:a1];
  objc_sync_exit(@"AddressParsing");
  if (!v5)
  {
    unint64_t v6 = [a1 length];
    v7 = (char *)NSZoneMalloc(0, 2 * v6 + 2);
    v8 = v7;
    uint64_t v9 = MEMORY[0x1E4F14390];
    v10 = v7;
    if (v6)
    {
      unint64_t v11 = 0;
      uint64_t v12 = 0;
      char v13 = 0;
      char v23 = 0;
      char v24 = 1;
      v10 = v7;
      do
      {
        unsigned int v14 = [a1 characterAtIndex:v11];
        unsigned int v15 = v14;
        if (v14 == 92)
        {
          if (v11 + 1 >= v6)
          {
            if ((v13 & 1) == 0)
            {
              if (v12 < 1) {
                goto LABEL_21;
              }
LABEL_18:
              char v13 = 0;
              v12 -= v14 == 41;
              goto LABEL_27;
            }
LABEL_13:
            *(_WORD *)v10 = v14;
            v10 += 2;
            v13 &= v14 != 34;
            goto LABEL_27;
          }
          *(_WORD *)v10 = 92;
          *((_WORD *)v10 + 1) = [a1 characterAtIndex:v11 + 1];
          v10 += 4;
          ++v11;
        }
        else
        {
          if (v13) {
            goto LABEL_13;
          }
          if (v14 == 40)
          {
            char v13 = 0;
            ++v12;
          }
          else
          {
            if (v12 > 0) {
              goto LABEL_18;
            }
            if (v14 != 60)
            {
              if ((v23 & (v14 == 62)) != 0) {
                break;
              }
              if (v14 > 0x7F)
              {
                if (__maskrune(v14, 0x4000uLL))
                {
LABEL_22:
                  char v13 = 0;
                  if ((v24 & 1) == 0)
                  {
                    *(_WORD *)v10 = 32;
                    v10 += 2;
                  }
                  char v24 = 1;
                  goto LABEL_27;
                }
              }
              else
              {
LABEL_21:
                if ((*(_DWORD *)(v9 + 4 * v14 + 60) & 0x4000) != 0) {
                  goto LABEL_22;
                }
              }
              char v24 = 0;
              *(_WORD *)v10 = v15;
              v10 += 2;
              v13 |= v15 == 34;
              goto LABEL_27;
            }
            char v13 = 0;
            char v23 = 1;
            v10 = v8;
          }
        }
LABEL_27:
        ++v11;
      }
      while (v11 < v6);
    }
    uint64_t v16 = v10 - v8;
    do
    {
      v17 = v10;
      uint64_t v18 = v16;
      if (v10 <= v8) {
        break;
      }
      v10 -= 2;
      unint64_t v19 = *((unsigned __int16 *)v17 - 1);
      int v20 = v19 > 0x7F ? __maskrune(v19, 0x4000uLL) : *(_DWORD *)(v9 + 4 * v19 + 60) & 0x4000;
      uint64_t v16 = v18 - 2;
    }
    while (v20);
    *(_WORD *)v17 = 0;
    v5 = (void *)[[NSString alloc] initWithCharacters:v8 length:v18 >> 1];
    NSZoneFree(0, v8);
    objc_sync_enter(@"AddressParsing");
    [(id)VCS_uncommentedAddress_uncommentedAddresses setObject:v5 forKey:a1];
    objc_sync_exit(@"AddressParsing");
  }
  id v21 = v5;

  return v21;
}

- (uint64_t)VCS_isPhoneNumber
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (VCS_isPhoneNumber_onceToken != -1) {
    dispatch_once(&VCS_isPhoneNumber_onceToken, &__block_literal_global_4);
  }
  uint64_t v2 = [a1 length];
  if (!v2) {
    return 0;
  }
  objc_msgSend((id)VCS_isPhoneNumber_phoneNumberDetector, "matchesInString:options:range:", a1, 0, 0, v2);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v8, "resultType", (void)v14) == 32)
        {
          uint64_t v9 = [v8 URL];
          v10 = [v9 scheme];
          char v11 = [v10 isEqualToString:@"tel"];

          if (v11) {
            goto LABEL_16;
          }
        }
        else if ([v8 resultType] == 2048)
        {
LABEL_16:
          uint64_t v12 = 1;
          goto LABEL_17;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  uint64_t v12 = 0;
LABEL_17:

  return v12;
}

@end