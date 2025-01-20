@interface NSArray
@end

@implementation NSArray

void __29__NSArray_IC__ic_compactMap___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "ic_addNonNilObject:", v2);
}

void __22__NSArray_IC__ic_map___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) addObject:v2];
}

uint64_t __37__NSArray_IC__ic_firstObjectOfClass___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass) {
    *a4 = 1;
  }
  return isKindOfClass & 1;
}

uint64_t __50__NSArray_IC__ic_containsObjectMatchingPredicate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [*(id *)(a1 + 32) evaluateWithObject:a2];
  if (result) {
    *a4 = 1;
  }
  return result;
}

uint64_t __33__NSArray_IC__ic_objectsOfClass___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

uint64_t __46__NSArray_IC__ic_objectsConformingToProtocol___block_invoke(uint64_t a1, void *a2)
{
  return [a2 conformsToProtocol:*(void *)(a1 + 32)];
}

uint64_t __50__NSArray_IC__ic_firstObjectConformingToProtocol___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 conformsToProtocol:*(void *)(a1 + 32)];
  if (result) {
    *a4 = 1;
  }
  return result;
}

uint64_t __90__NSArray_IC__ic_arrayBySplittingIntoTwoArraysWithMaxPrefixCount_prefixMatchingPredicate___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __26__NSArray_IC__ic_flatMap___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  v5 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

  ICCheckedDynamicCast(v4, (uint64_t)v5);
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  [*(id *)(a1 + 32) addObjectsFromArray:v6];
}

uint64_t __53__NSArray_IC__ic_reduceStartingWithState_usingBlock___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  return MEMORY[0x270F9A758]();
}

@end