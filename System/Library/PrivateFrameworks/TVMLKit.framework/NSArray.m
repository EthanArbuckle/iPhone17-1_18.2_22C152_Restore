@interface NSArray
@end

@implementation NSArray

uint64_t __64__NSArray_TVMLKitAdditions__tv_arrayByMappingObjectsUsingBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v5 = v2;
    uint64_t v2 = [*(id *)(a1 + 32) addObject:v2];
    uint64_t v3 = v5;
  }
  return MEMORY[0x270F9A758](v2, v3);
}

@end