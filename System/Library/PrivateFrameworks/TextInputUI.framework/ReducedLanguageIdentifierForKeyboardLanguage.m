@interface ReducedLanguageIdentifierForKeyboardLanguage
@end

@implementation ReducedLanguageIdentifierForKeyboardLanguage

void ___ReducedLanguageIdentifierForKeyboardLanguage_block_invoke()
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
  v1 = (void *)_ReducedLanguageIdentifierForKeyboardLanguage___languageCounts;
  _ReducedLanguageIdentifierForKeyboardLanguage___languageCounts = (uint64_t)v0;

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = UIKeyboardGetSupportedLanguages();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = (void *)_ReducedLanguageIdentifierForKeyboardLanguage___languageCounts;
        v8 = objc_msgSend(MEMORY[0x1E4F1CA20], "baseLanguageFromLanguage:", *(void *)(*((void *)&v9 + 1) + 8 * v6), (void)v9);
        [v7 addObject:v8];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

@end