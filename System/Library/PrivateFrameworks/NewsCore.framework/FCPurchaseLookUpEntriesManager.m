@interface FCPurchaseLookUpEntriesManager
- (id)initWithLocalStore:(void *)a1;
- (id)lookupEntriesByTagID;
- (void)addEntryWithTagID:(void *)a3 purchaseID:(void *)a4 lastVerificationTime:(void *)a5 lastVerificationFailureTime:(uint64_t)a6 purchaseType:(uint64_t)a7 purchaseValidationState:(char)a8 isNewsAppPurchase:(void *)a9 dateOfExpiration:(char)a10 hasShownRenewalNotice:;
- (void)removeEntry:(uint64_t)a1;
- (void)removeEntryForTagID:(uint64_t)a1;
- (void)updateEntry:(uint64_t)a1;
@end

@implementation FCPurchaseLookUpEntriesManager

- (id)lookupEntriesByTagID
{
  if (a1)
  {
    a1 = (id *)[a1[2] copy];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)initWithLocalStore:(void *)a1
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (a1)
  {
    v31.receiver = a1;
    v31.super_class = (Class)FCPurchaseLookUpEntriesManager;
    v5 = (id *)objc_msgSendSuper2(&v31, sel_init);
    v6 = v5;
    if (v5)
    {
      id v29 = v4;
      v7 = v5 + 1;
      objc_storeStrong(v5 + 1, a2);
      uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
      id v9 = v6[2];
      v6[2] = (id)v8;

      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      v10 = [v6[1] allKeys];
      uint64_t v11 = [v10 countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v33;
        unint64_t v14 = 0x1E4F1C000uLL;
        do
        {
          uint64_t v15 = 0;
          uint64_t v30 = v12;
          do
          {
            if (*(void *)v33 != v13) {
              objc_enumerationMutation(v10);
            }
            v16 = *(void **)(*((void *)&v32 + 1) + 8 * v15);
            objc_opt_class();
            v17 = [*v7 objectForKey:v16];
            if (v17)
            {
              if (objc_opt_isKindOfClass()) {
                v18 = v17;
              }
              else {
                v18 = 0;
              }
            }
            else
            {
              v18 = 0;
            }
            id v19 = v18;

            if (v19 && [v16 hasPrefix:@"pl-"])
            {
              v20 = [[FCPurchaseLookUpEntry alloc] initWithEntryID:v16 dictionaryRepresentation:v19];
              if (v20)
              {
                id v21 = v6[2];
                [(FCPurchaseLookUpEntry *)v20 tagID];
                uint64_t v22 = v13;
                v23 = v7;
                unint64_t v24 = v14;
                v25 = v10;
                v27 = v26 = v6;
                [v21 setObject:v20 forKey:v27];

                v6 = v26;
                v10 = v25;
                unint64_t v14 = v24;
                v7 = v23;
                uint64_t v13 = v22;
                uint64_t v12 = v30;
              }
            }
            ++v15;
          }
          while (v12 != v15);
          uint64_t v12 = [v10 countByEnumeratingWithState:&v32 objects:v36 count:16];
        }
        while (v12);
      }

      id v4 = v29;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)addEntryWithTagID:(void *)a3 purchaseID:(void *)a4 lastVerificationTime:(void *)a5 lastVerificationFailureTime:(uint64_t)a6 purchaseType:(uint64_t)a7 purchaseValidationState:(char)a8 isNewsAppPurchase:(void *)a9 dateOfExpiration:(char)a10 hasShownRenewalNotice:
{
  if (a1)
  {
    id v16 = a9;
    id v17 = a5;
    id v18 = a4;
    id v19 = a3;
    id v20 = a2;
    id v21 = [FCPurchaseLookUpEntry alloc];
    uint64_t v22 = [NSString stringWithFormat:@"%@%@", @"pl-", v20];
    LOBYTE(v29) = a10;
    LOBYTE(v28) = a8;
    long long v32 = [(FCPurchaseLookUpEntry *)v21 initWithEntryID:v22 tagID:v20 purchaseID:v19 lastVerificationTime:v18 lastVerificationFailureTime:v17 purchaseType:a6 purchaseValidationState:a7 isNewsAppPurchase:v28 dateOfExpiration:v16 hasShownRenewalNotice:v29];

    id v23 = *(id *)(a1 + 16);
    unint64_t v24 = [(FCPurchaseLookUpEntry *)v32 tagID];
    objc_msgSend(v23, "fc_safelySetObject:forKey:", v32, v24);

    id v25 = *(id *)(a1 + 8);
    v26 = [(FCPurchaseLookUpEntry *)v32 dictionaryRepresentation];
    v27 = [(FCPurchaseLookUpEntry *)v32 identifier];
    [v25 setObject:v26 forKey:v27];
  }
}

- (void)updateEntry:(uint64_t)a1
{
  id v10 = a2;
  if (a1)
  {
    v3 = [v10 tagID];

    if (v3)
    {
      id v4 = *(id *)(a1 + 16);
      v5 = (void *)[v10 copy];
      v6 = [v10 tagID];
      objc_msgSend(v4, "fc_safelySetObject:forKey:", v5, v6);
    }
    id v7 = *(id *)(a1 + 8);
    uint64_t v8 = [v10 dictionaryRepresentation];
    id v9 = [v10 identifier];
    [v7 setObject:v8 forKey:v9];
  }
}

- (void)removeEntry:(uint64_t)a1
{
  if (a1)
  {
    id v3 = [a2 tagID];
    -[FCPurchaseLookUpEntriesManager removeEntryForTagID:](a1, v3);
  }
}

- (void)removeEntryForTagID:(uint64_t)a1
{
  id v7 = a2;
  if (a1)
  {
    if (v7) {
      [*(id *)(a1 + 16) removeObjectForKey:v7];
    }
    id v3 = *(void **)(a1 + 8);
    id v4 = NSString;
    id v5 = v3;
    v6 = [v4 stringWithFormat:@"%@%@", @"pl-", v7];
    [v5 removeObjectForKey:v6];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entriesByTagID, 0);
  objc_storeStrong((id *)&self->_localStore, 0);
}

@end