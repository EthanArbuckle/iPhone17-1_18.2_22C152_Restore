@interface NSSet(PLAdditions)
- (uint64_t)pl_countOfObjectsPassingTest:()PLAdditions;
@end

@implementation NSSet(PLAdditions)

- (uint64_t)pl_countOfObjectsPassingTest:()PLAdditions
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x19F38D3B0]();
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__NSSet_PLAdditions__pl_countOfObjectsPassingTest___block_invoke;
  v9[3] = &unk_1E586B158;
  id v6 = v4;
  id v10 = v6;
  v11 = &v12;
  [a1 enumerateObjectsUsingBlock:v9];
  uint64_t v7 = v13[3];

  _Block_object_dispose(&v12, 8);

  return v7;
}

@end