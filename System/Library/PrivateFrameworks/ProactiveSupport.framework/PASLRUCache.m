@interface PASLRUCache
@end

@implementation PASLRUCache

void __29___PASLRUCache_objectForKey___block_invoke(uint64_t a1, uint64_t a2)
{
  id v8 = *(id *)(a2 + 8);
  id v4 = *(id *)(a2 + 16);
  uint64_t v5 = [v8 objectForKeyedSubscript:*(void *)(a1 + 32)];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    [v4 removeObject:*(void *)(a1 + 32)];
    [v4 insertObject:*(void *)(a1 + 32) atIndex:0];
  }
}

void __33___PASLRUCache_setObject_forKey___block_invoke(void *a1, uint64_t a2)
{
  id v8 = *(id *)(a2 + 8);
  id v4 = *(id *)(a2 + 16);
  uint64_t v5 = [v8 objectForKeyedSubscript:a1[4]];
  [v8 setObject:a1[5] forKeyedSubscript:a1[4]];
  uint64_t v6 = a1[4];
  if (v5)
  {
    [v4 removeObject:v6];
    [v4 insertObject:a1[4] atIndex:0];
  }
  else
  {
    [v4 insertObject:v6 atIndex:0];
    if ((unint64_t)[v4 count] > *(void *)(a1[6] + 16))
    {
      v7 = [v4 lastObject];
      [v8 removeObjectForKey:v7];

      [v4 removeLastObject];
    }
  }
}

uint64_t __32___PASLRUCache_removeAllObjects__block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)a2[1];
  v3 = a2;
  [v2 removeAllObjects];
  id v4 = (void *)v3[2];

  return [v4 removeAllObjects];
}

uint64_t __50___PASLRUCache_enumerateKeysAndObjectsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)a2[1];
  id v4 = a2;
  uint64_t v5 = [v3 copy];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  id v8 = (void *)v4[2];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [v8 copy];

  return MEMORY[0x1F41817F8]();
}

uint64_t __35___PASLRUCache_removeObjectForKey___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)a2[1];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = a2;
  [v3 setObject:0 forKeyedSubscript:v4];
  uint64_t v6 = (void *)v5[2];

  uint64_t v7 = *(void *)(a1 + 32);

  return [v6 removeObject:v7];
}

@end