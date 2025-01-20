@interface NSURLProtectionSpace
@end

@implementation NSURLProtectionSpace

void __71__NSURLProtectionSpace_SafariCoreExtras__safari_allowsCredentialSaving__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = objc_msgSend(a2, "exactMatches", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = [*(id *)(*((void *)&v10 + 1) + 8 * i) savedAccount];
        int v9 = [v8 userIsNeverSaveMarker];

        if (v9)
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

@end