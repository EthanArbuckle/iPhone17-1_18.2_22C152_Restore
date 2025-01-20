@interface NSOrderedSet
@end

@implementation NSOrderedSet

uint64_t __66__NSOrderedSet_FCAdditions__fc_orderedSetByTransformingWithBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v5 = v2;
    uint64_t v2 = [*(id *)(a1 + 32) addObject:v2];
    uint64_t v3 = v5;
  }
  return MEMORY[0x1F41817F8](v2, v3);
}

uint64_t __93__NSOrderedSet_FCAdditions__fc_diffAgainstOrderedSet_withEqualityTest_identityValueProvider___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __93__NSOrderedSet_FCAdditions__fc_diffAgainstOrderedSet_withEqualityTest_identityValueProvider___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v10 = a2;
  if (([*(id *)(a1 + 32) containsIndex:a3] & 1) == 0)
  {
    uint64_t v5 = *(void **)(a1 + 40);
    v6 = [NSNumber numberWithUnsignedInteger:a3];
    v7 = [v5 objectForKeyedSubscript:v6];

    if (v7) {
      a3 = [v7 unsignedIntegerValue];
    }
    id v8 = v10;
    v9 = [*(id *)(a1 + 48) objectAtIndexedSubscript:a3];
    if (((*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))() & 1) == 0) {
      [*(id *)(a1 + 56) addIndex:a3];
    }
  }
}

uint64_t __54__NSOrderedSet_FCAdditions__fc_diffAgainstOrderedSet___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

uint64_t __54__NSOrderedSet_FCAdditions__fc_diffAgainstOrderedSet___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

uint64_t __54__NSOrderedSet_FCAdditions__fc_diffAgainstOrderedSet___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __54__NSOrderedSet_FCAdditions__fc_diffAgainstOrderedSet___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __54__NSOrderedSet_FCAdditions__fc_diffAgainstOrderedSet___block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  id v10 = a2;
  if (((*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))() & 1) == 0
    && ((*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))() & 1) == 0)
  {
    uint64_t v5 = [*(id *)(a1 + 32) indexOfObject:v10];
    if (v5 == a3)
    {
      [*(id *)(a1 + 48) addIndex:a3];
    }
    else
    {
      uint64_t v6 = v5;
      v7 = [NSNumber numberWithUnsignedInteger:a3];
      id v8 = *(void **)(a1 + 40);
      v9 = [NSNumber numberWithUnsignedInteger:v6];
      [v8 setObject:v7 forKeyedSubscript:v9];
    }
  }
}

@end