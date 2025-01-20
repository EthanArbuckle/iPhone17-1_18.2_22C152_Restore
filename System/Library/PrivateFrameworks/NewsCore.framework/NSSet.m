@interface NSSet
@end

@implementation NSSet

uint64_t __59__NSSet_FCAdditions__fc_mutableSetByTransformingWithBlock___block_invoke(uint64_t a1)
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

id __44__NSSet_FCAdditions__fc_unionOfSetsInArray___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  objc_msgSend(v4, "fc_safelyUnionSet:", a3);
  return v4;
}

uint64_t __49__NSSet_FCAdditions__fc_setOfObjectsPassingTest___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __50__NSSet_FCAdditions__fc_containsAnyObjectInArray___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [*(id *)(a1 + 32) containsObject:a2];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  return result;
}

uint64_t __55__NSSet_FCAdditions__fc_countOfObjectsIntersectingSet___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

@end