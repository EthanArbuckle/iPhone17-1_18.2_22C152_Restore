@interface PCSCKKSOutOfBandFetchIdentities
@end

@implementation PCSCKKSOutOfBandFetchIdentities

void ___PCSCKKSOutOfBandFetchIdentities_block_invoke(uint64_t a1, const void *a2, void *a3)
{
  id v8 = a3;
  if (a2) {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = CFRetain(a2);
  }
  uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithSet:v8];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void ___PCSCKKSOutOfBandFetchIdentities_block_invoke_60(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!v5 || a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    CFTypeRef Mutable = PCSIdentitySetCreateMutable(0);
    CFTypeRef cf = 0;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          v13 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
          v14 = objc_msgSend(v12, "publicKey", (void)v20);
          [v13 removeObject:v14];

          CFDictionaryRef v15 = [v12 decryptedRecord];
          v16 = PCSIdentityCreateWithKeychainAttributes(v15, &cf);

          if (v16) {
            BOOL v17 = cf == 0;
          }
          else {
            BOOL v17 = 0;
          }
          if (!v17)
          {
            if (Mutable) {
              CFRelease(Mutable);
            }
            if (v16) {
              CFRelease(v16);
            }
            CFTypeRef Mutable = 0;
            BOOL v18 = 1;
            goto LABEL_24;
          }
          PCSIdentitySetAddIdentity((uint64_t)Mutable, (uint64_t)v16);
          CFRelease(v16);
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v25 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    BOOL v18 = Mutable == 0;
    if (Mutable && !cf)
    {
      id v7 = +[PCSCKKSOutOfBandFetchCache cache];
      [v7 cachePCSIdentityFetchResult:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) notFound:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) serviceID:*(unsigned int *)(a1 + 56)];
      BOOL v18 = 0;
LABEL_24:
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    if (!v18) {
      CFRelease(Mutable);
    }
    CFTypeRef v19 = cf;
    if (cf)
    {
      CFTypeRef cf = 0;
      CFRelease(v19);
    }
  }
}

@end