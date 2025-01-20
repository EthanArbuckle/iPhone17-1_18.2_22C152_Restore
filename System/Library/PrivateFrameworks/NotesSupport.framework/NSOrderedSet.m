@interface NSOrderedSet
@end

@implementation NSOrderedSet

uint64_t __55__NSOrderedSet_IC__ic_containsObjectMatchingPredicate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [*(id *)(a1 + 32) evaluateWithObject:a2];
  if (result) {
    *a4 = 1;
  }
  return result;
}

void __50__NSOrderedSet_IC__ic_objectsMovedFromOrderedSet___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "indexOfObject:") != a3
                                                         - *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    [*(id *)(a1 + 40) addObject:v5];
    ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    [*(id *)(a1 + 32) removeObject:v5];
  }
}

@end