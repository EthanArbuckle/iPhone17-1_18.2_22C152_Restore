@interface SBSetAlertSuppressionContextArraysBySectionIdentifierDictionary
@end

@implementation SBSetAlertSuppressionContextArraysBySectionIdentifierDictionary

void ___SBSetAlertSuppressionContextArraysBySectionIdentifierDictionary_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v3 = objc_msgSend(a2, "externalApplicationSceneHandles", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v14 + 1) + 8 * v7);
        uint64_t v9 = objc_opt_class();
        v10 = SBSafeCast(v9, v8);
        v11 = v10;
        if (v10)
        {
          v12 = [v10 application];
          int v13 = [v12 isSameExecutableAsApplication:*(void *)(a1 + 32)];

          if (v13) {
            [*(id *)(a1 + 40) addObject:v11];
          }
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
}

void ___SBSetAlertSuppressionContextArraysBySectionIdentifierDictionary_block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = *(void **)(a1 + 32);
  id v7 = a2;
  v8 = [v6 bundleIdentifier];
  char v9 = [v7 isEqualToString:v8];

  if ((v9 & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

@end