@interface NSSet
@end

@implementation NSSet

uint64_t __44__NSSet_VK__vk_objectsConformingToProtocol___block_invoke(uint64_t a1, void *a2)
{
  return [a2 conformsToProtocol:*(void *)(a1 + 32)];
}

uint64_t __31__NSSet_VK__vk_objectsOfClass___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

void __27__NSSet_VK__vk_compactMap___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "vk_addNonNilObject:", v2);
}

void __20__NSSet_VK__vk_map___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) addObject:v2];
}

@end