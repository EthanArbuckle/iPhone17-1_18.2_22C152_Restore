@interface MFSMIMEConfigurationProvider
- (BOOL)encryptionIsConfigured;
- (BOOL)encryptionIsEnabledByDefault;
- (BOOL)signingEnabledByDefault;
- (BOOL)signingIsConfigured;
@end

@implementation MFSMIMEConfigurationProvider

- (BOOL)signingIsConfigured
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  obuint64_t j = +[MailAccount activeAccounts];
  uint64_t v2 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v20 != v3) {
          objc_enumerationMutation(obj);
        }
        v5 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        v6 = [v5 emailAddresses];
        uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v23 count:16];
        if (v7)
        {
          uint64_t v8 = *(void *)v16;
          while (2)
          {
            for (uint64_t j = 0; j != v7; ++j)
            {
              if (*(void *)v16 != v8) {
                objc_enumerationMutation(v6);
              }
              id v10 = +[MFMessageKeychainManager copyAllSigningIdentitiesForAddress:*(void *)(*((void *)&v15 + 1) + 8 * j) error:0];
              BOOL v11 = [v10 count] == 0;

              if (!v11)
              {

                BOOL v12 = 1;
                goto LABEL_19;
              }
            }
            uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v23 count:16];
            if (v7) {
              continue;
            }
            break;
          }
        }
      }
      uint64_t v2 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
      BOOL v12 = 0;
    }
    while (v2);
  }
  else
  {
    BOOL v12 = 0;
  }
LABEL_19:

  return v12;
}

- (BOOL)signingEnabledByDefault
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v2 = +[MailAccount activeAccounts];
  char v3 = 0;
  uint64_t v4 = [v2 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        long long v13 = 0u;
        long long v14 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        uint64_t v8 = objc_msgSend(v7, "emailAddresses", 0);
        uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
        if (v9)
        {
          uint64_t v10 = *(void *)v14;
          while (2)
          {
            for (uint64_t j = 0; j != v9; ++j)
            {
              if (*(void *)v14 != v10) {
                objc_enumerationMutation(v8);
              }
              if ([v7 secureCompositionSigningPolicyForAddress:*(void *)(*((void *)&v13 + 1) + 8 * j)] > 0)
              {
                char v3 = 1;
                goto LABEL_16;
              }
            }
            uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
            if (v9) {
              continue;
            }
            break;
          }
          char v3 = 0;
        }
LABEL_16:
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v4);
  }

  return v3 & 1;
}

- (BOOL)encryptionIsConfigured
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  obuint64_t j = +[MailAccount activeAccounts];
  uint64_t v2 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v20 != v3) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        v6 = [v5 emailAddresses];
        uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v23 count:16];
        if (v7)
        {
          uint64_t v8 = *(void *)v16;
          while (2)
          {
            for (uint64_t j = 0; j != v7; ++j)
            {
              if (*(void *)v16 != v8) {
                objc_enumerationMutation(v6);
              }
              id v10 = +[MFMessageKeychainManager copyAllEncryptionIdentitiesForAddress:*(void *)(*((void *)&v15 + 1) + 8 * j) error:0];
              BOOL v11 = [v10 count] == 0;

              if (!v11)
              {

                BOOL v12 = 1;
                goto LABEL_19;
              }
            }
            uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v23 count:16];
            if (v7) {
              continue;
            }
            break;
          }
        }
      }
      uint64_t v2 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
      BOOL v12 = 0;
    }
    while (v2);
  }
  else
  {
    BOOL v12 = 0;
  }
LABEL_19:

  return v12;
}

- (BOOL)encryptionIsEnabledByDefault
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v2 = +[MailAccount activeAccounts];
  char v3 = 0;
  uint64_t v4 = [v2 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        long long v13 = 0u;
        long long v14 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        uint64_t v8 = objc_msgSend(v7, "emailAddresses", 0);
        uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
        if (v9)
        {
          uint64_t v10 = *(void *)v14;
          while (2)
          {
            for (uint64_t j = 0; j != v9; ++j)
            {
              if (*(void *)v14 != v10) {
                objc_enumerationMutation(v8);
              }
              if ([v7 secureCompositionEncryptionPolicyForAddress:*(void *)(*((void *)&v13 + 1) + 8 * j)] > 0)
              {
                char v3 = 1;
                goto LABEL_16;
              }
            }
            uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
            if (v9) {
              continue;
            }
            break;
          }
          char v3 = 0;
        }
LABEL_16:
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v4);
  }

  return v3 & 1;
}

@end