@interface NSMutableArray(PreferencesAdditions)
- (void)ps_addSpecifier:()PreferencesAdditions toGroup:;
- (void)ps_addSpecifiers:()PreferencesAdditions toGroup:;
- (void)ps_insertObject:()PreferencesAdditions afterObject:;
- (void)ps_insertObjectsFromArray:()PreferencesAdditions afterObject:;
@end

@implementation NSMutableArray(PreferencesAdditions)

- (void)ps_insertObject:()PreferencesAdditions afterObject:
{
  id v7 = a3;
  uint64_t v6 = [a1 indexOfObject:a4];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL) {
    [a1 insertObject:v7 atIndex:v6 + 1];
  }
}

- (void)ps_insertObjectsFromArray:()PreferencesAdditions afterObject:
{
  id v9 = a3;
  uint64_t v6 = [a1 indexOfObject:a4];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = v6;
    if ([v9 count])
    {
      v8 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v7 + 1, objc_msgSend(v9, "count"));
      [a1 insertObjects:v9 atIndexes:v8];
    }
  }
}

- (void)ps_addSpecifier:()PreferencesAdditions toGroup:
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v10 = a3;
  uint64_t v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 arrayWithObjects:&v10 count:1];

  objc_msgSend(a1, "ps_addSpecifiers:toGroup:", v9, v7, v10, v11);
}

- (void)ps_addSpecifiers:()PreferencesAdditions toGroup:
{
  id v13 = a3;
  uint64_t v6 = [a1 indexOfObject:a4];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = v6;
    if ([v13 count])
    {
      unint64_t v8 = v7 + 1;
      do
      {
        unint64_t v9 = v8;
        if (v8 >= [a1 count]) {
          break;
        }
        v10 = [a1 objectAtIndexedSubscript:v9];
        uint64_t v11 = [v10 cellType];

        unint64_t v8 = v9 + 1;
      }
      while (v11);
      v12 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v9, objc_msgSend(v13, "count"));
      [a1 insertObjects:v13 atIndexes:v12];
    }
  }
}

@end