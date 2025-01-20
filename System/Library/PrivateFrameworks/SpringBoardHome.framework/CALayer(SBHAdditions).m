@interface CALayer(SBHAdditions)
- (BOOL)sbh_hasFilterWithName:()SBHAdditions;
- (void)sbh_addFilter:()SBHAdditions;
- (void)sbh_removeFilterWithName:()SBHAdditions;
@end

@implementation CALayer(SBHAdditions)

- (void)sbh_removeFilterWithName:()SBHAdditions
{
  id v4 = a3;
  v5 = [a1 filters];
  if (v5)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __50__CALayer_SBHAdditions__sbh_removeFilterWithName___block_invoke;
    v9[3] = &unk_1E6AAFA20;
    id v10 = v4;
    uint64_t v6 = [v5 indexOfObjectPassingTest:v9];
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v7 = v6;
      v8 = (void *)[v5 mutableCopy];
      [v8 removeObjectAtIndex:v7];
      [a1 setFilters:v8];
    }
  }
}

- (void)sbh_addFilter:()SBHAdditions
{
  id v6 = a3;
  id v4 = [a1 filters];
  id v5 = (id)[v4 mutableCopy];

  if (!v5) {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  [v5 addObject:v6];
  [a1 setFilters:v5];
}

- (BOOL)sbh_hasFilterWithName:()SBHAdditions
{
  id v4 = a3;
  id v5 = [a1 filters];
  if (v5)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __47__CALayer_SBHAdditions__sbh_hasFilterWithName___block_invoke;
    v8[3] = &unk_1E6AAFA20;
    id v9 = v4;
    BOOL v6 = [v5 indexOfObjectPassingTest:v8] != 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

@end