@interface NSPointerArray(SafariCoreExtras)
- (uint64_t)safari_firstIndexOfPointer:()SafariCoreExtras;
@end

@implementation NSPointerArray(SafariCoreExtras)

- (uint64_t)safari_firstIndexOfPointer:()SafariCoreExtras
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = a1;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      uint64_t v9 = 0;
      uint64_t v10 = v7 + v6;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v4);
        }
        if (*(void *)(*((void *)&v13 + 1) + 8 * v9) == a3)
        {
          uint64_t v11 = v7 + v9;
          goto LABEL_11;
        }
        ++v9;
      }
      while (v6 != v9);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      uint64_t v7 = v10;
      if (v6) {
        continue;
      }
      break;
    }
  }
  uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_11:

  return v11;
}

@end