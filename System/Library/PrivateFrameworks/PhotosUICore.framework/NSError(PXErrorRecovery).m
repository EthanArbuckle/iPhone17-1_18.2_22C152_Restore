@interface NSError(PXErrorRecovery)
- (id)px_errorWithRecoveryOptions:()PXErrorRecovery;
@end

@implementation NSError(PXErrorRecovery)

- (id)px_errorWithRecoveryOptions:()PXErrorRecovery
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    v5 = [a1 userInfo];
    v6 = (void *)[v5 mutableCopy];

    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v21 = v4;
    id v8 = v4;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          v14 = [v13 title];
          v15 = v14;
          if (!v13)
          {

            v15 = &stru_1F00B0030;
          }
          [v7 addObject:v15];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v10);
    }

    [v6 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F28590]];
    v16 = objc_alloc_init(PXErrorRecoveryAttempter);
    [(PXErrorRecoveryAttempter *)v16 setRecoveryOptions:v8];
    [v6 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F288B8]];
    v17 = (void *)MEMORY[0x1E4F28C58];
    v18 = [a1 domain];
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, objc_msgSend(a1, "code"), v6);
    id v19 = (id)objc_claimAutoreleasedReturnValue();

    id v4 = v21;
  }
  else
  {
    id v19 = a1;
  }

  return v19;
}

@end