@interface ACAccountStore(SyncPrivate)
- (id)mailAccountsForSync;
- (uint64_t)_mailAccountTypeIdentifiers;
- (uint64_t)hasMailAccountsForSync;
@end

@implementation ACAccountStore(SyncPrivate)

- (uint64_t)_mailAccountTypeIdentifiers
{
  if (_mailAccountTypeIdentifiers_onceToken != -1) {
    dispatch_once(&_mailAccountTypeIdentifiers_onceToken, &__block_literal_global_0);
  }
  return _mailAccountTypeIdentifiers_mailAccountTypes;
}

- (uint64_t)hasMailAccountsForSync
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x23ECC10D0]();
  v3 = (void *)[a1 _mailAccountTypeIdentifiers];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = objc_msgSend(a1, "accounts", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend(v3, "containsObject:", objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v8), "accountType"), "identifier")))
        {
          uint64_t v9 = 1;
          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  uint64_t v9 = 0;
LABEL_11:
  return v9;
}

- (id)mailAccountsForSync
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  v3 = (void *)MEMORY[0x23ECC10D0]();
  v4 = (void *)[a1 _mailAccountTypeIdentifiers];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = objc_msgSend(a1, "accounts", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v4, "containsObject:", objc_msgSend((id)objc_msgSend(v10, "accountType"), "identifier")))objc_msgSend(v2, "addObject:", v10); {
      }
        }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
  return v2;
}

@end