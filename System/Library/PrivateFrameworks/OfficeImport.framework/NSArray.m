@interface NSArray
@end

@implementation NSArray

uint64_t __55__NSArray_TSUAdditions__tsu_arrayOfObjectsPassingTest___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __58__NSArray_TSUAdditions__tsu_arrayByTransformingWithBlock___block_invoke(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if (result)
  {
    uint64_t v3 = result;
    v4 = *(void **)(a1 + 32);
    return [v4 addObject:v3];
  }
  return result;
}

uint64_t __46__NSArray_TSUAdditions__tsu_arrayByFlattening__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t result = [a2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (result)
  {
    uint64_t v7 = result;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(a2);
        }
        uint64_t v10 = *(void *)(*((void *)&v11 + 1) + 8 * v9);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) + 16))();
        }
        else {
          [a3 addObject:v10];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t result = [a2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      uint64_t v7 = result;
    }
    while (result);
  }
  return result;
}

@end