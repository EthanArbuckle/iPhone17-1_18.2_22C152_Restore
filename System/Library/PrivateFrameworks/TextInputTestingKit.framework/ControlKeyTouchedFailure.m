@interface ControlKeyTouchedFailure
- (BOOL)doesMatchResult:(id)a3;
@end

@implementation ControlKeyTouchedFailure

- (BOOL)doesMatchResult:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [v3 corrected];
  v5 = [v4 componentsJoinedByString:&stru_26F2B7E50];

  v6 = [v3 intended];
  v7 = [v6 componentsJoinedByString:&stru_26F2B7E50];

  if ([v5 isEqualToString:v7])
  {
    BOOL v8 = 0;
  }
  else
  {
    v9 = [MEMORY[0x263F089D8] string];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v10 = objc_msgSend(v3, "touched", 0);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = [*(id *)(*((void *)&v17 + 1) + 8 * i) componentsJoinedByString:&stru_26F2B7E50];
          [v9 appendString:v15];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v12);
    }

    BOOL v8 = [v9 rangeOfString:@"<Shift>"] != 0x7FFFFFFFFFFFFFFFLL
      || [v9 rangeOfString:@"<Delete>"] != 0x7FFFFFFFFFFFFFFFLL
      || [v9 rangeOfString:@"\n"] != 0x7FFFFFFFFFFFFFFFLL;
  }
  return v8;
}

@end