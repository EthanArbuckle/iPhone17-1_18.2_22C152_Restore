@interface NSCountedSet(SafariCoreExtras)
- (id)safari_highestFrequencyObject;
@end

@implementation NSCountedSet(SafariCoreExtras)

- (id)safari_highestFrequencyObject
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v2 = objc_msgSend(a1, "allObjects", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    v5 = 0;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v2);
        }
        v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        unint64_t v10 = [a1 countForObject:v9];
        if (v10 > v6)
        {
          unint64_t v11 = v10;
          id v12 = v9;

          v5 = v12;
          unint64_t v6 = v11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end