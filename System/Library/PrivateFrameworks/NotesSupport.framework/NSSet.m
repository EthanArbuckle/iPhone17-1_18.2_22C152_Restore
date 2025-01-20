@interface NSSet
@end

@implementation NSSet

void __20__NSSet_IC__ic_map___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) addObject:v2];
}

void __27__NSSet_IC__ic_compactMap___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "ic_addNonNilObject:", v2);
}

uint64_t __34__NSSet_IC__ic_objectPassingTest___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (result) {
    *a3 = 1;
  }
  return result;
}

uint64_t __31__NSSet_IC__ic_objectsOfClass___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

uint64_t __48__NSSet_IC__ic_containsObjectMatchingPredicate___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = [*(id *)(a1 + 32) evaluateWithObject:a2];
  if (result) {
    *a3 = 1;
  }
  return result;
}

uint64_t __44__NSSet_IC__ic_objectsConformingToProtocol___block_invoke(uint64_t a1, void *a2)
{
  return [a2 conformsToProtocol:*(void *)(a1 + 32)];
}

uint64_t __30__NSSet_IC__ic_objectOfClass___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

@end