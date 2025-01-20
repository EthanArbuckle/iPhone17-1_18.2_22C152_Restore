@interface NSArray(IMAdditions)
- (uint64_t)pf_indexOfObjectWithValue:()IMAdditions forKeyPath:;
@end

@implementation NSArray(IMAdditions)

- (uint64_t)pf_indexOfObjectWithValue:()IMAdditions forKeyPath:
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [a1 count];
  uint64_t v9 = v8;
  if (v8 < 1)
  {
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v11 = v8;
    do
    {
      uint64_t v12 = v11 - v10;
      if (v11 < v10) {
        ++v12;
      }
      uint64_t v13 = v10 + (v12 >> 1);
      v14 = [a1 objectAtIndex:v13];
      v15 = [v14 valueForKeyPath:v7];

      if ([v15 compare:v6] == -1) {
        uint64_t v10 = v13 + 1;
      }
      else {
        uint64_t v11 = v13;
      }
    }
    while (v10 < v11);
  }
  uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
  if (v10 < v9)
  {
    v17 = [a1 objectAtIndex:v10];
    v18 = [v17 valueForKeyPath:v7];
    uint64_t v19 = [v18 compare:v6];

    if (!v19) {
      uint64_t v16 = v10;
    }
  }

  return v16;
}

@end