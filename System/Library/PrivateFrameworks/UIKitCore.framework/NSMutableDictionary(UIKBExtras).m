@interface NSMutableDictionary(UIKBExtras)
+ (id)_dictionaryWithContentsOfDictionaries:()UIKBExtras;
@end

@implementation NSMutableDictionary(UIKBExtras)

+ (id)_dictionaryWithContentsOfDictionaries:()UIKBExtras
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(v4, "addEntriesFromDictionary:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  return v4;
}

@end