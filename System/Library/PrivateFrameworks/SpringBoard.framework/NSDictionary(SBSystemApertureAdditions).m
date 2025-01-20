@interface NSDictionary(SBSystemApertureAdditions)
- (id)dictionaryDescription;
@end

@implementation NSDictionary(SBSystemApertureAdditions)

- (id)dictionaryDescription
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F4F798]);
  v3 = [MEMORY[0x1E4F4F7C0] sortByInsertionOrder];
  v4 = (void *)[v2 initWithKeyOrderingStrategy:v3];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = a1;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v11 = objc_msgSend(v5, "objectForKey:", v10, (void)v14);
        if ((objc_opt_respondsToSelector() & 1) == 0)
        {
          uint64_t v12 = [v11 description];

          v11 = (void *)v12;
        }
        [v4 setObject:v11 forKey:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

@end