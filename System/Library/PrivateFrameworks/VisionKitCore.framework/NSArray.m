@interface NSArray
@end

@implementation NSArray

uint64_t __33__NSArray_VK__vk_objectsOfClass___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

uint64_t __46__NSArray_VK__vk_objectsConformingToProtocol___block_invoke(uint64_t a1, void *a2)
{
  return [a2 conformsToProtocol:*(void *)(a1 + 32)];
}

void __29__NSArray_VK__vk_compactMap___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "vk_addNonNilObject:", v2);
}

void __22__NSArray_VK__vk_map___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) addObject:v2];
}

void __26__NSArray_VK__vk_flatMap___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) addObjectsFromArray:v2];
}

@end