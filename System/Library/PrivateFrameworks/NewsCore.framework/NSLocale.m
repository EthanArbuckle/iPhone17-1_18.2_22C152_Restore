@interface NSLocale
@end

@implementation NSLocale

void __50__NSLocale_FCAdditions__fc_preferredLanguageCodes__block_invoke()
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F1CA70] orderedSet];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v1 = objc_msgSend(MEMORY[0x1E4F1CA20], "preferredLanguages", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v12;
    uint64_t v5 = *MEMORY[0x1E4F1C438];
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v12 != v4) {
          objc_enumerationMutation(v1);
        }
        v7 = [MEMORY[0x1E4F1CA20] componentsFromLocaleIdentifier:*(void *)(*((void *)&v11 + 1) + 8 * v6)];
        v8 = [v7 objectForKey:v5];

        if (v8) {
          [v0 addObject:v8];
        }

        ++v6;
      }
      while (v3 != v6);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v3);
  }

  uint64_t v9 = [v0 array];
  v10 = (void *)_MergedGlobals_213;
  _MergedGlobals_213 = v9;
}

@end