@interface NSArray(PreferencesAdditions)
- (id)specifierForID:()PreferencesAdditions;
- (uint64_t)indexOfNextGroupStartingAtIndex:()PreferencesAdditions;
- (uint64_t)indexOfSpecifierWithID:()PreferencesAdditions;
@end

@implementation NSArray(PreferencesAdditions)

- (id)specifierForID:()PreferencesAdditions
{
  id v4 = a3;
  v5 = [a1 objectEnumerator];
  v6 = 0;
  while (1)
  {
    v7 = v6;
    v6 = [v5 nextObject];

    if (!v6) {
      break;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      break;
    }
    v8 = [v6 identifier];
    int v9 = [v8 isEqualToString:v4];

    if (v9)
    {
      id v10 = v6;
      goto LABEL_7;
    }
  }
  id v10 = 0;
LABEL_7:

  return v10;
}

- (uint64_t)indexOfSpecifierWithID:()PreferencesAdditions
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__NSArray_PreferencesAdditions__indexOfSpecifierWithID___block_invoke;
  v8[3] = &unk_1E5C5F698;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = [a1 indexOfObjectPassingTest:v8];

  return v6;
}

- (uint64_t)indexOfNextGroupStartingAtIndex:()PreferencesAdditions
{
  if (a3)
  {
    unint64_t v3 = a3;
    if ([a1 count] > a3)
    {
      while (++v3 < [a1 count])
      {
        id v5 = [a1 objectAtIndexedSubscript:v3];
        uint64_t v6 = [v5 cellType];

        if (!v6) {
          return v3;
        }
      }
    }
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

@end