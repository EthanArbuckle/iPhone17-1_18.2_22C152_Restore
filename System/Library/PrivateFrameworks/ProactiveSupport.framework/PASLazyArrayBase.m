@interface PASLazyArrayBase
@end

@implementation PASLazyArrayBase

void __36___PASLazyArrayBase_isEqualToArray___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  v7 = *(void **)(a1 + 32);
  id v8 = a2;
  v9 = [v7 objectAtIndexedSubscript:a3];
  LOBYTE(v7) = [v8 isEqual:v9];

  if ((v7 & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
}

void __38___PASLazyArrayBase_objectsAtIndexes___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) objectAtIndex:a2];
  [v2 addObject:v3];
}

@end