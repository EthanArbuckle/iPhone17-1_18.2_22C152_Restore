@interface TouchFailure
- (BOOL)doesMatchResult:(id)a3;
@end

@implementation TouchFailure

- (BOOL)doesMatchResult:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263F089D8] string];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v5 = objc_msgSend(v3, "touched", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [*(id *)(*((void *)&v14 + 1) + 8 * v9) componentsJoinedByString:&stru_26F2B7E50];
        [v4 appendString:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  v11 = [v3 intended];
  v12 = [v11 componentsJoinedByString:&stru_26F2B7E50];

  LOBYTE(v11) = [v4 isEqualToString:v12];
  return (char)v11;
}

@end